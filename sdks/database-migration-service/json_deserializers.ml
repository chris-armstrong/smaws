open Smaws_Lib.Json.DeserializeHelpers
open Types

let exception_message_of_yojson = string_of_yojson

let access_denied_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : access_denied_fault)

let long_of_yojson = long_of_yojson
let string__of_yojson = string_of_yojson

let account_quota_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_quota_name =
       option_of_yojson (value_for_key string__of_yojson "AccountQuotaName") _list path;
     used = option_of_yojson (value_for_key long_of_yojson "Used") _list path;
     max = option_of_yojson (value_for_key long_of_yojson "Max") _list path;
   }
    : account_quota)

let account_quota_list_of_yojson tree path = list_of_yojson account_quota_of_yojson tree path

let resource_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : resource_not_found_fault)

let invalid_resource_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_resource_state_fault)

let add_tags_to_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     resource_arn = option_of_yojson (value_for_key string__of_yojson "ResourceArn") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let add_tags_to_resource_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key string__of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : add_tags_to_resource_message)

let update_subscriptions_to_event_bridge_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ result_ = option_of_yojson (value_for_key string__of_yojson "Result") _list path }
    : update_subscriptions_to_event_bridge_response)

let boolean_optional_of_yojson = bool_of_yojson

let update_subscriptions_to_event_bridge_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force_move = option_of_yojson (value_for_key boolean_optional_of_yojson "ForceMove") _list path;
   }
    : update_subscriptions_to_event_bridge_message)

let resource_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : resource_quota_exceeded_fault)

let kms_key_not_accessible_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : kms_key_not_accessible_fault)

let connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationInstanceArn") _list path;
     endpoint_arn = option_of_yojson (value_for_key string__of_yojson "EndpointArn") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     last_failure_message =
       option_of_yojson (value_for_key string__of_yojson "LastFailureMessage") _list path;
     endpoint_identifier =
       option_of_yojson (value_for_key string__of_yojson "EndpointIdentifier") _list path;
     replication_instance_identifier =
       option_of_yojson (value_for_key string__of_yojson "ReplicationInstanceIdentifier") _list path;
   }
    : connection)

let test_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = option_of_yojson (value_for_key connection_of_yojson "Connection") _list path }
    : test_connection_response)

let test_connection_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_arn = value_for_key string__of_yojson "ReplicationInstanceArn" _list path;
     endpoint_arn = value_for_key string__of_yojson "EndpointArn" _list path;
   }
    : test_connection_message)

let t_stamp_of_yojson = timestamp_epoch_seconds_of_yojson
let integer_of_yojson = int_of_yojson

let replication_task_stats_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     full_load_progress_percent =
       option_of_yojson (value_for_key integer_of_yojson "FullLoadProgressPercent") _list path;
     elapsed_time_millis =
       option_of_yojson (value_for_key long_of_yojson "ElapsedTimeMillis") _list path;
     tables_loaded = option_of_yojson (value_for_key integer_of_yojson "TablesLoaded") _list path;
     tables_loading = option_of_yojson (value_for_key integer_of_yojson "TablesLoading") _list path;
     tables_queued = option_of_yojson (value_for_key integer_of_yojson "TablesQueued") _list path;
     tables_errored = option_of_yojson (value_for_key integer_of_yojson "TablesErrored") _list path;
     fresh_start_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "FreshStartDate") _list path;
     start_date = option_of_yojson (value_for_key t_stamp_of_yojson "StartDate") _list path;
     stop_date = option_of_yojson (value_for_key t_stamp_of_yojson "StopDate") _list path;
     full_load_start_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "FullLoadStartDate") _list path;
     full_load_finish_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "FullLoadFinishDate") _list path;
   }
    : replication_task_stats)

let migration_type_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "full-load" -> FULL_LOAD
    | `String "cdc" -> CDC
    | `String "full-load-and-cdc" -> FULL_LOAD_AND_CDC
    | `String value -> raise (deserialize_unknown_enum_value_error path "MigrationTypeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "MigrationTypeValue")
     : migration_type_value)
    : migration_type_value)

let replication_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_identifier =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskIdentifier") _list path;
     source_endpoint_arn =
       option_of_yojson (value_for_key string__of_yojson "SourceEndpointArn") _list path;
     target_endpoint_arn =
       option_of_yojson (value_for_key string__of_yojson "TargetEndpointArn") _list path;
     replication_instance_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationInstanceArn") _list path;
     migration_type =
       option_of_yojson (value_for_key migration_type_value_of_yojson "MigrationType") _list path;
     table_mappings = option_of_yojson (value_for_key string__of_yojson "TableMappings") _list path;
     replication_task_settings =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskSettings") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     last_failure_message =
       option_of_yojson (value_for_key string__of_yojson "LastFailureMessage") _list path;
     stop_reason = option_of_yojson (value_for_key string__of_yojson "StopReason") _list path;
     replication_task_creation_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "ReplicationTaskCreationDate") _list path;
     replication_task_start_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "ReplicationTaskStartDate") _list path;
     cdc_start_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStartPosition") _list path;
     cdc_stop_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStopPosition") _list path;
     recovery_checkpoint =
       option_of_yojson (value_for_key string__of_yojson "RecoveryCheckpoint") _list path;
     replication_task_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskArn") _list path;
     replication_task_stats =
       option_of_yojson
         (value_for_key replication_task_stats_of_yojson "ReplicationTaskStats")
         _list path;
     task_data = option_of_yojson (value_for_key string__of_yojson "TaskData") _list path;
     target_replication_instance_arn =
       option_of_yojson (value_for_key string__of_yojson "TargetReplicationInstanceArn") _list path;
   }
    : replication_task)

let stop_replication_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task =
       option_of_yojson (value_for_key replication_task_of_yojson "ReplicationTask") _list path;
   }
    : stop_replication_task_response)

let stop_replication_task_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replication_task_arn = value_for_key string__of_yojson "ReplicationTaskArn" _list path }
    : stop_replication_task_message)

let replication_stats_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     full_load_progress_percent =
       option_of_yojson (value_for_key integer_of_yojson "FullLoadProgressPercent") _list path;
     elapsed_time_millis =
       option_of_yojson (value_for_key long_of_yojson "ElapsedTimeMillis") _list path;
     tables_loaded = option_of_yojson (value_for_key integer_of_yojson "TablesLoaded") _list path;
     tables_loading = option_of_yojson (value_for_key integer_of_yojson "TablesLoading") _list path;
     tables_queued = option_of_yojson (value_for_key integer_of_yojson "TablesQueued") _list path;
     tables_errored = option_of_yojson (value_for_key integer_of_yojson "TablesErrored") _list path;
     fresh_start_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "FreshStartDate") _list path;
     start_date = option_of_yojson (value_for_key t_stamp_of_yojson "StartDate") _list path;
     stop_date = option_of_yojson (value_for_key t_stamp_of_yojson "StopDate") _list path;
     full_load_start_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "FullLoadStartDate") _list path;
     full_load_finish_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "FullLoadFinishDate") _list path;
   }
    : replication_stats)

let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let replication_task_assessment_run_result_statistic_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     passed = option_of_yojson (value_for_key integer_of_yojson "Passed") _list path;
     failed = option_of_yojson (value_for_key integer_of_yojson "Failed") _list path;
     error = option_of_yojson (value_for_key integer_of_yojson "Error") _list path;
     warning = option_of_yojson (value_for_key integer_of_yojson "Warning") _list path;
     cancelled = option_of_yojson (value_for_key integer_of_yojson "Cancelled") _list path;
     skipped = option_of_yojson (value_for_key integer_of_yojson "Skipped") _list path;
   }
    : replication_task_assessment_run_result_statistic)

let replication_task_assessment_run_progress_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     individual_assessment_count =
       option_of_yojson (value_for_key integer_of_yojson "IndividualAssessmentCount") _list path;
     individual_assessment_completed_count =
       option_of_yojson
         (value_for_key integer_of_yojson "IndividualAssessmentCompletedCount")
         _list path;
   }
    : replication_task_assessment_run_progress)

let boolean__of_yojson = bool_of_yojson

let premigration_assessment_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     premigration_assessment_run_arn =
       option_of_yojson (value_for_key string__of_yojson "PremigrationAssessmentRunArn") _list path;
     fail_on_assessment_failure =
       option_of_yojson (value_for_key boolean__of_yojson "FailOnAssessmentFailure") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     premigration_assessment_run_creation_date =
       option_of_yojson
         (value_for_key t_stamp_of_yojson "PremigrationAssessmentRunCreationDate")
         _list path;
     assessment_progress =
       option_of_yojson
         (value_for_key replication_task_assessment_run_progress_of_yojson "AssessmentProgress")
         _list path;
     last_failure_message =
       option_of_yojson (value_for_key string__of_yojson "LastFailureMessage") _list path;
     result_location_bucket =
       option_of_yojson (value_for_key string__of_yojson "ResultLocationBucket") _list path;
     result_location_folder =
       option_of_yojson (value_for_key string__of_yojson "ResultLocationFolder") _list path;
     result_encryption_mode =
       option_of_yojson (value_for_key string__of_yojson "ResultEncryptionMode") _list path;
     result_kms_key_arn =
       option_of_yojson (value_for_key string__of_yojson "ResultKmsKeyArn") _list path;
     result_statistic =
       option_of_yojson
         (value_for_key replication_task_assessment_run_result_statistic_of_yojson "ResultStatistic")
         _list path;
   }
    : premigration_assessment_status)

let premigration_assessment_status_list_of_yojson tree path =
  list_of_yojson premigration_assessment_status_of_yojson tree path

let provision_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provision_state =
       option_of_yojson (value_for_key string__of_yojson "ProvisionState") _list path;
     provisioned_capacity_units =
       option_of_yojson (value_for_key integer_of_yojson "ProvisionedCapacityUnits") _list path;
     date_provisioned =
       option_of_yojson (value_for_key t_stamp_of_yojson "DateProvisioned") _list path;
     is_new_provisioning_available =
       option_of_yojson (value_for_key boolean__of_yojson "IsNewProvisioningAvailable") _list path;
     date_new_provisioning_data_available =
       option_of_yojson
         (value_for_key t_stamp_of_yojson "DateNewProvisioningDataAvailable")
         _list path;
     reason_for_new_provisioning_data =
       option_of_yojson (value_for_key string__of_yojson "ReasonForNewProvisioningData") _list path;
   }
    : provision_data)

let replication_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config_identifier =
       option_of_yojson (value_for_key string__of_yojson "ReplicationConfigIdentifier") _list path;
     replication_config_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationConfigArn") _list path;
     source_endpoint_arn =
       option_of_yojson (value_for_key string__of_yojson "SourceEndpointArn") _list path;
     target_endpoint_arn =
       option_of_yojson (value_for_key string__of_yojson "TargetEndpointArn") _list path;
     replication_type =
       option_of_yojson (value_for_key migration_type_value_of_yojson "ReplicationType") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     provision_data =
       option_of_yojson (value_for_key provision_data_of_yojson "ProvisionData") _list path;
     premigration_assessment_statuses =
       option_of_yojson
         (value_for_key premigration_assessment_status_list_of_yojson
            "PremigrationAssessmentStatuses")
         _list path;
     stop_reason = option_of_yojson (value_for_key string__of_yojson "StopReason") _list path;
     failure_messages =
       option_of_yojson (value_for_key string_list_of_yojson "FailureMessages") _list path;
     replication_stats =
       option_of_yojson (value_for_key replication_stats_of_yojson "ReplicationStats") _list path;
     start_replication_type =
       option_of_yojson (value_for_key string__of_yojson "StartReplicationType") _list path;
     cdc_start_time = option_of_yojson (value_for_key t_stamp_of_yojson "CdcStartTime") _list path;
     cdc_start_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStartPosition") _list path;
     cdc_stop_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStopPosition") _list path;
     recovery_checkpoint =
       option_of_yojson (value_for_key string__of_yojson "RecoveryCheckpoint") _list path;
     replication_create_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "ReplicationCreateTime") _list path;
     replication_update_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "ReplicationUpdateTime") _list path;
     replication_last_stop_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "ReplicationLastStopTime") _list path;
     replication_deprovision_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "ReplicationDeprovisionTime") _list path;
     is_read_only =
       option_of_yojson (value_for_key boolean_optional_of_yojson "IsReadOnly") _list path;
   }
    : replication)

let stop_replication_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replication = option_of_yojson (value_for_key replication_of_yojson "Replication") _list path }
    : stop_replication_response)

let stop_replication_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replication_config_arn = value_for_key string__of_yojson "ReplicationConfigArn" _list path }
    : stop_replication_message)

let failed_dependency_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : failed_dependency_fault)

let data_migration_cidr_block_of_yojson tree path = list_of_yojson string__of_yojson tree path
let public_ip_address_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
let iso8601_date_time_of_yojson = timestamp_iso_8601_of_yojson

let data_migration_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tables_loaded = option_of_yojson (value_for_key integer_of_yojson "TablesLoaded") _list path;
     elapsed_time_millis =
       option_of_yojson (value_for_key long_of_yojson "ElapsedTimeMillis") _list path;
     tables_loading = option_of_yojson (value_for_key integer_of_yojson "TablesLoading") _list path;
     full_load_percentage =
       option_of_yojson (value_for_key integer_of_yojson "FullLoadPercentage") _list path;
     cdc_latency = option_of_yojson (value_for_key integer_of_yojson "CDCLatency") _list path;
     tables_queued = option_of_yojson (value_for_key integer_of_yojson "TablesQueued") _list path;
     tables_errored = option_of_yojson (value_for_key integer_of_yojson "TablesErrored") _list path;
     start_time =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "StartTime") _list path;
     stop_time = option_of_yojson (value_for_key iso8601_date_time_of_yojson "StopTime") _list path;
   }
    : data_migration_statistics)

let table_preparation_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "do-nothing" -> DO_NOTHING
    | `String "truncate" -> TRUNCATE
    | `String "drop-tables-on-target" -> DROP_TABLES_ON_TARGET
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TablePreparationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "TablePreparationMode")
     : table_preparation_mode)
    : table_preparation_mode)

let target_data_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_preparation_mode =
       option_of_yojson
         (value_for_key table_preparation_mode_of_yojson "TablePreparationMode")
         _list path;
   }
    : target_data_setting)

let target_data_settings_of_yojson tree path =
  list_of_yojson target_data_setting_of_yojson tree path

let source_data_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cdc_start_position =
       option_of_yojson (value_for_key string__of_yojson "CDCStartPosition") _list path;
     cdc_start_time =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "CDCStartTime") _list path;
     cdc_stop_time =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "CDCStopTime") _list path;
     slot_name = option_of_yojson (value_for_key string__of_yojson "SlotName") _list path;
   }
    : source_data_setting)

let source_data_settings_of_yojson tree path =
  list_of_yojson source_data_setting_of_yojson tree path

let secret_string_of_yojson = string_of_yojson
let integer_optional_of_yojson = int_of_yojson

let data_migration_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_jobs =
       option_of_yojson (value_for_key integer_optional_of_yojson "NumberOfJobs") _list path;
     cloudwatch_logs_enabled =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "CloudwatchLogsEnabled")
         _list path;
     selection_rules =
       option_of_yojson (value_for_key secret_string_of_yojson "SelectionRules") _list path;
   }
    : data_migration_settings)

let data_migration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migration_name =
       option_of_yojson (value_for_key string__of_yojson "DataMigrationName") _list path;
     data_migration_arn =
       option_of_yojson (value_for_key string__of_yojson "DataMigrationArn") _list path;
     data_migration_create_time =
       option_of_yojson
         (value_for_key iso8601_date_time_of_yojson "DataMigrationCreateTime")
         _list path;
     data_migration_start_time =
       option_of_yojson
         (value_for_key iso8601_date_time_of_yojson "DataMigrationStartTime")
         _list path;
     data_migration_end_time =
       option_of_yojson
         (value_for_key iso8601_date_time_of_yojson "DataMigrationEndTime")
         _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     migration_project_arn =
       option_of_yojson (value_for_key string__of_yojson "MigrationProjectArn") _list path;
     data_migration_type =
       option_of_yojson
         (value_for_key migration_type_value_of_yojson "DataMigrationType")
         _list path;
     data_migration_settings =
       option_of_yojson
         (value_for_key data_migration_settings_of_yojson "DataMigrationSettings")
         _list path;
     source_data_settings =
       option_of_yojson
         (value_for_key source_data_settings_of_yojson "SourceDataSettings")
         _list path;
     target_data_settings =
       option_of_yojson
         (value_for_key target_data_settings_of_yojson "TargetDataSettings")
         _list path;
     data_migration_statistics =
       option_of_yojson
         (value_for_key data_migration_statistics_of_yojson "DataMigrationStatistics")
         _list path;
     data_migration_status =
       option_of_yojson (value_for_key string__of_yojson "DataMigrationStatus") _list path;
     public_ip_addresses =
       option_of_yojson
         (value_for_key public_ip_address_list_of_yojson "PublicIpAddresses")
         _list path;
     data_migration_cidr_blocks =
       option_of_yojson
         (value_for_key data_migration_cidr_block_of_yojson "DataMigrationCidrBlocks")
         _list path;
     last_failure_message =
       option_of_yojson (value_for_key string__of_yojson "LastFailureMessage") _list path;
     stop_reason = option_of_yojson (value_for_key string__of_yojson "StopReason") _list path;
   }
    : data_migration)

let stop_data_migration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migration =
       option_of_yojson (value_for_key data_migration_of_yojson "DataMigration") _list path;
   }
    : stop_data_migration_response)

let stop_data_migration_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migration_identifier =
       value_for_key string__of_yojson "DataMigrationIdentifier" _list path;
   }
    : stop_data_migration_message)

let s3_resource_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : s3_resource_not_found_fault)

let s3_access_denied_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : s3_access_denied_fault)

let resource_arn_of_yojson = string_of_yojson

let resource_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
   }
    : resource_already_exists_fault)

let kms_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : kms_not_found_fault)

let kms_invalid_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : kms_invalid_state_fault)

let kms_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : kms_fault)

let kms_disabled_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : kms_disabled_fault)

let kms_access_denied_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : kms_access_denied_fault)

let replication_task_assessment_run_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_assessment_run_arn =
       option_of_yojson
         (value_for_key string__of_yojson "ReplicationTaskAssessmentRunArn")
         _list path;
     replication_task_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskArn") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     replication_task_assessment_run_creation_date =
       option_of_yojson
         (value_for_key t_stamp_of_yojson "ReplicationTaskAssessmentRunCreationDate")
         _list path;
     assessment_progress =
       option_of_yojson
         (value_for_key replication_task_assessment_run_progress_of_yojson "AssessmentProgress")
         _list path;
     last_failure_message =
       option_of_yojson (value_for_key string__of_yojson "LastFailureMessage") _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     result_location_bucket =
       option_of_yojson (value_for_key string__of_yojson "ResultLocationBucket") _list path;
     result_location_folder =
       option_of_yojson (value_for_key string__of_yojson "ResultLocationFolder") _list path;
     result_encryption_mode =
       option_of_yojson (value_for_key string__of_yojson "ResultEncryptionMode") _list path;
     result_kms_key_arn =
       option_of_yojson (value_for_key string__of_yojson "ResultKmsKeyArn") _list path;
     assessment_run_name =
       option_of_yojson (value_for_key string__of_yojson "AssessmentRunName") _list path;
     is_latest_task_assessment_run =
       option_of_yojson (value_for_key boolean__of_yojson "IsLatestTaskAssessmentRun") _list path;
     result_statistic =
       option_of_yojson
         (value_for_key replication_task_assessment_run_result_statistic_of_yojson "ResultStatistic")
         _list path;
   }
    : replication_task_assessment_run)

let start_replication_task_assessment_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_assessment_run =
       option_of_yojson
         (value_for_key replication_task_assessment_run_of_yojson "ReplicationTaskAssessmentRun")
         _list path;
   }
    : start_replication_task_assessment_run_response)

let exclude_test_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
let include_test_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let start_replication_task_assessment_run_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_arn = value_for_key string__of_yojson "ReplicationTaskArn" _list path;
     service_access_role_arn = value_for_key string__of_yojson "ServiceAccessRoleArn" _list path;
     result_location_bucket = value_for_key string__of_yojson "ResultLocationBucket" _list path;
     result_location_folder =
       option_of_yojson (value_for_key string__of_yojson "ResultLocationFolder") _list path;
     result_encryption_mode =
       option_of_yojson (value_for_key string__of_yojson "ResultEncryptionMode") _list path;
     result_kms_key_arn =
       option_of_yojson (value_for_key string__of_yojson "ResultKmsKeyArn") _list path;
     assessment_run_name = value_for_key string__of_yojson "AssessmentRunName" _list path;
     include_only =
       option_of_yojson (value_for_key include_test_list_of_yojson "IncludeOnly") _list path;
     exclude = option_of_yojson (value_for_key exclude_test_list_of_yojson "Exclude") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_replication_task_assessment_run_message)

let start_replication_task_assessment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task =
       option_of_yojson (value_for_key replication_task_of_yojson "ReplicationTask") _list path;
   }
    : start_replication_task_assessment_response)

let start_replication_task_assessment_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replication_task_arn = value_for_key string__of_yojson "ReplicationTaskArn" _list path }
    : start_replication_task_assessment_message)

let start_replication_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task =
       option_of_yojson (value_for_key replication_task_of_yojson "ReplicationTask") _list path;
   }
    : start_replication_task_response)

let start_replication_task_type_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "start-replication" -> START_REPLICATION
    | `String "resume-processing" -> RESUME_PROCESSING
    | `String "reload-target" -> RELOAD_TARGET
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StartReplicationTaskTypeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "StartReplicationTaskTypeValue")
     : start_replication_task_type_value)
    : start_replication_task_type_value)

let start_replication_task_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_arn = value_for_key string__of_yojson "ReplicationTaskArn" _list path;
     start_replication_task_type =
       value_for_key start_replication_task_type_value_of_yojson "StartReplicationTaskType" _list
         path;
     cdc_start_time = option_of_yojson (value_for_key t_stamp_of_yojson "CdcStartTime") _list path;
     cdc_start_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStartPosition") _list path;
     cdc_stop_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStopPosition") _list path;
   }
    : start_replication_task_message)

let start_replication_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replication = option_of_yojson (value_for_key replication_of_yojson "Replication") _list path }
    : start_replication_response)

let start_replication_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config_arn = value_for_key string__of_yojson "ReplicationConfigArn" _list path;
     start_replication_type = value_for_key string__of_yojson "StartReplicationType" _list path;
     premigration_assessment_settings =
       option_of_yojson
         (value_for_key string__of_yojson "PremigrationAssessmentSettings")
         _list path;
     cdc_start_time = option_of_yojson (value_for_key t_stamp_of_yojson "CdcStartTime") _list path;
     cdc_start_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStartPosition") _list path;
     cdc_stop_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStopPosition") _list path;
   }
    : start_replication_message)

let recommendation_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_sizing_type = value_for_key string__of_yojson "InstanceSizingType" _list path;
     workload_type = value_for_key string__of_yojson "WorkloadType" _list path;
   }
    : recommendation_settings)

let start_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_id = value_for_key string__of_yojson "DatabaseId" _list path;
     settings = value_for_key recommendation_settings_of_yojson "Settings" _list path;
   }
    : start_recommendations_request)

let start_metadata_model_import_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_identifier =
       option_of_yojson (value_for_key string__of_yojson "RequestIdentifier") _list path;
   }
    : start_metadata_model_import_response)

let origin_type_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "SOURCE" -> SOURCE
    | `String "TARGET" -> TARGET
    | `String value -> raise (deserialize_unknown_enum_value_error path "OriginTypeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "OriginTypeValue")
     : origin_type_value)
    : origin_type_value)

let migration_project_identifier_of_yojson = string_of_yojson

let start_metadata_model_import_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     selection_rules = value_for_key string__of_yojson "SelectionRules" _list path;
     origin = value_for_key origin_type_value_of_yojson "Origin" _list path;
     refresh = option_of_yojson (value_for_key boolean__of_yojson "Refresh") _list path;
   }
    : start_metadata_model_import_message)

let start_metadata_model_export_to_target_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_identifier =
       option_of_yojson (value_for_key string__of_yojson "RequestIdentifier") _list path;
   }
    : start_metadata_model_export_to_target_response)

let start_metadata_model_export_to_target_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     selection_rules = value_for_key string__of_yojson "SelectionRules" _list path;
     overwrite_extension_pack =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "OverwriteExtensionPack")
         _list path;
   }
    : start_metadata_model_export_to_target_message)

let start_metadata_model_export_as_script_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_identifier =
       option_of_yojson (value_for_key string__of_yojson "RequestIdentifier") _list path;
   }
    : start_metadata_model_export_as_script_response)

let start_metadata_model_export_as_script_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     selection_rules = value_for_key string__of_yojson "SelectionRules" _list path;
     origin = value_for_key origin_type_value_of_yojson "Origin" _list path;
     file_name = option_of_yojson (value_for_key string__of_yojson "FileName") _list path;
   }
    : start_metadata_model_export_as_script_message)

let start_metadata_model_creation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_identifier =
       option_of_yojson (value_for_key string__of_yojson "RequestIdentifier") _list path;
   }
    : start_metadata_model_creation_response)

let statement_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ definition = value_for_key string__of_yojson "Definition" _list path } : statement_properties)

let metadata_model_properties_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "StatementProperties" -> StatementProperties (statement_properties_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "MetadataModelProperties" unknown)
    : metadata_model_properties)

let start_metadata_model_creation_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     selection_rules = value_for_key string__of_yojson "SelectionRules" _list path;
     metadata_model_name = value_for_key string__of_yojson "MetadataModelName" _list path;
     properties = value_for_key metadata_model_properties_of_yojson "Properties" _list path;
   }
    : start_metadata_model_creation_message)

let start_metadata_model_conversion_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_identifier =
       option_of_yojson (value_for_key string__of_yojson "RequestIdentifier") _list path;
   }
    : start_metadata_model_conversion_response)

let start_metadata_model_conversion_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     selection_rules = value_for_key string__of_yojson "SelectionRules" _list path;
   }
    : start_metadata_model_conversion_message)

let start_metadata_model_assessment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_identifier =
       option_of_yojson (value_for_key string__of_yojson "RequestIdentifier") _list path;
   }
    : start_metadata_model_assessment_response)

let start_metadata_model_assessment_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     selection_rules = value_for_key string__of_yojson "SelectionRules" _list path;
   }
    : start_metadata_model_assessment_message)

let start_extension_pack_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_identifier =
       option_of_yojson (value_for_key string__of_yojson "RequestIdentifier") _list path;
   }
    : start_extension_pack_association_response)

let start_extension_pack_association_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
   }
    : start_extension_pack_association_message)

let invalid_operation_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_operation_fault)

let start_data_migration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migration =
       option_of_yojson (value_for_key data_migration_of_yojson "DataMigration") _list path;
   }
    : start_data_migration_response)

let start_replication_migration_type_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "reload-target" -> RELOAD_TARGET
    | `String "resume-processing" -> RESUME_PROCESSING
    | `String "start-replication" -> START_REPLICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StartReplicationMigrationTypeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "StartReplicationMigrationTypeValue")
     : start_replication_migration_type_value)
    : start_replication_migration_type_value)

let start_data_migration_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migration_identifier =
       value_for_key string__of_yojson "DataMigrationIdentifier" _list path;
     start_type =
       value_for_key start_replication_migration_type_value_of_yojson "StartType" _list path;
   }
    : start_data_migration_message)

let run_fleet_advisor_lsa_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lsa_analysis_id = option_of_yojson (value_for_key string__of_yojson "LsaAnalysisId") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
   }
    : run_fleet_advisor_lsa_analysis_response)

let remove_tags_from_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let key_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let remove_tags_from_resource_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key string__of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key key_list_of_yojson "TagKeys" _list path;
   }
    : remove_tags_from_resource_message)

let reload_tables_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskArn") _list path;
   }
    : reload_tables_response)

let reload_option_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "data-reload" -> DATA_RELOAD
    | `String "validate-only" -> VALIDATE_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReloadOptionValue" value)
    | _ -> raise (deserialize_wrong_type_error path "ReloadOptionValue")
     : reload_option_value)
    : reload_option_value)

