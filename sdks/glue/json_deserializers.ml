open Smaws_Lib.Json.DeserializeHelpers
open Types

let table_name_string_of_yojson = string_of_yojson
let metric_counts_of_yojson = long_of_yojson
let glue_connection_name_string_of_yojson = string_of_yojson
let dpu_hours_of_yojson = double_of_yojson
let dpu_duration_in_hour_of_yojson = double_of_yojson
let dpu_counts_of_yojson = int_of_yojson
let database_name_string_of_yojson = string_of_yojson
let name_string_of_yojson = string_of_yojson
let classification_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let version_id_of_yojson = long_of_yojson
let row_tag_of_yojson = string_of_yojson

let xml_classifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     row_tag = option_of_yojson (value_for_key row_tag_of_yojson "RowTag") _list path;
     version = option_of_yojson (value_for_key version_id_of_yojson "Version") _list path;
     last_updated = option_of_yojson (value_for_key timestamp_of_yojson "LastUpdated") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     classification = value_for_key classification_of_yojson "Classification" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : xml_classifier)

let generic_string_of_yojson = string_of_yojson
let id_string_of_yojson = string_of_yojson

let workflow_run_properties_of_yojson tree path =
  map_of_yojson id_string_of_yojson generic_string_of_yojson tree path

let timestamp_value_of_yojson = timestamp_epoch_seconds_of_yojson

let workflow_run_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "COMPLETED" -> COMPLETED
    | `String "RUNNING" -> RUNNING
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkflowRunStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkflowRunStatus")
     : workflow_run_status)
    : workflow_run_status)

let error_string_of_yojson = string_of_yojson
let integer_value_of_yojson = int_of_yojson

let workflow_run_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     waiting_actions =
       option_of_yojson (value_for_key integer_value_of_yojson "WaitingActions") _list path;
     errored_actions =
       option_of_yojson (value_for_key integer_value_of_yojson "ErroredActions") _list path;
     running_actions =
       option_of_yojson (value_for_key integer_value_of_yojson "RunningActions") _list path;
     succeeded_actions =
       option_of_yojson (value_for_key integer_value_of_yojson "SucceededActions") _list path;
     stopped_actions =
       option_of_yojson (value_for_key integer_value_of_yojson "StoppedActions") _list path;
     failed_actions =
       option_of_yojson (value_for_key integer_value_of_yojson "FailedActions") _list path;
     timeout_actions =
       option_of_yojson (value_for_key integer_value_of_yojson "TimeoutActions") _list path;
     total_actions =
       option_of_yojson (value_for_key integer_value_of_yojson "TotalActions") _list path;
   }
    : workflow_run_statistics)

let node_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRIGGER" -> TRIGGER
    | `String "JOB" -> JOB
    | `String "CRAWLER" -> CRAWLER
    | `String value -> raise (deserialize_unknown_enum_value_error path "NodeType" value)
    | _ -> raise (deserialize_wrong_type_error path "NodeType")
     : node_type)
    : node_type)

let trigger_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EVENT" -> EVENT
    | `String "ON_DEMAND" -> ON_DEMAND
    | `String "CONDITIONAL" -> CONDITIONAL
    | `String "SCHEDULED" -> SCHEDULED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TriggerType" value)
    | _ -> raise (deserialize_wrong_type_error path "TriggerType")
     : trigger_type)
    : trigger_type)

let trigger_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "DEACTIVATED" -> DEACTIVATED
    | `String "DEACTIVATING" -> DEACTIVATING
    | `String "ACTIVATED" -> ACTIVATED
    | `String "ACTIVATING" -> ACTIVATING
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "TriggerState" value)
    | _ -> raise (deserialize_wrong_type_error path "TriggerState")
     : trigger_state)
    : trigger_state)

let description_string_of_yojson = string_of_yojson

let generic_map_of_yojson tree path =
  map_of_yojson generic_string_of_yojson generic_string_of_yojson tree path

let timeout_of_yojson = int_of_yojson
let notify_delay_after_of_yojson = int_of_yojson

let notification_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_delay_after =
       option_of_yojson (value_for_key notify_delay_after_of_yojson "NotifyDelayAfter") _list path;
   }
    : notification_property)

let action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     crawler_name = option_of_yojson (value_for_key name_string_of_yojson "CrawlerName") _list path;
     notification_property =
       option_of_yojson
         (value_for_key notification_property_of_yojson "NotificationProperty")
         _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     arguments = option_of_yojson (value_for_key generic_map_of_yojson "Arguments") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
   }
    : action)

let action_list_of_yojson tree path = list_of_yojson action_of_yojson tree path

let logical_of_yojson (tree : t) path =
  ((match tree with
    | `String "ANY" -> ANY
    | `String "AND" -> AND
    | `String value -> raise (deserialize_unknown_enum_value_error path "Logical" value)
    | _ -> raise (deserialize_wrong_type_error path "Logical")
     : logical)
    : logical)

let logical_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogicalOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "LogicalOperator")
     : logical_operator)
    : logical_operator)

let job_run_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXPIRED" -> EXPIRED
    | `String "WAITING" -> WAITING
    | `String "ERROR" -> ERROR
    | `String "TIMEOUT" -> TIMEOUT
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "RUNNING" -> RUNNING
    | `String "STARTING" -> STARTING
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobRunState" value)
    | _ -> raise (deserialize_wrong_type_error path "JobRunState")
     : job_run_state)
    : job_run_state)

let crawl_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "CANCELLED" -> CANCELLED
    | `String "CANCELLING" -> CANCELLING
    | `String "RUNNING" -> RUNNING
    | `String value -> raise (deserialize_unknown_enum_value_error path "CrawlState" value)
    | _ -> raise (deserialize_wrong_type_error path "CrawlState")
     : crawl_state)
    : crawl_state)

let condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     crawl_state = option_of_yojson (value_for_key crawl_state_of_yojson "CrawlState") _list path;
     crawler_name = option_of_yojson (value_for_key name_string_of_yojson "CrawlerName") _list path;
     state = option_of_yojson (value_for_key job_run_state_of_yojson "State") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
     logical_operator =
       option_of_yojson (value_for_key logical_operator_of_yojson "LogicalOperator") _list path;
   }
    : condition)

let condition_list_of_yojson tree path = list_of_yojson condition_of_yojson tree path

let predicate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conditions = option_of_yojson (value_for_key condition_list_of_yojson "Conditions") _list path;
     logical = option_of_yojson (value_for_key logical_of_yojson "Logical") _list path;
   }
    : predicate)

let batch_size_of_yojson = int_of_yojson
let batch_window_of_yojson = int_of_yojson

let event_batching_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_window = option_of_yojson (value_for_key batch_window_of_yojson "BatchWindow") _list path;
     batch_size = value_for_key batch_size_of_yojson "BatchSize" _list path;
   }
    : event_batching_condition)

let trigger_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_batching_condition =
       option_of_yojson
         (value_for_key event_batching_condition_of_yojson "EventBatchingCondition")
         _list path;
     predicate = option_of_yojson (value_for_key predicate_of_yojson "Predicate") _list path;
     actions = option_of_yojson (value_for_key action_list_of_yojson "Actions") _list path;
     schedule = option_of_yojson (value_for_key generic_string_of_yojson "Schedule") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     state = option_of_yojson (value_for_key trigger_state_of_yojson "State") _list path;
     type_ = option_of_yojson (value_for_key trigger_type_of_yojson "Type") _list path;
     id = option_of_yojson (value_for_key id_string_of_yojson "Id") _list path;
     workflow_name =
       option_of_yojson (value_for_key name_string_of_yojson "WorkflowName") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : trigger)

let trigger_node_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trigger = option_of_yojson (value_for_key trigger_of_yojson "Trigger") _list path }
    : trigger_node_details)

let attempt_count_of_yojson = int_of_yojson

let job_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOTEBOOK" -> NOTEBOOK
    | `String "VISUAL" -> VISUAL
    | `String "SCRIPT" -> SCRIPT
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobMode" value)
    | _ -> raise (deserialize_wrong_type_error path "JobMode")
     : job_mode)
    : job_mode)

let nullable_boolean_of_yojson = bool_of_yojson

let predecessor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
   }
    : predecessor)

let predecessor_list_of_yojson tree path = list_of_yojson predecessor_of_yojson tree path
let execution_time_of_yojson = int_of_yojson
let nullable_double_of_yojson = double_of_yojson

let worker_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Z.2X" -> Z_2X
    | `String "G.8X" -> G_8X
    | `String "G.4X" -> G_4X
    | `String "G.025X" -> G_025X
    | `String "G.2X" -> G_2X
    | `String "G.1X" -> G_1X
    | `String "Standard" -> Standard
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkerType" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkerType")
     : worker_type)
    : worker_type)

let nullable_integer_of_yojson = int_of_yojson
let glue_version_string_of_yojson = string_of_yojson

let execution_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD" -> STANDARD
    | `String "FLEX" -> FLEX
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionClass" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionClass")
     : execution_class)
    : execution_class)

let maintenance_window_of_yojson = string_of_yojson
let orchestration_message_string_of_yojson = string_of_yojson
let orchestration_policy_json_string_of_yojson = string_of_yojson

let job_run_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_role_session_policy =
       option_of_yojson
         (value_for_key orchestration_policy_json_string_of_yojson "ExecutionRoleSessionPolicy")
         _list path;
     state_detail =
       option_of_yojson
         (value_for_key orchestration_message_string_of_yojson "StateDetail")
         _list path;
     profile_name = option_of_yojson (value_for_key name_string_of_yojson "ProfileName") _list path;
     maintenance_window =
       option_of_yojson (value_for_key maintenance_window_of_yojson "MaintenanceWindow") _list path;
     execution_class =
       option_of_yojson (value_for_key execution_class_of_yojson "ExecutionClass") _list path;
     dpu_seconds =
       option_of_yojson (value_for_key nullable_double_of_yojson "DPUSeconds") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     notification_property =
       option_of_yojson
         (value_for_key notification_property_of_yojson "NotificationProperty")
         _list path;
     log_group_name =
       option_of_yojson (value_for_key generic_string_of_yojson "LogGroupName") _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     max_capacity =
       option_of_yojson (value_for_key nullable_double_of_yojson "MaxCapacity") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     execution_time =
       option_of_yojson (value_for_key execution_time_of_yojson "ExecutionTime") _list path;
     allocated_capacity =
       option_of_yojson (value_for_key integer_value_of_yojson "AllocatedCapacity") _list path;
     predecessor_runs =
       option_of_yojson (value_for_key predecessor_list_of_yojson "PredecessorRuns") _list path;
     error_message =
       option_of_yojson (value_for_key error_string_of_yojson "ErrorMessage") _list path;
     arguments = option_of_yojson (value_for_key generic_map_of_yojson "Arguments") _list path;
     job_run_state =
       option_of_yojson (value_for_key job_run_state_of_yojson "JobRunState") _list path;
     completed_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "CompletedOn") _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "LastModifiedOn") _list path;
     started_on = option_of_yojson (value_for_key timestamp_value_of_yojson "StartedOn") _list path;
     job_run_queuing_enabled =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "JobRunQueuingEnabled") _list path;
     job_mode = option_of_yojson (value_for_key job_mode_of_yojson "JobMode") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
     trigger_name = option_of_yojson (value_for_key name_string_of_yojson "TriggerName") _list path;
     previous_run_id =
       option_of_yojson (value_for_key id_string_of_yojson "PreviousRunId") _list path;
     attempt = option_of_yojson (value_for_key attempt_count_of_yojson "Attempt") _list path;
     id = option_of_yojson (value_for_key id_string_of_yojson "Id") _list path;
   }
    : job_run)

let job_run_list_of_yojson tree path = list_of_yojson job_run_of_yojson tree path

let job_node_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_runs = option_of_yojson (value_for_key job_run_list_of_yojson "JobRuns") _list path }
    : job_node_details)

let log_group_of_yojson = string_of_yojson
let log_stream_of_yojson = string_of_yojson

let crawl_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_stream = option_of_yojson (value_for_key log_stream_of_yojson "LogStream") _list path;
     log_group = option_of_yojson (value_for_key log_group_of_yojson "LogGroup") _list path;
     error_message =
       option_of_yojson (value_for_key description_string_of_yojson "ErrorMessage") _list path;
     completed_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "CompletedOn") _list path;
     started_on = option_of_yojson (value_for_key timestamp_value_of_yojson "StartedOn") _list path;
     state = option_of_yojson (value_for_key crawl_state_of_yojson "State") _list path;
   }
    : crawl)

let crawl_list_of_yojson tree path = list_of_yojson crawl_of_yojson tree path

let crawler_node_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ crawls = option_of_yojson (value_for_key crawl_list_of_yojson "Crawls") _list path }
    : crawler_node_details)

let node_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     crawler_details =
       option_of_yojson (value_for_key crawler_node_details_of_yojson "CrawlerDetails") _list path;
     job_details =
       option_of_yojson (value_for_key job_node_details_of_yojson "JobDetails") _list path;
     trigger_details =
       option_of_yojson (value_for_key trigger_node_details_of_yojson "TriggerDetails") _list path;
     unique_id = option_of_yojson (value_for_key name_string_of_yojson "UniqueId") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
     type_ = option_of_yojson (value_for_key node_type_of_yojson "Type") _list path;
   }
    : node)

let node_list_of_yojson tree path = list_of_yojson node_of_yojson tree path

let edge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_id =
       option_of_yojson (value_for_key name_string_of_yojson "DestinationId") _list path;
     source_id = option_of_yojson (value_for_key name_string_of_yojson "SourceId") _list path;
   }
    : edge)

let edge_list_of_yojson tree path = list_of_yojson edge_of_yojson tree path

let workflow_graph_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     edges = option_of_yojson (value_for_key edge_list_of_yojson "Edges") _list path;
     nodes = option_of_yojson (value_for_key node_list_of_yojson "Nodes") _list path;
   }
    : workflow_graph)

let starting_event_batch_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_window =
       option_of_yojson (value_for_key nullable_integer_of_yojson "BatchWindow") _list path;
     batch_size = option_of_yojson (value_for_key nullable_integer_of_yojson "BatchSize") _list path;
   }
    : starting_event_batch_condition)

let workflow_run_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     starting_event_batch_condition =
       option_of_yojson
         (value_for_key starting_event_batch_condition_of_yojson "StartingEventBatchCondition")
         _list path;
     graph = option_of_yojson (value_for_key workflow_graph_of_yojson "Graph") _list path;
     statistics =
       option_of_yojson (value_for_key workflow_run_statistics_of_yojson "Statistics") _list path;
     error_message =
       option_of_yojson (value_for_key error_string_of_yojson "ErrorMessage") _list path;
     status = option_of_yojson (value_for_key workflow_run_status_of_yojson "Status") _list path;
     completed_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "CompletedOn") _list path;
     started_on = option_of_yojson (value_for_key timestamp_value_of_yojson "StartedOn") _list path;
     workflow_run_properties =
       option_of_yojson
         (value_for_key workflow_run_properties_of_yojson "WorkflowRunProperties")
         _list path;
     previous_run_id =
       option_of_yojson (value_for_key id_string_of_yojson "PreviousRunId") _list path;
     workflow_run_id =
       option_of_yojson (value_for_key id_string_of_yojson "WorkflowRunId") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : workflow_run)

let orchestration_name_string_of_yojson = string_of_yojson

let blueprint_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path;
     blueprint_name =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "BlueprintName")
         _list path;
   }
    : blueprint_details)

let workflow_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blueprint_details =
       option_of_yojson (value_for_key blueprint_details_of_yojson "BlueprintDetails") _list path;
     max_concurrent_runs =
       option_of_yojson (value_for_key nullable_integer_of_yojson "MaxConcurrentRuns") _list path;
     graph = option_of_yojson (value_for_key workflow_graph_of_yojson "Graph") _list path;
     last_run = option_of_yojson (value_for_key workflow_run_of_yojson "LastRun") _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "LastModifiedOn") _list path;
     created_on = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedOn") _list path;
     default_run_properties =
       option_of_yojson
         (value_for_key workflow_run_properties_of_yojson "DefaultRunProperties")
         _list path;
     description =
       option_of_yojson (value_for_key generic_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : workflow)

let workflows_of_yojson tree path = list_of_yojson workflow_of_yojson tree path
let workflow_runs_of_yojson tree path = list_of_yojson workflow_run_of_yojson tree path
let workflow_names_of_yojson tree path = list_of_yojson name_string_of_yojson tree path
let workflow_description_string_of_yojson = string_of_yojson

let view_dialect_of_yojson (tree : t) path =
  ((match tree with
    | `String "SPARK" -> SPARK
    | `String "ATHENA" -> ATHENA
    | `String "REDSHIFT" -> REDSHIFT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ViewDialect" value)
    | _ -> raise (deserialize_wrong_type_error path "ViewDialect")
     : view_dialect)
    : view_dialect)

let view_dialect_version_string_of_yojson = string_of_yojson
let view_text_string_of_yojson = string_of_yojson

let resource_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "STOPPED" -> STOPPED
    | `String "SUCCESS" -> SUCCESS
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "QUEUED" -> QUEUED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceState" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceState")
     : resource_state)
    : resource_state)

let error_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key description_string_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key name_string_of_yojson "ErrorCode") _list path;
   }
    : error_detail)

let view_validation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key error_detail_of_yojson "Error") _list path;
     state = option_of_yojson (value_for_key resource_state_of_yojson "State") _list path;
     update_time = option_of_yojson (value_for_key timestamp_of_yojson "UpdateTime") _list path;
     view_validation_text =
       option_of_yojson (value_for_key view_text_string_of_yojson "ViewValidationText") _list path;
     dialect_version =
       option_of_yojson
         (value_for_key view_dialect_version_string_of_yojson "DialectVersion")
         _list path;
     dialect = option_of_yojson (value_for_key view_dialect_of_yojson "Dialect") _list path;
   }
    : view_validation)

let view_validation_list_of_yojson tree path = list_of_yojson view_validation_of_yojson tree path

let view_update_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "DROP" -> DROP
    | `String "ADD_OR_REPLACE" -> ADD_OR_REPLACE
    | `String "REPLACE" -> REPLACE
    | `String "ADD" -> ADD
    | `String value -> raise (deserialize_unknown_enum_value_error path "ViewUpdateAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ViewUpdateAction")
     : view_update_action)
    : view_update_action)

let arn_string_of_yojson = string_of_yojson
let view_sub_objects_list_of_yojson tree path = list_of_yojson arn_string_of_yojson tree path
let table_version_id_of_yojson = long_of_yojson

let view_sub_object_version_ids_list_of_yojson tree path =
  list_of_yojson table_version_id_of_yojson tree path

let view_representation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_stale = option_of_yojson (value_for_key nullable_boolean_of_yojson "IsStale") _list path;
     validation_connection =
       option_of_yojson (value_for_key name_string_of_yojson "ValidationConnection") _list path;
     view_expanded_text =
       option_of_yojson (value_for_key view_text_string_of_yojson "ViewExpandedText") _list path;
     view_original_text =
       option_of_yojson (value_for_key view_text_string_of_yojson "ViewOriginalText") _list path;
     dialect_version =
       option_of_yojson
         (value_for_key view_dialect_version_string_of_yojson "DialectVersion")
         _list path;
     dialect = option_of_yojson (value_for_key view_dialect_of_yojson "Dialect") _list path;
   }
    : view_representation)

let view_representation_list_of_yojson tree path =
  list_of_yojson view_representation_of_yojson tree path

let view_representation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     view_expanded_text =
       option_of_yojson (value_for_key view_text_string_of_yojson "ViewExpandedText") _list path;
     validation_connection =
       option_of_yojson (value_for_key name_string_of_yojson "ValidationConnection") _list path;
     view_original_text =
       option_of_yojson (value_for_key view_text_string_of_yojson "ViewOriginalText") _list path;
     dialect_version =
       option_of_yojson
         (value_for_key view_dialect_version_string_of_yojson "DialectVersion")
         _list path;
     dialect = option_of_yojson (value_for_key view_dialect_of_yojson "Dialect") _list path;
   }
    : view_representation_input)

let view_representation_input_list_of_yojson tree path =
  list_of_yojson view_representation_input_of_yojson tree path

let version_string_of_yojson = string_of_yojson
let refresh_seconds_of_yojson = long_of_yojson

let last_refresh_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INCREMENTAL" -> INCREMENTAL
    | `String "FULL" -> FULL
    | `String value -> raise (deserialize_unknown_enum_value_error path "LastRefreshType" value)
    | _ -> raise (deserialize_wrong_type_error path "LastRefreshType")
     : last_refresh_type)
    : last_refresh_type)

let view_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sub_object_version_ids =
       option_of_yojson
         (value_for_key view_sub_object_version_ids_list_of_yojson "SubObjectVersionIds")
         _list path;
     sub_objects =
       option_of_yojson (value_for_key view_sub_objects_list_of_yojson "SubObjects") _list path;
     last_refresh_type =
       option_of_yojson (value_for_key last_refresh_type_of_yojson "LastRefreshType") _list path;
     refresh_seconds =
       option_of_yojson (value_for_key refresh_seconds_of_yojson "RefreshSeconds") _list path;
     view_version_token =
       option_of_yojson (value_for_key version_string_of_yojson "ViewVersionToken") _list path;
     view_version_id =
       option_of_yojson (value_for_key table_version_id_of_yojson "ViewVersionId") _list path;
     representations =
       option_of_yojson
         (value_for_key view_representation_input_list_of_yojson "Representations")
         _list path;
     definer = option_of_yojson (value_for_key arn_string_of_yojson "Definer") _list path;
     is_protected =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IsProtected") _list path;
   }
    : view_definition_input)

let hash_string_of_yojson = string_of_yojson

let view_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     representations =
       option_of_yojson
         (value_for_key view_representation_list_of_yojson "Representations")
         _list path;
     sub_object_version_ids =
       option_of_yojson
         (value_for_key view_sub_object_version_ids_list_of_yojson "SubObjectVersionIds")
         _list path;
     sub_objects =
       option_of_yojson (value_for_key view_sub_objects_list_of_yojson "SubObjects") _list path;
     last_refresh_type =
       option_of_yojson (value_for_key last_refresh_type_of_yojson "LastRefreshType") _list path;
     refresh_seconds =
       option_of_yojson (value_for_key refresh_seconds_of_yojson "RefreshSeconds") _list path;
     view_version_token =
       option_of_yojson (value_for_key hash_string_of_yojson "ViewVersionToken") _list path;
     view_version_id =
       option_of_yojson (value_for_key table_version_id_of_yojson "ViewVersionId") _list path;
     definer = option_of_yojson (value_for_key arn_string_of_yojson "Definer") _list path;
     is_protected =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IsProtected") _list path;
   }
    : view_definition)

let versions_string_of_yojson = string_of_yojson
let message_string_of_yojson = string_of_yojson

let version_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : version_mismatch_exception)

let version_long_number_of_yojson = long_of_yojson
let vendor_of_yojson = string_of_yojson
let value_string_of_yojson = string_of_yojson
let value_string_list_of_yojson tree path = list_of_yojson value_string_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : validation_exception)

let username_of_yojson = string_of_yojson
let user_managed_client_application_client_secret_of_yojson = string_of_yojson
let user_managed_client_application_client_id_of_yojson = string_of_yojson

let function_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STORED_PROCEDURE" -> STORED_PROCEDURE
    | `String "AGGREGATE_FUNCTION" -> AGGREGATE_FUNCTION
    | `String "REGULAR_FUNCTION" -> REGULAR_FUNCTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "FunctionType" value)
    | _ -> raise (deserialize_wrong_type_error path "FunctionType")
     : function_type)
    : function_type)

let principal_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GROUP" -> GROUP
    | `String "ROLE" -> ROLE
    | `String "USER" -> USER
    | `String value -> raise (deserialize_unknown_enum_value_error path "PrincipalType" value)
    | _ -> raise (deserialize_wrong_type_error path "PrincipalType")
     : principal_type)
    : principal_type)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ARCHIVE" -> ARCHIVE
    | `String "FILE" -> FILE
    | `String "JAR" -> JAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let ur_i_of_yojson = string_of_yojson

let resource_uri_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     uri = option_of_yojson (value_for_key ur_i_of_yojson "Uri") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
   }
    : resource_uri)

let resource_uri_list_of_yojson tree path = list_of_yojson resource_uri_of_yojson tree path
let catalog_id_string_of_yojson = string_of_yojson

let user_defined_function_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
     resource_uris =
       option_of_yojson (value_for_key resource_uri_list_of_yojson "ResourceUris") _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "CreateTime") _list path;
     owner_type = option_of_yojson (value_for_key principal_type_of_yojson "OwnerType") _list path;
     function_type =
       option_of_yojson (value_for_key function_type_of_yojson "FunctionType") _list path;
     owner_name = option_of_yojson (value_for_key name_string_of_yojson "OwnerName") _list path;
     class_name = option_of_yojson (value_for_key name_string_of_yojson "ClassName") _list path;
     database_name =
       option_of_yojson (value_for_key name_string_of_yojson "DatabaseName") _list path;
     function_name =
       option_of_yojson (value_for_key name_string_of_yojson "FunctionName") _list path;
   }
    : user_defined_function)

let user_defined_function_list_of_yojson tree path =
  list_of_yojson user_defined_function_of_yojson tree path

let user_defined_function_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_uris =
       option_of_yojson (value_for_key resource_uri_list_of_yojson "ResourceUris") _list path;
     owner_type = option_of_yojson (value_for_key principal_type_of_yojson "OwnerType") _list path;
     function_type =
       option_of_yojson (value_for_key function_type_of_yojson "FunctionType") _list path;
     owner_name = option_of_yojson (value_for_key name_string_of_yojson "OwnerName") _list path;
     class_name = option_of_yojson (value_for_key name_string_of_yojson "ClassName") _list path;
     function_name =
       option_of_yojson (value_for_key name_string_of_yojson "FunctionName") _list path;
   }
    : user_defined_function_input)

let usage_profile_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "LastModifiedOn") _list path;
     created_on = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedOn") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : usage_profile_definition)

let usage_profile_definition_list_of_yojson tree path =
  list_of_yojson usage_profile_definition_of_yojson tree path

let url_string_of_yojson = string_of_yojson
let uri_string_of_yojson = string_of_yojson
let enclosed_in_string_property_of_yojson = string_of_yojson

let enclosed_in_string_properties_min_one_of_yojson tree path =
  list_of_yojson enclosed_in_string_property_of_yojson tree path

let upsert_redshift_target_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     upsert_keys =
       option_of_yojson
         (value_for_key enclosed_in_string_properties_min_one_of_yojson "UpsertKeys")
         _list path;
     connection_name =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "ConnectionName")
         _list path;
     table_location =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "TableLocation")
         _list path;
   }
    : upsert_redshift_target_options)

let updated_timestamp_of_yojson = string_of_yojson
let updated_at_of_yojson = timestamp_epoch_seconds_of_yojson

let update_xml_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     row_tag = option_of_yojson (value_for_key row_tag_of_yojson "RowTag") _list path;
     classification =
       option_of_yojson (value_for_key classification_of_yojson "Classification") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : update_xml_classifier_request)

let update_workflow_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : update_workflow_response)

let update_workflow_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_concurrent_runs =
       option_of_yojson (value_for_key nullable_integer_of_yojson "MaxConcurrentRuns") _list path;
     default_run_properties =
       option_of_yojson
         (value_for_key workflow_run_properties_of_yojson "DefaultRunProperties")
         _list path;
     description =
       option_of_yojson
         (value_for_key workflow_description_string_of_yojson "Description")
         _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : update_workflow_request)

let operation_timeout_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : operation_timeout_exception)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_federation_source =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "FromFederationSource") _list path;
     message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path;
   }
    : invalid_input_exception)

let internal_service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : internal_service_exception)

let entity_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_federation_source =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "FromFederationSource") _list path;
     message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path;
   }
    : entity_not_found_exception)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : concurrent_modification_exception)

let update_user_defined_function_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_user_defined_function_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     function_input = value_for_key user_defined_function_input_of_yojson "FunctionInput" _list path;
     function_name = value_for_key name_string_of_yojson "FunctionName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : update_user_defined_function_request)

let glue_encryption_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : glue_encryption_exception)

let update_usage_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : update_usage_profile_response)

let config_value_string_of_yojson = string_of_yojson

let allowed_values_string_list_of_yojson tree path =
  list_of_yojson config_value_string_of_yojson tree path

let configuration_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_value =
       option_of_yojson (value_for_key config_value_string_of_yojson "MaxValue") _list path;
     min_value =
       option_of_yojson (value_for_key config_value_string_of_yojson "MinValue") _list path;
     allowed_values =
       option_of_yojson
         (value_for_key allowed_values_string_list_of_yojson "AllowedValues")
         _list path;
     default_value =
       option_of_yojson (value_for_key config_value_string_of_yojson "DefaultValue") _list path;
   }
    : configuration_object)

let configuration_map_of_yojson tree path =
  map_of_yojson name_string_of_yojson configuration_object_of_yojson tree path

let profile_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_configuration =
       option_of_yojson (value_for_key configuration_map_of_yojson "JobConfiguration") _list path;
     session_configuration =
       option_of_yojson
         (value_for_key configuration_map_of_yojson "SessionConfiguration")
         _list path;
   }
    : profile_configuration)

let update_usage_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration = value_for_key profile_configuration_of_yojson "Configuration" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : update_usage_profile_request)

let operation_not_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : operation_not_supported_exception)

let update_trigger_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trigger = option_of_yojson (value_for_key trigger_of_yojson "Trigger") _list path }
    : update_trigger_response)

let trigger_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_batching_condition =
       option_of_yojson
         (value_for_key event_batching_condition_of_yojson "EventBatchingCondition")
         _list path;
     predicate = option_of_yojson (value_for_key predicate_of_yojson "Predicate") _list path;
     actions = option_of_yojson (value_for_key action_list_of_yojson "Actions") _list path;
     schedule = option_of_yojson (value_for_key generic_string_of_yojson "Schedule") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : trigger_update)

let update_trigger_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trigger_update = value_for_key trigger_update_of_yojson "TriggerUpdate" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : update_trigger_request)

let update_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let non_negative_integer_of_yojson = int_of_yojson
let column_type_string_of_yojson = string_of_yojson
let comment_string_of_yojson = string_of_yojson
let parameters_map_value_of_yojson = string_of_yojson
let key_string_of_yojson = string_of_yojson

let parameters_map_of_yojson tree path =
  map_of_yojson key_string_of_yojson parameters_map_value_of_yojson tree path

let column_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     comment = option_of_yojson (value_for_key comment_string_of_yojson "Comment") _list path;
     type_ = option_of_yojson (value_for_key column_type_string_of_yojson "Type") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : column)

let column_list_of_yojson tree path = list_of_yojson column_of_yojson tree path
let location_string_of_yojson = string_of_yojson
let location_string_list_of_yojson tree path = list_of_yojson location_string_of_yojson tree path
let format_string_of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson
let integer_of_yojson = int_of_yojson

let ser_de_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     serialization_library =
       option_of_yojson (value_for_key name_string_of_yojson "SerializationLibrary") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : ser_de_info)

let name_string_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path
let integer_flag_of_yojson = int_of_yojson

let order_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = value_for_key integer_flag_of_yojson "SortOrder" _list path;
     column = value_for_key name_string_of_yojson "Column" _list path;
   }
    : order)

let order_list_of_yojson tree path = list_of_yojson order_of_yojson tree path
let column_values_string_of_yojson = string_of_yojson

let column_value_string_list_of_yojson tree path =
  list_of_yojson column_values_string_of_yojson tree path

let location_map_of_yojson tree path =
  map_of_yojson column_values_string_of_yojson column_values_string_of_yojson tree path

let skewed_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     skewed_column_value_location_maps =
       option_of_yojson
         (value_for_key location_map_of_yojson "SkewedColumnValueLocationMaps")
         _list path;
     skewed_column_values =
       option_of_yojson
         (value_for_key column_value_string_list_of_yojson "SkewedColumnValues")
         _list path;
     skewed_column_names =
       option_of_yojson (value_for_key name_string_list_of_yojson "SkewedColumnNames") _list path;
   }
    : skewed_info)

let glue_resource_arn_of_yojson = string_of_yojson
let schema_registry_name_string_of_yojson = string_of_yojson

let schema_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
     schema_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "SchemaName")
         _list path;
     schema_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "SchemaArn") _list path;
   }
    : schema_id)

let schema_version_id_string_of_yojson = string_of_yojson

let schema_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_version_number =
       option_of_yojson
         (value_for_key version_long_number_of_yojson "SchemaVersionNumber")
         _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
     schema_id = option_of_yojson (value_for_key schema_id_of_yojson "SchemaId") _list path;
   }
    : schema_reference)

let storage_descriptor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_reference =
       option_of_yojson (value_for_key schema_reference_of_yojson "SchemaReference") _list path;
     stored_as_sub_directories =
       option_of_yojson (value_for_key boolean__of_yojson "StoredAsSubDirectories") _list path;
     skewed_info = option_of_yojson (value_for_key skewed_info_of_yojson "SkewedInfo") _list path;
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     sort_columns = option_of_yojson (value_for_key order_list_of_yojson "SortColumns") _list path;
     bucket_columns =
       option_of_yojson (value_for_key name_string_list_of_yojson "BucketColumns") _list path;
     serde_info = option_of_yojson (value_for_key ser_de_info_of_yojson "SerdeInfo") _list path;
     number_of_buckets =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfBuckets") _list path;
     compressed = option_of_yojson (value_for_key boolean__of_yojson "Compressed") _list path;
     output_format =
       option_of_yojson (value_for_key format_string_of_yojson "OutputFormat") _list path;
     input_format =
       option_of_yojson (value_for_key format_string_of_yojson "InputFormat") _list path;
     additional_locations =
       option_of_yojson
         (value_for_key location_string_list_of_yojson "AdditionalLocations")
         _list path;
     location = option_of_yojson (value_for_key location_string_of_yojson "Location") _list path;
     columns = option_of_yojson (value_for_key column_list_of_yojson "Columns") _list path;
   }
    : storage_descriptor)

let table_type_string_of_yojson = string_of_yojson

let table_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region = option_of_yojson (value_for_key name_string_of_yojson "Region") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
     database_name =
       option_of_yojson (value_for_key name_string_of_yojson "DatabaseName") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : table_identifier)

let table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     view_definition =
       option_of_yojson (value_for_key view_definition_input_of_yojson "ViewDefinition") _list path;
     target_table =
       option_of_yojson (value_for_key table_identifier_of_yojson "TargetTable") _list path;
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     table_type =
       option_of_yojson (value_for_key table_type_string_of_yojson "TableType") _list path;
     view_expanded_text =
       option_of_yojson (value_for_key view_text_string_of_yojson "ViewExpandedText") _list path;
     view_original_text =
       option_of_yojson (value_for_key view_text_string_of_yojson "ViewOriginalText") _list path;
     partition_keys =
       option_of_yojson (value_for_key column_list_of_yojson "PartitionKeys") _list path;
     storage_descriptor =
       option_of_yojson (value_for_key storage_descriptor_of_yojson "StorageDescriptor") _list path;
     retention =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "Retention") _list path;
     last_analyzed_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAnalyzedTime") _list path;
     last_access_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAccessTime") _list path;
     owner = option_of_yojson (value_for_key name_string_of_yojson "Owner") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : table_input)

let boolean_nullable_of_yojson = bool_of_yojson
let transaction_id_string_of_yojson = string_of_yojson
let integer_list_of_yojson tree path = list_of_yojson integer_of_yojson tree path

let iceberg_struct_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "struct" -> STRUCT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IcebergStructTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "IcebergStructTypeEnum")
     : iceberg_struct_type_enum)
    : iceberg_struct_type_enum)

let column_name_string_of_yojson = string_of_yojson
let iceberg_document_of_yojson = json_of_yojson

let iceberg_struct_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     write_default =
       option_of_yojson (value_for_key iceberg_document_of_yojson "WriteDefault") _list path;
     initial_default =
       option_of_yojson (value_for_key iceberg_document_of_yojson "InitialDefault") _list path;
     doc = option_of_yojson (value_for_key comment_string_of_yojson "Doc") _list path;
     required = value_for_key boolean__of_yojson "Required" _list path;
     type_ = value_for_key iceberg_document_of_yojson "Type" _list path;
     name = value_for_key column_name_string_of_yojson "Name" _list path;
     id = value_for_key integer_of_yojson "Id" _list path;
   }
    : iceberg_struct_field)

let iceberg_struct_field_list_of_yojson tree path =
  list_of_yojson iceberg_struct_field_of_yojson tree path

let iceberg_schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fields = value_for_key iceberg_struct_field_list_of_yojson "Fields" _list path;
     type_ = option_of_yojson (value_for_key iceberg_struct_type_enum_of_yojson "Type") _list path;
     identifier_field_ids =
       option_of_yojson (value_for_key integer_list_of_yojson "IdentifierFieldIds") _list path;
     schema_id = option_of_yojson (value_for_key integer_of_yojson "SchemaId") _list path;
   }
    : iceberg_schema)

let iceberg_transform_string_of_yojson = string_of_yojson

let iceberg_partition_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_id = option_of_yojson (value_for_key integer_of_yojson "FieldId") _list path;
     name = value_for_key column_name_string_of_yojson "Name" _list path;
     transform = value_for_key iceberg_transform_string_of_yojson "Transform" _list path;
     source_id = value_for_key integer_of_yojson "SourceId" _list path;
   }
    : iceberg_partition_field)

let iceberg_partition_spec_field_list_of_yojson tree path =
  list_of_yojson iceberg_partition_field_of_yojson tree path

let iceberg_partition_spec_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     spec_id = option_of_yojson (value_for_key integer_of_yojson "SpecId") _list path;
     fields = value_for_key iceberg_partition_spec_field_list_of_yojson "Fields" _list path;
   }
    : iceberg_partition_spec)

let iceberg_sort_direction_of_yojson (tree : t) path =
  ((match tree with
    | `String "desc" -> DESC
    | `String "asc" -> ASC
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IcebergSortDirection" value)
    | _ -> raise (deserialize_wrong_type_error path "IcebergSortDirection")
     : iceberg_sort_direction)
    : iceberg_sort_direction)

let iceberg_null_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "nulls-last" -> NULLS_LAST
    | `String "nulls-first" -> NULLS_FIRST
    | `String value -> raise (deserialize_unknown_enum_value_error path "IcebergNullOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "IcebergNullOrder")
     : iceberg_null_order)
    : iceberg_null_order)

let iceberg_sort_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     null_order = value_for_key iceberg_null_order_of_yojson "NullOrder" _list path;
     direction = value_for_key iceberg_sort_direction_of_yojson "Direction" _list path;
     transform = value_for_key iceberg_transform_string_of_yojson "Transform" _list path;
     source_id = value_for_key integer_of_yojson "SourceId" _list path;
   }
    : iceberg_sort_field)

let iceberg_sort_order_field_list_of_yojson tree path =
  list_of_yojson iceberg_sort_field_of_yojson tree path

let iceberg_sort_order_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fields = value_for_key iceberg_sort_order_field_list_of_yojson "Fields" _list path;
     order_id = value_for_key integer_of_yojson "OrderId" _list path;
   }
    : iceberg_sort_order)

let nullable_string_of_yojson = string_of_yojson

let string_to_string_map_of_yojson tree path =
  map_of_yojson nullable_string_of_yojson nullable_string_of_yojson tree path

let iceberg_update_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "remove-encryption-key" -> REMOVE_ENCRYPTION_KEY
    | `String "add-encryption-key" -> ADD_ENCRYPTION_KEY
    | `String "remove-properties" -> REMOVE_PROPERTIES
    | `String "set-properties" -> SET_PROPERTIES
    | `String "set-location" -> SET_LOCATION
    | `String "set-default-sort-order" -> SET_DEFAULT_SORT_ORDER
    | `String "add-sort-order" -> ADD_SORT_ORDER
    | `String "set-default-spec" -> SET_DEFAULT_SPEC
    | `String "add-spec" -> ADD_SPEC
    | `String "set-current-schema" -> SET_CURRENT_SCHEMA
    | `String "add-schema" -> ADD_SCHEMA
    | `String value -> raise (deserialize_unknown_enum_value_error path "IcebergUpdateAction" value)
    | _ -> raise (deserialize_wrong_type_error path "IcebergUpdateAction")
     : iceberg_update_action)
    : iceberg_update_action)

let encryption_key_id_string_of_yojson = string_of_yojson
let encrypted_key_metadata_string_of_yojson = string_of_yojson

let iceberg_encrypted_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties =
       option_of_yojson (value_for_key string_to_string_map_of_yojson "Properties") _list path;
     encrypted_by_id =
       option_of_yojson
         (value_for_key encryption_key_id_string_of_yojson "EncryptedById")
         _list path;
     encrypted_key_metadata =
       value_for_key encrypted_key_metadata_string_of_yojson "EncryptedKeyMetadata" _list path;
     key_id = value_for_key encryption_key_id_string_of_yojson "KeyId" _list path;
   }
    : iceberg_encrypted_key)

let iceberg_table_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key encryption_key_id_string_of_yojson "KeyId") _list path;
     encryption_key =
       option_of_yojson (value_for_key iceberg_encrypted_key_of_yojson "EncryptionKey") _list path;
     action = option_of_yojson (value_for_key iceberg_update_action_of_yojson "Action") _list path;
     properties =
       option_of_yojson (value_for_key string_to_string_map_of_yojson "Properties") _list path;
     location = value_for_key location_string_of_yojson "Location" _list path;
     sort_order =
       option_of_yojson (value_for_key iceberg_sort_order_of_yojson "SortOrder") _list path;
     partition_spec =
       option_of_yojson (value_for_key iceberg_partition_spec_of_yojson "PartitionSpec") _list path;
     schema = value_for_key iceberg_schema_of_yojson "Schema" _list path;
   }
    : iceberg_table_update)

let iceberg_table_update_list_of_yojson tree path =
  list_of_yojson iceberg_table_update_of_yojson tree path

let update_iceberg_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ updates = value_for_key iceberg_table_update_list_of_yojson "Updates" _list path }
    : update_iceberg_table_input)

let update_iceberg_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_iceberg_table_input =
       value_for_key update_iceberg_table_input_of_yojson "UpdateIcebergTableInput" _list path;
   }
    : update_iceberg_input)

let update_open_table_format_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_iceberg_input =
       option_of_yojson
         (value_for_key update_iceberg_input_of_yojson "UpdateIcebergInput")
         _list path;
   }
    : update_open_table_format_input)

let update_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_open_table_format_input =
       option_of_yojson
         (value_for_key update_open_table_format_input_of_yojson "UpdateOpenTableFormatInput")
         _list path;
     force = option_of_yojson (value_for_key boolean__of_yojson "Force") _list path;
     view_update_action =
       option_of_yojson (value_for_key view_update_action_of_yojson "ViewUpdateAction") _list path;
     version_id = option_of_yojson (value_for_key version_string_of_yojson "VersionId") _list path;
     transaction_id =
       option_of_yojson (value_for_key transaction_id_string_of_yojson "TransactionId") _list path;
     skip_archive =
       option_of_yojson (value_for_key boolean_nullable_of_yojson "SkipArchive") _list path;
     table_input = option_of_yojson (value_for_key table_input_of_yojson "TableInput") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : update_table_request)

let update_table_optimizer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let table_optimizer_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "orphan_file_deletion" -> ORPHAN_FILE_DELETION
    | `String "retention" -> RETENTION
    | `String "compaction" -> COMPACTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "TableOptimizerType" value)
    | _ -> raise (deserialize_wrong_type_error path "TableOptimizerType")
     : table_optimizer_type)
    : table_optimizer_type)

let table_optimizer_vpc_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "glueConnectionName" -> GlueConnectionName (glue_connection_name_string_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "TableOptimizerVpcConfiguration" unknown)
    : table_optimizer_vpc_configuration)

let compaction_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "z-order" -> ZORDER
    | `String "sort" -> SORT
    | `String "binpack" -> BINPACK
    | `String value -> raise (deserialize_unknown_enum_value_error path "CompactionStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "CompactionStrategy")
     : compaction_strategy)
    : compaction_strategy)

let iceberg_compaction_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_file_threshold =
       option_of_yojson (value_for_key nullable_integer_of_yojson "deleteFileThreshold") _list path;
     min_input_files =
       option_of_yojson (value_for_key nullable_integer_of_yojson "minInputFiles") _list path;
     strategy = option_of_yojson (value_for_key compaction_strategy_of_yojson "strategy") _list path;
   }
    : iceberg_compaction_configuration)

let compaction_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iceberg_configuration =
       option_of_yojson
         (value_for_key iceberg_compaction_configuration_of_yojson "icebergConfiguration")
         _list path;
   }
    : compaction_configuration)

let iceberg_retention_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_rate_in_hours =
       option_of_yojson (value_for_key nullable_integer_of_yojson "runRateInHours") _list path;
     clean_expired_files =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "cleanExpiredFiles") _list path;
     number_of_snapshots_to_retain =
       option_of_yojson
         (value_for_key nullable_integer_of_yojson "numberOfSnapshotsToRetain")
         _list path;
     snapshot_retention_period_in_days =
       option_of_yojson
         (value_for_key nullable_integer_of_yojson "snapshotRetentionPeriodInDays")
         _list path;
   }
    : iceberg_retention_configuration)

let retention_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iceberg_configuration =
       option_of_yojson
         (value_for_key iceberg_retention_configuration_of_yojson "icebergConfiguration")
         _list path;
   }
    : retention_configuration)

let iceberg_orphan_file_deletion_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_rate_in_hours =
       option_of_yojson (value_for_key nullable_integer_of_yojson "runRateInHours") _list path;
     location = option_of_yojson (value_for_key message_string_of_yojson "location") _list path;
     orphan_file_retention_period_in_days =
       option_of_yojson
         (value_for_key nullable_integer_of_yojson "orphanFileRetentionPeriodInDays")
         _list path;
   }
    : iceberg_orphan_file_deletion_configuration)

let orphan_file_deletion_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iceberg_configuration =
       option_of_yojson
         (value_for_key iceberg_orphan_file_deletion_configuration_of_yojson "icebergConfiguration")
         _list path;
   }
    : orphan_file_deletion_configuration)

let table_optimizer_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     orphan_file_deletion_configuration =
       option_of_yojson
         (value_for_key orphan_file_deletion_configuration_of_yojson
            "orphanFileDeletionConfiguration")
         _list path;
     retention_configuration =
       option_of_yojson
         (value_for_key retention_configuration_of_yojson "retentionConfiguration")
         _list path;
     compaction_configuration =
       option_of_yojson
         (value_for_key compaction_configuration_of_yojson "compactionConfiguration")
         _list path;
     vpc_configuration =
       option_of_yojson
         (value_for_key table_optimizer_vpc_configuration_of_yojson "vpcConfiguration")
         _list path;
     enabled = option_of_yojson (value_for_key nullable_boolean_of_yojson "enabled") _list path;
     role_arn = option_of_yojson (value_for_key arn_string_of_yojson "roleArn") _list path;
   }
    : table_optimizer_configuration)

let update_table_optimizer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_optimizer_configuration =
       value_for_key table_optimizer_configuration_of_yojson "TableOptimizerConfiguration" _list
         path;
     type_ = value_for_key table_optimizer_type_of_yojson "Type" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id = value_for_key catalog_id_string_of_yojson "CatalogId" _list path;
   }
    : update_table_optimizer_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : throttling_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : access_denied_exception)

let resource_number_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : resource_number_limit_exceeded_exception)

let resource_not_ready_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : resource_not_ready_exception)

let federation_source_retryable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : federation_source_retryable_exception)

let federation_source_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "ThrottlingException" -> ThrottlingException
    | `String "PartialFailureException" -> PartialFailureException
    | `String "InternalServiceException" -> InternalServiceException
    | `String "OperationNotSupportedException" -> OperationNotSupportedException
    | `String "OperationTimeoutException" -> OperationTimeoutException
    | `String "InvalidResponseException" -> InvalidResponseException
    | `String "InvalidInputException" -> InvalidInputException
    | `String "InvalidCredentialsException" -> InvalidCredentialsException
    | `String "EntityNotFoundException" -> EntityNotFoundException
    | `String "AccessDeniedException" -> AccessDeniedException
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FederationSourceErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "FederationSourceErrorCode")
     : federation_source_error_code)
    : federation_source_error_code)

let federation_source_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path;
     federation_source_error_code =
       option_of_yojson
         (value_for_key federation_source_error_code_of_yojson "FederationSourceErrorCode")
         _list path;
   }
    : federation_source_exception)

let already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : already_exists_exception)

let update_source_control_from_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path }
    : update_source_control_from_job_response)

let source_control_provider_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_CODE_COMMIT" -> AWS_CODE_COMMIT
    | `String "BITBUCKET" -> BITBUCKET
    | `String "GITLAB" -> GITLAB
    | `String "GITHUB" -> GITHUB
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SourceControlProvider" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceControlProvider")
     : source_control_provider)
    : source_control_provider)

let commit_id_string_of_yojson = string_of_yojson

let source_control_auth_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_SECRETS_MANAGER" -> AWS_SECRETS_MANAGER
    | `String "PERSONAL_ACCESS_TOKEN" -> PERSONAL_ACCESS_TOKEN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SourceControlAuthStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceControlAuthStrategy")
     : source_control_auth_strategy)
    : source_control_auth_strategy)

let auth_token_string_of_yojson = string_of_yojson

let update_source_control_from_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auth_token =
       option_of_yojson (value_for_key auth_token_string_of_yojson "AuthToken") _list path;
     auth_strategy =
       option_of_yojson
         (value_for_key source_control_auth_strategy_of_yojson "AuthStrategy")
         _list path;
     commit_id = option_of_yojson (value_for_key commit_id_string_of_yojson "CommitId") _list path;
     folder = option_of_yojson (value_for_key name_string_of_yojson "Folder") _list path;
     branch_name = option_of_yojson (value_for_key name_string_of_yojson "BranchName") _list path;
     repository_owner =
       option_of_yojson (value_for_key name_string_of_yojson "RepositoryOwner") _list path;
     repository_name =
       option_of_yojson (value_for_key name_string_of_yojson "RepositoryName") _list path;
     provider =
       option_of_yojson (value_for_key source_control_provider_of_yojson "Provider") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
   }
    : update_source_control_from_job_request)

let update_schema_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
     schema_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "SchemaName")
         _list path;
     schema_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "SchemaArn") _list path;
   }
    : update_schema_response)

let latest_schema_version_boolean_of_yojson = bool_of_yojson

let schema_version_number_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version_number =
       option_of_yojson (value_for_key version_long_number_of_yojson "VersionNumber") _list path;
     latest_version =
       option_of_yojson
         (value_for_key latest_schema_version_boolean_of_yojson "LatestVersion")
         _list path;
   }
    : schema_version_number)

let compatibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "FULL_ALL" -> FULL_ALL
    | `String "FULL" -> FULL
    | `String "FORWARD_ALL" -> FORWARD_ALL
    | `String "FORWARD" -> FORWARD
    | `String "BACKWARD_ALL" -> BACKWARD_ALL
    | `String "BACKWARD" -> BACKWARD
    | `String "DISABLED" -> DISABLED
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Compatibility" value)
    | _ -> raise (deserialize_wrong_type_error path "Compatibility")
     : compatibility)
    : compatibility)

let update_schema_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     compatibility =
       option_of_yojson (value_for_key compatibility_of_yojson "Compatibility") _list path;
     schema_version_number =
       option_of_yojson
         (value_for_key schema_version_number_of_yojson "SchemaVersionNumber")
         _list path;
     schema_id = value_for_key schema_id_of_yojson "SchemaId" _list path;
   }
    : update_schema_input)

let update_registry_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "RegistryArn") _list path;
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
   }
    : update_registry_response)

let registry_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "RegistryArn") _list path;
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
   }
    : registry_id)

let update_registry_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = value_for_key description_string_of_yojson "Description" _list path;
     registry_id = value_for_key registry_id_of_yojson "RegistryId" _list path;
   }
    : update_registry_input)

let update_partition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let bounded_partition_value_list_of_yojson tree path =
  list_of_yojson value_string_of_yojson tree path

let partition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_analyzed_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAnalyzedTime") _list path;
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     storage_descriptor =
       option_of_yojson (value_for_key storage_descriptor_of_yojson "StorageDescriptor") _list path;
     last_access_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAccessTime") _list path;
     values = option_of_yojson (value_for_key value_string_list_of_yojson "Values") _list path;
   }
    : partition_input)

let update_partition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partition_input = value_for_key partition_input_of_yojson "PartitionInput" _list path;
     partition_value_list =
       value_for_key bounded_partition_value_list_of_yojson "PartitionValueList" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : update_partition_request)

let update_ml_transform_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transform_id = option_of_yojson (value_for_key hash_string_of_yojson "TransformId") _list path;
   }
    : update_ml_transform_response)

let transform_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIND_MATCHES" -> FIND_MATCHES
    | `String value -> raise (deserialize_unknown_enum_value_error path "TransformType" value)
    | _ -> raise (deserialize_wrong_type_error path "TransformType")
     : transform_type)
    : transform_type)

let generic_bounded_double_of_yojson = double_of_yojson

let find_matches_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enforce_provided_labels =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "EnforceProvidedLabels")
         _list path;
     accuracy_cost_tradeoff =
       option_of_yojson
         (value_for_key generic_bounded_double_of_yojson "AccuracyCostTradeoff")
         _list path;
     precision_recall_tradeoff =
       option_of_yojson
         (value_for_key generic_bounded_double_of_yojson "PrecisionRecallTradeoff")
         _list path;
     primary_key_column_name =
       option_of_yojson
         (value_for_key column_name_string_of_yojson "PrimaryKeyColumnName")
         _list path;
   }
    : find_matches_parameters)

let transform_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     find_matches_parameters =
       option_of_yojson
         (value_for_key find_matches_parameters_of_yojson "FindMatchesParameters")
         _list path;
     transform_type = value_for_key transform_type_of_yojson "TransformType" _list path;
   }
    : transform_parameters)

let role_string_of_yojson = string_of_yojson

let update_ml_transform_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_retries =
       option_of_yojson (value_for_key nullable_integer_of_yojson "MaxRetries") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     max_capacity =
       option_of_yojson (value_for_key nullable_double_of_yojson "MaxCapacity") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     role = option_of_yojson (value_for_key role_string_of_yojson "Role") _list path;
     parameters =
       option_of_yojson (value_for_key transform_parameters_of_yojson "Parameters") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
     transform_id = value_for_key hash_string_of_yojson "TransformId" _list path;
   }
    : update_ml_transform_request)

let json_path_of_yojson = string_of_yojson

let update_json_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     json_path = option_of_yojson (value_for_key json_path_of_yojson "JsonPath") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : update_json_classifier_request)

let update_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path }
    : update_job_response)

let max_concurrent_runs_of_yojson = int_of_yojson

let execution_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_concurrent_runs =
       option_of_yojson (value_for_key max_concurrent_runs_of_yojson "MaxConcurrentRuns") _list path;
   }
    : execution_property)

let script_location_string_of_yojson = string_of_yojson
let python_version_string_of_yojson = string_of_yojson
let runtime_name_string_of_yojson = string_of_yojson

let job_command_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     runtime = option_of_yojson (value_for_key runtime_name_string_of_yojson "Runtime") _list path;
     python_version =
       option_of_yojson (value_for_key python_version_string_of_yojson "PythonVersion") _list path;
     script_location =
       option_of_yojson (value_for_key script_location_string_of_yojson "ScriptLocation") _list path;
     name = option_of_yojson (value_for_key generic_string_of_yojson "Name") _list path;
   }
    : job_command)

let connection_string_of_yojson = string_of_yojson

let connection_string_list_of_yojson tree path =
  list_of_yojson connection_string_of_yojson tree path

let connections_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connections =
       option_of_yojson (value_for_key connection_string_list_of_yojson "Connections") _list path;
   }
    : connections_list)

let max_retries_of_yojson = int_of_yojson
let node_name_of_yojson = string_of_yojson
let enclosed_in_string_property_with_quote_of_yojson = string_of_yojson
let glue_studio_column_name_string_of_yojson = string_of_yojson

let glue_studio_schema_column_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     glue_studio_type =
       option_of_yojson (value_for_key column_type_string_of_yojson "GlueStudioType") _list path;
     type_ = option_of_yojson (value_for_key column_type_string_of_yojson "Type") _list path;
     name = value_for_key glue_studio_column_name_string_of_yojson "Name" _list path;
   }
    : glue_studio_schema_column)

let glue_studio_schema_column_list_of_yojson tree path =
  list_of_yojson glue_studio_schema_column_of_yojson tree path

let glue_schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     columns =
       option_of_yojson
         (value_for_key glue_studio_schema_column_list_of_yojson "Columns")
         _list path;
   }
    : glue_schema)

let glue_schemas_of_yojson tree path = list_of_yojson glue_schema_of_yojson tree path

let athena_connector_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     schema_name = value_for_key enclosed_in_string_property_of_yojson "SchemaName" _list path;
     connection_table =
       option_of_yojson
         (value_for_key enclosed_in_string_property_with_quote_of_yojson "ConnectionTable")
         _list path;
     connection_type =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionType" _list path;
     connector_name = value_for_key enclosed_in_string_property_of_yojson "ConnectorName" _list path;
     connection_name =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionName" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : athena_connector_source)

let boxed_non_negative_long_of_yojson = long_of_yojson

let enclosed_in_string_properties_of_yojson tree path =
  list_of_yojson enclosed_in_string_property_of_yojson tree path

let glue_record_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DOUBLE" -> DOUBLE
    | `String "SHORT" -> SHORT
    | `String "BYTE" -> BYTE
    | `String "BIGDECIMAL" -> BIGDECIMAL
    | `String "LONG" -> LONG
    | `String "FLOAT" -> FLOAT
    | `String "INT" -> INT
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String "STRING" -> STRING
    | `String "DATE" -> DATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "GlueRecordType" value)
    | _ -> raise (deserialize_wrong_type_error path "GlueRecordType")
     : glue_record_type)
    : glue_record_type)

let jdbc_data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VARCHAR" -> VARCHAR
    | `String "VARBINARY" -> VARBINARY
    | `String "TINYINT" -> TINYINT
    | `String "TIMESTAMP_WITH_TIMEZONE" -> TIMESTAMP_WITH_TIMEZONE
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String "TIME_WITH_TIMEZONE" -> TIME_WITH_TIMEZONE
    | `String "TIME" -> TIME
    | `String "STRUCT" -> STRUCT
    | `String "SQLXML" -> SQLXML
    | `String "SMALLINT" -> SMALLINT
    | `String "ROWID" -> ROWID
    | `String "REF_CURSOR" -> REF_CURSOR
    | `String "REF" -> REF
    | `String "REAL" -> REAL
    | `String "OTHER" -> OTHER
    | `String "NVARCHAR" -> NVARCHAR
    | `String "NUMERIC" -> NUMERIC
    | `String "NULL" -> NULL
    | `String "NCLOB" -> NCLOB
    | `String "NCHAR" -> NCHAR
    | `String "LONGVARCHAR" -> LONGVARCHAR
    | `String "LONGVARBINARY" -> LONGVARBINARY
    | `String "LONGNVARCHAR" -> LONGNVARCHAR
    | `String "JAVA_OBJECT" -> JAVA_OBJECT
    | `String "INTEGER" -> INTEGER
    | `String "FLOAT" -> FLOAT
    | `String "DOUBLE" -> DOUBLE
    | `String "DISTINCT" -> DISTINCT
    | `String "DECIMAL" -> DECIMAL
    | `String "DATE" -> DATE
    | `String "DATALINK" -> DATALINK
    | `String "CLOB" -> CLOB
    | `String "CHAR" -> CHAR
    | `String "BOOLEAN" -> BOOLEAN
    | `String "BLOB" -> BLOB
    | `String "BIT" -> BIT
    | `String "BINARY" -> BINARY
    | `String "BIGINT" -> BIGINT
    | `String "ARRAY" -> ARRAY
    | `String value -> raise (deserialize_unknown_enum_value_error path "JDBCDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "JDBCDataType")
     : jdbc_data_type)
    : jdbc_data_type)

let jdbc_data_type_mapping_of_yojson tree path =
  map_of_yojson jdbc_data_type_of_yojson glue_record_type_of_yojson tree path

let jdbc_connector_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_type_mapping =
       option_of_yojson
         (value_for_key jdbc_data_type_mapping_of_yojson "DataTypeMapping")
         _list path;
     job_bookmark_keys_sort_order =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "JobBookmarkKeysSortOrder")
         _list path;
     job_bookmark_keys =
       option_of_yojson
         (value_for_key enclosed_in_string_properties_of_yojson "JobBookmarkKeys")
         _list path;
     num_partitions =
       option_of_yojson (value_for_key boxed_non_negative_long_of_yojson "NumPartitions") _list path;
     upper_bound =
       option_of_yojson (value_for_key boxed_non_negative_long_of_yojson "UpperBound") _list path;
     lower_bound =
       option_of_yojson (value_for_key boxed_non_negative_long_of_yojson "LowerBound") _list path;
     partition_column =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "PartitionColumn")
         _list path;
     filter_predicate =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "FilterPredicate")
         _list path;
   }
    : jdbc_connector_options)

let sql_query_of_yojson = string_of_yojson

let jdbc_connector_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     query = option_of_yojson (value_for_key sql_query_of_yojson "Query") _list path;
     connection_table =
       option_of_yojson
         (value_for_key enclosed_in_string_property_with_quote_of_yojson "ConnectionTable")
         _list path;
     additional_options =
       option_of_yojson
         (value_for_key jdbc_connector_options_of_yojson "AdditionalOptions")
         _list path;
     connection_type =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionType" _list path;
     connector_name = value_for_key enclosed_in_string_property_of_yojson "ConnectorName" _list path;
     connection_name =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionName" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : jdbc_connector_source)

let additional_options_of_yojson tree path =
  map_of_yojson enclosed_in_string_property_of_yojson enclosed_in_string_property_of_yojson tree
    path

let spark_connector_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_options =
       option_of_yojson (value_for_key additional_options_of_yojson "AdditionalOptions") _list path;
     connection_type =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionType" _list path;
     connector_name = value_for_key enclosed_in_string_property_of_yojson "ConnectorName" _list path;
     connection_name =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionName" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : spark_connector_source)

let catalog_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     partition_predicate =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "PartitionPredicate")
         _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : catalog_source)

let redshift_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tmp_dir_iam_role =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "TmpDirIAMRole")
         _list path;
     redshift_tmp_dir =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "RedshiftTmpDir")
         _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : redshift_source)

let boxed_long_of_yojson = long_of_yojson

let s3_source_additional_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bounded_files = option_of_yojson (value_for_key boxed_long_of_yojson "BoundedFiles") _list path;
     bounded_size = option_of_yojson (value_for_key boxed_long_of_yojson "BoundedSize") _list path;
   }
    : s3_source_additional_options)

let s3_catalog_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_options =
       option_of_yojson
         (value_for_key s3_source_additional_options_of_yojson "AdditionalOptions")
         _list path;
     partition_predicate =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "PartitionPredicate")
         _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_catalog_source)

let compression_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "bzip2" -> BZIP2
    | `String "gzip" -> GZIP
    | `String value -> raise (deserialize_unknown_enum_value_error path "CompressionType" value)
    | _ -> raise (deserialize_wrong_type_error path "CompressionType")
     : compression_type)
    : compression_type)

let boxed_boolean_of_yojson = bool_of_yojson
let boxed_non_negative_int_of_yojson = int_of_yojson

let s3_direct_source_additional_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sample_path =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "SamplePath")
         _list path;
     enable_sample_path =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "EnableSamplePath") _list path;
     bounded_files = option_of_yojson (value_for_key boxed_long_of_yojson "BoundedFiles") _list path;
     bounded_size = option_of_yojson (value_for_key boxed_long_of_yojson "BoundedSize") _list path;
   }
    : s3_direct_source_additional_options)

let separator_of_yojson (tree : t) path =
  ((match tree with
    | `String "tab" -> TAB
    | `String "semicolon" -> SEMICOLON
    | `String "pipe" -> PIPE
    | `String "ctrla" -> CTRLA
    | `String "comma" -> COMMA
    | `String value -> raise (deserialize_unknown_enum_value_error path "Separator" value)
    | _ -> raise (deserialize_wrong_type_error path "Separator")
     : separator)
    : separator)

let quote_char_of_yojson (tree : t) path =
  ((match tree with
    | `String "disabled" -> DISABLED
    | `String "single_quote" -> SINGLE_QUOTE
    | `String "quillemet" -> QUILLEMET
    | `String "quote" -> QUOTE
    | `String value -> raise (deserialize_unknown_enum_value_error path "QuoteChar" value)
    | _ -> raise (deserialize_wrong_type_error path "QuoteChar")
     : quote_char)
    : quote_char)

let boolean_value_of_yojson = bool_of_yojson

let s3_csv_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     optimize_performance =
       option_of_yojson (value_for_key boolean_value_of_yojson "OptimizePerformance") _list path;
     skip_first = option_of_yojson (value_for_key boxed_boolean_of_yojson "SkipFirst") _list path;
     write_header =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "WriteHeader") _list path;
     with_header = option_of_yojson (value_for_key boxed_boolean_of_yojson "WithHeader") _list path;
     multiline = option_of_yojson (value_for_key boxed_boolean_of_yojson "Multiline") _list path;
     quote_char = value_for_key quote_char_of_yojson "QuoteChar" _list path;
     escaper =
       option_of_yojson
         (value_for_key enclosed_in_string_property_with_quote_of_yojson "Escaper")
         _list path;
     separator = value_for_key separator_of_yojson "Separator" _list path;
     additional_options =
       option_of_yojson
         (value_for_key s3_direct_source_additional_options_of_yojson "AdditionalOptions")
         _list path;
     max_files_in_band =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "MaxFilesInBand") _list path;
     max_band =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "MaxBand") _list path;
     recurse = option_of_yojson (value_for_key boxed_boolean_of_yojson "Recurse") _list path;
     group_files =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "GroupFiles")
         _list path;
     group_size =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "GroupSize") _list path;
     exclusions =
       option_of_yojson
         (value_for_key enclosed_in_string_properties_of_yojson "Exclusions")
         _list path;
     compression_type =
       option_of_yojson (value_for_key compression_type_of_yojson "CompressionType") _list path;
     paths = value_for_key enclosed_in_string_properties_of_yojson "Paths" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_csv_source)

let s3_json_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     multiline = option_of_yojson (value_for_key boxed_boolean_of_yojson "Multiline") _list path;
     json_path =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "JsonPath") _list path;
     additional_options =
       option_of_yojson
         (value_for_key s3_direct_source_additional_options_of_yojson "AdditionalOptions")
         _list path;
     max_files_in_band =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "MaxFilesInBand") _list path;
     max_band =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "MaxBand") _list path;
     recurse = option_of_yojson (value_for_key boxed_boolean_of_yojson "Recurse") _list path;
     group_files =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "GroupFiles")
         _list path;
     group_size =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "GroupSize") _list path;
     exclusions =
       option_of_yojson
         (value_for_key enclosed_in_string_properties_of_yojson "Exclusions")
         _list path;
     compression_type =
       option_of_yojson (value_for_key compression_type_of_yojson "CompressionType") _list path;
     paths = value_for_key enclosed_in_string_properties_of_yojson "Paths" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_json_source)

let parquet_compression_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> NONE
    | `String "uncompressed" -> UNCOMPRESSED
    | `String "lz4" -> LZ4
    | `String "brotli" -> BROTLI
    | `String "gzip" -> GZIP
    | `String "lzo" -> LZO
    | `String "snappy" -> SNAPPY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ParquetCompressionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ParquetCompressionType")
     : parquet_compression_type)
    : parquet_compression_type)

let s3_parquet_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_options =
       option_of_yojson
         (value_for_key s3_direct_source_additional_options_of_yojson "AdditionalOptions")
         _list path;
     max_files_in_band =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "MaxFilesInBand") _list path;
     max_band =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "MaxBand") _list path;
     recurse = option_of_yojson (value_for_key boxed_boolean_of_yojson "Recurse") _list path;
     group_files =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "GroupFiles")
         _list path;
     group_size =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "GroupSize") _list path;
     exclusions =
       option_of_yojson
         (value_for_key enclosed_in_string_properties_of_yojson "Exclusions")
         _list path;
     compression_type =
       option_of_yojson
         (value_for_key parquet_compression_type_of_yojson "CompressionType")
         _list path;
     paths = value_for_key enclosed_in_string_properties_of_yojson "Paths" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_parquet_source)

let relational_catalog_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : relational_catalog_source)

let ddbelt_catalog_additional_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dynamodb_unnest_ddb_json =
       option_of_yojson (value_for_key boolean_value_of_yojson "DynamodbUnnestDDBJson") _list path;
     dynamodb_export =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "DynamodbExport")
         _list path;
   }
    : ddbelt_catalog_additional_options)

let dynamo_db_catalog_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_options =
       option_of_yojson
         (value_for_key ddbelt_catalog_additional_options_of_yojson "AdditionalOptions")
         _list path;
     pitr_enabled =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "PitrEnabled") _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : dynamo_db_catalog_source)

let node_id_of_yojson = string_of_yojson
let one_input_of_yojson tree path = list_of_yojson node_id_of_yojson tree path

let jdbc_connector_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_options =
       option_of_yojson (value_for_key additional_options_of_yojson "AdditionalOptions") _list path;
     connection_type =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionType" _list path;
     connector_name = value_for_key enclosed_in_string_property_of_yojson "ConnectorName" _list path;
     connection_table =
       value_for_key enclosed_in_string_property_with_quote_of_yojson "ConnectionTable" _list path;
     connection_name =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionName" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : jdbc_connector_target)

let spark_connector_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_options =
       option_of_yojson (value_for_key additional_options_of_yojson "AdditionalOptions") _list path;
     connection_type =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionType" _list path;
     connector_name = value_for_key enclosed_in_string_property_of_yojson "ConnectorName" _list path;
     connection_name =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionName" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : spark_connector_target)

let glue_studio_path_list_of_yojson tree path =
  list_of_yojson enclosed_in_string_properties_of_yojson tree path

let basic_catalog_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : basic_catalog_target)

let redshift_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     upsert_redshift_options =
       option_of_yojson
         (value_for_key upsert_redshift_target_options_of_yojson "UpsertRedshiftOptions")
         _list path;
     tmp_dir_iam_role =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "TmpDirIAMRole")
         _list path;
     redshift_tmp_dir =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "RedshiftTmpDir")
         _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : redshift_target)

let update_catalog_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "LOG" -> LOG
    | `String "UPDATE_IN_DATABASE" -> UPDATE_IN_DATABASE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UpdateCatalogBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateCatalogBehavior")
     : update_catalog_behavior)
    : update_catalog_behavior)

let catalog_schema_change_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_behavior =
       option_of_yojson
         (value_for_key update_catalog_behavior_of_yojson "UpdateBehavior")
         _list path;
     enable_update_catalog =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "EnableUpdateCatalog") _list path;
   }
    : catalog_schema_change_policy)

let auto_data_quality_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_context =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "EvaluationContext")
         _list path;
     is_enabled = option_of_yojson (value_for_key boolean_value_of_yojson "IsEnabled") _list path;
   }
    : auto_data_quality)

let s3_catalog_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_data_quality =
       option_of_yojson (value_for_key auto_data_quality_of_yojson "AutoDataQuality") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key catalog_schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_catalog_target)

let number_target_partitions_string_of_yojson = string_of_yojson

let direct_schema_change_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "Database") _list path;
     table =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "Table") _list path;
     update_behavior =
       option_of_yojson
         (value_for_key update_catalog_behavior_of_yojson "UpdateBehavior")
         _list path;
     enable_update_catalog =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "EnableUpdateCatalog") _list path;
   }
    : direct_schema_change_policy)

let s3_glue_parquet_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_data_quality =
       option_of_yojson (value_for_key auto_data_quality_of_yojson "AutoDataQuality") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key direct_schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     number_target_partitions =
       option_of_yojson
         (value_for_key number_target_partitions_string_of_yojson "NumberTargetPartitions")
         _list path;
     compression =
       option_of_yojson (value_for_key parquet_compression_type_of_yojson "Compression") _list path;
     path = value_for_key enclosed_in_string_property_of_yojson "Path" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_glue_parquet_target)

let target_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "xml" -> XML
    | `String "hyper" -> HYPER
    | `String "iceberg" -> ICEBERG
    | `String "delta" -> DELTA
    | `String "hudi" -> HUDI
    | `String "parquet" -> PARQUET
    | `String "orc" -> ORC
    | `String "avro" -> AVRO
    | `String "csv" -> CSV
    | `String "json" -> JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetFormat")
     : target_format)
    : target_format)

let s3_direct_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     auto_data_quality =
       option_of_yojson (value_for_key auto_data_quality_of_yojson "AutoDataQuality") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key direct_schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     format = value_for_key target_format_of_yojson "Format" _list path;
     number_target_partitions =
       option_of_yojson
         (value_for_key number_target_partitions_string_of_yojson "NumberTargetPartitions")
         _list path;
     compression =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "Compression")
         _list path;
     path = value_for_key enclosed_in_string_property_of_yojson "Path" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_direct_target)

let rec mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     children = option_of_yojson (value_for_key mappings_of_yojson "Children") _list path;
     dropped = option_of_yojson (value_for_key boxed_boolean_of_yojson "Dropped") _list path;
     to_type =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "ToType") _list path;
     from_type =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "FromType") _list path;
     from_path =
       option_of_yojson
         (value_for_key enclosed_in_string_properties_of_yojson "FromPath")
         _list path;
     to_key =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "ToKey") _list path;
   }
    : mapping)

and mappings_of_yojson tree path = list_of_yojson mapping_of_yojson tree path

let apply_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mapping = value_for_key mappings_of_yojson "Mapping" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : apply_mapping)

let select_fields_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     paths = value_for_key glue_studio_path_list_of_yojson "Paths" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : select_fields)

let drop_fields_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     paths = value_for_key glue_studio_path_list_of_yojson "Paths" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : drop_fields)

let rename_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_path = value_for_key enclosed_in_string_properties_of_yojson "TargetPath" _list path;
     source_path = value_for_key enclosed_in_string_properties_of_yojson "SourcePath" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : rename_field)

let topk_of_yojson = int_of_yojson
let prob_of_yojson = double_of_yojson

let spigot_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prob = option_of_yojson (value_for_key prob_of_yojson "Prob") _list path;
     topk = option_of_yojson (value_for_key topk_of_yojson "Topk") _list path;
     path = value_for_key enclosed_in_string_property_of_yojson "Path" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : spigot)

let two_inputs_of_yojson tree path = list_of_yojson node_id_of_yojson tree path

let join_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "leftanti" -> LEFT_ANTI
    | `String "leftsemi" -> LEFT_SEMI
    | `String "outer" -> OUTER
    | `String "right" -> RIGHT
    | `String "left" -> LEFT
    | `String "equijoin" -> EQUIJOIN
    | `String value -> raise (deserialize_unknown_enum_value_error path "JoinType" value)
    | _ -> raise (deserialize_wrong_type_error path "JoinType")
     : join_type)
    : join_type)

let join_column_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     keys = value_for_key glue_studio_path_list_of_yojson "Keys" _list path;
     from_ = value_for_key enclosed_in_string_property_of_yojson "From" _list path;
   }
    : join_column)

let join_columns_of_yojson tree path = list_of_yojson join_column_of_yojson tree path

let join_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     columns = value_for_key join_columns_of_yojson "Columns" _list path;
     join_type = value_for_key join_type_of_yojson "JoinType" _list path;
     inputs = value_for_key two_inputs_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : join)

let split_fields_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     paths = value_for_key glue_studio_path_list_of_yojson "Paths" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : split_fields)

let non_negative_int_of_yojson = int_of_yojson

let select_from_collection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index = value_for_key non_negative_int_of_yojson "Index" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : select_from_collection)

let fill_missing_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filled_path =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "FilledPath")
         _list path;
     imputed_path = value_for_key enclosed_in_string_property_of_yojson "ImputedPath" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : fill_missing_values)

let filter_logical_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "OR" -> OR
    | `String "AND" -> AND
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FilterLogicalOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterLogicalOperator")
     : filter_logical_operator)
    : filter_logical_operator)

let filter_operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "ISNULL" -> ISNULL
    | `String "REGEX" -> REGEX
    | `String "GTE" -> GTE
    | `String "LTE" -> LTE
    | `String "GT" -> GT
    | `String "LT" -> LT
    | `String "EQ" -> EQ
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterOperation" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterOperation")
     : filter_operation)
    : filter_operation)

let filter_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONSTANT" -> CONSTANT
    | `String "COLUMNEXTRACTED" -> COLUMNEXTRACTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterValueType")
     : filter_value_type)
    : filter_value_type)

let filter_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key enclosed_in_string_properties_of_yojson "Value" _list path;
     type_ = value_for_key filter_value_type_of_yojson "Type" _list path;
   }
    : filter_value)

let filter_values_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let filter_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = value_for_key filter_values_of_yojson "Values" _list path;
     negated = option_of_yojson (value_for_key boxed_boolean_of_yojson "Negated") _list path;
     operation = value_for_key filter_operation_of_yojson "Operation" _list path;
   }
    : filter_expression)

let filter_expressions_of_yojson tree path = list_of_yojson filter_expression_of_yojson tree path

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = value_for_key filter_expressions_of_yojson "Filters" _list path;
     logical_operator = value_for_key filter_logical_operator_of_yojson "LogicalOperator" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : filter)

let many_inputs_of_yojson tree path = list_of_yojson node_id_of_yojson tree path
let extended_string_of_yojson = string_of_yojson

let custom_code_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     class_name = value_for_key enclosed_in_string_property_of_yojson "ClassName" _list path;
     code = value_for_key extended_string_of_yojson "Code" _list path;
     inputs = value_for_key many_inputs_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : custom_code)

let sql_alias_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias = value_for_key enclosed_in_string_property_with_quote_of_yojson "Alias" _list path;
     from_ = value_for_key node_id_of_yojson "From" _list path;
   }
    : sql_alias)

let sql_aliases_of_yojson tree path = list_of_yojson sql_alias_of_yojson tree path

let spark_sq_l_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     sql_aliases = value_for_key sql_aliases_of_yojson "SqlAliases" _list path;
     sql_query = value_for_key sql_query_of_yojson "SqlQuery" _list path;
     inputs = value_for_key many_inputs_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : spark_sq_l)

let boxed_positive_int_of_yojson = int_of_yojson

let starting_position_of_yojson (tree : t) path =
  ((match tree with
    | `String "timestamp" -> TIMESTAMP
    | `String "earliest" -> EARLIEST
    | `String "trim_horizon" -> TRIM_HORIZON
    | `String "latest" -> LATEST
    | `String value -> raise (deserialize_unknown_enum_value_error path "StartingPosition" value)
    | _ -> raise (deserialize_wrong_type_error path "StartingPosition")
     : starting_position)
    : starting_position)

let iso8601_date_time_of_yojson = timestamp_iso_8601_of_yojson

let kinesis_streaming_source_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fanout_consumer_ar_n =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "FanoutConsumerARN")
         _list path;
     starting_timestamp =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "StartingTimestamp") _list path;
     emit_consumer_lag_metrics =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "EmitConsumerLagMetrics")
         _list path;
     add_record_timestamp =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "AddRecordTimestamp")
         _list path;
     role_session_name =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "RoleSessionName")
         _list path;
     role_arn =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "RoleArn") _list path;
     stream_arn =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "StreamArn") _list path;
     avoid_empty_batches =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "AvoidEmptyBatches") _list path;
     max_retry_interval_ms =
       option_of_yojson
         (value_for_key boxed_non_negative_long_of_yojson "MaxRetryIntervalMs")
         _list path;
     retry_interval_ms =
       option_of_yojson
         (value_for_key boxed_non_negative_long_of_yojson "RetryIntervalMs")
         _list path;
     num_retries =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "NumRetries") _list path;
     describe_shard_interval =
       option_of_yojson
         (value_for_key boxed_non_negative_long_of_yojson "DescribeShardInterval")
         _list path;
     idle_time_between_reads_in_ms =
       option_of_yojson
         (value_for_key boxed_non_negative_long_of_yojson "IdleTimeBetweenReadsInMs")
         _list path;
     add_idle_time_between_reads =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "AddIdleTimeBetweenReads") _list path;
     max_record_per_read =
       option_of_yojson
         (value_for_key boxed_non_negative_long_of_yojson "MaxRecordPerRead")
         _list path;
     max_fetch_records_per_shard =
       option_of_yojson
         (value_for_key boxed_non_negative_long_of_yojson "MaxFetchRecordsPerShard")
         _list path;
     max_fetch_time_in_ms =
       option_of_yojson
         (value_for_key boxed_non_negative_long_of_yojson "MaxFetchTimeInMs")
         _list path;
     starting_position =
       option_of_yojson (value_for_key starting_position_of_yojson "StartingPosition") _list path;
     delimiter =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "Delimiter") _list path;
     classification =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "Classification")
         _list path;
     stream_name =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "StreamName")
         _list path;
     endpoint_url =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "EndpointUrl")
         _list path;
   }
    : kinesis_streaming_source_options)

let polling_time_of_yojson = long_of_yojson
let positive_long_of_yojson = long_of_yojson

let streaming_data_preview_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_polling_limit =
       option_of_yojson (value_for_key positive_long_of_yojson "RecordPollingLimit") _list path;
     polling_time = option_of_yojson (value_for_key polling_time_of_yojson "PollingTime") _list path;
   }
    : streaming_data_preview_options)

let direct_kinesis_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_preview_options =
       option_of_yojson
         (value_for_key streaming_data_preview_options_of_yojson "DataPreviewOptions")
         _list path;
     streaming_options =
       option_of_yojson
         (value_for_key kinesis_streaming_source_options_of_yojson "StreamingOptions")
         _list path;
     detect_schema =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "DetectSchema") _list path;
     window_size =
       option_of_yojson (value_for_key boxed_positive_int_of_yojson "WindowSize") _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : direct_kinesis_source)

let kafka_streaming_source_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     starting_timestamp =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "StartingTimestamp") _list path;
     emit_consumer_lag_metrics =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "EmitConsumerLagMetrics")
         _list path;
     add_record_timestamp =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "AddRecordTimestamp")
         _list path;
     include_headers =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "IncludeHeaders") _list path;
     min_partitions =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "MinPartitions") _list path;
     max_offsets_per_trigger =
       option_of_yojson
         (value_for_key boxed_non_negative_long_of_yojson "MaxOffsetsPerTrigger")
         _list path;
     retry_interval_ms =
       option_of_yojson
         (value_for_key boxed_non_negative_long_of_yojson "RetryIntervalMs")
         _list path;
     num_retries =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "NumRetries") _list path;
     poll_timeout_ms =
       option_of_yojson (value_for_key boxed_non_negative_long_of_yojson "PollTimeoutMs") _list path;
     ending_offsets =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "EndingOffsets")
         _list path;
     starting_offsets =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "StartingOffsets")
         _list path;
     delimiter =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "Delimiter") _list path;
     classification =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "Classification")
         _list path;
     subscribe_pattern =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "SubscribePattern")
         _list path;
     assign =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "Assign") _list path;
     topic_name =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "TopicName") _list path;
     connection_name =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "ConnectionName")
         _list path;
     security_protocol =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "SecurityProtocol")
         _list path;
     bootstrap_servers =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "BootstrapServers")
         _list path;
   }
    : kafka_streaming_source_options)

let direct_kafka_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_preview_options =
       option_of_yojson
         (value_for_key streaming_data_preview_options_of_yojson "DataPreviewOptions")
         _list path;
     detect_schema =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "DetectSchema") _list path;
     window_size =
       option_of_yojson (value_for_key boxed_positive_int_of_yojson "WindowSize") _list path;
     streaming_options =
       option_of_yojson
         (value_for_key kafka_streaming_source_options_of_yojson "StreamingOptions")
         _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : direct_kafka_source)

let catalog_kinesis_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_preview_options =
       option_of_yojson
         (value_for_key streaming_data_preview_options_of_yojson "DataPreviewOptions")
         _list path;
     streaming_options =
       option_of_yojson
         (value_for_key kinesis_streaming_source_options_of_yojson "StreamingOptions")
         _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     detect_schema =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "DetectSchema") _list path;
     window_size =
       option_of_yojson (value_for_key boxed_positive_int_of_yojson "WindowSize") _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : catalog_kinesis_source)

let catalog_kafka_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_preview_options =
       option_of_yojson
         (value_for_key streaming_data_preview_options_of_yojson "DataPreviewOptions")
         _list path;
     streaming_options =
       option_of_yojson
         (value_for_key kafka_streaming_source_options_of_yojson "StreamingOptions")
         _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     detect_schema =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "DetectSchema") _list path;
     window_size =
       option_of_yojson (value_for_key boxed_positive_int_of_yojson "WindowSize") _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : catalog_kafka_source)

let null_check_box_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_neg_one = option_of_yojson (value_for_key boxed_boolean_of_yojson "IsNegOne") _list path;
     is_null_string =
       option_of_yojson (value_for_key boxed_boolean_of_yojson "IsNullString") _list path;
     is_empty = option_of_yojson (value_for_key boxed_boolean_of_yojson "IsEmpty") _list path;
   }
    : null_check_box_list)

let generic_limited_string_of_yojson = string_of_yojson

let datatype_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label = value_for_key generic_limited_string_of_yojson "Label" _list path;
     id = value_for_key generic_limited_string_of_yojson "Id" _list path;
   }
    : datatype)

let null_value_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datatype = value_for_key datatype_of_yojson "Datatype" _list path;
     value = value_for_key enclosed_in_string_property_of_yojson "Value" _list path;
   }
    : null_value_field)

let null_value_fields_of_yojson tree path = list_of_yojson null_value_field_of_yojson tree path

let drop_null_fields_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     null_text_list =
       option_of_yojson (value_for_key null_value_fields_of_yojson "NullTextList") _list path;
     null_check_box_list =
       option_of_yojson (value_for_key null_check_box_list_of_yojson "NullCheckBoxList") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : drop_null_fields)

let merge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     primary_keys = value_for_key glue_studio_path_list_of_yojson "PrimaryKeys" _list path;
     source = value_for_key node_id_of_yojson "Source" _list path;
     inputs = value_for_key two_inputs_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : merge)

let union_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISTINCT" -> DISTINCT
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "UnionType" value)
    | _ -> raise (deserialize_wrong_type_error path "UnionType")
     : union_type)
    : union_type)

let union_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     union_type = value_for_key union_type_of_yojson "UnionType" _list path;
     inputs = value_for_key two_inputs_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : union)

let pii_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ColumnMasking" -> ColumnMasking
    | `String "ColumnHashing" -> ColumnHashing
    | `String "ColumnAudit" -> ColumnAudit
    | `String "RowPartialMasking" -> RowPartialMasking
    | `String "RowMasking" -> RowMasking
    | `String "RowHashing" -> RowHashing
    | `String "RowAudit" -> RowAudit
    | `String value -> raise (deserialize_unknown_enum_value_error path "PiiType" value)
    | _ -> raise (deserialize_wrong_type_error path "PiiType")
     : pii_type)
    : pii_type)

let boxed_double_fraction_of_yojson = double_of_yojson
let mask_value_of_yojson = string_of_yojson

let pii_detection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detection_sensitivity =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "DetectionSensitivity")
         _list path;
     detection_parameters =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "DetectionParameters")
         _list path;
     num_right_chars_to_exclude =
       option_of_yojson
         (value_for_key boxed_positive_int_of_yojson "NumRightCharsToExclude")
         _list path;
     num_left_chars_to_exclude =
       option_of_yojson
         (value_for_key boxed_positive_int_of_yojson "NumLeftCharsToExclude")
         _list path;
     match_pattern =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "MatchPattern")
         _list path;
     redact_char =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "RedactChar")
         _list path;
     redact_text =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "RedactText")
         _list path;
     mask_value = option_of_yojson (value_for_key mask_value_of_yojson "MaskValue") _list path;
     threshold_fraction =
       option_of_yojson
         (value_for_key boxed_double_fraction_of_yojson "ThresholdFraction")
         _list path;
     sample_fraction =
       option_of_yojson (value_for_key boxed_double_fraction_of_yojson "SampleFraction") _list path;
     output_column_name =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "OutputColumnName")
         _list path;
     entity_types_to_detect =
       value_for_key enclosed_in_string_properties_of_yojson "EntityTypesToDetect" _list path;
     pii_type = value_for_key pii_type_of_yojson "PiiType" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : pii_detection)

let agg_function_of_yojson (tree : t) path =
  ((match tree with
    | `String "var_pop" -> Var_pop
    | `String "var_samp" -> Var_samp
    | `String "sumDistinct" -> SumDistinct
    | `String "sum" -> Sum
    | `String "stddev_pop" -> Stddev_pop
    | `String "stddev_samp" -> Stddev_samp
    | `String "skewness" -> Skewness
    | `String "min" -> Min
    | `String "max" -> Max
    | `String "kurtosis" -> Kurtosis
    | `String "last" -> Last
    | `String "first" -> First
    | `String "count" -> Count
    | `String "countDistinct" -> CountDistinct
    | `String "avg" -> Avg
    | `String value -> raise (deserialize_unknown_enum_value_error path "AggFunction" value)
    | _ -> raise (deserialize_wrong_type_error path "AggFunction")
     : agg_function)
    : agg_function)

let aggregate_operation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agg_func = value_for_key agg_function_of_yojson "AggFunc" _list path;
     column = value_for_key enclosed_in_string_properties_of_yojson "Column" _list path;
   }
    : aggregate_operation)

let aggregate_operations_of_yojson tree path =
  list_of_yojson aggregate_operation_of_yojson tree path

let aggregate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggs = value_for_key aggregate_operations_of_yojson "Aggs" _list path;
     groups = value_for_key glue_studio_path_list_of_yojson "Groups" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : aggregate)

let limited_string_list_of_yojson tree path =
  list_of_yojson generic_limited_string_of_yojson tree path

let limited_path_list_of_yojson tree path = list_of_yojson limited_string_list_of_yojson tree path

let drop_duplicates_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     columns = option_of_yojson (value_for_key limited_path_list_of_yojson "Columns") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : drop_duplicates)

let governed_catalog_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_change_policy =
       option_of_yojson
         (value_for_key catalog_schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : governed_catalog_target)

let governed_catalog_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_options =
       option_of_yojson
         (value_for_key s3_source_additional_options_of_yojson "AdditionalOptions")
         _list path;
     partition_predicate =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "PartitionPredicate")
         _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : governed_catalog_source)

let microsoft_sql_server_catalog_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : microsoft_sql_server_catalog_source)

let my_sql_catalog_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : my_sql_catalog_source)

let oracle_sql_catalog_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : oracle_sql_catalog_source)

let postgre_sql_catalog_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : postgre_sql_catalog_source)

let microsoft_sql_server_catalog_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : microsoft_sql_server_catalog_target)

let my_sql_catalog_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : my_sql_catalog_target)

let oracle_sql_catalog_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : oracle_sql_catalog_target)

let postgre_sql_catalog_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : postgre_sql_catalog_target)

let group_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     logical_operator = value_for_key filter_logical_operator_of_yojson "LogicalOperator" _list path;
     filters = value_for_key filter_expressions_of_yojson "Filters" _list path;
     group_name = value_for_key generic_limited_string_of_yojson "GroupName" _list path;
   }
    : group_filters)

let group_filters_list_of_yojson tree path = list_of_yojson group_filters_of_yojson tree path

let route_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_filters_list = value_for_key group_filters_list_of_yojson "GroupFiltersList" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : route)

let param_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "null" -> NULL
    | `String "list" -> LIST
    | `String "bool" -> BOOL
    | `String "complex" -> COMPLEX
    | `String "float" -> FLOAT
    | `String "int" -> INT
    | `String "str" -> STR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParamType" value)
    | _ -> raise (deserialize_wrong_type_error path "ParamType")
     : param_type)
    : param_type)

let transform_config_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_optional = option_of_yojson (value_for_key boxed_boolean_of_yojson "IsOptional") _list path;
     list_type = option_of_yojson (value_for_key param_type_of_yojson "ListType") _list path;
     value =
       option_of_yojson (value_for_key enclosed_in_string_properties_of_yojson "Value") _list path;
     validation_message =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "ValidationMessage")
         _list path;
     validation_rule =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "ValidationRule")
         _list path;
     type_ = value_for_key param_type_of_yojson "Type" _list path;
     name = value_for_key enclosed_in_string_property_of_yojson "Name" _list path;
   }
    : transform_config_parameter)

let transform_config_parameter_list_of_yojson tree path =
  list_of_yojson transform_config_parameter_of_yojson tree path

let dynamic_transform_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     version =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "Version") _list path;
     path = value_for_key enclosed_in_string_property_of_yojson "Path" _list path;
     function_name = value_for_key enclosed_in_string_property_of_yojson "FunctionName" _list path;
     parameters =
       option_of_yojson
         (value_for_key transform_config_parameter_list_of_yojson "Parameters")
         _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     transform_name = value_for_key enclosed_in_string_property_of_yojson "TransformName" _list path;
     name = value_for_key enclosed_in_string_property_of_yojson "Name" _list path;
   }
    : dynamic_transform)

let dqdl_string_of_yojson = string_of_yojson

let dq_transform_output_of_yojson (tree : t) path =
  ((match tree with
    | `String "EvaluationResults" -> EvaluationResults
    | `String "PrimaryInput" -> PrimaryInput
    | `String value -> raise (deserialize_unknown_enum_value_error path "DQTransformOutput" value)
    | _ -> raise (deserialize_wrong_type_error path "DQTransformOutput")
     : dq_transform_output)
    : dq_transform_output)

let dq_results_publishing_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results_publishing_enabled =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "ResultsPublishingEnabled")
         _list path;
     cloud_watch_metrics_enabled =
       option_of_yojson
         (value_for_key boxed_boolean_of_yojson "CloudWatchMetricsEnabled")
         _list path;
     results_s3_prefix =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "ResultsS3Prefix")
         _list path;
     evaluation_context =
       option_of_yojson
         (value_for_key generic_limited_string_of_yojson "EvaluationContext")
         _list path;
   }
    : dq_results_publishing_options)

let dq_stop_job_on_failure_timing_of_yojson (tree : t) path =
  ((match tree with
    | `String "AfterDataLoad" -> AfterDataLoad
    | `String "Immediate" -> Immediate
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DQStopJobOnFailureTiming" value)
    | _ -> raise (deserialize_wrong_type_error path "DQStopJobOnFailureTiming")
     : dq_stop_job_on_failure_timing)
    : dq_stop_job_on_failure_timing)

let dq_stop_job_on_failure_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stop_job_on_failure_timing =
       option_of_yojson
         (value_for_key dq_stop_job_on_failure_timing_of_yojson "StopJobOnFailureTiming")
         _list path;
   }
    : dq_stop_job_on_failure_options)

let evaluate_data_quality_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stop_job_on_failure_options =
       option_of_yojson
         (value_for_key dq_stop_job_on_failure_options_of_yojson "StopJobOnFailureOptions")
         _list path;
     publishing_options =
       option_of_yojson
         (value_for_key dq_results_publishing_options_of_yojson "PublishingOptions")
         _list path;
     output = option_of_yojson (value_for_key dq_transform_output_of_yojson "Output") _list path;
     ruleset = value_for_key dqdl_string_of_yojson "Ruleset" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : evaluate_data_quality)

let s3_catalog_hudi_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_hudi_options =
       option_of_yojson
         (value_for_key additional_options_of_yojson "AdditionalHudiOptions")
         _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_catalog_hudi_source)

let catalog_hudi_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_hudi_options =
       option_of_yojson
         (value_for_key additional_options_of_yojson "AdditionalHudiOptions")
         _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : catalog_hudi_source)

let s3_hudi_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_options =
       option_of_yojson
         (value_for_key s3_direct_source_additional_options_of_yojson "AdditionalOptions")
         _list path;
     additional_hudi_options =
       option_of_yojson
         (value_for_key additional_options_of_yojson "AdditionalHudiOptions")
         _list path;
     paths = value_for_key enclosed_in_string_properties_of_yojson "Paths" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_hudi_source)

let s3_hudi_catalog_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     auto_data_quality =
       option_of_yojson (value_for_key auto_data_quality_of_yojson "AutoDataQuality") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key catalog_schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     additional_options = value_for_key additional_options_of_yojson "AdditionalOptions" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_hudi_catalog_target)

let hudi_target_compression_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "snappy" -> SNAPPY
    | `String "uncompressed" -> UNCOMPRESSED
    | `String "lzo" -> LZO
    | `String "gzip" -> GZIP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "HudiTargetCompressionType" value)
    | _ -> raise (deserialize_wrong_type_error path "HudiTargetCompressionType")
     : hudi_target_compression_type)
    : hudi_target_compression_type)

let s3_hudi_direct_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_data_quality =
       option_of_yojson (value_for_key auto_data_quality_of_yojson "AutoDataQuality") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key direct_schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     additional_options = value_for_key additional_options_of_yojson "AdditionalOptions" _list path;
     format = value_for_key target_format_of_yojson "Format" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     number_target_partitions =
       option_of_yojson
         (value_for_key number_target_partitions_string_of_yojson "NumberTargetPartitions")
         _list path;
     compression = value_for_key hudi_target_compression_type_of_yojson "Compression" _list path;
     path = value_for_key enclosed_in_string_property_of_yojson "Path" _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_hudi_direct_target)

let jdbc_connection_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "redshift" -> Redshift
    | `String "postgresql" -> Postgresql
    | `String "oracle" -> Oracle
    | `String "mysql" -> Mysql
    | `String "sqlserver" -> Sqlserver
    | `String value -> raise (deserialize_unknown_enum_value_error path "JDBCConnectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "JDBCConnectionType")
     : jdbc_connection_type)
    : jdbc_connection_type)

let direct_jdbc_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     redshift_tmp_dir =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "RedshiftTmpDir")
         _list path;
     connection_type = value_for_key jdbc_connection_type_of_yojson "ConnectionType" _list path;
     connection_name =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionName" _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : direct_jdbc_source)

let s3_catalog_delta_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_delta_options =
       option_of_yojson
         (value_for_key additional_options_of_yojson "AdditionalDeltaOptions")
         _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_catalog_delta_source)

let catalog_delta_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_delta_options =
       option_of_yojson
         (value_for_key additional_options_of_yojson "AdditionalDeltaOptions")
         _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : catalog_delta_source)

let s3_delta_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_options =
       option_of_yojson
         (value_for_key s3_direct_source_additional_options_of_yojson "AdditionalOptions")
         _list path;
     additional_delta_options =
       option_of_yojson
         (value_for_key additional_options_of_yojson "AdditionalDeltaOptions")
         _list path;
     paths = value_for_key enclosed_in_string_properties_of_yojson "Paths" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_delta_source)

let s3_delta_catalog_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     auto_data_quality =
       option_of_yojson (value_for_key auto_data_quality_of_yojson "AutoDataQuality") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key catalog_schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     additional_options =
       option_of_yojson (value_for_key additional_options_of_yojson "AdditionalOptions") _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_delta_catalog_target)

let delta_target_compression_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "snappy" -> SNAPPY
    | `String "uncompressed" -> UNCOMPRESSED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeltaTargetCompressionType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeltaTargetCompressionType")
     : delta_target_compression_type)
    : delta_target_compression_type)

let s3_delta_direct_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_data_quality =
       option_of_yojson (value_for_key auto_data_quality_of_yojson "AutoDataQuality") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key direct_schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     additional_options =
       option_of_yojson (value_for_key additional_options_of_yojson "AdditionalOptions") _list path;
     format = value_for_key target_format_of_yojson "Format" _list path;
     number_target_partitions =
       option_of_yojson
         (value_for_key number_target_partitions_string_of_yojson "NumberTargetPartitions")
         _list path;
     compression = value_for_key delta_target_compression_type_of_yojson "Compression" _list path;
     path = value_for_key enclosed_in_string_property_of_yojson "Path" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_delta_direct_target)

let option__of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "Description")
         _list path;
     label =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "Label") _list path;
     value =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "Value") _list path;
   }
    : option_)

let amazon_redshift_advanced_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key generic_string_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key generic_string_of_yojson "Key") _list path;
   }
    : amazon_redshift_advanced_option)

let amazon_redshift_advanced_options_of_yojson tree path =
  list_of_yojson amazon_redshift_advanced_option_of_yojson tree path

let option_list_of_yojson tree path = list_of_yojson option__of_yojson tree path

let amazon_redshift_node_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selected_columns =
       option_of_yojson (value_for_key option_list_of_yojson "SelectedColumns") _list path;
     staging_table =
       option_of_yojson (value_for_key generic_string_of_yojson "StagingTable") _list path;
     table_schema = option_of_yojson (value_for_key option_list_of_yojson "TableSchema") _list path;
     crawler_connection =
       option_of_yojson (value_for_key generic_string_of_yojson "CrawlerConnection") _list path;
     merge_clause =
       option_of_yojson (value_for_key generic_string_of_yojson "MergeClause") _list path;
     merge_when_not_matched =
       option_of_yojson
         (value_for_key generic_limited_string_of_yojson "MergeWhenNotMatched")
         _list path;
     merge_when_matched =
       option_of_yojson
         (value_for_key generic_limited_string_of_yojson "MergeWhenMatched")
         _list path;
     merge_action =
       option_of_yojson (value_for_key generic_limited_string_of_yojson "MergeAction") _list path;
     upsert = option_of_yojson (value_for_key boolean_value_of_yojson "Upsert") _list path;
     table_prefix =
       option_of_yojson (value_for_key generic_limited_string_of_yojson "TablePrefix") _list path;
     action = option_of_yojson (value_for_key generic_string_of_yojson "Action") _list path;
     post_action = option_of_yojson (value_for_key generic_string_of_yojson "PostAction") _list path;
     pre_action = option_of_yojson (value_for_key generic_string_of_yojson "PreAction") _list path;
     sample_query =
       option_of_yojson (value_for_key generic_string_of_yojson "SampleQuery") _list path;
     advanced_options =
       option_of_yojson
         (value_for_key amazon_redshift_advanced_options_of_yojson "AdvancedOptions")
         _list path;
     iam_role = option_of_yojson (value_for_key option__of_yojson "IamRole") _list path;
     temp_dir =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "TempDir") _list path;
     catalog_redshift_table =
       option_of_yojson (value_for_key generic_string_of_yojson "CatalogRedshiftTable") _list path;
     catalog_redshift_schema =
       option_of_yojson (value_for_key generic_string_of_yojson "CatalogRedshiftSchema") _list path;
     catalog_table = option_of_yojson (value_for_key option__of_yojson "CatalogTable") _list path;
     catalog_database =
       option_of_yojson (value_for_key option__of_yojson "CatalogDatabase") _list path;
     table = option_of_yojson (value_for_key option__of_yojson "Table") _list path;
     schema = option_of_yojson (value_for_key option__of_yojson "Schema") _list path;
     connection = option_of_yojson (value_for_key option__of_yojson "Connection") _list path;
     source_type =
       option_of_yojson (value_for_key generic_limited_string_of_yojson "SourceType") _list path;
     access_type =
       option_of_yojson (value_for_key generic_limited_string_of_yojson "AccessType") _list path;
   }
    : amazon_redshift_node_data)

let amazon_redshift_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data = option_of_yojson (value_for_key amazon_redshift_node_data_of_yojson "Data") _list path;
     name = option_of_yojson (value_for_key node_name_of_yojson "Name") _list path;
   }
    : amazon_redshift_source)

let amazon_redshift_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inputs = option_of_yojson (value_for_key one_input_of_yojson "Inputs") _list path;
     data = option_of_yojson (value_for_key amazon_redshift_node_data_of_yojson "Data") _list path;
     name = option_of_yojson (value_for_key node_name_of_yojson "Name") _list path;
   }
    : amazon_redshift_target)

let dqdl_aliases_of_yojson tree path =
  map_of_yojson node_name_of_yojson enclosed_in_string_property_of_yojson tree path

let additional_option_keys_of_yojson (tree : t) path =
  ((match tree with
    | `String "compositeRuleEvaluation.method" -> CompositeOption
    | `String "observations.scope" -> ObservationsOption
    | `String "performanceTuning.caching" -> CacheOption
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AdditionalOptionKeys" value)
    | _ -> raise (deserialize_wrong_type_error path "AdditionalOptionKeys")
     : additional_option_keys)
    : additional_option_keys)

let dq_additional_options_of_yojson tree path =
  map_of_yojson additional_option_keys_of_yojson generic_string_of_yojson tree path

let evaluate_data_quality_multi_frame_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stop_job_on_failure_options =
       option_of_yojson
         (value_for_key dq_stop_job_on_failure_options_of_yojson "StopJobOnFailureOptions")
         _list path;
     additional_options =
       option_of_yojson
         (value_for_key dq_additional_options_of_yojson "AdditionalOptions")
         _list path;
     publishing_options =
       option_of_yojson
         (value_for_key dq_results_publishing_options_of_yojson "PublishingOptions")
         _list path;
     ruleset = value_for_key dqdl_string_of_yojson "Ruleset" _list path;
     additional_data_sources =
       option_of_yojson (value_for_key dqdl_aliases_of_yojson "AdditionalDataSources") _list path;
     inputs = value_for_key many_inputs_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : evaluate_data_quality_multi_frame)

let recipe_version_of_yojson = string_of_yojson

let recipe_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recipe_version = value_for_key recipe_version_of_yojson "RecipeVersion" _list path;
     recipe_arn = value_for_key enclosed_in_string_property_of_yojson "RecipeArn" _list path;
   }
    : recipe_reference)

let operation_of_yojson = string_of_yojson
let parameter_value_of_yojson = string_of_yojson
let parameter_name_of_yojson = string_of_yojson

let parameter_map_of_yojson tree path =
  map_of_yojson parameter_name_of_yojson parameter_value_of_yojson tree path

let recipe_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameter_map_of_yojson "Parameters") _list path;
     operation = value_for_key operation_of_yojson "Operation" _list path;
   }
    : recipe_action)

let databrew_condition_of_yojson = string_of_yojson
let databrew_condition_value_of_yojson = string_of_yojson
let target_column_of_yojson = string_of_yojson

let condition_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_column = value_for_key target_column_of_yojson "TargetColumn" _list path;
     value = option_of_yojson (value_for_key databrew_condition_value_of_yojson "Value") _list path;
     condition = value_for_key databrew_condition_of_yojson "Condition" _list path;
   }
    : condition_expression)

let condition_expression_list_of_yojson tree path =
  list_of_yojson condition_expression_of_yojson tree path

let recipe_step_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     condition_expressions =
       option_of_yojson
         (value_for_key condition_expression_list_of_yojson "ConditionExpressions")
         _list path;
     action = value_for_key recipe_action_of_yojson "Action" _list path;
   }
    : recipe_step)

let recipe_steps_of_yojson tree path = list_of_yojson recipe_step_of_yojson tree path

let recipe_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recipe_steps = option_of_yojson (value_for_key recipe_steps_of_yojson "RecipeSteps") _list path;
     recipe_reference =
       option_of_yojson (value_for_key recipe_reference_of_yojson "RecipeReference") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : recipe)

let snowflake_node_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_schema = option_of_yojson (value_for_key option_list_of_yojson "TableSchema") _list path;
     auto_pushdown =
       option_of_yojson (value_for_key boolean_value_of_yojson "AutoPushdown") _list path;
     selected_columns =
       option_of_yojson (value_for_key option_list_of_yojson "SelectedColumns") _list path;
     staging_table =
       option_of_yojson (value_for_key generic_string_of_yojson "StagingTable") _list path;
     merge_clause =
       option_of_yojson (value_for_key generic_string_of_yojson "MergeClause") _list path;
     merge_when_not_matched =
       option_of_yojson
         (value_for_key generic_limited_string_of_yojson "MergeWhenNotMatched")
         _list path;
     merge_when_matched =
       option_of_yojson
         (value_for_key generic_limited_string_of_yojson "MergeWhenMatched")
         _list path;
     merge_action =
       option_of_yojson (value_for_key generic_limited_string_of_yojson "MergeAction") _list path;
     upsert = option_of_yojson (value_for_key boolean_value_of_yojson "Upsert") _list path;
     action = option_of_yojson (value_for_key generic_string_of_yojson "Action") _list path;
     post_action = option_of_yojson (value_for_key generic_string_of_yojson "PostAction") _list path;
     pre_action = option_of_yojson (value_for_key generic_string_of_yojson "PreAction") _list path;
     sample_query =
       option_of_yojson (value_for_key generic_string_of_yojson "SampleQuery") _list path;
     additional_options =
       option_of_yojson (value_for_key additional_options_of_yojson "AdditionalOptions") _list path;
     iam_role = option_of_yojson (value_for_key option__of_yojson "IamRole") _list path;
     temp_dir =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "TempDir") _list path;
     database = option_of_yojson (value_for_key generic_string_of_yojson "Database") _list path;
     table = option_of_yojson (value_for_key generic_string_of_yojson "Table") _list path;
     schema = option_of_yojson (value_for_key generic_string_of_yojson "Schema") _list path;
     connection = option_of_yojson (value_for_key option__of_yojson "Connection") _list path;
     source_type =
       option_of_yojson (value_for_key generic_limited_string_of_yojson "SourceType") _list path;
   }
    : snowflake_node_data)

let snowflake_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     data = value_for_key snowflake_node_data_of_yojson "Data" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : snowflake_source)

let snowflake_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inputs = option_of_yojson (value_for_key one_input_of_yojson "Inputs") _list path;
     data = value_for_key snowflake_node_data_of_yojson "Data" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : snowflake_target)

let connector_options_of_yojson tree path =
  map_of_yojson generic_string_of_yojson generic_string_of_yojson tree path

let connector_data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     data = value_for_key connector_options_of_yojson "Data" _list path;
     connection_type =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionType" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : connector_data_source)

let connector_data_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inputs = option_of_yojson (value_for_key one_input_of_yojson "Inputs") _list path;
     data = value_for_key connector_options_of_yojson "Data" _list path;
     connection_type =
       value_for_key enclosed_in_string_property_of_yojson "ConnectionType" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : connector_data_target)

let s3_catalog_iceberg_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_iceberg_options =
       option_of_yojson
         (value_for_key additional_options_of_yojson "AdditionalIcebergOptions")
         _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_catalog_iceberg_source)

let catalog_iceberg_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     additional_iceberg_options =
       option_of_yojson
         (value_for_key additional_options_of_yojson "AdditionalIcebergOptions")
         _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : catalog_iceberg_source)

let s3_iceberg_catalog_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_data_quality =
       option_of_yojson (value_for_key auto_data_quality_of_yojson "AutoDataQuality") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key catalog_schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     additional_options =
       option_of_yojson (value_for_key additional_options_of_yojson "AdditionalOptions") _list path;
     database = value_for_key enclosed_in_string_property_of_yojson "Database" _list path;
     table = value_for_key enclosed_in_string_property_of_yojson "Table" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_iceberg_catalog_target)

let iceberg_target_compression_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "snappy" -> SNAPPY
    | `String "uncompressed" -> UNCOMPRESSED
    | `String "lzo" -> LZO
    | `String "gzip" -> GZIP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IcebergTargetCompressionType" value)
    | _ -> raise (deserialize_wrong_type_error path "IcebergTargetCompressionType")
     : iceberg_target_compression_type)
    : iceberg_target_compression_type)

let s3_iceberg_direct_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     number_target_partitions =
       option_of_yojson
         (value_for_key number_target_partitions_string_of_yojson "NumberTargetPartitions")
         _list path;
     compression = value_for_key iceberg_target_compression_type_of_yojson "Compression" _list path;
     auto_data_quality =
       option_of_yojson (value_for_key auto_data_quality_of_yojson "AutoDataQuality") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key direct_schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     additional_options =
       option_of_yojson (value_for_key additional_options_of_yojson "AdditionalOptions") _list path;
     format = value_for_key target_format_of_yojson "Format" _list path;
     path = value_for_key enclosed_in_string_property_of_yojson "Path" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_iceberg_direct_target)

let s3_excel_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     skip_footer =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "SkipFooter") _list path;
     number_rows = option_of_yojson (value_for_key boxed_long_of_yojson "NumberRows") _list path;
     additional_options =
       option_of_yojson
         (value_for_key s3_direct_source_additional_options_of_yojson "AdditionalOptions")
         _list path;
     max_files_in_band =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "MaxFilesInBand") _list path;
     max_band =
       option_of_yojson (value_for_key boxed_non_negative_int_of_yojson "MaxBand") _list path;
     recurse = option_of_yojson (value_for_key boxed_boolean_of_yojson "Recurse") _list path;
     group_files =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "GroupFiles")
         _list path;
     group_size =
       option_of_yojson (value_for_key enclosed_in_string_property_of_yojson "GroupSize") _list path;
     exclusions =
       option_of_yojson
         (value_for_key enclosed_in_string_properties_of_yojson "Exclusions")
         _list path;
     compression_type =
       option_of_yojson
         (value_for_key parquet_compression_type_of_yojson "CompressionType")
         _list path;
     paths = value_for_key enclosed_in_string_properties_of_yojson "Paths" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_excel_source)

let hyper_target_compression_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "uncompressed" -> UNCOMPRESSED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "HyperTargetCompressionType" value)
    | _ -> raise (deserialize_wrong_type_error path "HyperTargetCompressionType")
     : hyper_target_compression_type)
    : hyper_target_compression_type)

let s3_hyper_direct_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     auto_data_quality =
       option_of_yojson (value_for_key auto_data_quality_of_yojson "AutoDataQuality") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key direct_schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     compression =
       option_of_yojson
         (value_for_key hyper_target_compression_type_of_yojson "Compression")
         _list path;
     path = value_for_key enclosed_in_string_property_of_yojson "Path" _list path;
     partition_keys =
       option_of_yojson (value_for_key glue_studio_path_list_of_yojson "PartitionKeys") _list path;
     format = option_of_yojson (value_for_key target_format_of_yojson "Format") _list path;
     inputs = value_for_key one_input_of_yojson "Inputs" _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : s3_hyper_direct_target)

let ddb_export_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "s3" -> S3
    | `String "ddb" -> Ddb
    | `String value -> raise (deserialize_unknown_enum_value_error path "DdbExportType" value)
    | _ -> raise (deserialize_wrong_type_error path "DdbExportType")
     : ddb_export_type)
    : ddb_export_type)

let ddbelt_connection_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dynamodb_sts_role_arn =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "DynamodbStsRoleArn")
         _list path;
     dynamodb_s3_bucket_owner =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "DynamodbS3BucketOwner")
         _list path;
     dynamodb_s3_prefix =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "DynamodbS3Prefix")
         _list path;
     dynamodb_s3_bucket =
       option_of_yojson
         (value_for_key enclosed_in_string_property_of_yojson "DynamodbS3Bucket")
         _list path;
     dynamodb_table_arn =
       value_for_key enclosed_in_string_property_of_yojson "DynamodbTableArn" _list path;
     dynamodb_unnest_ddb_json =
       option_of_yojson (value_for_key boolean_value_of_yojson "DynamodbUnnestDDBJson") _list path;
     dynamodb_export =
       option_of_yojson (value_for_key ddb_export_type_of_yojson "DynamodbExport") _list path;
   }
    : ddbelt_connection_options)

let dynamo_dbelt_connector_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_schemas =
       option_of_yojson (value_for_key glue_schemas_of_yojson "OutputSchemas") _list path;
     connection_options =
       option_of_yojson
         (value_for_key ddbelt_connection_options_of_yojson "ConnectionOptions")
         _list path;
     name = value_for_key node_name_of_yojson "Name" _list path;
   }
    : dynamo_dbelt_connector_source)

let code_gen_configuration_node_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dynamo_dbelt_connector_source =
       option_of_yojson
         (value_for_key dynamo_dbelt_connector_source_of_yojson "DynamoDBELTConnectorSource")
         _list path;
     s3_hyper_direct_target =
       option_of_yojson
         (value_for_key s3_hyper_direct_target_of_yojson "S3HyperDirectTarget")
         _list path;
     s3_excel_source =
       option_of_yojson (value_for_key s3_excel_source_of_yojson "S3ExcelSource") _list path;
     s3_iceberg_direct_target =
       option_of_yojson
         (value_for_key s3_iceberg_direct_target_of_yojson "S3IcebergDirectTarget")
         _list path;
     s3_iceberg_catalog_target =
       option_of_yojson
         (value_for_key s3_iceberg_catalog_target_of_yojson "S3IcebergCatalogTarget")
         _list path;
     catalog_iceberg_source =
       option_of_yojson
         (value_for_key catalog_iceberg_source_of_yojson "CatalogIcebergSource")
         _list path;
     s3_catalog_iceberg_source =
       option_of_yojson
         (value_for_key s3_catalog_iceberg_source_of_yojson "S3CatalogIcebergSource")
         _list path;
     connector_data_target =
       option_of_yojson
         (value_for_key connector_data_target_of_yojson "ConnectorDataTarget")
         _list path;
     connector_data_source =
       option_of_yojson
         (value_for_key connector_data_source_of_yojson "ConnectorDataSource")
         _list path;
     snowflake_target =
       option_of_yojson (value_for_key snowflake_target_of_yojson "SnowflakeTarget") _list path;
     snowflake_source =
       option_of_yojson (value_for_key snowflake_source_of_yojson "SnowflakeSource") _list path;
     recipe = option_of_yojson (value_for_key recipe_of_yojson "Recipe") _list path;
     evaluate_data_quality_multi_frame =
       option_of_yojson
         (value_for_key evaluate_data_quality_multi_frame_of_yojson "EvaluateDataQualityMultiFrame")
         _list path;
     amazon_redshift_target =
       option_of_yojson
         (value_for_key amazon_redshift_target_of_yojson "AmazonRedshiftTarget")
         _list path;
     amazon_redshift_source =
       option_of_yojson
         (value_for_key amazon_redshift_source_of_yojson "AmazonRedshiftSource")
         _list path;
     s3_delta_direct_target =
       option_of_yojson
         (value_for_key s3_delta_direct_target_of_yojson "S3DeltaDirectTarget")
         _list path;
     s3_delta_catalog_target =
       option_of_yojson
         (value_for_key s3_delta_catalog_target_of_yojson "S3DeltaCatalogTarget")
         _list path;
     s3_delta_source =
       option_of_yojson (value_for_key s3_delta_source_of_yojson "S3DeltaSource") _list path;
     catalog_delta_source =
       option_of_yojson
         (value_for_key catalog_delta_source_of_yojson "CatalogDeltaSource")
         _list path;
     s3_catalog_delta_source =
       option_of_yojson
         (value_for_key s3_catalog_delta_source_of_yojson "S3CatalogDeltaSource")
         _list path;
     direct_jdbc_source =
       option_of_yojson (value_for_key direct_jdbc_source_of_yojson "DirectJDBCSource") _list path;
     s3_hudi_direct_target =
       option_of_yojson
         (value_for_key s3_hudi_direct_target_of_yojson "S3HudiDirectTarget")
         _list path;
     s3_hudi_catalog_target =
       option_of_yojson
         (value_for_key s3_hudi_catalog_target_of_yojson "S3HudiCatalogTarget")
         _list path;
     s3_hudi_source =
       option_of_yojson (value_for_key s3_hudi_source_of_yojson "S3HudiSource") _list path;
     catalog_hudi_source =
       option_of_yojson (value_for_key catalog_hudi_source_of_yojson "CatalogHudiSource") _list path;
     s3_catalog_hudi_source =
       option_of_yojson
         (value_for_key s3_catalog_hudi_source_of_yojson "S3CatalogHudiSource")
         _list path;
     evaluate_data_quality =
       option_of_yojson
         (value_for_key evaluate_data_quality_of_yojson "EvaluateDataQuality")
         _list path;
     dynamic_transform =
       option_of_yojson (value_for_key dynamic_transform_of_yojson "DynamicTransform") _list path;
     route = option_of_yojson (value_for_key route_of_yojson "Route") _list path;
     postgre_sql_catalog_target =
       option_of_yojson
         (value_for_key postgre_sql_catalog_target_of_yojson "PostgreSQLCatalogTarget")
         _list path;
     oracle_sql_catalog_target =
       option_of_yojson
         (value_for_key oracle_sql_catalog_target_of_yojson "OracleSQLCatalogTarget")
         _list path;
     my_sql_catalog_target =
       option_of_yojson
         (value_for_key my_sql_catalog_target_of_yojson "MySQLCatalogTarget")
         _list path;
     microsoft_sql_server_catalog_target =
       option_of_yojson
         (value_for_key microsoft_sql_server_catalog_target_of_yojson
            "MicrosoftSQLServerCatalogTarget")
         _list path;
     postgre_sql_catalog_source =
       option_of_yojson
         (value_for_key postgre_sql_catalog_source_of_yojson "PostgreSQLCatalogSource")
         _list path;
     oracle_sql_catalog_source =
       option_of_yojson
         (value_for_key oracle_sql_catalog_source_of_yojson "OracleSQLCatalogSource")
         _list path;
     my_sql_catalog_source =
       option_of_yojson
         (value_for_key my_sql_catalog_source_of_yojson "MySQLCatalogSource")
         _list path;
     microsoft_sql_server_catalog_source =
       option_of_yojson
         (value_for_key microsoft_sql_server_catalog_source_of_yojson
            "MicrosoftSQLServerCatalogSource")
         _list path;
     governed_catalog_source =
       option_of_yojson
         (value_for_key governed_catalog_source_of_yojson "GovernedCatalogSource")
         _list path;
     governed_catalog_target =
       option_of_yojson
         (value_for_key governed_catalog_target_of_yojson "GovernedCatalogTarget")
         _list path;
     drop_duplicates =
       option_of_yojson (value_for_key drop_duplicates_of_yojson "DropDuplicates") _list path;
     aggregate = option_of_yojson (value_for_key aggregate_of_yojson "Aggregate") _list path;
     pii_detection =
       option_of_yojson (value_for_key pii_detection_of_yojson "PIIDetection") _list path;
     union = option_of_yojson (value_for_key union_of_yojson "Union") _list path;
     merge = option_of_yojson (value_for_key merge_of_yojson "Merge") _list path;
     drop_null_fields =
       option_of_yojson (value_for_key drop_null_fields_of_yojson "DropNullFields") _list path;
     catalog_kafka_source =
       option_of_yojson
         (value_for_key catalog_kafka_source_of_yojson "CatalogKafkaSource")
         _list path;
     catalog_kinesis_source =
       option_of_yojson
         (value_for_key catalog_kinesis_source_of_yojson "CatalogKinesisSource")
         _list path;
     direct_kafka_source =
       option_of_yojson (value_for_key direct_kafka_source_of_yojson "DirectKafkaSource") _list path;
     direct_kinesis_source =
       option_of_yojson
         (value_for_key direct_kinesis_source_of_yojson "DirectKinesisSource")
         _list path;
     spark_sq_l = option_of_yojson (value_for_key spark_sq_l_of_yojson "SparkSQL") _list path;
     custom_code = option_of_yojson (value_for_key custom_code_of_yojson "CustomCode") _list path;
     filter = option_of_yojson (value_for_key filter_of_yojson "Filter") _list path;
     fill_missing_values =
       option_of_yojson (value_for_key fill_missing_values_of_yojson "FillMissingValues") _list path;
     select_from_collection =
       option_of_yojson
         (value_for_key select_from_collection_of_yojson "SelectFromCollection")
         _list path;
     split_fields = option_of_yojson (value_for_key split_fields_of_yojson "SplitFields") _list path;
     join = option_of_yojson (value_for_key join_of_yojson "Join") _list path;
     spigot = option_of_yojson (value_for_key spigot_of_yojson "Spigot") _list path;
     rename_field = option_of_yojson (value_for_key rename_field_of_yojson "RenameField") _list path;
     drop_fields = option_of_yojson (value_for_key drop_fields_of_yojson "DropFields") _list path;
     select_fields =
       option_of_yojson (value_for_key select_fields_of_yojson "SelectFields") _list path;
     apply_mapping =
       option_of_yojson (value_for_key apply_mapping_of_yojson "ApplyMapping") _list path;
     s3_direct_target =
       option_of_yojson (value_for_key s3_direct_target_of_yojson "S3DirectTarget") _list path;
     s3_glue_parquet_target =
       option_of_yojson
         (value_for_key s3_glue_parquet_target_of_yojson "S3GlueParquetTarget")
         _list path;
     s3_catalog_target =
       option_of_yojson (value_for_key s3_catalog_target_of_yojson "S3CatalogTarget") _list path;
     redshift_target =
       option_of_yojson (value_for_key redshift_target_of_yojson "RedshiftTarget") _list path;
     catalog_target =
       option_of_yojson (value_for_key basic_catalog_target_of_yojson "CatalogTarget") _list path;
     spark_connector_target =
       option_of_yojson
         (value_for_key spark_connector_target_of_yojson "SparkConnectorTarget")
         _list path;
     jdbc_connector_target =
       option_of_yojson
         (value_for_key jdbc_connector_target_of_yojson "JDBCConnectorTarget")
         _list path;
     dynamo_db_catalog_source =
       option_of_yojson
         (value_for_key dynamo_db_catalog_source_of_yojson "DynamoDBCatalogSource")
         _list path;
     relational_catalog_source =
       option_of_yojson
         (value_for_key relational_catalog_source_of_yojson "RelationalCatalogSource")
         _list path;
     s3_parquet_source =
       option_of_yojson (value_for_key s3_parquet_source_of_yojson "S3ParquetSource") _list path;
     s3_json_source =
       option_of_yojson (value_for_key s3_json_source_of_yojson "S3JsonSource") _list path;
     s3_csv_source =
       option_of_yojson (value_for_key s3_csv_source_of_yojson "S3CsvSource") _list path;
     s3_catalog_source =
       option_of_yojson (value_for_key s3_catalog_source_of_yojson "S3CatalogSource") _list path;
     redshift_source =
       option_of_yojson (value_for_key redshift_source_of_yojson "RedshiftSource") _list path;
     catalog_source =
       option_of_yojson (value_for_key catalog_source_of_yojson "CatalogSource") _list path;
     spark_connector_source =
       option_of_yojson
         (value_for_key spark_connector_source_of_yojson "SparkConnectorSource")
         _list path;
     jdbc_connector_source =
       option_of_yojson
         (value_for_key jdbc_connector_source_of_yojson "JDBCConnectorSource")
         _list path;
     athena_connector_source =
       option_of_yojson
         (value_for_key athena_connector_source_of_yojson "AthenaConnectorSource")
         _list path;
   }
    : code_gen_configuration_node)

let code_gen_configuration_nodes_of_yojson tree path =
  map_of_yojson node_id_of_yojson code_gen_configuration_node_of_yojson tree path

let generic512_char_string_of_yojson = string_of_yojson

let source_control_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auth_token =
       option_of_yojson (value_for_key generic512_char_string_of_yojson "AuthToken") _list path;
     auth_strategy =
       option_of_yojson
         (value_for_key source_control_auth_strategy_of_yojson "AuthStrategy")
         _list path;
     last_commit_id =
       option_of_yojson (value_for_key generic512_char_string_of_yojson "LastCommitId") _list path;
     folder = option_of_yojson (value_for_key generic512_char_string_of_yojson "Folder") _list path;
     branch = option_of_yojson (value_for_key generic512_char_string_of_yojson "Branch") _list path;
     owner = option_of_yojson (value_for_key generic512_char_string_of_yojson "Owner") _list path;
     repository =
       option_of_yojson (value_for_key generic512_char_string_of_yojson "Repository") _list path;
     provider =
       option_of_yojson (value_for_key source_control_provider_of_yojson "Provider") _list path;
   }
    : source_control_details)

let job_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maintenance_window =
       option_of_yojson (value_for_key maintenance_window_of_yojson "MaintenanceWindow") _list path;
     source_control_details =
       option_of_yojson
         (value_for_key source_control_details_of_yojson "SourceControlDetails")
         _list path;
     execution_class =
       option_of_yojson (value_for_key execution_class_of_yojson "ExecutionClass") _list path;
     code_gen_configuration_nodes =
       option_of_yojson
         (value_for_key code_gen_configuration_nodes_of_yojson "CodeGenConfigurationNodes")
         _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     notification_property =
       option_of_yojson
         (value_for_key notification_property_of_yojson "NotificationProperty")
         _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     max_capacity =
       option_of_yojson (value_for_key nullable_double_of_yojson "MaxCapacity") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     allocated_capacity =
       option_of_yojson (value_for_key integer_value_of_yojson "AllocatedCapacity") _list path;
     max_retries = option_of_yojson (value_for_key max_retries_of_yojson "MaxRetries") _list path;
     connections =
       option_of_yojson (value_for_key connections_list_of_yojson "Connections") _list path;
     non_overridable_arguments =
       option_of_yojson (value_for_key generic_map_of_yojson "NonOverridableArguments") _list path;
     default_arguments =
       option_of_yojson (value_for_key generic_map_of_yojson "DefaultArguments") _list path;
     command = option_of_yojson (value_for_key job_command_of_yojson "Command") _list path;
     execution_property =
       option_of_yojson (value_for_key execution_property_of_yojson "ExecutionProperty") _list path;
     role = option_of_yojson (value_for_key role_string_of_yojson "Role") _list path;
     log_uri = option_of_yojson (value_for_key uri_string_of_yojson "LogUri") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     job_run_queuing_enabled =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "JobRunQueuingEnabled") _list path;
     job_mode = option_of_yojson (value_for_key job_mode_of_yojson "JobMode") _list path;
   }
    : job_update)

let update_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_update = value_for_key job_update_of_yojson "JobUpdate" _list path;
     job_name = value_for_key name_string_of_yojson "JobName" _list path;
   }
    : update_job_request)

let update_job_from_source_control_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path }
    : update_job_from_source_control_response)

let update_job_from_source_control_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auth_token =
       option_of_yojson (value_for_key auth_token_string_of_yojson "AuthToken") _list path;
     auth_strategy =
       option_of_yojson
         (value_for_key source_control_auth_strategy_of_yojson "AuthStrategy")
         _list path;
     commit_id = option_of_yojson (value_for_key commit_id_string_of_yojson "CommitId") _list path;
     folder = option_of_yojson (value_for_key name_string_of_yojson "Folder") _list path;
     branch_name = option_of_yojson (value_for_key name_string_of_yojson "BranchName") _list path;
     repository_owner =
       option_of_yojson (value_for_key name_string_of_yojson "RepositoryOwner") _list path;
     repository_name =
       option_of_yojson (value_for_key name_string_of_yojson "RepositoryName") _list path;
     provider =
       option_of_yojson (value_for_key source_control_provider_of_yojson "Provider") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
   }
    : update_job_from_source_control_request)

let update_integration_table_properties_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let string512_of_yojson = string_of_yojson
let string128_of_yojson = string_of_yojson
let source_table_fields_list_of_yojson tree path = list_of_yojson string128_of_yojson tree path
let primary_key_list_of_yojson tree path = list_of_yojson string128_of_yojson tree path

let source_table_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_update_field =
       option_of_yojson (value_for_key string128_of_yojson "RecordUpdateField") _list path;
     primary_key =
       option_of_yojson (value_for_key primary_key_list_of_yojson "PrimaryKey") _list path;
     filter_predicate =
       option_of_yojson (value_for_key string128_of_yojson "FilterPredicate") _list path;
     fields =
       option_of_yojson (value_for_key source_table_fields_list_of_yojson "Fields") _list path;
   }
    : source_table_config)

let unnest_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOUNNEST" -> NOUNNEST
    | `String "FULL" -> FULL
    | `String "TOPLEVEL" -> TOPLEVEL
    | `String value -> raise (deserialize_unknown_enum_value_error path "UnnestSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "UnnestSpec")
     : unnest_spec)
    : unnest_spec)

let integration_partition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conversion_spec =
       option_of_yojson (value_for_key string128_of_yojson "ConversionSpec") _list path;
     function_spec = option_of_yojson (value_for_key string128_of_yojson "FunctionSpec") _list path;
     field_name = option_of_yojson (value_for_key string128_of_yojson "FieldName") _list path;
   }
    : integration_partition)

let integration_partition_spec_list_of_yojson tree path =
  list_of_yojson integration_partition_of_yojson tree path

let target_table_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_table_name =
       option_of_yojson (value_for_key string128_of_yojson "TargetTableName") _list path;
     partition_spec =
       option_of_yojson
         (value_for_key integration_partition_spec_list_of_yojson "PartitionSpec")
         _list path;
     unnest_spec = option_of_yojson (value_for_key unnest_spec_of_yojson "UnnestSpec") _list path;
   }
    : target_table_config)

let update_integration_table_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_table_config =
       option_of_yojson (value_for_key target_table_config_of_yojson "TargetTableConfig") _list path;
     source_table_config =
       option_of_yojson (value_for_key source_table_config_of_yojson "SourceTableConfig") _list path;
     table_name = value_for_key string128_of_yojson "TableName" _list path;
     resource_arn = value_for_key string512_of_yojson "ResourceArn" _list path;
   }
    : update_integration_table_properties_request)

let integration_error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key integration_error_message_of_yojson "Message") _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key integration_error_message_of_yojson "Message") _list path;
   }
    : internal_server_exception)

let source_processing_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ role_arn = option_of_yojson (value_for_key string128_of_yojson "RoleArn") _list path }
    : source_processing_properties)

let string2048_of_yojson = string_of_yojson

let target_processing_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_bus_arn = option_of_yojson (value_for_key string2048_of_yojson "EventBusArn") _list path;
     connection_name =
       option_of_yojson (value_for_key string128_of_yojson "ConnectionName") _list path;
     kms_arn = option_of_yojson (value_for_key string2048_of_yojson "KmsArn") _list path;
     role_arn = option_of_yojson (value_for_key string128_of_yojson "RoleArn") _list path;
   }
    : target_processing_properties)

let update_integration_resource_property_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_processing_properties =
       option_of_yojson
         (value_for_key target_processing_properties_of_yojson "TargetProcessingProperties")
         _list path;
     source_processing_properties =
       option_of_yojson
         (value_for_key source_processing_properties_of_yojson "SourceProcessingProperties")
         _list path;
     resource_property_arn =
       option_of_yojson (value_for_key string512_of_yojson "ResourcePropertyArn") _list path;
     resource_arn = option_of_yojson (value_for_key string512_of_yojson "ResourceArn") _list path;
   }
    : update_integration_resource_property_response)

let update_integration_resource_property_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_processing_properties =
       option_of_yojson
         (value_for_key target_processing_properties_of_yojson "TargetProcessingProperties")
         _list path;
     source_processing_properties =
       option_of_yojson
         (value_for_key source_processing_properties_of_yojson "SourceProcessingProperties")
         _list path;
     resource_arn = value_for_key string512_of_yojson "ResourceArn" _list path;
   }
    : update_integration_resource_property_request)

let grok_pattern_of_yojson = string_of_yojson
let custom_patterns_of_yojson = string_of_yojson

let update_grok_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_patterns =
       option_of_yojson (value_for_key custom_patterns_of_yojson "CustomPatterns") _list path;
     grok_pattern = option_of_yojson (value_for_key grok_pattern_of_yojson "GrokPattern") _list path;
     classification =
       option_of_yojson (value_for_key classification_of_yojson "Classification") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : update_grok_classifier_request)

let update_glue_identity_center_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let identity_center_scope_of_yojson = string_of_yojson

let identity_center_scopes_list_of_yojson tree path =
  list_of_yojson identity_center_scope_of_yojson tree path

let update_glue_identity_center_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_background_sessions_enabled =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "UserBackgroundSessionsEnabled")
         _list path;
     scopes =
       option_of_yojson (value_for_key identity_center_scopes_list_of_yojson "Scopes") _list path;
   }
    : update_glue_identity_center_configuration_request)

let glossary_term_id_of_yojson = string_of_yojson
let glossary_id_of_yojson = string_of_yojson
let glossary_term_name_of_yojson = string_of_yojson
let glossary_short_description_of_yojson = string_of_yojson
let glossary_long_description_of_yojson = string_of_yojson

let update_glossary_term_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     long_description =
       option_of_yojson
         (value_for_key glossary_long_description_of_yojson "LongDescription")
         _list path;
     short_description =
       option_of_yojson
         (value_for_key glossary_short_description_of_yojson "ShortDescription")
         _list path;
     name = option_of_yojson (value_for_key glossary_term_name_of_yojson "Name") _list path;
     glossary_id = option_of_yojson (value_for_key glossary_id_of_yojson "GlossaryId") _list path;
     id = option_of_yojson (value_for_key glossary_term_id_of_yojson "Id") _list path;
   }
    : update_glossary_term_response)

let update_glossary_term_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     long_description =
       option_of_yojson
         (value_for_key glossary_long_description_of_yojson "LongDescription")
         _list path;
     short_description =
       option_of_yojson
         (value_for_key glossary_short_description_of_yojson "ShortDescription")
         _list path;
     name = option_of_yojson (value_for_key glossary_term_name_of_yojson "Name") _list path;
     identifier = value_for_key glossary_term_id_of_yojson "Identifier" _list path;
   }
    : update_glossary_term_request)

let glossary_name_of_yojson = string_of_yojson
let metadata_description_of_yojson = string_of_yojson

let update_glossary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key metadata_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key glossary_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key glossary_id_of_yojson "Id") _list path;
   }
    : update_glossary_response)

let update_glossary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     description =
       option_of_yojson (value_for_key metadata_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key glossary_name_of_yojson "Name") _list path;
     identifier = value_for_key glossary_id_of_yojson "Identifier" _list path;
   }
    : update_glossary_request)

let update_dev_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let public_keys_list_of_yojson tree path = list_of_yojson generic_string_of_yojson tree path

let dev_endpoint_custom_libraries_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     extra_jars_s3_path =
       option_of_yojson (value_for_key generic_string_of_yojson "ExtraJarsS3Path") _list path;
     extra_python_libs_s3_path =
       option_of_yojson (value_for_key generic_string_of_yojson "ExtraPythonLibsS3Path") _list path;
   }
    : dev_endpoint_custom_libraries)

let string_list_of_yojson tree path = list_of_yojson generic_string_of_yojson tree path

let map_value_of_yojson tree path =
  map_of_yojson generic_string_of_yojson generic_string_of_yojson tree path

let update_dev_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     add_arguments = option_of_yojson (value_for_key map_value_of_yojson "AddArguments") _list path;
     delete_arguments =
       option_of_yojson (value_for_key string_list_of_yojson "DeleteArguments") _list path;
     update_etl_libraries =
       option_of_yojson (value_for_key boolean_value_of_yojson "UpdateEtlLibraries") _list path;
     custom_libraries =
       option_of_yojson
         (value_for_key dev_endpoint_custom_libraries_of_yojson "CustomLibraries")
         _list path;
     delete_public_keys =
       option_of_yojson (value_for_key public_keys_list_of_yojson "DeletePublicKeys") _list path;
     add_public_keys =
       option_of_yojson (value_for_key public_keys_list_of_yojson "AddPublicKeys") _list path;
     public_key = option_of_yojson (value_for_key generic_string_of_yojson "PublicKey") _list path;
     endpoint_name = value_for_key generic_string_of_yojson "EndpointName" _list path;
   }
    : update_dev_endpoint_request)

let update_database_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let data_lake_principal_string_of_yojson = string_of_yojson

let data_lake_principal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_lake_principal_identifier =
       option_of_yojson
         (value_for_key data_lake_principal_string_of_yojson "DataLakePrincipalIdentifier")
         _list path;
   }
    : data_lake_principal)

let permission_of_yojson (tree : t) path =
  ((match tree with
    | `String "DATA_LOCATION_ACCESS" -> DATA_LOCATION_ACCESS
    | `String "CREATE_TABLE" -> CREATE_TABLE
    | `String "CREATE_DATABASE" -> CREATE_DATABASE
    | `String "INSERT" -> INSERT
    | `String "DELETE" -> DELETE
    | `String "DROP" -> DROP
    | `String "ALTER" -> ALTER
    | `String "SELECT" -> SELECT
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "Permission" value)
    | _ -> raise (deserialize_wrong_type_error path "Permission")
     : permission)
    : permission)

let permission_list_of_yojson tree path = list_of_yojson permission_of_yojson tree path

let principal_permissions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permissions =
       option_of_yojson (value_for_key permission_list_of_yojson "Permissions") _list path;
     principal =
       option_of_yojson (value_for_key data_lake_principal_of_yojson "Principal") _list path;
   }
    : principal_permissions)

let principal_permissions_list_of_yojson tree path =
  list_of_yojson principal_permissions_of_yojson tree path

let database_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region = option_of_yojson (value_for_key name_string_of_yojson "Region") _list path;
     database_name =
       option_of_yojson (value_for_key name_string_of_yojson "DatabaseName") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : database_identifier)

let federation_identifier_of_yojson = string_of_yojson

let federated_database_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_type =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionType") _list path;
     connection_name =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionName") _list path;
     identifier =
       option_of_yojson (value_for_key federation_identifier_of_yojson "Identifier") _list path;
   }
    : federated_database)

let database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     federated_database =
       option_of_yojson (value_for_key federated_database_of_yojson "FederatedDatabase") _list path;
     target_database =
       option_of_yojson (value_for_key database_identifier_of_yojson "TargetDatabase") _list path;
     create_table_default_permissions =
       option_of_yojson
         (value_for_key principal_permissions_list_of_yojson "CreateTableDefaultPermissions")
         _list path;
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     location_uri = option_of_yojson (value_for_key ur_i_of_yojson "LocationUri") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : database_input)

let update_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_input = value_for_key database_input_of_yojson "DatabaseInput" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : update_database_request)

let data_quality_ruleset_string_of_yojson = string_of_yojson

let update_data_quality_ruleset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ruleset =
       option_of_yojson (value_for_key data_quality_ruleset_string_of_yojson "Ruleset") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : update_data_quality_ruleset_response)

let update_data_quality_ruleset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ruleset =
       option_of_yojson (value_for_key data_quality_ruleset_string_of_yojson "Ruleset") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : update_data_quality_ruleset_request)

let idempotent_parameter_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : idempotent_parameter_mismatch_exception)

let csv_column_delimiter_of_yojson = string_of_yojson
let csv_quote_symbol_of_yojson = string_of_yojson

let csv_header_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "ABSENT" -> ABSENT
    | `String "PRESENT" -> PRESENT
    | `String "UNKNOWN" -> UNKNOWN
    | `String value -> raise (deserialize_unknown_enum_value_error path "CsvHeaderOption" value)
    | _ -> raise (deserialize_wrong_type_error path "CsvHeaderOption")
     : csv_header_option)
    : csv_header_option)

let csv_header_of_yojson tree path = list_of_yojson name_string_of_yojson tree path
let custom_datatypes_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let csv_serde_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "None" -> None_
    | `String "LazySimpleSerDe" -> LazySimpleSerDe
    | `String "OpenCSVSerDe" -> OpenCSVSerDe
    | `String value -> raise (deserialize_unknown_enum_value_error path "CsvSerdeOption" value)
    | _ -> raise (deserialize_wrong_type_error path "CsvSerdeOption")
     : csv_serde_option)
    : csv_serde_option)

let update_csv_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     serde = option_of_yojson (value_for_key csv_serde_option_of_yojson "Serde") _list path;
     custom_datatypes =
       option_of_yojson (value_for_key custom_datatypes_of_yojson "CustomDatatypes") _list path;
     custom_datatype_configured =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "CustomDatatypeConfigured")
         _list path;
     allow_single_column =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "AllowSingleColumn") _list path;
     disable_value_trimming =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "DisableValueTrimming") _list path;
     header = option_of_yojson (value_for_key csv_header_of_yojson "Header") _list path;
     contains_header =
       option_of_yojson (value_for_key csv_header_option_of_yojson "ContainsHeader") _list path;
     quote_symbol =
       option_of_yojson (value_for_key csv_quote_symbol_of_yojson "QuoteSymbol") _list path;
     delimiter =
       option_of_yojson (value_for_key csv_column_delimiter_of_yojson "Delimiter") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : update_csv_classifier_request)

let update_crawler_schedule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cron_expression_of_yojson = string_of_yojson

let update_crawler_schedule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schedule = option_of_yojson (value_for_key cron_expression_of_yojson "Schedule") _list path;
     crawler_name = value_for_key name_string_of_yojson "CrawlerName" _list path;
   }
    : update_crawler_schedule_request)

let scheduler_transitioning_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : scheduler_transitioning_exception)

let update_crawler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let role_of_yojson = string_of_yojson
let database_name_of_yojson = string_of_yojson
let description_string_removable_of_yojson = string_of_yojson
let path_of_yojson = string_of_yojson
let path_list_of_yojson tree path = list_of_yojson path_of_yojson tree path
let connection_name_of_yojson = string_of_yojson
let event_queue_arn_of_yojson = string_of_yojson

let s3_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dlq_event_queue_arn =
       option_of_yojson (value_for_key event_queue_arn_of_yojson "DlqEventQueueArn") _list path;
     event_queue_arn =
       option_of_yojson (value_for_key event_queue_arn_of_yojson "EventQueueArn") _list path;
     sample_size =
       option_of_yojson (value_for_key nullable_integer_of_yojson "SampleSize") _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "ConnectionName") _list path;
     exclusions = option_of_yojson (value_for_key path_list_of_yojson "Exclusions") _list path;
     path = option_of_yojson (value_for_key path_of_yojson "Path") _list path;
   }
    : s3_target)

let s3_target_list_of_yojson tree path = list_of_yojson s3_target_of_yojson tree path

let jdbc_metadata_entry_of_yojson (tree : t) path =
  ((match tree with
    | `String "RAWTYPES" -> RAWTYPES
    | `String "COMMENTS" -> COMMENTS
    | `String value -> raise (deserialize_unknown_enum_value_error path "JdbcMetadataEntry" value)
    | _ -> raise (deserialize_wrong_type_error path "JdbcMetadataEntry")
     : jdbc_metadata_entry)
    : jdbc_metadata_entry)

let enable_additional_metadata_of_yojson tree path =
  list_of_yojson jdbc_metadata_entry_of_yojson tree path

let jdbc_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_additional_metadata =
       option_of_yojson
         (value_for_key enable_additional_metadata_of_yojson "EnableAdditionalMetadata")
         _list path;
     exclusions = option_of_yojson (value_for_key path_list_of_yojson "Exclusions") _list path;
     path = option_of_yojson (value_for_key path_of_yojson "Path") _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "ConnectionName") _list path;
   }
    : jdbc_target)

let jdbc_target_list_of_yojson tree path = list_of_yojson jdbc_target_of_yojson tree path

let mongo_db_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scan_all = option_of_yojson (value_for_key nullable_boolean_of_yojson "ScanAll") _list path;
     path = option_of_yojson (value_for_key path_of_yojson "Path") _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "ConnectionName") _list path;
   }
    : mongo_db_target)

let mongo_db_target_list_of_yojson tree path = list_of_yojson mongo_db_target_of_yojson tree path

let dynamo_db_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scan_rate = option_of_yojson (value_for_key nullable_double_of_yojson "scanRate") _list path;
     scan_all = option_of_yojson (value_for_key nullable_boolean_of_yojson "scanAll") _list path;
     path = option_of_yojson (value_for_key path_of_yojson "Path") _list path;
   }
    : dynamo_db_target)

let dynamo_db_target_list_of_yojson tree path = list_of_yojson dynamo_db_target_of_yojson tree path
let catalog_tables_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let catalog_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dlq_event_queue_arn =
       option_of_yojson (value_for_key event_queue_arn_of_yojson "DlqEventQueueArn") _list path;
     event_queue_arn =
       option_of_yojson (value_for_key event_queue_arn_of_yojson "EventQueueArn") _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "ConnectionName") _list path;
     tables = value_for_key catalog_tables_list_of_yojson "Tables" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
   }
    : catalog_target)

let catalog_target_list_of_yojson tree path = list_of_yojson catalog_target_of_yojson tree path

let delta_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_native_delta_table =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "CreateNativeDeltaTable")
         _list path;
     write_manifest =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "WriteManifest") _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "ConnectionName") _list path;
     delta_tables = option_of_yojson (value_for_key path_list_of_yojson "DeltaTables") _list path;
   }
    : delta_target)

let delta_target_list_of_yojson tree path = list_of_yojson delta_target_of_yojson tree path

let iceberg_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maximum_traversal_depth =
       option_of_yojson
         (value_for_key nullable_integer_of_yojson "MaximumTraversalDepth")
         _list path;
     exclusions = option_of_yojson (value_for_key path_list_of_yojson "Exclusions") _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "ConnectionName") _list path;
     paths = option_of_yojson (value_for_key path_list_of_yojson "Paths") _list path;
   }
    : iceberg_target)

let iceberg_target_list_of_yojson tree path = list_of_yojson iceberg_target_of_yojson tree path

let hudi_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maximum_traversal_depth =
       option_of_yojson
         (value_for_key nullable_integer_of_yojson "MaximumTraversalDepth")
         _list path;
     exclusions = option_of_yojson (value_for_key path_list_of_yojson "Exclusions") _list path;
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "ConnectionName") _list path;
     paths = option_of_yojson (value_for_key path_list_of_yojson "Paths") _list path;
   }
    : hudi_target)

let hudi_target_list_of_yojson tree path = list_of_yojson hudi_target_of_yojson tree path

let crawler_targets_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hudi_targets =
       option_of_yojson (value_for_key hudi_target_list_of_yojson "HudiTargets") _list path;
     iceberg_targets =
       option_of_yojson (value_for_key iceberg_target_list_of_yojson "IcebergTargets") _list path;
     delta_targets =
       option_of_yojson (value_for_key delta_target_list_of_yojson "DeltaTargets") _list path;
     catalog_targets =
       option_of_yojson (value_for_key catalog_target_list_of_yojson "CatalogTargets") _list path;
     dynamo_db_targets =
       option_of_yojson (value_for_key dynamo_db_target_list_of_yojson "DynamoDBTargets") _list path;
     mongo_db_targets =
       option_of_yojson (value_for_key mongo_db_target_list_of_yojson "MongoDBTargets") _list path;
     jdbc_targets =
       option_of_yojson (value_for_key jdbc_target_list_of_yojson "JdbcTargets") _list path;
     s3_targets = option_of_yojson (value_for_key s3_target_list_of_yojson "S3Targets") _list path;
   }
    : crawler_targets)

let classifier_name_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path
let table_prefix_of_yojson = string_of_yojson

let update_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATE_IN_DATABASE" -> UPDATE_IN_DATABASE
    | `String "LOG" -> LOG
    | `String value -> raise (deserialize_unknown_enum_value_error path "UpdateBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateBehavior")
     : update_behavior)
    : update_behavior)

let delete_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEPRECATE_IN_DATABASE" -> DEPRECATE_IN_DATABASE
    | `String "DELETE_FROM_DATABASE" -> DELETE_FROM_DATABASE
    | `String "LOG" -> LOG
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeleteBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "DeleteBehavior")
     : delete_behavior)
    : delete_behavior)

let schema_change_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_behavior =
       option_of_yojson (value_for_key delete_behavior_of_yojson "DeleteBehavior") _list path;
     update_behavior =
       option_of_yojson (value_for_key update_behavior_of_yojson "UpdateBehavior") _list path;
   }
    : schema_change_policy)

let recrawl_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "CRAWL_EVENT_MODE" -> CRAWL_EVENT_MODE
    | `String "CRAWL_NEW_FOLDERS_ONLY" -> CRAWL_NEW_FOLDERS_ONLY
    | `String "CRAWL_EVERYTHING" -> CRAWL_EVERYTHING
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecrawlBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "RecrawlBehavior")
     : recrawl_behavior)
    : recrawl_behavior)

let recrawl_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recrawl_behavior =
       option_of_yojson (value_for_key recrawl_behavior_of_yojson "RecrawlBehavior") _list path;
   }
    : recrawl_policy)

let crawler_lineage_settings_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLE" -> DISABLE
    | `String "ENABLE" -> ENABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CrawlerLineageSettings" value)
    | _ -> raise (deserialize_wrong_type_error path "CrawlerLineageSettings")
     : crawler_lineage_settings)
    : crawler_lineage_settings)

let lineage_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     crawler_lineage_settings =
       option_of_yojson
         (value_for_key crawler_lineage_settings_of_yojson "CrawlerLineageSettings")
         _list path;
   }
    : lineage_configuration)

let account_id_of_yojson = string_of_yojson

let lake_formation_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     use_lake_formation_credentials =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "UseLakeFormationCredentials")
         _list path;
   }
    : lake_formation_configuration)

let crawler_configuration_of_yojson = string_of_yojson
let crawler_security_configuration_of_yojson = string_of_yojson

let update_crawler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     crawler_security_configuration =
       option_of_yojson
         (value_for_key crawler_security_configuration_of_yojson "CrawlerSecurityConfiguration")
         _list path;
     configuration =
       option_of_yojson (value_for_key crawler_configuration_of_yojson "Configuration") _list path;
     lake_formation_configuration =
       option_of_yojson
         (value_for_key lake_formation_configuration_of_yojson "LakeFormationConfiguration")
         _list path;
     lineage_configuration =
       option_of_yojson
         (value_for_key lineage_configuration_of_yojson "LineageConfiguration")
         _list path;
     recrawl_policy =
       option_of_yojson (value_for_key recrawl_policy_of_yojson "RecrawlPolicy") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     table_prefix = option_of_yojson (value_for_key table_prefix_of_yojson "TablePrefix") _list path;
     classifiers =
       option_of_yojson (value_for_key classifier_name_list_of_yojson "Classifiers") _list path;
     schedule = option_of_yojson (value_for_key cron_expression_of_yojson "Schedule") _list path;
     targets = option_of_yojson (value_for_key crawler_targets_of_yojson "Targets") _list path;
     description =
       option_of_yojson
         (value_for_key description_string_removable_of_yojson "Description")
         _list path;
     database_name =
       option_of_yojson (value_for_key database_name_of_yojson "DatabaseName") _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : update_crawler_request)

let crawler_running_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : crawler_running_exception)

let update_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let connection_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VERTICA" -> VERTICA
    | `String "TPCDS" -> TPCDS
    | `String "TIMESTREAM" -> TIMESTREAM
    | `String "TERADATANOS" -> TERADATANOS
    | `String "TERADATA" -> TERADATA
    | `String "SYNAPSE" -> SYNAPSE
    | `String "SQLSERVER" -> SQLSERVER
    | `String "SAPHANA" -> SAPHANA
    | `String "POSTGRESQL" -> POSTGRESQL
    | `String "PIPEDRIVE" -> PIPEDRIVE
    | `String "ORACLE" -> ORACLE
    | `String "OPENSEARCH" -> OPENSEARCH
    | `String "OKTA" -> OKTA
    | `String "MYSQL" -> MYSQL
    | `String "MONDAY" -> MONDAY
    | `String "MICROSOFTDYNAMICS365CRM" -> MICROSOFTDYNAMICS365CRM
    | `String "KUSTOMER" -> KUSTOMER
    | `String "HBASE" -> HBASE
    | `String "GOOGLECLOUDSTORAGE" -> GOOGLECLOUDSTORAGE
    | `String "DYNAMODB" -> DYNAMODB
    | `String "DOMO" -> DOMO
    | `String "DOCUMENTDB" -> DOCUMENTDB
    | `String "DB2AS400" -> DB2AS400
    | `String "DB2" -> DB2
    | `String "DATALAKEGEN2" -> DATALAKEGEN2
    | `String "CMDB" -> CMDB
    | `String "CLOUDWATCHMETRICS" -> CLOUDWATCHMETRICS
    | `String "CLOUDWATCH" -> CLOUDWATCH
    | `String "CLOUDERAIMPALA" -> CLOUDERAIMPALA
    | `String "CLOUDERAHIVE" -> CLOUDERAHIVE
    | `String "BLACKBAUD" -> BLACKBAUD
    | `String "BIGQUERY" -> BIGQUERY
    | `String "AZURESQL" -> AZURESQL
    | `String "AZURECOSMOS" -> AZURECOSMOS
    | `String "SENDGRID" -> SENDGRID
    | `String "PIPEDIVE" -> PIPEDIVE
    | `String "CIRCLECI" -> CIRCLECI
    | `String "PRODUCTBOARD" -> PRODUCTBOARD
    | `String "PENDO" -> PENDO
    | `String "GITLAB" -> GITLAB
    | `String "MAILCHIMP" -> MAILCHIMP
    | `String "BLACKBAUDRAISEREDGENXT" -> BLACKBAUDRAISEREDGENXT
    | `String "MICROSOFTTEAMS" -> MICROSOFTTEAMS
    | `String "MICROSOFTDYNAMIC365FINANCEANDOPS" -> MICROSOFTDYNAMIC365FINANCEANDOPS
    | `String "DYNATRACE" -> DYNATRACE
    | `String "SAPCONCUR" -> SAPCONCUR
    | `String "SALESFORCECOMMERCECLOUD" -> SALESFORCECOMMERCECLOUD
    | `String "GOOGLESEARCHCONSOLE" -> GOOGLESEARCHCONSOLE
    | `String "ZOOM" -> ZOOM
    | `String "FRESHSALES" -> FRESHSALES
    | `String "DOCUSIGNMONITOR" -> DOCUSIGNMONITOR
    | `String "TWILIO" -> TWILIO
    | `String "FRESHDESK" -> FRESHDESK
    | `String "FACEBOOKPAGEINSIGHTS" -> FACEBOOKPAGEINSIGHTS
    | `String "QUICKBOOKS" -> QUICKBOOKS
    | `String "PAYPAL" -> PAYPAL
    | `String "SNAPCHATADS" -> SNAPCHATADS
    | `String "INTERCOM" -> INTERCOM
    | `String "WOOCOMMERCE" -> WOOCOMMERCE
    | `String "DATADOG" -> DATADOG
    | `String "SMARTSHEET" -> SMARTSHEET
    | `String "STRIPE" -> STRIPE
    | `String "ASANA" -> ASANA
    | `String "MIXPANEL" -> MIXPANEL
    | `String "LINKEDIN" -> LINKEDIN
    | `String "SLACK" -> SLACK
    | `String "ADOBEANALYTICS" -> ADOBEANALYTICS
    | `String "SALESFORCEMARKETINGCLOUD" -> SALESFORCEMARKETINGCLOUD
    | `String "SALESFORCEPARDOT" -> SALESFORCEPARDOT
    | `String "ZOHOCRM" -> ZOHOCRM
    | `String "INSTAGRAMADS" -> INSTAGRAMADS
    | `String "FACEBOOKADS" -> FACEBOOKADS
    | `String "HUBSPOT" -> HUBSPOT
    | `String "NETSUITEERP" -> NETSUITEERP
    | `String "JIRACLOUD" -> JIRACLOUD
    | `String "ZENDESK" -> ZENDESK
    | `String "SAPODATA" -> SAPODATA
    | `String "MARKETO" -> MARKETO
    | `String "SERVICENOW" -> SERVICENOW
    | `String "GOOGLEANALYTICS4" -> GOOGLEANALYTICS4
    | `String "GOOGLESHEETS" -> GOOGLESHEETS
    | `String "GOOGLEADS" -> GOOGLEADS
    | `String "VIEW_VALIDATION_ATHENA" -> VIEW_VALIDATION_ATHENA
    | `String "VIEW_VALIDATION_REDSHIFT" -> VIEW_VALIDATION_REDSHIFT
    | `String "SALESFORCE" -> SALESFORCE
    | `String "CUSTOM" -> CUSTOM
    | `String "MARKETPLACE" -> MARKETPLACE
    | `String "NETWORK" -> NETWORK
    | `String "KAFKA" -> KAFKA
    | `String "MONGODB" -> MONGODB
    | `String "SFTP" -> SFTP
    | `String "JDBC" -> JDBC
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionType")
     : connection_type)
    : connection_type)

let match_criteria_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let connection_property_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "DATABASE" -> DATABASE
    | `String "CLUSTER_IDENTIFIER" -> CLUSTER_IDENTIFIER
    | `String "WORKGROUP_NAME" -> WORKGROUP_NAME
    | `String "REGION" -> REGION
    | `String "ROLE_ARN" -> ROLE_ARN
    | `String "ENDPOINT_TYPE" -> ENDPOINT_TYPE
    | `String "ENDPOINT" -> ENDPOINT
    | `String "CONNECTOR_CLASS_NAME" -> CONNECTOR_CLASS_NAME
    | `String "CONNECTOR_TYPE" -> CONNECTOR_TYPE
    | `String "CONNECTOR_URL" -> CONNECTOR_URL
    | `String "SECRET_ID" -> SECRET_ID
    | `String "KAFKA_SASL_GSSAPI_PRINCIPAL" -> KAFKA_SASL_GSSAPI_PRINCIPAL
    | `String "KAFKA_SASL_GSSAPI_SERVICE" -> KAFKA_SASL_GSSAPI_SERVICE
    | `String "KAFKA_SASL_GSSAPI_KRB5_CONF" -> KAFKA_SASL_GSSAPI_KRB5_CONF
    | `String "KAFKA_SASL_GSSAPI_KEYTAB" -> KAFKA_SASL_GSSAPI_KEYTAB
    | `String "ENCRYPTED_KAFKA_SASL_SCRAM_PASSWORD" -> ENCRYPTED_KAFKA_SASL_SCRAM_PASSWORD
    | `String "KAFKA_SASL_SCRAM_SECRETS_ARN" -> KAFKA_SASL_SCRAM_SECRETS_ARN
    | `String "KAFKA_SASL_SCRAM_PASSWORD" -> KAFKA_SASL_SCRAM_PASSWORD
    | `String "KAFKA_SASL_SCRAM_USERNAME" -> KAFKA_SASL_SCRAM_USERNAME
    | `String "ENCRYPTED_KAFKA_SASL_PLAIN_PASSWORD" -> ENCRYPTED_KAFKA_SASL_PLAIN_PASSWORD
    | `String "KAFKA_SASL_PLAIN_PASSWORD" -> KAFKA_SASL_PLAIN_PASSWORD
    | `String "KAFKA_SASL_PLAIN_USERNAME" -> KAFKA_SASL_PLAIN_USERNAME
    | `String "KAFKA_SASL_MECHANISM" -> KAFKA_SASL_MECHANISM
    | `String "ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD" -> ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD
    | `String "ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD" -> ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD
    | `String "KAFKA_CLIENT_KEY_PASSWORD" -> KAFKA_CLIENT_KEY_PASSWORD
    | `String "KAFKA_CLIENT_KEYSTORE_PASSWORD" -> KAFKA_CLIENT_KEYSTORE_PASSWORD
    | `String "KAFKA_CLIENT_KEYSTORE" -> KAFKA_CLIENT_KEYSTORE
    | `String "KAFKA_SKIP_CUSTOM_CERT_VALIDATION" -> KAFKA_SKIP_CUSTOM_CERT_VALIDATION
    | `String "KAFKA_CUSTOM_CERT" -> KAFKA_CUSTOM_CERT
    | `String "KAFKA_SSL_ENABLED" -> KAFKA_SSL_ENABLED
    | `String "KAFKA_BOOTSTRAP_SERVERS" -> KAFKA_BOOTSTRAP_SERVERS
    | `String "CONNECTION_URL" -> CONNECTION_URL
    | `String "CUSTOM_JDBC_CERT_STRING" -> CUSTOM_JDBC_CERT_STRING
    | `String "SKIP_CUSTOM_JDBC_CERT_VALIDATION" -> SKIP_CUSTOM_JDBC_CERT_VALIDATION
    | `String "CUSTOM_JDBC_CERT" -> CUSTOM_JDBC_CERT
    | `String "JDBC_ENFORCE_SSL" -> JDBC_ENFORCE_SSL
    | `String "JDBC_CONNECTION_URL" -> JDBC_CONNECTION_URL
    | `String "INSTANCE_ID" -> INSTANCE_ID
    | `String "CONFIG_FILES" -> CONFIG_FILES
    | `String "JDBC_ENGINE_VERSION" -> JDBC_ENGINE_VERSION
    | `String "JDBC_ENGINE" -> JDBC_ENGINE
    | `String "JDBC_DRIVER_CLASS_NAME" -> JDBC_DRIVER_CLASS_NAME
    | `String "JDBC_DRIVER_JAR_URI" -> JDBC_DRIVER_JAR_URI
    | `String "ENCRYPTED_PASSWORD" -> ENCRYPTED_PASSWORD
    | `String "PASSWORD" -> PASSWORD
    | `String "USERNAME" -> USER_NAME
    | `String "PORT" -> PORT
    | `String "HOST" -> HOST
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConnectionPropertyKey" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionPropertyKey")
     : connection_property_key)
    : connection_property_key)

let connection_properties_of_yojson tree path =
  map_of_yojson connection_property_key_of_yojson value_string_of_yojson tree path

let property_value_of_yojson = string_of_yojson
let property_key_of_yojson = string_of_yojson

let property_map_of_yojson tree path =
  map_of_yojson property_key_of_yojson property_value_of_yojson tree path

let security_group_id_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let physical_connection_requirements_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone =
       option_of_yojson (value_for_key name_string_of_yojson "AvailabilityZone") _list path;
     security_group_id_list =
       option_of_yojson
         (value_for_key security_group_id_list_of_yojson "SecurityGroupIdList")
         _list path;
     subnet_id = option_of_yojson (value_for_key name_string_of_yojson "SubnetId") _list path;
   }
    : physical_connection_requirements)

let authentication_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IAM" -> IAM
    | `String "CUSTOM" -> CUSTOM
    | `String "OAUTH2" -> OAUTH2
    | `String "BASIC" -> BASIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthenticationType")
     : authentication_type)
    : authentication_type)

let o_auth2_grant_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "JWT_BEARER" -> JWT_BEARER
    | `String "CLIENT_CREDENTIALS" -> CLIENT_CREDENTIALS
    | `String "AUTHORIZATION_CODE" -> AUTHORIZATION_CODE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OAuth2GrantType" value)
    | _ -> raise (deserialize_wrong_type_error path "OAuth2GrantType")
     : o_auth2_grant_type)
    : o_auth2_grant_type)

let aws_managed_client_application_reference_of_yojson = string_of_yojson

let o_auth2_client_application_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_managed_client_application_reference =
       option_of_yojson
         (value_for_key aws_managed_client_application_reference_of_yojson
            "AWSManagedClientApplicationReference")
         _list path;
     user_managed_client_application_client_id =
       option_of_yojson
         (value_for_key user_managed_client_application_client_id_of_yojson
            "UserManagedClientApplicationClientId")
         _list path;
   }
    : o_auth2_client_application)

let token_url_of_yojson = string_of_yojson
let token_url_parameter_value_of_yojson = string_of_yojson
let token_url_parameter_key_of_yojson = string_of_yojson

let token_url_parameters_map_of_yojson tree path =
  map_of_yojson token_url_parameter_key_of_yojson token_url_parameter_value_of_yojson tree path

let authorization_code_of_yojson = string_of_yojson
let redirect_uri_of_yojson = string_of_yojson

let authorization_code_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redirect_uri = option_of_yojson (value_for_key redirect_uri_of_yojson "RedirectUri") _list path;
     authorization_code =
       option_of_yojson (value_for_key authorization_code_of_yojson "AuthorizationCode") _list path;
   }
    : authorization_code_properties)

let access_token_of_yojson = string_of_yojson
let refresh_token_of_yojson = string_of_yojson
let jwt_token_of_yojson = string_of_yojson

let o_auth2_credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     jwt_token = option_of_yojson (value_for_key jwt_token_of_yojson "JwtToken") _list path;
     refresh_token =
       option_of_yojson (value_for_key refresh_token_of_yojson "RefreshToken") _list path;
     access_token = option_of_yojson (value_for_key access_token_of_yojson "AccessToken") _list path;
     user_managed_client_application_client_secret =
       option_of_yojson
         (value_for_key user_managed_client_application_client_secret_of_yojson
            "UserManagedClientApplicationClientSecret")
         _list path;
   }
    : o_auth2_credentials)

let o_auth2_properties_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     o_auth2_credentials =
       option_of_yojson (value_for_key o_auth2_credentials_of_yojson "OAuth2Credentials") _list path;
     authorization_code_properties =
       option_of_yojson
         (value_for_key authorization_code_properties_of_yojson "AuthorizationCodeProperties")
         _list path;
     token_url_parameters_map =
       option_of_yojson
         (value_for_key token_url_parameters_map_of_yojson "TokenUrlParametersMap")
         _list path;
     token_url = option_of_yojson (value_for_key token_url_of_yojson "TokenUrl") _list path;
     o_auth2_client_application =
       option_of_yojson
         (value_for_key o_auth2_client_application_of_yojson "OAuth2ClientApplication")
         _list path;
     o_auth2_grant_type =
       option_of_yojson (value_for_key o_auth2_grant_type_of_yojson "OAuth2GrantType") _list path;
   }
    : o_auth2_properties_input)

let secret_arn_of_yojson = string_of_yojson
let kms_key_arn_of_yojson = string_of_yojson
let password_of_yojson = string_of_yojson

let basic_authentication_credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password = option_of_yojson (value_for_key password_of_yojson "Password") _list path;
     username = option_of_yojson (value_for_key username_of_yojson "Username") _list path;
   }
    : basic_authentication_credentials)

let credential_value_of_yojson = string_of_yojson
let credential_key_of_yojson = string_of_yojson

let credential_map_of_yojson tree path =
  map_of_yojson credential_key_of_yojson credential_value_of_yojson tree path

let authentication_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_authentication_credentials =
       option_of_yojson
         (value_for_key credential_map_of_yojson "CustomAuthenticationCredentials")
         _list path;
     basic_authentication_credentials =
       option_of_yojson
         (value_for_key basic_authentication_credentials_of_yojson "BasicAuthenticationCredentials")
         _list path;
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     o_auth2_properties =
       option_of_yojson
         (value_for_key o_auth2_properties_input_of_yojson "OAuth2Properties")
         _list path;
     authentication_type =
       option_of_yojson
         (value_for_key authentication_type_of_yojson "AuthenticationType")
         _list path;
   }
    : authentication_configuration_input)

let compute_environment_of_yojson (tree : t) path =
  ((match tree with
    | `String "PYTHON" -> PYTHON
    | `String "ATHENA" -> ATHENA
    | `String "SPARK" -> SPARK
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComputeEnvironment" value)
    | _ -> raise (deserialize_wrong_type_error path "ComputeEnvironment")
     : compute_environment)
    : compute_environment)

let compute_environment_list_of_yojson tree path =
  list_of_yojson compute_environment_of_yojson tree path

let connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     validate_for_compute_environments =
       option_of_yojson
         (value_for_key compute_environment_list_of_yojson "ValidateForComputeEnvironments")
         _list path;
     validate_credentials =
       option_of_yojson (value_for_key boolean__of_yojson "ValidateCredentials") _list path;
     authentication_configuration =
       option_of_yojson
         (value_for_key authentication_configuration_input_of_yojson "AuthenticationConfiguration")
         _list path;
     physical_connection_requirements =
       option_of_yojson
         (value_for_key physical_connection_requirements_of_yojson "PhysicalConnectionRequirements")
         _list path;
     python_properties =
       option_of_yojson (value_for_key property_map_of_yojson "PythonProperties") _list path;
     athena_properties =
       option_of_yojson (value_for_key property_map_of_yojson "AthenaProperties") _list path;
     spark_properties =
       option_of_yojson (value_for_key property_map_of_yojson "SparkProperties") _list path;
     connection_properties =
       value_for_key connection_properties_of_yojson "ConnectionProperties" _list path;
     match_criteria =
       option_of_yojson (value_for_key match_criteria_of_yojson "MatchCriteria") _list path;
     connection_type = value_for_key connection_type_of_yojson "ConnectionType" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : connection_input)

let update_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_input = value_for_key connection_input_of_yojson "ConnectionInput" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : update_connection_request)

let update_column_statistics_task_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let column_name_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path
let sample_size_percentage_of_yojson = double_of_yojson

let update_column_statistics_task_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     catalog_i_d = option_of_yojson (value_for_key name_string_of_yojson "CatalogID") _list path;
     sample_size =
       option_of_yojson (value_for_key sample_size_percentage_of_yojson "SampleSize") _list path;
     column_name_list =
       option_of_yojson (value_for_key column_name_list_of_yojson "ColumnNameList") _list path;
     schedule = option_of_yojson (value_for_key cron_expression_of_yojson "Schedule") _list path;
     role = option_of_yojson (value_for_key name_string_of_yojson "Role") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
   }
    : update_column_statistics_task_settings_request)

let type_string_of_yojson = string_of_yojson

let column_statistics_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BINARY" -> BINARY
    | `String "STRING" -> STRING
    | `String "LONG" -> LONG
    | `String "DOUBLE" -> DOUBLE
    | `String "DECIMAL" -> DECIMAL
    | `String "DATE" -> DATE
    | `String "BOOLEAN" -> BOOLEAN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ColumnStatisticsType" value)
    | _ -> raise (deserialize_wrong_type_error path "ColumnStatisticsType")
     : column_statistics_type)
    : column_statistics_type)

let non_negative_long_of_yojson = long_of_yojson

let boolean_column_statistics_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_nulls = value_for_key non_negative_long_of_yojson "NumberOfNulls" _list path;
     number_of_falses = value_for_key non_negative_long_of_yojson "NumberOfFalses" _list path;
     number_of_trues = value_for_key non_negative_long_of_yojson "NumberOfTrues" _list path;
   }
    : boolean_column_statistics_data)

let date_column_statistics_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_distinct_values =
       value_for_key non_negative_long_of_yojson "NumberOfDistinctValues" _list path;
     number_of_nulls = value_for_key non_negative_long_of_yojson "NumberOfNulls" _list path;
     maximum_value = option_of_yojson (value_for_key timestamp_of_yojson "MaximumValue") _list path;
     minimum_value = option_of_yojson (value_for_key timestamp_of_yojson "MinimumValue") _list path;
   }
    : date_column_statistics_data)

let blob_of_yojson = blob_of_yojson

let decimal_number_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scale = value_for_key integer_of_yojson "Scale" _list path;
     unscaled_value = value_for_key blob_of_yojson "UnscaledValue" _list path;
   }
    : decimal_number)

let decimal_column_statistics_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_distinct_values =
       value_for_key non_negative_long_of_yojson "NumberOfDistinctValues" _list path;
     number_of_nulls = value_for_key non_negative_long_of_yojson "NumberOfNulls" _list path;
     maximum_value =
       option_of_yojson (value_for_key decimal_number_of_yojson "MaximumValue") _list path;
     minimum_value =
       option_of_yojson (value_for_key decimal_number_of_yojson "MinimumValue") _list path;
   }
    : decimal_column_statistics_data)

let double_of_yojson = double_of_yojson

let double_column_statistics_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_distinct_values =
       value_for_key non_negative_long_of_yojson "NumberOfDistinctValues" _list path;
     number_of_nulls = value_for_key non_negative_long_of_yojson "NumberOfNulls" _list path;
     maximum_value = option_of_yojson (value_for_key double_of_yojson "MaximumValue") _list path;
     minimum_value = option_of_yojson (value_for_key double_of_yojson "MinimumValue") _list path;
   }
    : double_column_statistics_data)

let long_of_yojson = long_of_yojson

let long_column_statistics_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_distinct_values =
       value_for_key non_negative_long_of_yojson "NumberOfDistinctValues" _list path;
     number_of_nulls = value_for_key non_negative_long_of_yojson "NumberOfNulls" _list path;
     maximum_value = option_of_yojson (value_for_key long_of_yojson "MaximumValue") _list path;
     minimum_value = option_of_yojson (value_for_key long_of_yojson "MinimumValue") _list path;
   }
    : long_column_statistics_data)

let non_negative_double_of_yojson = double_of_yojson

let string_column_statistics_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_distinct_values =
       value_for_key non_negative_long_of_yojson "NumberOfDistinctValues" _list path;
     number_of_nulls = value_for_key non_negative_long_of_yojson "NumberOfNulls" _list path;
     average_length = value_for_key non_negative_double_of_yojson "AverageLength" _list path;
     maximum_length = value_for_key non_negative_long_of_yojson "MaximumLength" _list path;
   }
    : string_column_statistics_data)

let binary_column_statistics_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_nulls = value_for_key non_negative_long_of_yojson "NumberOfNulls" _list path;
     average_length = value_for_key non_negative_double_of_yojson "AverageLength" _list path;
     maximum_length = value_for_key non_negative_long_of_yojson "MaximumLength" _list path;
   }
    : binary_column_statistics_data)

let column_statistics_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     binary_column_statistics_data =
       option_of_yojson
         (value_for_key binary_column_statistics_data_of_yojson "BinaryColumnStatisticsData")
         _list path;
     string_column_statistics_data =
       option_of_yojson
         (value_for_key string_column_statistics_data_of_yojson "StringColumnStatisticsData")
         _list path;
     long_column_statistics_data =
       option_of_yojson
         (value_for_key long_column_statistics_data_of_yojson "LongColumnStatisticsData")
         _list path;
     double_column_statistics_data =
       option_of_yojson
         (value_for_key double_column_statistics_data_of_yojson "DoubleColumnStatisticsData")
         _list path;
     decimal_column_statistics_data =
       option_of_yojson
         (value_for_key decimal_column_statistics_data_of_yojson "DecimalColumnStatisticsData")
         _list path;
     date_column_statistics_data =
       option_of_yojson
         (value_for_key date_column_statistics_data_of_yojson "DateColumnStatisticsData")
         _list path;
     boolean_column_statistics_data =
       option_of_yojson
         (value_for_key boolean_column_statistics_data_of_yojson "BooleanColumnStatisticsData")
         _list path;
     type_ = value_for_key column_statistics_type_of_yojson "Type" _list path;
   }
    : column_statistics_data)

let column_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statistics_data = value_for_key column_statistics_data_of_yojson "StatisticsData" _list path;
     analyzed_time = value_for_key timestamp_of_yojson "AnalyzedTime" _list path;
     column_type = value_for_key type_string_of_yojson "ColumnType" _list path;
     column_name = value_for_key name_string_of_yojson "ColumnName" _list path;
   }
    : column_statistics)

let update_column_statistics_list_of_yojson tree path =
  list_of_yojson column_statistics_of_yojson tree path

let column_statistics_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key error_detail_of_yojson "Error") _list path;
     column_statistics =
       option_of_yojson (value_for_key column_statistics_of_yojson "ColumnStatistics") _list path;
   }
    : column_statistics_error)

let column_statistics_errors_of_yojson tree path =
  list_of_yojson column_statistics_error_of_yojson tree path

let update_column_statistics_for_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson (value_for_key column_statistics_errors_of_yojson "Errors") _list path;
   }
    : update_column_statistics_for_table_response)

let update_column_statistics_for_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_statistics_list =
       value_for_key update_column_statistics_list_of_yojson "ColumnStatisticsList" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : update_column_statistics_for_table_request)

let update_column_statistics_for_partition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson (value_for_key column_statistics_errors_of_yojson "Errors") _list path;
   }
    : update_column_statistics_for_partition_response)

let update_column_statistics_for_partition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_statistics_list =
       value_for_key update_column_statistics_list_of_yojson "ColumnStatisticsList" _list path;
     partition_values = value_for_key value_string_list_of_yojson "PartitionValues" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : update_column_statistics_for_partition_request)

let update_classifier_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     csv_classifier =
       option_of_yojson
         (value_for_key update_csv_classifier_request_of_yojson "CsvClassifier")
         _list path;
     json_classifier =
       option_of_yojson
         (value_for_key update_json_classifier_request_of_yojson "JsonClassifier")
         _list path;
     xml_classifier =
       option_of_yojson
         (value_for_key update_xml_classifier_request_of_yojson "XMLClassifier")
         _list path;
     grok_classifier =
       option_of_yojson
         (value_for_key update_grok_classifier_request_of_yojson "GrokClassifier")
         _list path;
   }
    : update_classifier_request)

let update_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let federated_catalog_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_type =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionType") _list path;
     connection_name =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionName") _list path;
     identifier =
       option_of_yojson (value_for_key federation_identifier_of_yojson "Identifier") _list path;
   }
    : federated_catalog)

let resource_arn_string_of_yojson = string_of_yojson

let target_redshift_catalog_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ catalog_arn = value_for_key resource_arn_string_of_yojson "CatalogArn" _list path }
    : target_redshift_catalog)

let iam_role_arn_of_yojson = string_of_yojson

let data_lake_access_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_type = option_of_yojson (value_for_key name_string_of_yojson "CatalogType") _list path;
     kms_key = option_of_yojson (value_for_key resource_arn_string_of_yojson "KmsKey") _list path;
     data_transfer_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataTransferRole") _list path;
     data_lake_access =
       option_of_yojson (value_for_key boolean__of_yojson "DataLakeAccess") _list path;
   }
    : data_lake_access_properties)

let iceberg_optimization_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     orphan_file_deletion =
       option_of_yojson (value_for_key parameters_map_of_yojson "OrphanFileDeletion") _list path;
     retention = option_of_yojson (value_for_key parameters_map_of_yojson "Retention") _list path;
     compaction = option_of_yojson (value_for_key parameters_map_of_yojson "Compaction") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
   }
    : iceberg_optimization_properties)

let catalog_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_properties =
       option_of_yojson (value_for_key parameters_map_of_yojson "CustomProperties") _list path;
     iceberg_optimization_properties =
       option_of_yojson
         (value_for_key iceberg_optimization_properties_of_yojson "IcebergOptimizationProperties")
         _list path;
     data_lake_access_properties =
       option_of_yojson
         (value_for_key data_lake_access_properties_of_yojson "DataLakeAccessProperties")
         _list path;
   }
    : catalog_properties)

let allow_full_table_external_data_access_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "False" -> False
    | `String "True" -> True
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AllowFullTableExternalDataAccessEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "AllowFullTableExternalDataAccessEnum")
     : allow_full_table_external_data_access_enum)
    : allow_full_table_external_data_access_enum)

let overwrite_child_resource_permissions_with_default_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "Deny" -> Deny
    | `String "Accept" -> Accept
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "OverwriteChildResourcePermissionsWithDefaultEnum" value)
    | _ ->
        raise (deserialize_wrong_type_error path "OverwriteChildResourcePermissionsWithDefaultEnum")
     : overwrite_child_resource_permissions_with_default_enum)
    : overwrite_child_resource_permissions_with_default_enum)

let catalog_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     overwrite_child_resource_permissions_with_default =
       option_of_yojson
         (value_for_key overwrite_child_resource_permissions_with_default_enum_of_yojson
            "OverwriteChildResourcePermissionsWithDefault")
         _list path;
     allow_full_table_external_data_access =
       option_of_yojson
         (value_for_key allow_full_table_external_data_access_enum_of_yojson
            "AllowFullTableExternalDataAccess")
         _list path;
     create_database_default_permissions =
       option_of_yojson
         (value_for_key principal_permissions_list_of_yojson "CreateDatabaseDefaultPermissions")
         _list path;
     create_table_default_permissions =
       option_of_yojson
         (value_for_key principal_permissions_list_of_yojson "CreateTableDefaultPermissions")
         _list path;
     catalog_properties =
       option_of_yojson (value_for_key catalog_properties_of_yojson "CatalogProperties") _list path;
     target_redshift_catalog =
       option_of_yojson
         (value_for_key target_redshift_catalog_of_yojson "TargetRedshiftCatalog")
         _list path;
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     federated_catalog =
       option_of_yojson (value_for_key federated_catalog_of_yojson "FederatedCatalog") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
   }
    : catalog_input)

let update_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_input = value_for_key catalog_input_of_yojson "CatalogInput" _list path;
     catalog_id = value_for_key catalog_id_string_of_yojson "CatalogId" _list path;
   }
    : update_catalog_request)

let update_blueprint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : update_blueprint_response)

let orchestration_s3_location_of_yojson = string_of_yojson

let update_blueprint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blueprint_location =
       value_for_key orchestration_s3_location_of_yojson "BlueprintLocation" _list path;
     description =
       option_of_yojson (value_for_key generic512_char_string_of_yojson "Description") _list path;
     name = value_for_key orchestration_name_string_of_yojson "Name" _list path;
   }
    : update_blueprint_request)

let illegal_blueprint_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : illegal_blueprint_state_exception)

let asset_id_of_yojson = string_of_yojson
let asset_name_of_yojson = string_of_yojson
let asset_description_of_yojson = string_of_yojson

let update_asset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key updated_at_of_yojson "UpdatedAt") _list path;
     description =
       option_of_yojson (value_for_key asset_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key asset_name_of_yojson "Name") _list path;
     id = value_for_key asset_id_of_yojson "Id" _list path;
   }
    : update_asset_response)

let update_asset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     description =
       option_of_yojson (value_for_key asset_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key asset_name_of_yojson "Name") _list path;
     identifier = value_for_key asset_id_of_yojson "Identifier" _list path;
   }
    : update_asset_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_keys_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags_to_remove = value_for_key tag_keys_list_of_yojson "TagsToRemove" _list path;
     resource_arn = value_for_key glue_resource_arn_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let partition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
     last_analyzed_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAnalyzedTime") _list path;
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     storage_descriptor =
       option_of_yojson (value_for_key storage_descriptor_of_yojson "StorageDescriptor") _list path;
     last_access_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAccessTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     table_name = option_of_yojson (value_for_key name_string_of_yojson "TableName") _list path;
     database_name =
       option_of_yojson (value_for_key name_string_of_yojson "DatabaseName") _list path;
     values = option_of_yojson (value_for_key value_string_list_of_yojson "Values") _list path;
   }
    : partition)

let unfiltered_partition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_registered_with_lake_formation =
       option_of_yojson
         (value_for_key boolean__of_yojson "IsRegisteredWithLakeFormation")
         _list path;
     authorized_columns =
       option_of_yojson (value_for_key name_string_list_of_yojson "AuthorizedColumns") _list path;
     partition = option_of_yojson (value_for_key partition_of_yojson "Partition") _list path;
   }
    : unfiltered_partition)

let unfiltered_partition_list_of_yojson tree path =
  list_of_yojson unfiltered_partition_of_yojson tree path

let uui_dv4_of_yojson = string_of_yojson
let trigger_name_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path
let trigger_list_of_yojson tree path = list_of_yojson trigger_of_yojson tree path

let transform_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETING" -> DELETING
    | `String "READY" -> READY
    | `String "NOT_READY" -> NOT_READY
    | `String value -> raise (deserialize_unknown_enum_value_error path "TransformStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "TransformStatusType")
     : transform_status_type)
    : transform_status_type)

let transform_sort_column_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LAST_MODIFIED" -> LAST_MODIFIED
    | `String "CREATED" -> CREATED
    | `String "STATUS" -> STATUS
    | `String "TRANSFORM_TYPE" -> TRANSFORM_TYPE
    | `String "NAME" -> NAME
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TransformSortColumnType" value)
    | _ -> raise (deserialize_wrong_type_error path "TransformSortColumnType")
     : transform_sort_column_type)
    : transform_sort_column_type)

let sort_direction_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASCENDING" -> ASCENDING
    | `String "DESCENDING" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortDirectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "SortDirectionType")
     : sort_direction_type)
    : sort_direction_type)

let transform_sort_criteria_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_direction = value_for_key sort_direction_type_of_yojson "SortDirection" _list path;
     column = value_for_key transform_sort_column_type_of_yojson "Column" _list path;
   }
    : transform_sort_criteria)

let schema_column_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_type = option_of_yojson (value_for_key column_type_string_of_yojson "DataType") _list path;
     name = option_of_yojson (value_for_key column_name_string_of_yojson "Name") _list path;
   }
    : schema_column)

let transform_schema_of_yojson tree path = list_of_yojson schema_column_of_yojson tree path

let glue_table_additional_options_of_yojson tree path =
  map_of_yojson name_string_of_yojson description_string_of_yojson tree path

let glue_table_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_options =
       option_of_yojson
         (value_for_key glue_table_additional_options_of_yojson "AdditionalOptions")
         _list path;
     connection_name =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionName") _list path;
     catalog_id = option_of_yojson (value_for_key name_string_of_yojson "CatalogId") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
   }
    : glue_table)

let glue_tables_of_yojson tree path = list_of_yojson glue_table_of_yojson tree path
let records_count_of_yojson = long_of_yojson

let confusion_matrix_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     num_false_negatives =
       option_of_yojson (value_for_key records_count_of_yojson "NumFalseNegatives") _list path;
     num_true_negatives =
       option_of_yojson (value_for_key records_count_of_yojson "NumTrueNegatives") _list path;
     num_false_positives =
       option_of_yojson (value_for_key records_count_of_yojson "NumFalsePositives") _list path;
     num_true_positives =
       option_of_yojson (value_for_key records_count_of_yojson "NumTruePositives") _list path;
   }
    : confusion_matrix)

let column_importance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     importance =
       option_of_yojson (value_for_key generic_bounded_double_of_yojson "Importance") _list path;
     column_name = option_of_yojson (value_for_key name_string_of_yojson "ColumnName") _list path;
   }
    : column_importance)

let column_importance_list_of_yojson tree path =
  list_of_yojson column_importance_of_yojson tree path

let find_matches_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_importances =
       option_of_yojson
         (value_for_key column_importance_list_of_yojson "ColumnImportances")
         _list path;
     confusion_matrix =
       option_of_yojson (value_for_key confusion_matrix_of_yojson "ConfusionMatrix") _list path;
     f1 = option_of_yojson (value_for_key generic_bounded_double_of_yojson "F1") _list path;
     recall = option_of_yojson (value_for_key generic_bounded_double_of_yojson "Recall") _list path;
     precision =
       option_of_yojson (value_for_key generic_bounded_double_of_yojson "Precision") _list path;
     area_under_pr_curve =
       option_of_yojson
         (value_for_key generic_bounded_double_of_yojson "AreaUnderPRCurve")
         _list path;
   }
    : find_matches_metrics)

let evaluation_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     find_matches_metrics =
       option_of_yojson
         (value_for_key find_matches_metrics_of_yojson "FindMatchesMetrics")
         _list path;
     transform_type = value_for_key transform_type_of_yojson "TransformType" _list path;
   }
    : evaluation_metrics)

let label_count_of_yojson = int_of_yojson

let ml_user_data_encryption_mode_string_of_yojson (tree : t) path =
  ((match tree with
    | `String "SSE-KMS" -> SSEKMS
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MLUserDataEncryptionModeString" value)
    | _ -> raise (deserialize_wrong_type_error path "MLUserDataEncryptionModeString")
     : ml_user_data_encryption_mode_string)
    : ml_user_data_encryption_mode_string)

let ml_user_data_encryption_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key name_string_of_yojson "KmsKeyId") _list path;
     ml_user_data_encryption_mode =
       value_for_key ml_user_data_encryption_mode_string_of_yojson "MlUserDataEncryptionMode" _list
         path;
   }
    : ml_user_data_encryption)

let transform_encryption_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_run_security_configuration_name =
       option_of_yojson
         (value_for_key name_string_of_yojson "TaskRunSecurityConfigurationName")
         _list path;
     ml_user_data_encryption =
       option_of_yojson
         (value_for_key ml_user_data_encryption_of_yojson "MlUserDataEncryption")
         _list path;
   }
    : transform_encryption)

let ml_transform_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transform_encryption =
       option_of_yojson
         (value_for_key transform_encryption_of_yojson "TransformEncryption")
         _list path;
     max_retries =
       option_of_yojson (value_for_key nullable_integer_of_yojson "MaxRetries") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     max_capacity =
       option_of_yojson (value_for_key nullable_double_of_yojson "MaxCapacity") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     role = option_of_yojson (value_for_key role_string_of_yojson "Role") _list path;
     schema = option_of_yojson (value_for_key transform_schema_of_yojson "Schema") _list path;
     label_count = option_of_yojson (value_for_key label_count_of_yojson "LabelCount") _list path;
     evaluation_metrics =
       option_of_yojson (value_for_key evaluation_metrics_of_yojson "EvaluationMetrics") _list path;
     parameters =
       option_of_yojson (value_for_key transform_parameters_of_yojson "Parameters") _list path;
     input_record_tables =
       option_of_yojson (value_for_key glue_tables_of_yojson "InputRecordTables") _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedOn") _list path;
     created_on = option_of_yojson (value_for_key timestamp_of_yojson "CreatedOn") _list path;
     status = option_of_yojson (value_for_key transform_status_type_of_yojson "Status") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
     transform_id = option_of_yojson (value_for_key hash_string_of_yojson "TransformId") _list path;
   }
    : ml_transform)

let transform_list_of_yojson tree path = list_of_yojson ml_transform_of_yojson tree path
let transform_id_list_of_yojson tree path = list_of_yojson hash_string_of_yojson tree path

let transform_filter_criteria_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema = option_of_yojson (value_for_key transform_schema_of_yojson "Schema") _list path;
     last_modified_after =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedAfter") _list path;
     last_modified_before =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedBefore") _list path;
     created_after = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAfter") _list path;
     created_before =
       option_of_yojson (value_for_key timestamp_of_yojson "CreatedBefore") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     status = option_of_yojson (value_for_key transform_status_type_of_yojson "Status") _list path;
     transform_type =
       option_of_yojson (value_for_key transform_type_of_yojson "TransformType") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : transform_filter_criteria)

let total_segments_integer_of_yojson = int_of_yojson
let token_of_yojson = string_of_yojson

let inclusion_annotation_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXCLUDE" -> EXCLUDE
    | `String "INCLUDE" -> INCLUDE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InclusionAnnotationValue" value)
    | _ -> raise (deserialize_wrong_type_error path "InclusionAnnotationValue")
     : inclusion_annotation_value)
    : inclusion_annotation_value)

let timestamped_inclusion_annotation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_on =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedOn") _list path;
     value =
       option_of_yojson (value_for_key inclusion_annotation_value_of_yojson "Value") _list path;
   }
    : timestamped_inclusion_annotation)

let timestamp_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recorded_after =
       option_of_yojson (value_for_key timestamp_of_yojson "RecordedAfter") _list path;
     recorded_before =
       option_of_yojson (value_for_key timestamp_of_yojson "RecordedBefore") _list path;
   }
    : timestamp_filter)

let test_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let test_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_configuration =
       option_of_yojson
         (value_for_key authentication_configuration_input_of_yojson "AuthenticationConfiguration")
         _list path;
     connection_properties =
       value_for_key connection_properties_of_yojson "ConnectionProperties" _list path;
     connection_type = value_for_key connection_type_of_yojson "ConnectionType" _list path;
   }
    : test_connection_input)

let test_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_connection_input =
       option_of_yojson
         (value_for_key test_connection_input_of_yojson "TestConnectionInput")
         _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
     connection_name =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionName") _list path;
   }
    : test_connection_request)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : conflict_exception)

let task_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIND_MATCHES" -> FIND_MATCHES
    | `String "EXPORT_LABELS" -> EXPORT_LABELS
    | `String "IMPORT_LABELS" -> IMPORT_LABELS
    | `String "LABELING_SET_GENERATION" -> LABELING_SET_GENERATION
    | `String "EVALUATION" -> EVALUATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskType" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskType")
     : task_type)
    : task_type)

let task_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TIMEOUT" -> TIMEOUT
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "RUNNING" -> RUNNING
    | `String "STARTING" -> STARTING
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskStatusType")
     : task_status_type)
    : task_status_type)

let task_run_sort_column_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STARTED" -> STARTED
    | `String "STATUS" -> STATUS
    | `String "TASK_RUN_TYPE" -> TASK_RUN_TYPE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TaskRunSortColumnType" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskRunSortColumnType")
     : task_run_sort_column_type)
    : task_run_sort_column_type)

let task_run_sort_criteria_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_direction = value_for_key sort_direction_type_of_yojson "SortDirection" _list path;
     column = value_for_key task_run_sort_column_type_of_yojson "Column" _list path;
   }
    : task_run_sort_criteria)

let replace_boolean_of_yojson = bool_of_yojson

let import_labels_task_run_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replace = option_of_yojson (value_for_key replace_boolean_of_yojson "Replace") _list path;
     input_s3_path = option_of_yojson (value_for_key uri_string_of_yojson "InputS3Path") _list path;
   }
    : import_labels_task_run_properties)

let export_labels_task_run_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_s3_path =
       option_of_yojson (value_for_key uri_string_of_yojson "OutputS3Path") _list path;
   }
    : export_labels_task_run_properties)

let labeling_set_generation_task_run_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_s3_path =
       option_of_yojson (value_for_key uri_string_of_yojson "OutputS3Path") _list path;
   }
    : labeling_set_generation_task_run_properties)

let find_matches_task_run_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_run_id = option_of_yojson (value_for_key hash_string_of_yojson "JobRunId") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
     job_id = option_of_yojson (value_for_key hash_string_of_yojson "JobId") _list path;
   }
    : find_matches_task_run_properties)

let task_run_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     find_matches_task_run_properties =
       option_of_yojson
         (value_for_key find_matches_task_run_properties_of_yojson "FindMatchesTaskRunProperties")
         _list path;
     labeling_set_generation_task_run_properties =
       option_of_yojson
         (value_for_key labeling_set_generation_task_run_properties_of_yojson
            "LabelingSetGenerationTaskRunProperties")
         _list path;
     export_labels_task_run_properties =
       option_of_yojson
         (value_for_key export_labels_task_run_properties_of_yojson "ExportLabelsTaskRunProperties")
         _list path;
     import_labels_task_run_properties =
       option_of_yojson
         (value_for_key import_labels_task_run_properties_of_yojson "ImportLabelsTaskRunProperties")
         _list path;
     task_type = option_of_yojson (value_for_key task_type_of_yojson "TaskType") _list path;
   }
    : task_run_properties)

let task_run_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_time =
       option_of_yojson (value_for_key execution_time_of_yojson "ExecutionTime") _list path;
     completed_on = option_of_yojson (value_for_key timestamp_of_yojson "CompletedOn") _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedOn") _list path;
     started_on = option_of_yojson (value_for_key timestamp_of_yojson "StartedOn") _list path;
     error_string =
       option_of_yojson (value_for_key generic_string_of_yojson "ErrorString") _list path;
     properties =
       option_of_yojson (value_for_key task_run_properties_of_yojson "Properties") _list path;
     log_group_name =
       option_of_yojson (value_for_key generic_string_of_yojson "LogGroupName") _list path;
     status = option_of_yojson (value_for_key task_status_type_of_yojson "Status") _list path;
     task_run_id = option_of_yojson (value_for_key hash_string_of_yojson "TaskRunId") _list path;
     transform_id = option_of_yojson (value_for_key hash_string_of_yojson "TransformId") _list path;
   }
    : task_run)

let task_run_list_of_yojson tree path = list_of_yojson task_run_of_yojson tree path

let task_run_filter_criteria_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     started_after = option_of_yojson (value_for_key timestamp_of_yojson "StartedAfter") _list path;
     started_before =
       option_of_yojson (value_for_key timestamp_of_yojson "StartedBefore") _list path;
     status = option_of_yojson (value_for_key task_status_type_of_yojson "Status") _list path;
     task_run_type = option_of_yojson (value_for_key task_type_of_yojson "TaskRunType") _list path;
   }
    : task_run_filter_criteria)

let target_resource_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key integration_error_message_of_yojson "Message") _list path;
   }
    : target_resource_not_found)

let tag_value_of_yojson = string_of_yojson
let tags_map_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags_to_add = value_for_key tags_map_of_yojson "TagsToAdd" _list path;
     resource_arn = value_for_key glue_resource_arn_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "value") _list path;
     key = option_of_yojson (value_for_key tag_key_of_yojson "key") _list path;
   }
    : tag)

let table_version_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_detail = option_of_yojson (value_for_key error_detail_of_yojson "ErrorDetail") _list path;
     version_id = option_of_yojson (value_for_key version_string_of_yojson "VersionId") _list path;
     table_name = option_of_yojson (value_for_key name_string_of_yojson "TableName") _list path;
   }
    : table_version_error)

let table_version_errors_of_yojson tree path =
  list_of_yojson table_version_error_of_yojson tree path

let federated_table_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_type =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionType") _list path;
     connection_name =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionName") _list path;
     database_identifier =
       option_of_yojson
         (value_for_key federation_identifier_of_yojson "DatabaseIdentifier")
         _list path;
     identifier =
       option_of_yojson (value_for_key federation_identifier_of_yojson "Identifier") _list path;
   }
    : federated_table)

let table_id_string_of_yojson = string_of_yojson
let iceberg_schema_list_of_yojson tree path = list_of_yojson iceberg_schema_of_yojson tree path

let iceberg_partition_spec_list_of_yojson tree path =
  list_of_yojson iceberg_partition_spec_of_yojson tree path

let iceberg_sort_order_list_of_yojson tree path =
  list_of_yojson iceberg_sort_order_of_yojson tree path

let iceberg_table_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_sort_order_id =
       option_of_yojson (value_for_key integer_of_yojson "DefaultSortOrderId") _list path;
     sort_orders =
       option_of_yojson (value_for_key iceberg_sort_order_list_of_yojson "SortOrders") _list path;
     last_partition_id =
       option_of_yojson (value_for_key integer_of_yojson "LastPartitionId") _list path;
     default_spec_id = option_of_yojson (value_for_key integer_of_yojson "DefaultSpecId") _list path;
     partition_specs =
       option_of_yojson
         (value_for_key iceberg_partition_spec_list_of_yojson "PartitionSpecs")
         _list path;
     last_column_id = option_of_yojson (value_for_key integer_of_yojson "LastColumnId") _list path;
     current_schema_id =
       option_of_yojson (value_for_key integer_of_yojson "CurrentSchemaId") _list path;
     schemas = option_of_yojson (value_for_key iceberg_schema_list_of_yojson "Schemas") _list path;
     properties =
       option_of_yojson (value_for_key string_to_string_map_of_yojson "Properties") _list path;
     location = option_of_yojson (value_for_key location_string_of_yojson "Location") _list path;
     table_uuid = option_of_yojson (value_for_key table_id_string_of_yojson "TableUuid") _list path;
     format_version =
       option_of_yojson (value_for_key version_string_of_yojson "FormatVersion") _list path;
   }
    : iceberg_table_metadata)

let resource_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE" -> CREATE
    | `String "UPDATE" -> UPDATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceAction")
     : resource_action)
    : resource_action)

let rec status_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     view_validations =
       option_of_yojson (value_for_key view_validation_list_of_yojson "ViewValidations") _list path;
     requested_change =
       option_of_yojson (value_for_key table_of_yojson "RequestedChange") _list path;
   }
    : status_details)

and table_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key table_status_of_yojson "Status") _list path;
     iceberg_table_metadata =
       option_of_yojson
         (value_for_key iceberg_table_metadata_of_yojson "IcebergTableMetadata")
         _list path;
     is_materialized_view =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IsMaterializedView") _list path;
     is_multi_dialect_view =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IsMultiDialectView") _list path;
     view_definition =
       option_of_yojson (value_for_key view_definition_of_yojson "ViewDefinition") _list path;
     federated_table =
       option_of_yojson (value_for_key federated_table_of_yojson "FederatedTable") _list path;
     version_id = option_of_yojson (value_for_key version_string_of_yojson "VersionId") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
     target_table =
       option_of_yojson (value_for_key table_identifier_of_yojson "TargetTable") _list path;
     is_registered_with_lake_formation =
       option_of_yojson
         (value_for_key boolean__of_yojson "IsRegisteredWithLakeFormation")
         _list path;
     created_by = option_of_yojson (value_for_key name_string_of_yojson "CreatedBy") _list path;
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     table_type =
       option_of_yojson (value_for_key table_type_string_of_yojson "TableType") _list path;
     view_expanded_text =
       option_of_yojson (value_for_key view_text_string_of_yojson "ViewExpandedText") _list path;
     view_original_text =
       option_of_yojson (value_for_key view_text_string_of_yojson "ViewOriginalText") _list path;
     partition_keys =
       option_of_yojson (value_for_key column_list_of_yojson "PartitionKeys") _list path;
     storage_descriptor =
       option_of_yojson (value_for_key storage_descriptor_of_yojson "StorageDescriptor") _list path;
     retention =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "Retention") _list path;
     last_analyzed_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAnalyzedTime") _list path;
     last_access_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAccessTime") _list path;
     update_time = option_of_yojson (value_for_key timestamp_of_yojson "UpdateTime") _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "CreateTime") _list path;
     owner = option_of_yojson (value_for_key name_string_of_yojson "Owner") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     database_name =
       option_of_yojson (value_for_key name_string_of_yojson "DatabaseName") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : table)

and table_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     details = option_of_yojson (value_for_key status_details_of_yojson "Details") _list path;
     error = option_of_yojson (value_for_key error_detail_of_yojson "Error") _list path;
     state = option_of_yojson (value_for_key resource_state_of_yojson "State") _list path;
     action = option_of_yojson (value_for_key resource_action_of_yojson "Action") _list path;
     update_time = option_of_yojson (value_for_key timestamp_of_yojson "UpdateTime") _list path;
     request_time = option_of_yojson (value_for_key timestamp_of_yojson "RequestTime") _list path;
     updated_by = option_of_yojson (value_for_key name_string_of_yojson "UpdatedBy") _list path;
     requested_by = option_of_yojson (value_for_key name_string_of_yojson "RequestedBy") _list path;
   }
    : table_status)

let table_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version_id = option_of_yojson (value_for_key version_string_of_yojson "VersionId") _list path;
     table = option_of_yojson (value_for_key table_of_yojson "Table") _list path;
   }
    : table_version)

let table_optimizer_event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "in_progress" -> IN_PROGRESS
    | `String "failed" -> FAILED
    | `String "completed" -> COMPLETED
    | `String "starting" -> STARTING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TableOptimizerEventType" value)
    | _ -> raise (deserialize_wrong_type_error path "TableOptimizerEventType")
     : table_optimizer_event_type)
    : table_optimizer_event_type)

let table_optimizer_run_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let run_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_duration_in_hour =
       option_of_yojson (value_for_key message_string_of_yojson "JobDurationInHour") _list path;
     number_of_dpus =
       option_of_yojson (value_for_key message_string_of_yojson "NumberOfDpus") _list path;
     number_of_files_compacted =
       option_of_yojson (value_for_key message_string_of_yojson "NumberOfFilesCompacted") _list path;
     number_of_bytes_compacted =
       option_of_yojson (value_for_key message_string_of_yojson "NumberOfBytesCompacted") _list path;
   }
    : run_metrics)

let iceberg_compaction_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_duration_in_hour =
       option_of_yojson
         (value_for_key dpu_duration_in_hour_of_yojson "JobDurationInHour")
         _list path;
     number_of_dpus =
       option_of_yojson (value_for_key dpu_counts_of_yojson "NumberOfDpus") _list path;
     dpu_hours = option_of_yojson (value_for_key dpu_hours_of_yojson "DpuHours") _list path;
     number_of_files_compacted =
       option_of_yojson (value_for_key metric_counts_of_yojson "NumberOfFilesCompacted") _list path;
     number_of_bytes_compacted =
       option_of_yojson (value_for_key metric_counts_of_yojson "NumberOfBytesCompacted") _list path;
   }
    : iceberg_compaction_metrics)

let compaction_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iceberg_metrics =
       option_of_yojson
         (value_for_key iceberg_compaction_metrics_of_yojson "IcebergMetrics")
         _list path;
   }
    : compaction_metrics)

let iceberg_retention_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_duration_in_hour =
       option_of_yojson
         (value_for_key dpu_duration_in_hour_of_yojson "JobDurationInHour")
         _list path;
     number_of_dpus =
       option_of_yojson (value_for_key dpu_counts_of_yojson "NumberOfDpus") _list path;
     dpu_hours = option_of_yojson (value_for_key dpu_hours_of_yojson "DpuHours") _list path;
     number_of_manifest_lists_deleted =
       option_of_yojson
         (value_for_key metric_counts_of_yojson "NumberOfManifestListsDeleted")
         _list path;
     number_of_manifest_files_deleted =
       option_of_yojson
         (value_for_key metric_counts_of_yojson "NumberOfManifestFilesDeleted")
         _list path;
     number_of_data_files_deleted =
       option_of_yojson
         (value_for_key metric_counts_of_yojson "NumberOfDataFilesDeleted")
         _list path;
   }
    : iceberg_retention_metrics)

let retention_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iceberg_metrics =
       option_of_yojson
         (value_for_key iceberg_retention_metrics_of_yojson "IcebergMetrics")
         _list path;
   }
    : retention_metrics)

let iceberg_orphan_file_deletion_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_duration_in_hour =
       option_of_yojson
         (value_for_key dpu_duration_in_hour_of_yojson "JobDurationInHour")
         _list path;
     number_of_dpus =
       option_of_yojson (value_for_key dpu_counts_of_yojson "NumberOfDpus") _list path;
     dpu_hours = option_of_yojson (value_for_key dpu_hours_of_yojson "DpuHours") _list path;
     number_of_orphan_files_deleted =
       option_of_yojson
         (value_for_key metric_counts_of_yojson "NumberOfOrphanFilesDeleted")
         _list path;
   }
    : iceberg_orphan_file_deletion_metrics)

let orphan_file_deletion_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iceberg_metrics =
       option_of_yojson
         (value_for_key iceberg_orphan_file_deletion_metrics_of_yojson "IcebergMetrics")
         _list path;
   }
    : orphan_file_deletion_metrics)

let table_optimizer_run_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     orphan_file_deletion_metrics =
       option_of_yojson
         (value_for_key orphan_file_deletion_metrics_of_yojson "orphanFileDeletionMetrics")
         _list path;
     retention_metrics =
       option_of_yojson (value_for_key retention_metrics_of_yojson "retentionMetrics") _list path;
     compaction_strategy =
       option_of_yojson
         (value_for_key compaction_strategy_of_yojson "compactionStrategy")
         _list path;
     compaction_metrics =
       option_of_yojson (value_for_key compaction_metrics_of_yojson "compactionMetrics") _list path;
     error = option_of_yojson (value_for_key message_string_of_yojson "error") _list path;
     metrics = option_of_yojson (value_for_key run_metrics_of_yojson "metrics") _list path;
     end_timestamp =
       option_of_yojson
         (value_for_key table_optimizer_run_timestamp_of_yojson "endTimestamp")
         _list path;
     start_timestamp =
       option_of_yojson
         (value_for_key table_optimizer_run_timestamp_of_yojson "startTimestamp")
         _list path;
     event_type =
       option_of_yojson (value_for_key table_optimizer_event_type_of_yojson "eventType") _list path;
   }
    : table_optimizer_run)

let table_optimizer_runs_of_yojson tree path =
  list_of_yojson table_optimizer_run_of_yojson tree path

let configuration_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "table" -> TABLE
    | `String "catalog" -> CATALOG
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConfigurationSource" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigurationSource")
     : configuration_source)
    : configuration_source)

let table_optimizer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_source =
       option_of_yojson
         (value_for_key configuration_source_of_yojson "configurationSource")
         _list path;
     last_run = option_of_yojson (value_for_key table_optimizer_run_of_yojson "lastRun") _list path;
     configuration =
       option_of_yojson
         (value_for_key table_optimizer_configuration_of_yojson "configuration")
         _list path;
     type_ = option_of_yojson (value_for_key table_optimizer_type_of_yojson "type") _list path;
   }
    : table_optimizer)

let table_name_of_yojson = string_of_yojson
let table_list_of_yojson tree path = list_of_yojson table_of_yojson tree path

let table_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_detail = option_of_yojson (value_for_key error_detail_of_yojson "ErrorDetail") _list path;
     table_name = option_of_yojson (value_for_key name_string_of_yojson "TableName") _list path;
   }
    : table_error)

let table_errors_of_yojson tree path = list_of_yojson table_error_of_yojson tree path

let table_attributes_of_yojson (tree : t) path =
  ((match tree with
    | `String "LATEST_ICEBERG_METADATA" -> LATEST_ICEBERG_METADATA
    | `String "DEFAULT" -> DEFAULT
    | `String "TABLE_TYPE" -> TABLE_TYPE
    | `String "NAME" -> NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "TableAttributes" value)
    | _ -> raise (deserialize_wrong_type_error path "TableAttributes")
     : table_attributes)
    : table_attributes)

let table_attributes_list_of_yojson tree path = list_of_yojson table_attributes_of_yojson tree path

let supported_dialect_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dialect_version =
       option_of_yojson
         (value_for_key view_dialect_version_string_of_yojson "DialectVersion")
         _list path;
     dialect = option_of_yojson (value_for_key view_dialect_of_yojson "Dialect") _list path;
   }
    : supported_dialect)

let string1024_of_yojson = string_of_yojson

let stop_workflow_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_workflow_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : stop_workflow_run_request)

let illegal_workflow_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : illegal_workflow_state_exception)

let stop_trigger_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : stop_trigger_response)

let stop_trigger_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : stop_trigger_request)

let stop_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = option_of_yojson (value_for_key name_string_of_yojson "Id") _list path }
    : stop_session_response)

let stop_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_origin =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "RequestOrigin")
         _list path;
     id = value_for_key name_string_of_yojson "Id" _list path;
   }
    : stop_session_request)

let illegal_session_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : illegal_session_state_exception)

let stop_materialized_view_refresh_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_materialized_view_refresh_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id = value_for_key name_string_of_yojson "CatalogId" _list path;
   }
    : stop_materialized_view_refresh_task_run_request)

let materialized_view_refresh_task_stopping_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : materialized_view_refresh_task_stopping_exception)

let materialized_view_refresh_task_not_running_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : materialized_view_refresh_task_not_running_exception)

let stop_crawler_schedule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_crawler_schedule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ crawler_name = value_for_key name_string_of_yojson "CrawlerName" _list path }
    : stop_crawler_schedule_request)

let scheduler_not_running_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : scheduler_not_running_exception)

let stop_crawler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_crawler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : stop_crawler_request)

let crawler_stopping_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : crawler_stopping_exception)

let crawler_not_running_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : crawler_not_running_exception)

let stop_column_statistics_task_run_schedule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_column_statistics_task_run_schedule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
   }
    : stop_column_statistics_task_run_schedule_request)

let stop_column_statistics_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_column_statistics_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key database_name_of_yojson "DatabaseName" _list path;
   }
    : stop_column_statistics_task_run_request)

let column_statistics_task_stopping_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : column_statistics_task_stopping_exception)

let column_statistics_task_not_running_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : column_statistics_task_not_running_exception)

let run_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_run_id = option_of_yojson (value_for_key hash_string_of_yojson "JobRunId") _list path;
     run_id = option_of_yojson (value_for_key hash_string_of_yojson "RunId") _list path;
   }
    : run_identifier)

let statistic_name_string_of_yojson = string_of_yojson

let statistic_evaluation_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "Multicolumn" -> MULTICOLUMN
    | `String "Column" -> COLUMN
    | `String "Dataset" -> DATASET
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StatisticEvaluationLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "StatisticEvaluationLevel")
     : statistic_evaluation_level)
    : statistic_evaluation_level)

let reference_datasets_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let statistic_properties_map_of_yojson tree path =
  map_of_yojson name_string_of_yojson description_string_of_yojson tree path

let statistic_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inclusion_annotation =
       option_of_yojson
         (value_for_key timestamped_inclusion_annotation_of_yojson "InclusionAnnotation")
         _list path;
     recorded_on = option_of_yojson (value_for_key timestamp_of_yojson "RecordedOn") _list path;
     statistic_properties =
       option_of_yojson
         (value_for_key statistic_properties_map_of_yojson "StatisticProperties")
         _list path;
     referenced_datasets =
       option_of_yojson
         (value_for_key reference_datasets_list_of_yojson "ReferencedDatasets")
         _list path;
     columns_referenced =
       option_of_yojson (value_for_key column_name_list_of_yojson "ColumnsReferenced") _list path;
     evaluation_level =
       option_of_yojson
         (value_for_key statistic_evaluation_level_of_yojson "EvaluationLevel")
         _list path;
     double_value = option_of_yojson (value_for_key double_of_yojson "DoubleValue") _list path;
     statistic_name =
       option_of_yojson (value_for_key statistic_name_string_of_yojson "StatisticName") _list path;
     run_identifier =
       option_of_yojson (value_for_key run_identifier_of_yojson "RunIdentifier") _list path;
     profile_id = option_of_yojson (value_for_key hash_string_of_yojson "ProfileId") _list path;
     statistic_id = option_of_yojson (value_for_key hash_string_of_yojson "StatisticId") _list path;
   }
    : statistic_summary)

let statistic_summary_list_of_yojson tree path =
  list_of_yojson statistic_summary_of_yojson tree path

let statistic_model_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inclusion_annotation =
       option_of_yojson
         (value_for_key inclusion_annotation_value_of_yojson "InclusionAnnotation")
         _list path;
     date = option_of_yojson (value_for_key timestamp_of_yojson "Date") _list path;
     actual_value =
       option_of_yojson (value_for_key nullable_double_of_yojson "ActualValue") _list path;
     predicted_value =
       option_of_yojson (value_for_key nullable_double_of_yojson "PredictedValue") _list path;
     upper_bound =
       option_of_yojson (value_for_key nullable_double_of_yojson "UpperBound") _list path;
     lower_bound =
       option_of_yojson (value_for_key nullable_double_of_yojson "LowerBound") _list path;
   }
    : statistic_model_result)

let statistic_model_results_of_yojson tree path =
  list_of_yojson statistic_model_result_of_yojson tree path

let statistic_annotation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inclusion_annotation =
       option_of_yojson
         (value_for_key timestamped_inclusion_annotation_of_yojson "InclusionAnnotation")
         _list path;
     statistic_recorded_on =
       option_of_yojson (value_for_key timestamp_of_yojson "StatisticRecordedOn") _list path;
     statistic_id = option_of_yojson (value_for_key hash_string_of_yojson "StatisticId") _list path;
     profile_id = option_of_yojson (value_for_key hash_string_of_yojson "ProfileId") _list path;
   }
    : statistic_annotation)

let statement_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "CANCELLED" -> CANCELLED
    | `String "CANCELLING" -> CANCELLING
    | `String "AVAILABLE" -> AVAILABLE
    | `String "RUNNING" -> RUNNING
    | `String "WAITING" -> WAITING
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatementState" value)
    | _ -> raise (deserialize_wrong_type_error path "StatementState")
     : statement_state)
    : statement_state)

let statement_output_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ text_plain = option_of_yojson (value_for_key generic_string_of_yojson "TextPlain") _list path }
    : statement_output_data)

let orchestration_string_list_of_yojson tree path =
  list_of_yojson generic_string_of_yojson tree path

let statement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     traceback =
       option_of_yojson (value_for_key orchestration_string_list_of_yojson "Traceback") _list path;
     error_value = option_of_yojson (value_for_key generic_string_of_yojson "ErrorValue") _list path;
     error_name = option_of_yojson (value_for_key generic_string_of_yojson "ErrorName") _list path;
     status = option_of_yojson (value_for_key statement_state_of_yojson "Status") _list path;
     execution_count =
       option_of_yojson (value_for_key integer_value_of_yojson "ExecutionCount") _list path;
     data = option_of_yojson (value_for_key statement_output_data_of_yojson "Data") _list path;
   }
    : statement_output)

let double_value_of_yojson = double_of_yojson
let long_value_of_yojson = long_of_yojson

let statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     completed_on = option_of_yojson (value_for_key long_value_of_yojson "CompletedOn") _list path;
     started_on = option_of_yojson (value_for_key long_value_of_yojson "StartedOn") _list path;
     progress = option_of_yojson (value_for_key double_value_of_yojson "Progress") _list path;
     output = option_of_yojson (value_for_key statement_output_of_yojson "Output") _list path;
     state = option_of_yojson (value_for_key statement_state_of_yojson "State") _list path;
     code = option_of_yojson (value_for_key generic_string_of_yojson "Code") _list path;
     id = option_of_yojson (value_for_key integer_value_of_yojson "Id") _list path;
   }
    : statement)

let statement_list_of_yojson tree path = list_of_yojson statement_of_yojson tree path

let start_workflow_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path }
    : start_workflow_run_response)

let start_workflow_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_properties =
       option_of_yojson (value_for_key workflow_run_properties_of_yojson "RunProperties") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : start_workflow_run_request)

let concurrent_runs_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : concurrent_runs_exceeded_exception)

let start_trigger_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : start_trigger_response)

let start_trigger_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : start_trigger_request)

let start_materialized_view_refresh_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     materialized_view_refresh_task_run_id =
       option_of_yojson
         (value_for_key uui_dv4_of_yojson "MaterializedViewRefreshTaskRunId")
         _list path;
   }
    : start_materialized_view_refresh_task_run_response)

let start_materialized_view_refresh_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     full_refresh =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "FullRefresh") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id = value_for_key name_string_of_yojson "CatalogId" _list path;
   }
    : start_materialized_view_refresh_task_run_request)

let materialized_view_refresh_task_running_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : materialized_view_refresh_task_running_exception)

let start_ml_labeling_set_generation_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_run_id = option_of_yojson (value_for_key hash_string_of_yojson "TaskRunId") _list path }
    : start_ml_labeling_set_generation_task_run_response)

let start_ml_labeling_set_generation_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_s3_path = value_for_key uri_string_of_yojson "OutputS3Path" _list path;
     transform_id = value_for_key hash_string_of_yojson "TransformId" _list path;
   }
    : start_ml_labeling_set_generation_task_run_request)

let start_ml_evaluation_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_run_id = option_of_yojson (value_for_key hash_string_of_yojson "TaskRunId") _list path }
    : start_ml_evaluation_task_run_response)

let start_ml_evaluation_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ transform_id = value_for_key hash_string_of_yojson "TransformId" _list path }
    : start_ml_evaluation_task_run_request)

let ml_transform_not_ready_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : ml_transform_not_ready_exception)

let start_job_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_run_id = option_of_yojson (value_for_key id_string_of_yojson "JobRunId") _list path }
    : start_job_run_response)

let start_job_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_role_session_policy =
       option_of_yojson
         (value_for_key orchestration_policy_json_string_of_yojson "ExecutionRoleSessionPolicy")
         _list path;
     execution_class =
       option_of_yojson (value_for_key execution_class_of_yojson "ExecutionClass") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     notification_property =
       option_of_yojson
         (value_for_key notification_property_of_yojson "NotificationProperty")
         _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     max_capacity =
       option_of_yojson (value_for_key nullable_double_of_yojson "MaxCapacity") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     allocated_capacity =
       option_of_yojson (value_for_key integer_value_of_yojson "AllocatedCapacity") _list path;
     arguments = option_of_yojson (value_for_key generic_map_of_yojson "Arguments") _list path;
     job_run_id = option_of_yojson (value_for_key id_string_of_yojson "JobRunId") _list path;
     job_run_queuing_enabled =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "JobRunQueuingEnabled") _list path;
     job_name = value_for_key name_string_of_yojson "JobName" _list path;
   }
    : start_job_run_request)

let start_import_labels_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_run_id = option_of_yojson (value_for_key hash_string_of_yojson "TaskRunId") _list path }
    : start_import_labels_task_run_response)

let start_import_labels_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replace_all_labels =
       option_of_yojson (value_for_key replace_boolean_of_yojson "ReplaceAllLabels") _list path;
     input_s3_path = value_for_key uri_string_of_yojson "InputS3Path" _list path;
     transform_id = value_for_key hash_string_of_yojson "TransformId" _list path;
   }
    : start_import_labels_task_run_request)

let start_export_labels_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_run_id = option_of_yojson (value_for_key hash_string_of_yojson "TaskRunId") _list path }
    : start_export_labels_task_run_response)

let start_export_labels_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_s3_path = value_for_key uri_string_of_yojson "OutputS3Path" _list path;
     transform_id = value_for_key hash_string_of_yojson "TransformId" _list path;
   }
    : start_export_labels_task_run_request)

let start_data_quality_ruleset_evaluation_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run_id = option_of_yojson (value_for_key hash_string_of_yojson "RunId") _list path }
    : start_data_quality_ruleset_evaluation_run_response)

let pre_processing_query_string_of_yojson = string_of_yojson

let data_quality_glue_table_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pre_processing_query =
       option_of_yojson
         (value_for_key pre_processing_query_string_of_yojson "PreProcessingQuery")
         _list path;
     additional_options =
       option_of_yojson
         (value_for_key glue_table_additional_options_of_yojson "AdditionalOptions")
         _list path;
     connection_name =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionName") _list path;
     catalog_id = option_of_yojson (value_for_key name_string_of_yojson "CatalogId") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
   }
    : data_quality_glue_table)

let data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_quality_glue_table =
       option_of_yojson
         (value_for_key data_quality_glue_table_of_yojson "DataQualityGlueTable")
         _list path;
     glue_table = option_of_yojson (value_for_key glue_table_of_yojson "GlueTable") _list path;
   }
    : data_source)

let dq_composite_rule_evaluation_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "ROW" -> ROW
    | `String "COLUMN" -> COLUMN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DQCompositeRuleEvaluationMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "DQCompositeRuleEvaluationMethod")
     : dq_composite_rule_evaluation_method)
    : dq_composite_rule_evaluation_method)

let data_quality_evaluation_run_additional_run_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_log_group_prefix =
       option_of_yojson (value_for_key generic_string_of_yojson "CustomLogGroupPrefix") _list path;
     composite_rule_evaluation_method =
       option_of_yojson
         (value_for_key dq_composite_rule_evaluation_method_of_yojson
            "CompositeRuleEvaluationMethod")
         _list path;
     results_s3_prefix =
       option_of_yojson (value_for_key uri_string_of_yojson "ResultsS3Prefix") _list path;
     cloud_watch_metrics_enabled =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "CloudWatchMetricsEnabled")
         _list path;
   }
    : data_quality_evaluation_run_additional_run_options)

let ruleset_names_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let data_source_map_of_yojson tree path =
  map_of_yojson name_string_of_yojson data_source_of_yojson tree path

let start_data_quality_ruleset_evaluation_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_data_sources =
       option_of_yojson (value_for_key data_source_map_of_yojson "AdditionalDataSources") _list path;
     ruleset_names = value_for_key ruleset_names_of_yojson "RulesetNames" _list path;
     additional_run_options =
       option_of_yojson
         (value_for_key data_quality_evaluation_run_additional_run_options_of_yojson
            "AdditionalRunOptions")
         _list path;
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     role = value_for_key role_string_of_yojson "Role" _list path;
     data_source = value_for_key data_source_of_yojson "DataSource" _list path;
   }
    : start_data_quality_ruleset_evaluation_run_request)

let start_data_quality_rule_recommendation_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run_id = option_of_yojson (value_for_key hash_string_of_yojson "RunId") _list path }
    : start_data_quality_rule_recommendation_run_response)

let start_data_quality_rule_recommendation_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     data_quality_security_configuration =
       option_of_yojson
         (value_for_key name_string_of_yojson "DataQualitySecurityConfiguration")
         _list path;
     created_ruleset_name =
       option_of_yojson (value_for_key name_string_of_yojson "CreatedRulesetName") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     role = value_for_key role_string_of_yojson "Role" _list path;
     data_source = value_for_key data_source_of_yojson "DataSource" _list path;
   }
    : start_data_quality_rule_recommendation_run_request)

let start_crawler_schedule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_crawler_schedule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ crawler_name = value_for_key name_string_of_yojson "CrawlerName" _list path }
    : start_crawler_schedule_request)

let scheduler_running_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : scheduler_running_exception)

let no_schedule_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : no_schedule_exception)

let start_crawler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_crawler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : start_crawler_request)

let start_column_statistics_task_run_schedule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_column_statistics_task_run_schedule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
   }
    : start_column_statistics_task_run_schedule_request)

let start_column_statistics_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_statistics_task_run_id =
       option_of_yojson (value_for_key hash_string_of_yojson "ColumnStatisticsTaskRunId") _list path;
   }
    : start_column_statistics_task_run_response)

let start_column_statistics_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     catalog_i_d = option_of_yojson (value_for_key name_string_of_yojson "CatalogID") _list path;
     sample_size =
       option_of_yojson (value_for_key sample_size_percentage_of_yojson "SampleSize") _list path;
     role = value_for_key name_string_of_yojson "Role" _list path;
     column_name_list =
       option_of_yojson (value_for_key column_name_list_of_yojson "ColumnNameList") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
   }
    : start_column_statistics_task_run_request)

let column_statistics_task_running_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : column_statistics_task_running_exception)

let start_blueprint_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path }
    : start_blueprint_run_response)

let blueprint_parameters_of_yojson = string_of_yojson
let orchestration_iam_role_arn_of_yojson = string_of_yojson

let start_blueprint_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn = value_for_key orchestration_iam_role_arn_of_yojson "RoleArn" _list path;
     parameters =
       option_of_yojson (value_for_key blueprint_parameters_of_yojson "Parameters") _list path;
     blueprint_name = value_for_key orchestration_name_string_of_yojson "BlueprintName" _list path;
   }
    : start_blueprint_run_request)

let spark_connect_endpoint_url_of_yojson = string_of_yojson

let http_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "POST" -> POST
    | `String "GET" -> GET
    | `String value -> raise (deserialize_unknown_enum_value_error path "HTTPMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "HTTPMethod")
     : http_method)
    : http_method)

let path_string_of_yojson = string_of_yojson
let property_name_of_yojson = string_of_yojson
let connector_property_key_of_yojson = string_of_yojson
let bool__of_yojson = bool_of_yojson

let list_of_string_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let property_location_of_yojson (tree : t) path =
  ((match tree with
    | `String "PATH" -> PATH
    | `String "QUERY_PARAM" -> QUERY_PARAM
    | `String "BODY" -> BODY
    | `String "HEADER" -> HEADER
    | `String value -> raise (deserialize_unknown_enum_value_error path "PropertyLocation" value)
    | _ -> raise (deserialize_wrong_type_error path "PropertyLocation")
     : property_location)
    : property_location)

let property_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SECRET_OR_USER_INPUT" -> SECRET_OR_USER_INPUT
    | `String "UNUSED" -> UNUSED
    | `String "READ_ONLY" -> READ_ONLY
    | `String "SECRET" -> SECRET
    | `String "USER_INPUT" -> USER_INPUT
    | `String value -> raise (deserialize_unknown_enum_value_error path "PropertyType" value)
    | _ -> raise (deserialize_wrong_type_error path "PropertyType")
     : property_type)
    : property_type)

let connector_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     property_type = value_for_key property_type_of_yojson "PropertyType" _list path;
     property_location =
       option_of_yojson (value_for_key property_location_of_yojson "PropertyLocation") _list path;
     allowed_values =
       option_of_yojson (value_for_key list_of_string_of_yojson "AllowedValues") _list path;
     default_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "DefaultValue")
         _list path;
     required = value_for_key bool__of_yojson "Required" _list path;
     key_override =
       option_of_yojson (value_for_key connector_property_key_of_yojson "KeyOverride") _list path;
     name = value_for_key property_name_of_yojson "Name" _list path;
   }
    : connector_property)

let connector_property_list_of_yojson tree path =
  list_of_yojson connector_property_of_yojson tree path

let json_path_string_of_yojson = string_of_yojson

let response_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_path = option_of_yojson (value_for_key json_path_string_of_yojson "ErrorPath") _list path;
     result_path = value_for_key json_path_string_of_yojson "ResultPath" _list path;
   }
    : response_configuration)

let default_value_of_yojson = string_of_yojson

let response_extraction_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     header_key =
       option_of_yojson (value_for_key connector_property_key_of_yojson "HeaderKey") _list path;
     content_path =
       option_of_yojson (value_for_key json_path_string_of_yojson "ContentPath") _list path;
   }
    : response_extraction_mapping)

let extracted_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson (value_for_key response_extraction_mapping_of_yojson "Value") _list path;
     property_location =
       option_of_yojson (value_for_key property_location_of_yojson "PropertyLocation") _list path;
     default_value =
       option_of_yojson (value_for_key default_value_of_yojson "DefaultValue") _list path;
     key = option_of_yojson (value_for_key connector_property_key_of_yojson "Key") _list path;
   }
    : extracted_parameter)

let cursor_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit_parameter =
       option_of_yojson (value_for_key extracted_parameter_of_yojson "LimitParameter") _list path;
     next_page = value_for_key extracted_parameter_of_yojson "NextPage" _list path;
   }
    : cursor_configuration)

let offset_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit_parameter = value_for_key extracted_parameter_of_yojson "LimitParameter" _list path;
     offset_parameter = value_for_key extracted_parameter_of_yojson "OffsetParameter" _list path;
   }
    : offset_configuration)

let pagination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offset_configuration =
       option_of_yojson
         (value_for_key offset_configuration_of_yojson "OffsetConfiguration")
         _list path;
     cursor_configuration =
       option_of_yojson
         (value_for_key cursor_configuration_of_yojson "CursorConfiguration")
         _list path;
   }
    : pagination_configuration)

let source_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pagination_configuration =
       option_of_yojson
         (value_for_key pagination_configuration_of_yojson "PaginationConfiguration")
         _list path;
     response_configuration =
       option_of_yojson
         (value_for_key response_configuration_of_yojson "ResponseConfiguration")
         _list path;
     request_parameters =
       option_of_yojson
         (value_for_key connector_property_list_of_yojson "RequestParameters")
         _list path;
     request_path = option_of_yojson (value_for_key path_string_of_yojson "RequestPath") _list path;
     request_method =
       option_of_yojson (value_for_key http_method_of_yojson "RequestMethod") _list path;
   }
    : source_configuration)

let sort_of_yojson (tree : t) path =
  ((match tree with
    | `String "DESC" -> DESCENDING
    | `String "ASC" -> ASCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "Sort" value)
    | _ -> raise (deserialize_wrong_type_error path "Sort")
     : sort)
    : sort)

let sort_criterion_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort = option_of_yojson (value_for_key sort_of_yojson "Sort") _list path;
     field_name = option_of_yojson (value_for_key value_string_of_yojson "FieldName") _list path;
   }
    : sort_criterion)

let sort_criteria_of_yojson tree path = list_of_yojson sort_criterion_of_yojson tree path

let setting_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "TABLE" -> TABLE
    | `String "CATALOG" -> CATALOG
    | `String value -> raise (deserialize_unknown_enum_value_error path "SettingSource" value)
    | _ -> raise (deserialize_wrong_type_error path "SettingSource")
     : setting_source)
    : setting_source)

let session_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SPARK_CONNECT" -> SPARK_CONNECT
    | `String "LIVY" -> LIVY
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionType" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionType")
     : session_type)
    : session_type)

let session_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "TIMEOUT" -> TIMEOUT
    | `String "FAILED" -> FAILED
    | `String "READY" -> READY
    | `String "PROVISIONING" -> PROVISIONING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionStatus")
     : session_status)
    : session_status)

let orchestration_role_arn_of_yojson = string_of_yojson

let session_command_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     python_version =
       option_of_yojson (value_for_key python_version_string_of_yojson "PythonVersion") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : session_command)

let orchestration_arguments_value_of_yojson = string_of_yojson

let orchestration_arguments_map_of_yojson tree path =
  map_of_yojson orchestration_name_string_of_yojson orchestration_arguments_value_of_yojson tree
    path

let idle_timeout_of_yojson = int_of_yojson

let session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_type = option_of_yojson (value_for_key session_type_of_yojson "SessionType") _list path;
     profile_name = option_of_yojson (value_for_key name_string_of_yojson "ProfileName") _list path;
     idle_timeout = option_of_yojson (value_for_key idle_timeout_of_yojson "IdleTimeout") _list path;
     dpu_seconds =
       option_of_yojson (value_for_key nullable_double_of_yojson "DPUSeconds") _list path;
     execution_time =
       option_of_yojson (value_for_key nullable_double_of_yojson "ExecutionTime") _list path;
     completed_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "CompletedOn") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     max_capacity =
       option_of_yojson (value_for_key nullable_double_of_yojson "MaxCapacity") _list path;
     progress = option_of_yojson (value_for_key double_value_of_yojson "Progress") _list path;
     connections =
       option_of_yojson (value_for_key connections_list_of_yojson "Connections") _list path;
     default_arguments =
       option_of_yojson
         (value_for_key orchestration_arguments_map_of_yojson "DefaultArguments")
         _list path;
     command = option_of_yojson (value_for_key session_command_of_yojson "Command") _list path;
     role = option_of_yojson (value_for_key orchestration_role_arn_of_yojson "Role") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     error_message =
       option_of_yojson (value_for_key description_string_of_yojson "ErrorMessage") _list path;
     status = option_of_yojson (value_for_key session_status_of_yojson "Status") _list path;
     created_on = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedOn") _list path;
     id = option_of_yojson (value_for_key name_string_of_yojson "Id") _list path;
   }
    : session)

let session_list_of_yojson tree path = list_of_yojson session_of_yojson tree path
let session_id_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path
let sensitive_string_of_yojson = string_of_yojson

let session_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auth_token_expiration_time =
       value_for_key timestamp_value_of_yojson "AuthTokenExpirationTime" _list path;
     auth_token = value_for_key sensitive_string_of_yojson "AuthToken" _list path;
     url = value_for_key spark_connect_endpoint_url_of_yojson "Url" _list path;
   }
    : session_endpoint)

let session_busy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key orchestration_message_string_of_yojson "Message") _list path;
   }
    : session_busy_exception)

let sensitive_url_of_yojson = string_of_yojson
let entity_field_name_of_yojson = string_of_yojson
let selected_fields_of_yojson tree path = list_of_yojson entity_field_name_of_yojson tree path

let segment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_segments = value_for_key total_segments_integer_of_yojson "TotalSegments" _list path;
     segment_number = value_for_key non_negative_integer_of_yojson "SegmentNumber" _list path;
   }
    : segment)

let s3_encryption_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "SSE-S3" -> SSES3
    | `String "SSE-KMS" -> SSEKMS
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "S3EncryptionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "S3EncryptionMode")
     : s3_encryption_mode)
    : s3_encryption_mode)

let s3_encryption_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
     s3_encryption_mode =
       option_of_yojson (value_for_key s3_encryption_mode_of_yojson "S3EncryptionMode") _list path;
   }
    : s3_encryption)

let s3_encryption_list_of_yojson tree path = list_of_yojson s3_encryption_of_yojson tree path

let cloud_watch_encryption_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "SSE-KMS" -> SSEKMS
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CloudWatchEncryptionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "CloudWatchEncryptionMode")
     : cloud_watch_encryption_mode)
    : cloud_watch_encryption_mode)

let cloud_watch_encryption_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
     cloud_watch_encryption_mode =
       option_of_yojson
         (value_for_key cloud_watch_encryption_mode_of_yojson "CloudWatchEncryptionMode")
         _list path;
   }
    : cloud_watch_encryption)

let job_bookmarks_encryption_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "CSE-KMS" -> CSEKMS
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "JobBookmarksEncryptionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "JobBookmarksEncryptionMode")
     : job_bookmarks_encryption_mode)
    : job_bookmarks_encryption_mode)

let job_bookmarks_encryption_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
     job_bookmarks_encryption_mode =
       option_of_yojson
         (value_for_key job_bookmarks_encryption_mode_of_yojson "JobBookmarksEncryptionMode")
         _list path;
   }
    : job_bookmarks_encryption)

let data_quality_encryption_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "SSE-KMS" -> SSEKMS
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataQualityEncryptionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "DataQualityEncryptionMode")
     : data_quality_encryption_mode)
    : data_quality_encryption_mode)

let data_quality_encryption_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
     data_quality_encryption_mode =
       option_of_yojson
         (value_for_key data_quality_encryption_mode_of_yojson "DataQualityEncryptionMode")
         _list path;
   }
    : data_quality_encryption)

let encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_quality_encryption =
       option_of_yojson
         (value_for_key data_quality_encryption_of_yojson "DataQualityEncryption")
         _list path;
     job_bookmarks_encryption =
       option_of_yojson
         (value_for_key job_bookmarks_encryption_of_yojson "JobBookmarksEncryption")
         _list path;
     cloud_watch_encryption =
       option_of_yojson
         (value_for_key cloud_watch_encryption_of_yojson "CloudWatchEncryption")
         _list path;
     s3_encryption =
       option_of_yojson (value_for_key s3_encryption_list_of_yojson "S3Encryption") _list path;
   }
    : encryption_configuration)

let security_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     created_time_stamp =
       option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedTimeStamp") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : security_configuration)

let security_configuration_list_of_yojson tree path =
  list_of_yojson security_configuration_of_yojson tree path

let search_text_of_yojson = string_of_yojson

let search_tables_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_list = option_of_yojson (value_for_key table_list_of_yojson "TableList") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : search_tables_response)

let comparator_of_yojson (tree : t) path =
  ((match tree with
    | `String "LESS_THAN_EQUALS" -> LESS_THAN_EQUALS
    | `String "GREATER_THAN_EQUALS" -> GREATER_THAN_EQUALS
    | `String "LESS_THAN" -> LESS_THAN
    | `String "GREATER_THAN" -> GREATER_THAN
    | `String "EQUALS" -> EQUALS
    | `String value -> raise (deserialize_unknown_enum_value_error path "Comparator" value)
    | _ -> raise (deserialize_wrong_type_error path "Comparator")
     : comparator)
    : comparator)

let property_predicate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comparator = option_of_yojson (value_for_key comparator_of_yojson "Comparator") _list path;
     value = option_of_yojson (value_for_key value_string_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key value_string_of_yojson "Key") _list path;
   }
    : property_predicate)

let search_property_predicates_of_yojson tree path =
  list_of_yojson property_predicate_of_yojson tree path

let page_size_of_yojson = int_of_yojson

let resource_share_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FEDERATED" -> FEDERATED
    | `String "ALL" -> ALL
    | `String "FOREIGN" -> FOREIGN
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceShareType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceShareType")
     : resource_share_type)
    : resource_share_type)

let search_tables_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_status_details =
       option_of_yojson (value_for_key boolean_nullable_of_yojson "IncludeStatusDetails") _list path;
     resource_share_type =
       option_of_yojson (value_for_key resource_share_type_of_yojson "ResourceShareType") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     sort_criteria =
       option_of_yojson (value_for_key sort_criteria_of_yojson "SortCriteria") _list path;
     search_text = option_of_yojson (value_for_key value_string_of_yojson "SearchText") _list path;
     filters =
       option_of_yojson (value_for_key search_property_predicates_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : search_tables_request)

let search_sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "DESCENDING" -> DESCENDING
    | `String "ASCENDING" -> ASCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SearchSortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SearchSortOrder")
     : search_sort_order)
    : search_sort_order)

let search_attribute_of_yojson = string_of_yojson

let search_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     order = option_of_yojson (value_for_key search_sort_order_of_yojson "Order") _list path;
     attribute = value_for_key search_attribute_of_yojson "Attribute" _list path;
   }
    : search_sort)

let search_result_name_of_yojson = string_of_yojson
let asset_type_id_of_yojson = string_of_yojson

let search_result_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     asset_type_id =
       option_of_yojson (value_for_key asset_type_id_of_yojson "AssetTypeId") _list path;
     updated_at = option_of_yojson (value_for_key updated_at_of_yojson "UpdatedAt") _list path;
     asset_description =
       option_of_yojson (value_for_key asset_description_of_yojson "AssetDescription") _list path;
     asset_name =
       option_of_yojson (value_for_key search_result_name_of_yojson "AssetName") _list path;
     id = option_of_yojson (value_for_key asset_id_of_yojson "Id") _list path;
   }
    : search_result_item)

let search_result_item_list_of_yojson tree path =
  list_of_yojson search_result_item_of_yojson tree path

let search_next_token_of_yojson = string_of_yojson
let search_max_results_of_yojson = int_of_yojson
let search_map_key_of_yojson = string_of_yojson
let search_filter_string_value_of_yojson = string_of_yojson

let search_map_filter_value_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "StringValue" -> StringValue (search_filter_string_value_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "SearchMapFilterValue" unknown)
    : search_map_filter_value)

let search_map_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key search_map_filter_value_of_yojson "Value" _list path;
     key = value_for_key search_map_key_of_yojson "Key" _list path;
     attribute = value_for_key search_attribute_of_yojson "Attribute" _list path;
   }
    : search_map_filter)

let search_filter_long_value_of_yojson = long_of_yojson

let search_filter_value_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "LongValue" -> LongValue (search_filter_long_value_of_yojson value_ path)
   | "StringValue" -> StringValue (search_filter_string_value_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "SearchFilterValue" unknown)
    : search_filter_value)

let search_filter_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "notExists" -> NotExists
    | `String "lessThanOrEquals" -> LessThanOrEquals
    | `String "lessThan" -> LessThan
    | `String "greaterThanOrEquals" -> GreaterThanOrEquals
    | `String "greaterThan" -> GreaterThan
    | `String "equals" -> Equals
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SearchFilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "SearchFilterOperator")
     : search_filter_operator)
    : search_filter_operator)

let search_attribute_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key search_filter_value_of_yojson "Value") _list path;
     operator = value_for_key search_filter_operator_of_yojson "Operator" _list path;
     attribute = value_for_key search_attribute_of_yojson "Attribute" _list path;
   }
    : search_attribute_filter)

let rec search_filter_clause_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "MapFilter" -> MapFilter (search_map_filter_of_yojson value_ path)
   | "AttributeFilter" -> AttributeFilter (search_attribute_filter_of_yojson value_ path)
   | "OrAnyFilters" -> OrAnyFilters (search_filter_clause_list_of_yojson value_ path)
   | "AndAllFilters" -> AndAllFilters (search_filter_clause_list_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "SearchFilterClause" unknown)
    : search_filter_clause)

and search_filter_clause_list_of_yojson tree path =
  list_of_yojson search_filter_clause_of_yojson tree path

let search_assets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key search_next_token_of_yojson "NextToken") _list path;
     items = option_of_yojson (value_for_key search_result_item_list_of_yojson "Items") _list path;
   }
    : search_assets_output)

let search_assets_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_clause =
       option_of_yojson (value_for_key search_filter_clause_of_yojson "FilterClause") _list path;
     sort = option_of_yojson (value_for_key search_sort_of_yojson "Sort") _list path;
     next_token =
       option_of_yojson (value_for_key search_next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key search_max_results_of_yojson "MaxResults") _list path;
     search_text = option_of_yojson (value_for_key search_text_of_yojson "SearchText") _list path;
   }
    : search_assets_input)

let schema_version_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETING" -> DELETING
    | `String "FAILURE" -> FAILURE
    | `String "PENDING" -> PENDING
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SchemaVersionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SchemaVersionStatus")
     : schema_version_status)
    : schema_version_status)

let created_timestamp_of_yojson = string_of_yojson

let schema_version_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_time =
       option_of_yojson (value_for_key created_timestamp_of_yojson "CreatedTime") _list path;
     status = option_of_yojson (value_for_key schema_version_status_of_yojson "Status") _list path;
     version_number =
       option_of_yojson (value_for_key version_long_number_of_yojson "VersionNumber") _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
     schema_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "SchemaArn") _list path;
   }
    : schema_version_list_item)

let schema_version_list_of_yojson tree path =
  list_of_yojson schema_version_list_item_of_yojson tree path

let error_code_string_of_yojson = string_of_yojson
let error_message_string_of_yojson = string_of_yojson

let error_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_string_of_yojson "ErrorMessage") _list path;
     error_code =
       option_of_yojson (value_for_key error_code_string_of_yojson "ErrorCode") _list path;
   }
    : error_details)

let schema_version_error_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_details =
       option_of_yojson (value_for_key error_details_of_yojson "ErrorDetails") _list path;
     version_number =
       option_of_yojson (value_for_key version_long_number_of_yojson "VersionNumber") _list path;
   }
    : schema_version_error_item)

let schema_version_error_list_of_yojson tree path =
  list_of_yojson schema_version_error_item_of_yojson tree path

let schema_validation_error_of_yojson = string_of_yojson

let schema_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETING" -> DELETING
    | `String "PENDING" -> PENDING
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SchemaStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SchemaStatus")
     : schema_status)
    : schema_status)

let schema_registry_token_string_of_yojson = string_of_yojson
let schema_path_string_of_yojson = string_of_yojson

let schema_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_time =
       option_of_yojson (value_for_key updated_timestamp_of_yojson "UpdatedTime") _list path;
     created_time =
       option_of_yojson (value_for_key created_timestamp_of_yojson "CreatedTime") _list path;
     schema_status =
       option_of_yojson (value_for_key schema_status_of_yojson "SchemaStatus") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     schema_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "SchemaArn") _list path;
     schema_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "SchemaName")
         _list path;
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
   }
    : schema_list_item)

let schema_list_definition_of_yojson tree path = list_of_yojson schema_list_item_of_yojson tree path

let schema_diff_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SYNTAX_DIFF" -> SYNTAX_DIFF
    | `String value -> raise (deserialize_unknown_enum_value_error path "SchemaDiffType" value)
    | _ -> raise (deserialize_wrong_type_error path "SchemaDiffType")
     : schema_diff_type)
    : schema_diff_type)

let schema_definition_string_of_yojson = string_of_yojson
let schema_definition_diff_of_yojson = string_of_yojson
let schema_checkpoint_number_of_yojson = long_of_yojson

let schedule_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTO" -> AUTO
    | `String "CRON" -> CRON
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScheduleType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduleType")
     : schedule_type)
    : schedule_type)

let schedule_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRANSITIONING" -> TRANSITIONING
    | `String "NOT_SCHEDULED" -> NOT_SCHEDULED
    | `String "SCHEDULED" -> SCHEDULED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScheduleState" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduleState")
     : schedule_state)
    : schedule_state)

let schedule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key schedule_state_of_yojson "State") _list path;
     schedule_expression =
       option_of_yojson (value_for_key cron_expression_of_yojson "ScheduleExpression") _list path;
   }
    : schedule)

let scala_code_of_yojson = string_of_yojson

let run_statement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = option_of_yojson (value_for_key integer_value_of_yojson "Id") _list path }
    : run_statement_response)

let orchestration_statement_code_string_of_yojson = string_of_yojson

let run_statement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_origin =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "RequestOrigin")
         _list path;
     code = value_for_key orchestration_statement_code_string_of_yojson "Code" _list path;
     session_id = value_for_key name_string_of_yojson "SessionId" _list path;
   }
    : run_statement_request)

let run_id_of_yojson = string_of_yojson

let rule_metrics_map_of_yojson tree path =
  map_of_yojson name_string_of_yojson nullable_double_of_yojson tree path

let role_arn_of_yojson = string_of_yojson
let node_id_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let resume_workflow_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     node_ids = option_of_yojson (value_for_key node_id_list_of_yojson "NodeIds") _list path;
     run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path;
   }
    : resume_workflow_run_response)

let resume_workflow_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     node_ids = value_for_key node_id_list_of_yojson "NodeIds" _list path;
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : resume_workflow_run_request)

let field_data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNION" -> UNION
    | `String "BINARY" -> BINARY
    | `String "STRUCT" -> STRUCT
    | `String "DOUBLE" -> DOUBLE
    | `String "SHORT" -> SHORT
    | `String "BYTE" -> BYTE
    | `String "DECIMAL" -> DECIMAL
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String "STRING" -> STRING
    | `String "ARRAY" -> ARRAY
    | `String "MAP" -> MAP
    | `String "BOOLEAN" -> BOOLEAN
    | `String "DATE" -> DATE
    | `String "LONG" -> LONG
    | `String "FLOAT" -> FLOAT
    | `String "BIGINT" -> BIGINT
    | `String "SMALLINT" -> SMALLINT
    | `String "INT" -> INT
    | `String value -> raise (deserialize_unknown_enum_value_error path "FieldDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "FieldDataType")
     : field_data_type)
    : field_data_type)

let field_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_data_type = value_for_key field_data_type_of_yojson "FieldDataType" _list path;
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Name" _list path;
   }
    : field_definition)

let field_definition_map_key_string_of_yojson = string_of_yojson

let field_definition_map_of_yojson tree path =
  map_of_yojson field_definition_map_key_string_of_yojson field_definition_of_yojson tree path

let entity_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema = option_of_yojson (value_for_key field_definition_map_of_yojson "Schema") _list path;
     source_configuration =
       option_of_yojson
         (value_for_key source_configuration_of_yojson "SourceConfiguration")
         _list path;
   }
    : entity_configuration)

let entity_configuration_map_key_string_of_yojson = string_of_yojson

let entity_configuration_map_of_yojson tree path =
  map_of_yojson entity_configuration_map_key_string_of_yojson entity_configuration_of_yojson tree
    path

let rest_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_configurations =
       option_of_yojson
         (value_for_key entity_configuration_map_of_yojson "EntityConfigurations")
         _list path;
     validation_endpoint_configuration =
       option_of_yojson
         (value_for_key source_configuration_of_yojson "ValidationEndpointConfiguration")
         _list path;
     global_source_configuration =
       option_of_yojson
         (value_for_key source_configuration_of_yojson "GlobalSourceConfiguration")
         _list path;
   }
    : rest_configuration)

let job_name_of_yojson = string_of_yojson
let json_value_of_yojson = string_of_yojson

let job_bookmark_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_bookmark = option_of_yojson (value_for_key json_value_of_yojson "JobBookmark") _list path;
     run_id = option_of_yojson (value_for_key run_id_of_yojson "RunId") _list path;
     previous_run_id = option_of_yojson (value_for_key run_id_of_yojson "PreviousRunId") _list path;
     attempt = option_of_yojson (value_for_key integer_value_of_yojson "Attempt") _list path;
     run = option_of_yojson (value_for_key integer_value_of_yojson "Run") _list path;
     version = option_of_yojson (value_for_key integer_value_of_yojson "Version") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
   }
    : job_bookmark_entry)

let reset_job_bookmark_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_bookmark_entry =
       option_of_yojson (value_for_key job_bookmark_entry_of_yojson "JobBookmarkEntry") _list path;
   }
    : reset_job_bookmark_response)

let reset_job_bookmark_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_id = option_of_yojson (value_for_key run_id_of_yojson "RunId") _list path;
     job_name = value_for_key job_name_of_yojson "JobName" _list path;
   }
    : reset_job_bookmark_request)

let metadata_key_string_of_yojson = string_of_yojson
let metadata_value_string_of_yojson = string_of_yojson

let remove_schema_version_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata_value =
       option_of_yojson (value_for_key metadata_value_string_of_yojson "MetadataValue") _list path;
     metadata_key =
       option_of_yojson (value_for_key metadata_key_string_of_yojson "MetadataKey") _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
     version_number =
       option_of_yojson (value_for_key version_long_number_of_yojson "VersionNumber") _list path;
     latest_version =
       option_of_yojson
         (value_for_key latest_schema_version_boolean_of_yojson "LatestVersion")
         _list path;
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
     schema_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "SchemaName")
         _list path;
     schema_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "SchemaArn") _list path;
   }
    : remove_schema_version_metadata_response)

let metadata_key_value_pair_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata_value =
       option_of_yojson (value_for_key metadata_value_string_of_yojson "MetadataValue") _list path;
     metadata_key =
       option_of_yojson (value_for_key metadata_key_string_of_yojson "MetadataKey") _list path;
   }
    : metadata_key_value_pair)

let remove_schema_version_metadata_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata_key_value =
       value_for_key metadata_key_value_pair_of_yojson "MetadataKeyValue" _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
     schema_version_number =
       option_of_yojson
         (value_for_key schema_version_number_of_yojson "SchemaVersionNumber")
         _list path;
     schema_id = option_of_yojson (value_for_key schema_id_of_yojson "SchemaId") _list path;
   }
    : remove_schema_version_metadata_input)

let registry_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETING" -> DELETING
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegistryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistryStatus")
     : registry_status)
    : registry_status)

let registry_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_time =
       option_of_yojson (value_for_key updated_timestamp_of_yojson "UpdatedTime") _list path;
     created_time =
       option_of_yojson (value_for_key created_timestamp_of_yojson "CreatedTime") _list path;
     status = option_of_yojson (value_for_key registry_status_of_yojson "Status") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     registry_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "RegistryArn") _list path;
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
   }
    : registry_list_item)

let registry_list_definition_of_yojson tree path =
  list_of_yojson registry_list_item_of_yojson tree path

let register_schema_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key schema_version_status_of_yojson "Status") _list path;
     version_number =
       option_of_yojson (value_for_key version_long_number_of_yojson "VersionNumber") _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
   }
    : register_schema_version_response)

let register_schema_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_definition =
       value_for_key schema_definition_string_of_yojson "SchemaDefinition" _list path;
     schema_id = value_for_key schema_id_of_yojson "SchemaId" _list path;
   }
    : register_schema_version_input)

let register_connection_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_type_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "ConnectionTypeArn") _list path;
   }
    : register_connection_type_response)

let integration_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "REST" -> REST
    | `String value -> raise (deserialize_unknown_enum_value_error path "IntegrationType" value)
    | _ -> raise (deserialize_wrong_type_error path "IntegrationType")
     : integration_type)
    : integration_type)

let description_of_yojson = string_of_yojson

let connection_properties_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_request_parameters =
       option_of_yojson
         (value_for_key connector_property_list_of_yojson "AdditionalRequestParameters")
         _list path;
     url = option_of_yojson (value_for_key connector_property_of_yojson "Url") _list path;
   }
    : connection_properties_configuration)

let authentication_types_of_yojson tree path =
  list_of_yojson authentication_type_of_yojson tree path

let connector_o_auth2_grant_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTHORIZATION_CODE" -> AUTHORIZATION_CODE
    | `String "JWT_BEARER" -> JWT_BEARER
    | `String "CLIENT_CREDENTIALS" -> CLIENT_CREDENTIALS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConnectorOAuth2GrantType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectorOAuth2GrantType")
     : connector_o_auth2_grant_type)
    : connector_o_auth2_grant_type)

let content_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "URL_ENCODED" -> URL_ENCODED
    | `String "APPLICATION_JSON" -> APPLICATION_JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContentType" value)
    | _ -> raise (deserialize_wrong_type_error path "ContentType")
     : content_type)
    : content_type)

let client_credentials_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_url_parameters =
       option_of_yojson
         (value_for_key connector_property_list_of_yojson "TokenUrlParameters")
         _list path;
     scope = option_of_yojson (value_for_key connector_property_of_yojson "Scope") _list path;
     client_secret =
       option_of_yojson (value_for_key connector_property_of_yojson "ClientSecret") _list path;
     client_id = option_of_yojson (value_for_key connector_property_of_yojson "ClientId") _list path;
     content_type = option_of_yojson (value_for_key content_type_of_yojson "ContentType") _list path;
     request_method =
       option_of_yojson (value_for_key http_method_of_yojson "RequestMethod") _list path;
     token_url = option_of_yojson (value_for_key connector_property_of_yojson "TokenUrl") _list path;
   }
    : client_credentials_properties)

let jwt_bearer_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_url_parameters =
       option_of_yojson
         (value_for_key connector_property_list_of_yojson "TokenUrlParameters")
         _list path;
     jwt_token = option_of_yojson (value_for_key connector_property_of_yojson "JwtToken") _list path;
     content_type = option_of_yojson (value_for_key content_type_of_yojson "ContentType") _list path;
     request_method =
       option_of_yojson (value_for_key http_method_of_yojson "RequestMethod") _list path;
     token_url = option_of_yojson (value_for_key connector_property_of_yojson "TokenUrl") _list path;
   }
    : jwt_bearer_properties)

let connector_authorization_code_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_url_parameters =
       option_of_yojson
         (value_for_key connector_property_list_of_yojson "TokenUrlParameters")
         _list path;
     prompt = option_of_yojson (value_for_key connector_property_of_yojson "Prompt") _list path;
     scope = option_of_yojson (value_for_key connector_property_of_yojson "Scope") _list path;
     client_secret =
       option_of_yojson (value_for_key connector_property_of_yojson "ClientSecret") _list path;
     client_id = option_of_yojson (value_for_key connector_property_of_yojson "ClientId") _list path;
     content_type = option_of_yojson (value_for_key content_type_of_yojson "ContentType") _list path;
     request_method =
       option_of_yojson (value_for_key http_method_of_yojson "RequestMethod") _list path;
     token_url = option_of_yojson (value_for_key connector_property_of_yojson "TokenUrl") _list path;
     redirect_uri =
       option_of_yojson (value_for_key connector_property_of_yojson "RedirectUri") _list path;
     authorization_code =
       option_of_yojson (value_for_key connector_property_of_yojson "AuthorizationCode") _list path;
     authorization_code_url =
       option_of_yojson
         (value_for_key connector_property_of_yojson "AuthorizationCodeUrl")
         _list path;
   }
    : connector_authorization_code_properties)

let connector_o_auth2_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authorization_code_properties =
       option_of_yojson
         (value_for_key connector_authorization_code_properties_of_yojson
            "AuthorizationCodeProperties")
         _list path;
     jwt_bearer_properties =
       option_of_yojson
         (value_for_key jwt_bearer_properties_of_yojson "JWTBearerProperties")
         _list path;
     client_credentials_properties =
       option_of_yojson
         (value_for_key client_credentials_properties_of_yojson "ClientCredentialsProperties")
         _list path;
     o_auth2_grant_type =
       value_for_key connector_o_auth2_grant_type_of_yojson "OAuth2GrantType" _list path;
   }
    : connector_o_auth2_properties)

let basic_authentication_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password = option_of_yojson (value_for_key connector_property_of_yojson "Password") _list path;
     username = option_of_yojson (value_for_key connector_property_of_yojson "Username") _list path;
   }
    : basic_authentication_properties)

let custom_authentication_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_parameters =
       value_for_key connector_property_list_of_yojson "AuthenticationParameters" _list path;
   }
    : custom_authentication_properties)

let connector_authentication_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_authentication_properties =
       option_of_yojson
         (value_for_key custom_authentication_properties_of_yojson "CustomAuthenticationProperties")
         _list path;
     basic_authentication_properties =
       option_of_yojson
         (value_for_key basic_authentication_properties_of_yojson "BasicAuthenticationProperties")
         _list path;
     o_auth2_properties =
       option_of_yojson
         (value_for_key connector_o_auth2_properties_of_yojson "OAuth2Properties")
         _list path;
     authentication_types =
       value_for_key authentication_types_of_yojson "AuthenticationTypes" _list path;
   }
    : connector_authentication_configuration)

let register_connection_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     rest_configuration = value_for_key rest_configuration_of_yojson "RestConfiguration" _list path;
     connector_authentication_configuration =
       value_for_key connector_authentication_configuration_of_yojson
         "ConnectorAuthenticationConfiguration" _list path;
     connection_properties =
       value_for_key connection_properties_configuration_of_yojson "ConnectionProperties" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     integration_type = value_for_key integration_type_of_yojson "IntegrationType" _list path;
     connection_type = value_for_key name_string_of_yojson "ConnectionType" _list path;
   }
    : register_connection_type_request)

let record_of_yojson = json_of_yojson
let records_of_yojson tree path = list_of_yojson record_of_yojson tree path
let context_value_of_yojson = string_of_yojson
let context_key_of_yojson = string_of_yojson

let additional_context_map_of_yojson tree path =
  map_of_yojson context_key_of_yojson context_value_of_yojson tree path

let query_session_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_context =
       option_of_yojson
         (value_for_key additional_context_map_of_yojson "AdditionalContext")
         _list path;
     query_authorization_id =
       option_of_yojson (value_for_key hash_string_of_yojson "QueryAuthorizationId") _list path;
     cluster_id = option_of_yojson (value_for_key nullable_string_of_yojson "ClusterId") _list path;
     query_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "QueryStartTime") _list path;
     query_id = option_of_yojson (value_for_key hash_string_of_yojson "QueryId") _list path;
   }
    : query_session_context)

let other_metadata_value_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_time =
       option_of_yojson (value_for_key created_timestamp_of_yojson "CreatedTime") _list path;
     metadata_value =
       option_of_yojson (value_for_key metadata_value_string_of_yojson "MetadataValue") _list path;
   }
    : other_metadata_value_list_item)

let other_metadata_value_list_of_yojson tree path =
  list_of_yojson other_metadata_value_list_item_of_yojson tree path

let metadata_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     other_metadata_value_list =
       option_of_yojson
         (value_for_key other_metadata_value_list_of_yojson "OtherMetadataValueList")
         _list path;
     created_time =
       option_of_yojson (value_for_key created_timestamp_of_yojson "CreatedTime") _list path;
     metadata_value =
       option_of_yojson (value_for_key metadata_value_string_of_yojson "MetadataValue") _list path;
   }
    : metadata_info)

let metadata_info_map_of_yojson tree path =
  map_of_yojson metadata_key_string_of_yojson metadata_info_of_yojson tree path

let query_schema_version_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key schema_registry_token_string_of_yojson "NextToken")
         _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
     metadata_info_map =
       option_of_yojson (value_for_key metadata_info_map_of_yojson "MetadataInfoMap") _list path;
   }
    : query_schema_version_metadata_response)

let query_schema_version_metadata_max_results_of_yojson = int_of_yojson
let metadata_list_of_yojson tree path = list_of_yojson metadata_key_value_pair_of_yojson tree path

let query_schema_version_metadata_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key schema_registry_token_string_of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key query_schema_version_metadata_max_results_of_yojson "MaxResults")
         _list path;
     metadata_list =
       option_of_yojson (value_for_key metadata_list_of_yojson "MetadataList") _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
     schema_version_number =
       option_of_yojson
         (value_for_key schema_version_number_of_yojson "SchemaVersionNumber")
         _list path;
     schema_id = option_of_yojson (value_for_key schema_id_of_yojson "SchemaId") _list path;
   }
    : query_schema_version_metadata_input)

let python_script_of_yojson = string_of_yojson

let put_workflow_run_properties_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_workflow_run_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_properties = value_for_key workflow_run_properties_of_yojson "RunProperties" _list path;
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : put_workflow_run_properties_request)

let put_schema_version_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata_value =
       option_of_yojson (value_for_key metadata_value_string_of_yojson "MetadataValue") _list path;
     metadata_key =
       option_of_yojson (value_for_key metadata_key_string_of_yojson "MetadataKey") _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
     version_number =
       option_of_yojson (value_for_key version_long_number_of_yojson "VersionNumber") _list path;
     latest_version =
       option_of_yojson
         (value_for_key latest_schema_version_boolean_of_yojson "LatestVersion")
         _list path;
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
     schema_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "SchemaName")
         _list path;
     schema_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "SchemaArn") _list path;
   }
    : put_schema_version_metadata_response)

let put_schema_version_metadata_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata_key_value =
       value_for_key metadata_key_value_pair_of_yojson "MetadataKeyValue" _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
     schema_version_number =
       option_of_yojson
         (value_for_key schema_version_number_of_yojson "SchemaVersionNumber")
         _list path;
     schema_id = option_of_yojson (value_for_key schema_id_of_yojson "SchemaId") _list path;
   }
    : put_schema_version_metadata_input)

let put_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy_hash = option_of_yojson (value_for_key hash_string_of_yojson "PolicyHash") _list path }
    : put_resource_policy_response)

let policy_json_string_of_yojson = string_of_yojson

let exist_condition_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "NOT_EXIST" -> NOT_EXIST
    | `String "MUST_EXIST" -> MUST_EXIST
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExistCondition" value)
    | _ -> raise (deserialize_wrong_type_error path "ExistCondition")
     : exist_condition)
    : exist_condition)

let enable_hybrid_values_of_yojson (tree : t) path =
  ((match tree with
    | `String "FALSE" -> FALSE
    | `String "TRUE" -> TRUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnableHybridValues" value)
    | _ -> raise (deserialize_wrong_type_error path "EnableHybridValues")
     : enable_hybrid_values)
    : enable_hybrid_values)

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_hybrid =
       option_of_yojson (value_for_key enable_hybrid_values_of_yojson "EnableHybrid") _list path;
     policy_exists_condition =
       option_of_yojson (value_for_key exist_condition_of_yojson "PolicyExistsCondition") _list path;
     policy_hash_condition =
       option_of_yojson (value_for_key hash_string_of_yojson "PolicyHashCondition") _list path;
     resource_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "ResourceArn") _list path;
     policy_in_json = value_for_key policy_json_string_of_yojson "PolicyInJson" _list path;
   }
    : put_resource_policy_request)

let condition_check_failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : condition_check_failure_exception)

let form_type_id_of_yojson = string_of_yojson
let form_type_name_of_yojson = string_of_yojson
let form_type_schema_of_yojson = string_of_yojson

let put_form_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema = option_of_yojson (value_for_key form_type_schema_of_yojson "Schema") _list path;
     name = option_of_yojson (value_for_key form_type_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key form_type_id_of_yojson "Id") _list path;
   }
    : put_form_type_response)

let put_form_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     schema = value_for_key form_type_schema_of_yojson "Schema" _list path;
     name = value_for_key form_type_name_of_yojson "Name" _list path;
   }
    : put_form_type_request)

let put_data_quality_profile_annotation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_data_quality_profile_annotation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inclusion_annotation =
       value_for_key inclusion_annotation_value_of_yojson "InclusionAnnotation" _list path;
     profile_id = value_for_key hash_string_of_yojson "ProfileId" _list path;
   }
    : put_data_quality_profile_annotation_request)

let put_data_catalog_encryption_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let catalog_encryption_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "SSE-KMS-WITH-SERVICE-ROLE" -> SSEKMSWITHSERVICEROLE
    | `String "SSE-KMS" -> SSEKMS
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CatalogEncryptionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "CatalogEncryptionMode")
     : catalog_encryption_mode)
    : catalog_encryption_mode)

let encryption_at_rest_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_encryption_service_role =
       option_of_yojson
         (value_for_key iam_role_arn_of_yojson "CatalogEncryptionServiceRole")
         _list path;
     sse_aws_kms_key_id =
       option_of_yojson (value_for_key name_string_of_yojson "SseAwsKmsKeyId") _list path;
     catalog_encryption_mode =
       value_for_key catalog_encryption_mode_of_yojson "CatalogEncryptionMode" _list path;
   }
    : encryption_at_rest)

let connection_password_encryption_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_kms_key_id =
       option_of_yojson (value_for_key name_string_of_yojson "AwsKmsKeyId") _list path;
     return_connection_password_encrypted =
       value_for_key boolean__of_yojson "ReturnConnectionPasswordEncrypted" _list path;
   }
    : connection_password_encryption)

let data_catalog_encryption_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_password_encryption =
       option_of_yojson
         (value_for_key connection_password_encryption_of_yojson "ConnectionPasswordEncryption")
         _list path;
     encryption_at_rest =
       option_of_yojson (value_for_key encryption_at_rest_of_yojson "EncryptionAtRest") _list path;
   }
    : data_catalog_encryption_settings)

let put_data_catalog_encryption_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_catalog_encryption_settings =
       value_for_key data_catalog_encryption_settings_of_yojson "DataCatalogEncryptionSettings"
         _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : put_data_catalog_encryption_settings_request)

let iterable_form_name_of_yojson = string_of_yojson
let item_identifier_of_yojson = string_of_yojson
let attachment_name_of_yojson = string_of_yojson

let put_attachment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     form_type_id = option_of_yojson (value_for_key form_type_id_of_yojson "FormTypeId") _list path;
     attachment_name =
       option_of_yojson (value_for_key attachment_name_of_yojson "AttachmentName") _list path;
     item_identifier =
       option_of_yojson (value_for_key item_identifier_of_yojson "ItemIdentifier") _list path;
     iterable_form_name =
       option_of_yojson (value_for_key iterable_form_name_of_yojson "IterableFormName") _list path;
     asset_identifier =
       option_of_yojson (value_for_key asset_id_of_yojson "AssetIdentifier") _list path;
   }
    : put_attachment_response)

let form_content_of_yojson = string_of_yojson

let put_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     form_type_id = value_for_key form_type_id_of_yojson "FormTypeId" _list path;
     content = value_for_key form_content_of_yojson "Content" _list path;
     attachment_name = value_for_key attachment_name_of_yojson "AttachmentName" _list path;
     item_identifier =
       option_of_yojson (value_for_key item_identifier_of_yojson "ItemIdentifier") _list path;
     iterable_form_name =
       option_of_yojson (value_for_key iterable_form_name_of_yojson "IterableFormName") _list path;
     asset_identifier = value_for_key asset_id_of_yojson "AssetIdentifier" _list path;
   }
    : put_attachment_request)

let asset_type_name_of_yojson = string_of_yojson

let asset_type_form_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ form_type_identifier = value_for_key form_type_id_of_yojson "FormTypeIdentifier" _list path }
    : asset_type_form_reference)

let asset_type_form_key_of_yojson = string_of_yojson

let asset_type_forms_map_of_yojson tree path =
  map_of_yojson asset_type_form_key_of_yojson asset_type_form_reference_of_yojson tree path

let put_asset_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forms = option_of_yojson (value_for_key asset_type_forms_map_of_yojson "Forms") _list path;
     name = option_of_yojson (value_for_key asset_type_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key asset_type_id_of_yojson "Id") _list path;
   }
    : put_asset_type_response)

let put_asset_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     forms = value_for_key asset_type_forms_map_of_yojson "Forms" _list path;
     name = value_for_key asset_type_name_of_yojson "Name" _list path;
   }
    : put_asset_type_request)

let created_at_of_yojson = timestamp_epoch_seconds_of_yojson

let asset_form_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content = option_of_yojson (value_for_key form_content_of_yojson "Content") _list path;
     form_type_id = option_of_yojson (value_for_key form_type_id_of_yojson "FormTypeId") _list path;
   }
    : asset_form_entry)

let asset_form_key_of_yojson = string_of_yojson

let asset_form_map_of_yojson tree path =
  map_of_yojson asset_form_key_of_yojson asset_form_entry_of_yojson tree path

let put_asset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forms = option_of_yojson (value_for_key asset_form_map_of_yojson "Forms") _list path;
     created_at = option_of_yojson (value_for_key created_at_of_yojson "CreatedAt") _list path;
     description =
       option_of_yojson (value_for_key asset_description_of_yojson "Description") _list path;
     name = value_for_key asset_name_of_yojson "Name" _list path;
     id = value_for_key asset_id_of_yojson "Id" _list path;
   }
    : put_asset_response)

let put_asset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     forms = value_for_key asset_form_map_of_yojson "Forms" _list path;
     description =
       option_of_yojson (value_for_key asset_description_of_yojson "Description") _list path;
     name = value_for_key asset_name_of_yojson "Name" _list path;
     identifier = value_for_key asset_id_of_yojson "Identifier" _list path;
     asset_type_id = value_for_key asset_type_id_of_yojson "AssetTypeId" _list path;
   }
    : put_asset_request)

let property_types_of_yojson tree path = list_of_yojson property_type_of_yojson tree path

let property_name_overrides_of_yojson tree path =
  map_of_yojson property_name_of_yojson property_name_of_yojson tree path

let property_description_string_of_yojson = string_of_yojson
let allowed_value_description_string_of_yojson = string_of_yojson
let allowed_value_value_string_of_yojson = string_of_yojson

let allowed_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key allowed_value_value_string_of_yojson "Value" _list path;
     description =
       option_of_yojson
         (value_for_key allowed_value_description_string_of_yojson "Description")
         _list path;
   }
    : allowed_value)

let allowed_values_of_yojson tree path = list_of_yojson allowed_value_of_yojson tree path

let data_operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "WRITE" -> WRITE
    | `String "READ" -> READ
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataOperation" value)
    | _ -> raise (deserialize_wrong_type_error path "DataOperation")
     : data_operation)
    : data_operation)

let data_operations_of_yojson tree path = list_of_yojson data_operation_of_yojson tree path

let property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     property_location =
       option_of_yojson (value_for_key property_location_of_yojson "PropertyLocation") _list path;
     key_override =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "KeyOverride")
         _list path;
     data_operation_scopes =
       option_of_yojson (value_for_key data_operations_of_yojson "DataOperationScopes") _list path;
     allowed_values =
       option_of_yojson (value_for_key allowed_values_of_yojson "AllowedValues") _list path;
     property_types = value_for_key property_types_of_yojson "PropertyTypes" _list path;
     default_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "DefaultValue")
         _list path;
     required = value_for_key bool__of_yojson "Required" _list path;
     description = value_for_key property_description_string_of_yojson "Description" _list path;
     name = value_for_key property_name_of_yojson "Name" _list path;
   }
    : property)

let properties_map_of_yojson tree path =
  map_of_yojson property_name_of_yojson property_of_yojson tree path

let predicate_string_of_yojson = string_of_yojson
let positive_integer_of_yojson = int_of_yojson

let permission_type_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : permission_type_mismatch_exception)

let permission_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NESTED_CELL_PERMISSION" -> NESTED_CELL_PERMISSION
    | `String "NESTED_PERMISSION" -> NESTED_PERMISSION
    | `String "CELL_FILTER_PERMISSION" -> CELL_FILTER_PERMISSION
    | `String "COLUMN_PERMISSION" -> COLUMN_PERMISSION
    | `String value -> raise (deserialize_unknown_enum_value_error path "PermissionType" value)
    | _ -> raise (deserialize_wrong_type_error path "PermissionType")
     : permission_type)
    : permission_type)

let permission_type_list_of_yojson tree path = list_of_yojson permission_type_of_yojson tree path

let partition_value_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ values = value_for_key value_string_list_of_yojson "Values" _list path }
    : partition_value_list)

let partition_list_of_yojson tree path = list_of_yojson partition_of_yojson tree path
let partition_input_list_of_yojson tree path = list_of_yojson partition_input_of_yojson tree path

let partition_index_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String "CREATING" -> CREATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PartitionIndexStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PartitionIndexStatus")
     : partition_index_status)
    : partition_index_status)

let key_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let partition_index_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = value_for_key name_string_of_yojson "IndexName" _list path;
     keys = value_for_key key_list_of_yojson "Keys" _list path;
   }
    : partition_index)

let partition_index_list_of_yojson tree path = list_of_yojson partition_index_of_yojson tree path

let key_schema_element_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key column_type_string_of_yojson "Type" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : key_schema_element)

let key_schema_element_list_of_yojson tree path =
  list_of_yojson key_schema_element_of_yojson tree path

let backfill_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNSUPPORTED_PARTITION_CHARACTER_ERROR" -> UNSUPPORTED_PARTITION_CHARACTER_ERROR
    | `String "MISSING_PARTITION_VALUE_ERROR" -> MISSING_PARTITION_VALUE_ERROR
    | `String "INVALID_PARTITION_TYPE_DATA_ERROR" -> INVALID_PARTITION_TYPE_DATA_ERROR
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String "ENCRYPTED_PARTITION_ERROR" -> ENCRYPTED_PARTITION_ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackfillErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "BackfillErrorCode")
     : backfill_error_code)
    : backfill_error_code)

let backfill_errored_partitions_list_of_yojson tree path =
  list_of_yojson partition_value_list_of_yojson tree path

let backfill_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partitions =
       option_of_yojson
         (value_for_key backfill_errored_partitions_list_of_yojson "Partitions")
         _list path;
     code = option_of_yojson (value_for_key backfill_error_code_of_yojson "Code") _list path;
   }
    : backfill_error)

let backfill_errors_of_yojson tree path = list_of_yojson backfill_error_of_yojson tree path

let partition_index_descriptor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backfill_errors =
       option_of_yojson (value_for_key backfill_errors_of_yojson "BackfillErrors") _list path;
     index_status = value_for_key partition_index_status_of_yojson "IndexStatus" _list path;
     keys = value_for_key key_schema_element_list_of_yojson "Keys" _list path;
     index_name = value_for_key name_string_of_yojson "IndexName" _list path;
   }
    : partition_index_descriptor)

let partition_index_descriptor_list_of_yojson tree path =
  list_of_yojson partition_index_descriptor_of_yojson tree path

let partition_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_detail = option_of_yojson (value_for_key error_detail_of_yojson "ErrorDetail") _list path;
     partition_values =
       option_of_yojson (value_for_key value_string_list_of_yojson "PartitionValues") _list path;
   }
    : partition_error)

let partition_errors_of_yojson tree path = list_of_yojson partition_error_of_yojson tree path
let pagination_token_of_yojson = string_of_yojson
let orchestration_token_of_yojson = string_of_yojson
let orchestration_page_size25_of_yojson = int_of_yojson
let orchestration_page_size200_of_yojson = int_of_yojson
let option_value_of_yojson = string_of_yojson
let option_key_of_yojson = string_of_yojson

let metadata_operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE" -> CREATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetadataOperation" value)
    | _ -> raise (deserialize_wrong_type_error path "MetadataOperation")
     : metadata_operation)
    : metadata_operation)

let create_iceberg_table_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties =
       option_of_yojson (value_for_key string_to_string_map_of_yojson "Properties") _list path;
     write_order =
       option_of_yojson (value_for_key iceberg_sort_order_of_yojson "WriteOrder") _list path;
     partition_spec =
       option_of_yojson (value_for_key iceberg_partition_spec_of_yojson "PartitionSpec") _list path;
     schema = value_for_key iceberg_schema_of_yojson "Schema" _list path;
     location = value_for_key location_string_of_yojson "Location" _list path;
   }
    : create_iceberg_table_input)

let iceberg_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_iceberg_table_input =
       option_of_yojson
         (value_for_key create_iceberg_table_input_of_yojson "CreateIcebergTableInput")
         _list path;
     version = option_of_yojson (value_for_key version_string_of_yojson "Version") _list path;
     metadata_operation = value_for_key metadata_operation_of_yojson "MetadataOperation" _list path;
   }
    : iceberg_input)

let open_table_format_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iceberg_input =
       option_of_yojson (value_for_key iceberg_input_of_yojson "IcebergInput") _list path;
   }
    : open_table_format_input)

let o_auth2_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_url_parameters_map =
       option_of_yojson
         (value_for_key token_url_parameters_map_of_yojson "TokenUrlParametersMap")
         _list path;
     token_url = option_of_yojson (value_for_key token_url_of_yojson "TokenUrl") _list path;
     o_auth2_client_application =
       option_of_yojson
         (value_for_key o_auth2_client_application_of_yojson "OAuth2ClientApplication")
         _list path;
     o_auth2_grant_type =
       option_of_yojson (value_for_key o_auth2_grant_type_of_yojson "OAuth2GrantType") _list path;
   }
    : o_auth2_properties)

let next_token_of_yojson = string_of_yojson
let new_rules_of_yojson tree path = list_of_yojson name_string_of_yojson tree path
let integration_description_of_yojson = string_of_yojson
let integration_string_of_yojson = string_of_yojson

let integration_additional_encryption_context_map_of_yojson tree path =
  map_of_yojson integration_string_of_yojson integration_string_of_yojson tree path

let integration_tags_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let integration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEEDS_ATTENTION" -> NEEDS_ATTENTION
    | `String "SYNCING" -> SYNCING
    | `String "DELETING" -> DELETING
    | `String "FAILED" -> FAILED
    | `String "MODIFYING" -> MODIFYING
    | `String "ACTIVE" -> ACTIVE
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "IntegrationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "IntegrationStatus")
     : integration_status)
    : integration_status)

let integration_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let integration_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string2048_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key string128_of_yojson "ErrorCode") _list path;
   }
    : integration_error)

let integration_error_list_of_yojson tree path =
  list_of_yojson integration_error_of_yojson tree path

let integration_source_properties_map_of_yojson tree path =
  map_of_yojson integration_string_of_yojson integration_string_of_yojson tree path

let continuous_sync_of_yojson = bool_of_yojson

let integration_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     continuous_sync =
       option_of_yojson (value_for_key continuous_sync_of_yojson "ContinuousSync") _list path;
     source_properties =
       option_of_yojson
         (value_for_key integration_source_properties_map_of_yojson "SourceProperties")
         _list path;
     refresh_interval =
       option_of_yojson (value_for_key string128_of_yojson "RefreshInterval") _list path;
   }
    : integration_config)

let modify_integration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integration_config =
       option_of_yojson (value_for_key integration_config_of_yojson "IntegrationConfig") _list path;
     data_filter = option_of_yojson (value_for_key string2048_of_yojson "DataFilter") _list path;
     errors = option_of_yojson (value_for_key integration_error_list_of_yojson "Errors") _list path;
     create_time = value_for_key integration_timestamp_of_yojson "CreateTime" _list path;
     status = value_for_key integration_status_of_yojson "Status" _list path;
     tags = option_of_yojson (value_for_key integration_tags_list_of_yojson "Tags") _list path;
     additional_encryption_context =
       option_of_yojson
         (value_for_key integration_additional_encryption_context_map_of_yojson
            "AdditionalEncryptionContext")
         _list path;
     kms_key_id = option_of_yojson (value_for_key string2048_of_yojson "KmsKeyId") _list path;
     integration_arn = value_for_key string128_of_yojson "IntegrationArn" _list path;
     description =
       option_of_yojson (value_for_key integration_description_of_yojson "Description") _list path;
     integration_name = value_for_key string128_of_yojson "IntegrationName" _list path;
     target_arn = value_for_key string512_of_yojson "TargetArn" _list path;
     source_arn = value_for_key string512_of_yojson "SourceArn" _list path;
   }
    : modify_integration_response)

let modify_integration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integration_name =
       option_of_yojson (value_for_key string128_of_yojson "IntegrationName") _list path;
     integration_config =
       option_of_yojson (value_for_key integration_config_of_yojson "IntegrationConfig") _list path;
     data_filter = option_of_yojson (value_for_key string2048_of_yojson "DataFilter") _list path;
     description =
       option_of_yojson (value_for_key integration_description_of_yojson "Description") _list path;
     integration_identifier = value_for_key string128_of_yojson "IntegrationIdentifier" _list path;
   }
    : modify_integration_request)

let invalid_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path }
    : invalid_state_exception)

let invalid_integration_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key integration_error_message_of_yojson "Message") _list path;
   }
    : invalid_integration_state_fault)

let integration_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key integration_error_message_of_yojson "Message") _list path;
   }
    : integration_not_found_fault)

let integration_conflict_operation_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key integration_error_message_of_yojson "Message") _list path;
   }
    : integration_conflict_operation_fault)

let milliseconds_count_of_yojson = long_of_yojson

let data_quality_metric_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     upper_limit =
       option_of_yojson (value_for_key nullable_double_of_yojson "UpperLimit") _list path;
     lower_limit =
       option_of_yojson (value_for_key nullable_double_of_yojson "LowerLimit") _list path;
     expected_value =
       option_of_yojson (value_for_key nullable_double_of_yojson "ExpectedValue") _list path;
     actual_value =
       option_of_yojson (value_for_key nullable_double_of_yojson "ActualValue") _list path;
   }
    : data_quality_metric_values)

let metric_based_observation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_rules = option_of_yojson (value_for_key new_rules_of_yojson "NewRules") _list path;
     metric_values =
       option_of_yojson
         (value_for_key data_quality_metric_values_of_yojson "MetricValues")
         _list path;
     statistic_id = option_of_yojson (value_for_key hash_string_of_yojson "StatisticId") _list path;
     metric_name = option_of_yojson (value_for_key name_string_of_yojson "MetricName") _list path;
   }
    : metric_based_observation)

let message_prefix_of_yojson = string_of_yojson
let max_results_number_of_yojson = int_of_yojson
let max_results_of_yojson = int_of_yojson
let max_list_table_optimizer_runs_token_results_of_yojson = int_of_yojson

let materialized_view_refresh_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INCREMENTAL" -> INCREMENTAL
    | `String "FULL" -> FULL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MaterializedViewRefreshType" value)
    | _ -> raise (deserialize_wrong_type_error path "MaterializedViewRefreshType")
     : materialized_view_refresh_type)
    : materialized_view_refresh_type)

let materialized_view_refresh_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPED" -> STOPPED
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RUNNING" -> RUNNING
    | `String "STARTING" -> STARTING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MaterializedViewRefreshState" value)
    | _ -> raise (deserialize_wrong_type_error path "MaterializedViewRefreshState")
     : materialized_view_refresh_state)
    : materialized_view_refresh_state)

let byte_count_of_yojson = long_of_yojson

let materialized_view_refresh_task_run_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     processed_bytes =
       option_of_yojson (value_for_key byte_count_of_yojson "ProcessedBytes") _list path;
     refresh_type =
       option_of_yojson
         (value_for_key materialized_view_refresh_type_of_yojson "RefreshType")
         _list path;
     dpu_seconds =
       option_of_yojson (value_for_key non_negative_double_of_yojson "DPUSeconds") _list path;
     error_message =
       option_of_yojson (value_for_key description_string_of_yojson "ErrorMessage") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     last_updated = option_of_yojson (value_for_key timestamp_of_yojson "LastUpdated") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     status =
       option_of_yojson
         (value_for_key materialized_view_refresh_state_of_yojson "Status")
         _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     database_name =
       option_of_yojson (value_for_key database_name_of_yojson "DatabaseName") _list path;
     materialized_view_refresh_task_run_id =
       option_of_yojson
         (value_for_key uui_dv4_of_yojson "MaterializedViewRefreshTaskRunId")
         _list path;
     customer_id = option_of_yojson (value_for_key account_id_of_yojson "CustomerId") _list path;
   }
    : materialized_view_refresh_task_run)

let materialized_view_refresh_task_runs_list_of_yojson tree path =
  list_of_yojson materialized_view_refresh_task_run_of_yojson tree path

let field_type_of_yojson = string_of_yojson

let mapping_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_type = option_of_yojson (value_for_key field_type_of_yojson "TargetType") _list path;
     target_path =
       option_of_yojson (value_for_key schema_path_string_of_yojson "TargetPath") _list path;
     target_table = option_of_yojson (value_for_key table_name_of_yojson "TargetTable") _list path;
     source_type = option_of_yojson (value_for_key field_type_of_yojson "SourceType") _list path;
     source_path =
       option_of_yojson (value_for_key schema_path_string_of_yojson "SourcePath") _list path;
     source_table = option_of_yojson (value_for_key table_name_of_yojson "SourceTable") _list path;
   }
    : mapping_entry)

let mapping_list_of_yojson tree path = list_of_yojson mapping_entry_of_yojson tree path
let long_value_string_of_yojson = string_of_yojson
let code_gen_arg_name_of_yojson = string_of_yojson
let code_gen_arg_value_of_yojson = string_of_yojson

let code_gen_node_arg_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     param = option_of_yojson (value_for_key boolean__of_yojson "Param") _list path;
     value = value_for_key code_gen_arg_value_of_yojson "Value" _list path;
     name = value_for_key code_gen_arg_name_of_yojson "Name" _list path;
   }
    : code_gen_node_arg)

let code_gen_node_args_of_yojson tree path = list_of_yojson code_gen_node_arg_of_yojson tree path

let location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dynamo_d_b =
       option_of_yojson (value_for_key code_gen_node_args_of_yojson "DynamoDB") _list path;
     s3 = option_of_yojson (value_for_key code_gen_node_args_of_yojson "S3") _list path;
     jdbc = option_of_yojson (value_for_key code_gen_node_args_of_yojson "Jdbc") _list path;
   }
    : location)

let list_workflows_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     workflows = option_of_yojson (value_for_key workflow_names_of_yojson "Workflows") _list path;
   }
    : list_workflows_response)

let list_workflows_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key orchestration_page_size25_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_workflows_request)

let list_usage_profiles_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key orchestration_token_of_yojson "NextToken") _list path;
     profiles =
       option_of_yojson
         (value_for_key usage_profile_definition_list_of_yojson "Profiles")
         _list path;
   }
    : list_usage_profiles_response)

let list_usage_profiles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key orchestration_page_size200_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson (value_for_key orchestration_token_of_yojson "NextToken") _list path;
   }
    : list_usage_profiles_request)

let list_triggers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     trigger_names =
       option_of_yojson (value_for_key trigger_name_list_of_yojson "TriggerNames") _list path;
   }
    : list_triggers_response)

let list_triggers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     max_results =
       option_of_yojson (value_for_key orchestration_page_size200_of_yojson "MaxResults") _list path;
     dependent_job_name =
       option_of_yojson (value_for_key name_string_of_yojson "DependentJobName") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_triggers_request)

let list_table_optimizer_runs_token_of_yojson = string_of_yojson

let list_table_optimizer_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_optimizer_runs =
       option_of_yojson
         (value_for_key table_optimizer_runs_of_yojson "TableOptimizerRuns")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key list_table_optimizer_runs_token_of_yojson "NextToken")
         _list path;
     table_name = option_of_yojson (value_for_key name_string_of_yojson "TableName") _list path;
     database_name =
       option_of_yojson (value_for_key name_string_of_yojson "DatabaseName") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : list_table_optimizer_runs_response)

let list_table_optimizer_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key list_table_optimizer_runs_token_of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key max_list_table_optimizer_runs_token_results_of_yojson "MaxResults")
         _list path;
     type_ = value_for_key table_optimizer_type_of_yojson "Type" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id = value_for_key catalog_id_string_of_yojson "CatalogId" _list path;
   }
    : list_table_optimizer_runs_request)

let list_statements_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key orchestration_token_of_yojson "NextToken") _list path;
     statements = option_of_yojson (value_for_key statement_list_of_yojson "Statements") _list path;
   }
    : list_statements_response)

let list_statements_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key orchestration_token_of_yojson "NextToken") _list path;
     request_origin =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "RequestOrigin")
         _list path;
     session_id = value_for_key name_string_of_yojson "SessionId" _list path;
   }
    : list_statements_request)

let list_sessions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key orchestration_token_of_yojson "NextToken") _list path;
     sessions = option_of_yojson (value_for_key session_list_of_yojson "Sessions") _list path;
     ids = option_of_yojson (value_for_key session_id_list_of_yojson "Ids") _list path;
   }
    : list_sessions_response)

let list_sessions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_origin =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "RequestOrigin")
         _list path;
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson (value_for_key orchestration_token_of_yojson "NextToken") _list path;
   }
    : list_sessions_request)

let list_schemas_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key schema_registry_token_string_of_yojson "NextToken")
         _list path;
     schemas =
       option_of_yojson (value_for_key schema_list_definition_of_yojson "Schemas") _list path;
   }
    : list_schemas_response)

let list_schemas_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key schema_registry_token_string_of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_results_number_of_yojson "MaxResults") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "RegistryId") _list path;
   }
    : list_schemas_input)

let list_schema_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key schema_registry_token_string_of_yojson "NextToken")
         _list path;
     schemas = option_of_yojson (value_for_key schema_version_list_of_yojson "Schemas") _list path;
   }
    : list_schema_versions_response)

let list_schema_versions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key schema_registry_token_string_of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_results_number_of_yojson "MaxResults") _list path;
     schema_id = value_for_key schema_id_of_yojson "SchemaId" _list path;
   }
    : list_schema_versions_input)

let list_registries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key schema_registry_token_string_of_yojson "NextToken")
         _list path;
     registries =
       option_of_yojson (value_for_key registry_list_definition_of_yojson "Registries") _list path;
   }
    : list_registries_response)

let list_registries_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key schema_registry_token_string_of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_results_number_of_yojson "MaxResults") _list path;
   }
    : list_registries_input)

let list_materialized_view_refresh_task_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     materialized_view_refresh_task_runs =
       option_of_yojson
         (value_for_key materialized_view_refresh_task_runs_list_of_yojson
            "MaterializedViewRefreshTaskRuns")
         _list path;
   }
    : list_materialized_view_refresh_task_runs_response)

let list_materialized_view_refresh_task_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     table_name = option_of_yojson (value_for_key name_string_of_yojson "TableName") _list path;
     database_name =
       option_of_yojson (value_for_key name_string_of_yojson "DatabaseName") _list path;
     catalog_id = value_for_key name_string_of_yojson "CatalogId" _list path;
   }
    : list_materialized_view_refresh_task_runs_request)

let list_ml_transforms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     transform_ids = value_for_key transform_id_list_of_yojson "TransformIds" _list path;
   }
    : list_ml_transforms_response)

let list_ml_transforms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     sort = option_of_yojson (value_for_key transform_sort_criteria_of_yojson "Sort") _list path;
     filter =
       option_of_yojson (value_for_key transform_filter_criteria_of_yojson "Filter") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_ml_transforms_request)

let job_name_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let list_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     job_names = option_of_yojson (value_for_key job_name_list_of_yojson "JobNames") _list path;
   }
    : list_jobs_response)

let list_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_jobs_request)

let item_id_of_yojson = string_of_yojson
let item_name_of_yojson = string_of_yojson
let item_description_of_yojson = string_of_yojson
let glossary_term_id_list_of_yojson tree path = list_of_yojson glossary_term_id_of_yojson tree path

let iterable_form_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     glossary_terms =
       option_of_yojson (value_for_key glossary_term_id_list_of_yojson "GlossaryTerms") _list path;
     description =
       option_of_yojson (value_for_key item_description_of_yojson "Description") _list path;
     item_name = option_of_yojson (value_for_key item_name_of_yojson "ItemName") _list path;
     item_id = option_of_yojson (value_for_key item_id_of_yojson "ItemId") _list path;
   }
    : iterable_form_list_item)

let iterable_form_list_item_list_of_yojson tree path =
  list_of_yojson iterable_form_list_item_of_yojson tree path

let list_iterable_forms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     items =
       option_of_yojson (value_for_key iterable_form_list_item_list_of_yojson "Items") _list path;
   }
    : list_iterable_forms_response)

let list_iterable_forms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     iterable_form_name = value_for_key iterable_form_name_of_yojson "IterableFormName" _list path;
     asset_identifier = value_for_key asset_id_of_yojson "AssetIdentifier" _list path;
   }
    : list_iterable_forms_request)

let integration_resource_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_processing_properties =
       option_of_yojson
         (value_for_key target_processing_properties_of_yojson "TargetProcessingProperties")
         _list path;
     source_processing_properties =
       option_of_yojson
         (value_for_key source_processing_properties_of_yojson "SourceProcessingProperties")
         _list path;
     resource_property_arn =
       option_of_yojson (value_for_key string512_of_yojson "ResourcePropertyArn") _list path;
     resource_arn = value_for_key string512_of_yojson "ResourceArn" _list path;
   }
    : integration_resource_property)

let integration_resource_property_list_of_yojson tree path =
  list_of_yojson integration_resource_property_of_yojson tree path

let list_integration_resource_properties_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string1024_of_yojson "Marker") _list path;
     integration_resource_property_list =
       option_of_yojson
         (value_for_key integration_resource_property_list_of_yojson
            "IntegrationResourcePropertyList")
         _list path;
   }
    : list_integration_resource_properties_response)

let integration_resource_property_filter_values_of_yojson tree path =
  list_of_yojson string128_of_yojson tree path

let integration_resource_property_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values =
       option_of_yojson
         (value_for_key integration_resource_property_filter_values_of_yojson "Values")
         _list path;
     name = option_of_yojson (value_for_key string128_of_yojson "Name") _list path;
   }
    : integration_resource_property_filter)

let integration_resource_property_filter_list_of_yojson tree path =
  list_of_yojson integration_resource_property_filter_of_yojson tree path

let integration_integer_of_yojson = int_of_yojson

let list_integration_resource_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_records =
       option_of_yojson (value_for_key integration_integer_of_yojson "MaxRecords") _list path;
     filters =
       option_of_yojson
         (value_for_key integration_resource_property_filter_list_of_yojson "Filters")
         _list path;
     marker = option_of_yojson (value_for_key string1024_of_yojson "Marker") _list path;
   }
    : list_integration_resource_properties_request)

let glossary_term_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     short_description =
       option_of_yojson
         (value_for_key glossary_short_description_of_yojson "ShortDescription")
         _list path;
     name = option_of_yojson (value_for_key glossary_term_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key glossary_term_id_of_yojson "Id") _list path;
   }
    : glossary_term_item)

let glossary_term_item_list_of_yojson tree path =
  list_of_yojson glossary_term_item_of_yojson tree path

let list_glossary_terms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     items = option_of_yojson (value_for_key glossary_term_item_list_of_yojson "Items") _list path;
   }
    : list_glossary_terms_response)

let list_glossary_terms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     glossary_identifier = value_for_key glossary_id_of_yojson "GlossaryIdentifier" _list path;
   }
    : list_glossary_terms_request)

let glossary_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key metadata_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key glossary_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key glossary_id_of_yojson "Id") _list path;
   }
    : glossary_item)

let glossary_item_list_of_yojson tree path = list_of_yojson glossary_item_of_yojson tree path

let list_glossaries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     items = option_of_yojson (value_for_key glossary_item_list_of_yojson "Items") _list path;
   }
    : list_glossaries_response)

let list_glossaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : list_glossaries_request)

let form_type_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key form_type_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key form_type_id_of_yojson "Id") _list path;
   }
    : form_type_item)

let form_type_item_list_of_yojson tree path = list_of_yojson form_type_item_of_yojson tree path

let list_form_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     items = value_for_key form_type_item_list_of_yojson "Items" _list path;
   }
    : list_form_types_response)

let list_form_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : list_form_types_request)

let entity_name_of_yojson = string_of_yojson
let entity_label_of_yojson = string_of_yojson
let is_parent_entity_of_yojson = bool_of_yojson
let entity_description_of_yojson = string_of_yojson
let category_of_yojson = string_of_yojson

let custom_properties_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_properties =
       option_of_yojson (value_for_key custom_properties_of_yojson "CustomProperties") _list path;
     category = option_of_yojson (value_for_key category_of_yojson "Category") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     is_parent_entity =
       option_of_yojson (value_for_key is_parent_entity_of_yojson "IsParentEntity") _list path;
     label = option_of_yojson (value_for_key entity_label_of_yojson "Label") _list path;
     entity_name = option_of_yojson (value_for_key entity_name_of_yojson "EntityName") _list path;
   }
    : entity)

let entity_list_of_yojson tree path = list_of_yojson entity_of_yojson tree path

let list_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     entities = option_of_yojson (value_for_key entity_list_of_yojson "Entities") _list path;
   }
    : list_entities_response)

let api_version_of_yojson = string_of_yojson

let list_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_store_api_version =
       option_of_yojson (value_for_key api_version_of_yojson "DataStoreApiVersion") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     parent_entity_name =
       option_of_yojson (value_for_key entity_name_of_yojson "ParentEntityName") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
     connection_name =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionName") _list path;
   }
    : list_entities_request)

let dev_endpoint_name_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let list_dev_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     dev_endpoint_names =
       option_of_yojson
         (value_for_key dev_endpoint_name_list_of_yojson "DevEndpointNames")
         _list path;
   }
    : list_dev_endpoints_response)

let list_dev_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_dev_endpoints_request)

let list_data_quality_statistics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     statistics =
       option_of_yojson (value_for_key statistic_summary_list_of_yojson "Statistics") _list path;
   }
    : list_data_quality_statistics_response)

let list_data_quality_statistics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     timestamp_filter =
       option_of_yojson (value_for_key timestamp_filter_of_yojson "TimestampFilter") _list path;
     profile_id = option_of_yojson (value_for_key hash_string_of_yojson "ProfileId") _list path;
     statistic_id = option_of_yojson (value_for_key hash_string_of_yojson "StatisticId") _list path;
   }
    : list_data_quality_statistics_request)

let annotation_list_of_yojson tree path = list_of_yojson statistic_annotation_of_yojson tree path

let list_data_quality_statistic_annotations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     annotations =
       option_of_yojson (value_for_key annotation_list_of_yojson "Annotations") _list path;
   }
    : list_data_quality_statistic_annotations_response)

let list_data_quality_statistic_annotations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     timestamp_filter =
       option_of_yojson (value_for_key timestamp_filter_of_yojson "TimestampFilter") _list path;
     profile_id = option_of_yojson (value_for_key hash_string_of_yojson "ProfileId") _list path;
     statistic_id = option_of_yojson (value_for_key hash_string_of_yojson "StatisticId") _list path;
   }
    : list_data_quality_statistic_annotations_request)

let data_quality_target_table_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_id = option_of_yojson (value_for_key name_string_of_yojson "CatalogId") _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
   }
    : data_quality_target_table)

let data_quality_ruleset_list_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_count = option_of_yojson (value_for_key nullable_integer_of_yojson "RuleCount") _list path;
     recommendation_run_id =
       option_of_yojson (value_for_key hash_string_of_yojson "RecommendationRunId") _list path;
     target_table =
       option_of_yojson (value_for_key data_quality_target_table_of_yojson "TargetTable") _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedOn") _list path;
     created_on = option_of_yojson (value_for_key timestamp_of_yojson "CreatedOn") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : data_quality_ruleset_list_details)

let data_quality_ruleset_list_of_yojson tree path =
  list_of_yojson data_quality_ruleset_list_details_of_yojson tree path

let list_data_quality_rulesets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     rulesets =
       option_of_yojson (value_for_key data_quality_ruleset_list_of_yojson "Rulesets") _list path;
   }
    : list_data_quality_rulesets_response)

let data_quality_ruleset_filter_criteria_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_table =
       option_of_yojson (value_for_key data_quality_target_table_of_yojson "TargetTable") _list path;
     last_modified_after =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedAfter") _list path;
     last_modified_before =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedBefore") _list path;
     created_after = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAfter") _list path;
     created_before =
       option_of_yojson (value_for_key timestamp_of_yojson "CreatedBefore") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : data_quality_ruleset_filter_criteria)

let list_data_quality_rulesets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     filter =
       option_of_yojson
         (value_for_key data_quality_ruleset_filter_criteria_of_yojson "Filter")
         _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_data_quality_rulesets_request)

let data_quality_ruleset_evaluation_run_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     started_on = option_of_yojson (value_for_key timestamp_of_yojson "StartedOn") _list path;
     status = option_of_yojson (value_for_key task_status_type_of_yojson "Status") _list path;
     run_id = option_of_yojson (value_for_key hash_string_of_yojson "RunId") _list path;
   }
    : data_quality_ruleset_evaluation_run_description)

let data_quality_ruleset_evaluation_run_list_of_yojson tree path =
  list_of_yojson data_quality_ruleset_evaluation_run_description_of_yojson tree path

let list_data_quality_ruleset_evaluation_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     runs =
       option_of_yojson
         (value_for_key data_quality_ruleset_evaluation_run_list_of_yojson "Runs")
         _list path;
   }
    : list_data_quality_ruleset_evaluation_runs_response)

let data_quality_ruleset_evaluation_run_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ruleset_name = option_of_yojson (value_for_key name_string_of_yojson "RulesetName") _list path;
     started_after = option_of_yojson (value_for_key timestamp_of_yojson "StartedAfter") _list path;
     started_before =
       option_of_yojson (value_for_key timestamp_of_yojson "StartedBefore") _list path;
     data_source = value_for_key data_source_of_yojson "DataSource" _list path;
   }
    : data_quality_ruleset_evaluation_run_filter)

let list_data_quality_ruleset_evaluation_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     filter =
       option_of_yojson
         (value_for_key data_quality_ruleset_evaluation_run_filter_of_yojson "Filter")
         _list path;
   }
    : list_data_quality_ruleset_evaluation_runs_request)

let data_quality_rule_recommendation_run_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     started_on = option_of_yojson (value_for_key timestamp_of_yojson "StartedOn") _list path;
     status = option_of_yojson (value_for_key task_status_type_of_yojson "Status") _list path;
     run_id = option_of_yojson (value_for_key hash_string_of_yojson "RunId") _list path;
   }
    : data_quality_rule_recommendation_run_description)

let data_quality_rule_recommendation_run_list_of_yojson tree path =
  list_of_yojson data_quality_rule_recommendation_run_description_of_yojson tree path

let list_data_quality_rule_recommendation_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     runs =
       option_of_yojson
         (value_for_key data_quality_rule_recommendation_run_list_of_yojson "Runs")
         _list path;
   }
    : list_data_quality_rule_recommendation_runs_response)

let data_quality_rule_recommendation_run_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     started_after = option_of_yojson (value_for_key timestamp_of_yojson "StartedAfter") _list path;
     started_before =
       option_of_yojson (value_for_key timestamp_of_yojson "StartedBefore") _list path;
     data_source = value_for_key data_source_of_yojson "DataSource" _list path;
   }
    : data_quality_rule_recommendation_run_filter)

let list_data_quality_rule_recommendation_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     filter =
       option_of_yojson
         (value_for_key data_quality_rule_recommendation_run_filter_of_yojson "Filter")
         _list path;
   }
    : list_data_quality_rule_recommendation_runs_request)

let data_quality_result_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     started_on = option_of_yojson (value_for_key timestamp_of_yojson "StartedOn") _list path;
     job_run_id = option_of_yojson (value_for_key hash_string_of_yojson "JobRunId") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     result_id = option_of_yojson (value_for_key hash_string_of_yojson "ResultId") _list path;
   }
    : data_quality_result_description)

let data_quality_result_description_list_of_yojson tree path =
  list_of_yojson data_quality_result_description_of_yojson tree path

let list_data_quality_results_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     results = value_for_key data_quality_result_description_list_of_yojson "Results" _list path;
   }
    : list_data_quality_results_response)

let data_quality_result_filter_criteria_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     started_before =
       option_of_yojson (value_for_key timestamp_of_yojson "StartedBefore") _list path;
     started_after = option_of_yojson (value_for_key timestamp_of_yojson "StartedAfter") _list path;
     job_run_id = option_of_yojson (value_for_key hash_string_of_yojson "JobRunId") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
   }
    : data_quality_result_filter_criteria)

let list_data_quality_results_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     filter =
       option_of_yojson
         (value_for_key data_quality_result_filter_criteria_of_yojson "Filter")
         _list path;
   }
    : list_data_quality_results_request)

let context_words_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let custom_entity_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_words =
       option_of_yojson (value_for_key context_words_of_yojson "ContextWords") _list path;
     regex_string = value_for_key name_string_of_yojson "RegexString" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : custom_entity_type)

let custom_entity_types_of_yojson tree path = list_of_yojson custom_entity_type_of_yojson tree path

let list_custom_entity_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     custom_entity_types =
       option_of_yojson (value_for_key custom_entity_types_of_yojson "CustomEntityTypes") _list path;
   }
    : list_custom_entity_types_response)

let list_custom_entity_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_custom_entity_types_request)

let crawl_id_of_yojson = string_of_yojson

let crawler_history_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPED" -> STOPPED
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "RUNNING" -> RUNNING
    | `String value -> raise (deserialize_unknown_enum_value_error path "CrawlerHistoryState" value)
    | _ -> raise (deserialize_wrong_type_error path "CrawlerHistoryState")
     : crawler_history_state)
    : crawler_history_state)

let crawler_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dpu_hour = option_of_yojson (value_for_key non_negative_double_of_yojson "DPUHour") _list path;
     message_prefix =
       option_of_yojson (value_for_key message_prefix_of_yojson "MessagePrefix") _list path;
     log_stream = option_of_yojson (value_for_key log_stream_of_yojson "LogStream") _list path;
     log_group = option_of_yojson (value_for_key log_group_of_yojson "LogGroup") _list path;
     error_message =
       option_of_yojson (value_for_key description_string_of_yojson "ErrorMessage") _list path;
     summary = option_of_yojson (value_for_key name_string_of_yojson "Summary") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     state = option_of_yojson (value_for_key crawler_history_state_of_yojson "State") _list path;
     crawl_id = option_of_yojson (value_for_key crawl_id_of_yojson "CrawlId") _list path;
   }
    : crawler_history)

let crawler_history_list_of_yojson tree path = list_of_yojson crawler_history_of_yojson tree path

let list_crawls_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     crawls = option_of_yojson (value_for_key crawler_history_list_of_yojson "Crawls") _list path;
   }
    : list_crawls_response)

let field_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "DPU_HOUR" -> DPU_HOUR
    | `String "END_TIME" -> END_TIME
    | `String "START_TIME" -> START_TIME
    | `String "STATE" -> STATE
    | `String "CRAWL_ID" -> CRAWL_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "FieldName" value)
    | _ -> raise (deserialize_wrong_type_error path "FieldName")
     : field_name)
    : field_name)

let filter_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "NE" -> NE
    | `String "EQ" -> EQ
    | `String "LE" -> LE
    | `String "LT" -> LT
    | `String "GE" -> GE
    | `String "GT" -> GT
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterOperator")
     : filter_operator)
    : filter_operator)

let crawls_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_value = option_of_yojson (value_for_key generic_string_of_yojson "FieldValue") _list path;
     filter_operator =
       option_of_yojson (value_for_key filter_operator_of_yojson "FilterOperator") _list path;
     field_name = option_of_yojson (value_for_key field_name_of_yojson "FieldName") _list path;
   }
    : crawls_filter)

let crawls_filter_list_of_yojson tree path = list_of_yojson crawls_filter_of_yojson tree path

let list_crawls_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key crawls_filter_list_of_yojson "Filters") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     crawler_name = value_for_key name_string_of_yojson "CrawlerName" _list path;
   }
    : list_crawls_request)

let crawler_name_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let list_crawlers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     crawler_names =
       option_of_yojson (value_for_key crawler_name_list_of_yojson "CrawlerNames") _list path;
   }
    : list_crawlers_response)

let list_crawlers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : list_crawlers_request)

let display_name_of_yojson = string_of_yojson

let compute_environments_of_yojson tree path =
  list_of_yojson compute_environment_of_yojson tree path

let capabilities_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     supported_compute_environments =
       value_for_key compute_environments_of_yojson "SupportedComputeEnvironments" _list path;
     supported_data_operations =
       value_for_key data_operations_of_yojson "SupportedDataOperations" _list path;
     supported_authentication_types =
       value_for_key authentication_types_of_yojson "SupportedAuthenticationTypes" _list path;
   }
    : capabilities)

let connection_type_variant_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     logo_url = option_of_yojson (value_for_key url_string_of_yojson "LogoUrl") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     connection_type_variant_name =
       option_of_yojson
         (value_for_key display_name_of_yojson "ConnectionTypeVariantName")
         _list path;
   }
    : connection_type_variant)

let connection_type_variant_list_of_yojson tree path =
  list_of_yojson connection_type_variant_of_yojson tree path

let connection_type_brief_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_type_variants =
       option_of_yojson
         (value_for_key connection_type_variant_list_of_yojson "ConnectionTypeVariants")
         _list path;
     logo_url = option_of_yojson (value_for_key url_string_of_yojson "LogoUrl") _list path;
     capabilities =
       option_of_yojson (value_for_key capabilities_of_yojson "Capabilities") _list path;
     categories = option_of_yojson (value_for_key list_of_string_of_yojson "Categories") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     vendor = option_of_yojson (value_for_key vendor_of_yojson "Vendor") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     connection_type =
       option_of_yojson (value_for_key connection_type_of_yojson "ConnectionType") _list path;
   }
    : connection_type_brief)

let connection_type_list_of_yojson tree path =
  list_of_yojson connection_type_brief_of_yojson tree path

let list_connection_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     connection_types =
       option_of_yojson (value_for_key connection_type_list_of_yojson "ConnectionTypes") _list path;
   }
    : list_connection_types_response)

let list_connection_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_connection_types_request)

let column_statistics_task_run_id_list_of_yojson tree path =
  list_of_yojson hash_string_of_yojson tree path

let list_column_statistics_task_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     column_statistics_task_run_ids =
       option_of_yojson
         (value_for_key column_statistics_task_run_id_list_of_yojson "ColumnStatisticsTaskRunIds")
         _list path;
   }
    : list_column_statistics_task_runs_response)

let list_column_statistics_task_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : list_column_statistics_task_runs_request)

let blueprint_names_of_yojson tree path =
  list_of_yojson orchestration_name_string_of_yojson tree path

let list_blueprints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     blueprints = option_of_yojson (value_for_key blueprint_names_of_yojson "Blueprints") _list path;
   }
    : list_blueprints_response)

let list_blueprints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     max_results =
       option_of_yojson (value_for_key orchestration_page_size25_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_blueprints_request)

let asset_type_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key asset_type_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key asset_type_id_of_yojson "Id") _list path;
   }
    : asset_type_item)

let asset_type_item_list_of_yojson tree path = list_of_yojson asset_type_item_of_yojson tree path

let list_asset_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     items = option_of_yojson (value_for_key asset_type_item_list_of_yojson "Items") _list path;
   }
    : list_asset_types_response)

let list_asset_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : list_asset_types_request)

let limit_of_yojson = long_of_yojson

let last_crawl_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "CANCELLED" -> CANCELLED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "LastCrawlStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LastCrawlStatus")
     : last_crawl_status)
    : last_crawl_status)

let last_crawl_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     message_prefix =
       option_of_yojson (value_for_key message_prefix_of_yojson "MessagePrefix") _list path;
     log_stream = option_of_yojson (value_for_key log_stream_of_yojson "LogStream") _list path;
     log_group = option_of_yojson (value_for_key log_group_of_yojson "LogGroup") _list path;
     error_message =
       option_of_yojson (value_for_key description_string_of_yojson "ErrorMessage") _list path;
     status = option_of_yojson (value_for_key last_crawl_status_of_yojson "Status") _list path;
   }
    : last_crawl_info)

let blueprint_parameter_spec_of_yojson = string_of_yojson

let last_active_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blueprint_service_location =
       option_of_yojson
         (value_for_key generic_string_of_yojson "BlueprintServiceLocation")
         _list path;
     blueprint_location =
       option_of_yojson (value_for_key generic_string_of_yojson "BlueprintLocation") _list path;
     parameter_spec =
       option_of_yojson
         (value_for_key blueprint_parameter_spec_of_yojson "ParameterSpec")
         _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "LastModifiedOn") _list path;
     description =
       option_of_yojson (value_for_key generic512_char_string_of_yojson "Description") _list path;
   }
    : last_active_definition)

let language_of_yojson (tree : t) path =
  ((match tree with
    | `String "SCALA" -> SCALA
    | `String "PYTHON" -> PYTHON
    | `String value -> raise (deserialize_unknown_enum_value_error path "Language" value)
    | _ -> raise (deserialize_wrong_type_error path "Language")
     : language)
    : language)

let labels_of_yojson tree path = map_of_yojson name_string_of_yojson name_string_of_yojson tree path

let kms_key_not_accessible_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key integration_error_message_of_yojson "Message") _list path;
   }
    : kms_key_not_accessible_fault)

let json_classifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     json_path = value_for_key json_path_of_yojson "JsonPath" _list path;
     version = option_of_yojson (value_for_key version_id_of_yojson "Version") _list path;
     last_updated = option_of_yojson (value_for_key timestamp_of_yojson "LastUpdated") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : json_classifier)

let job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_name = option_of_yojson (value_for_key name_string_of_yojson "ProfileName") _list path;
     maintenance_window =
       option_of_yojson (value_for_key maintenance_window_of_yojson "MaintenanceWindow") _list path;
     source_control_details =
       option_of_yojson
         (value_for_key source_control_details_of_yojson "SourceControlDetails")
         _list path;
     execution_class =
       option_of_yojson (value_for_key execution_class_of_yojson "ExecutionClass") _list path;
     code_gen_configuration_nodes =
       option_of_yojson
         (value_for_key code_gen_configuration_nodes_of_yojson "CodeGenConfigurationNodes")
         _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     notification_property =
       option_of_yojson
         (value_for_key notification_property_of_yojson "NotificationProperty")
         _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     max_capacity =
       option_of_yojson (value_for_key nullable_double_of_yojson "MaxCapacity") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     allocated_capacity =
       option_of_yojson (value_for_key integer_value_of_yojson "AllocatedCapacity") _list path;
     max_retries = option_of_yojson (value_for_key max_retries_of_yojson "MaxRetries") _list path;
     connections =
       option_of_yojson (value_for_key connections_list_of_yojson "Connections") _list path;
     non_overridable_arguments =
       option_of_yojson (value_for_key generic_map_of_yojson "NonOverridableArguments") _list path;
     default_arguments =
       option_of_yojson (value_for_key generic_map_of_yojson "DefaultArguments") _list path;
     command = option_of_yojson (value_for_key job_command_of_yojson "Command") _list path;
     execution_property =
       option_of_yojson (value_for_key execution_property_of_yojson "ExecutionProperty") _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "LastModifiedOn") _list path;
     created_on = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedOn") _list path;
     role = option_of_yojson (value_for_key role_string_of_yojson "Role") _list path;
     log_uri = option_of_yojson (value_for_key uri_string_of_yojson "LogUri") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     job_run_queuing_enabled =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "JobRunQueuingEnabled") _list path;
     job_mode = option_of_yojson (value_for_key job_mode_of_yojson "JobMode") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : job)

let job_list_of_yojson tree path = list_of_yojson job_of_yojson tree path

let iterable_form_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     form_type_id = option_of_yojson (value_for_key form_type_id_of_yojson "FormTypeId") _list path;
   }
    : iterable_form_entry)

let iterable_form_key_of_yojson = string_of_yojson

let iterable_form_map_of_yojson tree path =
  map_of_yojson iterable_form_key_of_yojson iterable_form_entry_of_yojson tree path

let iterable_form_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachments =
       option_of_yojson (value_for_key asset_form_map_of_yojson "Attachments") _list path;
     forms = option_of_yojson (value_for_key asset_form_map_of_yojson "Forms") _list path;
     glossary_terms =
       option_of_yojson (value_for_key glossary_term_id_list_of_yojson "GlossaryTerms") _list path;
     item_name = option_of_yojson (value_for_key item_name_of_yojson "ItemName") _list path;
     item_id = option_of_yojson (value_for_key item_id_of_yojson "ItemId") _list path;
   }
    : iterable_form_item)

let iterable_form_item_list_of_yojson tree path =
  list_of_yojson iterable_form_item_of_yojson tree path

let item_identifier_list_of_yojson tree path = list_of_yojson item_identifier_of_yojson tree path
let item_error_message_of_yojson = string_of_yojson
let item_error_code_of_yojson = string_of_yojson

let item_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key item_error_message_of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key item_error_code_of_yojson "Code") _list path;
     item_identifier =
       option_of_yojson (value_for_key item_identifier_of_yojson "ItemIdentifier") _list path;
   }
    : item_error)

let item_error_list_of_yojson tree path = list_of_yojson item_error_of_yojson tree path
let is_version_valid_of_yojson = bool_of_yojson

let integration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_filter = option_of_yojson (value_for_key string2048_of_yojson "DataFilter") _list path;
     errors = option_of_yojson (value_for_key integration_error_list_of_yojson "Errors") _list path;
     integration_config =
       option_of_yojson (value_for_key integration_config_of_yojson "IntegrationConfig") _list path;
     create_time = value_for_key integration_timestamp_of_yojson "CreateTime" _list path;
     status = value_for_key integration_status_of_yojson "Status" _list path;
     tags = option_of_yojson (value_for_key integration_tags_list_of_yojson "Tags") _list path;
     additional_encryption_context =
       option_of_yojson
         (value_for_key integration_additional_encryption_context_map_of_yojson
            "AdditionalEncryptionContext")
         _list path;
     kms_key_id = option_of_yojson (value_for_key string2048_of_yojson "KmsKeyId") _list path;
     integration_arn = value_for_key string128_of_yojson "IntegrationArn" _list path;
     integration_name = value_for_key string128_of_yojson "IntegrationName" _list path;
     description =
       option_of_yojson (value_for_key integration_description_of_yojson "Description") _list path;
     target_arn = value_for_key string512_of_yojson "TargetArn" _list path;
     source_arn = value_for_key string512_of_yojson "SourceArn" _list path;
   }
    : integration)

let integrations_list_of_yojson tree path = list_of_yojson integration_of_yojson tree path

let integration_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key integration_error_message_of_yojson "Message") _list path;
   }
    : integration_quota_exceeded_fault)

let integration_filter_values_of_yojson tree path = list_of_yojson string128_of_yojson tree path

let integration_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values =
       option_of_yojson (value_for_key integration_filter_values_of_yojson "Values") _list path;
     name = option_of_yojson (value_for_key string128_of_yojson "Name") _list path;
   }
    : integration_filter)

let integration_filter_list_of_yojson tree path =
  list_of_yojson integration_filter_of_yojson tree path

let datapoint_inclusion_annotation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inclusion_annotation =
       option_of_yojson
         (value_for_key inclusion_annotation_value_of_yojson "InclusionAnnotation")
         _list path;
     statistic_id = option_of_yojson (value_for_key hash_string_of_yojson "StatisticId") _list path;
     profile_id = option_of_yojson (value_for_key hash_string_of_yojson "ProfileId") _list path;
   }
    : datapoint_inclusion_annotation)

let inclusion_annotation_list_of_yojson tree path =
  list_of_yojson datapoint_inclusion_annotation_of_yojson tree path

let inbound_integration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = option_of_yojson (value_for_key integration_error_list_of_yojson "Errors") _list path;
     integration_config =
       option_of_yojson (value_for_key integration_config_of_yojson "IntegrationConfig") _list path;
     create_time = value_for_key integration_timestamp_of_yojson "CreateTime" _list path;
     status = value_for_key integration_status_of_yojson "Status" _list path;
     integration_arn = value_for_key string128_of_yojson "IntegrationArn" _list path;
     target_arn = value_for_key string512_of_yojson "TargetArn" _list path;
     source_arn = value_for_key string512_of_yojson "SourceArn" _list path;
   }
    : inbound_integration)

let inbound_integrations_list_of_yojson tree path =
  list_of_yojson inbound_integration_of_yojson tree path

let import_catalog_to_glue_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let import_catalog_to_glue_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : import_catalog_to_glue_request)

let identity_center_instance_arn_of_yojson = string_of_yojson

let iceberg_optimization_properties_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
     orphan_file_deletion =
       option_of_yojson (value_for_key parameters_map_of_yojson "OrphanFileDeletion") _list path;
     retention = option_of_yojson (value_for_key parameters_map_of_yojson "Retention") _list path;
     compaction = option_of_yojson (value_for_key parameters_map_of_yojson "Compaction") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
   }
    : iceberg_optimization_properties_output)

let grok_classifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_patterns =
       option_of_yojson (value_for_key custom_patterns_of_yojson "CustomPatterns") _list path;
     grok_pattern = value_for_key grok_pattern_of_yojson "GrokPattern" _list path;
     version = option_of_yojson (value_for_key version_id_of_yojson "Version") _list path;
     last_updated = option_of_yojson (value_for_key timestamp_of_yojson "LastUpdated") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     classification = value_for_key classification_of_yojson "Classification" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : grok_classifier)

let glue_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SESSION" -> SESSION
    | `String "JOB" -> JOB
    | `String value -> raise (deserialize_unknown_enum_value_error path "GlueResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "GlueResourceType")
     : glue_resource_type)
    : glue_resource_type)

let glue_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_time = option_of_yojson (value_for_key timestamp_of_yojson "UpdateTime") _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "CreateTime") _list path;
     policy_hash = option_of_yojson (value_for_key hash_string_of_yojson "PolicyHash") _list path;
     policy_in_json =
       option_of_yojson (value_for_key policy_json_string_of_yojson "PolicyInJson") _list path;
   }
    : glue_policy)

let get_workflow_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     runs = option_of_yojson (value_for_key workflow_runs_of_yojson "Runs") _list path;
   }
    : get_workflow_runs_response)

let get_workflow_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     include_graph =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeGraph") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : get_workflow_runs_request)

let get_workflow_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run = option_of_yojson (value_for_key workflow_run_of_yojson "Run") _list path }
    : get_workflow_run_response)

let get_workflow_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_graph =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeGraph") _list path;
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : get_workflow_run_request)

let get_workflow_run_properties_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_properties =
       option_of_yojson (value_for_key workflow_run_properties_of_yojson "RunProperties") _list path;
   }
    : get_workflow_run_properties_response)

let get_workflow_run_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : get_workflow_run_properties_request)

let get_workflow_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workflow = option_of_yojson (value_for_key workflow_of_yojson "Workflow") _list path }
    : get_workflow_response)

let get_workflow_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_graph =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeGraph") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : get_workflow_request)

let get_user_defined_functions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     user_defined_functions =
       option_of_yojson
         (value_for_key user_defined_function_list_of_yojson "UserDefinedFunctions")
         _list path;
   }
    : get_user_defined_functions_response)

let catalog_getter_page_size_of_yojson = int_of_yojson

let get_user_defined_functions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key catalog_getter_page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     function_type =
       option_of_yojson (value_for_key function_type_of_yojson "FunctionType") _list path;
     pattern = value_for_key name_string_of_yojson "Pattern" _list path;
     database_name =
       option_of_yojson (value_for_key name_string_of_yojson "DatabaseName") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_user_defined_functions_request)

let get_user_defined_function_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_defined_function =
       option_of_yojson
         (value_for_key user_defined_function_of_yojson "UserDefinedFunction")
         _list path;
   }
    : get_user_defined_function_response)

let get_user_defined_function_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     function_name = value_for_key name_string_of_yojson "FunctionName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_user_defined_function_request)

let get_usage_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "LastModifiedOn") _list path;
     created_on = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedOn") _list path;
     configuration =
       option_of_yojson (value_for_key profile_configuration_of_yojson "Configuration") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : get_usage_profile_response)

let get_usage_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : get_usage_profile_request)

let column_row_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     row_filter_expression =
       option_of_yojson (value_for_key predicate_string_of_yojson "RowFilterExpression") _list path;
     column_name = option_of_yojson (value_for_key name_string_of_yojson "ColumnName") _list path;
   }
    : column_row_filter)

let column_row_filter_list_of_yojson tree path =
  list_of_yojson column_row_filter_of_yojson tree path

let get_unfiltered_table_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     row_filter = option_of_yojson (value_for_key predicate_string_of_yojson "RowFilter") _list path;
     permissions =
       option_of_yojson (value_for_key permission_list_of_yojson "Permissions") _list path;
     is_protected = option_of_yojson (value_for_key boolean__of_yojson "IsProtected") _list path;
     resource_arn = option_of_yojson (value_for_key arn_string_of_yojson "ResourceArn") _list path;
     is_materialized_view =
       option_of_yojson (value_for_key boolean__of_yojson "IsMaterializedView") _list path;
     is_multi_dialect_view =
       option_of_yojson (value_for_key boolean__of_yojson "IsMultiDialectView") _list path;
     query_authorization_id =
       option_of_yojson (value_for_key hash_string_of_yojson "QueryAuthorizationId") _list path;
     cell_filters =
       option_of_yojson (value_for_key column_row_filter_list_of_yojson "CellFilters") _list path;
     is_registered_with_lake_formation =
       option_of_yojson
         (value_for_key boolean__of_yojson "IsRegisteredWithLakeFormation")
         _list path;
     authorized_columns =
       option_of_yojson (value_for_key name_string_list_of_yojson "AuthorizedColumns") _list path;
     table = option_of_yojson (value_for_key table_of_yojson "Table") _list path;
   }
    : get_unfiltered_table_metadata_response)

let audit_context_string_of_yojson = string_of_yojson

let audit_column_names_list_of_yojson tree path =
  list_of_yojson column_name_string_of_yojson tree path

let audit_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     all_columns_requested =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "AllColumnsRequested") _list path;
     requested_columns =
       option_of_yojson
         (value_for_key audit_column_names_list_of_yojson "RequestedColumns")
         _list path;
     additional_audit_context =
       option_of_yojson
         (value_for_key audit_context_string_of_yojson "AdditionalAuditContext")
         _list path;
   }
    : audit_context)

let get_unfiltered_table_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_session_context =
       option_of_yojson
         (value_for_key query_session_context_of_yojson "QuerySessionContext")
         _list path;
     permissions =
       option_of_yojson (value_for_key permission_list_of_yojson "Permissions") _list path;
     supported_dialect =
       option_of_yojson (value_for_key supported_dialect_of_yojson "SupportedDialect") _list path;
     root_resource_arn =
       option_of_yojson (value_for_key arn_string_of_yojson "RootResourceArn") _list path;
     parent_resource_arn =
       option_of_yojson (value_for_key arn_string_of_yojson "ParentResourceArn") _list path;
     supported_permission_types =
       value_for_key permission_type_list_of_yojson "SupportedPermissionTypes" _list path;
     audit_context =
       option_of_yojson (value_for_key audit_context_of_yojson "AuditContext") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id = value_for_key catalog_id_string_of_yojson "CatalogId" _list path;
     region = option_of_yojson (value_for_key value_string_of_yojson "Region") _list path;
   }
    : get_unfiltered_table_metadata_request)

let get_unfiltered_partitions_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     unfiltered_partitions =
       option_of_yojson
         (value_for_key unfiltered_partition_list_of_yojson "UnfilteredPartitions")
         _list path;
   }
    : get_unfiltered_partitions_metadata_response)

let get_unfiltered_partitions_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_session_context =
       option_of_yojson
         (value_for_key query_session_context_of_yojson "QuerySessionContext")
         _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     segment = option_of_yojson (value_for_key segment_of_yojson "Segment") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     supported_permission_types =
       value_for_key permission_type_list_of_yojson "SupportedPermissionTypes" _list path;
     audit_context =
       option_of_yojson (value_for_key audit_context_of_yojson "AuditContext") _list path;
     expression =
       option_of_yojson (value_for_key predicate_string_of_yojson "Expression") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id = value_for_key catalog_id_string_of_yojson "CatalogId" _list path;
     region = option_of_yojson (value_for_key value_string_of_yojson "Region") _list path;
   }
    : get_unfiltered_partitions_metadata_request)

let get_unfiltered_partition_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_registered_with_lake_formation =
       option_of_yojson
         (value_for_key boolean__of_yojson "IsRegisteredWithLakeFormation")
         _list path;
     authorized_columns =
       option_of_yojson (value_for_key name_string_list_of_yojson "AuthorizedColumns") _list path;
     partition = option_of_yojson (value_for_key partition_of_yojson "Partition") _list path;
   }
    : get_unfiltered_partition_metadata_response)

let get_unfiltered_partition_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_session_context =
       option_of_yojson
         (value_for_key query_session_context_of_yojson "QuerySessionContext")
         _list path;
     supported_permission_types =
       value_for_key permission_type_list_of_yojson "SupportedPermissionTypes" _list path;
     audit_context =
       option_of_yojson (value_for_key audit_context_of_yojson "AuditContext") _list path;
     partition_values = value_for_key value_string_list_of_yojson "PartitionValues" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id = value_for_key catalog_id_string_of_yojson "CatalogId" _list path;
     region = option_of_yojson (value_for_key value_string_of_yojson "Region") _list path;
   }
    : get_unfiltered_partition_metadata_request)

let get_triggers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     triggers = option_of_yojson (value_for_key trigger_list_of_yojson "Triggers") _list path;
   }
    : get_triggers_response)

let get_triggers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key orchestration_page_size200_of_yojson "MaxResults") _list path;
     dependent_job_name =
       option_of_yojson (value_for_key name_string_of_yojson "DependentJobName") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : get_triggers_request)

let get_trigger_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trigger = option_of_yojson (value_for_key trigger_of_yojson "Trigger") _list path }
    : get_trigger_response)

let get_trigger_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : get_trigger_request)

let get_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path }
    : get_tags_response)

let get_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key glue_resource_arn_of_yojson "ResourceArn" _list path }
    : get_tags_request)

let get_tables_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     table_list = option_of_yojson (value_for_key table_list_of_yojson "TableList") _list path;
   }
    : get_tables_response)

let filter_string_of_yojson = string_of_yojson

let get_tables_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes_to_get =
       option_of_yojson (value_for_key table_attributes_list_of_yojson "AttributesToGet") _list path;
     include_status_details =
       option_of_yojson (value_for_key boolean_nullable_of_yojson "IncludeStatusDetails") _list path;
     audit_context =
       option_of_yojson (value_for_key audit_context_of_yojson "AuditContext") _list path;
     query_as_of_time =
       option_of_yojson (value_for_key timestamp_of_yojson "QueryAsOfTime") _list path;
     transaction_id =
       option_of_yojson (value_for_key transaction_id_string_of_yojson "TransactionId") _list path;
     max_results =
       option_of_yojson (value_for_key catalog_getter_page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     expression = option_of_yojson (value_for_key filter_string_of_yojson "Expression") _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_tables_request)

let get_table_versions_list_of_yojson tree path = list_of_yojson table_version_of_yojson tree path

let get_table_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     table_versions =
       option_of_yojson (value_for_key get_table_versions_list_of_yojson "TableVersions") _list path;
   }
    : get_table_versions_response)

let get_table_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_context =
       option_of_yojson (value_for_key audit_context_of_yojson "AuditContext") _list path;
     max_results =
       option_of_yojson (value_for_key catalog_getter_page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_table_versions_request)

let get_table_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_version =
       option_of_yojson (value_for_key table_version_of_yojson "TableVersion") _list path;
   }
    : get_table_version_response)

let get_table_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_context =
       option_of_yojson (value_for_key audit_context_of_yojson "AuditContext") _list path;
     version_id = option_of_yojson (value_for_key version_string_of_yojson "VersionId") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_table_version_request)

let get_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table = option_of_yojson (value_for_key table_of_yojson "Table") _list path }
    : get_table_response)

let get_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes_to_get =
       option_of_yojson (value_for_key table_attributes_list_of_yojson "AttributesToGet") _list path;
     include_status_details =
       option_of_yojson (value_for_key boolean_nullable_of_yojson "IncludeStatusDetails") _list path;
     audit_context =
       option_of_yojson (value_for_key audit_context_of_yojson "AuditContext") _list path;
     query_as_of_time =
       option_of_yojson (value_for_key timestamp_of_yojson "QueryAsOfTime") _list path;
     transaction_id =
       option_of_yojson (value_for_key transaction_id_string_of_yojson "TransactionId") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_table_request)

let get_table_optimizer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_optimizer =
       option_of_yojson (value_for_key table_optimizer_of_yojson "TableOptimizer") _list path;
     table_name = option_of_yojson (value_for_key name_string_of_yojson "TableName") _list path;
     database_name =
       option_of_yojson (value_for_key name_string_of_yojson "DatabaseName") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_table_optimizer_response)

let get_table_optimizer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key table_optimizer_type_of_yojson "Type" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id = value_for_key catalog_id_string_of_yojson "CatalogId" _list path;
   }
    : get_table_optimizer_request)

let get_statement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ statement = option_of_yojson (value_for_key statement_of_yojson "Statement") _list path }
    : get_statement_response)

let get_statement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_origin =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "RequestOrigin")
         _list path;
     id = value_for_key integer_value_of_yojson "Id" _list path;
     session_id = value_for_key name_string_of_yojson "SessionId" _list path;
   }
    : get_statement_request)

let get_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session = option_of_yojson (value_for_key session_of_yojson "Session") _list path }
    : get_session_response)

let get_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_origin =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "RequestOrigin")
         _list path;
     id = value_for_key name_string_of_yojson "Id" _list path;
   }
    : get_session_request)

let get_session_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ spark_connect = value_for_key session_endpoint_of_yojson "SparkConnect" _list path }
    : get_session_endpoint_response)

let get_session_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key name_string_of_yojson "SessionId" _list path }
    : get_session_endpoint_request)

let get_security_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     security_configurations =
       option_of_yojson
         (value_for_key security_configuration_list_of_yojson "SecurityConfigurations")
         _list path;
   }
    : get_security_configurations_response)

let get_security_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : get_security_configurations_request)

let get_security_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_configuration =
       option_of_yojson
         (value_for_key security_configuration_of_yojson "SecurityConfiguration")
         _list path;
   }
    : get_security_configuration_response)

let get_security_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path }
    : get_security_configuration_request)

let get_schema_versions_diff_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ diff = option_of_yojson (value_for_key schema_definition_diff_of_yojson "Diff") _list path }
    : get_schema_versions_diff_response)

let get_schema_versions_diff_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_diff_type = value_for_key schema_diff_type_of_yojson "SchemaDiffType" _list path;
     second_schema_version_number =
       value_for_key schema_version_number_of_yojson "SecondSchemaVersionNumber" _list path;
     first_schema_version_number =
       value_for_key schema_version_number_of_yojson "FirstSchemaVersionNumber" _list path;
     schema_id = value_for_key schema_id_of_yojson "SchemaId" _list path;
   }
    : get_schema_versions_diff_input)

let data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROTOBUF" -> PROTOBUF
    | `String "JSON" -> JSON
    | `String "AVRO" -> AVRO
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "DataFormat")
     : data_format)
    : data_format)

let get_schema_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_time =
       option_of_yojson (value_for_key created_timestamp_of_yojson "CreatedTime") _list path;
     status = option_of_yojson (value_for_key schema_version_status_of_yojson "Status") _list path;
     version_number =
       option_of_yojson (value_for_key version_long_number_of_yojson "VersionNumber") _list path;
     schema_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "SchemaArn") _list path;
     data_format = option_of_yojson (value_for_key data_format_of_yojson "DataFormat") _list path;
     schema_definition =
       option_of_yojson
         (value_for_key schema_definition_string_of_yojson "SchemaDefinition")
         _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
   }
    : get_schema_version_response)

let get_schema_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_version_number =
       option_of_yojson
         (value_for_key schema_version_number_of_yojson "SchemaVersionNumber")
         _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
     schema_id = option_of_yojson (value_for_key schema_id_of_yojson "SchemaId") _list path;
   }
    : get_schema_version_input)

let get_schema_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_time =
       option_of_yojson (value_for_key updated_timestamp_of_yojson "UpdatedTime") _list path;
     created_time =
       option_of_yojson (value_for_key created_timestamp_of_yojson "CreatedTime") _list path;
     schema_status =
       option_of_yojson (value_for_key schema_status_of_yojson "SchemaStatus") _list path;
     next_schema_version =
       option_of_yojson (value_for_key version_long_number_of_yojson "NextSchemaVersion") _list path;
     latest_schema_version =
       option_of_yojson
         (value_for_key version_long_number_of_yojson "LatestSchemaVersion")
         _list path;
     schema_checkpoint =
       option_of_yojson
         (value_for_key schema_checkpoint_number_of_yojson "SchemaCheckpoint")
         _list path;
     compatibility =
       option_of_yojson (value_for_key compatibility_of_yojson "Compatibility") _list path;
     data_format = option_of_yojson (value_for_key data_format_of_yojson "DataFormat") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     schema_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "SchemaArn") _list path;
     schema_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "SchemaName")
         _list path;
     registry_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "RegistryArn") _list path;
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
   }
    : get_schema_response)

let get_schema_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ schema_id = value_for_key schema_id_of_yojson "SchemaId" _list path } : get_schema_input)

let get_schema_by_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_time =
       option_of_yojson (value_for_key created_timestamp_of_yojson "CreatedTime") _list path;
     status = option_of_yojson (value_for_key schema_version_status_of_yojson "Status") _list path;
     data_format = option_of_yojson (value_for_key data_format_of_yojson "DataFormat") _list path;
     schema_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "SchemaArn") _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
   }
    : get_schema_by_definition_response)

let get_schema_by_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_definition =
       value_for_key schema_definition_string_of_yojson "SchemaDefinition" _list path;
     schema_id = value_for_key schema_id_of_yojson "SchemaId" _list path;
   }
    : get_schema_by_definition_input)

let get_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_time = option_of_yojson (value_for_key timestamp_of_yojson "UpdateTime") _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "CreateTime") _list path;
     policy_hash = option_of_yojson (value_for_key hash_string_of_yojson "PolicyHash") _list path;
     policy_in_json =
       option_of_yojson (value_for_key policy_json_string_of_yojson "PolicyInJson") _list path;
   }
    : get_resource_policy_response)

let get_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "ResourceArn") _list path;
   }
    : get_resource_policy_request)

let get_resource_policies_response_list_of_yojson tree path =
  list_of_yojson glue_policy_of_yojson tree path

let get_resource_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     get_resource_policies_response_list =
       option_of_yojson
         (value_for_key get_resource_policies_response_list_of_yojson
            "GetResourcePoliciesResponseList")
         _list path;
   }
    : get_resource_policies_response)

let get_resource_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : get_resource_policies_request)

let get_registry_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_time =
       option_of_yojson (value_for_key updated_timestamp_of_yojson "UpdatedTime") _list path;
     created_time =
       option_of_yojson (value_for_key created_timestamp_of_yojson "CreatedTime") _list path;
     status = option_of_yojson (value_for_key registry_status_of_yojson "Status") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     registry_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "RegistryArn") _list path;
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
   }
    : get_registry_response)

let get_registry_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ registry_id = value_for_key registry_id_of_yojson "RegistryId" _list path }
    : get_registry_input)

let get_plan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scala_code = option_of_yojson (value_for_key scala_code_of_yojson "ScalaCode") _list path;
     python_script =
       option_of_yojson (value_for_key python_script_of_yojson "PythonScript") _list path;
   }
    : get_plan_response)

let catalog_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
   }
    : catalog_entry)

let catalog_entries_of_yojson tree path = list_of_yojson catalog_entry_of_yojson tree path

let additional_plan_options_map_of_yojson tree path =
  map_of_yojson generic_string_of_yojson generic_string_of_yojson tree path

let get_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_plan_options_map =
       option_of_yojson
         (value_for_key additional_plan_options_map_of_yojson "AdditionalPlanOptionsMap")
         _list path;
     language = option_of_yojson (value_for_key language_of_yojson "Language") _list path;
     location = option_of_yojson (value_for_key location_of_yojson "Location") _list path;
     sinks = option_of_yojson (value_for_key catalog_entries_of_yojson "Sinks") _list path;
     source = value_for_key catalog_entry_of_yojson "Source" _list path;
     mapping = value_for_key mapping_list_of_yojson "Mapping" _list path;
   }
    : get_plan_request)

let get_partitions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     partitions = option_of_yojson (value_for_key partition_list_of_yojson "Partitions") _list path;
   }
    : get_partitions_response)

let get_partitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_context =
       option_of_yojson (value_for_key audit_context_of_yojson "AuditContext") _list path;
     query_as_of_time =
       option_of_yojson (value_for_key timestamp_of_yojson "QueryAsOfTime") _list path;
     transaction_id =
       option_of_yojson (value_for_key transaction_id_string_of_yojson "TransactionId") _list path;
     exclude_column_schema =
       option_of_yojson (value_for_key boolean_nullable_of_yojson "ExcludeColumnSchema") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     segment = option_of_yojson (value_for_key segment_of_yojson "Segment") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     expression =
       option_of_yojson (value_for_key predicate_string_of_yojson "Expression") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_partitions_request)

let get_partition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ partition = option_of_yojson (value_for_key partition_of_yojson "Partition") _list path }
    : get_partition_response)

let get_partition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_context =
       option_of_yojson (value_for_key audit_context_of_yojson "AuditContext") _list path;
     partition_values = value_for_key value_string_list_of_yojson "PartitionValues" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_partition_request)

let get_partition_indexes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     partition_index_descriptor_list =
       option_of_yojson
         (value_for_key partition_index_descriptor_list_of_yojson "PartitionIndexDescriptorList")
         _list path;
   }
    : get_partition_indexes_response)

let get_partition_indexes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_partition_indexes_request)

let get_materialized_view_refresh_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     materialized_view_refresh_task_run =
       option_of_yojson
         (value_for_key materialized_view_refresh_task_run_of_yojson
            "MaterializedViewRefreshTaskRun")
         _list path;
   }
    : get_materialized_view_refresh_task_run_response)

let get_materialized_view_refresh_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     materialized_view_refresh_task_run_id =
       value_for_key uui_dv4_of_yojson "MaterializedViewRefreshTaskRunId" _list path;
     catalog_id = value_for_key name_string_of_yojson "CatalogId" _list path;
   }
    : get_materialized_view_refresh_task_run_request)

let get_mapping_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ mapping = value_for_key mapping_list_of_yojson "Mapping" _list path } : get_mapping_response)

let get_mapping_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location = option_of_yojson (value_for_key location_of_yojson "Location") _list path;
     sinks = option_of_yojson (value_for_key catalog_entries_of_yojson "Sinks") _list path;
     source = value_for_key catalog_entry_of_yojson "Source" _list path;
   }
    : get_mapping_request)

let get_ml_transforms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     transforms = value_for_key transform_list_of_yojson "Transforms" _list path;
   }
    : get_ml_transforms_response)

let get_ml_transforms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort = option_of_yojson (value_for_key transform_sort_criteria_of_yojson "Sort") _list path;
     filter =
       option_of_yojson (value_for_key transform_filter_criteria_of_yojson "Filter") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : get_ml_transforms_request)

let get_ml_transform_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transform_encryption =
       option_of_yojson
         (value_for_key transform_encryption_of_yojson "TransformEncryption")
         _list path;
     max_retries =
       option_of_yojson (value_for_key nullable_integer_of_yojson "MaxRetries") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     max_capacity =
       option_of_yojson (value_for_key nullable_double_of_yojson "MaxCapacity") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     role = option_of_yojson (value_for_key role_string_of_yojson "Role") _list path;
     schema = option_of_yojson (value_for_key transform_schema_of_yojson "Schema") _list path;
     label_count = option_of_yojson (value_for_key label_count_of_yojson "LabelCount") _list path;
     evaluation_metrics =
       option_of_yojson (value_for_key evaluation_metrics_of_yojson "EvaluationMetrics") _list path;
     parameters =
       option_of_yojson (value_for_key transform_parameters_of_yojson "Parameters") _list path;
     input_record_tables =
       option_of_yojson (value_for_key glue_tables_of_yojson "InputRecordTables") _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedOn") _list path;
     created_on = option_of_yojson (value_for_key timestamp_of_yojson "CreatedOn") _list path;
     status = option_of_yojson (value_for_key transform_status_type_of_yojson "Status") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
     transform_id = option_of_yojson (value_for_key hash_string_of_yojson "TransformId") _list path;
   }
    : get_ml_transform_response)

let get_ml_transform_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ transform_id = value_for_key hash_string_of_yojson "TransformId" _list path }
    : get_ml_transform_request)

let get_ml_task_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     task_runs = option_of_yojson (value_for_key task_run_list_of_yojson "TaskRuns") _list path;
   }
    : get_ml_task_runs_response)

let get_ml_task_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort = option_of_yojson (value_for_key task_run_sort_criteria_of_yojson "Sort") _list path;
     filter =
       option_of_yojson (value_for_key task_run_filter_criteria_of_yojson "Filter") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     transform_id = value_for_key hash_string_of_yojson "TransformId" _list path;
   }
    : get_ml_task_runs_request)

let get_ml_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_time =
       option_of_yojson (value_for_key execution_time_of_yojson "ExecutionTime") _list path;
     completed_on = option_of_yojson (value_for_key timestamp_of_yojson "CompletedOn") _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedOn") _list path;
     started_on = option_of_yojson (value_for_key timestamp_of_yojson "StartedOn") _list path;
     error_string =
       option_of_yojson (value_for_key generic_string_of_yojson "ErrorString") _list path;
     properties =
       option_of_yojson (value_for_key task_run_properties_of_yojson "Properties") _list path;
     log_group_name =
       option_of_yojson (value_for_key generic_string_of_yojson "LogGroupName") _list path;
     status = option_of_yojson (value_for_key task_status_type_of_yojson "Status") _list path;
     task_run_id = option_of_yojson (value_for_key hash_string_of_yojson "TaskRunId") _list path;
     transform_id = option_of_yojson (value_for_key hash_string_of_yojson "TransformId") _list path;
   }
    : get_ml_task_run_response)

let get_ml_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_run_id = value_for_key hash_string_of_yojson "TaskRunId" _list path;
     transform_id = value_for_key hash_string_of_yojson "TransformId" _list path;
   }
    : get_ml_task_run_request)

let get_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     jobs = option_of_yojson (value_for_key job_list_of_yojson "Jobs") _list path;
   }
    : get_jobs_response)

let get_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : get_jobs_request)

let get_job_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     job_runs = option_of_yojson (value_for_key job_run_list_of_yojson "JobRuns") _list path;
   }
    : get_job_runs_response)

let get_job_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key orchestration_page_size200_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     job_name = value_for_key name_string_of_yojson "JobName" _list path;
   }
    : get_job_runs_request)

let get_job_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_run = option_of_yojson (value_for_key job_run_of_yojson "JobRun") _list path }
    : get_job_run_response)

let get_job_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predecessors_included =
       option_of_yojson (value_for_key boolean_value_of_yojson "PredecessorsIncluded") _list path;
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
     job_name = value_for_key name_string_of_yojson "JobName" _list path;
   }
    : get_job_run_request)

let get_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job = option_of_yojson (value_for_key job_of_yojson "Job") _list path } : get_job_response)

let get_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_name = value_for_key name_string_of_yojson "JobName" _list path } : get_job_request)

let get_job_bookmark_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_bookmark_entry =
       option_of_yojson (value_for_key job_bookmark_entry_of_yojson "JobBookmarkEntry") _list path;
   }
    : get_job_bookmark_response)

let get_job_bookmark_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_id = option_of_yojson (value_for_key run_id_of_yojson "RunId") _list path;
     job_name = value_for_key job_name_of_yojson "JobName" _list path;
   }
    : get_job_bookmark_request)

let get_integration_table_properties_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_table_config =
       option_of_yojson (value_for_key target_table_config_of_yojson "TargetTableConfig") _list path;
     source_table_config =
       option_of_yojson (value_for_key source_table_config_of_yojson "SourceTableConfig") _list path;
     table_name = option_of_yojson (value_for_key string128_of_yojson "TableName") _list path;
     resource_arn = option_of_yojson (value_for_key string512_of_yojson "ResourceArn") _list path;
   }
    : get_integration_table_properties_response)

let get_integration_table_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key string128_of_yojson "TableName" _list path;
     resource_arn = value_for_key string512_of_yojson "ResourceArn" _list path;
   }
    : get_integration_table_properties_request)

let get_integration_resource_property_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_processing_properties =
       option_of_yojson
         (value_for_key target_processing_properties_of_yojson "TargetProcessingProperties")
         _list path;
     source_processing_properties =
       option_of_yojson
         (value_for_key source_processing_properties_of_yojson "SourceProcessingProperties")
         _list path;
     resource_property_arn =
       option_of_yojson (value_for_key string512_of_yojson "ResourcePropertyArn") _list path;
     resource_arn = option_of_yojson (value_for_key string512_of_yojson "ResourceArn") _list path;
   }
    : get_integration_resource_property_response)

let get_integration_resource_property_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key string512_of_yojson "ResourceArn" _list path }
    : get_integration_resource_property_request)

let application_arn_of_yojson = string_of_yojson

let get_glue_identity_center_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_background_sessions_enabled =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "UserBackgroundSessionsEnabled")
         _list path;
     scopes =
       option_of_yojson (value_for_key orchestration_string_list_of_yojson "Scopes") _list path;
     instance_arn =
       option_of_yojson
         (value_for_key identity_center_instance_arn_of_yojson "InstanceArn")
         _list path;
     application_arn =
       option_of_yojson (value_for_key application_arn_of_yojson "ApplicationArn") _list path;
   }
    : get_glue_identity_center_configuration_response)

let get_glue_identity_center_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_glossary_term_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     long_description =
       option_of_yojson
         (value_for_key glossary_long_description_of_yojson "LongDescription")
         _list path;
     short_description =
       option_of_yojson
         (value_for_key glossary_short_description_of_yojson "ShortDescription")
         _list path;
     name = option_of_yojson (value_for_key glossary_term_name_of_yojson "Name") _list path;
     glossary_id = option_of_yojson (value_for_key glossary_id_of_yojson "GlossaryId") _list path;
     id = option_of_yojson (value_for_key glossary_term_id_of_yojson "Id") _list path;
   }
    : get_glossary_term_response)

let get_glossary_term_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key glossary_term_id_of_yojson "Identifier" _list path }
    : get_glossary_term_request)

let get_glossary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key metadata_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key glossary_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key glossary_id_of_yojson "Id") _list path;
   }
    : get_glossary_response)

let get_glossary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key glossary_id_of_yojson "Identifier" _list path }
    : get_glossary_request)

let get_form_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema = option_of_yojson (value_for_key form_type_schema_of_yojson "Schema") _list path;
     name = option_of_yojson (value_for_key form_type_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key form_type_id_of_yojson "Id") _list path;
   }
    : get_form_type_response)

let get_form_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key form_type_id_of_yojson "Identifier" _list path }
    : get_form_type_request)

let get_entity_records_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     records = option_of_yojson (value_for_key records_of_yojson "Records") _list path;
   }
    : get_entity_records_response)

let connection_options_of_yojson tree path =
  map_of_yojson option_key_of_yojson option_value_of_yojson tree path

let filter_predicate_of_yojson = string_of_yojson

let get_entity_records_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selected_fields =
       option_of_yojson (value_for_key selected_fields_of_yojson "SelectedFields") _list path;
     order_by =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OrderBy")
         _list path;
     limit = value_for_key limit_of_yojson "Limit" _list path;
     filter_predicate =
       option_of_yojson (value_for_key filter_predicate_of_yojson "FilterPredicate") _list path;
     connection_options =
       option_of_yojson (value_for_key connection_options_of_yojson "ConnectionOptions") _list path;
     data_store_api_version =
       option_of_yojson (value_for_key api_version_of_yojson "DataStoreApiVersion") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     entity_name = value_for_key entity_name_of_yojson "EntityName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
     connection_name =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionName") _list path;
   }
    : get_entity_records_request)

let dev_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arguments = option_of_yojson (value_for_key map_value_of_yojson "Arguments") _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     public_keys =
       option_of_yojson (value_for_key public_keys_list_of_yojson "PublicKeys") _list path;
     public_key = option_of_yojson (value_for_key generic_string_of_yojson "PublicKey") _list path;
     last_modified_timestamp =
       option_of_yojson (value_for_key timestamp_value_of_yojson "LastModifiedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedTimestamp") _list path;
     last_update_status =
       option_of_yojson (value_for_key generic_string_of_yojson "LastUpdateStatus") _list path;
     failure_reason =
       option_of_yojson (value_for_key generic_string_of_yojson "FailureReason") _list path;
     extra_jars_s3_path =
       option_of_yojson (value_for_key generic_string_of_yojson "ExtraJarsS3Path") _list path;
     extra_python_libs_s3_path =
       option_of_yojson (value_for_key generic_string_of_yojson "ExtraPythonLibsS3Path") _list path;
     vpc_id = option_of_yojson (value_for_key generic_string_of_yojson "VpcId") _list path;
     availability_zone =
       option_of_yojson (value_for_key generic_string_of_yojson "AvailabilityZone") _list path;
     number_of_nodes =
       option_of_yojson (value_for_key integer_value_of_yojson "NumberOfNodes") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     status = option_of_yojson (value_for_key generic_string_of_yojson "Status") _list path;
     public_address =
       option_of_yojson (value_for_key generic_string_of_yojson "PublicAddress") _list path;
     zeppelin_remote_spark_interpreter_port =
       option_of_yojson
         (value_for_key integer_value_of_yojson "ZeppelinRemoteSparkInterpreterPort")
         _list path;
     private_address =
       option_of_yojson (value_for_key generic_string_of_yojson "PrivateAddress") _list path;
     yarn_endpoint_address =
       option_of_yojson (value_for_key generic_string_of_yojson "YarnEndpointAddress") _list path;
     subnet_id = option_of_yojson (value_for_key generic_string_of_yojson "SubnetId") _list path;
     security_group_ids =
       option_of_yojson (value_for_key string_list_of_yojson "SecurityGroupIds") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     endpoint_name =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointName") _list path;
   }
    : dev_endpoint)

let dev_endpoint_list_of_yojson tree path = list_of_yojson dev_endpoint_of_yojson tree path

let get_dev_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     dev_endpoints =
       option_of_yojson (value_for_key dev_endpoint_list_of_yojson "DevEndpoints") _list path;
   }
    : get_dev_endpoints_response)

let get_dev_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : get_dev_endpoints_request)

let get_dev_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dev_endpoint = option_of_yojson (value_for_key dev_endpoint_of_yojson "DevEndpoint") _list path;
   }
    : get_dev_endpoint_response)

let get_dev_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint_name = value_for_key generic_string_of_yojson "EndpointName" _list path }
    : get_dev_endpoint_request)

let code_gen_identifier_of_yojson = string_of_yojson
let code_gen_node_type_of_yojson = string_of_yojson

let code_gen_node_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     line_number = option_of_yojson (value_for_key integer_of_yojson "LineNumber") _list path;
     args = value_for_key code_gen_node_args_of_yojson "Args" _list path;
     node_type = value_for_key code_gen_node_type_of_yojson "NodeType" _list path;
     id = value_for_key code_gen_identifier_of_yojson "Id" _list path;
   }
    : code_gen_node)

let dag_nodes_of_yojson tree path = list_of_yojson code_gen_node_of_yojson tree path

let code_gen_edge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_parameter =
       option_of_yojson (value_for_key code_gen_arg_name_of_yojson "TargetParameter") _list path;
     target = value_for_key code_gen_identifier_of_yojson "Target" _list path;
     source = value_for_key code_gen_identifier_of_yojson "Source" _list path;
   }
    : code_gen_edge)

let dag_edges_of_yojson tree path = list_of_yojson code_gen_edge_of_yojson tree path

let get_dataflow_graph_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dag_edges = option_of_yojson (value_for_key dag_edges_of_yojson "DagEdges") _list path;
     dag_nodes = option_of_yojson (value_for_key dag_nodes_of_yojson "DagNodes") _list path;
   }
    : get_dataflow_graph_response)

let get_dataflow_graph_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     python_script =
       option_of_yojson (value_for_key python_script_of_yojson "PythonScript") _list path;
   }
    : get_dataflow_graph_request)

let database_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     federated_database =
       option_of_yojson (value_for_key federated_database_of_yojson "FederatedDatabase") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
     target_database =
       option_of_yojson (value_for_key database_identifier_of_yojson "TargetDatabase") _list path;
     create_table_default_permissions =
       option_of_yojson
         (value_for_key principal_permissions_list_of_yojson "CreateTableDefaultPermissions")
         _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "CreateTime") _list path;
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     location_uri = option_of_yojson (value_for_key ur_i_of_yojson "LocationUri") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : database)

let database_list_of_yojson tree path = list_of_yojson database_of_yojson tree path

let get_databases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     database_list = value_for_key database_list_of_yojson "DatabaseList" _list path;
   }
    : get_databases_response)

let database_attributes_of_yojson (tree : t) path =
  ((match tree with
    | `String "TARGET_DATABASE" -> TARGET_DATABASE
    | `String "NAME" -> NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatabaseAttributes" value)
    | _ -> raise (deserialize_wrong_type_error path "DatabaseAttributes")
     : database_attributes)
    : database_attributes)

let database_attributes_list_of_yojson tree path =
  list_of_yojson database_attributes_of_yojson tree path

let get_databases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes_to_get =
       option_of_yojson
         (value_for_key database_attributes_list_of_yojson "AttributesToGet")
         _list path;
     resource_share_type =
       option_of_yojson (value_for_key resource_share_type_of_yojson "ResourceShareType") _list path;
     max_results =
       option_of_yojson (value_for_key catalog_getter_page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_databases_request)

let get_database_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ database = option_of_yojson (value_for_key database_of_yojson "Database") _list path }
    : get_database_response)

let get_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_string_of_yojson "Name" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_database_request)

let get_data_quality_ruleset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_quality_security_configuration =
       option_of_yojson
         (value_for_key name_string_of_yojson "DataQualitySecurityConfiguration")
         _list path;
     recommendation_run_id =
       option_of_yojson (value_for_key hash_string_of_yojson "RecommendationRunId") _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedOn") _list path;
     created_on = option_of_yojson (value_for_key timestamp_of_yojson "CreatedOn") _list path;
     target_table =
       option_of_yojson (value_for_key data_quality_target_table_of_yojson "TargetTable") _list path;
     ruleset =
       option_of_yojson (value_for_key data_quality_ruleset_string_of_yojson "Ruleset") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : get_data_quality_ruleset_response)

let get_data_quality_ruleset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path }
    : get_data_quality_ruleset_request)

let data_quality_result_id_list_of_yojson tree path = list_of_yojson hash_string_of_yojson tree path

let get_data_quality_ruleset_evaluation_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_data_sources =
       option_of_yojson (value_for_key data_source_map_of_yojson "AdditionalDataSources") _list path;
     result_ids =
       option_of_yojson (value_for_key data_quality_result_id_list_of_yojson "ResultIds") _list path;
     ruleset_names =
       option_of_yojson (value_for_key ruleset_names_of_yojson "RulesetNames") _list path;
     execution_time =
       option_of_yojson (value_for_key execution_time_of_yojson "ExecutionTime") _list path;
     completed_on = option_of_yojson (value_for_key timestamp_of_yojson "CompletedOn") _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedOn") _list path;
     started_on = option_of_yojson (value_for_key timestamp_of_yojson "StartedOn") _list path;
     error_string =
       option_of_yojson (value_for_key generic_string_of_yojson "ErrorString") _list path;
     status = option_of_yojson (value_for_key task_status_type_of_yojson "Status") _list path;
     additional_run_options =
       option_of_yojson
         (value_for_key data_quality_evaluation_run_additional_run_options_of_yojson
            "AdditionalRunOptions")
         _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     role = option_of_yojson (value_for_key role_string_of_yojson "Role") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     run_id = option_of_yojson (value_for_key hash_string_of_yojson "RunId") _list path;
   }
    : get_data_quality_ruleset_evaluation_run_response)

let get_data_quality_ruleset_evaluation_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run_id = value_for_key hash_string_of_yojson "RunId" _list path }
    : get_data_quality_ruleset_evaluation_run_request)

let get_data_quality_rule_recommendation_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_quality_security_configuration =
       option_of_yojson
         (value_for_key name_string_of_yojson "DataQualitySecurityConfiguration")
         _list path;
     created_ruleset_name =
       option_of_yojson (value_for_key name_string_of_yojson "CreatedRulesetName") _list path;
     recommended_ruleset =
       option_of_yojson
         (value_for_key data_quality_ruleset_string_of_yojson "RecommendedRuleset")
         _list path;
     execution_time =
       option_of_yojson (value_for_key execution_time_of_yojson "ExecutionTime") _list path;
     completed_on = option_of_yojson (value_for_key timestamp_of_yojson "CompletedOn") _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedOn") _list path;
     started_on = option_of_yojson (value_for_key timestamp_of_yojson "StartedOn") _list path;
     error_string =
       option_of_yojson (value_for_key generic_string_of_yojson "ErrorString") _list path;
     status = option_of_yojson (value_for_key task_status_type_of_yojson "Status") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     role = option_of_yojson (value_for_key role_string_of_yojson "Role") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     run_id = option_of_yojson (value_for_key hash_string_of_yojson "RunId") _list path;
   }
    : get_data_quality_rule_recommendation_run_response)

let get_data_quality_rule_recommendation_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run_id = value_for_key hash_string_of_yojson "RunId" _list path }
    : get_data_quality_rule_recommendation_run_request)

let data_quality_rule_result_description_of_yojson = string_of_yojson

let data_quality_rule_result_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "FAIL" -> FAIL
    | `String "PASS" -> PASS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataQualityRuleResultStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DataQualityRuleResultStatus")
     : data_quality_rule_result_status)
    : data_quality_rule_result_status)

let evaluated_metrics_map_of_yojson tree path =
  map_of_yojson name_string_of_yojson nullable_double_of_yojson tree path

let data_quality_rule_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     labels = option_of_yojson (value_for_key labels_of_yojson "Labels") _list path;
     rule_metrics =
       option_of_yojson (value_for_key rule_metrics_map_of_yojson "RuleMetrics") _list path;
     evaluated_rule =
       option_of_yojson
         (value_for_key data_quality_rule_result_description_of_yojson "EvaluatedRule")
         _list path;
     evaluated_metrics =
       option_of_yojson
         (value_for_key evaluated_metrics_map_of_yojson "EvaluatedMetrics")
         _list path;
     result_ =
       option_of_yojson
         (value_for_key data_quality_rule_result_status_of_yojson "Result")
         _list path;
     evaluation_message =
       option_of_yojson
         (value_for_key data_quality_rule_result_description_of_yojson "EvaluationMessage")
         _list path;
     description =
       option_of_yojson
         (value_for_key data_quality_rule_result_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : data_quality_rule_result)

let data_quality_rule_results_of_yojson tree path =
  list_of_yojson data_quality_rule_result_of_yojson tree path

let data_quality_analyzer_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluated_metrics =
       option_of_yojson
         (value_for_key evaluated_metrics_map_of_yojson "EvaluatedMetrics")
         _list path;
     evaluation_message =
       option_of_yojson
         (value_for_key data_quality_rule_result_description_of_yojson "EvaluationMessage")
         _list path;
     description =
       option_of_yojson
         (value_for_key data_quality_rule_result_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : data_quality_analyzer_result)

let data_quality_analyzer_results_of_yojson tree path =
  list_of_yojson data_quality_analyzer_result_of_yojson tree path

let data_quality_observation_description_of_yojson = string_of_yojson

let data_quality_observation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_based_observation =
       option_of_yojson
         (value_for_key metric_based_observation_of_yojson "MetricBasedObservation")
         _list path;
     description =
       option_of_yojson
         (value_for_key data_quality_observation_description_of_yojson "Description")
         _list path;
   }
    : data_quality_observation)

let data_quality_observations_of_yojson tree path =
  list_of_yojson data_quality_observation_of_yojson tree path

let data_quality_aggregated_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_rules_failed =
       option_of_yojson (value_for_key nullable_double_of_yojson "TotalRulesFailed") _list path;
     total_rules_passed =
       option_of_yojson (value_for_key nullable_double_of_yojson "TotalRulesPassed") _list path;
     total_rules_processed =
       option_of_yojson (value_for_key nullable_double_of_yojson "TotalRulesProcessed") _list path;
     total_rows_failed =
       option_of_yojson (value_for_key nullable_double_of_yojson "TotalRowsFailed") _list path;
     total_rows_passed =
       option_of_yojson (value_for_key nullable_double_of_yojson "TotalRowsPassed") _list path;
     total_rows_processed =
       option_of_yojson (value_for_key nullable_double_of_yojson "TotalRowsProcessed") _list path;
   }
    : data_quality_aggregated_metrics)

let get_data_quality_result_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregated_metrics =
       option_of_yojson
         (value_for_key data_quality_aggregated_metrics_of_yojson "AggregatedMetrics")
         _list path;
     observations =
       option_of_yojson
         (value_for_key data_quality_observations_of_yojson "Observations")
         _list path;
     analyzer_results =
       option_of_yojson
         (value_for_key data_quality_analyzer_results_of_yojson "AnalyzerResults")
         _list path;
     rule_results =
       option_of_yojson (value_for_key data_quality_rule_results_of_yojson "RuleResults") _list path;
     ruleset_evaluation_run_id =
       option_of_yojson (value_for_key hash_string_of_yojson "RulesetEvaluationRunId") _list path;
     job_run_id = option_of_yojson (value_for_key hash_string_of_yojson "JobRunId") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
     completed_on = option_of_yojson (value_for_key timestamp_of_yojson "CompletedOn") _list path;
     started_on = option_of_yojson (value_for_key timestamp_of_yojson "StartedOn") _list path;
     evaluation_context =
       option_of_yojson (value_for_key generic_string_of_yojson "EvaluationContext") _list path;
     ruleset_name = option_of_yojson (value_for_key name_string_of_yojson "RulesetName") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     score = option_of_yojson (value_for_key generic_bounded_double_of_yojson "Score") _list path;
     profile_id = option_of_yojson (value_for_key hash_string_of_yojson "ProfileId") _list path;
     result_id = option_of_yojson (value_for_key hash_string_of_yojson "ResultId") _list path;
   }
    : get_data_quality_result_response)

let get_data_quality_result_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ result_id = value_for_key hash_string_of_yojson "ResultId" _list path }
    : get_data_quality_result_request)

let get_data_quality_model_result_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model = option_of_yojson (value_for_key statistic_model_results_of_yojson "Model") _list path;
     completed_on = option_of_yojson (value_for_key timestamp_of_yojson "CompletedOn") _list path;
   }
    : get_data_quality_model_result_response)

let get_data_quality_model_result_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key hash_string_of_yojson "ProfileId" _list path;
     statistic_id = value_for_key hash_string_of_yojson "StatisticId" _list path;
   }
    : get_data_quality_model_result_request)

let data_quality_model_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RUNNING" -> RUNNING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataQualityModelStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DataQualityModelStatus")
     : data_quality_model_status)
    : data_quality_model_status)

let get_data_quality_model_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_reason =
       option_of_yojson (value_for_key hash_string_of_yojson "FailureReason") _list path;
     completed_on = option_of_yojson (value_for_key timestamp_of_yojson "CompletedOn") _list path;
     started_on = option_of_yojson (value_for_key timestamp_of_yojson "StartedOn") _list path;
     status =
       option_of_yojson (value_for_key data_quality_model_status_of_yojson "Status") _list path;
   }
    : get_data_quality_model_response)

let get_data_quality_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_id = value_for_key hash_string_of_yojson "ProfileId" _list path;
     statistic_id = option_of_yojson (value_for_key hash_string_of_yojson "StatisticId") _list path;
   }
    : get_data_quality_model_request)

let get_data_catalog_encryption_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_catalog_encryption_settings =
       option_of_yojson
         (value_for_key data_catalog_encryption_settings_of_yojson "DataCatalogEncryptionSettings")
         _list path;
   }
    : get_data_catalog_encryption_settings_response)

let get_data_catalog_encryption_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_data_catalog_encryption_settings_request)

let get_dashboard_url_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ url = value_for_key sensitive_url_of_yojson "Url" _list path } : get_dashboard_url_response)

let get_dashboard_url_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_origin =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "RequestOrigin")
         _list path;
     resource_type = value_for_key glue_resource_type_of_yojson "ResourceType" _list path;
     resource_id = value_for_key name_string_of_yojson "ResourceId" _list path;
   }
    : get_dashboard_url_request)

let get_custom_entity_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_words =
       option_of_yojson (value_for_key context_words_of_yojson "ContextWords") _list path;
     regex_string = option_of_yojson (value_for_key name_string_of_yojson "RegexString") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : get_custom_entity_type_response)

let get_custom_entity_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path }
    : get_custom_entity_type_request)

let crawler_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPING" -> STOPPING
    | `String "RUNNING" -> RUNNING
    | `String "READY" -> READY
    | `String value -> raise (deserialize_unknown_enum_value_error path "CrawlerState" value)
    | _ -> raise (deserialize_wrong_type_error path "CrawlerState")
     : crawler_state)
    : crawler_state)

let crawler_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lake_formation_configuration =
       option_of_yojson
         (value_for_key lake_formation_configuration_of_yojson "LakeFormationConfiguration")
         _list path;
     crawler_security_configuration =
       option_of_yojson
         (value_for_key crawler_security_configuration_of_yojson "CrawlerSecurityConfiguration")
         _list path;
     configuration =
       option_of_yojson (value_for_key crawler_configuration_of_yojson "Configuration") _list path;
     version = option_of_yojson (value_for_key version_id_of_yojson "Version") _list path;
     last_crawl = option_of_yojson (value_for_key last_crawl_info_of_yojson "LastCrawl") _list path;
     last_updated = option_of_yojson (value_for_key timestamp_of_yojson "LastUpdated") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     crawl_elapsed_time =
       option_of_yojson (value_for_key milliseconds_count_of_yojson "CrawlElapsedTime") _list path;
     schedule = option_of_yojson (value_for_key schedule_of_yojson "Schedule") _list path;
     table_prefix = option_of_yojson (value_for_key table_prefix_of_yojson "TablePrefix") _list path;
     state = option_of_yojson (value_for_key crawler_state_of_yojson "State") _list path;
     lineage_configuration =
       option_of_yojson
         (value_for_key lineage_configuration_of_yojson "LineageConfiguration")
         _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     recrawl_policy =
       option_of_yojson (value_for_key recrawl_policy_of_yojson "RecrawlPolicy") _list path;
     classifiers =
       option_of_yojson (value_for_key classifier_name_list_of_yojson "Classifiers") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     database_name =
       option_of_yojson (value_for_key database_name_of_yojson "DatabaseName") _list path;
     targets = option_of_yojson (value_for_key crawler_targets_of_yojson "Targets") _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : crawler)

let crawler_list_of_yojson tree path = list_of_yojson crawler_of_yojson tree path

let get_crawlers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     crawlers = option_of_yojson (value_for_key crawler_list_of_yojson "Crawlers") _list path;
   }
    : get_crawlers_response)

let get_crawlers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : get_crawlers_request)

let get_crawler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ crawler = option_of_yojson (value_for_key crawler_of_yojson "Crawler") _list path }
    : get_crawler_response)

let get_crawler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : get_crawler_request)

let crawler_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tables_deleted =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "TablesDeleted") _list path;
     tables_updated =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "TablesUpdated") _list path;
     tables_created =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "TablesCreated") _list path;
     median_runtime_seconds =
       option_of_yojson
         (value_for_key non_negative_double_of_yojson "MedianRuntimeSeconds")
         _list path;
     last_runtime_seconds =
       option_of_yojson
         (value_for_key non_negative_double_of_yojson "LastRuntimeSeconds")
         _list path;
     still_estimating =
       option_of_yojson (value_for_key boolean__of_yojson "StillEstimating") _list path;
     time_left_seconds =
       option_of_yojson (value_for_key non_negative_double_of_yojson "TimeLeftSeconds") _list path;
     crawler_name = option_of_yojson (value_for_key name_string_of_yojson "CrawlerName") _list path;
   }
    : crawler_metrics)

let crawler_metrics_list_of_yojson tree path = list_of_yojson crawler_metrics_of_yojson tree path

let get_crawler_metrics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     crawler_metrics_list =
       option_of_yojson
         (value_for_key crawler_metrics_list_of_yojson "CrawlerMetricsList")
         _list path;
   }
    : get_crawler_metrics_response)

let get_crawler_metrics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     crawler_name_list =
       option_of_yojson (value_for_key crawler_name_list_of_yojson "CrawlerNameList") _list path;
   }
    : get_crawler_metrics_request)

let connection_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "READY" -> READY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionStatus")
     : connection_status)
    : connection_status)

let authentication_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     o_auth2_properties =
       option_of_yojson (value_for_key o_auth2_properties_of_yojson "OAuth2Properties") _list path;
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
     authentication_type =
       option_of_yojson
         (value_for_key authentication_type_of_yojson "AuthenticationType")
         _list path;
   }
    : authentication_configuration)

let connection_schema_version_of_yojson = int_of_yojson

let connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compatible_compute_environments =
       option_of_yojson
         (value_for_key compute_environment_list_of_yojson "CompatibleComputeEnvironments")
         _list path;
     connection_schema_version =
       option_of_yojson
         (value_for_key connection_schema_version_of_yojson "ConnectionSchemaVersion")
         _list path;
     authentication_configuration =
       option_of_yojson
         (value_for_key authentication_configuration_of_yojson "AuthenticationConfiguration")
         _list path;
     last_connection_validation_time =
       option_of_yojson
         (value_for_key timestamp_of_yojson "LastConnectionValidationTime")
         _list path;
     status_reason =
       option_of_yojson (value_for_key long_value_string_of_yojson "StatusReason") _list path;
     status = option_of_yojson (value_for_key connection_status_of_yojson "Status") _list path;
     last_updated_by =
       option_of_yojson (value_for_key name_string_of_yojson "LastUpdatedBy") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     physical_connection_requirements =
       option_of_yojson
         (value_for_key physical_connection_requirements_of_yojson "PhysicalConnectionRequirements")
         _list path;
     python_properties =
       option_of_yojson (value_for_key property_map_of_yojson "PythonProperties") _list path;
     athena_properties =
       option_of_yojson (value_for_key property_map_of_yojson "AthenaProperties") _list path;
     spark_properties =
       option_of_yojson (value_for_key property_map_of_yojson "SparkProperties") _list path;
     connection_properties =
       option_of_yojson
         (value_for_key connection_properties_of_yojson "ConnectionProperties")
         _list path;
     match_criteria =
       option_of_yojson (value_for_key match_criteria_of_yojson "MatchCriteria") _list path;
     connection_type =
       option_of_yojson (value_for_key connection_type_of_yojson "ConnectionType") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : connection)

let connection_list_of_yojson tree path = list_of_yojson connection_of_yojson tree path

let get_connections_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     connection_list =
       option_of_yojson (value_for_key connection_list_of_yojson "ConnectionList") _list path;
   }
    : get_connections_response)

let get_connections_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_schema_version =
       option_of_yojson
         (value_for_key connection_schema_version_of_yojson "ConnectionSchemaVersion")
         _list path;
     connection_type =
       option_of_yojson (value_for_key connection_type_of_yojson "ConnectionType") _list path;
     match_criteria =
       option_of_yojson (value_for_key match_criteria_of_yojson "MatchCriteria") _list path;
   }
    : get_connections_filter)

let get_connections_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     hide_password = option_of_yojson (value_for_key boolean__of_yojson "HidePassword") _list path;
     filter = option_of_yojson (value_for_key get_connections_filter_of_yojson "Filter") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_connections_request)

let get_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = option_of_yojson (value_for_key connection_of_yojson "Connection") _list path }
    : get_connection_response)

let get_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     apply_override_for_compute_environment =
       option_of_yojson
         (value_for_key compute_environment_of_yojson "ApplyOverrideForComputeEnvironment")
         _list path;
     hide_password = option_of_yojson (value_for_key boolean__of_yojson "HidePassword") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_connection_request)

let execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STARTED" -> STARTED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionStatus")
     : execution_status)
    : execution_status)

let execution_attempt_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key description_string_of_yojson "ErrorMessage") _list path;
     execution_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "ExecutionTimestamp") _list path;
     column_statistics_task_run_id =
       option_of_yojson (value_for_key hash_string_of_yojson "ColumnStatisticsTaskRunId") _list path;
     status = option_of_yojson (value_for_key execution_status_of_yojson "Status") _list path;
   }
    : execution_attempt)

let column_statistics_task_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_execution_attempt =
       option_of_yojson
         (value_for_key execution_attempt_of_yojson "LastExecutionAttempt")
         _list path;
     setting_source =
       option_of_yojson (value_for_key setting_source_of_yojson "SettingSource") _list path;
     schedule_type =
       option_of_yojson (value_for_key schedule_type_of_yojson "ScheduleType") _list path;
     security_configuration =
       option_of_yojson
         (value_for_key crawler_security_configuration_of_yojson "SecurityConfiguration")
         _list path;
     sample_size =
       option_of_yojson (value_for_key sample_size_percentage_of_yojson "SampleSize") _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     catalog_i_d =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogID") _list path;
     column_name_list =
       option_of_yojson (value_for_key column_name_list_of_yojson "ColumnNameList") _list path;
     schedule = option_of_yojson (value_for_key schedule_of_yojson "Schedule") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     database_name =
       option_of_yojson (value_for_key database_name_of_yojson "DatabaseName") _list path;
   }
    : column_statistics_task_settings)

let get_column_statistics_task_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_statistics_task_settings =
       option_of_yojson
         (value_for_key column_statistics_task_settings_of_yojson "ColumnStatisticsTaskSettings")
         _list path;
   }
    : get_column_statistics_task_settings_response)

let get_column_statistics_task_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
   }
    : get_column_statistics_task_settings_request)

let computation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INCREMENTAL" -> INCREMENTAL
    | `String "FULL" -> FULL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComputationType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComputationType")
     : computation_type)
    : computation_type)

let column_statistics_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPED" -> STOPPED
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RUNNING" -> RUNNING
    | `String "STARTING" -> STARTING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ColumnStatisticsState" value)
    | _ -> raise (deserialize_wrong_type_error path "ColumnStatisticsState")
     : column_statistics_state)
    : column_statistics_state)

let column_statistics_task_run_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dpu_seconds =
       option_of_yojson (value_for_key non_negative_double_of_yojson "DPUSeconds") _list path;
     error_message =
       option_of_yojson (value_for_key description_string_of_yojson "ErrorMessage") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     last_updated = option_of_yojson (value_for_key timestamp_of_yojson "LastUpdated") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     status = option_of_yojson (value_for_key column_statistics_state_of_yojson "Status") _list path;
     computation_type =
       option_of_yojson (value_for_key computation_type_of_yojson "ComputationType") _list path;
     worker_type = option_of_yojson (value_for_key name_string_of_yojson "WorkerType") _list path;
     number_of_workers =
       option_of_yojson (value_for_key positive_integer_of_yojson "NumberOfWorkers") _list path;
     security_configuration =
       option_of_yojson
         (value_for_key crawler_security_configuration_of_yojson "SecurityConfiguration")
         _list path;
     sample_size =
       option_of_yojson (value_for_key sample_size_percentage_of_yojson "SampleSize") _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     catalog_i_d =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogID") _list path;
     column_name_list =
       option_of_yojson (value_for_key column_name_list_of_yojson "ColumnNameList") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     database_name =
       option_of_yojson (value_for_key database_name_of_yojson "DatabaseName") _list path;
     column_statistics_task_run_id =
       option_of_yojson (value_for_key hash_string_of_yojson "ColumnStatisticsTaskRunId") _list path;
     customer_id = option_of_yojson (value_for_key account_id_of_yojson "CustomerId") _list path;
   }
    : column_statistics_task_run)

let column_statistics_task_runs_list_of_yojson tree path =
  list_of_yojson column_statistics_task_run_of_yojson tree path

let get_column_statistics_task_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     column_statistics_task_runs =
       option_of_yojson
         (value_for_key column_statistics_task_runs_list_of_yojson "ColumnStatisticsTaskRuns")
         _list path;
   }
    : get_column_statistics_task_runs_response)

let get_column_statistics_task_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key database_name_of_yojson "DatabaseName" _list path;
   }
    : get_column_statistics_task_runs_request)

let get_column_statistics_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_statistics_task_run =
       option_of_yojson
         (value_for_key column_statistics_task_run_of_yojson "ColumnStatisticsTaskRun")
         _list path;
   }
    : get_column_statistics_task_run_response)

let get_column_statistics_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_statistics_task_run_id =
       value_for_key hash_string_of_yojson "ColumnStatisticsTaskRunId" _list path;
   }
    : get_column_statistics_task_run_request)

let column_statistics_list_of_yojson tree path =
  list_of_yojson column_statistics_of_yojson tree path

let column_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key error_detail_of_yojson "Error") _list path;
     column_name = option_of_yojson (value_for_key name_string_of_yojson "ColumnName") _list path;
   }
    : column_error)

let column_errors_of_yojson tree path = list_of_yojson column_error_of_yojson tree path

let get_column_statistics_for_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = option_of_yojson (value_for_key column_errors_of_yojson "Errors") _list path;
     column_statistics_list =
       option_of_yojson
         (value_for_key column_statistics_list_of_yojson "ColumnStatisticsList")
         _list path;
   }
    : get_column_statistics_for_table_response)

let get_column_names_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let get_column_statistics_for_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_names = value_for_key get_column_names_list_of_yojson "ColumnNames" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_column_statistics_for_table_request)

let get_column_statistics_for_partition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = option_of_yojson (value_for_key column_errors_of_yojson "Errors") _list path;
     column_statistics_list =
       option_of_yojson
         (value_for_key column_statistics_list_of_yojson "ColumnStatisticsList")
         _list path;
   }
    : get_column_statistics_for_partition_response)

let get_column_statistics_for_partition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_names = value_for_key get_column_names_list_of_yojson "ColumnNames" _list path;
     partition_values = value_for_key value_string_list_of_yojson "PartitionValues" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_column_statistics_for_partition_request)

let csv_classifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     serde = option_of_yojson (value_for_key csv_serde_option_of_yojson "Serde") _list path;
     custom_datatypes =
       option_of_yojson (value_for_key custom_datatypes_of_yojson "CustomDatatypes") _list path;
     custom_datatype_configured =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "CustomDatatypeConfigured")
         _list path;
     allow_single_column =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "AllowSingleColumn") _list path;
     disable_value_trimming =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "DisableValueTrimming") _list path;
     header = option_of_yojson (value_for_key csv_header_of_yojson "Header") _list path;
     contains_header =
       option_of_yojson (value_for_key csv_header_option_of_yojson "ContainsHeader") _list path;
     quote_symbol =
       option_of_yojson (value_for_key csv_quote_symbol_of_yojson "QuoteSymbol") _list path;
     delimiter =
       option_of_yojson (value_for_key csv_column_delimiter_of_yojson "Delimiter") _list path;
     version = option_of_yojson (value_for_key version_id_of_yojson "Version") _list path;
     last_updated = option_of_yojson (value_for_key timestamp_of_yojson "LastUpdated") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : csv_classifier)

let classifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     csv_classifier =
       option_of_yojson (value_for_key csv_classifier_of_yojson "CsvClassifier") _list path;
     json_classifier =
       option_of_yojson (value_for_key json_classifier_of_yojson "JsonClassifier") _list path;
     xml_classifier =
       option_of_yojson (value_for_key xml_classifier_of_yojson "XMLClassifier") _list path;
     grok_classifier =
       option_of_yojson (value_for_key grok_classifier_of_yojson "GrokClassifier") _list path;
   }
    : classifier)

let classifier_list_of_yojson tree path = list_of_yojson classifier_of_yojson tree path

let get_classifiers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     classifiers =
       option_of_yojson (value_for_key classifier_list_of_yojson "Classifiers") _list path;
   }
    : get_classifiers_response)

let get_classifiers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : get_classifiers_request)

let get_classifier_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ classifier = option_of_yojson (value_for_key classifier_of_yojson "Classifier") _list path }
    : get_classifier_response)

let get_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : get_classifier_request)

let catalog_name_string_of_yojson = string_of_yojson

let data_lake_access_properties_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_type = option_of_yojson (value_for_key name_string_of_yojson "CatalogType") _list path;
     status_message =
       option_of_yojson (value_for_key name_string_of_yojson "StatusMessage") _list path;
     redshift_database_name =
       option_of_yojson (value_for_key name_string_of_yojson "RedshiftDatabaseName") _list path;
     managed_workgroup_status =
       option_of_yojson (value_for_key name_string_of_yojson "ManagedWorkgroupStatus") _list path;
     managed_workgroup_name =
       option_of_yojson (value_for_key name_string_of_yojson "ManagedWorkgroupName") _list path;
     kms_key = option_of_yojson (value_for_key resource_arn_string_of_yojson "KmsKey") _list path;
     data_transfer_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataTransferRole") _list path;
     data_lake_access =
       option_of_yojson (value_for_key boolean__of_yojson "DataLakeAccess") _list path;
   }
    : data_lake_access_properties_output)

let catalog_properties_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_properties =
       option_of_yojson (value_for_key parameters_map_of_yojson "CustomProperties") _list path;
     iceberg_optimization_properties =
       option_of_yojson
         (value_for_key iceberg_optimization_properties_output_of_yojson
            "IcebergOptimizationProperties")
         _list path;
     data_lake_access_properties =
       option_of_yojson
         (value_for_key data_lake_access_properties_output_of_yojson "DataLakeAccessProperties")
         _list path;
   }
    : catalog_properties_output)

let catalog_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allow_full_table_external_data_access =
       option_of_yojson
         (value_for_key allow_full_table_external_data_access_enum_of_yojson
            "AllowFullTableExternalDataAccess")
         _list path;
     create_database_default_permissions =
       option_of_yojson
         (value_for_key principal_permissions_list_of_yojson "CreateDatabaseDefaultPermissions")
         _list path;
     create_table_default_permissions =
       option_of_yojson
         (value_for_key principal_permissions_list_of_yojson "CreateTableDefaultPermissions")
         _list path;
     catalog_properties =
       option_of_yojson
         (value_for_key catalog_properties_output_of_yojson "CatalogProperties")
         _list path;
     federated_catalog =
       option_of_yojson (value_for_key federated_catalog_of_yojson "FederatedCatalog") _list path;
     target_redshift_catalog =
       option_of_yojson
         (value_for_key target_redshift_catalog_of_yojson "TargetRedshiftCatalog")
         _list path;
     update_time = option_of_yojson (value_for_key timestamp_of_yojson "UpdateTime") _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "CreateTime") _list path;
     parameters = option_of_yojson (value_for_key parameters_map_of_yojson "Parameters") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     resource_arn =
       option_of_yojson (value_for_key resource_arn_string_of_yojson "ResourceArn") _list path;
     name = value_for_key catalog_name_string_of_yojson "Name" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : catalog)

let catalog_list_of_yojson tree path = list_of_yojson catalog_of_yojson tree path

let get_catalogs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     catalog_list = value_for_key catalog_list_of_yojson "CatalogList" _list path;
   }
    : get_catalogs_response)

let get_catalogs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     has_databases =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "HasDatabases") _list path;
     include_root =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeRoot") _list path;
     recursive = option_of_yojson (value_for_key boolean__of_yojson "Recursive") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     parent_catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "ParentCatalogId") _list path;
   }
    : get_catalogs_request)

let get_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ catalog = option_of_yojson (value_for_key catalog_of_yojson "Catalog") _list path }
    : get_catalog_response)

let get_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ catalog_id = value_for_key catalog_id_string_of_yojson "CatalogId" _list path }
    : get_catalog_request)

let catalog_import_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     imported_by = option_of_yojson (value_for_key name_string_of_yojson "ImportedBy") _list path;
     import_time = option_of_yojson (value_for_key timestamp_of_yojson "ImportTime") _list path;
     import_completed =
       option_of_yojson (value_for_key boolean__of_yojson "ImportCompleted") _list path;
   }
    : catalog_import_status)

let get_catalog_import_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_status =
       option_of_yojson (value_for_key catalog_import_status_of_yojson "ImportStatus") _list path;
   }
    : get_catalog_import_status_response)

let get_catalog_import_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : get_catalog_import_status_request)

let blueprint_run_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ROLLING_BACK" -> ROLLING_BACK
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RUNNING" -> RUNNING
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlueprintRunState" value)
    | _ -> raise (deserialize_wrong_type_error path "BlueprintRunState")
     : blueprint_run_state)
    : blueprint_run_state)

let blueprint_run_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn =
       option_of_yojson (value_for_key orchestration_iam_role_arn_of_yojson "RoleArn") _list path;
     parameters =
       option_of_yojson (value_for_key blueprint_parameters_of_yojson "Parameters") _list path;
     rollback_error_message =
       option_of_yojson (value_for_key message_string_of_yojson "RollbackErrorMessage") _list path;
     error_message =
       option_of_yojson (value_for_key message_string_of_yojson "ErrorMessage") _list path;
     completed_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "CompletedOn") _list path;
     started_on = option_of_yojson (value_for_key timestamp_value_of_yojson "StartedOn") _list path;
     state = option_of_yojson (value_for_key blueprint_run_state_of_yojson "State") _list path;
     workflow_name =
       option_of_yojson (value_for_key name_string_of_yojson "WorkflowName") _list path;
     run_id = option_of_yojson (value_for_key id_string_of_yojson "RunId") _list path;
     blueprint_name =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "BlueprintName")
         _list path;
   }
    : blueprint_run)

let blueprint_runs_of_yojson tree path = list_of_yojson blueprint_run_of_yojson tree path

let get_blueprint_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     blueprint_runs =
       option_of_yojson (value_for_key blueprint_runs_of_yojson "BlueprintRuns") _list path;
   }
    : get_blueprint_runs_response)

let get_blueprint_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     blueprint_name = value_for_key name_string_of_yojson "BlueprintName" _list path;
   }
    : get_blueprint_runs_request)

let get_blueprint_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blueprint_run =
       option_of_yojson (value_for_key blueprint_run_of_yojson "BlueprintRun") _list path;
   }
    : get_blueprint_run_response)

let get_blueprint_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_id = value_for_key id_string_of_yojson "RunId" _list path;
     blueprint_name = value_for_key orchestration_name_string_of_yojson "BlueprintName" _list path;
   }
    : get_blueprint_run_request)

let blueprint_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "UPDATING" -> UPDATING
    | `String "ACTIVE" -> ACTIVE
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlueprintStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BlueprintStatus")
     : blueprint_status)
    : blueprint_status)

let blueprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_active_definition =
       option_of_yojson
         (value_for_key last_active_definition_of_yojson "LastActiveDefinition")
         _list path;
     error_message =
       option_of_yojson (value_for_key error_string_of_yojson "ErrorMessage") _list path;
     status = option_of_yojson (value_for_key blueprint_status_of_yojson "Status") _list path;
     blueprint_service_location =
       option_of_yojson
         (value_for_key generic_string_of_yojson "BlueprintServiceLocation")
         _list path;
     blueprint_location =
       option_of_yojson (value_for_key generic_string_of_yojson "BlueprintLocation") _list path;
     parameter_spec =
       option_of_yojson
         (value_for_key blueprint_parameter_spec_of_yojson "ParameterSpec")
         _list path;
     last_modified_on =
       option_of_yojson (value_for_key timestamp_value_of_yojson "LastModifiedOn") _list path;
     created_on = option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedOn") _list path;
     description =
       option_of_yojson (value_for_key generic512_char_string_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key orchestration_name_string_of_yojson "Name") _list path;
   }
    : blueprint)

let get_blueprint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ blueprint = option_of_yojson (value_for_key blueprint_of_yojson "Blueprint") _list path }
    : get_blueprint_response)

let get_blueprint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_parameter_spec =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeParameterSpec") _list path;
     include_blueprint =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeBlueprint") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : get_blueprint_request)

let get_asset_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forms = option_of_yojson (value_for_key asset_type_forms_map_of_yojson "Forms") _list path;
     name = option_of_yojson (value_for_key asset_type_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key asset_type_id_of_yojson "Id") _list path;
   }
    : get_asset_type_response)

let get_asset_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key asset_type_id_of_yojson "Identifier" _list path }
    : get_asset_type_request)

let get_asset_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iterable_forms =
       option_of_yojson (value_for_key iterable_form_map_of_yojson "IterableForms") _list path;
     attachments =
       option_of_yojson (value_for_key asset_form_map_of_yojson "Attachments") _list path;
     forms = option_of_yojson (value_for_key asset_form_map_of_yojson "Forms") _list path;
     glossary_terms =
       option_of_yojson (value_for_key glossary_term_id_list_of_yojson "GlossaryTerms") _list path;
     asset_type_id = value_for_key asset_type_id_of_yojson "AssetTypeId" _list path;
     updated_at = option_of_yojson (value_for_key updated_at_of_yojson "UpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key created_at_of_yojson "CreatedAt") _list path;
     description =
       option_of_yojson (value_for_key asset_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key asset_name_of_yojson "Name") _list path;
     id = value_for_key asset_id_of_yojson "Id" _list path;
   }
    : get_asset_output)

let get_asset_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key asset_id_of_yojson "Identifier" _list path } : get_asset_input)

let field_label_of_yojson = string_of_yojson
let field_description_of_yojson = string_of_yojson

let field_filter_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "ORDER_BY" -> ORDER_BY
    | `String "CONTAINS" -> CONTAINS
    | `String "LESS_THAN_OR_EQUAL_TO" -> LESS_THAN_OR_EQUAL_TO
    | `String "GREATER_THAN_OR_EQUAL_TO" -> GREATER_THAN_OR_EQUAL_TO
    | `String "NOT_EQUAL_TO" -> NOT_EQUAL_TO
    | `String "EQUAL_TO" -> EQUAL_TO
    | `String "BETWEEN" -> BETWEEN
    | `String "GREATER_THAN" -> GREATER_THAN
    | `String "LESS_THAN" -> LESS_THAN
    | `String value -> raise (deserialize_unknown_enum_value_error path "FieldFilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "FieldFilterOperator")
     : field_filter_operator)
    : field_filter_operator)

let field_filter_operators_list_of_yojson tree path =
  list_of_yojson field_filter_operator_of_yojson tree path

let field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_properties =
       option_of_yojson (value_for_key custom_properties_of_yojson "CustomProperties") _list path;
     native_data_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NativeDataType")
         _list path;
     parent_field =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ParentField")
         _list path;
     supported_filter_operators =
       option_of_yojson
         (value_for_key field_filter_operators_list_of_yojson "SupportedFilterOperators")
         _list path;
     supported_values =
       option_of_yojson (value_for_key list_of_string_of_yojson "SupportedValues") _list path;
     is_default_on_create =
       option_of_yojson (value_for_key bool__of_yojson "IsDefaultOnCreate") _list path;
     is_upsertable = option_of_yojson (value_for_key bool__of_yojson "IsUpsertable") _list path;
     is_updateable = option_of_yojson (value_for_key bool__of_yojson "IsUpdateable") _list path;
     is_createable = option_of_yojson (value_for_key bool__of_yojson "IsCreateable") _list path;
     is_partitionable =
       option_of_yojson (value_for_key bool__of_yojson "IsPartitionable") _list path;
     is_filterable = option_of_yojson (value_for_key bool__of_yojson "IsFilterable") _list path;
     is_retrievable = option_of_yojson (value_for_key bool__of_yojson "IsRetrievable") _list path;
     is_nullable = option_of_yojson (value_for_key bool__of_yojson "IsNullable") _list path;
     is_primary_key = option_of_yojson (value_for_key bool__of_yojson "IsPrimaryKey") _list path;
     field_type = option_of_yojson (value_for_key field_data_type_of_yojson "FieldType") _list path;
     description =
       option_of_yojson (value_for_key field_description_of_yojson "Description") _list path;
     label = option_of_yojson (value_for_key field_label_of_yojson "Label") _list path;
     field_name =
       option_of_yojson (value_for_key entity_field_name_of_yojson "FieldName") _list path;
   }
    : field)

let fields_list_of_yojson tree path = list_of_yojson field_of_yojson tree path

let federated_resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associated_glue_resource =
       option_of_yojson
         (value_for_key glue_resource_arn_of_yojson "AssociatedGlueResource")
         _list path;
     message = option_of_yojson (value_for_key message_string_of_yojson "Message") _list path;
   }
    : federated_resource_already_exists_exception)

let error_by_name_of_yojson tree path =
  map_of_yojson name_string_of_yojson error_detail_of_yojson tree path

let disassociate_glossary_terms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     glossary_terms =
       option_of_yojson (value_for_key glossary_term_id_list_of_yojson "GlossaryTerms") _list path;
     asset_identifier =
       option_of_yojson (value_for_key asset_id_of_yojson "AssetIdentifier") _list path;
   }
    : disassociate_glossary_terms_response)

let disassociate_glossary_terms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     glossary_term_identifiers =
       value_for_key glossary_term_id_list_of_yojson "GlossaryTermIdentifiers" _list path;
     asset_identifier = value_for_key asset_id_of_yojson "AssetIdentifier" _list path;
   }
    : disassociate_glossary_terms_request)

let dev_endpoint_names_of_yojson tree path = list_of_yojson generic_string_of_yojson tree path

let describe_integrations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string128_of_yojson "Marker") _list path;
     integrations =
       option_of_yojson (value_for_key integrations_list_of_yojson "Integrations") _list path;
   }
    : describe_integrations_response)

let describe_integrations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key integration_filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integration_integer_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string128_of_yojson "Marker") _list path;
     integration_identifier =
       option_of_yojson (value_for_key string128_of_yojson "IntegrationIdentifier") _list path;
   }
    : describe_integrations_request)

let describe_inbound_integrations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string128_of_yojson "Marker") _list path;
     inbound_integrations =
       option_of_yojson
         (value_for_key inbound_integrations_list_of_yojson "InboundIntegrations")
         _list path;
   }
    : describe_inbound_integrations_response)

let describe_inbound_integrations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_arn = option_of_yojson (value_for_key string512_of_yojson "TargetArn") _list path;
     max_records =
       option_of_yojson (value_for_key integration_integer_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string128_of_yojson "Marker") _list path;
     integration_arn =
       option_of_yojson (value_for_key string128_of_yojson "IntegrationArn") _list path;
   }
    : describe_inbound_integrations_request)

let describe_entity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     fields = option_of_yojson (value_for_key fields_list_of_yojson "Fields") _list path;
   }
    : describe_entity_response)

let describe_entity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_store_api_version =
       option_of_yojson (value_for_key api_version_of_yojson "DataStoreApiVersion") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     entity_name = value_for_key entity_name_of_yojson "EntityName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
     connection_name = value_for_key name_string_of_yojson "ConnectionName" _list path;
   }
    : describe_entity_request)

let auth_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_authentication_properties =
       option_of_yojson
         (value_for_key properties_map_of_yojson "CustomAuthenticationProperties")
         _list path;
     basic_authentication_properties =
       option_of_yojson
         (value_for_key properties_map_of_yojson "BasicAuthenticationProperties")
         _list path;
     o_auth2_properties =
       option_of_yojson (value_for_key properties_map_of_yojson "OAuth2Properties") _list path;
     secret_arn = option_of_yojson (value_for_key property_of_yojson "SecretArn") _list path;
     authentication_type = value_for_key property_of_yojson "AuthenticationType" _list path;
   }
    : auth_configuration)

let compute_environment_name_of_yojson = string_of_yojson
let compute_environment_configuration_description_string_of_yojson = string_of_yojson

let compute_environment_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     physical_connection_properties_required =
       option_of_yojson
         (value_for_key bool__of_yojson "PhysicalConnectionPropertiesRequired")
         _list path;
     connection_properties_required_overrides =
       value_for_key list_of_string_of_yojson "ConnectionPropertiesRequiredOverrides" _list path;
     connection_option_name_overrides =
       value_for_key property_name_overrides_of_yojson "ConnectionOptionNameOverrides" _list path;
     connection_property_name_overrides =
       value_for_key property_name_overrides_of_yojson "ConnectionPropertyNameOverrides" _list path;
     connection_options = value_for_key properties_map_of_yojson "ConnectionOptions" _list path;
     supported_authentication_types =
       value_for_key authentication_types_of_yojson "SupportedAuthenticationTypes" _list path;
     compute_environment =
       value_for_key compute_environment_of_yojson "ComputeEnvironment" _list path;
     description =
       value_for_key compute_environment_configuration_description_string_of_yojson "Description"
         _list path;
     name = value_for_key compute_environment_name_of_yojson "Name" _list path;
   }
    : compute_environment_configuration)

let compute_environment_configuration_map_of_yojson tree path =
  map_of_yojson compute_environment_name_of_yojson compute_environment_configuration_of_yojson tree
    path

let describe_connection_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rest_configuration =
       option_of_yojson (value_for_key rest_configuration_of_yojson "RestConfiguration") _list path;
     spark_connection_properties =
       option_of_yojson
         (value_for_key properties_map_of_yojson "SparkConnectionProperties")
         _list path;
     python_connection_properties =
       option_of_yojson
         (value_for_key properties_map_of_yojson "PythonConnectionProperties")
         _list path;
     athena_connection_properties =
       option_of_yojson
         (value_for_key properties_map_of_yojson "AthenaConnectionProperties")
         _list path;
     physical_connection_requirements =
       option_of_yojson
         (value_for_key properties_map_of_yojson "PhysicalConnectionRequirements")
         _list path;
     compute_environment_configurations =
       option_of_yojson
         (value_for_key compute_environment_configuration_map_of_yojson
            "ComputeEnvironmentConfigurations")
         _list path;
     authentication_configuration =
       option_of_yojson
         (value_for_key auth_configuration_of_yojson "AuthenticationConfiguration")
         _list path;
     connection_options =
       option_of_yojson (value_for_key properties_map_of_yojson "ConnectionOptions") _list path;
     connection_properties =
       option_of_yojson (value_for_key properties_map_of_yojson "ConnectionProperties") _list path;
     capabilities =
       option_of_yojson (value_for_key capabilities_of_yojson "Capabilities") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     connection_type =
       option_of_yojson (value_for_key name_string_of_yojson "ConnectionType") _list path;
   }
    : describe_connection_type_response)

let describe_connection_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection_type = value_for_key name_string_of_yojson "ConnectionType" _list path }
    : describe_connection_type_request)

let delete_workflow_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : delete_workflow_response)

let delete_workflow_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : delete_workflow_request)

let delete_user_defined_function_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_user_defined_function_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     function_name = value_for_key name_string_of_yojson "FunctionName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : delete_user_defined_function_request)

let delete_usage_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_usage_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : delete_usage_profile_request)

let delete_trigger_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : delete_trigger_response)

let delete_trigger_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : delete_trigger_request)

let delete_table_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_table_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version_id = value_for_key version_string_of_yojson "VersionId" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : delete_table_version_request)

let delete_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transaction_id =
       option_of_yojson (value_for_key transaction_id_string_of_yojson "TransactionId") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : delete_table_request)

let delete_table_optimizer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_table_optimizer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key table_optimizer_type_of_yojson "Type" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id = value_for_key catalog_id_string_of_yojson "CatalogId" _list path;
   }
    : delete_table_optimizer_request)

let delete_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = option_of_yojson (value_for_key name_string_of_yojson "Id") _list path }
    : delete_session_response)

let delete_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_origin =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "RequestOrigin")
         _list path;
     id = value_for_key name_string_of_yojson "Id" _list path;
   }
    : delete_session_request)

let delete_security_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_security_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path }
    : delete_security_configuration_request)

let delete_schema_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_version_errors =
       option_of_yojson
         (value_for_key schema_version_error_list_of_yojson "SchemaVersionErrors")
         _list path;
   }
    : delete_schema_versions_response)

let delete_schema_versions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     versions = value_for_key versions_string_of_yojson "Versions" _list path;
     schema_id = value_for_key schema_id_of_yojson "SchemaId" _list path;
   }
    : delete_schema_versions_input)

let delete_schema_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key schema_status_of_yojson "Status") _list path;
     schema_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "SchemaName")
         _list path;
     schema_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "SchemaArn") _list path;
   }
    : delete_schema_response)

let delete_schema_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ schema_id = value_for_key schema_id_of_yojson "SchemaId" _list path } : delete_schema_input)

let delete_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "ResourceArn") _list path;
     policy_hash_condition =
       option_of_yojson (value_for_key hash_string_of_yojson "PolicyHashCondition") _list path;
   }
    : delete_resource_policy_request)

let delete_registry_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key registry_status_of_yojson "Status") _list path;
     registry_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "RegistryArn") _list path;
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
   }
    : delete_registry_response)

let delete_registry_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ registry_id = value_for_key registry_id_of_yojson "RegistryId" _list path }
    : delete_registry_input)

let delete_partition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_partition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partition_values = value_for_key value_string_list_of_yojson "PartitionValues" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : delete_partition_request)

let delete_partition_index_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_partition_index_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_name = value_for_key name_string_of_yojson "IndexName" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : delete_partition_index_request)

let delete_ml_transform_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transform_id = option_of_yojson (value_for_key hash_string_of_yojson "TransformId") _list path;
   }
    : delete_ml_transform_response)

let delete_ml_transform_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ transform_id = value_for_key hash_string_of_yojson "TransformId" _list path }
    : delete_ml_transform_request)

let delete_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path }
    : delete_job_response)

let delete_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_name = value_for_key name_string_of_yojson "JobName" _list path } : delete_job_request)

let delete_integration_table_properties_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_integration_table_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key string128_of_yojson "TableName" _list path;
     resource_arn = value_for_key string512_of_yojson "ResourceArn" _list path;
   }
    : delete_integration_table_properties_request)

let delete_integration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_filter = option_of_yojson (value_for_key string2048_of_yojson "DataFilter") _list path;
     errors = option_of_yojson (value_for_key integration_error_list_of_yojson "Errors") _list path;
     create_time = value_for_key integration_timestamp_of_yojson "CreateTime" _list path;
     status = value_for_key integration_status_of_yojson "Status" _list path;
     tags = option_of_yojson (value_for_key integration_tags_list_of_yojson "Tags") _list path;
     additional_encryption_context =
       option_of_yojson
         (value_for_key integration_additional_encryption_context_map_of_yojson
            "AdditionalEncryptionContext")
         _list path;
     kms_key_id = option_of_yojson (value_for_key string2048_of_yojson "KmsKeyId") _list path;
     integration_arn = value_for_key string128_of_yojson "IntegrationArn" _list path;
     description =
       option_of_yojson (value_for_key integration_description_of_yojson "Description") _list path;
     integration_name = value_for_key string128_of_yojson "IntegrationName" _list path;
     target_arn = value_for_key string512_of_yojson "TargetArn" _list path;
     source_arn = value_for_key string512_of_yojson "SourceArn" _list path;
   }
    : delete_integration_response)

let delete_integration_resource_property_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_integration_resource_property_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key string512_of_yojson "ResourceArn" _list path }
    : delete_integration_resource_property_request)

let delete_integration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ integration_identifier = value_for_key string128_of_yojson "IntegrationIdentifier" _list path }
    : delete_integration_request)

let delete_glue_identity_center_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_glue_identity_center_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_glossary_term_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_glossary_term_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key glossary_term_id_of_yojson "Identifier" _list path }
    : delete_glossary_term_request)

let delete_glossary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_glossary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key glossary_id_of_yojson "Identifier" _list path }
    : delete_glossary_request)

let delete_form_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_form_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key form_type_id_of_yojson "Identifier" _list path }
    : delete_form_type_request)

let delete_dev_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_dev_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint_name = value_for_key generic_string_of_yojson "EndpointName" _list path }
    : delete_dev_endpoint_request)

let delete_database_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_string_of_yojson "Name" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : delete_database_request)

let delete_data_quality_ruleset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_data_quality_ruleset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path }
    : delete_data_quality_ruleset_request)

let delete_custom_entity_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : delete_custom_entity_type_response)

let delete_custom_entity_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path }
    : delete_custom_entity_type_request)

let delete_crawler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_crawler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : delete_crawler_request)

let delete_connection_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_connection_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection_type = value_for_key name_string_of_yojson "ConnectionType" _list path }
    : delete_connection_type_request)

let delete_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_name = value_for_key name_string_of_yojson "ConnectionName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : delete_connection_request)

let delete_connection_name_list_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let delete_column_statistics_task_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_column_statistics_task_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
   }
    : delete_column_statistics_task_settings_request)

let delete_column_statistics_for_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_column_statistics_for_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_name = value_for_key name_string_of_yojson "ColumnName" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : delete_column_statistics_for_table_request)

let delete_column_statistics_for_partition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_column_statistics_for_partition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     column_name = value_for_key name_string_of_yojson "ColumnName" _list path;
     partition_values = value_for_key value_string_list_of_yojson "PartitionValues" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : delete_column_statistics_for_partition_request)

let delete_classifier_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : delete_classifier_request)

let delete_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ catalog_id = value_for_key catalog_id_string_of_yojson "CatalogId" _list path }
    : delete_catalog_request)

let delete_blueprint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : delete_blueprint_response)

let delete_blueprint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_string_of_yojson "Name" _list path } : delete_blueprint_request)

let delete_attachment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     asset_identifier =
       option_of_yojson (value_for_key asset_id_of_yojson "AssetIdentifier") _list path;
   }
    : delete_attachment_response)

let delete_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachment_name = value_for_key attachment_name_of_yojson "AttachmentName" _list path;
     item_identifier =
       option_of_yojson (value_for_key item_identifier_of_yojson "ItemIdentifier") _list path;
     iterable_form_name =
       option_of_yojson (value_for_key iterable_form_name_of_yojson "IterableFormName") _list path;
     asset_identifier = value_for_key asset_id_of_yojson "AssetIdentifier" _list path;
   }
    : delete_attachment_request)

let delete_asset_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_asset_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key asset_type_id_of_yojson "Identifier" _list path }
    : delete_asset_type_request)

let delete_asset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_asset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key asset_id_of_yojson "Identifier" _list path } : delete_asset_request)

let data_quality_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregated_metrics =
       option_of_yojson
         (value_for_key data_quality_aggregated_metrics_of_yojson "AggregatedMetrics")
         _list path;
     observations =
       option_of_yojson
         (value_for_key data_quality_observations_of_yojson "Observations")
         _list path;
     analyzer_results =
       option_of_yojson
         (value_for_key data_quality_analyzer_results_of_yojson "AnalyzerResults")
         _list path;
     rule_results =
       option_of_yojson (value_for_key data_quality_rule_results_of_yojson "RuleResults") _list path;
     ruleset_evaluation_run_id =
       option_of_yojson (value_for_key hash_string_of_yojson "RulesetEvaluationRunId") _list path;
     job_run_id = option_of_yojson (value_for_key hash_string_of_yojson "JobRunId") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
     completed_on = option_of_yojson (value_for_key timestamp_of_yojson "CompletedOn") _list path;
     started_on = option_of_yojson (value_for_key timestamp_of_yojson "StartedOn") _list path;
     evaluation_context =
       option_of_yojson (value_for_key generic_string_of_yojson "EvaluationContext") _list path;
     ruleset_name = option_of_yojson (value_for_key name_string_of_yojson "RulesetName") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     score = option_of_yojson (value_for_key generic_bounded_double_of_yojson "Score") _list path;
     profile_id = option_of_yojson (value_for_key hash_string_of_yojson "ProfileId") _list path;
     result_id = option_of_yojson (value_for_key hash_string_of_yojson "ResultId") _list path;
   }
    : data_quality_result)

let data_quality_results_list_of_yojson tree path =
  list_of_yojson data_quality_result_of_yojson tree path

let data_quality_result_ids_of_yojson tree path = list_of_yojson hash_string_of_yojson tree path
let custom_entity_type_names_of_yojson tree path = list_of_yojson name_string_of_yojson tree path

let create_xml_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     row_tag = option_of_yojson (value_for_key row_tag_of_yojson "RowTag") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
     classification = value_for_key classification_of_yojson "Classification" _list path;
   }
    : create_xml_classifier_request)

let create_workflow_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : create_workflow_response)

let create_workflow_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_concurrent_runs =
       option_of_yojson (value_for_key nullable_integer_of_yojson "MaxConcurrentRuns") _list path;
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     default_run_properties =
       option_of_yojson
         (value_for_key workflow_run_properties_of_yojson "DefaultRunProperties")
         _list path;
     description =
       option_of_yojson
         (value_for_key workflow_description_string_of_yojson "Description")
         _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_workflow_request)

let create_user_defined_function_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_user_defined_function_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     function_input = value_for_key user_defined_function_input_of_yojson "FunctionInput" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : create_user_defined_function_request)

let create_usage_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : create_usage_profile_response)

let create_usage_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     configuration = value_for_key profile_configuration_of_yojson "Configuration" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_usage_profile_request)

let create_trigger_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : create_trigger_response)

let create_trigger_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_batching_condition =
       option_of_yojson
         (value_for_key event_batching_condition_of_yojson "EventBatchingCondition")
         _list path;
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     start_on_creation =
       option_of_yojson (value_for_key boolean_value_of_yojson "StartOnCreation") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     actions = value_for_key action_list_of_yojson "Actions" _list path;
     predicate = option_of_yojson (value_for_key predicate_of_yojson "Predicate") _list path;
     schedule = option_of_yojson (value_for_key generic_string_of_yojson "Schedule") _list path;
     type_ = value_for_key trigger_type_of_yojson "Type" _list path;
     workflow_name =
       option_of_yojson (value_for_key name_string_of_yojson "WorkflowName") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_trigger_request)

let create_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     open_table_format_input =
       option_of_yojson
         (value_for_key open_table_format_input_of_yojson "OpenTableFormatInput")
         _list path;
     transaction_id =
       option_of_yojson (value_for_key transaction_id_string_of_yojson "TransactionId") _list path;
     partition_indexes =
       option_of_yojson (value_for_key partition_index_list_of_yojson "PartitionIndexes") _list path;
     table_input = option_of_yojson (value_for_key table_input_of_yojson "TableInput") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : create_table_request)

let create_table_optimizer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_table_optimizer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_optimizer_configuration =
       value_for_key table_optimizer_configuration_of_yojson "TableOptimizerConfiguration" _list
         path;
     type_ = value_for_key table_optimizer_type_of_yojson "Type" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id = value_for_key catalog_id_string_of_yojson "CatalogId" _list path;
   }
    : create_table_optimizer_request)

let create_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session = option_of_yojson (value_for_key session_of_yojson "Session") _list path }
    : create_session_response)

let create_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_type = option_of_yojson (value_for_key session_type_of_yojson "SessionType") _list path;
     request_origin =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "RequestOrigin")
         _list path;
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     max_capacity =
       option_of_yojson (value_for_key nullable_double_of_yojson "MaxCapacity") _list path;
     connections =
       option_of_yojson (value_for_key connections_list_of_yojson "Connections") _list path;
     default_arguments =
       option_of_yojson
         (value_for_key orchestration_arguments_map_of_yojson "DefaultArguments")
         _list path;
     idle_timeout = option_of_yojson (value_for_key timeout_of_yojson "IdleTimeout") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     command = value_for_key session_command_of_yojson "Command" _list path;
     role = value_for_key orchestration_role_arn_of_yojson "Role" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     id = value_for_key name_string_of_yojson "Id" _list path;
   }
    : create_session_request)

let create_security_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_timestamp =
       option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedTimestamp") _list path;
     name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path;
   }
    : create_security_configuration_response)

let create_security_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       value_for_key encryption_configuration_of_yojson "EncryptionConfiguration" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_security_configuration_request)

let create_script_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scala_code = option_of_yojson (value_for_key scala_code_of_yojson "ScalaCode") _list path;
     python_script =
       option_of_yojson (value_for_key python_script_of_yojson "PythonScript") _list path;
   }
    : create_script_response)

let create_script_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language = option_of_yojson (value_for_key language_of_yojson "Language") _list path;
     dag_edges = option_of_yojson (value_for_key dag_edges_of_yojson "DagEdges") _list path;
     dag_nodes = option_of_yojson (value_for_key dag_nodes_of_yojson "DagNodes") _list path;
   }
    : create_script_request)

let create_schema_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_version_status =
       option_of_yojson
         (value_for_key schema_version_status_of_yojson "SchemaVersionStatus")
         _list path;
     schema_version_id =
       option_of_yojson
         (value_for_key schema_version_id_string_of_yojson "SchemaVersionId")
         _list path;
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     schema_status =
       option_of_yojson (value_for_key schema_status_of_yojson "SchemaStatus") _list path;
     next_schema_version =
       option_of_yojson (value_for_key version_long_number_of_yojson "NextSchemaVersion") _list path;
     latest_schema_version =
       option_of_yojson
         (value_for_key version_long_number_of_yojson "LatestSchemaVersion")
         _list path;
     schema_checkpoint =
       option_of_yojson
         (value_for_key schema_checkpoint_number_of_yojson "SchemaCheckpoint")
         _list path;
     compatibility =
       option_of_yojson (value_for_key compatibility_of_yojson "Compatibility") _list path;
     data_format = option_of_yojson (value_for_key data_format_of_yojson "DataFormat") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     schema_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "SchemaArn") _list path;
     schema_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "SchemaName")
         _list path;
     registry_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "RegistryArn") _list path;
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
   }
    : create_schema_response)

let create_schema_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_definition =
       option_of_yojson
         (value_for_key schema_definition_string_of_yojson "SchemaDefinition")
         _list path;
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     compatibility =
       option_of_yojson (value_for_key compatibility_of_yojson "Compatibility") _list path;
     data_format = value_for_key data_format_of_yojson "DataFormat" _list path;
     schema_name = value_for_key schema_registry_name_string_of_yojson "SchemaName" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "RegistryId") _list path;
   }
    : create_schema_input)

let create_registry_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     registry_name =
       option_of_yojson
         (value_for_key schema_registry_name_string_of_yojson "RegistryName")
         _list path;
     registry_arn =
       option_of_yojson (value_for_key glue_resource_arn_of_yojson "RegistryArn") _list path;
   }
    : create_registry_response)

let create_registry_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     registry_name = value_for_key schema_registry_name_string_of_yojson "RegistryName" _list path;
   }
    : create_registry_input)

let create_partition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_partition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partition_input = value_for_key partition_input_of_yojson "PartitionInput" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : create_partition_request)

let create_partition_index_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_partition_index_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partition_index = value_for_key partition_index_of_yojson "PartitionIndex" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : create_partition_index_request)

let create_ml_transform_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transform_id = option_of_yojson (value_for_key hash_string_of_yojson "TransformId") _list path;
   }
    : create_ml_transform_response)

let create_ml_transform_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transform_encryption =
       option_of_yojson
         (value_for_key transform_encryption_of_yojson "TransformEncryption")
         _list path;
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     max_retries =
       option_of_yojson (value_for_key nullable_integer_of_yojson "MaxRetries") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     max_capacity =
       option_of_yojson (value_for_key nullable_double_of_yojson "MaxCapacity") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     role = value_for_key role_string_of_yojson "Role" _list path;
     parameters = value_for_key transform_parameters_of_yojson "Parameters" _list path;
     input_record_tables = value_for_key glue_tables_of_yojson "InputRecordTables" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_ml_transform_request)

let create_json_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     json_path = value_for_key json_path_of_yojson "JsonPath" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_json_classifier_request)

let create_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : create_job_response)

let create_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maintenance_window =
       option_of_yojson (value_for_key maintenance_window_of_yojson "MaintenanceWindow") _list path;
     source_control_details =
       option_of_yojson
         (value_for_key source_control_details_of_yojson "SourceControlDetails")
         _list path;
     execution_class =
       option_of_yojson (value_for_key execution_class_of_yojson "ExecutionClass") _list path;
     code_gen_configuration_nodes =
       option_of_yojson
         (value_for_key code_gen_configuration_nodes_of_yojson "CodeGenConfigurationNodes")
         _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     notification_property =
       option_of_yojson
         (value_for_key notification_property_of_yojson "NotificationProperty")
         _list path;
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     max_capacity =
       option_of_yojson (value_for_key nullable_double_of_yojson "MaxCapacity") _list path;
     timeout = option_of_yojson (value_for_key timeout_of_yojson "Timeout") _list path;
     allocated_capacity =
       option_of_yojson (value_for_key integer_value_of_yojson "AllocatedCapacity") _list path;
     max_retries = option_of_yojson (value_for_key max_retries_of_yojson "MaxRetries") _list path;
     connections =
       option_of_yojson (value_for_key connections_list_of_yojson "Connections") _list path;
     non_overridable_arguments =
       option_of_yojson (value_for_key generic_map_of_yojson "NonOverridableArguments") _list path;
     default_arguments =
       option_of_yojson (value_for_key generic_map_of_yojson "DefaultArguments") _list path;
     command = value_for_key job_command_of_yojson "Command" _list path;
     execution_property =
       option_of_yojson (value_for_key execution_property_of_yojson "ExecutionProperty") _list path;
     role = value_for_key role_string_of_yojson "Role" _list path;
     log_uri = option_of_yojson (value_for_key uri_string_of_yojson "LogUri") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     job_run_queuing_enabled =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "JobRunQueuingEnabled") _list path;
     job_mode = option_of_yojson (value_for_key job_mode_of_yojson "JobMode") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_job_request)

let create_integration_table_properties_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_integration_table_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_table_config =
       option_of_yojson (value_for_key target_table_config_of_yojson "TargetTableConfig") _list path;
     source_table_config =
       option_of_yojson (value_for_key source_table_config_of_yojson "SourceTableConfig") _list path;
     table_name = value_for_key string128_of_yojson "TableName" _list path;
     resource_arn = value_for_key string512_of_yojson "ResourceArn" _list path;
   }
    : create_integration_table_properties_request)

let create_integration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integration_config =
       option_of_yojson (value_for_key integration_config_of_yojson "IntegrationConfig") _list path;
     data_filter = option_of_yojson (value_for_key string2048_of_yojson "DataFilter") _list path;
     errors = option_of_yojson (value_for_key integration_error_list_of_yojson "Errors") _list path;
     create_time = value_for_key integration_timestamp_of_yojson "CreateTime" _list path;
     status = value_for_key integration_status_of_yojson "Status" _list path;
     tags = option_of_yojson (value_for_key integration_tags_list_of_yojson "Tags") _list path;
     additional_encryption_context =
       option_of_yojson
         (value_for_key integration_additional_encryption_context_map_of_yojson
            "AdditionalEncryptionContext")
         _list path;
     kms_key_id = option_of_yojson (value_for_key string2048_of_yojson "KmsKeyId") _list path;
     integration_arn = value_for_key string128_of_yojson "IntegrationArn" _list path;
     description =
       option_of_yojson (value_for_key integration_description_of_yojson "Description") _list path;
     integration_name = value_for_key string128_of_yojson "IntegrationName" _list path;
     target_arn = value_for_key string512_of_yojson "TargetArn" _list path;
     source_arn = value_for_key string512_of_yojson "SourceArn" _list path;
   }
    : create_integration_response)

let create_integration_resource_property_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_processing_properties =
       option_of_yojson
         (value_for_key target_processing_properties_of_yojson "TargetProcessingProperties")
         _list path;
     source_processing_properties =
       option_of_yojson
         (value_for_key source_processing_properties_of_yojson "SourceProcessingProperties")
         _list path;
     resource_property_arn =
       option_of_yojson (value_for_key string512_of_yojson "ResourcePropertyArn") _list path;
     resource_arn = value_for_key string512_of_yojson "ResourceArn" _list path;
   }
    : create_integration_resource_property_response)

let create_integration_resource_property_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key integration_tags_list_of_yojson "Tags") _list path;
     target_processing_properties =
       option_of_yojson
         (value_for_key target_processing_properties_of_yojson "TargetProcessingProperties")
         _list path;
     source_processing_properties =
       option_of_yojson
         (value_for_key source_processing_properties_of_yojson "SourceProcessingProperties")
         _list path;
     resource_arn = value_for_key string512_of_yojson "ResourceArn" _list path;
   }
    : create_integration_resource_property_request)

let create_integration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integration_config =
       option_of_yojson (value_for_key integration_config_of_yojson "IntegrationConfig") _list path;
     tags = option_of_yojson (value_for_key integration_tags_list_of_yojson "Tags") _list path;
     additional_encryption_context =
       option_of_yojson
         (value_for_key integration_additional_encryption_context_map_of_yojson
            "AdditionalEncryptionContext")
         _list path;
     kms_key_id = option_of_yojson (value_for_key string2048_of_yojson "KmsKeyId") _list path;
     data_filter = option_of_yojson (value_for_key string2048_of_yojson "DataFilter") _list path;
     description =
       option_of_yojson (value_for_key integration_description_of_yojson "Description") _list path;
     target_arn = value_for_key string512_of_yojson "TargetArn" _list path;
     source_arn = value_for_key string512_of_yojson "SourceArn" _list path;
     integration_name = value_for_key string128_of_yojson "IntegrationName" _list path;
   }
    : create_integration_request)

let create_grok_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_patterns =
       option_of_yojson (value_for_key custom_patterns_of_yojson "CustomPatterns") _list path;
     grok_pattern = value_for_key grok_pattern_of_yojson "GrokPattern" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
     classification = value_for_key classification_of_yojson "Classification" _list path;
   }
    : create_grok_classifier_request)

let create_glue_identity_center_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_arn =
       option_of_yojson (value_for_key application_arn_of_yojson "ApplicationArn") _list path;
   }
    : create_glue_identity_center_configuration_response)

let create_glue_identity_center_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_background_sessions_enabled =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "UserBackgroundSessionsEnabled")
         _list path;
     scopes =
       option_of_yojson (value_for_key identity_center_scopes_list_of_yojson "Scopes") _list path;
     instance_arn = value_for_key identity_center_instance_arn_of_yojson "InstanceArn" _list path;
   }
    : create_glue_identity_center_configuration_request)

let create_glossary_term_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     long_description =
       option_of_yojson
         (value_for_key glossary_long_description_of_yojson "LongDescription")
         _list path;
     short_description =
       option_of_yojson
         (value_for_key glossary_short_description_of_yojson "ShortDescription")
         _list path;
     name = option_of_yojson (value_for_key glossary_term_name_of_yojson "Name") _list path;
     glossary_id = option_of_yojson (value_for_key glossary_id_of_yojson "GlossaryId") _list path;
     id = option_of_yojson (value_for_key glossary_term_id_of_yojson "Id") _list path;
   }
    : create_glossary_term_response)

let create_glossary_term_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     long_description =
       option_of_yojson
         (value_for_key glossary_long_description_of_yojson "LongDescription")
         _list path;
     short_description =
       option_of_yojson
         (value_for_key glossary_short_description_of_yojson "ShortDescription")
         _list path;
     name = value_for_key glossary_term_name_of_yojson "Name" _list path;
     glossary_identifier = value_for_key glossary_id_of_yojson "GlossaryIdentifier" _list path;
   }
    : create_glossary_term_request)

let create_glossary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key metadata_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key glossary_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key glossary_id_of_yojson "Id") _list path;
   }
    : create_glossary_response)

let create_glossary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     description =
       option_of_yojson (value_for_key metadata_description_of_yojson "Description") _list path;
     name = value_for_key glossary_name_of_yojson "Name" _list path;
   }
    : create_glossary_request)

let create_dev_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arguments = option_of_yojson (value_for_key map_value_of_yojson "Arguments") _list path;
     created_timestamp =
       option_of_yojson (value_for_key timestamp_value_of_yojson "CreatedTimestamp") _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     failure_reason =
       option_of_yojson (value_for_key generic_string_of_yojson "FailureReason") _list path;
     extra_jars_s3_path =
       option_of_yojson (value_for_key generic_string_of_yojson "ExtraJarsS3Path") _list path;
     extra_python_libs_s3_path =
       option_of_yojson (value_for_key generic_string_of_yojson "ExtraPythonLibsS3Path") _list path;
     vpc_id = option_of_yojson (value_for_key generic_string_of_yojson "VpcId") _list path;
     availability_zone =
       option_of_yojson (value_for_key generic_string_of_yojson "AvailabilityZone") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     number_of_nodes =
       option_of_yojson (value_for_key integer_value_of_yojson "NumberOfNodes") _list path;
     zeppelin_remote_spark_interpreter_port =
       option_of_yojson
         (value_for_key integer_value_of_yojson "ZeppelinRemoteSparkInterpreterPort")
         _list path;
     yarn_endpoint_address =
       option_of_yojson (value_for_key generic_string_of_yojson "YarnEndpointAddress") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     subnet_id = option_of_yojson (value_for_key generic_string_of_yojson "SubnetId") _list path;
     security_group_ids =
       option_of_yojson (value_for_key string_list_of_yojson "SecurityGroupIds") _list path;
     status = option_of_yojson (value_for_key generic_string_of_yojson "Status") _list path;
     endpoint_name =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointName") _list path;
   }
    : create_dev_endpoint_response)

let create_dev_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arguments = option_of_yojson (value_for_key map_value_of_yojson "Arguments") _list path;
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     extra_jars_s3_path =
       option_of_yojson (value_for_key generic_string_of_yojson "ExtraJarsS3Path") _list path;
     extra_python_libs_s3_path =
       option_of_yojson (value_for_key generic_string_of_yojson "ExtraPythonLibsS3Path") _list path;
     number_of_workers =
       option_of_yojson (value_for_key nullable_integer_of_yojson "NumberOfWorkers") _list path;
     glue_version =
       option_of_yojson (value_for_key glue_version_string_of_yojson "GlueVersion") _list path;
     worker_type = option_of_yojson (value_for_key worker_type_of_yojson "WorkerType") _list path;
     number_of_nodes =
       option_of_yojson (value_for_key integer_value_of_yojson "NumberOfNodes") _list path;
     public_keys =
       option_of_yojson (value_for_key public_keys_list_of_yojson "PublicKeys") _list path;
     public_key = option_of_yojson (value_for_key generic_string_of_yojson "PublicKey") _list path;
     subnet_id = option_of_yojson (value_for_key generic_string_of_yojson "SubnetId") _list path;
     security_group_ids =
       option_of_yojson (value_for_key string_list_of_yojson "SecurityGroupIds") _list path;
     role_arn = value_for_key role_arn_of_yojson "RoleArn" _list path;
     endpoint_name = value_for_key generic_string_of_yojson "EndpointName" _list path;
   }
    : create_dev_endpoint_request)

let create_database_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     database_input = value_for_key database_input_of_yojson "DatabaseInput" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : create_database_request)

let create_data_quality_ruleset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : create_data_quality_ruleset_response)

let create_data_quality_ruleset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     data_quality_security_configuration =
       option_of_yojson
         (value_for_key name_string_of_yojson "DataQualitySecurityConfiguration")
         _list path;
     target_table =
       option_of_yojson (value_for_key data_quality_target_table_of_yojson "TargetTable") _list path;
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     ruleset = value_for_key data_quality_ruleset_string_of_yojson "Ruleset" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_data_quality_ruleset_request)

let create_custom_entity_type_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : create_custom_entity_type_response)

let create_custom_entity_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     context_words =
       option_of_yojson (value_for_key context_words_of_yojson "ContextWords") _list path;
     regex_string = value_for_key name_string_of_yojson "RegexString" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_custom_entity_type_request)

let create_csv_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     serde = option_of_yojson (value_for_key csv_serde_option_of_yojson "Serde") _list path;
     custom_datatypes =
       option_of_yojson (value_for_key custom_datatypes_of_yojson "CustomDatatypes") _list path;
     custom_datatype_configured =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "CustomDatatypeConfigured")
         _list path;
     allow_single_column =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "AllowSingleColumn") _list path;
     disable_value_trimming =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "DisableValueTrimming") _list path;
     header = option_of_yojson (value_for_key csv_header_of_yojson "Header") _list path;
     contains_header =
       option_of_yojson (value_for_key csv_header_option_of_yojson "ContainsHeader") _list path;
     quote_symbol =
       option_of_yojson (value_for_key csv_quote_symbol_of_yojson "QuoteSymbol") _list path;
     delimiter =
       option_of_yojson (value_for_key csv_column_delimiter_of_yojson "Delimiter") _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_csv_classifier_request)

let create_crawler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_crawler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     crawler_security_configuration =
       option_of_yojson
         (value_for_key crawler_security_configuration_of_yojson "CrawlerSecurityConfiguration")
         _list path;
     configuration =
       option_of_yojson (value_for_key crawler_configuration_of_yojson "Configuration") _list path;
     lake_formation_configuration =
       option_of_yojson
         (value_for_key lake_formation_configuration_of_yojson "LakeFormationConfiguration")
         _list path;
     lineage_configuration =
       option_of_yojson
         (value_for_key lineage_configuration_of_yojson "LineageConfiguration")
         _list path;
     recrawl_policy =
       option_of_yojson (value_for_key recrawl_policy_of_yojson "RecrawlPolicy") _list path;
     schema_change_policy =
       option_of_yojson
         (value_for_key schema_change_policy_of_yojson "SchemaChangePolicy")
         _list path;
     table_prefix = option_of_yojson (value_for_key table_prefix_of_yojson "TablePrefix") _list path;
     classifiers =
       option_of_yojson (value_for_key classifier_name_list_of_yojson "Classifiers") _list path;
     schedule = option_of_yojson (value_for_key cron_expression_of_yojson "Schedule") _list path;
     targets = value_for_key crawler_targets_of_yojson "Targets" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     database_name =
       option_of_yojson (value_for_key database_name_of_yojson "DatabaseName") _list path;
     role = value_for_key role_of_yojson "Role" _list path;
     name = value_for_key name_string_of_yojson "Name" _list path;
   }
    : create_crawler_request)

let create_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_connection_status =
       option_of_yojson
         (value_for_key connection_status_of_yojson "CreateConnectionStatus")
         _list path;
   }
    : create_connection_response)

let create_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     connection_input = value_for_key connection_input_of_yojson "ConnectionInput" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : create_connection_request)

let create_column_statistics_task_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_column_statistics_task_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     security_configuration =
       option_of_yojson (value_for_key name_string_of_yojson "SecurityConfiguration") _list path;
     catalog_i_d = option_of_yojson (value_for_key name_string_of_yojson "CatalogID") _list path;
     sample_size =
       option_of_yojson (value_for_key sample_size_percentage_of_yojson "SampleSize") _list path;
     column_name_list =
       option_of_yojson (value_for_key column_name_list_of_yojson "ColumnNameList") _list path;
     schedule = option_of_yojson (value_for_key cron_expression_of_yojson "Schedule") _list path;
     role = value_for_key name_string_of_yojson "Role" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
   }
    : create_column_statistics_task_settings_request)

let create_classifier_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     csv_classifier =
       option_of_yojson
         (value_for_key create_csv_classifier_request_of_yojson "CsvClassifier")
         _list path;
     json_classifier =
       option_of_yojson
         (value_for_key create_json_classifier_request_of_yojson "JsonClassifier")
         _list path;
     xml_classifier =
       option_of_yojson
         (value_for_key create_xml_classifier_request_of_yojson "XMLClassifier")
         _list path;
     grok_classifier =
       option_of_yojson
         (value_for_key create_grok_classifier_request_of_yojson "GrokClassifier")
         _list path;
   }
    : create_classifier_request)

let create_catalog_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_catalog_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     catalog_input = value_for_key catalog_input_of_yojson "CatalogInput" _list path;
     name = value_for_key catalog_name_string_of_yojson "Name" _list path;
   }
    : create_catalog_request)

let create_blueprint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key name_string_of_yojson "Name") _list path }
    : create_blueprint_response)

let create_blueprint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_map_of_yojson "Tags") _list path;
     blueprint_location =
       value_for_key orchestration_s3_location_of_yojson "BlueprintLocation" _list path;
     description =
       option_of_yojson (value_for_key generic512_char_string_of_yojson "Description") _list path;
     name = value_for_key orchestration_name_string_of_yojson "Name" _list path;
   }
    : create_blueprint_request)

let check_schema_version_validity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key schema_validation_error_of_yojson "Error") _list path;
     valid = option_of_yojson (value_for_key is_version_valid_of_yojson "Valid") _list path;
   }
    : check_schema_version_validity_response)

let check_schema_version_validity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_definition =
       value_for_key schema_definition_string_of_yojson "SchemaDefinition" _list path;
     data_format = value_for_key data_format_of_yojson "DataFormat" _list path;
   }
    : check_schema_version_validity_input)

let cancel_statement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_statement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_origin =
       option_of_yojson
         (value_for_key orchestration_name_string_of_yojson "RequestOrigin")
         _list path;
     id = value_for_key integer_value_of_yojson "Id" _list path;
     session_id = value_for_key name_string_of_yojson "SessionId" _list path;
   }
    : cancel_statement_request)

let cancel_ml_task_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key task_status_type_of_yojson "Status") _list path;
     task_run_id = option_of_yojson (value_for_key hash_string_of_yojson "TaskRunId") _list path;
     transform_id = option_of_yojson (value_for_key hash_string_of_yojson "TransformId") _list path;
   }
    : cancel_ml_task_run_response)

let cancel_ml_task_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_run_id = value_for_key hash_string_of_yojson "TaskRunId" _list path;
     transform_id = value_for_key hash_string_of_yojson "TransformId" _list path;
   }
    : cancel_ml_task_run_request)

let cancel_data_quality_ruleset_evaluation_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_data_quality_ruleset_evaluation_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run_id = value_for_key hash_string_of_yojson "RunId" _list path }
    : cancel_data_quality_ruleset_evaluation_run_request)

let cancel_data_quality_rule_recommendation_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_data_quality_rule_recommendation_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ run_id = value_for_key hash_string_of_yojson "RunId" _list path }
    : cancel_data_quality_rule_recommendation_run_request)

let blueprints_of_yojson tree path = list_of_yojson blueprint_of_yojson tree path

let batch_update_partition_failure_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_detail = option_of_yojson (value_for_key error_detail_of_yojson "ErrorDetail") _list path;
     partition_value_list =
       option_of_yojson
         (value_for_key bounded_partition_value_list_of_yojson "PartitionValueList")
         _list path;
   }
    : batch_update_partition_failure_entry)

let batch_update_partition_failure_list_of_yojson tree path =
  list_of_yojson batch_update_partition_failure_entry_of_yojson tree path

let batch_update_partition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_update_partition_failure_list_of_yojson "Errors")
         _list path;
   }
    : batch_update_partition_response)

let batch_update_partition_request_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partition_input = value_for_key partition_input_of_yojson "PartitionInput" _list path;
     partition_value_list =
       value_for_key bounded_partition_value_list_of_yojson "PartitionValueList" _list path;
   }
    : batch_update_partition_request_entry)

let batch_update_partition_request_entry_list_of_yojson tree path =
  list_of_yojson batch_update_partition_request_entry_of_yojson tree path

let batch_update_partition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entries =
       value_for_key batch_update_partition_request_entry_list_of_yojson "Entries" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : batch_update_partition_request)

let batch_table_optimizer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_optimizer =
       option_of_yojson (value_for_key table_optimizer_of_yojson "tableOptimizer") _list path;
     table_name =
       option_of_yojson (value_for_key table_name_string_of_yojson "tableName") _list path;
     database_name =
       option_of_yojson (value_for_key database_name_string_of_yojson "databaseName") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "catalogId") _list path;
   }
    : batch_table_optimizer)

let batch_table_optimizers_of_yojson tree path =
  list_of_yojson batch_table_optimizer_of_yojson tree path

let batch_stop_job_run_successful_submission_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_run_id = option_of_yojson (value_for_key id_string_of_yojson "JobRunId") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
   }
    : batch_stop_job_run_successful_submission)

let batch_stop_job_run_successful_submission_list_of_yojson tree path =
  list_of_yojson batch_stop_job_run_successful_submission_of_yojson tree path

let batch_stop_job_run_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_detail = option_of_yojson (value_for_key error_detail_of_yojson "ErrorDetail") _list path;
     job_run_id = option_of_yojson (value_for_key id_string_of_yojson "JobRunId") _list path;
     job_name = option_of_yojson (value_for_key name_string_of_yojson "JobName") _list path;
   }
    : batch_stop_job_run_error)

let batch_stop_job_run_error_list_of_yojson tree path =
  list_of_yojson batch_stop_job_run_error_of_yojson tree path

let batch_stop_job_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson (value_for_key batch_stop_job_run_error_list_of_yojson "Errors") _list path;
     successful_submissions =
       option_of_yojson
         (value_for_key batch_stop_job_run_successful_submission_list_of_yojson
            "SuccessfulSubmissions")
         _list path;
   }
    : batch_stop_job_run_response)

let batch_stop_job_run_job_run_id_list_of_yojson tree path =
  list_of_yojson id_string_of_yojson tree path

let batch_stop_job_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_run_ids = value_for_key batch_stop_job_run_job_run_id_list_of_yojson "JobRunIds" _list path;
     job_name = value_for_key name_string_of_yojson "JobName" _list path;
   }
    : batch_stop_job_run_request)

let annotation_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_reason =
       option_of_yojson (value_for_key description_string_of_yojson "FailureReason") _list path;
     statistic_id = option_of_yojson (value_for_key hash_string_of_yojson "StatisticId") _list path;
     profile_id = option_of_yojson (value_for_key hash_string_of_yojson "ProfileId") _list path;
   }
    : annotation_error)

let annotation_error_list_of_yojson tree path = list_of_yojson annotation_error_of_yojson tree path

let batch_put_data_quality_statistic_annotation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_inclusion_annotations =
       option_of_yojson
         (value_for_key annotation_error_list_of_yojson "FailedInclusionAnnotations")
         _list path;
   }
    : batch_put_data_quality_statistic_annotation_response)

let batch_put_data_quality_statistic_annotation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     inclusion_annotations =
       value_for_key inclusion_annotation_list_of_yojson "InclusionAnnotations" _list path;
   }
    : batch_put_data_quality_statistic_annotation_request)

let batch_get_workflows_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     missing_workflows =
       option_of_yojson (value_for_key workflow_names_of_yojson "MissingWorkflows") _list path;
     workflows = option_of_yojson (value_for_key workflows_of_yojson "Workflows") _list path;
   }
    : batch_get_workflows_response)

let batch_get_workflows_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_graph =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeGraph") _list path;
     names = value_for_key workflow_names_of_yojson "Names" _list path;
   }
    : batch_get_workflows_request)

let batch_get_triggers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     triggers_not_found =
       option_of_yojson (value_for_key trigger_name_list_of_yojson "TriggersNotFound") _list path;
     triggers = option_of_yojson (value_for_key trigger_list_of_yojson "Triggers") _list path;
   }
    : batch_get_triggers_response)

let batch_get_triggers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trigger_names = value_for_key trigger_name_list_of_yojson "TriggerNames" _list path }
    : batch_get_triggers_request)

let batch_get_table_optimizer_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key table_optimizer_type_of_yojson "type") _list path;
     table_name =
       option_of_yojson (value_for_key table_name_string_of_yojson "tableName") _list path;
     database_name =
       option_of_yojson (value_for_key database_name_string_of_yojson "databaseName") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "catalogId") _list path;
     error = option_of_yojson (value_for_key error_detail_of_yojson "error") _list path;
   }
    : batch_get_table_optimizer_error)

let batch_get_table_optimizer_errors_of_yojson tree path =
  list_of_yojson batch_get_table_optimizer_error_of_yojson tree path

let batch_get_table_optimizer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failures =
       option_of_yojson
         (value_for_key batch_get_table_optimizer_errors_of_yojson "Failures")
         _list path;
     table_optimizers =
       option_of_yojson
         (value_for_key batch_table_optimizers_of_yojson "TableOptimizers")
         _list path;
   }
    : batch_get_table_optimizer_response)

let batch_get_table_optimizer_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key table_optimizer_type_of_yojson "type") _list path;
     table_name =
       option_of_yojson (value_for_key table_name_string_of_yojson "tableName") _list path;
     database_name =
       option_of_yojson (value_for_key database_name_string_of_yojson "databaseName") _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "catalogId") _list path;
   }
    : batch_get_table_optimizer_entry)

let batch_get_table_optimizer_entries_of_yojson tree path =
  list_of_yojson batch_get_table_optimizer_entry_of_yojson tree path

let batch_get_table_optimizer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entries = value_for_key batch_get_table_optimizer_entries_of_yojson "Entries" _list path }
    : batch_get_table_optimizer_request)

let batch_get_partition_value_list_of_yojson tree path =
  list_of_yojson partition_value_list_of_yojson tree path

let batch_get_partition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unprocessed_keys =
       option_of_yojson
         (value_for_key batch_get_partition_value_list_of_yojson "UnprocessedKeys")
         _list path;
     partitions = option_of_yojson (value_for_key partition_list_of_yojson "Partitions") _list path;
   }
    : batch_get_partition_response)

let batch_get_partition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_session_context =
       option_of_yojson
         (value_for_key query_session_context_of_yojson "QuerySessionContext")
         _list path;
     audit_context =
       option_of_yojson (value_for_key audit_context_of_yojson "AuditContext") _list path;
     partitions_to_get =
       value_for_key batch_get_partition_value_list_of_yojson "PartitionsToGet" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : batch_get_partition_request)

let batch_get_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     jobs_not_found =
       option_of_yojson (value_for_key job_name_list_of_yojson "JobsNotFound") _list path;
     jobs = option_of_yojson (value_for_key job_list_of_yojson "Jobs") _list path;
   }
    : batch_get_jobs_response)

let batch_get_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_names = value_for_key job_name_list_of_yojson "JobNames" _list path }
    : batch_get_jobs_request)

let batch_get_iterable_forms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = option_of_yojson (value_for_key item_error_list_of_yojson "Errors") _list path;
     items = option_of_yojson (value_for_key iterable_form_item_list_of_yojson "Items") _list path;
   }
    : batch_get_iterable_forms_response)

let batch_get_iterable_forms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item_identifiers = value_for_key item_identifier_list_of_yojson "ItemIdentifiers" _list path;
     iterable_form_name = value_for_key iterable_form_name_of_yojson "IterableFormName" _list path;
     asset_identifier = value_for_key asset_id_of_yojson "AssetIdentifier" _list path;
   }
    : batch_get_iterable_forms_request)

let batch_get_dev_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dev_endpoints_not_found =
       option_of_yojson
         (value_for_key dev_endpoint_names_of_yojson "DevEndpointsNotFound")
         _list path;
     dev_endpoints =
       option_of_yojson (value_for_key dev_endpoint_list_of_yojson "DevEndpoints") _list path;
   }
    : batch_get_dev_endpoints_response)

let batch_get_dev_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dev_endpoint_names = value_for_key dev_endpoint_names_of_yojson "DevEndpointNames" _list path }
    : batch_get_dev_endpoints_request)

let batch_get_data_quality_result_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results_not_found =
       option_of_yojson
         (value_for_key data_quality_result_ids_of_yojson "ResultsNotFound")
         _list path;
     results = value_for_key data_quality_results_list_of_yojson "Results" _list path;
   }
    : batch_get_data_quality_result_response)

let batch_get_data_quality_result_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ result_ids = value_for_key data_quality_result_ids_of_yojson "ResultIds" _list path }
    : batch_get_data_quality_result_request)

let batch_get_custom_entity_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_entity_types_not_found =
       option_of_yojson
         (value_for_key custom_entity_type_names_of_yojson "CustomEntityTypesNotFound")
         _list path;
     custom_entity_types =
       option_of_yojson (value_for_key custom_entity_types_of_yojson "CustomEntityTypes") _list path;
   }
    : batch_get_custom_entity_types_response)

let batch_get_custom_entity_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ names = value_for_key custom_entity_type_names_of_yojson "Names" _list path }
    : batch_get_custom_entity_types_request)

let batch_get_crawlers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     crawlers_not_found =
       option_of_yojson (value_for_key crawler_name_list_of_yojson "CrawlersNotFound") _list path;
     crawlers = option_of_yojson (value_for_key crawler_list_of_yojson "Crawlers") _list path;
   }
    : batch_get_crawlers_response)

let batch_get_crawlers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ crawler_names = value_for_key crawler_name_list_of_yojson "CrawlerNames" _list path }
    : batch_get_crawlers_request)

let batch_get_blueprints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     missing_blueprints =
       option_of_yojson (value_for_key blueprint_names_of_yojson "MissingBlueprints") _list path;
     blueprints = option_of_yojson (value_for_key blueprints_of_yojson "Blueprints") _list path;
   }
    : batch_get_blueprints_response)

let batch_get_blueprint_names_of_yojson tree path =
  list_of_yojson orchestration_name_string_of_yojson tree path

let batch_get_blueprints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_parameter_spec =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeParameterSpec") _list path;
     include_blueprint =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeBlueprint") _list path;
     names = value_for_key batch_get_blueprint_names_of_yojson "Names" _list path;
   }
    : batch_get_blueprints_request)

let batch_delete_table_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ errors = option_of_yojson (value_for_key table_version_errors_of_yojson "Errors") _list path }
    : batch_delete_table_version_response)

let batch_delete_table_version_list_of_yojson tree path =
  list_of_yojson version_string_of_yojson tree path

let batch_delete_table_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version_ids = value_for_key batch_delete_table_version_list_of_yojson "VersionIds" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : batch_delete_table_version_request)

let batch_delete_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ errors = option_of_yojson (value_for_key table_errors_of_yojson "Errors") _list path }
    : batch_delete_table_response)

let batch_delete_table_name_list_of_yojson tree path =
  list_of_yojson name_string_of_yojson tree path

let batch_delete_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transaction_id =
       option_of_yojson (value_for_key transaction_id_string_of_yojson "TransactionId") _list path;
     tables_to_delete =
       value_for_key batch_delete_table_name_list_of_yojson "TablesToDelete" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : batch_delete_table_request)

let batch_delete_partition_value_list_of_yojson tree path =
  list_of_yojson partition_value_list_of_yojson tree path

let batch_delete_partition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ errors = option_of_yojson (value_for_key partition_errors_of_yojson "Errors") _list path }
    : batch_delete_partition_response)

let batch_delete_partition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partitions_to_delete =
       value_for_key batch_delete_partition_value_list_of_yojson "PartitionsToDelete" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : batch_delete_partition_request)

let batch_delete_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = option_of_yojson (value_for_key error_by_name_of_yojson "Errors") _list path;
     succeeded = option_of_yojson (value_for_key name_string_list_of_yojson "Succeeded") _list path;
   }
    : batch_delete_connection_response)

let batch_delete_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_name_list =
       value_for_key delete_connection_name_list_of_yojson "ConnectionNameList" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : batch_delete_connection_request)

let batch_create_partition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ errors = option_of_yojson (value_for_key partition_errors_of_yojson "Errors") _list path }
    : batch_create_partition_response)

let batch_create_partition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partition_input_list =
       value_for_key partition_input_list_of_yojson "PartitionInputList" _list path;
     table_name = value_for_key name_string_of_yojson "TableName" _list path;
     database_name = value_for_key name_string_of_yojson "DatabaseName" _list path;
     catalog_id =
       option_of_yojson (value_for_key catalog_id_string_of_yojson "CatalogId") _list path;
   }
    : batch_create_partition_request)

let associate_glossary_terms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     glossary_terms =
       option_of_yojson (value_for_key glossary_term_id_list_of_yojson "GlossaryTerms") _list path;
     asset_identifier =
       option_of_yojson (value_for_key asset_id_of_yojson "AssetIdentifier") _list path;
   }
    : associate_glossary_terms_response)

let associate_glossary_terms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key hash_string_of_yojson "ClientToken") _list path;
     glossary_term_identifiers =
       value_for_key glossary_term_id_list_of_yojson "GlossaryTermIdentifiers" _list path;
     asset_identifier = value_for_key asset_id_of_yojson "AssetIdentifier" _list path;
   }
    : associate_glossary_terms_request)
