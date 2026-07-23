open Smaws_Lib.Json.DeserializeHelpers
open Types

let activity_id_of_yojson = string_of_yojson
let data_of_yojson = string_of_yojson
let version_of_yojson = string_of_yojson
let name_of_yojson = string_of_yojson

let activity_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     version = value_for_key version_of_yojson "version" _list path;
   }
    : activity_type)

let workflow_run_id_of_yojson = string_of_yojson
let workflow_id_of_yojson = string_of_yojson

let workflow_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     run_id = value_for_key workflow_run_id_of_yojson "runId" _list path;
   }
    : workflow_execution)

let event_id_of_yojson = long_of_yojson
let task_token_of_yojson = string_of_yojson

let activity_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_token = value_for_key task_token_of_yojson "taskToken" _list path;
     activity_id = value_for_key activity_id_of_yojson "activityId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
     workflow_execution = value_for_key workflow_execution_of_yojson "workflowExecution" _list path;
     activity_type = value_for_key activity_type_of_yojson "activityType" _list path;
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
   }
    : activity_task)

let activity_task_cancel_requested_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
     activity_id = value_for_key activity_id_of_yojson "activityId" _list path;
   }
    : activity_task_cancel_requested_event_attributes)

let activity_task_canceled_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
     scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
     latest_cancel_requested_event_id =
       option_of_yojson (value_for_key event_id_of_yojson "latestCancelRequestedEventId") _list path;
   }
    : activity_task_canceled_event_attributes)

let activity_task_completed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_ = option_of_yojson (value_for_key data_of_yojson "result") _list path;
     scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
   }
    : activity_task_completed_event_attributes)

let failure_reason_of_yojson = string_of_yojson

let activity_task_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key failure_reason_of_yojson "reason") _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
     scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
   }
    : activity_task_failed_event_attributes)

let duration_in_seconds_optional_of_yojson = string_of_yojson
let task_priority_of_yojson = string_of_yojson

let task_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_of_yojson "name" _list path } : task_list)

let activity_task_scheduled_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activity_type = value_for_key activity_type_of_yojson "activityType" _list path;
     activity_id = value_for_key activity_id_of_yojson "activityId" _list path;
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
     schedule_to_start_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "scheduleToStartTimeout")
         _list path;
     schedule_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "scheduleToCloseTimeout")
         _list path;
     start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "startToCloseTimeout")
         _list path;
     task_list = value_for_key task_list_of_yojson "taskList" _list path;
     task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "taskPriority") _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
     heartbeat_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "heartbeatTimeout")
         _list path;
   }
    : activity_task_scheduled_event_attributes)

let identity_of_yojson = string_of_yojson

let activity_task_started_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity = option_of_yojson (value_for_key identity_of_yojson "identity") _list path;
     scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path;
   }
    : activity_task_started_event_attributes)

let canceled_of_yojson = bool_of_yojson

let activity_task_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cancel_requested = value_for_key canceled_of_yojson "cancelRequested" _list path }
    : activity_task_status)

let limited_data_of_yojson = string_of_yojson

let activity_task_timeout_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "START_TO_CLOSE" -> START_TO_CLOSE
    | `String "SCHEDULE_TO_START" -> SCHEDULE_TO_START
    | `String "SCHEDULE_TO_CLOSE" -> SCHEDULE_TO_CLOSE
    | `String "HEARTBEAT" -> HEARTBEAT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ActivityTaskTimeoutType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActivityTaskTimeoutType")
     : activity_task_timeout_type)
    : activity_task_timeout_type)

let activity_task_timed_out_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_type = value_for_key activity_task_timeout_type_of_yojson "timeoutType" _list path;
     scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
     details = option_of_yojson (value_for_key limited_data_of_yojson "details") _list path;
   }
    : activity_task_timed_out_event_attributes)

let activity_type_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_task_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultTaskStartToCloseTimeout")
         _list path;
     default_task_heartbeat_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultTaskHeartbeatTimeout")
         _list path;
     default_task_list =
       option_of_yojson (value_for_key task_list_of_yojson "defaultTaskList") _list path;
     default_task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "defaultTaskPriority") _list path;
     default_task_schedule_to_start_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultTaskScheduleToStartTimeout")
         _list path;
     default_task_schedule_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultTaskScheduleToCloseTimeout")
         _list path;
   }
    : activity_type_configuration)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let description_of_yojson = string_of_yojson

let registration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "REGISTERED" -> REGISTERED
    | `String "DEPRECATED" -> DEPRECATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegistrationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationStatus")
     : registration_status)
    : registration_status)

let activity_type_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activity_type = value_for_key activity_type_of_yojson "activityType" _list path;
     status = value_for_key registration_status_of_yojson "status" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     creation_date = value_for_key timestamp_of_yojson "creationDate" _list path;
     deprecation_date =
       option_of_yojson (value_for_key timestamp_of_yojson "deprecationDate") _list path;
   }
    : activity_type_info)

let activity_type_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_info = value_for_key activity_type_info_of_yojson "typeInfo" _list path;
     configuration = value_for_key activity_type_configuration_of_yojson "configuration" _list path;
   }
    : activity_type_detail)

let activity_type_info_list_of_yojson tree path =
  list_of_yojson activity_type_info_of_yojson tree path

let page_token_of_yojson = string_of_yojson

let activity_type_infos_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_infos = value_for_key activity_type_info_list_of_yojson "typeInfos" _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
   }
    : activity_type_infos)

let arn_of_yojson = string_of_yojson
let timer_id_of_yojson = string_of_yojson

let cancel_timer_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ timer_id = value_for_key timer_id_of_yojson "timerId" _list path }
    : cancel_timer_decision_attributes)

let cancel_timer_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "TIMER_ID_UNKNOWN" -> TIMER_ID_UNKNOWN
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CancelTimerFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "CancelTimerFailedCause")
     : cancel_timer_failed_cause)
    : cancel_timer_failed_cause)

let cancel_timer_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timer_id = value_for_key timer_id_of_yojson "timerId" _list path;
     cause = value_for_key cancel_timer_failed_cause_of_yojson "cause" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : cancel_timer_failed_event_attributes)

let cancel_workflow_execution_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ details = option_of_yojson (value_for_key data_of_yojson "details") _list path }
    : cancel_workflow_execution_decision_attributes)

let cancel_workflow_execution_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNHANDLED_DECISION" -> UNHANDLED_DECISION
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CancelWorkflowExecutionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "CancelWorkflowExecutionFailedCause")
     : cancel_workflow_execution_failed_cause)
    : cancel_workflow_execution_failed_cause)

let cancel_workflow_execution_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause = value_for_key cancel_workflow_execution_failed_cause_of_yojson "cause" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : cancel_workflow_execution_failed_event_attributes)

let cause_message_of_yojson = string_of_yojson

let child_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "TERMINATE" -> TERMINATE
    | `String "REQUEST_CANCEL" -> REQUEST_CANCEL
    | `String "ABANDON" -> ABANDON
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChildPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "ChildPolicy")
     : child_policy)
    : child_policy)

let workflow_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     version = value_for_key version_of_yojson "version" _list path;
   }
    : workflow_type)

let child_workflow_execution_canceled_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_execution = value_for_key workflow_execution_of_yojson "workflowExecution" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
     initiated_event_id = value_for_key event_id_of_yojson "initiatedEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
   }
    : child_workflow_execution_canceled_event_attributes)

let child_workflow_execution_completed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_execution = value_for_key workflow_execution_of_yojson "workflowExecution" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     result_ = option_of_yojson (value_for_key data_of_yojson "result") _list path;
     initiated_event_id = value_for_key event_id_of_yojson "initiatedEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
   }
    : child_workflow_execution_completed_event_attributes)

let child_workflow_execution_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_execution = value_for_key workflow_execution_of_yojson "workflowExecution" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     reason = option_of_yojson (value_for_key failure_reason_of_yojson "reason") _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
     initiated_event_id = value_for_key event_id_of_yojson "initiatedEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
   }
    : child_workflow_execution_failed_event_attributes)

let child_workflow_execution_started_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_execution = value_for_key workflow_execution_of_yojson "workflowExecution" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     initiated_event_id = value_for_key event_id_of_yojson "initiatedEventId" _list path;
   }
    : child_workflow_execution_started_event_attributes)

let child_workflow_execution_terminated_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_execution = value_for_key workflow_execution_of_yojson "workflowExecution" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     initiated_event_id = value_for_key event_id_of_yojson "initiatedEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
   }
    : child_workflow_execution_terminated_event_attributes)

let workflow_execution_timeout_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "START_TO_CLOSE" -> START_TO_CLOSE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkflowExecutionTimeoutType" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkflowExecutionTimeoutType")
     : workflow_execution_timeout_type)
    : workflow_execution_timeout_type)

let child_workflow_execution_timed_out_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_execution = value_for_key workflow_execution_of_yojson "workflowExecution" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     timeout_type = value_for_key workflow_execution_timeout_type_of_yojson "timeoutType" _list path;
     initiated_event_id = value_for_key event_id_of_yojson "initiatedEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
   }
    : child_workflow_execution_timed_out_event_attributes)

