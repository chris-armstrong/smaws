open Smaws_Lib.Json.DeserializeHelpers
open Types
let base_unit_of_yojson = unit_of_yojson
let update_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "MigrationTaskStateUpdated" -> MigrationTaskStateUpdated
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UpdateType" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateType") : update_type) : 
  update_type)
let update_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let error_message_of_yojson = string_of_yojson
let unauthorized_operation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : unauthorized_operation)
let token_of_yojson = string_of_yojson
let retry_after_seconds_of_yojson = int_of_yojson
let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       (option_of_yojson
          (value_for_key retry_after_seconds_of_yojson "RetryAfterSeconds")
          _list path);
     message = (value_for_key error_message_of_yojson "Message" _list path)
   } : throttling_exception)
let status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "NOT_STARTED" -> NOT_STARTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "Status" value)
    | _ -> raise (deserialize_wrong_type_error path "Status") : status) : 
  status)
let status_detail_of_yojson = string_of_yojson
let progress_percent_of_yojson = int_of_yojson
let task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     progress_percent =
       (option_of_yojson
          (value_for_key progress_percent_of_yojson "ProgressPercent") _list
          path);
     status_detail =
       (option_of_yojson
          (value_for_key status_detail_of_yojson "StatusDetail") _list path);
     status = (value_for_key status_of_yojson "Status" _list path)
   } : task)
let source_resource_name_of_yojson = string_of_yojson
let source_resource_description_of_yojson = string_of_yojson
let source_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_detail =
       (option_of_yojson
          (value_for_key status_detail_of_yojson "StatusDetail") _list path);
     description =
       (option_of_yojson
          (value_for_key source_resource_description_of_yojson "Description")
          _list path);
     name = (value_for_key source_resource_name_of_yojson "Name" _list path)
   } : source_resource)
let source_resource_list_of_yojson tree path =
  list_of_yojson source_resource_of_yojson tree path
