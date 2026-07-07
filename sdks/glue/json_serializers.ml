open Smaws_Lib.Json.SerializeHelpers
open Types

let table_name_string_to_yojson = string_to_yojson
let metric_counts_to_yojson = long_to_yojson
let glue_connection_name_string_to_yojson = string_to_yojson
let dpu_hours_to_yojson = double_to_yojson
let dpu_duration_in_hour_to_yojson = double_to_yojson
let dpu_counts_to_yojson = int_to_yojson
let database_name_string_to_yojson = string_to_yojson
let name_string_to_yojson = string_to_yojson
let classification_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let version_id_to_yojson = long_to_yojson
let row_tag_to_yojson = string_to_yojson

let xml_classifier_to_yojson (x : xml_classifier) =
  assoc_to_yojson
    [
      ("RowTag", option_to_yojson row_tag_to_yojson x.row_tag);
      ("Version", option_to_yojson version_id_to_yojson x.version);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Classification", Some (classification_to_yojson x.classification));
      ("Name", Some (name_string_to_yojson x.name));
    ]

let generic_string_to_yojson = string_to_yojson
let id_string_to_yojson = string_to_yojson

let workflow_run_properties_to_yojson tree =
  map_to_yojson id_string_to_yojson generic_string_to_yojson tree

let timestamp_value_to_yojson = timestamp_epoch_seconds_to_yojson

let workflow_run_status_to_yojson (x : workflow_run_status) =
  match x with
  | ERROR -> `String "ERROR"
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | COMPLETED -> `String "COMPLETED"
  | RUNNING -> `String "RUNNING"

let error_string_to_yojson = string_to_yojson
let integer_value_to_yojson = int_to_yojson

let workflow_run_statistics_to_yojson (x : workflow_run_statistics) =
  assoc_to_yojson
    [
      ("WaitingActions", option_to_yojson integer_value_to_yojson x.waiting_actions);
      ("ErroredActions", option_to_yojson integer_value_to_yojson x.errored_actions);
      ("RunningActions", option_to_yojson integer_value_to_yojson x.running_actions);
      ("SucceededActions", option_to_yojson integer_value_to_yojson x.succeeded_actions);
      ("StoppedActions", option_to_yojson integer_value_to_yojson x.stopped_actions);
      ("FailedActions", option_to_yojson integer_value_to_yojson x.failed_actions);
      ("TimeoutActions", option_to_yojson integer_value_to_yojson x.timeout_actions);
      ("TotalActions", option_to_yojson integer_value_to_yojson x.total_actions);
    ]

let node_type_to_yojson (x : node_type) =
  match x with TRIGGER -> `String "TRIGGER" | JOB -> `String "JOB" | CRAWLER -> `String "CRAWLER"

let trigger_type_to_yojson (x : trigger_type) =
  match x with
  | EVENT -> `String "EVENT"
  | ON_DEMAND -> `String "ON_DEMAND"
  | CONDITIONAL -> `String "CONDITIONAL"
  | SCHEDULED -> `String "SCHEDULED"

let trigger_state_to_yojson (x : trigger_state) =
  match x with
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | DEACTIVATED -> `String "DEACTIVATED"
  | DEACTIVATING -> `String "DEACTIVATING"
  | ACTIVATED -> `String "ACTIVATED"
  | ACTIVATING -> `String "ACTIVATING"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let description_string_to_yojson = string_to_yojson

let generic_map_to_yojson tree =
  map_to_yojson generic_string_to_yojson generic_string_to_yojson tree

let timeout_to_yojson = int_to_yojson
let notify_delay_after_to_yojson = int_to_yojson

let notification_property_to_yojson (x : notification_property) =
  assoc_to_yojson
    [ ("NotifyDelayAfter", option_to_yojson notify_delay_after_to_yojson x.notify_delay_after) ]

let action_to_yojson (x : action) =
  assoc_to_yojson
    [
      ("CrawlerName", option_to_yojson name_string_to_yojson x.crawler_name);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("Arguments", option_to_yojson generic_map_to_yojson x.arguments);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
    ]

let action_list_to_yojson tree = list_to_yojson action_to_yojson tree
let logical_to_yojson (x : logical) = match x with ANY -> `String "ANY" | AND -> `String "AND"
let logical_operator_to_yojson (x : logical_operator) = match x with EQUALS -> `String "EQUALS"

let job_run_state_to_yojson (x : job_run_state) =
  match x with
  | EXPIRED -> `String "EXPIRED"
  | WAITING -> `String "WAITING"
  | ERROR -> `String "ERROR"
  | TIMEOUT -> `String "TIMEOUT"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | RUNNING -> `String "RUNNING"
  | STARTING -> `String "STARTING"

let crawl_state_to_yojson (x : crawl_state) =
  match x with
  | ERROR -> `String "ERROR"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | CANCELLED -> `String "CANCELLED"
  | CANCELLING -> `String "CANCELLING"
  | RUNNING -> `String "RUNNING"

let condition_to_yojson (x : condition) =
  assoc_to_yojson
    [
      ("CrawlState", option_to_yojson crawl_state_to_yojson x.crawl_state);
      ("CrawlerName", option_to_yojson name_string_to_yojson x.crawler_name);
      ("State", option_to_yojson job_run_state_to_yojson x.state);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("LogicalOperator", option_to_yojson logical_operator_to_yojson x.logical_operator);
    ]

let condition_list_to_yojson tree = list_to_yojson condition_to_yojson tree

let predicate_to_yojson (x : predicate) =
  assoc_to_yojson
    [
      ("Conditions", option_to_yojson condition_list_to_yojson x.conditions);
      ("Logical", option_to_yojson logical_to_yojson x.logical);
    ]

let batch_size_to_yojson = int_to_yojson
let batch_window_to_yojson = int_to_yojson

let event_batching_condition_to_yojson (x : event_batching_condition) =
  assoc_to_yojson
    [
      ("BatchWindow", option_to_yojson batch_window_to_yojson x.batch_window);
      ("BatchSize", Some (batch_size_to_yojson x.batch_size));
    ]

let trigger_to_yojson (x : trigger) =
  assoc_to_yojson
    [
      ( "EventBatchingCondition",
        option_to_yojson event_batching_condition_to_yojson x.event_batching_condition );
      ("Predicate", option_to_yojson predicate_to_yojson x.predicate);
      ("Actions", option_to_yojson action_list_to_yojson x.actions);
      ("Schedule", option_to_yojson generic_string_to_yojson x.schedule);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("State", option_to_yojson trigger_state_to_yojson x.state);
      ("Type", option_to_yojson trigger_type_to_yojson x.type_);
      ("Id", option_to_yojson id_string_to_yojson x.id);
      ("WorkflowName", option_to_yojson name_string_to_yojson x.workflow_name);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let trigger_node_details_to_yojson (x : trigger_node_details) =
  assoc_to_yojson [ ("Trigger", option_to_yojson trigger_to_yojson x.trigger) ]

let attempt_count_to_yojson = int_to_yojson

let job_mode_to_yojson (x : job_mode) =
  match x with
  | NOTEBOOK -> `String "NOTEBOOK"
  | VISUAL -> `String "VISUAL"
  | SCRIPT -> `String "SCRIPT"

let nullable_boolean_to_yojson = bool_to_yojson

let predecessor_to_yojson (x : predecessor) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
    ]

let predecessor_list_to_yojson tree = list_to_yojson predecessor_to_yojson tree
let execution_time_to_yojson = int_to_yojson
let nullable_double_to_yojson = double_to_yojson

let worker_type_to_yojson (x : worker_type) =
  match x with
  | Z_2X -> `String "Z.2X"
  | G_8X -> `String "G.8X"
  | G_4X -> `String "G.4X"
  | G_025X -> `String "G.025X"
  | G_2X -> `String "G.2X"
  | G_1X -> `String "G.1X"
  | Standard -> `String "Standard"

let nullable_integer_to_yojson = int_to_yojson
let glue_version_string_to_yojson = string_to_yojson

let execution_class_to_yojson (x : execution_class) =
  match x with STANDARD -> `String "STANDARD" | FLEX -> `String "FLEX"

let maintenance_window_to_yojson = string_to_yojson
let orchestration_message_string_to_yojson = string_to_yojson
let orchestration_policy_json_string_to_yojson = string_to_yojson

let job_run_to_yojson (x : job_run) =
  assoc_to_yojson
    [
      ( "ExecutionRoleSessionPolicy",
        option_to_yojson orchestration_policy_json_string_to_yojson x.execution_role_session_policy
      );
      ("StateDetail", option_to_yojson orchestration_message_string_to_yojson x.state_detail);
      ("ProfileName", option_to_yojson name_string_to_yojson x.profile_name);
      ("MaintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ("ExecutionClass", option_to_yojson execution_class_to_yojson x.execution_class);
      ("DPUSeconds", option_to_yojson nullable_double_to_yojson x.dpu_seconds);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("LogGroupName", option_to_yojson generic_string_to_yojson x.log_group_name);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("ExecutionTime", option_to_yojson execution_time_to_yojson x.execution_time);
      ("AllocatedCapacity", option_to_yojson integer_value_to_yojson x.allocated_capacity);
      ("PredecessorRuns", option_to_yojson predecessor_list_to_yojson x.predecessor_runs);
      ("ErrorMessage", option_to_yojson error_string_to_yojson x.error_message);
      ("Arguments", option_to_yojson generic_map_to_yojson x.arguments);
      ("JobRunState", option_to_yojson job_run_state_to_yojson x.job_run_state);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("StartedOn", option_to_yojson timestamp_value_to_yojson x.started_on);
      ("JobRunQueuingEnabled", option_to_yojson nullable_boolean_to_yojson x.job_run_queuing_enabled);
      ("JobMode", option_to_yojson job_mode_to_yojson x.job_mode);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("TriggerName", option_to_yojson name_string_to_yojson x.trigger_name);
      ("PreviousRunId", option_to_yojson id_string_to_yojson x.previous_run_id);
      ("Attempt", option_to_yojson attempt_count_to_yojson x.attempt);
      ("Id", option_to_yojson id_string_to_yojson x.id);
    ]

let job_run_list_to_yojson tree = list_to_yojson job_run_to_yojson tree

let job_node_details_to_yojson (x : job_node_details) =
  assoc_to_yojson [ ("JobRuns", option_to_yojson job_run_list_to_yojson x.job_runs) ]

let log_group_to_yojson = string_to_yojson
let log_stream_to_yojson = string_to_yojson

let crawl_to_yojson (x : crawl) =
  assoc_to_yojson
    [
      ("LogStream", option_to_yojson log_stream_to_yojson x.log_stream);
      ("LogGroup", option_to_yojson log_group_to_yojson x.log_group);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("StartedOn", option_to_yojson timestamp_value_to_yojson x.started_on);
      ("State", option_to_yojson crawl_state_to_yojson x.state);
    ]

let crawl_list_to_yojson tree = list_to_yojson crawl_to_yojson tree

let crawler_node_details_to_yojson (x : crawler_node_details) =
  assoc_to_yojson [ ("Crawls", option_to_yojson crawl_list_to_yojson x.crawls) ]

let node_to_yojson (x : node) =
  assoc_to_yojson
    [
      ("CrawlerDetails", option_to_yojson crawler_node_details_to_yojson x.crawler_details);
      ("JobDetails", option_to_yojson job_node_details_to_yojson x.job_details);
      ("TriggerDetails", option_to_yojson trigger_node_details_to_yojson x.trigger_details);
      ("UniqueId", option_to_yojson name_string_to_yojson x.unique_id);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("Type", option_to_yojson node_type_to_yojson x.type_);
    ]

let node_list_to_yojson tree = list_to_yojson node_to_yojson tree

let edge_to_yojson (x : edge) =
  assoc_to_yojson
    [
      ("DestinationId", option_to_yojson name_string_to_yojson x.destination_id);
      ("SourceId", option_to_yojson name_string_to_yojson x.source_id);
    ]

let edge_list_to_yojson tree = list_to_yojson edge_to_yojson tree

let workflow_graph_to_yojson (x : workflow_graph) =
  assoc_to_yojson
    [
      ("Edges", option_to_yojson edge_list_to_yojson x.edges);
      ("Nodes", option_to_yojson node_list_to_yojson x.nodes);
    ]

let starting_event_batch_condition_to_yojson (x : starting_event_batch_condition) =
  assoc_to_yojson
    [
      ("BatchWindow", option_to_yojson nullable_integer_to_yojson x.batch_window);
      ("BatchSize", option_to_yojson nullable_integer_to_yojson x.batch_size);
    ]

let workflow_run_to_yojson (x : workflow_run) =
  assoc_to_yojson
    [
      ( "StartingEventBatchCondition",
        option_to_yojson starting_event_batch_condition_to_yojson x.starting_event_batch_condition
      );
      ("Graph", option_to_yojson workflow_graph_to_yojson x.graph);
      ("Statistics", option_to_yojson workflow_run_statistics_to_yojson x.statistics);
      ("ErrorMessage", option_to_yojson error_string_to_yojson x.error_message);
      ("Status", option_to_yojson workflow_run_status_to_yojson x.status);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("StartedOn", option_to_yojson timestamp_value_to_yojson x.started_on);
      ( "WorkflowRunProperties",
        option_to_yojson workflow_run_properties_to_yojson x.workflow_run_properties );
      ("PreviousRunId", option_to_yojson id_string_to_yojson x.previous_run_id);
      ("WorkflowRunId", option_to_yojson id_string_to_yojson x.workflow_run_id);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let orchestration_name_string_to_yojson = string_to_yojson

let blueprint_details_to_yojson (x : blueprint_details) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("BlueprintName", option_to_yojson orchestration_name_string_to_yojson x.blueprint_name);
    ]

let workflow_to_yojson (x : workflow) =
  assoc_to_yojson
    [
      ("BlueprintDetails", option_to_yojson blueprint_details_to_yojson x.blueprint_details);
      ("MaxConcurrentRuns", option_to_yojson nullable_integer_to_yojson x.max_concurrent_runs);
      ("Graph", option_to_yojson workflow_graph_to_yojson x.graph);
      ("LastRun", option_to_yojson workflow_run_to_yojson x.last_run);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ( "DefaultRunProperties",
        option_to_yojson workflow_run_properties_to_yojson x.default_run_properties );
      ("Description", option_to_yojson generic_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let workflows_to_yojson tree = list_to_yojson workflow_to_yojson tree
let workflow_runs_to_yojson tree = list_to_yojson workflow_run_to_yojson tree
let workflow_names_to_yojson tree = list_to_yojson name_string_to_yojson tree
let workflow_description_string_to_yojson = string_to_yojson

let view_dialect_to_yojson (x : view_dialect) =
  match x with
  | SPARK -> `String "SPARK"
  | ATHENA -> `String "ATHENA"
  | REDSHIFT -> `String "REDSHIFT"

let view_dialect_version_string_to_yojson = string_to_yojson
let view_text_string_to_yojson = string_to_yojson

let resource_state_to_yojson (x : resource_state) =
  match x with
  | FAILED -> `String "FAILED"
  | STOPPED -> `String "STOPPED"
  | SUCCESS -> `String "SUCCESS"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | QUEUED -> `String "QUEUED"

let error_detail_to_yojson (x : error_detail) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson name_string_to_yojson x.error_code);
    ]

let view_validation_to_yojson (x : view_validation) =
  assoc_to_yojson
    [
      ("Error", option_to_yojson error_detail_to_yojson x.error);
      ("State", option_to_yojson resource_state_to_yojson x.state);
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
      ("ViewValidationText", option_to_yojson view_text_string_to_yojson x.view_validation_text);
      ("DialectVersion", option_to_yojson view_dialect_version_string_to_yojson x.dialect_version);
      ("Dialect", option_to_yojson view_dialect_to_yojson x.dialect);
    ]

let view_validation_list_to_yojson tree = list_to_yojson view_validation_to_yojson tree

let view_update_action_to_yojson (x : view_update_action) =
  match x with
  | DROP -> `String "DROP"
  | ADD_OR_REPLACE -> `String "ADD_OR_REPLACE"
  | REPLACE -> `String "REPLACE"
  | ADD -> `String "ADD"

let arn_string_to_yojson = string_to_yojson
let view_sub_objects_list_to_yojson tree = list_to_yojson arn_string_to_yojson tree
let table_version_id_to_yojson = long_to_yojson
let view_sub_object_version_ids_list_to_yojson tree = list_to_yojson table_version_id_to_yojson tree

let view_representation_to_yojson (x : view_representation) =
  assoc_to_yojson
    [
      ("IsStale", option_to_yojson nullable_boolean_to_yojson x.is_stale);
      ("ValidationConnection", option_to_yojson name_string_to_yojson x.validation_connection);
      ("ViewExpandedText", option_to_yojson view_text_string_to_yojson x.view_expanded_text);
      ("ViewOriginalText", option_to_yojson view_text_string_to_yojson x.view_original_text);
      ("DialectVersion", option_to_yojson view_dialect_version_string_to_yojson x.dialect_version);
      ("Dialect", option_to_yojson view_dialect_to_yojson x.dialect);
    ]

let view_representation_list_to_yojson tree = list_to_yojson view_representation_to_yojson tree

let view_representation_input_to_yojson (x : view_representation_input) =
  assoc_to_yojson
    [
      ("ViewExpandedText", option_to_yojson view_text_string_to_yojson x.view_expanded_text);
      ("ValidationConnection", option_to_yojson name_string_to_yojson x.validation_connection);
      ("ViewOriginalText", option_to_yojson view_text_string_to_yojson x.view_original_text);
      ("DialectVersion", option_to_yojson view_dialect_version_string_to_yojson x.dialect_version);
      ("Dialect", option_to_yojson view_dialect_to_yojson x.dialect);
    ]

let view_representation_input_list_to_yojson tree =
  list_to_yojson view_representation_input_to_yojson tree

let version_string_to_yojson = string_to_yojson
let refresh_seconds_to_yojson = long_to_yojson

let last_refresh_type_to_yojson (x : last_refresh_type) =
  match x with INCREMENTAL -> `String "INCREMENTAL" | FULL -> `String "FULL"

let view_definition_input_to_yojson (x : view_definition_input) =
  assoc_to_yojson
    [
      ( "SubObjectVersionIds",
        option_to_yojson view_sub_object_version_ids_list_to_yojson x.sub_object_version_ids );
      ("SubObjects", option_to_yojson view_sub_objects_list_to_yojson x.sub_objects);
      ("LastRefreshType", option_to_yojson last_refresh_type_to_yojson x.last_refresh_type);
      ("RefreshSeconds", option_to_yojson refresh_seconds_to_yojson x.refresh_seconds);
      ("ViewVersionToken", option_to_yojson version_string_to_yojson x.view_version_token);
      ("ViewVersionId", option_to_yojson table_version_id_to_yojson x.view_version_id);
      ( "Representations",
        option_to_yojson view_representation_input_list_to_yojson x.representations );
      ("Definer", option_to_yojson arn_string_to_yojson x.definer);
      ("IsProtected", option_to_yojson nullable_boolean_to_yojson x.is_protected);
    ]

let hash_string_to_yojson = string_to_yojson

let view_definition_to_yojson (x : view_definition) =
  assoc_to_yojson
    [
      ("Representations", option_to_yojson view_representation_list_to_yojson x.representations);
      ( "SubObjectVersionIds",
        option_to_yojson view_sub_object_version_ids_list_to_yojson x.sub_object_version_ids );
      ("SubObjects", option_to_yojson view_sub_objects_list_to_yojson x.sub_objects);
      ("LastRefreshType", option_to_yojson last_refresh_type_to_yojson x.last_refresh_type);
      ("RefreshSeconds", option_to_yojson refresh_seconds_to_yojson x.refresh_seconds);
      ("ViewVersionToken", option_to_yojson hash_string_to_yojson x.view_version_token);
      ("ViewVersionId", option_to_yojson table_version_id_to_yojson x.view_version_id);
      ("Definer", option_to_yojson arn_string_to_yojson x.definer);
      ("IsProtected", option_to_yojson nullable_boolean_to_yojson x.is_protected);
    ]

let versions_string_to_yojson = string_to_yojson
let message_string_to_yojson = string_to_yojson

let version_mismatch_exception_to_yojson (x : version_mismatch_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let version_long_number_to_yojson = long_to_yojson
let vendor_to_yojson = string_to_yojson
let value_string_to_yojson = string_to_yojson
let value_string_list_to_yojson tree = list_to_yojson value_string_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let username_to_yojson = string_to_yojson
let user_managed_client_application_client_secret_to_yojson = string_to_yojson
let user_managed_client_application_client_id_to_yojson = string_to_yojson

let function_type_to_yojson (x : function_type) =
  match x with
  | STORED_PROCEDURE -> `String "STORED_PROCEDURE"
  | AGGREGATE_FUNCTION -> `String "AGGREGATE_FUNCTION"
  | REGULAR_FUNCTION -> `String "REGULAR_FUNCTION"

let principal_type_to_yojson (x : principal_type) =
  match x with GROUP -> `String "GROUP" | ROLE -> `String "ROLE" | USER -> `String "USER"

let resource_type_to_yojson (x : resource_type) =
  match x with ARCHIVE -> `String "ARCHIVE" | FILE -> `String "FILE" | JAR -> `String "JAR"

let ur_i_to_yojson = string_to_yojson

let resource_uri_to_yojson (x : resource_uri) =
  assoc_to_yojson
    [
      ("Uri", option_to_yojson ur_i_to_yojson x.uri);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
    ]

let resource_uri_list_to_yojson tree = list_to_yojson resource_uri_to_yojson tree
let catalog_id_string_to_yojson = string_to_yojson

let user_defined_function_to_yojson (x : user_defined_function) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("ResourceUris", option_to_yojson resource_uri_list_to_yojson x.resource_uris);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("OwnerType", option_to_yojson principal_type_to_yojson x.owner_type);
      ("FunctionType", option_to_yojson function_type_to_yojson x.function_type);
      ("OwnerName", option_to_yojson name_string_to_yojson x.owner_name);
      ("ClassName", option_to_yojson name_string_to_yojson x.class_name);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("FunctionName", option_to_yojson name_string_to_yojson x.function_name);
    ]

let user_defined_function_list_to_yojson tree = list_to_yojson user_defined_function_to_yojson tree

let user_defined_function_input_to_yojson (x : user_defined_function_input) =
  assoc_to_yojson
    [
      ("ResourceUris", option_to_yojson resource_uri_list_to_yojson x.resource_uris);
      ("OwnerType", option_to_yojson principal_type_to_yojson x.owner_type);
      ("FunctionType", option_to_yojson function_type_to_yojson x.function_type);
      ("OwnerName", option_to_yojson name_string_to_yojson x.owner_name);
      ("ClassName", option_to_yojson name_string_to_yojson x.class_name);
      ("FunctionName", option_to_yojson name_string_to_yojson x.function_name);
    ]

let usage_profile_definition_to_yojson (x : usage_profile_definition) =
  assoc_to_yojson
    [
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let usage_profile_definition_list_to_yojson tree =
  list_to_yojson usage_profile_definition_to_yojson tree

let url_string_to_yojson = string_to_yojson
let uri_string_to_yojson = string_to_yojson
let enclosed_in_string_property_to_yojson = string_to_yojson

let enclosed_in_string_properties_min_one_to_yojson tree =
  list_to_yojson enclosed_in_string_property_to_yojson tree

let upsert_redshift_target_options_to_yojson (x : upsert_redshift_target_options) =
  assoc_to_yojson
    [
      ("UpsertKeys", option_to_yojson enclosed_in_string_properties_min_one_to_yojson x.upsert_keys);
      ("ConnectionName", option_to_yojson enclosed_in_string_property_to_yojson x.connection_name);
      ("TableLocation", option_to_yojson enclosed_in_string_property_to_yojson x.table_location);
    ]

let updated_timestamp_to_yojson = string_to_yojson
let updated_at_to_yojson = timestamp_epoch_seconds_to_yojson

let update_xml_classifier_request_to_yojson (x : update_xml_classifier_request) =
  assoc_to_yojson
    [
      ("RowTag", option_to_yojson row_tag_to_yojson x.row_tag);
      ("Classification", option_to_yojson classification_to_yojson x.classification);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let update_workflow_response_to_yojson (x : update_workflow_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let update_workflow_request_to_yojson (x : update_workflow_request) =
  assoc_to_yojson
    [
      ("MaxConcurrentRuns", option_to_yojson nullable_integer_to_yojson x.max_concurrent_runs);
      ( "DefaultRunProperties",
        option_to_yojson workflow_run_properties_to_yojson x.default_run_properties );
      ("Description", option_to_yojson workflow_description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let operation_timeout_exception_to_yojson (x : operation_timeout_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson
    [
      ("FromFederationSource", option_to_yojson nullable_boolean_to_yojson x.from_federation_source);
      ("Message", option_to_yojson message_string_to_yojson x.message);
    ]

let internal_service_exception_to_yojson (x : internal_service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let entity_not_found_exception_to_yojson (x : entity_not_found_exception) =
  assoc_to_yojson
    [
      ("FromFederationSource", option_to_yojson nullable_boolean_to_yojson x.from_federation_source);
      ("Message", option_to_yojson message_string_to_yojson x.message);
    ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_user_defined_function_response_to_yojson = unit_to_yojson

let update_user_defined_function_request_to_yojson (x : update_user_defined_function_request) =
  assoc_to_yojson
    [
      ("FunctionInput", Some (user_defined_function_input_to_yojson x.function_input));
      ("FunctionName", Some (name_string_to_yojson x.function_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let glue_encryption_exception_to_yojson (x : glue_encryption_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_usage_profile_response_to_yojson (x : update_usage_profile_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let config_value_string_to_yojson = string_to_yojson
let allowed_values_string_list_to_yojson tree = list_to_yojson config_value_string_to_yojson tree

let configuration_object_to_yojson (x : configuration_object) =
  assoc_to_yojson
    [
      ("MaxValue", option_to_yojson config_value_string_to_yojson x.max_value);
      ("MinValue", option_to_yojson config_value_string_to_yojson x.min_value);
      ("AllowedValues", option_to_yojson allowed_values_string_list_to_yojson x.allowed_values);
      ("DefaultValue", option_to_yojson config_value_string_to_yojson x.default_value);
    ]

let configuration_map_to_yojson tree =
  map_to_yojson name_string_to_yojson configuration_object_to_yojson tree

let profile_configuration_to_yojson (x : profile_configuration) =
  assoc_to_yojson
    [
      ("JobConfiguration", option_to_yojson configuration_map_to_yojson x.job_configuration);
      ("SessionConfiguration", option_to_yojson configuration_map_to_yojson x.session_configuration);
    ]

let update_usage_profile_request_to_yojson (x : update_usage_profile_request) =
  assoc_to_yojson
    [
      ("Configuration", Some (profile_configuration_to_yojson x.configuration));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let operation_not_supported_exception_to_yojson (x : operation_not_supported_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_trigger_response_to_yojson (x : update_trigger_response) =
  assoc_to_yojson [ ("Trigger", option_to_yojson trigger_to_yojson x.trigger) ]

let trigger_update_to_yojson (x : trigger_update) =
  assoc_to_yojson
    [
      ( "EventBatchingCondition",
        option_to_yojson event_batching_condition_to_yojson x.event_batching_condition );
      ("Predicate", option_to_yojson predicate_to_yojson x.predicate);
      ("Actions", option_to_yojson action_list_to_yojson x.actions);
      ("Schedule", option_to_yojson generic_string_to_yojson x.schedule);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let update_trigger_request_to_yojson (x : update_trigger_request) =
  assoc_to_yojson
    [
      ("TriggerUpdate", Some (trigger_update_to_yojson x.trigger_update));
      ("Name", Some (name_string_to_yojson x.name));
    ]

let update_table_response_to_yojson = unit_to_yojson
let non_negative_integer_to_yojson = int_to_yojson
let column_type_string_to_yojson = string_to_yojson
let comment_string_to_yojson = string_to_yojson
let parameters_map_value_to_yojson = string_to_yojson
let key_string_to_yojson = string_to_yojson

let parameters_map_to_yojson tree =
  map_to_yojson key_string_to_yojson parameters_map_value_to_yojson tree

let column_to_yojson (x : column) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("Comment", option_to_yojson comment_string_to_yojson x.comment);
      ("Type", option_to_yojson column_type_string_to_yojson x.type_);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let column_list_to_yojson tree = list_to_yojson column_to_yojson tree
let location_string_to_yojson = string_to_yojson
let location_string_list_to_yojson tree = list_to_yojson location_string_to_yojson tree
let format_string_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson
let integer_to_yojson = int_to_yojson

let ser_de_info_to_yojson (x : ser_de_info) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("SerializationLibrary", option_to_yojson name_string_to_yojson x.serialization_library);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let name_string_list_to_yojson tree = list_to_yojson name_string_to_yojson tree
let integer_flag_to_yojson = int_to_yojson

let order_to_yojson (x : order) =
  assoc_to_yojson
    [
      ("SortOrder", Some (integer_flag_to_yojson x.sort_order));
      ("Column", Some (name_string_to_yojson x.column));
    ]

let order_list_to_yojson tree = list_to_yojson order_to_yojson tree
let column_values_string_to_yojson = string_to_yojson
let column_value_string_list_to_yojson tree = list_to_yojson column_values_string_to_yojson tree

let location_map_to_yojson tree =
  map_to_yojson column_values_string_to_yojson column_values_string_to_yojson tree

let skewed_info_to_yojson (x : skewed_info) =
  assoc_to_yojson
    [
      ( "SkewedColumnValueLocationMaps",
        option_to_yojson location_map_to_yojson x.skewed_column_value_location_maps );
      ( "SkewedColumnValues",
        option_to_yojson column_value_string_list_to_yojson x.skewed_column_values );
      ("SkewedColumnNames", option_to_yojson name_string_list_to_yojson x.skewed_column_names);
    ]

let glue_resource_arn_to_yojson = string_to_yojson
let schema_registry_name_string_to_yojson = string_to_yojson

let schema_id_to_yojson (x : schema_id) =
  assoc_to_yojson
    [
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
    ]

let schema_version_id_string_to_yojson = string_to_yojson

let schema_reference_to_yojson (x : schema_reference) =
  assoc_to_yojson
    [
      ("SchemaVersionNumber", option_to_yojson version_long_number_to_yojson x.schema_version_number);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("SchemaId", option_to_yojson schema_id_to_yojson x.schema_id);
    ]

let storage_descriptor_to_yojson (x : storage_descriptor) =
  assoc_to_yojson
    [
      ("SchemaReference", option_to_yojson schema_reference_to_yojson x.schema_reference);
      ("StoredAsSubDirectories", option_to_yojson boolean__to_yojson x.stored_as_sub_directories);
      ("SkewedInfo", option_to_yojson skewed_info_to_yojson x.skewed_info);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("SortColumns", option_to_yojson order_list_to_yojson x.sort_columns);
      ("BucketColumns", option_to_yojson name_string_list_to_yojson x.bucket_columns);
      ("SerdeInfo", option_to_yojson ser_de_info_to_yojson x.serde_info);
      ("NumberOfBuckets", option_to_yojson integer_to_yojson x.number_of_buckets);
      ("Compressed", option_to_yojson boolean__to_yojson x.compressed);
      ("OutputFormat", option_to_yojson format_string_to_yojson x.output_format);
      ("InputFormat", option_to_yojson format_string_to_yojson x.input_format);
      ("AdditionalLocations", option_to_yojson location_string_list_to_yojson x.additional_locations);
      ("Location", option_to_yojson location_string_to_yojson x.location);
      ("Columns", option_to_yojson column_list_to_yojson x.columns);
    ]

let table_type_string_to_yojson = string_to_yojson

let table_identifier_to_yojson (x : table_identifier) =
  assoc_to_yojson
    [
      ("Region", option_to_yojson name_string_to_yojson x.region);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let table_input_to_yojson (x : table_input) =
  assoc_to_yojson
    [
      ("ViewDefinition", option_to_yojson view_definition_input_to_yojson x.view_definition);
      ("TargetTable", option_to_yojson table_identifier_to_yojson x.target_table);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("TableType", option_to_yojson table_type_string_to_yojson x.table_type);
      ("ViewExpandedText", option_to_yojson view_text_string_to_yojson x.view_expanded_text);
      ("ViewOriginalText", option_to_yojson view_text_string_to_yojson x.view_original_text);
      ("PartitionKeys", option_to_yojson column_list_to_yojson x.partition_keys);
      ("StorageDescriptor", option_to_yojson storage_descriptor_to_yojson x.storage_descriptor);
      ("Retention", option_to_yojson non_negative_integer_to_yojson x.retention);
      ("LastAnalyzedTime", option_to_yojson timestamp_to_yojson x.last_analyzed_time);
      ("LastAccessTime", option_to_yojson timestamp_to_yojson x.last_access_time);
      ("Owner", option_to_yojson name_string_to_yojson x.owner);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let boolean_nullable_to_yojson = bool_to_yojson
let transaction_id_string_to_yojson = string_to_yojson
let integer_list_to_yojson tree = list_to_yojson integer_to_yojson tree

let iceberg_struct_type_enum_to_yojson (x : iceberg_struct_type_enum) =
  match x with STRUCT -> `String "struct"

let column_name_string_to_yojson = string_to_yojson
let iceberg_document_to_yojson = json_to_yojson

let iceberg_struct_field_to_yojson (x : iceberg_struct_field) =
  assoc_to_yojson
    [
      ("WriteDefault", option_to_yojson iceberg_document_to_yojson x.write_default);
      ("InitialDefault", option_to_yojson iceberg_document_to_yojson x.initial_default);
      ("Doc", option_to_yojson comment_string_to_yojson x.doc);
      ("Required", Some (boolean__to_yojson x.required));
      ("Type", Some (iceberg_document_to_yojson x.type_));
      ("Name", Some (column_name_string_to_yojson x.name));
      ("Id", Some (integer_to_yojson x.id));
    ]

let iceberg_struct_field_list_to_yojson tree = list_to_yojson iceberg_struct_field_to_yojson tree

let iceberg_schema_to_yojson (x : iceberg_schema) =
  assoc_to_yojson
    [
      ("Fields", Some (iceberg_struct_field_list_to_yojson x.fields));
      ("Type", option_to_yojson iceberg_struct_type_enum_to_yojson x.type_);
      ("IdentifierFieldIds", option_to_yojson integer_list_to_yojson x.identifier_field_ids);
      ("SchemaId", option_to_yojson integer_to_yojson x.schema_id);
    ]

let iceberg_transform_string_to_yojson = string_to_yojson

let iceberg_partition_field_to_yojson (x : iceberg_partition_field) =
  assoc_to_yojson
    [
      ("FieldId", option_to_yojson integer_to_yojson x.field_id);
      ("Name", Some (column_name_string_to_yojson x.name));
      ("Transform", Some (iceberg_transform_string_to_yojson x.transform));
      ("SourceId", Some (integer_to_yojson x.source_id));
    ]

let iceberg_partition_spec_field_list_to_yojson tree =
  list_to_yojson iceberg_partition_field_to_yojson tree

let iceberg_partition_spec_to_yojson (x : iceberg_partition_spec) =
  assoc_to_yojson
    [
      ("SpecId", option_to_yojson integer_to_yojson x.spec_id);
      ("Fields", Some (iceberg_partition_spec_field_list_to_yojson x.fields));
    ]

let iceberg_sort_direction_to_yojson (x : iceberg_sort_direction) =
  match x with DESC -> `String "desc" | ASC -> `String "asc"

let iceberg_null_order_to_yojson (x : iceberg_null_order) =
  match x with NULLS_LAST -> `String "nulls-last" | NULLS_FIRST -> `String "nulls-first"

let iceberg_sort_field_to_yojson (x : iceberg_sort_field) =
  assoc_to_yojson
    [
      ("NullOrder", Some (iceberg_null_order_to_yojson x.null_order));
      ("Direction", Some (iceberg_sort_direction_to_yojson x.direction));
      ("Transform", Some (iceberg_transform_string_to_yojson x.transform));
      ("SourceId", Some (integer_to_yojson x.source_id));
    ]

let iceberg_sort_order_field_list_to_yojson tree = list_to_yojson iceberg_sort_field_to_yojson tree

let iceberg_sort_order_to_yojson (x : iceberg_sort_order) =
  assoc_to_yojson
    [
      ("Fields", Some (iceberg_sort_order_field_list_to_yojson x.fields));
      ("OrderId", Some (integer_to_yojson x.order_id));
    ]

let nullable_string_to_yojson = string_to_yojson

let string_to_string_map_to_yojson tree =
  map_to_yojson nullable_string_to_yojson nullable_string_to_yojson tree

let iceberg_update_action_to_yojson (x : iceberg_update_action) =
  match x with
  | REMOVE_ENCRYPTION_KEY -> `String "remove-encryption-key"
  | ADD_ENCRYPTION_KEY -> `String "add-encryption-key"
  | REMOVE_PROPERTIES -> `String "remove-properties"
  | SET_PROPERTIES -> `String "set-properties"
  | SET_LOCATION -> `String "set-location"
  | SET_DEFAULT_SORT_ORDER -> `String "set-default-sort-order"
  | ADD_SORT_ORDER -> `String "add-sort-order"
  | SET_DEFAULT_SPEC -> `String "set-default-spec"
  | ADD_SPEC -> `String "add-spec"
  | SET_CURRENT_SCHEMA -> `String "set-current-schema"
  | ADD_SCHEMA -> `String "add-schema"

let encryption_key_id_string_to_yojson = string_to_yojson
let encrypted_key_metadata_string_to_yojson = string_to_yojson

let iceberg_encrypted_key_to_yojson (x : iceberg_encrypted_key) =
  assoc_to_yojson
    [
      ("Properties", option_to_yojson string_to_string_map_to_yojson x.properties);
      ("EncryptedById", option_to_yojson encryption_key_id_string_to_yojson x.encrypted_by_id);
      ( "EncryptedKeyMetadata",
        Some (encrypted_key_metadata_string_to_yojson x.encrypted_key_metadata) );
      ("KeyId", Some (encryption_key_id_string_to_yojson x.key_id));
    ]

let iceberg_table_update_to_yojson (x : iceberg_table_update) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson encryption_key_id_string_to_yojson x.key_id);
      ("EncryptionKey", option_to_yojson iceberg_encrypted_key_to_yojson x.encryption_key);
      ("Action", option_to_yojson iceberg_update_action_to_yojson x.action);
      ("Properties", option_to_yojson string_to_string_map_to_yojson x.properties);
      ("Location", Some (location_string_to_yojson x.location));
      ("SortOrder", option_to_yojson iceberg_sort_order_to_yojson x.sort_order);
      ("PartitionSpec", option_to_yojson iceberg_partition_spec_to_yojson x.partition_spec);
      ("Schema", Some (iceberg_schema_to_yojson x.schema));
    ]

let iceberg_table_update_list_to_yojson tree = list_to_yojson iceberg_table_update_to_yojson tree

let update_iceberg_table_input_to_yojson (x : update_iceberg_table_input) =
  assoc_to_yojson [ ("Updates", Some (iceberg_table_update_list_to_yojson x.updates)) ]

let update_iceberg_input_to_yojson (x : update_iceberg_input) =
  assoc_to_yojson
    [
      ( "UpdateIcebergTableInput",
        Some (update_iceberg_table_input_to_yojson x.update_iceberg_table_input) );
    ]

let update_open_table_format_input_to_yojson (x : update_open_table_format_input) =
  assoc_to_yojson
    [
      ("UpdateIcebergInput", option_to_yojson update_iceberg_input_to_yojson x.update_iceberg_input);
    ]

let update_table_request_to_yojson (x : update_table_request) =
  assoc_to_yojson
    [
      ( "UpdateOpenTableFormatInput",
        option_to_yojson update_open_table_format_input_to_yojson x.update_open_table_format_input
      );
      ("Force", option_to_yojson boolean__to_yojson x.force);
      ("ViewUpdateAction", option_to_yojson view_update_action_to_yojson x.view_update_action);
      ("VersionId", option_to_yojson version_string_to_yojson x.version_id);
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ("SkipArchive", option_to_yojson boolean_nullable_to_yojson x.skip_archive);
      ("TableInput", option_to_yojson table_input_to_yojson x.table_input);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let update_table_optimizer_response_to_yojson = unit_to_yojson

let table_optimizer_type_to_yojson (x : table_optimizer_type) =
  match x with
  | ORPHAN_FILE_DELETION -> `String "orphan_file_deletion"
  | RETENTION -> `String "retention"
  | COMPACTION -> `String "compaction"

let table_optimizer_vpc_configuration_to_yojson (x : table_optimizer_vpc_configuration) =
  match x with
  | GlueConnectionName arg ->
      assoc_to_yojson [ ("glueConnectionName", Some (glue_connection_name_string_to_yojson arg)) ]

let compaction_strategy_to_yojson (x : compaction_strategy) =
  match x with ZORDER -> `String "z-order" | SORT -> `String "sort" | BINPACK -> `String "binpack"

let iceberg_compaction_configuration_to_yojson (x : iceberg_compaction_configuration) =
  assoc_to_yojson
    [
      ("deleteFileThreshold", option_to_yojson nullable_integer_to_yojson x.delete_file_threshold);
      ("minInputFiles", option_to_yojson nullable_integer_to_yojson x.min_input_files);
      ("strategy", option_to_yojson compaction_strategy_to_yojson x.strategy);
    ]

let compaction_configuration_to_yojson (x : compaction_configuration) =
  assoc_to_yojson
    [
      ( "icebergConfiguration",
        option_to_yojson iceberg_compaction_configuration_to_yojson x.iceberg_configuration );
    ]

let iceberg_retention_configuration_to_yojson (x : iceberg_retention_configuration) =
  assoc_to_yojson
    [
      ("runRateInHours", option_to_yojson nullable_integer_to_yojson x.run_rate_in_hours);
      ("cleanExpiredFiles", option_to_yojson nullable_boolean_to_yojson x.clean_expired_files);
      ( "numberOfSnapshotsToRetain",
        option_to_yojson nullable_integer_to_yojson x.number_of_snapshots_to_retain );
      ( "snapshotRetentionPeriodInDays",
        option_to_yojson nullable_integer_to_yojson x.snapshot_retention_period_in_days );
    ]

let retention_configuration_to_yojson (x : retention_configuration) =
  assoc_to_yojson
    [
      ( "icebergConfiguration",
        option_to_yojson iceberg_retention_configuration_to_yojson x.iceberg_configuration );
    ]

let iceberg_orphan_file_deletion_configuration_to_yojson
    (x : iceberg_orphan_file_deletion_configuration) =
  assoc_to_yojson
    [
      ("runRateInHours", option_to_yojson nullable_integer_to_yojson x.run_rate_in_hours);
      ("location", option_to_yojson message_string_to_yojson x.location);
      ( "orphanFileRetentionPeriodInDays",
        option_to_yojson nullable_integer_to_yojson x.orphan_file_retention_period_in_days );
    ]

let orphan_file_deletion_configuration_to_yojson (x : orphan_file_deletion_configuration) =
  assoc_to_yojson
    [
      ( "icebergConfiguration",
        option_to_yojson iceberg_orphan_file_deletion_configuration_to_yojson
          x.iceberg_configuration );
    ]

let table_optimizer_configuration_to_yojson (x : table_optimizer_configuration) =
  assoc_to_yojson
    [
      ( "orphanFileDeletionConfiguration",
        option_to_yojson orphan_file_deletion_configuration_to_yojson
          x.orphan_file_deletion_configuration );
      ( "retentionConfiguration",
        option_to_yojson retention_configuration_to_yojson x.retention_configuration );
      ( "compactionConfiguration",
        option_to_yojson compaction_configuration_to_yojson x.compaction_configuration );
      ( "vpcConfiguration",
        option_to_yojson table_optimizer_vpc_configuration_to_yojson x.vpc_configuration );
      ("enabled", option_to_yojson nullable_boolean_to_yojson x.enabled);
      ("roleArn", option_to_yojson arn_string_to_yojson x.role_arn);
    ]

let update_table_optimizer_request_to_yojson (x : update_table_optimizer_request) =
  assoc_to_yojson
    [
      ( "TableOptimizerConfiguration",
        Some (table_optimizer_configuration_to_yojson x.table_optimizer_configuration) );
      ("Type", Some (table_optimizer_type_to_yojson x.type_));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let resource_number_limit_exceeded_exception_to_yojson
    (x : resource_number_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let resource_not_ready_exception_to_yojson (x : resource_not_ready_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let federation_source_retryable_exception_to_yojson (x : federation_source_retryable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let federation_source_error_code_to_yojson (x : federation_source_error_code) =
  match x with
  | ThrottlingException -> `String "ThrottlingException"
  | PartialFailureException -> `String "PartialFailureException"
  | InternalServiceException -> `String "InternalServiceException"
  | OperationNotSupportedException -> `String "OperationNotSupportedException"
  | OperationTimeoutException -> `String "OperationTimeoutException"
  | InvalidResponseException -> `String "InvalidResponseException"
  | InvalidInputException -> `String "InvalidInputException"
  | InvalidCredentialsException -> `String "InvalidCredentialsException"
  | EntityNotFoundException -> `String "EntityNotFoundException"
  | AccessDeniedException -> `String "AccessDeniedException"

let federation_source_exception_to_yojson (x : federation_source_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson message_string_to_yojson x.message);
      ( "FederationSourceErrorCode",
        option_to_yojson federation_source_error_code_to_yojson x.federation_source_error_code );
    ]

let already_exists_exception_to_yojson (x : already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_source_control_from_job_response_to_yojson (x : update_source_control_from_job_response)
    =
  assoc_to_yojson [ ("JobName", option_to_yojson name_string_to_yojson x.job_name) ]

let source_control_provider_to_yojson (x : source_control_provider) =
  match x with
  | AWS_CODE_COMMIT -> `String "AWS_CODE_COMMIT"
  | BITBUCKET -> `String "BITBUCKET"
  | GITLAB -> `String "GITLAB"
  | GITHUB -> `String "GITHUB"

let commit_id_string_to_yojson = string_to_yojson

let source_control_auth_strategy_to_yojson (x : source_control_auth_strategy) =
  match x with
  | AWS_SECRETS_MANAGER -> `String "AWS_SECRETS_MANAGER"
  | PERSONAL_ACCESS_TOKEN -> `String "PERSONAL_ACCESS_TOKEN"

let auth_token_string_to_yojson = string_to_yojson

let update_source_control_from_job_request_to_yojson (x : update_source_control_from_job_request) =
  assoc_to_yojson
    [
      ("AuthToken", option_to_yojson auth_token_string_to_yojson x.auth_token);
      ("AuthStrategy", option_to_yojson source_control_auth_strategy_to_yojson x.auth_strategy);
      ("CommitId", option_to_yojson commit_id_string_to_yojson x.commit_id);
      ("Folder", option_to_yojson name_string_to_yojson x.folder);
      ("BranchName", option_to_yojson name_string_to_yojson x.branch_name);
      ("RepositoryOwner", option_to_yojson name_string_to_yojson x.repository_owner);
      ("RepositoryName", option_to_yojson name_string_to_yojson x.repository_name);
      ("Provider", option_to_yojson source_control_provider_to_yojson x.provider);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
    ]

let update_schema_response_to_yojson (x : update_schema_response) =
  assoc_to_yojson
    [
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
    ]

let latest_schema_version_boolean_to_yojson = bool_to_yojson

let schema_version_number_to_yojson (x : schema_version_number) =
  assoc_to_yojson
    [
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("LatestVersion", option_to_yojson latest_schema_version_boolean_to_yojson x.latest_version);
    ]

let compatibility_to_yojson (x : compatibility) =
  match x with
  | FULL_ALL -> `String "FULL_ALL"
  | FULL -> `String "FULL"
  | FORWARD_ALL -> `String "FORWARD_ALL"
  | FORWARD -> `String "FORWARD"
  | BACKWARD_ALL -> `String "BACKWARD_ALL"
  | BACKWARD -> `String "BACKWARD"
  | DISABLED -> `String "DISABLED"
  | NONE -> `String "NONE"

let update_schema_input_to_yojson (x : update_schema_input) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Compatibility", option_to_yojson compatibility_to_yojson x.compatibility);
      ( "SchemaVersionNumber",
        option_to_yojson schema_version_number_to_yojson x.schema_version_number );
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
    ]

let update_registry_response_to_yojson (x : update_registry_response) =
  assoc_to_yojson
    [
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
    ]

let registry_id_to_yojson (x : registry_id) =
  assoc_to_yojson
    [
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
    ]

let update_registry_input_to_yojson (x : update_registry_input) =
  assoc_to_yojson
    [
      ("Description", Some (description_string_to_yojson x.description));
      ("RegistryId", Some (registry_id_to_yojson x.registry_id));
    ]

let update_partition_response_to_yojson = unit_to_yojson
let bounded_partition_value_list_to_yojson tree = list_to_yojson value_string_to_yojson tree

let partition_input_to_yojson (x : partition_input) =
  assoc_to_yojson
    [
      ("LastAnalyzedTime", option_to_yojson timestamp_to_yojson x.last_analyzed_time);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("StorageDescriptor", option_to_yojson storage_descriptor_to_yojson x.storage_descriptor);
      ("LastAccessTime", option_to_yojson timestamp_to_yojson x.last_access_time);
      ("Values", option_to_yojson value_string_list_to_yojson x.values);
    ]

let update_partition_request_to_yojson (x : update_partition_request) =
  assoc_to_yojson
    [
      ("PartitionInput", Some (partition_input_to_yojson x.partition_input));
      ("PartitionValueList", Some (bounded_partition_value_list_to_yojson x.partition_value_list));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let update_ml_transform_response_to_yojson (x : update_ml_transform_response) =
  assoc_to_yojson [ ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id) ]

let transform_type_to_yojson (x : transform_type) =
  match x with FIND_MATCHES -> `String "FIND_MATCHES"

let generic_bounded_double_to_yojson = double_to_yojson

let find_matches_parameters_to_yojson (x : find_matches_parameters) =
  assoc_to_yojson
    [
      ( "EnforceProvidedLabels",
        option_to_yojson nullable_boolean_to_yojson x.enforce_provided_labels );
      ( "AccuracyCostTradeoff",
        option_to_yojson generic_bounded_double_to_yojson x.accuracy_cost_tradeoff );
      ( "PrecisionRecallTradeoff",
        option_to_yojson generic_bounded_double_to_yojson x.precision_recall_tradeoff );
      ( "PrimaryKeyColumnName",
        option_to_yojson column_name_string_to_yojson x.primary_key_column_name );
    ]

let transform_parameters_to_yojson (x : transform_parameters) =
  assoc_to_yojson
    [
      ( "FindMatchesParameters",
        option_to_yojson find_matches_parameters_to_yojson x.find_matches_parameters );
      ("TransformType", Some (transform_type_to_yojson x.transform_type));
    ]

let role_string_to_yojson = string_to_yojson

let update_ml_transform_request_to_yojson (x : update_ml_transform_request) =
  assoc_to_yojson
    [
      ("MaxRetries", option_to_yojson nullable_integer_to_yojson x.max_retries);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("Parameters", option_to_yojson transform_parameters_to_yojson x.parameters);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
    ]

let json_path_to_yojson = string_to_yojson

let update_json_classifier_request_to_yojson (x : update_json_classifier_request) =
  assoc_to_yojson
    [
      ("JsonPath", option_to_yojson json_path_to_yojson x.json_path);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let update_job_response_to_yojson (x : update_job_response) =
  assoc_to_yojson [ ("JobName", option_to_yojson name_string_to_yojson x.job_name) ]

let max_concurrent_runs_to_yojson = int_to_yojson

let execution_property_to_yojson (x : execution_property) =
  assoc_to_yojson
    [ ("MaxConcurrentRuns", option_to_yojson max_concurrent_runs_to_yojson x.max_concurrent_runs) ]

let script_location_string_to_yojson = string_to_yojson
let python_version_string_to_yojson = string_to_yojson
let runtime_name_string_to_yojson = string_to_yojson

let job_command_to_yojson (x : job_command) =
  assoc_to_yojson
    [
      ("Runtime", option_to_yojson runtime_name_string_to_yojson x.runtime);
      ("PythonVersion", option_to_yojson python_version_string_to_yojson x.python_version);
      ("ScriptLocation", option_to_yojson script_location_string_to_yojson x.script_location);
      ("Name", option_to_yojson generic_string_to_yojson x.name);
    ]

let connection_string_to_yojson = string_to_yojson
let connection_string_list_to_yojson tree = list_to_yojson connection_string_to_yojson tree

let connections_list_to_yojson (x : connections_list) =
  assoc_to_yojson
    [ ("Connections", option_to_yojson connection_string_list_to_yojson x.connections) ]

let max_retries_to_yojson = int_to_yojson
let node_name_to_yojson = string_to_yojson
let enclosed_in_string_property_with_quote_to_yojson = string_to_yojson
let glue_studio_column_name_string_to_yojson = string_to_yojson

let glue_studio_schema_column_to_yojson (x : glue_studio_schema_column) =
  assoc_to_yojson
    [
      ("GlueStudioType", option_to_yojson column_type_string_to_yojson x.glue_studio_type);
      ("Type", option_to_yojson column_type_string_to_yojson x.type_);
      ("Name", Some (glue_studio_column_name_string_to_yojson x.name));
    ]

let glue_studio_schema_column_list_to_yojson tree =
  list_to_yojson glue_studio_schema_column_to_yojson tree

let glue_schema_to_yojson (x : glue_schema) =
  assoc_to_yojson
    [ ("Columns", option_to_yojson glue_studio_schema_column_list_to_yojson x.columns) ]

let glue_schemas_to_yojson tree = list_to_yojson glue_schema_to_yojson tree

let athena_connector_source_to_yojson (x : athena_connector_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("SchemaName", Some (enclosed_in_string_property_to_yojson x.schema_name));
      ( "ConnectionTable",
        option_to_yojson enclosed_in_string_property_with_quote_to_yojson x.connection_table );
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("ConnectorName", Some (enclosed_in_string_property_to_yojson x.connector_name));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let boxed_non_negative_long_to_yojson = long_to_yojson

let enclosed_in_string_properties_to_yojson tree =
  list_to_yojson enclosed_in_string_property_to_yojson tree

let glue_record_type_to_yojson (x : glue_record_type) =
  match x with
  | DOUBLE -> `String "DOUBLE"
  | SHORT -> `String "SHORT"
  | BYTE -> `String "BYTE"
  | BIGDECIMAL -> `String "BIGDECIMAL"
  | LONG -> `String "LONG"
  | FLOAT -> `String "FLOAT"
  | INT -> `String "INT"
  | TIMESTAMP -> `String "TIMESTAMP"
  | STRING -> `String "STRING"
  | DATE -> `String "DATE"

let jdbc_data_type_to_yojson (x : jdbc_data_type) =
  match x with
  | VARCHAR -> `String "VARCHAR"
  | VARBINARY -> `String "VARBINARY"
  | TINYINT -> `String "TINYINT"
  | TIMESTAMP_WITH_TIMEZONE -> `String "TIMESTAMP_WITH_TIMEZONE"
  | TIMESTAMP -> `String "TIMESTAMP"
  | TIME_WITH_TIMEZONE -> `String "TIME_WITH_TIMEZONE"
  | TIME -> `String "TIME"
  | STRUCT -> `String "STRUCT"
  | SQLXML -> `String "SQLXML"
  | SMALLINT -> `String "SMALLINT"
  | ROWID -> `String "ROWID"
  | REF_CURSOR -> `String "REF_CURSOR"
  | REF -> `String "REF"
  | REAL -> `String "REAL"
  | OTHER -> `String "OTHER"
  | NVARCHAR -> `String "NVARCHAR"
  | NUMERIC -> `String "NUMERIC"
  | NULL -> `String "NULL"
  | NCLOB -> `String "NCLOB"
  | NCHAR -> `String "NCHAR"
  | LONGVARCHAR -> `String "LONGVARCHAR"
  | LONGVARBINARY -> `String "LONGVARBINARY"
  | LONGNVARCHAR -> `String "LONGNVARCHAR"
  | JAVA_OBJECT -> `String "JAVA_OBJECT"
  | INTEGER -> `String "INTEGER"
  | FLOAT -> `String "FLOAT"
  | DOUBLE -> `String "DOUBLE"
  | DISTINCT -> `String "DISTINCT"
  | DECIMAL -> `String "DECIMAL"
  | DATE -> `String "DATE"
  | DATALINK -> `String "DATALINK"
  | CLOB -> `String "CLOB"
  | CHAR -> `String "CHAR"
  | BOOLEAN -> `String "BOOLEAN"
  | BLOB -> `String "BLOB"
  | BIT -> `String "BIT"
  | BINARY -> `String "BINARY"
  | BIGINT -> `String "BIGINT"
  | ARRAY -> `String "ARRAY"

let jdbc_data_type_mapping_to_yojson tree =
  map_to_yojson jdbc_data_type_to_yojson glue_record_type_to_yojson tree

let jdbc_connector_options_to_yojson (x : jdbc_connector_options) =
  assoc_to_yojson
    [
      ("DataTypeMapping", option_to_yojson jdbc_data_type_mapping_to_yojson x.data_type_mapping);
      ( "JobBookmarkKeysSortOrder",
        option_to_yojson enclosed_in_string_property_to_yojson x.job_bookmark_keys_sort_order );
      ( "JobBookmarkKeys",
        option_to_yojson enclosed_in_string_properties_to_yojson x.job_bookmark_keys );
      ("NumPartitions", option_to_yojson boxed_non_negative_long_to_yojson x.num_partitions);
      ("UpperBound", option_to_yojson boxed_non_negative_long_to_yojson x.upper_bound);
      ("LowerBound", option_to_yojson boxed_non_negative_long_to_yojson x.lower_bound);
      ("PartitionColumn", option_to_yojson enclosed_in_string_property_to_yojson x.partition_column);
      ("FilterPredicate", option_to_yojson enclosed_in_string_property_to_yojson x.filter_predicate);
    ]

let sql_query_to_yojson = string_to_yojson

let jdbc_connector_source_to_yojson (x : jdbc_connector_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("Query", option_to_yojson sql_query_to_yojson x.query);
      ( "ConnectionTable",
        option_to_yojson enclosed_in_string_property_with_quote_to_yojson x.connection_table );
      ("AdditionalOptions", option_to_yojson jdbc_connector_options_to_yojson x.additional_options);
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("ConnectorName", Some (enclosed_in_string_property_to_yojson x.connector_name));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let additional_options_to_yojson tree =
  map_to_yojson enclosed_in_string_property_to_yojson enclosed_in_string_property_to_yojson tree

let spark_connector_source_to_yojson (x : spark_connector_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("ConnectorName", Some (enclosed_in_string_property_to_yojson x.connector_name));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let catalog_source_to_yojson (x : catalog_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "PartitionPredicate",
        option_to_yojson enclosed_in_string_property_to_yojson x.partition_predicate );
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let redshift_source_to_yojson (x : redshift_source) =
  assoc_to_yojson
    [
      ("TmpDirIAMRole", option_to_yojson enclosed_in_string_property_to_yojson x.tmp_dir_iam_role);
      ("RedshiftTmpDir", option_to_yojson enclosed_in_string_property_to_yojson x.redshift_tmp_dir);
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let boxed_long_to_yojson = long_to_yojson

let s3_source_additional_options_to_yojson (x : s3_source_additional_options) =
  assoc_to_yojson
    [
      ("BoundedFiles", option_to_yojson boxed_long_to_yojson x.bounded_files);
      ("BoundedSize", option_to_yojson boxed_long_to_yojson x.bounded_size);
    ]

let s3_catalog_source_to_yojson (x : s3_catalog_source) =
  assoc_to_yojson
    [
      ( "AdditionalOptions",
        option_to_yojson s3_source_additional_options_to_yojson x.additional_options );
      ( "PartitionPredicate",
        option_to_yojson enclosed_in_string_property_to_yojson x.partition_predicate );
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let compression_type_to_yojson (x : compression_type) =
  match x with BZIP2 -> `String "bzip2" | GZIP -> `String "gzip"

let boxed_boolean_to_yojson = bool_to_yojson
let boxed_non_negative_int_to_yojson = int_to_yojson

let s3_direct_source_additional_options_to_yojson (x : s3_direct_source_additional_options) =
  assoc_to_yojson
    [
      ("SamplePath", option_to_yojson enclosed_in_string_property_to_yojson x.sample_path);
      ("EnableSamplePath", option_to_yojson boxed_boolean_to_yojson x.enable_sample_path);
      ("BoundedFiles", option_to_yojson boxed_long_to_yojson x.bounded_files);
      ("BoundedSize", option_to_yojson boxed_long_to_yojson x.bounded_size);
    ]

let separator_to_yojson (x : separator) =
  match x with
  | TAB -> `String "tab"
  | SEMICOLON -> `String "semicolon"
  | PIPE -> `String "pipe"
  | CTRLA -> `String "ctrla"
  | COMMA -> `String "comma"

let quote_char_to_yojson (x : quote_char) =
  match x with
  | DISABLED -> `String "disabled"
  | SINGLE_QUOTE -> `String "single_quote"
  | QUILLEMET -> `String "quillemet"
  | QUOTE -> `String "quote"

let boolean_value_to_yojson = bool_to_yojson

let s3_csv_source_to_yojson (x : s3_csv_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("OptimizePerformance", option_to_yojson boolean_value_to_yojson x.optimize_performance);
      ("SkipFirst", option_to_yojson boxed_boolean_to_yojson x.skip_first);
      ("WriteHeader", option_to_yojson boxed_boolean_to_yojson x.write_header);
      ("WithHeader", option_to_yojson boxed_boolean_to_yojson x.with_header);
      ("Multiline", option_to_yojson boxed_boolean_to_yojson x.multiline);
      ("QuoteChar", Some (quote_char_to_yojson x.quote_char));
      ("Escaper", option_to_yojson enclosed_in_string_property_with_quote_to_yojson x.escaper);
      ("Separator", Some (separator_to_yojson x.separator));
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ("MaxFilesInBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_files_in_band);
      ("MaxBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_band);
      ("Recurse", option_to_yojson boxed_boolean_to_yojson x.recurse);
      ("GroupFiles", option_to_yojson enclosed_in_string_property_to_yojson x.group_files);
      ("GroupSize", option_to_yojson enclosed_in_string_property_to_yojson x.group_size);
      ("Exclusions", option_to_yojson enclosed_in_string_properties_to_yojson x.exclusions);
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let s3_json_source_to_yojson (x : s3_json_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("Multiline", option_to_yojson boxed_boolean_to_yojson x.multiline);
      ("JsonPath", option_to_yojson enclosed_in_string_property_to_yojson x.json_path);
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ("MaxFilesInBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_files_in_band);
      ("MaxBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_band);
      ("Recurse", option_to_yojson boxed_boolean_to_yojson x.recurse);
      ("GroupFiles", option_to_yojson enclosed_in_string_property_to_yojson x.group_files);
      ("GroupSize", option_to_yojson enclosed_in_string_property_to_yojson x.group_size);
      ("Exclusions", option_to_yojson enclosed_in_string_properties_to_yojson x.exclusions);
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let parquet_compression_type_to_yojson (x : parquet_compression_type) =
  match x with
  | NONE -> `String "none"
  | UNCOMPRESSED -> `String "uncompressed"
  | LZ4 -> `String "lz4"
  | BROTLI -> `String "brotli"
  | GZIP -> `String "gzip"
  | LZO -> `String "lzo"
  | SNAPPY -> `String "snappy"

let s3_parquet_source_to_yojson (x : s3_parquet_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ("MaxFilesInBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_files_in_band);
      ("MaxBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_band);
      ("Recurse", option_to_yojson boxed_boolean_to_yojson x.recurse);
      ("GroupFiles", option_to_yojson enclosed_in_string_property_to_yojson x.group_files);
      ("GroupSize", option_to_yojson enclosed_in_string_property_to_yojson x.group_size);
      ("Exclusions", option_to_yojson enclosed_in_string_properties_to_yojson x.exclusions);
      ("CompressionType", option_to_yojson parquet_compression_type_to_yojson x.compression_type);
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let relational_catalog_source_to_yojson (x : relational_catalog_source) =
  assoc_to_yojson
    [
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let ddbelt_catalog_additional_options_to_yojson (x : ddbelt_catalog_additional_options) =
  assoc_to_yojson
    [
      ("DynamodbUnnestDDBJson", option_to_yojson boolean_value_to_yojson x.dynamodb_unnest_ddb_json);
      ("DynamodbExport", option_to_yojson enclosed_in_string_property_to_yojson x.dynamodb_export);
    ]

let dynamo_db_catalog_source_to_yojson (x : dynamo_db_catalog_source) =
  assoc_to_yojson
    [
      ( "AdditionalOptions",
        option_to_yojson ddbelt_catalog_additional_options_to_yojson x.additional_options );
      ("PitrEnabled", option_to_yojson boxed_boolean_to_yojson x.pitr_enabled);
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let node_id_to_yojson = string_to_yojson
let one_input_to_yojson tree = list_to_yojson node_id_to_yojson tree

let jdbc_connector_target_to_yojson (x : jdbc_connector_target) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("ConnectorName", Some (enclosed_in_string_property_to_yojson x.connector_name));
      ("ConnectionTable", Some (enclosed_in_string_property_with_quote_to_yojson x.connection_table));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let spark_connector_target_to_yojson (x : spark_connector_target) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("ConnectorName", Some (enclosed_in_string_property_to_yojson x.connector_name));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let glue_studio_path_list_to_yojson tree =
  list_to_yojson enclosed_in_string_properties_to_yojson tree

let basic_catalog_target_to_yojson (x : basic_catalog_target) =
  assoc_to_yojson
    [
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let redshift_target_to_yojson (x : redshift_target) =
  assoc_to_yojson
    [
      ( "UpsertRedshiftOptions",
        option_to_yojson upsert_redshift_target_options_to_yojson x.upsert_redshift_options );
      ("TmpDirIAMRole", option_to_yojson enclosed_in_string_property_to_yojson x.tmp_dir_iam_role);
      ("RedshiftTmpDir", option_to_yojson enclosed_in_string_property_to_yojson x.redshift_tmp_dir);
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let update_catalog_behavior_to_yojson (x : update_catalog_behavior) =
  match x with LOG -> `String "LOG" | UPDATE_IN_DATABASE -> `String "UPDATE_IN_DATABASE"

let catalog_schema_change_policy_to_yojson (x : catalog_schema_change_policy) =
  assoc_to_yojson
    [
      ("UpdateBehavior", option_to_yojson update_catalog_behavior_to_yojson x.update_behavior);
      ("EnableUpdateCatalog", option_to_yojson boxed_boolean_to_yojson x.enable_update_catalog);
    ]

let auto_data_quality_to_yojson (x : auto_data_quality) =
  assoc_to_yojson
    [
      ( "EvaluationContext",
        option_to_yojson enclosed_in_string_property_to_yojson x.evaluation_context );
      ("IsEnabled", option_to_yojson boolean_value_to_yojson x.is_enabled);
    ]

let s3_catalog_target_to_yojson (x : s3_catalog_target) =
  assoc_to_yojson
    [
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ( "SchemaChangePolicy",
        option_to_yojson catalog_schema_change_policy_to_yojson x.schema_change_policy );
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let number_target_partitions_string_to_yojson = string_to_yojson

let direct_schema_change_policy_to_yojson (x : direct_schema_change_policy) =
  assoc_to_yojson
    [
      ("Database", option_to_yojson enclosed_in_string_property_to_yojson x.database);
      ("Table", option_to_yojson enclosed_in_string_property_to_yojson x.table);
      ("UpdateBehavior", option_to_yojson update_catalog_behavior_to_yojson x.update_behavior);
      ("EnableUpdateCatalog", option_to_yojson boxed_boolean_to_yojson x.enable_update_catalog);
    ]

let s3_glue_parquet_target_to_yojson (x : s3_glue_parquet_target) =
  assoc_to_yojson
    [
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ( "NumberTargetPartitions",
        option_to_yojson number_target_partitions_string_to_yojson x.number_target_partitions );
      ("Compression", option_to_yojson parquet_compression_type_to_yojson x.compression);
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let target_format_to_yojson (x : target_format) =
  match x with
  | XML -> `String "xml"
  | HYPER -> `String "hyper"
  | ICEBERG -> `String "iceberg"
  | DELTA -> `String "delta"
  | HUDI -> `String "hudi"
  | PARQUET -> `String "parquet"
  | ORC -> `String "orc"
  | AVRO -> `String "avro"
  | CSV -> `String "csv"
  | JSON -> `String "json"

let s3_direct_target_to_yojson (x : s3_direct_target) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ("Format", Some (target_format_to_yojson x.format));
      ( "NumberTargetPartitions",
        option_to_yojson number_target_partitions_string_to_yojson x.number_target_partitions );
      ("Compression", option_to_yojson enclosed_in_string_property_to_yojson x.compression);
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let rec mapping_to_yojson (x : mapping) =
  assoc_to_yojson
    [
      ("Children", option_to_yojson mappings_to_yojson x.children);
      ("Dropped", option_to_yojson boxed_boolean_to_yojson x.dropped);
      ("ToType", option_to_yojson enclosed_in_string_property_to_yojson x.to_type);
      ("FromType", option_to_yojson enclosed_in_string_property_to_yojson x.from_type);
      ("FromPath", option_to_yojson enclosed_in_string_properties_to_yojson x.from_path);
      ("ToKey", option_to_yojson enclosed_in_string_property_to_yojson x.to_key);
    ]

and mappings_to_yojson tree = list_to_yojson mapping_to_yojson tree

let apply_mapping_to_yojson (x : apply_mapping) =
  assoc_to_yojson
    [
      ("Mapping", Some (mappings_to_yojson x.mapping));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let select_fields_to_yojson (x : select_fields) =
  assoc_to_yojson
    [
      ("Paths", Some (glue_studio_path_list_to_yojson x.paths));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let drop_fields_to_yojson (x : drop_fields) =
  assoc_to_yojson
    [
      ("Paths", Some (glue_studio_path_list_to_yojson x.paths));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let rename_field_to_yojson (x : rename_field) =
  assoc_to_yojson
    [
      ("TargetPath", Some (enclosed_in_string_properties_to_yojson x.target_path));
      ("SourcePath", Some (enclosed_in_string_properties_to_yojson x.source_path));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let topk_to_yojson = int_to_yojson
let prob_to_yojson = double_to_yojson

let spigot_to_yojson (x : spigot) =
  assoc_to_yojson
    [
      ("Prob", option_to_yojson prob_to_yojson x.prob);
      ("Topk", option_to_yojson topk_to_yojson x.topk);
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let two_inputs_to_yojson tree = list_to_yojson node_id_to_yojson tree

let join_type_to_yojson (x : join_type) =
  match x with
  | LEFT_ANTI -> `String "leftanti"
  | LEFT_SEMI -> `String "leftsemi"
  | OUTER -> `String "outer"
  | RIGHT -> `String "right"
  | LEFT -> `String "left"
  | EQUIJOIN -> `String "equijoin"

let join_column_to_yojson (x : join_column) =
  assoc_to_yojson
    [
      ("Keys", Some (glue_studio_path_list_to_yojson x.keys));
      ("From", Some (enclosed_in_string_property_to_yojson x.from_));
    ]

let join_columns_to_yojson tree = list_to_yojson join_column_to_yojson tree

let join_to_yojson (x : join) =
  assoc_to_yojson
    [
      ("Columns", Some (join_columns_to_yojson x.columns));
      ("JoinType", Some (join_type_to_yojson x.join_type));
      ("Inputs", Some (two_inputs_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let split_fields_to_yojson (x : split_fields) =
  assoc_to_yojson
    [
      ("Paths", Some (glue_studio_path_list_to_yojson x.paths));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let non_negative_int_to_yojson = int_to_yojson

let select_from_collection_to_yojson (x : select_from_collection) =
  assoc_to_yojson
    [
      ("Index", Some (non_negative_int_to_yojson x.index));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let fill_missing_values_to_yojson (x : fill_missing_values) =
  assoc_to_yojson
    [
      ("FilledPath", option_to_yojson enclosed_in_string_property_to_yojson x.filled_path);
      ("ImputedPath", Some (enclosed_in_string_property_to_yojson x.imputed_path));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let filter_logical_operator_to_yojson (x : filter_logical_operator) =
  match x with OR -> `String "OR" | AND -> `String "AND"

let filter_operation_to_yojson (x : filter_operation) =
  match x with
  | ISNULL -> `String "ISNULL"
  | REGEX -> `String "REGEX"
  | GTE -> `String "GTE"
  | LTE -> `String "LTE"
  | GT -> `String "GT"
  | LT -> `String "LT"
  | EQ -> `String "EQ"

let filter_value_type_to_yojson (x : filter_value_type) =
  match x with CONSTANT -> `String "CONSTANT" | COLUMNEXTRACTED -> `String "COLUMNEXTRACTED"

let filter_value_to_yojson (x : filter_value) =
  assoc_to_yojson
    [
      ("Value", Some (enclosed_in_string_properties_to_yojson x.value));
      ("Type", Some (filter_value_type_to_yojson x.type_));
    ]

let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let filter_expression_to_yojson (x : filter_expression) =
  assoc_to_yojson
    [
      ("Values", Some (filter_values_to_yojson x.values));
      ("Negated", option_to_yojson boxed_boolean_to_yojson x.negated);
      ("Operation", Some (filter_operation_to_yojson x.operation));
    ]

let filter_expressions_to_yojson tree = list_to_yojson filter_expression_to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Filters", Some (filter_expressions_to_yojson x.filters));
      ("LogicalOperator", Some (filter_logical_operator_to_yojson x.logical_operator));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let many_inputs_to_yojson tree = list_to_yojson node_id_to_yojson tree
let extended_string_to_yojson = string_to_yojson

let custom_code_to_yojson (x : custom_code) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("ClassName", Some (enclosed_in_string_property_to_yojson x.class_name));
      ("Code", Some (extended_string_to_yojson x.code));
      ("Inputs", Some (many_inputs_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let sql_alias_to_yojson (x : sql_alias) =
  assoc_to_yojson
    [
      ("Alias", Some (enclosed_in_string_property_with_quote_to_yojson x.alias));
      ("From", Some (node_id_to_yojson x.from_));
    ]

let sql_aliases_to_yojson tree = list_to_yojson sql_alias_to_yojson tree

let spark_sq_l_to_yojson (x : spark_sq_l) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("SqlAliases", Some (sql_aliases_to_yojson x.sql_aliases));
      ("SqlQuery", Some (sql_query_to_yojson x.sql_query));
      ("Inputs", Some (many_inputs_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let boxed_positive_int_to_yojson = int_to_yojson

let starting_position_to_yojson (x : starting_position) =
  match x with
  | TIMESTAMP -> `String "timestamp"
  | EARLIEST -> `String "earliest"
  | TRIM_HORIZON -> `String "trim_horizon"
  | LATEST -> `String "latest"

let iso8601_date_time_to_yojson = timestamp_iso_8601_to_yojson

let kinesis_streaming_source_options_to_yojson (x : kinesis_streaming_source_options) =
  assoc_to_yojson
    [
      ( "FanoutConsumerARN",
        option_to_yojson enclosed_in_string_property_to_yojson x.fanout_consumer_ar_n );
      ("StartingTimestamp", option_to_yojson iso8601_date_time_to_yojson x.starting_timestamp);
      ( "EmitConsumerLagMetrics",
        option_to_yojson enclosed_in_string_property_to_yojson x.emit_consumer_lag_metrics );
      ( "AddRecordTimestamp",
        option_to_yojson enclosed_in_string_property_to_yojson x.add_record_timestamp );
      ("RoleSessionName", option_to_yojson enclosed_in_string_property_to_yojson x.role_session_name);
      ("RoleArn", option_to_yojson enclosed_in_string_property_to_yojson x.role_arn);
      ("StreamArn", option_to_yojson enclosed_in_string_property_to_yojson x.stream_arn);
      ("AvoidEmptyBatches", option_to_yojson boxed_boolean_to_yojson x.avoid_empty_batches);
      ( "MaxRetryIntervalMs",
        option_to_yojson boxed_non_negative_long_to_yojson x.max_retry_interval_ms );
      ("RetryIntervalMs", option_to_yojson boxed_non_negative_long_to_yojson x.retry_interval_ms);
      ("NumRetries", option_to_yojson boxed_non_negative_int_to_yojson x.num_retries);
      ( "DescribeShardInterval",
        option_to_yojson boxed_non_negative_long_to_yojson x.describe_shard_interval );
      ( "IdleTimeBetweenReadsInMs",
        option_to_yojson boxed_non_negative_long_to_yojson x.idle_time_between_reads_in_ms );
      ( "AddIdleTimeBetweenReads",
        option_to_yojson boxed_boolean_to_yojson x.add_idle_time_between_reads );
      ("MaxRecordPerRead", option_to_yojson boxed_non_negative_long_to_yojson x.max_record_per_read);
      ( "MaxFetchRecordsPerShard",
        option_to_yojson boxed_non_negative_long_to_yojson x.max_fetch_records_per_shard );
      ("MaxFetchTimeInMs", option_to_yojson boxed_non_negative_long_to_yojson x.max_fetch_time_in_ms);
      ("StartingPosition", option_to_yojson starting_position_to_yojson x.starting_position);
      ("Delimiter", option_to_yojson enclosed_in_string_property_to_yojson x.delimiter);
      ("Classification", option_to_yojson enclosed_in_string_property_to_yojson x.classification);
      ("StreamName", option_to_yojson enclosed_in_string_property_to_yojson x.stream_name);
      ("EndpointUrl", option_to_yojson enclosed_in_string_property_to_yojson x.endpoint_url);
    ]

let polling_time_to_yojson = long_to_yojson
let positive_long_to_yojson = long_to_yojson

let streaming_data_preview_options_to_yojson (x : streaming_data_preview_options) =
  assoc_to_yojson
    [
      ("RecordPollingLimit", option_to_yojson positive_long_to_yojson x.record_polling_limit);
      ("PollingTime", option_to_yojson polling_time_to_yojson x.polling_time);
    ]

let direct_kinesis_source_to_yojson (x : direct_kinesis_source) =
  assoc_to_yojson
    [
      ( "DataPreviewOptions",
        option_to_yojson streaming_data_preview_options_to_yojson x.data_preview_options );
      ( "StreamingOptions",
        option_to_yojson kinesis_streaming_source_options_to_yojson x.streaming_options );
      ("DetectSchema", option_to_yojson boxed_boolean_to_yojson x.detect_schema);
      ("WindowSize", option_to_yojson boxed_positive_int_to_yojson x.window_size);
      ("Name", Some (node_name_to_yojson x.name));
    ]

let kafka_streaming_source_options_to_yojson (x : kafka_streaming_source_options) =
  assoc_to_yojson
    [
      ("StartingTimestamp", option_to_yojson iso8601_date_time_to_yojson x.starting_timestamp);
      ( "EmitConsumerLagMetrics",
        option_to_yojson enclosed_in_string_property_to_yojson x.emit_consumer_lag_metrics );
      ( "AddRecordTimestamp",
        option_to_yojson enclosed_in_string_property_to_yojson x.add_record_timestamp );
      ("IncludeHeaders", option_to_yojson boxed_boolean_to_yojson x.include_headers);
      ("MinPartitions", option_to_yojson boxed_non_negative_int_to_yojson x.min_partitions);
      ( "MaxOffsetsPerTrigger",
        option_to_yojson boxed_non_negative_long_to_yojson x.max_offsets_per_trigger );
      ("RetryIntervalMs", option_to_yojson boxed_non_negative_long_to_yojson x.retry_interval_ms);
      ("NumRetries", option_to_yojson boxed_non_negative_int_to_yojson x.num_retries);
      ("PollTimeoutMs", option_to_yojson boxed_non_negative_long_to_yojson x.poll_timeout_ms);
      ("EndingOffsets", option_to_yojson enclosed_in_string_property_to_yojson x.ending_offsets);
      ("StartingOffsets", option_to_yojson enclosed_in_string_property_to_yojson x.starting_offsets);
      ("Delimiter", option_to_yojson enclosed_in_string_property_to_yojson x.delimiter);
      ("Classification", option_to_yojson enclosed_in_string_property_to_yojson x.classification);
      ( "SubscribePattern",
        option_to_yojson enclosed_in_string_property_to_yojson x.subscribe_pattern );
      ("Assign", option_to_yojson enclosed_in_string_property_to_yojson x.assign);
      ("TopicName", option_to_yojson enclosed_in_string_property_to_yojson x.topic_name);
      ("ConnectionName", option_to_yojson enclosed_in_string_property_to_yojson x.connection_name);
      ( "SecurityProtocol",
        option_to_yojson enclosed_in_string_property_to_yojson x.security_protocol );
      ( "BootstrapServers",
        option_to_yojson enclosed_in_string_property_to_yojson x.bootstrap_servers );
    ]

let direct_kafka_source_to_yojson (x : direct_kafka_source) =
  assoc_to_yojson
    [
      ( "DataPreviewOptions",
        option_to_yojson streaming_data_preview_options_to_yojson x.data_preview_options );
      ("DetectSchema", option_to_yojson boxed_boolean_to_yojson x.detect_schema);
      ("WindowSize", option_to_yojson boxed_positive_int_to_yojson x.window_size);
      ( "StreamingOptions",
        option_to_yojson kafka_streaming_source_options_to_yojson x.streaming_options );
      ("Name", Some (node_name_to_yojson x.name));
    ]

let catalog_kinesis_source_to_yojson (x : catalog_kinesis_source) =
  assoc_to_yojson
    [
      ( "DataPreviewOptions",
        option_to_yojson streaming_data_preview_options_to_yojson x.data_preview_options );
      ( "StreamingOptions",
        option_to_yojson kinesis_streaming_source_options_to_yojson x.streaming_options );
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("DetectSchema", option_to_yojson boxed_boolean_to_yojson x.detect_schema);
      ("WindowSize", option_to_yojson boxed_positive_int_to_yojson x.window_size);
      ("Name", Some (node_name_to_yojson x.name));
    ]

let catalog_kafka_source_to_yojson (x : catalog_kafka_source) =
  assoc_to_yojson
    [
      ( "DataPreviewOptions",
        option_to_yojson streaming_data_preview_options_to_yojson x.data_preview_options );
      ( "StreamingOptions",
        option_to_yojson kafka_streaming_source_options_to_yojson x.streaming_options );
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("DetectSchema", option_to_yojson boxed_boolean_to_yojson x.detect_schema);
      ("WindowSize", option_to_yojson boxed_positive_int_to_yojson x.window_size);
      ("Name", Some (node_name_to_yojson x.name));
    ]

let null_check_box_list_to_yojson (x : null_check_box_list) =
  assoc_to_yojson
    [
      ("IsNegOne", option_to_yojson boxed_boolean_to_yojson x.is_neg_one);
      ("IsNullString", option_to_yojson boxed_boolean_to_yojson x.is_null_string);
      ("IsEmpty", option_to_yojson boxed_boolean_to_yojson x.is_empty);
    ]

let generic_limited_string_to_yojson = string_to_yojson

let datatype_to_yojson (x : datatype) =
  assoc_to_yojson
    [
      ("Label", Some (generic_limited_string_to_yojson x.label));
      ("Id", Some (generic_limited_string_to_yojson x.id));
    ]

let null_value_field_to_yojson (x : null_value_field) =
  assoc_to_yojson
    [
      ("Datatype", Some (datatype_to_yojson x.datatype));
      ("Value", Some (enclosed_in_string_property_to_yojson x.value));
    ]

let null_value_fields_to_yojson tree = list_to_yojson null_value_field_to_yojson tree

let drop_null_fields_to_yojson (x : drop_null_fields) =
  assoc_to_yojson
    [
      ("NullTextList", option_to_yojson null_value_fields_to_yojson x.null_text_list);
      ("NullCheckBoxList", option_to_yojson null_check_box_list_to_yojson x.null_check_box_list);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let merge_to_yojson (x : merge) =
  assoc_to_yojson
    [
      ("PrimaryKeys", Some (glue_studio_path_list_to_yojson x.primary_keys));
      ("Source", Some (node_id_to_yojson x.source));
      ("Inputs", Some (two_inputs_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let union_type_to_yojson (x : union_type) =
  match x with DISTINCT -> `String "DISTINCT" | ALL -> `String "ALL"

let union_to_yojson (x : union) =
  assoc_to_yojson
    [
      ("UnionType", Some (union_type_to_yojson x.union_type));
      ("Inputs", Some (two_inputs_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let pii_type_to_yojson (x : pii_type) =
  match x with
  | ColumnMasking -> `String "ColumnMasking"
  | ColumnHashing -> `String "ColumnHashing"
  | ColumnAudit -> `String "ColumnAudit"
  | RowPartialMasking -> `String "RowPartialMasking"
  | RowMasking -> `String "RowMasking"
  | RowHashing -> `String "RowHashing"
  | RowAudit -> `String "RowAudit"

let boxed_double_fraction_to_yojson = double_to_yojson
let mask_value_to_yojson = string_to_yojson

let pii_detection_to_yojson (x : pii_detection) =
  assoc_to_yojson
    [
      ( "DetectionSensitivity",
        option_to_yojson enclosed_in_string_property_to_yojson x.detection_sensitivity );
      ( "DetectionParameters",
        option_to_yojson enclosed_in_string_property_to_yojson x.detection_parameters );
      ( "NumRightCharsToExclude",
        option_to_yojson boxed_positive_int_to_yojson x.num_right_chars_to_exclude );
      ( "NumLeftCharsToExclude",
        option_to_yojson boxed_positive_int_to_yojson x.num_left_chars_to_exclude );
      ("MatchPattern", option_to_yojson enclosed_in_string_property_to_yojson x.match_pattern);
      ("RedactChar", option_to_yojson enclosed_in_string_property_to_yojson x.redact_char);
      ("RedactText", option_to_yojson enclosed_in_string_property_to_yojson x.redact_text);
      ("MaskValue", option_to_yojson mask_value_to_yojson x.mask_value);
      ("ThresholdFraction", option_to_yojson boxed_double_fraction_to_yojson x.threshold_fraction);
      ("SampleFraction", option_to_yojson boxed_double_fraction_to_yojson x.sample_fraction);
      ( "OutputColumnName",
        option_to_yojson enclosed_in_string_property_to_yojson x.output_column_name );
      ( "EntityTypesToDetect",
        Some (enclosed_in_string_properties_to_yojson x.entity_types_to_detect) );
      ("PiiType", Some (pii_type_to_yojson x.pii_type));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let agg_function_to_yojson (x : agg_function) =
  match x with
  | Var_pop -> `String "var_pop"
  | Var_samp -> `String "var_samp"
  | SumDistinct -> `String "sumDistinct"
  | Sum -> `String "sum"
  | Stddev_pop -> `String "stddev_pop"
  | Stddev_samp -> `String "stddev_samp"
  | Skewness -> `String "skewness"
  | Min -> `String "min"
  | Max -> `String "max"
  | Kurtosis -> `String "kurtosis"
  | Last -> `String "last"
  | First -> `String "first"
  | Count -> `String "count"
  | CountDistinct -> `String "countDistinct"
  | Avg -> `String "avg"

let aggregate_operation_to_yojson (x : aggregate_operation) =
  assoc_to_yojson
    [
      ("AggFunc", Some (agg_function_to_yojson x.agg_func));
      ("Column", Some (enclosed_in_string_properties_to_yojson x.column));
    ]

let aggregate_operations_to_yojson tree = list_to_yojson aggregate_operation_to_yojson tree

let aggregate_to_yojson (x : aggregate) =
  assoc_to_yojson
    [
      ("Aggs", Some (aggregate_operations_to_yojson x.aggs));
      ("Groups", Some (glue_studio_path_list_to_yojson x.groups));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let limited_string_list_to_yojson tree = list_to_yojson generic_limited_string_to_yojson tree
let limited_path_list_to_yojson tree = list_to_yojson limited_string_list_to_yojson tree

let drop_duplicates_to_yojson (x : drop_duplicates) =
  assoc_to_yojson
    [
      ("Columns", option_to_yojson limited_path_list_to_yojson x.columns);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let governed_catalog_target_to_yojson (x : governed_catalog_target) =
  assoc_to_yojson
    [
      ( "SchemaChangePolicy",
        option_to_yojson catalog_schema_change_policy_to_yojson x.schema_change_policy );
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let governed_catalog_source_to_yojson (x : governed_catalog_source) =
  assoc_to_yojson
    [
      ( "AdditionalOptions",
        option_to_yojson s3_source_additional_options_to_yojson x.additional_options );
      ( "PartitionPredicate",
        option_to_yojson enclosed_in_string_property_to_yojson x.partition_predicate );
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let microsoft_sql_server_catalog_source_to_yojson (x : microsoft_sql_server_catalog_source) =
  assoc_to_yojson
    [
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let my_sql_catalog_source_to_yojson (x : my_sql_catalog_source) =
  assoc_to_yojson
    [
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let oracle_sql_catalog_source_to_yojson (x : oracle_sql_catalog_source) =
  assoc_to_yojson
    [
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let postgre_sql_catalog_source_to_yojson (x : postgre_sql_catalog_source) =
  assoc_to_yojson
    [
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let microsoft_sql_server_catalog_target_to_yojson (x : microsoft_sql_server_catalog_target) =
  assoc_to_yojson
    [
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let my_sql_catalog_target_to_yojson (x : my_sql_catalog_target) =
  assoc_to_yojson
    [
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let oracle_sql_catalog_target_to_yojson (x : oracle_sql_catalog_target) =
  assoc_to_yojson
    [
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let postgre_sql_catalog_target_to_yojson (x : postgre_sql_catalog_target) =
  assoc_to_yojson
    [
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let group_filters_to_yojson (x : group_filters) =
  assoc_to_yojson
    [
      ("LogicalOperator", Some (filter_logical_operator_to_yojson x.logical_operator));
      ("Filters", Some (filter_expressions_to_yojson x.filters));
      ("GroupName", Some (generic_limited_string_to_yojson x.group_name));
    ]

let group_filters_list_to_yojson tree = list_to_yojson group_filters_to_yojson tree

let route_to_yojson (x : route) =
  assoc_to_yojson
    [
      ("GroupFiltersList", Some (group_filters_list_to_yojson x.group_filters_list));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let param_type_to_yojson (x : param_type) =
  match x with
  | NULL -> `String "null"
  | LIST -> `String "list"
  | BOOL -> `String "bool"
  | COMPLEX -> `String "complex"
  | FLOAT -> `String "float"
  | INT -> `String "int"
  | STR -> `String "str"

let transform_config_parameter_to_yojson (x : transform_config_parameter) =
  assoc_to_yojson
    [
      ("IsOptional", option_to_yojson boxed_boolean_to_yojson x.is_optional);
      ("ListType", option_to_yojson param_type_to_yojson x.list_type);
      ("Value", option_to_yojson enclosed_in_string_properties_to_yojson x.value);
      ( "ValidationMessage",
        option_to_yojson enclosed_in_string_property_to_yojson x.validation_message );
      ("ValidationRule", option_to_yojson enclosed_in_string_property_to_yojson x.validation_rule);
      ("Type", Some (param_type_to_yojson x.type_));
      ("Name", Some (enclosed_in_string_property_to_yojson x.name));
    ]

let transform_config_parameter_list_to_yojson tree =
  list_to_yojson transform_config_parameter_to_yojson tree

let dynamic_transform_to_yojson (x : dynamic_transform) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("Version", option_to_yojson enclosed_in_string_property_to_yojson x.version);
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("FunctionName", Some (enclosed_in_string_property_to_yojson x.function_name));
      ("Parameters", option_to_yojson transform_config_parameter_list_to_yojson x.parameters);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("TransformName", Some (enclosed_in_string_property_to_yojson x.transform_name));
      ("Name", Some (enclosed_in_string_property_to_yojson x.name));
    ]

let dqdl_string_to_yojson = string_to_yojson

let dq_transform_output_to_yojson (x : dq_transform_output) =
  match x with
  | EvaluationResults -> `String "EvaluationResults"
  | PrimaryInput -> `String "PrimaryInput"

let dq_results_publishing_options_to_yojson (x : dq_results_publishing_options) =
  assoc_to_yojson
    [
      ( "ResultsPublishingEnabled",
        option_to_yojson boxed_boolean_to_yojson x.results_publishing_enabled );
      ( "CloudWatchMetricsEnabled",
        option_to_yojson boxed_boolean_to_yojson x.cloud_watch_metrics_enabled );
      ("ResultsS3Prefix", option_to_yojson enclosed_in_string_property_to_yojson x.results_s3_prefix);
      ("EvaluationContext", option_to_yojson generic_limited_string_to_yojson x.evaluation_context);
    ]

let dq_stop_job_on_failure_timing_to_yojson (x : dq_stop_job_on_failure_timing) =
  match x with AfterDataLoad -> `String "AfterDataLoad" | Immediate -> `String "Immediate"

let dq_stop_job_on_failure_options_to_yojson (x : dq_stop_job_on_failure_options) =
  assoc_to_yojson
    [
      ( "StopJobOnFailureTiming",
        option_to_yojson dq_stop_job_on_failure_timing_to_yojson x.stop_job_on_failure_timing );
    ]

let evaluate_data_quality_to_yojson (x : evaluate_data_quality) =
  assoc_to_yojson
    [
      ( "StopJobOnFailureOptions",
        option_to_yojson dq_stop_job_on_failure_options_to_yojson x.stop_job_on_failure_options );
      ( "PublishingOptions",
        option_to_yojson dq_results_publishing_options_to_yojson x.publishing_options );
      ("Output", option_to_yojson dq_transform_output_to_yojson x.output);
      ("Ruleset", Some (dqdl_string_to_yojson x.ruleset));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let s3_catalog_hudi_source_to_yojson (x : s3_catalog_hudi_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "AdditionalHudiOptions",
        option_to_yojson additional_options_to_yojson x.additional_hudi_options );
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let catalog_hudi_source_to_yojson (x : catalog_hudi_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "AdditionalHudiOptions",
        option_to_yojson additional_options_to_yojson x.additional_hudi_options );
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let s3_hudi_source_to_yojson (x : s3_hudi_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ( "AdditionalHudiOptions",
        option_to_yojson additional_options_to_yojson x.additional_hudi_options );
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let s3_hudi_catalog_target_to_yojson (x : s3_hudi_catalog_target) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ( "SchemaChangePolicy",
        option_to_yojson catalog_schema_change_policy_to_yojson x.schema_change_policy );
      ("AdditionalOptions", Some (additional_options_to_yojson x.additional_options));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let hudi_target_compression_type_to_yojson (x : hudi_target_compression_type) =
  match x with
  | SNAPPY -> `String "snappy"
  | UNCOMPRESSED -> `String "uncompressed"
  | LZO -> `String "lzo"
  | GZIP -> `String "gzip"

let s3_hudi_direct_target_to_yojson (x : s3_hudi_direct_target) =
  assoc_to_yojson
    [
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ("AdditionalOptions", Some (additional_options_to_yojson x.additional_options));
      ("Format", Some (target_format_to_yojson x.format));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ( "NumberTargetPartitions",
        option_to_yojson number_target_partitions_string_to_yojson x.number_target_partitions );
      ("Compression", Some (hudi_target_compression_type_to_yojson x.compression));
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let jdbc_connection_type_to_yojson (x : jdbc_connection_type) =
  match x with
  | Redshift -> `String "redshift"
  | Postgresql -> `String "postgresql"
  | Oracle -> `String "oracle"
  | Mysql -> `String "mysql"
  | Sqlserver -> `String "sqlserver"

let direct_jdbc_source_to_yojson (x : direct_jdbc_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("RedshiftTmpDir", option_to_yojson enclosed_in_string_property_to_yojson x.redshift_tmp_dir);
      ("ConnectionType", Some (jdbc_connection_type_to_yojson x.connection_type));
      ("ConnectionName", Some (enclosed_in_string_property_to_yojson x.connection_name));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let s3_catalog_delta_source_to_yojson (x : s3_catalog_delta_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "AdditionalDeltaOptions",
        option_to_yojson additional_options_to_yojson x.additional_delta_options );
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let catalog_delta_source_to_yojson (x : catalog_delta_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "AdditionalDeltaOptions",
        option_to_yojson additional_options_to_yojson x.additional_delta_options );
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let s3_delta_source_to_yojson (x : s3_delta_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ( "AdditionalDeltaOptions",
        option_to_yojson additional_options_to_yojson x.additional_delta_options );
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let s3_delta_catalog_target_to_yojson (x : s3_delta_catalog_target) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ( "SchemaChangePolicy",
        option_to_yojson catalog_schema_change_policy_to_yojson x.schema_change_policy );
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let delta_target_compression_type_to_yojson (x : delta_target_compression_type) =
  match x with SNAPPY -> `String "snappy" | UNCOMPRESSED -> `String "uncompressed"

let s3_delta_direct_target_to_yojson (x : s3_delta_direct_target) =
  assoc_to_yojson
    [
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("Format", Some (target_format_to_yojson x.format));
      ( "NumberTargetPartitions",
        option_to_yojson number_target_partitions_string_to_yojson x.number_target_partitions );
      ("Compression", Some (delta_target_compression_type_to_yojson x.compression));
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let option__to_yojson (x : option_) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson enclosed_in_string_property_to_yojson x.description);
      ("Label", option_to_yojson enclosed_in_string_property_to_yojson x.label);
      ("Value", option_to_yojson enclosed_in_string_property_to_yojson x.value);
    ]

let amazon_redshift_advanced_option_to_yojson (x : amazon_redshift_advanced_option) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson generic_string_to_yojson x.value);
      ("Key", option_to_yojson generic_string_to_yojson x.key);
    ]

let amazon_redshift_advanced_options_to_yojson tree =
  list_to_yojson amazon_redshift_advanced_option_to_yojson tree

let option_list_to_yojson tree = list_to_yojson option__to_yojson tree

let amazon_redshift_node_data_to_yojson (x : amazon_redshift_node_data) =
  assoc_to_yojson
    [
      ("SelectedColumns", option_to_yojson option_list_to_yojson x.selected_columns);
      ("StagingTable", option_to_yojson generic_string_to_yojson x.staging_table);
      ("TableSchema", option_to_yojson option_list_to_yojson x.table_schema);
      ("CrawlerConnection", option_to_yojson generic_string_to_yojson x.crawler_connection);
      ("MergeClause", option_to_yojson generic_string_to_yojson x.merge_clause);
      ( "MergeWhenNotMatched",
        option_to_yojson generic_limited_string_to_yojson x.merge_when_not_matched );
      ("MergeWhenMatched", option_to_yojson generic_limited_string_to_yojson x.merge_when_matched);
      ("MergeAction", option_to_yojson generic_limited_string_to_yojson x.merge_action);
      ("Upsert", option_to_yojson boolean_value_to_yojson x.upsert);
      ("TablePrefix", option_to_yojson generic_limited_string_to_yojson x.table_prefix);
      ("Action", option_to_yojson generic_string_to_yojson x.action);
      ("PostAction", option_to_yojson generic_string_to_yojson x.post_action);
      ("PreAction", option_to_yojson generic_string_to_yojson x.pre_action);
      ("SampleQuery", option_to_yojson generic_string_to_yojson x.sample_query);
      ( "AdvancedOptions",
        option_to_yojson amazon_redshift_advanced_options_to_yojson x.advanced_options );
      ("IamRole", option_to_yojson option__to_yojson x.iam_role);
      ("TempDir", option_to_yojson enclosed_in_string_property_to_yojson x.temp_dir);
      ("CatalogRedshiftTable", option_to_yojson generic_string_to_yojson x.catalog_redshift_table);
      ("CatalogRedshiftSchema", option_to_yojson generic_string_to_yojson x.catalog_redshift_schema);
      ("CatalogTable", option_to_yojson option__to_yojson x.catalog_table);
      ("CatalogDatabase", option_to_yojson option__to_yojson x.catalog_database);
      ("Table", option_to_yojson option__to_yojson x.table);
      ("Schema", option_to_yojson option__to_yojson x.schema);
      ("Connection", option_to_yojson option__to_yojson x.connection);
      ("SourceType", option_to_yojson generic_limited_string_to_yojson x.source_type);
      ("AccessType", option_to_yojson generic_limited_string_to_yojson x.access_type);
    ]

let amazon_redshift_source_to_yojson (x : amazon_redshift_source) =
  assoc_to_yojson
    [
      ("Data", option_to_yojson amazon_redshift_node_data_to_yojson x.data);
      ("Name", option_to_yojson node_name_to_yojson x.name);
    ]

let amazon_redshift_target_to_yojson (x : amazon_redshift_target) =
  assoc_to_yojson
    [
      ("Inputs", option_to_yojson one_input_to_yojson x.inputs);
      ("Data", option_to_yojson amazon_redshift_node_data_to_yojson x.data);
      ("Name", option_to_yojson node_name_to_yojson x.name);
    ]

let dqdl_aliases_to_yojson tree =
  map_to_yojson node_name_to_yojson enclosed_in_string_property_to_yojson tree

let additional_option_keys_to_yojson (x : additional_option_keys) =
  match x with
  | CompositeOption -> `String "compositeRuleEvaluation.method"
  | ObservationsOption -> `String "observations.scope"
  | CacheOption -> `String "performanceTuning.caching"

let dq_additional_options_to_yojson tree =
  map_to_yojson additional_option_keys_to_yojson generic_string_to_yojson tree

let evaluate_data_quality_multi_frame_to_yojson (x : evaluate_data_quality_multi_frame) =
  assoc_to_yojson
    [
      ( "StopJobOnFailureOptions",
        option_to_yojson dq_stop_job_on_failure_options_to_yojson x.stop_job_on_failure_options );
      ("AdditionalOptions", option_to_yojson dq_additional_options_to_yojson x.additional_options);
      ( "PublishingOptions",
        option_to_yojson dq_results_publishing_options_to_yojson x.publishing_options );
      ("Ruleset", Some (dqdl_string_to_yojson x.ruleset));
      ("AdditionalDataSources", option_to_yojson dqdl_aliases_to_yojson x.additional_data_sources);
      ("Inputs", Some (many_inputs_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let recipe_version_to_yojson = string_to_yojson

let recipe_reference_to_yojson (x : recipe_reference) =
  assoc_to_yojson
    [
      ("RecipeVersion", Some (recipe_version_to_yojson x.recipe_version));
      ("RecipeArn", Some (enclosed_in_string_property_to_yojson x.recipe_arn));
    ]

let operation_to_yojson = string_to_yojson
let parameter_value_to_yojson = string_to_yojson
let parameter_name_to_yojson = string_to_yojson

let parameter_map_to_yojson tree =
  map_to_yojson parameter_name_to_yojson parameter_value_to_yojson tree

let recipe_action_to_yojson (x : recipe_action) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson parameter_map_to_yojson x.parameters);
      ("Operation", Some (operation_to_yojson x.operation));
    ]

let databrew_condition_to_yojson = string_to_yojson
let databrew_condition_value_to_yojson = string_to_yojson
let target_column_to_yojson = string_to_yojson

let condition_expression_to_yojson (x : condition_expression) =
  assoc_to_yojson
    [
      ("TargetColumn", Some (target_column_to_yojson x.target_column));
      ("Value", option_to_yojson databrew_condition_value_to_yojson x.value);
      ("Condition", Some (databrew_condition_to_yojson x.condition));
    ]

let condition_expression_list_to_yojson tree = list_to_yojson condition_expression_to_yojson tree

let recipe_step_to_yojson (x : recipe_step) =
  assoc_to_yojson
    [
      ( "ConditionExpressions",
        option_to_yojson condition_expression_list_to_yojson x.condition_expressions );
      ("Action", Some (recipe_action_to_yojson x.action));
    ]

let recipe_steps_to_yojson tree = list_to_yojson recipe_step_to_yojson tree

let recipe_to_yojson (x : recipe) =
  assoc_to_yojson
    [
      ("RecipeSteps", option_to_yojson recipe_steps_to_yojson x.recipe_steps);
      ("RecipeReference", option_to_yojson recipe_reference_to_yojson x.recipe_reference);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let snowflake_node_data_to_yojson (x : snowflake_node_data) =
  assoc_to_yojson
    [
      ("TableSchema", option_to_yojson option_list_to_yojson x.table_schema);
      ("AutoPushdown", option_to_yojson boolean_value_to_yojson x.auto_pushdown);
      ("SelectedColumns", option_to_yojson option_list_to_yojson x.selected_columns);
      ("StagingTable", option_to_yojson generic_string_to_yojson x.staging_table);
      ("MergeClause", option_to_yojson generic_string_to_yojson x.merge_clause);
      ( "MergeWhenNotMatched",
        option_to_yojson generic_limited_string_to_yojson x.merge_when_not_matched );
      ("MergeWhenMatched", option_to_yojson generic_limited_string_to_yojson x.merge_when_matched);
      ("MergeAction", option_to_yojson generic_limited_string_to_yojson x.merge_action);
      ("Upsert", option_to_yojson boolean_value_to_yojson x.upsert);
      ("Action", option_to_yojson generic_string_to_yojson x.action);
      ("PostAction", option_to_yojson generic_string_to_yojson x.post_action);
      ("PreAction", option_to_yojson generic_string_to_yojson x.pre_action);
      ("SampleQuery", option_to_yojson generic_string_to_yojson x.sample_query);
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("IamRole", option_to_yojson option__to_yojson x.iam_role);
      ("TempDir", option_to_yojson enclosed_in_string_property_to_yojson x.temp_dir);
      ("Database", option_to_yojson generic_string_to_yojson x.database);
      ("Table", option_to_yojson generic_string_to_yojson x.table);
      ("Schema", option_to_yojson generic_string_to_yojson x.schema);
      ("Connection", option_to_yojson option__to_yojson x.connection);
      ("SourceType", option_to_yojson generic_limited_string_to_yojson x.source_type);
    ]

let snowflake_source_to_yojson (x : snowflake_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("Data", Some (snowflake_node_data_to_yojson x.data));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let snowflake_target_to_yojson (x : snowflake_target) =
  assoc_to_yojson
    [
      ("Inputs", option_to_yojson one_input_to_yojson x.inputs);
      ("Data", Some (snowflake_node_data_to_yojson x.data));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let connector_options_to_yojson tree =
  map_to_yojson generic_string_to_yojson generic_string_to_yojson tree

let connector_data_source_to_yojson (x : connector_data_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("Data", Some (connector_options_to_yojson x.data));
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let connector_data_target_to_yojson (x : connector_data_target) =
  assoc_to_yojson
    [
      ("Inputs", option_to_yojson one_input_to_yojson x.inputs);
      ("Data", Some (connector_options_to_yojson x.data));
      ("ConnectionType", Some (enclosed_in_string_property_to_yojson x.connection_type));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let s3_catalog_iceberg_source_to_yojson (x : s3_catalog_iceberg_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "AdditionalIcebergOptions",
        option_to_yojson additional_options_to_yojson x.additional_iceberg_options );
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let catalog_iceberg_source_to_yojson (x : catalog_iceberg_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "AdditionalIcebergOptions",
        option_to_yojson additional_options_to_yojson x.additional_iceberg_options );
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let s3_iceberg_catalog_target_to_yojson (x : s3_iceberg_catalog_target) =
  assoc_to_yojson
    [
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ( "SchemaChangePolicy",
        option_to_yojson catalog_schema_change_policy_to_yojson x.schema_change_policy );
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("Database", Some (enclosed_in_string_property_to_yojson x.database));
      ("Table", Some (enclosed_in_string_property_to_yojson x.table));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let iceberg_target_compression_type_to_yojson (x : iceberg_target_compression_type) =
  match x with
  | SNAPPY -> `String "snappy"
  | UNCOMPRESSED -> `String "uncompressed"
  | LZO -> `String "lzo"
  | GZIP -> `String "gzip"

let s3_iceberg_direct_target_to_yojson (x : s3_iceberg_direct_target) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "NumberTargetPartitions",
        option_to_yojson number_target_partitions_string_to_yojson x.number_target_partitions );
      ("Compression", Some (iceberg_target_compression_type_to_yojson x.compression));
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ("AdditionalOptions", option_to_yojson additional_options_to_yojson x.additional_options);
      ("Format", Some (target_format_to_yojson x.format));
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let s3_excel_source_to_yojson (x : s3_excel_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("SkipFooter", option_to_yojson boxed_non_negative_int_to_yojson x.skip_footer);
      ("NumberRows", option_to_yojson boxed_long_to_yojson x.number_rows);
      ( "AdditionalOptions",
        option_to_yojson s3_direct_source_additional_options_to_yojson x.additional_options );
      ("MaxFilesInBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_files_in_band);
      ("MaxBand", option_to_yojson boxed_non_negative_int_to_yojson x.max_band);
      ("Recurse", option_to_yojson boxed_boolean_to_yojson x.recurse);
      ("GroupFiles", option_to_yojson enclosed_in_string_property_to_yojson x.group_files);
      ("GroupSize", option_to_yojson enclosed_in_string_property_to_yojson x.group_size);
      ("Exclusions", option_to_yojson enclosed_in_string_properties_to_yojson x.exclusions);
      ("CompressionType", option_to_yojson parquet_compression_type_to_yojson x.compression_type);
      ("Paths", Some (enclosed_in_string_properties_to_yojson x.paths));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let hyper_target_compression_type_to_yojson (x : hyper_target_compression_type) =
  match x with UNCOMPRESSED -> `String "uncompressed"

let s3_hyper_direct_target_to_yojson (x : s3_hyper_direct_target) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ("AutoDataQuality", option_to_yojson auto_data_quality_to_yojson x.auto_data_quality);
      ( "SchemaChangePolicy",
        option_to_yojson direct_schema_change_policy_to_yojson x.schema_change_policy );
      ("Compression", option_to_yojson hyper_target_compression_type_to_yojson x.compression);
      ("Path", Some (enclosed_in_string_property_to_yojson x.path));
      ("PartitionKeys", option_to_yojson glue_studio_path_list_to_yojson x.partition_keys);
      ("Format", option_to_yojson target_format_to_yojson x.format);
      ("Inputs", Some (one_input_to_yojson x.inputs));
      ("Name", Some (node_name_to_yojson x.name));
    ]

let ddb_export_type_to_yojson (x : ddb_export_type) =
  match x with S3 -> `String "s3" | Ddb -> `String "ddb"

let ddbelt_connection_options_to_yojson (x : ddbelt_connection_options) =
  assoc_to_yojson
    [
      ( "DynamodbStsRoleArn",
        option_to_yojson enclosed_in_string_property_to_yojson x.dynamodb_sts_role_arn );
      ( "DynamodbS3BucketOwner",
        option_to_yojson enclosed_in_string_property_to_yojson x.dynamodb_s3_bucket_owner );
      ( "DynamodbS3Prefix",
        option_to_yojson enclosed_in_string_property_to_yojson x.dynamodb_s3_prefix );
      ( "DynamodbS3Bucket",
        option_to_yojson enclosed_in_string_property_to_yojson x.dynamodb_s3_bucket );
      ("DynamodbTableArn", Some (enclosed_in_string_property_to_yojson x.dynamodb_table_arn));
      ("DynamodbUnnestDDBJson", option_to_yojson boolean_value_to_yojson x.dynamodb_unnest_ddb_json);
      ("DynamodbExport", option_to_yojson ddb_export_type_to_yojson x.dynamodb_export);
    ]

let dynamo_dbelt_connector_source_to_yojson (x : dynamo_dbelt_connector_source) =
  assoc_to_yojson
    [
      ("OutputSchemas", option_to_yojson glue_schemas_to_yojson x.output_schemas);
      ( "ConnectionOptions",
        option_to_yojson ddbelt_connection_options_to_yojson x.connection_options );
      ("Name", Some (node_name_to_yojson x.name));
    ]

let code_gen_configuration_node_to_yojson (x : code_gen_configuration_node) =
  assoc_to_yojson
    [
      ( "DynamoDBELTConnectorSource",
        option_to_yojson dynamo_dbelt_connector_source_to_yojson x.dynamo_dbelt_connector_source );
      ( "S3HyperDirectTarget",
        option_to_yojson s3_hyper_direct_target_to_yojson x.s3_hyper_direct_target );
      ("S3ExcelSource", option_to_yojson s3_excel_source_to_yojson x.s3_excel_source);
      ( "S3IcebergDirectTarget",
        option_to_yojson s3_iceberg_direct_target_to_yojson x.s3_iceberg_direct_target );
      ( "S3IcebergCatalogTarget",
        option_to_yojson s3_iceberg_catalog_target_to_yojson x.s3_iceberg_catalog_target );
      ( "CatalogIcebergSource",
        option_to_yojson catalog_iceberg_source_to_yojson x.catalog_iceberg_source );
      ( "S3CatalogIcebergSource",
        option_to_yojson s3_catalog_iceberg_source_to_yojson x.s3_catalog_iceberg_source );
      ( "ConnectorDataTarget",
        option_to_yojson connector_data_target_to_yojson x.connector_data_target );
      ( "ConnectorDataSource",
        option_to_yojson connector_data_source_to_yojson x.connector_data_source );
      ("SnowflakeTarget", option_to_yojson snowflake_target_to_yojson x.snowflake_target);
      ("SnowflakeSource", option_to_yojson snowflake_source_to_yojson x.snowflake_source);
      ("Recipe", option_to_yojson recipe_to_yojson x.recipe);
      ( "EvaluateDataQualityMultiFrame",
        option_to_yojson evaluate_data_quality_multi_frame_to_yojson
          x.evaluate_data_quality_multi_frame );
      ( "AmazonRedshiftTarget",
        option_to_yojson amazon_redshift_target_to_yojson x.amazon_redshift_target );
      ( "AmazonRedshiftSource",
        option_to_yojson amazon_redshift_source_to_yojson x.amazon_redshift_source );
      ( "S3DeltaDirectTarget",
        option_to_yojson s3_delta_direct_target_to_yojson x.s3_delta_direct_target );
      ( "S3DeltaCatalogTarget",
        option_to_yojson s3_delta_catalog_target_to_yojson x.s3_delta_catalog_target );
      ("S3DeltaSource", option_to_yojson s3_delta_source_to_yojson x.s3_delta_source);
      ("CatalogDeltaSource", option_to_yojson catalog_delta_source_to_yojson x.catalog_delta_source);
      ( "S3CatalogDeltaSource",
        option_to_yojson s3_catalog_delta_source_to_yojson x.s3_catalog_delta_source );
      ("DirectJDBCSource", option_to_yojson direct_jdbc_source_to_yojson x.direct_jdbc_source);
      ( "S3HudiDirectTarget",
        option_to_yojson s3_hudi_direct_target_to_yojson x.s3_hudi_direct_target );
      ( "S3HudiCatalogTarget",
        option_to_yojson s3_hudi_catalog_target_to_yojson x.s3_hudi_catalog_target );
      ("S3HudiSource", option_to_yojson s3_hudi_source_to_yojson x.s3_hudi_source);
      ("CatalogHudiSource", option_to_yojson catalog_hudi_source_to_yojson x.catalog_hudi_source);
      ( "S3CatalogHudiSource",
        option_to_yojson s3_catalog_hudi_source_to_yojson x.s3_catalog_hudi_source );
      ( "EvaluateDataQuality",
        option_to_yojson evaluate_data_quality_to_yojson x.evaluate_data_quality );
      ("DynamicTransform", option_to_yojson dynamic_transform_to_yojson x.dynamic_transform);
      ("Route", option_to_yojson route_to_yojson x.route);
      ( "PostgreSQLCatalogTarget",
        option_to_yojson postgre_sql_catalog_target_to_yojson x.postgre_sql_catalog_target );
      ( "OracleSQLCatalogTarget",
        option_to_yojson oracle_sql_catalog_target_to_yojson x.oracle_sql_catalog_target );
      ( "MySQLCatalogTarget",
        option_to_yojson my_sql_catalog_target_to_yojson x.my_sql_catalog_target );
      ( "MicrosoftSQLServerCatalogTarget",
        option_to_yojson microsoft_sql_server_catalog_target_to_yojson
          x.microsoft_sql_server_catalog_target );
      ( "PostgreSQLCatalogSource",
        option_to_yojson postgre_sql_catalog_source_to_yojson x.postgre_sql_catalog_source );
      ( "OracleSQLCatalogSource",
        option_to_yojson oracle_sql_catalog_source_to_yojson x.oracle_sql_catalog_source );
      ( "MySQLCatalogSource",
        option_to_yojson my_sql_catalog_source_to_yojson x.my_sql_catalog_source );
      ( "MicrosoftSQLServerCatalogSource",
        option_to_yojson microsoft_sql_server_catalog_source_to_yojson
          x.microsoft_sql_server_catalog_source );
      ( "GovernedCatalogSource",
        option_to_yojson governed_catalog_source_to_yojson x.governed_catalog_source );
      ( "GovernedCatalogTarget",
        option_to_yojson governed_catalog_target_to_yojson x.governed_catalog_target );
      ("DropDuplicates", option_to_yojson drop_duplicates_to_yojson x.drop_duplicates);
      ("Aggregate", option_to_yojson aggregate_to_yojson x.aggregate);
      ("PIIDetection", option_to_yojson pii_detection_to_yojson x.pii_detection);
      ("Union", option_to_yojson union_to_yojson x.union);
      ("Merge", option_to_yojson merge_to_yojson x.merge);
      ("DropNullFields", option_to_yojson drop_null_fields_to_yojson x.drop_null_fields);
      ("CatalogKafkaSource", option_to_yojson catalog_kafka_source_to_yojson x.catalog_kafka_source);
      ( "CatalogKinesisSource",
        option_to_yojson catalog_kinesis_source_to_yojson x.catalog_kinesis_source );
      ("DirectKafkaSource", option_to_yojson direct_kafka_source_to_yojson x.direct_kafka_source);
      ( "DirectKinesisSource",
        option_to_yojson direct_kinesis_source_to_yojson x.direct_kinesis_source );
      ("SparkSQL", option_to_yojson spark_sq_l_to_yojson x.spark_sq_l);
      ("CustomCode", option_to_yojson custom_code_to_yojson x.custom_code);
      ("Filter", option_to_yojson filter_to_yojson x.filter);
      ("FillMissingValues", option_to_yojson fill_missing_values_to_yojson x.fill_missing_values);
      ( "SelectFromCollection",
        option_to_yojson select_from_collection_to_yojson x.select_from_collection );
      ("SplitFields", option_to_yojson split_fields_to_yojson x.split_fields);
      ("Join", option_to_yojson join_to_yojson x.join);
      ("Spigot", option_to_yojson spigot_to_yojson x.spigot);
      ("RenameField", option_to_yojson rename_field_to_yojson x.rename_field);
      ("DropFields", option_to_yojson drop_fields_to_yojson x.drop_fields);
      ("SelectFields", option_to_yojson select_fields_to_yojson x.select_fields);
      ("ApplyMapping", option_to_yojson apply_mapping_to_yojson x.apply_mapping);
      ("S3DirectTarget", option_to_yojson s3_direct_target_to_yojson x.s3_direct_target);
      ( "S3GlueParquetTarget",
        option_to_yojson s3_glue_parquet_target_to_yojson x.s3_glue_parquet_target );
      ("S3CatalogTarget", option_to_yojson s3_catalog_target_to_yojson x.s3_catalog_target);
      ("RedshiftTarget", option_to_yojson redshift_target_to_yojson x.redshift_target);
      ("CatalogTarget", option_to_yojson basic_catalog_target_to_yojson x.catalog_target);
      ( "SparkConnectorTarget",
        option_to_yojson spark_connector_target_to_yojson x.spark_connector_target );
      ( "JDBCConnectorTarget",
        option_to_yojson jdbc_connector_target_to_yojson x.jdbc_connector_target );
      ( "DynamoDBCatalogSource",
        option_to_yojson dynamo_db_catalog_source_to_yojson x.dynamo_db_catalog_source );
      ( "RelationalCatalogSource",
        option_to_yojson relational_catalog_source_to_yojson x.relational_catalog_source );
      ("S3ParquetSource", option_to_yojson s3_parquet_source_to_yojson x.s3_parquet_source);
      ("S3JsonSource", option_to_yojson s3_json_source_to_yojson x.s3_json_source);
      ("S3CsvSource", option_to_yojson s3_csv_source_to_yojson x.s3_csv_source);
      ("S3CatalogSource", option_to_yojson s3_catalog_source_to_yojson x.s3_catalog_source);
      ("RedshiftSource", option_to_yojson redshift_source_to_yojson x.redshift_source);
      ("CatalogSource", option_to_yojson catalog_source_to_yojson x.catalog_source);
      ( "SparkConnectorSource",
        option_to_yojson spark_connector_source_to_yojson x.spark_connector_source );
      ( "JDBCConnectorSource",
        option_to_yojson jdbc_connector_source_to_yojson x.jdbc_connector_source );
      ( "AthenaConnectorSource",
        option_to_yojson athena_connector_source_to_yojson x.athena_connector_source );
    ]

let code_gen_configuration_nodes_to_yojson tree =
  map_to_yojson node_id_to_yojson code_gen_configuration_node_to_yojson tree

let generic512_char_string_to_yojson = string_to_yojson

let source_control_details_to_yojson (x : source_control_details) =
  assoc_to_yojson
    [
      ("AuthToken", option_to_yojson generic512_char_string_to_yojson x.auth_token);
      ("AuthStrategy", option_to_yojson source_control_auth_strategy_to_yojson x.auth_strategy);
      ("LastCommitId", option_to_yojson generic512_char_string_to_yojson x.last_commit_id);
      ("Folder", option_to_yojson generic512_char_string_to_yojson x.folder);
      ("Branch", option_to_yojson generic512_char_string_to_yojson x.branch);
      ("Owner", option_to_yojson generic512_char_string_to_yojson x.owner);
      ("Repository", option_to_yojson generic512_char_string_to_yojson x.repository);
      ("Provider", option_to_yojson source_control_provider_to_yojson x.provider);
    ]

let job_update_to_yojson (x : job_update) =
  assoc_to_yojson
    [
      ("MaintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "SourceControlDetails",
        option_to_yojson source_control_details_to_yojson x.source_control_details );
      ("ExecutionClass", option_to_yojson execution_class_to_yojson x.execution_class);
      ( "CodeGenConfigurationNodes",
        option_to_yojson code_gen_configuration_nodes_to_yojson x.code_gen_configuration_nodes );
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("AllocatedCapacity", option_to_yojson integer_value_to_yojson x.allocated_capacity);
      ("MaxRetries", option_to_yojson max_retries_to_yojson x.max_retries);
      ("Connections", option_to_yojson connections_list_to_yojson x.connections);
      ("NonOverridableArguments", option_to_yojson generic_map_to_yojson x.non_overridable_arguments);
      ("DefaultArguments", option_to_yojson generic_map_to_yojson x.default_arguments);
      ("Command", option_to_yojson job_command_to_yojson x.command);
      ("ExecutionProperty", option_to_yojson execution_property_to_yojson x.execution_property);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("LogUri", option_to_yojson uri_string_to_yojson x.log_uri);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("JobRunQueuingEnabled", option_to_yojson nullable_boolean_to_yojson x.job_run_queuing_enabled);
      ("JobMode", option_to_yojson job_mode_to_yojson x.job_mode);
    ]

let update_job_request_to_yojson (x : update_job_request) =
  assoc_to_yojson
    [
      ("JobUpdate", Some (job_update_to_yojson x.job_update));
      ("JobName", Some (name_string_to_yojson x.job_name));
    ]

let update_job_from_source_control_response_to_yojson (x : update_job_from_source_control_response)
    =
  assoc_to_yojson [ ("JobName", option_to_yojson name_string_to_yojson x.job_name) ]

let update_job_from_source_control_request_to_yojson (x : update_job_from_source_control_request) =
  assoc_to_yojson
    [
      ("AuthToken", option_to_yojson auth_token_string_to_yojson x.auth_token);
      ("AuthStrategy", option_to_yojson source_control_auth_strategy_to_yojson x.auth_strategy);
      ("CommitId", option_to_yojson commit_id_string_to_yojson x.commit_id);
      ("Folder", option_to_yojson name_string_to_yojson x.folder);
      ("BranchName", option_to_yojson name_string_to_yojson x.branch_name);
      ("RepositoryOwner", option_to_yojson name_string_to_yojson x.repository_owner);
      ("RepositoryName", option_to_yojson name_string_to_yojson x.repository_name);
      ("Provider", option_to_yojson source_control_provider_to_yojson x.provider);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
    ]

let update_integration_table_properties_response_to_yojson = unit_to_yojson
let string512_to_yojson = string_to_yojson
let string128_to_yojson = string_to_yojson
let source_table_fields_list_to_yojson tree = list_to_yojson string128_to_yojson tree
let primary_key_list_to_yojson tree = list_to_yojson string128_to_yojson tree

let source_table_config_to_yojson (x : source_table_config) =
  assoc_to_yojson
    [
      ("RecordUpdateField", option_to_yojson string128_to_yojson x.record_update_field);
      ("PrimaryKey", option_to_yojson primary_key_list_to_yojson x.primary_key);
      ("FilterPredicate", option_to_yojson string128_to_yojson x.filter_predicate);
      ("Fields", option_to_yojson source_table_fields_list_to_yojson x.fields);
    ]

let unnest_spec_to_yojson (x : unnest_spec) =
  match x with
  | NOUNNEST -> `String "NOUNNEST"
  | FULL -> `String "FULL"
  | TOPLEVEL -> `String "TOPLEVEL"

let integration_partition_to_yojson (x : integration_partition) =
  assoc_to_yojson
    [
      ("ConversionSpec", option_to_yojson string128_to_yojson x.conversion_spec);
      ("FunctionSpec", option_to_yojson string128_to_yojson x.function_spec);
      ("FieldName", option_to_yojson string128_to_yojson x.field_name);
    ]

let integration_partition_spec_list_to_yojson tree =
  list_to_yojson integration_partition_to_yojson tree

let target_table_config_to_yojson (x : target_table_config) =
  assoc_to_yojson
    [
      ("TargetTableName", option_to_yojson string128_to_yojson x.target_table_name);
      ("PartitionSpec", option_to_yojson integration_partition_spec_list_to_yojson x.partition_spec);
      ("UnnestSpec", option_to_yojson unnest_spec_to_yojson x.unnest_spec);
    ]

let update_integration_table_properties_request_to_yojson
    (x : update_integration_table_properties_request) =
  assoc_to_yojson
    [
      ("TargetTableConfig", option_to_yojson target_table_config_to_yojson x.target_table_config);
      ("SourceTableConfig", option_to_yojson source_table_config_to_yojson x.source_table_config);
      ("TableName", Some (string128_to_yojson x.table_name));
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
    ]

let integration_error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let source_processing_properties_to_yojson (x : source_processing_properties) =
  assoc_to_yojson [ ("RoleArn", option_to_yojson string128_to_yojson x.role_arn) ]

let string2048_to_yojson = string_to_yojson

let target_processing_properties_to_yojson (x : target_processing_properties) =
  assoc_to_yojson
    [
      ("EventBusArn", option_to_yojson string2048_to_yojson x.event_bus_arn);
      ("ConnectionName", option_to_yojson string128_to_yojson x.connection_name);
      ("KmsArn", option_to_yojson string2048_to_yojson x.kms_arn);
      ("RoleArn", option_to_yojson string128_to_yojson x.role_arn);
    ]

let update_integration_resource_property_response_to_yojson
    (x : update_integration_resource_property_response) =
  assoc_to_yojson
    [
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ("ResourcePropertyArn", option_to_yojson string512_to_yojson x.resource_property_arn);
      ("ResourceArn", option_to_yojson string512_to_yojson x.resource_arn);
    ]

let update_integration_resource_property_request_to_yojson
    (x : update_integration_resource_property_request) =
  assoc_to_yojson
    [
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
    ]

let grok_pattern_to_yojson = string_to_yojson
let custom_patterns_to_yojson = string_to_yojson

let update_grok_classifier_request_to_yojson (x : update_grok_classifier_request) =
  assoc_to_yojson
    [
      ("CustomPatterns", option_to_yojson custom_patterns_to_yojson x.custom_patterns);
      ("GrokPattern", option_to_yojson grok_pattern_to_yojson x.grok_pattern);
      ("Classification", option_to_yojson classification_to_yojson x.classification);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let update_glue_identity_center_configuration_response_to_yojson = unit_to_yojson
let identity_center_scope_to_yojson = string_to_yojson
let identity_center_scopes_list_to_yojson tree = list_to_yojson identity_center_scope_to_yojson tree

let update_glue_identity_center_configuration_request_to_yojson
    (x : update_glue_identity_center_configuration_request) =
  assoc_to_yojson
    [
      ( "UserBackgroundSessionsEnabled",
        option_to_yojson nullable_boolean_to_yojson x.user_background_sessions_enabled );
      ("Scopes", option_to_yojson identity_center_scopes_list_to_yojson x.scopes);
    ]

let glossary_term_id_to_yojson = string_to_yojson
let glossary_id_to_yojson = string_to_yojson
let glossary_term_name_to_yojson = string_to_yojson
let glossary_short_description_to_yojson = string_to_yojson
let glossary_long_description_to_yojson = string_to_yojson

let update_glossary_term_response_to_yojson (x : update_glossary_term_response) =
  assoc_to_yojson
    [
      ("LongDescription", option_to_yojson glossary_long_description_to_yojson x.long_description);
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
      ("Name", option_to_yojson glossary_term_name_to_yojson x.name);
      ("GlossaryId", option_to_yojson glossary_id_to_yojson x.glossary_id);
      ("Id", option_to_yojson glossary_term_id_to_yojson x.id);
    ]

let update_glossary_term_request_to_yojson (x : update_glossary_term_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LongDescription", option_to_yojson glossary_long_description_to_yojson x.long_description);
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
      ("Name", option_to_yojson glossary_term_name_to_yojson x.name);
      ("Identifier", Some (glossary_term_id_to_yojson x.identifier));
    ]

let glossary_name_to_yojson = string_to_yojson
let metadata_description_to_yojson = string_to_yojson

let update_glossary_response_to_yojson (x : update_glossary_response) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
      ("Name", option_to_yojson glossary_name_to_yojson x.name);
      ("Id", option_to_yojson glossary_id_to_yojson x.id);
    ]

let update_glossary_request_to_yojson (x : update_glossary_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
      ("Name", option_to_yojson glossary_name_to_yojson x.name);
      ("Identifier", Some (glossary_id_to_yojson x.identifier));
    ]

let update_dev_endpoint_response_to_yojson = unit_to_yojson
let public_keys_list_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let dev_endpoint_custom_libraries_to_yojson (x : dev_endpoint_custom_libraries) =
  assoc_to_yojson
    [
      ("ExtraJarsS3Path", option_to_yojson generic_string_to_yojson x.extra_jars_s3_path);
      ( "ExtraPythonLibsS3Path",
        option_to_yojson generic_string_to_yojson x.extra_python_libs_s3_path );
    ]

let string_list_to_yojson tree = list_to_yojson generic_string_to_yojson tree
let map_value_to_yojson tree = map_to_yojson generic_string_to_yojson generic_string_to_yojson tree

let update_dev_endpoint_request_to_yojson (x : update_dev_endpoint_request) =
  assoc_to_yojson
    [
      ("AddArguments", option_to_yojson map_value_to_yojson x.add_arguments);
      ("DeleteArguments", option_to_yojson string_list_to_yojson x.delete_arguments);
      ("UpdateEtlLibraries", option_to_yojson boolean_value_to_yojson x.update_etl_libraries);
      ( "CustomLibraries",
        option_to_yojson dev_endpoint_custom_libraries_to_yojson x.custom_libraries );
      ("DeletePublicKeys", option_to_yojson public_keys_list_to_yojson x.delete_public_keys);
      ("AddPublicKeys", option_to_yojson public_keys_list_to_yojson x.add_public_keys);
      ("PublicKey", option_to_yojson generic_string_to_yojson x.public_key);
      ("EndpointName", Some (generic_string_to_yojson x.endpoint_name));
    ]

let update_database_response_to_yojson = unit_to_yojson
let data_lake_principal_string_to_yojson = string_to_yojson

let data_lake_principal_to_yojson (x : data_lake_principal) =
  assoc_to_yojson
    [
      ( "DataLakePrincipalIdentifier",
        option_to_yojson data_lake_principal_string_to_yojson x.data_lake_principal_identifier );
    ]

let permission_to_yojson (x : permission) =
  match x with
  | DATA_LOCATION_ACCESS -> `String "DATA_LOCATION_ACCESS"
  | CREATE_TABLE -> `String "CREATE_TABLE"
  | CREATE_DATABASE -> `String "CREATE_DATABASE"
  | INSERT -> `String "INSERT"
  | DELETE -> `String "DELETE"
  | DROP -> `String "DROP"
  | ALTER -> `String "ALTER"
  | SELECT -> `String "SELECT"
  | ALL -> `String "ALL"

let permission_list_to_yojson tree = list_to_yojson permission_to_yojson tree

let principal_permissions_to_yojson (x : principal_permissions) =
  assoc_to_yojson
    [
      ("Permissions", option_to_yojson permission_list_to_yojson x.permissions);
      ("Principal", option_to_yojson data_lake_principal_to_yojson x.principal);
    ]

let principal_permissions_list_to_yojson tree = list_to_yojson principal_permissions_to_yojson tree

let database_identifier_to_yojson (x : database_identifier) =
  assoc_to_yojson
    [
      ("Region", option_to_yojson name_string_to_yojson x.region);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let federation_identifier_to_yojson = string_to_yojson

let federated_database_to_yojson (x : federated_database) =
  assoc_to_yojson
    [
      ("ConnectionType", option_to_yojson name_string_to_yojson x.connection_type);
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ("Identifier", option_to_yojson federation_identifier_to_yojson x.identifier);
    ]

let database_input_to_yojson (x : database_input) =
  assoc_to_yojson
    [
      ("FederatedDatabase", option_to_yojson federated_database_to_yojson x.federated_database);
      ("TargetDatabase", option_to_yojson database_identifier_to_yojson x.target_database);
      ( "CreateTableDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_table_default_permissions );
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("LocationUri", option_to_yojson ur_i_to_yojson x.location_uri);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let update_database_request_to_yojson (x : update_database_request) =
  assoc_to_yojson
    [
      ("DatabaseInput", Some (database_input_to_yojson x.database_input));
      ("Name", Some (name_string_to_yojson x.name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let data_quality_ruleset_string_to_yojson = string_to_yojson

let update_data_quality_ruleset_response_to_yojson (x : update_data_quality_ruleset_response) =
  assoc_to_yojson
    [
      ("Ruleset", option_to_yojson data_quality_ruleset_string_to_yojson x.ruleset);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let update_data_quality_ruleset_request_to_yojson (x : update_data_quality_ruleset_request) =
  assoc_to_yojson
    [
      ("Ruleset", option_to_yojson data_quality_ruleset_string_to_yojson x.ruleset);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let csv_column_delimiter_to_yojson = string_to_yojson
let csv_quote_symbol_to_yojson = string_to_yojson

let csv_header_option_to_yojson (x : csv_header_option) =
  match x with
  | ABSENT -> `String "ABSENT"
  | PRESENT -> `String "PRESENT"
  | UNKNOWN -> `String "UNKNOWN"

let csv_header_to_yojson tree = list_to_yojson name_string_to_yojson tree
let custom_datatypes_to_yojson tree = list_to_yojson name_string_to_yojson tree

let csv_serde_option_to_yojson (x : csv_serde_option) =
  match x with
  | None_ -> `String "None"
  | LazySimpleSerDe -> `String "LazySimpleSerDe"
  | OpenCSVSerDe -> `String "OpenCSVSerDe"

let update_csv_classifier_request_to_yojson (x : update_csv_classifier_request) =
  assoc_to_yojson
    [
      ("Serde", option_to_yojson csv_serde_option_to_yojson x.serde);
      ("CustomDatatypes", option_to_yojson custom_datatypes_to_yojson x.custom_datatypes);
      ( "CustomDatatypeConfigured",
        option_to_yojson nullable_boolean_to_yojson x.custom_datatype_configured );
      ("AllowSingleColumn", option_to_yojson nullable_boolean_to_yojson x.allow_single_column);
      ("DisableValueTrimming", option_to_yojson nullable_boolean_to_yojson x.disable_value_trimming);
      ("Header", option_to_yojson csv_header_to_yojson x.header);
      ("ContainsHeader", option_to_yojson csv_header_option_to_yojson x.contains_header);
      ("QuoteSymbol", option_to_yojson csv_quote_symbol_to_yojson x.quote_symbol);
      ("Delimiter", option_to_yojson csv_column_delimiter_to_yojson x.delimiter);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let update_crawler_schedule_response_to_yojson = unit_to_yojson
let cron_expression_to_yojson = string_to_yojson

let update_crawler_schedule_request_to_yojson (x : update_crawler_schedule_request) =
  assoc_to_yojson
    [
      ("Schedule", option_to_yojson cron_expression_to_yojson x.schedule);
      ("CrawlerName", Some (name_string_to_yojson x.crawler_name));
    ]

let scheduler_transitioning_exception_to_yojson (x : scheduler_transitioning_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_crawler_response_to_yojson = unit_to_yojson
let role_to_yojson = string_to_yojson
let database_name_to_yojson = string_to_yojson
let description_string_removable_to_yojson = string_to_yojson
let path_to_yojson = string_to_yojson
let path_list_to_yojson tree = list_to_yojson path_to_yojson tree
let connection_name_to_yojson = string_to_yojson
let event_queue_arn_to_yojson = string_to_yojson

let s3_target_to_yojson (x : s3_target) =
  assoc_to_yojson
    [
      ("DlqEventQueueArn", option_to_yojson event_queue_arn_to_yojson x.dlq_event_queue_arn);
      ("EventQueueArn", option_to_yojson event_queue_arn_to_yojson x.event_queue_arn);
      ("SampleSize", option_to_yojson nullable_integer_to_yojson x.sample_size);
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("Exclusions", option_to_yojson path_list_to_yojson x.exclusions);
      ("Path", option_to_yojson path_to_yojson x.path);
    ]

let s3_target_list_to_yojson tree = list_to_yojson s3_target_to_yojson tree

let jdbc_metadata_entry_to_yojson (x : jdbc_metadata_entry) =
  match x with RAWTYPES -> `String "RAWTYPES" | COMMENTS -> `String "COMMENTS"

let enable_additional_metadata_to_yojson tree = list_to_yojson jdbc_metadata_entry_to_yojson tree

let jdbc_target_to_yojson (x : jdbc_target) =
  assoc_to_yojson
    [
      ( "EnableAdditionalMetadata",
        option_to_yojson enable_additional_metadata_to_yojson x.enable_additional_metadata );
      ("Exclusions", option_to_yojson path_list_to_yojson x.exclusions);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
    ]

let jdbc_target_list_to_yojson tree = list_to_yojson jdbc_target_to_yojson tree

let mongo_db_target_to_yojson (x : mongo_db_target) =
  assoc_to_yojson
    [
      ("ScanAll", option_to_yojson nullable_boolean_to_yojson x.scan_all);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
    ]

let mongo_db_target_list_to_yojson tree = list_to_yojson mongo_db_target_to_yojson tree

let dynamo_db_target_to_yojson (x : dynamo_db_target) =
  assoc_to_yojson
    [
      ("scanRate", option_to_yojson nullable_double_to_yojson x.scan_rate);
      ("scanAll", option_to_yojson nullable_boolean_to_yojson x.scan_all);
      ("Path", option_to_yojson path_to_yojson x.path);
    ]

let dynamo_db_target_list_to_yojson tree = list_to_yojson dynamo_db_target_to_yojson tree
let catalog_tables_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let catalog_target_to_yojson (x : catalog_target) =
  assoc_to_yojson
    [
      ("DlqEventQueueArn", option_to_yojson event_queue_arn_to_yojson x.dlq_event_queue_arn);
      ("EventQueueArn", option_to_yojson event_queue_arn_to_yojson x.event_queue_arn);
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("Tables", Some (catalog_tables_list_to_yojson x.tables));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
    ]

let catalog_target_list_to_yojson tree = list_to_yojson catalog_target_to_yojson tree

let delta_target_to_yojson (x : delta_target) =
  assoc_to_yojson
    [
      ( "CreateNativeDeltaTable",
        option_to_yojson nullable_boolean_to_yojson x.create_native_delta_table );
      ("WriteManifest", option_to_yojson nullable_boolean_to_yojson x.write_manifest);
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("DeltaTables", option_to_yojson path_list_to_yojson x.delta_tables);
    ]

let delta_target_list_to_yojson tree = list_to_yojson delta_target_to_yojson tree

let iceberg_target_to_yojson (x : iceberg_target) =
  assoc_to_yojson
    [
      ( "MaximumTraversalDepth",
        option_to_yojson nullable_integer_to_yojson x.maximum_traversal_depth );
      ("Exclusions", option_to_yojson path_list_to_yojson x.exclusions);
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("Paths", option_to_yojson path_list_to_yojson x.paths);
    ]

let iceberg_target_list_to_yojson tree = list_to_yojson iceberg_target_to_yojson tree

let hudi_target_to_yojson (x : hudi_target) =
  assoc_to_yojson
    [
      ( "MaximumTraversalDepth",
        option_to_yojson nullable_integer_to_yojson x.maximum_traversal_depth );
      ("Exclusions", option_to_yojson path_list_to_yojson x.exclusions);
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("Paths", option_to_yojson path_list_to_yojson x.paths);
    ]

let hudi_target_list_to_yojson tree = list_to_yojson hudi_target_to_yojson tree

let crawler_targets_to_yojson (x : crawler_targets) =
  assoc_to_yojson
    [
      ("HudiTargets", option_to_yojson hudi_target_list_to_yojson x.hudi_targets);
      ("IcebergTargets", option_to_yojson iceberg_target_list_to_yojson x.iceberg_targets);
      ("DeltaTargets", option_to_yojson delta_target_list_to_yojson x.delta_targets);
      ("CatalogTargets", option_to_yojson catalog_target_list_to_yojson x.catalog_targets);
      ("DynamoDBTargets", option_to_yojson dynamo_db_target_list_to_yojson x.dynamo_db_targets);
      ("MongoDBTargets", option_to_yojson mongo_db_target_list_to_yojson x.mongo_db_targets);
      ("JdbcTargets", option_to_yojson jdbc_target_list_to_yojson x.jdbc_targets);
      ("S3Targets", option_to_yojson s3_target_list_to_yojson x.s3_targets);
    ]

let classifier_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree
let table_prefix_to_yojson = string_to_yojson

let update_behavior_to_yojson (x : update_behavior) =
  match x with UPDATE_IN_DATABASE -> `String "UPDATE_IN_DATABASE" | LOG -> `String "LOG"

let delete_behavior_to_yojson (x : delete_behavior) =
  match x with
  | DEPRECATE_IN_DATABASE -> `String "DEPRECATE_IN_DATABASE"
  | DELETE_FROM_DATABASE -> `String "DELETE_FROM_DATABASE"
  | LOG -> `String "LOG"

let schema_change_policy_to_yojson (x : schema_change_policy) =
  assoc_to_yojson
    [
      ("DeleteBehavior", option_to_yojson delete_behavior_to_yojson x.delete_behavior);
      ("UpdateBehavior", option_to_yojson update_behavior_to_yojson x.update_behavior);
    ]

let recrawl_behavior_to_yojson (x : recrawl_behavior) =
  match x with
  | CRAWL_EVENT_MODE -> `String "CRAWL_EVENT_MODE"
  | CRAWL_NEW_FOLDERS_ONLY -> `String "CRAWL_NEW_FOLDERS_ONLY"
  | CRAWL_EVERYTHING -> `String "CRAWL_EVERYTHING"

let recrawl_policy_to_yojson (x : recrawl_policy) =
  assoc_to_yojson
    [ ("RecrawlBehavior", option_to_yojson recrawl_behavior_to_yojson x.recrawl_behavior) ]

let crawler_lineage_settings_to_yojson (x : crawler_lineage_settings) =
  match x with DISABLE -> `String "DISABLE" | ENABLE -> `String "ENABLE"

let lineage_configuration_to_yojson (x : lineage_configuration) =
  assoc_to_yojson
    [
      ( "CrawlerLineageSettings",
        option_to_yojson crawler_lineage_settings_to_yojson x.crawler_lineage_settings );
    ]

let account_id_to_yojson = string_to_yojson

let lake_formation_configuration_to_yojson (x : lake_formation_configuration) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "UseLakeFormationCredentials",
        option_to_yojson nullable_boolean_to_yojson x.use_lake_formation_credentials );
    ]

let crawler_configuration_to_yojson = string_to_yojson
let crawler_security_configuration_to_yojson = string_to_yojson

let update_crawler_request_to_yojson (x : update_crawler_request) =
  assoc_to_yojson
    [
      ( "CrawlerSecurityConfiguration",
        option_to_yojson crawler_security_configuration_to_yojson x.crawler_security_configuration
      );
      ("Configuration", option_to_yojson crawler_configuration_to_yojson x.configuration);
      ( "LakeFormationConfiguration",
        option_to_yojson lake_formation_configuration_to_yojson x.lake_formation_configuration );
      ( "LineageConfiguration",
        option_to_yojson lineage_configuration_to_yojson x.lineage_configuration );
      ("RecrawlPolicy", option_to_yojson recrawl_policy_to_yojson x.recrawl_policy);
      ("SchemaChangePolicy", option_to_yojson schema_change_policy_to_yojson x.schema_change_policy);
      ("TablePrefix", option_to_yojson table_prefix_to_yojson x.table_prefix);
      ("Classifiers", option_to_yojson classifier_name_list_to_yojson x.classifiers);
      ("Schedule", option_to_yojson cron_expression_to_yojson x.schedule);
      ("Targets", option_to_yojson crawler_targets_to_yojson x.targets);
      ("Description", option_to_yojson description_string_removable_to_yojson x.description);
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let crawler_running_exception_to_yojson (x : crawler_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let update_connection_response_to_yojson = unit_to_yojson

let connection_type_to_yojson (x : connection_type) =
  match x with
  | VERTICA -> `String "VERTICA"
  | TPCDS -> `String "TPCDS"
  | TIMESTREAM -> `String "TIMESTREAM"
  | TERADATANOS -> `String "TERADATANOS"
  | TERADATA -> `String "TERADATA"
  | SYNAPSE -> `String "SYNAPSE"
  | SQLSERVER -> `String "SQLSERVER"
  | SAPHANA -> `String "SAPHANA"
  | POSTGRESQL -> `String "POSTGRESQL"
  | PIPEDRIVE -> `String "PIPEDRIVE"
  | ORACLE -> `String "ORACLE"
  | OPENSEARCH -> `String "OPENSEARCH"
  | OKTA -> `String "OKTA"
  | MYSQL -> `String "MYSQL"
  | MONDAY -> `String "MONDAY"
  | MICROSOFTDYNAMICS365CRM -> `String "MICROSOFTDYNAMICS365CRM"
  | KUSTOMER -> `String "KUSTOMER"
  | HBASE -> `String "HBASE"
  | GOOGLECLOUDSTORAGE -> `String "GOOGLECLOUDSTORAGE"
  | DYNAMODB -> `String "DYNAMODB"
  | DOMO -> `String "DOMO"
  | DOCUMENTDB -> `String "DOCUMENTDB"
  | DB2AS400 -> `String "DB2AS400"
  | DB2 -> `String "DB2"
  | DATALAKEGEN2 -> `String "DATALAKEGEN2"
  | CMDB -> `String "CMDB"
  | CLOUDWATCHMETRICS -> `String "CLOUDWATCHMETRICS"
  | CLOUDWATCH -> `String "CLOUDWATCH"
  | CLOUDERAIMPALA -> `String "CLOUDERAIMPALA"
  | CLOUDERAHIVE -> `String "CLOUDERAHIVE"
  | BLACKBAUD -> `String "BLACKBAUD"
  | BIGQUERY -> `String "BIGQUERY"
  | AZURESQL -> `String "AZURESQL"
  | AZURECOSMOS -> `String "AZURECOSMOS"
  | SENDGRID -> `String "SENDGRID"
  | PIPEDIVE -> `String "PIPEDIVE"
  | CIRCLECI -> `String "CIRCLECI"
  | PRODUCTBOARD -> `String "PRODUCTBOARD"
  | PENDO -> `String "PENDO"
  | GITLAB -> `String "GITLAB"
  | MAILCHIMP -> `String "MAILCHIMP"
  | BLACKBAUDRAISEREDGENXT -> `String "BLACKBAUDRAISEREDGENXT"
  | MICROSOFTTEAMS -> `String "MICROSOFTTEAMS"
  | MICROSOFTDYNAMIC365FINANCEANDOPS -> `String "MICROSOFTDYNAMIC365FINANCEANDOPS"
  | DYNATRACE -> `String "DYNATRACE"
  | SAPCONCUR -> `String "SAPCONCUR"
  | SALESFORCECOMMERCECLOUD -> `String "SALESFORCECOMMERCECLOUD"
  | GOOGLESEARCHCONSOLE -> `String "GOOGLESEARCHCONSOLE"
  | ZOOM -> `String "ZOOM"
  | FRESHSALES -> `String "FRESHSALES"
  | DOCUSIGNMONITOR -> `String "DOCUSIGNMONITOR"
  | TWILIO -> `String "TWILIO"
  | FRESHDESK -> `String "FRESHDESK"
  | FACEBOOKPAGEINSIGHTS -> `String "FACEBOOKPAGEINSIGHTS"
  | QUICKBOOKS -> `String "QUICKBOOKS"
  | PAYPAL -> `String "PAYPAL"
  | SNAPCHATADS -> `String "SNAPCHATADS"
  | INTERCOM -> `String "INTERCOM"
  | WOOCOMMERCE -> `String "WOOCOMMERCE"
  | DATADOG -> `String "DATADOG"
  | SMARTSHEET -> `String "SMARTSHEET"
  | STRIPE -> `String "STRIPE"
  | ASANA -> `String "ASANA"
  | MIXPANEL -> `String "MIXPANEL"
  | LINKEDIN -> `String "LINKEDIN"
  | SLACK -> `String "SLACK"
  | ADOBEANALYTICS -> `String "ADOBEANALYTICS"
  | SALESFORCEMARKETINGCLOUD -> `String "SALESFORCEMARKETINGCLOUD"
  | SALESFORCEPARDOT -> `String "SALESFORCEPARDOT"
  | ZOHOCRM -> `String "ZOHOCRM"
  | INSTAGRAMADS -> `String "INSTAGRAMADS"
  | FACEBOOKADS -> `String "FACEBOOKADS"
  | HUBSPOT -> `String "HUBSPOT"
  | NETSUITEERP -> `String "NETSUITEERP"
  | JIRACLOUD -> `String "JIRACLOUD"
  | ZENDESK -> `String "ZENDESK"
  | SAPODATA -> `String "SAPODATA"
  | MARKETO -> `String "MARKETO"
  | SERVICENOW -> `String "SERVICENOW"
  | GOOGLEANALYTICS4 -> `String "GOOGLEANALYTICS4"
  | GOOGLESHEETS -> `String "GOOGLESHEETS"
  | GOOGLEADS -> `String "GOOGLEADS"
  | VIEW_VALIDATION_ATHENA -> `String "VIEW_VALIDATION_ATHENA"
  | VIEW_VALIDATION_REDSHIFT -> `String "VIEW_VALIDATION_REDSHIFT"
  | SALESFORCE -> `String "SALESFORCE"
  | CUSTOM -> `String "CUSTOM"
  | MARKETPLACE -> `String "MARKETPLACE"
  | NETWORK -> `String "NETWORK"
  | KAFKA -> `String "KAFKA"
  | MONGODB -> `String "MONGODB"
  | SFTP -> `String "SFTP"
  | JDBC -> `String "JDBC"

let match_criteria_to_yojson tree = list_to_yojson name_string_to_yojson tree

let connection_property_key_to_yojson (x : connection_property_key) =
  match x with
  | DATABASE -> `String "DATABASE"
  | CLUSTER_IDENTIFIER -> `String "CLUSTER_IDENTIFIER"
  | WORKGROUP_NAME -> `String "WORKGROUP_NAME"
  | REGION -> `String "REGION"
  | ROLE_ARN -> `String "ROLE_ARN"
  | ENDPOINT_TYPE -> `String "ENDPOINT_TYPE"
  | ENDPOINT -> `String "ENDPOINT"
  | CONNECTOR_CLASS_NAME -> `String "CONNECTOR_CLASS_NAME"
  | CONNECTOR_TYPE -> `String "CONNECTOR_TYPE"
  | CONNECTOR_URL -> `String "CONNECTOR_URL"
  | SECRET_ID -> `String "SECRET_ID"
  | KAFKA_SASL_GSSAPI_PRINCIPAL -> `String "KAFKA_SASL_GSSAPI_PRINCIPAL"
  | KAFKA_SASL_GSSAPI_SERVICE -> `String "KAFKA_SASL_GSSAPI_SERVICE"
  | KAFKA_SASL_GSSAPI_KRB5_CONF -> `String "KAFKA_SASL_GSSAPI_KRB5_CONF"
  | KAFKA_SASL_GSSAPI_KEYTAB -> `String "KAFKA_SASL_GSSAPI_KEYTAB"
  | ENCRYPTED_KAFKA_SASL_SCRAM_PASSWORD -> `String "ENCRYPTED_KAFKA_SASL_SCRAM_PASSWORD"
  | KAFKA_SASL_SCRAM_SECRETS_ARN -> `String "KAFKA_SASL_SCRAM_SECRETS_ARN"
  | KAFKA_SASL_SCRAM_PASSWORD -> `String "KAFKA_SASL_SCRAM_PASSWORD"
  | KAFKA_SASL_SCRAM_USERNAME -> `String "KAFKA_SASL_SCRAM_USERNAME"
  | ENCRYPTED_KAFKA_SASL_PLAIN_PASSWORD -> `String "ENCRYPTED_KAFKA_SASL_PLAIN_PASSWORD"
  | KAFKA_SASL_PLAIN_PASSWORD -> `String "KAFKA_SASL_PLAIN_PASSWORD"
  | KAFKA_SASL_PLAIN_USERNAME -> `String "KAFKA_SASL_PLAIN_USERNAME"
  | KAFKA_SASL_MECHANISM -> `String "KAFKA_SASL_MECHANISM"
  | ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD -> `String "ENCRYPTED_KAFKA_CLIENT_KEY_PASSWORD"
  | ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD -> `String "ENCRYPTED_KAFKA_CLIENT_KEYSTORE_PASSWORD"
  | KAFKA_CLIENT_KEY_PASSWORD -> `String "KAFKA_CLIENT_KEY_PASSWORD"
  | KAFKA_CLIENT_KEYSTORE_PASSWORD -> `String "KAFKA_CLIENT_KEYSTORE_PASSWORD"
  | KAFKA_CLIENT_KEYSTORE -> `String "KAFKA_CLIENT_KEYSTORE"
  | KAFKA_SKIP_CUSTOM_CERT_VALIDATION -> `String "KAFKA_SKIP_CUSTOM_CERT_VALIDATION"
  | KAFKA_CUSTOM_CERT -> `String "KAFKA_CUSTOM_CERT"
  | KAFKA_SSL_ENABLED -> `String "KAFKA_SSL_ENABLED"
  | KAFKA_BOOTSTRAP_SERVERS -> `String "KAFKA_BOOTSTRAP_SERVERS"
  | CONNECTION_URL -> `String "CONNECTION_URL"
  | CUSTOM_JDBC_CERT_STRING -> `String "CUSTOM_JDBC_CERT_STRING"
  | SKIP_CUSTOM_JDBC_CERT_VALIDATION -> `String "SKIP_CUSTOM_JDBC_CERT_VALIDATION"
  | CUSTOM_JDBC_CERT -> `String "CUSTOM_JDBC_CERT"
  | JDBC_ENFORCE_SSL -> `String "JDBC_ENFORCE_SSL"
  | JDBC_CONNECTION_URL -> `String "JDBC_CONNECTION_URL"
  | INSTANCE_ID -> `String "INSTANCE_ID"
  | CONFIG_FILES -> `String "CONFIG_FILES"
  | JDBC_ENGINE_VERSION -> `String "JDBC_ENGINE_VERSION"
  | JDBC_ENGINE -> `String "JDBC_ENGINE"
  | JDBC_DRIVER_CLASS_NAME -> `String "JDBC_DRIVER_CLASS_NAME"
  | JDBC_DRIVER_JAR_URI -> `String "JDBC_DRIVER_JAR_URI"
  | ENCRYPTED_PASSWORD -> `String "ENCRYPTED_PASSWORD"
  | PASSWORD -> `String "PASSWORD"
  | USER_NAME -> `String "USERNAME"
  | PORT -> `String "PORT"
  | HOST -> `String "HOST"

let connection_properties_to_yojson tree =
  map_to_yojson connection_property_key_to_yojson value_string_to_yojson tree

let property_value_to_yojson = string_to_yojson
let property_key_to_yojson = string_to_yojson
let property_map_to_yojson tree = map_to_yojson property_key_to_yojson property_value_to_yojson tree
let security_group_id_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let physical_connection_requirements_to_yojson (x : physical_connection_requirements) =
  assoc_to_yojson
    [
      ("AvailabilityZone", option_to_yojson name_string_to_yojson x.availability_zone);
      ( "SecurityGroupIdList",
        option_to_yojson security_group_id_list_to_yojson x.security_group_id_list );
      ("SubnetId", option_to_yojson name_string_to_yojson x.subnet_id);
    ]

let authentication_type_to_yojson (x : authentication_type) =
  match x with
  | IAM -> `String "IAM"
  | CUSTOM -> `String "CUSTOM"
  | OAUTH2 -> `String "OAUTH2"
  | BASIC -> `String "BASIC"

let o_auth2_grant_type_to_yojson (x : o_auth2_grant_type) =
  match x with
  | JWT_BEARER -> `String "JWT_BEARER"
  | CLIENT_CREDENTIALS -> `String "CLIENT_CREDENTIALS"
  | AUTHORIZATION_CODE -> `String "AUTHORIZATION_CODE"

let aws_managed_client_application_reference_to_yojson = string_to_yojson

let o_auth2_client_application_to_yojson (x : o_auth2_client_application) =
  assoc_to_yojson
    [
      ( "AWSManagedClientApplicationReference",
        option_to_yojson aws_managed_client_application_reference_to_yojson
          x.aws_managed_client_application_reference );
      ( "UserManagedClientApplicationClientId",
        option_to_yojson user_managed_client_application_client_id_to_yojson
          x.user_managed_client_application_client_id );
    ]

let token_url_to_yojson = string_to_yojson
let token_url_parameter_value_to_yojson = string_to_yojson
let token_url_parameter_key_to_yojson = string_to_yojson

let token_url_parameters_map_to_yojson tree =
  map_to_yojson token_url_parameter_key_to_yojson token_url_parameter_value_to_yojson tree

let authorization_code_to_yojson = string_to_yojson
let redirect_uri_to_yojson = string_to_yojson

let authorization_code_properties_to_yojson (x : authorization_code_properties) =
  assoc_to_yojson
    [
      ("RedirectUri", option_to_yojson redirect_uri_to_yojson x.redirect_uri);
      ("AuthorizationCode", option_to_yojson authorization_code_to_yojson x.authorization_code);
    ]

let access_token_to_yojson = string_to_yojson
let refresh_token_to_yojson = string_to_yojson
let jwt_token_to_yojson = string_to_yojson

let o_auth2_credentials_to_yojson (x : o_auth2_credentials) =
  assoc_to_yojson
    [
      ("JwtToken", option_to_yojson jwt_token_to_yojson x.jwt_token);
      ("RefreshToken", option_to_yojson refresh_token_to_yojson x.refresh_token);
      ("AccessToken", option_to_yojson access_token_to_yojson x.access_token);
      ( "UserManagedClientApplicationClientSecret",
        option_to_yojson user_managed_client_application_client_secret_to_yojson
          x.user_managed_client_application_client_secret );
    ]

let o_auth2_properties_input_to_yojson (x : o_auth2_properties_input) =
  assoc_to_yojson
    [
      ("OAuth2Credentials", option_to_yojson o_auth2_credentials_to_yojson x.o_auth2_credentials);
      ( "AuthorizationCodeProperties",
        option_to_yojson authorization_code_properties_to_yojson x.authorization_code_properties );
      ( "TokenUrlParametersMap",
        option_to_yojson token_url_parameters_map_to_yojson x.token_url_parameters_map );
      ("TokenUrl", option_to_yojson token_url_to_yojson x.token_url);
      ( "OAuth2ClientApplication",
        option_to_yojson o_auth2_client_application_to_yojson x.o_auth2_client_application );
      ("OAuth2GrantType", option_to_yojson o_auth2_grant_type_to_yojson x.o_auth2_grant_type);
    ]

let secret_arn_to_yojson = string_to_yojson
let kms_key_arn_to_yojson = string_to_yojson
let password_to_yojson = string_to_yojson

let basic_authentication_credentials_to_yojson (x : basic_authentication_credentials) =
  assoc_to_yojson
    [
      ("Password", option_to_yojson password_to_yojson x.password);
      ("Username", option_to_yojson username_to_yojson x.username);
    ]

let credential_value_to_yojson = string_to_yojson
let credential_key_to_yojson = string_to_yojson

let credential_map_to_yojson tree =
  map_to_yojson credential_key_to_yojson credential_value_to_yojson tree

let authentication_configuration_input_to_yojson (x : authentication_configuration_input) =
  assoc_to_yojson
    [
      ( "CustomAuthenticationCredentials",
        option_to_yojson credential_map_to_yojson x.custom_authentication_credentials );
      ( "BasicAuthenticationCredentials",
        option_to_yojson basic_authentication_credentials_to_yojson
          x.basic_authentication_credentials );
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("OAuth2Properties", option_to_yojson o_auth2_properties_input_to_yojson x.o_auth2_properties);
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
    ]

let compute_environment_to_yojson (x : compute_environment) =
  match x with PYTHON -> `String "PYTHON" | ATHENA -> `String "ATHENA" | SPARK -> `String "SPARK"

let compute_environment_list_to_yojson tree = list_to_yojson compute_environment_to_yojson tree

let connection_input_to_yojson (x : connection_input) =
  assoc_to_yojson
    [
      ( "ValidateForComputeEnvironments",
        option_to_yojson compute_environment_list_to_yojson x.validate_for_compute_environments );
      ("ValidateCredentials", option_to_yojson boolean__to_yojson x.validate_credentials);
      ( "AuthenticationConfiguration",
        option_to_yojson authentication_configuration_input_to_yojson x.authentication_configuration
      );
      ( "PhysicalConnectionRequirements",
        option_to_yojson physical_connection_requirements_to_yojson
          x.physical_connection_requirements );
      ("PythonProperties", option_to_yojson property_map_to_yojson x.python_properties);
      ("AthenaProperties", option_to_yojson property_map_to_yojson x.athena_properties);
      ("SparkProperties", option_to_yojson property_map_to_yojson x.spark_properties);
      ("ConnectionProperties", Some (connection_properties_to_yojson x.connection_properties));
      ("MatchCriteria", option_to_yojson match_criteria_to_yojson x.match_criteria);
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let update_connection_request_to_yojson (x : update_connection_request) =
  assoc_to_yojson
    [
      ("ConnectionInput", Some (connection_input_to_yojson x.connection_input));
      ("Name", Some (name_string_to_yojson x.name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let update_column_statistics_task_settings_response_to_yojson = unit_to_yojson
let column_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree
let sample_size_percentage_to_yojson = double_to_yojson

let update_column_statistics_task_settings_request_to_yojson
    (x : update_column_statistics_task_settings_request) =
  assoc_to_yojson
    [
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("CatalogID", option_to_yojson name_string_to_yojson x.catalog_i_d);
      ("SampleSize", option_to_yojson sample_size_percentage_to_yojson x.sample_size);
      ("ColumnNameList", option_to_yojson column_name_list_to_yojson x.column_name_list);
      ("Schedule", option_to_yojson cron_expression_to_yojson x.schedule);
      ("Role", option_to_yojson name_string_to_yojson x.role);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
    ]

let type_string_to_yojson = string_to_yojson

let column_statistics_type_to_yojson (x : column_statistics_type) =
  match x with
  | BINARY -> `String "BINARY"
  | STRING -> `String "STRING"
  | LONG -> `String "LONG"
  | DOUBLE -> `String "DOUBLE"
  | DECIMAL -> `String "DECIMAL"
  | DATE -> `String "DATE"
  | BOOLEAN -> `String "BOOLEAN"

let non_negative_long_to_yojson = long_to_yojson

let boolean_column_statistics_data_to_yojson (x : boolean_column_statistics_data) =
  assoc_to_yojson
    [
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("NumberOfFalses", Some (non_negative_long_to_yojson x.number_of_falses));
      ("NumberOfTrues", Some (non_negative_long_to_yojson x.number_of_trues));
    ]

let date_column_statistics_data_to_yojson (x : date_column_statistics_data) =
  assoc_to_yojson
    [
      ("NumberOfDistinctValues", Some (non_negative_long_to_yojson x.number_of_distinct_values));
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("MaximumValue", option_to_yojson timestamp_to_yojson x.maximum_value);
      ("MinimumValue", option_to_yojson timestamp_to_yojson x.minimum_value);
    ]

let blob_to_yojson = blob_to_yojson

let decimal_number_to_yojson (x : decimal_number) =
  assoc_to_yojson
    [
      ("Scale", Some (integer_to_yojson x.scale));
      ("UnscaledValue", Some (blob_to_yojson x.unscaled_value));
    ]

let decimal_column_statistics_data_to_yojson (x : decimal_column_statistics_data) =
  assoc_to_yojson
    [
      ("NumberOfDistinctValues", Some (non_negative_long_to_yojson x.number_of_distinct_values));
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("MaximumValue", option_to_yojson decimal_number_to_yojson x.maximum_value);
      ("MinimumValue", option_to_yojson decimal_number_to_yojson x.minimum_value);
    ]

let double_to_yojson = double_to_yojson

let double_column_statistics_data_to_yojson (x : double_column_statistics_data) =
  assoc_to_yojson
    [
      ("NumberOfDistinctValues", Some (non_negative_long_to_yojson x.number_of_distinct_values));
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("MaximumValue", option_to_yojson double_to_yojson x.maximum_value);
      ("MinimumValue", option_to_yojson double_to_yojson x.minimum_value);
    ]

let long_to_yojson = long_to_yojson

let long_column_statistics_data_to_yojson (x : long_column_statistics_data) =
  assoc_to_yojson
    [
      ("NumberOfDistinctValues", Some (non_negative_long_to_yojson x.number_of_distinct_values));
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("MaximumValue", option_to_yojson long_to_yojson x.maximum_value);
      ("MinimumValue", option_to_yojson long_to_yojson x.minimum_value);
    ]

let non_negative_double_to_yojson = double_to_yojson

let string_column_statistics_data_to_yojson (x : string_column_statistics_data) =
  assoc_to_yojson
    [
      ("NumberOfDistinctValues", Some (non_negative_long_to_yojson x.number_of_distinct_values));
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("AverageLength", Some (non_negative_double_to_yojson x.average_length));
      ("MaximumLength", Some (non_negative_long_to_yojson x.maximum_length));
    ]

let binary_column_statistics_data_to_yojson (x : binary_column_statistics_data) =
  assoc_to_yojson
    [
      ("NumberOfNulls", Some (non_negative_long_to_yojson x.number_of_nulls));
      ("AverageLength", Some (non_negative_double_to_yojson x.average_length));
      ("MaximumLength", Some (non_negative_long_to_yojson x.maximum_length));
    ]

let column_statistics_data_to_yojson (x : column_statistics_data) =
  assoc_to_yojson
    [
      ( "BinaryColumnStatisticsData",
        option_to_yojson binary_column_statistics_data_to_yojson x.binary_column_statistics_data );
      ( "StringColumnStatisticsData",
        option_to_yojson string_column_statistics_data_to_yojson x.string_column_statistics_data );
      ( "LongColumnStatisticsData",
        option_to_yojson long_column_statistics_data_to_yojson x.long_column_statistics_data );
      ( "DoubleColumnStatisticsData",
        option_to_yojson double_column_statistics_data_to_yojson x.double_column_statistics_data );
      ( "DecimalColumnStatisticsData",
        option_to_yojson decimal_column_statistics_data_to_yojson x.decimal_column_statistics_data
      );
      ( "DateColumnStatisticsData",
        option_to_yojson date_column_statistics_data_to_yojson x.date_column_statistics_data );
      ( "BooleanColumnStatisticsData",
        option_to_yojson boolean_column_statistics_data_to_yojson x.boolean_column_statistics_data
      );
      ("Type", Some (column_statistics_type_to_yojson x.type_));
    ]

let column_statistics_to_yojson (x : column_statistics) =
  assoc_to_yojson
    [
      ("StatisticsData", Some (column_statistics_data_to_yojson x.statistics_data));
      ("AnalyzedTime", Some (timestamp_to_yojson x.analyzed_time));
      ("ColumnType", Some (type_string_to_yojson x.column_type));
      ("ColumnName", Some (name_string_to_yojson x.column_name));
    ]

let update_column_statistics_list_to_yojson tree = list_to_yojson column_statistics_to_yojson tree

let column_statistics_error_to_yojson (x : column_statistics_error) =
  assoc_to_yojson
    [
      ("Error", option_to_yojson error_detail_to_yojson x.error);
      ("ColumnStatistics", option_to_yojson column_statistics_to_yojson x.column_statistics);
    ]

let column_statistics_errors_to_yojson tree = list_to_yojson column_statistics_error_to_yojson tree

let update_column_statistics_for_table_response_to_yojson
    (x : update_column_statistics_for_table_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson column_statistics_errors_to_yojson x.errors) ]

let update_column_statistics_for_table_request_to_yojson
    (x : update_column_statistics_for_table_request) =
  assoc_to_yojson
    [
      ( "ColumnStatisticsList",
        Some (update_column_statistics_list_to_yojson x.column_statistics_list) );
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let update_column_statistics_for_partition_response_to_yojson
    (x : update_column_statistics_for_partition_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson column_statistics_errors_to_yojson x.errors) ]

let update_column_statistics_for_partition_request_to_yojson
    (x : update_column_statistics_for_partition_request) =
  assoc_to_yojson
    [
      ( "ColumnStatisticsList",
        Some (update_column_statistics_list_to_yojson x.column_statistics_list) );
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let update_classifier_response_to_yojson = unit_to_yojson

let update_classifier_request_to_yojson (x : update_classifier_request) =
  assoc_to_yojson
    [
      ("CsvClassifier", option_to_yojson update_csv_classifier_request_to_yojson x.csv_classifier);
      ("JsonClassifier", option_to_yojson update_json_classifier_request_to_yojson x.json_classifier);
      ("XMLClassifier", option_to_yojson update_xml_classifier_request_to_yojson x.xml_classifier);
      ("GrokClassifier", option_to_yojson update_grok_classifier_request_to_yojson x.grok_classifier);
    ]

let update_catalog_response_to_yojson = unit_to_yojson

let federated_catalog_to_yojson (x : federated_catalog) =
  assoc_to_yojson
    [
      ("ConnectionType", option_to_yojson name_string_to_yojson x.connection_type);
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ("Identifier", option_to_yojson federation_identifier_to_yojson x.identifier);
    ]

let resource_arn_string_to_yojson = string_to_yojson

let target_redshift_catalog_to_yojson (x : target_redshift_catalog) =
  assoc_to_yojson [ ("CatalogArn", Some (resource_arn_string_to_yojson x.catalog_arn)) ]

let iam_role_arn_to_yojson = string_to_yojson

let data_lake_access_properties_to_yojson (x : data_lake_access_properties) =
  assoc_to_yojson
    [
      ("CatalogType", option_to_yojson name_string_to_yojson x.catalog_type);
      ("KmsKey", option_to_yojson resource_arn_string_to_yojson x.kms_key);
      ("DataTransferRole", option_to_yojson iam_role_arn_to_yojson x.data_transfer_role);
      ("DataLakeAccess", option_to_yojson boolean__to_yojson x.data_lake_access);
    ]

let iceberg_optimization_properties_to_yojson (x : iceberg_optimization_properties) =
  assoc_to_yojson
    [
      ("OrphanFileDeletion", option_to_yojson parameters_map_to_yojson x.orphan_file_deletion);
      ("Retention", option_to_yojson parameters_map_to_yojson x.retention);
      ("Compaction", option_to_yojson parameters_map_to_yojson x.compaction);
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
    ]

let catalog_properties_to_yojson (x : catalog_properties) =
  assoc_to_yojson
    [
      ("CustomProperties", option_to_yojson parameters_map_to_yojson x.custom_properties);
      ( "IcebergOptimizationProperties",
        option_to_yojson iceberg_optimization_properties_to_yojson x.iceberg_optimization_properties
      );
      ( "DataLakeAccessProperties",
        option_to_yojson data_lake_access_properties_to_yojson x.data_lake_access_properties );
    ]

let allow_full_table_external_data_access_enum_to_yojson
    (x : allow_full_table_external_data_access_enum) =
  match x with False -> `String "False" | True -> `String "True"

let overwrite_child_resource_permissions_with_default_enum_to_yojson
    (x : overwrite_child_resource_permissions_with_default_enum) =
  match x with Deny -> `String "Deny" | Accept -> `String "Accept"

let catalog_input_to_yojson (x : catalog_input) =
  assoc_to_yojson
    [
      ( "OverwriteChildResourcePermissionsWithDefault",
        option_to_yojson overwrite_child_resource_permissions_with_default_enum_to_yojson
          x.overwrite_child_resource_permissions_with_default );
      ( "AllowFullTableExternalDataAccess",
        option_to_yojson allow_full_table_external_data_access_enum_to_yojson
          x.allow_full_table_external_data_access );
      ( "CreateDatabaseDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_database_default_permissions
      );
      ( "CreateTableDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_table_default_permissions );
      ("CatalogProperties", option_to_yojson catalog_properties_to_yojson x.catalog_properties);
      ( "TargetRedshiftCatalog",
        option_to_yojson target_redshift_catalog_to_yojson x.target_redshift_catalog );
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("FederatedCatalog", option_to_yojson federated_catalog_to_yojson x.federated_catalog);
      ("Description", option_to_yojson description_string_to_yojson x.description);
    ]

let update_catalog_request_to_yojson (x : update_catalog_request) =
  assoc_to_yojson
    [
      ("CatalogInput", Some (catalog_input_to_yojson x.catalog_input));
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
    ]

let update_blueprint_response_to_yojson (x : update_blueprint_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let orchestration_s3_location_to_yojson = string_to_yojson

let update_blueprint_request_to_yojson (x : update_blueprint_request) =
  assoc_to_yojson
    [
      ("BlueprintLocation", Some (orchestration_s3_location_to_yojson x.blueprint_location));
      ("Description", option_to_yojson generic512_char_string_to_yojson x.description);
      ("Name", Some (orchestration_name_string_to_yojson x.name));
    ]

let illegal_blueprint_state_exception_to_yojson (x : illegal_blueprint_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let asset_id_to_yojson = string_to_yojson
let asset_name_to_yojson = string_to_yojson
let asset_description_to_yojson = string_to_yojson

let update_asset_response_to_yojson (x : update_asset_response) =
  assoc_to_yojson
    [
      ("UpdatedAt", option_to_yojson updated_at_to_yojson x.updated_at);
      ("Description", option_to_yojson asset_description_to_yojson x.description);
      ("Name", option_to_yojson asset_name_to_yojson x.name);
      ("Id", Some (asset_id_to_yojson x.id));
    ]

let update_asset_request_to_yojson (x : update_asset_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Description", option_to_yojson asset_description_to_yojson x.description);
      ("Name", option_to_yojson asset_name_to_yojson x.name);
      ("Identifier", Some (asset_id_to_yojson x.identifier));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagsToRemove", Some (tag_keys_list_to_yojson x.tags_to_remove));
      ("ResourceArn", Some (glue_resource_arn_to_yojson x.resource_arn));
    ]

let partition_to_yojson (x : partition) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("LastAnalyzedTime", option_to_yojson timestamp_to_yojson x.last_analyzed_time);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("StorageDescriptor", option_to_yojson storage_descriptor_to_yojson x.storage_descriptor);
      ("LastAccessTime", option_to_yojson timestamp_to_yojson x.last_access_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("Values", option_to_yojson value_string_list_to_yojson x.values);
    ]

let unfiltered_partition_to_yojson (x : unfiltered_partition) =
  assoc_to_yojson
    [
      ( "IsRegisteredWithLakeFormation",
        option_to_yojson boolean__to_yojson x.is_registered_with_lake_formation );
      ("AuthorizedColumns", option_to_yojson name_string_list_to_yojson x.authorized_columns);
      ("Partition", option_to_yojson partition_to_yojson x.partition);
    ]

let unfiltered_partition_list_to_yojson tree = list_to_yojson unfiltered_partition_to_yojson tree
let uui_dv4_to_yojson = string_to_yojson
let trigger_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree
let trigger_list_to_yojson tree = list_to_yojson trigger_to_yojson tree

let transform_status_type_to_yojson (x : transform_status_type) =
  match x with
  | DELETING -> `String "DELETING"
  | READY -> `String "READY"
  | NOT_READY -> `String "NOT_READY"

let transform_sort_column_type_to_yojson (x : transform_sort_column_type) =
  match x with
  | LAST_MODIFIED -> `String "LAST_MODIFIED"
  | CREATED -> `String "CREATED"
  | STATUS -> `String "STATUS"
  | TRANSFORM_TYPE -> `String "TRANSFORM_TYPE"
  | NAME -> `String "NAME"

let sort_direction_type_to_yojson (x : sort_direction_type) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let transform_sort_criteria_to_yojson (x : transform_sort_criteria) =
  assoc_to_yojson
    [
      ("SortDirection", Some (sort_direction_type_to_yojson x.sort_direction));
      ("Column", Some (transform_sort_column_type_to_yojson x.column));
    ]

let schema_column_to_yojson (x : schema_column) =
  assoc_to_yojson
    [
      ("DataType", option_to_yojson column_type_string_to_yojson x.data_type);
      ("Name", option_to_yojson column_name_string_to_yojson x.name);
    ]

let transform_schema_to_yojson tree = list_to_yojson schema_column_to_yojson tree

let glue_table_additional_options_to_yojson tree =
  map_to_yojson name_string_to_yojson description_string_to_yojson tree

let glue_table_to_yojson (x : glue_table) =
  assoc_to_yojson
    [
      ( "AdditionalOptions",
        option_to_yojson glue_table_additional_options_to_yojson x.additional_options );
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ("CatalogId", option_to_yojson name_string_to_yojson x.catalog_id);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
    ]

let glue_tables_to_yojson tree = list_to_yojson glue_table_to_yojson tree
let records_count_to_yojson = long_to_yojson

let confusion_matrix_to_yojson (x : confusion_matrix) =
  assoc_to_yojson
    [
      ("NumFalseNegatives", option_to_yojson records_count_to_yojson x.num_false_negatives);
      ("NumTrueNegatives", option_to_yojson records_count_to_yojson x.num_true_negatives);
      ("NumFalsePositives", option_to_yojson records_count_to_yojson x.num_false_positives);
      ("NumTruePositives", option_to_yojson records_count_to_yojson x.num_true_positives);
    ]

let column_importance_to_yojson (x : column_importance) =
  assoc_to_yojson
    [
      ("Importance", option_to_yojson generic_bounded_double_to_yojson x.importance);
      ("ColumnName", option_to_yojson name_string_to_yojson x.column_name);
    ]

let column_importance_list_to_yojson tree = list_to_yojson column_importance_to_yojson tree

let find_matches_metrics_to_yojson (x : find_matches_metrics) =
  assoc_to_yojson
    [
      ("ColumnImportances", option_to_yojson column_importance_list_to_yojson x.column_importances);
      ("ConfusionMatrix", option_to_yojson confusion_matrix_to_yojson x.confusion_matrix);
      ("F1", option_to_yojson generic_bounded_double_to_yojson x.f1);
      ("Recall", option_to_yojson generic_bounded_double_to_yojson x.recall);
      ("Precision", option_to_yojson generic_bounded_double_to_yojson x.precision);
      ("AreaUnderPRCurve", option_to_yojson generic_bounded_double_to_yojson x.area_under_pr_curve);
    ]

let evaluation_metrics_to_yojson (x : evaluation_metrics) =
  assoc_to_yojson
    [
      ("FindMatchesMetrics", option_to_yojson find_matches_metrics_to_yojson x.find_matches_metrics);
      ("TransformType", Some (transform_type_to_yojson x.transform_type));
    ]

let label_count_to_yojson = int_to_yojson

let ml_user_data_encryption_mode_string_to_yojson (x : ml_user_data_encryption_mode_string) =
  match x with SSEKMS -> `String "SSE-KMS" | DISABLED -> `String "DISABLED"

let ml_user_data_encryption_to_yojson (x : ml_user_data_encryption) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson name_string_to_yojson x.kms_key_id);
      ( "MlUserDataEncryptionMode",
        Some (ml_user_data_encryption_mode_string_to_yojson x.ml_user_data_encryption_mode) );
    ]

let transform_encryption_to_yojson (x : transform_encryption) =
  assoc_to_yojson
    [
      ( "TaskRunSecurityConfigurationName",
        option_to_yojson name_string_to_yojson x.task_run_security_configuration_name );
      ( "MlUserDataEncryption",
        option_to_yojson ml_user_data_encryption_to_yojson x.ml_user_data_encryption );
    ]

let ml_transform_to_yojson (x : ml_transform) =
  assoc_to_yojson
    [
      ("TransformEncryption", option_to_yojson transform_encryption_to_yojson x.transform_encryption);
      ("MaxRetries", option_to_yojson nullable_integer_to_yojson x.max_retries);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("Schema", option_to_yojson transform_schema_to_yojson x.schema);
      ("LabelCount", option_to_yojson label_count_to_yojson x.label_count);
      ("EvaluationMetrics", option_to_yojson evaluation_metrics_to_yojson x.evaluation_metrics);
      ("Parameters", option_to_yojson transform_parameters_to_yojson x.parameters);
      ("InputRecordTables", option_to_yojson glue_tables_to_yojson x.input_record_tables);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("CreatedOn", option_to_yojson timestamp_to_yojson x.created_on);
      ("Status", option_to_yojson transform_status_type_to_yojson x.status);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id);
    ]

let transform_list_to_yojson tree = list_to_yojson ml_transform_to_yojson tree
let transform_id_list_to_yojson tree = list_to_yojson hash_string_to_yojson tree

let transform_filter_criteria_to_yojson (x : transform_filter_criteria) =
  assoc_to_yojson
    [
      ("Schema", option_to_yojson transform_schema_to_yojson x.schema);
      ("LastModifiedAfter", option_to_yojson timestamp_to_yojson x.last_modified_after);
      ("LastModifiedBefore", option_to_yojson timestamp_to_yojson x.last_modified_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("Status", option_to_yojson transform_status_type_to_yojson x.status);
      ("TransformType", option_to_yojson transform_type_to_yojson x.transform_type);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let total_segments_integer_to_yojson = int_to_yojson
let token_to_yojson = string_to_yojson

let inclusion_annotation_value_to_yojson (x : inclusion_annotation_value) =
  match x with EXCLUDE -> `String "EXCLUDE" | INCLUDE -> `String "INCLUDE"

let timestamped_inclusion_annotation_to_yojson (x : timestamped_inclusion_annotation) =
  assoc_to_yojson
    [
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("Value", option_to_yojson inclusion_annotation_value_to_yojson x.value);
    ]

let timestamp_filter_to_yojson (x : timestamp_filter) =
  assoc_to_yojson
    [
      ("RecordedAfter", option_to_yojson timestamp_to_yojson x.recorded_after);
      ("RecordedBefore", option_to_yojson timestamp_to_yojson x.recorded_before);
    ]

let test_connection_response_to_yojson = unit_to_yojson

let test_connection_input_to_yojson (x : test_connection_input) =
  assoc_to_yojson
    [
      ( "AuthenticationConfiguration",
        option_to_yojson authentication_configuration_input_to_yojson x.authentication_configuration
      );
      ("ConnectionProperties", Some (connection_properties_to_yojson x.connection_properties));
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
    ]

let test_connection_request_to_yojson (x : test_connection_request) =
  assoc_to_yojson
    [
      ( "TestConnectionInput",
        option_to_yojson test_connection_input_to_yojson x.test_connection_input );
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let task_type_to_yojson (x : task_type) =
  match x with
  | FIND_MATCHES -> `String "FIND_MATCHES"
  | EXPORT_LABELS -> `String "EXPORT_LABELS"
  | IMPORT_LABELS -> `String "IMPORT_LABELS"
  | LABELING_SET_GENERATION -> `String "LABELING_SET_GENERATION"
  | EVALUATION -> `String "EVALUATION"

let task_status_type_to_yojson (x : task_status_type) =
  match x with
  | TIMEOUT -> `String "TIMEOUT"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | RUNNING -> `String "RUNNING"
  | STARTING -> `String "STARTING"

let task_run_sort_column_type_to_yojson (x : task_run_sort_column_type) =
  match x with
  | STARTED -> `String "STARTED"
  | STATUS -> `String "STATUS"
  | TASK_RUN_TYPE -> `String "TASK_RUN_TYPE"

let task_run_sort_criteria_to_yojson (x : task_run_sort_criteria) =
  assoc_to_yojson
    [
      ("SortDirection", Some (sort_direction_type_to_yojson x.sort_direction));
      ("Column", Some (task_run_sort_column_type_to_yojson x.column));
    ]

let replace_boolean_to_yojson = bool_to_yojson

let import_labels_task_run_properties_to_yojson (x : import_labels_task_run_properties) =
  assoc_to_yojson
    [
      ("Replace", option_to_yojson replace_boolean_to_yojson x.replace);
      ("InputS3Path", option_to_yojson uri_string_to_yojson x.input_s3_path);
    ]

let export_labels_task_run_properties_to_yojson (x : export_labels_task_run_properties) =
  assoc_to_yojson [ ("OutputS3Path", option_to_yojson uri_string_to_yojson x.output_s3_path) ]

let labeling_set_generation_task_run_properties_to_yojson
    (x : labeling_set_generation_task_run_properties) =
  assoc_to_yojson [ ("OutputS3Path", option_to_yojson uri_string_to_yojson x.output_s3_path) ]

let find_matches_task_run_properties_to_yojson (x : find_matches_task_run_properties) =
  assoc_to_yojson
    [
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("JobId", option_to_yojson hash_string_to_yojson x.job_id);
    ]

let task_run_properties_to_yojson (x : task_run_properties) =
  assoc_to_yojson
    [
      ( "FindMatchesTaskRunProperties",
        option_to_yojson find_matches_task_run_properties_to_yojson
          x.find_matches_task_run_properties );
      ( "LabelingSetGenerationTaskRunProperties",
        option_to_yojson labeling_set_generation_task_run_properties_to_yojson
          x.labeling_set_generation_task_run_properties );
      ( "ExportLabelsTaskRunProperties",
        option_to_yojson export_labels_task_run_properties_to_yojson
          x.export_labels_task_run_properties );
      ( "ImportLabelsTaskRunProperties",
        option_to_yojson import_labels_task_run_properties_to_yojson
          x.import_labels_task_run_properties );
      ("TaskType", option_to_yojson task_type_to_yojson x.task_type);
    ]

let task_run_to_yojson (x : task_run) =
  assoc_to_yojson
    [
      ("ExecutionTime", option_to_yojson execution_time_to_yojson x.execution_time);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("ErrorString", option_to_yojson generic_string_to_yojson x.error_string);
      ("Properties", option_to_yojson task_run_properties_to_yojson x.properties);
      ("LogGroupName", option_to_yojson generic_string_to_yojson x.log_group_name);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id);
      ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id);
    ]

let task_run_list_to_yojson tree = list_to_yojson task_run_to_yojson tree

let task_run_filter_criteria_to_yojson (x : task_run_filter_criteria) =
  assoc_to_yojson
    [
      ("StartedAfter", option_to_yojson timestamp_to_yojson x.started_after);
      ("StartedBefore", option_to_yojson timestamp_to_yojson x.started_before);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("TaskRunType", option_to_yojson task_type_to_yojson x.task_run_type);
    ]

let target_resource_not_found_to_yojson (x : target_resource_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let tag_value_to_yojson = string_to_yojson
let tags_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("TagsToAdd", Some (tags_map_to_yojson x.tags_to_add));
      ("ResourceArn", Some (glue_resource_arn_to_yojson x.resource_arn));
    ]

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("value", option_to_yojson tag_value_to_yojson x.value);
      ("key", option_to_yojson tag_key_to_yojson x.key);
    ]

let table_version_error_to_yojson (x : table_version_error) =
  assoc_to_yojson
    [
      ("ErrorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
      ("VersionId", option_to_yojson version_string_to_yojson x.version_id);
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
    ]

let table_version_errors_to_yojson tree = list_to_yojson table_version_error_to_yojson tree

let federated_table_to_yojson (x : federated_table) =
  assoc_to_yojson
    [
      ("ConnectionType", option_to_yojson name_string_to_yojson x.connection_type);
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ("DatabaseIdentifier", option_to_yojson federation_identifier_to_yojson x.database_identifier);
      ("Identifier", option_to_yojson federation_identifier_to_yojson x.identifier);
    ]

let table_id_string_to_yojson = string_to_yojson
let iceberg_schema_list_to_yojson tree = list_to_yojson iceberg_schema_to_yojson tree

let iceberg_partition_spec_list_to_yojson tree =
  list_to_yojson iceberg_partition_spec_to_yojson tree

let iceberg_sort_order_list_to_yojson tree = list_to_yojson iceberg_sort_order_to_yojson tree

let iceberg_table_metadata_to_yojson (x : iceberg_table_metadata) =
  assoc_to_yojson
    [
      ("DefaultSortOrderId", option_to_yojson integer_to_yojson x.default_sort_order_id);
      ("SortOrders", option_to_yojson iceberg_sort_order_list_to_yojson x.sort_orders);
      ("LastPartitionId", option_to_yojson integer_to_yojson x.last_partition_id);
      ("DefaultSpecId", option_to_yojson integer_to_yojson x.default_spec_id);
      ("PartitionSpecs", option_to_yojson iceberg_partition_spec_list_to_yojson x.partition_specs);
      ("LastColumnId", option_to_yojson integer_to_yojson x.last_column_id);
      ("CurrentSchemaId", option_to_yojson integer_to_yojson x.current_schema_id);
      ("Schemas", option_to_yojson iceberg_schema_list_to_yojson x.schemas);
      ("Properties", option_to_yojson string_to_string_map_to_yojson x.properties);
      ("Location", option_to_yojson location_string_to_yojson x.location);
      ("TableUuid", option_to_yojson table_id_string_to_yojson x.table_uuid);
      ("FormatVersion", option_to_yojson version_string_to_yojson x.format_version);
    ]

let resource_action_to_yojson (x : resource_action) =
  match x with CREATE -> `String "CREATE" | UPDATE -> `String "UPDATE"

let rec status_details_to_yojson (x : status_details) =
  assoc_to_yojson
    [
      ("ViewValidations", option_to_yojson view_validation_list_to_yojson x.view_validations);
      ("RequestedChange", option_to_yojson table_to_yojson x.requested_change);
    ]

and table_to_yojson (x : table) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson table_status_to_yojson x.status);
      ( "IcebergTableMetadata",
        option_to_yojson iceberg_table_metadata_to_yojson x.iceberg_table_metadata );
      ("IsMaterializedView", option_to_yojson nullable_boolean_to_yojson x.is_materialized_view);
      ("IsMultiDialectView", option_to_yojson nullable_boolean_to_yojson x.is_multi_dialect_view);
      ("ViewDefinition", option_to_yojson view_definition_to_yojson x.view_definition);
      ("FederatedTable", option_to_yojson federated_table_to_yojson x.federated_table);
      ("VersionId", option_to_yojson version_string_to_yojson x.version_id);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("TargetTable", option_to_yojson table_identifier_to_yojson x.target_table);
      ( "IsRegisteredWithLakeFormation",
        option_to_yojson boolean__to_yojson x.is_registered_with_lake_formation );
      ("CreatedBy", option_to_yojson name_string_to_yojson x.created_by);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("TableType", option_to_yojson table_type_string_to_yojson x.table_type);
      ("ViewExpandedText", option_to_yojson view_text_string_to_yojson x.view_expanded_text);
      ("ViewOriginalText", option_to_yojson view_text_string_to_yojson x.view_original_text);
      ("PartitionKeys", option_to_yojson column_list_to_yojson x.partition_keys);
      ("StorageDescriptor", option_to_yojson storage_descriptor_to_yojson x.storage_descriptor);
      ("Retention", option_to_yojson non_negative_integer_to_yojson x.retention);
      ("LastAnalyzedTime", option_to_yojson timestamp_to_yojson x.last_analyzed_time);
      ("LastAccessTime", option_to_yojson timestamp_to_yojson x.last_access_time);
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("Owner", option_to_yojson name_string_to_yojson x.owner);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("Name", Some (name_string_to_yojson x.name));
    ]

and table_status_to_yojson (x : table_status) =
  assoc_to_yojson
    [
      ("Details", option_to_yojson status_details_to_yojson x.details);
      ("Error", option_to_yojson error_detail_to_yojson x.error);
      ("State", option_to_yojson resource_state_to_yojson x.state);
      ("Action", option_to_yojson resource_action_to_yojson x.action);
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
      ("RequestTime", option_to_yojson timestamp_to_yojson x.request_time);
      ("UpdatedBy", option_to_yojson name_string_to_yojson x.updated_by);
      ("RequestedBy", option_to_yojson name_string_to_yojson x.requested_by);
    ]

let table_version_to_yojson (x : table_version) =
  assoc_to_yojson
    [
      ("VersionId", option_to_yojson version_string_to_yojson x.version_id);
      ("Table", option_to_yojson table_to_yojson x.table);
    ]

let table_optimizer_event_type_to_yojson (x : table_optimizer_event_type) =
  match x with
  | IN_PROGRESS -> `String "in_progress"
  | FAILED -> `String "failed"
  | COMPLETED -> `String "completed"
  | STARTING -> `String "starting"

let table_optimizer_run_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let run_metrics_to_yojson (x : run_metrics) =
  assoc_to_yojson
    [
      ("JobDurationInHour", option_to_yojson message_string_to_yojson x.job_duration_in_hour);
      ("NumberOfDpus", option_to_yojson message_string_to_yojson x.number_of_dpus);
      ( "NumberOfFilesCompacted",
        option_to_yojson message_string_to_yojson x.number_of_files_compacted );
      ( "NumberOfBytesCompacted",
        option_to_yojson message_string_to_yojson x.number_of_bytes_compacted );
    ]

let iceberg_compaction_metrics_to_yojson (x : iceberg_compaction_metrics) =
  assoc_to_yojson
    [
      ("JobDurationInHour", option_to_yojson dpu_duration_in_hour_to_yojson x.job_duration_in_hour);
      ("NumberOfDpus", option_to_yojson dpu_counts_to_yojson x.number_of_dpus);
      ("DpuHours", option_to_yojson dpu_hours_to_yojson x.dpu_hours);
      ( "NumberOfFilesCompacted",
        option_to_yojson metric_counts_to_yojson x.number_of_files_compacted );
      ( "NumberOfBytesCompacted",
        option_to_yojson metric_counts_to_yojson x.number_of_bytes_compacted );
    ]

let compaction_metrics_to_yojson (x : compaction_metrics) =
  assoc_to_yojson
    [ ("IcebergMetrics", option_to_yojson iceberg_compaction_metrics_to_yojson x.iceberg_metrics) ]

let iceberg_retention_metrics_to_yojson (x : iceberg_retention_metrics) =
  assoc_to_yojson
    [
      ("JobDurationInHour", option_to_yojson dpu_duration_in_hour_to_yojson x.job_duration_in_hour);
      ("NumberOfDpus", option_to_yojson dpu_counts_to_yojson x.number_of_dpus);
      ("DpuHours", option_to_yojson dpu_hours_to_yojson x.dpu_hours);
      ( "NumberOfManifestListsDeleted",
        option_to_yojson metric_counts_to_yojson x.number_of_manifest_lists_deleted );
      ( "NumberOfManifestFilesDeleted",
        option_to_yojson metric_counts_to_yojson x.number_of_manifest_files_deleted );
      ( "NumberOfDataFilesDeleted",
        option_to_yojson metric_counts_to_yojson x.number_of_data_files_deleted );
    ]

let retention_metrics_to_yojson (x : retention_metrics) =
  assoc_to_yojson
    [ ("IcebergMetrics", option_to_yojson iceberg_retention_metrics_to_yojson x.iceberg_metrics) ]

let iceberg_orphan_file_deletion_metrics_to_yojson (x : iceberg_orphan_file_deletion_metrics) =
  assoc_to_yojson
    [
      ("JobDurationInHour", option_to_yojson dpu_duration_in_hour_to_yojson x.job_duration_in_hour);
      ("NumberOfDpus", option_to_yojson dpu_counts_to_yojson x.number_of_dpus);
      ("DpuHours", option_to_yojson dpu_hours_to_yojson x.dpu_hours);
      ( "NumberOfOrphanFilesDeleted",
        option_to_yojson metric_counts_to_yojson x.number_of_orphan_files_deleted );
    ]

let orphan_file_deletion_metrics_to_yojson (x : orphan_file_deletion_metrics) =
  assoc_to_yojson
    [
      ( "IcebergMetrics",
        option_to_yojson iceberg_orphan_file_deletion_metrics_to_yojson x.iceberg_metrics );
    ]

let table_optimizer_run_to_yojson (x : table_optimizer_run) =
  assoc_to_yojson
    [
      ( "orphanFileDeletionMetrics",
        option_to_yojson orphan_file_deletion_metrics_to_yojson x.orphan_file_deletion_metrics );
      ("retentionMetrics", option_to_yojson retention_metrics_to_yojson x.retention_metrics);
      ("compactionStrategy", option_to_yojson compaction_strategy_to_yojson x.compaction_strategy);
      ("compactionMetrics", option_to_yojson compaction_metrics_to_yojson x.compaction_metrics);
      ("error", option_to_yojson message_string_to_yojson x.error);
      ("metrics", option_to_yojson run_metrics_to_yojson x.metrics);
      ("endTimestamp", option_to_yojson table_optimizer_run_timestamp_to_yojson x.end_timestamp);
      ("startTimestamp", option_to_yojson table_optimizer_run_timestamp_to_yojson x.start_timestamp);
      ("eventType", option_to_yojson table_optimizer_event_type_to_yojson x.event_type);
    ]

let table_optimizer_runs_to_yojson tree = list_to_yojson table_optimizer_run_to_yojson tree

let configuration_source_to_yojson (x : configuration_source) =
  match x with TABLE -> `String "table" | CATALOG -> `String "catalog"

let table_optimizer_to_yojson (x : table_optimizer) =
  assoc_to_yojson
    [
      ("configurationSource", option_to_yojson configuration_source_to_yojson x.configuration_source);
      ("lastRun", option_to_yojson table_optimizer_run_to_yojson x.last_run);
      ("configuration", option_to_yojson table_optimizer_configuration_to_yojson x.configuration);
      ("type", option_to_yojson table_optimizer_type_to_yojson x.type_);
    ]

let table_name_to_yojson = string_to_yojson
let table_list_to_yojson tree = list_to_yojson table_to_yojson tree

let table_error_to_yojson (x : table_error) =
  assoc_to_yojson
    [
      ("ErrorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
    ]

let table_errors_to_yojson tree = list_to_yojson table_error_to_yojson tree

let table_attributes_to_yojson (x : table_attributes) =
  match x with
  | LATEST_ICEBERG_METADATA -> `String "LATEST_ICEBERG_METADATA"
  | DEFAULT -> `String "DEFAULT"
  | TABLE_TYPE -> `String "TABLE_TYPE"
  | NAME -> `String "NAME"

let table_attributes_list_to_yojson tree = list_to_yojson table_attributes_to_yojson tree

let supported_dialect_to_yojson (x : supported_dialect) =
  assoc_to_yojson
    [
      ("DialectVersion", option_to_yojson view_dialect_version_string_to_yojson x.dialect_version);
      ("Dialect", option_to_yojson view_dialect_to_yojson x.dialect);
    ]

let string1024_to_yojson = string_to_yojson
let stop_workflow_run_response_to_yojson = unit_to_yojson

let stop_workflow_run_request_to_yojson (x : stop_workflow_run_request) =
  assoc_to_yojson
    [
      ("RunId", Some (id_string_to_yojson x.run_id)); ("Name", Some (name_string_to_yojson x.name));
    ]

let illegal_workflow_state_exception_to_yojson (x : illegal_workflow_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let stop_trigger_response_to_yojson (x : stop_trigger_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let stop_trigger_request_to_yojson (x : stop_trigger_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let stop_session_response_to_yojson (x : stop_session_response) =
  assoc_to_yojson [ ("Id", option_to_yojson name_string_to_yojson x.id) ]

let stop_session_request_to_yojson (x : stop_session_request) =
  assoc_to_yojson
    [
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("Id", Some (name_string_to_yojson x.id));
    ]

let illegal_session_state_exception_to_yojson (x : illegal_session_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let stop_materialized_view_refresh_task_run_response_to_yojson = unit_to_yojson

let stop_materialized_view_refresh_task_run_request_to_yojson
    (x : stop_materialized_view_refresh_task_run_request) =
  assoc_to_yojson
    [
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", Some (name_string_to_yojson x.catalog_id));
    ]

let materialized_view_refresh_task_stopping_exception_to_yojson
    (x : materialized_view_refresh_task_stopping_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let materialized_view_refresh_task_not_running_exception_to_yojson
    (x : materialized_view_refresh_task_not_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let stop_crawler_schedule_response_to_yojson = unit_to_yojson

let stop_crawler_schedule_request_to_yojson (x : stop_crawler_schedule_request) =
  assoc_to_yojson [ ("CrawlerName", Some (name_string_to_yojson x.crawler_name)) ]

let scheduler_not_running_exception_to_yojson (x : scheduler_not_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let stop_crawler_response_to_yojson = unit_to_yojson

let stop_crawler_request_to_yojson (x : stop_crawler_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let crawler_stopping_exception_to_yojson (x : crawler_stopping_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let crawler_not_running_exception_to_yojson (x : crawler_not_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let stop_column_statistics_task_run_schedule_response_to_yojson = unit_to_yojson

let stop_column_statistics_task_run_schedule_request_to_yojson
    (x : stop_column_statistics_task_run_schedule_request) =
  assoc_to_yojson
    [
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
    ]

let stop_column_statistics_task_run_response_to_yojson = unit_to_yojson

let stop_column_statistics_task_run_request_to_yojson (x : stop_column_statistics_task_run_request)
    =
  assoc_to_yojson
    [
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (database_name_to_yojson x.database_name));
    ]

let column_statistics_task_stopping_exception_to_yojson
    (x : column_statistics_task_stopping_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let column_statistics_task_not_running_exception_to_yojson
    (x : column_statistics_task_not_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let run_identifier_to_yojson (x : run_identifier) =
  assoc_to_yojson
    [
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
      ("RunId", option_to_yojson hash_string_to_yojson x.run_id);
    ]

let statistic_name_string_to_yojson = string_to_yojson

let statistic_evaluation_level_to_yojson (x : statistic_evaluation_level) =
  match x with
  | MULTICOLUMN -> `String "Multicolumn"
  | COLUMN -> `String "Column"
  | DATASET -> `String "Dataset"

let reference_datasets_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let statistic_properties_map_to_yojson tree =
  map_to_yojson name_string_to_yojson description_string_to_yojson tree

let statistic_summary_to_yojson (x : statistic_summary) =
  assoc_to_yojson
    [
      ( "InclusionAnnotation",
        option_to_yojson timestamped_inclusion_annotation_to_yojson x.inclusion_annotation );
      ("RecordedOn", option_to_yojson timestamp_to_yojson x.recorded_on);
      ( "StatisticProperties",
        option_to_yojson statistic_properties_map_to_yojson x.statistic_properties );
      ( "ReferencedDatasets",
        option_to_yojson reference_datasets_list_to_yojson x.referenced_datasets );
      ("ColumnsReferenced", option_to_yojson column_name_list_to_yojson x.columns_referenced);
      ("EvaluationLevel", option_to_yojson statistic_evaluation_level_to_yojson x.evaluation_level);
      ("DoubleValue", option_to_yojson double_to_yojson x.double_value);
      ("StatisticName", option_to_yojson statistic_name_string_to_yojson x.statistic_name);
      ("RunIdentifier", option_to_yojson run_identifier_to_yojson x.run_identifier);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
    ]

let statistic_summary_list_to_yojson tree = list_to_yojson statistic_summary_to_yojson tree

let statistic_model_result_to_yojson (x : statistic_model_result) =
  assoc_to_yojson
    [
      ( "InclusionAnnotation",
        option_to_yojson inclusion_annotation_value_to_yojson x.inclusion_annotation );
      ("Date", option_to_yojson timestamp_to_yojson x.date);
      ("ActualValue", option_to_yojson nullable_double_to_yojson x.actual_value);
      ("PredictedValue", option_to_yojson nullable_double_to_yojson x.predicted_value);
      ("UpperBound", option_to_yojson nullable_double_to_yojson x.upper_bound);
      ("LowerBound", option_to_yojson nullable_double_to_yojson x.lower_bound);
    ]

let statistic_model_results_to_yojson tree = list_to_yojson statistic_model_result_to_yojson tree

let statistic_annotation_to_yojson (x : statistic_annotation) =
  assoc_to_yojson
    [
      ( "InclusionAnnotation",
        option_to_yojson timestamped_inclusion_annotation_to_yojson x.inclusion_annotation );
      ("StatisticRecordedOn", option_to_yojson timestamp_to_yojson x.statistic_recorded_on);
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
    ]

let statement_state_to_yojson (x : statement_state) =
  match x with
  | ERROR -> `String "ERROR"
  | CANCELLED -> `String "CANCELLED"
  | CANCELLING -> `String "CANCELLING"
  | AVAILABLE -> `String "AVAILABLE"
  | RUNNING -> `String "RUNNING"
  | WAITING -> `String "WAITING"

let statement_output_data_to_yojson (x : statement_output_data) =
  assoc_to_yojson [ ("TextPlain", option_to_yojson generic_string_to_yojson x.text_plain) ]

let orchestration_string_list_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let statement_output_to_yojson (x : statement_output) =
  assoc_to_yojson
    [
      ("Traceback", option_to_yojson orchestration_string_list_to_yojson x.traceback);
      ("ErrorValue", option_to_yojson generic_string_to_yojson x.error_value);
      ("ErrorName", option_to_yojson generic_string_to_yojson x.error_name);
      ("Status", option_to_yojson statement_state_to_yojson x.status);
      ("ExecutionCount", option_to_yojson integer_value_to_yojson x.execution_count);
      ("Data", option_to_yojson statement_output_data_to_yojson x.data);
    ]

let double_value_to_yojson = double_to_yojson
let long_value_to_yojson = long_to_yojson

let statement_to_yojson (x : statement) =
  assoc_to_yojson
    [
      ("CompletedOn", option_to_yojson long_value_to_yojson x.completed_on);
      ("StartedOn", option_to_yojson long_value_to_yojson x.started_on);
      ("Progress", option_to_yojson double_value_to_yojson x.progress);
      ("Output", option_to_yojson statement_output_to_yojson x.output);
      ("State", option_to_yojson statement_state_to_yojson x.state);
      ("Code", option_to_yojson generic_string_to_yojson x.code);
      ("Id", option_to_yojson integer_value_to_yojson x.id);
    ]

let statement_list_to_yojson tree = list_to_yojson statement_to_yojson tree

let start_workflow_run_response_to_yojson (x : start_workflow_run_response) =
  assoc_to_yojson [ ("RunId", option_to_yojson id_string_to_yojson x.run_id) ]

let start_workflow_run_request_to_yojson (x : start_workflow_run_request) =
  assoc_to_yojson
    [
      ("RunProperties", option_to_yojson workflow_run_properties_to_yojson x.run_properties);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let concurrent_runs_exceeded_exception_to_yojson (x : concurrent_runs_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let start_trigger_response_to_yojson (x : start_trigger_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let start_trigger_request_to_yojson (x : start_trigger_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let start_materialized_view_refresh_task_run_response_to_yojson
    (x : start_materialized_view_refresh_task_run_response) =
  assoc_to_yojson
    [
      ( "MaterializedViewRefreshTaskRunId",
        option_to_yojson uui_dv4_to_yojson x.materialized_view_refresh_task_run_id );
    ]

let start_materialized_view_refresh_task_run_request_to_yojson
    (x : start_materialized_view_refresh_task_run_request) =
  assoc_to_yojson
    [
      ("FullRefresh", option_to_yojson nullable_boolean_to_yojson x.full_refresh);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", Some (name_string_to_yojson x.catalog_id));
    ]

let materialized_view_refresh_task_running_exception_to_yojson
    (x : materialized_view_refresh_task_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let start_ml_labeling_set_generation_task_run_response_to_yojson
    (x : start_ml_labeling_set_generation_task_run_response) =
  assoc_to_yojson [ ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id) ]

let start_ml_labeling_set_generation_task_run_request_to_yojson
    (x : start_ml_labeling_set_generation_task_run_request) =
  assoc_to_yojson
    [
      ("OutputS3Path", Some (uri_string_to_yojson x.output_s3_path));
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
    ]

let start_ml_evaluation_task_run_response_to_yojson (x : start_ml_evaluation_task_run_response) =
  assoc_to_yojson [ ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id) ]

let start_ml_evaluation_task_run_request_to_yojson (x : start_ml_evaluation_task_run_request) =
  assoc_to_yojson [ ("TransformId", Some (hash_string_to_yojson x.transform_id)) ]

let ml_transform_not_ready_exception_to_yojson (x : ml_transform_not_ready_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let start_job_run_response_to_yojson (x : start_job_run_response) =
  assoc_to_yojson [ ("JobRunId", option_to_yojson id_string_to_yojson x.job_run_id) ]

let start_job_run_request_to_yojson (x : start_job_run_request) =
  assoc_to_yojson
    [
      ( "ExecutionRoleSessionPolicy",
        option_to_yojson orchestration_policy_json_string_to_yojson x.execution_role_session_policy
      );
      ("ExecutionClass", option_to_yojson execution_class_to_yojson x.execution_class);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("AllocatedCapacity", option_to_yojson integer_value_to_yojson x.allocated_capacity);
      ("Arguments", option_to_yojson generic_map_to_yojson x.arguments);
      ("JobRunId", option_to_yojson id_string_to_yojson x.job_run_id);
      ("JobRunQueuingEnabled", option_to_yojson nullable_boolean_to_yojson x.job_run_queuing_enabled);
      ("JobName", Some (name_string_to_yojson x.job_name));
    ]

let start_import_labels_task_run_response_to_yojson (x : start_import_labels_task_run_response) =
  assoc_to_yojson [ ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id) ]

let start_import_labels_task_run_request_to_yojson (x : start_import_labels_task_run_request) =
  assoc_to_yojson
    [
      ("ReplaceAllLabels", option_to_yojson replace_boolean_to_yojson x.replace_all_labels);
      ("InputS3Path", Some (uri_string_to_yojson x.input_s3_path));
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
    ]

let start_export_labels_task_run_response_to_yojson (x : start_export_labels_task_run_response) =
  assoc_to_yojson [ ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id) ]

let start_export_labels_task_run_request_to_yojson (x : start_export_labels_task_run_request) =
  assoc_to_yojson
    [
      ("OutputS3Path", Some (uri_string_to_yojson x.output_s3_path));
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
    ]

let start_data_quality_ruleset_evaluation_run_response_to_yojson
    (x : start_data_quality_ruleset_evaluation_run_response) =
  assoc_to_yojson [ ("RunId", option_to_yojson hash_string_to_yojson x.run_id) ]

let pre_processing_query_string_to_yojson = string_to_yojson

let data_quality_glue_table_to_yojson (x : data_quality_glue_table) =
  assoc_to_yojson
    [
      ( "PreProcessingQuery",
        option_to_yojson pre_processing_query_string_to_yojson x.pre_processing_query );
      ( "AdditionalOptions",
        option_to_yojson glue_table_additional_options_to_yojson x.additional_options );
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
      ("CatalogId", option_to_yojson name_string_to_yojson x.catalog_id);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
    ]

let data_source_to_yojson (x : data_source) =
  assoc_to_yojson
    [
      ( "DataQualityGlueTable",
        option_to_yojson data_quality_glue_table_to_yojson x.data_quality_glue_table );
      ("GlueTable", option_to_yojson glue_table_to_yojson x.glue_table);
    ]

let dq_composite_rule_evaluation_method_to_yojson (x : dq_composite_rule_evaluation_method) =
  match x with ROW -> `String "ROW" | COLUMN -> `String "COLUMN"

let data_quality_evaluation_run_additional_run_options_to_yojson
    (x : data_quality_evaluation_run_additional_run_options) =
  assoc_to_yojson
    [
      ("CustomLogGroupPrefix", option_to_yojson generic_string_to_yojson x.custom_log_group_prefix);
      ( "CompositeRuleEvaluationMethod",
        option_to_yojson dq_composite_rule_evaluation_method_to_yojson
          x.composite_rule_evaluation_method );
      ("ResultsS3Prefix", option_to_yojson uri_string_to_yojson x.results_s3_prefix);
      ( "CloudWatchMetricsEnabled",
        option_to_yojson nullable_boolean_to_yojson x.cloud_watch_metrics_enabled );
    ]

let ruleset_names_to_yojson tree = list_to_yojson name_string_to_yojson tree
let data_source_map_to_yojson tree = map_to_yojson name_string_to_yojson data_source_to_yojson tree

let start_data_quality_ruleset_evaluation_run_request_to_yojson
    (x : start_data_quality_ruleset_evaluation_run_request) =
  assoc_to_yojson
    [
      ("AdditionalDataSources", option_to_yojson data_source_map_to_yojson x.additional_data_sources);
      ("RulesetNames", Some (ruleset_names_to_yojson x.ruleset_names));
      ( "AdditionalRunOptions",
        option_to_yojson data_quality_evaluation_run_additional_run_options_to_yojson
          x.additional_run_options );
      ("ClientToken", option_to_yojson hash_string_to_yojson x.client_token);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Role", Some (role_string_to_yojson x.role));
      ("DataSource", Some (data_source_to_yojson x.data_source));
    ]

let start_data_quality_rule_recommendation_run_response_to_yojson
    (x : start_data_quality_rule_recommendation_run_response) =
  assoc_to_yojson [ ("RunId", option_to_yojson hash_string_to_yojson x.run_id) ]

let start_data_quality_rule_recommendation_run_request_to_yojson
    (x : start_data_quality_rule_recommendation_run_request) =
  assoc_to_yojson
    [
      ("ClientToken", option_to_yojson hash_string_to_yojson x.client_token);
      ( "DataQualitySecurityConfiguration",
        option_to_yojson name_string_to_yojson x.data_quality_security_configuration );
      ("CreatedRulesetName", option_to_yojson name_string_to_yojson x.created_ruleset_name);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Role", Some (role_string_to_yojson x.role));
      ("DataSource", Some (data_source_to_yojson x.data_source));
    ]

let start_crawler_schedule_response_to_yojson = unit_to_yojson

let start_crawler_schedule_request_to_yojson (x : start_crawler_schedule_request) =
  assoc_to_yojson [ ("CrawlerName", Some (name_string_to_yojson x.crawler_name)) ]

let scheduler_running_exception_to_yojson (x : scheduler_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let no_schedule_exception_to_yojson (x : no_schedule_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let start_crawler_response_to_yojson = unit_to_yojson

let start_crawler_request_to_yojson (x : start_crawler_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let start_column_statistics_task_run_schedule_response_to_yojson = unit_to_yojson

let start_column_statistics_task_run_schedule_request_to_yojson
    (x : start_column_statistics_task_run_schedule_request) =
  assoc_to_yojson
    [
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
    ]

let start_column_statistics_task_run_response_to_yojson
    (x : start_column_statistics_task_run_response) =
  assoc_to_yojson
    [
      ( "ColumnStatisticsTaskRunId",
        option_to_yojson hash_string_to_yojson x.column_statistics_task_run_id );
    ]

let start_column_statistics_task_run_request_to_yojson
    (x : start_column_statistics_task_run_request) =
  assoc_to_yojson
    [
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("CatalogID", option_to_yojson name_string_to_yojson x.catalog_i_d);
      ("SampleSize", option_to_yojson sample_size_percentage_to_yojson x.sample_size);
      ("Role", Some (name_string_to_yojson x.role));
      ("ColumnNameList", option_to_yojson column_name_list_to_yojson x.column_name_list);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
    ]

let column_statistics_task_running_exception_to_yojson
    (x : column_statistics_task_running_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let start_blueprint_run_response_to_yojson (x : start_blueprint_run_response) =
  assoc_to_yojson [ ("RunId", option_to_yojson id_string_to_yojson x.run_id) ]

let blueprint_parameters_to_yojson = string_to_yojson
let orchestration_iam_role_arn_to_yojson = string_to_yojson

let start_blueprint_run_request_to_yojson (x : start_blueprint_run_request) =
  assoc_to_yojson
    [
      ("RoleArn", Some (orchestration_iam_role_arn_to_yojson x.role_arn));
      ("Parameters", option_to_yojson blueprint_parameters_to_yojson x.parameters);
      ("BlueprintName", Some (orchestration_name_string_to_yojson x.blueprint_name));
    ]

let spark_connect_endpoint_url_to_yojson = string_to_yojson

let http_method_to_yojson (x : http_method) =
  match x with POST -> `String "POST" | GET -> `String "GET"

let path_string_to_yojson = string_to_yojson
let property_name_to_yojson = string_to_yojson
let connector_property_key_to_yojson = string_to_yojson
let bool__to_yojson = bool_to_yojson

let list_of_string_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let property_location_to_yojson (x : property_location) =
  match x with
  | PATH -> `String "PATH"
  | QUERY_PARAM -> `String "QUERY_PARAM"
  | BODY -> `String "BODY"
  | HEADER -> `String "HEADER"

let property_type_to_yojson (x : property_type) =
  match x with
  | SECRET_OR_USER_INPUT -> `String "SECRET_OR_USER_INPUT"
  | UNUSED -> `String "UNUSED"
  | READ_ONLY -> `String "READ_ONLY"
  | SECRET -> `String "SECRET"
  | USER_INPUT -> `String "USER_INPUT"

let connector_property_to_yojson (x : connector_property) =
  assoc_to_yojson
    [
      ("PropertyType", Some (property_type_to_yojson x.property_type));
      ("PropertyLocation", option_to_yojson property_location_to_yojson x.property_location);
      ("AllowedValues", option_to_yojson list_of_string_to_yojson x.allowed_values);
      ( "DefaultValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.default_value );
      ("Required", Some (bool__to_yojson x.required));
      ("KeyOverride", option_to_yojson connector_property_key_to_yojson x.key_override);
      ("Name", Some (property_name_to_yojson x.name));
    ]

let connector_property_list_to_yojson tree = list_to_yojson connector_property_to_yojson tree
let json_path_string_to_yojson = string_to_yojson

let response_configuration_to_yojson (x : response_configuration) =
  assoc_to_yojson
    [
      ("ErrorPath", option_to_yojson json_path_string_to_yojson x.error_path);
      ("ResultPath", Some (json_path_string_to_yojson x.result_path));
    ]

let default_value_to_yojson = string_to_yojson

let response_extraction_mapping_to_yojson (x : response_extraction_mapping) =
  assoc_to_yojson
    [
      ("HeaderKey", option_to_yojson connector_property_key_to_yojson x.header_key);
      ("ContentPath", option_to_yojson json_path_string_to_yojson x.content_path);
    ]

let extracted_parameter_to_yojson (x : extracted_parameter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson response_extraction_mapping_to_yojson x.value);
      ("PropertyLocation", option_to_yojson property_location_to_yojson x.property_location);
      ("DefaultValue", option_to_yojson default_value_to_yojson x.default_value);
      ("Key", option_to_yojson connector_property_key_to_yojson x.key);
    ]

let cursor_configuration_to_yojson (x : cursor_configuration) =
  assoc_to_yojson
    [
      ("LimitParameter", option_to_yojson extracted_parameter_to_yojson x.limit_parameter);
      ("NextPage", Some (extracted_parameter_to_yojson x.next_page));
    ]

let offset_configuration_to_yojson (x : offset_configuration) =
  assoc_to_yojson
    [
      ("LimitParameter", Some (extracted_parameter_to_yojson x.limit_parameter));
      ("OffsetParameter", Some (extracted_parameter_to_yojson x.offset_parameter));
    ]

let pagination_configuration_to_yojson (x : pagination_configuration) =
  assoc_to_yojson
    [
      ("OffsetConfiguration", option_to_yojson offset_configuration_to_yojson x.offset_configuration);
      ("CursorConfiguration", option_to_yojson cursor_configuration_to_yojson x.cursor_configuration);
    ]

let source_configuration_to_yojson (x : source_configuration) =
  assoc_to_yojson
    [
      ( "PaginationConfiguration",
        option_to_yojson pagination_configuration_to_yojson x.pagination_configuration );
      ( "ResponseConfiguration",
        option_to_yojson response_configuration_to_yojson x.response_configuration );
      ("RequestParameters", option_to_yojson connector_property_list_to_yojson x.request_parameters);
      ("RequestPath", option_to_yojson path_string_to_yojson x.request_path);
      ("RequestMethod", option_to_yojson http_method_to_yojson x.request_method);
    ]

let sort_to_yojson (x : sort) =
  match x with DESCENDING -> `String "DESC" | ASCENDING -> `String "ASC"

let sort_criterion_to_yojson (x : sort_criterion) =
  assoc_to_yojson
    [
      ("Sort", option_to_yojson sort_to_yojson x.sort);
      ("FieldName", option_to_yojson value_string_to_yojson x.field_name);
    ]

let sort_criteria_to_yojson tree = list_to_yojson sort_criterion_to_yojson tree

let setting_source_to_yojson (x : setting_source) =
  match x with TABLE -> `String "TABLE" | CATALOG -> `String "CATALOG"

let session_type_to_yojson (x : session_type) =
  match x with SPARK_CONNECT -> `String "SPARK_CONNECT" | LIVY -> `String "LIVY"

let session_status_to_yojson (x : session_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | TIMEOUT -> `String "TIMEOUT"
  | FAILED -> `String "FAILED"
  | READY -> `String "READY"
  | PROVISIONING -> `String "PROVISIONING"

let orchestration_role_arn_to_yojson = string_to_yojson

let session_command_to_yojson (x : session_command) =
  assoc_to_yojson
    [
      ("PythonVersion", option_to_yojson python_version_string_to_yojson x.python_version);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let orchestration_arguments_value_to_yojson = string_to_yojson

let orchestration_arguments_map_to_yojson tree =
  map_to_yojson orchestration_name_string_to_yojson orchestration_arguments_value_to_yojson tree

let idle_timeout_to_yojson = int_to_yojson

let session_to_yojson (x : session) =
  assoc_to_yojson
    [
      ("SessionType", option_to_yojson session_type_to_yojson x.session_type);
      ("ProfileName", option_to_yojson name_string_to_yojson x.profile_name);
      ("IdleTimeout", option_to_yojson idle_timeout_to_yojson x.idle_timeout);
      ("DPUSeconds", option_to_yojson nullable_double_to_yojson x.dpu_seconds);
      ("ExecutionTime", option_to_yojson nullable_double_to_yojson x.execution_time);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("Progress", option_to_yojson double_value_to_yojson x.progress);
      ("Connections", option_to_yojson connections_list_to_yojson x.connections);
      ( "DefaultArguments",
        option_to_yojson orchestration_arguments_map_to_yojson x.default_arguments );
      ("Command", option_to_yojson session_command_to_yojson x.command);
      ("Role", option_to_yojson orchestration_role_arn_to_yojson x.role);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("Status", option_to_yojson session_status_to_yojson x.status);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("Id", option_to_yojson name_string_to_yojson x.id);
    ]

let session_list_to_yojson tree = list_to_yojson session_to_yojson tree
let session_id_list_to_yojson tree = list_to_yojson name_string_to_yojson tree
let sensitive_string_to_yojson = string_to_yojson

let session_endpoint_to_yojson (x : session_endpoint) =
  assoc_to_yojson
    [
      ("AuthTokenExpirationTime", Some (timestamp_value_to_yojson x.auth_token_expiration_time));
      ("AuthToken", Some (sensitive_string_to_yojson x.auth_token));
      ("Url", Some (spark_connect_endpoint_url_to_yojson x.url));
    ]

let session_busy_exception_to_yojson (x : session_busy_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson orchestration_message_string_to_yojson x.message) ]

let sensitive_url_to_yojson = string_to_yojson
let entity_field_name_to_yojson = string_to_yojson
let selected_fields_to_yojson tree = list_to_yojson entity_field_name_to_yojson tree

let segment_to_yojson (x : segment) =
  assoc_to_yojson
    [
      ("TotalSegments", Some (total_segments_integer_to_yojson x.total_segments));
      ("SegmentNumber", Some (non_negative_integer_to_yojson x.segment_number));
    ]

let s3_encryption_mode_to_yojson (x : s3_encryption_mode) =
  match x with
  | SSES3 -> `String "SSE-S3"
  | SSEKMS -> `String "SSE-KMS"
  | DISABLED -> `String "DISABLED"

let s3_encryption_to_yojson (x : s3_encryption) =
  assoc_to_yojson
    [
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("S3EncryptionMode", option_to_yojson s3_encryption_mode_to_yojson x.s3_encryption_mode);
    ]

let s3_encryption_list_to_yojson tree = list_to_yojson s3_encryption_to_yojson tree

let cloud_watch_encryption_mode_to_yojson (x : cloud_watch_encryption_mode) =
  match x with SSEKMS -> `String "SSE-KMS" | DISABLED -> `String "DISABLED"

let cloud_watch_encryption_to_yojson (x : cloud_watch_encryption) =
  assoc_to_yojson
    [
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ( "CloudWatchEncryptionMode",
        option_to_yojson cloud_watch_encryption_mode_to_yojson x.cloud_watch_encryption_mode );
    ]

let job_bookmarks_encryption_mode_to_yojson (x : job_bookmarks_encryption_mode) =
  match x with CSEKMS -> `String "CSE-KMS" | DISABLED -> `String "DISABLED"

let job_bookmarks_encryption_to_yojson (x : job_bookmarks_encryption) =
  assoc_to_yojson
    [
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ( "JobBookmarksEncryptionMode",
        option_to_yojson job_bookmarks_encryption_mode_to_yojson x.job_bookmarks_encryption_mode );
    ]

let data_quality_encryption_mode_to_yojson (x : data_quality_encryption_mode) =
  match x with SSEKMS -> `String "SSE-KMS" | DISABLED -> `String "DISABLED"

let data_quality_encryption_to_yojson (x : data_quality_encryption) =
  assoc_to_yojson
    [
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ( "DataQualityEncryptionMode",
        option_to_yojson data_quality_encryption_mode_to_yojson x.data_quality_encryption_mode );
    ]

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ( "DataQualityEncryption",
        option_to_yojson data_quality_encryption_to_yojson x.data_quality_encryption );
      ( "JobBookmarksEncryption",
        option_to_yojson job_bookmarks_encryption_to_yojson x.job_bookmarks_encryption );
      ( "CloudWatchEncryption",
        option_to_yojson cloud_watch_encryption_to_yojson x.cloud_watch_encryption );
      ("S3Encryption", option_to_yojson s3_encryption_list_to_yojson x.s3_encryption);
    ]

let security_configuration_to_yojson (x : security_configuration) =
  assoc_to_yojson
    [
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("CreatedTimeStamp", option_to_yojson timestamp_value_to_yojson x.created_time_stamp);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let security_configuration_list_to_yojson tree =
  list_to_yojson security_configuration_to_yojson tree

let search_text_to_yojson = string_to_yojson

let search_tables_response_to_yojson (x : search_tables_response) =
  assoc_to_yojson
    [
      ("TableList", option_to_yojson table_list_to_yojson x.table_list);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let comparator_to_yojson (x : comparator) =
  match x with
  | LESS_THAN_EQUALS -> `String "LESS_THAN_EQUALS"
  | GREATER_THAN_EQUALS -> `String "GREATER_THAN_EQUALS"
  | LESS_THAN -> `String "LESS_THAN"
  | GREATER_THAN -> `String "GREATER_THAN"
  | EQUALS -> `String "EQUALS"

let property_predicate_to_yojson (x : property_predicate) =
  assoc_to_yojson
    [
      ("Comparator", option_to_yojson comparator_to_yojson x.comparator);
      ("Value", option_to_yojson value_string_to_yojson x.value);
      ("Key", option_to_yojson value_string_to_yojson x.key);
    ]

let search_property_predicates_to_yojson tree = list_to_yojson property_predicate_to_yojson tree
let page_size_to_yojson = int_to_yojson

let resource_share_type_to_yojson (x : resource_share_type) =
  match x with
  | FEDERATED -> `String "FEDERATED"
  | ALL -> `String "ALL"
  | FOREIGN -> `String "FOREIGN"

let search_tables_request_to_yojson (x : search_tables_request) =
  assoc_to_yojson
    [
      ("IncludeStatusDetails", option_to_yojson boolean_nullable_to_yojson x.include_status_details);
      ("ResourceShareType", option_to_yojson resource_share_type_to_yojson x.resource_share_type);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("SortCriteria", option_to_yojson sort_criteria_to_yojson x.sort_criteria);
      ("SearchText", option_to_yojson value_string_to_yojson x.search_text);
      ("Filters", option_to_yojson search_property_predicates_to_yojson x.filters);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let search_sort_order_to_yojson (x : search_sort_order) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let search_attribute_to_yojson = string_to_yojson

let search_sort_to_yojson (x : search_sort) =
  assoc_to_yojson
    [
      ("Order", option_to_yojson search_sort_order_to_yojson x.order);
      ("Attribute", Some (search_attribute_to_yojson x.attribute));
    ]

let search_result_name_to_yojson = string_to_yojson
let asset_type_id_to_yojson = string_to_yojson

let search_result_item_to_yojson (x : search_result_item) =
  assoc_to_yojson
    [
      ("AssetTypeId", option_to_yojson asset_type_id_to_yojson x.asset_type_id);
      ("UpdatedAt", option_to_yojson updated_at_to_yojson x.updated_at);
      ("AssetDescription", option_to_yojson asset_description_to_yojson x.asset_description);
      ("AssetName", option_to_yojson search_result_name_to_yojson x.asset_name);
      ("Id", option_to_yojson asset_id_to_yojson x.id);
    ]

let search_result_item_list_to_yojson tree = list_to_yojson search_result_item_to_yojson tree
let search_next_token_to_yojson = string_to_yojson
let search_max_results_to_yojson = int_to_yojson
let search_map_key_to_yojson = string_to_yojson
let search_filter_string_value_to_yojson = string_to_yojson

let search_map_filter_value_to_yojson (x : search_map_filter_value) =
  match x with
  | StringValue arg ->
      assoc_to_yojson [ ("StringValue", Some (search_filter_string_value_to_yojson arg)) ]

let search_map_filter_to_yojson (x : search_map_filter) =
  assoc_to_yojson
    [
      ("Value", Some (search_map_filter_value_to_yojson x.value));
      ("Key", Some (search_map_key_to_yojson x.key));
      ("Attribute", Some (search_attribute_to_yojson x.attribute));
    ]

let search_filter_long_value_to_yojson = long_to_yojson

let search_filter_value_to_yojson (x : search_filter_value) =
  match x with
  | LongValue arg ->
      assoc_to_yojson [ ("LongValue", Some (search_filter_long_value_to_yojson arg)) ]
  | StringValue arg ->
      assoc_to_yojson [ ("StringValue", Some (search_filter_string_value_to_yojson arg)) ]

let search_filter_operator_to_yojson (x : search_filter_operator) =
  match x with
  | NotExists -> `String "notExists"
  | LessThanOrEquals -> `String "lessThanOrEquals"
  | LessThan -> `String "lessThan"
  | GreaterThanOrEquals -> `String "greaterThanOrEquals"
  | GreaterThan -> `String "greaterThan"
  | Equals -> `String "equals"

let search_attribute_filter_to_yojson (x : search_attribute_filter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson search_filter_value_to_yojson x.value);
      ("Operator", Some (search_filter_operator_to_yojson x.operator));
      ("Attribute", Some (search_attribute_to_yojson x.attribute));
    ]

let rec search_filter_clause_to_yojson (x : search_filter_clause) =
  match x with
  | MapFilter arg -> assoc_to_yojson [ ("MapFilter", Some (search_map_filter_to_yojson arg)) ]
  | AttributeFilter arg ->
      assoc_to_yojson [ ("AttributeFilter", Some (search_attribute_filter_to_yojson arg)) ]
  | OrAnyFilters arg ->
      assoc_to_yojson [ ("OrAnyFilters", Some (search_filter_clause_list_to_yojson arg)) ]
  | AndAllFilters arg ->
      assoc_to_yojson [ ("AndAllFilters", Some (search_filter_clause_list_to_yojson arg)) ]

and search_filter_clause_list_to_yojson tree = list_to_yojson search_filter_clause_to_yojson tree

let search_assets_output_to_yojson (x : search_assets_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson search_next_token_to_yojson x.next_token);
      ("Items", option_to_yojson search_result_item_list_to_yojson x.items);
    ]

let search_assets_input_to_yojson (x : search_assets_input) =
  assoc_to_yojson
    [
      ("FilterClause", option_to_yojson search_filter_clause_to_yojson x.filter_clause);
      ("Sort", option_to_yojson search_sort_to_yojson x.sort);
      ("NextToken", option_to_yojson search_next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson search_max_results_to_yojson x.max_results);
      ("SearchText", option_to_yojson search_text_to_yojson x.search_text);
    ]

let schema_version_status_to_yojson (x : schema_version_status) =
  match x with
  | DELETING -> `String "DELETING"
  | FAILURE -> `String "FAILURE"
  | PENDING -> `String "PENDING"
  | AVAILABLE -> `String "AVAILABLE"

let created_timestamp_to_yojson = string_to_yojson

let schema_version_list_item_to_yojson (x : schema_version_list_item) =
  assoc_to_yojson
    [
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("Status", option_to_yojson schema_version_status_to_yojson x.status);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
    ]

let schema_version_list_to_yojson tree = list_to_yojson schema_version_list_item_to_yojson tree
let error_code_string_to_yojson = string_to_yojson
let error_message_string_to_yojson = string_to_yojson

let error_details_to_yojson (x : error_details) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_string_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson error_code_string_to_yojson x.error_code);
    ]

let schema_version_error_item_to_yojson (x : schema_version_error_item) =
  assoc_to_yojson
    [
      ("ErrorDetails", option_to_yojson error_details_to_yojson x.error_details);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
    ]

let schema_version_error_list_to_yojson tree =
  list_to_yojson schema_version_error_item_to_yojson tree

let schema_validation_error_to_yojson = string_to_yojson

let schema_status_to_yojson (x : schema_status) =
  match x with
  | DELETING -> `String "DELETING"
  | PENDING -> `String "PENDING"
  | AVAILABLE -> `String "AVAILABLE"

let schema_registry_token_string_to_yojson = string_to_yojson
let schema_path_string_to_yojson = string_to_yojson

let schema_list_item_to_yojson (x : schema_list_item) =
  assoc_to_yojson
    [
      ("UpdatedTime", option_to_yojson updated_timestamp_to_yojson x.updated_time);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("SchemaStatus", option_to_yojson schema_status_to_yojson x.schema_status);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
    ]

let schema_list_definition_to_yojson tree = list_to_yojson schema_list_item_to_yojson tree

let schema_diff_type_to_yojson (x : schema_diff_type) =
  match x with SYNTAX_DIFF -> `String "SYNTAX_DIFF"

let schema_definition_string_to_yojson = string_to_yojson
let schema_definition_diff_to_yojson = string_to_yojson
let schema_checkpoint_number_to_yojson = long_to_yojson

let schedule_type_to_yojson (x : schedule_type) =
  match x with AUTO -> `String "AUTO" | CRON -> `String "CRON"

let schedule_state_to_yojson (x : schedule_state) =
  match x with
  | TRANSITIONING -> `String "TRANSITIONING"
  | NOT_SCHEDULED -> `String "NOT_SCHEDULED"
  | SCHEDULED -> `String "SCHEDULED"

let schedule_to_yojson (x : schedule) =
  assoc_to_yojson
    [
      ("State", option_to_yojson schedule_state_to_yojson x.state);
      ("ScheduleExpression", option_to_yojson cron_expression_to_yojson x.schedule_expression);
    ]

let scala_code_to_yojson = string_to_yojson

let run_statement_response_to_yojson (x : run_statement_response) =
  assoc_to_yojson [ ("Id", option_to_yojson integer_value_to_yojson x.id) ]

let orchestration_statement_code_string_to_yojson = string_to_yojson

let run_statement_request_to_yojson (x : run_statement_request) =
  assoc_to_yojson
    [
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("Code", Some (orchestration_statement_code_string_to_yojson x.code));
      ("SessionId", Some (name_string_to_yojson x.session_id));
    ]

let run_id_to_yojson = string_to_yojson

let rule_metrics_map_to_yojson tree =
  map_to_yojson name_string_to_yojson nullable_double_to_yojson tree

let role_arn_to_yojson = string_to_yojson
let node_id_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let resume_workflow_run_response_to_yojson (x : resume_workflow_run_response) =
  assoc_to_yojson
    [
      ("NodeIds", option_to_yojson node_id_list_to_yojson x.node_ids);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
    ]

let resume_workflow_run_request_to_yojson (x : resume_workflow_run_request) =
  assoc_to_yojson
    [
      ("NodeIds", Some (node_id_list_to_yojson x.node_ids));
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("Name", Some (name_string_to_yojson x.name));
    ]

let field_data_type_to_yojson (x : field_data_type) =
  match x with
  | UNION -> `String "UNION"
  | BINARY -> `String "BINARY"
  | STRUCT -> `String "STRUCT"
  | DOUBLE -> `String "DOUBLE"
  | SHORT -> `String "SHORT"
  | BYTE -> `String "BYTE"
  | DECIMAL -> `String "DECIMAL"
  | TIMESTAMP -> `String "TIMESTAMP"
  | STRING -> `String "STRING"
  | ARRAY -> `String "ARRAY"
  | MAP -> `String "MAP"
  | BOOLEAN -> `String "BOOLEAN"
  | DATE -> `String "DATE"
  | LONG -> `String "LONG"
  | FLOAT -> `String "FLOAT"
  | BIGINT -> `String "BIGINT"
  | SMALLINT -> `String "SMALLINT"
  | INT -> `String "INT"

let field_definition_to_yojson (x : field_definition) =
  assoc_to_yojson
    [
      ("FieldDataType", Some (field_data_type_to_yojson x.field_data_type));
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let field_definition_map_key_string_to_yojson = string_to_yojson

let field_definition_map_to_yojson tree =
  map_to_yojson field_definition_map_key_string_to_yojson field_definition_to_yojson tree

let entity_configuration_to_yojson (x : entity_configuration) =
  assoc_to_yojson
    [
      ("Schema", option_to_yojson field_definition_map_to_yojson x.schema);
      ("SourceConfiguration", option_to_yojson source_configuration_to_yojson x.source_configuration);
    ]

let entity_configuration_map_key_string_to_yojson = string_to_yojson

let entity_configuration_map_to_yojson tree =
  map_to_yojson entity_configuration_map_key_string_to_yojson entity_configuration_to_yojson tree

let rest_configuration_to_yojson (x : rest_configuration) =
  assoc_to_yojson
    [
      ( "EntityConfigurations",
        option_to_yojson entity_configuration_map_to_yojson x.entity_configurations );
      ( "ValidationEndpointConfiguration",
        option_to_yojson source_configuration_to_yojson x.validation_endpoint_configuration );
      ( "GlobalSourceConfiguration",
        option_to_yojson source_configuration_to_yojson x.global_source_configuration );
    ]

let job_name_to_yojson = string_to_yojson
let json_value_to_yojson = string_to_yojson

let job_bookmark_entry_to_yojson (x : job_bookmark_entry) =
  assoc_to_yojson
    [
      ("JobBookmark", option_to_yojson json_value_to_yojson x.job_bookmark);
      ("RunId", option_to_yojson run_id_to_yojson x.run_id);
      ("PreviousRunId", option_to_yojson run_id_to_yojson x.previous_run_id);
      ("Attempt", option_to_yojson integer_value_to_yojson x.attempt);
      ("Run", option_to_yojson integer_value_to_yojson x.run);
      ("Version", option_to_yojson integer_value_to_yojson x.version);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let reset_job_bookmark_response_to_yojson (x : reset_job_bookmark_response) =
  assoc_to_yojson
    [ ("JobBookmarkEntry", option_to_yojson job_bookmark_entry_to_yojson x.job_bookmark_entry) ]

let reset_job_bookmark_request_to_yojson (x : reset_job_bookmark_request) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson run_id_to_yojson x.run_id);
      ("JobName", Some (job_name_to_yojson x.job_name));
    ]

let metadata_key_string_to_yojson = string_to_yojson
let metadata_value_string_to_yojson = string_to_yojson

let remove_schema_version_metadata_response_to_yojson (x : remove_schema_version_metadata_response)
    =
  assoc_to_yojson
    [
      ("MetadataValue", option_to_yojson metadata_value_string_to_yojson x.metadata_value);
      ("MetadataKey", option_to_yojson metadata_key_string_to_yojson x.metadata_key);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("LatestVersion", option_to_yojson latest_schema_version_boolean_to_yojson x.latest_version);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
    ]

let metadata_key_value_pair_to_yojson (x : metadata_key_value_pair) =
  assoc_to_yojson
    [
      ("MetadataValue", option_to_yojson metadata_value_string_to_yojson x.metadata_value);
      ("MetadataKey", option_to_yojson metadata_key_string_to_yojson x.metadata_key);
    ]

let remove_schema_version_metadata_input_to_yojson (x : remove_schema_version_metadata_input) =
  assoc_to_yojson
    [
      ("MetadataKeyValue", Some (metadata_key_value_pair_to_yojson x.metadata_key_value));
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ( "SchemaVersionNumber",
        option_to_yojson schema_version_number_to_yojson x.schema_version_number );
      ("SchemaId", option_to_yojson schema_id_to_yojson x.schema_id);
    ]

let registry_status_to_yojson (x : registry_status) =
  match x with DELETING -> `String "DELETING" | AVAILABLE -> `String "AVAILABLE"

let registry_list_item_to_yojson (x : registry_list_item) =
  assoc_to_yojson
    [
      ("UpdatedTime", option_to_yojson updated_timestamp_to_yojson x.updated_time);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("Status", option_to_yojson registry_status_to_yojson x.status);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
    ]

let registry_list_definition_to_yojson tree = list_to_yojson registry_list_item_to_yojson tree

let register_schema_version_response_to_yojson (x : register_schema_version_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson schema_version_status_to_yojson x.status);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
    ]

let register_schema_version_input_to_yojson (x : register_schema_version_input) =
  assoc_to_yojson
    [
      ("SchemaDefinition", Some (schema_definition_string_to_yojson x.schema_definition));
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
    ]

let register_connection_type_response_to_yojson (x : register_connection_type_response) =
  assoc_to_yojson
    [ ("ConnectionTypeArn", option_to_yojson glue_resource_arn_to_yojson x.connection_type_arn) ]

let integration_type_to_yojson (x : integration_type) = match x with REST -> `String "REST"
let description_to_yojson = string_to_yojson

let connection_properties_configuration_to_yojson (x : connection_properties_configuration) =
  assoc_to_yojson
    [
      ( "AdditionalRequestParameters",
        option_to_yojson connector_property_list_to_yojson x.additional_request_parameters );
      ("Url", option_to_yojson connector_property_to_yojson x.url);
    ]

let authentication_types_to_yojson tree = list_to_yojson authentication_type_to_yojson tree

let connector_o_auth2_grant_type_to_yojson (x : connector_o_auth2_grant_type) =
  match x with
  | AUTHORIZATION_CODE -> `String "AUTHORIZATION_CODE"
  | JWT_BEARER -> `String "JWT_BEARER"
  | CLIENT_CREDENTIALS -> `String "CLIENT_CREDENTIALS"

let content_type_to_yojson (x : content_type) =
  match x with
  | URL_ENCODED -> `String "URL_ENCODED"
  | APPLICATION_JSON -> `String "APPLICATION_JSON"

let client_credentials_properties_to_yojson (x : client_credentials_properties) =
  assoc_to_yojson
    [
      ( "TokenUrlParameters",
        option_to_yojson connector_property_list_to_yojson x.token_url_parameters );
      ("Scope", option_to_yojson connector_property_to_yojson x.scope);
      ("ClientSecret", option_to_yojson connector_property_to_yojson x.client_secret);
      ("ClientId", option_to_yojson connector_property_to_yojson x.client_id);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("RequestMethod", option_to_yojson http_method_to_yojson x.request_method);
      ("TokenUrl", option_to_yojson connector_property_to_yojson x.token_url);
    ]

let jwt_bearer_properties_to_yojson (x : jwt_bearer_properties) =
  assoc_to_yojson
    [
      ( "TokenUrlParameters",
        option_to_yojson connector_property_list_to_yojson x.token_url_parameters );
      ("JwtToken", option_to_yojson connector_property_to_yojson x.jwt_token);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("RequestMethod", option_to_yojson http_method_to_yojson x.request_method);
      ("TokenUrl", option_to_yojson connector_property_to_yojson x.token_url);
    ]

let connector_authorization_code_properties_to_yojson (x : connector_authorization_code_properties)
    =
  assoc_to_yojson
    [
      ( "TokenUrlParameters",
        option_to_yojson connector_property_list_to_yojson x.token_url_parameters );
      ("Prompt", option_to_yojson connector_property_to_yojson x.prompt);
      ("Scope", option_to_yojson connector_property_to_yojson x.scope);
      ("ClientSecret", option_to_yojson connector_property_to_yojson x.client_secret);
      ("ClientId", option_to_yojson connector_property_to_yojson x.client_id);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("RequestMethod", option_to_yojson http_method_to_yojson x.request_method);
      ("TokenUrl", option_to_yojson connector_property_to_yojson x.token_url);
      ("RedirectUri", option_to_yojson connector_property_to_yojson x.redirect_uri);
      ("AuthorizationCode", option_to_yojson connector_property_to_yojson x.authorization_code);
      ( "AuthorizationCodeUrl",
        option_to_yojson connector_property_to_yojson x.authorization_code_url );
    ]

let connector_o_auth2_properties_to_yojson (x : connector_o_auth2_properties) =
  assoc_to_yojson
    [
      ( "AuthorizationCodeProperties",
        option_to_yojson connector_authorization_code_properties_to_yojson
          x.authorization_code_properties );
      ( "JWTBearerProperties",
        option_to_yojson jwt_bearer_properties_to_yojson x.jwt_bearer_properties );
      ( "ClientCredentialsProperties",
        option_to_yojson client_credentials_properties_to_yojson x.client_credentials_properties );
      ("OAuth2GrantType", Some (connector_o_auth2_grant_type_to_yojson x.o_auth2_grant_type));
    ]

let basic_authentication_properties_to_yojson (x : basic_authentication_properties) =
  assoc_to_yojson
    [
      ("Password", option_to_yojson connector_property_to_yojson x.password);
      ("Username", option_to_yojson connector_property_to_yojson x.username);
    ]

let custom_authentication_properties_to_yojson (x : custom_authentication_properties) =
  assoc_to_yojson
    [
      ( "AuthenticationParameters",
        Some (connector_property_list_to_yojson x.authentication_parameters) );
    ]

let connector_authentication_configuration_to_yojson (x : connector_authentication_configuration) =
  assoc_to_yojson
    [
      ( "CustomAuthenticationProperties",
        option_to_yojson custom_authentication_properties_to_yojson
          x.custom_authentication_properties );
      ( "BasicAuthenticationProperties",
        option_to_yojson basic_authentication_properties_to_yojson x.basic_authentication_properties
      );
      ( "OAuth2Properties",
        option_to_yojson connector_o_auth2_properties_to_yojson x.o_auth2_properties );
      ("AuthenticationTypes", Some (authentication_types_to_yojson x.authentication_types));
    ]

let register_connection_type_request_to_yojson (x : register_connection_type_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("RestConfiguration", Some (rest_configuration_to_yojson x.rest_configuration));
      ( "ConnectorAuthenticationConfiguration",
        Some
          (connector_authentication_configuration_to_yojson x.connector_authentication_configuration)
      );
      ( "ConnectionProperties",
        Some (connection_properties_configuration_to_yojson x.connection_properties) );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("IntegrationType", Some (integration_type_to_yojson x.integration_type));
      ("ConnectionType", Some (name_string_to_yojson x.connection_type));
    ]

let record_to_yojson = json_to_yojson
let records_to_yojson tree = list_to_yojson record_to_yojson tree
let context_value_to_yojson = string_to_yojson
let context_key_to_yojson = string_to_yojson

let additional_context_map_to_yojson tree =
  map_to_yojson context_key_to_yojson context_value_to_yojson tree

let query_session_context_to_yojson (x : query_session_context) =
  assoc_to_yojson
    [
      ("AdditionalContext", option_to_yojson additional_context_map_to_yojson x.additional_context);
      ("QueryAuthorizationId", option_to_yojson hash_string_to_yojson x.query_authorization_id);
      ("ClusterId", option_to_yojson nullable_string_to_yojson x.cluster_id);
      ("QueryStartTime", option_to_yojson timestamp_to_yojson x.query_start_time);
      ("QueryId", option_to_yojson hash_string_to_yojson x.query_id);
    ]

let other_metadata_value_list_item_to_yojson (x : other_metadata_value_list_item) =
  assoc_to_yojson
    [
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("MetadataValue", option_to_yojson metadata_value_string_to_yojson x.metadata_value);
    ]

let other_metadata_value_list_to_yojson tree =
  list_to_yojson other_metadata_value_list_item_to_yojson tree

let metadata_info_to_yojson (x : metadata_info) =
  assoc_to_yojson
    [
      ( "OtherMetadataValueList",
        option_to_yojson other_metadata_value_list_to_yojson x.other_metadata_value_list );
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("MetadataValue", option_to_yojson metadata_value_string_to_yojson x.metadata_value);
    ]

let metadata_info_map_to_yojson tree =
  map_to_yojson metadata_key_string_to_yojson metadata_info_to_yojson tree

let query_schema_version_metadata_response_to_yojson (x : query_schema_version_metadata_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("MetadataInfoMap", option_to_yojson metadata_info_map_to_yojson x.metadata_info_map);
    ]

let query_schema_version_metadata_max_results_to_yojson = int_to_yojson
let metadata_list_to_yojson tree = list_to_yojson metadata_key_value_pair_to_yojson tree

let query_schema_version_metadata_input_to_yojson (x : query_schema_version_metadata_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson query_schema_version_metadata_max_results_to_yojson x.max_results );
      ("MetadataList", option_to_yojson metadata_list_to_yojson x.metadata_list);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ( "SchemaVersionNumber",
        option_to_yojson schema_version_number_to_yojson x.schema_version_number );
      ("SchemaId", option_to_yojson schema_id_to_yojson x.schema_id);
    ]

let python_script_to_yojson = string_to_yojson
let put_workflow_run_properties_response_to_yojson = unit_to_yojson

let put_workflow_run_properties_request_to_yojson (x : put_workflow_run_properties_request) =
  assoc_to_yojson
    [
      ("RunProperties", Some (workflow_run_properties_to_yojson x.run_properties));
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("Name", Some (name_string_to_yojson x.name));
    ]

let put_schema_version_metadata_response_to_yojson (x : put_schema_version_metadata_response) =
  assoc_to_yojson
    [
      ("MetadataValue", option_to_yojson metadata_value_string_to_yojson x.metadata_value);
      ("MetadataKey", option_to_yojson metadata_key_string_to_yojson x.metadata_key);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("LatestVersion", option_to_yojson latest_schema_version_boolean_to_yojson x.latest_version);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
    ]

let put_schema_version_metadata_input_to_yojson (x : put_schema_version_metadata_input) =
  assoc_to_yojson
    [
      ("MetadataKeyValue", Some (metadata_key_value_pair_to_yojson x.metadata_key_value));
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ( "SchemaVersionNumber",
        option_to_yojson schema_version_number_to_yojson x.schema_version_number );
      ("SchemaId", option_to_yojson schema_id_to_yojson x.schema_id);
    ]

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson [ ("PolicyHash", option_to_yojson hash_string_to_yojson x.policy_hash) ]

let policy_json_string_to_yojson = string_to_yojson

let exist_condition_to_yojson (x : exist_condition) =
  match x with
  | NONE -> `String "NONE"
  | NOT_EXIST -> `String "NOT_EXIST"
  | MUST_EXIST -> `String "MUST_EXIST"

let enable_hybrid_values_to_yojson (x : enable_hybrid_values) =
  match x with FALSE -> `String "FALSE" | TRUE -> `String "TRUE"

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("EnableHybrid", option_to_yojson enable_hybrid_values_to_yojson x.enable_hybrid);
      ("PolicyExistsCondition", option_to_yojson exist_condition_to_yojson x.policy_exists_condition);
      ("PolicyHashCondition", option_to_yojson hash_string_to_yojson x.policy_hash_condition);
      ("ResourceArn", option_to_yojson glue_resource_arn_to_yojson x.resource_arn);
      ("PolicyInJson", Some (policy_json_string_to_yojson x.policy_in_json));
    ]

let condition_check_failure_exception_to_yojson (x : condition_check_failure_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let form_type_id_to_yojson = string_to_yojson
let form_type_name_to_yojson = string_to_yojson
let form_type_schema_to_yojson = string_to_yojson

let put_form_type_response_to_yojson (x : put_form_type_response) =
  assoc_to_yojson
    [
      ("Schema", option_to_yojson form_type_schema_to_yojson x.schema);
      ("Name", option_to_yojson form_type_name_to_yojson x.name);
      ("Id", option_to_yojson form_type_id_to_yojson x.id);
    ]

let put_form_type_request_to_yojson (x : put_form_type_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Schema", Some (form_type_schema_to_yojson x.schema));
      ("Name", Some (form_type_name_to_yojson x.name));
    ]

let put_data_quality_profile_annotation_response_to_yojson = unit_to_yojson

let put_data_quality_profile_annotation_request_to_yojson
    (x : put_data_quality_profile_annotation_request) =
  assoc_to_yojson
    [
      ("InclusionAnnotation", Some (inclusion_annotation_value_to_yojson x.inclusion_annotation));
      ("ProfileId", Some (hash_string_to_yojson x.profile_id));
    ]

let put_data_catalog_encryption_settings_response_to_yojson = unit_to_yojson

let catalog_encryption_mode_to_yojson (x : catalog_encryption_mode) =
  match x with
  | SSEKMSWITHSERVICEROLE -> `String "SSE-KMS-WITH-SERVICE-ROLE"
  | SSEKMS -> `String "SSE-KMS"
  | DISABLED -> `String "DISABLED"

let encryption_at_rest_to_yojson (x : encryption_at_rest) =
  assoc_to_yojson
    [
      ( "CatalogEncryptionServiceRole",
        option_to_yojson iam_role_arn_to_yojson x.catalog_encryption_service_role );
      ("SseAwsKmsKeyId", option_to_yojson name_string_to_yojson x.sse_aws_kms_key_id);
      ("CatalogEncryptionMode", Some (catalog_encryption_mode_to_yojson x.catalog_encryption_mode));
    ]

let connection_password_encryption_to_yojson (x : connection_password_encryption) =
  assoc_to_yojson
    [
      ("AwsKmsKeyId", option_to_yojson name_string_to_yojson x.aws_kms_key_id);
      ( "ReturnConnectionPasswordEncrypted",
        Some (boolean__to_yojson x.return_connection_password_encrypted) );
    ]

let data_catalog_encryption_settings_to_yojson (x : data_catalog_encryption_settings) =
  assoc_to_yojson
    [
      ( "ConnectionPasswordEncryption",
        option_to_yojson connection_password_encryption_to_yojson x.connection_password_encryption
      );
      ("EncryptionAtRest", option_to_yojson encryption_at_rest_to_yojson x.encryption_at_rest);
    ]

let put_data_catalog_encryption_settings_request_to_yojson
    (x : put_data_catalog_encryption_settings_request) =
  assoc_to_yojson
    [
      ( "DataCatalogEncryptionSettings",
        Some (data_catalog_encryption_settings_to_yojson x.data_catalog_encryption_settings) );
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let iterable_form_name_to_yojson = string_to_yojson
let item_identifier_to_yojson = string_to_yojson
let attachment_name_to_yojson = string_to_yojson

let put_attachment_response_to_yojson (x : put_attachment_response) =
  assoc_to_yojson
    [
      ("FormTypeId", option_to_yojson form_type_id_to_yojson x.form_type_id);
      ("AttachmentName", option_to_yojson attachment_name_to_yojson x.attachment_name);
      ("ItemIdentifier", option_to_yojson item_identifier_to_yojson x.item_identifier);
      ("IterableFormName", option_to_yojson iterable_form_name_to_yojson x.iterable_form_name);
      ("AssetIdentifier", option_to_yojson asset_id_to_yojson x.asset_identifier);
    ]

let form_content_to_yojson = string_to_yojson

let put_attachment_request_to_yojson (x : put_attachment_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("FormTypeId", Some (form_type_id_to_yojson x.form_type_id));
      ("Content", Some (form_content_to_yojson x.content));
      ("AttachmentName", Some (attachment_name_to_yojson x.attachment_name));
      ("ItemIdentifier", option_to_yojson item_identifier_to_yojson x.item_identifier);
      ("IterableFormName", option_to_yojson iterable_form_name_to_yojson x.iterable_form_name);
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
    ]

let asset_type_name_to_yojson = string_to_yojson

let asset_type_form_reference_to_yojson (x : asset_type_form_reference) =
  assoc_to_yojson [ ("FormTypeIdentifier", Some (form_type_id_to_yojson x.form_type_identifier)) ]

let asset_type_form_key_to_yojson = string_to_yojson

let asset_type_forms_map_to_yojson tree =
  map_to_yojson asset_type_form_key_to_yojson asset_type_form_reference_to_yojson tree

let put_asset_type_response_to_yojson (x : put_asset_type_response) =
  assoc_to_yojson
    [
      ("Forms", option_to_yojson asset_type_forms_map_to_yojson x.forms);
      ("Name", option_to_yojson asset_type_name_to_yojson x.name);
      ("Id", option_to_yojson asset_type_id_to_yojson x.id);
    ]

let put_asset_type_request_to_yojson (x : put_asset_type_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Forms", Some (asset_type_forms_map_to_yojson x.forms));
      ("Name", Some (asset_type_name_to_yojson x.name));
    ]

let created_at_to_yojson = timestamp_epoch_seconds_to_yojson

let asset_form_entry_to_yojson (x : asset_form_entry) =
  assoc_to_yojson
    [
      ("Content", option_to_yojson form_content_to_yojson x.content);
      ("FormTypeId", option_to_yojson form_type_id_to_yojson x.form_type_id);
    ]

let asset_form_key_to_yojson = string_to_yojson

let asset_form_map_to_yojson tree =
  map_to_yojson asset_form_key_to_yojson asset_form_entry_to_yojson tree

let put_asset_response_to_yojson (x : put_asset_response) =
  assoc_to_yojson
    [
      ("Forms", option_to_yojson asset_form_map_to_yojson x.forms);
      ("CreatedAt", option_to_yojson created_at_to_yojson x.created_at);
      ("Description", option_to_yojson asset_description_to_yojson x.description);
      ("Name", Some (asset_name_to_yojson x.name));
      ("Id", Some (asset_id_to_yojson x.id));
    ]

let put_asset_request_to_yojson (x : put_asset_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Forms", Some (asset_form_map_to_yojson x.forms));
      ("Description", option_to_yojson asset_description_to_yojson x.description);
      ("Name", Some (asset_name_to_yojson x.name));
      ("Identifier", Some (asset_id_to_yojson x.identifier));
      ("AssetTypeId", Some (asset_type_id_to_yojson x.asset_type_id));
    ]

let property_types_to_yojson tree = list_to_yojson property_type_to_yojson tree

let property_name_overrides_to_yojson tree =
  map_to_yojson property_name_to_yojson property_name_to_yojson tree

let property_description_string_to_yojson = string_to_yojson
let allowed_value_description_string_to_yojson = string_to_yojson
let allowed_value_value_string_to_yojson = string_to_yojson

let allowed_value_to_yojson (x : allowed_value) =
  assoc_to_yojson
    [
      ("Value", Some (allowed_value_value_string_to_yojson x.value));
      ("Description", option_to_yojson allowed_value_description_string_to_yojson x.description);
    ]

let allowed_values_to_yojson tree = list_to_yojson allowed_value_to_yojson tree

let data_operation_to_yojson (x : data_operation) =
  match x with WRITE -> `String "WRITE" | READ -> `String "READ"

let data_operations_to_yojson tree = list_to_yojson data_operation_to_yojson tree

let property_to_yojson (x : property) =
  assoc_to_yojson
    [
      ("PropertyLocation", option_to_yojson property_location_to_yojson x.property_location);
      ( "KeyOverride",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key_override );
      ("DataOperationScopes", option_to_yojson data_operations_to_yojson x.data_operation_scopes);
      ("AllowedValues", option_to_yojson allowed_values_to_yojson x.allowed_values);
      ("PropertyTypes", Some (property_types_to_yojson x.property_types));
      ( "DefaultValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.default_value );
      ("Required", Some (bool__to_yojson x.required));
      ("Description", Some (property_description_string_to_yojson x.description));
      ("Name", Some (property_name_to_yojson x.name));
    ]

let properties_map_to_yojson tree = map_to_yojson property_name_to_yojson property_to_yojson tree
let predicate_string_to_yojson = string_to_yojson
let positive_integer_to_yojson = int_to_yojson

let permission_type_mismatch_exception_to_yojson (x : permission_type_mismatch_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let permission_type_to_yojson (x : permission_type) =
  match x with
  | NESTED_CELL_PERMISSION -> `String "NESTED_CELL_PERMISSION"
  | NESTED_PERMISSION -> `String "NESTED_PERMISSION"
  | CELL_FILTER_PERMISSION -> `String "CELL_FILTER_PERMISSION"
  | COLUMN_PERMISSION -> `String "COLUMN_PERMISSION"

let permission_type_list_to_yojson tree = list_to_yojson permission_type_to_yojson tree

let partition_value_list_to_yojson (x : partition_value_list) =
  assoc_to_yojson [ ("Values", Some (value_string_list_to_yojson x.values)) ]

let partition_list_to_yojson tree = list_to_yojson partition_to_yojson tree
let partition_input_list_to_yojson tree = list_to_yojson partition_input_to_yojson tree

let partition_index_status_to_yojson (x : partition_index_status) =
  match x with
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"

let key_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let partition_index_to_yojson (x : partition_index) =
  assoc_to_yojson
    [
      ("IndexName", Some (name_string_to_yojson x.index_name));
      ("Keys", Some (key_list_to_yojson x.keys));
    ]

let partition_index_list_to_yojson tree = list_to_yojson partition_index_to_yojson tree

let key_schema_element_to_yojson (x : key_schema_element) =
  assoc_to_yojson
    [
      ("Type", Some (column_type_string_to_yojson x.type_));
      ("Name", Some (name_string_to_yojson x.name));
    ]

let key_schema_element_list_to_yojson tree = list_to_yojson key_schema_element_to_yojson tree

let backfill_error_code_to_yojson (x : backfill_error_code) =
  match x with
  | UNSUPPORTED_PARTITION_CHARACTER_ERROR -> `String "UNSUPPORTED_PARTITION_CHARACTER_ERROR"
  | MISSING_PARTITION_VALUE_ERROR -> `String "MISSING_PARTITION_VALUE_ERROR"
  | INVALID_PARTITION_TYPE_DATA_ERROR -> `String "INVALID_PARTITION_TYPE_DATA_ERROR"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | ENCRYPTED_PARTITION_ERROR -> `String "ENCRYPTED_PARTITION_ERROR"

let backfill_errored_partitions_list_to_yojson tree =
  list_to_yojson partition_value_list_to_yojson tree

let backfill_error_to_yojson (x : backfill_error) =
  assoc_to_yojson
    [
      ("Partitions", option_to_yojson backfill_errored_partitions_list_to_yojson x.partitions);
      ("Code", option_to_yojson backfill_error_code_to_yojson x.code);
    ]

let backfill_errors_to_yojson tree = list_to_yojson backfill_error_to_yojson tree

let partition_index_descriptor_to_yojson (x : partition_index_descriptor) =
  assoc_to_yojson
    [
      ("BackfillErrors", option_to_yojson backfill_errors_to_yojson x.backfill_errors);
      ("IndexStatus", Some (partition_index_status_to_yojson x.index_status));
      ("Keys", Some (key_schema_element_list_to_yojson x.keys));
      ("IndexName", Some (name_string_to_yojson x.index_name));
    ]

let partition_index_descriptor_list_to_yojson tree =
  list_to_yojson partition_index_descriptor_to_yojson tree

let partition_error_to_yojson (x : partition_error) =
  assoc_to_yojson
    [
      ("ErrorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
      ("PartitionValues", option_to_yojson value_string_list_to_yojson x.partition_values);
    ]

let partition_errors_to_yojson tree = list_to_yojson partition_error_to_yojson tree
let pagination_token_to_yojson = string_to_yojson
let orchestration_token_to_yojson = string_to_yojson
let orchestration_page_size25_to_yojson = int_to_yojson
let orchestration_page_size200_to_yojson = int_to_yojson
let option_value_to_yojson = string_to_yojson
let option_key_to_yojson = string_to_yojson

let metadata_operation_to_yojson (x : metadata_operation) =
  match x with CREATE -> `String "CREATE"

let create_iceberg_table_input_to_yojson (x : create_iceberg_table_input) =
  assoc_to_yojson
    [
      ("Properties", option_to_yojson string_to_string_map_to_yojson x.properties);
      ("WriteOrder", option_to_yojson iceberg_sort_order_to_yojson x.write_order);
      ("PartitionSpec", option_to_yojson iceberg_partition_spec_to_yojson x.partition_spec);
      ("Schema", Some (iceberg_schema_to_yojson x.schema));
      ("Location", Some (location_string_to_yojson x.location));
    ]

let iceberg_input_to_yojson (x : iceberg_input) =
  assoc_to_yojson
    [
      ( "CreateIcebergTableInput",
        option_to_yojson create_iceberg_table_input_to_yojson x.create_iceberg_table_input );
      ("Version", option_to_yojson version_string_to_yojson x.version);
      ("MetadataOperation", Some (metadata_operation_to_yojson x.metadata_operation));
    ]

let open_table_format_input_to_yojson (x : open_table_format_input) =
  assoc_to_yojson [ ("IcebergInput", option_to_yojson iceberg_input_to_yojson x.iceberg_input) ]

let o_auth2_properties_to_yojson (x : o_auth2_properties) =
  assoc_to_yojson
    [
      ( "TokenUrlParametersMap",
        option_to_yojson token_url_parameters_map_to_yojson x.token_url_parameters_map );
      ("TokenUrl", option_to_yojson token_url_to_yojson x.token_url);
      ( "OAuth2ClientApplication",
        option_to_yojson o_auth2_client_application_to_yojson x.o_auth2_client_application );
      ("OAuth2GrantType", option_to_yojson o_auth2_grant_type_to_yojson x.o_auth2_grant_type);
    ]

let next_token_to_yojson = string_to_yojson
let new_rules_to_yojson tree = list_to_yojson name_string_to_yojson tree
let integration_description_to_yojson = string_to_yojson
let integration_string_to_yojson = string_to_yojson

let integration_additional_encryption_context_map_to_yojson tree =
  map_to_yojson integration_string_to_yojson integration_string_to_yojson tree

let integration_tags_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let integration_status_to_yojson (x : integration_status) =
  match x with
  | NEEDS_ATTENTION -> `String "NEEDS_ATTENTION"
  | SYNCING -> `String "SYNCING"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"
  | MODIFYING -> `String "MODIFYING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"

let integration_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let integration_error_to_yojson (x : integration_error) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string2048_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson string128_to_yojson x.error_code);
    ]

let integration_error_list_to_yojson tree = list_to_yojson integration_error_to_yojson tree

let integration_source_properties_map_to_yojson tree =
  map_to_yojson integration_string_to_yojson integration_string_to_yojson tree

let continuous_sync_to_yojson = bool_to_yojson

let integration_config_to_yojson (x : integration_config) =
  assoc_to_yojson
    [
      ("ContinuousSync", option_to_yojson continuous_sync_to_yojson x.continuous_sync);
      ( "SourceProperties",
        option_to_yojson integration_source_properties_map_to_yojson x.source_properties );
      ("RefreshInterval", option_to_yojson string128_to_yojson x.refresh_interval);
    ]

let modify_integration_response_to_yojson (x : modify_integration_response) =
  assoc_to_yojson
    [
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
      ("Errors", option_to_yojson integration_error_list_to_yojson x.errors);
      ("CreateTime", Some (integration_timestamp_to_yojson x.create_time));
      ("Status", Some (integration_status_to_yojson x.status));
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
      ( "AdditionalEncryptionContext",
        option_to_yojson integration_additional_encryption_context_map_to_yojson
          x.additional_encryption_context );
      ("KmsKeyId", option_to_yojson string2048_to_yojson x.kms_key_id);
      ("IntegrationArn", Some (string128_to_yojson x.integration_arn));
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("IntegrationName", Some (string128_to_yojson x.integration_name));
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("SourceArn", Some (string512_to_yojson x.source_arn));
    ]

let modify_integration_request_to_yojson (x : modify_integration_request) =
  assoc_to_yojson
    [
      ("IntegrationName", option_to_yojson string128_to_yojson x.integration_name);
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("IntegrationIdentifier", Some (string128_to_yojson x.integration_identifier));
    ]

let invalid_state_exception_to_yojson (x : invalid_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_string_to_yojson x.message) ]

let invalid_integration_state_fault_to_yojson (x : invalid_integration_state_fault) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let integration_not_found_fault_to_yojson (x : integration_not_found_fault) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let integration_conflict_operation_fault_to_yojson (x : integration_conflict_operation_fault) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let milliseconds_count_to_yojson = long_to_yojson

let data_quality_metric_values_to_yojson (x : data_quality_metric_values) =
  assoc_to_yojson
    [
      ("UpperLimit", option_to_yojson nullable_double_to_yojson x.upper_limit);
      ("LowerLimit", option_to_yojson nullable_double_to_yojson x.lower_limit);
      ("ExpectedValue", option_to_yojson nullable_double_to_yojson x.expected_value);
      ("ActualValue", option_to_yojson nullable_double_to_yojson x.actual_value);
    ]

let metric_based_observation_to_yojson (x : metric_based_observation) =
  assoc_to_yojson
    [
      ("NewRules", option_to_yojson new_rules_to_yojson x.new_rules);
      ("MetricValues", option_to_yojson data_quality_metric_values_to_yojson x.metric_values);
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ("MetricName", option_to_yojson name_string_to_yojson x.metric_name);
    ]

let message_prefix_to_yojson = string_to_yojson
let max_results_number_to_yojson = int_to_yojson
let max_results_to_yojson = int_to_yojson
let max_list_table_optimizer_runs_token_results_to_yojson = int_to_yojson

let materialized_view_refresh_type_to_yojson (x : materialized_view_refresh_type) =
  match x with INCREMENTAL -> `String "INCREMENTAL" | FULL -> `String "FULL"

let materialized_view_refresh_state_to_yojson (x : materialized_view_refresh_state) =
  match x with
  | STOPPED -> `String "STOPPED"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | RUNNING -> `String "RUNNING"
  | STARTING -> `String "STARTING"

let byte_count_to_yojson = long_to_yojson

let materialized_view_refresh_task_run_to_yojson (x : materialized_view_refresh_task_run) =
  assoc_to_yojson
    [
      ("ProcessedBytes", option_to_yojson byte_count_to_yojson x.processed_bytes);
      ("RefreshType", option_to_yojson materialized_view_refresh_type_to_yojson x.refresh_type);
      ("DPUSeconds", option_to_yojson non_negative_double_to_yojson x.dpu_seconds);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson materialized_view_refresh_state_to_yojson x.status);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
      ( "MaterializedViewRefreshTaskRunId",
        option_to_yojson uui_dv4_to_yojson x.materialized_view_refresh_task_run_id );
      ("CustomerId", option_to_yojson account_id_to_yojson x.customer_id);
    ]

let materialized_view_refresh_task_runs_list_to_yojson tree =
  list_to_yojson materialized_view_refresh_task_run_to_yojson tree

let field_type_to_yojson = string_to_yojson

let mapping_entry_to_yojson (x : mapping_entry) =
  assoc_to_yojson
    [
      ("TargetType", option_to_yojson field_type_to_yojson x.target_type);
      ("TargetPath", option_to_yojson schema_path_string_to_yojson x.target_path);
      ("TargetTable", option_to_yojson table_name_to_yojson x.target_table);
      ("SourceType", option_to_yojson field_type_to_yojson x.source_type);
      ("SourcePath", option_to_yojson schema_path_string_to_yojson x.source_path);
      ("SourceTable", option_to_yojson table_name_to_yojson x.source_table);
    ]

let mapping_list_to_yojson tree = list_to_yojson mapping_entry_to_yojson tree
let long_value_string_to_yojson = string_to_yojson
let code_gen_arg_name_to_yojson = string_to_yojson
let code_gen_arg_value_to_yojson = string_to_yojson

let code_gen_node_arg_to_yojson (x : code_gen_node_arg) =
  assoc_to_yojson
    [
      ("Param", option_to_yojson boolean__to_yojson x.param);
      ("Value", Some (code_gen_arg_value_to_yojson x.value));
      ("Name", Some (code_gen_arg_name_to_yojson x.name));
    ]

let code_gen_node_args_to_yojson tree = list_to_yojson code_gen_node_arg_to_yojson tree

let location_to_yojson (x : location) =
  assoc_to_yojson
    [
      ("DynamoDB", option_to_yojson code_gen_node_args_to_yojson x.dynamo_d_b);
      ("S3", option_to_yojson code_gen_node_args_to_yojson x.s3);
      ("Jdbc", option_to_yojson code_gen_node_args_to_yojson x.jdbc);
    ]

let list_workflows_response_to_yojson (x : list_workflows_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Workflows", option_to_yojson workflow_names_to_yojson x.workflows);
    ]

let list_workflows_request_to_yojson (x : list_workflows_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson orchestration_page_size25_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_usage_profiles_response_to_yojson (x : list_usage_profiles_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
      ("Profiles", option_to_yojson usage_profile_definition_list_to_yojson x.profiles);
    ]

let list_usage_profiles_request_to_yojson (x : list_usage_profiles_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson orchestration_page_size200_to_yojson x.max_results);
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
    ]

let list_triggers_response_to_yojson (x : list_triggers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("TriggerNames", option_to_yojson trigger_name_list_to_yojson x.trigger_names);
    ]

let list_triggers_request_to_yojson (x : list_triggers_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("MaxResults", option_to_yojson orchestration_page_size200_to_yojson x.max_results);
      ("DependentJobName", option_to_yojson name_string_to_yojson x.dependent_job_name);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_table_optimizer_runs_token_to_yojson = string_to_yojson

let list_table_optimizer_runs_response_to_yojson (x : list_table_optimizer_runs_response) =
  assoc_to_yojson
    [
      ("TableOptimizerRuns", option_to_yojson table_optimizer_runs_to_yojson x.table_optimizer_runs);
      ("NextToken", option_to_yojson list_table_optimizer_runs_token_to_yojson x.next_token);
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let list_table_optimizer_runs_request_to_yojson (x : list_table_optimizer_runs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson list_table_optimizer_runs_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson max_list_table_optimizer_runs_token_results_to_yojson x.max_results );
      ("Type", Some (table_optimizer_type_to_yojson x.type_));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
    ]

let list_statements_response_to_yojson (x : list_statements_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
      ("Statements", option_to_yojson statement_list_to_yojson x.statements);
    ]

let list_statements_request_to_yojson (x : list_statements_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("SessionId", Some (name_string_to_yojson x.session_id));
    ]

let list_sessions_response_to_yojson (x : list_sessions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
      ("Sessions", option_to_yojson session_list_to_yojson x.sessions);
      ("Ids", option_to_yojson session_id_list_to_yojson x.ids);
    ]

let list_sessions_request_to_yojson (x : list_sessions_request) =
  assoc_to_yojson
    [
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson orchestration_token_to_yojson x.next_token);
    ]

let list_schemas_response_to_yojson (x : list_schemas_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
      ("Schemas", option_to_yojson schema_list_definition_to_yojson x.schemas);
    ]

let list_schemas_input_to_yojson (x : list_schemas_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
      ("RegistryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let list_schema_versions_response_to_yojson (x : list_schema_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
      ("Schemas", option_to_yojson schema_version_list_to_yojson x.schemas);
    ]

let list_schema_versions_input_to_yojson (x : list_schema_versions_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
    ]

let list_registries_response_to_yojson (x : list_registries_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
      ("Registries", option_to_yojson registry_list_definition_to_yojson x.registries);
    ]

let list_registries_input_to_yojson (x : list_registries_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson schema_registry_token_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_number_to_yojson x.max_results);
    ]

let list_materialized_view_refresh_task_runs_response_to_yojson
    (x : list_materialized_view_refresh_task_runs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "MaterializedViewRefreshTaskRuns",
        option_to_yojson materialized_view_refresh_task_runs_list_to_yojson
          x.materialized_view_refresh_task_runs );
    ]

let list_materialized_view_refresh_task_runs_request_to_yojson
    (x : list_materialized_view_refresh_task_runs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("CatalogId", Some (name_string_to_yojson x.catalog_id));
    ]

let list_ml_transforms_response_to_yojson (x : list_ml_transforms_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("TransformIds", Some (transform_id_list_to_yojson x.transform_ids));
    ]

let list_ml_transforms_request_to_yojson (x : list_ml_transforms_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("Sort", option_to_yojson transform_sort_criteria_to_yojson x.sort);
      ("Filter", option_to_yojson transform_filter_criteria_to_yojson x.filter);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let job_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let list_jobs_response_to_yojson (x : list_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("JobNames", option_to_yojson job_name_list_to_yojson x.job_names);
    ]

let list_jobs_request_to_yojson (x : list_jobs_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let item_id_to_yojson = string_to_yojson
let item_name_to_yojson = string_to_yojson
let item_description_to_yojson = string_to_yojson
let glossary_term_id_list_to_yojson tree = list_to_yojson glossary_term_id_to_yojson tree

let iterable_form_list_item_to_yojson (x : iterable_form_list_item) =
  assoc_to_yojson
    [
      ("GlossaryTerms", option_to_yojson glossary_term_id_list_to_yojson x.glossary_terms);
      ("Description", option_to_yojson item_description_to_yojson x.description);
      ("ItemName", option_to_yojson item_name_to_yojson x.item_name);
      ("ItemId", option_to_yojson item_id_to_yojson x.item_id);
    ]

let iterable_form_list_item_list_to_yojson tree =
  list_to_yojson iterable_form_list_item_to_yojson tree

let list_iterable_forms_response_to_yojson (x : list_iterable_forms_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Items", option_to_yojson iterable_form_list_item_list_to_yojson x.items);
    ]

let list_iterable_forms_request_to_yojson (x : list_iterable_forms_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("IterableFormName", Some (iterable_form_name_to_yojson x.iterable_form_name));
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
    ]

let integration_resource_property_to_yojson (x : integration_resource_property) =
  assoc_to_yojson
    [
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ("ResourcePropertyArn", option_to_yojson string512_to_yojson x.resource_property_arn);
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
    ]

let integration_resource_property_list_to_yojson tree =
  list_to_yojson integration_resource_property_to_yojson tree

let list_integration_resource_properties_response_to_yojson
    (x : list_integration_resource_properties_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string1024_to_yojson x.marker);
      ( "IntegrationResourcePropertyList",
        option_to_yojson integration_resource_property_list_to_yojson
          x.integration_resource_property_list );
    ]

let integration_resource_property_filter_values_to_yojson tree =
  list_to_yojson string128_to_yojson tree

let integration_resource_property_filter_to_yojson (x : integration_resource_property_filter) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson integration_resource_property_filter_values_to_yojson x.values);
      ("Name", option_to_yojson string128_to_yojson x.name);
    ]

let integration_resource_property_filter_list_to_yojson tree =
  list_to_yojson integration_resource_property_filter_to_yojson tree

let integration_integer_to_yojson = int_to_yojson

let list_integration_resource_properties_request_to_yojson
    (x : list_integration_resource_properties_request) =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integration_integer_to_yojson x.max_records);
      ("Filters", option_to_yojson integration_resource_property_filter_list_to_yojson x.filters);
      ("Marker", option_to_yojson string1024_to_yojson x.marker);
    ]

let glossary_term_item_to_yojson (x : glossary_term_item) =
  assoc_to_yojson
    [
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
      ("Name", option_to_yojson glossary_term_name_to_yojson x.name);
      ("Id", option_to_yojson glossary_term_id_to_yojson x.id);
    ]

let glossary_term_item_list_to_yojson tree = list_to_yojson glossary_term_item_to_yojson tree

let list_glossary_terms_response_to_yojson (x : list_glossary_terms_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Items", option_to_yojson glossary_term_item_list_to_yojson x.items);
    ]

let list_glossary_terms_request_to_yojson (x : list_glossary_terms_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("GlossaryIdentifier", Some (glossary_id_to_yojson x.glossary_identifier));
    ]

let glossary_item_to_yojson (x : glossary_item) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
      ("Name", option_to_yojson glossary_name_to_yojson x.name);
      ("Id", option_to_yojson glossary_id_to_yojson x.id);
    ]

let glossary_item_list_to_yojson tree = list_to_yojson glossary_item_to_yojson tree

let list_glossaries_response_to_yojson (x : list_glossaries_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Items", option_to_yojson glossary_item_list_to_yojson x.items);
    ]

let list_glossaries_request_to_yojson (x : list_glossaries_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let form_type_item_to_yojson (x : form_type_item) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson form_type_name_to_yojson x.name);
      ("Id", option_to_yojson form_type_id_to_yojson x.id);
    ]

let form_type_item_list_to_yojson tree = list_to_yojson form_type_item_to_yojson tree

let list_form_types_response_to_yojson (x : list_form_types_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Items", Some (form_type_item_list_to_yojson x.items));
    ]

let list_form_types_request_to_yojson (x : list_form_types_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let entity_name_to_yojson = string_to_yojson
let entity_label_to_yojson = string_to_yojson
let is_parent_entity_to_yojson = bool_to_yojson
let entity_description_to_yojson = string_to_yojson
let category_to_yojson = string_to_yojson

let custom_properties_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("CustomProperties", option_to_yojson custom_properties_to_yojson x.custom_properties);
      ("Category", option_to_yojson category_to_yojson x.category);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("IsParentEntity", option_to_yojson is_parent_entity_to_yojson x.is_parent_entity);
      ("Label", option_to_yojson entity_label_to_yojson x.label);
      ("EntityName", option_to_yojson entity_name_to_yojson x.entity_name);
    ]

let entity_list_to_yojson tree = list_to_yojson entity_to_yojson tree

let list_entities_response_to_yojson (x : list_entities_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Entities", option_to_yojson entity_list_to_yojson x.entities);
    ]

let api_version_to_yojson = string_to_yojson

let list_entities_request_to_yojson (x : list_entities_request) =
  assoc_to_yojson
    [
      ("DataStoreApiVersion", option_to_yojson api_version_to_yojson x.data_store_api_version);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ParentEntityName", option_to_yojson entity_name_to_yojson x.parent_entity_name);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
    ]

let dev_endpoint_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let list_dev_endpoints_response_to_yojson (x : list_dev_endpoints_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("DevEndpointNames", option_to_yojson dev_endpoint_name_list_to_yojson x.dev_endpoint_names);
    ]

let list_dev_endpoints_request_to_yojson (x : list_dev_endpoints_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let list_data_quality_statistics_response_to_yojson (x : list_data_quality_statistics_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Statistics", option_to_yojson statistic_summary_list_to_yojson x.statistics);
    ]

let list_data_quality_statistics_request_to_yojson (x : list_data_quality_statistics_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("TimestampFilter", option_to_yojson timestamp_filter_to_yojson x.timestamp_filter);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
    ]

let annotation_list_to_yojson tree = list_to_yojson statistic_annotation_to_yojson tree

let list_data_quality_statistic_annotations_response_to_yojson
    (x : list_data_quality_statistic_annotations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Annotations", option_to_yojson annotation_list_to_yojson x.annotations);
    ]

let list_data_quality_statistic_annotations_request_to_yojson
    (x : list_data_quality_statistic_annotations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("TimestampFilter", option_to_yojson timestamp_filter_to_yojson x.timestamp_filter);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
    ]

let data_quality_target_table_to_yojson (x : data_quality_target_table) =
  assoc_to_yojson
    [
      ("CatalogId", option_to_yojson name_string_to_yojson x.catalog_id);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
    ]

let data_quality_ruleset_list_details_to_yojson (x : data_quality_ruleset_list_details) =
  assoc_to_yojson
    [
      ("RuleCount", option_to_yojson nullable_integer_to_yojson x.rule_count);
      ("RecommendationRunId", option_to_yojson hash_string_to_yojson x.recommendation_run_id);
      ("TargetTable", option_to_yojson data_quality_target_table_to_yojson x.target_table);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("CreatedOn", option_to_yojson timestamp_to_yojson x.created_on);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let data_quality_ruleset_list_to_yojson tree =
  list_to_yojson data_quality_ruleset_list_details_to_yojson tree

let list_data_quality_rulesets_response_to_yojson (x : list_data_quality_rulesets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Rulesets", option_to_yojson data_quality_ruleset_list_to_yojson x.rulesets);
    ]

let data_quality_ruleset_filter_criteria_to_yojson (x : data_quality_ruleset_filter_criteria) =
  assoc_to_yojson
    [
      ("TargetTable", option_to_yojson data_quality_target_table_to_yojson x.target_table);
      ("LastModifiedAfter", option_to_yojson timestamp_to_yojson x.last_modified_after);
      ("LastModifiedBefore", option_to_yojson timestamp_to_yojson x.last_modified_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let list_data_quality_rulesets_request_to_yojson (x : list_data_quality_rulesets_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("Filter", option_to_yojson data_quality_ruleset_filter_criteria_to_yojson x.filter);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let data_quality_ruleset_evaluation_run_description_to_yojson
    (x : data_quality_ruleset_evaluation_run_description) =
  assoc_to_yojson
    [
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("RunId", option_to_yojson hash_string_to_yojson x.run_id);
    ]

let data_quality_ruleset_evaluation_run_list_to_yojson tree =
  list_to_yojson data_quality_ruleset_evaluation_run_description_to_yojson tree

let list_data_quality_ruleset_evaluation_runs_response_to_yojson
    (x : list_data_quality_ruleset_evaluation_runs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Runs", option_to_yojson data_quality_ruleset_evaluation_run_list_to_yojson x.runs);
    ]

let data_quality_ruleset_evaluation_run_filter_to_yojson
    (x : data_quality_ruleset_evaluation_run_filter) =
  assoc_to_yojson
    [
      ("RulesetName", option_to_yojson name_string_to_yojson x.ruleset_name);
      ("StartedAfter", option_to_yojson timestamp_to_yojson x.started_after);
      ("StartedBefore", option_to_yojson timestamp_to_yojson x.started_before);
      ("DataSource", Some (data_source_to_yojson x.data_source));
    ]

let list_data_quality_ruleset_evaluation_runs_request_to_yojson
    (x : list_data_quality_ruleset_evaluation_runs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Filter", option_to_yojson data_quality_ruleset_evaluation_run_filter_to_yojson x.filter);
    ]

let data_quality_rule_recommendation_run_description_to_yojson
    (x : data_quality_rule_recommendation_run_description) =
  assoc_to_yojson
    [
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("RunId", option_to_yojson hash_string_to_yojson x.run_id);
    ]

let data_quality_rule_recommendation_run_list_to_yojson tree =
  list_to_yojson data_quality_rule_recommendation_run_description_to_yojson tree

let list_data_quality_rule_recommendation_runs_response_to_yojson
    (x : list_data_quality_rule_recommendation_runs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Runs", option_to_yojson data_quality_rule_recommendation_run_list_to_yojson x.runs);
    ]

let data_quality_rule_recommendation_run_filter_to_yojson
    (x : data_quality_rule_recommendation_run_filter) =
  assoc_to_yojson
    [
      ("StartedAfter", option_to_yojson timestamp_to_yojson x.started_after);
      ("StartedBefore", option_to_yojson timestamp_to_yojson x.started_before);
      ("DataSource", Some (data_source_to_yojson x.data_source));
    ]

let list_data_quality_rule_recommendation_runs_request_to_yojson
    (x : list_data_quality_rule_recommendation_runs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Filter", option_to_yojson data_quality_rule_recommendation_run_filter_to_yojson x.filter);
    ]

let data_quality_result_description_to_yojson (x : data_quality_result_description) =
  assoc_to_yojson
    [
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("ResultId", option_to_yojson hash_string_to_yojson x.result_id);
    ]

let data_quality_result_description_list_to_yojson tree =
  list_to_yojson data_quality_result_description_to_yojson tree

let list_data_quality_results_response_to_yojson (x : list_data_quality_results_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Results", Some (data_quality_result_description_list_to_yojson x.results));
    ]

let data_quality_result_filter_criteria_to_yojson (x : data_quality_result_filter_criteria) =
  assoc_to_yojson
    [
      ("StartedBefore", option_to_yojson timestamp_to_yojson x.started_before);
      ("StartedAfter", option_to_yojson timestamp_to_yojson x.started_after);
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
    ]

let list_data_quality_results_request_to_yojson (x : list_data_quality_results_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Filter", option_to_yojson data_quality_result_filter_criteria_to_yojson x.filter);
    ]

let context_words_to_yojson tree = list_to_yojson name_string_to_yojson tree

let custom_entity_type_to_yojson (x : custom_entity_type) =
  assoc_to_yojson
    [
      ("ContextWords", option_to_yojson context_words_to_yojson x.context_words);
      ("RegexString", Some (name_string_to_yojson x.regex_string));
      ("Name", Some (name_string_to_yojson x.name));
    ]

let custom_entity_types_to_yojson tree = list_to_yojson custom_entity_type_to_yojson tree

let list_custom_entity_types_response_to_yojson (x : list_custom_entity_types_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("CustomEntityTypes", option_to_yojson custom_entity_types_to_yojson x.custom_entity_types);
    ]

let list_custom_entity_types_request_to_yojson (x : list_custom_entity_types_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let crawl_id_to_yojson = string_to_yojson

let crawler_history_state_to_yojson (x : crawler_history_state) =
  match x with
  | STOPPED -> `String "STOPPED"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | RUNNING -> `String "RUNNING"

let crawler_history_to_yojson (x : crawler_history) =
  assoc_to_yojson
    [
      ("DPUHour", option_to_yojson non_negative_double_to_yojson x.dpu_hour);
      ("MessagePrefix", option_to_yojson message_prefix_to_yojson x.message_prefix);
      ("LogStream", option_to_yojson log_stream_to_yojson x.log_stream);
      ("LogGroup", option_to_yojson log_group_to_yojson x.log_group);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("Summary", option_to_yojson name_string_to_yojson x.summary);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("State", option_to_yojson crawler_history_state_to_yojson x.state);
      ("CrawlId", option_to_yojson crawl_id_to_yojson x.crawl_id);
    ]

let crawler_history_list_to_yojson tree = list_to_yojson crawler_history_to_yojson tree

let list_crawls_response_to_yojson (x : list_crawls_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Crawls", option_to_yojson crawler_history_list_to_yojson x.crawls);
    ]

let field_name_to_yojson (x : field_name) =
  match x with
  | DPU_HOUR -> `String "DPU_HOUR"
  | END_TIME -> `String "END_TIME"
  | START_TIME -> `String "START_TIME"
  | STATE -> `String "STATE"
  | CRAWL_ID -> `String "CRAWL_ID"

let filter_operator_to_yojson (x : filter_operator) =
  match x with
  | NE -> `String "NE"
  | EQ -> `String "EQ"
  | LE -> `String "LE"
  | LT -> `String "LT"
  | GE -> `String "GE"
  | GT -> `String "GT"

let crawls_filter_to_yojson (x : crawls_filter) =
  assoc_to_yojson
    [
      ("FieldValue", option_to_yojson generic_string_to_yojson x.field_value);
      ("FilterOperator", option_to_yojson filter_operator_to_yojson x.filter_operator);
      ("FieldName", option_to_yojson field_name_to_yojson x.field_name);
    ]

let crawls_filter_list_to_yojson tree = list_to_yojson crawls_filter_to_yojson tree

let list_crawls_request_to_yojson (x : list_crawls_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Filters", option_to_yojson crawls_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("CrawlerName", Some (name_string_to_yojson x.crawler_name));
    ]

let crawler_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let list_crawlers_response_to_yojson (x : list_crawlers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("CrawlerNames", option_to_yojson crawler_name_list_to_yojson x.crawler_names);
    ]

let list_crawlers_request_to_yojson (x : list_crawlers_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let display_name_to_yojson = string_to_yojson
let compute_environments_to_yojson tree = list_to_yojson compute_environment_to_yojson tree

let capabilities_to_yojson (x : capabilities) =
  assoc_to_yojson
    [
      ( "SupportedComputeEnvironments",
        Some (compute_environments_to_yojson x.supported_compute_environments) );
      ("SupportedDataOperations", Some (data_operations_to_yojson x.supported_data_operations));
      ( "SupportedAuthenticationTypes",
        Some (authentication_types_to_yojson x.supported_authentication_types) );
    ]

let connection_type_variant_to_yojson (x : connection_type_variant) =
  assoc_to_yojson
    [
      ("LogoUrl", option_to_yojson url_string_to_yojson x.logo_url);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ( "ConnectionTypeVariantName",
        option_to_yojson display_name_to_yojson x.connection_type_variant_name );
    ]

let connection_type_variant_list_to_yojson tree =
  list_to_yojson connection_type_variant_to_yojson tree

let connection_type_brief_to_yojson (x : connection_type_brief) =
  assoc_to_yojson
    [
      ( "ConnectionTypeVariants",
        option_to_yojson connection_type_variant_list_to_yojson x.connection_type_variants );
      ("LogoUrl", option_to_yojson url_string_to_yojson x.logo_url);
      ("Capabilities", option_to_yojson capabilities_to_yojson x.capabilities);
      ("Categories", option_to_yojson list_of_string_to_yojson x.categories);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Vendor", option_to_yojson vendor_to_yojson x.vendor);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
    ]

let connection_type_list_to_yojson tree = list_to_yojson connection_type_brief_to_yojson tree

let list_connection_types_response_to_yojson (x : list_connection_types_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ConnectionTypes", option_to_yojson connection_type_list_to_yojson x.connection_types);
    ]

let list_connection_types_request_to_yojson (x : list_connection_types_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let column_statistics_task_run_id_list_to_yojson tree = list_to_yojson hash_string_to_yojson tree

let list_column_statistics_task_runs_response_to_yojson
    (x : list_column_statistics_task_runs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "ColumnStatisticsTaskRunIds",
        option_to_yojson column_statistics_task_run_id_list_to_yojson
          x.column_statistics_task_run_ids );
    ]

let list_column_statistics_task_runs_request_to_yojson
    (x : list_column_statistics_task_runs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let blueprint_names_to_yojson tree = list_to_yojson orchestration_name_string_to_yojson tree

let list_blueprints_response_to_yojson (x : list_blueprints_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Blueprints", option_to_yojson blueprint_names_to_yojson x.blueprints);
    ]

let list_blueprints_request_to_yojson (x : list_blueprints_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("MaxResults", option_to_yojson orchestration_page_size25_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let asset_type_item_to_yojson (x : asset_type_item) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson asset_type_name_to_yojson x.name);
      ("Id", option_to_yojson asset_type_id_to_yojson x.id);
    ]

let asset_type_item_list_to_yojson tree = list_to_yojson asset_type_item_to_yojson tree

let list_asset_types_response_to_yojson (x : list_asset_types_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Items", option_to_yojson asset_type_item_list_to_yojson x.items);
    ]

let list_asset_types_request_to_yojson (x : list_asset_types_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let limit_to_yojson = long_to_yojson

let last_crawl_status_to_yojson (x : last_crawl_status) =
  match x with
  | FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"
  | SUCCEEDED -> `String "SUCCEEDED"

let last_crawl_info_to_yojson (x : last_crawl_info) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("MessagePrefix", option_to_yojson message_prefix_to_yojson x.message_prefix);
      ("LogStream", option_to_yojson log_stream_to_yojson x.log_stream);
      ("LogGroup", option_to_yojson log_group_to_yojson x.log_group);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("Status", option_to_yojson last_crawl_status_to_yojson x.status);
    ]

let blueprint_parameter_spec_to_yojson = string_to_yojson

let last_active_definition_to_yojson (x : last_active_definition) =
  assoc_to_yojson
    [
      ( "BlueprintServiceLocation",
        option_to_yojson generic_string_to_yojson x.blueprint_service_location );
      ("BlueprintLocation", option_to_yojson generic_string_to_yojson x.blueprint_location);
      ("ParameterSpec", option_to_yojson blueprint_parameter_spec_to_yojson x.parameter_spec);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("Description", option_to_yojson generic512_char_string_to_yojson x.description);
    ]

let language_to_yojson (x : language) =
  match x with SCALA -> `String "SCALA" | PYTHON -> `String "PYTHON"

let labels_to_yojson tree = map_to_yojson name_string_to_yojson name_string_to_yojson tree

let kms_key_not_accessible_fault_to_yojson (x : kms_key_not_accessible_fault) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let json_classifier_to_yojson (x : json_classifier) =
  assoc_to_yojson
    [
      ("JsonPath", Some (json_path_to_yojson x.json_path));
      ("Version", option_to_yojson version_id_to_yojson x.version);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let job_to_yojson (x : job) =
  assoc_to_yojson
    [
      ("ProfileName", option_to_yojson name_string_to_yojson x.profile_name);
      ("MaintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "SourceControlDetails",
        option_to_yojson source_control_details_to_yojson x.source_control_details );
      ("ExecutionClass", option_to_yojson execution_class_to_yojson x.execution_class);
      ( "CodeGenConfigurationNodes",
        option_to_yojson code_gen_configuration_nodes_to_yojson x.code_gen_configuration_nodes );
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("AllocatedCapacity", option_to_yojson integer_value_to_yojson x.allocated_capacity);
      ("MaxRetries", option_to_yojson max_retries_to_yojson x.max_retries);
      ("Connections", option_to_yojson connections_list_to_yojson x.connections);
      ("NonOverridableArguments", option_to_yojson generic_map_to_yojson x.non_overridable_arguments);
      ("DefaultArguments", option_to_yojson generic_map_to_yojson x.default_arguments);
      ("Command", option_to_yojson job_command_to_yojson x.command);
      ("ExecutionProperty", option_to_yojson execution_property_to_yojson x.execution_property);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("LogUri", option_to_yojson uri_string_to_yojson x.log_uri);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("JobRunQueuingEnabled", option_to_yojson nullable_boolean_to_yojson x.job_run_queuing_enabled);
      ("JobMode", option_to_yojson job_mode_to_yojson x.job_mode);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let job_list_to_yojson tree = list_to_yojson job_to_yojson tree

let iterable_form_entry_to_yojson (x : iterable_form_entry) =
  assoc_to_yojson [ ("FormTypeId", option_to_yojson form_type_id_to_yojson x.form_type_id) ]

let iterable_form_key_to_yojson = string_to_yojson

let iterable_form_map_to_yojson tree =
  map_to_yojson iterable_form_key_to_yojson iterable_form_entry_to_yojson tree

let iterable_form_item_to_yojson (x : iterable_form_item) =
  assoc_to_yojson
    [
      ("Attachments", option_to_yojson asset_form_map_to_yojson x.attachments);
      ("Forms", option_to_yojson asset_form_map_to_yojson x.forms);
      ("GlossaryTerms", option_to_yojson glossary_term_id_list_to_yojson x.glossary_terms);
      ("ItemName", option_to_yojson item_name_to_yojson x.item_name);
      ("ItemId", option_to_yojson item_id_to_yojson x.item_id);
    ]

let iterable_form_item_list_to_yojson tree = list_to_yojson iterable_form_item_to_yojson tree
let item_identifier_list_to_yojson tree = list_to_yojson item_identifier_to_yojson tree
let item_error_message_to_yojson = string_to_yojson
let item_error_code_to_yojson = string_to_yojson

let item_error_to_yojson (x : item_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson item_error_message_to_yojson x.message);
      ("Code", option_to_yojson item_error_code_to_yojson x.code);
      ("ItemIdentifier", option_to_yojson item_identifier_to_yojson x.item_identifier);
    ]

let item_error_list_to_yojson tree = list_to_yojson item_error_to_yojson tree
let is_version_valid_to_yojson = bool_to_yojson

let integration_to_yojson (x : integration) =
  assoc_to_yojson
    [
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
      ("Errors", option_to_yojson integration_error_list_to_yojson x.errors);
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
      ("CreateTime", Some (integration_timestamp_to_yojson x.create_time));
      ("Status", Some (integration_status_to_yojson x.status));
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
      ( "AdditionalEncryptionContext",
        option_to_yojson integration_additional_encryption_context_map_to_yojson
          x.additional_encryption_context );
      ("KmsKeyId", option_to_yojson string2048_to_yojson x.kms_key_id);
      ("IntegrationArn", Some (string128_to_yojson x.integration_arn));
      ("IntegrationName", Some (string128_to_yojson x.integration_name));
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("SourceArn", Some (string512_to_yojson x.source_arn));
    ]

let integrations_list_to_yojson tree = list_to_yojson integration_to_yojson tree

let integration_quota_exceeded_fault_to_yojson (x : integration_quota_exceeded_fault) =
  assoc_to_yojson [ ("Message", option_to_yojson integration_error_message_to_yojson x.message) ]

let integration_filter_values_to_yojson tree = list_to_yojson string128_to_yojson tree

let integration_filter_to_yojson (x : integration_filter) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson integration_filter_values_to_yojson x.values);
      ("Name", option_to_yojson string128_to_yojson x.name);
    ]

let integration_filter_list_to_yojson tree = list_to_yojson integration_filter_to_yojson tree

let datapoint_inclusion_annotation_to_yojson (x : datapoint_inclusion_annotation) =
  assoc_to_yojson
    [
      ( "InclusionAnnotation",
        option_to_yojson inclusion_annotation_value_to_yojson x.inclusion_annotation );
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
    ]

let inclusion_annotation_list_to_yojson tree =
  list_to_yojson datapoint_inclusion_annotation_to_yojson tree

let inbound_integration_to_yojson (x : inbound_integration) =
  assoc_to_yojson
    [
      ("Errors", option_to_yojson integration_error_list_to_yojson x.errors);
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
      ("CreateTime", Some (integration_timestamp_to_yojson x.create_time));
      ("Status", Some (integration_status_to_yojson x.status));
      ("IntegrationArn", Some (string128_to_yojson x.integration_arn));
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("SourceArn", Some (string512_to_yojson x.source_arn));
    ]

let inbound_integrations_list_to_yojson tree = list_to_yojson inbound_integration_to_yojson tree
let import_catalog_to_glue_response_to_yojson = unit_to_yojson

let import_catalog_to_glue_request_to_yojson (x : import_catalog_to_glue_request) =
  assoc_to_yojson [ ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id) ]

let identity_center_instance_arn_to_yojson = string_to_yojson

let iceberg_optimization_properties_output_to_yojson (x : iceberg_optimization_properties_output) =
  assoc_to_yojson
    [
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("OrphanFileDeletion", option_to_yojson parameters_map_to_yojson x.orphan_file_deletion);
      ("Retention", option_to_yojson parameters_map_to_yojson x.retention);
      ("Compaction", option_to_yojson parameters_map_to_yojson x.compaction);
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
    ]

let grok_classifier_to_yojson (x : grok_classifier) =
  assoc_to_yojson
    [
      ("CustomPatterns", option_to_yojson custom_patterns_to_yojson x.custom_patterns);
      ("GrokPattern", Some (grok_pattern_to_yojson x.grok_pattern));
      ("Version", option_to_yojson version_id_to_yojson x.version);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Classification", Some (classification_to_yojson x.classification));
      ("Name", Some (name_string_to_yojson x.name));
    ]

let glue_resource_type_to_yojson (x : glue_resource_type) =
  match x with SESSION -> `String "SESSION" | JOB -> `String "JOB"

let glue_policy_to_yojson (x : glue_policy) =
  assoc_to_yojson
    [
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("PolicyHash", option_to_yojson hash_string_to_yojson x.policy_hash);
      ("PolicyInJson", option_to_yojson policy_json_string_to_yojson x.policy_in_json);
    ]

let get_workflow_runs_response_to_yojson (x : get_workflow_runs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Runs", option_to_yojson workflow_runs_to_yojson x.runs);
    ]

let get_workflow_runs_request_to_yojson (x : get_workflow_runs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("IncludeGraph", option_to_yojson nullable_boolean_to_yojson x.include_graph);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let get_workflow_run_response_to_yojson (x : get_workflow_run_response) =
  assoc_to_yojson [ ("Run", option_to_yojson workflow_run_to_yojson x.run) ]

let get_workflow_run_request_to_yojson (x : get_workflow_run_request) =
  assoc_to_yojson
    [
      ("IncludeGraph", option_to_yojson nullable_boolean_to_yojson x.include_graph);
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("Name", Some (name_string_to_yojson x.name));
    ]

let get_workflow_run_properties_response_to_yojson (x : get_workflow_run_properties_response) =
  assoc_to_yojson
    [ ("RunProperties", option_to_yojson workflow_run_properties_to_yojson x.run_properties) ]

let get_workflow_run_properties_request_to_yojson (x : get_workflow_run_properties_request) =
  assoc_to_yojson
    [
      ("RunId", Some (id_string_to_yojson x.run_id)); ("Name", Some (name_string_to_yojson x.name));
    ]

let get_workflow_response_to_yojson (x : get_workflow_response) =
  assoc_to_yojson [ ("Workflow", option_to_yojson workflow_to_yojson x.workflow) ]

let get_workflow_request_to_yojson (x : get_workflow_request) =
  assoc_to_yojson
    [
      ("IncludeGraph", option_to_yojson nullable_boolean_to_yojson x.include_graph);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let get_user_defined_functions_response_to_yojson (x : get_user_defined_functions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "UserDefinedFunctions",
        option_to_yojson user_defined_function_list_to_yojson x.user_defined_functions );
    ]

let catalog_getter_page_size_to_yojson = int_to_yojson

let get_user_defined_functions_request_to_yojson (x : get_user_defined_functions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson catalog_getter_page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("FunctionType", option_to_yojson function_type_to_yojson x.function_type);
      ("Pattern", Some (name_string_to_yojson x.pattern));
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_user_defined_function_response_to_yojson (x : get_user_defined_function_response) =
  assoc_to_yojson
    [
      ( "UserDefinedFunction",
        option_to_yojson user_defined_function_to_yojson x.user_defined_function );
    ]

let get_user_defined_function_request_to_yojson (x : get_user_defined_function_request) =
  assoc_to_yojson
    [
      ("FunctionName", Some (name_string_to_yojson x.function_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_usage_profile_response_to_yojson (x : get_usage_profile_response) =
  assoc_to_yojson
    [
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("Configuration", option_to_yojson profile_configuration_to_yojson x.configuration);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let get_usage_profile_request_to_yojson (x : get_usage_profile_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let column_row_filter_to_yojson (x : column_row_filter) =
  assoc_to_yojson
    [
      ("RowFilterExpression", option_to_yojson predicate_string_to_yojson x.row_filter_expression);
      ("ColumnName", option_to_yojson name_string_to_yojson x.column_name);
    ]

let column_row_filter_list_to_yojson tree = list_to_yojson column_row_filter_to_yojson tree

let get_unfiltered_table_metadata_response_to_yojson (x : get_unfiltered_table_metadata_response) =
  assoc_to_yojson
    [
      ("RowFilter", option_to_yojson predicate_string_to_yojson x.row_filter);
      ("Permissions", option_to_yojson permission_list_to_yojson x.permissions);
      ("IsProtected", option_to_yojson boolean__to_yojson x.is_protected);
      ("ResourceArn", option_to_yojson arn_string_to_yojson x.resource_arn);
      ("IsMaterializedView", option_to_yojson boolean__to_yojson x.is_materialized_view);
      ("IsMultiDialectView", option_to_yojson boolean__to_yojson x.is_multi_dialect_view);
      ("QueryAuthorizationId", option_to_yojson hash_string_to_yojson x.query_authorization_id);
      ("CellFilters", option_to_yojson column_row_filter_list_to_yojson x.cell_filters);
      ( "IsRegisteredWithLakeFormation",
        option_to_yojson boolean__to_yojson x.is_registered_with_lake_formation );
      ("AuthorizedColumns", option_to_yojson name_string_list_to_yojson x.authorized_columns);
      ("Table", option_to_yojson table_to_yojson x.table);
    ]

let audit_context_string_to_yojson = string_to_yojson
let audit_column_names_list_to_yojson tree = list_to_yojson column_name_string_to_yojson tree

let audit_context_to_yojson (x : audit_context) =
  assoc_to_yojson
    [
      ("AllColumnsRequested", option_to_yojson nullable_boolean_to_yojson x.all_columns_requested);
      ("RequestedColumns", option_to_yojson audit_column_names_list_to_yojson x.requested_columns);
      ( "AdditionalAuditContext",
        option_to_yojson audit_context_string_to_yojson x.additional_audit_context );
    ]

let get_unfiltered_table_metadata_request_to_yojson (x : get_unfiltered_table_metadata_request) =
  assoc_to_yojson
    [
      ( "QuerySessionContext",
        option_to_yojson query_session_context_to_yojson x.query_session_context );
      ("Permissions", option_to_yojson permission_list_to_yojson x.permissions);
      ("SupportedDialect", option_to_yojson supported_dialect_to_yojson x.supported_dialect);
      ("RootResourceArn", option_to_yojson arn_string_to_yojson x.root_resource_arn);
      ("ParentResourceArn", option_to_yojson arn_string_to_yojson x.parent_resource_arn);
      ( "SupportedPermissionTypes",
        Some (permission_type_list_to_yojson x.supported_permission_types) );
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("Name", Some (name_string_to_yojson x.name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("Region", option_to_yojson value_string_to_yojson x.region);
    ]

let get_unfiltered_partitions_metadata_response_to_yojson
    (x : get_unfiltered_partitions_metadata_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "UnfilteredPartitions",
        option_to_yojson unfiltered_partition_list_to_yojson x.unfiltered_partitions );
    ]

let get_unfiltered_partitions_metadata_request_to_yojson
    (x : get_unfiltered_partitions_metadata_request) =
  assoc_to_yojson
    [
      ( "QuerySessionContext",
        option_to_yojson query_session_context_to_yojson x.query_session_context );
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Segment", option_to_yojson segment_to_yojson x.segment);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "SupportedPermissionTypes",
        Some (permission_type_list_to_yojson x.supported_permission_types) );
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("Expression", option_to_yojson predicate_string_to_yojson x.expression);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("Region", option_to_yojson value_string_to_yojson x.region);
    ]

let get_unfiltered_partition_metadata_response_to_yojson
    (x : get_unfiltered_partition_metadata_response) =
  assoc_to_yojson
    [
      ( "IsRegisteredWithLakeFormation",
        option_to_yojson boolean__to_yojson x.is_registered_with_lake_formation );
      ("AuthorizedColumns", option_to_yojson name_string_list_to_yojson x.authorized_columns);
      ("Partition", option_to_yojson partition_to_yojson x.partition);
    ]

let get_unfiltered_partition_metadata_request_to_yojson
    (x : get_unfiltered_partition_metadata_request) =
  assoc_to_yojson
    [
      ( "QuerySessionContext",
        option_to_yojson query_session_context_to_yojson x.query_session_context );
      ( "SupportedPermissionTypes",
        Some (permission_type_list_to_yojson x.supported_permission_types) );
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
      ("Region", option_to_yojson value_string_to_yojson x.region);
    ]

let get_triggers_response_to_yojson (x : get_triggers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Triggers", option_to_yojson trigger_list_to_yojson x.triggers);
    ]

let get_triggers_request_to_yojson (x : get_triggers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson orchestration_page_size200_to_yojson x.max_results);
      ("DependentJobName", option_to_yojson name_string_to_yojson x.dependent_job_name);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let get_trigger_response_to_yojson (x : get_trigger_response) =
  assoc_to_yojson [ ("Trigger", option_to_yojson trigger_to_yojson x.trigger) ]

let get_trigger_request_to_yojson (x : get_trigger_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let get_tags_response_to_yojson (x : get_tags_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_map_to_yojson x.tags) ]

let get_tags_request_to_yojson (x : get_tags_request) =
  assoc_to_yojson [ ("ResourceArn", Some (glue_resource_arn_to_yojson x.resource_arn)) ]

let get_tables_response_to_yojson (x : get_tables_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("TableList", option_to_yojson table_list_to_yojson x.table_list);
    ]

let filter_string_to_yojson = string_to_yojson

let get_tables_request_to_yojson (x : get_tables_request) =
  assoc_to_yojson
    [
      ("AttributesToGet", option_to_yojson table_attributes_list_to_yojson x.attributes_to_get);
      ("IncludeStatusDetails", option_to_yojson boolean_nullable_to_yojson x.include_status_details);
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("QueryAsOfTime", option_to_yojson timestamp_to_yojson x.query_as_of_time);
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ("MaxResults", option_to_yojson catalog_getter_page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Expression", option_to_yojson filter_string_to_yojson x.expression);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_table_versions_list_to_yojson tree = list_to_yojson table_version_to_yojson tree

let get_table_versions_response_to_yojson (x : get_table_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("TableVersions", option_to_yojson get_table_versions_list_to_yojson x.table_versions);
    ]

let get_table_versions_request_to_yojson (x : get_table_versions_request) =
  assoc_to_yojson
    [
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("MaxResults", option_to_yojson catalog_getter_page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_table_version_response_to_yojson (x : get_table_version_response) =
  assoc_to_yojson [ ("TableVersion", option_to_yojson table_version_to_yojson x.table_version) ]

let get_table_version_request_to_yojson (x : get_table_version_request) =
  assoc_to_yojson
    [
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("VersionId", option_to_yojson version_string_to_yojson x.version_id);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_table_response_to_yojson (x : get_table_response) =
  assoc_to_yojson [ ("Table", option_to_yojson table_to_yojson x.table) ]

let get_table_request_to_yojson (x : get_table_request) =
  assoc_to_yojson
    [
      ("AttributesToGet", option_to_yojson table_attributes_list_to_yojson x.attributes_to_get);
      ("IncludeStatusDetails", option_to_yojson boolean_nullable_to_yojson x.include_status_details);
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("QueryAsOfTime", option_to_yojson timestamp_to_yojson x.query_as_of_time);
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ("Name", Some (name_string_to_yojson x.name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_table_optimizer_response_to_yojson (x : get_table_optimizer_response) =
  assoc_to_yojson
    [
      ("TableOptimizer", option_to_yojson table_optimizer_to_yojson x.table_optimizer);
      ("TableName", option_to_yojson name_string_to_yojson x.table_name);
      ("DatabaseName", option_to_yojson name_string_to_yojson x.database_name);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_table_optimizer_request_to_yojson (x : get_table_optimizer_request) =
  assoc_to_yojson
    [
      ("Type", Some (table_optimizer_type_to_yojson x.type_));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
    ]

let get_statement_response_to_yojson (x : get_statement_response) =
  assoc_to_yojson [ ("Statement", option_to_yojson statement_to_yojson x.statement) ]

let get_statement_request_to_yojson (x : get_statement_request) =
  assoc_to_yojson
    [
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("Id", Some (integer_value_to_yojson x.id));
      ("SessionId", Some (name_string_to_yojson x.session_id));
    ]

let get_session_response_to_yojson (x : get_session_response) =
  assoc_to_yojson [ ("Session", option_to_yojson session_to_yojson x.session) ]

let get_session_request_to_yojson (x : get_session_request) =
  assoc_to_yojson
    [
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("Id", Some (name_string_to_yojson x.id));
    ]

let get_session_endpoint_response_to_yojson (x : get_session_endpoint_response) =
  assoc_to_yojson [ ("SparkConnect", Some (session_endpoint_to_yojson x.spark_connect)) ]

let get_session_endpoint_request_to_yojson (x : get_session_endpoint_request) =
  assoc_to_yojson [ ("SessionId", Some (name_string_to_yojson x.session_id)) ]

let get_security_configurations_response_to_yojson (x : get_security_configurations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ( "SecurityConfigurations",
        option_to_yojson security_configuration_list_to_yojson x.security_configurations );
    ]

let get_security_configurations_request_to_yojson (x : get_security_configurations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let get_security_configuration_response_to_yojson (x : get_security_configuration_response) =
  assoc_to_yojson
    [
      ( "SecurityConfiguration",
        option_to_yojson security_configuration_to_yojson x.security_configuration );
    ]

let get_security_configuration_request_to_yojson (x : get_security_configuration_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let get_schema_versions_diff_response_to_yojson (x : get_schema_versions_diff_response) =
  assoc_to_yojson [ ("Diff", option_to_yojson schema_definition_diff_to_yojson x.diff) ]

let get_schema_versions_diff_input_to_yojson (x : get_schema_versions_diff_input) =
  assoc_to_yojson
    [
      ("SchemaDiffType", Some (schema_diff_type_to_yojson x.schema_diff_type));
      ( "SecondSchemaVersionNumber",
        Some (schema_version_number_to_yojson x.second_schema_version_number) );
      ( "FirstSchemaVersionNumber",
        Some (schema_version_number_to_yojson x.first_schema_version_number) );
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
    ]

let data_format_to_yojson (x : data_format) =
  match x with PROTOBUF -> `String "PROTOBUF" | JSON -> `String "JSON" | AVRO -> `String "AVRO"

let get_schema_version_response_to_yojson (x : get_schema_version_response) =
  assoc_to_yojson
    [
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("Status", option_to_yojson schema_version_status_to_yojson x.status);
      ("VersionNumber", option_to_yojson version_long_number_to_yojson x.version_number);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("DataFormat", option_to_yojson data_format_to_yojson x.data_format);
      ("SchemaDefinition", option_to_yojson schema_definition_string_to_yojson x.schema_definition);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
    ]

let get_schema_version_input_to_yojson (x : get_schema_version_input) =
  assoc_to_yojson
    [
      ( "SchemaVersionNumber",
        option_to_yojson schema_version_number_to_yojson x.schema_version_number );
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("SchemaId", option_to_yojson schema_id_to_yojson x.schema_id);
    ]

let get_schema_response_to_yojson (x : get_schema_response) =
  assoc_to_yojson
    [
      ("UpdatedTime", option_to_yojson updated_timestamp_to_yojson x.updated_time);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("SchemaStatus", option_to_yojson schema_status_to_yojson x.schema_status);
      ("NextSchemaVersion", option_to_yojson version_long_number_to_yojson x.next_schema_version);
      ("LatestSchemaVersion", option_to_yojson version_long_number_to_yojson x.latest_schema_version);
      ("SchemaCheckpoint", option_to_yojson schema_checkpoint_number_to_yojson x.schema_checkpoint);
      ("Compatibility", option_to_yojson compatibility_to_yojson x.compatibility);
      ("DataFormat", option_to_yojson data_format_to_yojson x.data_format);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
    ]

let get_schema_input_to_yojson (x : get_schema_input) =
  assoc_to_yojson [ ("SchemaId", Some (schema_id_to_yojson x.schema_id)) ]

let get_schema_by_definition_response_to_yojson (x : get_schema_by_definition_response) =
  assoc_to_yojson
    [
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("Status", option_to_yojson schema_version_status_to_yojson x.status);
      ("DataFormat", option_to_yojson data_format_to_yojson x.data_format);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
    ]

let get_schema_by_definition_input_to_yojson (x : get_schema_by_definition_input) =
  assoc_to_yojson
    [
      ("SchemaDefinition", Some (schema_definition_string_to_yojson x.schema_definition));
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
    ]

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson
    [
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("PolicyHash", option_to_yojson hash_string_to_yojson x.policy_hash);
      ("PolicyInJson", option_to_yojson policy_json_string_to_yojson x.policy_in_json);
    ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", option_to_yojson glue_resource_arn_to_yojson x.resource_arn) ]

let get_resource_policies_response_list_to_yojson tree = list_to_yojson glue_policy_to_yojson tree

let get_resource_policies_response_to_yojson (x : get_resource_policies_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "GetResourcePoliciesResponseList",
        option_to_yojson get_resource_policies_response_list_to_yojson
          x.get_resource_policies_response_list );
    ]

let get_resource_policies_request_to_yojson (x : get_resource_policies_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let get_registry_response_to_yojson (x : get_registry_response) =
  assoc_to_yojson
    [
      ("UpdatedTime", option_to_yojson updated_timestamp_to_yojson x.updated_time);
      ("CreatedTime", option_to_yojson created_timestamp_to_yojson x.created_time);
      ("Status", option_to_yojson registry_status_to_yojson x.status);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
    ]

let get_registry_input_to_yojson (x : get_registry_input) =
  assoc_to_yojson [ ("RegistryId", Some (registry_id_to_yojson x.registry_id)) ]

let get_plan_response_to_yojson (x : get_plan_response) =
  assoc_to_yojson
    [
      ("ScalaCode", option_to_yojson scala_code_to_yojson x.scala_code);
      ("PythonScript", option_to_yojson python_script_to_yojson x.python_script);
    ]

let catalog_entry_to_yojson (x : catalog_entry) =
  assoc_to_yojson
    [
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
    ]

let catalog_entries_to_yojson tree = list_to_yojson catalog_entry_to_yojson tree

let additional_plan_options_map_to_yojson tree =
  map_to_yojson generic_string_to_yojson generic_string_to_yojson tree

let get_plan_request_to_yojson (x : get_plan_request) =
  assoc_to_yojson
    [
      ( "AdditionalPlanOptionsMap",
        option_to_yojson additional_plan_options_map_to_yojson x.additional_plan_options_map );
      ("Language", option_to_yojson language_to_yojson x.language);
      ("Location", option_to_yojson location_to_yojson x.location);
      ("Sinks", option_to_yojson catalog_entries_to_yojson x.sinks);
      ("Source", Some (catalog_entry_to_yojson x.source));
      ("Mapping", Some (mapping_list_to_yojson x.mapping));
    ]

let get_partitions_response_to_yojson (x : get_partitions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Partitions", option_to_yojson partition_list_to_yojson x.partitions);
    ]

let get_partitions_request_to_yojson (x : get_partitions_request) =
  assoc_to_yojson
    [
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("QueryAsOfTime", option_to_yojson timestamp_to_yojson x.query_as_of_time);
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ("ExcludeColumnSchema", option_to_yojson boolean_nullable_to_yojson x.exclude_column_schema);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("Segment", option_to_yojson segment_to_yojson x.segment);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Expression", option_to_yojson predicate_string_to_yojson x.expression);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_partition_response_to_yojson (x : get_partition_response) =
  assoc_to_yojson [ ("Partition", option_to_yojson partition_to_yojson x.partition) ]

let get_partition_request_to_yojson (x : get_partition_request) =
  assoc_to_yojson
    [
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_partition_indexes_response_to_yojson (x : get_partition_indexes_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "PartitionIndexDescriptorList",
        option_to_yojson partition_index_descriptor_list_to_yojson x.partition_index_descriptor_list
      );
    ]

let get_partition_indexes_request_to_yojson (x : get_partition_indexes_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_materialized_view_refresh_task_run_response_to_yojson
    (x : get_materialized_view_refresh_task_run_response) =
  assoc_to_yojson
    [
      ( "MaterializedViewRefreshTaskRun",
        option_to_yojson materialized_view_refresh_task_run_to_yojson
          x.materialized_view_refresh_task_run );
    ]

let get_materialized_view_refresh_task_run_request_to_yojson
    (x : get_materialized_view_refresh_task_run_request) =
  assoc_to_yojson
    [
      ( "MaterializedViewRefreshTaskRunId",
        Some (uui_dv4_to_yojson x.materialized_view_refresh_task_run_id) );
      ("CatalogId", Some (name_string_to_yojson x.catalog_id));
    ]

let get_mapping_response_to_yojson (x : get_mapping_response) =
  assoc_to_yojson [ ("Mapping", Some (mapping_list_to_yojson x.mapping)) ]

let get_mapping_request_to_yojson (x : get_mapping_request) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_to_yojson x.location);
      ("Sinks", option_to_yojson catalog_entries_to_yojson x.sinks);
      ("Source", Some (catalog_entry_to_yojson x.source));
    ]

let get_ml_transforms_response_to_yojson (x : get_ml_transforms_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Transforms", Some (transform_list_to_yojson x.transforms));
    ]

let get_ml_transforms_request_to_yojson (x : get_ml_transforms_request) =
  assoc_to_yojson
    [
      ("Sort", option_to_yojson transform_sort_criteria_to_yojson x.sort);
      ("Filter", option_to_yojson transform_filter_criteria_to_yojson x.filter);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let get_ml_transform_response_to_yojson (x : get_ml_transform_response) =
  assoc_to_yojson
    [
      ("TransformEncryption", option_to_yojson transform_encryption_to_yojson x.transform_encryption);
      ("MaxRetries", option_to_yojson nullable_integer_to_yojson x.max_retries);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("Schema", option_to_yojson transform_schema_to_yojson x.schema);
      ("LabelCount", option_to_yojson label_count_to_yojson x.label_count);
      ("EvaluationMetrics", option_to_yojson evaluation_metrics_to_yojson x.evaluation_metrics);
      ("Parameters", option_to_yojson transform_parameters_to_yojson x.parameters);
      ("InputRecordTables", option_to_yojson glue_tables_to_yojson x.input_record_tables);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("CreatedOn", option_to_yojson timestamp_to_yojson x.created_on);
      ("Status", option_to_yojson transform_status_type_to_yojson x.status);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id);
    ]

let get_ml_transform_request_to_yojson (x : get_ml_transform_request) =
  assoc_to_yojson [ ("TransformId", Some (hash_string_to_yojson x.transform_id)) ]

let get_ml_task_runs_response_to_yojson (x : get_ml_task_runs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("TaskRuns", option_to_yojson task_run_list_to_yojson x.task_runs);
    ]

let get_ml_task_runs_request_to_yojson (x : get_ml_task_runs_request) =
  assoc_to_yojson
    [
      ("Sort", option_to_yojson task_run_sort_criteria_to_yojson x.sort);
      ("Filter", option_to_yojson task_run_filter_criteria_to_yojson x.filter);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
    ]

let get_ml_task_run_response_to_yojson (x : get_ml_task_run_response) =
  assoc_to_yojson
    [
      ("ExecutionTime", option_to_yojson execution_time_to_yojson x.execution_time);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("ErrorString", option_to_yojson generic_string_to_yojson x.error_string);
      ("Properties", option_to_yojson task_run_properties_to_yojson x.properties);
      ("LogGroupName", option_to_yojson generic_string_to_yojson x.log_group_name);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id);
      ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id);
    ]

let get_ml_task_run_request_to_yojson (x : get_ml_task_run_request) =
  assoc_to_yojson
    [
      ("TaskRunId", Some (hash_string_to_yojson x.task_run_id));
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
    ]

let get_jobs_response_to_yojson (x : get_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Jobs", option_to_yojson job_list_to_yojson x.jobs);
    ]

let get_jobs_request_to_yojson (x : get_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let get_job_runs_response_to_yojson (x : get_job_runs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("JobRuns", option_to_yojson job_run_list_to_yojson x.job_runs);
    ]

let get_job_runs_request_to_yojson (x : get_job_runs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson orchestration_page_size200_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("JobName", Some (name_string_to_yojson x.job_name));
    ]

let get_job_run_response_to_yojson (x : get_job_run_response) =
  assoc_to_yojson [ ("JobRun", option_to_yojson job_run_to_yojson x.job_run) ]

let get_job_run_request_to_yojson (x : get_job_run_request) =
  assoc_to_yojson
    [
      ("PredecessorsIncluded", option_to_yojson boolean_value_to_yojson x.predecessors_included);
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("JobName", Some (name_string_to_yojson x.job_name));
    ]

let get_job_response_to_yojson (x : get_job_response) =
  assoc_to_yojson [ ("Job", option_to_yojson job_to_yojson x.job) ]

let get_job_request_to_yojson (x : get_job_request) =
  assoc_to_yojson [ ("JobName", Some (name_string_to_yojson x.job_name)) ]

let get_job_bookmark_response_to_yojson (x : get_job_bookmark_response) =
  assoc_to_yojson
    [ ("JobBookmarkEntry", option_to_yojson job_bookmark_entry_to_yojson x.job_bookmark_entry) ]

let get_job_bookmark_request_to_yojson (x : get_job_bookmark_request) =
  assoc_to_yojson
    [
      ("RunId", option_to_yojson run_id_to_yojson x.run_id);
      ("JobName", Some (job_name_to_yojson x.job_name));
    ]

let get_integration_table_properties_response_to_yojson
    (x : get_integration_table_properties_response) =
  assoc_to_yojson
    [
      ("TargetTableConfig", option_to_yojson target_table_config_to_yojson x.target_table_config);
      ("SourceTableConfig", option_to_yojson source_table_config_to_yojson x.source_table_config);
      ("TableName", option_to_yojson string128_to_yojson x.table_name);
      ("ResourceArn", option_to_yojson string512_to_yojson x.resource_arn);
    ]

let get_integration_table_properties_request_to_yojson
    (x : get_integration_table_properties_request) =
  assoc_to_yojson
    [
      ("TableName", Some (string128_to_yojson x.table_name));
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
    ]

let get_integration_resource_property_response_to_yojson
    (x : get_integration_resource_property_response) =
  assoc_to_yojson
    [
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ("ResourcePropertyArn", option_to_yojson string512_to_yojson x.resource_property_arn);
      ("ResourceArn", option_to_yojson string512_to_yojson x.resource_arn);
    ]

let get_integration_resource_property_request_to_yojson
    (x : get_integration_resource_property_request) =
  assoc_to_yojson [ ("ResourceArn", Some (string512_to_yojson x.resource_arn)) ]

let application_arn_to_yojson = string_to_yojson

let get_glue_identity_center_configuration_response_to_yojson
    (x : get_glue_identity_center_configuration_response) =
  assoc_to_yojson
    [
      ( "UserBackgroundSessionsEnabled",
        option_to_yojson nullable_boolean_to_yojson x.user_background_sessions_enabled );
      ("Scopes", option_to_yojson orchestration_string_list_to_yojson x.scopes);
      ("InstanceArn", option_to_yojson identity_center_instance_arn_to_yojson x.instance_arn);
      ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn);
    ]

let get_glue_identity_center_configuration_request_to_yojson = unit_to_yojson

let get_glossary_term_response_to_yojson (x : get_glossary_term_response) =
  assoc_to_yojson
    [
      ("LongDescription", option_to_yojson glossary_long_description_to_yojson x.long_description);
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
      ("Name", option_to_yojson glossary_term_name_to_yojson x.name);
      ("GlossaryId", option_to_yojson glossary_id_to_yojson x.glossary_id);
      ("Id", option_to_yojson glossary_term_id_to_yojson x.id);
    ]

let get_glossary_term_request_to_yojson (x : get_glossary_term_request) =
  assoc_to_yojson [ ("Identifier", Some (glossary_term_id_to_yojson x.identifier)) ]

let get_glossary_response_to_yojson (x : get_glossary_response) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
      ("Name", option_to_yojson glossary_name_to_yojson x.name);
      ("Id", option_to_yojson glossary_id_to_yojson x.id);
    ]

let get_glossary_request_to_yojson (x : get_glossary_request) =
  assoc_to_yojson [ ("Identifier", Some (glossary_id_to_yojson x.identifier)) ]

let get_form_type_response_to_yojson (x : get_form_type_response) =
  assoc_to_yojson
    [
      ("Schema", option_to_yojson form_type_schema_to_yojson x.schema);
      ("Name", option_to_yojson form_type_name_to_yojson x.name);
      ("Id", option_to_yojson form_type_id_to_yojson x.id);
    ]

let get_form_type_request_to_yojson (x : get_form_type_request) =
  assoc_to_yojson [ ("Identifier", Some (form_type_id_to_yojson x.identifier)) ]

let get_entity_records_response_to_yojson (x : get_entity_records_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Records", option_to_yojson records_to_yojson x.records);
    ]

let connection_options_to_yojson tree =
  map_to_yojson option_key_to_yojson option_value_to_yojson tree

let filter_predicate_to_yojson = string_to_yojson

let get_entity_records_request_to_yojson (x : get_entity_records_request) =
  assoc_to_yojson
    [
      ("SelectedFields", option_to_yojson selected_fields_to_yojson x.selected_fields);
      ( "OrderBy",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.order_by );
      ("Limit", Some (limit_to_yojson x.limit));
      ("FilterPredicate", option_to_yojson filter_predicate_to_yojson x.filter_predicate);
      ("ConnectionOptions", option_to_yojson connection_options_to_yojson x.connection_options);
      ("DataStoreApiVersion", option_to_yojson api_version_to_yojson x.data_store_api_version);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("EntityName", Some (entity_name_to_yojson x.entity_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("ConnectionName", option_to_yojson name_string_to_yojson x.connection_name);
    ]

let dev_endpoint_to_yojson (x : dev_endpoint) =
  assoc_to_yojson
    [
      ("Arguments", option_to_yojson map_value_to_yojson x.arguments);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("PublicKeys", option_to_yojson public_keys_list_to_yojson x.public_keys);
      ("PublicKey", option_to_yojson generic_string_to_yojson x.public_key);
      ("LastModifiedTimestamp", option_to_yojson timestamp_value_to_yojson x.last_modified_timestamp);
      ("CreatedTimestamp", option_to_yojson timestamp_value_to_yojson x.created_timestamp);
      ("LastUpdateStatus", option_to_yojson generic_string_to_yojson x.last_update_status);
      ("FailureReason", option_to_yojson generic_string_to_yojson x.failure_reason);
      ("ExtraJarsS3Path", option_to_yojson generic_string_to_yojson x.extra_jars_s3_path);
      ( "ExtraPythonLibsS3Path",
        option_to_yojson generic_string_to_yojson x.extra_python_libs_s3_path );
      ("VpcId", option_to_yojson generic_string_to_yojson x.vpc_id);
      ("AvailabilityZone", option_to_yojson generic_string_to_yojson x.availability_zone);
      ("NumberOfNodes", option_to_yojson integer_value_to_yojson x.number_of_nodes);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("Status", option_to_yojson generic_string_to_yojson x.status);
      ("PublicAddress", option_to_yojson generic_string_to_yojson x.public_address);
      ( "ZeppelinRemoteSparkInterpreterPort",
        option_to_yojson integer_value_to_yojson x.zeppelin_remote_spark_interpreter_port );
      ("PrivateAddress", option_to_yojson generic_string_to_yojson x.private_address);
      ("YarnEndpointAddress", option_to_yojson generic_string_to_yojson x.yarn_endpoint_address);
      ("SubnetId", option_to_yojson generic_string_to_yojson x.subnet_id);
      ("SecurityGroupIds", option_to_yojson string_list_to_yojson x.security_group_ids);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("EndpointName", option_to_yojson generic_string_to_yojson x.endpoint_name);
    ]

let dev_endpoint_list_to_yojson tree = list_to_yojson dev_endpoint_to_yojson tree

let get_dev_endpoints_response_to_yojson (x : get_dev_endpoints_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("DevEndpoints", option_to_yojson dev_endpoint_list_to_yojson x.dev_endpoints);
    ]

let get_dev_endpoints_request_to_yojson (x : get_dev_endpoints_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let get_dev_endpoint_response_to_yojson (x : get_dev_endpoint_response) =
  assoc_to_yojson [ ("DevEndpoint", option_to_yojson dev_endpoint_to_yojson x.dev_endpoint) ]

let get_dev_endpoint_request_to_yojson (x : get_dev_endpoint_request) =
  assoc_to_yojson [ ("EndpointName", Some (generic_string_to_yojson x.endpoint_name)) ]

let code_gen_identifier_to_yojson = string_to_yojson
let code_gen_node_type_to_yojson = string_to_yojson

let code_gen_node_to_yojson (x : code_gen_node) =
  assoc_to_yojson
    [
      ("LineNumber", option_to_yojson integer_to_yojson x.line_number);
      ("Args", Some (code_gen_node_args_to_yojson x.args));
      ("NodeType", Some (code_gen_node_type_to_yojson x.node_type));
      ("Id", Some (code_gen_identifier_to_yojson x.id));
    ]

let dag_nodes_to_yojson tree = list_to_yojson code_gen_node_to_yojson tree

let code_gen_edge_to_yojson (x : code_gen_edge) =
  assoc_to_yojson
    [
      ("TargetParameter", option_to_yojson code_gen_arg_name_to_yojson x.target_parameter);
      ("Target", Some (code_gen_identifier_to_yojson x.target));
      ("Source", Some (code_gen_identifier_to_yojson x.source));
    ]

let dag_edges_to_yojson tree = list_to_yojson code_gen_edge_to_yojson tree

let get_dataflow_graph_response_to_yojson (x : get_dataflow_graph_response) =
  assoc_to_yojson
    [
      ("DagEdges", option_to_yojson dag_edges_to_yojson x.dag_edges);
      ("DagNodes", option_to_yojson dag_nodes_to_yojson x.dag_nodes);
    ]

let get_dataflow_graph_request_to_yojson (x : get_dataflow_graph_request) =
  assoc_to_yojson [ ("PythonScript", option_to_yojson python_script_to_yojson x.python_script) ]

let database_to_yojson (x : database) =
  assoc_to_yojson
    [
      ("FederatedDatabase", option_to_yojson federated_database_to_yojson x.federated_database);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("TargetDatabase", option_to_yojson database_identifier_to_yojson x.target_database);
      ( "CreateTableDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_table_default_permissions );
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("LocationUri", option_to_yojson ur_i_to_yojson x.location_uri);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let database_list_to_yojson tree = list_to_yojson database_to_yojson tree

let get_databases_response_to_yojson (x : get_databases_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("DatabaseList", Some (database_list_to_yojson x.database_list));
    ]

let database_attributes_to_yojson (x : database_attributes) =
  match x with TARGET_DATABASE -> `String "TARGET_DATABASE" | NAME -> `String "NAME"

let database_attributes_list_to_yojson tree = list_to_yojson database_attributes_to_yojson tree

let get_databases_request_to_yojson (x : get_databases_request) =
  assoc_to_yojson
    [
      ("AttributesToGet", option_to_yojson database_attributes_list_to_yojson x.attributes_to_get);
      ("ResourceShareType", option_to_yojson resource_share_type_to_yojson x.resource_share_type);
      ("MaxResults", option_to_yojson catalog_getter_page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_database_response_to_yojson (x : get_database_response) =
  assoc_to_yojson [ ("Database", option_to_yojson database_to_yojson x.database) ]

let get_database_request_to_yojson (x : get_database_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_data_quality_ruleset_response_to_yojson (x : get_data_quality_ruleset_response) =
  assoc_to_yojson
    [
      ( "DataQualitySecurityConfiguration",
        option_to_yojson name_string_to_yojson x.data_quality_security_configuration );
      ("RecommendationRunId", option_to_yojson hash_string_to_yojson x.recommendation_run_id);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("CreatedOn", option_to_yojson timestamp_to_yojson x.created_on);
      ("TargetTable", option_to_yojson data_quality_target_table_to_yojson x.target_table);
      ("Ruleset", option_to_yojson data_quality_ruleset_string_to_yojson x.ruleset);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let get_data_quality_ruleset_request_to_yojson (x : get_data_quality_ruleset_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let data_quality_result_id_list_to_yojson tree = list_to_yojson hash_string_to_yojson tree

let get_data_quality_ruleset_evaluation_run_response_to_yojson
    (x : get_data_quality_ruleset_evaluation_run_response) =
  assoc_to_yojson
    [
      ("AdditionalDataSources", option_to_yojson data_source_map_to_yojson x.additional_data_sources);
      ("ResultIds", option_to_yojson data_quality_result_id_list_to_yojson x.result_ids);
      ("RulesetNames", option_to_yojson ruleset_names_to_yojson x.ruleset_names);
      ("ExecutionTime", option_to_yojson execution_time_to_yojson x.execution_time);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("ErrorString", option_to_yojson generic_string_to_yojson x.error_string);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ( "AdditionalRunOptions",
        option_to_yojson data_quality_evaluation_run_additional_run_options_to_yojson
          x.additional_run_options );
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("RunId", option_to_yojson hash_string_to_yojson x.run_id);
    ]

let get_data_quality_ruleset_evaluation_run_request_to_yojson
    (x : get_data_quality_ruleset_evaluation_run_request) =
  assoc_to_yojson [ ("RunId", Some (hash_string_to_yojson x.run_id)) ]

let get_data_quality_rule_recommendation_run_response_to_yojson
    (x : get_data_quality_rule_recommendation_run_response) =
  assoc_to_yojson
    [
      ( "DataQualitySecurityConfiguration",
        option_to_yojson name_string_to_yojson x.data_quality_security_configuration );
      ("CreatedRulesetName", option_to_yojson name_string_to_yojson x.created_ruleset_name);
      ( "RecommendedRuleset",
        option_to_yojson data_quality_ruleset_string_to_yojson x.recommended_ruleset );
      ("ExecutionTime", option_to_yojson execution_time_to_yojson x.execution_time);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("LastModifiedOn", option_to_yojson timestamp_to_yojson x.last_modified_on);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("ErrorString", option_to_yojson generic_string_to_yojson x.error_string);
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("Role", option_to_yojson role_string_to_yojson x.role);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("RunId", option_to_yojson hash_string_to_yojson x.run_id);
    ]

let get_data_quality_rule_recommendation_run_request_to_yojson
    (x : get_data_quality_rule_recommendation_run_request) =
  assoc_to_yojson [ ("RunId", Some (hash_string_to_yojson x.run_id)) ]

let data_quality_rule_result_description_to_yojson = string_to_yojson

let data_quality_rule_result_status_to_yojson (x : data_quality_rule_result_status) =
  match x with ERROR -> `String "ERROR" | FAIL -> `String "FAIL" | PASS -> `String "PASS"

let evaluated_metrics_map_to_yojson tree =
  map_to_yojson name_string_to_yojson nullable_double_to_yojson tree

let data_quality_rule_result_to_yojson (x : data_quality_rule_result) =
  assoc_to_yojson
    [
      ("Labels", option_to_yojson labels_to_yojson x.labels);
      ("RuleMetrics", option_to_yojson rule_metrics_map_to_yojson x.rule_metrics);
      ( "EvaluatedRule",
        option_to_yojson data_quality_rule_result_description_to_yojson x.evaluated_rule );
      ("EvaluatedMetrics", option_to_yojson evaluated_metrics_map_to_yojson x.evaluated_metrics);
      ("Result", option_to_yojson data_quality_rule_result_status_to_yojson x.result_);
      ( "EvaluationMessage",
        option_to_yojson data_quality_rule_result_description_to_yojson x.evaluation_message );
      ("Description", option_to_yojson data_quality_rule_result_description_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let data_quality_rule_results_to_yojson tree =
  list_to_yojson data_quality_rule_result_to_yojson tree

let data_quality_analyzer_result_to_yojson (x : data_quality_analyzer_result) =
  assoc_to_yojson
    [
      ("EvaluatedMetrics", option_to_yojson evaluated_metrics_map_to_yojson x.evaluated_metrics);
      ( "EvaluationMessage",
        option_to_yojson data_quality_rule_result_description_to_yojson x.evaluation_message );
      ("Description", option_to_yojson data_quality_rule_result_description_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let data_quality_analyzer_results_to_yojson tree =
  list_to_yojson data_quality_analyzer_result_to_yojson tree

let data_quality_observation_description_to_yojson = string_to_yojson

let data_quality_observation_to_yojson (x : data_quality_observation) =
  assoc_to_yojson
    [
      ( "MetricBasedObservation",
        option_to_yojson metric_based_observation_to_yojson x.metric_based_observation );
      ("Description", option_to_yojson data_quality_observation_description_to_yojson x.description);
    ]

let data_quality_observations_to_yojson tree =
  list_to_yojson data_quality_observation_to_yojson tree

let data_quality_aggregated_metrics_to_yojson (x : data_quality_aggregated_metrics) =
  assoc_to_yojson
    [
      ("TotalRulesFailed", option_to_yojson nullable_double_to_yojson x.total_rules_failed);
      ("TotalRulesPassed", option_to_yojson nullable_double_to_yojson x.total_rules_passed);
      ("TotalRulesProcessed", option_to_yojson nullable_double_to_yojson x.total_rules_processed);
      ("TotalRowsFailed", option_to_yojson nullable_double_to_yojson x.total_rows_failed);
      ("TotalRowsPassed", option_to_yojson nullable_double_to_yojson x.total_rows_passed);
      ("TotalRowsProcessed", option_to_yojson nullable_double_to_yojson x.total_rows_processed);
    ]

let get_data_quality_result_response_to_yojson (x : get_data_quality_result_response) =
  assoc_to_yojson
    [
      ( "AggregatedMetrics",
        option_to_yojson data_quality_aggregated_metrics_to_yojson x.aggregated_metrics );
      ("Observations", option_to_yojson data_quality_observations_to_yojson x.observations);
      ( "AnalyzerResults",
        option_to_yojson data_quality_analyzer_results_to_yojson x.analyzer_results );
      ("RuleResults", option_to_yojson data_quality_rule_results_to_yojson x.rule_results);
      ("RulesetEvaluationRunId", option_to_yojson hash_string_to_yojson x.ruleset_evaluation_run_id);
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("EvaluationContext", option_to_yojson generic_string_to_yojson x.evaluation_context);
      ("RulesetName", option_to_yojson name_string_to_yojson x.ruleset_name);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("Score", option_to_yojson generic_bounded_double_to_yojson x.score);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("ResultId", option_to_yojson hash_string_to_yojson x.result_id);
    ]

let get_data_quality_result_request_to_yojson (x : get_data_quality_result_request) =
  assoc_to_yojson [ ("ResultId", Some (hash_string_to_yojson x.result_id)) ]

let get_data_quality_model_result_response_to_yojson (x : get_data_quality_model_result_response) =
  assoc_to_yojson
    [
      ("Model", option_to_yojson statistic_model_results_to_yojson x.model);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
    ]

let get_data_quality_model_result_request_to_yojson (x : get_data_quality_model_result_request) =
  assoc_to_yojson
    [
      ("ProfileId", Some (hash_string_to_yojson x.profile_id));
      ("StatisticId", Some (hash_string_to_yojson x.statistic_id));
    ]

let data_quality_model_status_to_yojson (x : data_quality_model_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | RUNNING -> `String "RUNNING"

let get_data_quality_model_response_to_yojson (x : get_data_quality_model_response) =
  assoc_to_yojson
    [
      ("FailureReason", option_to_yojson hash_string_to_yojson x.failure_reason);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("Status", option_to_yojson data_quality_model_status_to_yojson x.status);
    ]

let get_data_quality_model_request_to_yojson (x : get_data_quality_model_request) =
  assoc_to_yojson
    [
      ("ProfileId", Some (hash_string_to_yojson x.profile_id));
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
    ]

let get_data_catalog_encryption_settings_response_to_yojson
    (x : get_data_catalog_encryption_settings_response) =
  assoc_to_yojson
    [
      ( "DataCatalogEncryptionSettings",
        option_to_yojson data_catalog_encryption_settings_to_yojson
          x.data_catalog_encryption_settings );
    ]

let get_data_catalog_encryption_settings_request_to_yojson
    (x : get_data_catalog_encryption_settings_request) =
  assoc_to_yojson [ ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id) ]

let get_dashboard_url_response_to_yojson (x : get_dashboard_url_response) =
  assoc_to_yojson [ ("Url", Some (sensitive_url_to_yojson x.url)) ]

let get_dashboard_url_request_to_yojson (x : get_dashboard_url_request) =
  assoc_to_yojson
    [
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("ResourceType", Some (glue_resource_type_to_yojson x.resource_type));
      ("ResourceId", Some (name_string_to_yojson x.resource_id));
    ]

let get_custom_entity_type_response_to_yojson (x : get_custom_entity_type_response) =
  assoc_to_yojson
    [
      ("ContextWords", option_to_yojson context_words_to_yojson x.context_words);
      ("RegexString", option_to_yojson name_string_to_yojson x.regex_string);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let get_custom_entity_type_request_to_yojson (x : get_custom_entity_type_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let crawler_state_to_yojson (x : crawler_state) =
  match x with
  | STOPPING -> `String "STOPPING"
  | RUNNING -> `String "RUNNING"
  | READY -> `String "READY"

let crawler_to_yojson (x : crawler) =
  assoc_to_yojson
    [
      ( "LakeFormationConfiguration",
        option_to_yojson lake_formation_configuration_to_yojson x.lake_formation_configuration );
      ( "CrawlerSecurityConfiguration",
        option_to_yojson crawler_security_configuration_to_yojson x.crawler_security_configuration
      );
      ("Configuration", option_to_yojson crawler_configuration_to_yojson x.configuration);
      ("Version", option_to_yojson version_id_to_yojson x.version);
      ("LastCrawl", option_to_yojson last_crawl_info_to_yojson x.last_crawl);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CrawlElapsedTime", option_to_yojson milliseconds_count_to_yojson x.crawl_elapsed_time);
      ("Schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("TablePrefix", option_to_yojson table_prefix_to_yojson x.table_prefix);
      ("State", option_to_yojson crawler_state_to_yojson x.state);
      ( "LineageConfiguration",
        option_to_yojson lineage_configuration_to_yojson x.lineage_configuration );
      ("SchemaChangePolicy", option_to_yojson schema_change_policy_to_yojson x.schema_change_policy);
      ("RecrawlPolicy", option_to_yojson recrawl_policy_to_yojson x.recrawl_policy);
      ("Classifiers", option_to_yojson classifier_name_list_to_yojson x.classifiers);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
      ("Targets", option_to_yojson crawler_targets_to_yojson x.targets);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let crawler_list_to_yojson tree = list_to_yojson crawler_to_yojson tree

let get_crawlers_response_to_yojson (x : get_crawlers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Crawlers", option_to_yojson crawler_list_to_yojson x.crawlers);
    ]

let get_crawlers_request_to_yojson (x : get_crawlers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let get_crawler_response_to_yojson (x : get_crawler_response) =
  assoc_to_yojson [ ("Crawler", option_to_yojson crawler_to_yojson x.crawler) ]

let get_crawler_request_to_yojson (x : get_crawler_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let crawler_metrics_to_yojson (x : crawler_metrics) =
  assoc_to_yojson
    [
      ("TablesDeleted", option_to_yojson non_negative_integer_to_yojson x.tables_deleted);
      ("TablesUpdated", option_to_yojson non_negative_integer_to_yojson x.tables_updated);
      ("TablesCreated", option_to_yojson non_negative_integer_to_yojson x.tables_created);
      ( "MedianRuntimeSeconds",
        option_to_yojson non_negative_double_to_yojson x.median_runtime_seconds );
      ("LastRuntimeSeconds", option_to_yojson non_negative_double_to_yojson x.last_runtime_seconds);
      ("StillEstimating", option_to_yojson boolean__to_yojson x.still_estimating);
      ("TimeLeftSeconds", option_to_yojson non_negative_double_to_yojson x.time_left_seconds);
      ("CrawlerName", option_to_yojson name_string_to_yojson x.crawler_name);
    ]

let crawler_metrics_list_to_yojson tree = list_to_yojson crawler_metrics_to_yojson tree

let get_crawler_metrics_response_to_yojson (x : get_crawler_metrics_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("CrawlerMetricsList", option_to_yojson crawler_metrics_list_to_yojson x.crawler_metrics_list);
    ]

let get_crawler_metrics_request_to_yojson (x : get_crawler_metrics_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("CrawlerNameList", option_to_yojson crawler_name_list_to_yojson x.crawler_name_list);
    ]

let connection_status_to_yojson (x : connection_status) =
  match x with
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | READY -> `String "READY"

let authentication_configuration_to_yojson (x : authentication_configuration) =
  assoc_to_yojson
    [
      ("OAuth2Properties", option_to_yojson o_auth2_properties_to_yojson x.o_auth2_properties);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
    ]

let connection_schema_version_to_yojson = int_to_yojson

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ( "CompatibleComputeEnvironments",
        option_to_yojson compute_environment_list_to_yojson x.compatible_compute_environments );
      ( "ConnectionSchemaVersion",
        option_to_yojson connection_schema_version_to_yojson x.connection_schema_version );
      ( "AuthenticationConfiguration",
        option_to_yojson authentication_configuration_to_yojson x.authentication_configuration );
      ( "LastConnectionValidationTime",
        option_to_yojson timestamp_to_yojson x.last_connection_validation_time );
      ("StatusReason", option_to_yojson long_value_string_to_yojson x.status_reason);
      ("Status", option_to_yojson connection_status_to_yojson x.status);
      ("LastUpdatedBy", option_to_yojson name_string_to_yojson x.last_updated_by);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "PhysicalConnectionRequirements",
        option_to_yojson physical_connection_requirements_to_yojson
          x.physical_connection_requirements );
      ("PythonProperties", option_to_yojson property_map_to_yojson x.python_properties);
      ("AthenaProperties", option_to_yojson property_map_to_yojson x.athena_properties);
      ("SparkProperties", option_to_yojson property_map_to_yojson x.spark_properties);
      ( "ConnectionProperties",
        option_to_yojson connection_properties_to_yojson x.connection_properties );
      ("MatchCriteria", option_to_yojson match_criteria_to_yojson x.match_criteria);
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let connection_list_to_yojson tree = list_to_yojson connection_to_yojson tree

let get_connections_response_to_yojson (x : get_connections_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("ConnectionList", option_to_yojson connection_list_to_yojson x.connection_list);
    ]

let get_connections_filter_to_yojson (x : get_connections_filter) =
  assoc_to_yojson
    [
      ( "ConnectionSchemaVersion",
        option_to_yojson connection_schema_version_to_yojson x.connection_schema_version );
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("MatchCriteria", option_to_yojson match_criteria_to_yojson x.match_criteria);
    ]

let get_connections_request_to_yojson (x : get_connections_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("HidePassword", option_to_yojson boolean__to_yojson x.hide_password);
      ("Filter", option_to_yojson get_connections_filter_to_yojson x.filter);
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_connection_response_to_yojson (x : get_connection_response) =
  assoc_to_yojson [ ("Connection", option_to_yojson connection_to_yojson x.connection) ]

let get_connection_request_to_yojson (x : get_connection_request) =
  assoc_to_yojson
    [
      ( "ApplyOverrideForComputeEnvironment",
        option_to_yojson compute_environment_to_yojson x.apply_override_for_compute_environment );
      ("HidePassword", option_to_yojson boolean__to_yojson x.hide_password);
      ("Name", Some (name_string_to_yojson x.name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let execution_status_to_yojson (x : execution_status) =
  match x with STARTED -> `String "STARTED" | FAILED -> `String "FAILED"

let execution_attempt_to_yojson (x : execution_attempt) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("ExecutionTimestamp", option_to_yojson timestamp_to_yojson x.execution_timestamp);
      ( "ColumnStatisticsTaskRunId",
        option_to_yojson hash_string_to_yojson x.column_statistics_task_run_id );
      ("Status", option_to_yojson execution_status_to_yojson x.status);
    ]

let column_statistics_task_settings_to_yojson (x : column_statistics_task_settings) =
  assoc_to_yojson
    [
      ("LastExecutionAttempt", option_to_yojson execution_attempt_to_yojson x.last_execution_attempt);
      ("SettingSource", option_to_yojson setting_source_to_yojson x.setting_source);
      ("ScheduleType", option_to_yojson schedule_type_to_yojson x.schedule_type);
      ( "SecurityConfiguration",
        option_to_yojson crawler_security_configuration_to_yojson x.security_configuration );
      ("SampleSize", option_to_yojson sample_size_percentage_to_yojson x.sample_size);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("CatalogID", option_to_yojson catalog_id_string_to_yojson x.catalog_i_d);
      ("ColumnNameList", option_to_yojson column_name_list_to_yojson x.column_name_list);
      ("Schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
    ]

let get_column_statistics_task_settings_response_to_yojson
    (x : get_column_statistics_task_settings_response) =
  assoc_to_yojson
    [
      ( "ColumnStatisticsTaskSettings",
        option_to_yojson column_statistics_task_settings_to_yojson x.column_statistics_task_settings
      );
    ]

let get_column_statistics_task_settings_request_to_yojson
    (x : get_column_statistics_task_settings_request) =
  assoc_to_yojson
    [
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
    ]

let computation_type_to_yojson (x : computation_type) =
  match x with INCREMENTAL -> `String "INCREMENTAL" | FULL -> `String "FULL"

let column_statistics_state_to_yojson (x : column_statistics_state) =
  match x with
  | STOPPED -> `String "STOPPED"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | RUNNING -> `String "RUNNING"
  | STARTING -> `String "STARTING"

let column_statistics_task_run_to_yojson (x : column_statistics_task_run) =
  assoc_to_yojson
    [
      ("DPUSeconds", option_to_yojson non_negative_double_to_yojson x.dpu_seconds);
      ("ErrorMessage", option_to_yojson description_string_to_yojson x.error_message);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson column_statistics_state_to_yojson x.status);
      ("ComputationType", option_to_yojson computation_type_to_yojson x.computation_type);
      ("WorkerType", option_to_yojson name_string_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson positive_integer_to_yojson x.number_of_workers);
      ( "SecurityConfiguration",
        option_to_yojson crawler_security_configuration_to_yojson x.security_configuration );
      ("SampleSize", option_to_yojson sample_size_percentage_to_yojson x.sample_size);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("CatalogID", option_to_yojson catalog_id_string_to_yojson x.catalog_i_d);
      ("ColumnNameList", option_to_yojson column_name_list_to_yojson x.column_name_list);
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
      ( "ColumnStatisticsTaskRunId",
        option_to_yojson hash_string_to_yojson x.column_statistics_task_run_id );
      ("CustomerId", option_to_yojson account_id_to_yojson x.customer_id);
    ]

let column_statistics_task_runs_list_to_yojson tree =
  list_to_yojson column_statistics_task_run_to_yojson tree

let get_column_statistics_task_runs_response_to_yojson
    (x : get_column_statistics_task_runs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "ColumnStatisticsTaskRuns",
        option_to_yojson column_statistics_task_runs_list_to_yojson x.column_statistics_task_runs );
    ]

let get_column_statistics_task_runs_request_to_yojson (x : get_column_statistics_task_runs_request)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (database_name_to_yojson x.database_name));
    ]

let get_column_statistics_task_run_response_to_yojson (x : get_column_statistics_task_run_response)
    =
  assoc_to_yojson
    [
      ( "ColumnStatisticsTaskRun",
        option_to_yojson column_statistics_task_run_to_yojson x.column_statistics_task_run );
    ]

let get_column_statistics_task_run_request_to_yojson (x : get_column_statistics_task_run_request) =
  assoc_to_yojson
    [ ("ColumnStatisticsTaskRunId", Some (hash_string_to_yojson x.column_statistics_task_run_id)) ]

let column_statistics_list_to_yojson tree = list_to_yojson column_statistics_to_yojson tree

let column_error_to_yojson (x : column_error) =
  assoc_to_yojson
    [
      ("Error", option_to_yojson error_detail_to_yojson x.error);
      ("ColumnName", option_to_yojson name_string_to_yojson x.column_name);
    ]

let column_errors_to_yojson tree = list_to_yojson column_error_to_yojson tree

let get_column_statistics_for_table_response_to_yojson
    (x : get_column_statistics_for_table_response) =
  assoc_to_yojson
    [
      ("Errors", option_to_yojson column_errors_to_yojson x.errors);
      ( "ColumnStatisticsList",
        option_to_yojson column_statistics_list_to_yojson x.column_statistics_list );
    ]

let get_column_names_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let get_column_statistics_for_table_request_to_yojson (x : get_column_statistics_for_table_request)
    =
  assoc_to_yojson
    [
      ("ColumnNames", Some (get_column_names_list_to_yojson x.column_names));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let get_column_statistics_for_partition_response_to_yojson
    (x : get_column_statistics_for_partition_response) =
  assoc_to_yojson
    [
      ("Errors", option_to_yojson column_errors_to_yojson x.errors);
      ( "ColumnStatisticsList",
        option_to_yojson column_statistics_list_to_yojson x.column_statistics_list );
    ]

let get_column_statistics_for_partition_request_to_yojson
    (x : get_column_statistics_for_partition_request) =
  assoc_to_yojson
    [
      ("ColumnNames", Some (get_column_names_list_to_yojson x.column_names));
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let csv_classifier_to_yojson (x : csv_classifier) =
  assoc_to_yojson
    [
      ("Serde", option_to_yojson csv_serde_option_to_yojson x.serde);
      ("CustomDatatypes", option_to_yojson custom_datatypes_to_yojson x.custom_datatypes);
      ( "CustomDatatypeConfigured",
        option_to_yojson nullable_boolean_to_yojson x.custom_datatype_configured );
      ("AllowSingleColumn", option_to_yojson nullable_boolean_to_yojson x.allow_single_column);
      ("DisableValueTrimming", option_to_yojson nullable_boolean_to_yojson x.disable_value_trimming);
      ("Header", option_to_yojson csv_header_to_yojson x.header);
      ("ContainsHeader", option_to_yojson csv_header_option_to_yojson x.contains_header);
      ("QuoteSymbol", option_to_yojson csv_quote_symbol_to_yojson x.quote_symbol);
      ("Delimiter", option_to_yojson csv_column_delimiter_to_yojson x.delimiter);
      ("Version", option_to_yojson version_id_to_yojson x.version);
      ("LastUpdated", option_to_yojson timestamp_to_yojson x.last_updated);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let classifier_to_yojson (x : classifier) =
  assoc_to_yojson
    [
      ("CsvClassifier", option_to_yojson csv_classifier_to_yojson x.csv_classifier);
      ("JsonClassifier", option_to_yojson json_classifier_to_yojson x.json_classifier);
      ("XMLClassifier", option_to_yojson xml_classifier_to_yojson x.xml_classifier);
      ("GrokClassifier", option_to_yojson grok_classifier_to_yojson x.grok_classifier);
    ]

let classifier_list_to_yojson tree = list_to_yojson classifier_to_yojson tree

let get_classifiers_response_to_yojson (x : get_classifiers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("Classifiers", option_to_yojson classifier_list_to_yojson x.classifiers);
    ]

let get_classifiers_request_to_yojson (x : get_classifiers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let get_classifier_response_to_yojson (x : get_classifier_response) =
  assoc_to_yojson [ ("Classifier", option_to_yojson classifier_to_yojson x.classifier) ]

let get_classifier_request_to_yojson (x : get_classifier_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let catalog_name_string_to_yojson = string_to_yojson

let data_lake_access_properties_output_to_yojson (x : data_lake_access_properties_output) =
  assoc_to_yojson
    [
      ("CatalogType", option_to_yojson name_string_to_yojson x.catalog_type);
      ("StatusMessage", option_to_yojson name_string_to_yojson x.status_message);
      ("RedshiftDatabaseName", option_to_yojson name_string_to_yojson x.redshift_database_name);
      ("ManagedWorkgroupStatus", option_to_yojson name_string_to_yojson x.managed_workgroup_status);
      ("ManagedWorkgroupName", option_to_yojson name_string_to_yojson x.managed_workgroup_name);
      ("KmsKey", option_to_yojson resource_arn_string_to_yojson x.kms_key);
      ("DataTransferRole", option_to_yojson iam_role_arn_to_yojson x.data_transfer_role);
      ("DataLakeAccess", option_to_yojson boolean__to_yojson x.data_lake_access);
    ]

let catalog_properties_output_to_yojson (x : catalog_properties_output) =
  assoc_to_yojson
    [
      ("CustomProperties", option_to_yojson parameters_map_to_yojson x.custom_properties);
      ( "IcebergOptimizationProperties",
        option_to_yojson iceberg_optimization_properties_output_to_yojson
          x.iceberg_optimization_properties );
      ( "DataLakeAccessProperties",
        option_to_yojson data_lake_access_properties_output_to_yojson x.data_lake_access_properties
      );
    ]

let catalog_to_yojson (x : catalog) =
  assoc_to_yojson
    [
      ( "AllowFullTableExternalDataAccess",
        option_to_yojson allow_full_table_external_data_access_enum_to_yojson
          x.allow_full_table_external_data_access );
      ( "CreateDatabaseDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_database_default_permissions
      );
      ( "CreateTableDefaultPermissions",
        option_to_yojson principal_permissions_list_to_yojson x.create_table_default_permissions );
      ( "CatalogProperties",
        option_to_yojson catalog_properties_output_to_yojson x.catalog_properties );
      ("FederatedCatalog", option_to_yojson federated_catalog_to_yojson x.federated_catalog);
      ( "TargetRedshiftCatalog",
        option_to_yojson target_redshift_catalog_to_yojson x.target_redshift_catalog );
      ("UpdateTime", option_to_yojson timestamp_to_yojson x.update_time);
      ("CreateTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("Parameters", option_to_yojson parameters_map_to_yojson x.parameters);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("ResourceArn", option_to_yojson resource_arn_string_to_yojson x.resource_arn);
      ("Name", Some (catalog_name_string_to_yojson x.name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let catalog_list_to_yojson tree = list_to_yojson catalog_to_yojson tree

let get_catalogs_response_to_yojson (x : get_catalogs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("CatalogList", Some (catalog_list_to_yojson x.catalog_list));
    ]

let get_catalogs_request_to_yojson (x : get_catalogs_request) =
  assoc_to_yojson
    [
      ("HasDatabases", option_to_yojson nullable_boolean_to_yojson x.has_databases);
      ("IncludeRoot", option_to_yojson nullable_boolean_to_yojson x.include_root);
      ("Recursive", option_to_yojson boolean__to_yojson x.recursive);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("ParentCatalogId", option_to_yojson catalog_id_string_to_yojson x.parent_catalog_id);
    ]

let get_catalog_response_to_yojson (x : get_catalog_response) =
  assoc_to_yojson [ ("Catalog", option_to_yojson catalog_to_yojson x.catalog) ]

let get_catalog_request_to_yojson (x : get_catalog_request) =
  assoc_to_yojson [ ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id)) ]

let catalog_import_status_to_yojson (x : catalog_import_status) =
  assoc_to_yojson
    [
      ("ImportedBy", option_to_yojson name_string_to_yojson x.imported_by);
      ("ImportTime", option_to_yojson timestamp_to_yojson x.import_time);
      ("ImportCompleted", option_to_yojson boolean__to_yojson x.import_completed);
    ]

let get_catalog_import_status_response_to_yojson (x : get_catalog_import_status_response) =
  assoc_to_yojson
    [ ("ImportStatus", option_to_yojson catalog_import_status_to_yojson x.import_status) ]

let get_catalog_import_status_request_to_yojson (x : get_catalog_import_status_request) =
  assoc_to_yojson [ ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id) ]

let blueprint_run_state_to_yojson (x : blueprint_run_state) =
  match x with
  | ROLLING_BACK -> `String "ROLLING_BACK"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | RUNNING -> `String "RUNNING"

let blueprint_run_to_yojson (x : blueprint_run) =
  assoc_to_yojson
    [
      ("RoleArn", option_to_yojson orchestration_iam_role_arn_to_yojson x.role_arn);
      ("Parameters", option_to_yojson blueprint_parameters_to_yojson x.parameters);
      ("RollbackErrorMessage", option_to_yojson message_string_to_yojson x.rollback_error_message);
      ("ErrorMessage", option_to_yojson message_string_to_yojson x.error_message);
      ("CompletedOn", option_to_yojson timestamp_value_to_yojson x.completed_on);
      ("StartedOn", option_to_yojson timestamp_value_to_yojson x.started_on);
      ("State", option_to_yojson blueprint_run_state_to_yojson x.state);
      ("WorkflowName", option_to_yojson name_string_to_yojson x.workflow_name);
      ("RunId", option_to_yojson id_string_to_yojson x.run_id);
      ("BlueprintName", option_to_yojson orchestration_name_string_to_yojson x.blueprint_name);
    ]

let blueprint_runs_to_yojson tree = list_to_yojson blueprint_run_to_yojson tree

let get_blueprint_runs_response_to_yojson (x : get_blueprint_runs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("BlueprintRuns", option_to_yojson blueprint_runs_to_yojson x.blueprint_runs);
    ]

let get_blueprint_runs_request_to_yojson (x : get_blueprint_runs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("BlueprintName", Some (name_string_to_yojson x.blueprint_name));
    ]

let get_blueprint_run_response_to_yojson (x : get_blueprint_run_response) =
  assoc_to_yojson [ ("BlueprintRun", option_to_yojson blueprint_run_to_yojson x.blueprint_run) ]

let get_blueprint_run_request_to_yojson (x : get_blueprint_run_request) =
  assoc_to_yojson
    [
      ("RunId", Some (id_string_to_yojson x.run_id));
      ("BlueprintName", Some (orchestration_name_string_to_yojson x.blueprint_name));
    ]

let blueprint_status_to_yojson (x : blueprint_status) =
  match x with
  | FAILED -> `String "FAILED"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"

let blueprint_to_yojson (x : blueprint) =
  assoc_to_yojson
    [
      ( "LastActiveDefinition",
        option_to_yojson last_active_definition_to_yojson x.last_active_definition );
      ("ErrorMessage", option_to_yojson error_string_to_yojson x.error_message);
      ("Status", option_to_yojson blueprint_status_to_yojson x.status);
      ( "BlueprintServiceLocation",
        option_to_yojson generic_string_to_yojson x.blueprint_service_location );
      ("BlueprintLocation", option_to_yojson generic_string_to_yojson x.blueprint_location);
      ("ParameterSpec", option_to_yojson blueprint_parameter_spec_to_yojson x.parameter_spec);
      ("LastModifiedOn", option_to_yojson timestamp_value_to_yojson x.last_modified_on);
      ("CreatedOn", option_to_yojson timestamp_value_to_yojson x.created_on);
      ("Description", option_to_yojson generic512_char_string_to_yojson x.description);
      ("Name", option_to_yojson orchestration_name_string_to_yojson x.name);
    ]

let get_blueprint_response_to_yojson (x : get_blueprint_response) =
  assoc_to_yojson [ ("Blueprint", option_to_yojson blueprint_to_yojson x.blueprint) ]

let get_blueprint_request_to_yojson (x : get_blueprint_request) =
  assoc_to_yojson
    [
      ("IncludeParameterSpec", option_to_yojson nullable_boolean_to_yojson x.include_parameter_spec);
      ("IncludeBlueprint", option_to_yojson nullable_boolean_to_yojson x.include_blueprint);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let get_asset_type_response_to_yojson (x : get_asset_type_response) =
  assoc_to_yojson
    [
      ("Forms", option_to_yojson asset_type_forms_map_to_yojson x.forms);
      ("Name", option_to_yojson asset_type_name_to_yojson x.name);
      ("Id", option_to_yojson asset_type_id_to_yojson x.id);
    ]

let get_asset_type_request_to_yojson (x : get_asset_type_request) =
  assoc_to_yojson [ ("Identifier", Some (asset_type_id_to_yojson x.identifier)) ]

let get_asset_output_to_yojson (x : get_asset_output) =
  assoc_to_yojson
    [
      ("IterableForms", option_to_yojson iterable_form_map_to_yojson x.iterable_forms);
      ("Attachments", option_to_yojson asset_form_map_to_yojson x.attachments);
      ("Forms", option_to_yojson asset_form_map_to_yojson x.forms);
      ("GlossaryTerms", option_to_yojson glossary_term_id_list_to_yojson x.glossary_terms);
      ("AssetTypeId", Some (asset_type_id_to_yojson x.asset_type_id));
      ("UpdatedAt", option_to_yojson updated_at_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson created_at_to_yojson x.created_at);
      ("Description", option_to_yojson asset_description_to_yojson x.description);
      ("Name", option_to_yojson asset_name_to_yojson x.name);
      ("Id", Some (asset_id_to_yojson x.id));
    ]

let get_asset_input_to_yojson (x : get_asset_input) =
  assoc_to_yojson [ ("Identifier", Some (asset_id_to_yojson x.identifier)) ]

let field_label_to_yojson = string_to_yojson
let field_description_to_yojson = string_to_yojson

let field_filter_operator_to_yojson (x : field_filter_operator) =
  match x with
  | ORDER_BY -> `String "ORDER_BY"
  | CONTAINS -> `String "CONTAINS"
  | LESS_THAN_OR_EQUAL_TO -> `String "LESS_THAN_OR_EQUAL_TO"
  | GREATER_THAN_OR_EQUAL_TO -> `String "GREATER_THAN_OR_EQUAL_TO"
  | NOT_EQUAL_TO -> `String "NOT_EQUAL_TO"
  | EQUAL_TO -> `String "EQUAL_TO"
  | BETWEEN -> `String "BETWEEN"
  | GREATER_THAN -> `String "GREATER_THAN"
  | LESS_THAN -> `String "LESS_THAN"

let field_filter_operators_list_to_yojson tree = list_to_yojson field_filter_operator_to_yojson tree

let field_to_yojson (x : field) =
  assoc_to_yojson
    [
      ("CustomProperties", option_to_yojson custom_properties_to_yojson x.custom_properties);
      ( "NativeDataType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.native_data_type
      );
      ( "ParentField",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.parent_field );
      ( "SupportedFilterOperators",
        option_to_yojson field_filter_operators_list_to_yojson x.supported_filter_operators );
      ("SupportedValues", option_to_yojson list_of_string_to_yojson x.supported_values);
      ("IsDefaultOnCreate", option_to_yojson bool__to_yojson x.is_default_on_create);
      ("IsUpsertable", option_to_yojson bool__to_yojson x.is_upsertable);
      ("IsUpdateable", option_to_yojson bool__to_yojson x.is_updateable);
      ("IsCreateable", option_to_yojson bool__to_yojson x.is_createable);
      ("IsPartitionable", option_to_yojson bool__to_yojson x.is_partitionable);
      ("IsFilterable", option_to_yojson bool__to_yojson x.is_filterable);
      ("IsRetrievable", option_to_yojson bool__to_yojson x.is_retrievable);
      ("IsNullable", option_to_yojson bool__to_yojson x.is_nullable);
      ("IsPrimaryKey", option_to_yojson bool__to_yojson x.is_primary_key);
      ("FieldType", option_to_yojson field_data_type_to_yojson x.field_type);
      ("Description", option_to_yojson field_description_to_yojson x.description);
      ("Label", option_to_yojson field_label_to_yojson x.label);
      ("FieldName", option_to_yojson entity_field_name_to_yojson x.field_name);
    ]

let fields_list_to_yojson tree = list_to_yojson field_to_yojson tree

let federated_resource_already_exists_exception_to_yojson
    (x : federated_resource_already_exists_exception) =
  assoc_to_yojson
    [
      ( "AssociatedGlueResource",
        option_to_yojson glue_resource_arn_to_yojson x.associated_glue_resource );
      ("Message", option_to_yojson message_string_to_yojson x.message);
    ]

let error_by_name_to_yojson tree = map_to_yojson name_string_to_yojson error_detail_to_yojson tree

let disassociate_glossary_terms_response_to_yojson (x : disassociate_glossary_terms_response) =
  assoc_to_yojson
    [
      ("GlossaryTerms", option_to_yojson glossary_term_id_list_to_yojson x.glossary_terms);
      ("AssetIdentifier", option_to_yojson asset_id_to_yojson x.asset_identifier);
    ]

let disassociate_glossary_terms_request_to_yojson (x : disassociate_glossary_terms_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("GlossaryTermIdentifiers", Some (glossary_term_id_list_to_yojson x.glossary_term_identifiers));
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
    ]

let dev_endpoint_names_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let describe_integrations_response_to_yojson (x : describe_integrations_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string128_to_yojson x.marker);
      ("Integrations", option_to_yojson integrations_list_to_yojson x.integrations);
    ]

let describe_integrations_request_to_yojson (x : describe_integrations_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson integration_filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integration_integer_to_yojson x.max_records);
      ("Marker", option_to_yojson string128_to_yojson x.marker);
      ("IntegrationIdentifier", option_to_yojson string128_to_yojson x.integration_identifier);
    ]

let describe_inbound_integrations_response_to_yojson (x : describe_inbound_integrations_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string128_to_yojson x.marker);
      ( "InboundIntegrations",
        option_to_yojson inbound_integrations_list_to_yojson x.inbound_integrations );
    ]

let describe_inbound_integrations_request_to_yojson (x : describe_inbound_integrations_request) =
  assoc_to_yojson
    [
      ("TargetArn", option_to_yojson string512_to_yojson x.target_arn);
      ("MaxRecords", option_to_yojson integration_integer_to_yojson x.max_records);
      ("Marker", option_to_yojson string128_to_yojson x.marker);
      ("IntegrationArn", option_to_yojson string128_to_yojson x.integration_arn);
    ]

let describe_entity_response_to_yojson (x : describe_entity_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Fields", option_to_yojson fields_list_to_yojson x.fields);
    ]

let describe_entity_request_to_yojson (x : describe_entity_request) =
  assoc_to_yojson
    [
      ("DataStoreApiVersion", option_to_yojson api_version_to_yojson x.data_store_api_version);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("EntityName", Some (entity_name_to_yojson x.entity_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("ConnectionName", Some (name_string_to_yojson x.connection_name));
    ]

let auth_configuration_to_yojson (x : auth_configuration) =
  assoc_to_yojson
    [
      ( "CustomAuthenticationProperties",
        option_to_yojson properties_map_to_yojson x.custom_authentication_properties );
      ( "BasicAuthenticationProperties",
        option_to_yojson properties_map_to_yojson x.basic_authentication_properties );
      ("OAuth2Properties", option_to_yojson properties_map_to_yojson x.o_auth2_properties);
      ("SecretArn", option_to_yojson property_to_yojson x.secret_arn);
      ("AuthenticationType", Some (property_to_yojson x.authentication_type));
    ]

let compute_environment_name_to_yojson = string_to_yojson
let compute_environment_configuration_description_string_to_yojson = string_to_yojson

let compute_environment_configuration_to_yojson (x : compute_environment_configuration) =
  assoc_to_yojson
    [
      ( "PhysicalConnectionPropertiesRequired",
        option_to_yojson bool__to_yojson x.physical_connection_properties_required );
      ( "ConnectionPropertiesRequiredOverrides",
        Some (list_of_string_to_yojson x.connection_properties_required_overrides) );
      ( "ConnectionOptionNameOverrides",
        Some (property_name_overrides_to_yojson x.connection_option_name_overrides) );
      ( "ConnectionPropertyNameOverrides",
        Some (property_name_overrides_to_yojson x.connection_property_name_overrides) );
      ("ConnectionOptions", Some (properties_map_to_yojson x.connection_options));
      ( "SupportedAuthenticationTypes",
        Some (authentication_types_to_yojson x.supported_authentication_types) );
      ("ComputeEnvironment", Some (compute_environment_to_yojson x.compute_environment));
      ( "Description",
        Some (compute_environment_configuration_description_string_to_yojson x.description) );
      ("Name", Some (compute_environment_name_to_yojson x.name));
    ]

let compute_environment_configuration_map_to_yojson tree =
  map_to_yojson compute_environment_name_to_yojson compute_environment_configuration_to_yojson tree

let describe_connection_type_response_to_yojson (x : describe_connection_type_response) =
  assoc_to_yojson
    [
      ("RestConfiguration", option_to_yojson rest_configuration_to_yojson x.rest_configuration);
      ( "SparkConnectionProperties",
        option_to_yojson properties_map_to_yojson x.spark_connection_properties );
      ( "PythonConnectionProperties",
        option_to_yojson properties_map_to_yojson x.python_connection_properties );
      ( "AthenaConnectionProperties",
        option_to_yojson properties_map_to_yojson x.athena_connection_properties );
      ( "PhysicalConnectionRequirements",
        option_to_yojson properties_map_to_yojson x.physical_connection_requirements );
      ( "ComputeEnvironmentConfigurations",
        option_to_yojson compute_environment_configuration_map_to_yojson
          x.compute_environment_configurations );
      ( "AuthenticationConfiguration",
        option_to_yojson auth_configuration_to_yojson x.authentication_configuration );
      ("ConnectionOptions", option_to_yojson properties_map_to_yojson x.connection_options);
      ("ConnectionProperties", option_to_yojson properties_map_to_yojson x.connection_properties);
      ("Capabilities", option_to_yojson capabilities_to_yojson x.capabilities);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ConnectionType", option_to_yojson name_string_to_yojson x.connection_type);
    ]

let describe_connection_type_request_to_yojson (x : describe_connection_type_request) =
  assoc_to_yojson [ ("ConnectionType", Some (name_string_to_yojson x.connection_type)) ]

let delete_workflow_response_to_yojson (x : delete_workflow_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let delete_workflow_request_to_yojson (x : delete_workflow_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_user_defined_function_response_to_yojson = unit_to_yojson

let delete_user_defined_function_request_to_yojson (x : delete_user_defined_function_request) =
  assoc_to_yojson
    [
      ("FunctionName", Some (name_string_to_yojson x.function_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let delete_usage_profile_response_to_yojson = unit_to_yojson

let delete_usage_profile_request_to_yojson (x : delete_usage_profile_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_trigger_response_to_yojson (x : delete_trigger_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let delete_trigger_request_to_yojson (x : delete_trigger_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_table_version_response_to_yojson = unit_to_yojson

let delete_table_version_request_to_yojson (x : delete_table_version_request) =
  assoc_to_yojson
    [
      ("VersionId", Some (version_string_to_yojson x.version_id));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let delete_table_response_to_yojson = unit_to_yojson

let delete_table_request_to_yojson (x : delete_table_request) =
  assoc_to_yojson
    [
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ("Name", Some (name_string_to_yojson x.name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let delete_table_optimizer_response_to_yojson = unit_to_yojson

let delete_table_optimizer_request_to_yojson (x : delete_table_optimizer_request) =
  assoc_to_yojson
    [
      ("Type", Some (table_optimizer_type_to_yojson x.type_));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
    ]

let delete_session_response_to_yojson (x : delete_session_response) =
  assoc_to_yojson [ ("Id", option_to_yojson name_string_to_yojson x.id) ]

let delete_session_request_to_yojson (x : delete_session_request) =
  assoc_to_yojson
    [
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("Id", Some (name_string_to_yojson x.id));
    ]

let delete_security_configuration_response_to_yojson = unit_to_yojson

let delete_security_configuration_request_to_yojson (x : delete_security_configuration_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_schema_versions_response_to_yojson (x : delete_schema_versions_response) =
  assoc_to_yojson
    [
      ( "SchemaVersionErrors",
        option_to_yojson schema_version_error_list_to_yojson x.schema_version_errors );
    ]

let delete_schema_versions_input_to_yojson (x : delete_schema_versions_input) =
  assoc_to_yojson
    [
      ("Versions", Some (versions_string_to_yojson x.versions));
      ("SchemaId", Some (schema_id_to_yojson x.schema_id));
    ]

let delete_schema_response_to_yojson (x : delete_schema_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson schema_status_to_yojson x.status);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
    ]

let delete_schema_input_to_yojson (x : delete_schema_input) =
  assoc_to_yojson [ ("SchemaId", Some (schema_id_to_yojson x.schema_id)) ]

let delete_resource_policy_response_to_yojson = unit_to_yojson

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson glue_resource_arn_to_yojson x.resource_arn);
      ("PolicyHashCondition", option_to_yojson hash_string_to_yojson x.policy_hash_condition);
    ]

let delete_registry_response_to_yojson (x : delete_registry_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson registry_status_to_yojson x.status);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
    ]

let delete_registry_input_to_yojson (x : delete_registry_input) =
  assoc_to_yojson [ ("RegistryId", Some (registry_id_to_yojson x.registry_id)) ]

let delete_partition_response_to_yojson = unit_to_yojson

let delete_partition_request_to_yojson (x : delete_partition_request) =
  assoc_to_yojson
    [
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let delete_partition_index_response_to_yojson = unit_to_yojson

let delete_partition_index_request_to_yojson (x : delete_partition_index_request) =
  assoc_to_yojson
    [
      ("IndexName", Some (name_string_to_yojson x.index_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let delete_ml_transform_response_to_yojson (x : delete_ml_transform_response) =
  assoc_to_yojson [ ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id) ]

let delete_ml_transform_request_to_yojson (x : delete_ml_transform_request) =
  assoc_to_yojson [ ("TransformId", Some (hash_string_to_yojson x.transform_id)) ]

let delete_job_response_to_yojson (x : delete_job_response) =
  assoc_to_yojson [ ("JobName", option_to_yojson name_string_to_yojson x.job_name) ]

let delete_job_request_to_yojson (x : delete_job_request) =
  assoc_to_yojson [ ("JobName", Some (name_string_to_yojson x.job_name)) ]

let delete_integration_table_properties_response_to_yojson = unit_to_yojson

let delete_integration_table_properties_request_to_yojson
    (x : delete_integration_table_properties_request) =
  assoc_to_yojson
    [
      ("TableName", Some (string128_to_yojson x.table_name));
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
    ]

let delete_integration_response_to_yojson (x : delete_integration_response) =
  assoc_to_yojson
    [
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
      ("Errors", option_to_yojson integration_error_list_to_yojson x.errors);
      ("CreateTime", Some (integration_timestamp_to_yojson x.create_time));
      ("Status", Some (integration_status_to_yojson x.status));
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
      ( "AdditionalEncryptionContext",
        option_to_yojson integration_additional_encryption_context_map_to_yojson
          x.additional_encryption_context );
      ("KmsKeyId", option_to_yojson string2048_to_yojson x.kms_key_id);
      ("IntegrationArn", Some (string128_to_yojson x.integration_arn));
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("IntegrationName", Some (string128_to_yojson x.integration_name));
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("SourceArn", Some (string512_to_yojson x.source_arn));
    ]

let delete_integration_resource_property_response_to_yojson = unit_to_yojson

let delete_integration_resource_property_request_to_yojson
    (x : delete_integration_resource_property_request) =
  assoc_to_yojson [ ("ResourceArn", Some (string512_to_yojson x.resource_arn)) ]

let delete_integration_request_to_yojson (x : delete_integration_request) =
  assoc_to_yojson [ ("IntegrationIdentifier", Some (string128_to_yojson x.integration_identifier)) ]

let delete_glue_identity_center_configuration_response_to_yojson = unit_to_yojson
let delete_glue_identity_center_configuration_request_to_yojson = unit_to_yojson
let delete_glossary_term_response_to_yojson = unit_to_yojson

let delete_glossary_term_request_to_yojson (x : delete_glossary_term_request) =
  assoc_to_yojson [ ("Identifier", Some (glossary_term_id_to_yojson x.identifier)) ]

let delete_glossary_response_to_yojson = unit_to_yojson

let delete_glossary_request_to_yojson (x : delete_glossary_request) =
  assoc_to_yojson [ ("Identifier", Some (glossary_id_to_yojson x.identifier)) ]

let delete_form_type_response_to_yojson = unit_to_yojson

let delete_form_type_request_to_yojson (x : delete_form_type_request) =
  assoc_to_yojson [ ("Identifier", Some (form_type_id_to_yojson x.identifier)) ]

let delete_dev_endpoint_response_to_yojson = unit_to_yojson

let delete_dev_endpoint_request_to_yojson (x : delete_dev_endpoint_request) =
  assoc_to_yojson [ ("EndpointName", Some (generic_string_to_yojson x.endpoint_name)) ]

let delete_database_response_to_yojson = unit_to_yojson

let delete_database_request_to_yojson (x : delete_database_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_string_to_yojson x.name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let delete_data_quality_ruleset_response_to_yojson = unit_to_yojson

let delete_data_quality_ruleset_request_to_yojson (x : delete_data_quality_ruleset_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_custom_entity_type_response_to_yojson (x : delete_custom_entity_type_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let delete_custom_entity_type_request_to_yojson (x : delete_custom_entity_type_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_crawler_response_to_yojson = unit_to_yojson

let delete_crawler_request_to_yojson (x : delete_crawler_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_connection_type_response_to_yojson = unit_to_yojson

let delete_connection_type_request_to_yojson (x : delete_connection_type_request) =
  assoc_to_yojson [ ("ConnectionType", Some (name_string_to_yojson x.connection_type)) ]

let delete_connection_response_to_yojson = unit_to_yojson

let delete_connection_request_to_yojson (x : delete_connection_request) =
  assoc_to_yojson
    [
      ("ConnectionName", Some (name_string_to_yojson x.connection_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let delete_connection_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree
let delete_column_statistics_task_settings_response_to_yojson = unit_to_yojson

let delete_column_statistics_task_settings_request_to_yojson
    (x : delete_column_statistics_task_settings_request) =
  assoc_to_yojson
    [
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
    ]

let delete_column_statistics_for_table_response_to_yojson = unit_to_yojson

let delete_column_statistics_for_table_request_to_yojson
    (x : delete_column_statistics_for_table_request) =
  assoc_to_yojson
    [
      ("ColumnName", Some (name_string_to_yojson x.column_name));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let delete_column_statistics_for_partition_response_to_yojson = unit_to_yojson

let delete_column_statistics_for_partition_request_to_yojson
    (x : delete_column_statistics_for_partition_request) =
  assoc_to_yojson
    [
      ("ColumnName", Some (name_string_to_yojson x.column_name));
      ("PartitionValues", Some (value_string_list_to_yojson x.partition_values));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let delete_classifier_response_to_yojson = unit_to_yojson

let delete_classifier_request_to_yojson (x : delete_classifier_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_catalog_response_to_yojson = unit_to_yojson

let delete_catalog_request_to_yojson (x : delete_catalog_request) =
  assoc_to_yojson [ ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id)) ]

let delete_blueprint_response_to_yojson (x : delete_blueprint_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let delete_blueprint_request_to_yojson (x : delete_blueprint_request) =
  assoc_to_yojson [ ("Name", Some (name_string_to_yojson x.name)) ]

let delete_attachment_response_to_yojson (x : delete_attachment_response) =
  assoc_to_yojson [ ("AssetIdentifier", option_to_yojson asset_id_to_yojson x.asset_identifier) ]

let delete_attachment_request_to_yojson (x : delete_attachment_request) =
  assoc_to_yojson
    [
      ("AttachmentName", Some (attachment_name_to_yojson x.attachment_name));
      ("ItemIdentifier", option_to_yojson item_identifier_to_yojson x.item_identifier);
      ("IterableFormName", option_to_yojson iterable_form_name_to_yojson x.iterable_form_name);
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
    ]

let delete_asset_type_response_to_yojson = unit_to_yojson

let delete_asset_type_request_to_yojson (x : delete_asset_type_request) =
  assoc_to_yojson [ ("Identifier", Some (asset_type_id_to_yojson x.identifier)) ]

let delete_asset_response_to_yojson = unit_to_yojson

let delete_asset_request_to_yojson (x : delete_asset_request) =
  assoc_to_yojson [ ("Identifier", Some (asset_id_to_yojson x.identifier)) ]

let data_quality_result_to_yojson (x : data_quality_result) =
  assoc_to_yojson
    [
      ( "AggregatedMetrics",
        option_to_yojson data_quality_aggregated_metrics_to_yojson x.aggregated_metrics );
      ("Observations", option_to_yojson data_quality_observations_to_yojson x.observations);
      ( "AnalyzerResults",
        option_to_yojson data_quality_analyzer_results_to_yojson x.analyzer_results );
      ("RuleResults", option_to_yojson data_quality_rule_results_to_yojson x.rule_results);
      ("RulesetEvaluationRunId", option_to_yojson hash_string_to_yojson x.ruleset_evaluation_run_id);
      ("JobRunId", option_to_yojson hash_string_to_yojson x.job_run_id);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
      ("CompletedOn", option_to_yojson timestamp_to_yojson x.completed_on);
      ("StartedOn", option_to_yojson timestamp_to_yojson x.started_on);
      ("EvaluationContext", option_to_yojson generic_string_to_yojson x.evaluation_context);
      ("RulesetName", option_to_yojson name_string_to_yojson x.ruleset_name);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("Score", option_to_yojson generic_bounded_double_to_yojson x.score);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
      ("ResultId", option_to_yojson hash_string_to_yojson x.result_id);
    ]

let data_quality_results_list_to_yojson tree = list_to_yojson data_quality_result_to_yojson tree
let data_quality_result_ids_to_yojson tree = list_to_yojson hash_string_to_yojson tree
let custom_entity_type_names_to_yojson tree = list_to_yojson name_string_to_yojson tree

let create_xml_classifier_request_to_yojson (x : create_xml_classifier_request) =
  assoc_to_yojson
    [
      ("RowTag", option_to_yojson row_tag_to_yojson x.row_tag);
      ("Name", Some (name_string_to_yojson x.name));
      ("Classification", Some (classification_to_yojson x.classification));
    ]

let create_workflow_response_to_yojson (x : create_workflow_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_workflow_request_to_yojson (x : create_workflow_request) =
  assoc_to_yojson
    [
      ("MaxConcurrentRuns", option_to_yojson nullable_integer_to_yojson x.max_concurrent_runs);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ( "DefaultRunProperties",
        option_to_yojson workflow_run_properties_to_yojson x.default_run_properties );
      ("Description", option_to_yojson workflow_description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_user_defined_function_response_to_yojson = unit_to_yojson

let create_user_defined_function_request_to_yojson (x : create_user_defined_function_request) =
  assoc_to_yojson
    [
      ("FunctionInput", Some (user_defined_function_input_to_yojson x.function_input));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let create_usage_profile_response_to_yojson (x : create_usage_profile_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_usage_profile_request_to_yojson (x : create_usage_profile_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("Configuration", Some (profile_configuration_to_yojson x.configuration));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_trigger_response_to_yojson (x : create_trigger_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_trigger_request_to_yojson (x : create_trigger_request) =
  assoc_to_yojson
    [
      ( "EventBatchingCondition",
        option_to_yojson event_batching_condition_to_yojson x.event_batching_condition );
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("StartOnCreation", option_to_yojson boolean_value_to_yojson x.start_on_creation);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Actions", Some (action_list_to_yojson x.actions));
      ("Predicate", option_to_yojson predicate_to_yojson x.predicate);
      ("Schedule", option_to_yojson generic_string_to_yojson x.schedule);
      ("Type", Some (trigger_type_to_yojson x.type_));
      ("WorkflowName", option_to_yojson name_string_to_yojson x.workflow_name);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_table_response_to_yojson = unit_to_yojson

let create_table_request_to_yojson (x : create_table_request) =
  assoc_to_yojson
    [
      ( "OpenTableFormatInput",
        option_to_yojson open_table_format_input_to_yojson x.open_table_format_input );
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ("PartitionIndexes", option_to_yojson partition_index_list_to_yojson x.partition_indexes);
      ("TableInput", option_to_yojson table_input_to_yojson x.table_input);
      ("Name", option_to_yojson name_string_to_yojson x.name);
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let create_table_optimizer_response_to_yojson = unit_to_yojson

let create_table_optimizer_request_to_yojson (x : create_table_optimizer_request) =
  assoc_to_yojson
    [
      ( "TableOptimizerConfiguration",
        Some (table_optimizer_configuration_to_yojson x.table_optimizer_configuration) );
      ("Type", Some (table_optimizer_type_to_yojson x.type_));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", Some (catalog_id_string_to_yojson x.catalog_id));
    ]

let create_session_response_to_yojson (x : create_session_response) =
  assoc_to_yojson [ ("Session", option_to_yojson session_to_yojson x.session) ]

let create_session_request_to_yojson (x : create_session_request) =
  assoc_to_yojson
    [
      ("SessionType", option_to_yojson session_type_to_yojson x.session_type);
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("Connections", option_to_yojson connections_list_to_yojson x.connections);
      ( "DefaultArguments",
        option_to_yojson orchestration_arguments_map_to_yojson x.default_arguments );
      ("IdleTimeout", option_to_yojson timeout_to_yojson x.idle_timeout);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("Command", Some (session_command_to_yojson x.command));
      ("Role", Some (orchestration_role_arn_to_yojson x.role));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Id", Some (name_string_to_yojson x.id));
    ]

let create_security_configuration_response_to_yojson (x : create_security_configuration_response) =
  assoc_to_yojson
    [
      ("CreatedTimestamp", option_to_yojson timestamp_value_to_yojson x.created_timestamp);
      ("Name", option_to_yojson name_string_to_yojson x.name);
    ]

let create_security_configuration_request_to_yojson (x : create_security_configuration_request) =
  assoc_to_yojson
    [
      ( "EncryptionConfiguration",
        Some (encryption_configuration_to_yojson x.encryption_configuration) );
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_script_response_to_yojson (x : create_script_response) =
  assoc_to_yojson
    [
      ("ScalaCode", option_to_yojson scala_code_to_yojson x.scala_code);
      ("PythonScript", option_to_yojson python_script_to_yojson x.python_script);
    ]

let create_script_request_to_yojson (x : create_script_request) =
  assoc_to_yojson
    [
      ("Language", option_to_yojson language_to_yojson x.language);
      ("DagEdges", option_to_yojson dag_edges_to_yojson x.dag_edges);
      ("DagNodes", option_to_yojson dag_nodes_to_yojson x.dag_nodes);
    ]

let create_schema_response_to_yojson (x : create_schema_response) =
  assoc_to_yojson
    [
      ( "SchemaVersionStatus",
        option_to_yojson schema_version_status_to_yojson x.schema_version_status );
      ("SchemaVersionId", option_to_yojson schema_version_id_string_to_yojson x.schema_version_id);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("SchemaStatus", option_to_yojson schema_status_to_yojson x.schema_status);
      ("NextSchemaVersion", option_to_yojson version_long_number_to_yojson x.next_schema_version);
      ("LatestSchemaVersion", option_to_yojson version_long_number_to_yojson x.latest_schema_version);
      ("SchemaCheckpoint", option_to_yojson schema_checkpoint_number_to_yojson x.schema_checkpoint);
      ("Compatibility", option_to_yojson compatibility_to_yojson x.compatibility);
      ("DataFormat", option_to_yojson data_format_to_yojson x.data_format);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("SchemaArn", option_to_yojson glue_resource_arn_to_yojson x.schema_arn);
      ("SchemaName", option_to_yojson schema_registry_name_string_to_yojson x.schema_name);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
    ]

let create_schema_input_to_yojson (x : create_schema_input) =
  assoc_to_yojson
    [
      ("SchemaDefinition", option_to_yojson schema_definition_string_to_yojson x.schema_definition);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Compatibility", option_to_yojson compatibility_to_yojson x.compatibility);
      ("DataFormat", Some (data_format_to_yojson x.data_format));
      ("SchemaName", Some (schema_registry_name_string_to_yojson x.schema_name));
      ("RegistryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let create_registry_response_to_yojson (x : create_registry_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("RegistryName", option_to_yojson schema_registry_name_string_to_yojson x.registry_name);
      ("RegistryArn", option_to_yojson glue_resource_arn_to_yojson x.registry_arn);
    ]

let create_registry_input_to_yojson (x : create_registry_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("RegistryName", Some (schema_registry_name_string_to_yojson x.registry_name));
    ]

let create_partition_response_to_yojson = unit_to_yojson

let create_partition_request_to_yojson (x : create_partition_request) =
  assoc_to_yojson
    [
      ("PartitionInput", Some (partition_input_to_yojson x.partition_input));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let create_partition_index_response_to_yojson = unit_to_yojson

let create_partition_index_request_to_yojson (x : create_partition_index_request) =
  assoc_to_yojson
    [
      ("PartitionIndex", Some (partition_index_to_yojson x.partition_index));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let create_ml_transform_response_to_yojson (x : create_ml_transform_response) =
  assoc_to_yojson [ ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id) ]

let create_ml_transform_request_to_yojson (x : create_ml_transform_request) =
  assoc_to_yojson
    [
      ("TransformEncryption", option_to_yojson transform_encryption_to_yojson x.transform_encryption);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("MaxRetries", option_to_yojson nullable_integer_to_yojson x.max_retries);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("Role", Some (role_string_to_yojson x.role));
      ("Parameters", Some (transform_parameters_to_yojson x.parameters));
      ("InputRecordTables", Some (glue_tables_to_yojson x.input_record_tables));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_json_classifier_request_to_yojson (x : create_json_classifier_request) =
  assoc_to_yojson
    [
      ("JsonPath", Some (json_path_to_yojson x.json_path));
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_job_response_to_yojson (x : create_job_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_job_request_to_yojson (x : create_job_request) =
  assoc_to_yojson
    [
      ("MaintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "SourceControlDetails",
        option_to_yojson source_control_details_to_yojson x.source_control_details );
      ("ExecutionClass", option_to_yojson execution_class_to_yojson x.execution_class);
      ( "CodeGenConfigurationNodes",
        option_to_yojson code_gen_configuration_nodes_to_yojson x.code_gen_configuration_nodes );
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ( "NotificationProperty",
        option_to_yojson notification_property_to_yojson x.notification_property );
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("MaxCapacity", option_to_yojson nullable_double_to_yojson x.max_capacity);
      ("Timeout", option_to_yojson timeout_to_yojson x.timeout);
      ("AllocatedCapacity", option_to_yojson integer_value_to_yojson x.allocated_capacity);
      ("MaxRetries", option_to_yojson max_retries_to_yojson x.max_retries);
      ("Connections", option_to_yojson connections_list_to_yojson x.connections);
      ("NonOverridableArguments", option_to_yojson generic_map_to_yojson x.non_overridable_arguments);
      ("DefaultArguments", option_to_yojson generic_map_to_yojson x.default_arguments);
      ("Command", Some (job_command_to_yojson x.command));
      ("ExecutionProperty", option_to_yojson execution_property_to_yojson x.execution_property);
      ("Role", Some (role_string_to_yojson x.role));
      ("LogUri", option_to_yojson uri_string_to_yojson x.log_uri);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("JobRunQueuingEnabled", option_to_yojson nullable_boolean_to_yojson x.job_run_queuing_enabled);
      ("JobMode", option_to_yojson job_mode_to_yojson x.job_mode);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_integration_table_properties_response_to_yojson = unit_to_yojson

let create_integration_table_properties_request_to_yojson
    (x : create_integration_table_properties_request) =
  assoc_to_yojson
    [
      ("TargetTableConfig", option_to_yojson target_table_config_to_yojson x.target_table_config);
      ("SourceTableConfig", option_to_yojson source_table_config_to_yojson x.source_table_config);
      ("TableName", Some (string128_to_yojson x.table_name));
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
    ]

let create_integration_response_to_yojson (x : create_integration_response) =
  assoc_to_yojson
    [
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
      ("Errors", option_to_yojson integration_error_list_to_yojson x.errors);
      ("CreateTime", Some (integration_timestamp_to_yojson x.create_time));
      ("Status", Some (integration_status_to_yojson x.status));
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
      ( "AdditionalEncryptionContext",
        option_to_yojson integration_additional_encryption_context_map_to_yojson
          x.additional_encryption_context );
      ("KmsKeyId", option_to_yojson string2048_to_yojson x.kms_key_id);
      ("IntegrationArn", Some (string128_to_yojson x.integration_arn));
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("IntegrationName", Some (string128_to_yojson x.integration_name));
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("SourceArn", Some (string512_to_yojson x.source_arn));
    ]

let create_integration_resource_property_response_to_yojson
    (x : create_integration_resource_property_response) =
  assoc_to_yojson
    [
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ("ResourcePropertyArn", option_to_yojson string512_to_yojson x.resource_property_arn);
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
    ]

let create_integration_resource_property_request_to_yojson
    (x : create_integration_resource_property_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
      ( "TargetProcessingProperties",
        option_to_yojson target_processing_properties_to_yojson x.target_processing_properties );
      ( "SourceProcessingProperties",
        option_to_yojson source_processing_properties_to_yojson x.source_processing_properties );
      ("ResourceArn", Some (string512_to_yojson x.resource_arn));
    ]

let create_integration_request_to_yojson (x : create_integration_request) =
  assoc_to_yojson
    [
      ("IntegrationConfig", option_to_yojson integration_config_to_yojson x.integration_config);
      ("Tags", option_to_yojson integration_tags_list_to_yojson x.tags);
      ( "AdditionalEncryptionContext",
        option_to_yojson integration_additional_encryption_context_map_to_yojson
          x.additional_encryption_context );
      ("KmsKeyId", option_to_yojson string2048_to_yojson x.kms_key_id);
      ("DataFilter", option_to_yojson string2048_to_yojson x.data_filter);
      ("Description", option_to_yojson integration_description_to_yojson x.description);
      ("TargetArn", Some (string512_to_yojson x.target_arn));
      ("SourceArn", Some (string512_to_yojson x.source_arn));
      ("IntegrationName", Some (string128_to_yojson x.integration_name));
    ]

let create_grok_classifier_request_to_yojson (x : create_grok_classifier_request) =
  assoc_to_yojson
    [
      ("CustomPatterns", option_to_yojson custom_patterns_to_yojson x.custom_patterns);
      ("GrokPattern", Some (grok_pattern_to_yojson x.grok_pattern));
      ("Name", Some (name_string_to_yojson x.name));
      ("Classification", Some (classification_to_yojson x.classification));
    ]

let create_glue_identity_center_configuration_response_to_yojson
    (x : create_glue_identity_center_configuration_response) =
  assoc_to_yojson
    [ ("ApplicationArn", option_to_yojson application_arn_to_yojson x.application_arn) ]

let create_glue_identity_center_configuration_request_to_yojson
    (x : create_glue_identity_center_configuration_request) =
  assoc_to_yojson
    [
      ( "UserBackgroundSessionsEnabled",
        option_to_yojson nullable_boolean_to_yojson x.user_background_sessions_enabled );
      ("Scopes", option_to_yojson identity_center_scopes_list_to_yojson x.scopes);
      ("InstanceArn", Some (identity_center_instance_arn_to_yojson x.instance_arn));
    ]

let create_glossary_term_response_to_yojson (x : create_glossary_term_response) =
  assoc_to_yojson
    [
      ("LongDescription", option_to_yojson glossary_long_description_to_yojson x.long_description);
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
      ("Name", option_to_yojson glossary_term_name_to_yojson x.name);
      ("GlossaryId", option_to_yojson glossary_id_to_yojson x.glossary_id);
      ("Id", option_to_yojson glossary_term_id_to_yojson x.id);
    ]

let create_glossary_term_request_to_yojson (x : create_glossary_term_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LongDescription", option_to_yojson glossary_long_description_to_yojson x.long_description);
      ("ShortDescription", option_to_yojson glossary_short_description_to_yojson x.short_description);
      ("Name", Some (glossary_term_name_to_yojson x.name));
      ("GlossaryIdentifier", Some (glossary_id_to_yojson x.glossary_identifier));
    ]

let create_glossary_response_to_yojson (x : create_glossary_response) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
      ("Name", option_to_yojson glossary_name_to_yojson x.name);
      ("Id", option_to_yojson glossary_id_to_yojson x.id);
    ]

let create_glossary_request_to_yojson (x : create_glossary_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Description", option_to_yojson metadata_description_to_yojson x.description);
      ("Name", Some (glossary_name_to_yojson x.name));
    ]

let create_dev_endpoint_response_to_yojson (x : create_dev_endpoint_response) =
  assoc_to_yojson
    [
      ("Arguments", option_to_yojson map_value_to_yojson x.arguments);
      ("CreatedTimestamp", option_to_yojson timestamp_value_to_yojson x.created_timestamp);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("FailureReason", option_to_yojson generic_string_to_yojson x.failure_reason);
      ("ExtraJarsS3Path", option_to_yojson generic_string_to_yojson x.extra_jars_s3_path);
      ( "ExtraPythonLibsS3Path",
        option_to_yojson generic_string_to_yojson x.extra_python_libs_s3_path );
      ("VpcId", option_to_yojson generic_string_to_yojson x.vpc_id);
      ("AvailabilityZone", option_to_yojson generic_string_to_yojson x.availability_zone);
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfNodes", option_to_yojson integer_value_to_yojson x.number_of_nodes);
      ( "ZeppelinRemoteSparkInterpreterPort",
        option_to_yojson integer_value_to_yojson x.zeppelin_remote_spark_interpreter_port );
      ("YarnEndpointAddress", option_to_yojson generic_string_to_yojson x.yarn_endpoint_address);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("SubnetId", option_to_yojson generic_string_to_yojson x.subnet_id);
      ("SecurityGroupIds", option_to_yojson string_list_to_yojson x.security_group_ids);
      ("Status", option_to_yojson generic_string_to_yojson x.status);
      ("EndpointName", option_to_yojson generic_string_to_yojson x.endpoint_name);
    ]

let create_dev_endpoint_request_to_yojson (x : create_dev_endpoint_request) =
  assoc_to_yojson
    [
      ("Arguments", option_to_yojson map_value_to_yojson x.arguments);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("ExtraJarsS3Path", option_to_yojson generic_string_to_yojson x.extra_jars_s3_path);
      ( "ExtraPythonLibsS3Path",
        option_to_yojson generic_string_to_yojson x.extra_python_libs_s3_path );
      ("NumberOfWorkers", option_to_yojson nullable_integer_to_yojson x.number_of_workers);
      ("GlueVersion", option_to_yojson glue_version_string_to_yojson x.glue_version);
      ("WorkerType", option_to_yojson worker_type_to_yojson x.worker_type);
      ("NumberOfNodes", option_to_yojson integer_value_to_yojson x.number_of_nodes);
      ("PublicKeys", option_to_yojson public_keys_list_to_yojson x.public_keys);
      ("PublicKey", option_to_yojson generic_string_to_yojson x.public_key);
      ("SubnetId", option_to_yojson generic_string_to_yojson x.subnet_id);
      ("SecurityGroupIds", option_to_yojson string_list_to_yojson x.security_group_ids);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("EndpointName", Some (generic_string_to_yojson x.endpoint_name));
    ]

let create_database_response_to_yojson = unit_to_yojson

let create_database_request_to_yojson (x : create_database_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("DatabaseInput", Some (database_input_to_yojson x.database_input));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let create_data_quality_ruleset_response_to_yojson (x : create_data_quality_ruleset_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_data_quality_ruleset_request_to_yojson (x : create_data_quality_ruleset_request) =
  assoc_to_yojson
    [
      ("ClientToken", option_to_yojson hash_string_to_yojson x.client_token);
      ( "DataQualitySecurityConfiguration",
        option_to_yojson name_string_to_yojson x.data_quality_security_configuration );
      ("TargetTable", option_to_yojson data_quality_target_table_to_yojson x.target_table);
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("Ruleset", Some (data_quality_ruleset_string_to_yojson x.ruleset));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_custom_entity_type_response_to_yojson (x : create_custom_entity_type_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_custom_entity_type_request_to_yojson (x : create_custom_entity_type_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("ContextWords", option_to_yojson context_words_to_yojson x.context_words);
      ("RegexString", Some (name_string_to_yojson x.regex_string));
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_csv_classifier_request_to_yojson (x : create_csv_classifier_request) =
  assoc_to_yojson
    [
      ("Serde", option_to_yojson csv_serde_option_to_yojson x.serde);
      ("CustomDatatypes", option_to_yojson custom_datatypes_to_yojson x.custom_datatypes);
      ( "CustomDatatypeConfigured",
        option_to_yojson nullable_boolean_to_yojson x.custom_datatype_configured );
      ("AllowSingleColumn", option_to_yojson nullable_boolean_to_yojson x.allow_single_column);
      ("DisableValueTrimming", option_to_yojson nullable_boolean_to_yojson x.disable_value_trimming);
      ("Header", option_to_yojson csv_header_to_yojson x.header);
      ("ContainsHeader", option_to_yojson csv_header_option_to_yojson x.contains_header);
      ("QuoteSymbol", option_to_yojson csv_quote_symbol_to_yojson x.quote_symbol);
      ("Delimiter", option_to_yojson csv_column_delimiter_to_yojson x.delimiter);
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_crawler_response_to_yojson = unit_to_yojson

let create_crawler_request_to_yojson (x : create_crawler_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ( "CrawlerSecurityConfiguration",
        option_to_yojson crawler_security_configuration_to_yojson x.crawler_security_configuration
      );
      ("Configuration", option_to_yojson crawler_configuration_to_yojson x.configuration);
      ( "LakeFormationConfiguration",
        option_to_yojson lake_formation_configuration_to_yojson x.lake_formation_configuration );
      ( "LineageConfiguration",
        option_to_yojson lineage_configuration_to_yojson x.lineage_configuration );
      ("RecrawlPolicy", option_to_yojson recrawl_policy_to_yojson x.recrawl_policy);
      ("SchemaChangePolicy", option_to_yojson schema_change_policy_to_yojson x.schema_change_policy);
      ("TablePrefix", option_to_yojson table_prefix_to_yojson x.table_prefix);
      ("Classifiers", option_to_yojson classifier_name_list_to_yojson x.classifiers);
      ("Schedule", option_to_yojson cron_expression_to_yojson x.schedule);
      ("Targets", Some (crawler_targets_to_yojson x.targets));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("DatabaseName", option_to_yojson database_name_to_yojson x.database_name);
      ("Role", Some (role_to_yojson x.role));
      ("Name", Some (name_string_to_yojson x.name));
    ]

let create_connection_response_to_yojson (x : create_connection_response) =
  assoc_to_yojson
    [
      ( "CreateConnectionStatus",
        option_to_yojson connection_status_to_yojson x.create_connection_status );
    ]

let create_connection_request_to_yojson (x : create_connection_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("ConnectionInput", Some (connection_input_to_yojson x.connection_input));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let create_column_statistics_task_settings_response_to_yojson = unit_to_yojson

let create_column_statistics_task_settings_request_to_yojson
    (x : create_column_statistics_task_settings_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("SecurityConfiguration", option_to_yojson name_string_to_yojson x.security_configuration);
      ("CatalogID", option_to_yojson name_string_to_yojson x.catalog_i_d);
      ("SampleSize", option_to_yojson sample_size_percentage_to_yojson x.sample_size);
      ("ColumnNameList", option_to_yojson column_name_list_to_yojson x.column_name_list);
      ("Schedule", option_to_yojson cron_expression_to_yojson x.schedule);
      ("Role", Some (name_string_to_yojson x.role));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
    ]

let create_classifier_response_to_yojson = unit_to_yojson

let create_classifier_request_to_yojson (x : create_classifier_request) =
  assoc_to_yojson
    [
      ("CsvClassifier", option_to_yojson create_csv_classifier_request_to_yojson x.csv_classifier);
      ("JsonClassifier", option_to_yojson create_json_classifier_request_to_yojson x.json_classifier);
      ("XMLClassifier", option_to_yojson create_xml_classifier_request_to_yojson x.xml_classifier);
      ("GrokClassifier", option_to_yojson create_grok_classifier_request_to_yojson x.grok_classifier);
    ]

let create_catalog_response_to_yojson = unit_to_yojson

let create_catalog_request_to_yojson (x : create_catalog_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("CatalogInput", Some (catalog_input_to_yojson x.catalog_input));
      ("Name", Some (catalog_name_string_to_yojson x.name));
    ]

let create_blueprint_response_to_yojson (x : create_blueprint_response) =
  assoc_to_yojson [ ("Name", option_to_yojson name_string_to_yojson x.name) ]

let create_blueprint_request_to_yojson (x : create_blueprint_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_map_to_yojson x.tags);
      ("BlueprintLocation", Some (orchestration_s3_location_to_yojson x.blueprint_location));
      ("Description", option_to_yojson generic512_char_string_to_yojson x.description);
      ("Name", Some (orchestration_name_string_to_yojson x.name));
    ]

let check_schema_version_validity_response_to_yojson (x : check_schema_version_validity_response) =
  assoc_to_yojson
    [
      ("Error", option_to_yojson schema_validation_error_to_yojson x.error);
      ("Valid", option_to_yojson is_version_valid_to_yojson x.valid);
    ]

let check_schema_version_validity_input_to_yojson (x : check_schema_version_validity_input) =
  assoc_to_yojson
    [
      ("SchemaDefinition", Some (schema_definition_string_to_yojson x.schema_definition));
      ("DataFormat", Some (data_format_to_yojson x.data_format));
    ]

let cancel_statement_response_to_yojson = unit_to_yojson

let cancel_statement_request_to_yojson (x : cancel_statement_request) =
  assoc_to_yojson
    [
      ("RequestOrigin", option_to_yojson orchestration_name_string_to_yojson x.request_origin);
      ("Id", Some (integer_value_to_yojson x.id));
      ("SessionId", Some (name_string_to_yojson x.session_id));
    ]

let cancel_ml_task_run_response_to_yojson (x : cancel_ml_task_run_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson task_status_type_to_yojson x.status);
      ("TaskRunId", option_to_yojson hash_string_to_yojson x.task_run_id);
      ("TransformId", option_to_yojson hash_string_to_yojson x.transform_id);
    ]

let cancel_ml_task_run_request_to_yojson (x : cancel_ml_task_run_request) =
  assoc_to_yojson
    [
      ("TaskRunId", Some (hash_string_to_yojson x.task_run_id));
      ("TransformId", Some (hash_string_to_yojson x.transform_id));
    ]

let cancel_data_quality_ruleset_evaluation_run_response_to_yojson = unit_to_yojson

let cancel_data_quality_ruleset_evaluation_run_request_to_yojson
    (x : cancel_data_quality_ruleset_evaluation_run_request) =
  assoc_to_yojson [ ("RunId", Some (hash_string_to_yojson x.run_id)) ]

let cancel_data_quality_rule_recommendation_run_response_to_yojson = unit_to_yojson

let cancel_data_quality_rule_recommendation_run_request_to_yojson
    (x : cancel_data_quality_rule_recommendation_run_request) =
  assoc_to_yojson [ ("RunId", Some (hash_string_to_yojson x.run_id)) ]

let blueprints_to_yojson tree = list_to_yojson blueprint_to_yojson tree

let batch_update_partition_failure_entry_to_yojson (x : batch_update_partition_failure_entry) =
  assoc_to_yojson
    [
      ("ErrorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
      ( "PartitionValueList",
        option_to_yojson bounded_partition_value_list_to_yojson x.partition_value_list );
    ]

let batch_update_partition_failure_list_to_yojson tree =
  list_to_yojson batch_update_partition_failure_entry_to_yojson tree

let batch_update_partition_response_to_yojson (x : batch_update_partition_response) =
  assoc_to_yojson
    [ ("Errors", option_to_yojson batch_update_partition_failure_list_to_yojson x.errors) ]

let batch_update_partition_request_entry_to_yojson (x : batch_update_partition_request_entry) =
  assoc_to_yojson
    [
      ("PartitionInput", Some (partition_input_to_yojson x.partition_input));
      ("PartitionValueList", Some (bounded_partition_value_list_to_yojson x.partition_value_list));
    ]

let batch_update_partition_request_entry_list_to_yojson tree =
  list_to_yojson batch_update_partition_request_entry_to_yojson tree

let batch_update_partition_request_to_yojson (x : batch_update_partition_request) =
  assoc_to_yojson
    [
      ("Entries", Some (batch_update_partition_request_entry_list_to_yojson x.entries));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let batch_table_optimizer_to_yojson (x : batch_table_optimizer) =
  assoc_to_yojson
    [
      ("tableOptimizer", option_to_yojson table_optimizer_to_yojson x.table_optimizer);
      ("tableName", option_to_yojson table_name_string_to_yojson x.table_name);
      ("databaseName", option_to_yojson database_name_string_to_yojson x.database_name);
      ("catalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let batch_table_optimizers_to_yojson tree = list_to_yojson batch_table_optimizer_to_yojson tree

let batch_stop_job_run_successful_submission_to_yojson
    (x : batch_stop_job_run_successful_submission) =
  assoc_to_yojson
    [
      ("JobRunId", option_to_yojson id_string_to_yojson x.job_run_id);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
    ]

let batch_stop_job_run_successful_submission_list_to_yojson tree =
  list_to_yojson batch_stop_job_run_successful_submission_to_yojson tree

let batch_stop_job_run_error_to_yojson (x : batch_stop_job_run_error) =
  assoc_to_yojson
    [
      ("ErrorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
      ("JobRunId", option_to_yojson id_string_to_yojson x.job_run_id);
      ("JobName", option_to_yojson name_string_to_yojson x.job_name);
    ]

let batch_stop_job_run_error_list_to_yojson tree =
  list_to_yojson batch_stop_job_run_error_to_yojson tree

let batch_stop_job_run_response_to_yojson (x : batch_stop_job_run_response) =
  assoc_to_yojson
    [
      ("Errors", option_to_yojson batch_stop_job_run_error_list_to_yojson x.errors);
      ( "SuccessfulSubmissions",
        option_to_yojson batch_stop_job_run_successful_submission_list_to_yojson
          x.successful_submissions );
    ]

let batch_stop_job_run_job_run_id_list_to_yojson tree = list_to_yojson id_string_to_yojson tree

let batch_stop_job_run_request_to_yojson (x : batch_stop_job_run_request) =
  assoc_to_yojson
    [
      ("JobRunIds", Some (batch_stop_job_run_job_run_id_list_to_yojson x.job_run_ids));
      ("JobName", Some (name_string_to_yojson x.job_name));
    ]

let annotation_error_to_yojson (x : annotation_error) =
  assoc_to_yojson
    [
      ("FailureReason", option_to_yojson description_string_to_yojson x.failure_reason);
      ("StatisticId", option_to_yojson hash_string_to_yojson x.statistic_id);
      ("ProfileId", option_to_yojson hash_string_to_yojson x.profile_id);
    ]

let annotation_error_list_to_yojson tree = list_to_yojson annotation_error_to_yojson tree

let batch_put_data_quality_statistic_annotation_response_to_yojson
    (x : batch_put_data_quality_statistic_annotation_response) =
  assoc_to_yojson
    [
      ( "FailedInclusionAnnotations",
        option_to_yojson annotation_error_list_to_yojson x.failed_inclusion_annotations );
    ]

let batch_put_data_quality_statistic_annotation_request_to_yojson
    (x : batch_put_data_quality_statistic_annotation_request) =
  assoc_to_yojson
    [
      ("ClientToken", option_to_yojson hash_string_to_yojson x.client_token);
      ("InclusionAnnotations", Some (inclusion_annotation_list_to_yojson x.inclusion_annotations));
    ]

let batch_get_workflows_response_to_yojson (x : batch_get_workflows_response) =
  assoc_to_yojson
    [
      ("MissingWorkflows", option_to_yojson workflow_names_to_yojson x.missing_workflows);
      ("Workflows", option_to_yojson workflows_to_yojson x.workflows);
    ]

let batch_get_workflows_request_to_yojson (x : batch_get_workflows_request) =
  assoc_to_yojson
    [
      ("IncludeGraph", option_to_yojson nullable_boolean_to_yojson x.include_graph);
      ("Names", Some (workflow_names_to_yojson x.names));
    ]

let batch_get_triggers_response_to_yojson (x : batch_get_triggers_response) =
  assoc_to_yojson
    [
      ("TriggersNotFound", option_to_yojson trigger_name_list_to_yojson x.triggers_not_found);
      ("Triggers", option_to_yojson trigger_list_to_yojson x.triggers);
    ]

let batch_get_triggers_request_to_yojson (x : batch_get_triggers_request) =
  assoc_to_yojson [ ("TriggerNames", Some (trigger_name_list_to_yojson x.trigger_names)) ]

let batch_get_table_optimizer_error_to_yojson (x : batch_get_table_optimizer_error) =
  assoc_to_yojson
    [
      ("type", option_to_yojson table_optimizer_type_to_yojson x.type_);
      ("tableName", option_to_yojson table_name_string_to_yojson x.table_name);
      ("databaseName", option_to_yojson database_name_string_to_yojson x.database_name);
      ("catalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
      ("error", option_to_yojson error_detail_to_yojson x.error);
    ]

let batch_get_table_optimizer_errors_to_yojson tree =
  list_to_yojson batch_get_table_optimizer_error_to_yojson tree

let batch_get_table_optimizer_response_to_yojson (x : batch_get_table_optimizer_response) =
  assoc_to_yojson
    [
      ("Failures", option_to_yojson batch_get_table_optimizer_errors_to_yojson x.failures);
      ("TableOptimizers", option_to_yojson batch_table_optimizers_to_yojson x.table_optimizers);
    ]

let batch_get_table_optimizer_entry_to_yojson (x : batch_get_table_optimizer_entry) =
  assoc_to_yojson
    [
      ("type", option_to_yojson table_optimizer_type_to_yojson x.type_);
      ("tableName", option_to_yojson table_name_string_to_yojson x.table_name);
      ("databaseName", option_to_yojson database_name_string_to_yojson x.database_name);
      ("catalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let batch_get_table_optimizer_entries_to_yojson tree =
  list_to_yojson batch_get_table_optimizer_entry_to_yojson tree

let batch_get_table_optimizer_request_to_yojson (x : batch_get_table_optimizer_request) =
  assoc_to_yojson [ ("Entries", Some (batch_get_table_optimizer_entries_to_yojson x.entries)) ]

let batch_get_partition_value_list_to_yojson tree =
  list_to_yojson partition_value_list_to_yojson tree

let batch_get_partition_response_to_yojson (x : batch_get_partition_response) =
  assoc_to_yojson
    [
      ( "UnprocessedKeys",
        option_to_yojson batch_get_partition_value_list_to_yojson x.unprocessed_keys );
      ("Partitions", option_to_yojson partition_list_to_yojson x.partitions);
    ]

let batch_get_partition_request_to_yojson (x : batch_get_partition_request) =
  assoc_to_yojson
    [
      ( "QuerySessionContext",
        option_to_yojson query_session_context_to_yojson x.query_session_context );
      ("AuditContext", option_to_yojson audit_context_to_yojson x.audit_context);
      ("PartitionsToGet", Some (batch_get_partition_value_list_to_yojson x.partitions_to_get));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let batch_get_jobs_response_to_yojson (x : batch_get_jobs_response) =
  assoc_to_yojson
    [
      ("JobsNotFound", option_to_yojson job_name_list_to_yojson x.jobs_not_found);
      ("Jobs", option_to_yojson job_list_to_yojson x.jobs);
    ]

let batch_get_jobs_request_to_yojson (x : batch_get_jobs_request) =
  assoc_to_yojson [ ("JobNames", Some (job_name_list_to_yojson x.job_names)) ]

let batch_get_iterable_forms_response_to_yojson (x : batch_get_iterable_forms_response) =
  assoc_to_yojson
    [
      ("Errors", option_to_yojson item_error_list_to_yojson x.errors);
      ("Items", option_to_yojson iterable_form_item_list_to_yojson x.items);
    ]

let batch_get_iterable_forms_request_to_yojson (x : batch_get_iterable_forms_request) =
  assoc_to_yojson
    [
      ("ItemIdentifiers", Some (item_identifier_list_to_yojson x.item_identifiers));
      ("IterableFormName", Some (iterable_form_name_to_yojson x.iterable_form_name));
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
    ]

let batch_get_dev_endpoints_response_to_yojson (x : batch_get_dev_endpoints_response) =
  assoc_to_yojson
    [
      ( "DevEndpointsNotFound",
        option_to_yojson dev_endpoint_names_to_yojson x.dev_endpoints_not_found );
      ("DevEndpoints", option_to_yojson dev_endpoint_list_to_yojson x.dev_endpoints);
    ]

let batch_get_dev_endpoints_request_to_yojson (x : batch_get_dev_endpoints_request) =
  assoc_to_yojson [ ("DevEndpointNames", Some (dev_endpoint_names_to_yojson x.dev_endpoint_names)) ]

let batch_get_data_quality_result_response_to_yojson (x : batch_get_data_quality_result_response) =
  assoc_to_yojson
    [
      ("ResultsNotFound", option_to_yojson data_quality_result_ids_to_yojson x.results_not_found);
      ("Results", Some (data_quality_results_list_to_yojson x.results));
    ]

let batch_get_data_quality_result_request_to_yojson (x : batch_get_data_quality_result_request) =
  assoc_to_yojson [ ("ResultIds", Some (data_quality_result_ids_to_yojson x.result_ids)) ]

let batch_get_custom_entity_types_response_to_yojson (x : batch_get_custom_entity_types_response) =
  assoc_to_yojson
    [
      ( "CustomEntityTypesNotFound",
        option_to_yojson custom_entity_type_names_to_yojson x.custom_entity_types_not_found );
      ("CustomEntityTypes", option_to_yojson custom_entity_types_to_yojson x.custom_entity_types);
    ]

let batch_get_custom_entity_types_request_to_yojson (x : batch_get_custom_entity_types_request) =
  assoc_to_yojson [ ("Names", Some (custom_entity_type_names_to_yojson x.names)) ]

let batch_get_crawlers_response_to_yojson (x : batch_get_crawlers_response) =
  assoc_to_yojson
    [
      ("CrawlersNotFound", option_to_yojson crawler_name_list_to_yojson x.crawlers_not_found);
      ("Crawlers", option_to_yojson crawler_list_to_yojson x.crawlers);
    ]

let batch_get_crawlers_request_to_yojson (x : batch_get_crawlers_request) =
  assoc_to_yojson [ ("CrawlerNames", Some (crawler_name_list_to_yojson x.crawler_names)) ]

let batch_get_blueprints_response_to_yojson (x : batch_get_blueprints_response) =
  assoc_to_yojson
    [
      ("MissingBlueprints", option_to_yojson blueprint_names_to_yojson x.missing_blueprints);
      ("Blueprints", option_to_yojson blueprints_to_yojson x.blueprints);
    ]

let batch_get_blueprint_names_to_yojson tree =
  list_to_yojson orchestration_name_string_to_yojson tree

let batch_get_blueprints_request_to_yojson (x : batch_get_blueprints_request) =
  assoc_to_yojson
    [
      ("IncludeParameterSpec", option_to_yojson nullable_boolean_to_yojson x.include_parameter_spec);
      ("IncludeBlueprint", option_to_yojson nullable_boolean_to_yojson x.include_blueprint);
      ("Names", Some (batch_get_blueprint_names_to_yojson x.names));
    ]

let batch_delete_table_version_response_to_yojson (x : batch_delete_table_version_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson table_version_errors_to_yojson x.errors) ]

let batch_delete_table_version_list_to_yojson tree = list_to_yojson version_string_to_yojson tree

let batch_delete_table_version_request_to_yojson (x : batch_delete_table_version_request) =
  assoc_to_yojson
    [
      ("VersionIds", Some (batch_delete_table_version_list_to_yojson x.version_ids));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let batch_delete_table_response_to_yojson (x : batch_delete_table_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson table_errors_to_yojson x.errors) ]

let batch_delete_table_name_list_to_yojson tree = list_to_yojson name_string_to_yojson tree

let batch_delete_table_request_to_yojson (x : batch_delete_table_request) =
  assoc_to_yojson
    [
      ("TransactionId", option_to_yojson transaction_id_string_to_yojson x.transaction_id);
      ("TablesToDelete", Some (batch_delete_table_name_list_to_yojson x.tables_to_delete));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let batch_delete_partition_value_list_to_yojson tree =
  list_to_yojson partition_value_list_to_yojson tree

let batch_delete_partition_response_to_yojson (x : batch_delete_partition_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson partition_errors_to_yojson x.errors) ]

let batch_delete_partition_request_to_yojson (x : batch_delete_partition_request) =
  assoc_to_yojson
    [
      ( "PartitionsToDelete",
        Some (batch_delete_partition_value_list_to_yojson x.partitions_to_delete) );
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let batch_delete_connection_response_to_yojson (x : batch_delete_connection_response) =
  assoc_to_yojson
    [
      ("Errors", option_to_yojson error_by_name_to_yojson x.errors);
      ("Succeeded", option_to_yojson name_string_list_to_yojson x.succeeded);
    ]

let batch_delete_connection_request_to_yojson (x : batch_delete_connection_request) =
  assoc_to_yojson
    [
      ("ConnectionNameList", Some (delete_connection_name_list_to_yojson x.connection_name_list));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let batch_create_partition_response_to_yojson (x : batch_create_partition_response) =
  assoc_to_yojson [ ("Errors", option_to_yojson partition_errors_to_yojson x.errors) ]

let batch_create_partition_request_to_yojson (x : batch_create_partition_request) =
  assoc_to_yojson
    [
      ("PartitionInputList", Some (partition_input_list_to_yojson x.partition_input_list));
      ("TableName", Some (name_string_to_yojson x.table_name));
      ("DatabaseName", Some (name_string_to_yojson x.database_name));
      ("CatalogId", option_to_yojson catalog_id_string_to_yojson x.catalog_id);
    ]

let associate_glossary_terms_response_to_yojson (x : associate_glossary_terms_response) =
  assoc_to_yojson
    [
      ("GlossaryTerms", option_to_yojson glossary_term_id_list_to_yojson x.glossary_terms);
      ("AssetIdentifier", option_to_yojson asset_id_to_yojson x.asset_identifier);
    ]

let associate_glossary_terms_request_to_yojson (x : associate_glossary_terms_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (hash_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("GlossaryTermIdentifiers", Some (glossary_term_id_list_to_yojson x.glossary_term_identifiers));
      ("AssetIdentifier", Some (asset_id_to_yojson x.asset_identifier));
    ]
