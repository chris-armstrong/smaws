(** 
    SWF client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(** 
    Represents a workflow type.
     *)
type workflow_type = {
  version: string;
  (** 
    The version of the workflow type.
    
     The combination of workflow type name and version must be unique with in a domain.
     
      *)

  name: string;
  (** 
    The name of the workflow type.
    
     The combination of workflow type name and version must be unique with in a domain.
     
      *)

}

type registration_status = | DEPRECATED
  | REGISTERED

(** 
    Contains information about a workflow type.
     *)
type workflow_type_info = {
  deprecation_date: float option;
  (** 
    If the type is in deprecated state, then it is set to the date when the type was deprecated.
     *)

  creation_date: float;
  (** 
    The date when this type was registered.
     *)

  description: string option;
  (** 
    The description of the type registered through [RegisterWorkflowType].
     *)

  status: registration_status;
  (** 
    The current status of the workflow type.
     *)

  workflow_type: workflow_type;
  (** 
    The workflow type this information is about.
     *)

}

(** 
    Contains a paginated list of information structures about workflow types.
     *)
type workflow_type_infos = {
  next_page_token: string option;
  (** 
    If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      *)

  type_infos: workflow_type_info list;
  (** 
    The list of workflow type information.
     *)

}

(** 
    Used to filter workflow execution query results by type. Each parameter, if specified, defines a rule that must be satisfied by each returned result.
     *)
type workflow_type_filter = {
  version: string option;
  (** 
    Version of the workflow type.
     *)

  name: string;
  (** 
    Name of the workflow type.
     *)

}

(** 
    Represents a task list.
     *)
type task_list = {
  name: string;
  (** 
    The name of the task list.
     *)

}

type child_policy = | ABANDON
  | REQUEST_CANCEL
  | TERMINATE

(** 
    The configuration settings of a workflow type.
     *)
type workflow_type_configuration = {
  default_lambda_role: string option;
  (** 
    The default IAM role attached to this workflow type.
    
     Executions of this workflow type need IAM roles to invoke Lambda functions. If you don't specify an IAM role when starting this workflow type, the default Lambda role is attached to the execution. For more information, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html}https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html} in the {i Amazon SWF Developer Guide}.
     
      *)

  default_child_policy: child_policy option;
  (** 
    The default policy to use for the child workflow executions when a workflow execution of this type is terminated, by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       *)

  default_task_priority: string option;
  (** 
    The default task priority, specified when registering the workflow type, for all decision tasks of this workflow type. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] decision.
    
     Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
     
      For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.
       *)

  default_task_list: task_list option;
  (** 
    The default task list, specified when registering the workflow type, for decisions tasks scheduled for workflow executions of this type. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].
     *)

  default_execution_start_to_close_timeout: string option;
  (** 
    The default maximum duration, specified when registering the workflow type, for executions of this workflow type. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  default_task_start_to_close_timeout: string option;
  (** 
    The default maximum duration, specified when registering the workflow type, that a decision task for executions of this workflow type might take before returning completion or failure. If the task doesn'tdo close in the specified time then the task is automatically timed out and rescheduled. If the decider eventually reports a completion or failure, it is ignored. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

}

(** 
    Contains details about a workflow type.
     *)
type workflow_type_detail = {
  configuration: workflow_type_configuration;
  (** 
    Configuration settings of the workflow type registered through [RegisterWorkflowType]
     *)

  type_info: workflow_type_info;
  (** 
    General information about the workflow type.
    
     The status of the workflow type (returned in the WorkflowTypeInfo structure) can be one of the following.
     
      {ul
           {- [REGISTERED] – The type is registered and available. Workers supporting this type should be running.
              
              }
            {- [DEPRECATED] – The type was deprecated using [DeprecateWorkflowType], but is still in use. You should keep workers supporting this type running. You cannot create new workflow executions of this type.
               
               }
           
      }
       *)

}

type workflow_execution_timeout_type = | START_TO_CLOSE

(** 
    Provides the details of the [WorkflowExecutionTimedOut] event.
     *)
type workflow_execution_timed_out_event_attributes = {
  child_policy: child_policy;
  (** 
    The policy used for the child workflow executions of this workflow execution.
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       *)

  timeout_type: workflow_execution_timeout_type;
  (** 
    The type of timeout that caused this event.
     *)

}

type workflow_execution_terminated_cause = | OPERATOR_INITIATED
  | EVENT_LIMIT_EXCEEDED
  | CHILD_POLICY_APPLIED

(** 
    Provides the details of the [WorkflowExecutionTerminated] event.
     *)
type workflow_execution_terminated_event_attributes = {
  cause: workflow_execution_terminated_cause option;
  (** 
    If set, indicates that the workflow execution was automatically terminated, and specifies the cause. This happens if the parent workflow execution times out or is terminated and the child policy is set to terminate child executions.
     *)

  child_policy: child_policy;
  (** 
    The policy used for the child workflow executions of this workflow execution.
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       *)

  details: string option;
  (** 
    The details provided for the termination.
     *)

  reason: string option;
  (** 
    The reason provided for the termination.
     *)

}

(** 
    Represents a workflow execution.
     *)
type workflow_execution = {
  run_id: string;
  (** 
    A system-generated unique identifier for the workflow execution.
     *)

  workflow_id: string;
  (** 
    The user defined identifier associated with the workflow execution.
     *)

}

(** 
    Provides details of [WorkflowExecutionStarted] event.
     *)
type workflow_execution_started_event_attributes = {
  lambda_role: string option;
  (** 
    The IAM role attached to the workflow execution.
     *)

  parent_initiated_event_id: int option;
  (** 
    The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this workflow execution. The source event with this ID can be found in the history of the source workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  parent_workflow_execution: workflow_execution option;
  (** 
    The source workflow execution that started this workflow execution. The member isn't set if the workflow execution was not started by a workflow.
     *)

  continued_execution_run_id: string option;
  (** 
    If this workflow execution was started due to a [ContinueAsNewWorkflowExecution] decision, then it contains the [runId] of the previous workflow execution that was closed and continued as this execution.
     *)

  tag_list: string list option;
  (** 
    The list of tags associated with this workflow execution. An execution can have up to 5 tags.
     *)

  workflow_type: workflow_type;
  (** 
    The workflow type of this execution.
     *)

  task_priority: string option;
  (** 
    The priority of the decision tasks in the workflow execution.
     *)

  task_list: task_list;
  (** 
    The name of the task list for scheduling the decision tasks for this workflow execution.
     *)

  child_policy: child_policy;
  (** 
    The policy to use for the child workflow executions if this workflow execution is terminated, by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout.
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       *)

  task_start_to_close_timeout: string option;
  (** 
    The maximum duration of decision tasks for this workflow type.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  execution_start_to_close_timeout: string option;
  (** 
    The maximum duration for this workflow execution.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  input: string option;
  (** 
    The input provided to the workflow execution.
     *)

}

(** 
    Provides the details of the [WorkflowExecutionSignaled] event.
     *)
type workflow_execution_signaled_event_attributes = {
  external_initiated_event_id: int option;
  (** 
    The ID of the [SignalExternalWorkflowExecutionInitiated] event corresponding to the [SignalExternalWorkflow] decision to signal this workflow execution.The source event with this ID can be found in the history of the source workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event. This field is set only if the signal was initiated by another workflow execution.
     *)

  external_workflow_execution: workflow_execution option;
  (** 
    The workflow execution that sent the signal. This is set only of the signal was sent by another workflow execution.
     *)

  input: string option;
  (** 
    The inputs provided with the signal. The decider can use the signal name and inputs to determine how to process the signal.
     *)

  signal_name: string;
  (** 
    The name of the signal received. The decider can use the signal name and inputs to determine how to the process the signal.
     *)

}

(** 
    Contains the counts of open tasks, child workflow executions and timers for a workflow execution.
     *)
type workflow_execution_open_counts = {
  open_lambda_functions: int option;
  (** 
    The count of Lambda tasks whose status is [OPEN].
     *)

  open_child_workflow_executions: int;
  (** 
    The count of child workflow executions whose status is [OPEN].
     *)

  open_timers: int;
  (** 
    The count of timers started by this workflow execution that have not fired yet.
     *)

  open_decision_tasks: int;
  (** 
    The count of decision tasks whose status is OPEN. A workflow execution can have at most one open decision task.
     *)

  open_activity_tasks: int;
  (** 
    The count of activity tasks whose status is [OPEN].
     *)

}

type execution_status = | CLOSED
  | OPEN

type close_status = | TIMED_OUT
  | CONTINUED_AS_NEW
  | TERMINATED
  | CANCELED
  | FAILED
  | COMPLETED

(** 
    Contains information about a workflow execution.
     *)
type workflow_execution_info = {
  cancel_requested: bool option;
  (** 
    Set to true if a cancellation is requested for this workflow execution.
     *)

  tag_list: string list option;
  (** 
    The list of tags associated with the workflow execution. Tags can be used to identify and list workflow executions of interest through the visibility APIs. A workflow execution can have a maximum of 5 tags.
     *)

  parent: workflow_execution option;
  (** 
    If this workflow execution is a child of another execution then contains the workflow execution that started this execution.
     *)

  close_status: close_status option;
  (** 
    If the execution status is closed then this specifies how the execution was closed:
    
     {ul
          {- [COMPLETED] – the execution was successfully completed.
             
             }
           {- [CANCELED] – the execution was canceled.Cancellation allows the implementation to gracefully clean up before the execution is closed.
              
              }
           {- [TERMINATED] – the execution was force terminated.
              
              }
           {- [FAILED] – the execution failed to complete.
              
              }
           {- [TIMED_OUT] – the execution did not complete in the alloted time and was automatically timed out.
              
              }
           {- [CONTINUED_AS_NEW] – the execution is logically continued. This means the current execution was completed and a new execution was started to carry on the workflow.
              
              }
          
      }
       *)

  execution_status: execution_status;
  (** 
    The current status of the execution.
     *)

  close_timestamp: float option;
  (** 
    The time when the workflow execution was closed. Set only if the execution status is CLOSED.
     *)

  start_timestamp: float;
  (** 
    The time when the execution was started.
     *)

  workflow_type: workflow_type;
  (** 
    The type of the workflow execution.
     *)

  execution: workflow_execution;
  (** 
    The workflow execution this information is about.
     *)

}

(** 
    Contains a paginated list of information about workflow executions.
     *)
type workflow_execution_infos = {
  next_page_token: string option;
  (** 
    If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      *)

  execution_infos: workflow_execution_info list;
  (** 
    The list of workflow information structures.
     *)

}

(** 
    Used to filter the workflow executions in visibility APIs by their [workflowId].
     *)
type workflow_execution_filter = {
  workflow_id: string;
  (** 
    The workflowId to pass of match the criteria of this filter.
     *)

}

(** 
    Provides the details of the [WorkflowExecutionFailed] event.
     *)
type workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [FailWorkflowExecution] decision to fail this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  details: string option;
  (** 
    The details of the failure.
     *)

  reason: string option;
  (** 
    The descriptive reason provided for the failure.
     *)

}

(** 
    The configuration settings for a workflow execution including timeout values, tasklist etc. These configuration settings are determined from the defaults specified when registering the workflow type and those specified when starting the workflow execution.
     *)
type workflow_execution_configuration = {
  lambda_role: string option;
  (** 
    The IAM role attached to the child workflow execution.
     *)

  child_policy: child_policy;
  (** 
    The policy to use for the child workflow executions if this workflow execution is terminated, by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout.
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       *)

  task_priority: string option;
  (** 
    The priority assigned to decision tasks for this workflow execution. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
    
     For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.
      *)

  task_list: task_list;
  (** 
    The task list used for the decision tasks generated for this workflow execution.
     *)

  execution_start_to_close_timeout: string;
  (** 
    The total duration for this workflow execution.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  task_start_to_close_timeout: string;
  (** 
    The maximum duration allowed for decision tasks for this workflow execution.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

}

(** 
    Contains details about a workflow execution.
     *)
type workflow_execution_detail = {
  latest_execution_context: string option;
  (** 
    The latest executionContext provided by the decider for this workflow execution. A decider can provide an executionContext (a free-form string) when closing a decision task using [RespondDecisionTaskCompleted].
     *)

  latest_activity_task_timestamp: float option;
  (** 
    The time when the last activity task was scheduled for this workflow execution. You can use this information to determine if the workflow has not made progress for an unusually long period of time and might require a corrective action.
     *)

  open_counts: workflow_execution_open_counts;
  (** 
    The number of tasks for this workflow execution. This includes open and closed tasks of all types.
     *)

  execution_configuration: workflow_execution_configuration;
  (** 
    The configuration settings for this workflow execution including timeout values, tasklist etc.
     *)

  execution_info: workflow_execution_info;
  (** 
    Information about the workflow execution.
     *)

}

(** 
    Contains the count of workflow executions returned from [CountOpenWorkflowExecutions] or [CountClosedWorkflowExecutions]
     *)
type workflow_execution_count = {
  truncated: bool option;
  (** 
    If set to true, indicates that the actual count was more than the maximum supported by this API and the count returned is the truncated value.
     *)

  count: int;
  (** 
    The number of workflow executions.
     *)

}

(** 
    Provides the details of the [WorkflowExecutionContinuedAsNew] event.
     *)
type workflow_execution_continued_as_new_event_attributes = {
  lambda_role: string option;
  (** 
    The IAM role to attach to the new (continued) workflow execution.
     *)

  workflow_type: workflow_type;
  (** 
    The workflow type of this execution.
     *)

  tag_list: string list option;
  (** 
    The list of tags associated with the new workflow execution.
     *)

  child_policy: child_policy;
  (** 
    The policy to use for the child workflow executions of the new execution if it is terminated by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout.
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       *)

  task_start_to_close_timeout: string option;
  (** 
    The maximum duration of decision tasks for the new workflow execution.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  task_priority: string option;
  (** 
    The priority of the task to use for the decisions of the new (continued) workflow execution.
     *)

  task_list: task_list;
  (** 
    The task list to use for the decisions of the new (continued) workflow execution.
     *)

  execution_start_to_close_timeout: string option;
  (** 
    The total duration allowed for the new workflow execution.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  new_execution_run_id: string;
  (** 
    The [runId] of the new workflow execution.
     *)

  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [ContinueAsNewWorkflowExecution] decision that started this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  input: string option;
  (** 
    The input provided to the new workflow execution.
     *)

}

(** 
    Provides the details of the [WorkflowExecutionCompleted] event.
     *)
type workflow_execution_completed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CompleteWorkflowExecution] decision to complete this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  result: string option;
  (** 
    The result produced by the workflow execution upon successful completion.
     *)

}

(** 
    Provides the details of the [WorkflowExecutionCanceled] event.
     *)
type workflow_execution_canceled_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CancelWorkflowExecution] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  details: string option;
  (** 
    The details of the cancellation.
     *)

}

type workflow_execution_cancel_requested_cause = | CHILD_POLICY_APPLIED

(** 
    Provides the details of the [WorkflowExecutionCancelRequested] event.
     *)
type workflow_execution_cancel_requested_event_attributes = {
  cause: workflow_execution_cancel_requested_cause option;
  (** 
    If set, indicates that the request to cancel the workflow execution was automatically generated, and specifies the cause. This happens if the parent workflow execution times out or is terminated, and the child policy is set to cancel child executions.
     *)

  external_initiated_event_id: int option;
  (** 
    The ID of the [RequestCancelExternalWorkflowExecutionInitiated] event corresponding to the [RequestCancelExternalWorkflowExecution] decision to cancel this workflow execution.The source event with this ID can be found in the history of the source workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  external_workflow_execution: workflow_execution option;
  (** 
    The external workflow execution for which the cancellation was requested.
     *)

}

(** 
    Returned by [StartWorkflowExecution] when an open execution with the same workflowId is already running in the specified domain.
     *)
type workflow_execution_already_started_fault = {
  message: string option;
  (** 
    A description that may help with diagnosing the cause of the fault.
     *)

}

type untag_resource_input = {
  tag_keys: string list;
  (** 
    The list of tags to remove from the Amazon SWF domain.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) for the Amazon SWF domain.
     *)

}

(** 
    Returned when the named resource cannot be found with in the scope of this operation (region or domain). This could happen if the named resource was never created or is no longer available for this operation.
     *)
type unknown_resource_fault = {
  message: string option;
  (** 
    A description that may help with diagnosing the cause of the fault.
     *)

}

(** 
    Returned when the caller doesn't have sufficient permissions to invoke the action.
     *)
type operation_not_permitted_fault = {
  message: string option;
  (** 
    A description that may help with diagnosing the cause of the fault.
     *)

}

(** 
    Returned by any operation if a system imposed limitation has been reached. To address this fault you should either clean up unused resources or increase the limit by contacting AWS.
     *)
type limit_exceeded_fault = {
  message: string option;
  (** 
    A description that may help with diagnosing the cause of the fault.
     *)

}

type undeprecate_workflow_type_input = {
  workflow_type: workflow_type;
  (** 
    The name of the domain of the deprecated workflow type.
     *)

  domain: string;
  (** 
    The name of the domain of the deprecated workflow type.
     *)

}

(** 
    Returned if the type already exists in the specified domain. You may get this fault if you are registering a type that is either already registered or deprecated, or if you undeprecate a type that is currently registered.
     *)
type type_already_exists_fault = {
  message: string option;
  (** 
    A description that may help with diagnosing the cause of the fault.
     *)

}

type undeprecate_domain_input = {
  name: string;
  (** 
    The name of the domain of the deprecated workflow type.
     *)

}

(** 
    Returned if the domain already exists. You may get this fault if you are registering a domain that is either already registered or deprecated, or if you undeprecate a domain that is currently registered.
     *)
type domain_already_exists_fault = {
  message: string option;
  (** 
    A description that may help with diagnosing the cause of the fault.
     *)

}

(** 
    Represents an activity type.
     *)
type activity_type = {
  version: string;
  (** 
    The version of this activity.
    
     The combination of activity type name and version must be unique with in a domain.
     
      *)

  name: string;
  (** 
    The name of this activity.
    
     The combination of activity type name and version must be unique within a domain.
     
      *)

}

type undeprecate_activity_type_input = {
  activity_type: activity_type;
  (** 
    The activity type to undeprecate.
     *)

  domain: string;
  (** 
    The name of the domain of the deprecated activity type.
     *)

}

(** 
    Returned when the resource type has not been deprecated.
     *)
type type_not_deprecated_fault = {
  message: string option;
  
}

(** 
    Returned when the specified activity or workflow type was already deprecated.
     *)
type type_deprecated_fault = {
  message: string option;
  (** 
    A description that may help with diagnosing the cause of the fault.
     *)

}

(** 
    You've exceeded the number of tags allowed for a domain.
     *)
type too_many_tags_fault = {
  message: string option;
  
}

(** 
    Provides the details of the [TimerStarted] event.
     *)
type timer_started_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [StartTimer] decision for this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  start_to_fire_timeout: string;
  (** 
    The duration of time after which the timer fires.
    
     The duration is specified in seconds, an integer greater than or equal to [0].
      *)

  control: string option;
  (** 
    Data attached to the event that can be used by the decider in subsequent workflow tasks.
     *)

  timer_id: string;
  (** 
    The unique ID of the timer that was started.
     *)

}

(** 
    Provides the details of the [TimerFired] event.
     *)
type timer_fired_event_attributes = {
  started_event_id: int;
  (** 
    The ID of the [TimerStarted] event that was recorded when this timer was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  timer_id: string;
  (** 
    The unique ID of the timer that fired.
     *)

}

(** 
    Provides the details of the [TimerCanceled] event.
     *)
type timer_canceled_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CancelTimer] decision to cancel this timer. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  started_event_id: int;
  (** 
    The ID of the [TimerStarted] event that was recorded when this timer was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  timer_id: string;
  (** 
    The unique ID of the timer that was canceled.
     *)

}

type terminate_workflow_execution_input = {
  child_policy: child_policy option;
  (** 
    If set, specifies the policy to use for the child workflow executions of the workflow execution being terminated. This policy overrides the child policy specified for the workflow execution at registration time or when starting the execution.
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       A child policy for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default child policy was specified at registration time then a fault is returned.
       
        *)

  details: string option;
  (** 
    Details for terminating the workflow execution.
     *)

  reason: string option;
  (** 
    A descriptive reason for terminating the workflow execution.
     *)

  run_id: string option;
  (** 
    The runId of the workflow execution to terminate.
     *)

  workflow_id: string;
  (** 
    The workflowId of the workflow execution to terminate.
     *)

  domain: string;
  (** 
    The domain of the workflow execution to terminate.
     *)

}

(** 
    Tags are key-value pairs that can be associated with Amazon SWF state machines and activities.
    
     Tags may only contain unicode letters, digits, whitespace, or these symbols: [_ . : / = + - @].
      *)
type resource_tag = {
  value: string option;
  (** 
    The value of a tag.
     *)

  key: string;
  (** 
    The key of a tag.
     *)

}

type tag_resource_input = {
  tags: resource_tag list;
  (** 
    The list of tags to add to a domain.
    
     Tags may only contain unicode letters, digits, whitespace, or these symbols: [_ . : / = + - @].
      *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) for the Amazon SWF domain.
     *)

}

(** 
    Used to filter the workflow executions in visibility APIs based on a tag.
     *)
type tag_filter = {
  tag: string;
  (** 
    Specifies the tag that must be associated with the execution for it to meet the filter criteria.
    
     Tags may only contain unicode letters, digits, whitespace, or these symbols: [_ . : / = + - @].
      *)

}

type start_workflow_execution_input = {
  lambda_role: string option;
  (** 
    The IAM role to attach to this workflow execution.
    
     Executions of this workflow type need IAM roles to invoke Lambda functions. If you don't attach an IAM role, any attempt to schedule a Lambda task fails. This results in a [ScheduleLambdaFunctionFailed] history event. For more information, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html}https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html} in the {i Amazon SWF Developer Guide}.
     
      *)

  child_policy: child_policy option;
  (** 
    If set, specifies the policy to use for the child workflow executions of this workflow execution if it is terminated, by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout. This policy overrides the default child policy specified when registering the workflow type using [RegisterWorkflowType].
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       A child policy for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default child policy was specified at registration time then a fault is returned.
       
        *)

  task_start_to_close_timeout: string option;
  (** 
    Specifies the maximum duration of decision tasks for this workflow execution. This parameter overrides the [defaultTaskStartToCloseTimout] specified when registering the workflow type using [RegisterWorkflowType].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
     
      A task start-to-close timeout for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default task start-to-close timeout was specified at registration time then a fault is returned.
      
       *)

  tag_list: string list option;
  (** 
    The list of tags to associate with the workflow execution. You can specify a maximum of 5 tags. You can list workflow executions with a specific tag by calling [ListOpenWorkflowExecutions] or [ListClosedWorkflowExecutions] and specifying a [TagFilter].
     *)

  execution_start_to_close_timeout: string option;
  [@ocaml.doc {| 
    The total duration for this workflow execution. This overrides the defaultExecutionStartToCloseTimeout specified when registering the workflow type.
    
     The duration is specified in seconds; an integer greater than or equal to [0]. Exceeding this limit causes the workflow execution to time out. Unlike some of the other timeout parameters in Amazon SWF, you cannot specify a value of "NONE" for this timeout; there is a one-year max limit on the time that a workflow execution can run.
     
      An execution start-to-close timeout must be specified either through this parameter or as a default when the workflow type is registered. If neither this parameter nor a default execution start-to-close timeout is specified, a fault is returned.
      
       |}]

  input: string option;
  (** 
    The input for the workflow execution. This is a free form string which should be meaningful to the workflow you are starting. This [input] is made available to the new workflow execution in the [WorkflowExecutionStarted] history event.
     *)

  task_priority: string option;
  (** 
    The task priority to use for this workflow execution. This overrides any default priority that was assigned when the workflow type was registered. If not set, then the default task priority for the workflow type is used. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
    
     For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.
      *)

  task_list: task_list option;
  (** 
    The task list to use for the decision tasks generated for this workflow execution. This overrides the [defaultTaskList] specified when registering the workflow type.
    
     A task list for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default task list was specified at registration time then a fault is returned.
     
      The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
       *)

  workflow_type: workflow_type;
  (** 
    The type of the workflow to start.
     *)

  workflow_id: string;
  (** 
    The user defined identifier associated with the workflow execution. You can use this to associate a custom identifier with the workflow execution. You may specify the same identifier if a workflow execution is logically a {i restart} of a previous execution. You cannot have two open workflow executions with the same [workflowId] at the same time within the same domain.
    
     The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
      *)

  domain: string;
  (** 
    The name of the domain in which the workflow execution is created.
    
     The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
      *)

}

(** 
    The [StartWorkflowExecution] API action was called without the required parameters set.
    
     Some workflow execution parameters, such as the decision [taskList], must be set to start the execution. However, these parameters might have been set as defaults when the workflow type was registered. In this case, you can omit these parameters from the [StartWorkflowExecution] call and Amazon SWF uses the values defined in the workflow type.
     
      If these parameters aren't set and no default parameters were defined in the workflow type, this error is displayed.
      
       *)
type default_undefined_fault = {
  message: string option;
  
}

(** 
    Specifies the [runId] of a workflow execution.
     *)
type run = {
  run_id: string option;
  (** 
    The [runId] of a workflow execution. This ID is generated by the service and can be used to uniquely identify the workflow execution within a domain.
     *)

}

type start_timer_failed_cause = | OPERATION_NOT_PERMITTED
  | TIMER_CREATION_RATE_EXCEEDED
  | OPEN_TIMERS_LIMIT_EXCEEDED
  | TIMER_ID_ALREADY_IN_USE

(** 
    Provides the details of the [StartTimerFailed] event.
     *)
type start_timer_failed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [StartTimer] decision for this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  cause: start_timer_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

  timer_id: string;
  (** 
    The timerId provided in the [StartTimer] decision that failed.
     *)

}