let close_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "CANCELED" -> CANCELED
    | `String "TERMINATED" -> TERMINATED
    | `String "CONTINUED_AS_NEW" -> CONTINUED_AS_NEW
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String value -> raise (deserialize_unknown_enum_value_error path "CloseStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CloseStatus")
     : close_status)
    : close_status)

let close_status_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = value_for_key close_status_of_yojson "status" _list path } : close_status_filter)

let complete_workflow_execution_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ result_ = option_of_yojson (value_for_key data_of_yojson "result") _list path }
    : complete_workflow_execution_decision_attributes)

let complete_workflow_execution_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNHANDLED_DECISION" -> UNHANDLED_DECISION
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "CompleteWorkflowExecutionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "CompleteWorkflowExecutionFailedCause")
     : complete_workflow_execution_failed_cause)
    : complete_workflow_execution_failed_cause)

let complete_workflow_execution_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause = value_for_key complete_workflow_execution_failed_cause_of_yojson "cause" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : complete_workflow_execution_failed_event_attributes)

let tag_of_yojson = string_of_yojson
let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let continue_as_new_workflow_execution_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
     execution_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "executionStartToCloseTimeout")
         _list path;
     task_list = option_of_yojson (value_for_key task_list_of_yojson "taskList") _list path;
     task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "taskPriority") _list path;
     task_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "taskStartToCloseTimeout")
         _list path;
     child_policy = option_of_yojson (value_for_key child_policy_of_yojson "childPolicy") _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "tagList") _list path;
     workflow_type_version =
       option_of_yojson (value_for_key version_of_yojson "workflowTypeVersion") _list path;
     lambda_role = option_of_yojson (value_for_key arn_of_yojson "lambdaRole") _list path;
   }
    : continue_as_new_workflow_execution_decision_attributes)

let continue_as_new_workflow_execution_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNHANDLED_DECISION" -> UNHANDLED_DECISION
    | `String "WORKFLOW_TYPE_DEPRECATED" -> WORKFLOW_TYPE_DEPRECATED
    | `String "WORKFLOW_TYPE_DOES_NOT_EXIST" -> WORKFLOW_TYPE_DOES_NOT_EXIST
    | `String "DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED" ->
        DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED" ->
        DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "DEFAULT_TASK_LIST_UNDEFINED" -> DEFAULT_TASK_LIST_UNDEFINED
    | `String "DEFAULT_CHILD_POLICY_UNDEFINED" -> DEFAULT_CHILD_POLICY_UNDEFINED
    | `String "CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED" ->
        CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ContinueAsNewWorkflowExecutionFailedCause"
             value)
    | _ -> raise (deserialize_wrong_type_error path "ContinueAsNewWorkflowExecutionFailedCause")
     : continue_as_new_workflow_execution_failed_cause)
    : continue_as_new_workflow_execution_failed_cause)

let continue_as_new_workflow_execution_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       value_for_key continue_as_new_workflow_execution_failed_cause_of_yojson "cause" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : continue_as_new_workflow_execution_failed_event_attributes)

let count_of_yojson = int_of_yojson
let error_message_of_yojson = string_of_yojson

let unknown_resource_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : unknown_resource_fault)

let operation_not_permitted_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : operation_not_permitted_fault)

let truncated_of_yojson = bool_of_yojson

let workflow_execution_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     count = value_for_key count_of_yojson "count" _list path;
     truncated = option_of_yojson (value_for_key truncated_of_yojson "truncated") _list path;
   }
    : workflow_execution_count)

let tag_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag = value_for_key tag_of_yojson "tag" _list path } : tag_filter)

let version_optional_of_yojson = string_of_yojson

let workflow_type_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     version = option_of_yojson (value_for_key version_optional_of_yojson "version") _list path;
   }
    : workflow_type_filter)

let workflow_execution_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path }
    : workflow_execution_filter)

let execution_time_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oldest_date = value_for_key timestamp_of_yojson "oldestDate" _list path;
     latest_date = option_of_yojson (value_for_key timestamp_of_yojson "latestDate") _list path;
   }
    : execution_time_filter)

let domain_name_of_yojson = string_of_yojson

let count_closed_workflow_executions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     start_time_filter =
       option_of_yojson (value_for_key execution_time_filter_of_yojson "startTimeFilter") _list path;
     close_time_filter =
       option_of_yojson (value_for_key execution_time_filter_of_yojson "closeTimeFilter") _list path;
     execution_filter =
       option_of_yojson
         (value_for_key workflow_execution_filter_of_yojson "executionFilter")
         _list path;
     type_filter =
       option_of_yojson (value_for_key workflow_type_filter_of_yojson "typeFilter") _list path;
     tag_filter = option_of_yojson (value_for_key tag_filter_of_yojson "tagFilter") _list path;
     close_status_filter =
       option_of_yojson (value_for_key close_status_filter_of_yojson "closeStatusFilter") _list path;
   }
    : count_closed_workflow_executions_input)

let count_open_workflow_executions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     start_time_filter = value_for_key execution_time_filter_of_yojson "startTimeFilter" _list path;
     type_filter =
       option_of_yojson (value_for_key workflow_type_filter_of_yojson "typeFilter") _list path;
     tag_filter = option_of_yojson (value_for_key tag_filter_of_yojson "tagFilter") _list path;
     execution_filter =
       option_of_yojson
         (value_for_key workflow_execution_filter_of_yojson "executionFilter")
         _list path;
   }
    : count_open_workflow_executions_input)

let pending_task_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     count = value_for_key count_of_yojson "count" _list path;
     truncated = option_of_yojson (value_for_key truncated_of_yojson "truncated") _list path;
   }
    : pending_task_count)

let count_pending_activity_tasks_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     task_list = value_for_key task_list_of_yojson "taskList" _list path;
   }
    : count_pending_activity_tasks_input)

let count_pending_decision_tasks_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     task_list = value_for_key task_list_of_yojson "taskList" _list path;
   }
    : count_pending_decision_tasks_input)

let function_input_of_yojson = string_of_yojson
let function_name_of_yojson = string_of_yojson
let function_id_of_yojson = string_of_yojson

let schedule_lambda_function_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key function_id_of_yojson "id" _list path;
     name = value_for_key function_name_of_yojson "name" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
     input = option_of_yojson (value_for_key function_input_of_yojson "input") _list path;
     start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "startToCloseTimeout")
         _list path;
   }
    : schedule_lambda_function_decision_attributes)

let start_child_workflow_execution_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
     execution_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "executionStartToCloseTimeout")
         _list path;
     task_list = option_of_yojson (value_for_key task_list_of_yojson "taskList") _list path;
     task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "taskPriority") _list path;
     task_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "taskStartToCloseTimeout")
         _list path;
     child_policy = option_of_yojson (value_for_key child_policy_of_yojson "childPolicy") _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "tagList") _list path;
     lambda_role = option_of_yojson (value_for_key arn_of_yojson "lambdaRole") _list path;
   }
    : start_child_workflow_execution_decision_attributes)

let workflow_run_id_optional_of_yojson = string_of_yojson

let request_cancel_external_workflow_execution_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     run_id = option_of_yojson (value_for_key workflow_run_id_optional_of_yojson "runId") _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
   }
    : request_cancel_external_workflow_execution_decision_attributes)

let signal_name_of_yojson = string_of_yojson

let signal_external_workflow_execution_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     run_id = option_of_yojson (value_for_key workflow_run_id_optional_of_yojson "runId") _list path;
     signal_name = value_for_key signal_name_of_yojson "signalName" _list path;
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
   }
    : signal_external_workflow_execution_decision_attributes)

let duration_in_seconds_of_yojson = string_of_yojson

let start_timer_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timer_id = value_for_key timer_id_of_yojson "timerId" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
     start_to_fire_timeout =
       value_for_key duration_in_seconds_of_yojson "startToFireTimeout" _list path;
   }
    : start_timer_decision_attributes)

let marker_name_of_yojson = string_of_yojson

let record_marker_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker_name = value_for_key marker_name_of_yojson "markerName" _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
   }
    : record_marker_decision_attributes)

let fail_workflow_execution_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key failure_reason_of_yojson "reason") _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
   }
    : fail_workflow_execution_decision_attributes)

let request_cancel_activity_task_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ activity_id = value_for_key activity_id_of_yojson "activityId" _list path }
    : request_cancel_activity_task_decision_attributes)

let schedule_activity_task_decision_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activity_type = value_for_key activity_type_of_yojson "activityType" _list path;
     activity_id = value_for_key activity_id_of_yojson "activityId" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
     schedule_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "scheduleToCloseTimeout")
         _list path;
     task_list = option_of_yojson (value_for_key task_list_of_yojson "taskList") _list path;
     task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "taskPriority") _list path;
     schedule_to_start_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "scheduleToStartTimeout")
         _list path;
     start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "startToCloseTimeout")
         _list path;
     heartbeat_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "heartbeatTimeout")
         _list path;
   }
    : schedule_activity_task_decision_attributes)

let decision_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ScheduleActivityTask" -> ScheduleActivityTask
    | `String "RequestCancelActivityTask" -> RequestCancelActivityTask
    | `String "CompleteWorkflowExecution" -> CompleteWorkflowExecution
    | `String "FailWorkflowExecution" -> FailWorkflowExecution
    | `String "CancelWorkflowExecution" -> CancelWorkflowExecution
    | `String "ContinueAsNewWorkflowExecution" -> ContinueAsNewWorkflowExecution
    | `String "RecordMarker" -> RecordMarker
    | `String "StartTimer" -> StartTimer
    | `String "CancelTimer" -> CancelTimer
    | `String "SignalExternalWorkflowExecution" -> SignalExternalWorkflowExecution
    | `String "RequestCancelExternalWorkflowExecution" -> RequestCancelExternalWorkflowExecution
    | `String "StartChildWorkflowExecution" -> StartChildWorkflowExecution
    | `String "ScheduleLambdaFunction" -> ScheduleLambdaFunction
    | `String value -> raise (deserialize_unknown_enum_value_error path "DecisionType" value)
    | _ -> raise (deserialize_wrong_type_error path "DecisionType")
     : decision_type)
    : decision_type)

