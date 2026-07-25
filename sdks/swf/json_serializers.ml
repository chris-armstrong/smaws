open Smaws_Lib.Json.SerializeHelpers
open Types

let activity_id_to_yojson = string_to_yojson
let data_to_yojson = string_to_yojson
let version_to_yojson = string_to_yojson
let name_to_yojson = string_to_yojson

let activity_type_to_yojson (x : activity_type) =
  assoc_to_yojson
    [ ("name", Some (name_to_yojson x.name)); ("version", Some (version_to_yojson x.version)) ]

let workflow_run_id_to_yojson = string_to_yojson
let workflow_id_to_yojson = string_to_yojson

let workflow_execution_to_yojson (x : workflow_execution) =
  assoc_to_yojson
    [
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("runId", Some (workflow_run_id_to_yojson x.run_id));
    ]

let event_id_to_yojson = long_to_yojson
let task_token_to_yojson = string_to_yojson

let activity_task_to_yojson (x : activity_task) =
  assoc_to_yojson
    [
      ("taskToken", Some (task_token_to_yojson x.task_token));
      ("activityId", Some (activity_id_to_yojson x.activity_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
      ("workflowExecution", Some (workflow_execution_to_yojson x.workflow_execution));
      ("activityType", Some (activity_type_to_yojson x.activity_type));
      ("input", option_to_yojson data_to_yojson x.input);
    ]

let activity_task_cancel_requested_event_attributes_to_yojson
    (x : activity_task_cancel_requested_event_attributes) =
  assoc_to_yojson
    [
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
      ("activityId", Some (activity_id_to_yojson x.activity_id));
    ]

let activity_task_canceled_event_attributes_to_yojson (x : activity_task_canceled_event_attributes)
    =
  assoc_to_yojson
    [
      ("details", option_to_yojson data_to_yojson x.details);
      ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
      ( "latestCancelRequestedEventId",
        option_to_yojson event_id_to_yojson x.latest_cancel_requested_event_id );
    ]

let activity_task_completed_event_attributes_to_yojson
    (x : activity_task_completed_event_attributes) =
  assoc_to_yojson
    [
      ("result", option_to_yojson data_to_yojson x.result_);
      ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
    ]

let failure_reason_to_yojson = string_to_yojson

let activity_task_failed_event_attributes_to_yojson (x : activity_task_failed_event_attributes) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson failure_reason_to_yojson x.reason);
      ("details", option_to_yojson data_to_yojson x.details);
      ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
    ]

let duration_in_seconds_optional_to_yojson = string_to_yojson
let task_priority_to_yojson = string_to_yojson
let task_list_to_yojson (x : task_list) = assoc_to_yojson [ ("name", Some (name_to_yojson x.name)) ]