(** 
    Provides the details of the [StartTimer] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)
type start_timer_decision_attributes = {
  start_to_fire_timeout: string;
  (** 
    The duration to wait before firing the timer.
    
     The duration is specified in seconds, an integer greater than or equal to [0].
      *)

  control: string option;
  (** 
    The data attached to the event that can be used by the decider in subsequent workflow tasks.
     *)

  timer_id: string;
  (** 
    The unique ID of the timer.
    
     The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
      *)

}

type start_lambda_function_failed_cause = | ASSUME_ROLE_FAILED

(** 
    Provides the details of the [StartLambdaFunctionFailed] event. It isn't set for other event types.
     *)
type start_lambda_function_failed_event_attributes = {
  message: string option;
  (** 
    A description that can help diagnose the cause of the fault.
     *)

  cause: start_lambda_function_failed_cause option;
  (** 
    The cause of the failure. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because the IAM role attached to the execution lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html}Lambda Tasks} in the {i Amazon SWF Developer Guide}.
     
      *)

  scheduled_event_id: int option;
  (** 
    The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
     *)

}

(** 
    Provides the details of the [StartChildWorkflowExecutionInitiated] event.
     *)
type start_child_workflow_execution_initiated_event_attributes = {
  lambda_role: string option;
  (** 
    The IAM role to attach to the child workflow execution.
     *)

  tag_list: string list option;
  (** 
    The list of tags to associated with the child workflow execution.
     *)

  task_start_to_close_timeout: string option;
  (** 
    The maximum duration allowed for the decision tasks for this workflow execution.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  child_policy: child_policy;
  (** 
    The policy to use for the child workflow executions if this execution gets terminated by explicitly calling the [TerminateWorkflowExecution] action or due to an expired timeout.
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       *)

  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [StartChildWorkflowExecution] [Decision] to request this child workflow execution. This information can be useful for diagnosing problems by tracing back the cause of events.
     *)

  task_priority: string option;
  (** 
    The priority assigned for the decision tasks for this workflow execution. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
    
     For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.
      *)

  task_list: task_list;
  (** 
    The name of the task list used for the decision tasks of the child workflow execution.
     *)

  execution_start_to_close_timeout: string option;
  (** 
    The maximum duration for the child workflow execution. If the workflow execution isn't closed within this duration, it is timed out and force-terminated.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  input: string option;
  (** 
    The inputs provided to the child workflow execution.
     *)

  control: string option;
  (** 
    Data attached to the event that can be used by the decider in subsequent decision tasks. This data isn't sent to the activity.
     *)

  workflow_type: workflow_type;
  (** 
    The type of the child workflow execution.
     *)

  workflow_id: string;
  (** 
    The [workflowId] of the child workflow execution.
     *)

}

type start_child_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | DEFAULT_CHILD_POLICY_UNDEFINED
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED
  | DEFAULT_TASK_LIST_UNDEFINED
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED
  | WORKFLOW_ALREADY_RUNNING
  | CHILD_CREATION_RATE_EXCEEDED
  | OPEN_WORKFLOWS_LIMIT_EXCEEDED
  | OPEN_CHILDREN_LIMIT_EXCEEDED
  | WORKFLOW_TYPE_DEPRECATED
  | WORKFLOW_TYPE_DOES_NOT_EXIST

(** 
    Provides the details of the [StartChildWorkflowExecutionFailed] event.
     *)
type start_child_workflow_execution_failed_event_attributes = {
  control: string option;
  (** 
    The data attached to the event that the decider can use in subsequent workflow tasks. This data isn't sent to the child workflow execution.
     *)

  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [StartChildWorkflowExecution] [Decision] to request this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events.
     *)

  initiated_event_id: int;
  (** 
    When the [cause] is [WORKFLOW_ALREADY_RUNNING], [initiatedEventId] is the ID of the [StartChildWorkflowExecutionInitiated] event that corresponds to the [StartChildWorkflowExecution] [Decision] to start the workflow execution. You can use this information to diagnose problems by tracing back the chain of events leading up to this event.
    
     When the [cause] isn't [WORKFLOW_ALREADY_RUNNING], [initiatedEventId] is set to [0] because the [StartChildWorkflowExecutionInitiated] event doesn't exist.
      *)

  workflow_id: string;
  (** 
    The [workflowId] of the child workflow execution.
     *)

  cause: start_child_workflow_execution_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     When [cause] is set to [OPERATION_NOT_PERMITTED], the decision fails because it lacks sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

  workflow_type: workflow_type;
  (** 
    The workflow type provided in the [StartChildWorkflowExecution] [Decision] that failed.
     *)

}

[@@ocaml.doc {| 
    Provides the details of the [StartChildWorkflowExecution] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                
                 {ul
                      {- [tagList.member.N] – The key is "swf:tagList.N" where N is the tag number from 0 to 4, inclusive.
                         
                         }
                       {- [taskList] – String constraint. The key is [swf:taskList.name].
                          
                          }
                       {- [workflowType.name] – String constraint. The key is [swf:workflowType.name].
                          
                          }
                       {- [workflowType.version] – String constraint. The key is [swf:workflowType.version].
                          
                          }
                      
              }
              }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        |}]
type start_child_workflow_execution_decision_attributes = {
  lambda_role: string option;
  (** 
    The IAM role attached to the child workflow execution.
     *)

  tag_list: string list option;
  (** 
    The list of tags to associate with the child workflow execution. A maximum of 5 tags can be specified. You can list workflow executions with a specific tag by calling [ListOpenWorkflowExecutions] or [ListClosedWorkflowExecutions] and specifying a [TagFilter].
     *)

  child_policy: child_policy option;
  (** 
    If set, specifies the policy to use for the child workflow executions if the workflow execution being started is terminated by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout. This policy overrides the default child policy specified when registering the workflow type using [RegisterWorkflowType].
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       A child policy for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default child policy was specified at registration time then a fault is returned.
       
        *)

  task_start_to_close_timeout: string option;
  (** 
    Specifies the maximum duration of decision tasks for this workflow execution. This parameter overrides the [defaultTaskStartToCloseTimout] specified when registering the workflow type using [RegisterWorkflowType].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
     
      A task start-to-close timeout for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default task start-to-close timeout was specified at registration time then a fault is returned.
      
       *)

  task_priority: string option;
  (** 
    A task priority that, if set, specifies the priority for a decision task of this workflow execution. This overrides the defaultTaskPriority specified when registering the workflow type. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
    
     For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.
      *)

  task_list: task_list option;
  (** 
    The name of the task list to be used for decision tasks of the child workflow execution.
    
     A task list for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default task list was specified at registration time then a fault is returned.
     
      The specified string must not start or end with whitespace. It must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
       *)

  execution_start_to_close_timeout: string option;
  (** 
    The total duration for this workflow execution. This overrides the defaultExecutionStartToCloseTimeout specified when registering the workflow type.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
     
      An execution start-to-close timeout for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default execution start-to-close timeout was specified at registration time then a fault is returned.
      
       *)

  input: string option;
  (** 
    The input to be provided to the workflow execution.
     *)

  control: string option;
  (** 
    The data attached to the event that can be used by the decider in subsequent workflow tasks. This data isn't sent to the child workflow execution.
     *)

  workflow_id: string;
  (** 
    The [workflowId] of the workflow execution.
    
     The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
      *)

  workflow_type: workflow_type;
  (** 
    The type of the workflow execution to be started.
     *)

}

type signal_workflow_execution_input = {
  input: string option;
  (** 
    Data to attach to the [WorkflowExecutionSignaled] event in the target workflow execution's history.
     *)

  signal_name: string;
  (** 
    The name of the signal. This name must be meaningful to the target workflow.
     *)

  run_id: string option;
  (** 
    The runId of the workflow execution to signal.
     *)

  workflow_id: string;
  (** 
    The workflowId of the workflow execution to signal.
     *)

  domain: string;
  (** 
    The name of the domain containing the workflow execution to signal.
     *)

}

type decision_type = | ScheduleLambdaFunction
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
  | ScheduleActivityTask

(** 
    Provides the details of the [ScheduleActivityTask] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                
                 {ul
                      {- [activityType.name] – String constraint. The key is [swf:activityType.name].
                         
                         }
                       {- [activityType.version] – String constraint. The key is [swf:activityType.version].
                          
                          }
                       {- [taskList] – String constraint. The key is [swf:taskList.name].
                          
                          }
                      
              }
              }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)
type schedule_activity_task_decision_attributes = {
  heartbeat_timeout: string option;
  (** 
    If set, specifies the maximum time before which a worker processing a task of this type must report progress by calling [RecordActivityTaskHeartbeat]. If the timeout is exceeded, the activity task is automatically timed out. If the worker subsequently attempts to record a heartbeat or returns a result, it is ignored. This overrides the default heartbeat timeout specified when registering the activity type using [RegisterActivityType].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  start_to_close_timeout: string option;
  (** 
    If set, specifies the maximum duration a worker may take to process this activity task. This overrides the default start-to-close timeout specified when registering the activity type using [RegisterActivityType].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
     
      A start-to-close timeout for this activity task must be specified either as a default for the activity type or through this field. If neither this field is set nor a default start-to-close timeout was specified at registration time then a fault is returned.
      
       *)

  schedule_to_start_timeout: string option;
  (** 
    If set, specifies the maximum duration the activity task can wait to be assigned to a worker. This overrides the default schedule-to-start timeout specified when registering the activity type using [RegisterActivityType].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
     
      A schedule-to-start timeout for this activity task must be specified either as a default for the activity type or through this field. If neither this field is set nor a default schedule-to-start timeout was specified at registration time then a fault is returned.
      
       *)

  task_priority: string option;
  (** 
    If set, specifies the priority with which the activity task is to be assigned to a worker. This overrides the defaultTaskPriority specified when registering the activity type using [RegisterActivityType]. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
    
     For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.
      *)

  task_list: task_list option;
  (** 
    If set, specifies the name of the task list in which to schedule the activity task. If not specified, the [defaultTaskList] registered with the activity type is used.
    
     A task list for this activity task must be specified either as a default for the activity type or through this field. If neither this field is set nor a default task list was specified at registration time then a fault is returned.
     
      The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
       *)

  schedule_to_close_timeout: string option;
  (** 
    The maximum duration for this activity task.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
     
      A schedule-to-close timeout for this activity task must be specified either as a default for the activity type or through this field. If neither this field is set nor a default schedule-to-close timeout was specified at registration time then a fault is returned.
      
       *)

  input: string option;
  (** 
    The input provided to the activity task.
     *)

  control: string option;
  (** 
    Data attached to the event that can be used by the decider in subsequent workflow tasks. This data isn't sent to the activity.
     *)

  activity_id: string;
  (** 
    The [activityId] of the activity task.
    
     The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
      *)

  activity_type: activity_type;
  (** 
    The type of the activity task to schedule.
     *)

}

(** 
    Provides the details of the [RequestCancelActivityTask] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)
type request_cancel_activity_task_decision_attributes = {
  activity_id: string;
  (** 
    The [activityId] of the activity task to be canceled.
     *)

}

(** 
    Provides the details of the [CompleteWorkflowExecution] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)
type complete_workflow_execution_decision_attributes = {
  result: string option;
  (** 
    The result of the workflow execution. The form of the result is implementation defined.
     *)

}

(** 
    Provides the details of the [FailWorkflowExecution] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)
type fail_workflow_execution_decision_attributes = {
  details: string option;
  (** 
    Details of the failure.
     *)

  reason: string option;
  (** 
    A descriptive reason for the failure that may help in diagnostics.
     *)

}

(** 
    Provides the details of the [CancelWorkflowExecution] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)
type cancel_workflow_execution_decision_attributes = {
  details: string option;
  (** 
    Details of the cancellation.
     *)

}

(** 
    Provides the details of the [ContinueAsNewWorkflowExecution] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                
                 {ul
                      {- [tag] – A tag used to identify the workflow execution
                         
                         }
                       {- [taskList] – String constraint. The key is [swf:taskList.name].
                          
                          }
                       {- [workflowType.version] – String constraint. The key is [swf:workflowType.version].
                          
                          }
                      
              }
              }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)
type continue_as_new_workflow_execution_decision_attributes = {
  lambda_role: string option;
  (** 
    The IAM role to attach to the new (continued) execution.
     *)

  workflow_type_version: string option;
  (** 
    The version of the workflow to start.
     *)

  tag_list: string list option;
  (** 
    The list of tags to associate with the new workflow execution. A maximum of 5 tags can be specified. You can list workflow executions with a specific tag by calling [ListOpenWorkflowExecutions] or [ListClosedWorkflowExecutions] and specifying a [TagFilter].
     *)

  child_policy: child_policy option;
  (** 
    If set, specifies the policy to use for the child workflow executions of the new execution if it is terminated by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout. This policy overrides the default child policy specified when registering the workflow type using [RegisterWorkflowType].
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       A child policy for this workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default child policy was specified at registration time then a fault is returned.
       
        *)

  task_start_to_close_timeout: string option;
  (** 
    Specifies the maximum duration of decision tasks for the new workflow execution. This parameter overrides the [defaultTaskStartToCloseTimout] specified when registering the workflow type using [RegisterWorkflowType].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
     
      A task start-to-close timeout for the new workflow execution must be specified either as a default for the workflow type or through this parameter. If neither this parameter is set nor a default task start-to-close timeout was specified at registration time then a fault is returned.
      
       *)

  task_priority: string option;
  (** 
    The task priority that, if set, specifies the priority for the decision tasks for this workflow execution. This overrides the defaultTaskPriority specified when registering the workflow type. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
    
     For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.
      *)

  task_list: task_list option;
  (** 
    The task list to use for the decisions of the new (continued) workflow execution.
     *)

  execution_start_to_close_timeout: string option;
  (** 
    If set, specifies the total duration for this workflow execution. This overrides the [defaultExecutionStartToCloseTimeout] specified when registering the workflow type.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
     
      An execution start-to-close timeout for this workflow execution must be specified either as a default for the workflow type or through this field. If neither this field is set nor a default execution start-to-close timeout was specified at registration time then a fault is returned.
      
       *)

  input: string option;
  (** 
    The input provided to the new workflow execution.
     *)

}

(** 
    Provides the details of the [RecordMarker] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)
type record_marker_decision_attributes = {
  details: string option;
  (** 
    The details of the marker.
     *)

  marker_name: string;
  (** 
    The name of the marker.
     *)

}

(** 
    Provides the details of the [CancelTimer] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)
type cancel_timer_decision_attributes = {
  timer_id: string;
  (** 
    The unique ID of the timer to cancel.
     *)

}

(** 
    Provides the details of the [SignalExternalWorkflowExecution] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)
type signal_external_workflow_execution_decision_attributes = {
  control: string option;
  (** 
    The data attached to the event that can be used by the decider in subsequent decision tasks.
     *)

  input: string option;
  (** 
    The input data to be provided with the signal. The target workflow execution uses the signal name and input data to process the signal.
     *)

  signal_name: string;
  (** 
    The name of the signal.The target workflow execution uses the signal name and input to process the signal.
     *)

  run_id: string option;
  (** 
    The [runId] of the workflow execution to be signaled.
     *)

  workflow_id: string;
  (** 
    The [workflowId] of the workflow execution to be signaled.
     *)

}

(** 
    Provides the details of the [RequestCancelExternalWorkflowExecution] decision.
    
     {b Access Control}
     
      You can use IAM policies to control this decision's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)
type request_cancel_external_workflow_execution_decision_attributes = {
  control: string option;
  (** 
    The data attached to the event that can be used by the decider in subsequent workflow tasks.
     *)

  run_id: string option;
  (** 
    The [runId] of the external workflow execution to cancel.
     *)

  workflow_id: string;
  (** 
    The [workflowId] of the external workflow execution to cancel.
     *)

}

(** 
    Decision attributes specified in [scheduleLambdaFunctionDecisionAttributes] within the list of decisions [decisions] passed to [RespondDecisionTaskCompleted].
     *)
type schedule_lambda_function_decision_attributes = {
  start_to_close_timeout: string option;
  (** 
    The timeout value, in seconds, after which the Lambda function is considered to be failed once it has started. This can be any integer from 1-900 (1s-15m).
    
     If no value is supplied, then a default value of 900s is assumed.
      *)

  input: string option;
  (** 
    The optional input data to be supplied to the Lambda function.
     *)

  control: string option;
  (** 
    The data attached to the event that the decider can use in subsequent workflow tasks. This data isn't sent to the Lambda task.
     *)

  name: string;
  (** 
    The name, or ARN, of the Lambda function to schedule.
     *)

  id: string;
  (** 
    A string that identifies the Lambda function execution in the event history.
     *)

}

(** 
    Specifies a decision made by the decider. A decision can be one of these types:
    
     {ul
          {- [CancelTimer] – Cancels a previously started timer and records a [TimerCanceled] event in the history.
             
             }
           {- [CancelWorkflowExecution] – Closes the workflow execution and records a [WorkflowExecutionCanceled] event in the history.
              
              }
           {- [CompleteWorkflowExecution] – Closes the workflow execution and records a [WorkflowExecutionCompleted] event in the history .
              
              }
           {- [ContinueAsNewWorkflowExecution] – Closes the workflow execution and starts a new workflow execution of the same type using the same workflow ID and a unique run Id. A [WorkflowExecutionContinuedAsNew] event is recorded in the history.
              
              }
           {- [FailWorkflowExecution] – Closes the workflow execution and records a [WorkflowExecutionFailed] event in the history.
              
              }
           {- [RecordMarker] – Records a [MarkerRecorded] event in the history. Markers can be used for adding custom information in the history for instance to let deciders know that they don't need to look at the history beyond the marker event.
              
              }
           {- [RequestCancelActivityTask] – Attempts to cancel a previously scheduled activity task. If the activity task was scheduled but has not been assigned to a worker, then it is canceled. If the activity task was already assigned to a worker, then the worker is informed that cancellation has been requested in the response to [RecordActivityTaskHeartbeat].
              
              }
           {- [RequestCancelExternalWorkflowExecution] – Requests that a request be made to cancel the specified external workflow execution and records a [RequestCancelExternalWorkflowExecutionInitiated] event in the history.
              
              }
           {- [ScheduleActivityTask] – Schedules an activity task.
              
              }
           {- [SignalExternalWorkflowExecution] – Requests a signal to be delivered to the specified external workflow execution and records a [SignalExternalWorkflowExecutionInitiated] event in the history.
              
              }
           {- [StartChildWorkflowExecution] – Requests that a child workflow execution be started and records a [StartChildWorkflowExecutionInitiated] event in the history. The child workflow execution is a separate workflow execution with its own history.
              
              }
           {- [StartTimer] – Starts a timer for this workflow execution and records a [TimerStarted] event in the history. This timer fires after the specified delay and record a [TimerFired] event.
              
              }
          
      }
       {b Access Control}
       
        If you grant permission to use [RespondDecisionTaskCompleted], you can use IAM policies to express permissions for the list of decisions returned by this action as if they were members of the API. Treating decisions as a pseudo API maintains a uniform conceptual model and helps keep policies readable. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        
         {b Decision Failure}
         
          Decisions can fail for several reasons
          
           {ul
                {- The ordering of decisions should follow a logical flow. Some decisions might not make sense in the current context of the workflow execution and therefore fails.
                   
                   }
                 {- A limit on your account was reached.
                    
                    }
                 {- The decision lacks sufficient permissions.
                    
                    }
                
      }
       One of the following events might be added to the history to indicate an error. The event attribute's [cause] parameter indicates the cause. If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
       
        {ul
             {- [ScheduleActivityTaskFailed] – A [ScheduleActivityTask] decision failed. This could happen if the activity type specified in the decision isn't registered, is in a deprecated state, or the decision isn't properly configured.
                
                }
              {- [RequestCancelActivityTaskFailed] – A [RequestCancelActivityTask] decision failed. This could happen if there is no open activity task with the specified activityId.
                 
                 }
              {- [StartTimerFailed] – A [StartTimer] decision failed. This could happen if there is another open timer with the same timerId.
                 
                 }
              {- [CancelTimerFailed] – A [CancelTimer] decision failed. This could happen if there is no open timer with the specified timerId.
                 
                 }
              {- [StartChildWorkflowExecutionFailed] – A [StartChildWorkflowExecution] decision failed. This could happen if the workflow type specified isn't registered, is deprecated, or the decision isn't properly configured.
                 
                 }
              {- [SignalExternalWorkflowExecutionFailed] – A [SignalExternalWorkflowExecution] decision failed. This could happen if the [workflowID] specified in the decision was incorrect.
                 
                 }
              {- [RequestCancelExternalWorkflowExecutionFailed] – A [RequestCancelExternalWorkflowExecution] decision failed. This could happen if the [workflowID] specified in the decision was incorrect.
                 
                 }
              {- [CancelWorkflowExecutionFailed] – A [CancelWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution.
                 
                 }
              {- [CompleteWorkflowExecutionFailed] – A [CompleteWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution.
                 
                 }
              {- [ContinueAsNewWorkflowExecutionFailed] – A [ContinueAsNewWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution or the ContinueAsNewWorkflowExecution decision was not configured correctly.
                 
                 }
              {- [FailWorkflowExecutionFailed] – A [FailWorkflowExecution] decision failed. This could happen if there is an unhandled decision task pending in the workflow execution.
                 
                 }
             
      }
       The preceding error events might occur due to an error in the decider logic, which might put the workflow execution in an unstable state The cause field in the event structure for the error event indicates the cause of the error.
       
        A workflow execution may be closed by the decider by returning one of the following decisions when completing a decision task: [CompleteWorkflowExecution], [FailWorkflowExecution], [CancelWorkflowExecution] and [ContinueAsNewWorkflowExecution]. An [UnhandledDecision] fault is returned if a workflow closing decision is specified and a signal or activity event had been added to the history while the decision task was being performed by the decider. Unlike the above situations which are logic issues, this fault is always possible because of race conditions in a distributed system. The right action here is to call [RespondDecisionTaskCompleted] without any decisions. This would result in another decision task with these new events included in the history. The decider should handle the new events and may decide to close the workflow execution.
        
         {b How to Code a Decision}
         
          You code a decision by first setting the decision type field to one of the above decision values, and then set the corresponding attributes field shown below:
          
           {ul
                {- 
                   {[
                   [ScheduleActivityTaskDecisionAttributes]
                   ]}
                   
                   
                   }
                 {- 
                    {[
                    [RequestCancelActivityTaskDecisionAttributes]
                    ]}
                    
                    
                    }
                 {- 
                    {[
                    [CompleteWorkflowExecutionDecisionAttributes]
                    ]}
                    
                    
                    }
                 {- 
                    {[
                    [FailWorkflowExecutionDecisionAttributes]
                    ]}
                    
                    
                    }
                 {- 
                    {[
                    [CancelWorkflowExecutionDecisionAttributes]
                    ]}
                    
                    
                    }
                 {- 
                    {[
                    [ContinueAsNewWorkflowExecutionDecisionAttributes]
                    ]}
                    
                    
                    }
                 {- 
                    {[
                    [RecordMarkerDecisionAttributes]
                    ]}
                    
                    
                    }
                 {- 
                    {[
                    [StartTimerDecisionAttributes]
                    ]}
                    
                    
                    }
                 {- 
                    {[
                    [CancelTimerDecisionAttributes]
                    ]}
                    
                    
                    }
                 {- 
                    {[
                    [SignalExternalWorkflowExecutionDecisionAttributes]
                    ]}
                    
                    
                    }
                 {- 
                    {[
                    [RequestCancelExternalWorkflowExecutionDecisionAttributes]
                    ]}
                    
                    
                    }
                 {- 
                    {[
                    [StartChildWorkflowExecutionDecisionAttributes]
                    ]}
                    
                    
                    }
                
      }
       *)
type decision = {
  schedule_lambda_function_decision_attributes: schedule_lambda_function_decision_attributes option;
  (** 
    Provides the details of the [ScheduleLambdaFunction] decision. It isn't set for other decision types.
     *)

  start_child_workflow_execution_decision_attributes: start_child_workflow_execution_decision_attributes option;
  (** 
    Provides the details of the [StartChildWorkflowExecution] decision. It isn't set for other decision types.
     *)

  request_cancel_external_workflow_execution_decision_attributes: request_cancel_external_workflow_execution_decision_attributes option;
  (** 
    Provides the details of the [RequestCancelExternalWorkflowExecution] decision. It isn't set for other decision types.
     *)

  signal_external_workflow_execution_decision_attributes: signal_external_workflow_execution_decision_attributes option;
  (** 
    Provides the details of the [SignalExternalWorkflowExecution] decision. It isn't set for other decision types.
     *)

  cancel_timer_decision_attributes: cancel_timer_decision_attributes option;
  (** 
    Provides the details of the [CancelTimer] decision. It isn't set for other decision types.
     *)

  start_timer_decision_attributes: start_timer_decision_attributes option;
  (** 
    Provides the details of the [StartTimer] decision. It isn't set for other decision types.
     *)

  record_marker_decision_attributes: record_marker_decision_attributes option;
  (** 
    Provides the details of the [RecordMarker] decision. It isn't set for other decision types.
     *)

  continue_as_new_workflow_execution_decision_attributes: continue_as_new_workflow_execution_decision_attributes option;
  (** 
    Provides the details of the [ContinueAsNewWorkflowExecution] decision. It isn't set for other decision types.
     *)

  cancel_workflow_execution_decision_attributes: cancel_workflow_execution_decision_attributes option;
  (** 
    Provides the details of the [CancelWorkflowExecution] decision. It isn't set for other decision types.
     *)

  fail_workflow_execution_decision_attributes: fail_workflow_execution_decision_attributes option;
  (** 
    Provides the details of the [FailWorkflowExecution] decision. It isn't set for other decision types.
     *)

  complete_workflow_execution_decision_attributes: complete_workflow_execution_decision_attributes option;
  (** 
    Provides the details of the [CompleteWorkflowExecution] decision. It isn't set for other decision types.
     *)

  request_cancel_activity_task_decision_attributes: request_cancel_activity_task_decision_attributes option;
  (** 
    Provides the details of the [RequestCancelActivityTask] decision. It isn't set for other decision types.
     *)

  schedule_activity_task_decision_attributes: schedule_activity_task_decision_attributes option;
  (** 
    Provides the details of the [ScheduleActivityTask] decision. It isn't set for other decision types.
     *)

  decision_type: decision_type;
  (** 
    Specifies the type of the decision.
     *)

}

(** 
    Input data for a TaskCompleted response to a decision task.
     *)
type respond_decision_task_completed_input = {
  task_list_schedule_to_start_timeout: string option;
  (** 
    Specifies a timeout (in seconds) for the task list override. When this parameter is missing, the task list override is permanent. This parameter makes it possible to temporarily override the task list. If a decision task scheduled on the override task list is not started within the timeout, the decision task will time out. Amazon SWF will revert the override and schedule a new decision task to the original task list.
    
     If a decision task scheduled on the override task list is started within the timeout, but not completed within the start-to-close timeout, Amazon SWF will also revert the override and schedule a new decision task to the original task list.
      *)

  task_list: task_list option;
  (** 
    The task list to use for the future decision tasks of this workflow execution. This list overrides the original task list you specified while starting the workflow execution.
     *)

  execution_context: string option;
  (** 
    User defined context to add to workflow execution.
     *)

  decisions: decision list option;
  (** 
    The list of decisions (possibly empty) made by the decider while processing this decision task. See the docs for the [Decision] structure for details.
     *)

  task_token: string;
  (** 
    The [taskToken] from the [DecisionTask].
    
     [taskToken] is generated by the service and should be treated as an opaque value. If the task is passed to another process, its [taskToken] must also be passed. This enables it to provide its progress and respond with results.
     
      *)

}

type respond_activity_task_failed_input = {
  details: string option;
  (** 
    Detailed information about the failure.
     *)

  reason: string option;
  (** 
    Description of the error that may assist in diagnostics.
     *)

  task_token: string;
  (** 
    The [taskToken] of the [ActivityTask].
    
     [taskToken] is generated by the service and should be treated as an opaque value. If the task is passed to another process, its [taskToken] must also be passed. This enables it to provide its progress and respond with results.
     
      *)

}

type respond_activity_task_completed_input = {
  result: string option;
  (** 
    The result of the activity task. It is a free form string that is implementation specific.
     *)

  task_token: string;
  (** 
    The [taskToken] of the [ActivityTask].
    
     [taskToken] is generated by the service and should be treated as an opaque value. If the task is passed to another process, its [taskToken] must also be passed. This enables it to provide its progress and respond with results.
     
      *)

}

type respond_activity_task_canceled_input = {
  details: string option;
  (** 
    Information about the cancellation.
     *)

  task_token: string;
  (** 
    The [taskToken] of the [ActivityTask].
    
     [taskToken] is generated by the service and should be treated as an opaque value. If the task is passed to another process, its [taskToken] must also be passed. This enables it to provide its progress and respond with results.
     
      *)

}

type request_cancel_workflow_execution_input = {
  run_id: string option;
  (** 
    The runId of the workflow execution to cancel.
     *)

  workflow_id: string;
  (** 
    The workflowId of the workflow execution to cancel.
     *)

  domain: string;
  (** 
    The name of the domain containing the workflow execution to cancel.
     *)

}

type register_workflow_type_input = {
  default_lambda_role: string option;
  (** 
    The default IAM role attached to this workflow type.
    
     Executions of this workflow type need IAM roles to invoke Lambda functions. If you don't specify an IAM role when you start this workflow type, the default Lambda role is attached to the execution. For more information, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html}https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html} in the {i Amazon SWF Developer Guide}.
     
      *)

  default_child_policy: child_policy option;
  (** 
    If set, specifies the default policy to use for the child workflow executions when a workflow execution of this type is terminated, by calling the [TerminateWorkflowExecution] action explicitly or due to an expired timeout. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].
    
     The supported child policies are:
     
      {ul
           {- [TERMINATE] – The child executions are terminated.
              
              }
            {- [REQUEST_CANCEL] – A request to cancel is attempted for each child execution by recording a [WorkflowExecutionCancelRequested] event in its history. It is up to the decider to take appropriate actions when it receives an execution history with this event.
               
               }
            {- [ABANDON] – No action is taken. The child executions continue to run.
               
               }
           
      }
       *)

  default_task_priority: string option;
  (** 
    The default task priority to assign to the workflow type. If not assigned, then [0] is used. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
    
     For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.
      *)

  default_task_list: task_list option;
  (** 
    If set, specifies the default task list to use for scheduling decision tasks for executions of this workflow type. This default is used only if a task list isn't provided when starting the execution through the [StartWorkflowExecution] Action or [StartChildWorkflowExecution] [Decision].
     *)

  default_execution_start_to_close_timeout: string option;
  [@ocaml.doc {| 
    If set, specifies the default maximum duration for executions of this workflow type. You can override this default when starting an execution through the [StartWorkflowExecution] Action or [StartChildWorkflowExecution] [Decision].
    
     The duration is specified in seconds; an integer greater than or equal to 0. Unlike some of the other timeout parameters in Amazon SWF, you cannot specify a value of "NONE" for [defaultExecutionStartToCloseTimeout]; there is a one-year max limit on the time that a workflow execution can run. Exceeding this limit always causes the workflow execution to time out.
      |}]

  default_task_start_to_close_timeout: string option;
  (** 
    If set, specifies the default maximum duration of decision tasks for this workflow type. This default can be overridden when starting a workflow execution using the [StartWorkflowExecution] action or the [StartChildWorkflowExecution] [Decision].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  description: string option;
  (** 
    Textual description of the workflow type.
     *)

  version: string;
  (** 
    The version of the workflow type.
    
     The workflow type consists of the name and version, the combination of which must be unique within the domain. To get a list of all currently registered workflow types, use the [ListWorkflowTypes] action.
     
      The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
       *)

  name: string;
  (** 
    The name of the workflow type.
    
     The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
      *)

  domain: string;
  (** 
    The name of the domain in which to register the workflow type.
     *)

}

type register_domain_input = {
  tags: resource_tag list option;
  (** 
    Tags to be added when registering a domain.
    
     Tags may only contain unicode letters, digits, whitespace, or these symbols: [_ . : / = + - @].
      *)

  workflow_execution_retention_period_in_days: string;
  (** 
    The duration (in days) that records and histories of workflow executions on the domain should be kept by the service. After the retention period, the workflow execution isn't available in the results of visibility calls.
    
     If you pass the value [NONE] or [0] (zero), then the workflow execution history isn't retained. As soon as the workflow execution completes, the execution record and its history are deleted.
     
      The maximum workflow execution retention period is 90 days. For more information about Amazon SWF service limits, see: {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-limits.html}Amazon SWF Service Limits} in the {i Amazon SWF Developer Guide}.
       *)

  description: string option;
  (** 
    A text description of the domain.
     *)

  name: string;
  (** 
    Name of the domain to register. The name must be unique in the region that the domain is registered in.
    
     The specified string must not start or end with whitespace. It must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
      *)

}

type register_activity_type_input = {
  default_task_schedule_to_close_timeout: string option;
  (** 
    If set, specifies the default maximum duration for a task of this activity type. This default can be overridden when scheduling an activity task using the [ScheduleActivityTask] [Decision].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  default_task_schedule_to_start_timeout: string option;
  (** 
    If set, specifies the default maximum duration that a task of this activity type can wait before being assigned to a worker. This default can be overridden when scheduling an activity task using the [ScheduleActivityTask] [Decision].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  default_task_priority: string option;
  (** 
    The default task priority to assign to the activity type. If not assigned, then [0] is used. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
    
     For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i in the {i Amazon SWF Developer Guide}.}.
      *)

  default_task_list: task_list option;
  (** 
    If set, specifies the default task list to use for scheduling tasks of this activity type. This default task list is used if a task list isn't provided when a task is scheduled through the [ScheduleActivityTask] [Decision].
     *)

  default_task_heartbeat_timeout: string option;
  (** 
    If set, specifies the default maximum time before which a worker processing a task of this type must report progress by calling [RecordActivityTaskHeartbeat]. If the timeout is exceeded, the activity task is automatically timed out. This default can be overridden when scheduling an activity task using the [ScheduleActivityTask] [Decision]. If the activity worker subsequently attempts to record a heartbeat or returns a result, the activity worker receives an [UnknownResource] fault. In this case, Amazon SWF no longer considers the activity task to be valid; the activity worker should clean up the activity task.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  default_task_start_to_close_timeout: string option;
  (** 
    If set, specifies the default maximum duration that a worker can take to process tasks of this activity type. This default can be overridden when scheduling an activity task using the [ScheduleActivityTask] [Decision].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  description: string option;
  (** 
    A textual description of the activity type.
     *)

  version: string;
  (** 
    The version of the activity type.
    
     The activity type consists of the name and version, the combination of which must be unique within the domain.
     
      The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
       *)

  name: string;
  (** 
    The name of the activity type within the domain.
    
     The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
      *)

  domain: string;
  (** 
    The name of the domain in which this activity is to be registered.
     *)

}

(** 
    Status information about an activity task.
     *)
type activity_task_status = {
  cancel_requested: bool;
  (** 
    Set to [true] if cancellation of the task is requested.
     *)

}

type record_activity_task_heartbeat_input = {
  details: string option;
  (** 
    If specified, contains details about the progress of the task.
     *)

  task_token: string;
  (** 
    The [taskToken] of the [ActivityTask].
    
     [taskToken] is generated by the service and should be treated as an opaque value. If the task is passed to another process, its [taskToken] must also be passed. This enables it to provide its progress and respond with results.
     
      *)

}

type event_type = | StartLambdaFunctionFailed
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
  | WorkflowExecutionStarted

type complete_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | UNHANDLED_DECISION

(** 
    Provides the details of the [CompleteWorkflowExecutionFailed] event.
     *)
type complete_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CompleteWorkflowExecution] decision to complete this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  cause: complete_workflow_execution_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

}

type fail_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | UNHANDLED_DECISION

(** 
    Provides the details of the [FailWorkflowExecutionFailed] event.
     *)
type fail_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [FailWorkflowExecution] decision to fail this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  cause: fail_workflow_execution_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

}

type cancel_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | UNHANDLED_DECISION

(** 
    Provides the details of the [CancelWorkflowExecutionFailed] event.
     *)
type cancel_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CancelWorkflowExecution] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  cause: cancel_workflow_execution_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

}

type continue_as_new_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED
  | DEFAULT_CHILD_POLICY_UNDEFINED
  | DEFAULT_TASK_LIST_UNDEFINED
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED
  | WORKFLOW_TYPE_DOES_NOT_EXIST
  | WORKFLOW_TYPE_DEPRECATED
  | UNHANDLED_DECISION

(** 
    Provides the details of the [ContinueAsNewWorkflowExecutionFailed] event.
     *)
type continue_as_new_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [ContinueAsNewWorkflowExecution] decision that started this execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  cause: continue_as_new_workflow_execution_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

}

(** 
    Provides details about the [DecisionTaskScheduled] event.
     *)
type decision_task_scheduled_event_attributes = {
  schedule_to_start_timeout: string option;
  (** 
    The maximum amount of time the decision task can wait to be assigned to a worker.
     *)

  start_to_close_timeout: string option;
  (** 
    The maximum duration for this decision task. The task is considered timed out if it doesn't completed within this duration.
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  task_priority: string option;
  (** 
    A task priority that, if set, specifies the priority for this decision task. Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
    
     For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.
      *)

  task_list: task_list;
  (** 
    The name of the task list in which the decision task was scheduled.
     *)

}

(** 
    Provides the details of the [DecisionTaskStarted] event.
     *)
type decision_task_started_event_attributes = {
  scheduled_event_id: int;
  (** 
    The ID of the [DecisionTaskScheduled] event that was recorded when this decision task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  identity: string option;
  (** 
    Identity of the decider making the request. This enables diagnostic tracing when problems arise. The form of this identity is user defined.
     *)

}

(** 
    Provides the details of the [DecisionTaskCompleted] event.
     *)
type decision_task_completed_event_attributes = {
  task_list_schedule_to_start_timeout: string option;
  (** 
    The maximum amount of time the decision task can wait to be assigned to a worker.
     *)

  task_list: task_list option;
  
  started_event_id: int;
  (** 
    The ID of the [DecisionTaskStarted] event recorded when this decision task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  scheduled_event_id: int;
  (** 
    The ID of the [DecisionTaskScheduled] event that was recorded when this decision task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  execution_context: string option;
  (** 
    User defined context for the workflow execution.
     *)

}

type decision_task_timeout_type = | SCHEDULE_TO_START
  | START_TO_CLOSE

(** 
    Provides the details of the [DecisionTaskTimedOut] event.
     *)
type decision_task_timed_out_event_attributes = {
  started_event_id: int;
  (** 
    The ID of the [DecisionTaskStarted] event recorded when this decision task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  scheduled_event_id: int;
  (** 
    The ID of the [DecisionTaskScheduled] event that was recorded when this decision task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  timeout_type: decision_task_timeout_type;
  (** 
    The type of timeout that expired before the decision task could be completed.
     *)

}

(** 
    Provides the details of the [ActivityTaskScheduled] event.
     *)
type activity_task_scheduled_event_attributes = {
  heartbeat_timeout: string option;
  (** 
    The maximum time before which the worker processing this task must report progress by calling [RecordActivityTaskHeartbeat]. If the timeout is exceeded, the activity task is automatically timed out. If the worker subsequently attempts to record a heartbeat or return a result, it is ignored.
     *)

  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision that resulted in the scheduling of this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  task_priority: string option;
  (** 
    The priority to assign to the scheduled activity task. If set, this overrides any default priority value that was assigned when the activity type was registered.
    
     Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
     
      For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.
       *)

  task_list: task_list;
  (** 
    The task list in which the activity task has been scheduled.
     *)

  start_to_close_timeout: string option;
  (** 
    The maximum amount of time a worker may take to process the activity task.
     *)

  schedule_to_close_timeout: string option;
  (** 
    The maximum amount of time for this activity task.
     *)

  schedule_to_start_timeout: string option;
  (** 
    The maximum amount of time the activity task can wait to be assigned to a worker.
     *)

  control: string option;
  (** 
    Data attached to the event that can be used by the decider in subsequent workflow tasks. This data isn't sent to the activity.
     *)

  input: string option;
  (** 
    The input provided to the activity task.
     *)

  activity_id: string;
  (** 
    The unique ID of the activity task.
     *)

  activity_type: activity_type;
  (** 
    The type of the activity task.
     *)

}

(** 
    Provides the details of the [ActivityTaskStarted] event.
     *)
type activity_task_started_event_attributes = {
  scheduled_event_id: int;
  (** 
    The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  identity: string option;
  (** 
    Identity of the worker that was assigned this task. This aids diagnostics when problems arise. The form of this identity is user defined.
     *)

}

(** 
    Provides the details of the [ActivityTaskCompleted] event.
     *)
type activity_task_completed_event_attributes = {
  started_event_id: int;
  (** 
    The ID of the [ActivityTaskStarted] event recorded when this activity task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  scheduled_event_id: int;
  (** 
    The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  result: string option;
  (** 
    The results of the activity task.
     *)

}

(** 
    Provides the details of the [ActivityTaskFailed] event.
     *)
type activity_task_failed_event_attributes = {
  started_event_id: int;
  (** 
    The ID of the [ActivityTaskStarted] event recorded when this activity task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  scheduled_event_id: int;
  (** 
    The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  details: string option;
  (** 
    The details of the failure.
     *)

  reason: string option;
  (** 
    The reason provided for the failure.
     *)

}

type activity_task_timeout_type = | HEARTBEAT
  | SCHEDULE_TO_CLOSE
  | SCHEDULE_TO_START
  | START_TO_CLOSE

(** 
    Provides the details of the [ActivityTaskTimedOut] event.
     *)
type activity_task_timed_out_event_attributes = {
  details: string option;
  (** 
    Contains the content of the [details] parameter for the last call made by the activity to [RecordActivityTaskHeartbeat].
     *)

  started_event_id: int;
  (** 
    The ID of the [ActivityTaskStarted] event recorded when this activity task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  scheduled_event_id: int;
  (** 
    The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  timeout_type: activity_task_timeout_type;
  (** 
    The type of the timeout that caused this event.
     *)

}

(** 
    Provides the details of the [ActivityTaskCanceled] event.
     *)
type activity_task_canceled_event_attributes = {
  latest_cancel_requested_event_id: int option;
  (** 
    If set, contains the ID of the last [ActivityTaskCancelRequested] event recorded for this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  started_event_id: int;
  (** 
    The ID of the [ActivityTaskStarted] event recorded when this activity task was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  scheduled_event_id: int;
  (** 
    The ID of the [ActivityTaskScheduled] event that was recorded when this activity task was scheduled. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  details: string option;
  (** 
    Details of the cancellation.
     *)

}

(** 
    Provides the details of the [ActivityTaskCancelRequested] event.
     *)
type activity_task_cancel_requested_event_attributes = {
  activity_id: string;
  (** 
    The unique ID of the task.
     *)

  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RequestCancelActivityTask] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

}

(** 
    Provides the details of the [MarkerRecorded] event.
     *)
type marker_recorded_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RecordMarker] decision that requested this marker. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  details: string option;
  (** 
    The details of the marker.
     *)

  marker_name: string;
  (** 
    The name of the marker.
     *)

}

type record_marker_failed_cause = | OPERATION_NOT_PERMITTED

(** 
    Provides the details of the [RecordMarkerFailed] event.
     *)
type record_marker_failed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RecordMarkerFailed] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  cause: record_marker_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

  marker_name: string;
  (** 
    The marker's name.
     *)

}

(** 
    Provides the details of the [ChildWorkflowExecutionStarted] event.
     *)
type child_workflow_execution_started_event_attributes = {
  initiated_event_id: int;
  (** 
    The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  workflow_type: workflow_type;
  (** 
    The type of the child workflow execution.
     *)

  workflow_execution: workflow_execution;
  (** 
    The child workflow execution that was started.
     *)

}

(** 
    Provides the details of the [ChildWorkflowExecutionCompleted] event.
     *)
type child_workflow_execution_completed_event_attributes = {
  started_event_id: int;
  (** 
    The ID of the [ChildWorkflowExecutionStarted] event recorded when this child workflow execution was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  initiated_event_id: int;
  (** 
    The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  result: string option;
  (** 
    The result of the child workflow execution.
     *)

  workflow_type: workflow_type;
  (** 
    The type of the child workflow execution.
     *)

  workflow_execution: workflow_execution;
  (** 
    The child workflow execution that was completed.
     *)

}

(** 
    Provides the details of the [ChildWorkflowExecutionFailed] event.
     *)
type child_workflow_execution_failed_event_attributes = {
  started_event_id: int;
  (** 
    The ID of the [ChildWorkflowExecutionStarted] event recorded when this child workflow execution was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  initiated_event_id: int;
  (** 
    The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  details: string option;
  (** 
    The details of the failure (if provided).
     *)

  reason: string option;
  (** 
    The reason for the failure (if provided).
     *)

  workflow_type: workflow_type;
  (** 
    The type of the child workflow execution.
     *)

  workflow_execution: workflow_execution;
  (** 
    The child workflow execution that failed.
     *)

}

(** 
    Provides the details of the [ChildWorkflowExecutionTimedOut] event.
     *)
type child_workflow_execution_timed_out_event_attributes = {
  started_event_id: int;
  (** 
    The ID of the [ChildWorkflowExecutionStarted] event recorded when this child workflow execution was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  initiated_event_id: int;
  (** 
    The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  timeout_type: workflow_execution_timeout_type;
  (** 
    The type of the timeout that caused the child workflow execution to time out.
     *)

  workflow_type: workflow_type;
  (** 
    The type of the child workflow execution.
     *)

  workflow_execution: workflow_execution;
  (** 
    The child workflow execution that timed out.
     *)

}

(** 
    Provide details of the [ChildWorkflowExecutionCanceled] event.
     *)
type child_workflow_execution_canceled_event_attributes = {
  started_event_id: int;
  (** 
    The ID of the [ChildWorkflowExecutionStarted] event recorded when this child workflow execution was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  initiated_event_id: int;
  (** 
    The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  details: string option;
  (** 
    Details of the cancellation (if provided).
     *)

  workflow_type: workflow_type;
  (** 
    The type of the child workflow execution.
     *)

  workflow_execution: workflow_execution;
  (** 
    The child workflow execution that was canceled.
     *)

}

(** 
    Provides the details of the [ChildWorkflowExecutionTerminated] event.
     *)
type child_workflow_execution_terminated_event_attributes = {
  started_event_id: int;
  (** 
    The ID of the [ChildWorkflowExecutionStarted] event recorded when this child workflow execution was started. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  initiated_event_id: int;
  (** 
    The ID of the [StartChildWorkflowExecutionInitiated] event corresponding to the [StartChildWorkflowExecution] [Decision] to start this child workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  workflow_type: workflow_type;
  (** 
    The type of the child workflow execution.
     *)

  workflow_execution: workflow_execution;
  (** 
    The child workflow execution that was terminated.
     *)

}

(** 
    Provides the details of the [SignalExternalWorkflowExecutionInitiated] event.
     *)
type signal_external_workflow_execution_initiated_event_attributes = {
  control: string option;
  (** 
    Data attached to the event that can be used by the decider in subsequent decision tasks.
     *)

  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [SignalExternalWorkflowExecution] decision for this signal. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  input: string option;
  (** 
    The input provided to the signal.
     *)

  signal_name: string;
  (** 
    The name of the signal.
     *)

  run_id: string option;
  (** 
    The [runId] of the external workflow execution to send the signal to.
     *)

  workflow_id: string;
  (** 
    The [workflowId] of the external workflow execution.
     *)

}

(** 
    Provides the details of the [ExternalWorkflowExecutionSignaled] event.
     *)
type external_workflow_execution_signaled_event_attributes = {
  initiated_event_id: int;
  (** 
    The ID of the [SignalExternalWorkflowExecutionInitiated] event corresponding to the [SignalExternalWorkflowExecution] decision to request this signal. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  workflow_execution: workflow_execution;
  (** 
    The external workflow execution that the signal was delivered to.
     *)

}

type signal_external_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION

(** 
    Provides the details of the [SignalExternalWorkflowExecutionFailed] event.
     *)
type signal_external_workflow_execution_failed_event_attributes = {
  control: string option;
  (** 
    The data attached to the event that the decider can use in subsequent workflow tasks. This data isn't sent to the workflow execution.
     *)

  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [SignalExternalWorkflowExecution] decision for this signal. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  initiated_event_id: int;
  (** 
    The ID of the [SignalExternalWorkflowExecutionInitiated] event corresponding to the [SignalExternalWorkflowExecution] decision to request this signal. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  cause: signal_external_workflow_execution_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

  run_id: string option;
  (** 
    The [runId] of the external workflow execution that the signal was being delivered to.
     *)

  workflow_id: string;
  (** 
    The [workflowId] of the external workflow execution that the signal was being delivered to.
     *)

}

(** 
    Provides the details of the [ExternalWorkflowExecutionCancelRequested] event.
     *)
type external_workflow_execution_cancel_requested_event_attributes = {
  initiated_event_id: int;
  (** 
    The ID of the [RequestCancelExternalWorkflowExecutionInitiated] event corresponding to the [RequestCancelExternalWorkflowExecution] decision to cancel this external workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  workflow_execution: workflow_execution;
  (** 
    The external workflow execution to which the cancellation request was delivered.
     *)

}

(** 
    Provides the details of the [RequestCancelExternalWorkflowExecutionInitiated] event.
     *)
type request_cancel_external_workflow_execution_initiated_event_attributes = {
  control: string option;
  (** 
    Data attached to the event that can be used by the decider in subsequent workflow tasks.
     *)

  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RequestCancelExternalWorkflowExecution] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  run_id: string option;
  (** 
    The [runId] of the external workflow execution to be canceled.
     *)

  workflow_id: string;
  (** 
    The [workflowId] of the external workflow execution to be canceled.
     *)

}

type request_cancel_external_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION

(** 
    Provides the details of the [RequestCancelExternalWorkflowExecutionFailed] event.
     *)
type request_cancel_external_workflow_execution_failed_event_attributes = {
  control: string option;
  (** 
    The data attached to the event that the decider can use in subsequent workflow tasks. This data isn't sent to the workflow execution.
     *)

  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RequestCancelExternalWorkflowExecution] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  initiated_event_id: int;
  (** 
    The ID of the [RequestCancelExternalWorkflowExecutionInitiated] event corresponding to the [RequestCancelExternalWorkflowExecution] decision to cancel this external workflow execution. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  cause: request_cancel_external_workflow_execution_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

  run_id: string option;
  (** 
    The [runId] of the external workflow execution.
     *)

  workflow_id: string;
  (** 
    The [workflowId] of the external workflow to which the cancel request was to be delivered.
     *)

}

type schedule_activity_task_failed_cause = | OPERATION_NOT_PERMITTED
  | DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED
  | DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED
  | DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED
  | DEFAULT_TASK_LIST_UNDEFINED
  | DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED
  | ACTIVITY_CREATION_RATE_EXCEEDED
  | OPEN_ACTIVITIES_LIMIT_EXCEEDED
  | ACTIVITY_ID_ALREADY_IN_USE
  | ACTIVITY_TYPE_DOES_NOT_EXIST
  | ACTIVITY_TYPE_DEPRECATED

(** 
    Provides the details of the [ScheduleActivityTaskFailed] event.
     *)
type schedule_activity_task_failed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision that resulted in the scheduling of this activity task. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  cause: schedule_activity_task_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

  activity_id: string;
  (** 
    The activityId provided in the [ScheduleActivityTask] decision that failed.
     *)

  activity_type: activity_type;
  (** 
    The activity type provided in the [ScheduleActivityTask] decision that failed.
     *)

}

type request_cancel_activity_task_failed_cause = | OPERATION_NOT_PERMITTED
  | ACTIVITY_ID_UNKNOWN

(** 
    Provides the details of the [RequestCancelActivityTaskFailed] event.
     *)
type request_cancel_activity_task_failed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [RequestCancelActivityTask] decision for this cancellation request. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  cause: request_cancel_activity_task_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

  activity_id: string;
  (** 
    The activityId provided in the [RequestCancelActivityTask] decision that failed.
     *)

}

type cancel_timer_failed_cause = | OPERATION_NOT_PERMITTED
  | TIMER_ID_UNKNOWN

(** 
    Provides the details of the [CancelTimerFailed] event.
     *)
type cancel_timer_failed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [DecisionTaskCompleted] event corresponding to the decision task that resulted in the [CancelTimer] decision to cancel this timer. This information can be useful for diagnosing problems by tracing back the chain of events leading up to this event.
     *)

  cause: cancel_timer_failed_cause;
  (** 
    The cause of the failure. This information is generated by the system and can be useful for diagnostic purposes.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

  timer_id: string;
  (** 
    The timerId provided in the [CancelTimer] decision that failed.
     *)

}

(** 
    Provides the details of the [LambdaFunctionScheduled] event. It isn't set for other event types.
     *)
type lambda_function_scheduled_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [LambdaFunctionCompleted] event corresponding to the decision that resulted in scheduling this activity task. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
     *)

  start_to_close_timeout: string option;
  (** 
    The maximum amount of time a worker can take to process the Lambda task.
     *)

  input: string option;
  (** 
    The input provided to the Lambda task.
     *)

  control: string option;
  (** 
    Data attached to the event that the decider can use in subsequent workflow tasks. This data isn't sent to the Lambda task.
     *)

  name: string;
  (** 
    The name of the Lambda function.
     *)

  id: string;
  (** 
    The unique ID of the Lambda task.
     *)

}

(** 
    Provides the details of the [LambdaFunctionStarted] event. It isn't set for other event types.
     *)
type lambda_function_started_event_attributes = {
  scheduled_event_id: int;
  (** 
    The ID of the [LambdaFunctionScheduled] event that was recorded when this activity task was scheduled. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
     *)

}

(** 
    Provides the details of the [LambdaFunctionCompleted] event. It isn't set for other event types.
     *)
type lambda_function_completed_event_attributes = {
  result: string option;
  (** 
    The results of the Lambda task.
     *)

  started_event_id: int;
  (** 
    The ID of the [LambdaFunctionStarted] event recorded when this activity task started. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
     *)

  scheduled_event_id: int;
  (** 
    The ID of the [LambdaFunctionScheduled] event that was recorded when this Lambda task was scheduled. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
     *)

}

(** 
    Provides the details of the [LambdaFunctionFailed] event. It isn't set for other event types.
     *)
type lambda_function_failed_event_attributes = {
  details: string option;
  (** 
    The details of the failure.
     *)

  reason: string option;
  (** 
    The reason provided for the failure.
     *)

  started_event_id: int;
  (** 
    The ID of the [LambdaFunctionStarted] event recorded when this activity task started. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
     *)

  scheduled_event_id: int;
  (** 
    The ID of the [LambdaFunctionScheduled] event that was recorded when this activity task was scheduled. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
     *)

}

type lambda_function_timeout_type = | START_TO_CLOSE

(** 
    Provides details of the [LambdaFunctionTimedOut] event.
     *)
type lambda_function_timed_out_event_attributes = {
  timeout_type: lambda_function_timeout_type option;
  (** 
    The type of the timeout that caused this event.
     *)

  started_event_id: int;
  (** 
    The ID of the [ActivityTaskStarted] event that was recorded when this activity task started. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
     *)

  scheduled_event_id: int;
  (** 
    The ID of the [LambdaFunctionScheduled] event that was recorded when this activity task was scheduled. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
     *)

}

type schedule_lambda_function_failed_cause = | LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION
  | LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED
  | OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED
  | ID_ALREADY_IN_USE

(** 
    Provides the details of the [ScheduleLambdaFunctionFailed] event. It isn't set for other event types.
     *)
type schedule_lambda_function_failed_event_attributes = {
  decision_task_completed_event_id: int;
  (** 
    The ID of the [LambdaFunctionCompleted] event corresponding to the decision that resulted in scheduling this Lambda task. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
     *)

  cause: schedule_lambda_function_failed_cause;
  (** 
    The cause of the failure. To help diagnose issues, use this information to trace back the chain of events leading up to this event.
    
     If [cause] is set to [OPERATION_NOT_PERMITTED], the decision failed because it lacked sufficient permissions. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
     
      *)

  name: string;
  (** 
    The name of the Lambda function.
     *)

  id: string;
  (** 
    The ID provided in the [ScheduleLambdaFunction] decision that failed.
     *)

}

(** 
    Event within a workflow execution. A history event can be one of these types:
    
     {ul
          {- [ActivityTaskCancelRequested] – A [RequestCancelActivityTask] decision was received by the system.
             
             }
           {- [ActivityTaskCanceled] – The activity task was successfully canceled.
              
              }
           {- [ActivityTaskCompleted] – An activity worker successfully completed an activity task by calling [RespondActivityTaskCompleted].
              
              }
           {- [ActivityTaskFailed] – An activity worker failed an activity task by calling [RespondActivityTaskFailed].
              
              }
           {- [ActivityTaskScheduled] – An activity task was scheduled for execution.
              
              }
           {- [ActivityTaskStarted] – The scheduled activity task was dispatched to a worker.
              
              }
           {- [ActivityTaskTimedOut] – The activity task timed out.
              
              }
           {- [CancelTimerFailed] – Failed to process CancelTimer decision. This happens when the decision isn't configured properly, for example no timer exists with the specified timer Id.
              
              }
           {- [CancelWorkflowExecutionFailed] – A request to cancel a workflow execution failed.
              
              }
           {- [ChildWorkflowExecutionCanceled] – A child workflow execution, started by this workflow execution, was canceled and closed.
              
              }
           {- [ChildWorkflowExecutionCompleted] – A child workflow execution, started by this workflow execution, completed successfully and was closed.
              
              }
           {- [ChildWorkflowExecutionFailed] – A child workflow execution, started by this workflow execution, failed to complete successfully and was closed.
              
              }
           {- [ChildWorkflowExecutionStarted] – A child workflow execution was successfully started.
              
              }
           {- [ChildWorkflowExecutionTerminated] – A child workflow execution, started by this workflow execution, was terminated.
              
              }
           {- [ChildWorkflowExecutionTimedOut] – A child workflow execution, started by this workflow execution, timed out and was closed.
              
              }
           {- [CompleteWorkflowExecutionFailed] – The workflow execution failed to complete.
              
              }
           {- [ContinueAsNewWorkflowExecutionFailed] – The workflow execution failed to complete after being continued as a new workflow execution.
              
              }
           {- [DecisionTaskCompleted] – The decider successfully completed a decision task by calling [RespondDecisionTaskCompleted].
              
              }
           {- [DecisionTaskScheduled] – A decision task was scheduled for the workflow execution.
              
              }
           {- [DecisionTaskStarted] – The decision task was dispatched to a decider.
              
              }
           {- [DecisionTaskTimedOut] – The decision task timed out.
              
              }
           {- [ExternalWorkflowExecutionCancelRequested] – Request to cancel an external workflow execution was successfully delivered to the target execution.
              
              }
           {- [ExternalWorkflowExecutionSignaled] – A signal, requested by this workflow execution, was successfully delivered to the target external workflow execution.
              
              }
           {- [FailWorkflowExecutionFailed] – A request to mark a workflow execution as failed, itself failed.
              
              }
           {- [MarkerRecorded] – A marker was recorded in the workflow history as the result of a [RecordMarker] decision.
              
              }
           {- [RecordMarkerFailed] – A [RecordMarker] decision was returned as failed.
              
              }
           {- [RequestCancelActivityTaskFailed] – Failed to process RequestCancelActivityTask decision. This happens when the decision isn't configured properly.
              
              }
           {- [RequestCancelExternalWorkflowExecutionFailed] – Request to cancel an external workflow execution failed.
              
              }
           {- [RequestCancelExternalWorkflowExecutionInitiated] – A request was made to request the cancellation of an external workflow execution.
              
              }
           {- [ScheduleActivityTaskFailed] – Failed to process ScheduleActivityTask decision. This happens when the decision isn't configured properly, for example the activity type specified isn't registered.
              
              }
           {- [SignalExternalWorkflowExecutionFailed] – The request to signal an external workflow execution failed.
              
              }
           {- [SignalExternalWorkflowExecutionInitiated] – A request to signal an external workflow was made.
              
              }
           {- [StartActivityTaskFailed] – A scheduled activity task failed to start.
              
              }
           {- [StartChildWorkflowExecutionFailed] – Failed to process StartChildWorkflowExecution decision. This happens when the decision isn't configured properly, for example the workflow type specified isn't registered.
              
              }
           {- [StartChildWorkflowExecutionInitiated] – A request was made to start a child workflow execution.
              
              }
           {- [StartTimerFailed] – Failed to process StartTimer decision. This happens when the decision isn't configured properly, for example a timer already exists with the specified timer Id.
              
              }
           {- [TimerCanceled] – A timer, previously started for this workflow execution, was successfully canceled.
              
              }
           {- [TimerFired] – A timer, previously started for this workflow execution, fired.
              
              }
           {- [TimerStarted] – A timer was started for the workflow execution due to a [StartTimer] decision.
              
              }
           {- [WorkflowExecutionCancelRequested] – A request to cancel this workflow execution was made.
              
              }
           {- [WorkflowExecutionCanceled] – The workflow execution was successfully canceled and closed.
              
              }
           {- [WorkflowExecutionCompleted] – The workflow execution was closed due to successful completion.
              
              }
           {- [WorkflowExecutionContinuedAsNew] – The workflow execution was closed and a new execution of the same type was created with the same workflowId.
              
              }
           {- [WorkflowExecutionFailed] – The workflow execution closed due to a failure.
              
              }
           {- [WorkflowExecutionSignaled] – An external signal was received for the workflow execution.
              
              }
           {- [WorkflowExecutionStarted] – The workflow execution was started.
              
              }
           {- [WorkflowExecutionTerminated] – The workflow execution was terminated.
              
              }
           {- [WorkflowExecutionTimedOut] – The workflow execution was closed because a time out was exceeded.
              
              }
          
      }
       *)
type history_event = {
  start_lambda_function_failed_event_attributes: start_lambda_function_failed_event_attributes option;
  (** 
    Provides the details of the [StartLambdaFunctionFailed] event. It isn't set for other event types.
     *)

  schedule_lambda_function_failed_event_attributes: schedule_lambda_function_failed_event_attributes option;
  (** 
    Provides the details of the [ScheduleLambdaFunctionFailed] event. It isn't set for other event types.
     *)

  lambda_function_timed_out_event_attributes: lambda_function_timed_out_event_attributes option;
  (** 
    Provides the details of the [LambdaFunctionTimedOut] event. It isn't set for other event types.
     *)

  lambda_function_failed_event_attributes: lambda_function_failed_event_attributes option;
  (** 
    Provides the details of the [LambdaFunctionFailed] event. It isn't set for other event types.
     *)

  lambda_function_completed_event_attributes: lambda_function_completed_event_attributes option;
  (** 
    Provides the details of the [LambdaFunctionCompleted] event. It isn't set for other event types.
     *)

  lambda_function_started_event_attributes: lambda_function_started_event_attributes option;
  (** 
    Provides the details of the [LambdaFunctionStarted] event. It isn't set for other event types.
     *)

  lambda_function_scheduled_event_attributes: lambda_function_scheduled_event_attributes option;
  (** 
    Provides the details of the [LambdaFunctionScheduled] event. It isn't set for other event types.
     *)

  start_child_workflow_execution_failed_event_attributes: start_child_workflow_execution_failed_event_attributes option;
  (** 
    If the event is of type [StartChildWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  cancel_timer_failed_event_attributes: cancel_timer_failed_event_attributes option;
  (** 
    If the event is of type [CancelTimerFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  start_timer_failed_event_attributes: start_timer_failed_event_attributes option;
  (** 
    If the event is of type [StartTimerFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  request_cancel_activity_task_failed_event_attributes: request_cancel_activity_task_failed_event_attributes option;
  (** 
    If the event is of type [RequestCancelActivityTaskFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  schedule_activity_task_failed_event_attributes: schedule_activity_task_failed_event_attributes option;
  (** 
    If the event is of type [ScheduleActivityTaskFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  request_cancel_external_workflow_execution_failed_event_attributes: request_cancel_external_workflow_execution_failed_event_attributes option;
  (** 
    If the event is of type [RequestCancelExternalWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  request_cancel_external_workflow_execution_initiated_event_attributes: request_cancel_external_workflow_execution_initiated_event_attributes option;
  (** 
    If the event is of type [RequestCancelExternalWorkflowExecutionInitiated] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  external_workflow_execution_cancel_requested_event_attributes: external_workflow_execution_cancel_requested_event_attributes option;
  (** 
    If the event is of type [ExternalWorkflowExecutionCancelRequested] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  signal_external_workflow_execution_failed_event_attributes: signal_external_workflow_execution_failed_event_attributes option;
  (** 
    If the event is of type [SignalExternalWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  external_workflow_execution_signaled_event_attributes: external_workflow_execution_signaled_event_attributes option;
  (** 
    If the event is of type [ExternalWorkflowExecutionSignaled] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  signal_external_workflow_execution_initiated_event_attributes: signal_external_workflow_execution_initiated_event_attributes option;
  (** 
    If the event is of type [SignalExternalWorkflowExecutionInitiated] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  child_workflow_execution_terminated_event_attributes: child_workflow_execution_terminated_event_attributes option;
  (** 
    If the event is of type [ChildWorkflowExecutionTerminated] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  child_workflow_execution_canceled_event_attributes: child_workflow_execution_canceled_event_attributes option;
  (** 
    If the event is of type [ChildWorkflowExecutionCanceled] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  child_workflow_execution_timed_out_event_attributes: child_workflow_execution_timed_out_event_attributes option;
  (** 
    If the event is of type [ChildWorkflowExecutionTimedOut] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  child_workflow_execution_failed_event_attributes: child_workflow_execution_failed_event_attributes option;
  (** 
    If the event is of type [ChildWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  child_workflow_execution_completed_event_attributes: child_workflow_execution_completed_event_attributes option;
  (** 
    If the event is of type [ChildWorkflowExecutionCompleted] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  child_workflow_execution_started_event_attributes: child_workflow_execution_started_event_attributes option;
  (** 
    If the event is of type [ChildWorkflowExecutionStarted] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  start_child_workflow_execution_initiated_event_attributes: start_child_workflow_execution_initiated_event_attributes option;
  (** 
    If the event is of type [StartChildWorkflowExecutionInitiated] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  timer_canceled_event_attributes: timer_canceled_event_attributes option;
  (** 
    If the event is of type [TimerCanceled] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  timer_fired_event_attributes: timer_fired_event_attributes option;
  (** 
    If the event is of type [TimerFired] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  timer_started_event_attributes: timer_started_event_attributes option;
  (** 
    If the event is of type [TimerStarted] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  record_marker_failed_event_attributes: record_marker_failed_event_attributes option;
  (** 
    If the event is of type [DecisionTaskFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  marker_recorded_event_attributes: marker_recorded_event_attributes option;
  (** 
    If the event is of type [MarkerRecorded] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  workflow_execution_signaled_event_attributes: workflow_execution_signaled_event_attributes option;
  (** 
    If the event is of type [WorkflowExecutionSignaled] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  activity_task_cancel_requested_event_attributes: activity_task_cancel_requested_event_attributes option;
  (** 
    If the event is of type [ActivityTaskcancelRequested] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  activity_task_canceled_event_attributes: activity_task_canceled_event_attributes option;
  (** 
    If the event is of type [ActivityTaskCanceled] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  activity_task_timed_out_event_attributes: activity_task_timed_out_event_attributes option;
  (** 
    If the event is of type [ActivityTaskTimedOut] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  activity_task_failed_event_attributes: activity_task_failed_event_attributes option;
  (** 
    If the event is of type [ActivityTaskFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  activity_task_completed_event_attributes: activity_task_completed_event_attributes option;
  (** 
    If the event is of type [ActivityTaskCompleted] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  activity_task_started_event_attributes: activity_task_started_event_attributes option;
  (** 
    If the event is of type [ActivityTaskStarted] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  activity_task_scheduled_event_attributes: activity_task_scheduled_event_attributes option;
  (** 
    If the event is of type [ActivityTaskScheduled] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  decision_task_timed_out_event_attributes: decision_task_timed_out_event_attributes option;
  (** 
    If the event is of type [DecisionTaskTimedOut] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  decision_task_completed_event_attributes: decision_task_completed_event_attributes option;
  (** 
    If the event is of type [DecisionTaskCompleted] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  decision_task_started_event_attributes: decision_task_started_event_attributes option;
  (** 
    If the event is of type [DecisionTaskStarted] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  decision_task_scheduled_event_attributes: decision_task_scheduled_event_attributes option;
  (** 
    If the event is of type [DecisionTaskScheduled] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  workflow_execution_cancel_requested_event_attributes: workflow_execution_cancel_requested_event_attributes option;
  (** 
    If the event is of type [WorkflowExecutionCancelRequested] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  workflow_execution_terminated_event_attributes: workflow_execution_terminated_event_attributes option;
  (** 
    If the event is of type [WorkflowExecutionTerminated] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  continue_as_new_workflow_execution_failed_event_attributes: continue_as_new_workflow_execution_failed_event_attributes option;
  (** 
    If the event is of type [ContinueAsNewWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  workflow_execution_continued_as_new_event_attributes: workflow_execution_continued_as_new_event_attributes option;
  (** 
    If the event is of type [WorkflowExecutionContinuedAsNew] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  cancel_workflow_execution_failed_event_attributes: cancel_workflow_execution_failed_event_attributes option;
  (** 
    If the event is of type [CancelWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  workflow_execution_canceled_event_attributes: workflow_execution_canceled_event_attributes option;
  (** 
    If the event is of type [WorkflowExecutionCanceled] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  workflow_execution_timed_out_event_attributes: workflow_execution_timed_out_event_attributes option;
  (** 
    If the event is of type [WorkflowExecutionTimedOut] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  fail_workflow_execution_failed_event_attributes: fail_workflow_execution_failed_event_attributes option;
  (** 
    If the event is of type [FailWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  workflow_execution_failed_event_attributes: workflow_execution_failed_event_attributes option;
  (** 
    If the event is of type [WorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  complete_workflow_execution_failed_event_attributes: complete_workflow_execution_failed_event_attributes option;
  (** 
    If the event is of type [CompleteWorkflowExecutionFailed] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  workflow_execution_completed_event_attributes: workflow_execution_completed_event_attributes option;
  (** 
    If the event is of type [WorkflowExecutionCompleted] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  workflow_execution_started_event_attributes: workflow_execution_started_event_attributes option;
  (** 
    If the event is of type [WorkflowExecutionStarted] then this member is set and provides detailed information about the event. It isn't set for other event types.
     *)

  event_id: int;
  (** 
    The system generated ID of the event. This ID uniquely identifies the event with in the workflow execution history.
     *)

  event_type: event_type;
  (** 
    The type of the history event.
     *)

  event_timestamp: float;
  (** 
    The date and time when the event occurred.
     *)

}

(** 
    A structure that represents a decision task. Decision tasks are sent to deciders in order for them to make decisions.
     *)
type decision_task = {
  previous_started_event_id: int option;
  (** 
    The ID of the DecisionTaskStarted event of the previous decision task of this workflow execution that was processed by the decider. This can be used to determine the events in the history new since the last decision task received by the decider.
     *)

  next_page_token: string option;
  (** 
    If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      *)

  events: history_event list;
  (** 
    A paginated list of history events of the workflow execution. The decider uses this during the processing of the decision task.
     *)

  workflow_type: workflow_type;
  (** 
    The type of the workflow execution for which this decision task was created.
     *)

  workflow_execution: workflow_execution;
  (** 
    The workflow execution for which this decision task was created.
     *)

  started_event_id: int;
  (** 
    The ID of the [DecisionTaskStarted] event recorded in the history.
     *)

  task_token: string;
  (** 
    The opaque string used as a handle on the task. This token is used by workers to communicate progress and response information back to the system about the task.
     *)

}

type poll_for_decision_task_input = {
  start_at_previous_started_event: bool option;
  (** 
    When set to [true], returns the events with [eventTimestamp] greater than or equal to [eventTimestamp] of the most recent [DecisionTaskStarted] event. By default, this parameter is set to [false].
     *)

  reverse_order: bool option;
  (** 
    When set to [true], returns the events in reverse order. By default the results are returned in ascending order of the [eventTimestamp] of the events.
     *)

  maximum_page_size: int option;
  (** 
    The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results.
    
     This is an upper limit only; the actual number of results returned per call may be fewer than the specified maximum.
      *)

  next_page_token: string option;
  [@ocaml.doc {| 
    If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: "[Specified token has 
      exceeded its maximum lifetime]".
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
     
      The [nextPageToken] returned by this action cannot be used with [GetWorkflowExecutionHistory] to get the next page. You must call [PollForDecisionTask] again (with the [nextPageToken]) to retrieve the next page of history records. Calling [PollForDecisionTask] with a [nextPageToken] doesn't return a new decision task.
      
       |}]

  identity: string option;
  (** 
    Identity of the decider making the request, which is recorded in the DecisionTaskStarted event in the workflow history. This enables diagnostic tracing when problems arise. The form of this identity is user defined.
     *)

  task_list: task_list;
  (** 
    Specifies the task list to poll for decision tasks.
    
     The specified string must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
      *)

  domain: string;
  (** 
    The name of the domain containing the task lists to poll.
     *)

}

(** 
    Unit of work sent to an activity worker.
     *)
type activity_task = {
  input: string option;
  (** 
    The inputs provided when the activity task was scheduled. The form of the input is user defined and should be meaningful to the activity implementation.
     *)

  activity_type: activity_type;
  (** 
    The type of this activity task.
     *)

  workflow_execution: workflow_execution;
  (** 
    The workflow execution that started this activity task.
     *)

  started_event_id: int;
  (** 
    The ID of the [ActivityTaskStarted] event recorded in the history.
     *)

  activity_id: string;
  (** 
    The unique ID of the task.
     *)

  task_token: string;
  (** 
    The opaque string used as a handle on the task. This token is used by workers to communicate progress and response information back to the system about the task.
     *)

}

type poll_for_activity_task_input = {
  identity: string option;
  (** 
    Identity of the worker making the request, recorded in the [ActivityTaskStarted] event in the workflow history. This enables diagnostic tracing when problems arise. The form of this identity is user defined.
     *)

  task_list: task_list;
  (** 
    Specifies the task list to poll for activity tasks.
    
     The specified string must not start or end with whitespace. It must not contain a [:] (colon), [/] (slash), [|] (vertical bar), or any control characters ([\u0000-\u001f] | [\u007f-\u009f]). Also, it must {i not} be the literal string [arn].
      *)

  domain: string;
  (** 
    The name of the domain that contains the task lists being polled.
     *)

}

type list_workflow_types_input = {
  reverse_order: bool option;
  (** 
    When set to [true], returns the results in reverse order. By default the results are returned in ascending alphabetical order of the [name] of the workflow types.
     *)

  maximum_page_size: int option;
  (** 
    The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results.
     *)

  next_page_token: string option;
  [@ocaml.doc {| 
    If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: "[Specified token has 
      exceeded its maximum lifetime]".
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      |}]

  registration_status: registration_status;
  (** 
    Specifies the registration status of the workflow types to list.
     *)

  name: string option;
  (** 
    If specified, lists the workflow type with this name.
     *)

  domain: string;
  (** 
    The name of the domain in which the workflow types have been registered.
     *)

}

type list_tags_for_resource_output = {
  tags: resource_tag list option;
  (** 
    An array of tags associated with the domain.
     *)

}

type list_tags_for_resource_input = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) for the Amazon SWF domain.
     *)

}

[@@ocaml.doc {| 
    Used to filter the workflow executions in visibility APIs by various time-based rules. Each parameter, if specified, defines a rule that must be satisfied by each returned query result. The parameter values are in the {{:https://en.wikipedia.org/wiki/Unix_time}Unix Time format}. For example: ["oldestDate": 1325376070.]
     |}]
type execution_time_filter = {
  latest_date: float option;
  (** 
    Specifies the latest start or close date and time to return.
     *)

  oldest_date: float;
  (** 
    Specifies the oldest start or close date and time to return.
     *)

}

type list_open_workflow_executions_input = {
  execution_filter: workflow_execution_filter option;
  (** 
    If specified, only workflow executions matching the workflow ID specified in the filter are returned.
    
     [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  reverse_order: bool option;
  (** 
    When set to [true], returns the results in reverse order. By default the results are returned in descending order of the start time of the executions.
     *)

  maximum_page_size: int option;
  (** 
    The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results.
     *)

  next_page_token: string option;
  [@ocaml.doc {| 
    If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: "[Specified token has 
      exceeded its maximum lifetime]".
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      |}]

  tag_filter: tag_filter option;
  (** 
    If specified, only executions that have the matching tag are listed.
    
     [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  type_filter: workflow_type_filter option;
  (** 
    If specified, only executions of the type specified in the filter are returned.
    
     [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  start_time_filter: execution_time_filter;
  (** 
    Workflow executions are included in the returned results based on whether their start times are within the range specified by this filter.
     *)

  domain: string;
  (** 
    The name of the domain that contains the workflow executions to list.
     *)

}

(** 
    Contains general information about a domain.
     *)
type domain_info = {
  arn: string option;
  (** 
    The ARN of the domain.
     *)

  description: string option;
  (** 
    The description of the domain provided through [RegisterDomain].
     *)

  status: registration_status;
  (** 
    The status of the domain:
    
     {ul
          {- [REGISTERED] – The domain is properly registered and available. You can use this domain for registering types and creating new workflow executions.
             
             }
           {- [DEPRECATED] – The domain was deprecated using [DeprecateDomain], but is still in use. You should not create new workflow executions in this domain.
              
              }
          
      }
       *)

  name: string;
  (** 
    The name of the domain. This name is unique within the account.
     *)

}

(** 
    Contains a paginated collection of DomainInfo structures.
     *)
type domain_infos = {
  next_page_token: string option;
  (** 
    If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      *)

  domain_infos: domain_info list;
  (** 
    A list of DomainInfo structures.
     *)

}

type list_domains_input = {
  reverse_order: bool option;
  (** 
    When set to [true], returns the results in reverse order. By default, the results are returned in ascending alphabetical order by [name] of the domains.
     *)

  maximum_page_size: int option;
  (** 
    The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results.
     *)

  registration_status: registration_status;
  (** 
    Specifies the registration status of the domains to list.
     *)

  next_page_token: string option;
  [@ocaml.doc {| 
    If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: "[Specified token has 
      exceeded its maximum lifetime]".
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      |}]

}

(** 
    Used to filter the closed workflow executions in visibility APIs by their close status.
     *)
type close_status_filter = {
  status: close_status;
  (** 
    The close status that must match the close status of an execution for it to meet the criteria of this filter.
     *)

}

type list_closed_workflow_executions_input = {
  reverse_order: bool option;
  (** 
    When set to [true], returns the results in reverse order. By default the results are returned in descending order of the start or the close time of the executions.
     *)

  maximum_page_size: int option;
  (** 
    The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results.
     *)

  next_page_token: string option;
  [@ocaml.doc {| 
    If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: "[Specified token has 
      exceeded its maximum lifetime]".
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      |}]

  tag_filter: tag_filter option;
  (** 
    If specified, only executions that have the matching tag are listed.
    
     [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  type_filter: workflow_type_filter option;
  (** 
    If specified, only executions of the type specified in the filter are returned.
    
     [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  close_status_filter: close_status_filter option;
  (** 
    If specified, only workflow executions that match this {i close status} are listed. For example, if TERMINATED is specified, then only TERMINATED workflow executions are listed.
    
     [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  execution_filter: workflow_execution_filter option;
  (** 
    If specified, only workflow executions matching the workflow ID specified in the filter are returned.
    
     [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  close_time_filter: execution_time_filter option;
  (** 
    If specified, the workflow executions are included in the returned results based on whether their close times are within the range specified by this filter. Also, if this parameter is specified, the returned results are ordered by their close times.
    
     [startTimeFilter] and [closeTimeFilter] are mutually exclusive. You must specify one of these in a request but not both.
     
      *)

  start_time_filter: execution_time_filter option;
  (** 
    If specified, the workflow executions are included in the returned results based on whether their start times are within the range specified by this filter. Also, if this parameter is specified, the returned results are ordered by their start times.
    
     [startTimeFilter] and [closeTimeFilter] are mutually exclusive. You must specify one of these in a request but not both.
     
      *)

  domain: string;
  (** 
    The name of the domain that contains the workflow executions to list.
     *)

}

(** 
    Detailed information about an activity type.
     *)
type activity_type_info = {
  deprecation_date: float option;
  (** 
    If DEPRECATED, the date and time [DeprecateActivityType] was called.
     *)

  creation_date: float;
  (** 
    The date and time this activity type was created through [RegisterActivityType].
     *)

  description: string option;
  (** 
    The description of the activity type provided in [RegisterActivityType].
     *)

  status: registration_status;
  (** 
    The current status of the activity type.
     *)

  activity_type: activity_type;
  (** 
    The [ActivityType] type structure representing the activity type.
     *)

}

(** 
    Contains a paginated list of activity type information structures.
     *)
type activity_type_infos = {
  next_page_token: string option;
  (** 
    If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      *)

  type_infos: activity_type_info list;
  (** 
    List of activity type information.
     *)

}

type list_activity_types_input = {
  reverse_order: bool option;
  (** 
    When set to [true], returns the results in reverse order. By default, the results are returned in ascending alphabetical order by [name] of the activity types.
     *)

  maximum_page_size: int option;
  (** 
    The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results.
     *)

  next_page_token: string option;
  [@ocaml.doc {| 
    If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: "[Specified token has 
      exceeded its maximum lifetime]".
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      |}]

  registration_status: registration_status;
  (** 
    Specifies the registration status of the activity types to list.
     *)

  name: string option;
  (** 
    If specified, only lists the activity types that have this name.
     *)

  domain: string;
  (** 
    The name of the domain in which the activity types have been registered.
     *)

}

(** 
    Paginated representation of a workflow history for a workflow execution. This is the up to date, complete and authoritative record of the events related to all tasks and events in the life of the workflow execution.
     *)
type history = {
  next_page_token: string option;
  (** 
    If a [NextPageToken] was returned by a previous call, there are more results available. To retrieve the next page of results, make the call again using the returned token in [nextPageToken]. Keep all other arguments unchanged.
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      *)

  events: history_event list;
  (** 
    The list of history events.
     *)

}

type get_workflow_execution_history_input = {
  reverse_order: bool option;
  (** 
    When set to [true], returns the events in reverse order. By default the results are returned in ascending order of the [eventTimeStamp] of the events.
     *)

  maximum_page_size: int option;
  (** 
    The maximum number of results that are returned per call. Use [nextPageToken] to obtain further pages of results.
     *)

  next_page_token: string option;
  [@ocaml.doc {| 
    If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return a [400] error: "[Specified token has 
      exceeded its maximum lifetime]".
    
     The configured [maximumPageSize] determines how many results can be returned in a single call.
      |}]

  execution: workflow_execution;
  (** 
    Specifies the workflow execution for which to return the history.
     *)

  domain: string;
  (** 
    The name of the domain containing the workflow execution.
     *)

}

type describe_workflow_type_input = {
  workflow_type: workflow_type;
  (** 
    The workflow type to describe.
     *)

  domain: string;
  (** 
    The name of the domain in which this workflow type is registered.
     *)

}

type describe_workflow_execution_input = {
  execution: workflow_execution;
  (** 
    The workflow execution to describe.
     *)

  domain: string;
  (** 
    The name of the domain containing the workflow execution.
     *)

}

(** 
    Contains the configuration settings of a domain.
     *)
type domain_configuration = {
  workflow_execution_retention_period_in_days: string;
  (** 
    The retention period for workflow executions in this domain.
     *)

}

(** 
    Contains details of a domain.
     *)
type domain_detail = {
  configuration: domain_configuration;
  (** 
    The domain configuration. Currently, this includes only the domain's retention period.
     *)

  domain_info: domain_info;
  (** 
    The basic information about a domain, such as its name, status, and description.
     *)

}

type describe_domain_input = {
  name: string;
  (** 
    The name of the domain to describe.
     *)

}

(** 
    Configuration settings registered with the activity type.
     *)
type activity_type_configuration = {
  default_task_schedule_to_close_timeout: string option;
  (** 
    The default maximum duration, specified when registering the activity type, for tasks of this activity type. You can override this default when scheduling a task through the [ScheduleActivityTask] [Decision].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  default_task_schedule_to_start_timeout: string option;
  (** 
    The default maximum duration, specified when registering the activity type, that a task of an activity type can wait before being assigned to a worker. You can override this default when scheduling a task through the [ScheduleActivityTask] [Decision].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

  default_task_priority: string option;
  (** 
    The default task priority for tasks of this activity type, specified at registration. If not set, then [0] is used as the default priority. This default can be overridden when scheduling an activity task.
    
     Valid values are integers that range from Java's [Integer.MIN_VALUE] (-2147483648) to [Integer.MAX_VALUE] (2147483647). Higher numbers indicate higher priority.
     
      For more information about setting task priority, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html}Setting Task Priority} in the {i Amazon SWF Developer Guide}.
       *)

  default_task_list: task_list option;
  (** 
    The default task list specified for this activity type at registration. This default is used if a task list isn't provided when a task is scheduled through the [ScheduleActivityTask] [Decision]. You can override the default registered task list when scheduling a task through the [ScheduleActivityTask] [Decision].
     *)

  default_task_heartbeat_timeout: string option;
  (** 
    The default maximum time, in seconds, before which a worker processing a task must report progress by calling [RecordActivityTaskHeartbeat].
    
     You can specify this value only when {i registering} an activity type. The registered default value can be overridden when you schedule a task through the [ScheduleActivityTask] [Decision]. If the activity worker subsequently attempts to record a heartbeat or returns a result, the activity worker receives an [UnknownResource] fault. In this case, Amazon SWF no longer considers the activity task to be valid; the activity worker should clean up the activity task.
     
      The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
       *)

  default_task_start_to_close_timeout: string option;
  (** 
    The default maximum duration for tasks of an activity type specified when registering the activity type. You can override this default when scheduling a task through the [ScheduleActivityTask] [Decision].
    
     The duration is specified in seconds, an integer greater than or equal to [0]. You can use [NONE] to specify unlimited duration.
      *)

}

(** 
    Detailed information about an activity type.
     *)
type activity_type_detail = {
  configuration: activity_type_configuration;
  (** 
    The configuration settings registered with the activity type.
     *)

  type_info: activity_type_info;
  (** 
    General information about the activity type.
    
     The status of activity type (returned in the ActivityTypeInfo structure) can be one of the following.
     
      {ul
           {- [REGISTERED] – The type is registered and available. Workers supporting this type should be running.
              
              }
            {- [DEPRECATED] – The type was deprecated using [DeprecateActivityType], but is still in use. You should keep workers supporting this type running. You cannot create new tasks of this type.
               
               }
           
      }
       *)

}

type describe_activity_type_input = {
  activity_type: activity_type;
  (** 
    The activity type to get information about. Activity types are identified by the [name] and [version] that were supplied when the activity was registered.
     *)

  domain: string;
  (** 
    The name of the domain in which the activity type is registered.
     *)

}

type deprecate_workflow_type_input = {
  workflow_type: workflow_type;
  (** 
    The workflow type to deprecate.
     *)

  domain: string;
  (** 
    The name of the domain in which the workflow type is registered.
     *)

}

(** 
    Returned when the specified domain has been deprecated.
     *)
type domain_deprecated_fault = {
  message: string option;
  (** 
    A description that may help with diagnosing the cause of the fault.
     *)

}

type deprecate_domain_input = {
  name: string;
  (** 
    The name of the domain to deprecate.
     *)

}

type deprecate_activity_type_input = {
  activity_type: activity_type;
  (** 
    The activity type to deprecate.
     *)

  domain: string;
  (** 
    The name of the domain in which the activity type is registered.
     *)

}

type delete_workflow_type_input = {
  workflow_type: workflow_type;
  (** 
    The workflow type to delete.
     *)

  domain: string;
  (** 
    The name of the domain in which the workflow type is registered.
     *)

}

type delete_activity_type_input = {
  activity_type: activity_type;
  (** 
    The activity type to delete.
     *)

  domain: string;
  (** 
    The name of the domain in which the activity type is registered.
     *)

}

(** 
    Contains the count of tasks in a task list.
     *)
type pending_task_count = {
  truncated: bool option;
  (** 
    If set to true, indicates that the actual count was more than the maximum supported by this API and the count returned is the truncated value.
     *)

  count: int;
  (** 
    The number of tasks in the task list.
     *)

}

type count_pending_decision_tasks_input = {
  task_list: task_list;
  (** 
    The name of the task list.
     *)

  domain: string;
  (** 
    The name of the domain that contains the task list.
     *)

}

type count_pending_activity_tasks_input = {
  task_list: task_list;
  (** 
    The name of the task list.
     *)

  domain: string;
  (** 
    The name of the domain that contains the task list.
     *)

}

type count_open_workflow_executions_input = {
  execution_filter: workflow_execution_filter option;
  (** 
    If specified, only workflow executions matching the [WorkflowId] in the filter are counted.
    
     [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  tag_filter: tag_filter option;
  (** 
    If specified, only executions that have a tag that matches the filter are counted.
    
     [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  type_filter: workflow_type_filter option;
  (** 
    Specifies the type of the workflow executions to be counted.
    
     [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  start_time_filter: execution_time_filter;
  (** 
    Specifies the start time criteria that workflow executions must meet in order to be counted.
     *)

  domain: string;
  (** 
    The name of the domain containing the workflow executions to count.
     *)

}

type count_closed_workflow_executions_input = {
  close_status_filter: close_status_filter option;
  (** 
    If specified, only workflow executions that match this close status are counted. This filter has an affect only if [executionStatus] is specified as [CLOSED].
    
     [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  tag_filter: tag_filter option;
  (** 
    If specified, only executions that have a tag that matches the filter are counted.
    
     [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  type_filter: workflow_type_filter option;
  (** 
    If specified, indicates the type of the workflow executions to be counted.
    
     [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  execution_filter: workflow_execution_filter option;
  (** 
    If specified, only workflow executions matching the [WorkflowId] in the filter are counted.
    
     [closeStatusFilter], [executionFilter], [typeFilter] and [tagFilter] are mutually exclusive. You can specify at most one of these in a request.
     
      *)

  close_time_filter: execution_time_filter option;
  (** 
    If specified, only workflow executions that meet the close time criteria of the filter are counted.
    
     [startTimeFilter] and [closeTimeFilter] are mutually exclusive. You must specify one of these in a request but not both.
     
      *)

  start_time_filter: execution_time_filter option;
  (** 
    If specified, only workflow executions that meet the start time criteria of the filter are counted.
    
     [startTimeFilter] and [closeTimeFilter] are mutually exclusive. You must specify one of these in a request but not both.
     
      *)

  domain: string;
  (** 
    The name of the domain containing the workflow executions to count.
     *)

}

(** 
    Amazon Simple Workflow Service The Amazon Simple Workflow Service (Amazon SWF) makes it easy to build applications that use Amazon's cloud to coordinate work across distributed components. In Amazon SWF, a {i task} represents a logical unit of work that is performed by a component of your workflow. Coordinating tasks in a workflow involves managing intertask dependencies, scheduling, and concurrency in accordance with the logical flow of the application.
                                   
                                    Amazon SWF gives you full control over implementing tasks and coordinating them without worrying about underlying complexities such as tracking their progress and maintaining their state.
                                    
                                     This documentation serves as reference only. For a broader overview of the Amazon SWF programming model, see the {i {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/}Amazon SWF Developer Guide}}.
                                      *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_workflow_type : version:string -> name:string -> unit
-> workflow_type
(** Create a {!type-workflow_type} type *)

val make_workflow_type_info :
  ?deprecation_date:float ->
  ?description:string ->
  creation_date:float ->
  status:registration_status ->
  workflow_type:workflow_type ->
  unit
-> workflow_type_info
(** Create a {!type-workflow_type_info} type *)

val make_workflow_type_infos :
  ?next_page_token:string -> type_infos:workflow_type_info list -> unit
-> workflow_type_infos
(** Create a {!type-workflow_type_infos} type *)

val make_workflow_type_filter : ?version:string -> name:string -> unit
-> workflow_type_filter
(** Create a {!type-workflow_type_filter} type *)

val make_task_list : name:string -> unit
-> task_list
(** Create a {!type-task_list} type *)

val make_workflow_type_configuration :
  ?default_lambda_role:string ->
  ?default_child_policy:child_policy ->
  ?default_task_priority:string ->
  ?default_task_list:task_list ->
  ?default_execution_start_to_close_timeout:string ->
  ?default_task_start_to_close_timeout:string ->
  unit
-> workflow_type_configuration
(** Create a {!type-workflow_type_configuration} type *)

val make_workflow_type_detail :
  configuration:workflow_type_configuration ->
  type_info:workflow_type_info ->
  unit
-> workflow_type_detail
(** Create a {!type-workflow_type_detail} type *)

val make_workflow_execution_timed_out_event_attributes :
  child_policy:child_policy ->
  timeout_type:workflow_execution_timeout_type ->
  unit
-> workflow_execution_timed_out_event_attributes
(** Create a {!type-workflow_execution_timed_out_event_attributes} type *)

val make_workflow_execution_terminated_event_attributes :
  ?cause:workflow_execution_terminated_cause ->
  ?details:string ->
  ?reason:string ->
  child_policy:child_policy ->
  unit
-> workflow_execution_terminated_event_attributes
(** Create a {!type-workflow_execution_terminated_event_attributes} type *)

val make_workflow_execution : run_id:string -> workflow_id:string -> unit
-> workflow_execution
(** Create a {!type-workflow_execution} type *)

val make_workflow_execution_started_event_attributes :
  ?lambda_role:string ->
  ?parent_initiated_event_id:int ->
  ?parent_workflow_execution:workflow_execution ->
  ?continued_execution_run_id:string ->
  ?tag_list:string list ->
  ?task_priority:string ->
  ?task_start_to_close_timeout:string ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  workflow_type:workflow_type ->
  task_list:task_list ->
  child_policy:child_policy ->
  unit
-> workflow_execution_started_event_attributes
(** Create a {!type-workflow_execution_started_event_attributes} type *)

val make_workflow_execution_signaled_event_attributes :
  ?external_initiated_event_id:int ->
  ?external_workflow_execution:workflow_execution ->
  ?input:string ->
  signal_name:string ->
  unit
-> workflow_execution_signaled_event_attributes
(** Create a {!type-workflow_execution_signaled_event_attributes} type *)

val make_workflow_execution_open_counts :
  ?open_lambda_functions:int ->
  open_child_workflow_executions:int ->
  open_timers:int ->
  open_decision_tasks:int ->
  open_activity_tasks:int ->
  unit
-> workflow_execution_open_counts
(** Create a {!type-workflow_execution_open_counts} type *)

val make_workflow_execution_info :
  ?cancel_requested:bool ->
  ?tag_list:string list ->
  ?parent:workflow_execution ->
  ?close_status:close_status ->
  ?close_timestamp:float ->
  execution_status:execution_status ->
  start_timestamp:float ->
  workflow_type:workflow_type ->
  execution:workflow_execution ->
  unit
-> workflow_execution_info
(** Create a {!type-workflow_execution_info} type *)

val make_workflow_execution_infos :
  ?next_page_token:string ->
  execution_infos:workflow_execution_info list ->
  unit
-> workflow_execution_infos
(** Create a {!type-workflow_execution_infos} type *)

val make_workflow_execution_filter : workflow_id:string -> unit
-> workflow_execution_filter
(** Create a {!type-workflow_execution_filter} type *)

val make_workflow_execution_failed_event_attributes :
  ?details:string ->
  ?reason:string ->
  decision_task_completed_event_id:int ->
  unit
-> workflow_execution_failed_event_attributes
(** Create a {!type-workflow_execution_failed_event_attributes} type *)

val make_workflow_execution_configuration :
  ?lambda_role:string ->
  ?task_priority:string ->
  child_policy:child_policy ->
  task_list:task_list ->
  execution_start_to_close_timeout:string ->
  task_start_to_close_timeout:string ->
  unit
-> workflow_execution_configuration
(** Create a {!type-workflow_execution_configuration} type *)

val make_workflow_execution_detail :
  ?latest_execution_context:string ->
  ?latest_activity_task_timestamp:float ->
  open_counts:workflow_execution_open_counts ->
  execution_configuration:workflow_execution_configuration ->
  execution_info:workflow_execution_info ->
  unit
-> workflow_execution_detail
(** Create a {!type-workflow_execution_detail} type *)

val make_workflow_execution_count : ?truncated:bool -> count:int -> unit
-> workflow_execution_count
(** Create a {!type-workflow_execution_count} type *)

val make_workflow_execution_continued_as_new_event_attributes :
  ?lambda_role:string ->
  ?tag_list:string list ->
  ?task_start_to_close_timeout:string ->
  ?task_priority:string ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  workflow_type:workflow_type ->
  child_policy:child_policy ->
  task_list:task_list ->
  new_execution_run_id:string ->
  decision_task_completed_event_id:int ->
  unit
-> workflow_execution_continued_as_new_event_attributes
(** Create a {!type-workflow_execution_continued_as_new_event_attributes} type *)

val make_workflow_execution_completed_event_attributes :
  ?result:string -> decision_task_completed_event_id:int -> unit
-> workflow_execution_completed_event_attributes
(** Create a {!type-workflow_execution_completed_event_attributes} type *)

val make_workflow_execution_canceled_event_attributes :
  ?details:string -> decision_task_completed_event_id:int -> unit
-> workflow_execution_canceled_event_attributes
(** Create a {!type-workflow_execution_canceled_event_attributes} type *)

val make_workflow_execution_cancel_requested_event_attributes :
  ?cause:workflow_execution_cancel_requested_cause ->
  ?external_initiated_event_id:int ->
  ?external_workflow_execution:workflow_execution ->
  unit
-> workflow_execution_cancel_requested_event_attributes
(** Create a {!type-workflow_execution_cancel_requested_event_attributes} type *)

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input
(** Create a {!type-untag_resource_input} type *)

val make_undeprecate_workflow_type_input :
  workflow_type:workflow_type -> domain:string -> unit
-> undeprecate_workflow_type_input
(** Create a {!type-undeprecate_workflow_type_input} type *)

val make_undeprecate_domain_input : name:string -> unit
-> undeprecate_domain_input
(** Create a {!type-undeprecate_domain_input} type *)

val make_activity_type : version:string -> name:string -> unit
-> activity_type
(** Create a {!type-activity_type} type *)

val make_undeprecate_activity_type_input :
  activity_type:activity_type -> domain:string -> unit
-> undeprecate_activity_type_input
(** Create a {!type-undeprecate_activity_type_input} type *)

val make_timer_started_event_attributes :
  ?control:string ->
  decision_task_completed_event_id:int ->
  start_to_fire_timeout:string ->
  timer_id:string ->
  unit
-> timer_started_event_attributes
(** Create a {!type-timer_started_event_attributes} type *)

val make_timer_fired_event_attributes :
  started_event_id:int -> timer_id:string -> unit
-> timer_fired_event_attributes
(** Create a {!type-timer_fired_event_attributes} type *)

val make_timer_canceled_event_attributes :
  decision_task_completed_event_id:int ->
  started_event_id:int ->
  timer_id:string ->
  unit
-> timer_canceled_event_attributes
(** Create a {!type-timer_canceled_event_attributes} type *)

val make_terminate_workflow_execution_input :
  ?child_policy:child_policy ->
  ?details:string ->
  ?reason:string ->
  ?run_id:string ->
  workflow_id:string ->
  domain:string ->
  unit
-> terminate_workflow_execution_input
(** Create a {!type-terminate_workflow_execution_input} type *)

val make_resource_tag : ?value:string -> key:string -> unit
-> resource_tag
(** Create a {!type-resource_tag} type *)

val make_tag_resource_input :
  tags:resource_tag list -> resource_arn:string -> unit
-> tag_resource_input
(** Create a {!type-tag_resource_input} type *)

val make_tag_filter : tag:string -> unit
-> tag_filter
(** Create a {!type-tag_filter} type *)

val make_start_workflow_execution_input :
  ?lambda_role:string ->
  ?child_policy:child_policy ->
  ?task_start_to_close_timeout:string ->
  ?tag_list:string list ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  ?task_priority:string ->
  ?task_list:task_list ->
  workflow_type:workflow_type ->
  workflow_id:string ->
  domain:string ->
  unit
-> start_workflow_execution_input
(** Create a {!type-start_workflow_execution_input} type *)

val make_run : ?run_id:string -> unit
-> run
(** Create a {!type-run} type *)

val make_start_timer_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:start_timer_failed_cause ->
  timer_id:string ->
  unit
-> start_timer_failed_event_attributes
(** Create a {!type-start_timer_failed_event_attributes} type *)

val make_start_timer_decision_attributes :
  ?control:string -> start_to_fire_timeout:string -> timer_id:string -> unit
-> start_timer_decision_attributes
(** Create a {!type-start_timer_decision_attributes} type *)

val make_start_lambda_function_failed_event_attributes :
  ?message:string ->
  ?cause:start_lambda_function_failed_cause ->
  ?scheduled_event_id:int ->
  unit
-> start_lambda_function_failed_event_attributes
(** Create a {!type-start_lambda_function_failed_event_attributes} type *)

val make_start_child_workflow_execution_initiated_event_attributes :
  ?lambda_role:string ->
  ?tag_list:string list ->
  ?task_start_to_close_timeout:string ->
  ?task_priority:string ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  ?control:string ->
  child_policy:child_policy ->
  decision_task_completed_event_id:int ->
  task_list:task_list ->
  workflow_type:workflow_type ->
  workflow_id:string ->
  unit
-> start_child_workflow_execution_initiated_event_attributes
(** Create a {!type-start_child_workflow_execution_initiated_event_attributes} type *)

val make_start_child_workflow_execution_failed_event_attributes :
  ?control:string ->
  decision_task_completed_event_id:int ->
  initiated_event_id:int ->
  workflow_id:string ->
  cause:start_child_workflow_execution_failed_cause ->
  workflow_type:workflow_type ->
  unit
-> start_child_workflow_execution_failed_event_attributes
(** Create a {!type-start_child_workflow_execution_failed_event_attributes} type *)

val make_start_child_workflow_execution_decision_attributes :
  ?lambda_role:string ->
  ?tag_list:string list ->
  ?child_policy:child_policy ->
  ?task_start_to_close_timeout:string ->
  ?task_priority:string ->
  ?task_list:task_list ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  ?control:string ->
  workflow_id:string ->
  workflow_type:workflow_type ->
  unit
-> start_child_workflow_execution_decision_attributes
(** Create a {!type-start_child_workflow_execution_decision_attributes} type *)

val make_signal_workflow_execution_input :
  ?input:string ->
  ?run_id:string ->
  signal_name:string ->
  workflow_id:string ->
  domain:string ->
  unit
-> signal_workflow_execution_input
(** Create a {!type-signal_workflow_execution_input} type *)

val make_schedule_activity_task_decision_attributes :
  ?heartbeat_timeout:string ->
  ?start_to_close_timeout:string ->
  ?schedule_to_start_timeout:string ->
  ?task_priority:string ->
  ?task_list:task_list ->
  ?schedule_to_close_timeout:string ->
  ?input:string ->
  ?control:string ->
  activity_id:string ->
  activity_type:activity_type ->
  unit
-> schedule_activity_task_decision_attributes
(** Create a {!type-schedule_activity_task_decision_attributes} type *)

val make_request_cancel_activity_task_decision_attributes :
  activity_id:string -> unit
-> request_cancel_activity_task_decision_attributes
(** Create a {!type-request_cancel_activity_task_decision_attributes} type *)

val make_complete_workflow_execution_decision_attributes :
  ?result:string -> unit
-> complete_workflow_execution_decision_attributes
(** Create a {!type-complete_workflow_execution_decision_attributes} type *)

val make_fail_workflow_execution_decision_attributes :
  ?details:string -> ?reason:string -> unit
-> fail_workflow_execution_decision_attributes
(** Create a {!type-fail_workflow_execution_decision_attributes} type *)

val make_cancel_workflow_execution_decision_attributes :
  ?details:string -> unit
-> cancel_workflow_execution_decision_attributes
(** Create a {!type-cancel_workflow_execution_decision_attributes} type *)

val make_continue_as_new_workflow_execution_decision_attributes :
  ?lambda_role:string ->
  ?workflow_type_version:string ->
  ?tag_list:string list ->
  ?child_policy:child_policy ->
  ?task_start_to_close_timeout:string ->
  ?task_priority:string ->
  ?task_list:task_list ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  unit
-> continue_as_new_workflow_execution_decision_attributes
(** Create a {!type-continue_as_new_workflow_execution_decision_attributes} type *)

val make_record_marker_decision_attributes :
  ?details:string -> marker_name:string -> unit
-> record_marker_decision_attributes
(** Create a {!type-record_marker_decision_attributes} type *)

val make_cancel_timer_decision_attributes : timer_id:string -> unit
-> cancel_timer_decision_attributes
(** Create a {!type-cancel_timer_decision_attributes} type *)

val make_signal_external_workflow_execution_decision_attributes :
  ?control:string ->
  ?input:string ->
  ?run_id:string ->
  signal_name:string ->
  workflow_id:string ->
  unit
-> signal_external_workflow_execution_decision_attributes
(** Create a {!type-signal_external_workflow_execution_decision_attributes} type *)

val make_request_cancel_external_workflow_execution_decision_attributes :
  ?control:string -> ?run_id:string -> workflow_id:string -> unit
-> request_cancel_external_workflow_execution_decision_attributes
(** Create a {!type-request_cancel_external_workflow_execution_decision_attributes} type *)

val make_schedule_lambda_function_decision_attributes :
  ?start_to_close_timeout:string ->
  ?input:string ->
  ?control:string ->
  name:string ->
  id:string ->
  unit
-> schedule_lambda_function_decision_attributes
(** Create a {!type-schedule_lambda_function_decision_attributes} type *)

val make_decision :
  ?schedule_lambda_function_decision_attributes:schedule_lambda_function_decision_attributes ->
  ?start_child_workflow_execution_decision_attributes:start_child_workflow_execution_decision_attributes ->
  ?request_cancel_external_workflow_execution_decision_attributes:request_cancel_external_workflow_execution_decision_attributes ->
  ?signal_external_workflow_execution_decision_attributes:signal_external_workflow_execution_decision_attributes ->
  ?cancel_timer_decision_attributes:cancel_timer_decision_attributes ->
  ?start_timer_decision_attributes:start_timer_decision_attributes ->
  ?record_marker_decision_attributes:record_marker_decision_attributes ->
  ?continue_as_new_workflow_execution_decision_attributes:continue_as_new_workflow_execution_decision_attributes ->
  ?cancel_workflow_execution_decision_attributes:cancel_workflow_execution_decision_attributes ->
  ?fail_workflow_execution_decision_attributes:fail_workflow_execution_decision_attributes ->
  ?complete_workflow_execution_decision_attributes:complete_workflow_execution_decision_attributes ->
  ?request_cancel_activity_task_decision_attributes:request_cancel_activity_task_decision_attributes ->
  ?schedule_activity_task_decision_attributes:schedule_activity_task_decision_attributes ->
  decision_type:decision_type ->
  unit
-> decision
(** Create a {!type-decision} type *)

val make_respond_decision_task_completed_input :
  ?task_list_schedule_to_start_timeout:string ->
  ?task_list:task_list ->
  ?execution_context:string ->
  ?decisions:decision list ->
  task_token:string ->
  unit
-> respond_decision_task_completed_input
(** Create a {!type-respond_decision_task_completed_input} type *)

val make_respond_activity_task_failed_input :
  ?details:string -> ?reason:string -> task_token:string -> unit
-> respond_activity_task_failed_input
(** Create a {!type-respond_activity_task_failed_input} type *)

val make_respond_activity_task_completed_input :
  ?result:string -> task_token:string -> unit
-> respond_activity_task_completed_input
(** Create a {!type-respond_activity_task_completed_input} type *)

val make_respond_activity_task_canceled_input :
  ?details:string -> task_token:string -> unit
-> respond_activity_task_canceled_input
(** Create a {!type-respond_activity_task_canceled_input} type *)

val make_request_cancel_workflow_execution_input :
  ?run_id:string -> workflow_id:string -> domain:string -> unit
-> request_cancel_workflow_execution_input
(** Create a {!type-request_cancel_workflow_execution_input} type *)

val make_register_workflow_type_input :
  ?default_lambda_role:string ->
  ?default_child_policy:child_policy ->
  ?default_task_priority:string ->
  ?default_task_list:task_list ->
  ?default_execution_start_to_close_timeout:string ->
  ?default_task_start_to_close_timeout:string ->
  ?description:string ->
  version:string ->
  name:string ->
  domain:string ->
  unit
-> register_workflow_type_input
(** Create a {!type-register_workflow_type_input} type *)

val make_register_domain_input :
  ?tags:resource_tag list ->
  ?description:string ->
  workflow_execution_retention_period_in_days:string ->
  name:string ->
  unit
-> register_domain_input
(** Create a {!type-register_domain_input} type *)

val make_register_activity_type_input :
  ?default_task_schedule_to_close_timeout:string ->
  ?default_task_schedule_to_start_timeout:string ->
  ?default_task_priority:string ->
  ?default_task_list:task_list ->
  ?default_task_heartbeat_timeout:string ->
  ?default_task_start_to_close_timeout:string ->
  ?description:string ->
  version:string ->
  name:string ->
  domain:string ->
  unit
-> register_activity_type_input
(** Create a {!type-register_activity_type_input} type *)

val make_activity_task_status : cancel_requested:bool -> unit
-> activity_task_status
(** Create a {!type-activity_task_status} type *)

val make_record_activity_task_heartbeat_input :
  ?details:string -> task_token:string -> unit
-> record_activity_task_heartbeat_input
(** Create a {!type-record_activity_task_heartbeat_input} type *)

val make_complete_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:complete_workflow_execution_failed_cause ->
  unit
-> complete_workflow_execution_failed_event_attributes
(** Create a {!type-complete_workflow_execution_failed_event_attributes} type *)

val make_fail_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:fail_workflow_execution_failed_cause ->
  unit
-> fail_workflow_execution_failed_event_attributes
(** Create a {!type-fail_workflow_execution_failed_event_attributes} type *)

val make_cancel_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:cancel_workflow_execution_failed_cause ->
  unit
-> cancel_workflow_execution_failed_event_attributes
(** Create a {!type-cancel_workflow_execution_failed_event_attributes} type *)

val make_continue_as_new_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:continue_as_new_workflow_execution_failed_cause ->
  unit
-> continue_as_new_workflow_execution_failed_event_attributes
(** Create a {!type-continue_as_new_workflow_execution_failed_event_attributes} type *)

val make_decision_task_scheduled_event_attributes :
  ?schedule_to_start_timeout:string ->
  ?start_to_close_timeout:string ->
  ?task_priority:string ->
  task_list:task_list ->
  unit
-> decision_task_scheduled_event_attributes
(** Create a {!type-decision_task_scheduled_event_attributes} type *)

val make_decision_task_started_event_attributes :
  ?identity:string -> scheduled_event_id:int -> unit
-> decision_task_started_event_attributes
(** Create a {!type-decision_task_started_event_attributes} type *)

val make_decision_task_completed_event_attributes :
  ?task_list_schedule_to_start_timeout:string ->
  ?task_list:task_list ->
  ?execution_context:string ->
  started_event_id:int ->
  scheduled_event_id:int ->
  unit
-> decision_task_completed_event_attributes
(** Create a {!type-decision_task_completed_event_attributes} type *)

val make_decision_task_timed_out_event_attributes :
  started_event_id:int ->
  scheduled_event_id:int ->
  timeout_type:decision_task_timeout_type ->
  unit
-> decision_task_timed_out_event_attributes
(** Create a {!type-decision_task_timed_out_event_attributes} type *)

val make_activity_task_scheduled_event_attributes :
  ?heartbeat_timeout:string ->
  ?task_priority:string ->
  ?start_to_close_timeout:string ->
  ?schedule_to_close_timeout:string ->
  ?schedule_to_start_timeout:string ->
  ?control:string ->
  ?input:string ->
  decision_task_completed_event_id:int ->
  task_list:task_list ->
  activity_id:string ->
  activity_type:activity_type ->
  unit
-> activity_task_scheduled_event_attributes
(** Create a {!type-activity_task_scheduled_event_attributes} type *)

val make_activity_task_started_event_attributes :
  ?identity:string -> scheduled_event_id:int -> unit
-> activity_task_started_event_attributes
(** Create a {!type-activity_task_started_event_attributes} type *)

val make_activity_task_completed_event_attributes :
  ?result:string -> started_event_id:int -> scheduled_event_id:int -> unit
-> activity_task_completed_event_attributes
(** Create a {!type-activity_task_completed_event_attributes} type *)

val make_activity_task_failed_event_attributes :
  ?details:string ->
  ?reason:string ->
  started_event_id:int ->
  scheduled_event_id:int ->
  unit
-> activity_task_failed_event_attributes
(** Create a {!type-activity_task_failed_event_attributes} type *)

val make_activity_task_timed_out_event_attributes :
  ?details:string ->
  started_event_id:int ->
  scheduled_event_id:int ->
  timeout_type:activity_task_timeout_type ->
  unit
-> activity_task_timed_out_event_attributes
(** Create a {!type-activity_task_timed_out_event_attributes} type *)

val make_activity_task_canceled_event_attributes :
  ?latest_cancel_requested_event_id:int ->
  ?details:string ->
  started_event_id:int ->
  scheduled_event_id:int ->
  unit
-> activity_task_canceled_event_attributes
(** Create a {!type-activity_task_canceled_event_attributes} type *)

val make_activity_task_cancel_requested_event_attributes :
  activity_id:string -> decision_task_completed_event_id:int -> unit
-> activity_task_cancel_requested_event_attributes
(** Create a {!type-activity_task_cancel_requested_event_attributes} type *)

val make_marker_recorded_event_attributes :
  ?details:string ->
  decision_task_completed_event_id:int ->
  marker_name:string ->
  unit
-> marker_recorded_event_attributes
(** Create a {!type-marker_recorded_event_attributes} type *)

val make_record_marker_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:record_marker_failed_cause ->
  marker_name:string ->
  unit
-> record_marker_failed_event_attributes
(** Create a {!type-record_marker_failed_event_attributes} type *)

val make_child_workflow_execution_started_event_attributes :
  initiated_event_id:int ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_started_event_attributes
(** Create a {!type-child_workflow_execution_started_event_attributes} type *)

val make_child_workflow_execution_completed_event_attributes :
  ?result:string ->
  started_event_id:int ->
  initiated_event_id:int ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_completed_event_attributes
(** Create a {!type-child_workflow_execution_completed_event_attributes} type *)

val make_child_workflow_execution_failed_event_attributes :
  ?details:string ->
  ?reason:string ->
  started_event_id:int ->
  initiated_event_id:int ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_failed_event_attributes
(** Create a {!type-child_workflow_execution_failed_event_attributes} type *)

val make_child_workflow_execution_timed_out_event_attributes :
  started_event_id:int ->
  initiated_event_id:int ->
  timeout_type:workflow_execution_timeout_type ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_timed_out_event_attributes
(** Create a {!type-child_workflow_execution_timed_out_event_attributes} type *)

val make_child_workflow_execution_canceled_event_attributes :
  ?details:string ->
  started_event_id:int ->
  initiated_event_id:int ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_canceled_event_attributes
(** Create a {!type-child_workflow_execution_canceled_event_attributes} type *)

val make_child_workflow_execution_terminated_event_attributes :
  started_event_id:int ->
  initiated_event_id:int ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_terminated_event_attributes
(** Create a {!type-child_workflow_execution_terminated_event_attributes} type *)

val make_signal_external_workflow_execution_initiated_event_attributes :
  ?control:string ->
  ?input:string ->
  ?run_id:string ->
  decision_task_completed_event_id:int ->
  signal_name:string ->
  workflow_id:string ->
  unit
-> signal_external_workflow_execution_initiated_event_attributes
(** Create a {!type-signal_external_workflow_execution_initiated_event_attributes} type *)

val make_external_workflow_execution_signaled_event_attributes :
  initiated_event_id:int -> workflow_execution:workflow_execution -> unit
-> external_workflow_execution_signaled_event_attributes
(** Create a {!type-external_workflow_execution_signaled_event_attributes} type *)

val make_signal_external_workflow_execution_failed_event_attributes :
  ?control:string ->
  ?run_id:string ->
  decision_task_completed_event_id:int ->
  initiated_event_id:int ->
  cause:signal_external_workflow_execution_failed_cause ->
  workflow_id:string ->
  unit
-> signal_external_workflow_execution_failed_event_attributes
(** Create a {!type-signal_external_workflow_execution_failed_event_attributes} type *)

val make_external_workflow_execution_cancel_requested_event_attributes :
  initiated_event_id:int -> workflow_execution:workflow_execution -> unit
-> external_workflow_execution_cancel_requested_event_attributes
(** Create a {!type-external_workflow_execution_cancel_requested_event_attributes} type *)

val make_request_cancel_external_workflow_execution_initiated_event_attributes :
  ?control:string ->
  ?run_id:string ->
  decision_task_completed_event_id:int ->
  workflow_id:string ->
  unit
-> request_cancel_external_workflow_execution_initiated_event_attributes
(** Create a {!type-request_cancel_external_workflow_execution_initiated_event_attributes} type *)

val make_request_cancel_external_workflow_execution_failed_event_attributes :
  ?control:string ->
  ?run_id:string ->
  decision_task_completed_event_id:int ->
  initiated_event_id:int ->
  cause:request_cancel_external_workflow_execution_failed_cause ->
  workflow_id:string ->
  unit
-> request_cancel_external_workflow_execution_failed_event_attributes
(** Create a {!type-request_cancel_external_workflow_execution_failed_event_attributes} type *)

val make_schedule_activity_task_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:schedule_activity_task_failed_cause ->
  activity_id:string ->
  activity_type:activity_type ->
  unit
-> schedule_activity_task_failed_event_attributes
(** Create a {!type-schedule_activity_task_failed_event_attributes} type *)

val make_request_cancel_activity_task_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:request_cancel_activity_task_failed_cause ->
  activity_id:string ->
  unit
-> request_cancel_activity_task_failed_event_attributes
(** Create a {!type-request_cancel_activity_task_failed_event_attributes} type *)

val make_cancel_timer_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:cancel_timer_failed_cause ->
  timer_id:string ->
  unit
-> cancel_timer_failed_event_attributes
(** Create a {!type-cancel_timer_failed_event_attributes} type *)

val make_lambda_function_scheduled_event_attributes :
  ?start_to_close_timeout:string ->
  ?input:string ->
  ?control:string ->
  decision_task_completed_event_id:int ->
  name:string ->
  id:string ->
  unit
-> lambda_function_scheduled_event_attributes
(** Create a {!type-lambda_function_scheduled_event_attributes} type *)

val make_lambda_function_started_event_attributes :
  scheduled_event_id:int -> unit
-> lambda_function_started_event_attributes
(** Create a {!type-lambda_function_started_event_attributes} type *)

val make_lambda_function_completed_event_attributes :
  ?result:string -> started_event_id:int -> scheduled_event_id:int -> unit
-> lambda_function_completed_event_attributes
(** Create a {!type-lambda_function_completed_event_attributes} type *)

val make_lambda_function_failed_event_attributes :
  ?details:string ->
  ?reason:string ->
  started_event_id:int ->
  scheduled_event_id:int ->
  unit
-> lambda_function_failed_event_attributes
(** Create a {!type-lambda_function_failed_event_attributes} type *)

val make_lambda_function_timed_out_event_attributes :
  ?timeout_type:lambda_function_timeout_type ->
  started_event_id:int ->
  scheduled_event_id:int ->
  unit
-> lambda_function_timed_out_event_attributes
(** Create a {!type-lambda_function_timed_out_event_attributes} type *)

val make_schedule_lambda_function_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:schedule_lambda_function_failed_cause ->
  name:string ->
  id:string ->
  unit
-> schedule_lambda_function_failed_event_attributes
(** Create a {!type-schedule_lambda_function_failed_event_attributes} type *)

val make_history_event :
  ?start_lambda_function_failed_event_attributes:start_lambda_function_failed_event_attributes ->
  ?schedule_lambda_function_failed_event_attributes:schedule_lambda_function_failed_event_attributes ->
  ?lambda_function_timed_out_event_attributes:lambda_function_timed_out_event_attributes ->
  ?lambda_function_failed_event_attributes:lambda_function_failed_event_attributes ->
  ?lambda_function_completed_event_attributes:lambda_function_completed_event_attributes ->
  ?lambda_function_started_event_attributes:lambda_function_started_event_attributes ->
  ?lambda_function_scheduled_event_attributes:lambda_function_scheduled_event_attributes ->
  ?start_child_workflow_execution_failed_event_attributes:start_child_workflow_execution_failed_event_attributes ->
  ?cancel_timer_failed_event_attributes:cancel_timer_failed_event_attributes ->
  ?start_timer_failed_event_attributes:start_timer_failed_event_attributes ->
  ?request_cancel_activity_task_failed_event_attributes:request_cancel_activity_task_failed_event_attributes ->
  ?schedule_activity_task_failed_event_attributes:schedule_activity_task_failed_event_attributes ->
  ?request_cancel_external_workflow_execution_failed_event_attributes:request_cancel_external_workflow_execution_failed_event_attributes ->
  ?request_cancel_external_workflow_execution_initiated_event_attributes:request_cancel_external_workflow_execution_initiated_event_attributes ->
  ?external_workflow_execution_cancel_requested_event_attributes:external_workflow_execution_cancel_requested_event_attributes ->
  ?signal_external_workflow_execution_failed_event_attributes:signal_external_workflow_execution_failed_event_attributes ->
  ?external_workflow_execution_signaled_event_attributes:external_workflow_execution_signaled_event_attributes ->
  ?signal_external_workflow_execution_initiated_event_attributes:signal_external_workflow_execution_initiated_event_attributes ->
  ?child_workflow_execution_terminated_event_attributes:child_workflow_execution_terminated_event_attributes ->
  ?child_workflow_execution_canceled_event_attributes:child_workflow_execution_canceled_event_attributes ->
  ?child_workflow_execution_timed_out_event_attributes:child_workflow_execution_timed_out_event_attributes ->
  ?child_workflow_execution_failed_event_attributes:child_workflow_execution_failed_event_attributes ->
  ?child_workflow_execution_completed_event_attributes:child_workflow_execution_completed_event_attributes ->
  ?child_workflow_execution_started_event_attributes:child_workflow_execution_started_event_attributes ->
  ?start_child_workflow_execution_initiated_event_attributes:start_child_workflow_execution_initiated_event_attributes ->
  ?timer_canceled_event_attributes:timer_canceled_event_attributes ->
  ?timer_fired_event_attributes:timer_fired_event_attributes ->
  ?timer_started_event_attributes:timer_started_event_attributes ->
  ?record_marker_failed_event_attributes:record_marker_failed_event_attributes ->
  ?marker_recorded_event_attributes:marker_recorded_event_attributes ->
  ?workflow_execution_signaled_event_attributes:workflow_execution_signaled_event_attributes ->
  ?activity_task_cancel_requested_event_attributes:activity_task_cancel_requested_event_attributes ->
  ?activity_task_canceled_event_attributes:activity_task_canceled_event_attributes ->
  ?activity_task_timed_out_event_attributes:activity_task_timed_out_event_attributes ->
  ?activity_task_failed_event_attributes:activity_task_failed_event_attributes ->
  ?activity_task_completed_event_attributes:activity_task_completed_event_attributes ->
  ?activity_task_started_event_attributes:activity_task_started_event_attributes ->
  ?activity_task_scheduled_event_attributes:activity_task_scheduled_event_attributes ->
  ?decision_task_timed_out_event_attributes:decision_task_timed_out_event_attributes ->
  ?decision_task_completed_event_attributes:decision_task_completed_event_attributes ->
  ?decision_task_started_event_attributes:decision_task_started_event_attributes ->
  ?decision_task_scheduled_event_attributes:decision_task_scheduled_event_attributes ->
  ?workflow_execution_cancel_requested_event_attributes:workflow_execution_cancel_requested_event_attributes ->
  ?workflow_execution_terminated_event_attributes:workflow_execution_terminated_event_attributes ->
  ?continue_as_new_workflow_execution_failed_event_attributes:continue_as_new_workflow_execution_failed_event_attributes ->
  ?workflow_execution_continued_as_new_event_attributes:workflow_execution_continued_as_new_event_attributes ->
  ?cancel_workflow_execution_failed_event_attributes:cancel_workflow_execution_failed_event_attributes ->
  ?workflow_execution_canceled_event_attributes:workflow_execution_canceled_event_attributes ->
  ?workflow_execution_timed_out_event_attributes:workflow_execution_timed_out_event_attributes ->
  ?fail_workflow_execution_failed_event_attributes:fail_workflow_execution_failed_event_attributes ->
  ?workflow_execution_failed_event_attributes:workflow_execution_failed_event_attributes ->
  ?complete_workflow_execution_failed_event_attributes:complete_workflow_execution_failed_event_attributes ->
  ?workflow_execution_completed_event_attributes:workflow_execution_completed_event_attributes ->
  ?workflow_execution_started_event_attributes:workflow_execution_started_event_attributes ->
  event_id:int ->
  event_type:event_type ->
  event_timestamp:float ->
  unit
-> history_event
(** Create a {!type-history_event} type *)

val make_decision_task :
  ?previous_started_event_id:int ->
  ?next_page_token:string ->
  events:history_event list ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  started_event_id:int ->
  task_token:string ->
  unit
-> decision_task
(** Create a {!type-decision_task} type *)

val make_poll_for_decision_task_input :
  ?start_at_previous_started_event:bool ->
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  ?identity:string ->
  task_list:task_list ->
  domain:string ->
  unit
-> poll_for_decision_task_input
(** Create a {!type-poll_for_decision_task_input} type *)

val make_activity_task :
  ?input:string ->
  activity_type:activity_type ->
  workflow_execution:workflow_execution ->
  started_event_id:int ->
  activity_id:string ->
  task_token:string ->
  unit
-> activity_task
(** Create a {!type-activity_task} type *)

val make_poll_for_activity_task_input :
  ?identity:string -> task_list:task_list -> domain:string -> unit
-> poll_for_activity_task_input
(** Create a {!type-poll_for_activity_task_input} type *)

val make_list_workflow_types_input :
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  ?name:string ->
  registration_status:registration_status ->
  domain:string ->
  unit
-> list_workflow_types_input
(** Create a {!type-list_workflow_types_input} type *)

val make_list_tags_for_resource_output : ?tags:resource_tag list -> unit
-> list_tags_for_resource_output
(** Create a {!type-list_tags_for_resource_output} type *)

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input
(** Create a {!type-list_tags_for_resource_input} type *)

val make_execution_time_filter :
  ?latest_date:float -> oldest_date:float -> unit
-> execution_time_filter
(** Create a {!type-execution_time_filter} type *)

val make_list_open_workflow_executions_input :
  ?execution_filter:workflow_execution_filter ->
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  ?tag_filter:tag_filter ->
  ?type_filter:workflow_type_filter ->
  start_time_filter:execution_time_filter ->
  domain:string ->
  unit
-> list_open_workflow_executions_input
(** Create a {!type-list_open_workflow_executions_input} type *)

val make_domain_info :
  ?arn:string ->
  ?description:string ->
  status:registration_status ->
  name:string ->
  unit
-> domain_info
(** Create a {!type-domain_info} type *)

val make_domain_infos :
  ?next_page_token:string -> domain_infos:domain_info list -> unit
-> domain_infos
(** Create a {!type-domain_infos} type *)

val make_list_domains_input :
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  registration_status:registration_status ->
  unit
-> list_domains_input
(** Create a {!type-list_domains_input} type *)

val make_close_status_filter : status:close_status -> unit
-> close_status_filter
(** Create a {!type-close_status_filter} type *)

val make_list_closed_workflow_executions_input :
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  ?tag_filter:tag_filter ->
  ?type_filter:workflow_type_filter ->
  ?close_status_filter:close_status_filter ->
  ?execution_filter:workflow_execution_filter ->
  ?close_time_filter:execution_time_filter ->
  ?start_time_filter:execution_time_filter ->
  domain:string ->
  unit
-> list_closed_workflow_executions_input
(** Create a {!type-list_closed_workflow_executions_input} type *)

val make_activity_type_info :
  ?deprecation_date:float ->
  ?description:string ->
  creation_date:float ->
  status:registration_status ->
  activity_type:activity_type ->
  unit
-> activity_type_info
(** Create a {!type-activity_type_info} type *)

val make_activity_type_infos :
  ?next_page_token:string -> type_infos:activity_type_info list -> unit
-> activity_type_infos
(** Create a {!type-activity_type_infos} type *)

val make_list_activity_types_input :
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  ?name:string ->
  registration_status:registration_status ->
  domain:string ->
  unit
-> list_activity_types_input
(** Create a {!type-list_activity_types_input} type *)

val make_history :
  ?next_page_token:string -> events:history_event list -> unit
-> history
(** Create a {!type-history} type *)

val make_get_workflow_execution_history_input :
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  execution:workflow_execution ->
  domain:string ->
  unit
-> get_workflow_execution_history_input
(** Create a {!type-get_workflow_execution_history_input} type *)

val make_describe_workflow_type_input :
  workflow_type:workflow_type -> domain:string -> unit
-> describe_workflow_type_input
(** Create a {!type-describe_workflow_type_input} type *)

val make_describe_workflow_execution_input :
  execution:workflow_execution -> domain:string -> unit
-> describe_workflow_execution_input
(** Create a {!type-describe_workflow_execution_input} type *)

val make_domain_configuration :
  workflow_execution_retention_period_in_days:string -> unit
-> domain_configuration
(** Create a {!type-domain_configuration} type *)

val make_domain_detail :
  configuration:domain_configuration -> domain_info:domain_info -> unit
-> domain_detail
(** Create a {!type-domain_detail} type *)

val make_describe_domain_input : name:string -> unit
-> describe_domain_input
(** Create a {!type-describe_domain_input} type *)

val make_activity_type_configuration :
  ?default_task_schedule_to_close_timeout:string ->
  ?default_task_schedule_to_start_timeout:string ->
  ?default_task_priority:string ->
  ?default_task_list:task_list ->
  ?default_task_heartbeat_timeout:string ->
  ?default_task_start_to_close_timeout:string ->
  unit
-> activity_type_configuration
(** Create a {!type-activity_type_configuration} type *)

val make_activity_type_detail :
  configuration:activity_type_configuration ->
  type_info:activity_type_info ->
  unit
-> activity_type_detail
(** Create a {!type-activity_type_detail} type *)

val make_describe_activity_type_input :
  activity_type:activity_type -> domain:string -> unit
-> describe_activity_type_input
(** Create a {!type-describe_activity_type_input} type *)

val make_deprecate_workflow_type_input :
  workflow_type:workflow_type -> domain:string -> unit
-> deprecate_workflow_type_input
(** Create a {!type-deprecate_workflow_type_input} type *)

val make_deprecate_domain_input : name:string -> unit
-> deprecate_domain_input
(** Create a {!type-deprecate_domain_input} type *)

val make_deprecate_activity_type_input :
  activity_type:activity_type -> domain:string -> unit
-> deprecate_activity_type_input
(** Create a {!type-deprecate_activity_type_input} type *)

val make_delete_workflow_type_input :
  workflow_type:workflow_type -> domain:string -> unit
-> delete_workflow_type_input
(** Create a {!type-delete_workflow_type_input} type *)

val make_delete_activity_type_input :
  activity_type:activity_type -> domain:string -> unit
-> delete_activity_type_input
(** Create a {!type-delete_activity_type_input} type *)

val make_pending_task_count : ?truncated:bool -> count:int -> unit
-> pending_task_count
(** Create a {!type-pending_task_count} type *)

val make_count_pending_decision_tasks_input :
  task_list:task_list -> domain:string -> unit
-> count_pending_decision_tasks_input
(** Create a {!type-count_pending_decision_tasks_input} type *)

val make_count_pending_activity_tasks_input :
  task_list:task_list -> domain:string -> unit
-> count_pending_activity_tasks_input
(** Create a {!type-count_pending_activity_tasks_input} type *)

val make_count_open_workflow_executions_input :
  ?execution_filter:workflow_execution_filter ->
  ?tag_filter:tag_filter ->
  ?type_filter:workflow_type_filter ->
  start_time_filter:execution_time_filter ->
  domain:string ->
  unit
-> count_open_workflow_executions_input
(** Create a {!type-count_open_workflow_executions_input} type *)

val make_count_closed_workflow_executions_input :
  ?close_status_filter:close_status_filter ->
  ?tag_filter:tag_filter ->
  ?type_filter:workflow_type_filter ->
  ?execution_filter:workflow_execution_filter ->
  ?close_time_filter:execution_time_filter ->
  ?start_time_filter:execution_time_filter ->
  domain:string ->
  unit
-> count_closed_workflow_executions_input
(** Create a {!type-count_closed_workflow_executions_input} type *)

(** {1:operations Operations} *)

module CountClosedWorkflowExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      count_closed_workflow_executions_input ->
        (workflow_execution_count,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns the number of closed workflow executions within the given domain that meet the specified filtering criteria.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                 
                  {ul
                       {- [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].
                          
                          }
                        {- [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].
                           
                           }
                        {- [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].
                           
                           }
                       
               }
               }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module CountOpenWorkflowExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      count_open_workflow_executions_input ->
        (workflow_execution_count,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns the number of open workflow executions within the given domain that meet the specified filtering criteria.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                 
                  {ul
                       {- [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].
                          
                          }
                        {- [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].
                           
                           }
                        {- [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].
                           
                           }
                       
               }
               }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module CountPendingActivityTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      count_pending_activity_tasks_input ->
        (pending_task_count,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns the estimated number of activity tasks in the specified task list. The count returned is an approximation and isn't guaranteed to be exact. If you specify a task list that no activity task was ever scheduled in then [0] is returned.
    
     {b Access Control}
     
      You can use IAM policies to control this action's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module CountPendingDecisionTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      count_pending_decision_tasks_input ->
        (pending_task_count,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns the estimated number of decision tasks in the specified task list. The count returned is an approximation and isn't guaranteed to be exact. If you specify a task list that no decision task was ever scheduled in then [0] is returned.
    
     {b Access Control}
     
      You can use IAM policies to control this action's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module DeleteActivityType : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_activity_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeNotDeprecatedFault of type_not_deprecated_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Deletes the specified {i activity type}.
    
     Note: Prior to deletion, activity types must first be {b deprecated}.
     
      After an activity type has been deleted, you cannot schedule new activities of that type. Activities that started before the type was deleted will continue to run.
      
       {b Access Control}
       
        You can use IAM policies to control this action's access to Amazon SWF resources as follows:
        
         {ul
              {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                 
                 }
               {- Use an [Action] element to allow or deny permission to call this action.
                  
                  }
               {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                  
                   {ul
                        {- [activityType.name]: String constraint. The key is [swf:activityType.name].
                           
                           }
                         {- [activityType.version]: String constraint. The key is [swf:activityType.version].
                            
                            }
                        
                }
                }
              
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module DeleteWorkflowType : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_workflow_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeNotDeprecatedFault of type_not_deprecated_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Deletes the specified {i workflow type}.
    
     Note: Prior to deletion, workflow types must first be {b deprecated}.
     
      After a workflow type has been deleted, you cannot create new executions of that type. Executions that started before the type was deleted will continue to run.
      
       {b Access Control}
       
        You can use IAM policies to control this action's access to Amazon SWF resources as follows:
        
         {ul
              {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                 
                 }
               {- Use an [Action] element to allow or deny permission to call this action.
                  
                  }
               {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                  
                   {ul
                        {- [workflowType.name]: String constraint. The key is [swf:workflowType.name].
                           
                           }
                         {- [workflowType.version]: String constraint. The key is [swf:workflowType.version].
                            
                            }
                        
                }
                }
              
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module DeprecateActivityType : sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_activity_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeDeprecatedFault of type_deprecated_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Deprecates the specified {i activity type}. After an activity type has been deprecated, you cannot create new tasks of that activity type. Tasks of this type that were scheduled before the type was deprecated continue to run.
    
     {b Access Control}
     
      You can use IAM policies to control this action's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                
                 {ul
                      {- [activityType.name]: String constraint. The key is [swf:activityType.name].
                         
                         }
                       {- [activityType.version]: String constraint. The key is [swf:activityType.version].
                          
                          }
                      
              }
              }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module DeprecateDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_domain_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DomainDeprecatedFault of domain_deprecated_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Deprecates the specified domain. After a domain has been deprecated it cannot be used to create new workflow executions or register new types. However, you can still use visibility actions on this domain. Deprecating a domain also deprecates all activity and workflow types registered in the domain. Executions that were started before the domain was deprecated continues to run.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- You cannot use an IAM policy to constrain this action's parameters.
                 
                 }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module DeprecateWorkflowType : sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_workflow_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeDeprecatedFault of type_deprecated_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Deprecates the specified {i workflow type}. After a workflow type has been deprecated, you cannot create new executions of that type. Executions that were started before the type was deprecated continues to run. A deprecated workflow type may still be used when calling visibility actions.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                 
                  {ul
                       {- [workflowType.name]: String constraint. The key is [swf:workflowType.name].
                          
                          }
                        {- [workflowType.version]: String constraint. The key is [swf:workflowType.version].
                           
                           }
                       
               }
               }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module DescribeActivityType : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_activity_type_input ->
        (activity_type_detail,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns information about the specified activity type. This includes configuration settings provided when the type was registered and other general information about the type.
    
     {b Access Control}
     
      You can use IAM policies to control this action's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                
                 {ul
                      {- [activityType.name]: String constraint. The key is [swf:activityType.name].
                         
                         }
                       {- [activityType.version]: String constraint. The key is [swf:activityType.version].
                          
                          }
                      
              }
              }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module DescribeDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_domain_input ->
        (domain_detail,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns information about the specified domain, including description and status.
    
     {b Access Control}
     
      You can use IAM policies to control this action's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module DescribeWorkflowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_workflow_execution_input ->
        (workflow_execution_detail,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns information about the specified workflow execution including its type and some statistics.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- You cannot use an IAM policy to constrain this action's parameters.
                 
                 }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module DescribeWorkflowType : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_workflow_type_input ->
        (workflow_type_detail,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns information about the specified {i workflow type}. This includes configuration settings specified when the type was registered and other information such as creation date, current status, etc.
    
     {b Access Control}
     
      You can use IAM policies to control this action's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                
                 {ul
                      {- [workflowType.name]: String constraint. The key is [swf:workflowType.name].
                         
                         }
                       {- [workflowType.version]: String constraint. The key is [swf:workflowType.version].
                          
                          }
                      
              }
              }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module GetWorkflowExecutionHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_workflow_execution_history_input ->
        (history,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns the history of the specified workflow execution. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the [nextPageToken] returned by the initial call.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- You cannot use an IAM policy to constrain this action's parameters.
                 
                 }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module ListActivityTypes : sig
  val request :
    Smaws_Lib.Context.t ->
      list_activity_types_input ->
        (activity_type_infos,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns information about all activities registered in the specified domain that match the specified name and registration status. The result includes information like creation date, current status of the activity, etc. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the [nextPageToken] returned by the initial call.
    
     {b Access Control}
     
      You can use IAM policies to control this action's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module ListClosedWorkflowExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_closed_workflow_executions_input ->
        (workflow_execution_infos,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns a list of closed workflow executions in the specified domain that meet the filtering criteria. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the nextPageToken returned by the initial call.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                 
                  {ul
                       {- [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].
                          
                          }
                        {- [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].
                           
                           }
                        {- [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].
                           
                           }
                       
               }
               }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module ListDomains : sig
  val request :
    Smaws_Lib.Context.t ->
      list_domains_input ->
        (domain_infos,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            
        ]
      ) result
  (** 
    Returns the list of domains registered in the account. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the nextPageToken returned by the initial call.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains. The element must be set to [arn:aws:swf::AccountID:domain/*], where {i AccountID} is the account ID, with no dashes.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- You cannot use an IAM policy to constrain this action's parameters.
                 
                 }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module ListOpenWorkflowExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_open_workflow_executions_input ->
        (workflow_execution_infos,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns a list of open workflow executions in the specified domain that meet the filtering criteria. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the nextPageToken returned by the initial call.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                 
                  {ul
                       {- [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].
                          
                          }
                        {- [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].
                           
                           }
                        {- [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].
                           
                           }
                       
               }
               }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    List tags for a given domain.
     *)

  
end

module ListWorkflowTypes : sig
  val request :
    Smaws_Lib.Context.t ->
      list_workflow_types_input ->
        (workflow_type_infos,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Returns information about workflow types in the specified domain. The results may be split into multiple pages that can be retrieved by making the call repeatedly.
    
     {b Access Control}
     
      You can use IAM policies to control this action's access to Amazon SWF resources as follows:
      
       {ul
            {- Use a [Resource] element with the domain name to limit the action to only specified domains.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module PollForActivityTask : sig
  val request :
    Smaws_Lib.Context.t ->
      poll_for_activity_task_input ->
        (activity_task,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Used by workers to get an [ActivityTask] from the specified activity [taskList]. This initiates a long poll, where the service holds the HTTP connection open and responds as soon as a task becomes available. The maximum time the service holds on to the request before responding is 60 seconds. If no task is available within 60 seconds, the poll returns an empty result. An empty result, in this context, means that an ActivityTask is returned, but that the value of taskToken is an empty string. If a task is returned, the worker should use its type to identify and process it correctly.
    
     Workers should set their client side socket timeout to at least 70 seconds (10 seconds higher than the maximum time service may hold the poll request).
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.
                 
                 }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module PollForDecisionTask : sig
  val request :
    Smaws_Lib.Context.t ->
      poll_for_decision_task_input ->
        (decision_task,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Used by deciders to get a [DecisionTask] from the specified decision [taskList]. A decision task may be returned for any open workflow execution that is using the specified task list. The task includes a paginated view of the history of the workflow execution. The decider should use the workflow type and the history to determine how to properly handle the task.
    
     This action initiates a long poll, where the service holds the HTTP connection open and responds as soon a task becomes available. If no decision task is available in the specified task list before the timeout of 60 seconds expires, an empty result is returned. An empty result, in this context, means that a DecisionTask is returned, but that the value of taskToken is an empty string.
     
      Deciders should set their client side socket timeout to at least 70 seconds (10 seconds higher than the timeout).
      
       Because the number of workflow history events for a single workflow execution might be very large, the result returned might be split up across a number of pages. To retrieve subsequent pages, make additional calls to [PollForDecisionTask] using the [nextPageToken] returned by the initial call. Note that you do {i not} call [GetWorkflowExecutionHistory] with this [nextPageToken]. Instead, call [PollForDecisionTask] again.
       
        {b Access Control}
        
         You can use IAM policies to control this action's access to Amazon SWF resources as follows:
         
          {ul
               {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                  
                  }
                {- Use an [Action] element to allow or deny permission to call this action.
                   
                   }
                {- Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.
                   
                   }
               
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module RecordActivityTaskHeartbeat : sig
  val request :
    Smaws_Lib.Context.t ->
      record_activity_task_heartbeat_input ->
        (activity_task_status,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Used by activity workers to report to the service that the [ActivityTask] represented by the specified [taskToken] is still making progress. The worker can also specify details of the progress, for example percent complete, using the [details] parameter. This action can also be used by the worker as a mechanism to check if cancellation is being requested for the activity task. If a cancellation is being attempted for the specified task, then the boolean [cancelRequested] flag returned by the service is set to [true].
    
     This action resets the [taskHeartbeatTimeout] clock. The [taskHeartbeatTimeout] is specified in [RegisterActivityType].
     
      This action doesn't in itself create an event in the workflow execution history. However, if the task times out, the workflow execution history contains a [ActivityTaskTimedOut] event that contains the information from the last heartbeat generated by the activity worker.
      
       The [taskStartToCloseTimeout] of an activity type is the maximum duration of an activity task, regardless of the number of [RecordActivityTaskHeartbeat] requests received. The [taskStartToCloseTimeout] is also specified in [RegisterActivityType].
       
        This operation is only useful for long-lived activities to report liveliness of the task and to determine if a cancellation is being attempted.
        
         If the [cancelRequested] flag returns [true], a cancellation is being attempted. If the worker can cancel the activity, it should respond with [RespondActivityTaskCanceled]. Otherwise, it should ignore the cancellation request.
         
          {b Access Control}
          
           You can use IAM policies to control this action's access to Amazon SWF resources as follows:
           
            {ul
                 {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                    
                    }
                  {- Use an [Action] element to allow or deny permission to call this action.
                     
                     }
                  {- You cannot use an IAM policy to constrain this action's parameters.
                     
                     }
                 
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module RegisterActivityType : sig
  val request :
    Smaws_Lib.Context.t ->
      register_activity_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeAlreadyExistsFault of type_already_exists_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Registers a new {i activity type} along with its configuration settings in the specified domain.
    
     A [TypeAlreadyExists] fault is returned if the type already exists in the domain. You cannot change any configuration settings of the type after its registration, and it must be registered as a new version.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                 
                  {ul
                       {- [defaultTaskList.name]: String constraint. The key is [swf:defaultTaskList.name].
                          
                          }
                        {- [name]: String constraint. The key is [swf:name].
                           
                           }
                        {- [version]: String constraint. The key is [swf:version].
                           
                           }
                       
               }
               }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module RegisterDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      register_domain_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DomainAlreadyExistsFault of domain_already_exists_fault
            | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TooManyTagsFault of too_many_tags_fault
            
        ]
      ) result
  (** 
    Registers a new domain.
    
     {b Access Control}
     
      You can use IAM policies to control this action's access to Amazon SWF resources as follows:
      
       {ul
            {- You cannot use an IAM policy to control domain access for this action. The name of the domain being registered is available as the resource of this action.
               
               }
             {- Use an [Action] element to allow or deny permission to call this action.
                
                }
             {- You cannot use an IAM policy to constrain this action's parameters.
                
                }
            
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module RegisterWorkflowType : sig
  val request :
    Smaws_Lib.Context.t ->
      register_workflow_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeAlreadyExistsFault of type_already_exists_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Registers a new {i workflow type} and its configuration settings in the specified domain.
    
     The retention period for the workflow history is set by the [RegisterDomain] action.
     
      If the type already exists, then a [TypeAlreadyExists] fault is returned. You cannot change the configuration settings of a workflow type once it is registered and it must be registered as a new version.
      
       {b Access Control}
       
        You can use IAM policies to control this action's access to Amazon SWF resources as follows:
        
         {ul
              {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                 
                 }
               {- Use an [Action] element to allow or deny permission to call this action.
                  
                  }
               {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                  
                   {ul
                        {- [defaultTaskList.name]: String constraint. The key is [swf:defaultTaskList.name].
                           
                           }
                         {- [name]: String constraint. The key is [swf:name].
                            
                            }
                         {- [version]: String constraint. The key is [swf:version].
                            
                            }
                        
                }
                }
              
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module RequestCancelWorkflowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      request_cancel_workflow_execution_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Records a [WorkflowExecutionCancelRequested] event in the currently running workflow execution identified by the given domain, workflowId, and runId. This logically requests the cancellation of the workflow execution as a whole. It is up to the decider to take appropriate actions when it receives an execution history with this event.
    
     If the runId isn't specified, the [WorkflowExecutionCancelRequested] event is recorded in the history of the current open workflow execution with the specified workflowId in the domain.
     
      Because this action allows the workflow to properly clean up and gracefully close, it should be used instead of [TerminateWorkflowExecution] when possible.
      
       {b Access Control}
       
        You can use IAM policies to control this action's access to Amazon SWF resources as follows:
        
         {ul
              {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                 
                 }
               {- Use an [Action] element to allow or deny permission to call this action.
                  
                  }
               {- You cannot use an IAM policy to constrain this action's parameters.
                  
                  }
              
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module RespondActivityTaskCanceled : sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_canceled_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Used by workers to tell the service that the [ActivityTask] identified by the [taskToken] was successfully canceled. Additional [details] can be provided using the [details] argument.
    
     These [details] (if provided) appear in the [ActivityTaskCanceled] event added to the workflow history.
     
      Only use this operation if the [canceled] flag of a [RecordActivityTaskHeartbeat] request returns [true] and if the activity can be safely undone or abandoned.
      
       A task is considered open from the time that it is scheduled until it is closed. Therefore a task is reported as open while a worker is processing it. A task is closed after it has been specified in a call to [RespondActivityTaskCompleted], RespondActivityTaskCanceled, [RespondActivityTaskFailed], or the task has {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types}timed out}.
       
        {b Access Control}
        
         You can use IAM policies to control this action's access to Amazon SWF resources as follows:
         
          {ul
               {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                  
                  }
                {- Use an [Action] element to allow or deny permission to call this action.
                   
                   }
                {- You cannot use an IAM policy to constrain this action's parameters.
                   
                   }
               
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module RespondActivityTaskCompleted : sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_completed_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Used by workers to tell the service that the [ActivityTask] identified by the [taskToken] completed successfully with a [result] (if provided). The [result] appears in the [ActivityTaskCompleted] event in the workflow history.
    
     If the requested task doesn't complete successfully, use [RespondActivityTaskFailed] instead. If the worker finds that the task is canceled through the [canceled] flag returned by [RecordActivityTaskHeartbeat], it should cancel the task, clean up and then call [RespondActivityTaskCanceled].
     
      A task is considered open from the time that it is scheduled until it is closed. Therefore a task is reported as open while a worker is processing it. A task is closed after it has been specified in a call to RespondActivityTaskCompleted, [RespondActivityTaskCanceled], [RespondActivityTaskFailed], or the task has {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types}timed out}.
      
       {b Access Control}
       
        You can use IAM policies to control this action's access to Amazon SWF resources as follows:
        
         {ul
              {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                 
                 }
               {- Use an [Action] element to allow or deny permission to call this action.
                  
                  }
               {- You cannot use an IAM policy to constrain this action's parameters.
                  
                  }
              
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module RespondActivityTaskFailed : sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_failed_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Used by workers to tell the service that the [ActivityTask] identified by the [taskToken] has failed with [reason] (if specified). The [reason] and [details] appear in the [ActivityTaskFailed] event added to the workflow history.
    
     A task is considered open from the time that it is scheduled until it is closed. Therefore a task is reported as open while a worker is processing it. A task is closed after it has been specified in a call to [RespondActivityTaskCompleted], [RespondActivityTaskCanceled], RespondActivityTaskFailed, or the task has {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types}timed out}.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- You cannot use an IAM policy to constrain this action's parameters.
                 
                 }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module RespondDecisionTaskCompleted : sig
  val request :
    Smaws_Lib.Context.t ->
      respond_decision_task_completed_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Used by deciders to tell the service that the [DecisionTask] identified by the [taskToken] has successfully completed. The [decisions] argument specifies the list of decisions made while processing the task.
    
     A [DecisionTaskCompleted] event is added to the workflow history. The [executionContext] specified is attached to the event in the workflow execution history.
     
      {b Access Control}
      
       If an IAM policy grants permission to use [RespondDecisionTaskCompleted], it can express permissions for the list of decisions in the [decisions] parameter. Each of the decisions has one or more parameters, much like a regular API call. To allow for policies to be as readable as possible, you can express permissions on decisions as if they were actual API calls, including applying conditions to some parameters. For more information, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module SignalWorkflowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      signal_workflow_execution_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Records a [WorkflowExecutionSignaled] event in the workflow execution history and creates a decision task for the workflow execution identified by the given domain, workflowId and runId. The event is recorded with the specified user defined signalName and input (if provided).
    
     If a runId isn't specified, then the [WorkflowExecutionSignaled] event is recorded in the history of the current open workflow with the matching workflowId in the domain.
     
      If the specified workflow execution isn't open, this method fails with [UnknownResource].
      
       {b Access Control}
       
        You can use IAM policies to control this action's access to Amazon SWF resources as follows:
        
         {ul
              {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                 
                 }
               {- Use an [Action] element to allow or deny permission to call this action.
                  
                  }
               {- You cannot use an IAM policy to constrain this action's parameters.
                  
                  }
              
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module StartWorkflowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_workflow_execution_input ->
        (run,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DefaultUndefinedFault of default_undefined_fault
            | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeDeprecatedFault of type_deprecated_fault
            | `UnknownResourceFault of unknown_resource_fault
            | `WorkflowExecutionAlreadyStartedFault of workflow_execution_already_started_fault
            
        ]
      ) result
  (** 
    Starts an execution of the workflow type in the specified domain using the provided [workflowId] and input data.
    
     This action returns the newly started workflow execution.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                 
                  {ul
                       {- [tagList.member.0]: The key is [swf:tagList.member.0].
                          
                          }
                        {- [tagList.member.1]: The key is [swf:tagList.member.1].
                           
                           }
                        {- [tagList.member.2]: The key is [swf:tagList.member.2].
                           
                           }
                        {- [tagList.member.3]: The key is [swf:tagList.member.3].
                           
                           }
                        {- [tagList.member.4]: The key is [swf:tagList.member.4].
                           
                           }
                        {- [taskList]: String constraint. The key is [swf:taskList.name].
                           
                           }
                        {- [workflowType.name]: String constraint. The key is [swf:workflowType.name].
                           
                           }
                        {- [workflowType.version]: String constraint. The key is [swf:workflowType.version].
                           
                           }
                       
               }
               }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TooManyTagsFault of too_many_tags_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Add a tag to a Amazon SWF domain.
    
     Amazon SWF supports a maximum of 50 tags per resource.
     
      *)

  
end

module TerminateWorkflowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      terminate_workflow_execution_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Records a [WorkflowExecutionTerminated] event and forces closure of the workflow execution identified by the given domain, runId, and workflowId. The child policy, registered with the workflow type or specified when starting this execution, is applied to any open child workflow executions of this workflow execution.
    
     If the identified workflow execution was in progress, it is terminated immediately.
     
      If a runId isn't specified, then the [WorkflowExecutionTerminated] event is recorded in the history of the current open workflow with the matching workflowId in the domain.
      
       You should consider using [RequestCancelWorkflowExecution] action instead because it allows the workflow to gracefully close while [TerminateWorkflowExecution] doesn't.
       
        {b Access Control}
        
         You can use IAM policies to control this action's access to Amazon SWF resources as follows:
         
          {ul
               {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                  
                  }
                {- Use an [Action] element to allow or deny permission to call this action.
                   
                   }
                {- You cannot use an IAM policy to constrain this action's parameters.
                   
                   }
               
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module UndeprecateActivityType : sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_activity_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeAlreadyExistsFault of type_already_exists_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Undeprecates a previously deprecated {i activity type}. After an activity type has been undeprecated, you can create new tasks of that activity type.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                 
                  {ul
                       {- [activityType.name]: String constraint. The key is [swf:activityType.name].
                          
                          }
                        {- [activityType.version]: String constraint. The key is [swf:activityType.version].
                           
                           }
                       
               }
               }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module UndeprecateDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_domain_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DomainAlreadyExistsFault of domain_already_exists_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Undeprecates a previously deprecated domain. After a domain has been undeprecated it can be used to create new workflow executions or register new types.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- You cannot use an IAM policy to constrain this action's parameters.
                 
                 }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module UndeprecateWorkflowType : sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_workflow_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeAlreadyExistsFault of type_already_exists_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Undeprecates a previously deprecated {i workflow type}. After a workflow type has been undeprecated, you can create new executions of that type.
    
     This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.
     
      {b Access Control}
      
       You can use IAM policies to control this action's access to Amazon SWF resources as follows:
       
        {ul
             {- Use a [Resource] element with the domain name to limit the action to only specified domains.
                
                }
              {- Use an [Action] element to allow or deny permission to call this action.
                 
                 }
              {- Constrain the following parameters by using a [Condition] element with the appropriate keys.
                 
                  {ul
                       {- [workflowType.name]: String constraint. The key is [swf:workflowType.name].
                          
                          }
                        {- [workflowType.version]: String constraint. The key is [swf:workflowType.version].
                           
                           }
                       
               }
               }
             
      }
       If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.
        *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
  (** 
    Remove a tag from a Amazon SWF domain.
     *)

  
end

