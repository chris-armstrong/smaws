(** 
    SWF client library built on EIO.
    
*)

(** {1:types Types} *)

type nonrec name = string[@@ocaml.doc ""]
type nonrec version = string[@@ocaml.doc ""]
type nonrec workflow_type =
  {
  version: version
    [@ocaml.doc
      " The version of the workflow type.\n\n  The combination of workflow type name and version must be unique with in a domain.\n  \n   "];
  name: name
    [@ocaml.doc
      " The name of the workflow type.\n\n  The combination of workflow type name and version must be unique with in a domain.\n  \n   "]}
[@@ocaml.doc "Represents a workflow type.\n"]
type nonrec registration_status =
  | DEPRECATED [@ocaml.doc ""]
  | REGISTERED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec description = string[@@ocaml.doc ""]
type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec workflow_type_info =
  {
  deprecation_date: timestamp option
    [@ocaml.doc
      "If the type is in deprecated state, then it is set to the date when the type was deprecated.\n"];
  creation_date: timestamp
    [@ocaml.doc "The date when this type was registered.\n"];
  description: description option
    [@ocaml.doc
      "The description of the type registered through [RegisterWorkflowType].\n"];
  status: registration_status
    [@ocaml.doc "The current status of the workflow type.\n"];
  workflow_type: workflow_type
    [@ocaml.doc "The workflow type this information is about.\n"]}[@@ocaml.doc
                                                                    "Contains information about a workflow type.\n"]
type nonrec workflow_type_info_list = workflow_type_info list[@@ocaml.doc ""]
type nonrec page_token = string[@@ocaml.doc ""]
type nonrec workflow_type_infos =
  {
  next_page_token: page_token option
    [@ocaml.doc
      "If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.\n\n The configured [maximumPageSize] determines how many results can be returned in a single call.\n "];
  type_infos: workflow_type_info_list
    [@ocaml.doc "The list of workflow type information.\n"]}[@@ocaml.doc
                                                              "Contains a paginated list of information structures about workflow types.\n"]
type nonrec version_optional = string[@@ocaml.doc ""]
type nonrec workflow_type_filter =
  {
  version: version_optional option
    [@ocaml.doc "Version of the workflow type.\n"];
  name: name [@ocaml.doc " Name of the workflow type.\n"]}[@@ocaml.doc
                                                            "Used to filter workflow execution query results by type. Each parameter, if specified, defines a rule that must be satisfied by each returned result.\n"]
type nonrec duration_in_seconds_optional = string[@@ocaml.doc ""]
type nonrec task_list =
  {
  name: name [@ocaml.doc "The name of the task list.\n"]}[@@ocaml.doc
                                                           "Represents a task list.\n"]
type nonrec task_priority = string[@@ocaml.doc ""]
type nonrec child_policy =
  | ABANDON [@ocaml.doc ""]
  | REQUEST_CANCEL [@ocaml.doc ""]
  | TERMINATE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec arn = string[@@ocaml.doc ""]
type nonrec workflow_type_configuration =
  {
  default_lambda_role: arn option
    [@ocaml.doc
      "The default IAM role attached to this workflow type.\n\n  Executions of this workflow type need IAM roles to invoke Lambda functions. If you don't specify an IAM role when starting this workflow type, the default Lambda role is attached to the execution. For more information, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html}https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  default_child_policy: child_policy option
    [@ocaml.doc
      " The default policy to use for the child workflow executions when a workflow execution of this type is terminated, by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n  "];
  default_task_priority: task_priority option
    [@ocaml.doc
      " The default task priority, specified when registering the workflow type, for all decision tasks of this workflow type. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] decision.\n\n Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n \n  For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.\n  "];
  default_task_list: task_list option
    [@ocaml.doc
      " The default task list, specified when registering the workflow type, for decisions tasks scheduled for workflow executions of this type. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].\n"];
  default_execution_start_to_close_timeout:
    duration_in_seconds_optional option
    [@ocaml.doc
      " The default maximum duration, specified when registering the workflow type, for executions of this workflow type. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  default_task_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      " The default maximum duration, specified when registering the workflow type, that a decision task for executions of this workflow type might take before returning completion or failure. If the task doesn'tdo close in the specified time then the task is automatically timed out and rescheduled. If the decider eventually reports a completion or failure, it is ignored. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "]}
[@@ocaml.doc "The configuration settings of a workflow type.\n"]
type nonrec workflow_type_detail =
  {
  configuration: workflow_type_configuration
    [@ocaml.doc
      "Configuration settings of the workflow type registered through [RegisterWorkflowType] \n"];
  type_info: workflow_type_info
    [@ocaml.doc
      "General information about the workflow type.\n\n The status of the workflow type (returned in the WorkflowTypeInfo structure) can be one of the following.\n \n  {ul\n        {-   [REGISTERED] \226\128\147 The type is registered and available. Workers supporting this type should be running.\n            \n             }\n        {-   [DEPRECATED] \226\128\147 The type was deprecated using [DeprecateWorkflowType], but is still in use. You should keep workers supporting this type running. You cannot create new workflow executions of this type.\n            \n             }\n        }\n  "]}
[@@ocaml.doc "Contains details about a workflow type.\n"]
type nonrec workflow_run_id_optional = string[@@ocaml.doc ""]
type nonrec workflow_run_id = string[@@ocaml.doc ""]
type nonrec workflow_id = string[@@ocaml.doc ""]
type nonrec workflow_execution_timeout_type =
  | START_TO_CLOSE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec workflow_execution_timed_out_event_attributes =
  {
  child_policy: child_policy
    [@ocaml.doc
      "The policy used for the child workflow executions of this workflow execution.\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n  "];
  timeout_type: workflow_execution_timeout_type
    [@ocaml.doc "The type of timeout that caused this event.\n"]}[@@ocaml.doc
                                                                   "Provides the details of the [WorkflowExecutionTimedOut] event.\n"]
type nonrec terminate_reason = string[@@ocaml.doc ""]
type nonrec data = string[@@ocaml.doc ""]
type nonrec workflow_execution_terminated_cause =
  | OPERATOR_INITIATED [@ocaml.doc ""]
  | EVENT_LIMIT_EXCEEDED [@ocaml.doc ""]
  | CHILD_POLICY_APPLIED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec workflow_execution_terminated_event_attributes =
  {
  cause: workflow_execution_terminated_cause option
    [@ocaml.doc
      "If set, indicates that the workflow execution was automatically terminated, and specifies the cause. This happens if the parent workflow execution times out or is terminated and the child policy is set to terminate child executions.\n"];
  child_policy: child_policy
    [@ocaml.doc
      "The policy used for the child workflow executions of this workflow execution.\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n  "];
  details: data option
    [@ocaml.doc "The details provided for the termination.\n"];
  reason: terminate_reason option
    [@ocaml.doc "The reason provided for the termination.\n"]}[@@ocaml.doc
                                                                "Provides the details of the [WorkflowExecutionTerminated] event.\n"]
type nonrec tag = string[@@ocaml.doc ""]
type nonrec tag_list = tag list[@@ocaml.doc ""]
type nonrec workflow_execution =
  {
  run_id: workflow_run_id
    [@ocaml.doc
      "A system-generated unique identifier for the workflow execution.\n"];
  workflow_id: workflow_id
    [@ocaml.doc
      "The user defined identifier associated with the workflow execution.\n"]}
[@@ocaml.doc "Represents a workflow execution.\n"]
type nonrec event_id = int[@@ocaml.doc ""]
type nonrec workflow_execution_started_event_attributes =
  {
  lambda_role: arn option
    [@ocaml.doc "The IAM role attached to the workflow execution.\n"];
  parent_initiated_event_id: event_id option
    [@ocaml.doc
      "The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this workflow execution. The source event with this ID can be found in the history of the source workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  parent_workflow_execution: workflow_execution option
    [@ocaml.doc
      "The source workflow execution that started this workflow execution. The member isn't set if the workflow execution was not started by a workflow.\n"];
  continued_execution_run_id: workflow_run_id_optional option
    [@ocaml.doc
      "If this workflow execution was started due to a [ContinueAsNewWorkflowExecution] decision, then it contains the [runId] of the previous workflow execution that was closed and continued as this execution.\n"];
  tag_list: tag_list option
    [@ocaml.doc
      "The list of tags associated with this workflow execution. An execution can have up to 5 tags.\n"];
  workflow_type: workflow_type
    [@ocaml.doc "The workflow type of this execution.\n"];
  task_priority: task_priority option
    [@ocaml.doc
      "The priority of the decision tasks in the workflow execution.\n"];
  task_list: task_list
    [@ocaml.doc
      "The name of the task list for scheduling the decision tasks for this workflow execution.\n"];
  child_policy: child_policy
    [@ocaml.doc
      "The policy to use for the child workflow executions if this workflow execution is terminated, by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout.\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n  "];
  task_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum duration of decision tasks for this workflow type.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  execution_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum duration for this workflow execution.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  input: data option
    [@ocaml.doc "The input provided to the workflow execution.\n"]}[@@ocaml.doc
                                                                    "Provides details of [WorkflowExecutionStarted] event.\n"]
type nonrec signal_name = string[@@ocaml.doc ""]
type nonrec workflow_execution_signaled_event_attributes =
  {
  external_initiated_event_id: event_id option
    [@ocaml.doc
      "The ID of the [SignalExternalWorkflowExecutionInitiated] event corresponding to the [SignalExternalWorkflow] decision to signal this workflow execution.The source event with this ID can be found in the history of the source workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event. This field is set only if the signal was initiated by another workflow execution.\n"];
  external_workflow_execution: workflow_execution option
    [@ocaml.doc
      "The workflow execution that sent the signal. This is set only of the signal was sent by another workflow execution.\n"];
  input: data option
    [@ocaml.doc
      "The inputs provided with the signal. The decider can use the signal name and inputs to determine how to process the signal.\n"];
  signal_name: signal_name
    [@ocaml.doc
      "The name of the signal received. The decider can use the signal name and inputs to determine how to the process the signal.\n"]}
[@@ocaml.doc
  "Provides the details of the [WorkflowExecutionSignaled] event.\n"]
type nonrec count = int[@@ocaml.doc ""]
type nonrec open_decision_tasks_count = int[@@ocaml.doc ""]
type nonrec workflow_execution_open_counts =
  {
  open_lambda_functions: count option
    [@ocaml.doc "The count of Lambda tasks whose status is [OPEN].\n"];
  open_child_workflow_executions: count
    [@ocaml.doc
      "The count of child workflow executions whose status is [OPEN].\n"];
  open_timers: count
    [@ocaml.doc
      "The count of timers started by this workflow execution that have not fired yet.\n"];
  open_decision_tasks: open_decision_tasks_count
    [@ocaml.doc
      "The count of decision tasks whose status is OPEN. A workflow execution can have at most one open decision task.\n"];
  open_activity_tasks: count
    [@ocaml.doc "The count of activity tasks whose status is [OPEN].\n"]}
[@@ocaml.doc
  "Contains the counts of open tasks, child workflow executions and timers for a workflow execution.\n"]
type nonrec execution_status =
  | CLOSED [@ocaml.doc ""]
  | OPEN [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec close_status =
  | TIMED_OUT [@ocaml.doc ""]
  | CONTINUED_AS_NEW [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec canceled = bool[@@ocaml.doc ""]
type nonrec workflow_execution_info =
  {
  cancel_requested: canceled option
    [@ocaml.doc
      "Set to true if a cancellation is requested for this workflow execution.\n"];
  tag_list: tag_list option
    [@ocaml.doc
      "The list of tags associated with the workflow execution. Tags can be used to identify and list workflow executions of interest through the visibility APIs. A workflow execution can have a maximum of 5 tags.\n"];
  parent: workflow_execution option
    [@ocaml.doc
      "If this workflow execution is a child of another execution then contains the workflow execution that started this execution.\n"];
  close_status: close_status option
    [@ocaml.doc
      "If the execution status is closed then this specifies how the execution was closed:\n\n {ul\n       {-   [COMPLETED] \226\128\147 the execution was successfully completed.\n           \n            }\n       {-   [CANCELED] \226\128\147 the execution was canceled.Cancellation allows the implementation to gracefully clean up before the execution is closed.\n           \n            }\n       {-   [TERMINATED] \226\128\147 the execution was force terminated.\n           \n            }\n       {-   [FAILED] \226\128\147 the execution failed to complete.\n           \n            }\n       {-   [TIMED_OUT] \226\128\147 the execution did not complete in the alloted time and was automatically timed out.\n           \n            }\n       {-   [CONTINUED_AS_NEW] \226\128\147 the execution is logically continued. This means the current execution was completed and a new execution was started to carry on the workflow.\n           \n            }\n       }\n  "];
  execution_status: execution_status
    [@ocaml.doc "The current status of the execution.\n"];
  close_timestamp: timestamp option
    [@ocaml.doc
      "The time when the workflow execution was closed. Set only if the execution status is CLOSED.\n"];
  start_timestamp: timestamp
    [@ocaml.doc "The time when the execution was started.\n"];
  workflow_type: workflow_type
    [@ocaml.doc "The type of the workflow execution.\n"];
  execution: workflow_execution
    [@ocaml.doc "The workflow execution this information is about.\n"]}
[@@ocaml.doc "Contains information about a workflow execution.\n"]
type nonrec workflow_execution_info_list = workflow_execution_info list
[@@ocaml.doc ""]
type nonrec workflow_execution_infos =
  {
  next_page_token: page_token option
    [@ocaml.doc
      "If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.\n\n The configured [maximumPageSize] determines how many results can be returned in a single call.\n "];
  execution_infos: workflow_execution_info_list
    [@ocaml.doc "The list of workflow information structures.\n"]}[@@ocaml.doc
                                                                    "Contains a paginated list of information about workflow executions.\n"]
type nonrec workflow_execution_filter =
  {
  workflow_id: workflow_id
    [@ocaml.doc
      "The workflowId to pass of match the criteria of this filter.\n"]}
[@@ocaml.doc
  "Used to filter the workflow executions in visibility APIs by their [workflowId].\n"]
type nonrec failure_reason = string[@@ocaml.doc ""]
type nonrec workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [FailWorkflowExecution] decision to fail this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  details: data option [@ocaml.doc "The details of the failure.\n"];
  reason: failure_reason option
    [@ocaml.doc "The descriptive reason provided for the failure.\n"]}
[@@ocaml.doc
  "Provides the details of the [WorkflowExecutionFailed] event.\n"]
type nonrec duration_in_seconds = string[@@ocaml.doc ""]
type nonrec workflow_execution_configuration =
  {
  lambda_role: arn option
    [@ocaml.doc "The IAM role attached to the child workflow execution.\n"];
  child_policy: child_policy
    [@ocaml.doc
      "The policy to use for the child workflow executions if this workflow execution is terminated, by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout.\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n  "];
  task_priority: task_priority option
    [@ocaml.doc
      "The priority assigned to decision tasks for this workflow execution. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n\n For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.\n "];
  task_list: task_list
    [@ocaml.doc
      "The task list used for the decision tasks generated for this workflow execution.\n"];
  execution_start_to_close_timeout: duration_in_seconds
    [@ocaml.doc
      "The total duration for this workflow execution.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  task_start_to_close_timeout: duration_in_seconds
    [@ocaml.doc
      "The maximum duration allowed for decision tasks for this workflow execution.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "]}
[@@ocaml.doc
  "The configuration settings for a workflow execution including timeout values, tasklist etc. These configuration settings are determined from the defaults specified when registering the workflow type and those specified when starting the workflow execution.\n"]
type nonrec workflow_execution_detail =
  {
  latest_execution_context: data option
    [@ocaml.doc
      "The latest executionContext provided by the decider for this workflow execution. A decider can provide an executionContext (a free-form string) when closing a decision task using [RespondDecisionTaskCompleted].\n"];
  latest_activity_task_timestamp: timestamp option
    [@ocaml.doc
      "The time when the last activity task was scheduled for this workflow execution. You can use this information to determine if the workflow has not made progress for an unusually long period of time and might require a corrective action.\n"];
  open_counts: workflow_execution_open_counts
    [@ocaml.doc
      "The number of tasks for this workflow execution. This includes open and closed tasks of all types.\n"];
  execution_configuration: workflow_execution_configuration
    [@ocaml.doc
      "The configuration settings for this workflow execution including timeout values, tasklist etc.\n"];
  execution_info: workflow_execution_info
    [@ocaml.doc "Information about the workflow execution.\n"]}[@@ocaml.doc
                                                                 "Contains details about a workflow execution.\n"]
type nonrec truncated = bool[@@ocaml.doc ""]
type nonrec workflow_execution_count =
  {
  truncated: truncated option
    [@ocaml.doc
      "If set to true, indicates that the actual count was more than the maximum supported by this API and the count returned is the truncated value.\n"];
  count: count [@ocaml.doc "The number of workflow executions.\n"]}[@@ocaml.doc
                                                                    "Contains the count of workflow executions returned from [CountOpenWorkflowExecutions] or [CountClosedWorkflowExecutions] \n"]
type nonrec workflow_execution_continued_as_new_event_attributes =
  {
  lambda_role: arn option
    [@ocaml.doc
      "The IAM role to attach to the new (continued) workflow execution.\n"];
  workflow_type: workflow_type
    [@ocaml.doc "The workflow type of this execution.\n"];
  tag_list: tag_list option
    [@ocaml.doc
      "The list of tags associated with the new workflow execution.\n"];
  child_policy: child_policy
    [@ocaml.doc
      "The policy to use for the child workflow executions of the new execution if it is terminated by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout.\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n  "];
  task_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum duration of decision tasks for the new workflow execution.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  task_priority: task_priority option
    [@ocaml.doc
      "The priority of the task to use for the decisions of the new (continued) workflow execution.\n"];
  task_list: task_list
    [@ocaml.doc
      "The task list to use for the decisions of the new (continued) workflow execution.\n"];
  execution_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The total duration allowed for the new workflow execution.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  new_execution_run_id: workflow_run_id
    [@ocaml.doc "The [runId] of the new workflow execution.\n"];
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [ContinueAsNewWorkflowExecution] decision that started this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  input: data option
    [@ocaml.doc "The input provided to the new workflow execution.\n"]}
[@@ocaml.doc
  "Provides the details of the [WorkflowExecutionContinuedAsNew] event.\n"]
type nonrec workflow_execution_completed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CompleteWorkflowExecution] decision to complete this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  result: data option
    [@ocaml.doc
      "The result produced by the workflow execution upon successful completion.\n"]}
[@@ocaml.doc
  "Provides the details of the [WorkflowExecutionCompleted] event.\n"]
type nonrec workflow_execution_canceled_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CancelWorkflowExecution] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  details: data option [@ocaml.doc "The details of the cancellation.\n"]}
[@@ocaml.doc
  "Provides the details of the [WorkflowExecutionCanceled] event.\n"]
type nonrec workflow_execution_cancel_requested_cause =
  | CHILD_POLICY_APPLIED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec workflow_execution_cancel_requested_event_attributes =
  {
  cause: workflow_execution_cancel_requested_cause option
    [@ocaml.doc
      "If set, indicates that the request to cancel the workflow execution was automatically generated, and specifies the cause. This happens if the parent workflow execution times out or is terminated, and the child policy is set to cancel child executions.\n"];
  external_initiated_event_id: event_id option
    [@ocaml.doc
      "The ID of the [RequestCancelExternalWorkflowExecutionInitiated] event corresponding to the [RequestCancelExternalWorkflowExecution] decision to cancel this workflow execution.The source event with this ID can be found in the history of the source workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  external_workflow_execution: workflow_execution option
    [@ocaml.doc
      "The external workflow execution for which the cancellation was requested.\n"]}
[@@ocaml.doc
  "Provides the details of the [WorkflowExecutionCancelRequested] event.\n"]
type nonrec error_message = string[@@ocaml.doc ""]
type nonrec workflow_execution_already_started_fault =
  {
  message: error_message option
    [@ocaml.doc
      "A description that may help with diagnosing the cause of the fault.\n"]}
[@@ocaml.doc
  "Returned by [StartWorkflowExecution] when an open execution with the same workflowId is already running in the specified domain.\n"]
type nonrec resource_tag_key = string[@@ocaml.doc ""]
type nonrec resource_tag_key_list = resource_tag_key list[@@ocaml.doc ""]
type nonrec untag_resource_input =
  {
  tag_keys: resource_tag_key_list
    [@ocaml.doc "The list of tags to remove from the Amazon SWF domain.\n"];
  resource_arn: arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the Amazon SWF domain.\n"]}
[@@ocaml.doc ""]
type nonrec unknown_resource_fault =
  {
  message: error_message option
    [@ocaml.doc
      "A description that may help with diagnosing the cause of the fault.\n"]}
[@@ocaml.doc
  "Returned when the named resource cannot be found with in the scope of this operation (region or domain). This could happen if the named resource was never created or is no longer available for this operation.\n"]
type nonrec operation_not_permitted_fault =
  {
  message: error_message option
    [@ocaml.doc
      "A description that may help with diagnosing the cause of the fault.\n"]}
[@@ocaml.doc
  "Returned when the caller doesn't have sufficient permissions to invoke the action.\n"]
type nonrec limit_exceeded_fault =
  {
  message: error_message option
    [@ocaml.doc
      "A description that may help with diagnosing the cause of the fault.\n"]}
[@@ocaml.doc
  "Returned by any operation if a system imposed limitation has been reached. To address this fault you should either clean up unused resources or increase the limit by contacting AWS.\n"]
type nonrec domain_name = string[@@ocaml.doc ""]
type nonrec undeprecate_workflow_type_input =
  {
  workflow_type: workflow_type
    [@ocaml.doc "The name of the domain of the deprecated workflow type.\n"];
  domain: domain_name
    [@ocaml.doc "The name of the domain of the deprecated workflow type.\n"]}
[@@ocaml.doc ""]
type nonrec type_already_exists_fault =
  {
  message: error_message option
    [@ocaml.doc
      "A description that may help with diagnosing the cause of the fault.\n"]}
[@@ocaml.doc
  "Returned if the type already exists in the specified domain. You may get this fault if you are registering a type that is either already registered or deprecated, or if you undeprecate a type that is currently registered.\n"]
type nonrec undeprecate_domain_input =
  {
  name: domain_name
    [@ocaml.doc "The name of the domain of the deprecated workflow type.\n"]}
[@@ocaml.doc ""]
type nonrec domain_already_exists_fault =
  {
  message: error_message option
    [@ocaml.doc
      "A description that may help with diagnosing the cause of the fault.\n"]}
[@@ocaml.doc
  "Returned if the domain already exists. You may get this fault if you are registering a domain that is either already registered or deprecated, or if you undeprecate a domain that is currently registered.\n"]
type nonrec activity_type =
  {
  version: version
    [@ocaml.doc
      "The version of this activity.\n\n  The combination of activity type name and version must be unique with in a domain.\n  \n   "];
  name: name
    [@ocaml.doc
      "The name of this activity.\n\n  The combination of activity type name and version must be unique within a domain.\n  \n   "]}
[@@ocaml.doc "Represents an activity type.\n"]
type nonrec undeprecate_activity_type_input =
  {
  activity_type: activity_type
    [@ocaml.doc "The activity type to undeprecate.\n"];
  domain: domain_name
    [@ocaml.doc "The name of the domain of the deprecated activity type.\n"]}
[@@ocaml.doc ""]
type nonrec type_not_deprecated_fault =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "Returned when the resource type has not been deprecated.\n"]
type nonrec type_deprecated_fault =
  {
  message: error_message option
    [@ocaml.doc
      "A description that may help with diagnosing the cause of the fault.\n"]}
[@@ocaml.doc
  "Returned when the specified activity or workflow type was already deprecated.\n"]
type nonrec too_many_tags_fault =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "You've exceeded the number of tags allowed for a domain.\n"]
type nonrec timer_id = string[@@ocaml.doc ""]
type nonrec timer_started_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [StartTimer] decision for this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  start_to_fire_timeout: duration_in_seconds
    [@ocaml.doc
      "The duration of time after which the timer fires.\n\n The duration is specified in seconds, an integer greater than or equal to [0].\n "];
  control: data option
    [@ocaml.doc
      "Data attached to the event that can be used by the decider in subsequent workflow tasks.\n"];
  timer_id: timer_id
    [@ocaml.doc "The unique ID of the timer that was started.\n"]}[@@ocaml.doc
                                                                    "Provides the details of the [TimerStarted] event.\n"]
type nonrec timer_fired_event_attributes =
  {
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [TimerStarted] event that was recorded when this timer was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  timer_id: timer_id [@ocaml.doc "The unique ID of the timer that fired.\n"]}
[@@ocaml.doc "Provides the details of the [TimerFired] event.\n"]
type nonrec timer_canceled_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CancelTimer] decision to cancel this timer. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [TimerStarted] event that was recorded when this timer was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  timer_id: timer_id
    [@ocaml.doc "The unique ID of the timer that was canceled.\n"]}[@@ocaml.doc
                                                                    " Provides the details of the [TimerCanceled] event. \n"]
type nonrec terminate_workflow_execution_input =
  {
  child_policy: child_policy option
    [@ocaml.doc
      "If set, specifies the policy to use for the child workflow executions of the workflow execution being terminated. This policy overrides the child policy specified for the workflow execution at registration time or when starting the execution.\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n    A child policy for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default child policy was specified at registration time then a fault is returned.\n    \n     "];
  details: data option
    [@ocaml.doc " Details for terminating the workflow execution.\n"];
  reason: terminate_reason option
    [@ocaml.doc
      " A descriptive reason for terminating the workflow execution.\n"];
  run_id: workflow_run_id_optional option
    [@ocaml.doc "The runId of the workflow execution to terminate.\n"];
  workflow_id: workflow_id
    [@ocaml.doc "The workflowId of the workflow execution to terminate.\n"];
  domain: domain_name
    [@ocaml.doc "The domain of the workflow execution to terminate.\n"]}
[@@ocaml.doc ""]
type nonrec task_token = string[@@ocaml.doc ""]
type nonrec resource_tag_value = string[@@ocaml.doc ""]
type nonrec resource_tag =
  {
  value: resource_tag_value option [@ocaml.doc "The value of a tag.\n"];
  key: resource_tag_key [@ocaml.doc "The key of a tag.\n"]}[@@ocaml.doc
                                                             "Tags are key-value pairs that can be associated with Amazon SWF state machines and activities.\n\n Tags may only contain unicode letters, digits, whitespace, or these symbols: [_ . : / = + - @].\n "]
type nonrec resource_tag_list = resource_tag list[@@ocaml.doc ""]
type nonrec tag_resource_input =
  {
  tags: resource_tag_list
    [@ocaml.doc
      "The list of tags to add to a domain. \n\n Tags may only contain unicode letters, digits, whitespace, or these symbols: [_ . : / = + - @].\n "];
  resource_arn: arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the Amazon SWF domain.\n"]}
[@@ocaml.doc ""]
type nonrec tag_filter =
  {
  tag: tag
    [@ocaml.doc
      " Specifies the tag that must be associated with the execution for it to meet the filter criteria.\n\n Tags may only contain unicode letters, digits, whitespace, or these symbols: [_ . : / = + - @].\n "]}
[@@ocaml.doc
  "Used to filter the workflow executions in visibility APIs based on a tag.\n"]
type nonrec start_workflow_execution_input =
  {
  lambda_role: arn option
    [@ocaml.doc
      "The IAM role to attach to this workflow execution.\n\n  Executions of this workflow type need IAM roles to invoke Lambda functions. If you don't attach an IAM role, any attempt to schedule a Lambda task fails. This results in a [ScheduleLambdaFunctionFailed] history event. For more information, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html}https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  child_policy: child_policy option
    [@ocaml.doc
      "If set, specifies the policy to use for the child workflow executions of this workflow execution if it is terminated, by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout. This policy overrides the default child policy specified when registering the workflow type using [RegisterWorkflowType].\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n    A child policy for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default child policy was specified at registration time then a fault is returned.\n    \n     "];
  task_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "Specifies the maximum duration of decision tasks for this workflow execution. This parameter overrides the [defaultTaskStartToCloseTimout] specified when registering the workflow type using [RegisterWorkflowType].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n \n   A task start-to-close timeout for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default task start-to-close timeout was specified at registration time then a fault is returned.\n   \n    "];
  tag_list: tag_list option
    [@ocaml.doc
      "The list of tags to associate with the workflow execution. You can specify a maximum of 5 tags. You can list workflow executions with a specific tag by calling [ListOpenWorkflowExecutions] or [ListClosedWorkflowExecutions] and specifying a [TagFilter].\n"];
  execution_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The total duration for this workflow execution. This overrides the defaultExecutionStartToCloseTimeout specified when registering the workflow type.\n\n The duration is specified in seconds; an integer greater than or equal to [0]. Exceeding this limit causes the workflow execution to time out. Unlike some of the other timeout parameters in Amazon SWF, you cannot specify a value of \"NONE\" for this timeout; there is a one-year max limit on the time that a workflow execution can run.\n \n   An execution start-to-close timeout must be specified either through this parameter or as a default when the workflow type is registered. If neither this parameter nor a default execution start-to-close timeout is specified, a fault is returned.\n   \n    "];
  input: data option
    [@ocaml.doc
      "The input for the workflow execution. This is a free form string which should be meaningful to the workflow you are starting. This [input] is made available to the new workflow execution in the [WorkflowExecutionStarted] history event.\n"];
  task_priority: task_priority option
    [@ocaml.doc
      "The task priority to use for this workflow execution. This overrides any default priority that was assigned when the workflow type was registered. If not set, then the default task priority for the workflow type is used. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n\n For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.\n "];
  task_list: task_list option
    [@ocaml.doc
      "The task list to use for the decision tasks generated for this workflow execution. This overrides the [defaultTaskList] specified when registering the workflow type.\n\n  A task list for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default task list was specified at registration time then a fault is returned.\n  \n    The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n    "];
  workflow_type: workflow_type
    [@ocaml.doc "The type of the workflow to start.\n"];
  workflow_id: workflow_id
    [@ocaml.doc
      "The user defined identifier associated with the workflow execution. You can use this to associate a custom identifier with the workflow execution. You may specify the same identifier if a workflow execution is logically a {i restart} of a previous execution. You cannot have two open workflow executions with the same [workflowId] at the same time within the same domain.\n\n The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n "];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain in which the workflow execution is created.\n\n The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n "]}
[@@ocaml.doc ""]
type nonrec default_undefined_fault =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The [StartWorkflowExecution] API action was called without the required parameters set.\n\n Some workflow execution parameters, such as the decision [taskList], must be set to start the execution. However, these parameters might have been set as defaults when the workflow type was registered. In this case, you can omit these parameters from the [StartWorkflowExecution] call and Amazon SWF uses the values defined in the workflow type.\n \n   If these parameters aren't set and no default parameters were defined in the workflow type, this error is displayed.\n   \n    "]
type nonrec run =
  {
  run_id: workflow_run_id option
    [@ocaml.doc
      "The [runId] of a workflow execution. This ID is generated by the service and can be used to uniquely identify the workflow execution within a domain.\n"]}
[@@ocaml.doc "Specifies the [runId] of a workflow execution.\n"]
type nonrec start_timer_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""]
  | TIMER_CREATION_RATE_EXCEEDED [@ocaml.doc ""]
  | OPEN_TIMERS_LIMIT_EXCEEDED [@ocaml.doc ""]
  | TIMER_ID_ALREADY_IN_USE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec start_timer_failed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [StartTimer] decision for this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  cause: start_timer_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  timer_id: timer_id
    [@ocaml.doc
      "The timerId provided in the [StartTimer] decision that failed.\n"]}
[@@ocaml.doc "Provides the details of the [StartTimerFailed] event.\n"]
type nonrec start_timer_decision_attributes =
  {
  start_to_fire_timeout: duration_in_seconds
    [@ocaml.doc
      " The duration to wait before firing the timer.\n\n The duration is specified in seconds, an integer greater than or equal to [0].\n "];
  control: data option
    [@ocaml.doc
      "The data attached to the event that can be used by the decider in subsequent workflow tasks.\n"];
  timer_id: timer_id
    [@ocaml.doc
      " The unique ID of the timer.\n\n The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n "]}
[@@ocaml.doc
  "Provides the details of the [StartTimer] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec start_lambda_function_failed_cause =
  | ASSUME_ROLE_FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec cause_message = string[@@ocaml.doc ""]
type nonrec start_lambda_function_failed_event_attributes =
  {
  message: cause_message option
    [@ocaml.doc
      "A description that can help diagnose the cause of the fault.\n"];
  cause: start_lambda_function_failed_cause option
    [@ocaml.doc
      "The cause of the failure. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because the IAM role attached to the execution lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html}Lambda Tasks} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  scheduled_event_id: event_id option
    [@ocaml.doc
      "The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n"]}
[@@ocaml.doc
  "Provides the details of the [StartLambdaFunctionFailed] event. It isn't set for other event types.\n"]
type nonrec start_child_workflow_execution_initiated_event_attributes =
  {
  lambda_role: arn option
    [@ocaml.doc "The IAM role to attach to the child workflow execution.\n"];
  tag_list: tag_list option
    [@ocaml.doc
      "The list of tags to associated with the child workflow execution.\n"];
  task_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum duration allowed for the decision tasks for this workflow execution.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  child_policy: child_policy
    [@ocaml.doc
      "The policy to use for the child workflow executions if this execution gets terminated by explicitly calling the [TerminateWorkflowExecution] action or due to an expired timeout.\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n  "];
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [StartChildWorkflowExecution] [Decision] to request this child workflow execution. This information can be useful for diagnosing problems by tracing back the cause of events.\n"];
  task_priority: task_priority option
    [@ocaml.doc
      " The priority assigned for the decision tasks for this workflow execution. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n\n For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.\n "];
  task_list: task_list
    [@ocaml.doc
      "The name of the task list used for the decision tasks of the child workflow execution.\n"];
  execution_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum duration for the child workflow execution. If the workflow execution isn't closed within this duration, it is timed out and force-terminated.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  input: data option
    [@ocaml.doc "The inputs provided to the child workflow execution.\n"];
  control: data option
    [@ocaml.doc
      "Data attached to the event that can be used by the decider in subsequent decision tasks. This data isn't sent to the activity.\n"];
  workflow_type: workflow_type
    [@ocaml.doc "The type of the child workflow execution.\n"];
  workflow_id: workflow_id
    [@ocaml.doc "The [workflowId] of the child workflow execution.\n"]}
[@@ocaml.doc
  "Provides the details of the [StartChildWorkflowExecutionInitiated] event.\n"]
type nonrec start_child_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""]
  | DEFAULT_CHILD_POLICY_UNDEFINED [@ocaml.doc ""]
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED [@ocaml.doc ""]
  | DEFAULT_TASK_LIST_UNDEFINED [@ocaml.doc ""]
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED [@ocaml.doc ""]
  | WORKFLOW_ALREADY_RUNNING [@ocaml.doc ""]
  | CHILD_CREATION_RATE_EXCEEDED [@ocaml.doc ""]
  | OPEN_WORKFLOWS_LIMIT_EXCEEDED [@ocaml.doc ""]
  | OPEN_CHILDREN_LIMIT_EXCEEDED [@ocaml.doc ""]
  | WORKFLOW_TYPE_DEPRECATED [@ocaml.doc ""]
  | WORKFLOW_TYPE_DOES_NOT_EXIST [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec start_child_workflow_execution_failed_event_attributes =
  {
  control: data option
    [@ocaml.doc
      "The data attached to the event that the decider can use in subsequent workflow tasks. This data isn't sent to the child workflow execution.\n"];
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [StartChildWorkflowExecution] [Decision] to request this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events.\n"];
  initiated_event_id: event_id
    [@ocaml.doc
      "When the [cause] is [WORKFLOW_ALREADY_RUNNING], [initiatedEventId] is the ID of the [StartChildWorkflowExecutionInitiated] event that corresponds to the [StartChildWorkflowExecution] [Decision] to start the workflow execution. You can use this information to diagnose problems by tracing back the chain of events leading up to this event.\n\n When the [cause] isn't [WORKFLOW_ALREADY_RUNNING], [initiatedEventId] is set to [0] because the [StartChildWorkflowExecutionInitiated] event doesn't exist.\n "];
  workflow_id: workflow_id
    [@ocaml.doc "The [workflowId] of the child workflow execution.\n"];
  cause: start_child_workflow_execution_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  When [cause] is set to [OPERATION_NOT_PERMITTED], the decision fails because it lacks sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html} Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  workflow_type: workflow_type
    [@ocaml.doc
      "The workflow type provided in the [StartChildWorkflowExecution] [Decision] that failed.\n"]}
[@@ocaml.doc
  "Provides the details of the [StartChildWorkflowExecutionFailed] event.\n"]
type nonrec start_child_workflow_execution_decision_attributes =
  {
  lambda_role: arn option
    [@ocaml.doc "The IAM role attached to the child workflow execution.\n"];
  tag_list: tag_list option
    [@ocaml.doc
      "The list of tags to associate with the child workflow execution. A maximum of 5 tags can be specified. You can list workflow executions with a specific tag by calling [ListOpenWorkflowExecutions] or [ListClosedWorkflowExecutions] and specifying a [TagFilter].\n"];
  child_policy: child_policy option
    [@ocaml.doc
      " If set, specifies the policy to use for the child workflow executions if the workflow execution being started is terminated by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout. This policy overrides the default child policy specified when registering the workflow type using [RegisterWorkflowType].\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n    A child policy for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default child policy was specified at registration time then a fault is returned.\n    \n     "];
  task_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "Specifies the maximum duration of decision tasks for this workflow execution. This parameter overrides the [defaultTaskStartToCloseTimout] specified when registering the workflow type using [RegisterWorkflowType].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n \n   A task start-to-close timeout for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default task start-to-close timeout was specified at registration time then a fault is returned.\n   \n    "];
  task_priority: task_priority option
    [@ocaml.doc
      " A task priority that, if set, specifies the priority for a decision task of this workflow execution. This overrides the defaultTaskPriority specified when registering the workflow type. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n\n For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.\n "];
  task_list: task_list option
    [@ocaml.doc
      "The name of the task list to be used for decision tasks of the child workflow execution.\n\n  A task list for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default task list was specified at registration time then a fault is returned.\n  \n    The specified string must not start or end with whitespace. It must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n    "];
  execution_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The total duration for this workflow execution. This overrides the defaultExecutionStartToCloseTimeout specified when registering the workflow type.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n \n   An execution start-to-close timeout for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default execution start-to-close timeout was specified at registration time then a fault is returned.\n   \n    "];
  input: data option
    [@ocaml.doc "The input to be provided to the workflow execution.\n"];
  control: data option
    [@ocaml.doc
      "The data attached to the event that can be used by the decider in subsequent workflow tasks. This data isn't sent to the child workflow execution.\n"];
  workflow_id: workflow_id
    [@ocaml.doc
      " The [workflowId] of the workflow execution.\n\n The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n "];
  workflow_type: workflow_type
    [@ocaml.doc " The type of the workflow execution to be started.\n"]}