let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : service_unavailable_exception)
let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : resource_not_found_exception)
let resource_name_of_yojson = string_of_yojson
let resource_attribute_value_of_yojson = string_of_yojson
let resource_attribute_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "MOTHERBOARD_SERIAL_NUMBER" -> MOTHERBOARD_SERIAL_NUMBER
    | `String "BIOS_ID" -> BIOS_ID
    | `String "VM_PATH" -> VM_PATH
    | `String "VM_NAME" -> VM_NAME
    | `String "VM_MANAGED_OBJECT_REFERENCE" -> VM_MANAGED_OBJECT_REFERENCE
    | `String "VM_MANAGER_ID" -> VM_MANAGER_ID
    | `String "FQDN" -> FQDN
    | `String "MAC_ADDRESS" -> MAC_ADDRESS
    | `String "IPV6_ADDRESS" -> IPV6_ADDRESS
    | `String "IPV4_ADDRESS" -> IPV4_ADDRESS
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ResourceAttributeType"
             value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceAttributeType") : 
     resource_attribute_type) : resource_attribute_type)
let resource_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (value_for_key resource_attribute_value_of_yojson "Value" _list path);
     type_ =
       (value_for_key resource_attribute_type_of_yojson "Type" _list path)
   } : resource_attribute)
let resource_attribute_list_of_yojson tree path =
  list_of_yojson resource_attribute_of_yojson tree path
let put_resource_attributes_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let progress_update_stream_of_yojson = string_of_yojson
let migration_task_name_of_yojson = string_of_yojson
let dry_run_of_yojson = bool_of_yojson
let put_resource_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     resource_attribute_list =
       (value_for_key resource_attribute_list_of_yojson
          "ResourceAttributeList" _list path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : put_resource_attributes_request)
let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : invalid_input_exception)
let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : internal_server_error)
let home_region_not_set_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : home_region_not_set_exception)
let dry_run_operation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : dry_run_operation)
let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : access_denied_exception)
let progress_update_stream_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     progress_update_stream_name =
       (option_of_yojson
          (value_for_key progress_update_stream_of_yojson
             "ProgressUpdateStreamName") _list path)
   } : progress_update_stream_summary)
let progress_update_stream_summary_list_of_yojson tree path =
  list_of_yojson progress_update_stream_summary_of_yojson tree path
let policy_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : policy_error_exception)
let notify_migration_task_state_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let next_update_seconds_of_yojson = int_of_yojson
let notify_migration_task_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     next_update_seconds =
       (value_for_key next_update_seconds_of_yojson "NextUpdateSeconds" _list
          path);
     update_date_time =
       (value_for_key update_date_time_of_yojson "UpdateDateTime" _list path);
     task = (value_for_key task_of_yojson "Task" _list path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : notify_migration_task_state_request)
let notify_application_state_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let application_id_of_yojson = string_of_yojson
let application_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "COMPLETED" -> COMPLETED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "NOT_STARTED" -> NOT_STARTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ApplicationStatus"
             value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationStatus") : 
     application_status) : application_status)
let notify_application_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     update_date_time =
       (option_of_yojson
          (value_for_key update_date_time_of_yojson "UpdateDateTime") _list
          path);
     status =
       (value_for_key application_status_of_yojson "Status" _list path);
     application_id =
       (value_for_key application_id_of_yojson "ApplicationId" _list path)
   } : notify_application_state_request)
let migration_task_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_task_state =
       (option_of_yojson (value_for_key task_of_yojson "MigrationTaskState")
          _list path);
     update_type =
       (option_of_yojson (value_for_key update_type_of_yojson "UpdateType")
          _list path);
     update_date_time =
       (option_of_yojson
          (value_for_key update_date_time_of_yojson "UpdateDateTime") _list
          path)
   } : migration_task_update)
let migration_task_update_list_of_yojson tree path =
  list_of_yojson migration_task_update_of_yojson tree path
let migration_task_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_date_time =
       (option_of_yojson
          (value_for_key update_date_time_of_yojson "UpdateDateTime") _list
          path);
     status_detail =
       (option_of_yojson
          (value_for_key status_detail_of_yojson "StatusDetail") _list path);
     progress_percent =
       (option_of_yojson
          (value_for_key progress_percent_of_yojson "ProgressPercent") _list
          path);
     status =
       (option_of_yojson (value_for_key status_of_yojson "Status") _list path);
     migration_task_name =
       (option_of_yojson
          (value_for_key migration_task_name_of_yojson "MigrationTaskName")
          _list path);
     progress_update_stream =
       (option_of_yojson
          (value_for_key progress_update_stream_of_yojson
             "ProgressUpdateStream") _list path)
   } : migration_task_summary)
let migration_task_summary_list_of_yojson tree path =
  list_of_yojson migration_task_summary_of_yojson tree path
let latest_resource_attribute_list_of_yojson tree path =
  list_of_yojson resource_attribute_of_yojson tree path
let migration_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_attribute_list =
       (option_of_yojson
          (value_for_key latest_resource_attribute_list_of_yojson
             "ResourceAttributeList") _list path);
     update_date_time =
       (option_of_yojson
          (value_for_key update_date_time_of_yojson "UpdateDateTime") _list
          path);
     task =
       (option_of_yojson (value_for_key task_of_yojson "Task") _list path);
     migration_task_name =
       (option_of_yojson
          (value_for_key migration_task_name_of_yojson "MigrationTaskName")
          _list path);
     progress_update_stream =
       (option_of_yojson
          (value_for_key progress_update_stream_of_yojson
             "ProgressUpdateStream") _list path)
   } : migration_task)
let max_results_source_resources_of_yojson = int_of_yojson
let max_results_resources_of_yojson = int_of_yojson
let max_results_created_artifacts_of_yojson = int_of_yojson
let max_results_of_yojson = int_of_yojson
let list_source_resources_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_resource_list =
       (option_of_yojson
          (value_for_key source_resource_list_of_yojson "SourceResourceList")
          _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path)
   } : list_source_resources_result)
let list_source_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key max_results_source_resources_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : list_source_resources_request)
let list_progress_update_streams_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path);
     progress_update_stream_summary_list =
       (option_of_yojson
          (value_for_key progress_update_stream_summary_list_of_yojson
             "ProgressUpdateStreamSummaryList") _list path)
   } : list_progress_update_streams_result)
let list_progress_update_streams_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path)
   } : list_progress_update_streams_request)
let list_migration_tasks_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_task_summary_list =
       (option_of_yojson
          (value_for_key migration_task_summary_list_of_yojson
             "MigrationTaskSummaryList") _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path)
   } : list_migration_tasks_result)
let list_migration_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       (option_of_yojson
          (value_for_key resource_name_of_yojson "ResourceName") _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path)
   } : list_migration_tasks_request)
let list_migration_task_updates_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_task_update_list =
       (option_of_yojson
          (value_for_key migration_task_update_list_of_yojson
             "MigrationTaskUpdateList") _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path)
   } : list_migration_task_updates_result)
let list_migration_task_updates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : list_migration_task_updates_request)
let configuration_id_of_yojson = string_of_yojson
let discovered_resource_description_of_yojson = string_of_yojson
let discovered_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       (option_of_yojson
          (value_for_key discovered_resource_description_of_yojson
             "Description") _list path);
     configuration_id =
       (value_for_key configuration_id_of_yojson "ConfigurationId" _list path)
   } : discovered_resource)
let discovered_resource_list_of_yojson tree path =
  list_of_yojson discovered_resource_of_yojson tree path
let list_discovered_resources_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     discovered_resource_list =
       (option_of_yojson
          (value_for_key discovered_resource_list_of_yojson
             "DiscoveredResourceList") _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path)
   } : list_discovered_resources_result)
let list_discovered_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key max_results_resources_of_yojson "MaxResults") _list
          path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : list_discovered_resources_request)
let created_artifact_name_of_yojson = string_of_yojson
let created_artifact_description_of_yojson = string_of_yojson
let created_artifact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       (option_of_yojson
          (value_for_key created_artifact_description_of_yojson "Description")
          _list path);
     name = (value_for_key created_artifact_name_of_yojson "Name" _list path)
   } : created_artifact)
let created_artifact_list_of_yojson tree path =
  list_of_yojson created_artifact_of_yojson tree path
let list_created_artifacts_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_artifact_list =
       (option_of_yojson
          (value_for_key created_artifact_list_of_yojson
             "CreatedArtifactList") _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path)
   } : list_created_artifacts_result)
let list_created_artifacts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key max_results_created_artifacts_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : list_created_artifacts_request)
let application_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       (option_of_yojson
          (value_for_key update_date_time_of_yojson "LastUpdatedTime") _list
          path);
     application_status =
       (option_of_yojson
          (value_for_key application_status_of_yojson "ApplicationStatus")
          _list path);
     application_id =
       (option_of_yojson
          (value_for_key application_id_of_yojson "ApplicationId") _list path)
   } : application_state)
let application_state_list_of_yojson tree path =
  list_of_yojson application_state_of_yojson tree path
let list_application_states_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path);
     application_state_list =
       (option_of_yojson
          (value_for_key application_state_list_of_yojson
             "ApplicationStateList") _list path)
   } : list_application_states_result)
let application_ids_of_yojson tree path =
  list_of_yojson application_id_of_yojson tree path
let list_application_states_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path);
     application_ids =
       (option_of_yojson
          (value_for_key application_ids_of_yojson "ApplicationIds") _list
          path)
   } : list_application_states_request)
let import_migration_task_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let import_migration_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : import_migration_task_request)
let disassociate_source_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let disassociate_source_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     source_resource_name =
       (value_for_key source_resource_name_of_yojson "SourceResourceName"
          _list path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : disassociate_source_resource_request)
let disassociate_discovered_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let disassociate_discovered_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     configuration_id =
       (value_for_key configuration_id_of_yojson "ConfigurationId" _list path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : disassociate_discovered_resource_request)
let disassociate_created_artifact_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let disassociate_created_artifact_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     created_artifact_name =
       (value_for_key created_artifact_name_of_yojson "CreatedArtifactName"
          _list path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : disassociate_created_artifact_request)
let describe_migration_task_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_task =
       (option_of_yojson
          (value_for_key migration_task_of_yojson "MigrationTask") _list path)
   } : describe_migration_task_result)
let describe_migration_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : describe_migration_task_request)
let describe_application_state_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       (option_of_yojson
          (value_for_key update_date_time_of_yojson "LastUpdatedTime") _list
          path);
     application_status =
       (option_of_yojson
          (value_for_key application_status_of_yojson "ApplicationStatus")
          _list path)
   } : describe_application_state_result)
let describe_application_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_id =
       (value_for_key application_id_of_yojson "ApplicationId" _list path)
   } : describe_application_state_request)
let delete_progress_update_stream_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_progress_update_stream_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     progress_update_stream_name =
       (value_for_key progress_update_stream_of_yojson
          "ProgressUpdateStreamName" _list path)
   } : delete_progress_update_stream_request)
let create_progress_update_stream_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let create_progress_update_stream_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     progress_update_stream_name =
       (value_for_key progress_update_stream_of_yojson
          "ProgressUpdateStreamName" _list path)
   } : create_progress_update_stream_request)
let associate_source_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let associate_source_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     source_resource =
       (value_for_key source_resource_of_yojson "SourceResource" _list path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : associate_source_resource_request)
let associate_discovered_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let associate_discovered_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     discovered_resource =
       (value_for_key discovered_resource_of_yojson "DiscoveredResource"
          _list path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : associate_discovered_resource_request)
let associate_created_artifact_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let associate_created_artifact_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       (option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list
          path);
     created_artifact =
       (value_for_key created_artifact_of_yojson "CreatedArtifact" _list path);
     migration_task_name =
       (value_for_key migration_task_name_of_yojson "MigrationTaskName" _list
          path);
     progress_update_stream =
       (value_for_key progress_update_stream_of_yojson "ProgressUpdateStream"
          _list path)
   } : associate_created_artifact_request)
let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson