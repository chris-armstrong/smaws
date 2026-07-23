open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let unauthorized_operation_to_yojson (x : unauthorized_operation) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let retry_after_seconds_to_yojson = int_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", Some (error_message_to_yojson x.message));
      ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let home_region_not_set_exception_to_yojson (x : home_region_not_set_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let dry_run_operation_to_yojson (x : dry_run_operation) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let put_resource_attributes_result_to_yojson = unit_to_yojson
let dry_run_to_yojson = bool_to_yojson
let resource_attribute_value_to_yojson = string_to_yojson

let resource_attribute_type_to_yojson (x : resource_attribute_type) =
  match x with
  | IPV4_ADDRESS -> `String "IPV4_ADDRESS"
  | IPV6_ADDRESS -> `String "IPV6_ADDRESS"
  | MAC_ADDRESS -> `String "MAC_ADDRESS"
  | FQDN -> `String "FQDN"
  | VM_MANAGER_ID -> `String "VM_MANAGER_ID"
  | VM_MANAGED_OBJECT_REFERENCE -> `String "VM_MANAGED_OBJECT_REFERENCE"
  | VM_NAME -> `String "VM_NAME"
  | VM_PATH -> `String "VM_PATH"
  | BIOS_ID -> `String "BIOS_ID"
  | MOTHERBOARD_SERIAL_NUMBER -> `String "MOTHERBOARD_SERIAL_NUMBER"

let resource_attribute_to_yojson (x : resource_attribute) =
  assoc_to_yojson
    [
      ("Type", Some (resource_attribute_type_to_yojson x.type_));
      ("Value", Some (resource_attribute_value_to_yojson x.value));
    ]

let resource_attribute_list_to_yojson tree = list_to_yojson resource_attribute_to_yojson tree
let migration_task_name_to_yojson = string_to_yojson
let progress_update_stream_to_yojson = string_to_yojson

let put_resource_attributes_request_to_yojson (x : put_resource_attributes_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("ResourceAttributeList", Some (resource_attribute_list_to_yojson x.resource_attribute_list));
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]

let notify_migration_task_state_result_to_yojson = unit_to_yojson
let next_update_seconds_to_yojson = int_to_yojson
let update_date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let progress_percent_to_yojson = int_to_yojson
let status_detail_to_yojson = string_to_yojson

let status_to_yojson (x : status) =
  match x with
  | NOT_STARTED -> `String "NOT_STARTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"

let task_to_yojson (x : task) =
  assoc_to_yojson
    [
      ("Status", Some (status_to_yojson x.status));
      ("StatusDetail", option_to_yojson status_detail_to_yojson x.status_detail);
      ("ProgressPercent", option_to_yojson progress_percent_to_yojson x.progress_percent);
    ]

let notify_migration_task_state_request_to_yojson (x : notify_migration_task_state_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("Task", Some (task_to_yojson x.task));
      ("UpdateDateTime", Some (update_date_time_to_yojson x.update_date_time));
      ("NextUpdateSeconds", Some (next_update_seconds_to_yojson x.next_update_seconds));
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]

let policy_error_exception_to_yojson (x : policy_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let notify_application_state_result_to_yojson = unit_to_yojson

let application_status_to_yojson (x : application_status) =
  match x with
  | NOT_STARTED -> `String "NOT_STARTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"

let application_id_to_yojson = string_to_yojson

let notify_application_state_request_to_yojson (x : notify_application_state_request) =
  assoc_to_yojson
    [
      ("ApplicationId", Some (application_id_to_yojson x.application_id));
      ("Status", Some (application_status_to_yojson x.status));
      ("UpdateDateTime", option_to_yojson update_date_time_to_yojson x.update_date_time);
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]

let source_resource_description_to_yojson = string_to_yojson
let source_resource_name_to_yojson = string_to_yojson

let source_resource_to_yojson (x : source_resource) =
  assoc_to_yojson
    [
      ("Name", Some (source_resource_name_to_yojson x.name));
      ("Description", option_to_yojson source_resource_description_to_yojson x.description);
      ("StatusDetail", option_to_yojson status_detail_to_yojson x.status_detail);
    ]

let source_resource_list_to_yojson tree = list_to_yojson source_resource_to_yojson tree
let token_to_yojson = string_to_yojson

let list_source_resources_result_to_yojson (x : list_source_resources_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("SourceResourceList", option_to_yojson source_resource_list_to_yojson x.source_resource_list);
    ]

let max_results_source_resources_to_yojson = int_to_yojson

let list_source_resources_request_to_yojson (x : list_source_resources_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_source_resources_to_yojson x.max_results);
    ]