let activity_task_scheduled_event_attributes_to_yojson
    (x : activity_task_scheduled_event_attributes) =
  assoc_to_yojson
    [
      ("activityType", Some (activity_type_to_yojson x.activity_type));
      ("activityId", Some (activity_id_to_yojson x.activity_id));
      ("input", option_to_yojson data_to_yojson x.input);
      ("control", option_to_yojson data_to_yojson x.control);
      ( "scheduleToStartTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.schedule_to_start_timeout );
      ( "scheduleToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.schedule_to_close_timeout );
      ( "startToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.start_to_close_timeout );
      ("taskList", Some (task_list_to_yojson x.task_list));
      ("taskPriority", option_to_yojson task_priority_to_yojson x.task_priority);
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
      ( "heartbeatTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.heartbeat_timeout );
    ]

let identity_to_yojson = string_to_yojson

let activity_task_started_event_attributes_to_yojson (x : activity_task_started_event_attributes) =
  assoc_to_yojson
    [
      ("identity", option_to_yojson identity_to_yojson x.identity);
      ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id));
    ]

let canceled_to_yojson = bool_to_yojson

let activity_task_status_to_yojson (x : activity_task_status) =
  assoc_to_yojson [ ("cancelRequested", Some (canceled_to_yojson x.cancel_requested)) ]

let limited_data_to_yojson = string_to_yojson

let activity_task_timeout_type_to_yojson (x : activity_task_timeout_type) =
  match x with
  | START_TO_CLOSE -> `String "START_TO_CLOSE"
  | SCHEDULE_TO_START -> `String "SCHEDULE_TO_START"
  | SCHEDULE_TO_CLOSE -> `String "SCHEDULE_TO_CLOSE"
  | HEARTBEAT -> `String "HEARTBEAT"

let activity_task_timed_out_event_attributes_to_yojson
    (x : activity_task_timed_out_event_attributes) =
  assoc_to_yojson
    [
      ("timeoutType", Some (activity_task_timeout_type_to_yojson x.timeout_type));
      ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
      ("details", option_to_yojson limited_data_to_yojson x.details);
    ]

let activity_type_configuration_to_yojson (x : activity_type_configuration) =
  assoc_to_yojson
    [
      ( "defaultTaskStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.default_task_start_to_close_timeout );
      ( "defaultTaskHeartbeatTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_heartbeat_timeout );
      ("defaultTaskList", option_to_yojson task_list_to_yojson x.default_task_list);
      ("defaultTaskPriority", option_to_yojson task_priority_to_yojson x.default_task_priority);
      ( "defaultTaskScheduleToStartTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.default_task_schedule_to_start_timeout );
      ( "defaultTaskScheduleToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.default_task_schedule_to_close_timeout );
    ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let description_to_yojson = string_to_yojson

let registration_status_to_yojson (x : registration_status) =
  match x with REGISTERED -> `String "REGISTERED" | DEPRECATED -> `String "DEPRECATED"

let activity_type_info_to_yojson (x : activity_type_info) =
  assoc_to_yojson
    [
      ("activityType", Some (activity_type_to_yojson x.activity_type));
      ("status", Some (registration_status_to_yojson x.status));
      ("description", option_to_yojson description_to_yojson x.description);
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
      ("deprecationDate", option_to_yojson timestamp_to_yojson x.deprecation_date);
    ]

let activity_type_detail_to_yojson (x : activity_type_detail) =
  assoc_to_yojson
    [
      ("typeInfo", Some (activity_type_info_to_yojson x.type_info));
      ("configuration", Some (activity_type_configuration_to_yojson x.configuration));
    ]

let activity_type_info_list_to_yojson tree = list_to_yojson activity_type_info_to_yojson tree
let page_token_to_yojson = string_to_yojson

let activity_type_infos_to_yojson (x : activity_type_infos) =
  assoc_to_yojson
    [
      ("typeInfos", Some (activity_type_info_list_to_yojson x.type_infos));
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let arn_to_yojson = string_to_yojson
let timer_id_to_yojson = string_to_yojson

let cancel_timer_decision_attributes_to_yojson (x : cancel_timer_decision_attributes) =
  assoc_to_yojson [ ("timerId", Some (timer_id_to_yojson x.timer_id)) ]

let cancel_timer_failed_cause_to_yojson (x : cancel_timer_failed_cause) =
  match x with
  | TIMER_ID_UNKNOWN -> `String "TIMER_ID_UNKNOWN"
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let cancel_timer_failed_event_attributes_to_yojson (x : cancel_timer_failed_event_attributes) =
  assoc_to_yojson
    [
      ("timerId", Some (timer_id_to_yojson x.timer_id));
      ("cause", Some (cancel_timer_failed_cause_to_yojson x.cause));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let cancel_workflow_execution_decision_attributes_to_yojson
    (x : cancel_workflow_execution_decision_attributes) =
  assoc_to_yojson [ ("details", option_to_yojson data_to_yojson x.details) ]

let cancel_workflow_execution_failed_cause_to_yojson (x : cancel_workflow_execution_failed_cause) =
  match x with
  | UNHANDLED_DECISION -> `String "UNHANDLED_DECISION"
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let cancel_workflow_execution_failed_event_attributes_to_yojson
    (x : cancel_workflow_execution_failed_event_attributes) =
  assoc_to_yojson
    [
      ("cause", Some (cancel_workflow_execution_failed_cause_to_yojson x.cause));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let cause_message_to_yojson = string_to_yojson

let child_policy_to_yojson (x : child_policy) =
  match x with
  | TERMINATE -> `String "TERMINATE"
  | REQUEST_CANCEL -> `String "REQUEST_CANCEL"
  | ABANDON -> `String "ABANDON"

let workflow_type_to_yojson (x : workflow_type) =
  assoc_to_yojson
    [ ("name", Some (name_to_yojson x.name)); ("version", Some (version_to_yojson x.version)) ]

let child_workflow_execution_canceled_event_attributes_to_yojson
    (x : child_workflow_execution_canceled_event_attributes) =
  assoc_to_yojson
    [
      ("workflowExecution", Some (workflow_execution_to_yojson x.workflow_execution));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("details", option_to_yojson data_to_yojson x.details);
      ("initiatedEventId", Some (event_id_to_yojson x.initiated_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
    ]

let child_workflow_execution_completed_event_attributes_to_yojson
    (x : child_workflow_execution_completed_event_attributes) =
  assoc_to_yojson
    [
      ("workflowExecution", Some (workflow_execution_to_yojson x.workflow_execution));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("result", option_to_yojson data_to_yojson x.result_);
      ("initiatedEventId", Some (event_id_to_yojson x.initiated_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
    ]

let child_workflow_execution_failed_event_attributes_to_yojson
    (x : child_workflow_execution_failed_event_attributes) =
  assoc_to_yojson
    [
      ("workflowExecution", Some (workflow_execution_to_yojson x.workflow_execution));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("reason", option_to_yojson failure_reason_to_yojson x.reason);
      ("details", option_to_yojson data_to_yojson x.details);
      ("initiatedEventId", Some (event_id_to_yojson x.initiated_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
    ]

let child_workflow_execution_started_event_attributes_to_yojson
    (x : child_workflow_execution_started_event_attributes) =
  assoc_to_yojson
    [
      ("workflowExecution", Some (workflow_execution_to_yojson x.workflow_execution));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("initiatedEventId", Some (event_id_to_yojson x.initiated_event_id));
    ]

let child_workflow_execution_terminated_event_attributes_to_yojson
    (x : child_workflow_execution_terminated_event_attributes) =
  assoc_to_yojson
    [
      ("workflowExecution", Some (workflow_execution_to_yojson x.workflow_execution));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("initiatedEventId", Some (event_id_to_yojson x.initiated_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
    ]

let workflow_execution_timeout_type_to_yojson (x : workflow_execution_timeout_type) =
  match x with START_TO_CLOSE -> `String "START_TO_CLOSE"

let child_workflow_execution_timed_out_event_attributes_to_yojson
    (x : child_workflow_execution_timed_out_event_attributes) =
  assoc_to_yojson
    [
      ("workflowExecution", Some (workflow_execution_to_yojson x.workflow_execution));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("timeoutType", Some (workflow_execution_timeout_type_to_yojson x.timeout_type));
      ("initiatedEventId", Some (event_id_to_yojson x.initiated_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
    ]

let close_status_to_yojson (x : close_status) =
  match x with
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | CANCELED -> `String "CANCELED"
  | TERMINATED -> `String "TERMINATED"
  | CONTINUED_AS_NEW -> `String "CONTINUED_AS_NEW"
  | TIMED_OUT -> `String "TIMED_OUT"

let close_status_filter_to_yojson (x : close_status_filter) =
  assoc_to_yojson [ ("status", Some (close_status_to_yojson x.status)) ]

let complete_workflow_execution_decision_attributes_to_yojson
    (x : complete_workflow_execution_decision_attributes) =
  assoc_to_yojson [ ("result", option_to_yojson data_to_yojson x.result_) ]

let complete_workflow_execution_failed_cause_to_yojson
    (x : complete_workflow_execution_failed_cause) =
  match x with
  | UNHANDLED_DECISION -> `String "UNHANDLED_DECISION"
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let complete_workflow_execution_failed_event_attributes_to_yojson
    (x : complete_workflow_execution_failed_event_attributes) =
  assoc_to_yojson
    [
      ("cause", Some (complete_workflow_execution_failed_cause_to_yojson x.cause));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let tag_to_yojson = string_to_yojson
let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let continue_as_new_workflow_execution_decision_attributes_to_yojson
    (x : continue_as_new_workflow_execution_decision_attributes) =
  assoc_to_yojson
    [
      ("input", option_to_yojson data_to_yojson x.input);
      ( "executionStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout
      );
      ("taskList", option_to_yojson task_list_to_yojson x.task_list);
      ("taskPriority", option_to_yojson task_priority_to_yojson x.task_priority);
      ( "taskStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout );
      ("childPolicy", option_to_yojson child_policy_to_yojson x.child_policy);
      ("tagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("workflowTypeVersion", option_to_yojson version_to_yojson x.workflow_type_version);
      ("lambdaRole", option_to_yojson arn_to_yojson x.lambda_role);
    ]

let continue_as_new_workflow_execution_failed_cause_to_yojson
    (x : continue_as_new_workflow_execution_failed_cause) =
  match x with
  | UNHANDLED_DECISION -> `String "UNHANDLED_DECISION"
  | WORKFLOW_TYPE_DEPRECATED -> `String "WORKFLOW_TYPE_DEPRECATED"
  | WORKFLOW_TYPE_DOES_NOT_EXIST -> `String "WORKFLOW_TYPE_DOES_NOT_EXIST"
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED ->
      `String "DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED"
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED ->
      `String "DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED"
  | DEFAULT_TASK_LIST_UNDEFINED -> `String "DEFAULT_TASK_LIST_UNDEFINED"
  | DEFAULT_CHILD_POLICY_UNDEFINED -> `String "DEFAULT_CHILD_POLICY_UNDEFINED"
  | CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED ->
      `String "CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED"
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let continue_as_new_workflow_execution_failed_event_attributes_to_yojson
    (x : continue_as_new_workflow_execution_failed_event_attributes) =
  assoc_to_yojson
    [
      ("cause", Some (continue_as_new_workflow_execution_failed_cause_to_yojson x.cause));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let count_to_yojson = int_to_yojson
let error_message_to_yojson = string_to_yojson

let unknown_resource_fault_to_yojson (x : unknown_resource_fault) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let operation_not_permitted_fault_to_yojson (x : operation_not_permitted_fault) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let truncated_to_yojson = bool_to_yojson

let workflow_execution_count_to_yojson (x : workflow_execution_count) =
  assoc_to_yojson
    [
      ("count", Some (count_to_yojson x.count));
      ("truncated", option_to_yojson truncated_to_yojson x.truncated);
    ]

let tag_filter_to_yojson (x : tag_filter) = assoc_to_yojson [ ("tag", Some (tag_to_yojson x.tag)) ]
let version_optional_to_yojson = string_to_yojson

let workflow_type_filter_to_yojson (x : workflow_type_filter) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("version", option_to_yojson version_optional_to_yojson x.version);
    ]

let workflow_execution_filter_to_yojson (x : workflow_execution_filter) =
  assoc_to_yojson [ ("workflowId", Some (workflow_id_to_yojson x.workflow_id)) ]

let execution_time_filter_to_yojson (x : execution_time_filter) =
  assoc_to_yojson
    [
      ("oldestDate", Some (timestamp_to_yojson x.oldest_date));
      ("latestDate", option_to_yojson timestamp_to_yojson x.latest_date);
    ]

let domain_name_to_yojson = string_to_yojson

let count_closed_workflow_executions_input_to_yojson (x : count_closed_workflow_executions_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("startTimeFilter", option_to_yojson execution_time_filter_to_yojson x.start_time_filter);
      ("closeTimeFilter", option_to_yojson execution_time_filter_to_yojson x.close_time_filter);
      ("executionFilter", option_to_yojson workflow_execution_filter_to_yojson x.execution_filter);
      ("typeFilter", option_to_yojson workflow_type_filter_to_yojson x.type_filter);
      ("tagFilter", option_to_yojson tag_filter_to_yojson x.tag_filter);
      ("closeStatusFilter", option_to_yojson close_status_filter_to_yojson x.close_status_filter);
    ]

let count_open_workflow_executions_input_to_yojson (x : count_open_workflow_executions_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("startTimeFilter", Some (execution_time_filter_to_yojson x.start_time_filter));
      ("typeFilter", option_to_yojson workflow_type_filter_to_yojson x.type_filter);
      ("tagFilter", option_to_yojson tag_filter_to_yojson x.tag_filter);
      ("executionFilter", option_to_yojson workflow_execution_filter_to_yojson x.execution_filter);
    ]

let pending_task_count_to_yojson (x : pending_task_count) =
  assoc_to_yojson
    [
      ("count", Some (count_to_yojson x.count));
      ("truncated", option_to_yojson truncated_to_yojson x.truncated);
    ]

let count_pending_activity_tasks_input_to_yojson (x : count_pending_activity_tasks_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("taskList", Some (task_list_to_yojson x.task_list));
    ]

let count_pending_decision_tasks_input_to_yojson (x : count_pending_decision_tasks_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("taskList", Some (task_list_to_yojson x.task_list));
    ]

let function_input_to_yojson = string_to_yojson
let function_name_to_yojson = string_to_yojson
let function_id_to_yojson = string_to_yojson

let schedule_lambda_function_decision_attributes_to_yojson
    (x : schedule_lambda_function_decision_attributes) =
  assoc_to_yojson
    [
      ("id", Some (function_id_to_yojson x.id));
      ("name", Some (function_name_to_yojson x.name));
      ("control", option_to_yojson data_to_yojson x.control);
      ("input", option_to_yojson function_input_to_yojson x.input);
      ( "startToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.start_to_close_timeout );
    ]

let start_child_workflow_execution_decision_attributes_to_yojson
    (x : start_child_workflow_execution_decision_attributes) =
  assoc_to_yojson
    [
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("control", option_to_yojson data_to_yojson x.control);
      ("input", option_to_yojson data_to_yojson x.input);
      ( "executionStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout
      );
      ("taskList", option_to_yojson task_list_to_yojson x.task_list);
      ("taskPriority", option_to_yojson task_priority_to_yojson x.task_priority);
      ( "taskStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout );
      ("childPolicy", option_to_yojson child_policy_to_yojson x.child_policy);
      ("tagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("lambdaRole", option_to_yojson arn_to_yojson x.lambda_role);
    ]

let workflow_run_id_optional_to_yojson = string_to_yojson

let request_cancel_external_workflow_execution_decision_attributes_to_yojson
    (x : request_cancel_external_workflow_execution_decision_attributes) =
  assoc_to_yojson
    [
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("runId", option_to_yojson workflow_run_id_optional_to_yojson x.run_id);
      ("control", option_to_yojson data_to_yojson x.control);
    ]

let signal_name_to_yojson = string_to_yojson

let signal_external_workflow_execution_decision_attributes_to_yojson
    (x : signal_external_workflow_execution_decision_attributes) =
  assoc_to_yojson
    [
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("runId", option_to_yojson workflow_run_id_optional_to_yojson x.run_id);
      ("signalName", Some (signal_name_to_yojson x.signal_name));
      ("input", option_to_yojson data_to_yojson x.input);
      ("control", option_to_yojson data_to_yojson x.control);
    ]

let duration_in_seconds_to_yojson = string_to_yojson

let start_timer_decision_attributes_to_yojson (x : start_timer_decision_attributes) =
  assoc_to_yojson
    [
      ("timerId", Some (timer_id_to_yojson x.timer_id));
      ("control", option_to_yojson data_to_yojson x.control);
      ("startToFireTimeout", Some (duration_in_seconds_to_yojson x.start_to_fire_timeout));
    ]

let marker_name_to_yojson = string_to_yojson

let record_marker_decision_attributes_to_yojson (x : record_marker_decision_attributes) =
  assoc_to_yojson
    [
      ("markerName", Some (marker_name_to_yojson x.marker_name));
      ("details", option_to_yojson data_to_yojson x.details);
    ]

let fail_workflow_execution_decision_attributes_to_yojson
    (x : fail_workflow_execution_decision_attributes) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson failure_reason_to_yojson x.reason);
      ("details", option_to_yojson data_to_yojson x.details);
    ]

let request_cancel_activity_task_decision_attributes_to_yojson
    (x : request_cancel_activity_task_decision_attributes) =
  assoc_to_yojson [ ("activityId", Some (activity_id_to_yojson x.activity_id)) ]

let schedule_activity_task_decision_attributes_to_yojson
    (x : schedule_activity_task_decision_attributes) =
  assoc_to_yojson
    [
      ("activityType", Some (activity_type_to_yojson x.activity_type));
      ("activityId", Some (activity_id_to_yojson x.activity_id));
      ("control", option_to_yojson data_to_yojson x.control);
      ("input", option_to_yojson data_to_yojson x.input);
      ( "scheduleToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.schedule_to_close_timeout );
      ("taskList", option_to_yojson task_list_to_yojson x.task_list);
      ("taskPriority", option_to_yojson task_priority_to_yojson x.task_priority);
      ( "scheduleToStartTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.schedule_to_start_timeout );
      ( "startToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.start_to_close_timeout );
      ( "heartbeatTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.heartbeat_timeout );
    ]

let decision_type_to_yojson (x : decision_type) =
  match x with
  | ScheduleActivityTask -> `String "ScheduleActivityTask"
  | RequestCancelActivityTask -> `String "RequestCancelActivityTask"
  | CompleteWorkflowExecution -> `String "CompleteWorkflowExecution"
  | FailWorkflowExecution -> `String "FailWorkflowExecution"
  | CancelWorkflowExecution -> `String "CancelWorkflowExecution"
  | ContinueAsNewWorkflowExecution -> `String "ContinueAsNewWorkflowExecution"
  | RecordMarker -> `String "RecordMarker"
  | StartTimer -> `String "StartTimer"
  | CancelTimer -> `String "CancelTimer"
  | SignalExternalWorkflowExecution -> `String "SignalExternalWorkflowExecution"
  | RequestCancelExternalWorkflowExecution -> `String "RequestCancelExternalWorkflowExecution"
  | StartChildWorkflowExecution -> `String "StartChildWorkflowExecution"
  | ScheduleLambdaFunction -> `String "ScheduleLambdaFunction"

let decision_to_yojson (x : decision) =
  assoc_to_yojson
    [
      ("decisionType", Some (decision_type_to_yojson x.decision_type));
      ( "scheduleActivityTaskDecisionAttributes",
        option_to_yojson schedule_activity_task_decision_attributes_to_yojson
          x.schedule_activity_task_decision_attributes );
      ( "requestCancelActivityTaskDecisionAttributes",
        option_to_yojson request_cancel_activity_task_decision_attributes_to_yojson
          x.request_cancel_activity_task_decision_attributes );
      ( "completeWorkflowExecutionDecisionAttributes",
        option_to_yojson complete_workflow_execution_decision_attributes_to_yojson
          x.complete_workflow_execution_decision_attributes );
      ( "failWorkflowExecutionDecisionAttributes",
        option_to_yojson fail_workflow_execution_decision_attributes_to_yojson
          x.fail_workflow_execution_decision_attributes );
      ( "cancelWorkflowExecutionDecisionAttributes",
        option_to_yojson cancel_workflow_execution_decision_attributes_to_yojson
          x.cancel_workflow_execution_decision_attributes );
      ( "continueAsNewWorkflowExecutionDecisionAttributes",
        option_to_yojson continue_as_new_workflow_execution_decision_attributes_to_yojson
          x.continue_as_new_workflow_execution_decision_attributes );
      ( "recordMarkerDecisionAttributes",
        option_to_yojson record_marker_decision_attributes_to_yojson
          x.record_marker_decision_attributes );
      ( "startTimerDecisionAttributes",
        option_to_yojson start_timer_decision_attributes_to_yojson x.start_timer_decision_attributes
      );
      ( "cancelTimerDecisionAttributes",
        option_to_yojson cancel_timer_decision_attributes_to_yojson
          x.cancel_timer_decision_attributes );
      ( "signalExternalWorkflowExecutionDecisionAttributes",
        option_to_yojson signal_external_workflow_execution_decision_attributes_to_yojson
          x.signal_external_workflow_execution_decision_attributes );
      ( "requestCancelExternalWorkflowExecutionDecisionAttributes",
        option_to_yojson request_cancel_external_workflow_execution_decision_attributes_to_yojson
          x.request_cancel_external_workflow_execution_decision_attributes );
      ( "startChildWorkflowExecutionDecisionAttributes",
        option_to_yojson start_child_workflow_execution_decision_attributes_to_yojson
          x.start_child_workflow_execution_decision_attributes );
      ( "scheduleLambdaFunctionDecisionAttributes",
        option_to_yojson schedule_lambda_function_decision_attributes_to_yojson
          x.schedule_lambda_function_decision_attributes );
    ]

let decision_list_to_yojson tree = list_to_yojson decision_to_yojson tree

let start_lambda_function_failed_cause_to_yojson (x : start_lambda_function_failed_cause) =
  match x with ASSUME_ROLE_FAILED -> `String "ASSUME_ROLE_FAILED"

let start_lambda_function_failed_event_attributes_to_yojson
    (x : start_lambda_function_failed_event_attributes) =
  assoc_to_yojson
    [
      ("scheduledEventId", option_to_yojson event_id_to_yojson x.scheduled_event_id);
      ("cause", option_to_yojson start_lambda_function_failed_cause_to_yojson x.cause);
      ("message", option_to_yojson cause_message_to_yojson x.message);
    ]

let schedule_lambda_function_failed_cause_to_yojson (x : schedule_lambda_function_failed_cause) =
  match x with
  | ID_ALREADY_IN_USE -> `String "ID_ALREADY_IN_USE"
  | OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED -> `String "OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED"
  | LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED -> `String "LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED"
  | LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION -> `String "LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION"

let schedule_lambda_function_failed_event_attributes_to_yojson
    (x : schedule_lambda_function_failed_event_attributes) =
  assoc_to_yojson
    [
      ("id", Some (function_id_to_yojson x.id));
      ("name", Some (function_name_to_yojson x.name));
      ("cause", Some (schedule_lambda_function_failed_cause_to_yojson x.cause));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let lambda_function_timeout_type_to_yojson (x : lambda_function_timeout_type) =
  match x with START_TO_CLOSE -> `String "START_TO_CLOSE"

let lambda_function_timed_out_event_attributes_to_yojson
    (x : lambda_function_timed_out_event_attributes) =
  assoc_to_yojson
    [
      ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
      ("timeoutType", option_to_yojson lambda_function_timeout_type_to_yojson x.timeout_type);
    ]

let lambda_function_failed_event_attributes_to_yojson (x : lambda_function_failed_event_attributes)
    =
  assoc_to_yojson
    [
      ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
      ("reason", option_to_yojson failure_reason_to_yojson x.reason);
      ("details", option_to_yojson data_to_yojson x.details);
    ]

let lambda_function_completed_event_attributes_to_yojson
    (x : lambda_function_completed_event_attributes) =
  assoc_to_yojson
    [
      ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
      ("result", option_to_yojson data_to_yojson x.result_);
    ]

let lambda_function_started_event_attributes_to_yojson
    (x : lambda_function_started_event_attributes) =
  assoc_to_yojson [ ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id)) ]

let lambda_function_scheduled_event_attributes_to_yojson
    (x : lambda_function_scheduled_event_attributes) =
  assoc_to_yojson
    [
      ("id", Some (function_id_to_yojson x.id));
      ("name", Some (function_name_to_yojson x.name));
      ("control", option_to_yojson data_to_yojson x.control);
      ("input", option_to_yojson function_input_to_yojson x.input);
      ( "startToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.start_to_close_timeout );
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let start_child_workflow_execution_failed_cause_to_yojson
    (x : start_child_workflow_execution_failed_cause) =
  match x with
  | WORKFLOW_TYPE_DOES_NOT_EXIST -> `String "WORKFLOW_TYPE_DOES_NOT_EXIST"
  | WORKFLOW_TYPE_DEPRECATED -> `String "WORKFLOW_TYPE_DEPRECATED"
  | OPEN_CHILDREN_LIMIT_EXCEEDED -> `String "OPEN_CHILDREN_LIMIT_EXCEEDED"
  | OPEN_WORKFLOWS_LIMIT_EXCEEDED -> `String "OPEN_WORKFLOWS_LIMIT_EXCEEDED"
  | CHILD_CREATION_RATE_EXCEEDED -> `String "CHILD_CREATION_RATE_EXCEEDED"
  | WORKFLOW_ALREADY_RUNNING -> `String "WORKFLOW_ALREADY_RUNNING"
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED ->
      `String "DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED"
  | DEFAULT_TASK_LIST_UNDEFINED -> `String "DEFAULT_TASK_LIST_UNDEFINED"
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED ->
      `String "DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED"
  | DEFAULT_CHILD_POLICY_UNDEFINED -> `String "DEFAULT_CHILD_POLICY_UNDEFINED"
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let start_child_workflow_execution_failed_event_attributes_to_yojson
    (x : start_child_workflow_execution_failed_event_attributes) =
  assoc_to_yojson
    [
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("cause", Some (start_child_workflow_execution_failed_cause_to_yojson x.cause));
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("initiatedEventId", Some (event_id_to_yojson x.initiated_event_id));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
      ("control", option_to_yojson data_to_yojson x.control);
    ]

let start_timer_failed_cause_to_yojson (x : start_timer_failed_cause) =
  match x with
  | TIMER_ID_ALREADY_IN_USE -> `String "TIMER_ID_ALREADY_IN_USE"
  | OPEN_TIMERS_LIMIT_EXCEEDED -> `String "OPEN_TIMERS_LIMIT_EXCEEDED"
  | TIMER_CREATION_RATE_EXCEEDED -> `String "TIMER_CREATION_RATE_EXCEEDED"
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let start_timer_failed_event_attributes_to_yojson (x : start_timer_failed_event_attributes) =
  assoc_to_yojson
    [
      ("timerId", Some (timer_id_to_yojson x.timer_id));
      ("cause", Some (start_timer_failed_cause_to_yojson x.cause));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let request_cancel_activity_task_failed_cause_to_yojson
    (x : request_cancel_activity_task_failed_cause) =
  match x with
  | ACTIVITY_ID_UNKNOWN -> `String "ACTIVITY_ID_UNKNOWN"
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let request_cancel_activity_task_failed_event_attributes_to_yojson
    (x : request_cancel_activity_task_failed_event_attributes) =
  assoc_to_yojson
    [
      ("activityId", Some (activity_id_to_yojson x.activity_id));
      ("cause", Some (request_cancel_activity_task_failed_cause_to_yojson x.cause));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let schedule_activity_task_failed_cause_to_yojson (x : schedule_activity_task_failed_cause) =
  match x with
  | ACTIVITY_TYPE_DEPRECATED -> `String "ACTIVITY_TYPE_DEPRECATED"
  | ACTIVITY_TYPE_DOES_NOT_EXIST -> `String "ACTIVITY_TYPE_DOES_NOT_EXIST"
  | ACTIVITY_ID_ALREADY_IN_USE -> `String "ACTIVITY_ID_ALREADY_IN_USE"
  | OPEN_ACTIVITIES_LIMIT_EXCEEDED -> `String "OPEN_ACTIVITIES_LIMIT_EXCEEDED"
  | ACTIVITY_CREATION_RATE_EXCEEDED -> `String "ACTIVITY_CREATION_RATE_EXCEEDED"
  | DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED ->
      `String "DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED"
  | DEFAULT_TASK_LIST_UNDEFINED -> `String "DEFAULT_TASK_LIST_UNDEFINED"
  | DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED ->
      `String "DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED"
  | DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED -> `String "DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED"
  | DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED -> `String "DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED"
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let schedule_activity_task_failed_event_attributes_to_yojson
    (x : schedule_activity_task_failed_event_attributes) =
  assoc_to_yojson
    [
      ("activityType", Some (activity_type_to_yojson x.activity_type));
      ("activityId", Some (activity_id_to_yojson x.activity_id));
      ("cause", Some (schedule_activity_task_failed_cause_to_yojson x.cause));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let request_cancel_external_workflow_execution_failed_cause_to_yojson
    (x : request_cancel_external_workflow_execution_failed_cause) =
  match x with
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION -> `String "UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION"
  | REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED ->
      `String "REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED"
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let request_cancel_external_workflow_execution_failed_event_attributes_to_yojson
    (x : request_cancel_external_workflow_execution_failed_event_attributes) =
  assoc_to_yojson
    [
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("runId", option_to_yojson workflow_run_id_optional_to_yojson x.run_id);
      ("cause", Some (request_cancel_external_workflow_execution_failed_cause_to_yojson x.cause));
      ("initiatedEventId", Some (event_id_to_yojson x.initiated_event_id));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
      ("control", option_to_yojson data_to_yojson x.control);
    ]

let request_cancel_external_workflow_execution_initiated_event_attributes_to_yojson
    (x : request_cancel_external_workflow_execution_initiated_event_attributes) =
  assoc_to_yojson
    [
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("runId", option_to_yojson workflow_run_id_optional_to_yojson x.run_id);
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
      ("control", option_to_yojson data_to_yojson x.control);
    ]

let external_workflow_execution_cancel_requested_event_attributes_to_yojson
    (x : external_workflow_execution_cancel_requested_event_attributes) =
  assoc_to_yojson
    [
      ("workflowExecution", Some (workflow_execution_to_yojson x.workflow_execution));
      ("initiatedEventId", Some (event_id_to_yojson x.initiated_event_id));
    ]

let signal_external_workflow_execution_failed_cause_to_yojson
    (x : signal_external_workflow_execution_failed_cause) =
  match x with
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION -> `String "UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION"
  | SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED ->
      `String "SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED"
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let signal_external_workflow_execution_failed_event_attributes_to_yojson
    (x : signal_external_workflow_execution_failed_event_attributes) =
  assoc_to_yojson
    [
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("runId", option_to_yojson workflow_run_id_optional_to_yojson x.run_id);
      ("cause", Some (signal_external_workflow_execution_failed_cause_to_yojson x.cause));
      ("initiatedEventId", Some (event_id_to_yojson x.initiated_event_id));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
      ("control", option_to_yojson data_to_yojson x.control);
    ]

let external_workflow_execution_signaled_event_attributes_to_yojson
    (x : external_workflow_execution_signaled_event_attributes) =
  assoc_to_yojson
    [
      ("workflowExecution", Some (workflow_execution_to_yojson x.workflow_execution));
      ("initiatedEventId", Some (event_id_to_yojson x.initiated_event_id));
    ]

let signal_external_workflow_execution_initiated_event_attributes_to_yojson
    (x : signal_external_workflow_execution_initiated_event_attributes) =
  assoc_to_yojson
    [
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("runId", option_to_yojson workflow_run_id_optional_to_yojson x.run_id);
      ("signalName", Some (signal_name_to_yojson x.signal_name));
      ("input", option_to_yojson data_to_yojson x.input);
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
      ("control", option_to_yojson data_to_yojson x.control);
    ]

let start_child_workflow_execution_initiated_event_attributes_to_yojson
    (x : start_child_workflow_execution_initiated_event_attributes) =
  assoc_to_yojson
    [
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("control", option_to_yojson data_to_yojson x.control);
      ("input", option_to_yojson data_to_yojson x.input);
      ( "executionStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout
      );
      ("taskList", Some (task_list_to_yojson x.task_list));
      ("taskPriority", option_to_yojson task_priority_to_yojson x.task_priority);
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
      ("childPolicy", Some (child_policy_to_yojson x.child_policy));
      ( "taskStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout );
      ("tagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("lambdaRole", option_to_yojson arn_to_yojson x.lambda_role);
    ]

let timer_canceled_event_attributes_to_yojson (x : timer_canceled_event_attributes) =
  assoc_to_yojson
    [
      ("timerId", Some (timer_id_to_yojson x.timer_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let timer_fired_event_attributes_to_yojson (x : timer_fired_event_attributes) =
  assoc_to_yojson
    [
      ("timerId", Some (timer_id_to_yojson x.timer_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
    ]

let timer_started_event_attributes_to_yojson (x : timer_started_event_attributes) =
  assoc_to_yojson
    [
      ("timerId", Some (timer_id_to_yojson x.timer_id));
      ("control", option_to_yojson data_to_yojson x.control);
      ("startToFireTimeout", Some (duration_in_seconds_to_yojson x.start_to_fire_timeout));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let record_marker_failed_cause_to_yojson (x : record_marker_failed_cause) =
  match x with OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let record_marker_failed_event_attributes_to_yojson (x : record_marker_failed_event_attributes) =
  assoc_to_yojson
    [
      ("markerName", Some (marker_name_to_yojson x.marker_name));
      ("cause", Some (record_marker_failed_cause_to_yojson x.cause));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let marker_recorded_event_attributes_to_yojson (x : marker_recorded_event_attributes) =
  assoc_to_yojson
    [
      ("markerName", Some (marker_name_to_yojson x.marker_name));
      ("details", option_to_yojson data_to_yojson x.details);
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let workflow_execution_signaled_event_attributes_to_yojson
    (x : workflow_execution_signaled_event_attributes) =
  assoc_to_yojson
    [
      ("signalName", Some (signal_name_to_yojson x.signal_name));
      ("input", option_to_yojson data_to_yojson x.input);
      ( "externalWorkflowExecution",
        option_to_yojson workflow_execution_to_yojson x.external_workflow_execution );
      ("externalInitiatedEventId", option_to_yojson event_id_to_yojson x.external_initiated_event_id);
    ]

let decision_task_timeout_type_to_yojson (x : decision_task_timeout_type) =
  match x with
  | START_TO_CLOSE -> `String "START_TO_CLOSE"
  | SCHEDULE_TO_START -> `String "SCHEDULE_TO_START"

let decision_task_timed_out_event_attributes_to_yojson
    (x : decision_task_timed_out_event_attributes) =
  assoc_to_yojson
    [
      ("timeoutType", Some (decision_task_timeout_type_to_yojson x.timeout_type));
      ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
    ]

let decision_task_completed_event_attributes_to_yojson
    (x : decision_task_completed_event_attributes) =
  assoc_to_yojson
    [
      ("executionContext", option_to_yojson data_to_yojson x.execution_context);
      ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
      ("taskList", option_to_yojson task_list_to_yojson x.task_list);
      ( "taskListScheduleToStartTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.task_list_schedule_to_start_timeout );
    ]

let decision_task_started_event_attributes_to_yojson (x : decision_task_started_event_attributes) =
  assoc_to_yojson
    [
      ("identity", option_to_yojson identity_to_yojson x.identity);
      ("scheduledEventId", Some (event_id_to_yojson x.scheduled_event_id));
    ]

let decision_task_scheduled_event_attributes_to_yojson
    (x : decision_task_scheduled_event_attributes) =
  assoc_to_yojson
    [
      ("taskList", Some (task_list_to_yojson x.task_list));
      ("taskPriority", option_to_yojson task_priority_to_yojson x.task_priority);
      ( "startToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.start_to_close_timeout );
      ( "scheduleToStartTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.schedule_to_start_timeout );
    ]

let workflow_execution_cancel_requested_cause_to_yojson
    (x : workflow_execution_cancel_requested_cause) =
  match x with CHILD_POLICY_APPLIED -> `String "CHILD_POLICY_APPLIED"

let workflow_execution_cancel_requested_event_attributes_to_yojson
    (x : workflow_execution_cancel_requested_event_attributes) =
  assoc_to_yojson
    [
      ( "externalWorkflowExecution",
        option_to_yojson workflow_execution_to_yojson x.external_workflow_execution );
      ("externalInitiatedEventId", option_to_yojson event_id_to_yojson x.external_initiated_event_id);
      ("cause", option_to_yojson workflow_execution_cancel_requested_cause_to_yojson x.cause);
    ]

let workflow_execution_terminated_cause_to_yojson (x : workflow_execution_terminated_cause) =
  match x with
  | CHILD_POLICY_APPLIED -> `String "CHILD_POLICY_APPLIED"
  | EVENT_LIMIT_EXCEEDED -> `String "EVENT_LIMIT_EXCEEDED"
  | OPERATOR_INITIATED -> `String "OPERATOR_INITIATED"

let terminate_reason_to_yojson = string_to_yojson

let workflow_execution_terminated_event_attributes_to_yojson
    (x : workflow_execution_terminated_event_attributes) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson terminate_reason_to_yojson x.reason);
      ("details", option_to_yojson data_to_yojson x.details);
      ("childPolicy", Some (child_policy_to_yojson x.child_policy));
      ("cause", option_to_yojson workflow_execution_terminated_cause_to_yojson x.cause);
    ]

let workflow_execution_continued_as_new_event_attributes_to_yojson
    (x : workflow_execution_continued_as_new_event_attributes) =
  assoc_to_yojson
    [
      ("input", option_to_yojson data_to_yojson x.input);
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
      ("newExecutionRunId", Some (workflow_run_id_to_yojson x.new_execution_run_id));
      ( "executionStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout
      );
      ("taskList", Some (task_list_to_yojson x.task_list));
      ("taskPriority", option_to_yojson task_priority_to_yojson x.task_priority);
      ( "taskStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout );
      ("childPolicy", Some (child_policy_to_yojson x.child_policy));
      ("tagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("lambdaRole", option_to_yojson arn_to_yojson x.lambda_role);
    ]

let workflow_execution_canceled_event_attributes_to_yojson
    (x : workflow_execution_canceled_event_attributes) =
  assoc_to_yojson
    [
      ("details", option_to_yojson data_to_yojson x.details);
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let workflow_execution_timed_out_event_attributes_to_yojson
    (x : workflow_execution_timed_out_event_attributes) =
  assoc_to_yojson
    [
      ("timeoutType", Some (workflow_execution_timeout_type_to_yojson x.timeout_type));
      ("childPolicy", Some (child_policy_to_yojson x.child_policy));
    ]

let fail_workflow_execution_failed_cause_to_yojson (x : fail_workflow_execution_failed_cause) =
  match x with
  | UNHANDLED_DECISION -> `String "UNHANDLED_DECISION"
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"

let fail_workflow_execution_failed_event_attributes_to_yojson
    (x : fail_workflow_execution_failed_event_attributes) =
  assoc_to_yojson
    [
      ("cause", Some (fail_workflow_execution_failed_cause_to_yojson x.cause));
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let workflow_execution_failed_event_attributes_to_yojson
    (x : workflow_execution_failed_event_attributes) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson failure_reason_to_yojson x.reason);
      ("details", option_to_yojson data_to_yojson x.details);
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let workflow_execution_completed_event_attributes_to_yojson
    (x : workflow_execution_completed_event_attributes) =
  assoc_to_yojson
    [
      ("result", option_to_yojson data_to_yojson x.result_);
      ("decisionTaskCompletedEventId", Some (event_id_to_yojson x.decision_task_completed_event_id));
    ]

let workflow_execution_started_event_attributes_to_yojson
    (x : workflow_execution_started_event_attributes) =
  assoc_to_yojson
    [
      ("input", option_to_yojson data_to_yojson x.input);
      ( "executionStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout
      );
      ( "taskStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout );
      ("childPolicy", Some (child_policy_to_yojson x.child_policy));
      ("taskList", Some (task_list_to_yojson x.task_list));
      ("taskPriority", option_to_yojson task_priority_to_yojson x.task_priority);
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("tagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ( "continuedExecutionRunId",
        option_to_yojson workflow_run_id_optional_to_yojson x.continued_execution_run_id );
      ( "parentWorkflowExecution",
        option_to_yojson workflow_execution_to_yojson x.parent_workflow_execution );
      ("parentInitiatedEventId", option_to_yojson event_id_to_yojson x.parent_initiated_event_id);
      ("lambdaRole", option_to_yojson arn_to_yojson x.lambda_role);
    ]

let event_type_to_yojson (x : event_type) =
  match x with
  | WorkflowExecutionStarted -> `String "WorkflowExecutionStarted"
  | WorkflowExecutionCancelRequested -> `String "WorkflowExecutionCancelRequested"
  | WorkflowExecutionCompleted -> `String "WorkflowExecutionCompleted"
  | CompleteWorkflowExecutionFailed -> `String "CompleteWorkflowExecutionFailed"
  | WorkflowExecutionFailed -> `String "WorkflowExecutionFailed"
  | FailWorkflowExecutionFailed -> `String "FailWorkflowExecutionFailed"
  | WorkflowExecutionTimedOut -> `String "WorkflowExecutionTimedOut"
  | WorkflowExecutionCanceled -> `String "WorkflowExecutionCanceled"
  | CancelWorkflowExecutionFailed -> `String "CancelWorkflowExecutionFailed"
  | WorkflowExecutionContinuedAsNew -> `String "WorkflowExecutionContinuedAsNew"
  | ContinueAsNewWorkflowExecutionFailed -> `String "ContinueAsNewWorkflowExecutionFailed"
  | WorkflowExecutionTerminated -> `String "WorkflowExecutionTerminated"
  | DecisionTaskScheduled -> `String "DecisionTaskScheduled"
  | DecisionTaskStarted -> `String "DecisionTaskStarted"
  | DecisionTaskCompleted -> `String "DecisionTaskCompleted"
  | DecisionTaskTimedOut -> `String "DecisionTaskTimedOut"
  | ActivityTaskScheduled -> `String "ActivityTaskScheduled"
  | ScheduleActivityTaskFailed -> `String "ScheduleActivityTaskFailed"
  | ActivityTaskStarted -> `String "ActivityTaskStarted"
  | ActivityTaskCompleted -> `String "ActivityTaskCompleted"
  | ActivityTaskFailed -> `String "ActivityTaskFailed"
  | ActivityTaskTimedOut -> `String "ActivityTaskTimedOut"
  | ActivityTaskCanceled -> `String "ActivityTaskCanceled"
  | ActivityTaskCancelRequested -> `String "ActivityTaskCancelRequested"
  | RequestCancelActivityTaskFailed -> `String "RequestCancelActivityTaskFailed"
  | WorkflowExecutionSignaled -> `String "WorkflowExecutionSignaled"
  | MarkerRecorded -> `String "MarkerRecorded"
  | RecordMarkerFailed -> `String "RecordMarkerFailed"
  | TimerStarted -> `String "TimerStarted"
  | StartTimerFailed -> `String "StartTimerFailed"
  | TimerFired -> `String "TimerFired"
  | TimerCanceled -> `String "TimerCanceled"
  | CancelTimerFailed -> `String "CancelTimerFailed"
  | StartChildWorkflowExecutionInitiated -> `String "StartChildWorkflowExecutionInitiated"
  | StartChildWorkflowExecutionFailed -> `String "StartChildWorkflowExecutionFailed"
  | ChildWorkflowExecutionStarted -> `String "ChildWorkflowExecutionStarted"
  | ChildWorkflowExecutionCompleted -> `String "ChildWorkflowExecutionCompleted"
  | ChildWorkflowExecutionFailed -> `String "ChildWorkflowExecutionFailed"
  | ChildWorkflowExecutionTimedOut -> `String "ChildWorkflowExecutionTimedOut"
  | ChildWorkflowExecutionCanceled -> `String "ChildWorkflowExecutionCanceled"
  | ChildWorkflowExecutionTerminated -> `String "ChildWorkflowExecutionTerminated"
  | SignalExternalWorkflowExecutionInitiated -> `String "SignalExternalWorkflowExecutionInitiated"
  | SignalExternalWorkflowExecutionFailed -> `String "SignalExternalWorkflowExecutionFailed"
  | ExternalWorkflowExecutionSignaled -> `String "ExternalWorkflowExecutionSignaled"
  | RequestCancelExternalWorkflowExecutionInitiated ->
      `String "RequestCancelExternalWorkflowExecutionInitiated"
  | RequestCancelExternalWorkflowExecutionFailed ->
      `String "RequestCancelExternalWorkflowExecutionFailed"
  | ExternalWorkflowExecutionCancelRequested -> `String "ExternalWorkflowExecutionCancelRequested"
  | LambdaFunctionScheduled -> `String "LambdaFunctionScheduled"
  | LambdaFunctionStarted -> `String "LambdaFunctionStarted"
  | LambdaFunctionCompleted -> `String "LambdaFunctionCompleted"
  | LambdaFunctionFailed -> `String "LambdaFunctionFailed"
  | LambdaFunctionTimedOut -> `String "LambdaFunctionTimedOut"
  | ScheduleLambdaFunctionFailed -> `String "ScheduleLambdaFunctionFailed"
  | StartLambdaFunctionFailed -> `String "StartLambdaFunctionFailed"

let history_event_to_yojson (x : history_event) =
  assoc_to_yojson
    [
      ("eventTimestamp", Some (timestamp_to_yojson x.event_timestamp));
      ("eventType", Some (event_type_to_yojson x.event_type));
      ("eventId", Some (event_id_to_yojson x.event_id));
      ( "workflowExecutionStartedEventAttributes",
        option_to_yojson workflow_execution_started_event_attributes_to_yojson
          x.workflow_execution_started_event_attributes );
      ( "workflowExecutionCompletedEventAttributes",
        option_to_yojson workflow_execution_completed_event_attributes_to_yojson
          x.workflow_execution_completed_event_attributes );
      ( "completeWorkflowExecutionFailedEventAttributes",
        option_to_yojson complete_workflow_execution_failed_event_attributes_to_yojson
          x.complete_workflow_execution_failed_event_attributes );
      ( "workflowExecutionFailedEventAttributes",
        option_to_yojson workflow_execution_failed_event_attributes_to_yojson
          x.workflow_execution_failed_event_attributes );
      ( "failWorkflowExecutionFailedEventAttributes",
        option_to_yojson fail_workflow_execution_failed_event_attributes_to_yojson
          x.fail_workflow_execution_failed_event_attributes );
      ( "workflowExecutionTimedOutEventAttributes",
        option_to_yojson workflow_execution_timed_out_event_attributes_to_yojson
          x.workflow_execution_timed_out_event_attributes );
      ( "workflowExecutionCanceledEventAttributes",
        option_to_yojson workflow_execution_canceled_event_attributes_to_yojson
          x.workflow_execution_canceled_event_attributes );
      ( "cancelWorkflowExecutionFailedEventAttributes",
        option_to_yojson cancel_workflow_execution_failed_event_attributes_to_yojson
          x.cancel_workflow_execution_failed_event_attributes );
      ( "workflowExecutionContinuedAsNewEventAttributes",
        option_to_yojson workflow_execution_continued_as_new_event_attributes_to_yojson
          x.workflow_execution_continued_as_new_event_attributes );
      ( "continueAsNewWorkflowExecutionFailedEventAttributes",
        option_to_yojson continue_as_new_workflow_execution_failed_event_attributes_to_yojson
          x.continue_as_new_workflow_execution_failed_event_attributes );
      ( "workflowExecutionTerminatedEventAttributes",
        option_to_yojson workflow_execution_terminated_event_attributes_to_yojson
          x.workflow_execution_terminated_event_attributes );
      ( "workflowExecutionCancelRequestedEventAttributes",
        option_to_yojson workflow_execution_cancel_requested_event_attributes_to_yojson
          x.workflow_execution_cancel_requested_event_attributes );
      ( "decisionTaskScheduledEventAttributes",
        option_to_yojson decision_task_scheduled_event_attributes_to_yojson
          x.decision_task_scheduled_event_attributes );
      ( "decisionTaskStartedEventAttributes",
        option_to_yojson decision_task_started_event_attributes_to_yojson
          x.decision_task_started_event_attributes );
      ( "decisionTaskCompletedEventAttributes",
        option_to_yojson decision_task_completed_event_attributes_to_yojson
          x.decision_task_completed_event_attributes );
      ( "decisionTaskTimedOutEventAttributes",
        option_to_yojson decision_task_timed_out_event_attributes_to_yojson
          x.decision_task_timed_out_event_attributes );
      ( "activityTaskScheduledEventAttributes",
        option_to_yojson activity_task_scheduled_event_attributes_to_yojson
          x.activity_task_scheduled_event_attributes );
      ( "activityTaskStartedEventAttributes",
        option_to_yojson activity_task_started_event_attributes_to_yojson
          x.activity_task_started_event_attributes );
      ( "activityTaskCompletedEventAttributes",
        option_to_yojson activity_task_completed_event_attributes_to_yojson
          x.activity_task_completed_event_attributes );
      ( "activityTaskFailedEventAttributes",
        option_to_yojson activity_task_failed_event_attributes_to_yojson
          x.activity_task_failed_event_attributes );
      ( "activityTaskTimedOutEventAttributes",
        option_to_yojson activity_task_timed_out_event_attributes_to_yojson
          x.activity_task_timed_out_event_attributes );
      ( "activityTaskCanceledEventAttributes",
        option_to_yojson activity_task_canceled_event_attributes_to_yojson
          x.activity_task_canceled_event_attributes );
      ( "activityTaskCancelRequestedEventAttributes",
        option_to_yojson activity_task_cancel_requested_event_attributes_to_yojson
          x.activity_task_cancel_requested_event_attributes );
      ( "workflowExecutionSignaledEventAttributes",
        option_to_yojson workflow_execution_signaled_event_attributes_to_yojson
          x.workflow_execution_signaled_event_attributes );
      ( "markerRecordedEventAttributes",
        option_to_yojson marker_recorded_event_attributes_to_yojson
          x.marker_recorded_event_attributes );
      ( "recordMarkerFailedEventAttributes",
        option_to_yojson record_marker_failed_event_attributes_to_yojson
          x.record_marker_failed_event_attributes );
      ( "timerStartedEventAttributes",
        option_to_yojson timer_started_event_attributes_to_yojson x.timer_started_event_attributes
      );
      ( "timerFiredEventAttributes",
        option_to_yojson timer_fired_event_attributes_to_yojson x.timer_fired_event_attributes );
      ( "timerCanceledEventAttributes",
        option_to_yojson timer_canceled_event_attributes_to_yojson x.timer_canceled_event_attributes
      );
      ( "startChildWorkflowExecutionInitiatedEventAttributes",
        option_to_yojson start_child_workflow_execution_initiated_event_attributes_to_yojson
          x.start_child_workflow_execution_initiated_event_attributes );
      ( "childWorkflowExecutionStartedEventAttributes",
        option_to_yojson child_workflow_execution_started_event_attributes_to_yojson
          x.child_workflow_execution_started_event_attributes );
      ( "childWorkflowExecutionCompletedEventAttributes",
        option_to_yojson child_workflow_execution_completed_event_attributes_to_yojson
          x.child_workflow_execution_completed_event_attributes );
      ( "childWorkflowExecutionFailedEventAttributes",
        option_to_yojson child_workflow_execution_failed_event_attributes_to_yojson
          x.child_workflow_execution_failed_event_attributes );
      ( "childWorkflowExecutionTimedOutEventAttributes",
        option_to_yojson child_workflow_execution_timed_out_event_attributes_to_yojson
          x.child_workflow_execution_timed_out_event_attributes );
      ( "childWorkflowExecutionCanceledEventAttributes",
        option_to_yojson child_workflow_execution_canceled_event_attributes_to_yojson
          x.child_workflow_execution_canceled_event_attributes );
      ( "childWorkflowExecutionTerminatedEventAttributes",
        option_to_yojson child_workflow_execution_terminated_event_attributes_to_yojson
          x.child_workflow_execution_terminated_event_attributes );
      ( "signalExternalWorkflowExecutionInitiatedEventAttributes",
        option_to_yojson signal_external_workflow_execution_initiated_event_attributes_to_yojson
          x.signal_external_workflow_execution_initiated_event_attributes );
      ( "externalWorkflowExecutionSignaledEventAttributes",
        option_to_yojson external_workflow_execution_signaled_event_attributes_to_yojson
          x.external_workflow_execution_signaled_event_attributes );
      ( "signalExternalWorkflowExecutionFailedEventAttributes",
        option_to_yojson signal_external_workflow_execution_failed_event_attributes_to_yojson
          x.signal_external_workflow_execution_failed_event_attributes );
      ( "externalWorkflowExecutionCancelRequestedEventAttributes",
        option_to_yojson external_workflow_execution_cancel_requested_event_attributes_to_yojson
          x.external_workflow_execution_cancel_requested_event_attributes );
      ( "requestCancelExternalWorkflowExecutionInitiatedEventAttributes",
        option_to_yojson
          request_cancel_external_workflow_execution_initiated_event_attributes_to_yojson
          x.request_cancel_external_workflow_execution_initiated_event_attributes );
      ( "requestCancelExternalWorkflowExecutionFailedEventAttributes",
        option_to_yojson
          request_cancel_external_workflow_execution_failed_event_attributes_to_yojson
          x.request_cancel_external_workflow_execution_failed_event_attributes );
      ( "scheduleActivityTaskFailedEventAttributes",
        option_to_yojson schedule_activity_task_failed_event_attributes_to_yojson
          x.schedule_activity_task_failed_event_attributes );
      ( "requestCancelActivityTaskFailedEventAttributes",
        option_to_yojson request_cancel_activity_task_failed_event_attributes_to_yojson
          x.request_cancel_activity_task_failed_event_attributes );
      ( "startTimerFailedEventAttributes",
        option_to_yojson start_timer_failed_event_attributes_to_yojson
          x.start_timer_failed_event_attributes );
      ( "cancelTimerFailedEventAttributes",
        option_to_yojson cancel_timer_failed_event_attributes_to_yojson
          x.cancel_timer_failed_event_attributes );
      ( "startChildWorkflowExecutionFailedEventAttributes",
        option_to_yojson start_child_workflow_execution_failed_event_attributes_to_yojson
          x.start_child_workflow_execution_failed_event_attributes );
      ( "lambdaFunctionScheduledEventAttributes",
        option_to_yojson lambda_function_scheduled_event_attributes_to_yojson
          x.lambda_function_scheduled_event_attributes );
      ( "lambdaFunctionStartedEventAttributes",
        option_to_yojson lambda_function_started_event_attributes_to_yojson
          x.lambda_function_started_event_attributes );
      ( "lambdaFunctionCompletedEventAttributes",
        option_to_yojson lambda_function_completed_event_attributes_to_yojson
          x.lambda_function_completed_event_attributes );
      ( "lambdaFunctionFailedEventAttributes",
        option_to_yojson lambda_function_failed_event_attributes_to_yojson
          x.lambda_function_failed_event_attributes );
      ( "lambdaFunctionTimedOutEventAttributes",
        option_to_yojson lambda_function_timed_out_event_attributes_to_yojson
          x.lambda_function_timed_out_event_attributes );
      ( "scheduleLambdaFunctionFailedEventAttributes",
        option_to_yojson schedule_lambda_function_failed_event_attributes_to_yojson
          x.schedule_lambda_function_failed_event_attributes );
      ( "startLambdaFunctionFailedEventAttributes",
        option_to_yojson start_lambda_function_failed_event_attributes_to_yojson
          x.start_lambda_function_failed_event_attributes );
    ]

let history_event_list_to_yojson tree = list_to_yojson history_event_to_yojson tree

let decision_task_to_yojson (x : decision_task) =
  assoc_to_yojson
    [
      ("taskToken", Some (task_token_to_yojson x.task_token));
      ("startedEventId", Some (event_id_to_yojson x.started_event_id));
      ("workflowExecution", Some (workflow_execution_to_yojson x.workflow_execution));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("events", Some (history_event_list_to_yojson x.events));
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("previousStartedEventId", option_to_yojson event_id_to_yojson x.previous_started_event_id);
    ]

let default_undefined_fault_to_yojson (x : default_undefined_fault) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let type_not_deprecated_fault_to_yojson (x : type_not_deprecated_fault) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_activity_type_input_to_yojson (x : delete_activity_type_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("activityType", Some (activity_type_to_yojson x.activity_type));
    ]

let delete_workflow_type_input_to_yojson (x : delete_workflow_type_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
    ]

let type_deprecated_fault_to_yojson (x : type_deprecated_fault) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let deprecate_activity_type_input_to_yojson (x : deprecate_activity_type_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("activityType", Some (activity_type_to_yojson x.activity_type));
    ]

let domain_deprecated_fault_to_yojson (x : domain_deprecated_fault) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let deprecate_domain_input_to_yojson (x : deprecate_domain_input) =
  assoc_to_yojson [ ("name", Some (domain_name_to_yojson x.name)) ]

let deprecate_workflow_type_input_to_yojson (x : deprecate_workflow_type_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
    ]

let describe_activity_type_input_to_yojson (x : describe_activity_type_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("activityType", Some (activity_type_to_yojson x.activity_type));
    ]

let duration_in_days_to_yojson = string_to_yojson

let domain_configuration_to_yojson (x : domain_configuration) =
  assoc_to_yojson
    [
      ( "workflowExecutionRetentionPeriodInDays",
        Some (duration_in_days_to_yojson x.workflow_execution_retention_period_in_days) );
    ]

let domain_info_to_yojson (x : domain_info) =
  assoc_to_yojson
    [
      ("name", Some (domain_name_to_yojson x.name));
      ("status", Some (registration_status_to_yojson x.status));
      ("description", option_to_yojson description_to_yojson x.description);
      ("arn", option_to_yojson arn_to_yojson x.arn);
    ]

let domain_detail_to_yojson (x : domain_detail) =
  assoc_to_yojson
    [
      ("domainInfo", Some (domain_info_to_yojson x.domain_info));
      ("configuration", Some (domain_configuration_to_yojson x.configuration));
    ]

let describe_domain_input_to_yojson (x : describe_domain_input) =
  assoc_to_yojson [ ("name", Some (domain_name_to_yojson x.name)) ]

let open_decision_tasks_count_to_yojson = int_to_yojson

let workflow_execution_open_counts_to_yojson (x : workflow_execution_open_counts) =
  assoc_to_yojson
    [
      ("openActivityTasks", Some (count_to_yojson x.open_activity_tasks));
      ("openDecisionTasks", Some (open_decision_tasks_count_to_yojson x.open_decision_tasks));
      ("openTimers", Some (count_to_yojson x.open_timers));
      ("openChildWorkflowExecutions", Some (count_to_yojson x.open_child_workflow_executions));
      ("openLambdaFunctions", option_to_yojson count_to_yojson x.open_lambda_functions);
    ]

let workflow_execution_configuration_to_yojson (x : workflow_execution_configuration) =
  assoc_to_yojson
    [
      ("taskStartToCloseTimeout", Some (duration_in_seconds_to_yojson x.task_start_to_close_timeout));
      ( "executionStartToCloseTimeout",
        Some (duration_in_seconds_to_yojson x.execution_start_to_close_timeout) );
      ("taskList", Some (task_list_to_yojson x.task_list));
      ("taskPriority", option_to_yojson task_priority_to_yojson x.task_priority);
      ("childPolicy", Some (child_policy_to_yojson x.child_policy));
      ("lambdaRole", option_to_yojson arn_to_yojson x.lambda_role);
    ]

let execution_status_to_yojson (x : execution_status) =
  match x with OPEN -> `String "OPEN" | CLOSED -> `String "CLOSED"

let workflow_execution_info_to_yojson (x : workflow_execution_info) =
  assoc_to_yojson
    [
      ("execution", Some (workflow_execution_to_yojson x.execution));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("startTimestamp", Some (timestamp_to_yojson x.start_timestamp));
      ("closeTimestamp", option_to_yojson timestamp_to_yojson x.close_timestamp);
      ("executionStatus", Some (execution_status_to_yojson x.execution_status));
      ("closeStatus", option_to_yojson close_status_to_yojson x.close_status);
      ("parent", option_to_yojson workflow_execution_to_yojson x.parent);
      ("tagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("cancelRequested", option_to_yojson canceled_to_yojson x.cancel_requested);
    ]

let workflow_execution_detail_to_yojson (x : workflow_execution_detail) =
  assoc_to_yojson
    [
      ("executionInfo", Some (workflow_execution_info_to_yojson x.execution_info));
      ( "executionConfiguration",
        Some (workflow_execution_configuration_to_yojson x.execution_configuration) );
      ("openCounts", Some (workflow_execution_open_counts_to_yojson x.open_counts));
      ( "latestActivityTaskTimestamp",
        option_to_yojson timestamp_to_yojson x.latest_activity_task_timestamp );
      ("latestExecutionContext", option_to_yojson data_to_yojson x.latest_execution_context);
    ]

let describe_workflow_execution_input_to_yojson (x : describe_workflow_execution_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("execution", Some (workflow_execution_to_yojson x.execution));
    ]

let workflow_type_configuration_to_yojson (x : workflow_type_configuration) =
  assoc_to_yojson
    [
      ( "defaultTaskStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.default_task_start_to_close_timeout );
      ( "defaultExecutionStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.default_execution_start_to_close_timeout );
      ("defaultTaskList", option_to_yojson task_list_to_yojson x.default_task_list);
      ("defaultTaskPriority", option_to_yojson task_priority_to_yojson x.default_task_priority);
      ("defaultChildPolicy", option_to_yojson child_policy_to_yojson x.default_child_policy);
      ("defaultLambdaRole", option_to_yojson arn_to_yojson x.default_lambda_role);
    ]

let workflow_type_info_to_yojson (x : workflow_type_info) =
  assoc_to_yojson
    [
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("status", Some (registration_status_to_yojson x.status));
      ("description", option_to_yojson description_to_yojson x.description);
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
      ("deprecationDate", option_to_yojson timestamp_to_yojson x.deprecation_date);
    ]

let workflow_type_detail_to_yojson (x : workflow_type_detail) =
  assoc_to_yojson
    [
      ("typeInfo", Some (workflow_type_info_to_yojson x.type_info));
      ("configuration", Some (workflow_type_configuration_to_yojson x.configuration));
    ]

let describe_workflow_type_input_to_yojson (x : describe_workflow_type_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
    ]

let domain_already_exists_fault_to_yojson (x : domain_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let domain_info_list_to_yojson tree = list_to_yojson domain_info_to_yojson tree

let domain_infos_to_yojson (x : domain_infos) =
  assoc_to_yojson
    [
      ("domainInfos", Some (domain_info_list_to_yojson x.domain_infos));
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let history_to_yojson (x : history) =
  assoc_to_yojson
    [
      ("events", Some (history_event_list_to_yojson x.events));
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let reverse_order_to_yojson = bool_to_yojson
let page_size_to_yojson = int_to_yojson

let get_workflow_execution_history_input_to_yojson (x : get_workflow_execution_history_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("execution", Some (workflow_execution_to_yojson x.execution));
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("maximumPageSize", option_to_yojson page_size_to_yojson x.maximum_page_size);
      ("reverseOrder", option_to_yojson reverse_order_to_yojson x.reverse_order);
    ]

let limit_exceeded_fault_to_yojson (x : limit_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let list_activity_types_input_to_yojson (x : list_activity_types_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("name", option_to_yojson name_to_yojson x.name);
      ("registrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("maximumPageSize", option_to_yojson page_size_to_yojson x.maximum_page_size);
      ("reverseOrder", option_to_yojson reverse_order_to_yojson x.reverse_order);
    ]

let workflow_execution_info_list_to_yojson tree =
  list_to_yojson workflow_execution_info_to_yojson tree

let workflow_execution_infos_to_yojson (x : workflow_execution_infos) =
  assoc_to_yojson
    [
      ("executionInfos", Some (workflow_execution_info_list_to_yojson x.execution_infos));
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_closed_workflow_executions_input_to_yojson (x : list_closed_workflow_executions_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("startTimeFilter", option_to_yojson execution_time_filter_to_yojson x.start_time_filter);
      ("closeTimeFilter", option_to_yojson execution_time_filter_to_yojson x.close_time_filter);
      ("executionFilter", option_to_yojson workflow_execution_filter_to_yojson x.execution_filter);
      ("closeStatusFilter", option_to_yojson close_status_filter_to_yojson x.close_status_filter);
      ("typeFilter", option_to_yojson workflow_type_filter_to_yojson x.type_filter);
      ("tagFilter", option_to_yojson tag_filter_to_yojson x.tag_filter);
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("maximumPageSize", option_to_yojson page_size_to_yojson x.maximum_page_size);
      ("reverseOrder", option_to_yojson reverse_order_to_yojson x.reverse_order);
    ]

let list_domains_input_to_yojson (x : list_domains_input) =
  assoc_to_yojson
    [
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("registrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("maximumPageSize", option_to_yojson page_size_to_yojson x.maximum_page_size);
      ("reverseOrder", option_to_yojson reverse_order_to_yojson x.reverse_order);
    ]

let list_open_workflow_executions_input_to_yojson (x : list_open_workflow_executions_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("startTimeFilter", Some (execution_time_filter_to_yojson x.start_time_filter));
      ("typeFilter", option_to_yojson workflow_type_filter_to_yojson x.type_filter);
      ("tagFilter", option_to_yojson tag_filter_to_yojson x.tag_filter);
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("maximumPageSize", option_to_yojson page_size_to_yojson x.maximum_page_size);
      ("reverseOrder", option_to_yojson reverse_order_to_yojson x.reverse_order);
      ("executionFilter", option_to_yojson workflow_execution_filter_to_yojson x.execution_filter);
    ]

let resource_tag_value_to_yojson = string_to_yojson
let resource_tag_key_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("key", Some (resource_tag_key_to_yojson x.key));
      ("value", option_to_yojson resource_tag_value_to_yojson x.value);
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson [ ("tags", option_to_yojson resource_tag_list_to_yojson x.tags) ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let workflow_type_info_list_to_yojson tree = list_to_yojson workflow_type_info_to_yojson tree

let workflow_type_infos_to_yojson (x : workflow_type_infos) =
  assoc_to_yojson
    [
      ("typeInfos", Some (workflow_type_info_list_to_yojson x.type_infos));
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_workflow_types_input_to_yojson (x : list_workflow_types_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("name", option_to_yojson name_to_yojson x.name);
      ("registrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("maximumPageSize", option_to_yojson page_size_to_yojson x.maximum_page_size);
      ("reverseOrder", option_to_yojson reverse_order_to_yojson x.reverse_order);
    ]

let poll_for_activity_task_input_to_yojson (x : poll_for_activity_task_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("taskList", Some (task_list_to_yojson x.task_list));
      ("identity", option_to_yojson identity_to_yojson x.identity);
    ]

let start_at_previous_started_event_to_yojson = bool_to_yojson

let poll_for_decision_task_input_to_yojson (x : poll_for_decision_task_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("taskList", Some (task_list_to_yojson x.task_list));
      ("identity", option_to_yojson identity_to_yojson x.identity);
      ("nextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("maximumPageSize", option_to_yojson page_size_to_yojson x.maximum_page_size);
      ("reverseOrder", option_to_yojson reverse_order_to_yojson x.reverse_order);
      ( "startAtPreviousStartedEvent",
        option_to_yojson start_at_previous_started_event_to_yojson x.start_at_previous_started_event
      );
    ]

let record_activity_task_heartbeat_input_to_yojson (x : record_activity_task_heartbeat_input) =
  assoc_to_yojson
    [
      ("taskToken", Some (task_token_to_yojson x.task_token));
      ("details", option_to_yojson limited_data_to_yojson x.details);
    ]

let type_already_exists_fault_to_yojson (x : type_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let register_activity_type_input_to_yojson (x : register_activity_type_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("name", Some (name_to_yojson x.name));
      ("version", Some (version_to_yojson x.version));
      ("description", option_to_yojson description_to_yojson x.description);
      ( "defaultTaskStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.default_task_start_to_close_timeout );
      ( "defaultTaskHeartbeatTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_heartbeat_timeout );
      ("defaultTaskList", option_to_yojson task_list_to_yojson x.default_task_list);
      ("defaultTaskPriority", option_to_yojson task_priority_to_yojson x.default_task_priority);
      ( "defaultTaskScheduleToStartTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.default_task_schedule_to_start_timeout );
      ( "defaultTaskScheduleToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.default_task_schedule_to_close_timeout );
    ]

let too_many_tags_fault_to_yojson (x : too_many_tags_fault) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let register_domain_input_to_yojson (x : register_domain_input) =
  assoc_to_yojson
    [
      ("name", Some (domain_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ( "workflowExecutionRetentionPeriodInDays",
        Some (duration_in_days_to_yojson x.workflow_execution_retention_period_in_days) );
      ("tags", option_to_yojson resource_tag_list_to_yojson x.tags);
    ]

let register_workflow_type_input_to_yojson (x : register_workflow_type_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("name", Some (name_to_yojson x.name));
      ("version", Some (version_to_yojson x.version));
      ("description", option_to_yojson description_to_yojson x.description);
      ( "defaultTaskStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.default_task_start_to_close_timeout );
      ( "defaultExecutionStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.default_execution_start_to_close_timeout );
      ("defaultTaskList", option_to_yojson task_list_to_yojson x.default_task_list);
      ("defaultTaskPriority", option_to_yojson task_priority_to_yojson x.default_task_priority);
      ("defaultChildPolicy", option_to_yojson child_policy_to_yojson x.default_child_policy);
      ("defaultLambdaRole", option_to_yojson arn_to_yojson x.default_lambda_role);
    ]

let request_cancel_workflow_execution_input_to_yojson (x : request_cancel_workflow_execution_input)
    =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("runId", option_to_yojson workflow_run_id_optional_to_yojson x.run_id);
    ]

let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree

let respond_activity_task_canceled_input_to_yojson (x : respond_activity_task_canceled_input) =
  assoc_to_yojson
    [
      ("taskToken", Some (task_token_to_yojson x.task_token));
      ("details", option_to_yojson data_to_yojson x.details);
    ]

let respond_activity_task_completed_input_to_yojson (x : respond_activity_task_completed_input) =
  assoc_to_yojson
    [
      ("taskToken", Some (task_token_to_yojson x.task_token));
      ("result", option_to_yojson data_to_yojson x.result_);
    ]

let respond_activity_task_failed_input_to_yojson (x : respond_activity_task_failed_input) =
  assoc_to_yojson
    [
      ("taskToken", Some (task_token_to_yojson x.task_token));
      ("reason", option_to_yojson failure_reason_to_yojson x.reason);
      ("details", option_to_yojson data_to_yojson x.details);
    ]

let respond_decision_task_completed_input_to_yojson (x : respond_decision_task_completed_input) =
  assoc_to_yojson
    [
      ("taskToken", Some (task_token_to_yojson x.task_token));
      ("decisions", option_to_yojson decision_list_to_yojson x.decisions);
      ("executionContext", option_to_yojson data_to_yojson x.execution_context);
      ("taskList", option_to_yojson task_list_to_yojson x.task_list);
      ( "taskListScheduleToStartTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson
          x.task_list_schedule_to_start_timeout );
    ]

let run_to_yojson (x : run) =
  assoc_to_yojson [ ("runId", option_to_yojson workflow_run_id_to_yojson x.run_id) ]

let signal_workflow_execution_input_to_yojson (x : signal_workflow_execution_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("runId", option_to_yojson workflow_run_id_optional_to_yojson x.run_id);
      ("signalName", Some (signal_name_to_yojson x.signal_name));
      ("input", option_to_yojson data_to_yojson x.input);
    ]

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tagKeys", Some (resource_tag_key_list_to_yojson x.tag_keys));
    ]

let undeprecate_workflow_type_input_to_yojson (x : undeprecate_workflow_type_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
    ]

let undeprecate_domain_input_to_yojson (x : undeprecate_domain_input) =
  assoc_to_yojson [ ("name", Some (domain_name_to_yojson x.name)) ]

let undeprecate_activity_type_input_to_yojson (x : undeprecate_activity_type_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("activityType", Some (activity_type_to_yojson x.activity_type));
    ]

let terminate_workflow_execution_input_to_yojson (x : terminate_workflow_execution_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("runId", option_to_yojson workflow_run_id_optional_to_yojson x.run_id);
      ("reason", option_to_yojson terminate_reason_to_yojson x.reason);
      ("details", option_to_yojson data_to_yojson x.details);
      ("childPolicy", option_to_yojson child_policy_to_yojson x.child_policy);
    ]

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tags", Some (resource_tag_list_to_yojson x.tags));
    ]

let workflow_execution_already_started_fault_to_yojson
    (x : workflow_execution_already_started_fault) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let start_workflow_execution_input_to_yojson (x : start_workflow_execution_input) =
  assoc_to_yojson
    [
      ("domain", Some (domain_name_to_yojson x.domain));
      ("workflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("workflowType", Some (workflow_type_to_yojson x.workflow_type));
      ("taskList", option_to_yojson task_list_to_yojson x.task_list);
      ("taskPriority", option_to_yojson task_priority_to_yojson x.task_priority);
      ("input", option_to_yojson data_to_yojson x.input);
      ( "executionStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout
      );
      ("tagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ( "taskStartToCloseTimeout",
        option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout );
      ("childPolicy", option_to_yojson child_policy_to_yojson x.child_policy);
      ("lambdaRole", option_to_yojson arn_to_yojson x.lambda_role);
    ]