let decision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     decision_type = value_for_key decision_type_of_yojson "decisionType" _list path;
     schedule_activity_task_decision_attributes =
       option_of_yojson
         (value_for_key schedule_activity_task_decision_attributes_of_yojson
            "scheduleActivityTaskDecisionAttributes")
         _list path;
     request_cancel_activity_task_decision_attributes =
       option_of_yojson
         (value_for_key request_cancel_activity_task_decision_attributes_of_yojson
            "requestCancelActivityTaskDecisionAttributes")
         _list path;
     complete_workflow_execution_decision_attributes =
       option_of_yojson
         (value_for_key complete_workflow_execution_decision_attributes_of_yojson
            "completeWorkflowExecutionDecisionAttributes")
         _list path;
     fail_workflow_execution_decision_attributes =
       option_of_yojson
         (value_for_key fail_workflow_execution_decision_attributes_of_yojson
            "failWorkflowExecutionDecisionAttributes")
         _list path;
     cancel_workflow_execution_decision_attributes =
       option_of_yojson
         (value_for_key cancel_workflow_execution_decision_attributes_of_yojson
            "cancelWorkflowExecutionDecisionAttributes")
         _list path;
     continue_as_new_workflow_execution_decision_attributes =
       option_of_yojson
         (value_for_key continue_as_new_workflow_execution_decision_attributes_of_yojson
            "continueAsNewWorkflowExecutionDecisionAttributes")
         _list path;
     record_marker_decision_attributes =
       option_of_yojson
         (value_for_key record_marker_decision_attributes_of_yojson "recordMarkerDecisionAttributes")
         _list path;
     start_timer_decision_attributes =
       option_of_yojson
         (value_for_key start_timer_decision_attributes_of_yojson "startTimerDecisionAttributes")
         _list path;
     cancel_timer_decision_attributes =
       option_of_yojson
         (value_for_key cancel_timer_decision_attributes_of_yojson "cancelTimerDecisionAttributes")
         _list path;
     signal_external_workflow_execution_decision_attributes =
       option_of_yojson
         (value_for_key signal_external_workflow_execution_decision_attributes_of_yojson
            "signalExternalWorkflowExecutionDecisionAttributes")
         _list path;
     request_cancel_external_workflow_execution_decision_attributes =
       option_of_yojson
         (value_for_key request_cancel_external_workflow_execution_decision_attributes_of_yojson
            "requestCancelExternalWorkflowExecutionDecisionAttributes")
         _list path;
     start_child_workflow_execution_decision_attributes =
       option_of_yojson
         (value_for_key start_child_workflow_execution_decision_attributes_of_yojson
            "startChildWorkflowExecutionDecisionAttributes")
         _list path;
     schedule_lambda_function_decision_attributes =
       option_of_yojson
         (value_for_key schedule_lambda_function_decision_attributes_of_yojson
            "scheduleLambdaFunctionDecisionAttributes")
         _list path;
   }
    : decision)

let decision_list_of_yojson tree path = list_of_yojson decision_of_yojson tree path

let start_lambda_function_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASSUME_ROLE_FAILED" -> ASSUME_ROLE_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StartLambdaFunctionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "StartLambdaFunctionFailedCause")
     : start_lambda_function_failed_cause)
    : start_lambda_function_failed_cause)

let start_lambda_function_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_event_id =
       option_of_yojson (value_for_key event_id_of_yojson "scheduledEventId") _list path;
     cause =
       option_of_yojson
         (value_for_key start_lambda_function_failed_cause_of_yojson "cause")
         _list path;
     message = option_of_yojson (value_for_key cause_message_of_yojson "message") _list path;
   }
    : start_lambda_function_failed_event_attributes)

let schedule_lambda_function_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "ID_ALREADY_IN_USE" -> ID_ALREADY_IN_USE
    | `String "OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED" -> OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED
    | `String "LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED" -> LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED
    | `String "LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION" -> LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScheduleLambdaFunctionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduleLambdaFunctionFailedCause")
     : schedule_lambda_function_failed_cause)
    : schedule_lambda_function_failed_cause)

let schedule_lambda_function_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key function_id_of_yojson "id" _list path;
     name = value_for_key function_name_of_yojson "name" _list path;
     cause = value_for_key schedule_lambda_function_failed_cause_of_yojson "cause" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : schedule_lambda_function_failed_event_attributes)

let lambda_function_timeout_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "START_TO_CLOSE" -> START_TO_CLOSE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LambdaFunctionTimeoutType" value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaFunctionTimeoutType")
     : lambda_function_timeout_type)
    : lambda_function_timeout_type)

let lambda_function_timed_out_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
     timeout_type =
       option_of_yojson
         (value_for_key lambda_function_timeout_type_of_yojson "timeoutType")
         _list path;
   }
    : lambda_function_timed_out_event_attributes)

let lambda_function_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
     reason = option_of_yojson (value_for_key failure_reason_of_yojson "reason") _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
   }
    : lambda_function_failed_event_attributes)

let lambda_function_completed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
     result_ = option_of_yojson (value_for_key data_of_yojson "result") _list path;
   }
    : lambda_function_completed_event_attributes)

let lambda_function_started_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path }
    : lambda_function_started_event_attributes)

let lambda_function_scheduled_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key function_id_of_yojson "id" _list path;
     name = value_for_key function_name_of_yojson "name" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
     input = option_of_yojson (value_for_key function_input_of_yojson "input") _list path;
     start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "startToCloseTimeout")
         _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : lambda_function_scheduled_event_attributes)

let start_child_workflow_execution_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "WORKFLOW_TYPE_DOES_NOT_EXIST" -> WORKFLOW_TYPE_DOES_NOT_EXIST
    | `String "WORKFLOW_TYPE_DEPRECATED" -> WORKFLOW_TYPE_DEPRECATED
    | `String "OPEN_CHILDREN_LIMIT_EXCEEDED" -> OPEN_CHILDREN_LIMIT_EXCEEDED
    | `String "OPEN_WORKFLOWS_LIMIT_EXCEEDED" -> OPEN_WORKFLOWS_LIMIT_EXCEEDED
    | `String "CHILD_CREATION_RATE_EXCEEDED" -> CHILD_CREATION_RATE_EXCEEDED
    | `String "WORKFLOW_ALREADY_RUNNING" -> WORKFLOW_ALREADY_RUNNING
    | `String "DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED" ->
        DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "DEFAULT_TASK_LIST_UNDEFINED" -> DEFAULT_TASK_LIST_UNDEFINED
    | `String "DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED" ->
        DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "DEFAULT_CHILD_POLICY_UNDEFINED" -> DEFAULT_CHILD_POLICY_UNDEFINED
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "StartChildWorkflowExecutionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "StartChildWorkflowExecutionFailedCause")
     : start_child_workflow_execution_failed_cause)
    : start_child_workflow_execution_failed_cause)

let start_child_workflow_execution_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     cause = value_for_key start_child_workflow_execution_failed_cause_of_yojson "cause" _list path;
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     initiated_event_id = value_for_key event_id_of_yojson "initiatedEventId" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
   }
    : start_child_workflow_execution_failed_event_attributes)

let start_timer_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "TIMER_ID_ALREADY_IN_USE" -> TIMER_ID_ALREADY_IN_USE
    | `String "OPEN_TIMERS_LIMIT_EXCEEDED" -> OPEN_TIMERS_LIMIT_EXCEEDED
    | `String "TIMER_CREATION_RATE_EXCEEDED" -> TIMER_CREATION_RATE_EXCEEDED
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StartTimerFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "StartTimerFailedCause")
     : start_timer_failed_cause)
    : start_timer_failed_cause)

let start_timer_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timer_id = value_for_key timer_id_of_yojson "timerId" _list path;
     cause = value_for_key start_timer_failed_cause_of_yojson "cause" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : start_timer_failed_event_attributes)

let request_cancel_activity_task_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVITY_ID_UNKNOWN" -> ACTIVITY_ID_UNKNOWN
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "RequestCancelActivityTaskFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "RequestCancelActivityTaskFailedCause")
     : request_cancel_activity_task_failed_cause)
    : request_cancel_activity_task_failed_cause)

let request_cancel_activity_task_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activity_id = value_for_key activity_id_of_yojson "activityId" _list path;
     cause = value_for_key request_cancel_activity_task_failed_cause_of_yojson "cause" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : request_cancel_activity_task_failed_event_attributes)

