open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec workflow_type = {
  version: string ;
  name: string }[@@ocaml.doc "Represents a workflow type.\n"]
type nonrec registration_status =
  | DEPRECATED 
  | REGISTERED [@@ocaml.doc ""]
type nonrec workflow_type_info =
  {
  deprecation_date: CoreTypes.Timestamp.t option ;
  creation_date: CoreTypes.Timestamp.t ;
  description: string option ;
  status: registration_status ;
  workflow_type: workflow_type }[@@ocaml.doc
                                  "Contains information about a workflow type.\n"]
type nonrec workflow_type_infos =
  {
  next_page_token: string option ;
  type_infos: workflow_type_info list }[@@ocaml.doc
                                         "Contains a paginated list of information structures about workflow types.\n"]
type nonrec workflow_type_filter = {
  version: string option ;
  name: string }[@@ocaml.doc
                  "Used to filter workflow execution query results by type. Each parameter, if specified, defines a rule that must be satisfied by each returned result.\n"]
type nonrec task_list = {
  name: string }[@@ocaml.doc "Represents a task list.\n"]
type nonrec child_policy =
  | ABANDON 
  | REQUEST_CANCEL 
  | TERMINATE [@@ocaml.doc ""]
type nonrec workflow_type_configuration =
  {
  default_lambda_role: string option ;
  default_child_policy: child_policy option ;
  default_task_priority: string option ;
  default_task_list: task_list option ;
  default_execution_start_to_close_timeout: string option ;
  default_task_start_to_close_timeout: string option }[@@ocaml.doc
                                                        "The configuration settings of a workflow type.\n"]
type nonrec workflow_type_detail =
  {
  configuration: workflow_type_configuration ;
  type_info: workflow_type_info }[@@ocaml.doc
                                   "Contains details about a workflow type.\n"]
type nonrec workflow_execution_timeout_type =
  | START_TO_CLOSE [@@ocaml.doc ""]
type nonrec workflow_execution_timed_out_event_attributes =
  {
  child_policy: child_policy ;
  timeout_type: workflow_execution_timeout_type }[@@ocaml.doc
                                                   "Provides the details of the [WorkflowExecutionTimedOut] event.\n"]
type nonrec workflow_execution_terminated_cause =
  | OPERATOR_INITIATED 
  | EVENT_LIMIT_EXCEEDED 
  | CHILD_POLICY_APPLIED [@@ocaml.doc ""]
type nonrec workflow_execution_terminated_event_attributes =
  {
  cause: workflow_execution_terminated_cause option ;
  child_policy: child_policy ;
  details: string option ;
  reason: string option }[@@ocaml.doc
                           "Provides the details of the [WorkflowExecutionTerminated] event.\n"]
type nonrec workflow_execution = {
  run_id: string ;
  workflow_id: string }[@@ocaml.doc "Represents a workflow execution.\n"]
type nonrec workflow_execution_started_event_attributes =
  {
  lambda_role: string option ;
  parent_initiated_event_id: int option ;
  parent_workflow_execution: workflow_execution option ;
  continued_execution_run_id: string option ;
  tag_list: string list option ;
  workflow_type: workflow_type ;
  task_priority: string option ;
  task_list: task_list ;
  child_policy: child_policy ;
  task_start_to_close_timeout: string option ;
  execution_start_to_close_timeout: string option ;
  input: string option }[@@ocaml.doc
                          "Provides details of [WorkflowExecutionStarted] event.\n"]
type nonrec workflow_execution_signaled_event_attributes =
  {
  external_initiated_event_id: int option ;
  external_workflow_execution: workflow_execution option ;
  input: string option ;
  signal_name: string }[@@ocaml.doc
                         "Provides the details of the [WorkflowExecutionSignaled] event.\n"]
type nonrec workflow_execution_open_counts =
  {
  open_lambda_functions: int option ;
  open_child_workflow_executions: int ;
  open_timers: int ;
  open_decision_tasks: int ;
  open_activity_tasks: int }[@@ocaml.doc
                              "Contains the counts of open tasks, child workflow executions and timers for a workflow execution.\n"]
type nonrec execution_status =
  | CLOSED 
  | OPEN [@@ocaml.doc ""]
type nonrec close_status =
  | TIMED_OUT 
  | CONTINUED_AS_NEW 
  | TERMINATED 
  | CANCELED 
  | FAILED 
  | COMPLETED [@@ocaml.doc ""]
type nonrec workflow_execution_info =
  {
  cancel_requested: bool option ;
  tag_list: string list option ;
  parent: workflow_execution option ;
  close_status: close_status option ;
  execution_status: execution_status ;
  close_timestamp: CoreTypes.Timestamp.t option ;
  start_timestamp: CoreTypes.Timestamp.t ;
  workflow_type: workflow_type ;
  execution: workflow_execution }[@@ocaml.doc
                                   "Contains information about a workflow execution.\n"]
type nonrec workflow_execution_infos =
  {
  next_page_token: string option ;
  execution_infos: workflow_execution_info list }[@@ocaml.doc
                                                   "Contains a paginated list of information about workflow executions.\n"]
type nonrec workflow_execution_filter = {
  workflow_id: string }[@@ocaml.doc
                         "Used to filter the workflow executions in visibility APIs by their [workflowId].\n"]
type nonrec workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  details: string option ;
  reason: string option }[@@ocaml.doc
                           "Provides the details of the [WorkflowExecutionFailed] event.\n"]
type nonrec workflow_execution_configuration =
  {
  lambda_role: string option ;
  child_policy: child_policy ;
  task_priority: string option ;
  task_list: task_list ;
  execution_start_to_close_timeout: string ;
  task_start_to_close_timeout: string }[@@ocaml.doc
                                         "The configuration settings for a workflow execution including timeout values, tasklist etc. These configuration settings are determined from the defaults specified when registering the workflow type and those specified when starting the workflow execution.\n"]
type nonrec workflow_execution_detail =
  {
  latest_execution_context: string option ;
  latest_activity_task_timestamp: CoreTypes.Timestamp.t option ;
  open_counts: workflow_execution_open_counts ;
  execution_configuration: workflow_execution_configuration ;
  execution_info: workflow_execution_info }[@@ocaml.doc
                                             "Contains details about a workflow execution.\n"]
type nonrec workflow_execution_count = {
  truncated: bool option ;
  count: int }[@@ocaml.doc
                "Contains the count of workflow executions returned from [CountOpenWorkflowExecutions] or [CountClosedWorkflowExecutions] \n"]
type nonrec workflow_execution_continued_as_new_event_attributes =
  {
  lambda_role: string option ;
  workflow_type: workflow_type ;
  tag_list: string list option ;
  child_policy: child_policy ;
  task_start_to_close_timeout: string option ;
  task_priority: string option ;
  task_list: task_list ;
  execution_start_to_close_timeout: string option ;
  new_execution_run_id: string ;
  decision_task_completed_event_id: int ;
  input: string option }[@@ocaml.doc
                          "Provides the details of the [WorkflowExecutionContinuedAsNew] event.\n"]
type nonrec workflow_execution_completed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  result: string option }[@@ocaml.doc
                           "Provides the details of the [WorkflowExecutionCompleted] event.\n"]
type nonrec workflow_execution_canceled_event_attributes =
  {
  decision_task_completed_event_id: int ;
  details: string option }[@@ocaml.doc
                            "Provides the details of the [WorkflowExecutionCanceled] event.\n"]
type nonrec workflow_execution_cancel_requested_cause =
  | CHILD_POLICY_APPLIED [@@ocaml.doc ""]
type nonrec workflow_execution_cancel_requested_event_attributes =
  {
  cause: workflow_execution_cancel_requested_cause option ;
  external_initiated_event_id: int option ;
  external_workflow_execution: workflow_execution option }[@@ocaml.doc
                                                            "Provides the details of the [WorkflowExecutionCancelRequested] event.\n"]
type nonrec workflow_execution_already_started_fault =
  {
  message: string option }[@@ocaml.doc
                            "Returned by [StartWorkflowExecution] when an open execution with the same workflowId is already running in the specified domain.\n"]
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec unknown_resource_fault = {
  message: string option }[@@ocaml.doc
                            "Returned when the named resource cannot be found with in the scope of this operation (region or domain). This could happen if the named resource was never created or is no longer available for this operation.\n"]
type nonrec operation_not_permitted_fault = {
  message: string option }[@@ocaml.doc
                            "Returned when the caller doesn't have sufficient permissions to invoke the action.\n"]
type nonrec limit_exceeded_fault = {
  message: string option }[@@ocaml.doc
                            "Returned by any operation if a system imposed limitation has been reached. To address this fault you should either clean up unused resources or increase the limit by contacting AWS.\n"]
type nonrec undeprecate_workflow_type_input =
  {
  workflow_type: workflow_type ;
  domain: string }[@@ocaml.doc ""]
type nonrec type_already_exists_fault = {
  message: string option }[@@ocaml.doc
                            "Returned if the type already exists in the specified domain. You may get this fault if you are registering a type that is either already registered or deprecated, or if you undeprecate a type that is currently registered.\n"]
type nonrec undeprecate_domain_input = {
  name: string }[@@ocaml.doc ""]
type nonrec domain_already_exists_fault = {
  message: string option }[@@ocaml.doc
                            "Returned if the domain already exists. You may get this fault if you are registering a domain that is either already registered or deprecated, or if you undeprecate a domain that is currently registered.\n"]
type nonrec activity_type = {
  version: string ;
  name: string }[@@ocaml.doc "Represents an activity type.\n"]
type nonrec undeprecate_activity_type_input =
  {
  activity_type: activity_type ;
  domain: string }[@@ocaml.doc ""]
type nonrec type_not_deprecated_fault = {
  message: string option }[@@ocaml.doc
                            "Returned when the resource type has not been deprecated.\n"]
type nonrec type_deprecated_fault = {
  message: string option }[@@ocaml.doc
                            "Returned when the specified activity or workflow type was already deprecated.\n"]
type nonrec too_many_tags_fault = {
  message: string option }[@@ocaml.doc
                            "You've exceeded the number of tags allowed for a domain.\n"]
type nonrec timer_started_event_attributes =
  {
  decision_task_completed_event_id: int ;
  start_to_fire_timeout: string ;
  control: string option ;
  timer_id: string }[@@ocaml.doc
                      "Provides the details of the [TimerStarted] event.\n"]
type nonrec timer_fired_event_attributes =
  {
  started_event_id: int ;
  timer_id: string }[@@ocaml.doc
                      "Provides the details of the [TimerFired] event.\n"]
type nonrec timer_canceled_event_attributes =
  {
  decision_task_completed_event_id: int ;
  started_event_id: int ;
  timer_id: string }[@@ocaml.doc
                      " Provides the details of the [TimerCanceled] event. \n"]
type nonrec terminate_workflow_execution_input =
  {
  child_policy: child_policy option ;
  details: string option ;
  reason: string option ;
  run_id: string option ;
  workflow_id: string ;
  domain: string }[@@ocaml.doc ""]
type nonrec resource_tag = {
  value: string option ;
  key: string }[@@ocaml.doc
                 "Tags are key-value pairs that can be associated with Amazon SWF state machines and activities.\n\n Tags may only contain unicode letters, digits, whitespace, or these symbols: [_ . : / = + - @].\n "]
type nonrec tag_resource_input =
  {
  tags: resource_tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec tag_filter = {
  tag: string }[@@ocaml.doc
                 "Used to filter the workflow executions in visibility APIs based on a tag.\n"]
type nonrec start_workflow_execution_input =
  {
  lambda_role: string option ;
  child_policy: child_policy option ;
  task_start_to_close_timeout: string option ;
  tag_list: string list option ;
  execution_start_to_close_timeout: string option ;
  input: string option ;
  task_priority: string option ;
  task_list: task_list option ;
  workflow_type: workflow_type ;
  workflow_id: string ;
  domain: string }[@@ocaml.doc ""]
type nonrec default_undefined_fault = {
  message: string option }[@@ocaml.doc
                            "The [StartWorkflowExecution] API action was called without the required parameters set.\n\n Some workflow execution parameters, such as the decision [taskList], must be set to start the execution. However, these parameters might have been set as defaults when the workflow type was registered. In this case, you can omit these parameters from the [StartWorkflowExecution] call and Amazon SWF uses the values defined in the workflow type.\n \n   If these parameters aren't set and no default parameters were defined in the workflow type, this error is displayed.\n   \n    "]
type nonrec run = {
  run_id: string option }[@@ocaml.doc
                           "Specifies the [runId] of a workflow execution.\n"]
type nonrec start_timer_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | TIMER_CREATION_RATE_EXCEEDED 
  | OPEN_TIMERS_LIMIT_EXCEEDED 
  | TIMER_ID_ALREADY_IN_USE [@@ocaml.doc ""]
type nonrec start_timer_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: start_timer_failed_cause ;
  timer_id: string }[@@ocaml.doc
                      "Provides the details of the [StartTimerFailed] event.\n"]