let table_to_reload_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_name = value_for_key string__of_yojson "SchemaName" _list path;
     table_name = value_for_key string__of_yojson "TableName" _list path;
   }
    : table_to_reload)

let table_list_to_reload_of_yojson tree path = list_of_yojson table_to_reload_of_yojson tree path

let reload_tables_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_arn = value_for_key string__of_yojson "ReplicationTaskArn" _list path;
     tables_to_reload = value_for_key table_list_to_reload_of_yojson "TablesToReload" _list path;
     reload_option =
       option_of_yojson (value_for_key reload_option_value_of_yojson "ReloadOption") _list path;
   }
    : reload_tables_message)

let reload_replication_tables_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationConfigArn") _list path;
   }
    : reload_replication_tables_response)

let reload_replication_tables_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config_arn = value_for_key string__of_yojson "ReplicationConfigArn" _list path;
     tables_to_reload = value_for_key table_list_to_reload_of_yojson "TablesToReload" _list path;
     reload_option =
       option_of_yojson (value_for_key reload_option_value_of_yojson "ReloadOption") _list path;
   }
    : reload_replication_tables_message)

let refresh_schemas_status_type_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "successful" -> SUCCESSFUL
    | `String "failed" -> FAILED
    | `String "refreshing" -> REFRESHING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RefreshSchemasStatusTypeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "RefreshSchemasStatusTypeValue")
     : refresh_schemas_status_type_value)
    : refresh_schemas_status_type_value)

let refresh_schemas_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_arn = option_of_yojson (value_for_key string__of_yojson "EndpointArn") _list path;
     replication_instance_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationInstanceArn") _list path;
     status =
       option_of_yojson
         (value_for_key refresh_schemas_status_type_value_of_yojson "Status")
         _list path;
     last_refresh_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "LastRefreshDate") _list path;
     last_failure_message =
       option_of_yojson (value_for_key string__of_yojson "LastFailureMessage") _list path;
   }
    : refresh_schemas_status)

let refresh_schemas_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     refresh_schemas_status =
       option_of_yojson
         (value_for_key refresh_schemas_status_of_yojson "RefreshSchemasStatus")
         _list path;
   }
    : refresh_schemas_response)

let refresh_schemas_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_arn = value_for_key string__of_yojson "EndpointArn" _list path;
     replication_instance_arn = value_for_key string__of_yojson "ReplicationInstanceArn" _list path;
   }
    : refresh_schemas_message)

let kerberos_authentication_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_cache_secret_id =
       option_of_yojson (value_for_key string__of_yojson "KeyCacheSecretId") _list path;
     key_cache_secret_iam_arn =
       option_of_yojson (value_for_key string__of_yojson "KeyCacheSecretIamArn") _list path;
     krb5_file_contents =
       option_of_yojson (value_for_key string__of_yojson "Krb5FileContents") _list path;
   }
    : kerberos_authentication_settings)

let replication_instance_ipv6_address_list_of_yojson tree path =
  list_of_yojson string__of_yojson tree path

let replication_instance_private_ip_address_list_of_yojson tree path =
  list_of_yojson string__of_yojson tree path

let replication_instance_public_ip_address_list_of_yojson tree path =
  list_of_yojson string__of_yojson tree path

let replication_instance_class_of_yojson = string_of_yojson

let replication_pending_modified_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_class =
       option_of_yojson
         (value_for_key replication_instance_class_of_yojson "ReplicationInstanceClass")
         _list path;
     allocated_storage =
       option_of_yojson (value_for_key integer_optional_of_yojson "AllocatedStorage") _list path;
     multi_a_z = option_of_yojson (value_for_key boolean_optional_of_yojson "MultiAZ") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     network_type = option_of_yojson (value_for_key string__of_yojson "NetworkType") _list path;
   }
    : replication_pending_modified_values)

let availability_zone_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key string__of_yojson "Name") _list path }
    : availability_zone)

let subnet_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_identifier =
       option_of_yojson (value_for_key string__of_yojson "SubnetIdentifier") _list path;
     subnet_availability_zone =
       option_of_yojson
         (value_for_key availability_zone_of_yojson "SubnetAvailabilityZone")
         _list path;
     subnet_status = option_of_yojson (value_for_key string__of_yojson "SubnetStatus") _list path;
   }
    : subnet)

let subnet_list_of_yojson tree path = list_of_yojson subnet_of_yojson tree path

let replication_subnet_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_subnet_group_identifier =
       option_of_yojson
         (value_for_key string__of_yojson "ReplicationSubnetGroupIdentifier")
         _list path;
     replication_subnet_group_description =
       option_of_yojson
         (value_for_key string__of_yojson "ReplicationSubnetGroupDescription")
         _list path;
     vpc_id = option_of_yojson (value_for_key string__of_yojson "VpcId") _list path;
     subnet_group_status =
       option_of_yojson (value_for_key string__of_yojson "SubnetGroupStatus") _list path;
     subnets = option_of_yojson (value_for_key subnet_list_of_yojson "Subnets") _list path;
     supported_network_types =
       option_of_yojson (value_for_key string_list_of_yojson "SupportedNetworkTypes") _list path;
     is_read_only =
       option_of_yojson (value_for_key boolean_optional_of_yojson "IsReadOnly") _list path;
   }
    : replication_subnet_group)

let vpc_security_group_membership_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_security_group_id =
       option_of_yojson (value_for_key string__of_yojson "VpcSecurityGroupId") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
   }
    : vpc_security_group_membership)

let vpc_security_group_membership_list_of_yojson tree path =
  list_of_yojson vpc_security_group_membership_of_yojson tree path

let replication_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_identifier =
       option_of_yojson (value_for_key string__of_yojson "ReplicationInstanceIdentifier") _list path;
     replication_instance_class =
       option_of_yojson
         (value_for_key replication_instance_class_of_yojson "ReplicationInstanceClass")
         _list path;
     replication_instance_status =
       option_of_yojson (value_for_key string__of_yojson "ReplicationInstanceStatus") _list path;
     allocated_storage =
       option_of_yojson (value_for_key integer_of_yojson "AllocatedStorage") _list path;
     instance_create_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "InstanceCreateTime") _list path;
     vpc_security_groups =
       option_of_yojson
         (value_for_key vpc_security_group_membership_list_of_yojson "VpcSecurityGroups")
         _list path;
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "AvailabilityZone") _list path;
     replication_subnet_group =
       option_of_yojson
         (value_for_key replication_subnet_group_of_yojson "ReplicationSubnetGroup")
         _list path;
     preferred_maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "PreferredMaintenanceWindow") _list path;
     pending_modified_values =
       option_of_yojson
         (value_for_key replication_pending_modified_values_of_yojson "PendingModifiedValues")
         _list path;
     multi_a_z = option_of_yojson (value_for_key boolean__of_yojson "MultiAZ") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     auto_minor_version_upgrade =
       option_of_yojson (value_for_key boolean__of_yojson "AutoMinorVersionUpgrade") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     replication_instance_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationInstanceArn") _list path;
     replication_instance_public_ip_address =
       option_of_yojson
         (value_for_key string__of_yojson "ReplicationInstancePublicIpAddress")
         _list path;
     replication_instance_private_ip_address =
       option_of_yojson
         (value_for_key string__of_yojson "ReplicationInstancePrivateIpAddress")
         _list path;
     replication_instance_public_ip_addresses =
       option_of_yojson
         (value_for_key replication_instance_public_ip_address_list_of_yojson
            "ReplicationInstancePublicIpAddresses")
         _list path;
     replication_instance_private_ip_addresses =
       option_of_yojson
         (value_for_key replication_instance_private_ip_address_list_of_yojson
            "ReplicationInstancePrivateIpAddresses")
         _list path;
     replication_instance_ipv6_addresses =
       option_of_yojson
         (value_for_key replication_instance_ipv6_address_list_of_yojson
            "ReplicationInstanceIpv6Addresses")
         _list path;
     publicly_accessible =
       option_of_yojson (value_for_key boolean__of_yojson "PubliclyAccessible") _list path;
     secondary_availability_zone =
       option_of_yojson (value_for_key string__of_yojson "SecondaryAvailabilityZone") _list path;
     free_until = option_of_yojson (value_for_key t_stamp_of_yojson "FreeUntil") _list path;
     dns_name_servers =
       option_of_yojson (value_for_key string__of_yojson "DnsNameServers") _list path;
     network_type = option_of_yojson (value_for_key string__of_yojson "NetworkType") _list path;
     kerberos_authentication_settings =
       option_of_yojson
         (value_for_key kerberos_authentication_settings_of_yojson "KerberosAuthenticationSettings")
         _list path;
   }
    : replication_instance)

let reboot_replication_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance =
       option_of_yojson
         (value_for_key replication_instance_of_yojson "ReplicationInstance")
         _list path;
   }
    : reboot_replication_instance_response)

let reboot_replication_instance_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_arn = value_for_key string__of_yojson "ReplicationInstanceArn" _list path;
     force_failover =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ForceFailover") _list path;
     force_planned_failover =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ForcePlannedFailover") _list path;
   }
    : reboot_replication_instance_message)

let move_replication_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task =
       option_of_yojson (value_for_key replication_task_of_yojson "ReplicationTask") _list path;
   }
    : move_replication_task_response)

let move_replication_task_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_arn = value_for_key string__of_yojson "ReplicationTaskArn" _list path;
     target_replication_instance_arn =
       value_for_key string__of_yojson "TargetReplicationInstanceArn" _list path;
   }
    : move_replication_task_message)

let modify_replication_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task =
       option_of_yojson (value_for_key replication_task_of_yojson "ReplicationTask") _list path;
   }
    : modify_replication_task_response)

let modify_replication_task_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_arn = value_for_key string__of_yojson "ReplicationTaskArn" _list path;
     replication_task_identifier =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskIdentifier") _list path;
     migration_type =
       option_of_yojson (value_for_key migration_type_value_of_yojson "MigrationType") _list path;
     table_mappings = option_of_yojson (value_for_key string__of_yojson "TableMappings") _list path;
     replication_task_settings =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskSettings") _list path;
     cdc_start_time = option_of_yojson (value_for_key t_stamp_of_yojson "CdcStartTime") _list path;
     cdc_start_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStartPosition") _list path;
     cdc_stop_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStopPosition") _list path;
     task_data = option_of_yojson (value_for_key string__of_yojson "TaskData") _list path;
   }
    : modify_replication_task_message)

let subnet_already_in_use_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : subnet_already_in_use)

let replication_subnet_group_does_not_cover_enough_a_zs_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : replication_subnet_group_does_not_cover_enough_a_zs)

let invalid_subnet_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_subnet)

let modify_replication_subnet_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_subnet_group =
       option_of_yojson
         (value_for_key replication_subnet_group_of_yojson "ReplicationSubnetGroup")
         _list path;
   }
    : modify_replication_subnet_group_response)

let subnet_identifier_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let modify_replication_subnet_group_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_subnet_group_identifier =
       value_for_key string__of_yojson "ReplicationSubnetGroupIdentifier" _list path;
     replication_subnet_group_description =
       option_of_yojson
         (value_for_key string__of_yojson "ReplicationSubnetGroupDescription")
         _list path;
     subnet_ids = value_for_key subnet_identifier_list_of_yojson "SubnetIds" _list path;
   }
    : modify_replication_subnet_group_message)

let upgrade_dependency_failure_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : upgrade_dependency_failure_fault)

let storage_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : storage_quota_exceeded_fault)

let insufficient_resource_capacity_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : insufficient_resource_capacity_fault)

let modify_replication_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance =
       option_of_yojson
         (value_for_key replication_instance_of_yojson "ReplicationInstance")
         _list path;
   }
    : modify_replication_instance_response)

let vpc_security_group_id_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let modify_replication_instance_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_arn = value_for_key string__of_yojson "ReplicationInstanceArn" _list path;
     allocated_storage =
       option_of_yojson (value_for_key integer_optional_of_yojson "AllocatedStorage") _list path;
     apply_immediately =
       option_of_yojson (value_for_key boolean__of_yojson "ApplyImmediately") _list path;
     replication_instance_class =
       option_of_yojson
         (value_for_key replication_instance_class_of_yojson "ReplicationInstanceClass")
         _list path;
     vpc_security_group_ids =
       option_of_yojson
         (value_for_key vpc_security_group_id_list_of_yojson "VpcSecurityGroupIds")
         _list path;
     preferred_maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "PreferredMaintenanceWindow") _list path;
     multi_a_z = option_of_yojson (value_for_key boolean_optional_of_yojson "MultiAZ") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     allow_major_version_upgrade =
       option_of_yojson (value_for_key boolean__of_yojson "AllowMajorVersionUpgrade") _list path;
     auto_minor_version_upgrade =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "AutoMinorVersionUpgrade")
         _list path;
     replication_instance_identifier =
       option_of_yojson (value_for_key string__of_yojson "ReplicationInstanceIdentifier") _list path;
     network_type = option_of_yojson (value_for_key string__of_yojson "NetworkType") _list path;
     kerberos_authentication_settings =
       option_of_yojson
         (value_for_key kerberos_authentication_settings_of_yojson "KerberosAuthenticationSettings")
         _list path;
   }
    : modify_replication_instance_message)

let compute_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "AvailabilityZone") _list path;
     dns_name_servers =
       option_of_yojson (value_for_key string__of_yojson "DnsNameServers") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     max_capacity_units =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxCapacityUnits") _list path;
     min_capacity_units =
       option_of_yojson (value_for_key integer_optional_of_yojson "MinCapacityUnits") _list path;
     multi_a_z = option_of_yojson (value_for_key boolean_optional_of_yojson "MultiAZ") _list path;
     preferred_maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "PreferredMaintenanceWindow") _list path;
     replication_subnet_group_id =
       option_of_yojson (value_for_key string__of_yojson "ReplicationSubnetGroupId") _list path;
     vpc_security_group_ids =
       option_of_yojson (value_for_key string_list_of_yojson "VpcSecurityGroupIds") _list path;
   }
    : compute_config)

let replication_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config_identifier =
       option_of_yojson (value_for_key string__of_yojson "ReplicationConfigIdentifier") _list path;
     replication_config_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationConfigArn") _list path;
     source_endpoint_arn =
       option_of_yojson (value_for_key string__of_yojson "SourceEndpointArn") _list path;
     target_endpoint_arn =
       option_of_yojson (value_for_key string__of_yojson "TargetEndpointArn") _list path;
     replication_type =
       option_of_yojson (value_for_key migration_type_value_of_yojson "ReplicationType") _list path;
     compute_config =
       option_of_yojson (value_for_key compute_config_of_yojson "ComputeConfig") _list path;
     replication_settings =
       option_of_yojson (value_for_key string__of_yojson "ReplicationSettings") _list path;
     supplemental_settings =
       option_of_yojson (value_for_key string__of_yojson "SupplementalSettings") _list path;
     table_mappings = option_of_yojson (value_for_key string__of_yojson "TableMappings") _list path;
     replication_config_create_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "ReplicationConfigCreateTime") _list path;
     replication_config_update_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "ReplicationConfigUpdateTime") _list path;
     is_read_only =
       option_of_yojson (value_for_key boolean_optional_of_yojson "IsReadOnly") _list path;
   }
    : replication_config)

let modify_replication_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config =
       option_of_yojson (value_for_key replication_config_of_yojson "ReplicationConfig") _list path;
   }
    : modify_replication_config_response)

let modify_replication_config_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config_arn = value_for_key string__of_yojson "ReplicationConfigArn" _list path;
     replication_config_identifier =
       option_of_yojson (value_for_key string__of_yojson "ReplicationConfigIdentifier") _list path;
     replication_type =
       option_of_yojson (value_for_key migration_type_value_of_yojson "ReplicationType") _list path;
     table_mappings = option_of_yojson (value_for_key string__of_yojson "TableMappings") _list path;
     replication_settings =
       option_of_yojson (value_for_key string__of_yojson "ReplicationSettings") _list path;
     supplemental_settings =
       option_of_yojson (value_for_key string__of_yojson "SupplementalSettings") _list path;
     compute_config =
       option_of_yojson (value_for_key compute_config_of_yojson "ComputeConfig") _list path;
     source_endpoint_arn =
       option_of_yojson (value_for_key string__of_yojson "SourceEndpointArn") _list path;
     target_endpoint_arn =
       option_of_yojson (value_for_key string__of_yojson "TargetEndpointArn") _list path;
   }
    : modify_replication_config_message)

let sc_application_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket_path = option_of_yojson (value_for_key string__of_yojson "S3BucketPath") _list path;
     s3_bucket_role_arn =
       option_of_yojson (value_for_key string__of_yojson "S3BucketRoleArn") _list path;
   }
    : sc_application_attributes)

let data_provider_descriptor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
     data_provider_name =
       option_of_yojson (value_for_key string__of_yojson "DataProviderName") _list path;
     data_provider_arn =
       option_of_yojson (value_for_key string__of_yojson "DataProviderArn") _list path;
   }
    : data_provider_descriptor)

let data_provider_descriptor_list_of_yojson tree path =
  list_of_yojson data_provider_descriptor_of_yojson tree path

let migration_project_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_name =
       option_of_yojson (value_for_key string__of_yojson "MigrationProjectName") _list path;
     migration_project_arn =
       option_of_yojson (value_for_key string__of_yojson "MigrationProjectArn") _list path;
     migration_project_creation_time =
       option_of_yojson
         (value_for_key iso8601_date_time_of_yojson "MigrationProjectCreationTime")
         _list path;
     source_data_provider_descriptors =
       option_of_yojson
         (value_for_key data_provider_descriptor_list_of_yojson "SourceDataProviderDescriptors")
         _list path;
     target_data_provider_descriptors =
       option_of_yojson
         (value_for_key data_provider_descriptor_list_of_yojson "TargetDataProviderDescriptors")
         _list path;
     instance_profile_arn =
       option_of_yojson (value_for_key string__of_yojson "InstanceProfileArn") _list path;
     instance_profile_name =
       option_of_yojson (value_for_key string__of_yojson "InstanceProfileName") _list path;
     transformation_rules =
       option_of_yojson (value_for_key string__of_yojson "TransformationRules") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     schema_conversion_application_attributes =
       option_of_yojson
         (value_for_key sc_application_attributes_of_yojson "SchemaConversionApplicationAttributes")
         _list path;
   }
    : migration_project)

let modify_migration_project_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project =
       option_of_yojson (value_for_key migration_project_of_yojson "MigrationProject") _list path;
   }
    : modify_migration_project_response)

let data_provider_descriptor_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_provider_identifier = value_for_key string__of_yojson "DataProviderIdentifier" _list path;
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
   }
    : data_provider_descriptor_definition)

let data_provider_descriptor_definition_list_of_yojson tree path =
  list_of_yojson data_provider_descriptor_definition_of_yojson tree path

let modify_migration_project_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key string__of_yojson "MigrationProjectIdentifier" _list path;
     migration_project_name =
       option_of_yojson (value_for_key string__of_yojson "MigrationProjectName") _list path;
     source_data_provider_descriptors =
       option_of_yojson
         (value_for_key data_provider_descriptor_definition_list_of_yojson
            "SourceDataProviderDescriptors")
         _list path;
     target_data_provider_descriptors =
       option_of_yojson
         (value_for_key data_provider_descriptor_definition_list_of_yojson
            "TargetDataProviderDescriptors")
         _list path;
     instance_profile_identifier =
       option_of_yojson (value_for_key string__of_yojson "InstanceProfileIdentifier") _list path;
     transformation_rules =
       option_of_yojson (value_for_key string__of_yojson "TransformationRules") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     schema_conversion_application_attributes =
       option_of_yojson
         (value_for_key sc_application_attributes_of_yojson "SchemaConversionApplicationAttributes")
         _list path;
   }
    : modify_migration_project_message)

let instance_profile_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_profile_arn =
       option_of_yojson (value_for_key string__of_yojson "InstanceProfileArn") _list path;
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "AvailabilityZone") _list path;
     kms_key_arn = option_of_yojson (value_for_key string__of_yojson "KmsKeyArn") _list path;
     publicly_accessible =
       option_of_yojson (value_for_key boolean_optional_of_yojson "PubliclyAccessible") _list path;
     network_type = option_of_yojson (value_for_key string__of_yojson "NetworkType") _list path;
     instance_profile_name =
       option_of_yojson (value_for_key string__of_yojson "InstanceProfileName") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     instance_profile_creation_time =
       option_of_yojson
         (value_for_key iso8601_date_time_of_yojson "InstanceProfileCreationTime")
         _list path;
     subnet_group_identifier =
       option_of_yojson (value_for_key string__of_yojson "SubnetGroupIdentifier") _list path;
     vpc_security_groups =
       option_of_yojson (value_for_key string_list_of_yojson "VpcSecurityGroups") _list path;
   }
    : instance_profile)

let modify_instance_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_profile =
       option_of_yojson (value_for_key instance_profile_of_yojson "InstanceProfile") _list path;
   }
    : modify_instance_profile_response)

let modify_instance_profile_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_profile_identifier =
       value_for_key string__of_yojson "InstanceProfileIdentifier" _list path;
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "AvailabilityZone") _list path;
     kms_key_arn = option_of_yojson (value_for_key string__of_yojson "KmsKeyArn") _list path;
     publicly_accessible =
       option_of_yojson (value_for_key boolean_optional_of_yojson "PubliclyAccessible") _list path;
     network_type = option_of_yojson (value_for_key string__of_yojson "NetworkType") _list path;
     instance_profile_name =
       option_of_yojson (value_for_key string__of_yojson "InstanceProfileName") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     subnet_group_identifier =
       option_of_yojson (value_for_key string__of_yojson "SubnetGroupIdentifier") _list path;
     vpc_security_groups =
       option_of_yojson (value_for_key string_list_of_yojson "VpcSecurityGroups") _list path;
   }
    : modify_instance_profile_message)

let sns_no_authorization_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : sns_no_authorization_fault)

let sns_invalid_topic_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : sns_invalid_topic_fault)

let kms_throttling_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : kms_throttling_fault)

let event_categories_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
let source_ids_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let event_subscription_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     customer_aws_id = option_of_yojson (value_for_key string__of_yojson "CustomerAwsId") _list path;
     cust_subscription_id =
       option_of_yojson (value_for_key string__of_yojson "CustSubscriptionId") _list path;
     sns_topic_arn = option_of_yojson (value_for_key string__of_yojson "SnsTopicArn") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     subscription_creation_time =
       option_of_yojson (value_for_key string__of_yojson "SubscriptionCreationTime") _list path;
     source_type = option_of_yojson (value_for_key string__of_yojson "SourceType") _list path;
     source_ids_list =
       option_of_yojson (value_for_key source_ids_list_of_yojson "SourceIdsList") _list path;
     event_categories_list =
       option_of_yojson
         (value_for_key event_categories_list_of_yojson "EventCategoriesList")
         _list path;
     enabled = option_of_yojson (value_for_key boolean__of_yojson "Enabled") _list path;
   }
    : event_subscription)

let modify_event_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_subscription =
       option_of_yojson (value_for_key event_subscription_of_yojson "EventSubscription") _list path;
   }
    : modify_event_subscription_response)

let modify_event_subscription_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription_name = value_for_key string__of_yojson "SubscriptionName" _list path;
     sns_topic_arn = option_of_yojson (value_for_key string__of_yojson "SnsTopicArn") _list path;
     source_type = option_of_yojson (value_for_key string__of_yojson "SourceType") _list path;
     event_categories =
       option_of_yojson (value_for_key event_categories_list_of_yojson "EventCategories") _list path;
     enabled = option_of_yojson (value_for_key boolean_optional_of_yojson "Enabled") _list path;
   }
    : modify_event_subscription_message)

let lakehouse_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key string__of_yojson "Arn" _list path } : lakehouse_settings)

let timestream_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_name = value_for_key string__of_yojson "DatabaseName" _list path;
     memory_duration = value_for_key integer_optional_of_yojson "MemoryDuration" _list path;
     magnetic_duration = value_for_key integer_optional_of_yojson "MagneticDuration" _list path;
     cdc_inserts_and_updates =
       option_of_yojson (value_for_key boolean_optional_of_yojson "CdcInsertsAndUpdates") _list path;
     enable_magnetic_store_writes =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "EnableMagneticStoreWrites")
         _list path;
   }
    : timestream_settings)

let target_db_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "specific-database" -> SPECIFIC_DATABASE
    | `String "multiple-databases" -> MULTIPLE_DATABASES
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetDbType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetDbType")
     : target_db_type)
    : target_db_type)

let gcp_my_sql_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     after_connect_script =
       option_of_yojson (value_for_key string__of_yojson "AfterConnectScript") _list path;
     clean_source_metadata_on_mismatch =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "CleanSourceMetadataOnMismatch")
         _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     events_poll_interval =
       option_of_yojson (value_for_key integer_optional_of_yojson "EventsPollInterval") _list path;
     target_db_type =
       option_of_yojson (value_for_key target_db_type_of_yojson "TargetDbType") _list path;
     max_file_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxFileSize") _list path;
     parallel_load_threads =
       option_of_yojson (value_for_key integer_optional_of_yojson "ParallelLoadThreads") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     server_timezone =
       option_of_yojson (value_for_key string__of_yojson "ServerTimezone") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
   }
    : gcp_my_sql_settings)

let redis_auth_type_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> NONE
    | `String "auth-role" -> AUTH_ROLE
    | `String "auth-token" -> AUTH_TOKEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "RedisAuthTypeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "RedisAuthTypeValue")
     : redis_auth_type_value)
    : redis_auth_type_value)

let ssl_security_protocol_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "plaintext" -> PLAINTEXT
    | `String "ssl-encryption" -> SSL_ENCRYPTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SslSecurityProtocolValue" value)
    | _ -> raise (deserialize_wrong_type_error path "SslSecurityProtocolValue")
     : ssl_security_protocol_value)
    : ssl_security_protocol_value)

let redis_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = value_for_key string__of_yojson "ServerName" _list path;
     port = value_for_key integer_of_yojson "Port" _list path;
     ssl_security_protocol =
       option_of_yojson
         (value_for_key ssl_security_protocol_value_of_yojson "SslSecurityProtocol")
         _list path;
     auth_type =
       option_of_yojson (value_for_key redis_auth_type_value_of_yojson "AuthType") _list path;
     auth_user_name = option_of_yojson (value_for_key string__of_yojson "AuthUserName") _list path;
     auth_password =
       option_of_yojson (value_for_key secret_string_of_yojson "AuthPassword") _list path;
     ssl_ca_certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "SslCaCertificateArn") _list path;
   }
    : redis_settings)

let nesting_level_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> NONE
    | `String "one" -> ONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "NestingLevelValue" value)
    | _ -> raise (deserialize_wrong_type_error path "NestingLevelValue")
     : nesting_level_value)
    : nesting_level_value)

let doc_db_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     nesting_level =
       option_of_yojson (value_for_key nesting_level_value_of_yojson "NestingLevel") _list path;
     extract_doc_id =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ExtractDocId") _list path;
     docs_to_investigate =
       option_of_yojson (value_for_key integer_optional_of_yojson "DocsToInvestigate") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
     use_update_look_up =
       option_of_yojson (value_for_key boolean_optional_of_yojson "UseUpdateLookUp") _list path;
     replicate_shard_collections =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "ReplicateShardCollections")
         _list path;
   }
    : doc_db_settings)

let ibm_db2_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     set_data_capture_changes =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "SetDataCaptureChanges")
         _list path;
     current_lsn = option_of_yojson (value_for_key string__of_yojson "CurrentLsn") _list path;
     max_k_bytes_per_read =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxKBytesPerRead") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
     load_timeout =
       option_of_yojson (value_for_key integer_optional_of_yojson "LoadTimeout") _list path;
     write_buffer_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "WriteBufferSize") _list path;
     max_file_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxFileSize") _list path;
     keep_csv_files =
       option_of_yojson (value_for_key boolean_optional_of_yojson "KeepCsvFiles") _list path;
   }
    : ibm_db2_settings)

let sql_server_authentication_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "password" -> Password
    | `String "kerberos" -> Kerberos
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SqlServerAuthenticationMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "SqlServerAuthenticationMethod")
     : sql_server_authentication_method)
    : sql_server_authentication_method)

let tlog_access_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "BackupOnly" -> BackupOnly
    | `String "PreferBackup" -> PreferBackup
    | `String "PreferTlog" -> PreferTlog
    | `String "TlogOnly" -> TlogOnly
    | `String value -> raise (deserialize_unknown_enum_value_error path "TlogAccessMode" value)
    | _ -> raise (deserialize_wrong_type_error path "TlogAccessMode")
     : tlog_access_mode)
    : tlog_access_mode)

let safeguard_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "rely-on-sql-server-replication-agent" -> RELY_ON_SQL_SERVER_REPLICATION_AGENT
    | `String "exclusive-automatic-truncation" -> EXCLUSIVE_AUTOMATIC_TRUNCATION
    | `String "shared-automatic-truncation" -> SHARED_AUTOMATIC_TRUNCATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "SafeguardPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "SafeguardPolicy")
     : safeguard_policy)
    : safeguard_policy)

let microsoft_sql_server_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     bcp_packet_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "BcpPacketSize") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     control_tables_file_group =
       option_of_yojson (value_for_key string__of_yojson "ControlTablesFileGroup") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     query_single_always_on_node =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "QuerySingleAlwaysOnNode")
         _list path;
     read_backup_only =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ReadBackupOnly") _list path;
     safeguard_policy =
       option_of_yojson (value_for_key safeguard_policy_of_yojson "SafeguardPolicy") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     use_bcp_full_load =
       option_of_yojson (value_for_key boolean_optional_of_yojson "UseBcpFullLoad") _list path;
     use_third_party_backup_device =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "UseThirdPartyBackupDevice")
         _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
     trim_space_in_char =
       option_of_yojson (value_for_key boolean_optional_of_yojson "TrimSpaceInChar") _list path;
     tlog_access_mode =
       option_of_yojson (value_for_key tlog_access_mode_of_yojson "TlogAccessMode") _list path;
     force_lob_lookup =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ForceLobLookup") _list path;
     authentication_method =
       option_of_yojson
         (value_for_key sql_server_authentication_method_of_yojson "AuthenticationMethod")
         _list path;
   }
    : microsoft_sql_server_settings)

let sybase_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
   }
    : sybase_settings)

let oracle_authentication_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "password" -> Password
    | `String "kerberos" -> Kerberos
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OracleAuthenticationMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "OracleAuthenticationMethod")
     : oracle_authentication_method)
    : oracle_authentication_method)

let char_length_semantics_of_yojson (tree : t) path =
  ((match tree with
    | `String "default" -> DEFAULT
    | `String "char" -> CHAR
    | `String "byte" -> BYTE
    | `String value -> raise (deserialize_unknown_enum_value_error path "CharLengthSemantics" value)
    | _ -> raise (deserialize_wrong_type_error path "CharLengthSemantics")
     : char_length_semantics)
    : char_length_semantics)

let integer_list_of_yojson tree path = list_of_yojson integer_of_yojson tree path

let oracle_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     add_supplemental_logging =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "AddSupplementalLogging")
         _list path;
     archived_log_dest_id =
       option_of_yojson (value_for_key integer_optional_of_yojson "ArchivedLogDestId") _list path;
     additional_archived_log_dest_id =
       option_of_yojson
         (value_for_key integer_optional_of_yojson "AdditionalArchivedLogDestId")
         _list path;
     extra_archived_log_dest_ids =
       option_of_yojson (value_for_key integer_list_of_yojson "ExtraArchivedLogDestIds") _list path;
     allow_select_nested_tables =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "AllowSelectNestedTables")
         _list path;
     parallel_asm_read_threads =
       option_of_yojson
         (value_for_key integer_optional_of_yojson "ParallelAsmReadThreads")
         _list path;
     read_ahead_blocks =
       option_of_yojson (value_for_key integer_optional_of_yojson "ReadAheadBlocks") _list path;
     access_alternate_directly =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "AccessAlternateDirectly")
         _list path;
     use_alternate_folder_for_online =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "UseAlternateFolderForOnline")
         _list path;
     oracle_path_prefix =
       option_of_yojson (value_for_key string__of_yojson "OraclePathPrefix") _list path;
     use_path_prefix = option_of_yojson (value_for_key string__of_yojson "UsePathPrefix") _list path;
     replace_path_prefix =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ReplacePathPrefix") _list path;
     enable_homogenous_tablespace =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "EnableHomogenousTablespace")
         _list path;
     direct_path_no_log =
       option_of_yojson (value_for_key boolean_optional_of_yojson "DirectPathNoLog") _list path;
     archived_logs_only =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ArchivedLogsOnly") _list path;
     asm_password =
       option_of_yojson (value_for_key secret_string_of_yojson "AsmPassword") _list path;
     asm_server = option_of_yojson (value_for_key string__of_yojson "AsmServer") _list path;
     asm_user = option_of_yojson (value_for_key string__of_yojson "AsmUser") _list path;
     char_length_semantics =
       option_of_yojson
         (value_for_key char_length_semantics_of_yojson "CharLengthSemantics")
         _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     direct_path_parallel_load =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "DirectPathParallelLoad")
         _list path;
     fail_tasks_on_lob_truncation =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "FailTasksOnLobTruncation")
         _list path;
     number_datatype_scale =
       option_of_yojson (value_for_key integer_optional_of_yojson "NumberDatatypeScale") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     read_table_space_name =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ReadTableSpaceName") _list path;
     retry_interval =
       option_of_yojson (value_for_key integer_optional_of_yojson "RetryInterval") _list path;
     security_db_encryption =
       option_of_yojson (value_for_key secret_string_of_yojson "SecurityDbEncryption") _list path;
     security_db_encryption_name =
       option_of_yojson (value_for_key string__of_yojson "SecurityDbEncryptionName") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     spatial_data_option_to_geo_json_function_name =
       option_of_yojson
         (value_for_key string__of_yojson "SpatialDataOptionToGeoJsonFunctionName")
         _list path;
     standby_delay_time =
       option_of_yojson (value_for_key integer_optional_of_yojson "StandbyDelayTime") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     use_b_file = option_of_yojson (value_for_key boolean_optional_of_yojson "UseBFile") _list path;
     use_direct_path_full_load =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "UseDirectPathFullLoad")
         _list path;
     use_logminer_reader =
       option_of_yojson (value_for_key boolean_optional_of_yojson "UseLogminerReader") _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
     secrets_manager_oracle_asm_access_role_arn =
       option_of_yojson
         (value_for_key string__of_yojson "SecretsManagerOracleAsmAccessRoleArn")
         _list path;
     secrets_manager_oracle_asm_secret_id =
       option_of_yojson
         (value_for_key string__of_yojson "SecretsManagerOracleAsmSecretId")
         _list path;
     trim_space_in_char =
       option_of_yojson (value_for_key boolean_optional_of_yojson "TrimSpaceInChar") _list path;
     convert_timestamp_with_zone_to_ut_c =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "ConvertTimestampWithZoneToUTC")
         _list path;
     open_transaction_window =
       option_of_yojson
         (value_for_key integer_optional_of_yojson "OpenTransactionWindow")
         _list path;
     authentication_method =
       option_of_yojson
         (value_for_key oracle_authentication_method_of_yojson "AuthenticationMethod")
         _list path;
   }
    : oracle_settings)

let my_sql_authentication_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "password" -> Password
    | `String "iam" -> IAM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MySQLAuthenticationMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "MySQLAuthenticationMethod")
     : my_sql_authentication_method)
    : my_sql_authentication_method)

let my_sql_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     after_connect_script =
       option_of_yojson (value_for_key string__of_yojson "AfterConnectScript") _list path;
     clean_source_metadata_on_mismatch =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "CleanSourceMetadataOnMismatch")
         _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     events_poll_interval =
       option_of_yojson (value_for_key integer_optional_of_yojson "EventsPollInterval") _list path;
     target_db_type =
       option_of_yojson (value_for_key target_db_type_of_yojson "TargetDbType") _list path;
     max_file_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxFileSize") _list path;
     parallel_load_threads =
       option_of_yojson (value_for_key integer_optional_of_yojson "ParallelLoadThreads") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     server_timezone =
       option_of_yojson (value_for_key string__of_yojson "ServerTimezone") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
     execute_timeout =
       option_of_yojson (value_for_key integer_optional_of_yojson "ExecuteTimeout") _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     authentication_method =
       option_of_yojson
         (value_for_key my_sql_authentication_method_of_yojson "AuthenticationMethod")
         _list path;
   }
    : my_sql_settings)

let postgre_sql_authentication_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "password" -> Password
    | `String "iam" -> IAM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PostgreSQLAuthenticationMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "PostgreSQLAuthenticationMethod")
     : postgre_sql_authentication_method)
    : postgre_sql_authentication_method)

let database_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "default" -> DEFAULT
    | `String "babelfish" -> BABELFISH
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatabaseMode" value)
    | _ -> raise (deserialize_wrong_type_error path "DatabaseMode")
     : database_mode)
    : database_mode)

let long_varchar_mapping_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "wstring" -> WSTRING
    | `String "clob" -> CLOB
    | `String "nclob" -> NCLOB
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LongVarcharMappingType" value)
    | _ -> raise (deserialize_wrong_type_error path "LongVarcharMappingType")
     : long_varchar_mapping_type)
    : long_varchar_mapping_type)

let plugin_name_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "no-preference" -> NO_PREFERENCE
    | `String "test-decoding" -> TEST_DECODING
    | `String "pglogical" -> PGLOGICAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "PluginNameValue" value)
    | _ -> raise (deserialize_wrong_type_error path "PluginNameValue")
     : plugin_name_value)
    : plugin_name_value)

let postgre_sql_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     after_connect_script =
       option_of_yojson (value_for_key string__of_yojson "AfterConnectScript") _list path;
     capture_ddls =
       option_of_yojson (value_for_key boolean_optional_of_yojson "CaptureDdls") _list path;
     max_file_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxFileSize") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     ddl_artifacts_schema =
       option_of_yojson (value_for_key string__of_yojson "DdlArtifactsSchema") _list path;
     execute_timeout =
       option_of_yojson (value_for_key integer_optional_of_yojson "ExecuteTimeout") _list path;
     fail_tasks_on_lob_truncation =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "FailTasksOnLobTruncation")
         _list path;
     heartbeat_enable =
       option_of_yojson (value_for_key boolean_optional_of_yojson "HeartbeatEnable") _list path;
     heartbeat_schema =
       option_of_yojson (value_for_key string__of_yojson "HeartbeatSchema") _list path;
     heartbeat_frequency =
       option_of_yojson (value_for_key integer_optional_of_yojson "HeartbeatFrequency") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     slot_name = option_of_yojson (value_for_key string__of_yojson "SlotName") _list path;
     plugin_name =
       option_of_yojson (value_for_key plugin_name_value_of_yojson "PluginName") _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
     trim_space_in_char =
       option_of_yojson (value_for_key boolean_optional_of_yojson "TrimSpaceInChar") _list path;
     map_boolean_as_boolean =
       option_of_yojson (value_for_key boolean_optional_of_yojson "MapBooleanAsBoolean") _list path;
     map_jsonb_as_clob =
       option_of_yojson (value_for_key boolean_optional_of_yojson "MapJsonbAsClob") _list path;
     map_long_varchar_as =
       option_of_yojson
         (value_for_key long_varchar_mapping_type_of_yojson "MapLongVarcharAs")
         _list path;
     database_mode =
       option_of_yojson (value_for_key database_mode_of_yojson "DatabaseMode") _list path;
     babelfish_database_name =
       option_of_yojson (value_for_key string__of_yojson "BabelfishDatabaseName") _list path;
     disable_unicode_source_filter =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "DisableUnicodeSourceFilter")
         _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     authentication_method =
       option_of_yojson
         (value_for_key postgre_sql_authentication_method_of_yojson "AuthenticationMethod")
         _list path;
   }
    : postgre_sql_settings)

let encryption_mode_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "sse-s3" -> SSE_S3
    | `String "sse-kms" -> SSE_KMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionModeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionModeValue")
     : encryption_mode_value)
    : encryption_mode_value)

let redshift_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accept_any_date =
       option_of_yojson (value_for_key boolean_optional_of_yojson "AcceptAnyDate") _list path;
     after_connect_script =
       option_of_yojson (value_for_key string__of_yojson "AfterConnectScript") _list path;
     bucket_folder = option_of_yojson (value_for_key string__of_yojson "BucketFolder") _list path;
     bucket_name = option_of_yojson (value_for_key string__of_yojson "BucketName") _list path;
     case_sensitive_names =
       option_of_yojson (value_for_key boolean_optional_of_yojson "CaseSensitiveNames") _list path;
     comp_update =
       option_of_yojson (value_for_key boolean_optional_of_yojson "CompUpdate") _list path;
     connection_timeout =
       option_of_yojson (value_for_key integer_optional_of_yojson "ConnectionTimeout") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     date_format = option_of_yojson (value_for_key string__of_yojson "DateFormat") _list path;
     empty_as_null =
       option_of_yojson (value_for_key boolean_optional_of_yojson "EmptyAsNull") _list path;
     encryption_mode =
       option_of_yojson (value_for_key encryption_mode_value_of_yojson "EncryptionMode") _list path;
     explicit_ids =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ExplicitIds") _list path;
     file_transfer_upload_streams =
       option_of_yojson
         (value_for_key integer_optional_of_yojson "FileTransferUploadStreams")
         _list path;
     load_timeout =
       option_of_yojson (value_for_key integer_optional_of_yojson "LoadTimeout") _list path;
     max_file_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxFileSize") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     remove_quotes =
       option_of_yojson (value_for_key boolean_optional_of_yojson "RemoveQuotes") _list path;
     replace_invalid_chars =
       option_of_yojson (value_for_key string__of_yojson "ReplaceInvalidChars") _list path;
     replace_chars = option_of_yojson (value_for_key string__of_yojson "ReplaceChars") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     server_side_encryption_kms_key_id =
       option_of_yojson (value_for_key string__of_yojson "ServerSideEncryptionKmsKeyId") _list path;
     time_format = option_of_yojson (value_for_key string__of_yojson "TimeFormat") _list path;
     trim_blanks =
       option_of_yojson (value_for_key boolean_optional_of_yojson "TrimBlanks") _list path;
     truncate_columns =
       option_of_yojson (value_for_key boolean_optional_of_yojson "TruncateColumns") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     write_buffer_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "WriteBufferSize") _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
     map_boolean_as_boolean =
       option_of_yojson (value_for_key boolean_optional_of_yojson "MapBooleanAsBoolean") _list path;
   }
    : redshift_settings)

let neptune_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     s3_bucket_name = value_for_key string__of_yojson "S3BucketName" _list path;
     s3_bucket_folder = value_for_key string__of_yojson "S3BucketFolder" _list path;
     error_retry_duration =
       option_of_yojson (value_for_key integer_optional_of_yojson "ErrorRetryDuration") _list path;
     max_file_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxFileSize") _list path;
     max_retry_count =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRetryCount") _list path;
     iam_auth_enabled =
       option_of_yojson (value_for_key boolean_optional_of_yojson "IamAuthEnabled") _list path;
   }
    : neptune_settings)

let elasticsearch_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_access_role_arn = value_for_key string__of_yojson "ServiceAccessRoleArn" _list path;
     endpoint_uri = value_for_key string__of_yojson "EndpointUri" _list path;
     full_load_error_percentage =
       option_of_yojson
         (value_for_key integer_optional_of_yojson "FullLoadErrorPercentage")
         _list path;
     error_retry_duration =
       option_of_yojson (value_for_key integer_optional_of_yojson "ErrorRetryDuration") _list path;
     use_new_mapping_type =
       option_of_yojson (value_for_key boolean_optional_of_yojson "UseNewMappingType") _list path;
   }
    : elasticsearch_settings)

let kafka_ssl_endpoint_identification_algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> NONE
    | `String "https" -> HTTPS
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "KafkaSslEndpointIdentificationAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "KafkaSslEndpointIdentificationAlgorithm")
     : kafka_ssl_endpoint_identification_algorithm)
    : kafka_ssl_endpoint_identification_algorithm)

let kafka_sasl_mechanism_of_yojson (tree : t) path =
  ((match tree with
    | `String "scram-sha-512" -> SCRAM_SHA_512
    | `String "plain" -> PLAIN
    | `String value -> raise (deserialize_unknown_enum_value_error path "KafkaSaslMechanism" value)
    | _ -> raise (deserialize_wrong_type_error path "KafkaSaslMechanism")
     : kafka_sasl_mechanism)
    : kafka_sasl_mechanism)

let kafka_security_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "plaintext" -> PLAINTEXT
    | `String "ssl-authentication" -> SSL_AUTHENTICATION
    | `String "ssl-encryption" -> SSL_ENCRYPTION
    | `String "sasl-ssl" -> SASL_SSL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "KafkaSecurityProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "KafkaSecurityProtocol")
     : kafka_security_protocol)
    : kafka_security_protocol)

let message_format_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "json" -> JSON
    | `String "json-unformatted" -> JSON_UNFORMATTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "MessageFormatValue" value)
    | _ -> raise (deserialize_wrong_type_error path "MessageFormatValue")
     : message_format_value)
    : message_format_value)

let kafka_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     broker = option_of_yojson (value_for_key string__of_yojson "Broker") _list path;
     topic = option_of_yojson (value_for_key string__of_yojson "Topic") _list path;
     message_format =
       option_of_yojson (value_for_key message_format_value_of_yojson "MessageFormat") _list path;
     include_transaction_details =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "IncludeTransactionDetails")
         _list path;
     include_partition_value =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "IncludePartitionValue")
         _list path;
     partition_include_schema_table =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "PartitionIncludeSchemaTable")
         _list path;
     include_table_alter_operations =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "IncludeTableAlterOperations")
         _list path;
     include_control_details =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "IncludeControlDetails")
         _list path;
     message_max_bytes =
       option_of_yojson (value_for_key integer_optional_of_yojson "MessageMaxBytes") _list path;
     include_null_and_empty =
       option_of_yojson (value_for_key boolean_optional_of_yojson "IncludeNullAndEmpty") _list path;
     security_protocol =
       option_of_yojson
         (value_for_key kafka_security_protocol_of_yojson "SecurityProtocol")
         _list path;
     ssl_client_certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "SslClientCertificateArn") _list path;
     ssl_client_key_arn =
       option_of_yojson (value_for_key string__of_yojson "SslClientKeyArn") _list path;
     ssl_client_key_password =
       option_of_yojson (value_for_key secret_string_of_yojson "SslClientKeyPassword") _list path;
     ssl_ca_certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "SslCaCertificateArn") _list path;
     sasl_username = option_of_yojson (value_for_key string__of_yojson "SaslUsername") _list path;
     sasl_password =
       option_of_yojson (value_for_key secret_string_of_yojson "SaslPassword") _list path;
     no_hex_prefix =
       option_of_yojson (value_for_key boolean_optional_of_yojson "NoHexPrefix") _list path;
     sasl_mechanism =
       option_of_yojson (value_for_key kafka_sasl_mechanism_of_yojson "SaslMechanism") _list path;
     ssl_endpoint_identification_algorithm =
       option_of_yojson
         (value_for_key kafka_ssl_endpoint_identification_algorithm_of_yojson
            "SslEndpointIdentificationAlgorithm")
         _list path;
     use_large_integer_value =
       option_of_yojson (value_for_key boolean_optional_of_yojson "UseLargeIntegerValue") _list path;
   }
    : kafka_settings)

let kinesis_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_arn = option_of_yojson (value_for_key string__of_yojson "StreamArn") _list path;
     message_format =
       option_of_yojson (value_for_key message_format_value_of_yojson "MessageFormat") _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     include_transaction_details =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "IncludeTransactionDetails")
         _list path;
     include_partition_value =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "IncludePartitionValue")
         _list path;
     partition_include_schema_table =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "PartitionIncludeSchemaTable")
         _list path;
     include_table_alter_operations =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "IncludeTableAlterOperations")
         _list path;
     include_control_details =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "IncludeControlDetails")
         _list path;
     include_null_and_empty =
       option_of_yojson (value_for_key boolean_optional_of_yojson "IncludeNullAndEmpty") _list path;
     no_hex_prefix =
       option_of_yojson (value_for_key boolean_optional_of_yojson "NoHexPrefix") _list path;
     use_large_integer_value =
       option_of_yojson (value_for_key boolean_optional_of_yojson "UseLargeIntegerValue") _list path;
   }
    : kinesis_settings)

let auth_mechanism_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "default" -> DEFAULT
    | `String "mongodb_cr" -> MONGODB_CR
    | `String "scram_sha_1" -> SCRAM_SHA_1
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuthMechanismValue" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthMechanismValue")
     : auth_mechanism_value)
    : auth_mechanism_value)

let auth_type_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "no" -> NO
    | `String "password" -> PASSWORD
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuthTypeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthTypeValue")
     : auth_type_value)
    : auth_type_value)

let mongo_db_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     auth_type = option_of_yojson (value_for_key auth_type_value_of_yojson "AuthType") _list path;
     auth_mechanism =
       option_of_yojson (value_for_key auth_mechanism_value_of_yojson "AuthMechanism") _list path;
     nesting_level =
       option_of_yojson (value_for_key nesting_level_value_of_yojson "NestingLevel") _list path;
     extract_doc_id = option_of_yojson (value_for_key string__of_yojson "ExtractDocId") _list path;
     docs_to_investigate =
       option_of_yojson (value_for_key string__of_yojson "DocsToInvestigate") _list path;
     auth_source = option_of_yojson (value_for_key string__of_yojson "AuthSource") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     secrets_manager_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerAccessRoleArn") _list path;
     secrets_manager_secret_id =
       option_of_yojson (value_for_key string__of_yojson "SecretsManagerSecretId") _list path;
     use_update_look_up =
       option_of_yojson (value_for_key boolean_optional_of_yojson "UseUpdateLookUp") _list path;
     replicate_shard_collections =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "ReplicateShardCollections")
         _list path;
   }
    : mongo_db_settings)

let dms_transfer_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     bucket_name = option_of_yojson (value_for_key string__of_yojson "BucketName") _list path;
   }
    : dms_transfer_settings)

let canned_acl_for_objects_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> NONE
    | `String "private" -> PRIVATE
    | `String "public-read" -> PUBLIC_READ
    | `String "public-read-write" -> PUBLIC_READ_WRITE
    | `String "authenticated-read" -> AUTHENTICATED_READ
    | `String "aws-exec-read" -> AWS_EXEC_READ
    | `String "bucket-owner-read" -> BUCKET_OWNER_READ
    | `String "bucket-owner-full-control" -> BUCKET_OWNER_FULL_CONTROL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CannedAclForObjectsValue" value)
    | _ -> raise (deserialize_wrong_type_error path "CannedAclForObjectsValue")
     : canned_acl_for_objects_value)
    : canned_acl_for_objects_value)

let date_partition_delimiter_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "SLASH" -> SLASH
    | `String "UNDERSCORE" -> UNDERSCORE
    | `String "DASH" -> DASH
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DatePartitionDelimiterValue" value)
    | _ -> raise (deserialize_wrong_type_error path "DatePartitionDelimiterValue")
     : date_partition_delimiter_value)
    : date_partition_delimiter_value)

let date_partition_sequence_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "YYYYMMDD" -> YYYYMMDD
    | `String "YYYYMMDDHH" -> YYYYMMDDHH
    | `String "YYYYMM" -> YYYYMM
    | `String "MMYYYYDD" -> MMYYYYDD
    | `String "DDMMYYYY" -> DDMMYYYY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DatePartitionSequenceValue" value)
    | _ -> raise (deserialize_wrong_type_error path "DatePartitionSequenceValue")
     : date_partition_sequence_value)
    : date_partition_sequence_value)

let parquet_version_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "parquet-1-0" -> PARQUET_1_0
    | `String "parquet-2-0" -> PARQUET_2_0
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParquetVersionValue" value)
    | _ -> raise (deserialize_wrong_type_error path "ParquetVersionValue")
     : parquet_version_value)
    : parquet_version_value)

let encoding_type_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "plain" -> PLAIN
    | `String "plain-dictionary" -> PLAIN_DICTIONARY
    | `String "rle-dictionary" -> RLE_DICTIONARY
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncodingTypeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "EncodingTypeValue")
     : encoding_type_value)
    : encoding_type_value)

let data_format_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "csv" -> CSV
    | `String "parquet" -> PARQUET
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataFormatValue" value)
    | _ -> raise (deserialize_wrong_type_error path "DataFormatValue")
     : data_format_value)
    : data_format_value)

let compression_type_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> NONE
    | `String "gzip" -> GZIP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CompressionTypeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "CompressionTypeValue")
     : compression_type_value)
    : compression_type_value)

let s3_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     external_table_definition =
       option_of_yojson (value_for_key string__of_yojson "ExternalTableDefinition") _list path;
     csv_row_delimiter =
       option_of_yojson (value_for_key string__of_yojson "CsvRowDelimiter") _list path;
     csv_delimiter = option_of_yojson (value_for_key string__of_yojson "CsvDelimiter") _list path;
     bucket_folder = option_of_yojson (value_for_key string__of_yojson "BucketFolder") _list path;
     bucket_name = option_of_yojson (value_for_key string__of_yojson "BucketName") _list path;
     compression_type =
       option_of_yojson
         (value_for_key compression_type_value_of_yojson "CompressionType")
         _list path;
     encryption_mode =
       option_of_yojson (value_for_key encryption_mode_value_of_yojson "EncryptionMode") _list path;
     server_side_encryption_kms_key_id =
       option_of_yojson (value_for_key string__of_yojson "ServerSideEncryptionKmsKeyId") _list path;
     data_format =
       option_of_yojson (value_for_key data_format_value_of_yojson "DataFormat") _list path;
     encoding_type =
       option_of_yojson (value_for_key encoding_type_value_of_yojson "EncodingType") _list path;
     dict_page_size_limit =
       option_of_yojson (value_for_key integer_optional_of_yojson "DictPageSizeLimit") _list path;
     row_group_length =
       option_of_yojson (value_for_key integer_optional_of_yojson "RowGroupLength") _list path;
     data_page_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "DataPageSize") _list path;
     parquet_version =
       option_of_yojson (value_for_key parquet_version_value_of_yojson "ParquetVersion") _list path;
     enable_statistics =
       option_of_yojson (value_for_key boolean_optional_of_yojson "EnableStatistics") _list path;
     include_op_for_full_load =
       option_of_yojson (value_for_key boolean_optional_of_yojson "IncludeOpForFullLoad") _list path;
     cdc_inserts_only =
       option_of_yojson (value_for_key boolean_optional_of_yojson "CdcInsertsOnly") _list path;
     timestamp_column_name =
       option_of_yojson (value_for_key string__of_yojson "TimestampColumnName") _list path;
     parquet_timestamp_in_millisecond =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "ParquetTimestampInMillisecond")
         _list path;
     cdc_inserts_and_updates =
       option_of_yojson (value_for_key boolean_optional_of_yojson "CdcInsertsAndUpdates") _list path;
     date_partition_enabled =
       option_of_yojson (value_for_key boolean_optional_of_yojson "DatePartitionEnabled") _list path;
     date_partition_sequence =
       option_of_yojson
         (value_for_key date_partition_sequence_value_of_yojson "DatePartitionSequence")
         _list path;
     date_partition_delimiter =
       option_of_yojson
         (value_for_key date_partition_delimiter_value_of_yojson "DatePartitionDelimiter")
         _list path;
     use_csv_no_sup_value =
       option_of_yojson (value_for_key boolean_optional_of_yojson "UseCsvNoSupValue") _list path;
     csv_no_sup_value =
       option_of_yojson (value_for_key string__of_yojson "CsvNoSupValue") _list path;
     preserve_transactions =
       option_of_yojson (value_for_key boolean_optional_of_yojson "PreserveTransactions") _list path;
     cdc_path = option_of_yojson (value_for_key string__of_yojson "CdcPath") _list path;
     use_task_start_time_for_full_load_timestamp =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "UseTaskStartTimeForFullLoadTimestamp")
         _list path;
     canned_acl_for_objects =
       option_of_yojson
         (value_for_key canned_acl_for_objects_value_of_yojson "CannedAclForObjects")
         _list path;
     add_column_name =
       option_of_yojson (value_for_key boolean_optional_of_yojson "AddColumnName") _list path;
     cdc_max_batch_interval =
       option_of_yojson (value_for_key integer_optional_of_yojson "CdcMaxBatchInterval") _list path;
     cdc_min_file_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "CdcMinFileSize") _list path;
     csv_null_value = option_of_yojson (value_for_key string__of_yojson "CsvNullValue") _list path;
     ignore_header_rows =
       option_of_yojson (value_for_key integer_optional_of_yojson "IgnoreHeaderRows") _list path;
     max_file_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxFileSize") _list path;
     rfc4180 = option_of_yojson (value_for_key boolean_optional_of_yojson "Rfc4180") _list path;
     date_partition_timezone =
       option_of_yojson (value_for_key string__of_yojson "DatePartitionTimezone") _list path;
     add_trailing_padding_character =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "AddTrailingPaddingCharacter")
         _list path;
     expected_bucket_owner =
       option_of_yojson (value_for_key string__of_yojson "ExpectedBucketOwner") _list path;
     glue_catalog_generation =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "GlueCatalogGeneration")
         _list path;
   }
    : s3_settings)

let dynamo_db_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_access_role_arn = value_for_key string__of_yojson "ServiceAccessRoleArn" _list path }
    : dynamo_db_settings)

let dms_ssl_mode_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> NONE
    | `String "require" -> REQUIRE
    | `String "verify-ca" -> VERIFY_CA
    | `String "verify-full" -> VERIFY_FULL
    | `String value -> raise (deserialize_unknown_enum_value_error path "DmsSslModeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "DmsSslModeValue")
     : dms_ssl_mode_value)
    : dms_ssl_mode_value)

let replication_endpoint_type_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "source" -> SOURCE
    | `String "target" -> TARGET
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ReplicationEndpointTypeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplicationEndpointTypeValue")
     : replication_endpoint_type_value)
    : replication_endpoint_type_value)

let endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_identifier =
       option_of_yojson (value_for_key string__of_yojson "EndpointIdentifier") _list path;
     endpoint_type =
       option_of_yojson
         (value_for_key replication_endpoint_type_value_of_yojson "EndpointType")
         _list path;
     engine_name = option_of_yojson (value_for_key string__of_yojson "EngineName") _list path;
     engine_display_name =
       option_of_yojson (value_for_key string__of_yojson "EngineDisplayName") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     extra_connection_attributes =
       option_of_yojson (value_for_key string__of_yojson "ExtraConnectionAttributes") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     endpoint_arn = option_of_yojson (value_for_key string__of_yojson "EndpointArn") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     external_table_definition =
       option_of_yojson (value_for_key string__of_yojson "ExternalTableDefinition") _list path;
     external_id = option_of_yojson (value_for_key string__of_yojson "ExternalId") _list path;
     is_read_only =
       option_of_yojson (value_for_key boolean_optional_of_yojson "IsReadOnly") _list path;
     dynamo_db_settings =
       option_of_yojson (value_for_key dynamo_db_settings_of_yojson "DynamoDbSettings") _list path;
     s3_settings = option_of_yojson (value_for_key s3_settings_of_yojson "S3Settings") _list path;
     dms_transfer_settings =
       option_of_yojson
         (value_for_key dms_transfer_settings_of_yojson "DmsTransferSettings")
         _list path;
     mongo_db_settings =
       option_of_yojson (value_for_key mongo_db_settings_of_yojson "MongoDbSettings") _list path;
     kinesis_settings =
       option_of_yojson (value_for_key kinesis_settings_of_yojson "KinesisSettings") _list path;
     kafka_settings =
       option_of_yojson (value_for_key kafka_settings_of_yojson "KafkaSettings") _list path;
     elasticsearch_settings =
       option_of_yojson
         (value_for_key elasticsearch_settings_of_yojson "ElasticsearchSettings")
         _list path;
     neptune_settings =
       option_of_yojson (value_for_key neptune_settings_of_yojson "NeptuneSettings") _list path;
     redshift_settings =
       option_of_yojson (value_for_key redshift_settings_of_yojson "RedshiftSettings") _list path;
     postgre_sql_settings =
       option_of_yojson
         (value_for_key postgre_sql_settings_of_yojson "PostgreSQLSettings")
         _list path;
     my_sql_settings =
       option_of_yojson (value_for_key my_sql_settings_of_yojson "MySQLSettings") _list path;
     oracle_settings =
       option_of_yojson (value_for_key oracle_settings_of_yojson "OracleSettings") _list path;
     sybase_settings =
       option_of_yojson (value_for_key sybase_settings_of_yojson "SybaseSettings") _list path;
     microsoft_sql_server_settings =
       option_of_yojson
         (value_for_key microsoft_sql_server_settings_of_yojson "MicrosoftSQLServerSettings")
         _list path;
     ibm_db2_settings =
       option_of_yojson (value_for_key ibm_db2_settings_of_yojson "IBMDb2Settings") _list path;
     doc_db_settings =
       option_of_yojson (value_for_key doc_db_settings_of_yojson "DocDbSettings") _list path;
     redis_settings =
       option_of_yojson (value_for_key redis_settings_of_yojson "RedisSettings") _list path;
     gcp_my_sql_settings =
       option_of_yojson (value_for_key gcp_my_sql_settings_of_yojson "GcpMySQLSettings") _list path;
     timestream_settings =
       option_of_yojson
         (value_for_key timestream_settings_of_yojson "TimestreamSettings")
         _list path;
     lakehouse_settings =
       option_of_yojson (value_for_key lakehouse_settings_of_yojson "LakehouseSettings") _list path;
   }
    : endpoint)

let modify_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint = option_of_yojson (value_for_key endpoint_of_yojson "Endpoint") _list path }
    : modify_endpoint_response)

let modify_endpoint_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_arn = value_for_key string__of_yojson "EndpointArn" _list path;
     endpoint_identifier =
       option_of_yojson (value_for_key string__of_yojson "EndpointIdentifier") _list path;
     endpoint_type =
       option_of_yojson
         (value_for_key replication_endpoint_type_value_of_yojson "EndpointType")
         _list path;
     engine_name = option_of_yojson (value_for_key string__of_yojson "EngineName") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     extra_connection_attributes =
       option_of_yojson (value_for_key string__of_yojson "ExtraConnectionAttributes") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     external_table_definition =
       option_of_yojson (value_for_key string__of_yojson "ExternalTableDefinition") _list path;
     dynamo_db_settings =
       option_of_yojson (value_for_key dynamo_db_settings_of_yojson "DynamoDbSettings") _list path;
     s3_settings = option_of_yojson (value_for_key s3_settings_of_yojson "S3Settings") _list path;
     dms_transfer_settings =
       option_of_yojson
         (value_for_key dms_transfer_settings_of_yojson "DmsTransferSettings")
         _list path;
     mongo_db_settings =
       option_of_yojson (value_for_key mongo_db_settings_of_yojson "MongoDbSettings") _list path;
     kinesis_settings =
       option_of_yojson (value_for_key kinesis_settings_of_yojson "KinesisSettings") _list path;
     kafka_settings =
       option_of_yojson (value_for_key kafka_settings_of_yojson "KafkaSettings") _list path;
     elasticsearch_settings =
       option_of_yojson
         (value_for_key elasticsearch_settings_of_yojson "ElasticsearchSettings")
         _list path;
     neptune_settings =
       option_of_yojson (value_for_key neptune_settings_of_yojson "NeptuneSettings") _list path;
     redshift_settings =
       option_of_yojson (value_for_key redshift_settings_of_yojson "RedshiftSettings") _list path;
     postgre_sql_settings =
       option_of_yojson
         (value_for_key postgre_sql_settings_of_yojson "PostgreSQLSettings")
         _list path;
     my_sql_settings =
       option_of_yojson (value_for_key my_sql_settings_of_yojson "MySQLSettings") _list path;
     oracle_settings =
       option_of_yojson (value_for_key oracle_settings_of_yojson "OracleSettings") _list path;
     sybase_settings =
       option_of_yojson (value_for_key sybase_settings_of_yojson "SybaseSettings") _list path;
     microsoft_sql_server_settings =
       option_of_yojson
         (value_for_key microsoft_sql_server_settings_of_yojson "MicrosoftSQLServerSettings")
         _list path;
     ibm_db2_settings =
       option_of_yojson (value_for_key ibm_db2_settings_of_yojson "IBMDb2Settings") _list path;
     doc_db_settings =
       option_of_yojson (value_for_key doc_db_settings_of_yojson "DocDbSettings") _list path;
     redis_settings =
       option_of_yojson (value_for_key redis_settings_of_yojson "RedisSettings") _list path;
     exact_settings =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ExactSettings") _list path;
     gcp_my_sql_settings =
       option_of_yojson (value_for_key gcp_my_sql_settings_of_yojson "GcpMySQLSettings") _list path;
     timestream_settings =
       option_of_yojson
         (value_for_key timestream_settings_of_yojson "TimestreamSettings")
         _list path;
   }
    : modify_endpoint_message)

let mongo_db_data_provider_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     auth_type = option_of_yojson (value_for_key auth_type_value_of_yojson "AuthType") _list path;
     auth_source = option_of_yojson (value_for_key string__of_yojson "AuthSource") _list path;
     auth_mechanism =
       option_of_yojson (value_for_key auth_mechanism_value_of_yojson "AuthMechanism") _list path;
   }
    : mongo_db_data_provider_settings)

let ibm_db2z_os_data_provider_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     s3_path = option_of_yojson (value_for_key string__of_yojson "S3Path") _list path;
     s3_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "S3AccessRoleArn") _list path;
   }
    : ibm_db2z_os_data_provider_settings)

let ibm_db2_luw_data_provider_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     encryption_algorithm =
       option_of_yojson (value_for_key integer_optional_of_yojson "EncryptionAlgorithm") _list path;
     security_mechanism =
       option_of_yojson (value_for_key integer_optional_of_yojson "SecurityMechanism") _list path;
     s3_path = option_of_yojson (value_for_key string__of_yojson "S3Path") _list path;
     s3_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "S3AccessRoleArn") _list path;
   }
    : ibm_db2_luw_data_provider_settings)

let maria_db_data_provider_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     s3_path = option_of_yojson (value_for_key string__of_yojson "S3Path") _list path;
     s3_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "S3AccessRoleArn") _list path;
   }
    : maria_db_data_provider_settings)

let doc_db_data_provider_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
   }
    : doc_db_data_provider_settings)

let microsoft_sql_server_data_provider_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     s3_path = option_of_yojson (value_for_key string__of_yojson "S3Path") _list path;
     s3_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "S3AccessRoleArn") _list path;
   }
    : microsoft_sql_server_data_provider_settings)

let sybase_ase_data_provider_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     encrypt_password =
       option_of_yojson (value_for_key boolean_optional_of_yojson "EncryptPassword") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
   }
    : sybase_ase_data_provider_settings)

let oracle_data_provider_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     asm_server = option_of_yojson (value_for_key string__of_yojson "AsmServer") _list path;
     secrets_manager_oracle_asm_secret_id =
       option_of_yojson
         (value_for_key string__of_yojson "SecretsManagerOracleAsmSecretId")
         _list path;
     secrets_manager_oracle_asm_access_role_arn =
       option_of_yojson
         (value_for_key string__of_yojson "SecretsManagerOracleAsmAccessRoleArn")
         _list path;
     secrets_manager_security_db_encryption_secret_id =
       option_of_yojson
         (value_for_key string__of_yojson "SecretsManagerSecurityDbEncryptionSecretId")
         _list path;
     secrets_manager_security_db_encryption_access_role_arn =
       option_of_yojson
         (value_for_key string__of_yojson "SecretsManagerSecurityDbEncryptionAccessRoleArn")
         _list path;
     s3_path = option_of_yojson (value_for_key string__of_yojson "S3Path") _list path;
     s3_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "S3AccessRoleArn") _list path;
   }
    : oracle_data_provider_settings)

let my_sql_data_provider_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     s3_path = option_of_yojson (value_for_key string__of_yojson "S3Path") _list path;
     s3_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "S3AccessRoleArn") _list path;
   }
    : my_sql_data_provider_settings)

let postgre_sql_data_provider_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     s3_path = option_of_yojson (value_for_key string__of_yojson "S3Path") _list path;
     s3_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "S3AccessRoleArn") _list path;
   }
    : postgre_sql_data_provider_settings)

let redshift_data_provider_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     s3_path = option_of_yojson (value_for_key string__of_yojson "S3Path") _list path;
     s3_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "S3AccessRoleArn") _list path;
   }
    : redshift_data_provider_settings)

let data_provider_settings_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "RedshiftSettings" -> RedshiftSettings (redshift_data_provider_settings_of_yojson value_ path)
   | "PostgreSqlSettings" ->
       PostgreSqlSettings (postgre_sql_data_provider_settings_of_yojson value_ path)
   | "MySqlSettings" -> MySqlSettings (my_sql_data_provider_settings_of_yojson value_ path)
   | "OracleSettings" -> OracleSettings (oracle_data_provider_settings_of_yojson value_ path)
   | "SybaseAseSettings" ->
       SybaseAseSettings (sybase_ase_data_provider_settings_of_yojson value_ path)
   | "MicrosoftSqlServerSettings" ->
       MicrosoftSqlServerSettings
         (microsoft_sql_server_data_provider_settings_of_yojson value_ path)
   | "DocDbSettings" -> DocDbSettings (doc_db_data_provider_settings_of_yojson value_ path)
   | "MariaDbSettings" -> MariaDbSettings (maria_db_data_provider_settings_of_yojson value_ path)
   | "IbmDb2LuwSettings" ->
       IbmDb2LuwSettings (ibm_db2_luw_data_provider_settings_of_yojson value_ path)
   | "IbmDb2zOsSettings" ->
       IbmDb2zOsSettings (ibm_db2z_os_data_provider_settings_of_yojson value_ path)
   | "MongoDbSettings" -> MongoDbSettings (mongo_db_data_provider_settings_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "DataProviderSettings" unknown)
    : data_provider_settings)

let data_provider_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_provider_name =
       option_of_yojson (value_for_key string__of_yojson "DataProviderName") _list path;
     data_provider_arn =
       option_of_yojson (value_for_key string__of_yojson "DataProviderArn") _list path;
     data_provider_creation_time =
       option_of_yojson
         (value_for_key iso8601_date_time_of_yojson "DataProviderCreationTime")
         _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
     \#virtual = option_of_yojson (value_for_key boolean_optional_of_yojson "Virtual") _list path;
     settings =
       option_of_yojson (value_for_key data_provider_settings_of_yojson "Settings") _list path;
   }
    : data_provider)

let modify_data_provider_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_provider =
       option_of_yojson (value_for_key data_provider_of_yojson "DataProvider") _list path;
   }
    : modify_data_provider_response)

let modify_data_provider_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_provider_identifier = value_for_key string__of_yojson "DataProviderIdentifier" _list path;
     data_provider_name =
       option_of_yojson (value_for_key string__of_yojson "DataProviderName") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
     \#virtual = option_of_yojson (value_for_key boolean_optional_of_yojson "Virtual") _list path;
     exact_settings =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ExactSettings") _list path;
     settings =
       option_of_yojson (value_for_key data_provider_settings_of_yojson "Settings") _list path;
   }
    : modify_data_provider_message)

let modify_data_migration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migration =
       option_of_yojson (value_for_key data_migration_of_yojson "DataMigration") _list path;
   }
    : modify_data_migration_response)

let modify_data_migration_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migration_identifier =
       value_for_key string__of_yojson "DataMigrationIdentifier" _list path;
     data_migration_name =
       option_of_yojson (value_for_key string__of_yojson "DataMigrationName") _list path;
     enable_cloudwatch_logs =
       option_of_yojson (value_for_key boolean_optional_of_yojson "EnableCloudwatchLogs") _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     data_migration_type =
       option_of_yojson
         (value_for_key migration_type_value_of_yojson "DataMigrationType")
         _list path;
     source_data_settings =
       option_of_yojson
         (value_for_key source_data_settings_of_yojson "SourceDataSettings")
         _list path;
     target_data_settings =
       option_of_yojson
         (value_for_key target_data_settings_of_yojson "TargetDataSettings")
         _list path;
     number_of_jobs =
       option_of_yojson (value_for_key integer_optional_of_yojson "NumberOfJobs") _list path;
     selection_rules =
       option_of_yojson (value_for_key secret_string_of_yojson "SelectionRules") _list path;
   }
    : modify_data_migration_message)

let modify_conversion_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       option_of_yojson (value_for_key string__of_yojson "MigrationProjectIdentifier") _list path;
   }
    : modify_conversion_configuration_response)

let modify_conversion_configuration_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     conversion_configuration = value_for_key string__of_yojson "ConversionConfiguration" _list path;
   }
    : modify_conversion_configuration_message)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path }
    : list_tags_for_resource_response)

let arn_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let list_tags_for_resource_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = option_of_yojson (value_for_key string__of_yojson "ResourceArn") _list path;
     resource_arn_list =
       option_of_yojson (value_for_key arn_list_of_yojson "ResourceArnList") _list path;
   }
    : list_tags_for_resource_message)

let invalid_certificate_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_certificate_fault)

let certificate_wallet_of_yojson = blob_of_yojson

let certificate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_identifier =
       option_of_yojson (value_for_key string__of_yojson "CertificateIdentifier") _list path;
     certificate_creation_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "CertificateCreationDate") _list path;
     certificate_pem =
       option_of_yojson (value_for_key string__of_yojson "CertificatePem") _list path;
     certificate_wallet =
       option_of_yojson (value_for_key certificate_wallet_of_yojson "CertificateWallet") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     certificate_owner =
       option_of_yojson (value_for_key string__of_yojson "CertificateOwner") _list path;
     valid_from_date = option_of_yojson (value_for_key t_stamp_of_yojson "ValidFromDate") _list path;
     valid_to_date = option_of_yojson (value_for_key t_stamp_of_yojson "ValidToDate") _list path;
     signing_algorithm =
       option_of_yojson (value_for_key string__of_yojson "SigningAlgorithm") _list path;
     key_length = option_of_yojson (value_for_key integer_optional_of_yojson "KeyLength") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
   }
    : certificate)

let import_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate = option_of_yojson (value_for_key certificate_of_yojson "Certificate") _list path }
    : import_certificate_response)

let import_certificate_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_identifier = value_for_key string__of_yojson "CertificateIdentifier" _list path;
     certificate_pem =
       option_of_yojson (value_for_key secret_string_of_yojson "CertificatePem") _list path;
     certificate_wallet =
       option_of_yojson (value_for_key certificate_wallet_of_yojson "CertificateWallet") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
   }
    : import_certificate_message)

let get_target_selection_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_selection_rules =
       option_of_yojson (value_for_key string__of_yojson "TargetSelectionRules") _list path;
   }
    : get_target_selection_rules_response)

let get_target_selection_rules_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     selection_rules = value_for_key string__of_yojson "SelectionRules" _list path;
   }
    : get_target_selection_rules_message)

let export_metadata_model_assessment_result_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_object_key = option_of_yojson (value_for_key string__of_yojson "S3ObjectKey") _list path;
     object_ur_l = option_of_yojson (value_for_key string__of_yojson "ObjectURL") _list path;
   }
    : export_metadata_model_assessment_result_entry)

let export_metadata_model_assessment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pdf_report =
       option_of_yojson
         (value_for_key export_metadata_model_assessment_result_entry_of_yojson "PdfReport")
         _list path;
     csv_report =
       option_of_yojson
         (value_for_key export_metadata_model_assessment_result_entry_of_yojson "CsvReport")
         _list path;
   }
    : export_metadata_model_assessment_response)

let assessment_report_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "pdf" -> PDF
    | `String "csv" -> CSV
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AssessmentReportType" value)
    | _ -> raise (deserialize_wrong_type_error path "AssessmentReportType")
     : assessment_report_type)
    : assessment_report_type)

let assessment_report_types_list_of_yojson tree path =
  list_of_yojson assessment_report_type_of_yojson tree path

let export_metadata_model_assessment_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     selection_rules = value_for_key string__of_yojson "SelectionRules" _list path;
     file_name = option_of_yojson (value_for_key string__of_yojson "FileName") _list path;
     assessment_report_types =
       option_of_yojson
         (value_for_key assessment_report_types_list_of_yojson "AssessmentReportTypes")
         _list path;
   }
    : export_metadata_model_assessment_message)

let double_optional_of_yojson = double_of_yojson
let long_optional_of_yojson = long_of_yojson

let table_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_name = option_of_yojson (value_for_key string__of_yojson "SchemaName") _list path;
     table_name = option_of_yojson (value_for_key string__of_yojson "TableName") _list path;
     inserts = option_of_yojson (value_for_key long_of_yojson "Inserts") _list path;
     deletes = option_of_yojson (value_for_key long_of_yojson "Deletes") _list path;
     updates = option_of_yojson (value_for_key long_of_yojson "Updates") _list path;
     ddls = option_of_yojson (value_for_key long_of_yojson "Ddls") _list path;
     applied_inserts =
       option_of_yojson (value_for_key long_optional_of_yojson "AppliedInserts") _list path;
     applied_deletes =
       option_of_yojson (value_for_key long_optional_of_yojson "AppliedDeletes") _list path;
     applied_updates =
       option_of_yojson (value_for_key long_optional_of_yojson "AppliedUpdates") _list path;
     applied_ddls =
       option_of_yojson (value_for_key long_optional_of_yojson "AppliedDdls") _list path;
     full_load_rows = option_of_yojson (value_for_key long_of_yojson "FullLoadRows") _list path;
     full_load_condtnl_chk_failed_rows =
       option_of_yojson (value_for_key long_of_yojson "FullLoadCondtnlChkFailedRows") _list path;
     full_load_error_rows =
       option_of_yojson (value_for_key long_of_yojson "FullLoadErrorRows") _list path;
     full_load_start_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "FullLoadStartTime") _list path;
     full_load_end_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "FullLoadEndTime") _list path;
     full_load_reloaded =
       option_of_yojson (value_for_key boolean_optional_of_yojson "FullLoadReloaded") _list path;
     last_update_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "LastUpdateTime") _list path;
     table_state = option_of_yojson (value_for_key string__of_yojson "TableState") _list path;
     validation_pending_records =
       option_of_yojson (value_for_key long_of_yojson "ValidationPendingRecords") _list path;
     validation_failed_records =
       option_of_yojson (value_for_key long_of_yojson "ValidationFailedRecords") _list path;
     validation_suspended_records =
       option_of_yojson (value_for_key long_of_yojson "ValidationSuspendedRecords") _list path;
     validation_state =
       option_of_yojson (value_for_key string__of_yojson "ValidationState") _list path;
     validation_state_details =
       option_of_yojson (value_for_key string__of_yojson "ValidationStateDetails") _list path;
     resync_state = option_of_yojson (value_for_key string__of_yojson "ResyncState") _list path;
     resync_rows_attempted =
       option_of_yojson (value_for_key long_optional_of_yojson "ResyncRowsAttempted") _list path;
     resync_rows_succeeded =
       option_of_yojson (value_for_key long_optional_of_yojson "ResyncRowsSucceeded") _list path;
     resync_rows_failed =
       option_of_yojson (value_for_key long_optional_of_yojson "ResyncRowsFailed") _list path;
     resync_progress =
       option_of_yojson (value_for_key double_optional_of_yojson "ResyncProgress") _list path;
   }
    : table_statistics)

let table_statistics_list_of_yojson tree path = list_of_yojson table_statistics_of_yojson tree path

let describe_table_statistics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskArn") _list path;
     table_statistics =
       option_of_yojson (value_for_key table_statistics_list_of_yojson "TableStatistics") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_table_statistics_response)

let filter_value_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : filter)

let filter_list_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let describe_table_statistics_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_arn = value_for_key string__of_yojson "ReplicationTaskArn" _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
   }
    : describe_table_statistics_message)

let schema_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let describe_schemas_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     schemas = option_of_yojson (value_for_key schema_list_of_yojson "Schemas") _list path;
   }
    : describe_schemas_response)

let describe_schemas_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_arn = value_for_key string__of_yojson "EndpointArn" _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_schemas_message)

let replication_task_list_of_yojson tree path = list_of_yojson replication_task_of_yojson tree path

let describe_replication_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     replication_tasks =
       option_of_yojson
         (value_for_key replication_task_list_of_yojson "ReplicationTasks")
         _list path;
   }
    : describe_replication_tasks_response)

let describe_replication_tasks_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     without_settings =
       option_of_yojson (value_for_key boolean_optional_of_yojson "WithoutSettings") _list path;
   }
    : describe_replication_tasks_message)

let replication_task_individual_assessment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_individual_assessment_arn =
       option_of_yojson
         (value_for_key string__of_yojson "ReplicationTaskIndividualAssessmentArn")
         _list path;
     replication_task_assessment_run_arn =
       option_of_yojson
         (value_for_key string__of_yojson "ReplicationTaskAssessmentRunArn")
         _list path;
     individual_assessment_name =
       option_of_yojson (value_for_key string__of_yojson "IndividualAssessmentName") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     replication_task_individual_assessment_start_date =
       option_of_yojson
         (value_for_key t_stamp_of_yojson "ReplicationTaskIndividualAssessmentStartDate")
         _list path;
   }
    : replication_task_individual_assessment)

let replication_task_individual_assessment_list_of_yojson tree path =
  list_of_yojson replication_task_individual_assessment_of_yojson tree path

let describe_replication_task_individual_assessments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     replication_task_individual_assessments =
       option_of_yojson
         (value_for_key replication_task_individual_assessment_list_of_yojson
            "ReplicationTaskIndividualAssessments")
         _list path;
   }
    : describe_replication_task_individual_assessments_response)

let describe_replication_task_individual_assessments_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_replication_task_individual_assessments_message)

let replication_task_assessment_run_list_of_yojson tree path =
  list_of_yojson replication_task_assessment_run_of_yojson tree path

let describe_replication_task_assessment_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     replication_task_assessment_runs =
       option_of_yojson
         (value_for_key replication_task_assessment_run_list_of_yojson
            "ReplicationTaskAssessmentRuns")
         _list path;
   }
    : describe_replication_task_assessment_runs_response)

let describe_replication_task_assessment_runs_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_replication_task_assessment_runs_message)

let replication_task_assessment_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_identifier =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskIdentifier") _list path;
     replication_task_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskArn") _list path;
     replication_task_last_assessment_date =
       option_of_yojson
         (value_for_key t_stamp_of_yojson "ReplicationTaskLastAssessmentDate")
         _list path;
     assessment_status =
       option_of_yojson (value_for_key string__of_yojson "AssessmentStatus") _list path;
     assessment_results_file =
       option_of_yojson (value_for_key string__of_yojson "AssessmentResultsFile") _list path;
     assessment_results =
       option_of_yojson (value_for_key string__of_yojson "AssessmentResults") _list path;
     s3_object_url =
       option_of_yojson (value_for_key secret_string_of_yojson "S3ObjectUrl") _list path;
   }
    : replication_task_assessment_result)

let replication_task_assessment_result_list_of_yojson tree path =
  list_of_yojson replication_task_assessment_result_of_yojson tree path

let describe_replication_task_assessment_results_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     bucket_name = option_of_yojson (value_for_key string__of_yojson "BucketName") _list path;
     replication_task_assessment_results =
       option_of_yojson
         (value_for_key replication_task_assessment_result_list_of_yojson
            "ReplicationTaskAssessmentResults")
         _list path;
   }
    : describe_replication_task_assessment_results_response)

let describe_replication_task_assessment_results_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskArn") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_replication_task_assessment_results_message)

let replication_table_statistics_list_of_yojson tree path =
  list_of_yojson table_statistics_of_yojson tree path

let describe_replication_table_statistics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationConfigArn") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     replication_table_statistics =
       option_of_yojson
         (value_for_key replication_table_statistics_list_of_yojson "ReplicationTableStatistics")
         _list path;
   }
    : describe_replication_table_statistics_response)

let describe_replication_table_statistics_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config_arn = value_for_key string__of_yojson "ReplicationConfigArn" _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
   }
    : describe_replication_table_statistics_message)

let replication_subnet_groups_of_yojson tree path =
  list_of_yojson replication_subnet_group_of_yojson tree path

let describe_replication_subnet_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     replication_subnet_groups =
       option_of_yojson
         (value_for_key replication_subnet_groups_of_yojson "ReplicationSubnetGroups")
         _list path;
   }
    : describe_replication_subnet_groups_response)

let describe_replication_subnet_groups_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_replication_subnet_groups_message)

let replication_list_of_yojson tree path = list_of_yojson replication_of_yojson tree path

let describe_replications_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     replications =
       option_of_yojson (value_for_key replication_list_of_yojson "Replications") _list path;
   }
    : describe_replications_response)

let describe_replications_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_replications_message)

let replication_instance_task_log_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_name =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskName") _list path;
     replication_task_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskArn") _list path;
     replication_instance_task_log_size =
       option_of_yojson (value_for_key long_of_yojson "ReplicationInstanceTaskLogSize") _list path;
   }
    : replication_instance_task_log)

let replication_instance_task_logs_list_of_yojson tree path =
  list_of_yojson replication_instance_task_log_of_yojson tree path

let describe_replication_instance_task_logs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationInstanceArn") _list path;
     replication_instance_task_logs =
       option_of_yojson
         (value_for_key replication_instance_task_logs_list_of_yojson "ReplicationInstanceTaskLogs")
         _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_replication_instance_task_logs_response)

let describe_replication_instance_task_logs_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_arn = value_for_key string__of_yojson "ReplicationInstanceArn" _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_replication_instance_task_logs_message)

let replication_instance_list_of_yojson tree path =
  list_of_yojson replication_instance_of_yojson tree path

let describe_replication_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     replication_instances =
       option_of_yojson
         (value_for_key replication_instance_list_of_yojson "ReplicationInstances")
         _list path;
   }
    : describe_replication_instances_response)

let describe_replication_instances_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_replication_instances_message)

let replication_config_list_of_yojson tree path =
  list_of_yojson replication_config_of_yojson tree path

let describe_replication_configs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     replication_configs =
       option_of_yojson
         (value_for_key replication_config_list_of_yojson "ReplicationConfigs")
         _list path;
   }
    : describe_replication_configs_response)

let describe_replication_configs_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_replication_configs_message)

let describe_refresh_schemas_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     refresh_schemas_status =
       option_of_yojson
         (value_for_key refresh_schemas_status_of_yojson "RefreshSchemasStatus")
         _list path;
   }
    : describe_refresh_schemas_status_response)

let describe_refresh_schemas_status_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint_arn = value_for_key string__of_yojson "EndpointArn" _list path }
    : describe_refresh_schemas_status_message)

let rds_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engine_edition = option_of_yojson (value_for_key string__of_yojson "EngineEdition") _list path;
     instance_type = option_of_yojson (value_for_key string__of_yojson "InstanceType") _list path;
     instance_vcpu =
       option_of_yojson (value_for_key double_optional_of_yojson "InstanceVcpu") _list path;
     instance_memory =
       option_of_yojson (value_for_key double_optional_of_yojson "InstanceMemory") _list path;
     storage_type = option_of_yojson (value_for_key string__of_yojson "StorageType") _list path;
     storage_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "StorageSize") _list path;
     storage_iops =
       option_of_yojson (value_for_key integer_optional_of_yojson "StorageIops") _list path;
     deployment_option =
       option_of_yojson (value_for_key string__of_yojson "DeploymentOption") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
   }
    : rds_configuration)

let rds_requirements_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engine_edition = option_of_yojson (value_for_key string__of_yojson "EngineEdition") _list path;
     instance_vcpu =
       option_of_yojson (value_for_key double_optional_of_yojson "InstanceVcpu") _list path;
     instance_memory =
       option_of_yojson (value_for_key double_optional_of_yojson "InstanceMemory") _list path;
     storage_size =
       option_of_yojson (value_for_key integer_optional_of_yojson "StorageSize") _list path;
     storage_iops =
       option_of_yojson (value_for_key integer_optional_of_yojson "StorageIops") _list path;
     deployment_option =
       option_of_yojson (value_for_key string__of_yojson "DeploymentOption") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
   }
    : rds_requirements)

let rds_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requirements_to_target =
       option_of_yojson (value_for_key rds_requirements_of_yojson "RequirementsToTarget") _list path;
     target_configuration =
       option_of_yojson (value_for_key rds_configuration_of_yojson "TargetConfiguration") _list path;
   }
    : rds_recommendation)

let recommendation_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rds_engine =
       option_of_yojson (value_for_key rds_recommendation_of_yojson "RdsEngine") _list path;
   }
    : recommendation_data)

let recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_id = option_of_yojson (value_for_key string__of_yojson "DatabaseId") _list path;
     engine_name = option_of_yojson (value_for_key string__of_yojson "EngineName") _list path;
     created_date = option_of_yojson (value_for_key string__of_yojson "CreatedDate") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     preferred = option_of_yojson (value_for_key boolean_optional_of_yojson "Preferred") _list path;
     settings =
       option_of_yojson (value_for_key recommendation_settings_of_yojson "Settings") _list path;
     data = option_of_yojson (value_for_key recommendation_data_of_yojson "Data") _list path;
   }
    : recommendation)

let recommendation_list_of_yojson tree path = list_of_yojson recommendation_of_yojson tree path

let describe_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     recommendations =
       option_of_yojson (value_for_key recommendation_list_of_yojson "Recommendations") _list path;
   }
    : describe_recommendations_response)

let describe_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_recommendations_request)

let limitation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_id = option_of_yojson (value_for_key string__of_yojson "DatabaseId") _list path;
     engine_name = option_of_yojson (value_for_key string__of_yojson "EngineName") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     impact = option_of_yojson (value_for_key string__of_yojson "Impact") _list path;
     type_ = option_of_yojson (value_for_key string__of_yojson "Type") _list path;
   }
    : limitation)

let limitation_list_of_yojson tree path = list_of_yojson limitation_of_yojson tree path

let describe_recommendation_limitations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     limitations =
       option_of_yojson (value_for_key limitation_list_of_yojson "Limitations") _list path;
   }
    : describe_recommendation_limitations_response)

let describe_recommendation_limitations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_recommendation_limitations_request)

let pending_maintenance_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = option_of_yojson (value_for_key string__of_yojson "Action") _list path;
     auto_applied_after_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "AutoAppliedAfterDate") _list path;
     forced_apply_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "ForcedApplyDate") _list path;
     opt_in_status = option_of_yojson (value_for_key string__of_yojson "OptInStatus") _list path;
     current_apply_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "CurrentApplyDate") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
   }
    : pending_maintenance_action)

let pending_maintenance_action_details_of_yojson tree path =
  list_of_yojson pending_maintenance_action_of_yojson tree path

let resource_pending_maintenance_actions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_identifier =
       option_of_yojson (value_for_key string__of_yojson "ResourceIdentifier") _list path;
     pending_maintenance_action_details =
       option_of_yojson
         (value_for_key pending_maintenance_action_details_of_yojson
            "PendingMaintenanceActionDetails")
         _list path;
   }
    : resource_pending_maintenance_actions)

let pending_maintenance_actions_of_yojson tree path =
  list_of_yojson resource_pending_maintenance_actions_of_yojson tree path

let describe_pending_maintenance_actions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pending_maintenance_actions =
       option_of_yojson
         (value_for_key pending_maintenance_actions_of_yojson "PendingMaintenanceActions")
         _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_pending_maintenance_actions_response)

let describe_pending_maintenance_actions_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationInstanceArn") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
   }
    : describe_pending_maintenance_actions_message)

let release_status_values_of_yojson (tree : t) path =
  ((match tree with
    | `String "beta" -> BETA
    | `String "prod" -> PROD
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReleaseStatusValues" value)
    | _ -> raise (deserialize_wrong_type_error path "ReleaseStatusValues")
     : release_status_values)
    : release_status_values)

let availability_zones_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let orderable_replication_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     replication_instance_class =
       option_of_yojson
         (value_for_key replication_instance_class_of_yojson "ReplicationInstanceClass")
         _list path;
     storage_type = option_of_yojson (value_for_key string__of_yojson "StorageType") _list path;
     min_allocated_storage =
       option_of_yojson (value_for_key integer_of_yojson "MinAllocatedStorage") _list path;
     max_allocated_storage =
       option_of_yojson (value_for_key integer_of_yojson "MaxAllocatedStorage") _list path;
     default_allocated_storage =
       option_of_yojson (value_for_key integer_of_yojson "DefaultAllocatedStorage") _list path;
     included_allocated_storage =
       option_of_yojson (value_for_key integer_of_yojson "IncludedAllocatedStorage") _list path;
     availability_zones =
       option_of_yojson
         (value_for_key availability_zones_list_of_yojson "AvailabilityZones")
         _list path;
     release_status =
       option_of_yojson (value_for_key release_status_values_of_yojson "ReleaseStatus") _list path;
   }
    : orderable_replication_instance)

let orderable_replication_instance_list_of_yojson tree path =
  list_of_yojson orderable_replication_instance_of_yojson tree path

let describe_orderable_replication_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     orderable_replication_instances =
       option_of_yojson
         (value_for_key orderable_replication_instance_list_of_yojson
            "OrderableReplicationInstances")
         _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_orderable_replication_instances_response)

let describe_orderable_replication_instances_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_orderable_replication_instances_message)

let migration_project_list_of_yojson tree path =
  list_of_yojson migration_project_of_yojson tree path

let describe_migration_projects_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     migration_projects =
       option_of_yojson
         (value_for_key migration_project_list_of_yojson "MigrationProjects")
         _list path;
   }
    : describe_migration_projects_response)

let describe_migration_projects_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_migration_projects_message)

let processed_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     type_ = option_of_yojson (value_for_key string__of_yojson "Type") _list path;
     endpoint_type = option_of_yojson (value_for_key string__of_yojson "EndpointType") _list path;
   }
    : processed_object)

let progress_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     progress_percent =
       option_of_yojson (value_for_key double_optional_of_yojson "ProgressPercent") _list path;
     total_objects = option_of_yojson (value_for_key long_of_yojson "TotalObjects") _list path;
     progress_step = option_of_yojson (value_for_key string__of_yojson "ProgressStep") _list path;
     processed_object =
       option_of_yojson (value_for_key processed_object_of_yojson "ProcessedObject") _list path;
   }
    : progress)

let export_sql_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_object_key = option_of_yojson (value_for_key string__of_yojson "S3ObjectKey") _list path;
     object_ur_l = option_of_yojson (value_for_key string__of_yojson "ObjectURL") _list path;
   }
    : export_sql_details)

let default_error_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : default_error_details)

let error_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "defaultErrorDetails" -> DefaultErrorDetails (default_error_details_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ErrorDetails" unknown)
    : error_details)

let schema_conversion_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     request_identifier =
       option_of_yojson (value_for_key string__of_yojson "RequestIdentifier") _list path;
     migration_project_arn =
       option_of_yojson (value_for_key string__of_yojson "MigrationProjectArn") _list path;
     error = option_of_yojson (value_for_key error_details_of_yojson "Error") _list path;
     export_sql_details =
       option_of_yojson (value_for_key export_sql_details_of_yojson "ExportSqlDetails") _list path;
     progress = option_of_yojson (value_for_key progress_of_yojson "Progress") _list path;
   }
    : schema_conversion_request)

let schema_conversion_request_list_of_yojson tree path =
  list_of_yojson schema_conversion_request_of_yojson tree path

let describe_metadata_model_imports_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     requests =
       option_of_yojson
         (value_for_key schema_conversion_request_list_of_yojson "Requests")
         _list path;
   }
    : describe_metadata_model_imports_response)

let describe_metadata_model_imports_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
   }
    : describe_metadata_model_imports_message)

let describe_metadata_model_exports_to_target_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     requests =
       option_of_yojson
         (value_for_key schema_conversion_request_list_of_yojson "Requests")
         _list path;
   }
    : describe_metadata_model_exports_to_target_response)

let describe_metadata_model_exports_to_target_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
   }
    : describe_metadata_model_exports_to_target_message)

let describe_metadata_model_exports_as_script_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     requests =
       option_of_yojson
         (value_for_key schema_conversion_request_list_of_yojson "Requests")
         _list path;
   }
    : describe_metadata_model_exports_as_script_response)

let describe_metadata_model_exports_as_script_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
   }
    : describe_metadata_model_exports_as_script_message)

let describe_metadata_model_creations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     requests =
       option_of_yojson
         (value_for_key schema_conversion_request_list_of_yojson "Requests")
         _list path;
   }
    : describe_metadata_model_creations_response)

let describe_metadata_model_creations_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
   }
    : describe_metadata_model_creations_message)

let describe_metadata_model_conversions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     requests =
       option_of_yojson
         (value_for_key schema_conversion_request_list_of_yojson "Requests")
         _list path;
   }
    : describe_metadata_model_conversions_response)

let describe_metadata_model_conversions_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
   }
    : describe_metadata_model_conversions_message)

let metadata_model_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata_model_name =
       option_of_yojson (value_for_key string__of_yojson "MetadataModelName") _list path;
     selection_rules =
       option_of_yojson (value_for_key string__of_yojson "SelectionRules") _list path;
   }
    : metadata_model_reference)

let metadata_model_reference_list_of_yojson tree path =
  list_of_yojson metadata_model_reference_of_yojson tree path

let describe_metadata_model_children_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     metadata_model_children =
       option_of_yojson
         (value_for_key metadata_model_reference_list_of_yojson "MetadataModelChildren")
         _list path;
   }
    : describe_metadata_model_children_response)

let describe_metadata_model_children_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selection_rules = value_for_key string__of_yojson "SelectionRules" _list path;
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     origin = value_for_key origin_type_value_of_yojson "Origin" _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
   }
    : describe_metadata_model_children_message)

let describe_metadata_model_assessments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     requests =
       option_of_yojson
         (value_for_key schema_conversion_request_list_of_yojson "Requests")
         _list path;
   }
    : describe_metadata_model_assessments_response)

let describe_metadata_model_assessments_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
   }
    : describe_metadata_model_assessments_message)

let describe_metadata_model_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata_model_name =
       option_of_yojson (value_for_key string__of_yojson "MetadataModelName") _list path;
     metadata_model_type =
       option_of_yojson (value_for_key string__of_yojson "MetadataModelType") _list path;
     target_metadata_models =
       option_of_yojson
         (value_for_key metadata_model_reference_list_of_yojson "TargetMetadataModels")
         _list path;
     definition = option_of_yojson (value_for_key string__of_yojson "Definition") _list path;
   }
    : describe_metadata_model_response)

let describe_metadata_model_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selection_rules = value_for_key string__of_yojson "SelectionRules" _list path;
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     origin = value_for_key origin_type_value_of_yojson "Origin" _list path;
   }
    : describe_metadata_model_message)

let instance_profile_list_of_yojson tree path = list_of_yojson instance_profile_of_yojson tree path

let describe_instance_profiles_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     instance_profiles =
       option_of_yojson
         (value_for_key instance_profile_list_of_yojson "InstanceProfiles")
         _list path;
   }
    : describe_instance_profiles_response)

let describe_instance_profiles_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_instance_profiles_message)

let schema_short_info_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_id = option_of_yojson (value_for_key string__of_yojson "SchemaId") _list path;
     schema_name = option_of_yojson (value_for_key string__of_yojson "SchemaName") _list path;
     database_id = option_of_yojson (value_for_key string__of_yojson "DatabaseId") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     database_ip_address =
       option_of_yojson (value_for_key string__of_yojson "DatabaseIpAddress") _list path;
   }
    : schema_short_info_response)

let database_short_info_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_id = option_of_yojson (value_for_key string__of_yojson "DatabaseId") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     database_ip_address =
       option_of_yojson (value_for_key string__of_yojson "DatabaseIpAddress") _list path;
     database_engine =
       option_of_yojson (value_for_key string__of_yojson "DatabaseEngine") _list path;
   }
    : database_short_info_response)

let server_short_info_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_id = option_of_yojson (value_for_key string__of_yojson "ServerId") _list path;
     ip_address = option_of_yojson (value_for_key string__of_yojson "IpAddress") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
   }
    : server_short_info_response)

let schema_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code_line_count =
       option_of_yojson (value_for_key long_optional_of_yojson "CodeLineCount") _list path;
     code_size = option_of_yojson (value_for_key long_optional_of_yojson "CodeSize") _list path;
     complexity = option_of_yojson (value_for_key string__of_yojson "Complexity") _list path;
     server =
       option_of_yojson (value_for_key server_short_info_response_of_yojson "Server") _list path;
     database_instance =
       option_of_yojson
         (value_for_key database_short_info_response_of_yojson "DatabaseInstance")
         _list path;
     schema_id = option_of_yojson (value_for_key string__of_yojson "SchemaId") _list path;
     schema_name = option_of_yojson (value_for_key string__of_yojson "SchemaName") _list path;
     original_schema =
       option_of_yojson
         (value_for_key schema_short_info_response_of_yojson "OriginalSchema")
         _list path;
     similarity = option_of_yojson (value_for_key double_optional_of_yojson "Similarity") _list path;
   }
    : schema_response)

let fleet_advisor_schema_list_of_yojson tree path =
  list_of_yojson schema_response_of_yojson tree path

let describe_fleet_advisor_schemas_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_advisor_schemas =
       option_of_yojson
         (value_for_key fleet_advisor_schema_list_of_yojson "FleetAdvisorSchemas")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_fleet_advisor_schemas_response)

let describe_fleet_advisor_schemas_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_fleet_advisor_schemas_request)

let fleet_advisor_schema_object_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_id = option_of_yojson (value_for_key string__of_yojson "SchemaId") _list path;
     object_type = option_of_yojson (value_for_key string__of_yojson "ObjectType") _list path;
     number_of_objects =
       option_of_yojson (value_for_key long_optional_of_yojson "NumberOfObjects") _list path;
     code_line_count =
       option_of_yojson (value_for_key long_optional_of_yojson "CodeLineCount") _list path;
     code_size = option_of_yojson (value_for_key long_optional_of_yojson "CodeSize") _list path;
   }
    : fleet_advisor_schema_object_response)

let fleet_advisor_schema_object_list_of_yojson tree path =
  list_of_yojson fleet_advisor_schema_object_response_of_yojson tree path

let describe_fleet_advisor_schema_object_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fleet_advisor_schema_objects =
       option_of_yojson
         (value_for_key fleet_advisor_schema_object_list_of_yojson "FleetAdvisorSchemaObjects")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_fleet_advisor_schema_object_summary_response)

let describe_fleet_advisor_schema_object_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_fleet_advisor_schema_object_summary_request)

let fleet_advisor_lsa_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lsa_analysis_id = option_of_yojson (value_for_key string__of_yojson "LsaAnalysisId") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
   }
    : fleet_advisor_lsa_analysis_response)

let fleet_advisor_lsa_analysis_response_list_of_yojson tree path =
  list_of_yojson fleet_advisor_lsa_analysis_response_of_yojson tree path

let describe_fleet_advisor_lsa_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis =
       option_of_yojson
         (value_for_key fleet_advisor_lsa_analysis_response_list_of_yojson "Analysis")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_fleet_advisor_lsa_analysis_response)

let describe_fleet_advisor_lsa_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_fleet_advisor_lsa_analysis_request)

let collector_short_info_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collector_referenced_id =
       option_of_yojson (value_for_key string__of_yojson "CollectorReferencedId") _list path;
     collector_name = option_of_yojson (value_for_key string__of_yojson "CollectorName") _list path;
   }
    : collector_short_info_response)

let collectors_list_of_yojson tree path =
  list_of_yojson collector_short_info_response_of_yojson tree path

let database_instance_software_details_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     engine_edition = option_of_yojson (value_for_key string__of_yojson "EngineEdition") _list path;
     service_pack = option_of_yojson (value_for_key string__of_yojson "ServicePack") _list path;
     support_level = option_of_yojson (value_for_key string__of_yojson "SupportLevel") _list path;
     os_architecture =
       option_of_yojson (value_for_key integer_optional_of_yojson "OsArchitecture") _list path;
     tooltip = option_of_yojson (value_for_key string__of_yojson "Tooltip") _list path;
   }
    : database_instance_software_details_response)

let database_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_id = option_of_yojson (value_for_key string__of_yojson "DatabaseId") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     ip_address = option_of_yojson (value_for_key string__of_yojson "IpAddress") _list path;
     number_of_schemas =
       option_of_yojson (value_for_key long_optional_of_yojson "NumberOfSchemas") _list path;
     server =
       option_of_yojson (value_for_key server_short_info_response_of_yojson "Server") _list path;
     software_details =
       option_of_yojson
         (value_for_key database_instance_software_details_response_of_yojson "SoftwareDetails")
         _list path;
     collectors = option_of_yojson (value_for_key collectors_list_of_yojson "Collectors") _list path;
   }
    : database_response)

let database_list_of_yojson tree path = list_of_yojson database_response_of_yojson tree path

let describe_fleet_advisor_databases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     databases = option_of_yojson (value_for_key database_list_of_yojson "Databases") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_fleet_advisor_databases_response)

let describe_fleet_advisor_databases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_fleet_advisor_databases_request)

let inventory_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_databases =
       option_of_yojson (value_for_key integer_optional_of_yojson "NumberOfDatabases") _list path;
     number_of_schemas =
       option_of_yojson (value_for_key integer_optional_of_yojson "NumberOfSchemas") _list path;
   }
    : inventory_data)

let collector_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNREGISTERED" -> UNREGISTERED
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "CollectorStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CollectorStatus")
     : collector_status)
    : collector_status)

let collector_health_check_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collector_status =
       option_of_yojson (value_for_key collector_status_of_yojson "CollectorStatus") _list path;
     local_collector_s3_access =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "LocalCollectorS3Access")
         _list path;
     web_collector_s3_access =
       option_of_yojson (value_for_key boolean_optional_of_yojson "WebCollectorS3Access") _list path;
     web_collector_granted_role_based_access =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "WebCollectorGrantedRoleBasedAccess")
         _list path;
   }
    : collector_health_check)

let version_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UP_TO_DATE" -> UP_TO_DATE
    | `String "OUTDATED" -> OUTDATED
    | `String "UNSUPPORTED" -> UNSUPPORTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "VersionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "VersionStatus")
     : version_status)
    : version_status)

let collector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collector_referenced_id =
       option_of_yojson (value_for_key string__of_yojson "CollectorReferencedId") _list path;
     collector_name = option_of_yojson (value_for_key string__of_yojson "CollectorName") _list path;
     collector_version =
       option_of_yojson (value_for_key string__of_yojson "CollectorVersion") _list path;
     version_status =
       option_of_yojson (value_for_key version_status_of_yojson "VersionStatus") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     s3_bucket_name = option_of_yojson (value_for_key string__of_yojson "S3BucketName") _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     collector_health_check =
       option_of_yojson
         (value_for_key collector_health_check_of_yojson "CollectorHealthCheck")
         _list path;
     last_data_received =
       option_of_yojson (value_for_key string__of_yojson "LastDataReceived") _list path;
     registered_date =
       option_of_yojson (value_for_key string__of_yojson "RegisteredDate") _list path;
     created_date = option_of_yojson (value_for_key string__of_yojson "CreatedDate") _list path;
     modified_date = option_of_yojson (value_for_key string__of_yojson "ModifiedDate") _list path;
     inventory_data =
       option_of_yojson (value_for_key inventory_data_of_yojson "InventoryData") _list path;
   }
    : collector_response)

let collector_responses_of_yojson tree path = list_of_yojson collector_response_of_yojson tree path

let describe_fleet_advisor_collectors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collectors =
       option_of_yojson (value_for_key collector_responses_of_yojson "Collectors") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_fleet_advisor_collectors_response)

let describe_fleet_advisor_collectors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_fleet_advisor_collectors_request)

let describe_extension_pack_associations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     requests =
       option_of_yojson
         (value_for_key schema_conversion_request_list_of_yojson "Requests")
         _list path;
   }
    : describe_extension_pack_associations_response)

let describe_extension_pack_associations_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
   }
    : describe_extension_pack_associations_message)

let event_subscriptions_list_of_yojson tree path =
  list_of_yojson event_subscription_of_yojson tree path

let describe_event_subscriptions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     event_subscriptions_list =
       option_of_yojson
         (value_for_key event_subscriptions_list_of_yojson "EventSubscriptionsList")
         _list path;
   }
    : describe_event_subscriptions_response)

let describe_event_subscriptions_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription_name =
       option_of_yojson (value_for_key string__of_yojson "SubscriptionName") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_event_subscriptions_message)

let source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "replication-instance" -> Replication_instance
    | `String value -> raise (deserialize_unknown_enum_value_error path "SourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceType")
     : source_type)
    : source_type)

let event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_identifier =
       option_of_yojson (value_for_key string__of_yojson "SourceIdentifier") _list path;
     source_type = option_of_yojson (value_for_key source_type_of_yojson "SourceType") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     event_categories =
       option_of_yojson (value_for_key event_categories_list_of_yojson "EventCategories") _list path;
     date = option_of_yojson (value_for_key t_stamp_of_yojson "Date") _list path;
   }
    : event)

let event_list_of_yojson tree path = list_of_yojson event_of_yojson tree path

let describe_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     events = option_of_yojson (value_for_key event_list_of_yojson "Events") _list path;
   }
    : describe_events_response)

let describe_events_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_identifier =
       option_of_yojson (value_for_key string__of_yojson "SourceIdentifier") _list path;
     source_type = option_of_yojson (value_for_key source_type_of_yojson "SourceType") _list path;
     start_time = option_of_yojson (value_for_key t_stamp_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key t_stamp_of_yojson "EndTime") _list path;
     duration = option_of_yojson (value_for_key integer_optional_of_yojson "Duration") _list path;
     event_categories =
       option_of_yojson (value_for_key event_categories_list_of_yojson "EventCategories") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_events_message)

let event_category_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_type = option_of_yojson (value_for_key string__of_yojson "SourceType") _list path;
     event_categories =
       option_of_yojson (value_for_key event_categories_list_of_yojson "EventCategories") _list path;
   }
    : event_category_group)

let event_category_group_list_of_yojson tree path =
  list_of_yojson event_category_group_of_yojson tree path

let describe_event_categories_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_category_group_list =
       option_of_yojson
         (value_for_key event_category_group_list_of_yojson "EventCategoryGroupList")
         _list path;
   }
    : describe_event_categories_response)

let describe_event_categories_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_type = option_of_yojson (value_for_key string__of_yojson "SourceType") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
   }
    : describe_event_categories_message)

let available_upgrades_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let engine_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     lifecycle = option_of_yojson (value_for_key string__of_yojson "Lifecycle") _list path;
     release_status =
       option_of_yojson (value_for_key release_status_values_of_yojson "ReleaseStatus") _list path;
     launch_date = option_of_yojson (value_for_key t_stamp_of_yojson "LaunchDate") _list path;
     auto_upgrade_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "AutoUpgradeDate") _list path;
     deprecation_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "DeprecationDate") _list path;
     force_upgrade_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "ForceUpgradeDate") _list path;
     available_upgrades =
       option_of_yojson
         (value_for_key available_upgrades_list_of_yojson "AvailableUpgrades")
         _list path;
   }
    : engine_version)

let engine_version_list_of_yojson tree path = list_of_yojson engine_version_of_yojson tree path

let describe_engine_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engine_versions =
       option_of_yojson (value_for_key engine_version_list_of_yojson "EngineVersions") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_engine_versions_response)

let describe_engine_versions_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_engine_versions_message)

let supported_endpoint_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engine_name = option_of_yojson (value_for_key string__of_yojson "EngineName") _list path;
     supports_cd_c = option_of_yojson (value_for_key boolean__of_yojson "SupportsCDC") _list path;
     endpoint_type =
       option_of_yojson
         (value_for_key replication_endpoint_type_value_of_yojson "EndpointType")
         _list path;
     replication_instance_engine_minimum_version =
       option_of_yojson
         (value_for_key string__of_yojson "ReplicationInstanceEngineMinimumVersion")
         _list path;
     engine_display_name =
       option_of_yojson (value_for_key string__of_yojson "EngineDisplayName") _list path;
   }
    : supported_endpoint_type)

let supported_endpoint_type_list_of_yojson tree path =
  list_of_yojson supported_endpoint_type_of_yojson tree path

let describe_endpoint_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     supported_endpoint_types =
       option_of_yojson
         (value_for_key supported_endpoint_type_list_of_yojson "SupportedEndpointTypes")
         _list path;
   }
    : describe_endpoint_types_response)

let describe_endpoint_types_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_endpoint_types_message)

let endpoint_setting_enum_values_of_yojson tree path = list_of_yojson string__of_yojson tree path

let endpoint_setting_type_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "string" -> STRING
    | `String "boolean" -> BOOLEAN
    | `String "integer" -> INTEGER
    | `String "enum" -> ENUM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EndpointSettingTypeValue" value)
    | _ -> raise (deserialize_wrong_type_error path "EndpointSettingTypeValue")
     : endpoint_setting_type_value)
    : endpoint_setting_type_value)

let endpoint_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     type_ =
       option_of_yojson (value_for_key endpoint_setting_type_value_of_yojson "Type") _list path;
     enum_values =
       option_of_yojson
         (value_for_key endpoint_setting_enum_values_of_yojson "EnumValues")
         _list path;
     sensitive = option_of_yojson (value_for_key boolean_optional_of_yojson "Sensitive") _list path;
     units = option_of_yojson (value_for_key string__of_yojson "Units") _list path;
     applicability = option_of_yojson (value_for_key string__of_yojson "Applicability") _list path;
     int_value_min =
       option_of_yojson (value_for_key integer_optional_of_yojson "IntValueMin") _list path;
     int_value_max =
       option_of_yojson (value_for_key integer_optional_of_yojson "IntValueMax") _list path;
     default_value = option_of_yojson (value_for_key string__of_yojson "DefaultValue") _list path;
   }
    : endpoint_setting)

let endpoint_settings_list_of_yojson tree path = list_of_yojson endpoint_setting_of_yojson tree path

let describe_endpoint_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     endpoint_settings =
       option_of_yojson
         (value_for_key endpoint_settings_list_of_yojson "EndpointSettings")
         _list path;
   }
    : describe_endpoint_settings_response)

let describe_endpoint_settings_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engine_name = value_for_key string__of_yojson "EngineName" _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_endpoint_settings_message)

let endpoint_list_of_yojson tree path = list_of_yojson endpoint_of_yojson tree path

let describe_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     endpoints = option_of_yojson (value_for_key endpoint_list_of_yojson "Endpoints") _list path;
   }
    : describe_endpoints_response)

let describe_endpoints_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_endpoints_message)

let data_provider_list_of_yojson tree path = list_of_yojson data_provider_of_yojson tree path

let describe_data_providers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     data_providers =
       option_of_yojson (value_for_key data_provider_list_of_yojson "DataProviders") _list path;
   }
    : describe_data_providers_response)

let describe_data_providers_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_data_providers_message)

let marker_of_yojson = string_of_yojson
let data_migrations_of_yojson tree path = list_of_yojson data_migration_of_yojson tree path

let describe_data_migrations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migrations =
       option_of_yojson (value_for_key data_migrations_of_yojson "DataMigrations") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
   }
    : describe_data_migrations_response)

let describe_data_migrations_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     without_settings =
       option_of_yojson (value_for_key boolean_optional_of_yojson "WithoutSettings") _list path;
     without_statistics =
       option_of_yojson (value_for_key boolean_optional_of_yojson "WithoutStatistics") _list path;
   }
    : describe_data_migrations_message)

let describe_conversion_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       option_of_yojson (value_for_key string__of_yojson "MigrationProjectIdentifier") _list path;
     conversion_configuration =
       option_of_yojson (value_for_key string__of_yojson "ConversionConfiguration") _list path;
   }
    : describe_conversion_configuration_response)

let describe_conversion_configuration_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
   }
    : describe_conversion_configuration_message)

let connection_list_of_yojson tree path = list_of_yojson connection_of_yojson tree path

let describe_connections_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     connections =
       option_of_yojson (value_for_key connection_list_of_yojson "Connections") _list path;
   }
    : describe_connections_response)

let describe_connections_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_connections_message)

let certificate_list_of_yojson tree path = list_of_yojson certificate_of_yojson tree path

let describe_certificates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
     certificates =
       option_of_yojson (value_for_key certificate_list_of_yojson "Certificates") _list path;
   }
    : describe_certificates_response)

let describe_certificates_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_certificates_message)

let individual_assessment_name_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let describe_applicable_individual_assessments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     individual_assessment_names =
       option_of_yojson
         (value_for_key individual_assessment_name_list_of_yojson "IndividualAssessmentNames")
         _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_applicable_individual_assessments_response)

let describe_applicable_individual_assessments_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskArn") _list path;
     replication_instance_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationInstanceArn") _list path;
     replication_config_arn =
       option_of_yojson (value_for_key string__of_yojson "ReplicationConfigArn") _list path;
     source_engine_name =
       option_of_yojson (value_for_key string__of_yojson "SourceEngineName") _list path;
     target_engine_name =
       option_of_yojson (value_for_key string__of_yojson "TargetEngineName") _list path;
     migration_type =
       option_of_yojson (value_for_key migration_type_value_of_yojson "MigrationType") _list path;
     max_records =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxRecords") _list path;
     marker = option_of_yojson (value_for_key string__of_yojson "Marker") _list path;
   }
    : describe_applicable_individual_assessments_message)

let describe_account_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_quotas =
       option_of_yojson (value_for_key account_quota_list_of_yojson "AccountQuotas") _list path;
     unique_account_identifier =
       option_of_yojson (value_for_key string__of_yojson "UniqueAccountIdentifier") _list path;
   }
    : describe_account_attributes_response)

let describe_account_attributes_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_replication_task_assessment_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_assessment_run =
       option_of_yojson
         (value_for_key replication_task_assessment_run_of_yojson "ReplicationTaskAssessmentRun")
         _list path;
   }
    : delete_replication_task_assessment_run_response)

let delete_replication_task_assessment_run_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_assessment_run_arn =
       value_for_key string__of_yojson "ReplicationTaskAssessmentRunArn" _list path;
   }
    : delete_replication_task_assessment_run_message)