let schedule_activity_task_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVITY_TYPE_DEPRECATED" -> ACTIVITY_TYPE_DEPRECATED
    | `String "ACTIVITY_TYPE_DOES_NOT_EXIST" -> ACTIVITY_TYPE_DOES_NOT_EXIST
    | `String "ACTIVITY_ID_ALREADY_IN_USE" -> ACTIVITY_ID_ALREADY_IN_USE
    | `String "OPEN_ACTIVITIES_LIMIT_EXCEEDED" -> OPEN_ACTIVITIES_LIMIT_EXCEEDED
    | `String "ACTIVITY_CREATION_RATE_EXCEEDED" -> ACTIVITY_CREATION_RATE_EXCEEDED
    | `String "DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED" ->
        DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "DEFAULT_TASK_LIST_UNDEFINED" -> DEFAULT_TASK_LIST_UNDEFINED
    | `String "DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED" ->
        DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED
    | `String "DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED" -> DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED" -> DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScheduleActivityTaskFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduleActivityTaskFailedCause")
     : schedule_activity_task_failed_cause)
    : schedule_activity_task_failed_cause)

let schedule_activity_task_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activity_type = value_for_key activity_type_of_yojson "activityType" _list path;
     activity_id = value_for_key activity_id_of_yojson "activityId" _list path;
     cause = value_for_key schedule_activity_task_failed_cause_of_yojson "cause" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : schedule_activity_task_failed_event_attributes)

let request_cancel_external_workflow_execution_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION" -> UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION
    | `String "REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED" ->
        REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "RequestCancelExternalWorkflowExecutionFailedCause" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "RequestCancelExternalWorkflowExecutionFailedCause")
     : request_cancel_external_workflow_execution_failed_cause)
    : request_cancel_external_workflow_execution_failed_cause)

let request_cancel_external_workflow_execution_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     run_id = option_of_yojson (value_for_key workflow_run_id_optional_of_yojson "runId") _list path;
     cause =
       value_for_key request_cancel_external_workflow_execution_failed_cause_of_yojson "cause" _list
         path;
     initiated_event_id = value_for_key event_id_of_yojson "initiatedEventId" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
   }
    : request_cancel_external_workflow_execution_failed_event_attributes)

let request_cancel_external_workflow_execution_initiated_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     run_id = option_of_yojson (value_for_key workflow_run_id_optional_of_yojson "runId") _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
   }
    : request_cancel_external_workflow_execution_initiated_event_attributes)

let external_workflow_execution_cancel_requested_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_execution = value_for_key workflow_execution_of_yojson "workflowExecution" _list path;
     initiated_event_id = value_for_key event_id_of_yojson "initiatedEventId" _list path;
   }
    : external_workflow_execution_cancel_requested_event_attributes)

let signal_external_workflow_execution_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION" -> UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION
    | `String "SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED" ->
        SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "SignalExternalWorkflowExecutionFailedCause"
             value)
    | _ -> raise (deserialize_wrong_type_error path "SignalExternalWorkflowExecutionFailedCause")
     : signal_external_workflow_execution_failed_cause)
    : signal_external_workflow_execution_failed_cause)

let signal_external_workflow_execution_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     run_id = option_of_yojson (value_for_key workflow_run_id_optional_of_yojson "runId") _list path;
     cause =
       value_for_key signal_external_workflow_execution_failed_cause_of_yojson "cause" _list path;
     initiated_event_id = value_for_key event_id_of_yojson "initiatedEventId" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
   }
    : signal_external_workflow_execution_failed_event_attributes)

let external_workflow_execution_signaled_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_execution = value_for_key workflow_execution_of_yojson "workflowExecution" _list path;
     initiated_event_id = value_for_key event_id_of_yojson "initiatedEventId" _list path;
   }
    : external_workflow_execution_signaled_event_attributes)

let signal_external_workflow_execution_initiated_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     run_id = option_of_yojson (value_for_key workflow_run_id_optional_of_yojson "runId") _list path;
     signal_name = value_for_key signal_name_of_yojson "signalName" _list path;
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
   }
    : signal_external_workflow_execution_initiated_event_attributes)

let start_child_workflow_execution_initiated_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
     execution_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "executionStartToCloseTimeout")
         _list path;
     task_list = value_for_key task_list_of_yojson "taskList" _list path;
     task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "taskPriority") _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
     child_policy = value_for_key child_policy_of_yojson "childPolicy" _list path;
     task_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "taskStartToCloseTimeout")
         _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "tagList") _list path;
     lambda_role = option_of_yojson (value_for_key arn_of_yojson "lambdaRole") _list path;
   }
    : start_child_workflow_execution_initiated_event_attributes)

let timer_canceled_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timer_id = value_for_key timer_id_of_yojson "timerId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : timer_canceled_event_attributes)

let timer_fired_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timer_id = value_for_key timer_id_of_yojson "timerId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
   }
    : timer_fired_event_attributes)

let timer_started_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timer_id = value_for_key timer_id_of_yojson "timerId" _list path;
     control = option_of_yojson (value_for_key data_of_yojson "control") _list path;
     start_to_fire_timeout =
       value_for_key duration_in_seconds_of_yojson "startToFireTimeout" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : timer_started_event_attributes)

let record_marker_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RecordMarkerFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordMarkerFailedCause")
     : record_marker_failed_cause)
    : record_marker_failed_cause)

let record_marker_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker_name = value_for_key marker_name_of_yojson "markerName" _list path;
     cause = value_for_key record_marker_failed_cause_of_yojson "cause" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : record_marker_failed_event_attributes)

let marker_recorded_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker_name = value_for_key marker_name_of_yojson "markerName" _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : marker_recorded_event_attributes)

let workflow_execution_signaled_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signal_name = value_for_key signal_name_of_yojson "signalName" _list path;
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
     external_workflow_execution =
       option_of_yojson
         (value_for_key workflow_execution_of_yojson "externalWorkflowExecution")
         _list path;
     external_initiated_event_id =
       option_of_yojson (value_for_key event_id_of_yojson "externalInitiatedEventId") _list path;
   }
    : workflow_execution_signaled_event_attributes)

let decision_task_timeout_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "START_TO_CLOSE" -> START_TO_CLOSE
    | `String "SCHEDULE_TO_START" -> SCHEDULE_TO_START
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DecisionTaskTimeoutType" value)
    | _ -> raise (deserialize_wrong_type_error path "DecisionTaskTimeoutType")
     : decision_task_timeout_type)
    : decision_task_timeout_type)

let decision_task_timed_out_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_type = value_for_key decision_task_timeout_type_of_yojson "timeoutType" _list path;
     scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
   }
    : decision_task_timed_out_event_attributes)

let decision_task_completed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_context =
       option_of_yojson (value_for_key data_of_yojson "executionContext") _list path;
     scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
     task_list = option_of_yojson (value_for_key task_list_of_yojson "taskList") _list path;
     task_list_schedule_to_start_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "taskListScheduleToStartTimeout")
         _list path;
   }
    : decision_task_completed_event_attributes)

let decision_task_started_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity = option_of_yojson (value_for_key identity_of_yojson "identity") _list path;
     scheduled_event_id = value_for_key event_id_of_yojson "scheduledEventId" _list path;
   }
    : decision_task_started_event_attributes)

let decision_task_scheduled_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_list = value_for_key task_list_of_yojson "taskList" _list path;
     task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "taskPriority") _list path;
     start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "startToCloseTimeout")
         _list path;
     schedule_to_start_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "scheduleToStartTimeout")
         _list path;
   }
    : decision_task_scheduled_event_attributes)

let workflow_execution_cancel_requested_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "CHILD_POLICY_APPLIED" -> CHILD_POLICY_APPLIED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "WorkflowExecutionCancelRequestedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkflowExecutionCancelRequestedCause")
     : workflow_execution_cancel_requested_cause)
    : workflow_execution_cancel_requested_cause)

let workflow_execution_cancel_requested_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_workflow_execution =
       option_of_yojson
         (value_for_key workflow_execution_of_yojson "externalWorkflowExecution")
         _list path;
     external_initiated_event_id =
       option_of_yojson (value_for_key event_id_of_yojson "externalInitiatedEventId") _list path;
     cause =
       option_of_yojson
         (value_for_key workflow_execution_cancel_requested_cause_of_yojson "cause")
         _list path;
   }
    : workflow_execution_cancel_requested_event_attributes)

let workflow_execution_terminated_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "CHILD_POLICY_APPLIED" -> CHILD_POLICY_APPLIED
    | `String "EVENT_LIMIT_EXCEEDED" -> EVENT_LIMIT_EXCEEDED
    | `String "OPERATOR_INITIATED" -> OPERATOR_INITIATED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkflowExecutionTerminatedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkflowExecutionTerminatedCause")
     : workflow_execution_terminated_cause)
    : workflow_execution_terminated_cause)

let terminate_reason_of_yojson = string_of_yojson

let workflow_execution_terminated_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key terminate_reason_of_yojson "reason") _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
     child_policy = value_for_key child_policy_of_yojson "childPolicy" _list path;
     cause =
       option_of_yojson
         (value_for_key workflow_execution_terminated_cause_of_yojson "cause")
         _list path;
   }
    : workflow_execution_terminated_event_attributes)