let progress_update_stream_summary_to_yojson (x : progress_update_stream_summary) =
  assoc_to_yojson
    [
      ( "ProgressUpdateStreamName",
        option_to_yojson progress_update_stream_to_yojson x.progress_update_stream_name );
    ]

let progress_update_stream_summary_list_to_yojson tree =
  list_to_yojson progress_update_stream_summary_to_yojson tree

let list_progress_update_streams_result_to_yojson (x : list_progress_update_streams_result) =
  assoc_to_yojson
    [
      ( "ProgressUpdateStreamSummaryList",
        option_to_yojson progress_update_stream_summary_list_to_yojson
          x.progress_update_stream_summary_list );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_progress_update_streams_request_to_yojson (x : list_progress_update_streams_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let update_type_to_yojson (x : update_type) =
  match x with MigrationTaskStateUpdated -> `String "MIGRATION_TASK_STATE_UPDATED"

let migration_task_update_to_yojson (x : migration_task_update) =
  assoc_to_yojson
    [
      ("UpdateDateTime", option_to_yojson update_date_time_to_yojson x.update_date_time);
      ("UpdateType", option_to_yojson update_type_to_yojson x.update_type);
      ("MigrationTaskState", option_to_yojson task_to_yojson x.migration_task_state);
    ]

let migration_task_update_list_to_yojson tree = list_to_yojson migration_task_update_to_yojson tree

let list_migration_task_updates_result_to_yojson (x : list_migration_task_updates_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "MigrationTaskUpdateList",
        option_to_yojson migration_task_update_list_to_yojson x.migration_task_update_list );
    ]

let list_migration_task_updates_request_to_yojson (x : list_migration_task_updates_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let migration_task_summary_to_yojson (x : migration_task_summary) =
  assoc_to_yojson
    [
      ( "ProgressUpdateStream",
        option_to_yojson progress_update_stream_to_yojson x.progress_update_stream );
      ("MigrationTaskName", option_to_yojson migration_task_name_to_yojson x.migration_task_name);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("ProgressPercent", option_to_yojson progress_percent_to_yojson x.progress_percent);
      ("StatusDetail", option_to_yojson status_detail_to_yojson x.status_detail);
      ("UpdateDateTime", option_to_yojson update_date_time_to_yojson x.update_date_time);
    ]

let migration_task_summary_list_to_yojson tree =
  list_to_yojson migration_task_summary_to_yojson tree

let list_migration_tasks_result_to_yojson (x : list_migration_tasks_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "MigrationTaskSummaryList",
        option_to_yojson migration_task_summary_list_to_yojson x.migration_task_summary_list );
    ]

let resource_name_to_yojson = string_to_yojson

let list_migration_tasks_request_to_yojson (x : list_migration_tasks_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ResourceName", option_to_yojson resource_name_to_yojson x.resource_name);
    ]

let discovered_resource_description_to_yojson = string_to_yojson
let configuration_id_to_yojson = string_to_yojson

let discovered_resource_to_yojson (x : discovered_resource) =
  assoc_to_yojson
    [
      ("ConfigurationId", Some (configuration_id_to_yojson x.configuration_id));
      ("Description", option_to_yojson discovered_resource_description_to_yojson x.description);
    ]

let discovered_resource_list_to_yojson tree = list_to_yojson discovered_resource_to_yojson tree

let list_discovered_resources_result_to_yojson (x : list_discovered_resources_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "DiscoveredResourceList",
        option_to_yojson discovered_resource_list_to_yojson x.discovered_resource_list );
    ]

let max_results_resources_to_yojson = int_to_yojson

let list_discovered_resources_request_to_yojson (x : list_discovered_resources_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_resources_to_yojson x.max_results);
    ]

let created_artifact_description_to_yojson = string_to_yojson
let created_artifact_name_to_yojson = string_to_yojson

let created_artifact_to_yojson (x : created_artifact) =
  assoc_to_yojson
    [
      ("Name", Some (created_artifact_name_to_yojson x.name));
      ("Description", option_to_yojson created_artifact_description_to_yojson x.description);
    ]

let created_artifact_list_to_yojson tree = list_to_yojson created_artifact_to_yojson tree

let list_created_artifacts_result_to_yojson (x : list_created_artifacts_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ( "CreatedArtifactList",
        option_to_yojson created_artifact_list_to_yojson x.created_artifact_list );
    ]

let max_results_created_artifacts_to_yojson = int_to_yojson

let list_created_artifacts_request_to_yojson (x : list_created_artifacts_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_created_artifacts_to_yojson x.max_results);
    ]

let application_state_to_yojson (x : application_state) =
  assoc_to_yojson
    [
      ("ApplicationId", option_to_yojson application_id_to_yojson x.application_id);
      ("ApplicationStatus", option_to_yojson application_status_to_yojson x.application_status);
      ("LastUpdatedTime", option_to_yojson update_date_time_to_yojson x.last_updated_time);
    ]

let application_state_list_to_yojson tree = list_to_yojson application_state_to_yojson tree

let list_application_states_result_to_yojson (x : list_application_states_result) =
  assoc_to_yojson
    [
      ( "ApplicationStateList",
        option_to_yojson application_state_list_to_yojson x.application_state_list );
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let application_ids_to_yojson tree = list_to_yojson application_id_to_yojson tree

let list_application_states_request_to_yojson (x : list_application_states_request) =
  assoc_to_yojson
    [
      ("ApplicationIds", option_to_yojson application_ids_to_yojson x.application_ids);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let import_migration_task_result_to_yojson = unit_to_yojson

let import_migration_task_request_to_yojson (x : import_migration_task_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]

let disassociate_source_resource_result_to_yojson = unit_to_yojson

let disassociate_source_resource_request_to_yojson (x : disassociate_source_resource_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("SourceResourceName", Some (source_resource_name_to_yojson x.source_resource_name));
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]

let disassociate_discovered_resource_result_to_yojson = unit_to_yojson

let disassociate_discovered_resource_request_to_yojson
    (x : disassociate_discovered_resource_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("ConfigurationId", Some (configuration_id_to_yojson x.configuration_id));
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]

let disassociate_created_artifact_result_to_yojson = unit_to_yojson

let disassociate_created_artifact_request_to_yojson (x : disassociate_created_artifact_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("CreatedArtifactName", Some (created_artifact_name_to_yojson x.created_artifact_name));
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]

let latest_resource_attribute_list_to_yojson tree = list_to_yojson resource_attribute_to_yojson tree

let migration_task_to_yojson (x : migration_task) =
  assoc_to_yojson
    [
      ( "ProgressUpdateStream",
        option_to_yojson progress_update_stream_to_yojson x.progress_update_stream );
      ("MigrationTaskName", option_to_yojson migration_task_name_to_yojson x.migration_task_name);
      ("Task", option_to_yojson task_to_yojson x.task);
      ("UpdateDateTime", option_to_yojson update_date_time_to_yojson x.update_date_time);
      ( "ResourceAttributeList",
        option_to_yojson latest_resource_attribute_list_to_yojson x.resource_attribute_list );
    ]

let describe_migration_task_result_to_yojson (x : describe_migration_task_result) =
  assoc_to_yojson [ ("MigrationTask", option_to_yojson migration_task_to_yojson x.migration_task) ]

let describe_migration_task_request_to_yojson (x : describe_migration_task_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
    ]

let describe_application_state_result_to_yojson (x : describe_application_state_result) =
  assoc_to_yojson
    [
      ("ApplicationStatus", option_to_yojson application_status_to_yojson x.application_status);
      ("LastUpdatedTime", option_to_yojson update_date_time_to_yojson x.last_updated_time);
    ]

let describe_application_state_request_to_yojson (x : describe_application_state_request) =
  assoc_to_yojson [ ("ApplicationId", Some (application_id_to_yojson x.application_id)) ]

let delete_progress_update_stream_result_to_yojson = unit_to_yojson

let delete_progress_update_stream_request_to_yojson (x : delete_progress_update_stream_request) =
  assoc_to_yojson
    [
      ( "ProgressUpdateStreamName",
        Some (progress_update_stream_to_yojson x.progress_update_stream_name) );
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]

let create_progress_update_stream_result_to_yojson = unit_to_yojson

let create_progress_update_stream_request_to_yojson (x : create_progress_update_stream_request) =
  assoc_to_yojson
    [
      ( "ProgressUpdateStreamName",
        Some (progress_update_stream_to_yojson x.progress_update_stream_name) );
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]

let associate_source_resource_result_to_yojson = unit_to_yojson

let associate_source_resource_request_to_yojson (x : associate_source_resource_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("SourceResource", Some (source_resource_to_yojson x.source_resource));
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]

let associate_discovered_resource_result_to_yojson = unit_to_yojson

let associate_discovered_resource_request_to_yojson (x : associate_discovered_resource_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("DiscoveredResource", Some (discovered_resource_to_yojson x.discovered_resource));
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]

let associate_created_artifact_result_to_yojson = unit_to_yojson

let associate_created_artifact_request_to_yojson (x : associate_created_artifact_request) =
  assoc_to_yojson
    [
      ("ProgressUpdateStream", Some (progress_update_stream_to_yojson x.progress_update_stream));
      ("MigrationTaskName", Some (migration_task_name_to_yojson x.migration_task_name));
      ("CreatedArtifact", Some (created_artifact_to_yojson x.created_artifact));
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
    ]