let delete_replication_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task =
       option_of_yojson (value_for_key replication_task_of_yojson "ReplicationTask") _list path;
   }
    : delete_replication_task_response)

let delete_replication_task_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replication_task_arn = value_for_key string__of_yojson "ReplicationTaskArn" _list path }
    : delete_replication_task_message)

let delete_replication_subnet_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_replication_subnet_group_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_subnet_group_identifier =
       value_for_key string__of_yojson "ReplicationSubnetGroupIdentifier" _list path;
   }
    : delete_replication_subnet_group_message)

let delete_replication_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance =
       option_of_yojson
         (value_for_key replication_instance_of_yojson "ReplicationInstance")
         _list path;
   }
    : delete_replication_instance_response)

let delete_replication_instance_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_arn = value_for_key string__of_yojson "ReplicationInstanceArn" _list path;
   }
    : delete_replication_instance_message)

let delete_replication_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config =
       option_of_yojson (value_for_key replication_config_of_yojson "ReplicationConfig") _list path;
   }
    : delete_replication_config_response)

let delete_replication_config_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replication_config_arn = value_for_key string__of_yojson "ReplicationConfigArn" _list path }
    : delete_replication_config_message)

let delete_migration_project_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project =
       option_of_yojson (value_for_key migration_project_of_yojson "MigrationProject") _list path;
   }
    : delete_migration_project_response)

let delete_migration_project_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key string__of_yojson "MigrationProjectIdentifier" _list path;
   }
    : delete_migration_project_message)

let delete_instance_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_profile =
       option_of_yojson (value_for_key instance_profile_of_yojson "InstanceProfile") _list path;
   }
    : delete_instance_profile_response)

let delete_instance_profile_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_profile_identifier =
       value_for_key string__of_yojson "InstanceProfileIdentifier" _list path;
   }
    : delete_instance_profile_message)

let delete_fleet_advisor_databases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_ids = option_of_yojson (value_for_key string_list_of_yojson "DatabaseIds") _list path;
   }
    : delete_fleet_advisor_databases_response)

let delete_fleet_advisor_databases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ database_ids = value_for_key string_list_of_yojson "DatabaseIds" _list path }
    : delete_fleet_advisor_databases_request)

let collector_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : collector_not_found_fault)

let delete_collector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ collector_referenced_id = value_for_key string__of_yojson "CollectorReferencedId" _list path }
    : delete_collector_request)

let delete_event_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_subscription =
       option_of_yojson (value_for_key event_subscription_of_yojson "EventSubscription") _list path;
   }
    : delete_event_subscription_response)

let delete_event_subscription_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ subscription_name = value_for_key string__of_yojson "SubscriptionName" _list path }
    : delete_event_subscription_message)

let delete_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint = option_of_yojson (value_for_key endpoint_of_yojson "Endpoint") _list path }
    : delete_endpoint_response)

let delete_endpoint_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint_arn = value_for_key string__of_yojson "EndpointArn" _list path }
    : delete_endpoint_message)

let delete_data_provider_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_provider =
       option_of_yojson (value_for_key data_provider_of_yojson "DataProvider") _list path;
   }
    : delete_data_provider_response)

let delete_data_provider_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_provider_identifier = value_for_key string__of_yojson "DataProviderIdentifier" _list path;
   }
    : delete_data_provider_message)

let delete_data_migration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migration =
       option_of_yojson (value_for_key data_migration_of_yojson "DataMigration") _list path;
   }
    : delete_data_migration_response)

let delete_data_migration_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migration_identifier =
       value_for_key string__of_yojson "DataMigrationIdentifier" _list path;
   }
    : delete_data_migration_message)

let delete_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = option_of_yojson (value_for_key connection_of_yojson "Connection") _list path }
    : delete_connection_response)

let delete_connection_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_arn = value_for_key string__of_yojson "EndpointArn" _list path;
     replication_instance_arn = value_for_key string__of_yojson "ReplicationInstanceArn" _list path;
   }
    : delete_connection_message)

let delete_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate = option_of_yojson (value_for_key certificate_of_yojson "Certificate") _list path }
    : delete_certificate_response)

let delete_certificate_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = value_for_key string__of_yojson "CertificateArn" _list path }
    : delete_certificate_message)

let create_replication_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task =
       option_of_yojson (value_for_key replication_task_of_yojson "ReplicationTask") _list path;
   }
    : create_replication_task_response)

let create_replication_task_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_identifier =
       value_for_key string__of_yojson "ReplicationTaskIdentifier" _list path;
     source_endpoint_arn = value_for_key string__of_yojson "SourceEndpointArn" _list path;
     target_endpoint_arn = value_for_key string__of_yojson "TargetEndpointArn" _list path;
     replication_instance_arn = value_for_key string__of_yojson "ReplicationInstanceArn" _list path;
     migration_type = value_for_key migration_type_value_of_yojson "MigrationType" _list path;
     table_mappings = value_for_key string__of_yojson "TableMappings" _list path;
     replication_task_settings =
       option_of_yojson (value_for_key string__of_yojson "ReplicationTaskSettings") _list path;
     cdc_start_time = option_of_yojson (value_for_key t_stamp_of_yojson "CdcStartTime") _list path;
     cdc_start_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStartPosition") _list path;
     cdc_stop_position =
       option_of_yojson (value_for_key string__of_yojson "CdcStopPosition") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     task_data = option_of_yojson (value_for_key string__of_yojson "TaskData") _list path;
     resource_identifier =
       option_of_yojson (value_for_key string__of_yojson "ResourceIdentifier") _list path;
   }
    : create_replication_task_message)

let create_replication_subnet_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_subnet_group =
       option_of_yojson
         (value_for_key replication_subnet_group_of_yojson "ReplicationSubnetGroup")
         _list path;
   }
    : create_replication_subnet_group_response)

let create_replication_subnet_group_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_subnet_group_identifier =
       value_for_key string__of_yojson "ReplicationSubnetGroupIdentifier" _list path;
     replication_subnet_group_description =
       value_for_key string__of_yojson "ReplicationSubnetGroupDescription" _list path;
     subnet_ids = value_for_key subnet_identifier_list_of_yojson "SubnetIds" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_replication_subnet_group_message)

let create_replication_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance =
       option_of_yojson
         (value_for_key replication_instance_of_yojson "ReplicationInstance")
         _list path;
   }
    : create_replication_instance_response)

let create_replication_instance_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_identifier =
       value_for_key string__of_yojson "ReplicationInstanceIdentifier" _list path;
     allocated_storage =
       option_of_yojson (value_for_key integer_optional_of_yojson "AllocatedStorage") _list path;
     replication_instance_class =
       value_for_key replication_instance_class_of_yojson "ReplicationInstanceClass" _list path;
     vpc_security_group_ids =
       option_of_yojson
         (value_for_key vpc_security_group_id_list_of_yojson "VpcSecurityGroupIds")
         _list path;
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "AvailabilityZone") _list path;
     replication_subnet_group_identifier =
       option_of_yojson
         (value_for_key string__of_yojson "ReplicationSubnetGroupIdentifier")
         _list path;
     preferred_maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "PreferredMaintenanceWindow") _list path;
     multi_a_z = option_of_yojson (value_for_key boolean_optional_of_yojson "MultiAZ") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     auto_minor_version_upgrade =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "AutoMinorVersionUpgrade")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     publicly_accessible =
       option_of_yojson (value_for_key boolean_optional_of_yojson "PubliclyAccessible") _list path;
     dns_name_servers =
       option_of_yojson (value_for_key string__of_yojson "DnsNameServers") _list path;
     resource_identifier =
       option_of_yojson (value_for_key string__of_yojson "ResourceIdentifier") _list path;
     network_type = option_of_yojson (value_for_key string__of_yojson "NetworkType") _list path;
     kerberos_authentication_settings =
       option_of_yojson
         (value_for_key kerberos_authentication_settings_of_yojson "KerberosAuthenticationSettings")
         _list path;
   }
    : create_replication_instance_message)

let create_replication_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config =
       option_of_yojson (value_for_key replication_config_of_yojson "ReplicationConfig") _list path;
   }
    : create_replication_config_response)

let create_replication_config_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_config_identifier =
       value_for_key string__of_yojson "ReplicationConfigIdentifier" _list path;
     source_endpoint_arn = value_for_key string__of_yojson "SourceEndpointArn" _list path;
     target_endpoint_arn = value_for_key string__of_yojson "TargetEndpointArn" _list path;
     compute_config = value_for_key compute_config_of_yojson "ComputeConfig" _list path;
     replication_type = value_for_key migration_type_value_of_yojson "ReplicationType" _list path;
     table_mappings = value_for_key string__of_yojson "TableMappings" _list path;
     replication_settings =
       option_of_yojson (value_for_key string__of_yojson "ReplicationSettings") _list path;
     supplemental_settings =
       option_of_yojson (value_for_key string__of_yojson "SupplementalSettings") _list path;
     resource_identifier =
       option_of_yojson (value_for_key string__of_yojson "ResourceIdentifier") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_replication_config_message)

let create_migration_project_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project =
       option_of_yojson (value_for_key migration_project_of_yojson "MigrationProject") _list path;
   }
    : create_migration_project_response)

let create_migration_project_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_name =
       option_of_yojson (value_for_key string__of_yojson "MigrationProjectName") _list path;
     source_data_provider_descriptors =
       value_for_key data_provider_descriptor_definition_list_of_yojson
         "SourceDataProviderDescriptors" _list path;
     target_data_provider_descriptors =
       value_for_key data_provider_descriptor_definition_list_of_yojson
         "TargetDataProviderDescriptors" _list path;
     instance_profile_identifier =
       value_for_key string__of_yojson "InstanceProfileIdentifier" _list path;
     transformation_rules =
       option_of_yojson (value_for_key string__of_yojson "TransformationRules") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     schema_conversion_application_attributes =
       option_of_yojson
         (value_for_key sc_application_attributes_of_yojson "SchemaConversionApplicationAttributes")
         _list path;
   }
    : create_migration_project_message)

let create_instance_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_profile =
       option_of_yojson (value_for_key instance_profile_of_yojson "InstanceProfile") _list path;
   }
    : create_instance_profile_response)

let create_instance_profile_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "AvailabilityZone") _list path;
     kms_key_arn = option_of_yojson (value_for_key string__of_yojson "KmsKeyArn") _list path;
     publicly_accessible =
       option_of_yojson (value_for_key boolean_optional_of_yojson "PubliclyAccessible") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     network_type = option_of_yojson (value_for_key string__of_yojson "NetworkType") _list path;
     instance_profile_name =
       option_of_yojson (value_for_key string__of_yojson "InstanceProfileName") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     subnet_group_identifier =
       option_of_yojson (value_for_key string__of_yojson "SubnetGroupIdentifier") _list path;
     vpc_security_groups =
       option_of_yojson (value_for_key string_list_of_yojson "VpcSecurityGroups") _list path;
   }
    : create_instance_profile_message)

let create_fleet_advisor_collector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collector_referenced_id =
       option_of_yojson (value_for_key string__of_yojson "CollectorReferencedId") _list path;
     collector_name = option_of_yojson (value_for_key string__of_yojson "CollectorName") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     s3_bucket_name = option_of_yojson (value_for_key string__of_yojson "S3BucketName") _list path;
   }
    : create_fleet_advisor_collector_response)

let create_fleet_advisor_collector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collector_name = value_for_key string__of_yojson "CollectorName" _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     service_access_role_arn = value_for_key string__of_yojson "ServiceAccessRoleArn" _list path;
     s3_bucket_name = value_for_key string__of_yojson "S3BucketName" _list path;
   }
    : create_fleet_advisor_collector_request)

let create_event_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_subscription =
       option_of_yojson (value_for_key event_subscription_of_yojson "EventSubscription") _list path;
   }
    : create_event_subscription_response)

let create_event_subscription_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription_name = value_for_key string__of_yojson "SubscriptionName" _list path;
     sns_topic_arn = value_for_key string__of_yojson "SnsTopicArn" _list path;
     source_type = option_of_yojson (value_for_key string__of_yojson "SourceType") _list path;
     event_categories =
       option_of_yojson (value_for_key event_categories_list_of_yojson "EventCategories") _list path;
     source_ids = option_of_yojson (value_for_key source_ids_list_of_yojson "SourceIds") _list path;
     enabled = option_of_yojson (value_for_key boolean_optional_of_yojson "Enabled") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_event_subscription_message)

let create_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint = option_of_yojson (value_for_key endpoint_of_yojson "Endpoint") _list path }
    : create_endpoint_response)

let create_endpoint_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_identifier = value_for_key string__of_yojson "EndpointIdentifier" _list path;
     endpoint_type =
       value_for_key replication_endpoint_type_value_of_yojson "EndpointType" _list path;
     engine_name = value_for_key string__of_yojson "EngineName" _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     password = option_of_yojson (value_for_key secret_string_of_yojson "Password") _list path;
     server_name = option_of_yojson (value_for_key string__of_yojson "ServerName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     database_name = option_of_yojson (value_for_key string__of_yojson "DatabaseName") _list path;
     extra_connection_attributes =
       option_of_yojson (value_for_key string__of_yojson "ExtraConnectionAttributes") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     certificate_arn =
       option_of_yojson (value_for_key string__of_yojson "CertificateArn") _list path;
     ssl_mode = option_of_yojson (value_for_key dms_ssl_mode_value_of_yojson "SslMode") _list path;
     service_access_role_arn =
       option_of_yojson (value_for_key string__of_yojson "ServiceAccessRoleArn") _list path;
     external_table_definition =
       option_of_yojson (value_for_key string__of_yojson "ExternalTableDefinition") _list path;
     dynamo_db_settings =
       option_of_yojson (value_for_key dynamo_db_settings_of_yojson "DynamoDbSettings") _list path;
     s3_settings = option_of_yojson (value_for_key s3_settings_of_yojson "S3Settings") _list path;
     dms_transfer_settings =
       option_of_yojson
         (value_for_key dms_transfer_settings_of_yojson "DmsTransferSettings")
         _list path;
     mongo_db_settings =
       option_of_yojson (value_for_key mongo_db_settings_of_yojson "MongoDbSettings") _list path;
     kinesis_settings =
       option_of_yojson (value_for_key kinesis_settings_of_yojson "KinesisSettings") _list path;
     kafka_settings =
       option_of_yojson (value_for_key kafka_settings_of_yojson "KafkaSettings") _list path;
     elasticsearch_settings =
       option_of_yojson
         (value_for_key elasticsearch_settings_of_yojson "ElasticsearchSettings")
         _list path;
     neptune_settings =
       option_of_yojson (value_for_key neptune_settings_of_yojson "NeptuneSettings") _list path;
     redshift_settings =
       option_of_yojson (value_for_key redshift_settings_of_yojson "RedshiftSettings") _list path;
     postgre_sql_settings =
       option_of_yojson
         (value_for_key postgre_sql_settings_of_yojson "PostgreSQLSettings")
         _list path;
     my_sql_settings =
       option_of_yojson (value_for_key my_sql_settings_of_yojson "MySQLSettings") _list path;
     oracle_settings =
       option_of_yojson (value_for_key oracle_settings_of_yojson "OracleSettings") _list path;
     sybase_settings =
       option_of_yojson (value_for_key sybase_settings_of_yojson "SybaseSettings") _list path;
     microsoft_sql_server_settings =
       option_of_yojson
         (value_for_key microsoft_sql_server_settings_of_yojson "MicrosoftSQLServerSettings")
         _list path;
     ibm_db2_settings =
       option_of_yojson (value_for_key ibm_db2_settings_of_yojson "IBMDb2Settings") _list path;
     resource_identifier =
       option_of_yojson (value_for_key string__of_yojson "ResourceIdentifier") _list path;
     doc_db_settings =
       option_of_yojson (value_for_key doc_db_settings_of_yojson "DocDbSettings") _list path;
     redis_settings =
       option_of_yojson (value_for_key redis_settings_of_yojson "RedisSettings") _list path;
     gcp_my_sql_settings =
       option_of_yojson (value_for_key gcp_my_sql_settings_of_yojson "GcpMySQLSettings") _list path;
     timestream_settings =
       option_of_yojson
         (value_for_key timestream_settings_of_yojson "TimestreamSettings")
         _list path;
   }
    : create_endpoint_message)

let create_data_provider_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_provider =
       option_of_yojson (value_for_key data_provider_of_yojson "DataProvider") _list path;
   }
    : create_data_provider_response)

let create_data_provider_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_provider_name =
       option_of_yojson (value_for_key string__of_yojson "DataProviderName") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     engine = value_for_key string__of_yojson "Engine" _list path;
     \#virtual = option_of_yojson (value_for_key boolean_optional_of_yojson "Virtual") _list path;
     settings = value_for_key data_provider_settings_of_yojson "Settings" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_data_provider_message)

let create_data_migration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migration =
       option_of_yojson (value_for_key data_migration_of_yojson "DataMigration") _list path;
   }
    : create_data_migration_response)

let create_data_migration_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_migration_name =
       option_of_yojson (value_for_key string__of_yojson "DataMigrationName") _list path;
     migration_project_identifier =
       value_for_key string__of_yojson "MigrationProjectIdentifier" _list path;
     data_migration_type =
       value_for_key migration_type_value_of_yojson "DataMigrationType" _list path;
     service_access_role_arn = value_for_key string__of_yojson "ServiceAccessRoleArn" _list path;
     enable_cloudwatch_logs =
       option_of_yojson (value_for_key boolean_optional_of_yojson "EnableCloudwatchLogs") _list path;
     source_data_settings =
       option_of_yojson
         (value_for_key source_data_settings_of_yojson "SourceDataSettings")
         _list path;
     target_data_settings =
       option_of_yojson
         (value_for_key target_data_settings_of_yojson "TargetDataSettings")
         _list path;
     number_of_jobs =
       option_of_yojson (value_for_key integer_optional_of_yojson "NumberOfJobs") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     selection_rules =
       option_of_yojson (value_for_key secret_string_of_yojson "SelectionRules") _list path;
   }
    : create_data_migration_message)

let cancel_replication_task_assessment_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_assessment_run =
       option_of_yojson
         (value_for_key replication_task_assessment_run_of_yojson "ReplicationTaskAssessmentRun")
         _list path;
   }
    : cancel_replication_task_assessment_run_response)

let cancel_replication_task_assessment_run_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_task_assessment_run_arn =
       value_for_key string__of_yojson "ReplicationTaskAssessmentRunArn" _list path;
   }
    : cancel_replication_task_assessment_run_message)

let cancel_metadata_model_creation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request =
       option_of_yojson (value_for_key schema_conversion_request_of_yojson "Request") _list path;
   }
    : cancel_metadata_model_creation_response)

let cancel_metadata_model_creation_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     request_identifier = value_for_key string__of_yojson "RequestIdentifier" _list path;
   }
    : cancel_metadata_model_creation_message)

let cancel_metadata_model_conversion_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request =
       option_of_yojson (value_for_key schema_conversion_request_of_yojson "Request") _list path;
   }
    : cancel_metadata_model_conversion_response)

let cancel_metadata_model_conversion_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     migration_project_identifier =
       value_for_key migration_project_identifier_of_yojson "MigrationProjectIdentifier" _list path;
     request_identifier = value_for_key string__of_yojson "RequestIdentifier" _list path;
   }
    : cancel_metadata_model_conversion_message)

let batch_start_recommendations_error_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_id = option_of_yojson (value_for_key string__of_yojson "DatabaseId") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : batch_start_recommendations_error_entry)

let batch_start_recommendations_error_entry_list_of_yojson tree path =
  list_of_yojson batch_start_recommendations_error_entry_of_yojson tree path

let batch_start_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_entries =
       option_of_yojson
         (value_for_key batch_start_recommendations_error_entry_list_of_yojson "ErrorEntries")
         _list path;
   }
    : batch_start_recommendations_response)

let start_recommendations_request_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_id = value_for_key string__of_yojson "DatabaseId" _list path;
     settings = value_for_key recommendation_settings_of_yojson "Settings" _list path;
   }
    : start_recommendations_request_entry)

let start_recommendations_request_entry_list_of_yojson tree path =
  list_of_yojson start_recommendations_request_entry_of_yojson tree path

let batch_start_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data =
       option_of_yojson
         (value_for_key start_recommendations_request_entry_list_of_yojson "Data")
         _list path;
   }
    : batch_start_recommendations_request)

let apply_pending_maintenance_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_pending_maintenance_actions =
       option_of_yojson
         (value_for_key resource_pending_maintenance_actions_of_yojson
            "ResourcePendingMaintenanceActions")
         _list path;
   }
    : apply_pending_maintenance_action_response)

let apply_pending_maintenance_action_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_instance_arn = value_for_key string__of_yojson "ReplicationInstanceArn" _list path;
     apply_action = value_for_key string__of_yojson "ApplyAction" _list path;
     opt_in_type = value_for_key string__of_yojson "OptInType" _list path;
   }
    : apply_pending_maintenance_action_message)