let workflow_execution_continued_as_new_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
     new_execution_run_id = value_for_key workflow_run_id_of_yojson "newExecutionRunId" _list path;
     execution_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "executionStartToCloseTimeout")
         _list path;
     task_list = value_for_key task_list_of_yojson "taskList" _list path;
     task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "taskPriority") _list path;
     task_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "taskStartToCloseTimeout")
         _list path;
     child_policy = value_for_key child_policy_of_yojson "childPolicy" _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "tagList") _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     lambda_role = option_of_yojson (value_for_key arn_of_yojson "lambdaRole") _list path;
   }
    : workflow_execution_continued_as_new_event_attributes)

let workflow_execution_canceled_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : workflow_execution_canceled_event_attributes)

let workflow_execution_timed_out_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_type = value_for_key workflow_execution_timeout_type_of_yojson "timeoutType" _list path;
     child_policy = value_for_key child_policy_of_yojson "childPolicy" _list path;
   }
    : workflow_execution_timed_out_event_attributes)

let fail_workflow_execution_failed_cause_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNHANDLED_DECISION" -> UNHANDLED_DECISION
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FailWorkflowExecutionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "FailWorkflowExecutionFailedCause")
     : fail_workflow_execution_failed_cause)
    : fail_workflow_execution_failed_cause)

let fail_workflow_execution_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause = value_for_key fail_workflow_execution_failed_cause_of_yojson "cause" _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : fail_workflow_execution_failed_event_attributes)

let workflow_execution_failed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key failure_reason_of_yojson "reason") _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : workflow_execution_failed_event_attributes)

let workflow_execution_completed_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_ = option_of_yojson (value_for_key data_of_yojson "result") _list path;
     decision_task_completed_event_id =
       value_for_key event_id_of_yojson "decisionTaskCompletedEventId" _list path;
   }
    : workflow_execution_completed_event_attributes)

let workflow_execution_started_event_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
     execution_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "executionStartToCloseTimeout")
         _list path;
     task_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "taskStartToCloseTimeout")
         _list path;
     child_policy = value_for_key child_policy_of_yojson "childPolicy" _list path;
     task_list = value_for_key task_list_of_yojson "taskList" _list path;
     task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "taskPriority") _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "tagList") _list path;
     continued_execution_run_id =
       option_of_yojson
         (value_for_key workflow_run_id_optional_of_yojson "continuedExecutionRunId")
         _list path;
     parent_workflow_execution =
       option_of_yojson
         (value_for_key workflow_execution_of_yojson "parentWorkflowExecution")
         _list path;
     parent_initiated_event_id =
       option_of_yojson (value_for_key event_id_of_yojson "parentInitiatedEventId") _list path;
     lambda_role = option_of_yojson (value_for_key arn_of_yojson "lambdaRole") _list path;
   }
    : workflow_execution_started_event_attributes)