type nonrec start_timer_decision_attributes =
  {
  start_to_fire_timeout: string ;
  control: string option ;
  timer_id: string }[@@ocaml.doc
                      "Provides the details of the [StartTimer] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec start_lambda_function_failed_cause =
  | ASSUME_ROLE_FAILED [@@ocaml.doc ""]
type nonrec start_lambda_function_failed_event_attributes =
  {
  message: string option ;
  cause: start_lambda_function_failed_cause option ;
  scheduled_event_id: int option }[@@ocaml.doc
                                    "Provides the details of the [StartLambdaFunctionFailed] event. It isn't set for other event types.\n"]
type nonrec start_child_workflow_execution_initiated_event_attributes =
  {
  lambda_role: string option ;
  tag_list: string list option ;
  task_start_to_close_timeout: string option ;
  child_policy: child_policy ;
  decision_task_completed_event_id: int ;
  task_priority: string option ;
  task_list: task_list ;
  execution_start_to_close_timeout: string option ;
  input: string option ;
  control: string option ;
  workflow_type: workflow_type ;
  workflow_id: string }[@@ocaml.doc
                         "Provides the details of the [StartChildWorkflowExecutionInitiated] event.\n"]
type nonrec start_child_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | DEFAULT_CHILD_POLICY_UNDEFINED 
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED 
  | DEFAULT_TASK_LIST_UNDEFINED 
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED 
  | WORKFLOW_ALREADY_RUNNING 
  | CHILD_CREATION_RATE_EXCEEDED 
  | OPEN_WORKFLOWS_LIMIT_EXCEEDED 
  | OPEN_CHILDREN_LIMIT_EXCEEDED 
  | WORKFLOW_TYPE_DEPRECATED 
  | WORKFLOW_TYPE_DOES_NOT_EXIST [@@ocaml.doc ""]
type nonrec start_child_workflow_execution_failed_event_attributes =
  {
  control: string option ;
  decision_task_completed_event_id: int ;
  initiated_event_id: int ;
  workflow_id: string ;
  cause: start_child_workflow_execution_failed_cause ;
  workflow_type: workflow_type }[@@ocaml.doc
                                  "Provides the details of the [StartChildWorkflowExecutionFailed] event.\n"]
type nonrec start_child_workflow_execution_decision_attributes =
  {
  lambda_role: string option ;
  tag_list: string list option ;
  child_policy: child_policy option ;
  task_start_to_close_timeout: string option ;
  task_priority: string option ;
  task_list: task_list option ;
  execution_start_to_close_timeout: string option ;
  input: string option ;
  control: string option ;
  workflow_id: string ;
  workflow_type: workflow_type }[@@ocaml.doc
                                  "Provides the details of the [StartChildWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [tagList.member.N] \226\128\147 The key is \"swf:tagList.N\" where N is the tag number from 0 to 4, inclusive.\n                        \n                         }\n                    {-   [taskList] \226\128\147 String constraint. The key is [swf:taskList.name].\n                        \n                         }\n                    {-   [workflowType.name] \226\128\147 String constraint. The key is [swf:workflowType.name].\n                        \n                         }\n                    {-   [workflowType.version] \226\128\147 String constraint. The key is [swf:workflowType.version].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec signal_workflow_execution_input =
  {
  input: string option ;
  signal_name: string ;
  run_id: string option ;
  workflow_id: string ;
  domain: string }[@@ocaml.doc ""]
type nonrec decision_type =
  | ScheduleLambdaFunction 
  | StartChildWorkflowExecution 
  | RequestCancelExternalWorkflowExecution 
  | SignalExternalWorkflowExecution 
  | CancelTimer 
  | StartTimer 
  | RecordMarker 
  | ContinueAsNewWorkflowExecution 
  | CancelWorkflowExecution 
  | FailWorkflowExecution 
  | CompleteWorkflowExecution 
  | RequestCancelActivityTask 
  | ScheduleActivityTask [@@ocaml.doc ""]
type nonrec schedule_activity_task_decision_attributes =
  {
  heartbeat_timeout: string option ;
  start_to_close_timeout: string option ;
  schedule_to_start_timeout: string option ;
  task_priority: string option ;
  task_list: task_list option ;
  schedule_to_close_timeout: string option ;
  input: string option ;
  control: string option ;
  activity_id: string ;
  activity_type: activity_type }[@@ocaml.doc
                                  "Provides the details of the [ScheduleActivityTask] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [activityType.name] \226\128\147 String constraint. The key is [swf:activityType.name].\n                        \n                         }\n                    {-   [activityType.version] \226\128\147 String constraint. The key is [swf:activityType.version].\n                        \n                         }\n                    {-   [taskList] \226\128\147 String constraint. The key is [swf:taskList.name].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec request_cancel_activity_task_decision_attributes =
  {
  activity_id: string }[@@ocaml.doc
                         "Provides the details of the [RequestCancelActivityTask] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec complete_workflow_execution_decision_attributes =
  {
  result: string option }[@@ocaml.doc
                           "Provides the details of the [CompleteWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec fail_workflow_execution_decision_attributes =
  {
  details: string option ;
  reason: string option }[@@ocaml.doc
                           "Provides the details of the [FailWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec cancel_workflow_execution_decision_attributes =
  {
  details: string option }[@@ocaml.doc
                            "Provides the details of the [CancelWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec continue_as_new_workflow_execution_decision_attributes =
  {
  lambda_role: string option ;
  workflow_type_version: string option ;
  tag_list: string list option ;
  child_policy: child_policy option ;
  task_start_to_close_timeout: string option ;
  task_priority: string option ;
  task_list: task_list option ;
  execution_start_to_close_timeout: string option ;
  input: string option }[@@ocaml.doc
                          "Provides the details of the [ContinueAsNewWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [tag] \226\128\147 A tag used to identify the workflow execution\n                        \n                         }\n                    {-   [taskList] \226\128\147 String constraint. The key is [swf:taskList.name].\n                        \n                         }\n                    {-   [workflowType.version] \226\128\147 String constraint. The key is [swf:workflowType.version].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec record_marker_decision_attributes =
  {
  details: string option ;
  marker_name: string }[@@ocaml.doc
                         "Provides the details of the [RecordMarker] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec cancel_timer_decision_attributes = {
  timer_id: string }[@@ocaml.doc
                      "Provides the details of the [CancelTimer] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec signal_external_workflow_execution_decision_attributes =
  {
  control: string option ;
  input: string option ;
  signal_name: string ;
  run_id: string option ;
  workflow_id: string }[@@ocaml.doc
                         "Provides the details of the [SignalExternalWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec request_cancel_external_workflow_execution_decision_attributes =
  {
  control: string option ;
  run_id: string option ;
  workflow_id: string }[@@ocaml.doc
                         "Provides the details of the [RequestCancelExternalWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec schedule_lambda_function_decision_attributes =
  {
  start_to_close_timeout: string option ;
  input: string option ;
  control: string option ;
  name: string ;
  id: string }[@@ocaml.doc
                "Decision attributes specified in [scheduleLambdaFunctionDecisionAttributes] within the list of decisions [decisions] passed to [RespondDecisionTaskCompleted].\n"]
type nonrec decision =
  {
  schedule_lambda_function_decision_attributes:
    schedule_lambda_function_decision_attributes option ;
  start_child_workflow_execution_decision_attributes:
    start_child_workflow_execution_decision_attributes option ;
  request_cancel_external_workflow_execution_decision_attributes:
    request_cancel_external_workflow_execution_decision_attributes option ;
  signal_external_workflow_execution_decision_attributes:
    signal_external_workflow_execution_decision_attributes option ;
  cancel_timer_decision_attributes: cancel_timer_decision_attributes option ;
  start_timer_decision_attributes: start_timer_decision_attributes option ;
  record_marker_decision_attributes: record_marker_decision_attributes option ;
  continue_as_new_workflow_execution_decision_attributes:
    continue_as_new_workflow_execution_decision_attributes option ;
  cancel_workflow_execution_decision_attributes:
    cancel_workflow_execution_decision_attributes option ;
  fail_workflow_execution_decision_attributes:
    fail_workflow_execution_decision_attributes option ;
  complete_workflow_execution_decision_attributes:
    complete_workflow_execution_decision_attributes option ;
  request_cancel_activity_task_decision_attributes:
    request_cancel_activity_task_decision_attributes option ;
  schedule_activity_task_decision_attributes:
    schedule_activity_task_decision_attributes option ;
  decision_type: decision_type }[@@ocaml.doc
                                  "Specifies a decision made by the decider. A decision can be one of these types:\n\n {ul\n       {-   [CancelTimer] \226\128\147 Cancels a previously started timer and records a [TimerCanceled] event in the history.\n           \n            }\n       {-   [CancelWorkflowExecution] \226\128\147 Closes the workflow execution and records a [WorkflowExecutionCanceled] event in the history.\n           \n            }\n       {-   [CompleteWorkflowExecution] \226\128\147 Closes the workflow execution and records a [WorkflowExecutionCompleted] event in the history .\n           \n            }\n       {-   [ContinueAsNewWorkflowExecution] \226\128\147 Closes the workflow execution and starts a new workflow execution of the same type using the same workflow ID and a unique run Id. A [WorkflowExecutionContinuedAsNew] event is recorded in the history.\n           \n            }\n       {-   [FailWorkflowExecution] \226\128\147 Closes the workflow execution and records a [WorkflowExecutionFailed] event in the history.\n           \n            }\n       {-   [RecordMarker] \226\128\147 Records a [MarkerRecorded] event in the history. Markers can be used for adding custom information in the history for instance to let deciders know that they don't need to look at the history beyond the marker event.\n           \n            }\n       {-   [RequestCancelActivityTask] \226\128\147 Attempts to cancel a previously scheduled activity task. If the activity task was scheduled but has not been assigned to a worker, then it is canceled. If the activity task was already assigned to a worker, then the worker is informed that cancellation has been requested in the response to [RecordActivityTaskHeartbeat].\n           \n            }\n       {-   [RequestCancelExternalWorkflowExecution] \226\128\147 Requests that a request be made to cancel the specified external workflow execution and records a [RequestCancelExternalWorkflowExecutionInitiated] event in the history.\n           \n            }\n       {-   [ScheduleActivityTask] \226\128\147 Schedules an activity task.\n           \n            }\n       {-   [SignalExternalWorkflowExecution] \226\128\147 Requests a signal to be delivered to the specified external workflow execution and records a [SignalExternalWorkflowExecutionInitiated] event in the history.\n           \n            }\n       {-   [StartChildWorkflowExecution] \226\128\147 Requests that a child workflow execution be started and records a [StartChildWorkflowExecutionInitiated] event in the history. The child workflow execution is a separate workflow execution with its own history.\n           \n            }\n       {-   [StartTimer] \226\128\147 Starts a timer for this workflow execution and records a [TimerStarted] event in the history. This timer fires after the specified delay and record a [TimerFired] event.\n           \n            }\n       }\n    {b Access Control} \n   \n    If you grant permission to use [RespondDecisionTaskCompleted], you can use IAM policies to express permissions for the list of decisions returned by this action as if they were members of the API. Treating decisions as a pseudo API maintains a uniform conceptual model and helps keep policies readable. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n    \n      {b Decision Failure} \n     \n      Decisions can fail for several reasons\n      \n       {ul\n             {-  The ordering of decisions should follow a logical flow. Some decisions might not make sense in the current context of the workflow execution and therefore fails.\n                 \n                  }\n             {-  A limit on your account was reached.\n                 \n                  }\n             {-  The decision lacks sufficient permissions.\n                 \n                  }\n             }\n   One of the following events might be added to the history to indicate an error. The event attribute's [cause] parameter indicates the cause. If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   \n    {ul\n          {-   [ScheduleActivityTaskFailed] \226\128\147 A [ScheduleActivityTask] decision failed. This could happen if the activity type specified in the decision isn't registered, is in a deprecated state, or the decision isn't properly configured.\n              \n               }\n          {-   [RequestCancelActivityTaskFailed] \226\128\147 A [RequestCancelActivityTask] decision failed. This could happen if there is no open activity task with the specified activityId.\n              \n               }\n          {-   [StartTimerFailed] \226\128\147 A [StartTimer] decision failed. This could happen if there is another open timer with the same timerId.\n              \n               }\n          {-   [CancelTimerFailed] \226\128\147 A [CancelTimer] decision failed. This could happen if there is no open timer with the specified timerId.\n              \n               }\n          {-   [StartChildWorkflowExecutionFailed] \226\128\147 A [StartChildWorkflowExecution] decision failed. This could happen if the workflow type specified isn't registered, is deprecated, or the decision isn't properly configured.\n              \n               }\n          {-   [SignalExternalWorkflowExecutionFailed] \226\128\147 A [SignalExternalWorkflowExecution] decision failed. This could happen if the [workflowID] specified in the decision was incorrect.\n              \n               }\n          {-   [RequestCancelExternalWorkflowExecutionFailed] \226\128\147 A [RequestCancelExternalWorkflowExecution] decision failed. This could happen if the [workflowID] specified in the decision was incorrect.\n              \n               }\n          {-   [CancelWorkflowExecutionFailed] \226\128\147 A [CancelWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution.\n              \n               }\n          {-   [CompleteWorkflowExecutionFailed] \226\128\147 A [CompleteWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution.\n              \n               }\n          {-   [ContinueAsNewWorkflowExecutionFailed] \226\128\147 A [ContinueAsNewWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution or the ContinueAsNewWorkflowExecution decision was not configured correctly.\n              \n               }\n          {-   [FailWorkflowExecutionFailed] \226\128\147 A [FailWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution.\n              \n               }\n          }\n   The preceding error events might occur due to an error in the decider logic, which might put the workflow execution in an unstable state The cause field in the event structure for the error event indicates the cause of the error.\n   \n     A workflow execution may be closed by the decider by returning one of the following decisions when completing a decision task: [CompleteWorkflowExecution], [FailWorkflowExecution], [CancelWorkflowExecution] and [ContinueAsNewWorkflowExecution]. An [UnhandledDecision] fault is returned if a workflow closing decision is specified and a signal or activity event had been added to the history while the decision task was being performed by the decider. Unlike the above situations which are logic issues, this fault is always possible because of race conditions in a distributed system. The right action here is to call [RespondDecisionTaskCompleted] without any decisions. This would result in another decision task with these new events included in the history. The decider should handle the new events and may decide to close the workflow execution.\n     \n        {b How to Code a Decision} \n       \n        You code a decision by first setting the decision type field to one of the above decision values, and then set the corresponding attributes field shown below:\n        \n         {ul\n               {-   \n                   {[\n                    [ScheduleActivityTaskDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [RequestCancelActivityTaskDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [CompleteWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [FailWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [CancelWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [ContinueAsNewWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [RecordMarkerDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [StartTimerDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [CancelTimerDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [SignalExternalWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [RequestCancelExternalWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [StartChildWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               }\n  "]
type nonrec respond_decision_task_completed_input =
  {
  task_list_schedule_to_start_timeout: string option ;
  task_list: task_list option ;
  execution_context: string option ;
  decisions: decision list option ;
  task_token: string }[@@ocaml.doc
                        "Input data for a TaskCompleted response to a decision task.\n"]
type nonrec respond_activity_task_failed_input =
  {
  details: string option ;
  reason: string option ;
  task_token: string }[@@ocaml.doc ""]
type nonrec respond_activity_task_completed_input =
  {
  result: string option ;
  task_token: string }[@@ocaml.doc ""]
type nonrec respond_activity_task_canceled_input =
  {
  details: string option ;
  task_token: string }[@@ocaml.doc ""]
type nonrec request_cancel_workflow_execution_input =
  {
  run_id: string option ;
  workflow_id: string ;
  domain: string }[@@ocaml.doc ""]
type nonrec register_workflow_type_input =
  {
  default_lambda_role: string option ;
  default_child_policy: child_policy option ;
  default_task_priority: string option ;
  default_task_list: task_list option ;
  default_execution_start_to_close_timeout: string option ;
  default_task_start_to_close_timeout: string option ;
  description: string option ;
  version: string ;
  name: string ;
  domain: string }[@@ocaml.doc ""]
type nonrec register_domain_input =
  {
  tags: resource_tag list option ;
  workflow_execution_retention_period_in_days: string ;
  description: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec register_activity_type_input =
  {
  default_task_schedule_to_close_timeout: string option ;
  default_task_schedule_to_start_timeout: string option ;
  default_task_priority: string option ;
  default_task_list: task_list option ;
  default_task_heartbeat_timeout: string option ;
  default_task_start_to_close_timeout: string option ;
  description: string option ;
  version: string ;
  name: string ;
  domain: string }[@@ocaml.doc ""]
type nonrec activity_task_status = {
  cancel_requested: bool }[@@ocaml.doc
                            "Status information about an activity task.\n"]
type nonrec record_activity_task_heartbeat_input =
  {
  details: string option ;
  task_token: string }[@@ocaml.doc ""]
type nonrec event_type =
  | StartLambdaFunctionFailed 
  | ScheduleLambdaFunctionFailed 
  | LambdaFunctionTimedOut 
  | LambdaFunctionFailed 
  | LambdaFunctionCompleted 
  | LambdaFunctionStarted 
  | LambdaFunctionScheduled 
  | ExternalWorkflowExecutionCancelRequested 
  | RequestCancelExternalWorkflowExecutionFailed 
  | RequestCancelExternalWorkflowExecutionInitiated 
  | ExternalWorkflowExecutionSignaled 
  | SignalExternalWorkflowExecutionFailed 
  | SignalExternalWorkflowExecutionInitiated 
  | ChildWorkflowExecutionTerminated 
  | ChildWorkflowExecutionCanceled 
  | ChildWorkflowExecutionTimedOut 
  | ChildWorkflowExecutionFailed 
  | ChildWorkflowExecutionCompleted 
  | ChildWorkflowExecutionStarted 
  | StartChildWorkflowExecutionFailed 
  | StartChildWorkflowExecutionInitiated 
  | CancelTimerFailed 
  | TimerCanceled 
  | TimerFired 
  | StartTimerFailed 
  | TimerStarted 
  | RecordMarkerFailed 
  | MarkerRecorded 
  | WorkflowExecutionSignaled 
  | RequestCancelActivityTaskFailed 
  | ActivityTaskCancelRequested 
  | ActivityTaskCanceled 
  | ActivityTaskTimedOut 
  | ActivityTaskFailed 
  | ActivityTaskCompleted 
  | ActivityTaskStarted 
  | ScheduleActivityTaskFailed 
  | ActivityTaskScheduled 
  | DecisionTaskTimedOut 
  | DecisionTaskCompleted 
  | DecisionTaskStarted 
  | DecisionTaskScheduled 
  | WorkflowExecutionTerminated 
  | ContinueAsNewWorkflowExecutionFailed 
  | WorkflowExecutionContinuedAsNew 
  | CancelWorkflowExecutionFailed 
  | WorkflowExecutionCanceled 
  | WorkflowExecutionTimedOut 
  | FailWorkflowExecutionFailed 
  | WorkflowExecutionFailed 
  | CompleteWorkflowExecutionFailed 
  | WorkflowExecutionCompleted 
  | WorkflowExecutionCancelRequested 
  | WorkflowExecutionStarted [@@ocaml.doc ""]
type nonrec complete_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | UNHANDLED_DECISION [@@ocaml.doc ""]
type nonrec complete_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: complete_workflow_execution_failed_cause }[@@ocaml.doc
                                                     "Provides the details of the [CompleteWorkflowExecutionFailed] event.\n"]
type nonrec fail_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | UNHANDLED_DECISION [@@ocaml.doc ""]
type nonrec fail_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: fail_workflow_execution_failed_cause }[@@ocaml.doc
                                                 "Provides the details of the [FailWorkflowExecutionFailed] event.\n"]
type nonrec cancel_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | UNHANDLED_DECISION [@@ocaml.doc ""]
type nonrec cancel_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: cancel_workflow_execution_failed_cause }[@@ocaml.doc
                                                   "Provides the details of the [CancelWorkflowExecutionFailed] event.\n"]
type nonrec continue_as_new_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED 
  | DEFAULT_CHILD_POLICY_UNDEFINED 
  | DEFAULT_TASK_LIST_UNDEFINED 
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED 
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED 
  | WORKFLOW_TYPE_DOES_NOT_EXIST 
  | WORKFLOW_TYPE_DEPRECATED 
  | UNHANDLED_DECISION [@@ocaml.doc ""]
type nonrec continue_as_new_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: continue_as_new_workflow_execution_failed_cause }[@@ocaml.doc
                                                            "Provides the details of the [ContinueAsNewWorkflowExecutionFailed] event.\n"]
type nonrec decision_task_scheduled_event_attributes =
  {
  schedule_to_start_timeout: string option ;
  start_to_close_timeout: string option ;
  task_priority: string option ;
  task_list: task_list }[@@ocaml.doc
                          "Provides details about the [DecisionTaskScheduled] event.\n"]
type nonrec decision_task_started_event_attributes =
  {
  scheduled_event_id: int ;
  identity: string option }[@@ocaml.doc
                             "Provides the details of the [DecisionTaskStarted] event.\n"]
type nonrec decision_task_completed_event_attributes =
  {
  task_list_schedule_to_start_timeout: string option ;
  task_list: task_list option ;
  started_event_id: int ;
  scheduled_event_id: int ;
  execution_context: string option }[@@ocaml.doc
                                      "Provides the details of the [DecisionTaskCompleted] event.\n"]
type nonrec decision_task_timeout_type =
  | SCHEDULE_TO_START 
  | START_TO_CLOSE [@@ocaml.doc ""]
type nonrec decision_task_timed_out_event_attributes =
  {
  started_event_id: int ;
  scheduled_event_id: int ;
  timeout_type: decision_task_timeout_type }[@@ocaml.doc
                                              "Provides the details of the [DecisionTaskTimedOut] event.\n"]
type nonrec activity_task_scheduled_event_attributes =
  {
  heartbeat_timeout: string option ;
  decision_task_completed_event_id: int ;
  task_priority: string option ;
  task_list: task_list ;
  start_to_close_timeout: string option ;
  schedule_to_close_timeout: string option ;
  schedule_to_start_timeout: string option ;
  control: string option ;
  input: string option ;
  activity_id: string ;
  activity_type: activity_type }[@@ocaml.doc
                                  "Provides the details of the [ActivityTaskScheduled] event.\n"]
type nonrec activity_task_started_event_attributes =
  {
  scheduled_event_id: int ;
  identity: string option }[@@ocaml.doc
                             "Provides the details of the [ActivityTaskStarted] event.\n"]
type nonrec activity_task_completed_event_attributes =
  {
  started_event_id: int ;
  scheduled_event_id: int ;
  result: string option }[@@ocaml.doc
                           "Provides the details of the [ActivityTaskCompleted] event.\n"]
type nonrec activity_task_failed_event_attributes =
  {
  started_event_id: int ;
  scheduled_event_id: int ;
  details: string option ;
  reason: string option }[@@ocaml.doc
                           "Provides the details of the [ActivityTaskFailed] event.\n"]
type nonrec activity_task_timeout_type =
  | HEARTBEAT 
  | SCHEDULE_TO_CLOSE 
  | SCHEDULE_TO_START 
  | START_TO_CLOSE [@@ocaml.doc ""]
type nonrec activity_task_timed_out_event_attributes =
  {
  details: string option ;
  started_event_id: int ;
  scheduled_event_id: int ;
  timeout_type: activity_task_timeout_type }[@@ocaml.doc
                                              "Provides the details of the [ActivityTaskTimedOut] event.\n"]
type nonrec activity_task_canceled_event_attributes =
  {
  latest_cancel_requested_event_id: int option ;
  started_event_id: int ;
  scheduled_event_id: int ;
  details: string option }[@@ocaml.doc
                            "Provides the details of the [ActivityTaskCanceled] event.\n"]
type nonrec activity_task_cancel_requested_event_attributes =
  {
  activity_id: string ;
  decision_task_completed_event_id: int }[@@ocaml.doc
                                           "Provides the details of the [ActivityTaskCancelRequested] event.\n"]
type nonrec marker_recorded_event_attributes =
  {
  decision_task_completed_event_id: int ;
  details: string option ;
  marker_name: string }[@@ocaml.doc
                         "Provides the details of the [MarkerRecorded] event.\n"]
type nonrec record_marker_failed_cause =
  | OPERATION_NOT_PERMITTED [@@ocaml.doc ""]
type nonrec record_marker_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: record_marker_failed_cause ;
  marker_name: string }[@@ocaml.doc
                         "Provides the details of the [RecordMarkerFailed] event.\n"]
type nonrec child_workflow_execution_started_event_attributes =
  {
  initiated_event_id: int ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }[@@ocaml.doc
                                            "Provides the details of the [ChildWorkflowExecutionStarted] event.\n"]
type nonrec child_workflow_execution_completed_event_attributes =
  {
  started_event_id: int ;
  initiated_event_id: int ;
  result: string option ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }[@@ocaml.doc
                                            "Provides the details of the [ChildWorkflowExecutionCompleted] event.\n"]
type nonrec child_workflow_execution_failed_event_attributes =
  {
  started_event_id: int ;
  initiated_event_id: int ;
  details: string option ;
  reason: string option ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }[@@ocaml.doc
                                            "Provides the details of the [ChildWorkflowExecutionFailed] event.\n"]
type nonrec child_workflow_execution_timed_out_event_attributes =
  {
  started_event_id: int ;
  initiated_event_id: int ;
  timeout_type: workflow_execution_timeout_type ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }[@@ocaml.doc
                                            "Provides the details of the [ChildWorkflowExecutionTimedOut] event.\n"]
type nonrec child_workflow_execution_canceled_event_attributes =
  {
  started_event_id: int ;
  initiated_event_id: int ;
  details: string option ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }[@@ocaml.doc
                                            "Provide details of the [ChildWorkflowExecutionCanceled] event.\n"]
type nonrec child_workflow_execution_terminated_event_attributes =
  {
  started_event_id: int ;
  initiated_event_id: int ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }[@@ocaml.doc
                                            "Provides the details of the [ChildWorkflowExecutionTerminated] event.\n"]
type nonrec signal_external_workflow_execution_initiated_event_attributes =
  {
  control: string option ;
  decision_task_completed_event_id: int ;
  input: string option ;
  signal_name: string ;
  run_id: string option ;
  workflow_id: string }[@@ocaml.doc
                         "Provides the details of the [SignalExternalWorkflowExecutionInitiated] event.\n"]
type nonrec external_workflow_execution_signaled_event_attributes =
  {
  initiated_event_id: int ;
  workflow_execution: workflow_execution }[@@ocaml.doc
                                            "Provides the details of the [ExternalWorkflowExecutionSignaled] event.\n"]
type nonrec signal_external_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED 
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION [@@ocaml.doc ""]
type nonrec signal_external_workflow_execution_failed_event_attributes =
  {
  control: string option ;
  decision_task_completed_event_id: int ;
  initiated_event_id: int ;
  cause: signal_external_workflow_execution_failed_cause ;
  run_id: string option ;
  workflow_id: string }[@@ocaml.doc
                         "Provides the details of the [SignalExternalWorkflowExecutionFailed] event.\n"]
type nonrec external_workflow_execution_cancel_requested_event_attributes =
  {
  initiated_event_id: int ;
  workflow_execution: workflow_execution }[@@ocaml.doc
                                            "Provides the details of the [ExternalWorkflowExecutionCancelRequested] event.\n"]
type nonrec request_cancel_external_workflow_execution_initiated_event_attributes =
  {
  control: string option ;
  decision_task_completed_event_id: int ;
  run_id: string option ;
  workflow_id: string }[@@ocaml.doc
                         "Provides the details of the [RequestCancelExternalWorkflowExecutionInitiated] event.\n"]
type nonrec request_cancel_external_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED 
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION [@@ocaml.doc ""]
type nonrec request_cancel_external_workflow_execution_failed_event_attributes =
  {
  control: string option ;
  decision_task_completed_event_id: int ;
  initiated_event_id: int ;
  cause: request_cancel_external_workflow_execution_failed_cause ;
  run_id: string option ;
  workflow_id: string }[@@ocaml.doc
                         "Provides the details of the [RequestCancelExternalWorkflowExecutionFailed] event.\n"]
type nonrec schedule_activity_task_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED 
  | DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED 
  | DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED 
  | DEFAULT_TASK_LIST_UNDEFINED 
  | DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED 
  | ACTIVITY_CREATION_RATE_EXCEEDED 
  | OPEN_ACTIVITIES_LIMIT_EXCEEDED 
  | ACTIVITY_ID_ALREADY_IN_USE 
  | ACTIVITY_TYPE_DOES_NOT_EXIST 
  | ACTIVITY_TYPE_DEPRECATED [@@ocaml.doc ""]
type nonrec schedule_activity_task_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: schedule_activity_task_failed_cause ;
  activity_id: string ;
  activity_type: activity_type }[@@ocaml.doc
                                  "Provides the details of the [ScheduleActivityTaskFailed] event.\n"]
type nonrec request_cancel_activity_task_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | ACTIVITY_ID_UNKNOWN [@@ocaml.doc ""]
type nonrec request_cancel_activity_task_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: request_cancel_activity_task_failed_cause ;
  activity_id: string }[@@ocaml.doc
                         "Provides the details of the [RequestCancelActivityTaskFailed] event.\n"]
type nonrec cancel_timer_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | TIMER_ID_UNKNOWN [@@ocaml.doc ""]
type nonrec cancel_timer_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: cancel_timer_failed_cause ;
  timer_id: string }[@@ocaml.doc
                      "Provides the details of the [CancelTimerFailed] event.\n"]
type nonrec lambda_function_scheduled_event_attributes =
  {
  decision_task_completed_event_id: int ;
  start_to_close_timeout: string option ;
  input: string option ;
  control: string option ;
  name: string ;
  id: string }[@@ocaml.doc
                "Provides the details of the [LambdaFunctionScheduled] event. It isn't set for other event types.\n"]
type nonrec lambda_function_started_event_attributes =
  {
  scheduled_event_id: int }[@@ocaml.doc
                             "Provides the details of the [LambdaFunctionStarted] event. It isn't set for other event types.\n"]
type nonrec lambda_function_completed_event_attributes =
  {
  result: string option ;
  started_event_id: int ;
  scheduled_event_id: int }[@@ocaml.doc
                             "Provides the details of the [LambdaFunctionCompleted] event. It isn't set for other event types.\n"]
type nonrec lambda_function_failed_event_attributes =
  {
  details: string option ;
  reason: string option ;
  started_event_id: int ;
  scheduled_event_id: int }[@@ocaml.doc
                             "Provides the details of the [LambdaFunctionFailed] event. It isn't set for other event types.\n"]
type nonrec lambda_function_timeout_type =
  | START_TO_CLOSE [@@ocaml.doc ""]
type nonrec lambda_function_timed_out_event_attributes =
  {
  timeout_type: lambda_function_timeout_type option ;
  started_event_id: int ;
  scheduled_event_id: int }[@@ocaml.doc
                             "Provides details of the [LambdaFunctionTimedOut] event.\n"]
type nonrec schedule_lambda_function_failed_cause =
  | LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION 
  | LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED 
  | OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED 
  | ID_ALREADY_IN_USE [@@ocaml.doc ""]
type nonrec schedule_lambda_function_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: schedule_lambda_function_failed_cause ;
  name: string ;
  id: string }[@@ocaml.doc
                "Provides the details of the [ScheduleLambdaFunctionFailed] event. It isn't set for other event types.\n"]
type nonrec history_event =
  {
  start_lambda_function_failed_event_attributes:
    start_lambda_function_failed_event_attributes option ;
  schedule_lambda_function_failed_event_attributes:
    schedule_lambda_function_failed_event_attributes option ;
  lambda_function_timed_out_event_attributes:
    lambda_function_timed_out_event_attributes option ;
  lambda_function_failed_event_attributes:
    lambda_function_failed_event_attributes option ;
  lambda_function_completed_event_attributes:
    lambda_function_completed_event_attributes option ;
  lambda_function_started_event_attributes:
    lambda_function_started_event_attributes option ;
  lambda_function_scheduled_event_attributes:
    lambda_function_scheduled_event_attributes option ;
  start_child_workflow_execution_failed_event_attributes:
    start_child_workflow_execution_failed_event_attributes option ;
  cancel_timer_failed_event_attributes:
    cancel_timer_failed_event_attributes option ;
  start_timer_failed_event_attributes:
    start_timer_failed_event_attributes option ;
  request_cancel_activity_task_failed_event_attributes:
    request_cancel_activity_task_failed_event_attributes option ;
  schedule_activity_task_failed_event_attributes:
    schedule_activity_task_failed_event_attributes option ;
  request_cancel_external_workflow_execution_failed_event_attributes:
    request_cancel_external_workflow_execution_failed_event_attributes option ;
  request_cancel_external_workflow_execution_initiated_event_attributes:
    request_cancel_external_workflow_execution_initiated_event_attributes
      option
    ;
  external_workflow_execution_cancel_requested_event_attributes:
    external_workflow_execution_cancel_requested_event_attributes option ;
  signal_external_workflow_execution_failed_event_attributes:
    signal_external_workflow_execution_failed_event_attributes option ;
  external_workflow_execution_signaled_event_attributes:
    external_workflow_execution_signaled_event_attributes option ;
  signal_external_workflow_execution_initiated_event_attributes:
    signal_external_workflow_execution_initiated_event_attributes option ;
  child_workflow_execution_terminated_event_attributes:
    child_workflow_execution_terminated_event_attributes option ;
  child_workflow_execution_canceled_event_attributes:
    child_workflow_execution_canceled_event_attributes option ;
  child_workflow_execution_timed_out_event_attributes:
    child_workflow_execution_timed_out_event_attributes option ;
  child_workflow_execution_failed_event_attributes:
    child_workflow_execution_failed_event_attributes option ;
  child_workflow_execution_completed_event_attributes:
    child_workflow_execution_completed_event_attributes option ;
  child_workflow_execution_started_event_attributes:
    child_workflow_execution_started_event_attributes option ;
  start_child_workflow_execution_initiated_event_attributes:
    start_child_workflow_execution_initiated_event_attributes option ;
  timer_canceled_event_attributes: timer_canceled_event_attributes option ;
  timer_fired_event_attributes: timer_fired_event_attributes option ;
  timer_started_event_attributes: timer_started_event_attributes option ;
  record_marker_failed_event_attributes:
    record_marker_failed_event_attributes option ;
  marker_recorded_event_attributes: marker_recorded_event_attributes option ;
  workflow_execution_signaled_event_attributes:
    workflow_execution_signaled_event_attributes option ;
  activity_task_cancel_requested_event_attributes:
    activity_task_cancel_requested_event_attributes option ;
  activity_task_canceled_event_attributes:
    activity_task_canceled_event_attributes option ;
  activity_task_timed_out_event_attributes:
    activity_task_timed_out_event_attributes option ;
  activity_task_failed_event_attributes:
    activity_task_failed_event_attributes option ;
  activity_task_completed_event_attributes:
    activity_task_completed_event_attributes option ;
  activity_task_started_event_attributes:
    activity_task_started_event_attributes option ;
  activity_task_scheduled_event_attributes:
    activity_task_scheduled_event_attributes option ;
  decision_task_timed_out_event_attributes:
    decision_task_timed_out_event_attributes option ;
  decision_task_completed_event_attributes:
    decision_task_completed_event_attributes option ;
  decision_task_started_event_attributes:
    decision_task_started_event_attributes option ;
  decision_task_scheduled_event_attributes:
    decision_task_scheduled_event_attributes option ;
  workflow_execution_cancel_requested_event_attributes:
    workflow_execution_cancel_requested_event_attributes option ;
  workflow_execution_terminated_event_attributes:
    workflow_execution_terminated_event_attributes option ;
  continue_as_new_workflow_execution_failed_event_attributes:
    continue_as_new_workflow_execution_failed_event_attributes option ;
  workflow_execution_continued_as_new_event_attributes:
    workflow_execution_continued_as_new_event_attributes option ;
  cancel_workflow_execution_failed_event_attributes:
    cancel_workflow_execution_failed_event_attributes option ;
  workflow_execution_canceled_event_attributes:
    workflow_execution_canceled_event_attributes option ;
  workflow_execution_timed_out_event_attributes:
    workflow_execution_timed_out_event_attributes option ;
  fail_workflow_execution_failed_event_attributes:
    fail_workflow_execution_failed_event_attributes option ;
  workflow_execution_failed_event_attributes:
    workflow_execution_failed_event_attributes option ;
  complete_workflow_execution_failed_event_attributes:
    complete_workflow_execution_failed_event_attributes option ;
  workflow_execution_completed_event_attributes:
    workflow_execution_completed_event_attributes option ;
  workflow_execution_started_event_attributes:
    workflow_execution_started_event_attributes option ;
  event_id: int ;
  event_type: event_type ;
  event_timestamp: CoreTypes.Timestamp.t }[@@ocaml.doc
                                            "Event within a workflow execution. A history event can be one of these types:\n\n {ul\n       {-   [ActivityTaskCancelRequested] \226\128\147 A [RequestCancelActivityTask] decision was received by the system.\n           \n            }\n       {-   [ActivityTaskCanceled] \226\128\147 The activity task was successfully canceled.\n           \n            }\n       {-   [ActivityTaskCompleted] \226\128\147 An activity worker successfully completed an activity task by calling [RespondActivityTaskCompleted].\n           \n            }\n       {-   [ActivityTaskFailed] \226\128\147 An activity worker failed an activity task by calling [RespondActivityTaskFailed].\n           \n            }\n       {-   [ActivityTaskScheduled] \226\128\147 An activity task was scheduled for execution.\n           \n            }\n       {-   [ActivityTaskStarted] \226\128\147 The scheduled activity task was dispatched to a worker.\n           \n            }\n       {-   [ActivityTaskTimedOut] \226\128\147 The activity task timed out.\n           \n            }\n       {-   [CancelTimerFailed] \226\128\147 Failed to process CancelTimer decision. This happens when the decision isn't configured properly, for example no timer exists with the specified timer Id.\n           \n            }\n       {-   [CancelWorkflowExecutionFailed] \226\128\147 A request to cancel a workflow execution failed.\n           \n            }\n       {-   [ChildWorkflowExecutionCanceled] \226\128\147 A child workflow execution, started by this workflow execution, was canceled and closed.\n           \n            }\n       {-   [ChildWorkflowExecutionCompleted] \226\128\147 A child workflow execution, started by this workflow execution, completed successfully and was closed.\n           \n            }\n       {-   [ChildWorkflowExecutionFailed] \226\128\147 A child workflow execution, started by this workflow execution, failed to complete successfully and was closed.\n           \n            }\n       {-   [ChildWorkflowExecutionStarted] \226\128\147 A child workflow execution was successfully started.\n           \n            }\n       {-   [ChildWorkflowExecutionTerminated] \226\128\147 A child workflow execution, started by this workflow execution, was terminated.\n           \n            }\n       {-   [ChildWorkflowExecutionTimedOut] \226\128\147 A child workflow execution, started by this workflow execution, timed out and was closed.\n           \n            }\n       {-   [CompleteWorkflowExecutionFailed] \226\128\147 The workflow execution failed to complete.\n           \n            }\n       {-   [ContinueAsNewWorkflowExecutionFailed] \226\128\147 The workflow execution failed to complete after being continued as a new workflow execution.\n           \n            }\n       {-   [DecisionTaskCompleted] \226\128\147 The decider successfully completed a decision task by calling [RespondDecisionTaskCompleted].\n           \n            }\n       {-   [DecisionTaskScheduled] \226\128\147 A decision task was scheduled for the workflow execution.\n           \n            }\n       {-   [DecisionTaskStarted] \226\128\147 The decision task was dispatched to a decider.\n           \n            }\n       {-   [DecisionTaskTimedOut] \226\128\147 The decision task timed out.\n           \n            }\n       {-   [ExternalWorkflowExecutionCancelRequested] \226\128\147 Request to cancel an external workflow execution was successfully delivered to the target execution.\n           \n            }\n       {-   [ExternalWorkflowExecutionSignaled] \226\128\147 A signal, requested by this workflow execution, was successfully delivered to the target external workflow execution.\n           \n            }\n       {-   [FailWorkflowExecutionFailed] \226\128\147 A request to mark a workflow execution as failed, itself failed.\n           \n            }\n       {-   [MarkerRecorded] \226\128\147 A marker was recorded in the workflow history as the result of a [RecordMarker] decision.\n           \n            }\n       {-   [RecordMarkerFailed] \226\128\147 A [RecordMarker] decision was returned as failed.\n           \n            }\n       {-   [RequestCancelActivityTaskFailed] \226\128\147 Failed to process RequestCancelActivityTask decision. This happens when the decision isn't configured properly.\n           \n            }\n       {-   [RequestCancelExternalWorkflowExecutionFailed] \226\128\147 Request to cancel an external workflow execution failed.\n           \n            }\n       {-   [RequestCancelExternalWorkflowExecutionInitiated] \226\128\147 A request was made to request the cancellation of an external workflow execution.\n           \n            }\n       {-   [ScheduleActivityTaskFailed] \226\128\147 Failed to process ScheduleActivityTask decision. This happens when the decision isn't configured properly, for example the activity type specified isn't registered.\n           \n            }\n       {-   [SignalExternalWorkflowExecutionFailed] \226\128\147 The request to signal an external workflow execution failed.\n           \n            }\n       {-   [SignalExternalWorkflowExecutionInitiated] \226\128\147 A request to signal an external workflow was made.\n           \n            }\n       {-   [StartActivityTaskFailed] \226\128\147 A scheduled activity task failed to start.\n           \n            }\n       {-   [StartChildWorkflowExecutionFailed] \226\128\147 Failed to process StartChildWorkflowExecution decision. This happens when the decision isn't configured properly, for example the workflow type specified isn't registered.\n           \n            }\n       {-   [StartChildWorkflowExecutionInitiated] \226\128\147 A request was made to start a child workflow execution.\n           \n            }\n       {-   [StartTimerFailed] \226\128\147 Failed to process StartTimer decision. This happens when the decision isn't configured properly, for example a timer already exists with the specified timer Id.\n           \n            }\n       {-   [TimerCanceled] \226\128\147 A timer, previously started for this workflow execution, was successfully canceled.\n           \n            }\n       {-   [TimerFired] \226\128\147 A timer, previously started for this workflow execution, fired.\n           \n            }\n       {-   [TimerStarted] \226\128\147 A timer was started for the workflow execution due to a [StartTimer] decision.\n           \n            }\n       {-   [WorkflowExecutionCancelRequested] \226\128\147 A request to cancel this workflow execution was made.\n           \n            }\n       {-   [WorkflowExecutionCanceled] \226\128\147 The workflow execution was successfully canceled and closed.\n           \n            }\n       {-   [WorkflowExecutionCompleted] \226\128\147 The workflow execution was closed due to successful completion.\n           \n            }\n       {-   [WorkflowExecutionContinuedAsNew] \226\128\147 The workflow execution was closed and a new execution of the same type was created with the same workflowId.\n           \n            }\n       {-   [WorkflowExecutionFailed] \226\128\147 The workflow execution closed due to a failure.\n           \n            }\n       {-   [WorkflowExecutionSignaled] \226\128\147 An external signal was received for the workflow execution.\n           \n            }\n       {-   [WorkflowExecutionStarted] \226\128\147 The workflow execution was started.\n           \n            }\n       {-   [WorkflowExecutionTerminated] \226\128\147 The workflow execution was terminated.\n           \n            }\n       {-   [WorkflowExecutionTimedOut] \226\128\147 The workflow execution was closed because a time out was exceeded.\n           \n            }\n       }\n  "]
type nonrec decision_task =
  {
  previous_started_event_id: int option ;
  next_page_token: string option ;
  events: history_event list ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution ;
  started_event_id: int ;
  task_token: string }[@@ocaml.doc
                        "A structure that represents a decision task. Decision tasks are sent to deciders in order for them to make decisions.\n"]
type nonrec poll_for_decision_task_input =
  {
  start_at_previous_started_event: bool option ;
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  identity: string option ;
  task_list: task_list ;
  domain: string }[@@ocaml.doc ""]
type nonrec activity_task =
  {
  input: string option ;
  activity_type: activity_type ;
  workflow_execution: workflow_execution ;
  started_event_id: int ;
  activity_id: string ;
  task_token: string }[@@ocaml.doc
                        "Unit of work sent to an activity worker.\n"]
type nonrec poll_for_activity_task_input =
  {
  identity: string option ;
  task_list: task_list ;
  domain: string }[@@ocaml.doc ""]
type nonrec list_workflow_types_input =
  {
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  registration_status: registration_status ;
  name: string option ;
  domain: string }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_output = {
  tags: resource_tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_input = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec execution_time_filter =
  {
  latest_date: CoreTypes.Timestamp.t option ;
  oldest_date: CoreTypes.Timestamp.t }[@@ocaml.doc
                                        "Used to filter the workflow executions in visibility APIs by various time-based rules. Each parameter, if specified, defines a rule that must be satisfied by each returned query result. The parameter values are in the {{:https://en.wikipedia.org/wiki/Unix_time}Unix Time format}. For example: [\"oldestDate\": 1325376070.] \n"]
type nonrec list_open_workflow_executions_input =
  {
  execution_filter: workflow_execution_filter option ;
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  tag_filter: tag_filter option ;
  type_filter: workflow_type_filter option ;
  start_time_filter: execution_time_filter ;
  domain: string }[@@ocaml.doc ""]
type nonrec domain_info =
  {
  arn: string option ;
  description: string option ;
  status: registration_status ;
  name: string }[@@ocaml.doc
                  "Contains general information about a domain.\n"]
type nonrec domain_infos =
  {
  next_page_token: string option ;
  domain_infos: domain_info list }[@@ocaml.doc
                                    "Contains a paginated collection of DomainInfo structures.\n"]
type nonrec list_domains_input =
  {
  reverse_order: bool option ;
  maximum_page_size: int option ;
  registration_status: registration_status ;
  next_page_token: string option }[@@ocaml.doc ""]
type nonrec close_status_filter = {
  status: close_status }[@@ocaml.doc
                          "Used to filter the closed workflow executions in visibility APIs by their close status.\n"]
type nonrec list_closed_workflow_executions_input =
  {
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  tag_filter: tag_filter option ;
  type_filter: workflow_type_filter option ;
  close_status_filter: close_status_filter option ;
  execution_filter: workflow_execution_filter option ;
  close_time_filter: execution_time_filter option ;
  start_time_filter: execution_time_filter option ;
  domain: string }[@@ocaml.doc ""]
type nonrec activity_type_info =
  {
  deprecation_date: CoreTypes.Timestamp.t option ;
  creation_date: CoreTypes.Timestamp.t ;
  description: string option ;
  status: registration_status ;
  activity_type: activity_type }[@@ocaml.doc
                                  "Detailed information about an activity type.\n"]
type nonrec activity_type_infos =
  {
  next_page_token: string option ;
  type_infos: activity_type_info list }[@@ocaml.doc
                                         "Contains a paginated list of activity type information structures.\n"]
type nonrec list_activity_types_input =
  {
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  registration_status: registration_status ;
  name: string option ;
  domain: string }[@@ocaml.doc ""]
type nonrec history =
  {
  next_page_token: string option ;
  events: history_event list }[@@ocaml.doc
                                "Paginated representation of a workflow history for a workflow execution. This is the up to date, complete and authoritative record of the events related to all tasks and events in the life of the workflow execution.\n"]
type nonrec get_workflow_execution_history_input =
  {
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  execution: workflow_execution ;
  domain: string }[@@ocaml.doc ""]
type nonrec describe_workflow_type_input =
  {
  workflow_type: workflow_type ;
  domain: string }[@@ocaml.doc ""]
type nonrec describe_workflow_execution_input =
  {
  execution: workflow_execution ;
  domain: string }[@@ocaml.doc ""]
type nonrec domain_configuration =
  {
  workflow_execution_retention_period_in_days: string }[@@ocaml.doc
                                                         "Contains the configuration settings of a domain.\n"]
type nonrec domain_detail =
  {
  configuration: domain_configuration ;
  domain_info: domain_info }[@@ocaml.doc "Contains details of a domain.\n"]
type nonrec describe_domain_input = {
  name: string }[@@ocaml.doc ""]
type nonrec activity_type_configuration =
  {
  default_task_schedule_to_close_timeout: string option ;
  default_task_schedule_to_start_timeout: string option ;
  default_task_priority: string option ;
  default_task_list: task_list option ;
  default_task_heartbeat_timeout: string option ;
  default_task_start_to_close_timeout: string option }[@@ocaml.doc
                                                        "Configuration settings registered with the activity type.\n"]
type nonrec activity_type_detail =
  {
  configuration: activity_type_configuration ;
  type_info: activity_type_info }[@@ocaml.doc
                                   "Detailed information about an activity type.\n"]
type nonrec describe_activity_type_input =
  {
  activity_type: activity_type ;
  domain: string }[@@ocaml.doc ""]
type nonrec deprecate_workflow_type_input =
  {
  workflow_type: workflow_type ;
  domain: string }[@@ocaml.doc ""]
type nonrec domain_deprecated_fault = {
  message: string option }[@@ocaml.doc
                            "Returned when the specified domain has been deprecated.\n"]
type nonrec deprecate_domain_input = {
  name: string }[@@ocaml.doc ""]
type nonrec deprecate_activity_type_input =
  {
  activity_type: activity_type ;
  domain: string }[@@ocaml.doc ""]
type nonrec delete_workflow_type_input =
  {
  workflow_type: workflow_type ;
  domain: string }[@@ocaml.doc ""]
type nonrec delete_activity_type_input =
  {
  activity_type: activity_type ;
  domain: string }[@@ocaml.doc ""]
type nonrec pending_task_count = {
  truncated: bool option ;
  count: int }[@@ocaml.doc "Contains the count of tasks in a task list.\n"]
type nonrec count_pending_decision_tasks_input =
  {
  task_list: task_list ;
  domain: string }[@@ocaml.doc ""]
type nonrec count_pending_activity_tasks_input =
  {
  task_list: task_list ;
  domain: string }[@@ocaml.doc ""]
type nonrec count_open_workflow_executions_input =
  {
  execution_filter: workflow_execution_filter option ;
  tag_filter: tag_filter option ;
  type_filter: workflow_type_filter option ;
  start_time_filter: execution_time_filter ;
  domain: string }[@@ocaml.doc ""]
type nonrec count_closed_workflow_executions_input =
  {
  close_status_filter: close_status_filter option ;
  tag_filter: tag_filter option ;
  type_filter: workflow_type_filter option ;
  execution_filter: workflow_execution_filter option ;
  close_time_filter: execution_time_filter option ;
  start_time_filter: execution_time_filter option ;
  domain: string }[@@ocaml.doc ""]