[@@ocaml.doc
  "Provides the details of the [StartChildWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [tagList.member.N] \226\128\147 The key is \"swf:tagList.N\" where N is the tag number from 0 to 4, inclusive.\n                        \n                         }\n                    {-   [taskList] \226\128\147 String constraint. The key is [swf:taskList.name].\n                        \n                         }\n                    {-   [workflowType.name] \226\128\147 String constraint. The key is [swf:workflowType.name].\n                        \n                         }\n                    {-   [workflowType.version] \226\128\147 String constraint. The key is [swf:workflowType.version].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec start_at_previous_started_event = bool[@@ocaml.doc ""]
type nonrec signal_workflow_execution_input =
  {
  input: data option
    [@ocaml.doc
      "Data to attach to the [WorkflowExecutionSignaled] event in the target workflow execution's history.\n"];
  signal_name: signal_name
    [@ocaml.doc
      "The name of the signal. This name must be meaningful to the target workflow.\n"];
  run_id: workflow_run_id_optional option
    [@ocaml.doc "The runId of the workflow execution to signal.\n"];
  workflow_id: workflow_id
    [@ocaml.doc "The workflowId of the workflow execution to signal.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain containing the workflow execution to signal.\n"]}
[@@ocaml.doc ""]
type nonrec decision_type =
  | ScheduleLambdaFunction [@ocaml.doc ""]
  | StartChildWorkflowExecution [@ocaml.doc ""]
  | RequestCancelExternalWorkflowExecution [@ocaml.doc ""]
  | SignalExternalWorkflowExecution [@ocaml.doc ""]
  | CancelTimer [@ocaml.doc ""]
  | StartTimer [@ocaml.doc ""]
  | RecordMarker [@ocaml.doc ""]
  | ContinueAsNewWorkflowExecution [@ocaml.doc ""]
  | CancelWorkflowExecution [@ocaml.doc ""]
  | FailWorkflowExecution [@ocaml.doc ""]
  | CompleteWorkflowExecution [@ocaml.doc ""]
  | RequestCancelActivityTask [@ocaml.doc ""]
  | ScheduleActivityTask [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec activity_id = string[@@ocaml.doc ""]
type nonrec schedule_activity_task_decision_attributes =
  {
  heartbeat_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "If set, specifies the maximum time before which a worker processing a task of this type must report progress by calling [RecordActivityTaskHeartbeat]. If the timeout is exceeded, the activity task is automatically timed out. If the worker subsequently attempts to record a heartbeat or returns a result, it is ignored. This overrides the default heartbeat timeout specified when registering the activity type using [RegisterActivityType].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "If set, specifies the maximum duration a worker may take to process this activity task. This overrides the default start-to-close timeout specified when registering the activity type using [RegisterActivityType].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n \n   A start-to-close timeout for this activity task must be specified either as a default for the activity type or through this field. If neither this field is set nor a default start-to-close timeout was specified at registration time then a fault is returned.\n   \n    "];
  schedule_to_start_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      " If set, specifies the maximum duration the activity task can wait to be assigned to a worker. This overrides the default schedule-to-start timeout specified when registering the activity type using [RegisterActivityType].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n \n   A schedule-to-start timeout for this activity task must be specified either as a default for the activity type or through this field. If neither this field is set nor a default schedule-to-start timeout was specified at registration time then a fault is returned.\n   \n    "];
  task_priority: task_priority option
    [@ocaml.doc
      " If set, specifies the priority with which the activity task is to be assigned to a worker. This overrides the defaultTaskPriority specified when registering the activity type using [RegisterActivityType]. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n\n For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.\n "];
  task_list: task_list option
    [@ocaml.doc
      "If set, specifies the name of the task list in which to schedule the activity task. If not specified, the [defaultTaskList] registered with the activity type is used.\n\n  A task list for this activity task must be specified either as a default for the activity type or through this field. If neither this field is set nor a default task list was specified at registration time then a fault is returned.\n  \n    The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n    "];
  schedule_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum duration for this activity task.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n \n   A schedule-to-close timeout for this activity task must be specified either as a default for the activity type or through this field. If neither this field is set nor a default schedule-to-close timeout was specified at registration time then a fault is returned.\n   \n    "];
  input: data option
    [@ocaml.doc "The input provided to the activity task.\n"];
  control: data option
    [@ocaml.doc
      "Data attached to the event that can be used by the decider in subsequent workflow tasks. This data isn't sent to the activity.\n"];
  activity_id: activity_id
    [@ocaml.doc
      " The [activityId] of the activity task.\n\n The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n "];
  activity_type: activity_type
    [@ocaml.doc " The type of the activity task to schedule.\n"]}[@@ocaml.doc
                                                                   "Provides the details of the [ScheduleActivityTask] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [activityType.name] \226\128\147 String constraint. The key is [swf:activityType.name].\n                        \n                         }\n                    {-   [activityType.version] \226\128\147 String constraint. The key is [swf:activityType.version].\n                        \n                         }\n                    {-   [taskList] \226\128\147 String constraint. The key is [swf:taskList.name].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec request_cancel_activity_task_decision_attributes =
  {
  activity_id: activity_id
    [@ocaml.doc "The [activityId] of the activity task to be canceled.\n"]}
[@@ocaml.doc
  "Provides the details of the [RequestCancelActivityTask] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec complete_workflow_execution_decision_attributes =
  {
  result: data option
    [@ocaml.doc
      "The result of the workflow execution. The form of the result is implementation defined.\n"]}
[@@ocaml.doc
  "Provides the details of the [CompleteWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec fail_workflow_execution_decision_attributes =
  {
  details: data option [@ocaml.doc " Details of the failure.\n"];
  reason: failure_reason option
    [@ocaml.doc
      "A descriptive reason for the failure that may help in diagnostics.\n"]}
[@@ocaml.doc
  "Provides the details of the [FailWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec cancel_workflow_execution_decision_attributes =
  {
  details: data option [@ocaml.doc " Details of the cancellation.\n"]}
[@@ocaml.doc
  "Provides the details of the [CancelWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec continue_as_new_workflow_execution_decision_attributes =
  {
  lambda_role: arn option
    [@ocaml.doc "The IAM role to attach to the new (continued) execution.\n"];
  workflow_type_version: version option
    [@ocaml.doc "The version of the workflow to start.\n"];
  tag_list: tag_list option
    [@ocaml.doc
      "The list of tags to associate with the new workflow execution. A maximum of 5 tags can be specified. You can list workflow executions with a specific tag by calling [ListOpenWorkflowExecutions] or [ListClosedWorkflowExecutions] and specifying a [TagFilter].\n"];
  child_policy: child_policy option
    [@ocaml.doc
      "If set, specifies the policy to use for the child workflow executions of the new execution if it is terminated by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout. This policy overrides the default child policy specified when registering the workflow type using [RegisterWorkflowType].\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n    A child policy for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default child policy was specified at registration time then a fault is returned.\n    \n     "];
  task_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "Specifies the maximum duration of decision tasks for the new workflow execution. This parameter overrides the [defaultTaskStartToCloseTimout] specified when registering the workflow type using [RegisterWorkflowType].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n \n   A task start-to-close timeout for the new workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default task start-to-close timeout was specified at registration time then a fault is returned.\n   \n    "];
  task_priority: task_priority option
    [@ocaml.doc
      " The task priority that, if set, specifies the priority for the decision tasks for this workflow execution. This overrides the defaultTaskPriority specified when registering the workflow type. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n\n For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.\n "];
  task_list: task_list option
    [@ocaml.doc
      "The task list to use for the decisions of the new (continued) workflow execution.\n"];
  execution_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "If set, specifies the total duration for this workflow execution. This overrides the [defaultExecutionStartToCloseTimeout] specified when registering the workflow type.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n \n   An execution start-to-close timeout for this workflow execution must be specified either as a default for the workflow type or through this field. If neither this field is set nor a default execution start-to-close timeout was specified at registration time then a fault is returned.\n   \n    "];
  input: data option
    [@ocaml.doc "The input provided to the new workflow execution.\n"]}
[@@ocaml.doc
  "Provides the details of the [ContinueAsNewWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [tag] \226\128\147 A tag used to identify the workflow execution\n                        \n                         }\n                    {-   [taskList] \226\128\147 String constraint. The key is [swf:taskList.name].\n                        \n                         }\n                    {-   [workflowType.version] \226\128\147 String constraint. The key is [swf:workflowType.version].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec marker_name = string[@@ocaml.doc ""]
type nonrec record_marker_decision_attributes =
  {
  details: data option [@ocaml.doc " The details of the marker.\n"];
  marker_name: marker_name [@ocaml.doc " The name of the marker.\n"]}
[@@ocaml.doc
  "Provides the details of the [RecordMarker] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec cancel_timer_decision_attributes =
  {
  timer_id: timer_id [@ocaml.doc " The unique ID of the timer to cancel.\n"]}
[@@ocaml.doc
  "Provides the details of the [CancelTimer] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec signal_external_workflow_execution_decision_attributes =
  {
  control: data option
    [@ocaml.doc
      "The data attached to the event that can be used by the decider in subsequent decision tasks.\n"];
  input: data option
    [@ocaml.doc
      " The input data to be provided with the signal. The target workflow execution uses the signal name and input data to process the signal.\n"];
  signal_name: signal_name
    [@ocaml.doc
      " The name of the signal.The target workflow execution uses the signal name and input to process the signal.\n"];
  run_id: workflow_run_id_optional option
    [@ocaml.doc "The [runId] of the workflow execution to be signaled.\n"];
  workflow_id: workflow_id
    [@ocaml.doc
      " The [workflowId] of the workflow execution to be signaled.\n"]}
[@@ocaml.doc
  "Provides the details of the [SignalExternalWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec request_cancel_external_workflow_execution_decision_attributes =
  {
  control: data option
    [@ocaml.doc
      "The data attached to the event that can be used by the decider in subsequent workflow tasks.\n"];
  run_id: workflow_run_id_optional option
    [@ocaml.doc
      "The [runId] of the external workflow execution to cancel.\n"];
  workflow_id: workflow_id
    [@ocaml.doc
      " The [workflowId] of the external workflow execution to cancel.\n"]}
[@@ocaml.doc
  "Provides the details of the [RequestCancelExternalWorkflowExecution] decision.\n\n  {b Access Control} \n \n  You can use IAM policies to control this decision's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
type nonrec function_id = string[@@ocaml.doc ""]
type nonrec function_name = string[@@ocaml.doc ""]
type nonrec function_input = string[@@ocaml.doc ""]
type nonrec schedule_lambda_function_decision_attributes =
  {
  start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The timeout value, in seconds, after which the Lambda function is considered to be failed once it has started. This can be any integer from 1-900 (1s-15m).\n\n If no value is supplied, then a default value of 900s is assumed.\n "];
  input: function_input option
    [@ocaml.doc
      "The optional input data to be supplied to the Lambda function.\n"];
  control: data option
    [@ocaml.doc
      "The data attached to the event that the decider can use in subsequent workflow tasks. This data isn't sent to the Lambda task.\n"];
  name: function_name
    [@ocaml.doc "The name, or ARN, of the Lambda function to schedule.\n"];
  id: function_id
    [@ocaml.doc
      "A string that identifies the Lambda function execution in the event history.\n"]}
[@@ocaml.doc
  "Decision attributes specified in [scheduleLambdaFunctionDecisionAttributes] within the list of decisions [decisions] passed to [RespondDecisionTaskCompleted].\n"]
type nonrec decision =
  {
  schedule_lambda_function_decision_attributes:
    schedule_lambda_function_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [ScheduleLambdaFunction] decision. It isn't set for other decision types.\n"];
  start_child_workflow_execution_decision_attributes:
    start_child_workflow_execution_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [StartChildWorkflowExecution] decision. It isn't set for other decision types.\n"];
  request_cancel_external_workflow_execution_decision_attributes:
    request_cancel_external_workflow_execution_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [RequestCancelExternalWorkflowExecution] decision. It isn't set for other decision types.\n"];
  signal_external_workflow_execution_decision_attributes:
    signal_external_workflow_execution_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [SignalExternalWorkflowExecution] decision. It isn't set for other decision types.\n"];
  cancel_timer_decision_attributes: cancel_timer_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [CancelTimer] decision. It isn't set for other decision types.\n"];
  start_timer_decision_attributes: start_timer_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [StartTimer] decision. It isn't set for other decision types.\n"];
  record_marker_decision_attributes: record_marker_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [RecordMarker] decision. It isn't set for other decision types.\n"];
  continue_as_new_workflow_execution_decision_attributes:
    continue_as_new_workflow_execution_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [ContinueAsNewWorkflowExecution] decision. It isn't set for other decision types.\n"];
  cancel_workflow_execution_decision_attributes:
    cancel_workflow_execution_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [CancelWorkflowExecution] decision. It isn't set for other decision types.\n"];
  fail_workflow_execution_decision_attributes:
    fail_workflow_execution_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [FailWorkflowExecution] decision. It isn't set for other decision types.\n"];
  complete_workflow_execution_decision_attributes:
    complete_workflow_execution_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [CompleteWorkflowExecution] decision. It isn't set for other decision types.\n"];
  request_cancel_activity_task_decision_attributes:
    request_cancel_activity_task_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [RequestCancelActivityTask] decision. It isn't set for other decision types.\n"];
  schedule_activity_task_decision_attributes:
    schedule_activity_task_decision_attributes option
    [@ocaml.doc
      "Provides the details of the [ScheduleActivityTask] decision. It isn't set for other decision types.\n"];
  decision_type: decision_type
    [@ocaml.doc "Specifies the type of the decision.\n"]}[@@ocaml.doc
                                                           "Specifies a decision made by the decider. A decision can be one of these types:\n\n {ul\n       {-   [CancelTimer] \226\128\147 Cancels a previously started timer and records a [TimerCanceled] event in the history.\n           \n            }\n       {-   [CancelWorkflowExecution] \226\128\147 Closes the workflow execution and records a [WorkflowExecutionCanceled] event in the history.\n           \n            }\n       {-   [CompleteWorkflowExecution] \226\128\147 Closes the workflow execution and records a [WorkflowExecutionCompleted] event in the history .\n           \n            }\n       {-   [ContinueAsNewWorkflowExecution] \226\128\147 Closes the workflow execution and starts a new workflow execution of the same type using the same workflow ID and a unique run Id. A [WorkflowExecutionContinuedAsNew] event is recorded in the history.\n           \n            }\n       {-   [FailWorkflowExecution] \226\128\147 Closes the workflow execution and records a [WorkflowExecutionFailed] event in the history.\n           \n            }\n       {-   [RecordMarker] \226\128\147 Records a [MarkerRecorded] event in the history. Markers can be used for adding custom information in the history for instance to let deciders know that they don't need to look at the history beyond the marker event.\n           \n            }\n       {-   [RequestCancelActivityTask] \226\128\147 Attempts to cancel a previously scheduled activity task. If the activity task was scheduled but has not been assigned to a worker, then it is canceled. If the activity task was already assigned to a worker, then the worker is informed that cancellation has been requested in the response to [RecordActivityTaskHeartbeat].\n           \n            }\n       {-   [RequestCancelExternalWorkflowExecution] \226\128\147 Requests that a request be made to cancel the specified external workflow execution and records a [RequestCancelExternalWorkflowExecutionInitiated] event in the history.\n           \n            }\n       {-   [ScheduleActivityTask] \226\128\147 Schedules an activity task.\n           \n            }\n       {-   [SignalExternalWorkflowExecution] \226\128\147 Requests a signal to be delivered to the specified external workflow execution and records a [SignalExternalWorkflowExecutionInitiated] event in the history.\n           \n            }\n       {-   [StartChildWorkflowExecution] \226\128\147 Requests that a child workflow execution be started and records a [StartChildWorkflowExecutionInitiated] event in the history. The child workflow execution is a separate workflow execution with its own history.\n           \n            }\n       {-   [StartTimer] \226\128\147 Starts a timer for this workflow execution and records a [TimerStarted] event in the history. This timer fires after the specified delay and record a [TimerFired] event.\n           \n            }\n       }\n    {b Access Control} \n   \n    If you grant permission to use [RespondDecisionTaskCompleted], you can use IAM policies to express permissions for the list of decisions returned by this action as if they were members of the API. Treating decisions as a pseudo API maintains a uniform conceptual model and helps keep policies readable. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n    \n      {b Decision Failure} \n     \n      Decisions can fail for several reasons\n      \n       {ul\n             {-  The ordering of decisions should follow a logical flow. Some decisions might not make sense in the current context of the workflow execution and therefore fails.\n                 \n                  }\n             {-  A limit on your account was reached.\n                 \n                  }\n             {-  The decision lacks sufficient permissions.\n                 \n                  }\n             }\n   One of the following events might be added to the history to indicate an error. The event attribute's [cause] parameter indicates the cause. If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   \n    {ul\n          {-   [ScheduleActivityTaskFailed] \226\128\147 A [ScheduleActivityTask] decision failed. This could happen if the activity type specified in the decision isn't registered, is in a deprecated state, or the decision isn't properly configured.\n              \n               }\n          {-   [RequestCancelActivityTaskFailed] \226\128\147 A [RequestCancelActivityTask] decision failed. This could happen if there is no open activity task with the specified activityId.\n              \n               }\n          {-   [StartTimerFailed] \226\128\147 A [StartTimer] decision failed. This could happen if there is another open timer with the same timerId.\n              \n               }\n          {-   [CancelTimerFailed] \226\128\147 A [CancelTimer] decision failed. This could happen if there is no open timer with the specified timerId.\n              \n               }\n          {-   [StartChildWorkflowExecutionFailed] \226\128\147 A [StartChildWorkflowExecution] decision failed. This could happen if the workflow type specified isn't registered, is deprecated, or the decision isn't properly configured.\n              \n               }\n          {-   [SignalExternalWorkflowExecutionFailed] \226\128\147 A [SignalExternalWorkflowExecution] decision failed. This could happen if the [workflowID] specified in the decision was incorrect.\n              \n               }\n          {-   [RequestCancelExternalWorkflowExecutionFailed] \226\128\147 A [RequestCancelExternalWorkflowExecution] decision failed. This could happen if the [workflowID] specified in the decision was incorrect.\n              \n               }\n          {-   [CancelWorkflowExecutionFailed] \226\128\147 A [CancelWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution.\n              \n               }\n          {-   [CompleteWorkflowExecutionFailed] \226\128\147 A [CompleteWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution.\n              \n               }\n          {-   [ContinueAsNewWorkflowExecutionFailed] \226\128\147 A [ContinueAsNewWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution or the ContinueAsNewWorkflowExecution decision was not configured correctly.\n              \n               }\n          {-   [FailWorkflowExecutionFailed] \226\128\147 A [FailWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution.\n              \n               }\n          }\n   The preceding error events might occur due to an error in the decider logic, which might put the workflow execution in an unstable state The cause field in the event structure for the error event indicates the cause of the error.\n   \n     A workflow execution may be closed by the decider by returning one of the following decisions when completing a decision task: [CompleteWorkflowExecution], [FailWorkflowExecution], [CancelWorkflowExecution] and [ContinueAsNewWorkflowExecution]. An [UnhandledDecision] fault is returned if a workflow closing decision is specified and a signal or activity event had been added to the history while the decision task was being performed by the decider. Unlike the above situations which are logic issues, this fault is always possible because of race conditions in a distributed system. The right action here is to call [RespondDecisionTaskCompleted] without any decisions. This would result in another decision task with these new events included in the history. The decider should handle the new events and may decide to close the workflow execution.\n     \n        {b How to Code a Decision} \n       \n        You code a decision by first setting the decision type field to one of the above decision values, and then set the corresponding attributes field shown below:\n        \n         {ul\n               {-   \n                   {[\n                    [ScheduleActivityTaskDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [RequestCancelActivityTaskDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [CompleteWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [FailWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [CancelWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [ContinueAsNewWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [RecordMarkerDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [StartTimerDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [CancelTimerDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [SignalExternalWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [RequestCancelExternalWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               {-   \n                   {[\n                    [StartChildWorkflowExecutionDecisionAttributes] \n                   ]}\n                    \n                   \n                    }\n               }\n  "]
type nonrec decision_list = decision list[@@ocaml.doc ""]
type nonrec respond_decision_task_completed_input =
  {
  task_list_schedule_to_start_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "Specifies a timeout (in seconds) for the task list override. When this parameter is missing, the task list override is permanent. This parameter makes it possible to temporarily override the task list. If a decision task scheduled on the override task list is not started within the timeout, the decision task will time out. Amazon SWF will revert the override and schedule a new decision task to the original task list.\n\n If a decision task scheduled on the override task list is started within the timeout, but not completed within the start-to-close timeout, Amazon SWF will also revert the override and schedule a new decision task to the original task list.\n "];
  task_list: task_list option
    [@ocaml.doc
      "The task list to use for the future decision tasks of this workflow execution. This list overrides the original task list you specified while starting the workflow execution. \n"];
  execution_context: data option
    [@ocaml.doc "User defined context to add to workflow execution.\n"];
  decisions: decision_list option
    [@ocaml.doc
      "The list of decisions (possibly empty) made by the decider while processing this decision task. See the docs for the [Decision] structure for details.\n"];
  task_token: task_token
    [@ocaml.doc
      "The [taskToken] from the [DecisionTask].\n\n   [taskToken] is generated by the service and should be treated as an opaque value. If the task is passed to another process, its [taskToken] must also be passed. This enables it to provide its progress and respond with results.\n  \n   "]}
[@@ocaml.doc "Input data for a TaskCompleted response to a decision task.\n"]
type nonrec respond_activity_task_failed_input =
  {
  details: data option
    [@ocaml.doc " Detailed information about the failure.\n"];
  reason: failure_reason option
    [@ocaml.doc "Description of the error that may assist in diagnostics.\n"];
  task_token: task_token
    [@ocaml.doc
      "The [taskToken] of the [ActivityTask].\n\n   [taskToken] is generated by the service and should be treated as an opaque value. If the task is passed to another process, its [taskToken] must also be passed. This enables it to provide its progress and respond with results.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec respond_activity_task_completed_input =
  {
  result: data option
    [@ocaml.doc
      "The result of the activity task. It is a free form string that is implementation specific.\n"];
  task_token: task_token
    [@ocaml.doc
      "The [taskToken] of the [ActivityTask].\n\n   [taskToken] is generated by the service and should be treated as an opaque value. If the task is passed to another process, its [taskToken] must also be passed. This enables it to provide its progress and respond with results.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec respond_activity_task_canceled_input =
  {
  details: data option [@ocaml.doc " Information about the cancellation.\n"];
  task_token: task_token
    [@ocaml.doc
      "The [taskToken] of the [ActivityTask].\n\n   [taskToken] is generated by the service and should be treated as an opaque value. If the task is passed to another process, its [taskToken] must also be passed. This enables it to provide its progress and respond with results.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec request_cancel_workflow_execution_input =
  {
  run_id: workflow_run_id_optional option
    [@ocaml.doc "The runId of the workflow execution to cancel.\n"];
  workflow_id: workflow_id
    [@ocaml.doc "The workflowId of the workflow execution to cancel.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain containing the workflow execution to cancel.\n"]}
[@@ocaml.doc ""]
type nonrec register_workflow_type_input =
  {
  default_lambda_role: arn option
    [@ocaml.doc
      "The default IAM role attached to this workflow type.\n\n  Executions of this workflow type need IAM roles to invoke Lambda functions. If you don't specify an IAM role when you start this workflow type, the default Lambda role is attached to the execution. For more information, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html}https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  default_child_policy: child_policy option
    [@ocaml.doc
      "If set, specifies the default policy to use for the child workflow executions when a workflow execution of this type is terminated, by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].\n\n The supported child policies are:\n \n  {ul\n        {-   [TERMINATE] \226\128\147 The child executions are terminated.\n            \n             }\n        {-   [REQUEST_CANCEL] \226\128\147 A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n            \n             }\n        {-   [ABANDON] \226\128\147 No action is taken. The child executions continue to run.\n            \n             }\n        }\n  "];
  default_task_priority: task_priority option
    [@ocaml.doc
      "The default task priority to assign to the workflow type. If not assigned, then [0] is used. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n\n For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.\n "];
  default_task_list: task_list option
    [@ocaml.doc
      "If set, specifies the default task list to use for scheduling decision tasks for executions of this workflow type. This default is used only if a task list isn't provided when starting the execution through the [StartWorkflowExecution] Action or [StartChildWorkflowExecution] [Decision].\n"];
  default_execution_start_to_close_timeout:
    duration_in_seconds_optional option
    [@ocaml.doc
      "If set, specifies the default maximum duration for executions of this workflow type. You can override this default when starting an execution through the [StartWorkflowExecution] Action or [StartChildWorkflowExecution] [Decision].\n\n The duration is specified in seconds; an integer greater than or equal to 0. Unlike some of the other timeout parameters in Amazon SWF, you cannot specify a value of \"NONE\" for [defaultExecutionStartToCloseTimeout]; there is a one-year max limit on the time that a workflow execution can run. Exceeding this limit always causes the workflow execution to time out.\n "];
  default_task_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "If set, specifies the default maximum duration of decision tasks for this workflow type. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  description: description option
    [@ocaml.doc "Textual description of the workflow type.\n"];
  version: version
    [@ocaml.doc
      "The version of the workflow type.\n\n  The workflow type consists of the name and version, the combination of which must be unique within the domain. To get a list of all currently registered workflow types, use the [ListWorkflowTypes] action.\n  \n    The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n    "];
  name: name
    [@ocaml.doc
      "The name of the workflow type.\n\n The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n "];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain in which to register the workflow type.\n"]}
[@@ocaml.doc ""]
type nonrec duration_in_days = string[@@ocaml.doc ""]
type nonrec register_domain_input =
  {
  tags: resource_tag_list option
    [@ocaml.doc
      "Tags to be added when registering a domain.\n\n Tags may only contain unicode letters, digits, whitespace, or these symbols: [_ . : / = + - @].\n "];
  workflow_execution_retention_period_in_days: duration_in_days
    [@ocaml.doc
      "The duration (in days) that records and histories of workflow executions on the domain should be kept by the service. After the retention period, the workflow execution isn't available in the results of visibility calls.\n\n If you pass the value [NONE] or [0] (zero), then the workflow execution history isn't retained. As soon as the workflow execution completes, the execution record and its history are deleted.\n \n  The maximum workflow execution retention period is 90 days. For more information about Amazon SWF service limits, see: {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-limits.html}Amazon SWF Service Limits} in the {i Amazon SWF Developer Guide}.\n  "];
  description: description option
    [@ocaml.doc "A text description of the domain.\n"];
  name: domain_name
    [@ocaml.doc
      "Name of the domain to register. The name must be unique in the region that the domain is registered in.\n\n The specified string must not start or end with whitespace. It must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n "]}
[@@ocaml.doc ""]
type nonrec register_activity_type_input =
  {
  default_task_schedule_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "If set, specifies the default maximum duration for a task of this activity type. This default can be overridden when scheduling an activity task using the [ScheduleActivityTask] [Decision].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  default_task_schedule_to_start_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "If set, specifies the default maximum duration that a task of this activity type can wait before being assigned to a worker. This default can be overridden when scheduling an activity task using the [ScheduleActivityTask] [Decision].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  default_task_priority: task_priority option
    [@ocaml.doc
      "The default task priority to assign to the activity type. If not assigned, then [0] is used. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n\n For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i in the {i Amazon SWF Developer Guide}.}.\n "];
  default_task_list: task_list option
    [@ocaml.doc
      "If set, specifies the default task list to use for scheduling tasks of this activity type. This default task list is used if a task list isn't provided when a task is scheduled through the [ScheduleActivityTask] [Decision].\n"];
  default_task_heartbeat_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "If set, specifies the default maximum time before which a worker processing a task of this type must report progress by calling [RecordActivityTaskHeartbeat]. If the timeout is exceeded, the activity task is automatically timed out. This default can be overridden when scheduling an activity task using the [ScheduleActivityTask] [Decision]. If the activity worker subsequently attempts to record a heartbeat or returns a result, the activity worker receives an [UnknownResource] fault. In this case, Amazon SWF no longer considers the activity task to be valid; the activity worker should clean up the activity task.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  default_task_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "If set, specifies the default maximum duration that a worker can take to process tasks of this activity type. This default can be overridden when scheduling an activity task using the [ScheduleActivityTask] [Decision].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  description: description option
    [@ocaml.doc "A textual description of the activity type.\n"];
  version: version
    [@ocaml.doc
      "The version of the activity type.\n\n  The activity type consists of the name and version, the combination of which must be unique within the domain.\n  \n    The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n    "];
  name: name
    [@ocaml.doc
      "The name of the activity type within the domain.\n\n The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n "];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain in which this activity is to be registered.\n"]}
[@@ocaml.doc ""]
type nonrec activity_task_status =
  {
  cancel_requested: canceled
    [@ocaml.doc "Set to [true] if cancellation of the task is requested.\n"]}
[@@ocaml.doc "Status information about an activity task.\n"]
type nonrec limited_data = string[@@ocaml.doc ""]
type nonrec record_activity_task_heartbeat_input =
  {
  details: limited_data option
    [@ocaml.doc
      "If specified, contains details about the progress of the task.\n"];
  task_token: task_token
    [@ocaml.doc
      "The [taskToken] of the [ActivityTask].\n\n   [taskToken] is generated by the service and should be treated as an opaque value. If the task is passed to another process, its [taskToken] must also be passed. This enables it to provide its progress and respond with results. \n  \n   "]}
[@@ocaml.doc ""]
type nonrec event_type =
  | StartLambdaFunctionFailed [@ocaml.doc ""]
  | ScheduleLambdaFunctionFailed [@ocaml.doc ""]
  | LambdaFunctionTimedOut [@ocaml.doc ""]
  | LambdaFunctionFailed [@ocaml.doc ""]
  | LambdaFunctionCompleted [@ocaml.doc ""]
  | LambdaFunctionStarted [@ocaml.doc ""]
  | LambdaFunctionScheduled [@ocaml.doc ""]
  | ExternalWorkflowExecutionCancelRequested [@ocaml.doc ""]
  | RequestCancelExternalWorkflowExecutionFailed [@ocaml.doc ""]
  | RequestCancelExternalWorkflowExecutionInitiated [@ocaml.doc ""]
  | ExternalWorkflowExecutionSignaled [@ocaml.doc ""]
  | SignalExternalWorkflowExecutionFailed [@ocaml.doc ""]
  | SignalExternalWorkflowExecutionInitiated [@ocaml.doc ""]
  | ChildWorkflowExecutionTerminated [@ocaml.doc ""]
  | ChildWorkflowExecutionCanceled [@ocaml.doc ""]
  | ChildWorkflowExecutionTimedOut [@ocaml.doc ""]
  | ChildWorkflowExecutionFailed [@ocaml.doc ""]
  | ChildWorkflowExecutionCompleted [@ocaml.doc ""]
  | ChildWorkflowExecutionStarted [@ocaml.doc ""]
  | StartChildWorkflowExecutionFailed [@ocaml.doc ""]
  | StartChildWorkflowExecutionInitiated [@ocaml.doc ""]
  | CancelTimerFailed [@ocaml.doc ""]
  | TimerCanceled [@ocaml.doc ""]
  | TimerFired [@ocaml.doc ""]
  | StartTimerFailed [@ocaml.doc ""]
  | TimerStarted [@ocaml.doc ""]
  | RecordMarkerFailed [@ocaml.doc ""]
  | MarkerRecorded [@ocaml.doc ""]
  | WorkflowExecutionSignaled [@ocaml.doc ""]
  | RequestCancelActivityTaskFailed [@ocaml.doc ""]
  | ActivityTaskCancelRequested [@ocaml.doc ""]
  | ActivityTaskCanceled [@ocaml.doc ""]
  | ActivityTaskTimedOut [@ocaml.doc ""]
  | ActivityTaskFailed [@ocaml.doc ""]
  | ActivityTaskCompleted [@ocaml.doc ""]
  | ActivityTaskStarted [@ocaml.doc ""]
  | ScheduleActivityTaskFailed [@ocaml.doc ""]
  | ActivityTaskScheduled [@ocaml.doc ""]
  | DecisionTaskTimedOut [@ocaml.doc ""]
  | DecisionTaskCompleted [@ocaml.doc ""]
  | DecisionTaskStarted [@ocaml.doc ""]
  | DecisionTaskScheduled [@ocaml.doc ""]
  | WorkflowExecutionTerminated [@ocaml.doc ""]
  | ContinueAsNewWorkflowExecutionFailed [@ocaml.doc ""]
  | WorkflowExecutionContinuedAsNew [@ocaml.doc ""]
  | CancelWorkflowExecutionFailed [@ocaml.doc ""]
  | WorkflowExecutionCanceled [@ocaml.doc ""]
  | WorkflowExecutionTimedOut [@ocaml.doc ""]
  | FailWorkflowExecutionFailed [@ocaml.doc ""]
  | WorkflowExecutionFailed [@ocaml.doc ""]
  | CompleteWorkflowExecutionFailed [@ocaml.doc ""]
  | WorkflowExecutionCompleted [@ocaml.doc ""]
  | WorkflowExecutionCancelRequested [@ocaml.doc ""]
  | WorkflowExecutionStarted [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec complete_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""]
  | UNHANDLED_DECISION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec complete_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CompleteWorkflowExecution] decision to complete this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  cause: complete_workflow_execution_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "]}
[@@ocaml.doc
  "Provides the details of the [CompleteWorkflowExecutionFailed] event.\n"]
type nonrec fail_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""]
  | UNHANDLED_DECISION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec fail_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [FailWorkflowExecution] decision to fail this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  cause: fail_workflow_execution_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "]}
[@@ocaml.doc
  "Provides the details of the [FailWorkflowExecutionFailed] event.\n"]
type nonrec cancel_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""]
  | UNHANDLED_DECISION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec cancel_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CancelWorkflowExecution] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  cause: cancel_workflow_execution_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "]}
[@@ocaml.doc
  "Provides the details of the [CancelWorkflowExecutionFailed] event.\n"]
type nonrec continue_as_new_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""]
  | CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED [@ocaml.doc ""]
  | DEFAULT_CHILD_POLICY_UNDEFINED [@ocaml.doc ""]
  | DEFAULT_TASK_LIST_UNDEFINED [@ocaml.doc ""]
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED [@ocaml.doc ""]
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED [@ocaml.doc ""]
  | WORKFLOW_TYPE_DOES_NOT_EXIST [@ocaml.doc ""]
  | WORKFLOW_TYPE_DEPRECATED [@ocaml.doc ""]
  | UNHANDLED_DECISION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec continue_as_new_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [ContinueAsNewWorkflowExecution] decision that started this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  cause: continue_as_new_workflow_execution_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "]}
[@@ocaml.doc
  "Provides the details of the [ContinueAsNewWorkflowExecutionFailed] event.\n"]
type nonrec decision_task_scheduled_event_attributes =
  {
  schedule_to_start_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum amount of time the decision task can wait to be assigned to a worker.\n"];
  start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum duration for this decision task. The task is considered timed out if it doesn't completed within this duration.\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  task_priority: task_priority option
    [@ocaml.doc
      " A task priority that, if set, specifies the priority for this decision task. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n\n For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.\n "];
  task_list: task_list
    [@ocaml.doc
      "The name of the task list in which the decision task was scheduled.\n"]}
[@@ocaml.doc "Provides details about the [DecisionTaskScheduled] event.\n"]
type nonrec identity = string[@@ocaml.doc ""]
type nonrec decision_task_started_event_attributes =
  {
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskScheduled] event that was recorded when this decision task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  identity: identity option
    [@ocaml.doc
      "Identity of the decider making the request. This enables diagnostic tracing when problems arise. The form of this identity is user defined.\n"]}
[@@ocaml.doc "Provides the details of the [DecisionTaskStarted] event.\n"]
type nonrec decision_task_completed_event_attributes =
  {
  task_list_schedule_to_start_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum amount of time the decision task can wait to be assigned to a worker.\n"];
  task_list: task_list option [@ocaml.doc ""];
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskStarted] event recorded when this decision task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskScheduled] event that was recorded when this decision task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  execution_context: data option
    [@ocaml.doc "User defined context for the workflow execution.\n"]}
[@@ocaml.doc "Provides the details of the [DecisionTaskCompleted] event.\n"]
type nonrec decision_task_timeout_type =
  | SCHEDULE_TO_START [@ocaml.doc ""]
  | START_TO_CLOSE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec decision_task_timed_out_event_attributes =
  {
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskStarted] event recorded when this decision task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskScheduled] event that was recorded when this decision task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  timeout_type: decision_task_timeout_type
    [@ocaml.doc
      "The type of timeout that expired before the decision task could be completed.\n"]}
[@@ocaml.doc "Provides the details of the [DecisionTaskTimedOut] event.\n"]
type nonrec activity_task_scheduled_event_attributes =
  {
  heartbeat_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum time before which the worker processing this task must report progress by calling [RecordActivityTaskHeartbeat]. If the timeout is exceeded, the activity task is automatically timed out. If the worker subsequently attempts to record a heartbeat or return a result, it is ignored.\n"];
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision that resulted in the scheduling of this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  task_priority: task_priority option
    [@ocaml.doc
      " The priority to assign to the scheduled activity task. If set, this overrides any default priority value that was assigned when the activity type was registered.\n\n Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n \n  For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.\n  "];
  task_list: task_list
    [@ocaml.doc
      "The task list in which the activity task has been scheduled.\n"];
  start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum amount of time a worker may take to process the activity task.\n"];
  schedule_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc "The maximum amount of time for this activity task.\n"];
  schedule_to_start_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum amount of time the activity task can wait to be assigned to a worker.\n"];
  control: data option
    [@ocaml.doc
      "Data attached to the event that can be used by the decider in subsequent workflow tasks. This data isn't sent to the activity.\n"];
  input: data option
    [@ocaml.doc "The input provided to the activity task.\n"];
  activity_id: activity_id
    [@ocaml.doc "The unique ID of the activity task.\n"];
  activity_type: activity_type
    [@ocaml.doc "The type of the activity task.\n"]}[@@ocaml.doc
                                                      "Provides the details of the [ActivityTaskScheduled] event.\n"]
type nonrec activity_task_started_event_attributes =
  {
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  identity: identity option
    [@ocaml.doc
      "Identity of the worker that was assigned this task. This aids diagnostics when problems arise. The form of this identity is user defined.\n"]}
[@@ocaml.doc "Provides the details of the [ActivityTaskStarted] event.\n"]
type nonrec activity_task_completed_event_attributes =
  {
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [ActivityTaskStarted] event recorded when this activity task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  result: data option [@ocaml.doc "The results of the activity task.\n"]}
[@@ocaml.doc "Provides the details of the [ActivityTaskCompleted] event.\n"]
type nonrec activity_task_failed_event_attributes =
  {
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [ActivityTaskStarted] event recorded when this activity task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  details: data option [@ocaml.doc "The details of the failure.\n"];
  reason: failure_reason option
    [@ocaml.doc "The reason provided for the failure.\n"]}[@@ocaml.doc
                                                            "Provides the details of the [ActivityTaskFailed] event.\n"]
type nonrec activity_task_timeout_type =
  | HEARTBEAT [@ocaml.doc ""]
  | SCHEDULE_TO_CLOSE [@ocaml.doc ""]
  | SCHEDULE_TO_START [@ocaml.doc ""]
  | START_TO_CLOSE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec activity_task_timed_out_event_attributes =
  {
  details: limited_data option
    [@ocaml.doc
      "Contains the content of the [details] parameter for the last call made by the activity to [RecordActivityTaskHeartbeat].\n"];
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [ActivityTaskStarted] event recorded when this activity task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  timeout_type: activity_task_timeout_type
    [@ocaml.doc "The type of the timeout that caused this event.\n"]}
[@@ocaml.doc "Provides the details of the [ActivityTaskTimedOut] event.\n"]
type nonrec activity_task_canceled_event_attributes =
  {
  latest_cancel_requested_event_id: event_id option
    [@ocaml.doc
      "If set, contains the ID of the last [ActivityTaskCancelRequested] event recorded for this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [ActivityTaskStarted] event recorded when this activity task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  details: data option [@ocaml.doc "Details of the cancellation.\n"]}
[@@ocaml.doc "Provides the details of the [ActivityTaskCanceled] event.\n"]
type nonrec activity_task_cancel_requested_event_attributes =
  {
  activity_id: activity_id [@ocaml.doc "The unique ID of the task.\n"];
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RequestCancelActivityTask] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"]}
[@@ocaml.doc
  "Provides the details of the [ActivityTaskCancelRequested] event.\n"]
type nonrec marker_recorded_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RecordMarker] decision that requested this marker. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  details: data option [@ocaml.doc "The details of the marker.\n"];
  marker_name: marker_name [@ocaml.doc "The name of the marker.\n"]}[@@ocaml.doc
                                                                    "Provides the details of the [MarkerRecorded] event.\n"]
type nonrec record_marker_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec record_marker_failed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RecordMarkerFailed] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  cause: record_marker_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  marker_name: marker_name [@ocaml.doc "The marker's name.\n"]}[@@ocaml.doc
                                                                 "Provides the details of the [RecordMarkerFailed] event.\n"]
type nonrec child_workflow_execution_started_event_attributes =
  {
  initiated_event_id: event_id
    [@ocaml.doc
      "The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  workflow_type: workflow_type
    [@ocaml.doc "The type of the child workflow execution.\n"];
  workflow_execution: workflow_execution
    [@ocaml.doc "The child workflow execution that was started.\n"]}[@@ocaml.doc
                                                                    "Provides the details of the [ChildWorkflowExecutionStarted] event.\n"]
type nonrec child_workflow_execution_completed_event_attributes =
  {
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [ChildWorkflowExecutionStarted] event recorded when this child workflow execution was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  initiated_event_id: event_id
    [@ocaml.doc
      "The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  result: data option
    [@ocaml.doc "The result of the child workflow execution.\n"];
  workflow_type: workflow_type
    [@ocaml.doc "The type of the child workflow execution.\n"];
  workflow_execution: workflow_execution
    [@ocaml.doc "The child workflow execution that was completed.\n"]}
[@@ocaml.doc
  "Provides the details of the [ChildWorkflowExecutionCompleted] event.\n"]
type nonrec child_workflow_execution_failed_event_attributes =
  {
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [ChildWorkflowExecutionStarted] event recorded when this child workflow execution was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  initiated_event_id: event_id
    [@ocaml.doc
      "The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  details: data option
    [@ocaml.doc "The details of the failure (if provided).\n"];
  reason: failure_reason option
    [@ocaml.doc "The reason for the failure (if provided).\n"];
  workflow_type: workflow_type
    [@ocaml.doc "The type of the child workflow execution.\n"];
  workflow_execution: workflow_execution
    [@ocaml.doc "The child workflow execution that failed.\n"]}[@@ocaml.doc
                                                                 "Provides the details of the [ChildWorkflowExecutionFailed] event.\n"]
type nonrec child_workflow_execution_timed_out_event_attributes =
  {
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [ChildWorkflowExecutionStarted] event recorded when this child workflow execution was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  initiated_event_id: event_id
    [@ocaml.doc
      "The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  timeout_type: workflow_execution_timeout_type
    [@ocaml.doc
      "The type of the timeout that caused the child workflow execution to time out.\n"];
  workflow_type: workflow_type
    [@ocaml.doc "The type of the child workflow execution.\n"];
  workflow_execution: workflow_execution
    [@ocaml.doc "The child workflow execution that timed out.\n"]}[@@ocaml.doc
                                                                    "Provides the details of the [ChildWorkflowExecutionTimedOut] event.\n"]
type nonrec child_workflow_execution_canceled_event_attributes =
  {
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [ChildWorkflowExecutionStarted] event recorded when this child workflow execution was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  initiated_event_id: event_id
    [@ocaml.doc
      "The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  details: data option
    [@ocaml.doc "Details of the cancellation (if provided).\n"];
  workflow_type: workflow_type
    [@ocaml.doc "The type of the child workflow execution.\n"];
  workflow_execution: workflow_execution
    [@ocaml.doc "The child workflow execution that was canceled.\n"]}
[@@ocaml.doc
  "Provide details of the [ChildWorkflowExecutionCanceled] event.\n"]
type nonrec child_workflow_execution_terminated_event_attributes =
  {
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [ChildWorkflowExecutionStarted] event recorded when this child workflow execution was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  initiated_event_id: event_id
    [@ocaml.doc
      "The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  workflow_type: workflow_type
    [@ocaml.doc "The type of the child workflow execution.\n"];
  workflow_execution: workflow_execution
    [@ocaml.doc "The child workflow execution that was terminated.\n"]}
[@@ocaml.doc
  "Provides the details of the [ChildWorkflowExecutionTerminated] event.\n"]
type nonrec signal_external_workflow_execution_initiated_event_attributes =
  {
  control: data option
    [@ocaml.doc
      "Data attached to the event that can be used by the decider in subsequent decision tasks.\n"];
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [SignalExternalWorkflowExecution] decision for this signal. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  input: data option [@ocaml.doc "The input provided to the signal.\n"];
  signal_name: signal_name [@ocaml.doc "The name of the signal.\n"];
  run_id: workflow_run_id_optional option
    [@ocaml.doc
      "The [runId] of the external workflow execution to send the signal to.\n"];
  workflow_id: workflow_id
    [@ocaml.doc "The [workflowId] of the external workflow execution.\n"]}
[@@ocaml.doc
  "Provides the details of the [SignalExternalWorkflowExecutionInitiated] event.\n"]
type nonrec external_workflow_execution_signaled_event_attributes =
  {
  initiated_event_id: event_id
    [@ocaml.doc
      "The ID of the [SignalExternalWorkflowExecutionInitiated] event corresponding to the [SignalExternalWorkflowExecution] decision to request this signal. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  workflow_execution: workflow_execution
    [@ocaml.doc
      "The external workflow execution that the signal was delivered to.\n"]}
[@@ocaml.doc
  "Provides the details of the [ExternalWorkflowExecutionSignaled] event.\n"]
type nonrec signal_external_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""]
  | SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED [@ocaml.doc ""]
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec signal_external_workflow_execution_failed_event_attributes =
  {
  control: data option
    [@ocaml.doc
      "The data attached to the event that the decider can use in subsequent workflow tasks. This data isn't sent to the workflow execution.\n"];
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [SignalExternalWorkflowExecution] decision for this signal. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  initiated_event_id: event_id
    [@ocaml.doc
      "The ID of the [SignalExternalWorkflowExecutionInitiated] event corresponding to the [SignalExternalWorkflowExecution] decision to request this signal. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  cause: signal_external_workflow_execution_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  run_id: workflow_run_id_optional option
    [@ocaml.doc
      "The [runId] of the external workflow execution that the signal was being delivered to.\n"];
  workflow_id: workflow_id
    [@ocaml.doc
      "The [workflowId] of the external workflow execution that the signal was being delivered to.\n"]}
[@@ocaml.doc
  "Provides the details of the [SignalExternalWorkflowExecutionFailed] event.\n"]
type nonrec external_workflow_execution_cancel_requested_event_attributes =
  {
  initiated_event_id: event_id
    [@ocaml.doc
      "The ID of the [RequestCancelExternalWorkflowExecutionInitiated] event corresponding to the [RequestCancelExternalWorkflowExecution] decision to cancel this external workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  workflow_execution: workflow_execution
    [@ocaml.doc
      "The external workflow execution to which the cancellation request was delivered.\n"]}
[@@ocaml.doc
  "Provides the details of the [ExternalWorkflowExecutionCancelRequested] event.\n"]
type nonrec request_cancel_external_workflow_execution_initiated_event_attributes =
  {
  control: data option
    [@ocaml.doc
      "Data attached to the event that can be used by the decider in subsequent workflow tasks.\n"];
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RequestCancelExternalWorkflowExecution] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  run_id: workflow_run_id_optional option
    [@ocaml.doc
      "The [runId] of the external workflow execution to be canceled.\n"];
  workflow_id: workflow_id
    [@ocaml.doc
      "The [workflowId] of the external workflow execution to be canceled.\n"]}
[@@ocaml.doc
  "Provides the details of the [RequestCancelExternalWorkflowExecutionInitiated] event.\n"]
type nonrec request_cancel_external_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""]
  | REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED [@ocaml.doc ""]
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec request_cancel_external_workflow_execution_failed_event_attributes =
  {
  control: data option
    [@ocaml.doc
      "The data attached to the event that the decider can use in subsequent workflow tasks. This data isn't sent to the workflow execution.\n"];
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RequestCancelExternalWorkflowExecution] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  initiated_event_id: event_id
    [@ocaml.doc
      "The ID of the [RequestCancelExternalWorkflowExecutionInitiated] event corresponding to the [RequestCancelExternalWorkflowExecution] decision to cancel this external workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  cause: request_cancel_external_workflow_execution_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  run_id: workflow_run_id_optional option
    [@ocaml.doc "The [runId] of the external workflow execution.\n"];
  workflow_id: workflow_id
    [@ocaml.doc
      "The [workflowId] of the external workflow to which the cancel request was to be delivered.\n"]}
[@@ocaml.doc
  "Provides the details of the [RequestCancelExternalWorkflowExecutionFailed] event.\n"]
type nonrec schedule_activity_task_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""]
  | DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED [@ocaml.doc ""]
  | DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED [@ocaml.doc ""]
  | DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED [@ocaml.doc ""]
  | DEFAULT_TASK_LIST_UNDEFINED [@ocaml.doc ""]
  | DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED [@ocaml.doc ""]
  | ACTIVITY_CREATION_RATE_EXCEEDED [@ocaml.doc ""]
  | OPEN_ACTIVITIES_LIMIT_EXCEEDED [@ocaml.doc ""]
  | ACTIVITY_ID_ALREADY_IN_USE [@ocaml.doc ""]
  | ACTIVITY_TYPE_DOES_NOT_EXIST [@ocaml.doc ""]
  | ACTIVITY_TYPE_DEPRECATED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec schedule_activity_task_failed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision that resulted in the scheduling of this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  cause: schedule_activity_task_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  activity_id: activity_id
    [@ocaml.doc
      "The activityId provided in the [ScheduleActivityTask] decision that failed.\n"];
  activity_type: activity_type
    [@ocaml.doc
      "The activity type provided in the [ScheduleActivityTask] decision that failed.\n"]}
[@@ocaml.doc
  "Provides the details of the [ScheduleActivityTaskFailed] event.\n"]
type nonrec request_cancel_activity_task_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""]
  | ACTIVITY_ID_UNKNOWN [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec request_cancel_activity_task_failed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RequestCancelActivityTask] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  cause: request_cancel_activity_task_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  activity_id: activity_id
    [@ocaml.doc
      "The activityId provided in the [RequestCancelActivityTask] decision that failed.\n"]}
[@@ocaml.doc
  "Provides the details of the [RequestCancelActivityTaskFailed] event.\n"]
type nonrec cancel_timer_failed_cause =
  | OPERATION_NOT_PERMITTED [@ocaml.doc ""]
  | TIMER_ID_UNKNOWN [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec cancel_timer_failed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CancelTimer] decision to cancel this timer. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.\n"];
  cause: cancel_timer_failed_cause
    [@ocaml.doc
      "The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  timer_id: timer_id
    [@ocaml.doc
      "The timerId provided in the [CancelTimer] decision that failed.\n"]}
[@@ocaml.doc "Provides the details of the [CancelTimerFailed] event.\n"]
type nonrec lambda_function_scheduled_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [LambdaFunctionCompleted] event corresponding to the decision that resulted in scheduling this activity task. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n"];
  start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      "The maximum amount of time a worker can take to process the Lambda task.\n"];
  input: function_input option
    [@ocaml.doc "The input provided to the Lambda task.\n"];
  control: data option
    [@ocaml.doc
      "Data attached to the event that the decider can use in subsequent workflow tasks. This data isn't sent to the Lambda task.\n"];
  name: function_name [@ocaml.doc "The name of the Lambda function.\n"];
  id: function_id [@ocaml.doc "The unique ID of the Lambda task.\n"]}
[@@ocaml.doc
  "Provides the details of the [LambdaFunctionScheduled] event. It isn't set for other event types.\n"]
type nonrec lambda_function_started_event_attributes =
  {
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [LambdaFunctionScheduled] event that was recorded when this activity task was scheduled. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n"]}
[@@ocaml.doc
  "Provides the details of the [LambdaFunctionStarted] event. It isn't set for other event types.\n"]
type nonrec lambda_function_completed_event_attributes =
  {
  result: data option [@ocaml.doc "The results of the Lambda task.\n"];
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [LambdaFunctionStarted] event recorded when this activity task started. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n"];
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [LambdaFunctionScheduled] event that was recorded when this Lambda task was scheduled. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n"]}
[@@ocaml.doc
  "Provides the details of the [LambdaFunctionCompleted] event. It isn't set for other event types.\n"]
type nonrec lambda_function_failed_event_attributes =
  {
  details: data option [@ocaml.doc "The details of the failure.\n"];
  reason: failure_reason option
    [@ocaml.doc "The reason provided for the failure.\n"];
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [LambdaFunctionStarted] event recorded when this activity task started. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n"];
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [LambdaFunctionScheduled] event that was recorded when this activity task was scheduled. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n"]}
[@@ocaml.doc
  "Provides the details of the [LambdaFunctionFailed] event. It isn't set for other event types.\n"]
type nonrec lambda_function_timeout_type =
  | START_TO_CLOSE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec lambda_function_timed_out_event_attributes =
  {
  timeout_type: lambda_function_timeout_type option
    [@ocaml.doc "The type of the timeout that caused this event.\n"];
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [ActivityTaskStarted] event that was recorded when this activity task started. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n"];
  scheduled_event_id: event_id
    [@ocaml.doc
      "The ID of the [LambdaFunctionScheduled] event that was recorded when this activity task was scheduled. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n"]}
[@@ocaml.doc "Provides details of the [LambdaFunctionTimedOut] event.\n"]
type nonrec schedule_lambda_function_failed_cause =
  | LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION [@ocaml.doc ""]
  | LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED [@ocaml.doc ""]
  | OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED [@ocaml.doc ""]
  | ID_ALREADY_IN_USE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec schedule_lambda_function_failed_event_attributes =
  {
  decision_task_completed_event_id: event_id
    [@ocaml.doc
      "The ID of the [LambdaFunctionCompleted] event corresponding to the decision that resulted in scheduling this Lambda task. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n"];
  cause: schedule_lambda_function_failed_cause
    [@ocaml.doc
      "The cause of the failure. To help diagnose issues, use this information to trace back the chain of events leading up to this event.\n\n  If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n  \n   "];
  name: function_name [@ocaml.doc "The name of the Lambda function.\n"];
  id: function_id
    [@ocaml.doc
      "The ID provided in the [ScheduleLambdaFunction] decision that failed. \n"]}
[@@ocaml.doc
  "Provides the details of the [ScheduleLambdaFunctionFailed] event. It isn't set for other event types.\n"]
type nonrec history_event =
  {
  start_lambda_function_failed_event_attributes:
    start_lambda_function_failed_event_attributes option
    [@ocaml.doc
      "Provides the details of the [StartLambdaFunctionFailed] event. It isn't set for other event types.\n"];
  schedule_lambda_function_failed_event_attributes:
    schedule_lambda_function_failed_event_attributes option
    [@ocaml.doc
      "Provides the details of the [ScheduleLambdaFunctionFailed] event. It isn't set for other event types.\n"];
  lambda_function_timed_out_event_attributes:
    lambda_function_timed_out_event_attributes option
    [@ocaml.doc
      "Provides the details of the [LambdaFunctionTimedOut] event. It isn't set for other event types.\n"];
  lambda_function_failed_event_attributes:
    lambda_function_failed_event_attributes option
    [@ocaml.doc
      "Provides the details of the [LambdaFunctionFailed] event. It isn't set for other event types.\n"];
  lambda_function_completed_event_attributes:
    lambda_function_completed_event_attributes option
    [@ocaml.doc
      "Provides the details of the [LambdaFunctionCompleted] event. It isn't set for other event types.\n"];
  lambda_function_started_event_attributes:
    lambda_function_started_event_attributes option
    [@ocaml.doc
      "Provides the details of the [LambdaFunctionStarted] event. It isn't set for other event types.\n"];
  lambda_function_scheduled_event_attributes:
    lambda_function_scheduled_event_attributes option
    [@ocaml.doc
      "Provides the details of the [LambdaFunctionScheduled] event. It isn't set for other event types.\n"];
  start_child_workflow_execution_failed_event_attributes:
    start_child_workflow_execution_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [StartChildWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  cancel_timer_failed_event_attributes:
    cancel_timer_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [CancelTimerFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  start_timer_failed_event_attributes:
    start_timer_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [StartTimerFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  request_cancel_activity_task_failed_event_attributes:
    request_cancel_activity_task_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [RequestCancelActivityTaskFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  schedule_activity_task_failed_event_attributes:
    schedule_activity_task_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [ScheduleActivityTaskFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  request_cancel_external_workflow_execution_failed_event_attributes:
    request_cancel_external_workflow_execution_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [RequestCancelExternalWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  request_cancel_external_workflow_execution_initiated_event_attributes:
    request_cancel_external_workflow_execution_initiated_event_attributes
      option
    [@ocaml.doc
      "If the event is of type [RequestCancelExternalWorkflowExecutionInitiated] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  external_workflow_execution_cancel_requested_event_attributes:
    external_workflow_execution_cancel_requested_event_attributes option
    [@ocaml.doc
      "If the event is of type [ExternalWorkflowExecutionCancelRequested] then this member is set and provides detailed information about the event. It isn't set for other event types. \n"];
  signal_external_workflow_execution_failed_event_attributes:
    signal_external_workflow_execution_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [SignalExternalWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  external_workflow_execution_signaled_event_attributes:
    external_workflow_execution_signaled_event_attributes option
    [@ocaml.doc
      "If the event is of type [ExternalWorkflowExecutionSignaled] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  signal_external_workflow_execution_initiated_event_attributes:
    signal_external_workflow_execution_initiated_event_attributes option
    [@ocaml.doc
      "If the event is of type [SignalExternalWorkflowExecutionInitiated] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  child_workflow_execution_terminated_event_attributes:
    child_workflow_execution_terminated_event_attributes option
    [@ocaml.doc
      "If the event is of type [ChildWorkflowExecutionTerminated] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  child_workflow_execution_canceled_event_attributes:
    child_workflow_execution_canceled_event_attributes option
    [@ocaml.doc
      "If the event is of type [ChildWorkflowExecutionCanceled] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  child_workflow_execution_timed_out_event_attributes:
    child_workflow_execution_timed_out_event_attributes option
    [@ocaml.doc
      "If the event is of type [ChildWorkflowExecutionTimedOut] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  child_workflow_execution_failed_event_attributes:
    child_workflow_execution_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [ChildWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  child_workflow_execution_completed_event_attributes:
    child_workflow_execution_completed_event_attributes option
    [@ocaml.doc
      "If the event is of type [ChildWorkflowExecutionCompleted] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  child_workflow_execution_started_event_attributes:
    child_workflow_execution_started_event_attributes option
    [@ocaml.doc
      "If the event is of type [ChildWorkflowExecutionStarted] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  start_child_workflow_execution_initiated_event_attributes:
    start_child_workflow_execution_initiated_event_attributes option
    [@ocaml.doc
      "If the event is of type [StartChildWorkflowExecutionInitiated] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  timer_canceled_event_attributes: timer_canceled_event_attributes option
    [@ocaml.doc
      "If the event is of type [TimerCanceled] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  timer_fired_event_attributes: timer_fired_event_attributes option
    [@ocaml.doc
      "If the event is of type [TimerFired] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  timer_started_event_attributes: timer_started_event_attributes option
    [@ocaml.doc
      "If the event is of type [TimerStarted] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  record_marker_failed_event_attributes:
    record_marker_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [DecisionTaskFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  marker_recorded_event_attributes: marker_recorded_event_attributes option
    [@ocaml.doc
      "If the event is of type [MarkerRecorded] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  workflow_execution_signaled_event_attributes:
    workflow_execution_signaled_event_attributes option
    [@ocaml.doc
      "If the event is of type [WorkflowExecutionSignaled] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  activity_task_cancel_requested_event_attributes:
    activity_task_cancel_requested_event_attributes option
    [@ocaml.doc
      "If the event is of type [ActivityTaskcancelRequested] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  activity_task_canceled_event_attributes:
    activity_task_canceled_event_attributes option
    [@ocaml.doc
      "If the event is of type [ActivityTaskCanceled] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  activity_task_timed_out_event_attributes:
    activity_task_timed_out_event_attributes option
    [@ocaml.doc
      "If the event is of type [ActivityTaskTimedOut] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  activity_task_failed_event_attributes:
    activity_task_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [ActivityTaskFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  activity_task_completed_event_attributes:
    activity_task_completed_event_attributes option
    [@ocaml.doc
      "If the event is of type [ActivityTaskCompleted] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  activity_task_started_event_attributes:
    activity_task_started_event_attributes option
    [@ocaml.doc
      "If the event is of type [ActivityTaskStarted] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  activity_task_scheduled_event_attributes:
    activity_task_scheduled_event_attributes option
    [@ocaml.doc
      "If the event is of type [ActivityTaskScheduled] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  decision_task_timed_out_event_attributes:
    decision_task_timed_out_event_attributes option
    [@ocaml.doc
      "If the event is of type [DecisionTaskTimedOut] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  decision_task_completed_event_attributes:
    decision_task_completed_event_attributes option
    [@ocaml.doc
      "If the event is of type [DecisionTaskCompleted] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  decision_task_started_event_attributes:
    decision_task_started_event_attributes option
    [@ocaml.doc
      "If the event is of type [DecisionTaskStarted] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  decision_task_scheduled_event_attributes:
    decision_task_scheduled_event_attributes option
    [@ocaml.doc
      "If the event is of type [DecisionTaskScheduled] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  workflow_execution_cancel_requested_event_attributes:
    workflow_execution_cancel_requested_event_attributes option
    [@ocaml.doc
      "If the event is of type [WorkflowExecutionCancelRequested] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  workflow_execution_terminated_event_attributes:
    workflow_execution_terminated_event_attributes option
    [@ocaml.doc
      "If the event is of type [WorkflowExecutionTerminated] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  continue_as_new_workflow_execution_failed_event_attributes:
    continue_as_new_workflow_execution_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [ContinueAsNewWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  workflow_execution_continued_as_new_event_attributes:
    workflow_execution_continued_as_new_event_attributes option
    [@ocaml.doc
      "If the event is of type [WorkflowExecutionContinuedAsNew] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  cancel_workflow_execution_failed_event_attributes:
    cancel_workflow_execution_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [CancelWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  workflow_execution_canceled_event_attributes:
    workflow_execution_canceled_event_attributes option
    [@ocaml.doc
      "If the event is of type [WorkflowExecutionCanceled] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  workflow_execution_timed_out_event_attributes:
    workflow_execution_timed_out_event_attributes option
    [@ocaml.doc
      "If the event is of type [WorkflowExecutionTimedOut] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  fail_workflow_execution_failed_event_attributes:
    fail_workflow_execution_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [FailWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  workflow_execution_failed_event_attributes:
    workflow_execution_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [WorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  complete_workflow_execution_failed_event_attributes:
    complete_workflow_execution_failed_event_attributes option
    [@ocaml.doc
      "If the event is of type [CompleteWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  workflow_execution_completed_event_attributes:
    workflow_execution_completed_event_attributes option
    [@ocaml.doc
      "If the event is of type [WorkflowExecutionCompleted] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  workflow_execution_started_event_attributes:
    workflow_execution_started_event_attributes option
    [@ocaml.doc
      "If the event is of type [WorkflowExecutionStarted] then this member is set and provides detailed information about the event. It isn't set for other event types.\n"];
  event_id: event_id
    [@ocaml.doc
      "The system generated ID of the event. This ID uniquely identifies the event with in the workflow execution history.\n"];
  event_type: event_type [@ocaml.doc "The type of the history event.\n"];
  event_timestamp: timestamp
    [@ocaml.doc "The date and time when the event occurred.\n"]}[@@ocaml.doc
                                                                  "Event within a workflow execution. A history event can be one of these types:\n\n {ul\n       {-   [ActivityTaskCancelRequested] \226\128\147 A [RequestCancelActivityTask] decision was received by the system.\n           \n            }\n       {-   [ActivityTaskCanceled] \226\128\147 The activity task was successfully canceled.\n           \n            }\n       {-   [ActivityTaskCompleted] \226\128\147 An activity worker successfully completed an activity task by calling [RespondActivityTaskCompleted].\n           \n            }\n       {-   [ActivityTaskFailed] \226\128\147 An activity worker failed an activity task by calling [RespondActivityTaskFailed].\n           \n            }\n       {-   [ActivityTaskScheduled] \226\128\147 An activity task was scheduled for execution.\n           \n            }\n       {-   [ActivityTaskStarted] \226\128\147 The scheduled activity task was dispatched to a worker.\n           \n            }\n       {-   [ActivityTaskTimedOut] \226\128\147 The activity task timed out.\n           \n            }\n       {-   [CancelTimerFailed] \226\128\147 Failed to process CancelTimer decision. This happens when the decision isn't configured properly, for example no timer exists with the specified timer Id.\n           \n            }\n       {-   [CancelWorkflowExecutionFailed] \226\128\147 A request to cancel a workflow execution failed.\n           \n            }\n       {-   [ChildWorkflowExecutionCanceled] \226\128\147 A child workflow execution, started by this workflow execution, was canceled and closed.\n           \n            }\n       {-   [ChildWorkflowExecutionCompleted] \226\128\147 A child workflow execution, started by this workflow execution, completed successfully and was closed.\n           \n            }\n       {-   [ChildWorkflowExecutionFailed] \226\128\147 A child workflow execution, started by this workflow execution, failed to complete successfully and was closed.\n           \n            }\n       {-   [ChildWorkflowExecutionStarted] \226\128\147 A child workflow execution was successfully started.\n           \n            }\n       {-   [ChildWorkflowExecutionTerminated] \226\128\147 A child workflow execution, started by this workflow execution, was terminated.\n           \n            }\n       {-   [ChildWorkflowExecutionTimedOut] \226\128\147 A child workflow execution, started by this workflow execution, timed out and was closed.\n           \n            }\n       {-   [CompleteWorkflowExecutionFailed] \226\128\147 The workflow execution failed to complete.\n           \n            }\n       {-   [ContinueAsNewWorkflowExecutionFailed] \226\128\147 The workflow execution failed to complete after being continued as a new workflow execution.\n           \n            }\n       {-   [DecisionTaskCompleted] \226\128\147 The decider successfully completed a decision task by calling [RespondDecisionTaskCompleted].\n           \n            }\n       {-   [DecisionTaskScheduled] \226\128\147 A decision task was scheduled for the workflow execution.\n           \n            }\n       {-   [DecisionTaskStarted] \226\128\147 The decision task was dispatched to a decider.\n           \n            }\n       {-   [DecisionTaskTimedOut] \226\128\147 The decision task timed out.\n           \n            }\n       {-   [ExternalWorkflowExecutionCancelRequested] \226\128\147 Request to cancel an external workflow execution was successfully delivered to the target execution.\n           \n            }\n       {-   [ExternalWorkflowExecutionSignaled] \226\128\147 A signal, requested by this workflow execution, was successfully delivered to the target external workflow execution.\n           \n            }\n       {-   [FailWorkflowExecutionFailed] \226\128\147 A request to mark a workflow execution as failed, itself failed.\n           \n            }\n       {-   [MarkerRecorded] \226\128\147 A marker was recorded in the workflow history as the result of a [RecordMarker] decision.\n           \n            }\n       {-   [RecordMarkerFailed] \226\128\147 A [RecordMarker] decision was returned as failed.\n           \n            }\n       {-   [RequestCancelActivityTaskFailed] \226\128\147 Failed to process RequestCancelActivityTask decision. This happens when the decision isn't configured properly.\n           \n            }\n       {-   [RequestCancelExternalWorkflowExecutionFailed] \226\128\147 Request to cancel an external workflow execution failed.\n           \n            }\n       {-   [RequestCancelExternalWorkflowExecutionInitiated] \226\128\147 A request was made to request the cancellation of an external workflow execution.\n           \n            }\n       {-   [ScheduleActivityTaskFailed] \226\128\147 Failed to process ScheduleActivityTask decision. This happens when the decision isn't configured properly, for example the activity type specified isn't registered.\n           \n            }\n       {-   [SignalExternalWorkflowExecutionFailed] \226\128\147 The request to signal an external workflow execution failed.\n           \n            }\n       {-   [SignalExternalWorkflowExecutionInitiated] \226\128\147 A request to signal an external workflow was made.\n           \n            }\n       {-   [StartActivityTaskFailed] \226\128\147 A scheduled activity task failed to start.\n           \n            }\n       {-   [StartChildWorkflowExecutionFailed] \226\128\147 Failed to process StartChildWorkflowExecution decision. This happens when the decision isn't configured properly, for example the workflow type specified isn't registered.\n           \n            }\n       {-   [StartChildWorkflowExecutionInitiated] \226\128\147 A request was made to start a child workflow execution.\n           \n            }\n       {-   [StartTimerFailed] \226\128\147 Failed to process StartTimer decision. This happens when the decision isn't configured properly, for example a timer already exists with the specified timer Id.\n           \n            }\n       {-   [TimerCanceled] \226\128\147 A timer, previously started for this workflow execution, was successfully canceled.\n           \n            }\n       {-   [TimerFired] \226\128\147 A timer, previously started for this workflow execution, fired.\n           \n            }\n       {-   [TimerStarted] \226\128\147 A timer was started for the workflow execution due to a [StartTimer] decision.\n           \n            }\n       {-   [WorkflowExecutionCancelRequested] \226\128\147 A request to cancel this workflow execution was made.\n           \n            }\n       {-   [WorkflowExecutionCanceled] \226\128\147 The workflow execution was successfully canceled and closed.\n           \n            }\n       {-   [WorkflowExecutionCompleted] \226\128\147 The workflow execution was closed due to successful completion.\n           \n            }\n       {-   [WorkflowExecutionContinuedAsNew] \226\128\147 The workflow execution was closed and a new execution of the same type was created with the same workflowId.\n           \n            }\n       {-   [WorkflowExecutionFailed] \226\128\147 The workflow execution closed due to a failure.\n           \n            }\n       {-   [WorkflowExecutionSignaled] \226\128\147 An external signal was received for the workflow execution.\n           \n            }\n       {-   [WorkflowExecutionStarted] \226\128\147 The workflow execution was started.\n           \n            }\n       {-   [WorkflowExecutionTerminated] \226\128\147 The workflow execution was terminated.\n           \n            }\n       {-   [WorkflowExecutionTimedOut] \226\128\147 The workflow execution was closed because a time out was exceeded.\n           \n            }\n       }\n  "]
type nonrec history_event_list = history_event list[@@ocaml.doc ""]
type nonrec decision_task =
  {
  previous_started_event_id: event_id option
    [@ocaml.doc
      "The ID of the DecisionTaskStarted event of the previous decision task of this workflow execution that was processed by the decider. This can be used to determine the events in the history new since the last decision task received by the decider.\n"];
  next_page_token: page_token option
    [@ocaml.doc
      "If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.\n\n The configured [maximumPageSize] determines how many results can be returned in a single call.\n "];
  events: history_event_list
    [@ocaml.doc
      "A paginated list of history events of the workflow execution. The decider uses this during the processing of the decision task.\n"];
  workflow_type: workflow_type
    [@ocaml.doc
      "The type of the workflow execution for which this decision task was created.\n"];
  workflow_execution: workflow_execution
    [@ocaml.doc
      "The workflow execution for which this decision task was created.\n"];
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [DecisionTaskStarted] event recorded in the history.\n"];
  task_token: task_token
    [@ocaml.doc
      "The opaque string used as a handle on the task. This token is used by workers to communicate progress and response information back to the system about the task.\n"]}
[@@ocaml.doc
  "A structure that represents a decision task. Decision tasks are sent to deciders in order for them to make decisions.\n"]
type nonrec page_size = int[@@ocaml.doc ""]
type nonrec reverse_order = bool[@@ocaml.doc ""]
type nonrec poll_for_decision_task_input =
  {
  start_at_previous_started_event: start_at_previous_started_event option
    [@ocaml.doc
      "When set to [true], returns the events with [eventTimestamp] greater than or equal to [eventTimestamp] of the most recent [DecisionTaskStarted] event. By default, this parameter is set to [false].\n"];
  reverse_order: reverse_order option
    [@ocaml.doc
      "When set to [true], returns the events in reverse order. By default the results are returned in ascending order of the [eventTimestamp] of the events.\n"];
  maximum_page_size: page_size option
    [@ocaml.doc
      "The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results. \n\n This is an upper limit only; the actual number of results returned per call may be fewer than the specified maximum.\n "];
  next_page_token: page_token option
    [@ocaml.doc
      "If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: \"[Specified token has \n      exceeded its maximum lifetime]\". \n\n The configured [maximumPageSize] determines how many results can be returned in a single call. \n \n   The [nextPageToken] returned by this action cannot be used with [GetWorkflowExecutionHistory] to get the next page. You must call [PollForDecisionTask] again (with the [nextPageToken]) to retrieve the next page of history records. Calling [PollForDecisionTask] with a [nextPageToken] doesn't return a new decision task.\n   \n    "];
  identity: identity option
    [@ocaml.doc
      "Identity of the decider making the request, which is recorded in the DecisionTaskStarted event in the workflow history. This enables diagnostic tracing when problems arise. The form of this identity is user defined.\n"];
  task_list: task_list
    [@ocaml.doc
      "Specifies the task list to poll for decision tasks.\n\n The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n "];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain containing the task lists to poll.\n"]}
[@@ocaml.doc ""]
type nonrec activity_task =
  {
  input: data option
    [@ocaml.doc
      "The inputs provided when the activity task was scheduled. The form of the input is user defined and should be meaningful to the activity implementation.\n"];
  activity_type: activity_type
    [@ocaml.doc "The type of this activity task.\n"];
  workflow_execution: workflow_execution
    [@ocaml.doc "The workflow execution that started this activity task.\n"];
  started_event_id: event_id
    [@ocaml.doc
      "The ID of the [ActivityTaskStarted] event recorded in the history.\n"];
  activity_id: activity_id [@ocaml.doc "The unique ID of the task.\n"];
  task_token: task_token
    [@ocaml.doc
      "The opaque string used as a handle on the task. This token is used by workers to communicate progress and response information back to the system about the task.\n"]}
[@@ocaml.doc "Unit of work sent to an activity worker.\n"]
type nonrec poll_for_activity_task_input =
  {
  identity: identity option
    [@ocaml.doc
      "Identity of the worker making the request, recorded in the [ActivityTaskStarted] event in the workflow history. This enables diagnostic tracing when problems arise. The form of this identity is user defined.\n"];
  task_list: task_list
    [@ocaml.doc
      "Specifies the task list to poll for activity tasks.\n\n The specified string must not start or end with whitespace. It must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\\u0000-\\u001f] | [\\u007f-\\u009f]). Also, it must {i not} be the literal string [arn].\n "];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain that contains the task lists being polled.\n"]}
[@@ocaml.doc ""]
type nonrec list_workflow_types_input =
  {
  reverse_order: reverse_order option
    [@ocaml.doc
      "When set to [true], returns the results in reverse order. By default the results are returned in ascending alphabetical order of the [name] of the workflow types.\n"];
  maximum_page_size: page_size option
    [@ocaml.doc
      "The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results. \n"];
  next_page_token: page_token option
    [@ocaml.doc
      "If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: \"[Specified token has \n      exceeded its maximum lifetime]\". \n\n The configured [maximumPageSize] determines how many results can be returned in a single call. \n "];
  registration_status: registration_status
    [@ocaml.doc
      "Specifies the registration status of the workflow types to list.\n"];
  name: name option
    [@ocaml.doc "If specified, lists the workflow type with this name.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain in which the workflow types have been registered.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_output =
  {
  tags: resource_tag_list option
    [@ocaml.doc "An array of tags associated with the domain.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_tags_for_resource_input =
  {
  resource_arn: arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the Amazon SWF domain.\n"]}
[@@ocaml.doc ""]
type nonrec execution_time_filter =
  {
  latest_date: timestamp option
    [@ocaml.doc
      "Specifies the latest start or close date and time to return.\n"];
  oldest_date: timestamp
    [@ocaml.doc
      "Specifies the oldest start or close date and time to return.\n"]}
[@@ocaml.doc
  "Used to filter the workflow executions in visibility APIs by various time-based rules. Each parameter, if specified, defines a rule that must be satisfied by each returned query result. The parameter values are in the {{:https://en.wikipedia.org/wiki/Unix_time}Unix Time format}. For example: [\"oldestDate\": 1325376070.] \n"]
type nonrec list_open_workflow_executions_input =
  {
  execution_filter: workflow_execution_filter option
    [@ocaml.doc
      "If specified, only workflow executions matching the workflow ID specified in the filter are returned.\n\n   [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  reverse_order: reverse_order option
    [@ocaml.doc
      "When set to [true], returns the results in reverse order. By default the results are returned in descending order of the start time of the executions.\n"];
  maximum_page_size: page_size option
    [@ocaml.doc
      "The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results. \n"];
  next_page_token: page_token option
    [@ocaml.doc
      "If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: \"[Specified token has \n      exceeded its maximum lifetime]\". \n\n The configured [maximumPageSize] determines how many results can be returned in a single call. \n "];
  tag_filter: tag_filter option
    [@ocaml.doc
      "If specified, only executions that have the matching tag are listed.\n\n   [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  type_filter: workflow_type_filter option
    [@ocaml.doc
      "If specified, only executions of the type specified in the filter are returned.\n\n   [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  start_time_filter: execution_time_filter
    [@ocaml.doc
      "Workflow executions are included in the returned results based on whether their start times are within the range specified by this filter.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain that contains the workflow executions to list.\n"]}
[@@ocaml.doc ""]
type nonrec domain_info =
  {
  arn: arn option [@ocaml.doc "The ARN of the domain.\n"];
  description: description option
    [@ocaml.doc
      "The description of the domain provided through [RegisterDomain].\n"];
  status: registration_status
    [@ocaml.doc
      "The status of the domain:\n\n {ul\n       {-   [REGISTERED] \226\128\147 The domain is properly registered and available. You can use this domain for registering types and creating new workflow executions. \n           \n            }\n       {-   [DEPRECATED] \226\128\147 The domain was deprecated using [DeprecateDomain], but is still in use. You should not create new workflow executions in this domain. \n           \n            }\n       }\n  "];
  name: domain_name
    [@ocaml.doc
      "The name of the domain. This name is unique within the account.\n"]}
[@@ocaml.doc "Contains general information about a domain.\n"]
type nonrec domain_info_list = domain_info list[@@ocaml.doc ""]
type nonrec domain_infos =
  {
  next_page_token: page_token option
    [@ocaml.doc
      "If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.\n\n The configured [maximumPageSize] determines how many results can be returned in a single call.\n "];
  domain_infos: domain_info_list
    [@ocaml.doc "A list of DomainInfo structures.\n"]}[@@ocaml.doc
                                                        "Contains a paginated collection of DomainInfo structures.\n"]
type nonrec list_domains_input =
  {
  reverse_order: reverse_order option
    [@ocaml.doc
      "When set to [true], returns the results in reverse order. By default, the results are returned in ascending alphabetical order by [name] of the domains.\n"];
  maximum_page_size: page_size option
    [@ocaml.doc
      "The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results. \n"];
  registration_status: registration_status
    [@ocaml.doc
      "Specifies the registration status of the domains to list.\n"];
  next_page_token: page_token option
    [@ocaml.doc
      "If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: \"[Specified token has \n      exceeded its maximum lifetime]\". \n\n The configured [maximumPageSize] determines how many results can be returned in a single call. \n "]}
[@@ocaml.doc ""]
type nonrec close_status_filter =
  {
  status: close_status
    [@ocaml.doc
      " The close status that must match the close status of an execution for it to meet the criteria of this filter.\n"]}
[@@ocaml.doc
  "Used to filter the closed workflow executions in visibility APIs by their close status.\n"]
type nonrec list_closed_workflow_executions_input =
  {
  reverse_order: reverse_order option
    [@ocaml.doc
      "When set to [true], returns the results in reverse order. By default the results are returned in descending order of the start or the close time of the executions.\n"];
  maximum_page_size: page_size option
    [@ocaml.doc
      "The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results. \n"];
  next_page_token: page_token option
    [@ocaml.doc
      "If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: \"[Specified token has \n      exceeded its maximum lifetime]\". \n\n The configured [maximumPageSize] determines how many results can be returned in a single call. \n "];
  tag_filter: tag_filter option
    [@ocaml.doc
      "If specified, only executions that have the matching tag are listed.\n\n   [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  type_filter: workflow_type_filter option
    [@ocaml.doc
      "If specified, only executions of the type specified in the filter are returned.\n\n   [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  close_status_filter: close_status_filter option
    [@ocaml.doc
      "If specified, only workflow executions that match this {i close status} are listed. For example, if TERMINATED is specified, then only TERMINATED workflow executions are listed.\n\n   [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  execution_filter: workflow_execution_filter option
    [@ocaml.doc
      "If specified, only workflow executions matching the workflow ID specified in the filter are returned.\n\n   [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  close_time_filter: execution_time_filter option
    [@ocaml.doc
      "If specified, the workflow executions are included in the returned results based on whether their close times are within the range specified by this filter. Also, if this parameter is specified, the returned results are ordered by their close times.\n\n   [startTimeFilter] and [closeTimeFilter] are mutually exclusive. You must specify one of these in a request but not both.\n  \n   "];
  start_time_filter: execution_time_filter option
    [@ocaml.doc
      "If specified, the workflow executions are included in the returned results based on whether their start times are within the range specified by this filter. Also, if this parameter is specified, the returned results are ordered by their start times.\n\n   [startTimeFilter] and [closeTimeFilter] are mutually exclusive. You must specify one of these in a request but not both.\n  \n   "];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain that contains the workflow executions to list.\n"]}
[@@ocaml.doc ""]
type nonrec activity_type_info =
  {
  deprecation_date: timestamp option
    [@ocaml.doc
      "If DEPRECATED, the date and time [DeprecateActivityType] was called.\n"];
  creation_date: timestamp
    [@ocaml.doc
      "The date and time this activity type was created through [RegisterActivityType].\n"];
  description: description option
    [@ocaml.doc
      "The description of the activity type provided in [RegisterActivityType].\n"];
  status: registration_status
    [@ocaml.doc "The current status of the activity type.\n"];
  activity_type: activity_type
    [@ocaml.doc
      "The [ActivityType] type structure representing the activity type.\n"]}
[@@ocaml.doc "Detailed information about an activity type.\n"]
type nonrec activity_type_info_list = activity_type_info list[@@ocaml.doc ""]
type nonrec activity_type_infos =
  {
  next_page_token: page_token option
    [@ocaml.doc
      "If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.\n\n The configured [maximumPageSize] determines how many results can be returned in a single call.\n "];
  type_infos: activity_type_info_list
    [@ocaml.doc "List of activity type information.\n"]}[@@ocaml.doc
                                                          "Contains a paginated list of activity type information structures.\n"]
type nonrec list_activity_types_input =
  {
  reverse_order: reverse_order option
    [@ocaml.doc
      "When set to [true], returns the results in reverse order. By default, the results are returned in ascending alphabetical order by [name] of the activity types.\n"];
  maximum_page_size: page_size option
    [@ocaml.doc
      "The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results. \n"];
  next_page_token: page_token option
    [@ocaml.doc
      "If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: \"[Specified token has \n      exceeded its maximum lifetime]\". \n\n The configured [maximumPageSize] determines how many results can be returned in a single call. \n "];
  registration_status: registration_status
    [@ocaml.doc
      "Specifies the registration status of the activity types to list.\n"];
  name: name option
    [@ocaml.doc
      "If specified, only lists the activity types that have this name.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain in which the activity types have been registered.\n"]}
[@@ocaml.doc ""]
type nonrec history =
  {
  next_page_token: page_token option
    [@ocaml.doc
      "If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.\n\n The configured [maximumPageSize] determines how many results can be returned in a single call.\n "];
  events: history_event_list [@ocaml.doc "The list of history events.\n"]}
[@@ocaml.doc
  "Paginated representation of a workflow history for a workflow execution. This is the up to date, complete and authoritative record of the events related to all tasks and events in the life of the workflow execution.\n"]
type nonrec get_workflow_execution_history_input =
  {
  reverse_order: reverse_order option
    [@ocaml.doc
      "When set to [true], returns the events in reverse order. By default the results are returned in ascending order of the [eventTimeStamp] of the events.\n"];
  maximum_page_size: page_size option
    [@ocaml.doc
      "The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results. \n"];
  next_page_token: page_token option
    [@ocaml.doc
      "If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: \"[Specified token has \n      exceeded its maximum lifetime]\". \n\n The configured [maximumPageSize] determines how many results can be returned in a single call. \n "];
  execution: workflow_execution
    [@ocaml.doc
      "Specifies the workflow execution for which to return the history.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain containing the workflow execution.\n"]}
[@@ocaml.doc ""]
type nonrec describe_workflow_type_input =
  {
  workflow_type: workflow_type
    [@ocaml.doc "The workflow type to describe.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain in which this workflow type is registered.\n"]}
[@@ocaml.doc ""]
type nonrec describe_workflow_execution_input =
  {
  execution: workflow_execution
    [@ocaml.doc "The workflow execution to describe.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain containing the workflow execution.\n"]}
[@@ocaml.doc ""]
type nonrec domain_configuration =
  {
  workflow_execution_retention_period_in_days: duration_in_days
    [@ocaml.doc
      "The retention period for workflow executions in this domain.\n"]}
[@@ocaml.doc "Contains the configuration settings of a domain.\n"]
type nonrec domain_detail =
  {
  configuration: domain_configuration
    [@ocaml.doc
      "The domain configuration. Currently, this includes only the domain's retention period.\n"];
  domain_info: domain_info
    [@ocaml.doc
      "The basic information about a domain, such as its name, status, and description.\n"]}
[@@ocaml.doc "Contains details of a domain.\n"]
type nonrec describe_domain_input =
  {
  name: domain_name [@ocaml.doc "The name of the domain to describe.\n"]}
[@@ocaml.doc ""]
type nonrec activity_type_configuration =
  {
  default_task_schedule_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      " The default maximum duration, specified when registering the activity type, for tasks of this activity type. You can override this default when scheduling a task through the [ScheduleActivityTask] [Decision].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  default_task_schedule_to_start_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      " The default maximum duration, specified when registering the activity type, that a task of an activity type can wait before being assigned to a worker. You can override this default when scheduling a task through the [ScheduleActivityTask] [Decision].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "];
  default_task_priority: task_priority option
    [@ocaml.doc
      " The default task priority for tasks of this activity type, specified at registration. If not set, then [0] is used as the default priority. This default can be overridden when scheduling an activity task.\n\n Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.\n \n  For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.\n  "];
  default_task_list: task_list option
    [@ocaml.doc
      " The default task list specified for this activity type at registration. This default is used if a task list isn't provided when a task is scheduled through the [ScheduleActivityTask] [Decision]. You can override the default registered task list when scheduling a task through the [ScheduleActivityTask] [Decision].\n"];
  default_task_heartbeat_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      " The default maximum time, in seconds, before which a worker processing a task must report progress by calling [RecordActivityTaskHeartbeat].\n\n You can specify this value only when {i registering} an activity type. The registered default value can be overridden when you schedule a task through the [ScheduleActivityTask] [Decision]. If the activity worker subsequently attempts to record a heartbeat or returns a result, the activity worker receives an [UnknownResource] fault. In this case, Amazon SWF no longer considers the activity task to be valid; the activity worker should clean up the activity task.\n \n  The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n  "];
  default_task_start_to_close_timeout: duration_in_seconds_optional option
    [@ocaml.doc
      " The default maximum duration for tasks of an activity type specified when registering the activity type. You can override this default when scheduling a task through the [ScheduleActivityTask] [Decision].\n\n The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.\n "]}
[@@ocaml.doc "Configuration settings registered with the activity type.\n"]
type nonrec activity_type_detail =
  {
  configuration: activity_type_configuration
    [@ocaml.doc
      "The configuration settings registered with the activity type.\n"];
  type_info: activity_type_info
    [@ocaml.doc
      "General information about the activity type.\n\n The status of activity type (returned in the ActivityTypeInfo structure) can be one of the following.\n \n  {ul\n        {-   [REGISTERED] \226\128\147 The type is registered and available. Workers supporting this type should be running. \n            \n             }\n        {-   [DEPRECATED] \226\128\147 The type was deprecated using [DeprecateActivityType], but is still in use. You should keep workers supporting this type running. You cannot create new tasks of this type. \n            \n             }\n        }\n  "]}
[@@ocaml.doc "Detailed information about an activity type.\n"]
type nonrec describe_activity_type_input =
  {
  activity_type: activity_type
    [@ocaml.doc
      "The activity type to get information about. Activity types are identified by the [name] and [version] that were supplied when the activity was registered.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain in which the activity type is registered.\n"]}
[@@ocaml.doc ""]
type nonrec deprecate_workflow_type_input =
  {
  workflow_type: workflow_type
    [@ocaml.doc "The workflow type to deprecate.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain in which the workflow type is registered.\n"]}
[@@ocaml.doc ""]
type nonrec domain_deprecated_fault =
  {
  message: error_message option
    [@ocaml.doc
      "A description that may help with diagnosing the cause of the fault.\n"]}
[@@ocaml.doc "Returned when the specified domain has been deprecated.\n"]
type nonrec deprecate_domain_input =
  {
  name: domain_name [@ocaml.doc "The name of the domain to deprecate.\n"]}
[@@ocaml.doc ""]
type nonrec deprecate_activity_type_input =
  {
  activity_type: activity_type
    [@ocaml.doc "The activity type to deprecate.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain in which the activity type is registered.\n"]}
[@@ocaml.doc ""]
type nonrec delete_workflow_type_input =
  {
  workflow_type: workflow_type [@ocaml.doc "The workflow type to delete.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain in which the workflow type is registered.\n"]}
[@@ocaml.doc ""]
type nonrec delete_activity_type_input =
  {
  activity_type: activity_type [@ocaml.doc "The activity type to delete.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain in which the activity type is registered.\n"]}
[@@ocaml.doc ""]
type nonrec pending_task_count =
  {
  truncated: truncated option
    [@ocaml.doc
      "If set to true, indicates that the actual count was more than the maximum supported by this API and the count returned is the truncated value.\n"];
  count: count [@ocaml.doc "The number of tasks in the task list.\n"]}
[@@ocaml.doc "Contains the count of tasks in a task list.\n"]
type nonrec count_pending_decision_tasks_input =
  {
  task_list: task_list [@ocaml.doc "The name of the task list.\n"];
  domain: domain_name
    [@ocaml.doc "The name of the domain that contains the task list.\n"]}
[@@ocaml.doc ""]
type nonrec count_pending_activity_tasks_input =
  {
  task_list: task_list [@ocaml.doc "The name of the task list.\n"];
  domain: domain_name
    [@ocaml.doc "The name of the domain that contains the task list.\n"]}
[@@ocaml.doc ""]
type nonrec count_open_workflow_executions_input =
  {
  execution_filter: workflow_execution_filter option
    [@ocaml.doc
      "If specified, only workflow executions matching the [WorkflowId] in the filter are counted.\n\n   [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  tag_filter: tag_filter option
    [@ocaml.doc
      "If specified, only executions that have a tag that matches the filter are counted.\n\n   [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  type_filter: workflow_type_filter option
    [@ocaml.doc
      "Specifies the type of the workflow executions to be counted.\n\n   [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  start_time_filter: execution_time_filter
    [@ocaml.doc
      "Specifies the start time criteria that workflow executions must meet in order to be counted.\n"];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain containing the workflow executions to count.\n"]}
[@@ocaml.doc ""]
type nonrec count_closed_workflow_executions_input =
  {
  close_status_filter: close_status_filter option
    [@ocaml.doc
      "If specified, only workflow executions that match this close status are counted. This filter has an affect only if [executionStatus] is specified as [CLOSED].\n\n   [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  tag_filter: tag_filter option
    [@ocaml.doc
      "If specified, only executions that have a tag that matches the filter are counted.\n\n   [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  type_filter: workflow_type_filter option
    [@ocaml.doc
      "If specified, indicates the type of the workflow executions to be counted.\n\n   [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  execution_filter: workflow_execution_filter option
    [@ocaml.doc
      "If specified, only workflow executions matching the [WorkflowId] in the filter are counted.\n\n   [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.\n  \n   "];
  close_time_filter: execution_time_filter option
    [@ocaml.doc
      "If specified, only workflow executions that meet the close time criteria of the filter are counted.\n\n   [startTimeFilter] and [closeTimeFilter] are mutually exclusive. You must specify one of these in a request but not both.\n  \n   "];
  start_time_filter: execution_time_filter option
    [@ocaml.doc
      "If specified, only workflow executions that meet the start time criteria of the filter are counted.\n\n   [startTimeFilter] and [closeTimeFilter] are mutually exclusive. You must specify one of these in a request but not both.\n  \n   "];
  domain: domain_name
    [@ocaml.doc
      "The name of the domain containing the workflow executions to count.\n"]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_workflow_type :
  version:version -> name:name -> unit -> workflow_type
val make_workflow_type_info :
  ?deprecation_date:timestamp ->
    ?description:description ->
      creation_date:timestamp ->
        status:registration_status ->
          workflow_type:workflow_type -> unit -> workflow_type_info
val make_workflow_type_infos :
  ?next_page_token:page_token ->
    type_infos:workflow_type_info_list -> unit -> workflow_type_infos
val make_workflow_type_filter :
  ?version:version_optional -> name:name -> unit -> workflow_type_filter
val make_task_list : name:name -> unit -> task_list
val make_workflow_type_configuration :
  ?default_lambda_role:arn ->
    ?default_child_policy:child_policy ->
      ?default_task_priority:task_priority ->
        ?default_task_list:task_list ->
          ?default_execution_start_to_close_timeout:duration_in_seconds_optional
            ->
            ?default_task_start_to_close_timeout:duration_in_seconds_optional
              -> unit -> workflow_type_configuration
val make_workflow_type_detail :
  configuration:workflow_type_configuration ->
    type_info:workflow_type_info -> unit -> workflow_type_detail
val make_workflow_execution_timed_out_event_attributes :
  child_policy:child_policy ->
    timeout_type:workflow_execution_timeout_type ->
      unit -> workflow_execution_timed_out_event_attributes
val make_workflow_execution_terminated_event_attributes :
  ?cause:workflow_execution_terminated_cause ->
    ?details:data ->
      ?reason:terminate_reason ->
        child_policy:child_policy ->
          unit -> workflow_execution_terminated_event_attributes
val make_workflow_execution :
  run_id:workflow_run_id ->
    workflow_id:workflow_id -> unit -> workflow_execution
val make_workflow_execution_started_event_attributes :
  ?lambda_role:arn ->
    ?parent_initiated_event_id:event_id ->
      ?parent_workflow_execution:workflow_execution ->
        ?continued_execution_run_id:workflow_run_id_optional ->
          ?tag_list:tag_list ->
            ?task_priority:task_priority ->
              ?task_start_to_close_timeout:duration_in_seconds_optional ->
                ?execution_start_to_close_timeout:duration_in_seconds_optional
                  ->
                  ?input:data ->
                    workflow_type:workflow_type ->
                      task_list:task_list ->
                        child_policy:child_policy ->
                          unit -> workflow_execution_started_event_attributes
val make_workflow_execution_signaled_event_attributes :
  ?external_initiated_event_id:event_id ->
    ?external_workflow_execution:workflow_execution ->
      ?input:data ->
        signal_name:signal_name ->
          unit -> workflow_execution_signaled_event_attributes
val make_workflow_execution_open_counts :
  ?open_lambda_functions:count ->
    open_child_workflow_executions:count ->
      open_timers:count ->
        open_decision_tasks:open_decision_tasks_count ->
          open_activity_tasks:count -> unit -> workflow_execution_open_counts
val make_workflow_execution_info :
  ?cancel_requested:canceled ->
    ?tag_list:tag_list ->
      ?parent:workflow_execution ->
        ?close_status:close_status ->
          ?close_timestamp:timestamp ->
            execution_status:execution_status ->
              start_timestamp:timestamp ->
                workflow_type:workflow_type ->
                  execution:workflow_execution ->
                    unit -> workflow_execution_info
val make_workflow_execution_infos :
  ?next_page_token:page_token ->
    execution_infos:workflow_execution_info_list ->
      unit -> workflow_execution_infos
val make_workflow_execution_filter :
  workflow_id:workflow_id -> unit -> workflow_execution_filter
val make_workflow_execution_failed_event_attributes :
  ?details:data ->
    ?reason:failure_reason ->
      decision_task_completed_event_id:event_id ->
        unit -> workflow_execution_failed_event_attributes
val make_workflow_execution_configuration :
  ?lambda_role:arn ->
    ?task_priority:task_priority ->
      child_policy:child_policy ->
        task_list:task_list ->
          execution_start_to_close_timeout:duration_in_seconds ->
            task_start_to_close_timeout:duration_in_seconds ->
              unit -> workflow_execution_configuration
val make_workflow_execution_detail :
  ?latest_execution_context:data ->
    ?latest_activity_task_timestamp:timestamp ->
      open_counts:workflow_execution_open_counts ->
        execution_configuration:workflow_execution_configuration ->
          execution_info:workflow_execution_info ->
            unit -> workflow_execution_detail
val make_workflow_execution_count :
  ?truncated:truncated -> count:count -> unit -> workflow_execution_count
val make_workflow_execution_continued_as_new_event_attributes :
  ?lambda_role:arn ->
    ?tag_list:tag_list ->
      ?task_start_to_close_timeout:duration_in_seconds_optional ->
        ?task_priority:task_priority ->
          ?execution_start_to_close_timeout:duration_in_seconds_optional ->
            ?input:data ->
              workflow_type:workflow_type ->
                child_policy:child_policy ->
                  task_list:task_list ->
                    new_execution_run_id:workflow_run_id ->
                      decision_task_completed_event_id:event_id ->
                        unit ->
                          workflow_execution_continued_as_new_event_attributes
val make_workflow_execution_completed_event_attributes :
  ?result:data ->
    decision_task_completed_event_id:event_id ->
      unit -> workflow_execution_completed_event_attributes
val make_workflow_execution_canceled_event_attributes :
  ?details:data ->
    decision_task_completed_event_id:event_id ->
      unit -> workflow_execution_canceled_event_attributes
val make_workflow_execution_cancel_requested_event_attributes :
  ?cause:workflow_execution_cancel_requested_cause ->
    ?external_initiated_event_id:event_id ->
      ?external_workflow_execution:workflow_execution ->
        unit -> workflow_execution_cancel_requested_event_attributes
val make_untag_resource_input :
  tag_keys:resource_tag_key_list ->
    resource_arn:arn -> unit -> untag_resource_input
val make_undeprecate_workflow_type_input :
  workflow_type:workflow_type ->
    domain:domain_name -> unit -> undeprecate_workflow_type_input
val make_undeprecate_domain_input :
  name:domain_name -> unit -> undeprecate_domain_input
val make_activity_type :
  version:version -> name:name -> unit -> activity_type
val make_undeprecate_activity_type_input :
  activity_type:activity_type ->
    domain:domain_name -> unit -> undeprecate_activity_type_input
val make_timer_started_event_attributes :
  ?control:data ->
    decision_task_completed_event_id:event_id ->
      start_to_fire_timeout:duration_in_seconds ->
        timer_id:timer_id -> unit -> timer_started_event_attributes
val make_timer_fired_event_attributes :
  started_event_id:event_id ->
    timer_id:timer_id -> unit -> timer_fired_event_attributes
val make_timer_canceled_event_attributes :
  decision_task_completed_event_id:event_id ->
    started_event_id:event_id ->
      timer_id:timer_id -> unit -> timer_canceled_event_attributes
val make_terminate_workflow_execution_input :
  ?child_policy:child_policy ->
    ?details:data ->
      ?reason:terminate_reason ->
        ?run_id:workflow_run_id_optional ->
          workflow_id:workflow_id ->
            domain:domain_name -> unit -> terminate_workflow_execution_input
val make_resource_tag :
  ?value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag
val make_tag_resource_input :
  tags:resource_tag_list -> resource_arn:arn -> unit -> tag_resource_input
val make_tag_filter : tag:tag -> unit -> tag_filter
val make_start_workflow_execution_input :
  ?lambda_role:arn ->
    ?child_policy:child_policy ->
      ?task_start_to_close_timeout:duration_in_seconds_optional ->
        ?tag_list:tag_list ->
          ?execution_start_to_close_timeout:duration_in_seconds_optional ->
            ?input:data ->
              ?task_priority:task_priority ->
                ?task_list:task_list ->
                  workflow_type:workflow_type ->
                    workflow_id:workflow_id ->
                      domain:domain_name ->
                        unit -> start_workflow_execution_input
val make_run : ?run_id:workflow_run_id -> unit -> run
val make_start_timer_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:start_timer_failed_cause ->
      timer_id:timer_id -> unit -> start_timer_failed_event_attributes
val make_start_timer_decision_attributes :
  ?control:data ->
    start_to_fire_timeout:duration_in_seconds ->
      timer_id:timer_id -> unit -> start_timer_decision_attributes
val make_start_lambda_function_failed_event_attributes :
  ?message:cause_message ->
    ?cause:start_lambda_function_failed_cause ->
      ?scheduled_event_id:event_id ->
        unit -> start_lambda_function_failed_event_attributes
val make_start_child_workflow_execution_initiated_event_attributes :
  ?lambda_role:arn ->
    ?tag_list:tag_list ->
      ?task_start_to_close_timeout:duration_in_seconds_optional ->
        ?task_priority:task_priority ->
          ?execution_start_to_close_timeout:duration_in_seconds_optional ->
            ?input:data ->
              ?control:data ->
                child_policy:child_policy ->
                  decision_task_completed_event_id:event_id ->
                    task_list:task_list ->
                      workflow_type:workflow_type ->
                        workflow_id:workflow_id ->
                          unit ->
                            start_child_workflow_execution_initiated_event_attributes
val make_start_child_workflow_execution_failed_event_attributes :
  ?control:data ->
    decision_task_completed_event_id:event_id ->
      initiated_event_id:event_id ->
        workflow_id:workflow_id ->
          cause:start_child_workflow_execution_failed_cause ->
            workflow_type:workflow_type ->
              unit -> start_child_workflow_execution_failed_event_attributes
val make_start_child_workflow_execution_decision_attributes :
  ?lambda_role:arn ->
    ?tag_list:tag_list ->
      ?child_policy:child_policy ->
        ?task_start_to_close_timeout:duration_in_seconds_optional ->
          ?task_priority:task_priority ->
            ?task_list:task_list ->
              ?execution_start_to_close_timeout:duration_in_seconds_optional
                ->
                ?input:data ->
                  ?control:data ->
                    workflow_id:workflow_id ->
                      workflow_type:workflow_type ->
                        unit ->
                          start_child_workflow_execution_decision_attributes
val make_signal_workflow_execution_input :
  ?input:data ->
    ?run_id:workflow_run_id_optional ->
      signal_name:signal_name ->
        workflow_id:workflow_id ->
          domain:domain_name -> unit -> signal_workflow_execution_input
val make_schedule_activity_task_decision_attributes :
  ?heartbeat_timeout:duration_in_seconds_optional ->
    ?start_to_close_timeout:duration_in_seconds_optional ->
      ?schedule_to_start_timeout:duration_in_seconds_optional ->
        ?task_priority:task_priority ->
          ?task_list:task_list ->
            ?schedule_to_close_timeout:duration_in_seconds_optional ->
              ?input:data ->
                ?control:data ->
                  activity_id:activity_id ->
                    activity_type:activity_type ->
                      unit -> schedule_activity_task_decision_attributes
val make_request_cancel_activity_task_decision_attributes :
  activity_id:activity_id ->
    unit -> request_cancel_activity_task_decision_attributes
val make_complete_workflow_execution_decision_attributes :
  ?result:data -> unit -> complete_workflow_execution_decision_attributes
val make_fail_workflow_execution_decision_attributes :
  ?details:data ->
    ?reason:failure_reason ->
      unit -> fail_workflow_execution_decision_attributes
val make_cancel_workflow_execution_decision_attributes :
  ?details:data -> unit -> cancel_workflow_execution_decision_attributes
val make_continue_as_new_workflow_execution_decision_attributes :
  ?lambda_role:arn ->
    ?workflow_type_version:version ->
      ?tag_list:tag_list ->
        ?child_policy:child_policy ->
          ?task_start_to_close_timeout:duration_in_seconds_optional ->
            ?task_priority:task_priority ->
              ?task_list:task_list ->
                ?execution_start_to_close_timeout:duration_in_seconds_optional
                  ->
                  ?input:data ->
                    unit ->
                      continue_as_new_workflow_execution_decision_attributes
val make_record_marker_decision_attributes :
  ?details:data ->
    marker_name:marker_name -> unit -> record_marker_decision_attributes
val make_cancel_timer_decision_attributes :
  timer_id:timer_id -> unit -> cancel_timer_decision_attributes
val make_signal_external_workflow_execution_decision_attributes :
  ?control:data ->
    ?input:data ->
      ?run_id:workflow_run_id_optional ->
        signal_name:signal_name ->
          workflow_id:workflow_id ->
            unit -> signal_external_workflow_execution_decision_attributes
val make_request_cancel_external_workflow_execution_decision_attributes :
  ?control:data ->
    ?run_id:workflow_run_id_optional ->
      workflow_id:workflow_id ->
        unit ->
          request_cancel_external_workflow_execution_decision_attributes
val make_schedule_lambda_function_decision_attributes :
  ?start_to_close_timeout:duration_in_seconds_optional ->
    ?input:function_input ->
      ?control:data ->
        name:function_name ->
          id:function_id ->
            unit -> schedule_lambda_function_decision_attributes
val make_decision :
  ?schedule_lambda_function_decision_attributes:schedule_lambda_function_decision_attributes
    ->
    ?start_child_workflow_execution_decision_attributes:start_child_workflow_execution_decision_attributes
      ->
      ?request_cancel_external_workflow_execution_decision_attributes:request_cancel_external_workflow_execution_decision_attributes
        ->
        ?signal_external_workflow_execution_decision_attributes:signal_external_workflow_execution_decision_attributes
          ->
          ?cancel_timer_decision_attributes:cancel_timer_decision_attributes
            ->
            ?start_timer_decision_attributes:start_timer_decision_attributes
              ->
              ?record_marker_decision_attributes:record_marker_decision_attributes
                ->
                ?continue_as_new_workflow_execution_decision_attributes:continue_as_new_workflow_execution_decision_attributes
                  ->
                  ?cancel_workflow_execution_decision_attributes:cancel_workflow_execution_decision_attributes
                    ->
                    ?fail_workflow_execution_decision_attributes:fail_workflow_execution_decision_attributes
                      ->
                      ?complete_workflow_execution_decision_attributes:complete_workflow_execution_decision_attributes
                        ->
                        ?request_cancel_activity_task_decision_attributes:request_cancel_activity_task_decision_attributes
                          ->
                          ?schedule_activity_task_decision_attributes:schedule_activity_task_decision_attributes
                            ->
                            decision_type:decision_type -> unit -> decision
val make_respond_decision_task_completed_input :
  ?task_list_schedule_to_start_timeout:duration_in_seconds_optional ->
    ?task_list:task_list ->
      ?execution_context:data ->
        ?decisions:decision_list ->
          task_token:task_token ->
            unit -> respond_decision_task_completed_input
val make_respond_activity_task_failed_input :
  ?details:data ->
    ?reason:failure_reason ->
      task_token:task_token -> unit -> respond_activity_task_failed_input
val make_respond_activity_task_completed_input :
  ?result:data ->
    task_token:task_token -> unit -> respond_activity_task_completed_input
val make_respond_activity_task_canceled_input :
  ?details:data ->
    task_token:task_token -> unit -> respond_activity_task_canceled_input
val make_request_cancel_workflow_execution_input :
  ?run_id:workflow_run_id_optional ->
    workflow_id:workflow_id ->
      domain:domain_name -> unit -> request_cancel_workflow_execution_input
val make_register_workflow_type_input :
  ?default_lambda_role:arn ->
    ?default_child_policy:child_policy ->
      ?default_task_priority:task_priority ->
        ?default_task_list:task_list ->
          ?default_execution_start_to_close_timeout:duration_in_seconds_optional
            ->
            ?default_task_start_to_close_timeout:duration_in_seconds_optional
              ->
              ?description:description ->
                version:version ->
                  name:name ->
                    domain:domain_name ->
                      unit -> register_workflow_type_input
val make_register_domain_input :
  ?tags:resource_tag_list ->
    ?description:description ->
      workflow_execution_retention_period_in_days:duration_in_days ->
        name:domain_name -> unit -> register_domain_input
val make_register_activity_type_input :
  ?default_task_schedule_to_close_timeout:duration_in_seconds_optional ->
    ?default_task_schedule_to_start_timeout:duration_in_seconds_optional ->
      ?default_task_priority:task_priority ->
        ?default_task_list:task_list ->
          ?default_task_heartbeat_timeout:duration_in_seconds_optional ->
            ?default_task_start_to_close_timeout:duration_in_seconds_optional
              ->
              ?description:description ->
                version:version ->
                  name:name ->
                    domain:domain_name ->
                      unit -> register_activity_type_input
val make_activity_task_status :
  cancel_requested:canceled -> unit -> activity_task_status
val make_record_activity_task_heartbeat_input :
  ?details:limited_data ->
    task_token:task_token -> unit -> record_activity_task_heartbeat_input
val make_complete_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:complete_workflow_execution_failed_cause ->
      unit -> complete_workflow_execution_failed_event_attributes
val make_fail_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:fail_workflow_execution_failed_cause ->
      unit -> fail_workflow_execution_failed_event_attributes
val make_cancel_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:cancel_workflow_execution_failed_cause ->
      unit -> cancel_workflow_execution_failed_event_attributes
val make_continue_as_new_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:continue_as_new_workflow_execution_failed_cause ->
      unit -> continue_as_new_workflow_execution_failed_event_attributes
val make_decision_task_scheduled_event_attributes :
  ?schedule_to_start_timeout:duration_in_seconds_optional ->
    ?start_to_close_timeout:duration_in_seconds_optional ->
      ?task_priority:task_priority ->
        task_list:task_list ->
          unit -> decision_task_scheduled_event_attributes
val make_decision_task_started_event_attributes :
  ?identity:identity ->
    scheduled_event_id:event_id ->
      unit -> decision_task_started_event_attributes
val make_decision_task_completed_event_attributes :
  ?task_list_schedule_to_start_timeout:duration_in_seconds_optional ->
    ?task_list:task_list ->
      ?execution_context:data ->
        started_event_id:event_id ->
          scheduled_event_id:event_id ->
            unit -> decision_task_completed_event_attributes
val make_decision_task_timed_out_event_attributes :
  started_event_id:event_id ->
    scheduled_event_id:event_id ->
      timeout_type:decision_task_timeout_type ->
        unit -> decision_task_timed_out_event_attributes
val make_activity_task_scheduled_event_attributes :
  ?heartbeat_timeout:duration_in_seconds_optional ->
    ?task_priority:task_priority ->
      ?start_to_close_timeout:duration_in_seconds_optional ->
        ?schedule_to_close_timeout:duration_in_seconds_optional ->
          ?schedule_to_start_timeout:duration_in_seconds_optional ->
            ?control:data ->
              ?input:data ->
                decision_task_completed_event_id:event_id ->
                  task_list:task_list ->
                    activity_id:activity_id ->
                      activity_type:activity_type ->
                        unit -> activity_task_scheduled_event_attributes
val make_activity_task_started_event_attributes :
  ?identity:identity ->
    scheduled_event_id:event_id ->
      unit -> activity_task_started_event_attributes
val make_activity_task_completed_event_attributes :
  ?result:data ->
    started_event_id:event_id ->
      scheduled_event_id:event_id ->
        unit -> activity_task_completed_event_attributes
val make_activity_task_failed_event_attributes :
  ?details:data ->
    ?reason:failure_reason ->
      started_event_id:event_id ->
        scheduled_event_id:event_id ->
          unit -> activity_task_failed_event_attributes
val make_activity_task_timed_out_event_attributes :
  ?details:limited_data ->
    started_event_id:event_id ->
      scheduled_event_id:event_id ->
        timeout_type:activity_task_timeout_type ->
          unit -> activity_task_timed_out_event_attributes
val make_activity_task_canceled_event_attributes :
  ?latest_cancel_requested_event_id:event_id ->
    ?details:data ->
      started_event_id:event_id ->
        scheduled_event_id:event_id ->
          unit -> activity_task_canceled_event_attributes
val make_activity_task_cancel_requested_event_attributes :
  activity_id:activity_id ->
    decision_task_completed_event_id:event_id ->
      unit -> activity_task_cancel_requested_event_attributes
val make_marker_recorded_event_attributes :
  ?details:data ->
    decision_task_completed_event_id:event_id ->
      marker_name:marker_name -> unit -> marker_recorded_event_attributes
val make_record_marker_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:record_marker_failed_cause ->
      marker_name:marker_name ->
        unit -> record_marker_failed_event_attributes
val make_child_workflow_execution_started_event_attributes :
  initiated_event_id:event_id ->
    workflow_type:workflow_type ->
      workflow_execution:workflow_execution ->
        unit -> child_workflow_execution_started_event_attributes
val make_child_workflow_execution_completed_event_attributes :
  ?result:data ->
    started_event_id:event_id ->
      initiated_event_id:event_id ->
        workflow_type:workflow_type ->
          workflow_execution:workflow_execution ->
            unit -> child_workflow_execution_completed_event_attributes
val make_child_workflow_execution_failed_event_attributes :
  ?details:data ->
    ?reason:failure_reason ->
      started_event_id:event_id ->
        initiated_event_id:event_id ->
          workflow_type:workflow_type ->
            workflow_execution:workflow_execution ->
              unit -> child_workflow_execution_failed_event_attributes
val make_child_workflow_execution_timed_out_event_attributes :
  started_event_id:event_id ->
    initiated_event_id:event_id ->
      timeout_type:workflow_execution_timeout_type ->
        workflow_type:workflow_type ->
          workflow_execution:workflow_execution ->
            unit -> child_workflow_execution_timed_out_event_attributes
val make_child_workflow_execution_canceled_event_attributes :
  ?details:data ->
    started_event_id:event_id ->
      initiated_event_id:event_id ->
        workflow_type:workflow_type ->
          workflow_execution:workflow_execution ->
            unit -> child_workflow_execution_canceled_event_attributes
val make_child_workflow_execution_terminated_event_attributes :
  started_event_id:event_id ->
    initiated_event_id:event_id ->
      workflow_type:workflow_type ->
        workflow_execution:workflow_execution ->
          unit -> child_workflow_execution_terminated_event_attributes
val make_signal_external_workflow_execution_initiated_event_attributes :
  ?control:data ->
    ?input:data ->
      ?run_id:workflow_run_id_optional ->
        decision_task_completed_event_id:event_id ->
          signal_name:signal_name ->
            workflow_id:workflow_id ->
              unit ->
                signal_external_workflow_execution_initiated_event_attributes
val make_external_workflow_execution_signaled_event_attributes :
  initiated_event_id:event_id ->
    workflow_execution:workflow_execution ->
      unit -> external_workflow_execution_signaled_event_attributes
val make_signal_external_workflow_execution_failed_event_attributes :
  ?control:data ->
    ?run_id:workflow_run_id_optional ->
      decision_task_completed_event_id:event_id ->
        initiated_event_id:event_id ->
          cause:signal_external_workflow_execution_failed_cause ->
            workflow_id:workflow_id ->
              unit ->
                signal_external_workflow_execution_failed_event_attributes
val make_external_workflow_execution_cancel_requested_event_attributes :
  initiated_event_id:event_id ->
    workflow_execution:workflow_execution ->
      unit -> external_workflow_execution_cancel_requested_event_attributes
val
  make_request_cancel_external_workflow_execution_initiated_event_attributes
  :
  ?control:data ->
    ?run_id:workflow_run_id_optional ->
      decision_task_completed_event_id:event_id ->
        workflow_id:workflow_id ->
          unit ->
            request_cancel_external_workflow_execution_initiated_event_attributes
val make_request_cancel_external_workflow_execution_failed_event_attributes :
  ?control:data ->
    ?run_id:workflow_run_id_optional ->
      decision_task_completed_event_id:event_id ->
        initiated_event_id:event_id ->
          cause:request_cancel_external_workflow_execution_failed_cause ->
            workflow_id:workflow_id ->
              unit ->
                request_cancel_external_workflow_execution_failed_event_attributes
val make_schedule_activity_task_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:schedule_activity_task_failed_cause ->
      activity_id:activity_id ->
        activity_type:activity_type ->
          unit -> schedule_activity_task_failed_event_attributes
val make_request_cancel_activity_task_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:request_cancel_activity_task_failed_cause ->
      activity_id:activity_id ->
        unit -> request_cancel_activity_task_failed_event_attributes
val make_cancel_timer_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:cancel_timer_failed_cause ->
      timer_id:timer_id -> unit -> cancel_timer_failed_event_attributes
val make_lambda_function_scheduled_event_attributes :
  ?start_to_close_timeout:duration_in_seconds_optional ->
    ?input:function_input ->
      ?control:data ->
        decision_task_completed_event_id:event_id ->
          name:function_name ->
            id:function_id ->
              unit -> lambda_function_scheduled_event_attributes
val make_lambda_function_started_event_attributes :
  scheduled_event_id:event_id ->
    unit -> lambda_function_started_event_attributes
val make_lambda_function_completed_event_attributes :
  ?result:data ->
    started_event_id:event_id ->
      scheduled_event_id:event_id ->
        unit -> lambda_function_completed_event_attributes
val make_lambda_function_failed_event_attributes :
  ?details:data ->
    ?reason:failure_reason ->
      started_event_id:event_id ->
        scheduled_event_id:event_id ->
          unit -> lambda_function_failed_event_attributes
val make_lambda_function_timed_out_event_attributes :
  ?timeout_type:lambda_function_timeout_type ->
    started_event_id:event_id ->
      scheduled_event_id:event_id ->
        unit -> lambda_function_timed_out_event_attributes
val make_schedule_lambda_function_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:schedule_lambda_function_failed_cause ->
      name:function_name ->
        id:function_id ->
          unit -> schedule_lambda_function_failed_event_attributes
val make_history_event :
  ?start_lambda_function_failed_event_attributes:start_lambda_function_failed_event_attributes
    ->
    ?schedule_lambda_function_failed_event_attributes:schedule_lambda_function_failed_event_attributes
      ->
      ?lambda_function_timed_out_event_attributes:lambda_function_timed_out_event_attributes
        ->
        ?lambda_function_failed_event_attributes:lambda_function_failed_event_attributes
          ->
          ?lambda_function_completed_event_attributes:lambda_function_completed_event_attributes
            ->
            ?lambda_function_started_event_attributes:lambda_function_started_event_attributes
              ->
              ?lambda_function_scheduled_event_attributes:lambda_function_scheduled_event_attributes
                ->
                ?start_child_workflow_execution_failed_event_attributes:start_child_workflow_execution_failed_event_attributes
                  ->
                  ?cancel_timer_failed_event_attributes:cancel_timer_failed_event_attributes
                    ->
                    ?start_timer_failed_event_attributes:start_timer_failed_event_attributes
                      ->
                      ?request_cancel_activity_task_failed_event_attributes:request_cancel_activity_task_failed_event_attributes
                        ->
                        ?schedule_activity_task_failed_event_attributes:schedule_activity_task_failed_event_attributes
                          ->
                          ?request_cancel_external_workflow_execution_failed_event_attributes:request_cancel_external_workflow_execution_failed_event_attributes
                            ->
                            ?request_cancel_external_workflow_execution_initiated_event_attributes:request_cancel_external_workflow_execution_initiated_event_attributes
                              ->
                              ?external_workflow_execution_cancel_requested_event_attributes:external_workflow_execution_cancel_requested_event_attributes
                                ->
                                ?signal_external_workflow_execution_failed_event_attributes:signal_external_workflow_execution_failed_event_attributes
                                  ->
                                  ?external_workflow_execution_signaled_event_attributes:external_workflow_execution_signaled_event_attributes
                                    ->
                                    ?signal_external_workflow_execution_initiated_event_attributes:signal_external_workflow_execution_initiated_event_attributes
                                      ->
                                      ?child_workflow_execution_terminated_event_attributes:child_workflow_execution_terminated_event_attributes
                                        ->
                                        ?child_workflow_execution_canceled_event_attributes:child_workflow_execution_canceled_event_attributes
                                          ->
                                          ?child_workflow_execution_timed_out_event_attributes:child_workflow_execution_timed_out_event_attributes
                                            ->
                                            ?child_workflow_execution_failed_event_attributes:child_workflow_execution_failed_event_attributes
                                              ->
                                              ?child_workflow_execution_completed_event_attributes:child_workflow_execution_completed_event_attributes
                                                ->
                                                ?child_workflow_execution_started_event_attributes:child_workflow_execution_started_event_attributes
                                                  ->
                                                  ?start_child_workflow_execution_initiated_event_attributes:start_child_workflow_execution_initiated_event_attributes
                                                    ->
                                                    ?timer_canceled_event_attributes:timer_canceled_event_attributes
                                                      ->
                                                      ?timer_fired_event_attributes:timer_fired_event_attributes
                                                        ->
                                                        ?timer_started_event_attributes:timer_started_event_attributes
                                                          ->
                                                          ?record_marker_failed_event_attributes:record_marker_failed_event_attributes
                                                            ->
                                                            ?marker_recorded_event_attributes:marker_recorded_event_attributes
                                                              ->
                                                              ?workflow_execution_signaled_event_attributes:workflow_execution_signaled_event_attributes
                                                                ->
                                                                ?activity_task_cancel_requested_event_attributes:activity_task_cancel_requested_event_attributes
                                                                  ->
                                                                  ?activity_task_canceled_event_attributes:activity_task_canceled_event_attributes
                                                                    ->
                                                                    ?activity_task_timed_out_event_attributes:activity_task_timed_out_event_attributes
                                                                    ->
                                                                    ?activity_task_failed_event_attributes:activity_task_failed_event_attributes
                                                                    ->
                                                                    ?activity_task_completed_event_attributes:activity_task_completed_event_attributes
                                                                    ->
                                                                    ?activity_task_started_event_attributes:activity_task_started_event_attributes
                                                                    ->
                                                                    ?activity_task_scheduled_event_attributes:activity_task_scheduled_event_attributes
                                                                    ->
                                                                    ?decision_task_timed_out_event_attributes:decision_task_timed_out_event_attributes
                                                                    ->
                                                                    ?decision_task_completed_event_attributes:decision_task_completed_event_attributes
                                                                    ->
                                                                    ?decision_task_started_event_attributes:decision_task_started_event_attributes
                                                                    ->
                                                                    ?decision_task_scheduled_event_attributes:decision_task_scheduled_event_attributes
                                                                    ->
                                                                    ?workflow_execution_cancel_requested_event_attributes:workflow_execution_cancel_requested_event_attributes
                                                                    ->
                                                                    ?workflow_execution_terminated_event_attributes:workflow_execution_terminated_event_attributes
                                                                    ->
                                                                    ?continue_as_new_workflow_execution_failed_event_attributes:continue_as_new_workflow_execution_failed_event_attributes
                                                                    ->
                                                                    ?workflow_execution_continued_as_new_event_attributes:workflow_execution_continued_as_new_event_attributes
                                                                    ->
                                                                    ?cancel_workflow_execution_failed_event_attributes:cancel_workflow_execution_failed_event_attributes
                                                                    ->
                                                                    ?workflow_execution_canceled_event_attributes:workflow_execution_canceled_event_attributes
                                                                    ->
                                                                    ?workflow_execution_timed_out_event_attributes:workflow_execution_timed_out_event_attributes
                                                                    ->
                                                                    ?fail_workflow_execution_failed_event_attributes:fail_workflow_execution_failed_event_attributes
                                                                    ->
                                                                    ?workflow_execution_failed_event_attributes:workflow_execution_failed_event_attributes
                                                                    ->
                                                                    ?complete_workflow_execution_failed_event_attributes:complete_workflow_execution_failed_event_attributes
                                                                    ->
                                                                    ?workflow_execution_completed_event_attributes:workflow_execution_completed_event_attributes
                                                                    ->
                                                                    ?workflow_execution_started_event_attributes:workflow_execution_started_event_attributes
                                                                    ->
                                                                    event_id:event_id
                                                                    ->
                                                                    event_type:event_type
                                                                    ->
                                                                    event_timestamp:timestamp
                                                                    ->
                                                                    unit ->
                                                                    history_event
val make_decision_task :
  ?previous_started_event_id:event_id ->
    ?next_page_token:page_token ->
      events:history_event_list ->
        workflow_type:workflow_type ->
          workflow_execution:workflow_execution ->
            started_event_id:event_id ->
              task_token:task_token -> unit -> decision_task
val make_poll_for_decision_task_input :
  ?start_at_previous_started_event:start_at_previous_started_event ->
    ?reverse_order:reverse_order ->
      ?maximum_page_size:page_size ->
        ?next_page_token:page_token ->
          ?identity:identity ->
            task_list:task_list ->
              domain:domain_name -> unit -> poll_for_decision_task_input
val make_activity_task :
  ?input:data ->
    activity_type:activity_type ->
      workflow_execution:workflow_execution ->
        started_event_id:event_id ->
          activity_id:activity_id ->
            task_token:task_token -> unit -> activity_task
val make_poll_for_activity_task_input :
  ?identity:identity ->
    task_list:task_list ->
      domain:domain_name -> unit -> poll_for_activity_task_input
val make_list_workflow_types_input :
  ?reverse_order:reverse_order ->
    ?maximum_page_size:page_size ->
      ?next_page_token:page_token ->
        ?name:name ->
          registration_status:registration_status ->
            domain:domain_name -> unit -> list_workflow_types_input
val make_list_tags_for_resource_output :
  ?tags:resource_tag_list -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input :
  resource_arn:arn -> unit -> list_tags_for_resource_input
val make_execution_time_filter :
  ?latest_date:timestamp ->
    oldest_date:timestamp -> unit -> execution_time_filter
val make_list_open_workflow_executions_input :
  ?execution_filter:workflow_execution_filter ->
    ?reverse_order:reverse_order ->
      ?maximum_page_size:page_size ->
        ?next_page_token:page_token ->
          ?tag_filter:tag_filter ->
            ?type_filter:workflow_type_filter ->
              start_time_filter:execution_time_filter ->
                domain:domain_name ->
                  unit -> list_open_workflow_executions_input
val make_domain_info :
  ?arn:arn ->
    ?description:description ->
      status:registration_status -> name:domain_name -> unit -> domain_info
val make_domain_infos :
  ?next_page_token:page_token ->
    domain_infos:domain_info_list -> unit -> domain_infos
val make_list_domains_input :
  ?reverse_order:reverse_order ->
    ?maximum_page_size:page_size ->
      ?next_page_token:page_token ->
        registration_status:registration_status -> unit -> list_domains_input
val make_close_status_filter :
  status:close_status -> unit -> close_status_filter
val make_list_closed_workflow_executions_input :
  ?reverse_order:reverse_order ->
    ?maximum_page_size:page_size ->
      ?next_page_token:page_token ->
        ?tag_filter:tag_filter ->
          ?type_filter:workflow_type_filter ->
            ?close_status_filter:close_status_filter ->
              ?execution_filter:workflow_execution_filter ->
                ?close_time_filter:execution_time_filter ->
                  ?start_time_filter:execution_time_filter ->
                    domain:domain_name ->
                      unit -> list_closed_workflow_executions_input
val make_activity_type_info :
  ?deprecation_date:timestamp ->
    ?description:description ->
      creation_date:timestamp ->
        status:registration_status ->
          activity_type:activity_type -> unit -> activity_type_info
val make_activity_type_infos :
  ?next_page_token:page_token ->
    type_infos:activity_type_info_list -> unit -> activity_type_infos
val make_list_activity_types_input :
  ?reverse_order:reverse_order ->
    ?maximum_page_size:page_size ->
      ?next_page_token:page_token ->
        ?name:name ->
          registration_status:registration_status ->
            domain:domain_name -> unit -> list_activity_types_input
val make_history :
  ?next_page_token:page_token -> events:history_event_list -> unit -> history
val make_get_workflow_execution_history_input :
  ?reverse_order:reverse_order ->
    ?maximum_page_size:page_size ->
      ?next_page_token:page_token ->
        execution:workflow_execution ->
          domain:domain_name -> unit -> get_workflow_execution_history_input
val make_describe_workflow_type_input :
  workflow_type:workflow_type ->
    domain:domain_name -> unit -> describe_workflow_type_input
val make_describe_workflow_execution_input :
  execution:workflow_execution ->
    domain:domain_name -> unit -> describe_workflow_execution_input
val make_domain_configuration :
  workflow_execution_retention_period_in_days:duration_in_days ->
    unit -> domain_configuration
val make_domain_detail :
  configuration:domain_configuration ->
    domain_info:domain_info -> unit -> domain_detail
val make_describe_domain_input :
  name:domain_name -> unit -> describe_domain_input
val make_activity_type_configuration :
  ?default_task_schedule_to_close_timeout:duration_in_seconds_optional ->
    ?default_task_schedule_to_start_timeout:duration_in_seconds_optional ->
      ?default_task_priority:task_priority ->
        ?default_task_list:task_list ->
          ?default_task_heartbeat_timeout:duration_in_seconds_optional ->
            ?default_task_start_to_close_timeout:duration_in_seconds_optional
              -> unit -> activity_type_configuration
val make_activity_type_detail :
  configuration:activity_type_configuration ->
    type_info:activity_type_info -> unit -> activity_type_detail
val make_describe_activity_type_input :
  activity_type:activity_type ->
    domain:domain_name -> unit -> describe_activity_type_input
val make_deprecate_workflow_type_input :
  workflow_type:workflow_type ->
    domain:domain_name -> unit -> deprecate_workflow_type_input
val make_deprecate_domain_input :
  name:domain_name -> unit -> deprecate_domain_input
val make_deprecate_activity_type_input :
  activity_type:activity_type ->
    domain:domain_name -> unit -> deprecate_activity_type_input
val make_delete_workflow_type_input :
  workflow_type:workflow_type ->
    domain:domain_name -> unit -> delete_workflow_type_input
val make_delete_activity_type_input :
  activity_type:activity_type ->
    domain:domain_name -> unit -> delete_activity_type_input
val make_pending_task_count :
  ?truncated:truncated -> count:count -> unit -> pending_task_count
val make_count_pending_decision_tasks_input :
  task_list:task_list ->
    domain:domain_name -> unit -> count_pending_decision_tasks_input
val make_count_pending_activity_tasks_input :
  task_list:task_list ->
    domain:domain_name -> unit -> count_pending_activity_tasks_input
val make_count_open_workflow_executions_input :
  ?execution_filter:workflow_execution_filter ->
    ?tag_filter:tag_filter ->
      ?type_filter:workflow_type_filter ->
        start_time_filter:execution_time_filter ->
          domain:domain_name -> unit -> count_open_workflow_executions_input
val make_count_closed_workflow_executions_input :
  ?close_status_filter:close_status_filter ->
    ?tag_filter:tag_filter ->
      ?type_filter:workflow_type_filter ->
        ?execution_filter:workflow_execution_filter ->
          ?close_time_filter:execution_time_filter ->
            ?start_time_filter:execution_time_filter ->
              domain:domain_name ->
                unit -> count_closed_workflow_executions_input(** {1:operations Operations} *)

module CountClosedWorkflowExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      count_closed_workflow_executions_input ->
        (workflow_execution_count,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns the number of closed workflow executions within the given domain that meet the specified filtering criteria.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].\n                           \n                            }\n                       {-   [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].\n                           \n                            }\n                       {-   [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module CountOpenWorkflowExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      count_open_workflow_executions_input ->
        (workflow_execution_count,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns the number of open workflow executions within the given domain that meet the specified filtering criteria.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].\n                           \n                            }\n                       {-   [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].\n                           \n                            }\n                       {-   [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module CountPendingActivityTasks :
sig
  val request :
    Smaws_Lib.Context.t ->
      count_pending_activity_tasks_input ->
        (pending_task_count,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns the estimated number of activity tasks in the specified task list. The count returned is an approximation and isn't guaranteed to be exact. If you specify a task list that no activity task was ever scheduled in then [0] is returned.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module CountPendingDecisionTasks :
sig
  val request :
    Smaws_Lib.Context.t ->
      count_pending_decision_tasks_input ->
        (pending_task_count,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns the estimated number of decision tasks in the specified task list. The count returned is an approximation and isn't guaranteed to be exact. If you specify a task list that no decision task was ever scheduled in then [0] is returned.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DeleteActivityType :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_activity_type_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeNotDeprecatedFault of type_not_deprecated_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Deletes the specified {i activity type}.\n\n Note: Prior to deletion, activity types must first be {b deprecated}. \n \n   After an activity type has been deleted, you cannot schedule new activities of that type. Activities that started before the type was deleted will continue to run. \n  \n    {b Access Control} \n   \n    You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n    \n     {ul\n           {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n               \n                }\n           {-  Use an [Action] element to allow or deny permission to call this action.\n               \n                }\n           {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n               \n                {ul\n                      {-   [activityType.name]: String constraint. The key is [swf:activityType.name].\n                          \n                           }\n                      {-   [activityType.version]: String constraint. The key is [swf:activityType.version].\n                          \n                           }\n                      \n            }\n             }\n           }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DeleteWorkflowType :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_workflow_type_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeNotDeprecatedFault of type_not_deprecated_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Deletes the specified {i workflow type}.\n\n Note: Prior to deletion, workflow types must first be {b deprecated}.\n \n   After a workflow type has been deleted, you cannot create new executions of that type. Executions that started before the type was deleted will continue to run. \n  \n    {b Access Control} \n   \n    You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n    \n     {ul\n           {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n               \n                }\n           {-  Use an [Action] element to allow or deny permission to call this action.\n               \n                }\n           {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n               \n                {ul\n                      {-   [workflowType.name]: String constraint. The key is [swf:workflowType.name].\n                          \n                           }\n                      {-   [workflowType.version]: String constraint. The key is [swf:workflowType.version].\n                          \n                           }\n                      \n            }\n             }\n           }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DeprecateActivityType :
sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_activity_type_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeDeprecatedFault of type_deprecated_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Deprecates the specified {i activity type}. After an activity type has been deprecated, you cannot create new tasks of that activity type. Tasks of this type that were scheduled before the type was deprecated continue to run.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [activityType.name]: String constraint. The key is [swf:activityType.name].\n                        \n                         }\n                    {-   [activityType.version]: String constraint. The key is [swf:activityType.version].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DeprecateDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_domain_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DomainDeprecatedFault of domain_deprecated_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Deprecates the specified domain. After a domain has been deprecated it cannot be used to create new workflow executions or register new types. However, you can still use visibility actions on this domain. Deprecating a domain also deprecates all activity and workflow types registered in the domain. Executions that were started before the domain was deprecated continues to run.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  You cannot use an IAM policy to constrain this action's parameters.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DeprecateWorkflowType :
sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_workflow_type_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeDeprecatedFault of type_deprecated_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Deprecates the specified {i workflow type}. After a workflow type has been deprecated, you cannot create new executions of that type. Executions that were started before the type was deprecated continues to run. A deprecated workflow type may still be used when calling visibility actions.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [workflowType.name]: String constraint. The key is [swf:workflowType.name].\n                           \n                            }\n                       {-   [workflowType.version]: String constraint. The key is [swf:workflowType.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DescribeActivityType :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_activity_type_input ->
        (activity_type_detail,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about the specified activity type. This includes configuration settings provided when the type was registered and other general information about the type.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [activityType.name]: String constraint. The key is [swf:activityType.name].\n                        \n                         }\n                    {-   [activityType.version]: String constraint. The key is [swf:activityType.version].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DescribeDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_domain_input ->
        (domain_detail,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about the specified domain, including description and status.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DescribeWorkflowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_workflow_execution_input ->
        (workflow_execution_detail,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about the specified workflow execution including its type and some statistics.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  You cannot use an IAM policy to constrain this action's parameters.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DescribeWorkflowType :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_workflow_type_input ->
        (workflow_type_detail,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about the specified {i workflow type}. This includes configuration settings specified when the type was registered and other information such as creation date, current status, etc.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [workflowType.name]: String constraint. The key is [swf:workflowType.name].\n                        \n                         }\n                    {-   [workflowType.version]: String constraint. The key is [swf:workflowType.version].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module GetWorkflowExecutionHistory :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_workflow_execution_history_input ->
        (history,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns the history of the specified workflow execution. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the [nextPageToken] returned by the initial call.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  You cannot use an IAM policy to constrain this action's parameters.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module ListActivityTypes :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_activity_types_input ->
        (activity_type_infos,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about all activities registered in the specified domain that match the specified name and registration status. The result includes information like creation date, current status of the activity, etc. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the [nextPageToken] returned by the initial call.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module ListClosedWorkflowExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_closed_workflow_executions_input ->
        (workflow_execution_infos,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns a list of closed workflow executions in the specified domain that meet the filtering criteria. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the nextPageToken returned by the initial call.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].\n                           \n                            }\n                       {-   [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].\n                           \n                            }\n                       {-   [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module ListDomains :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_domains_input ->
        (domain_infos,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault ])
          result
end[@@ocaml.doc
     "Returns the list of domains registered in the account. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the nextPageToken returned by the initial call.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains. The element must be set to [arn:aws:swf::AccountID:domain/*], where {i AccountID} is the account ID, with no dashes.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  You cannot use an IAM policy to constrain this action's parameters.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module ListOpenWorkflowExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_open_workflow_executions_input ->
        (workflow_execution_infos,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns a list of open workflow executions in the specified domain that meet the filtering criteria. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the nextPageToken returned by the initial call.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].\n                           \n                            }\n                       {-   [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].\n                           \n                            }\n                       {-   [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc "List tags for a given domain.\n"]
module ListWorkflowTypes :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_workflow_types_input ->
        (workflow_type_infos,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about workflow types in the specified domain. The results may be split into multiple pages that can be retrieved by making the call repeatedly.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module PollForActivityTask :
sig
  val request :
    Smaws_Lib.Context.t ->
      poll_for_activity_task_input ->
        (activity_task,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by workers to get an [ActivityTask] from the specified activity [taskList]. This initiates a long poll, where the service holds the HTTP connection open and responds as soon as a task becomes available. The maximum time the service holds on to the request before responding is 60 seconds. If no task is available within 60 seconds, the poll returns an empty result. An empty result, in this context, means that an ActivityTask is returned, but that the value of taskToken is an empty string. If a task is returned, the worker should use its type to identify and process it correctly.\n\n  Workers should set their client side socket timeout to at least 70 seconds (10 seconds higher than the maximum time service may hold the poll request).\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module PollForDecisionTask :
sig
  val request :
    Smaws_Lib.Context.t ->
      poll_for_decision_task_input ->
        (decision_task,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by deciders to get a [DecisionTask] from the specified decision [taskList]. A decision task may be returned for any open workflow execution that is using the specified task list. The task includes a paginated view of the history of the workflow execution. The decider should use the workflow type and the history to determine how to properly handle the task.\n\n This action initiates a long poll, where the service holds the HTTP connection open and responds as soon a task becomes available. If no decision task is available in the specified task list before the timeout of 60 seconds expires, an empty result is returned. An empty result, in this context, means that a DecisionTask is returned, but that the value of taskToken is an empty string.\n \n   Deciders should set their client side socket timeout to at least 70 seconds (10 seconds higher than the timeout).\n   \n      Because the number of workflow history events for a single workflow execution might be very large, the result returned might be split up across a number of pages. To retrieve subsequent pages, make additional calls to [PollForDecisionTask] using the [nextPageToken] returned by the initial call. Note that you do {i not} call [GetWorkflowExecutionHistory] with this [nextPageToken]. Instead, call [PollForDecisionTask] again.\n      \n         {b Access Control} \n        \n         You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n         \n          {ul\n                {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                    \n                     }\n                {-  Use an [Action] element to allow or deny permission to call this action.\n                    \n                     }\n                {-  Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.\n                    \n                     }\n                }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RecordActivityTaskHeartbeat :
sig
  val request :
    Smaws_Lib.Context.t ->
      record_activity_task_heartbeat_input ->
        (activity_task_status,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by activity workers to report to the service that the [ActivityTask] represented by the specified [taskToken] is still making progress. The worker can also specify details of the progress, for example percent complete, using the [details] parameter. This action can also be used by the worker as a mechanism to check if cancellation is being requested for the activity task. If a cancellation is being attempted for the specified task, then the boolean [cancelRequested] flag returned by the service is set to [true].\n\n This action resets the [taskHeartbeatTimeout] clock. The [taskHeartbeatTimeout] is specified in [RegisterActivityType].\n \n  This action doesn't in itself create an event in the workflow execution history. However, if the task times out, the workflow execution history contains a [ActivityTaskTimedOut] event that contains the information from the last heartbeat generated by the activity worker.\n  \n    The [taskStartToCloseTimeout] of an activity type is the maximum duration of an activity task, regardless of the number of [RecordActivityTaskHeartbeat] requests received. The [taskStartToCloseTimeout] is also specified in [RegisterActivityType].\n    \n       This operation is only useful for long-lived activities to report liveliness of the task and to determine if a cancellation is being attempted.\n       \n          If the [cancelRequested] flag returns [true], a cancellation is being attempted. If the worker can cancel the activity, it should respond with [RespondActivityTaskCanceled]. Otherwise, it should ignore the cancellation request.\n          \n             {b Access Control} \n            \n             You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n             \n              {ul\n                    {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                        \n                         }\n                    {-  Use an [Action] element to allow or deny permission to call this action.\n                        \n                         }\n                    {-  You cannot use an IAM policy to constrain this action's parameters.\n                        \n                         }\n                    }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RegisterActivityType :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_activity_type_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeAlreadyExistsFault of type_already_exists_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Registers a new {i activity type} along with its configuration settings in the specified domain.\n\n  A [TypeAlreadyExists] fault is returned if the type already exists in the domain. You cannot change any configuration settings of the type after its registration, and it must be registered as a new version.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [defaultTaskList.name]: String constraint. The key is [swf:defaultTaskList.name].\n                           \n                            }\n                       {-   [name]: String constraint. The key is [swf:name].\n                           \n                            }\n                       {-   [version]: String constraint. The key is [swf:version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RegisterDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_domain_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DomainAlreadyExistsFault of domain_already_exists_fault 
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TooManyTagsFault of too_many_tags_fault ]) result
end[@@ocaml.doc
     "Registers a new domain.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  You cannot use an IAM policy to control domain access for this action. The name of the domain being registered is available as the resource of this action.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RegisterWorkflowType :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_workflow_type_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeAlreadyExistsFault of type_already_exists_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Registers a new {i workflow type} and its configuration settings in the specified domain.\n\n The retention period for the workflow history is set by the [RegisterDomain] action.\n \n   If the type already exists, then a [TypeAlreadyExists] fault is returned. You cannot change the configuration settings of a workflow type once it is registered and it must be registered as a new version.\n   \n      {b Access Control} \n     \n      You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n      \n       {ul\n             {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                 \n                  }\n             {-  Use an [Action] element to allow or deny permission to call this action.\n                 \n                  }\n             {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                 \n                  {ul\n                        {-   [defaultTaskList.name]: String constraint. The key is [swf:defaultTaskList.name].\n                            \n                             }\n                        {-   [name]: String constraint. The key is [swf:name].\n                            \n                             }\n                        {-   [version]: String constraint. The key is [swf:version].\n                            \n                             }\n                        \n              }\n               }\n             }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RequestCancelWorkflowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      request_cancel_workflow_execution_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Records a [WorkflowExecutionCancelRequested] event in the currently running workflow execution identified by the given domain, workflowId, and runId. This logically requests the cancellation of the workflow execution as a whole. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n\n  If the runId isn't specified, the [WorkflowExecutionCancelRequested] event is recorded in the history of the current open workflow execution with the specified workflowId in the domain.\n  \n     Because this action allows the workflow to properly clean up and gracefully close, it should be used instead of [TerminateWorkflowExecution] when possible.\n     \n        {b Access Control} \n       \n        You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n        \n         {ul\n               {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                   \n                    }\n               {-  Use an [Action] element to allow or deny permission to call this action.\n                   \n                    }\n               {-  You cannot use an IAM policy to constrain this action's parameters.\n                   \n                    }\n               }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RespondActivityTaskCanceled :
sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_canceled_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by workers to tell the service that the [ActivityTask] identified by the [taskToken] was successfully canceled. Additional [details] can be provided using the [details] argument.\n\n These [details] (if provided) appear in the [ActivityTaskCanceled] event added to the workflow history.\n \n   Only use this operation if the [canceled] flag of a [RecordActivityTaskHeartbeat] request returns [true] and if the activity can be safely undone or abandoned.\n   \n     A task is considered open from the time that it is scheduled until it is closed. Therefore a task is reported as open while a worker is processing it. A task is closed after it has been specified in a call to [RespondActivityTaskCompleted], RespondActivityTaskCanceled, [RespondActivityTaskFailed], or the task has {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types}timed out}.\n     \n       {b Access Control} \n      \n       You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n       \n        {ul\n              {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                  \n                   }\n              {-  Use an [Action] element to allow or deny permission to call this action.\n                  \n                   }\n              {-  You cannot use an IAM policy to constrain this action's parameters.\n                  \n                   }\n              }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RespondActivityTaskCompleted :
sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_completed_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by workers to tell the service that the [ActivityTask] identified by the [taskToken] completed successfully with a [result] (if provided). The [result] appears in the [ActivityTaskCompleted] event in the workflow history.\n\n  If the requested task doesn't complete successfully, use [RespondActivityTaskFailed] instead. If the worker finds that the task is canceled through the [canceled] flag returned by [RecordActivityTaskHeartbeat], it should cancel the task, clean up and then call [RespondActivityTaskCanceled].\n  \n    A task is considered open from the time that it is scheduled until it is closed. Therefore a task is reported as open while a worker is processing it. A task is closed after it has been specified in a call to RespondActivityTaskCompleted, [RespondActivityTaskCanceled], [RespondActivityTaskFailed], or the task has {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types}timed out}.\n    \n      {b Access Control} \n     \n      You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n      \n       {ul\n             {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                 \n                  }\n             {-  Use an [Action] element to allow or deny permission to call this action.\n                 \n                  }\n             {-  You cannot use an IAM policy to constrain this action's parameters.\n                 \n                  }\n             }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RespondActivityTaskFailed :
sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_failed_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by workers to tell the service that the [ActivityTask] identified by the [taskToken] has failed with [reason] (if specified). The [reason] and [details] appear in the [ActivityTaskFailed] event added to the workflow history.\n\n A task is considered open from the time that it is scheduled until it is closed. Therefore a task is reported as open while a worker is processing it. A task is closed after it has been specified in a call to [RespondActivityTaskCompleted], [RespondActivityTaskCanceled], RespondActivityTaskFailed, or the task has {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types}timed out}.\n \n   {b Access Control} \n  \n   You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n   \n    {ul\n          {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n              \n               }\n          {-  Use an [Action] element to allow or deny permission to call this action.\n              \n               }\n          {-  You cannot use an IAM policy to constrain this action's parameters.\n              \n               }\n          }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RespondDecisionTaskCompleted :
sig
  val request :
    Smaws_Lib.Context.t ->
      respond_decision_task_completed_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by deciders to tell the service that the [DecisionTask] identified by the [taskToken] has successfully completed. The [decisions] argument specifies the list of decisions made while processing the task.\n\n A [DecisionTaskCompleted] event is added to the workflow history. The [executionContext] specified is attached to the event in the workflow execution history.\n \n   {b Access Control} \n  \n   If an IAM policy grants permission to use [RespondDecisionTaskCompleted], it can express permissions for the list of decisions in the [decisions] parameter. Each of the decisions has one or more parameters, much like a regular API call. To allow for policies to be as readable as possible, you can express permissions on decisions as if they were actual API calls, including applying conditions to some parameters. For more information, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module SignalWorkflowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      signal_workflow_execution_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Records a [WorkflowExecutionSignaled] event in the workflow execution history and creates a decision task for the workflow execution identified by the given domain, workflowId and runId. The event is recorded with the specified user defined signalName and input (if provided).\n\n  If a runId isn't specified, then the [WorkflowExecutionSignaled] event is recorded in the history of the current open workflow with the matching workflowId in the domain.\n  \n     If the specified workflow execution isn't open, this method fails with [UnknownResource].\n     \n        {b Access Control} \n       \n        You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n        \n         {ul\n               {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                   \n                    }\n               {-  Use an [Action] element to allow or deny permission to call this action.\n                   \n                    }\n               {-  You cannot use an IAM policy to constrain this action's parameters.\n                   \n                    }\n               }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module StartWorkflowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_workflow_execution_input ->
        (run,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DefaultUndefinedFault of default_undefined_fault 
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeDeprecatedFault of type_deprecated_fault 
          | `UnknownResourceFault of unknown_resource_fault 
          | `WorkflowExecutionAlreadyStartedFault of
              workflow_execution_already_started_fault ])
          result
end[@@ocaml.doc
     "Starts an execution of the workflow type in the specified domain using the provided [workflowId] and input data.\n\n This action returns the newly started workflow execution.\n \n   {b Access Control} \n  \n   You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n   \n    {ul\n          {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n              \n               }\n          {-  Use an [Action] element to allow or deny permission to call this action.\n              \n               }\n          {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n              \n               {ul\n                     {-   [tagList.member.0]: The key is [swf:tagList.member.0].\n                         \n                          }\n                     {-   [tagList.member.1]: The key is [swf:tagList.member.1].\n                         \n                          }\n                     {-   [tagList.member.2]: The key is [swf:tagList.member.2].\n                         \n                          }\n                     {-   [tagList.member.3]: The key is [swf:tagList.member.3].\n                         \n                          }\n                     {-   [tagList.member.4]: The key is [swf:tagList.member.4].\n                         \n                          }\n                     {-   [taskList]: String constraint. The key is [swf:taskList.name].\n                         \n                          }\n                     {-   [workflowType.name]: String constraint. The key is [swf:workflowType.name].\n                         \n                          }\n                     {-   [workflowType.version]: String constraint. The key is [swf:workflowType.version].\n                         \n                          }\n                     \n           }\n            }\n          }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TooManyTagsFault of too_many_tags_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Add a tag to a Amazon SWF domain.\n\n  Amazon SWF supports a maximum of 50 tags per resource.\n  \n   "]
module TerminateWorkflowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      terminate_workflow_execution_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Records a [WorkflowExecutionTerminated] event and forces closure of the workflow execution identified by the given domain, runId, and workflowId. The child policy, registered with the workflow type or specified when starting this execution, is applied to any open child workflow executions of this workflow execution.\n\n  If the identified workflow execution was in progress, it is terminated immediately.\n  \n     If a runId isn't specified, then the [WorkflowExecutionTerminated] event is recorded in the history of the current open workflow with the matching workflowId in the domain.\n     \n        You should consider using [RequestCancelWorkflowExecution] action instead because it allows the workflow to gracefully close while [TerminateWorkflowExecution] doesn't.\n        \n           {b Access Control} \n          \n           You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n           \n            {ul\n                  {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                      \n                       }\n                  {-  Use an [Action] element to allow or deny permission to call this action.\n                      \n                       }\n                  {-  You cannot use an IAM policy to constrain this action's parameters.\n                      \n                       }\n                  }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module UndeprecateActivityType :
sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_activity_type_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeAlreadyExistsFault of type_already_exists_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Undeprecates a previously deprecated {i activity type}. After an activity type has been undeprecated, you can create new tasks of that activity type.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [activityType.name]: String constraint. The key is [swf:activityType.name].\n                           \n                            }\n                       {-   [activityType.version]: String constraint. The key is [swf:activityType.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module UndeprecateDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_domain_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DomainAlreadyExistsFault of domain_already_exists_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Undeprecates a previously deprecated domain. After a domain has been undeprecated it can be used to create new workflow executions or register new types.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  You cannot use an IAM policy to constrain this action's parameters.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module UndeprecateWorkflowType :
sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_workflow_type_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeAlreadyExistsFault of type_already_exists_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Undeprecates a previously deprecated {i workflow type}. After a workflow type has been undeprecated, you can create new executions of that type. \n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [workflowType.name]: String constraint. The key is [swf:workflowType.name].\n                           \n                            }\n                       {-   [workflowType.version]: String constraint. The key is [swf:workflowType.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc "Remove a tag from a Amazon SWF domain.\n"]