let event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WorkflowExecutionStarted" -> WorkflowExecutionStarted
    | `String "WorkflowExecutionCancelRequested" -> WorkflowExecutionCancelRequested
    | `String "WorkflowExecutionCompleted" -> WorkflowExecutionCompleted
    | `String "CompleteWorkflowExecutionFailed" -> CompleteWorkflowExecutionFailed
    | `String "WorkflowExecutionFailed" -> WorkflowExecutionFailed
    | `String "FailWorkflowExecutionFailed" -> FailWorkflowExecutionFailed
    | `String "WorkflowExecutionTimedOut" -> WorkflowExecutionTimedOut
    | `String "WorkflowExecutionCanceled" -> WorkflowExecutionCanceled
    | `String "CancelWorkflowExecutionFailed" -> CancelWorkflowExecutionFailed
    | `String "WorkflowExecutionContinuedAsNew" -> WorkflowExecutionContinuedAsNew
    | `String "ContinueAsNewWorkflowExecutionFailed" -> ContinueAsNewWorkflowExecutionFailed
    | `String "WorkflowExecutionTerminated" -> WorkflowExecutionTerminated
    | `String "DecisionTaskScheduled" -> DecisionTaskScheduled
    | `String "DecisionTaskStarted" -> DecisionTaskStarted
    | `String "DecisionTaskCompleted" -> DecisionTaskCompleted
    | `String "DecisionTaskTimedOut" -> DecisionTaskTimedOut
    | `String "ActivityTaskScheduled" -> ActivityTaskScheduled
    | `String "ScheduleActivityTaskFailed" -> ScheduleActivityTaskFailed
    | `String "ActivityTaskStarted" -> ActivityTaskStarted
    | `String "ActivityTaskCompleted" -> ActivityTaskCompleted
    | `String "ActivityTaskFailed" -> ActivityTaskFailed
    | `String "ActivityTaskTimedOut" -> ActivityTaskTimedOut
    | `String "ActivityTaskCanceled" -> ActivityTaskCanceled
    | `String "ActivityTaskCancelRequested" -> ActivityTaskCancelRequested
    | `String "RequestCancelActivityTaskFailed" -> RequestCancelActivityTaskFailed
    | `String "WorkflowExecutionSignaled" -> WorkflowExecutionSignaled
    | `String "MarkerRecorded" -> MarkerRecorded
    | `String "RecordMarkerFailed" -> RecordMarkerFailed
    | `String "TimerStarted" -> TimerStarted
    | `String "StartTimerFailed" -> StartTimerFailed
    | `String "TimerFired" -> TimerFired
    | `String "TimerCanceled" -> TimerCanceled
    | `String "CancelTimerFailed" -> CancelTimerFailed
    | `String "StartChildWorkflowExecutionInitiated" -> StartChildWorkflowExecutionInitiated
    | `String "StartChildWorkflowExecutionFailed" -> StartChildWorkflowExecutionFailed
    | `String "ChildWorkflowExecutionStarted" -> ChildWorkflowExecutionStarted
    | `String "ChildWorkflowExecutionCompleted" -> ChildWorkflowExecutionCompleted
    | `String "ChildWorkflowExecutionFailed" -> ChildWorkflowExecutionFailed
    | `String "ChildWorkflowExecutionTimedOut" -> ChildWorkflowExecutionTimedOut
    | `String "ChildWorkflowExecutionCanceled" -> ChildWorkflowExecutionCanceled
    | `String "ChildWorkflowExecutionTerminated" -> ChildWorkflowExecutionTerminated
    | `String "SignalExternalWorkflowExecutionInitiated" -> SignalExternalWorkflowExecutionInitiated
    | `String "SignalExternalWorkflowExecutionFailed" -> SignalExternalWorkflowExecutionFailed
    | `String "ExternalWorkflowExecutionSignaled" -> ExternalWorkflowExecutionSignaled
    | `String "RequestCancelExternalWorkflowExecutionInitiated" ->
        RequestCancelExternalWorkflowExecutionInitiated
    | `String "RequestCancelExternalWorkflowExecutionFailed" ->
        RequestCancelExternalWorkflowExecutionFailed
    | `String "ExternalWorkflowExecutionCancelRequested" -> ExternalWorkflowExecutionCancelRequested
    | `String "LambdaFunctionScheduled" -> LambdaFunctionScheduled
    | `String "LambdaFunctionStarted" -> LambdaFunctionStarted
    | `String "LambdaFunctionCompleted" -> LambdaFunctionCompleted
    | `String "LambdaFunctionFailed" -> LambdaFunctionFailed
    | `String "LambdaFunctionTimedOut" -> LambdaFunctionTimedOut
    | `String "ScheduleLambdaFunctionFailed" -> ScheduleLambdaFunctionFailed
    | `String "StartLambdaFunctionFailed" -> StartLambdaFunctionFailed
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventType")
     : event_type)
    : event_type)

let history_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_timestamp = value_for_key timestamp_of_yojson "eventTimestamp" _list path;
     event_type = value_for_key event_type_of_yojson "eventType" _list path;
     event_id = value_for_key event_id_of_yojson "eventId" _list path;
     workflow_execution_started_event_attributes =
       option_of_yojson
         (value_for_key workflow_execution_started_event_attributes_of_yojson
            "workflowExecutionStartedEventAttributes")
         _list path;
     workflow_execution_completed_event_attributes =
       option_of_yojson
         (value_for_key workflow_execution_completed_event_attributes_of_yojson
            "workflowExecutionCompletedEventAttributes")
         _list path;
     complete_workflow_execution_failed_event_attributes =
       option_of_yojson
         (value_for_key complete_workflow_execution_failed_event_attributes_of_yojson
            "completeWorkflowExecutionFailedEventAttributes")
         _list path;
     workflow_execution_failed_event_attributes =
       option_of_yojson
         (value_for_key workflow_execution_failed_event_attributes_of_yojson
            "workflowExecutionFailedEventAttributes")
         _list path;
     fail_workflow_execution_failed_event_attributes =
       option_of_yojson
         (value_for_key fail_workflow_execution_failed_event_attributes_of_yojson
            "failWorkflowExecutionFailedEventAttributes")
         _list path;
     workflow_execution_timed_out_event_attributes =
       option_of_yojson
         (value_for_key workflow_execution_timed_out_event_attributes_of_yojson
            "workflowExecutionTimedOutEventAttributes")
         _list path;
     workflow_execution_canceled_event_attributes =
       option_of_yojson
         (value_for_key workflow_execution_canceled_event_attributes_of_yojson
            "workflowExecutionCanceledEventAttributes")
         _list path;
     cancel_workflow_execution_failed_event_attributes =
       option_of_yojson
         (value_for_key cancel_workflow_execution_failed_event_attributes_of_yojson
            "cancelWorkflowExecutionFailedEventAttributes")
         _list path;
     workflow_execution_continued_as_new_event_attributes =
       option_of_yojson
         (value_for_key workflow_execution_continued_as_new_event_attributes_of_yojson
            "workflowExecutionContinuedAsNewEventAttributes")
         _list path;
     continue_as_new_workflow_execution_failed_event_attributes =
       option_of_yojson
         (value_for_key continue_as_new_workflow_execution_failed_event_attributes_of_yojson
            "continueAsNewWorkflowExecutionFailedEventAttributes")
         _list path;
     workflow_execution_terminated_event_attributes =
       option_of_yojson
         (value_for_key workflow_execution_terminated_event_attributes_of_yojson
            "workflowExecutionTerminatedEventAttributes")
         _list path;
     workflow_execution_cancel_requested_event_attributes =
       option_of_yojson
         (value_for_key workflow_execution_cancel_requested_event_attributes_of_yojson
            "workflowExecutionCancelRequestedEventAttributes")
         _list path;
     decision_task_scheduled_event_attributes =
       option_of_yojson
         (value_for_key decision_task_scheduled_event_attributes_of_yojson
            "decisionTaskScheduledEventAttributes")
         _list path;
     decision_task_started_event_attributes =
       option_of_yojson
         (value_for_key decision_task_started_event_attributes_of_yojson
            "decisionTaskStartedEventAttributes")
         _list path;
     decision_task_completed_event_attributes =
       option_of_yojson
         (value_for_key decision_task_completed_event_attributes_of_yojson
            "decisionTaskCompletedEventAttributes")
         _list path;
     decision_task_timed_out_event_attributes =
       option_of_yojson
         (value_for_key decision_task_timed_out_event_attributes_of_yojson
            "decisionTaskTimedOutEventAttributes")
         _list path;
     activity_task_scheduled_event_attributes =
       option_of_yojson
         (value_for_key activity_task_scheduled_event_attributes_of_yojson
            "activityTaskScheduledEventAttributes")
         _list path;
     activity_task_started_event_attributes =
       option_of_yojson
         (value_for_key activity_task_started_event_attributes_of_yojson
            "activityTaskStartedEventAttributes")
         _list path;
     activity_task_completed_event_attributes =
       option_of_yojson
         (value_for_key activity_task_completed_event_attributes_of_yojson
            "activityTaskCompletedEventAttributes")
         _list path;
     activity_task_failed_event_attributes =
       option_of_yojson
         (value_for_key activity_task_failed_event_attributes_of_yojson
            "activityTaskFailedEventAttributes")
         _list path;
     activity_task_timed_out_event_attributes =
       option_of_yojson
         (value_for_key activity_task_timed_out_event_attributes_of_yojson
            "activityTaskTimedOutEventAttributes")
         _list path;
     activity_task_canceled_event_attributes =
       option_of_yojson
         (value_for_key activity_task_canceled_event_attributes_of_yojson
            "activityTaskCanceledEventAttributes")
         _list path;
     activity_task_cancel_requested_event_attributes =
       option_of_yojson
         (value_for_key activity_task_cancel_requested_event_attributes_of_yojson
            "activityTaskCancelRequestedEventAttributes")
         _list path;
     workflow_execution_signaled_event_attributes =
       option_of_yojson
         (value_for_key workflow_execution_signaled_event_attributes_of_yojson
            "workflowExecutionSignaledEventAttributes")
         _list path;
     marker_recorded_event_attributes =
       option_of_yojson
         (value_for_key marker_recorded_event_attributes_of_yojson "markerRecordedEventAttributes")
         _list path;
     record_marker_failed_event_attributes =
       option_of_yojson
         (value_for_key record_marker_failed_event_attributes_of_yojson
            "recordMarkerFailedEventAttributes")
         _list path;
     timer_started_event_attributes =
       option_of_yojson
         (value_for_key timer_started_event_attributes_of_yojson "timerStartedEventAttributes")
         _list path;
     timer_fired_event_attributes =
       option_of_yojson
         (value_for_key timer_fired_event_attributes_of_yojson "timerFiredEventAttributes")
         _list path;
     timer_canceled_event_attributes =
       option_of_yojson
         (value_for_key timer_canceled_event_attributes_of_yojson "timerCanceledEventAttributes")
         _list path;
     start_child_workflow_execution_initiated_event_attributes =
       option_of_yojson
         (value_for_key start_child_workflow_execution_initiated_event_attributes_of_yojson
            "startChildWorkflowExecutionInitiatedEventAttributes")
         _list path;
     child_workflow_execution_started_event_attributes =
       option_of_yojson
         (value_for_key child_workflow_execution_started_event_attributes_of_yojson
            "childWorkflowExecutionStartedEventAttributes")
         _list path;
     child_workflow_execution_completed_event_attributes =
       option_of_yojson
         (value_for_key child_workflow_execution_completed_event_attributes_of_yojson
            "childWorkflowExecutionCompletedEventAttributes")
         _list path;
     child_workflow_execution_failed_event_attributes =
       option_of_yojson
         (value_for_key child_workflow_execution_failed_event_attributes_of_yojson
            "childWorkflowExecutionFailedEventAttributes")
         _list path;
     child_workflow_execution_timed_out_event_attributes =
       option_of_yojson
         (value_for_key child_workflow_execution_timed_out_event_attributes_of_yojson
            "childWorkflowExecutionTimedOutEventAttributes")
         _list path;
     child_workflow_execution_canceled_event_attributes =
       option_of_yojson
         (value_for_key child_workflow_execution_canceled_event_attributes_of_yojson
            "childWorkflowExecutionCanceledEventAttributes")
         _list path;
     child_workflow_execution_terminated_event_attributes =
       option_of_yojson
         (value_for_key child_workflow_execution_terminated_event_attributes_of_yojson
            "childWorkflowExecutionTerminatedEventAttributes")
         _list path;
     signal_external_workflow_execution_initiated_event_attributes =
       option_of_yojson
         (value_for_key signal_external_workflow_execution_initiated_event_attributes_of_yojson
            "signalExternalWorkflowExecutionInitiatedEventAttributes")
         _list path;
     external_workflow_execution_signaled_event_attributes =
       option_of_yojson
         (value_for_key external_workflow_execution_signaled_event_attributes_of_yojson
            "externalWorkflowExecutionSignaledEventAttributes")
         _list path;
     signal_external_workflow_execution_failed_event_attributes =
       option_of_yojson
         (value_for_key signal_external_workflow_execution_failed_event_attributes_of_yojson
            "signalExternalWorkflowExecutionFailedEventAttributes")
         _list path;
     external_workflow_execution_cancel_requested_event_attributes =
       option_of_yojson
         (value_for_key external_workflow_execution_cancel_requested_event_attributes_of_yojson
            "externalWorkflowExecutionCancelRequestedEventAttributes")
         _list path;
     request_cancel_external_workflow_execution_initiated_event_attributes =
       option_of_yojson
         (value_for_key
            request_cancel_external_workflow_execution_initiated_event_attributes_of_yojson
            "requestCancelExternalWorkflowExecutionInitiatedEventAttributes")
         _list path;
     request_cancel_external_workflow_execution_failed_event_attributes =
       option_of_yojson
         (value_for_key request_cancel_external_workflow_execution_failed_event_attributes_of_yojson
            "requestCancelExternalWorkflowExecutionFailedEventAttributes")
         _list path;
     schedule_activity_task_failed_event_attributes =
       option_of_yojson
         (value_for_key schedule_activity_task_failed_event_attributes_of_yojson
            "scheduleActivityTaskFailedEventAttributes")
         _list path;
     request_cancel_activity_task_failed_event_attributes =
       option_of_yojson
         (value_for_key request_cancel_activity_task_failed_event_attributes_of_yojson
            "requestCancelActivityTaskFailedEventAttributes")
         _list path;
     start_timer_failed_event_attributes =
       option_of_yojson
         (value_for_key start_timer_failed_event_attributes_of_yojson
            "startTimerFailedEventAttributes")
         _list path;
     cancel_timer_failed_event_attributes =
       option_of_yojson
         (value_for_key cancel_timer_failed_event_attributes_of_yojson
            "cancelTimerFailedEventAttributes")
         _list path;
     start_child_workflow_execution_failed_event_attributes =
       option_of_yojson
         (value_for_key start_child_workflow_execution_failed_event_attributes_of_yojson
            "startChildWorkflowExecutionFailedEventAttributes")
         _list path;
     lambda_function_scheduled_event_attributes =
       option_of_yojson
         (value_for_key lambda_function_scheduled_event_attributes_of_yojson
            "lambdaFunctionScheduledEventAttributes")
         _list path;
     lambda_function_started_event_attributes =
       option_of_yojson
         (value_for_key lambda_function_started_event_attributes_of_yojson
            "lambdaFunctionStartedEventAttributes")
         _list path;
     lambda_function_completed_event_attributes =
       option_of_yojson
         (value_for_key lambda_function_completed_event_attributes_of_yojson
            "lambdaFunctionCompletedEventAttributes")
         _list path;
     lambda_function_failed_event_attributes =
       option_of_yojson
         (value_for_key lambda_function_failed_event_attributes_of_yojson
            "lambdaFunctionFailedEventAttributes")
         _list path;
     lambda_function_timed_out_event_attributes =
       option_of_yojson
         (value_for_key lambda_function_timed_out_event_attributes_of_yojson
            "lambdaFunctionTimedOutEventAttributes")
         _list path;
     schedule_lambda_function_failed_event_attributes =
       option_of_yojson
         (value_for_key schedule_lambda_function_failed_event_attributes_of_yojson
            "scheduleLambdaFunctionFailedEventAttributes")
         _list path;
     start_lambda_function_failed_event_attributes =
       option_of_yojson
         (value_for_key start_lambda_function_failed_event_attributes_of_yojson
            "startLambdaFunctionFailedEventAttributes")
         _list path;
   }
    : history_event)

let history_event_list_of_yojson tree path = list_of_yojson history_event_of_yojson tree path

let decision_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_token = value_for_key task_token_of_yojson "taskToken" _list path;
     started_event_id = value_for_key event_id_of_yojson "startedEventId" _list path;
     workflow_execution = value_for_key workflow_execution_of_yojson "workflowExecution" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     events = value_for_key history_event_list_of_yojson "events" _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
     previous_started_event_id =
       option_of_yojson (value_for_key event_id_of_yojson "previousStartedEventId") _list path;
   }
    : decision_task)

let default_undefined_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : default_undefined_fault)

let type_not_deprecated_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : type_not_deprecated_fault)

let delete_activity_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     activity_type = value_for_key activity_type_of_yojson "activityType" _list path;
   }
    : delete_activity_type_input)

let delete_workflow_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
   }
    : delete_workflow_type_input)

let type_deprecated_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : type_deprecated_fault)

let deprecate_activity_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     activity_type = value_for_key activity_type_of_yojson "activityType" _list path;
   }
    : deprecate_activity_type_input)

let domain_deprecated_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : domain_deprecated_fault)

let deprecate_domain_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key domain_name_of_yojson "name" _list path } : deprecate_domain_input)

let deprecate_workflow_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
   }
    : deprecate_workflow_type_input)

let describe_activity_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     activity_type = value_for_key activity_type_of_yojson "activityType" _list path;
   }
    : describe_activity_type_input)

let duration_in_days_of_yojson = string_of_yojson

let domain_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_execution_retention_period_in_days =
       value_for_key duration_in_days_of_yojson "workflowExecutionRetentionPeriodInDays" _list path;
   }
    : domain_configuration)

let domain_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key domain_name_of_yojson "name" _list path;
     status = value_for_key registration_status_of_yojson "status" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
   }
    : domain_info)

let domain_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_info = value_for_key domain_info_of_yojson "domainInfo" _list path;
     configuration = value_for_key domain_configuration_of_yojson "configuration" _list path;
   }
    : domain_detail)

let describe_domain_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key domain_name_of_yojson "name" _list path } : describe_domain_input)

let open_decision_tasks_count_of_yojson = int_of_yojson

let workflow_execution_open_counts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     open_activity_tasks = value_for_key count_of_yojson "openActivityTasks" _list path;
     open_decision_tasks =
       value_for_key open_decision_tasks_count_of_yojson "openDecisionTasks" _list path;
     open_timers = value_for_key count_of_yojson "openTimers" _list path;
     open_child_workflow_executions =
       value_for_key count_of_yojson "openChildWorkflowExecutions" _list path;
     open_lambda_functions =
       option_of_yojson (value_for_key count_of_yojson "openLambdaFunctions") _list path;
   }
    : workflow_execution_open_counts)

let workflow_execution_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_start_to_close_timeout =
       value_for_key duration_in_seconds_of_yojson "taskStartToCloseTimeout" _list path;
     execution_start_to_close_timeout =
       value_for_key duration_in_seconds_of_yojson "executionStartToCloseTimeout" _list path;
     task_list = value_for_key task_list_of_yojson "taskList" _list path;
     task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "taskPriority") _list path;
     child_policy = value_for_key child_policy_of_yojson "childPolicy" _list path;
     lambda_role = option_of_yojson (value_for_key arn_of_yojson "lambdaRole") _list path;
   }
    : workflow_execution_configuration)

let execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPEN" -> OPEN
    | `String "CLOSED" -> CLOSED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionStatus")
     : execution_status)
    : execution_status)

let workflow_execution_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution = value_for_key workflow_execution_of_yojson "execution" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     start_timestamp = value_for_key timestamp_of_yojson "startTimestamp" _list path;
     close_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "closeTimestamp") _list path;
     execution_status = value_for_key execution_status_of_yojson "executionStatus" _list path;
     close_status = option_of_yojson (value_for_key close_status_of_yojson "closeStatus") _list path;
     parent = option_of_yojson (value_for_key workflow_execution_of_yojson "parent") _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "tagList") _list path;
     cancel_requested =
       option_of_yojson (value_for_key canceled_of_yojson "cancelRequested") _list path;
   }
    : workflow_execution_info)

let workflow_execution_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_info = value_for_key workflow_execution_info_of_yojson "executionInfo" _list path;
     execution_configuration =
       value_for_key workflow_execution_configuration_of_yojson "executionConfiguration" _list path;
     open_counts = value_for_key workflow_execution_open_counts_of_yojson "openCounts" _list path;
     latest_activity_task_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "latestActivityTaskTimestamp") _list path;
     latest_execution_context =
       option_of_yojson (value_for_key data_of_yojson "latestExecutionContext") _list path;
   }
    : workflow_execution_detail)

let describe_workflow_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     execution = value_for_key workflow_execution_of_yojson "execution" _list path;
   }
    : describe_workflow_execution_input)

let workflow_type_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_task_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultTaskStartToCloseTimeout")
         _list path;
     default_execution_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultExecutionStartToCloseTimeout")
         _list path;
     default_task_list =
       option_of_yojson (value_for_key task_list_of_yojson "defaultTaskList") _list path;
     default_task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "defaultTaskPriority") _list path;
     default_child_policy =
       option_of_yojson (value_for_key child_policy_of_yojson "defaultChildPolicy") _list path;
     default_lambda_role =
       option_of_yojson (value_for_key arn_of_yojson "defaultLambdaRole") _list path;
   }
    : workflow_type_configuration)

let workflow_type_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     status = value_for_key registration_status_of_yojson "status" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     creation_date = value_for_key timestamp_of_yojson "creationDate" _list path;
     deprecation_date =
       option_of_yojson (value_for_key timestamp_of_yojson "deprecationDate") _list path;
   }
    : workflow_type_info)

let workflow_type_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_info = value_for_key workflow_type_info_of_yojson "typeInfo" _list path;
     configuration = value_for_key workflow_type_configuration_of_yojson "configuration" _list path;
   }
    : workflow_type_detail)

let describe_workflow_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
   }
    : describe_workflow_type_input)

let domain_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : domain_already_exists_fault)

let domain_info_list_of_yojson tree path = list_of_yojson domain_info_of_yojson tree path

let domain_infos_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_infos = value_for_key domain_info_list_of_yojson "domainInfos" _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
   }
    : domain_infos)

let history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events = value_for_key history_event_list_of_yojson "events" _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
   }
    : history)

let reverse_order_of_yojson = bool_of_yojson
let page_size_of_yojson = int_of_yojson

let get_workflow_execution_history_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     execution = value_for_key workflow_execution_of_yojson "execution" _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
     maximum_page_size =
       option_of_yojson (value_for_key page_size_of_yojson "maximumPageSize") _list path;
     reverse_order =
       option_of_yojson (value_for_key reverse_order_of_yojson "reverseOrder") _list path;
   }
    : get_workflow_execution_history_input)

let limit_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_fault)

let list_activity_types_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     registration_status =
       value_for_key registration_status_of_yojson "registrationStatus" _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
     maximum_page_size =
       option_of_yojson (value_for_key page_size_of_yojson "maximumPageSize") _list path;
     reverse_order =
       option_of_yojson (value_for_key reverse_order_of_yojson "reverseOrder") _list path;
   }
    : list_activity_types_input)

let workflow_execution_info_list_of_yojson tree path =
  list_of_yojson workflow_execution_info_of_yojson tree path

let workflow_execution_infos_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_infos =
       value_for_key workflow_execution_info_list_of_yojson "executionInfos" _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
   }
    : workflow_execution_infos)

let list_closed_workflow_executions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     start_time_filter =
       option_of_yojson (value_for_key execution_time_filter_of_yojson "startTimeFilter") _list path;
     close_time_filter =
       option_of_yojson (value_for_key execution_time_filter_of_yojson "closeTimeFilter") _list path;
     execution_filter =
       option_of_yojson
         (value_for_key workflow_execution_filter_of_yojson "executionFilter")
         _list path;
     close_status_filter =
       option_of_yojson (value_for_key close_status_filter_of_yojson "closeStatusFilter") _list path;
     type_filter =
       option_of_yojson (value_for_key workflow_type_filter_of_yojson "typeFilter") _list path;
     tag_filter = option_of_yojson (value_for_key tag_filter_of_yojson "tagFilter") _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
     maximum_page_size =
       option_of_yojson (value_for_key page_size_of_yojson "maximumPageSize") _list path;
     reverse_order =
       option_of_yojson (value_for_key reverse_order_of_yojson "reverseOrder") _list path;
   }
    : list_closed_workflow_executions_input)

let list_domains_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
     registration_status =
       value_for_key registration_status_of_yojson "registrationStatus" _list path;
     maximum_page_size =
       option_of_yojson (value_for_key page_size_of_yojson "maximumPageSize") _list path;
     reverse_order =
       option_of_yojson (value_for_key reverse_order_of_yojson "reverseOrder") _list path;
   }
    : list_domains_input)

let list_open_workflow_executions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     start_time_filter = value_for_key execution_time_filter_of_yojson "startTimeFilter" _list path;
     type_filter =
       option_of_yojson (value_for_key workflow_type_filter_of_yojson "typeFilter") _list path;
     tag_filter = option_of_yojson (value_for_key tag_filter_of_yojson "tagFilter") _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
     maximum_page_size =
       option_of_yojson (value_for_key page_size_of_yojson "maximumPageSize") _list path;
     reverse_order =
       option_of_yojson (value_for_key reverse_order_of_yojson "reverseOrder") _list path;
     execution_filter =
       option_of_yojson
         (value_for_key workflow_execution_filter_of_yojson "executionFilter")
         _list path;
   }
    : list_open_workflow_executions_input)

let resource_tag_value_of_yojson = string_of_yojson
let resource_tag_key_of_yojson = string_of_yojson

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key resource_tag_key_of_yojson "key" _list path;
     value = option_of_yojson (value_for_key resource_tag_value_of_yojson "value") _list path;
   }
    : resource_tag)

let resource_tag_list_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path

let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key resource_tag_list_of_yojson "tags") _list path }
    : list_tags_for_resource_output)

let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_input)

let workflow_type_info_list_of_yojson tree path =
  list_of_yojson workflow_type_info_of_yojson tree path

let workflow_type_infos_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_infos = value_for_key workflow_type_info_list_of_yojson "typeInfos" _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
   }
    : workflow_type_infos)

let list_workflow_types_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     registration_status =
       value_for_key registration_status_of_yojson "registrationStatus" _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
     maximum_page_size =
       option_of_yojson (value_for_key page_size_of_yojson "maximumPageSize") _list path;
     reverse_order =
       option_of_yojson (value_for_key reverse_order_of_yojson "reverseOrder") _list path;
   }
    : list_workflow_types_input)

let poll_for_activity_task_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     task_list = value_for_key task_list_of_yojson "taskList" _list path;
     identity = option_of_yojson (value_for_key identity_of_yojson "identity") _list path;
   }
    : poll_for_activity_task_input)

let start_at_previous_started_event_of_yojson = bool_of_yojson

let poll_for_decision_task_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     task_list = value_for_key task_list_of_yojson "taskList" _list path;
     identity = option_of_yojson (value_for_key identity_of_yojson "identity") _list path;
     next_page_token =
       option_of_yojson (value_for_key page_token_of_yojson "nextPageToken") _list path;
     maximum_page_size =
       option_of_yojson (value_for_key page_size_of_yojson "maximumPageSize") _list path;
     reverse_order =
       option_of_yojson (value_for_key reverse_order_of_yojson "reverseOrder") _list path;
     start_at_previous_started_event =
       option_of_yojson
         (value_for_key start_at_previous_started_event_of_yojson "startAtPreviousStartedEvent")
         _list path;
   }
    : poll_for_decision_task_input)

let record_activity_task_heartbeat_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_token = value_for_key task_token_of_yojson "taskToken" _list path;
     details = option_of_yojson (value_for_key limited_data_of_yojson "details") _list path;
   }
    : record_activity_task_heartbeat_input)

let type_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : type_already_exists_fault)

let register_activity_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     name = value_for_key name_of_yojson "name" _list path;
     version = value_for_key version_of_yojson "version" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     default_task_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultTaskStartToCloseTimeout")
         _list path;
     default_task_heartbeat_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultTaskHeartbeatTimeout")
         _list path;
     default_task_list =
       option_of_yojson (value_for_key task_list_of_yojson "defaultTaskList") _list path;
     default_task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "defaultTaskPriority") _list path;
     default_task_schedule_to_start_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultTaskScheduleToStartTimeout")
         _list path;
     default_task_schedule_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultTaskScheduleToCloseTimeout")
         _list path;
   }
    : register_activity_type_input)

let too_many_tags_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : too_many_tags_fault)

let register_domain_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key domain_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     workflow_execution_retention_period_in_days =
       value_for_key duration_in_days_of_yojson "workflowExecutionRetentionPeriodInDays" _list path;
     tags = option_of_yojson (value_for_key resource_tag_list_of_yojson "tags") _list path;
   }
    : register_domain_input)

let register_workflow_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     name = value_for_key name_of_yojson "name" _list path;
     version = value_for_key version_of_yojson "version" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     default_task_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultTaskStartToCloseTimeout")
         _list path;
     default_execution_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "defaultExecutionStartToCloseTimeout")
         _list path;
     default_task_list =
       option_of_yojson (value_for_key task_list_of_yojson "defaultTaskList") _list path;
     default_task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "defaultTaskPriority") _list path;
     default_child_policy =
       option_of_yojson (value_for_key child_policy_of_yojson "defaultChildPolicy") _list path;
     default_lambda_role =
       option_of_yojson (value_for_key arn_of_yojson "defaultLambdaRole") _list path;
   }
    : register_workflow_type_input)

let request_cancel_workflow_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     run_id = option_of_yojson (value_for_key workflow_run_id_optional_of_yojson "runId") _list path;
   }
    : request_cancel_workflow_execution_input)

let resource_tag_key_list_of_yojson tree path = list_of_yojson resource_tag_key_of_yojson tree path

let respond_activity_task_canceled_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_token = value_for_key task_token_of_yojson "taskToken" _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
   }
    : respond_activity_task_canceled_input)

let respond_activity_task_completed_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_token = value_for_key task_token_of_yojson "taskToken" _list path;
     result_ = option_of_yojson (value_for_key data_of_yojson "result") _list path;
   }
    : respond_activity_task_completed_input)

let respond_activity_task_failed_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_token = value_for_key task_token_of_yojson "taskToken" _list path;
     reason = option_of_yojson (value_for_key failure_reason_of_yojson "reason") _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
   }
    : respond_activity_task_failed_input)

let respond_decision_task_completed_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_token = value_for_key task_token_of_yojson "taskToken" _list path;
     decisions = option_of_yojson (value_for_key decision_list_of_yojson "decisions") _list path;
     execution_context =
       option_of_yojson (value_for_key data_of_yojson "executionContext") _list path;
     task_list = option_of_yojson (value_for_key task_list_of_yojson "taskList") _list path;
     task_list_schedule_to_start_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "taskListScheduleToStartTimeout")
         _list path;
   }
    : respond_decision_task_completed_input)

let run_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run_id = option_of_yojson (value_for_key workflow_run_id_of_yojson "runId") _list path } : run)

let signal_workflow_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     run_id = option_of_yojson (value_for_key workflow_run_id_optional_of_yojson "runId") _list path;
     signal_name = value_for_key signal_name_of_yojson "signalName" _list path;
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
   }
    : signal_workflow_execution_input)

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
     tag_keys = value_for_key resource_tag_key_list_of_yojson "tagKeys" _list path;
   }
    : untag_resource_input)

let undeprecate_workflow_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
   }
    : undeprecate_workflow_type_input)

let undeprecate_domain_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key domain_name_of_yojson "name" _list path } : undeprecate_domain_input)

let undeprecate_activity_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     activity_type = value_for_key activity_type_of_yojson "activityType" _list path;
   }
    : undeprecate_activity_type_input)

let terminate_workflow_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     run_id = option_of_yojson (value_for_key workflow_run_id_optional_of_yojson "runId") _list path;
     reason = option_of_yojson (value_for_key terminate_reason_of_yojson "reason") _list path;
     details = option_of_yojson (value_for_key data_of_yojson "details") _list path;
     child_policy = option_of_yojson (value_for_key child_policy_of_yojson "childPolicy") _list path;
   }
    : terminate_workflow_execution_input)

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
     tags = value_for_key resource_tag_list_of_yojson "tags" _list path;
   }
    : tag_resource_input)

let workflow_execution_already_started_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : workflow_execution_already_started_fault)

let start_workflow_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain = value_for_key domain_name_of_yojson "domain" _list path;
     workflow_id = value_for_key workflow_id_of_yojson "workflowId" _list path;
     workflow_type = value_for_key workflow_type_of_yojson "workflowType" _list path;
     task_list = option_of_yojson (value_for_key task_list_of_yojson "taskList") _list path;
     task_priority =
       option_of_yojson (value_for_key task_priority_of_yojson "taskPriority") _list path;
     input = option_of_yojson (value_for_key data_of_yojson "input") _list path;
     execution_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "executionStartToCloseTimeout")
         _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "tagList") _list path;
     task_start_to_close_timeout =
       option_of_yojson
         (value_for_key duration_in_seconds_optional_of_yojson "taskStartToCloseTimeout")
         _list path;
     child_policy = option_of_yojson (value_for_key child_policy_of_yojson "childPolicy") _list path;
     lambda_role = option_of_yojson (value_for_key arn_of_yojson "lambdaRole") _list path;
   }
    : start_workflow_execution_input)
