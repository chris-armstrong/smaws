open Smaws_Lib.Json.SerializeHelpers
open Types

let exception_message_to_yojson = string_to_yojson

let access_denied_fault_to_yojson (x : access_denied_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let long_to_yojson = long_to_yojson
let string__to_yojson = string_to_yojson

let account_quota_to_yojson (x : account_quota) =
  assoc_to_yojson
    [
      ("AccountQuotaName", option_to_yojson string__to_yojson x.account_quota_name);
      ("Used", option_to_yojson long_to_yojson x.used);
      ("Max", option_to_yojson long_to_yojson x.max);
    ]

let account_quota_list_to_yojson tree = list_to_yojson account_quota_to_yojson tree

let resource_not_found_fault_to_yojson (x : resource_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_resource_state_fault_to_yojson (x : invalid_resource_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let add_tags_to_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson string__to_yojson x.key);
      ("Value", option_to_yojson string__to_yojson x.value);
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let add_tags_to_resource_message_to_yojson (x : add_tags_to_resource_message) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let update_subscriptions_to_event_bridge_response_to_yojson
    (x : update_subscriptions_to_event_bridge_response) =
  assoc_to_yojson [ ("Result", option_to_yojson string__to_yojson x.result_) ]

let boolean_optional_to_yojson = bool_to_yojson

let update_subscriptions_to_event_bridge_message_to_yojson
    (x : update_subscriptions_to_event_bridge_message) =
  assoc_to_yojson [ ("ForceMove", option_to_yojson boolean_optional_to_yojson x.force_move) ]

let resource_quota_exceeded_fault_to_yojson (x : resource_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_key_not_accessible_fault_to_yojson (x : kms_key_not_accessible_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
      ("EndpointArn", option_to_yojson string__to_yojson x.endpoint_arn);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
      ("EndpointIdentifier", option_to_yojson string__to_yojson x.endpoint_identifier);
      ( "ReplicationInstanceIdentifier",
        option_to_yojson string__to_yojson x.replication_instance_identifier );
    ]

let test_connection_response_to_yojson (x : test_connection_response) =
  assoc_to_yojson [ ("Connection", option_to_yojson connection_to_yojson x.connection) ]

let test_connection_message_to_yojson (x : test_connection_message) =
  assoc_to_yojson
    [
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
      ("EndpointArn", Some (string__to_yojson x.endpoint_arn));
    ]

let t_stamp_to_yojson = timestamp_epoch_seconds_to_yojson
let integer_to_yojson = int_to_yojson

let replication_task_stats_to_yojson (x : replication_task_stats) =
  assoc_to_yojson
    [
      ("FullLoadProgressPercent", option_to_yojson integer_to_yojson x.full_load_progress_percent);
      ("ElapsedTimeMillis", option_to_yojson long_to_yojson x.elapsed_time_millis);
      ("TablesLoaded", option_to_yojson integer_to_yojson x.tables_loaded);
      ("TablesLoading", option_to_yojson integer_to_yojson x.tables_loading);
      ("TablesQueued", option_to_yojson integer_to_yojson x.tables_queued);
      ("TablesErrored", option_to_yojson integer_to_yojson x.tables_errored);
      ("FreshStartDate", option_to_yojson t_stamp_to_yojson x.fresh_start_date);
      ("StartDate", option_to_yojson t_stamp_to_yojson x.start_date);
      ("StopDate", option_to_yojson t_stamp_to_yojson x.stop_date);
      ("FullLoadStartDate", option_to_yojson t_stamp_to_yojson x.full_load_start_date);
      ("FullLoadFinishDate", option_to_yojson t_stamp_to_yojson x.full_load_finish_date);
    ]

let migration_type_value_to_yojson (x : migration_type_value) =
  match x with
  | FULL_LOAD -> `String "full-load"
  | CDC -> `String "cdc"
  | FULL_LOAD_AND_CDC -> `String "full-load-and-cdc"

let replication_task_to_yojson (x : replication_task) =
  assoc_to_yojson
    [
      ("ReplicationTaskIdentifier", option_to_yojson string__to_yojson x.replication_task_identifier);
      ("SourceEndpointArn", option_to_yojson string__to_yojson x.source_endpoint_arn);
      ("TargetEndpointArn", option_to_yojson string__to_yojson x.target_endpoint_arn);
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
      ("MigrationType", option_to_yojson migration_type_value_to_yojson x.migration_type);
      ("TableMappings", option_to_yojson string__to_yojson x.table_mappings);
      ("ReplicationTaskSettings", option_to_yojson string__to_yojson x.replication_task_settings);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
      ("StopReason", option_to_yojson string__to_yojson x.stop_reason);
      ( "ReplicationTaskCreationDate",
        option_to_yojson t_stamp_to_yojson x.replication_task_creation_date );
      ("ReplicationTaskStartDate", option_to_yojson t_stamp_to_yojson x.replication_task_start_date);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
      ("RecoveryCheckpoint", option_to_yojson string__to_yojson x.recovery_checkpoint);
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
      ( "ReplicationTaskStats",
        option_to_yojson replication_task_stats_to_yojson x.replication_task_stats );
      ("TaskData", option_to_yojson string__to_yojson x.task_data);
      ( "TargetReplicationInstanceArn",
        option_to_yojson string__to_yojson x.target_replication_instance_arn );
    ]

let stop_replication_task_response_to_yojson (x : stop_replication_task_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let stop_replication_task_message_to_yojson (x : stop_replication_task_message) =
  assoc_to_yojson [ ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn)) ]

let replication_stats_to_yojson (x : replication_stats) =
  assoc_to_yojson
    [
      ("FullLoadProgressPercent", option_to_yojson integer_to_yojson x.full_load_progress_percent);
      ("ElapsedTimeMillis", option_to_yojson long_to_yojson x.elapsed_time_millis);
      ("TablesLoaded", option_to_yojson integer_to_yojson x.tables_loaded);
      ("TablesLoading", option_to_yojson integer_to_yojson x.tables_loading);
      ("TablesQueued", option_to_yojson integer_to_yojson x.tables_queued);
      ("TablesErrored", option_to_yojson integer_to_yojson x.tables_errored);
      ("FreshStartDate", option_to_yojson t_stamp_to_yojson x.fresh_start_date);
      ("StartDate", option_to_yojson t_stamp_to_yojson x.start_date);
      ("StopDate", option_to_yojson t_stamp_to_yojson x.stop_date);
      ("FullLoadStartDate", option_to_yojson t_stamp_to_yojson x.full_load_start_date);
      ("FullLoadFinishDate", option_to_yojson t_stamp_to_yojson x.full_load_finish_date);
    ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let replication_task_assessment_run_result_statistic_to_yojson
    (x : replication_task_assessment_run_result_statistic) =
  assoc_to_yojson
    [
      ("Passed", option_to_yojson integer_to_yojson x.passed);
      ("Failed", option_to_yojson integer_to_yojson x.failed);
      ("Error", option_to_yojson integer_to_yojson x.error);
      ("Warning", option_to_yojson integer_to_yojson x.warning);
      ("Cancelled", option_to_yojson integer_to_yojson x.cancelled);
      ("Skipped", option_to_yojson integer_to_yojson x.skipped);
    ]

let replication_task_assessment_run_progress_to_yojson
    (x : replication_task_assessment_run_progress) =
  assoc_to_yojson
    [
      ("IndividualAssessmentCount", option_to_yojson integer_to_yojson x.individual_assessment_count);
      ( "IndividualAssessmentCompletedCount",
        option_to_yojson integer_to_yojson x.individual_assessment_completed_count );
    ]

let boolean__to_yojson = bool_to_yojson

let premigration_assessment_status_to_yojson (x : premigration_assessment_status) =
  assoc_to_yojson
    [
      ( "PremigrationAssessmentRunArn",
        option_to_yojson string__to_yojson x.premigration_assessment_run_arn );
      ("FailOnAssessmentFailure", option_to_yojson boolean__to_yojson x.fail_on_assessment_failure);
      ("Status", option_to_yojson string__to_yojson x.status);
      ( "PremigrationAssessmentRunCreationDate",
        option_to_yojson t_stamp_to_yojson x.premigration_assessment_run_creation_date );
      ( "AssessmentProgress",
        option_to_yojson replication_task_assessment_run_progress_to_yojson x.assessment_progress );
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
      ("ResultLocationBucket", option_to_yojson string__to_yojson x.result_location_bucket);
      ("ResultLocationFolder", option_to_yojson string__to_yojson x.result_location_folder);
      ("ResultEncryptionMode", option_to_yojson string__to_yojson x.result_encryption_mode);
      ("ResultKmsKeyArn", option_to_yojson string__to_yojson x.result_kms_key_arn);
      ( "ResultStatistic",
        option_to_yojson replication_task_assessment_run_result_statistic_to_yojson
          x.result_statistic );
    ]

let premigration_assessment_status_list_to_yojson tree =
  list_to_yojson premigration_assessment_status_to_yojson tree

let provision_data_to_yojson (x : provision_data) =
  assoc_to_yojson
    [
      ("ProvisionState", option_to_yojson string__to_yojson x.provision_state);
      ("ProvisionedCapacityUnits", option_to_yojson integer_to_yojson x.provisioned_capacity_units);
      ("DateProvisioned", option_to_yojson t_stamp_to_yojson x.date_provisioned);
      ( "IsNewProvisioningAvailable",
        option_to_yojson boolean__to_yojson x.is_new_provisioning_available );
      ( "DateNewProvisioningDataAvailable",
        option_to_yojson t_stamp_to_yojson x.date_new_provisioning_data_available );
      ( "ReasonForNewProvisioningData",
        option_to_yojson string__to_yojson x.reason_for_new_provisioning_data );
    ]

let replication_to_yojson (x : replication) =
  assoc_to_yojson
    [
      ( "ReplicationConfigIdentifier",
        option_to_yojson string__to_yojson x.replication_config_identifier );
      ("ReplicationConfigArn", option_to_yojson string__to_yojson x.replication_config_arn);
      ("SourceEndpointArn", option_to_yojson string__to_yojson x.source_endpoint_arn);
      ("TargetEndpointArn", option_to_yojson string__to_yojson x.target_endpoint_arn);
      ("ReplicationType", option_to_yojson migration_type_value_to_yojson x.replication_type);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("ProvisionData", option_to_yojson provision_data_to_yojson x.provision_data);
      ( "PremigrationAssessmentStatuses",
        option_to_yojson premigration_assessment_status_list_to_yojson
          x.premigration_assessment_statuses );
      ("StopReason", option_to_yojson string__to_yojson x.stop_reason);
      ("FailureMessages", option_to_yojson string_list_to_yojson x.failure_messages);
      ("ReplicationStats", option_to_yojson replication_stats_to_yojson x.replication_stats);
      ("StartReplicationType", option_to_yojson string__to_yojson x.start_replication_type);
      ("CdcStartTime", option_to_yojson t_stamp_to_yojson x.cdc_start_time);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
      ("RecoveryCheckpoint", option_to_yojson string__to_yojson x.recovery_checkpoint);
      ("ReplicationCreateTime", option_to_yojson t_stamp_to_yojson x.replication_create_time);
      ("ReplicationUpdateTime", option_to_yojson t_stamp_to_yojson x.replication_update_time);
      ("ReplicationLastStopTime", option_to_yojson t_stamp_to_yojson x.replication_last_stop_time);
      ( "ReplicationDeprovisionTime",
        option_to_yojson t_stamp_to_yojson x.replication_deprovision_time );
      ("IsReadOnly", option_to_yojson boolean_optional_to_yojson x.is_read_only);
    ]

let stop_replication_response_to_yojson (x : stop_replication_response) =
  assoc_to_yojson [ ("Replication", option_to_yojson replication_to_yojson x.replication) ]

let stop_replication_message_to_yojson (x : stop_replication_message) =
  assoc_to_yojson [ ("ReplicationConfigArn", Some (string__to_yojson x.replication_config_arn)) ]

let failed_dependency_fault_to_yojson (x : failed_dependency_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let data_migration_cidr_block_to_yojson tree = list_to_yojson string__to_yojson tree
let public_ip_address_list_to_yojson tree = list_to_yojson string__to_yojson tree
let iso8601_date_time_to_yojson = timestamp_iso_8601_to_yojson

let data_migration_statistics_to_yojson (x : data_migration_statistics) =
  assoc_to_yojson
    [
      ("TablesLoaded", option_to_yojson integer_to_yojson x.tables_loaded);
      ("ElapsedTimeMillis", option_to_yojson long_to_yojson x.elapsed_time_millis);
      ("TablesLoading", option_to_yojson integer_to_yojson x.tables_loading);
      ("FullLoadPercentage", option_to_yojson integer_to_yojson x.full_load_percentage);
      ("CDCLatency", option_to_yojson integer_to_yojson x.cdc_latency);
      ("TablesQueued", option_to_yojson integer_to_yojson x.tables_queued);
      ("TablesErrored", option_to_yojson integer_to_yojson x.tables_errored);
      ("StartTime", option_to_yojson iso8601_date_time_to_yojson x.start_time);
      ("StopTime", option_to_yojson iso8601_date_time_to_yojson x.stop_time);
    ]

let table_preparation_mode_to_yojson (x : table_preparation_mode) =
  match x with
  | DO_NOTHING -> `String "do-nothing"
  | TRUNCATE -> `String "truncate"
  | DROP_TABLES_ON_TARGET -> `String "drop-tables-on-target"

let target_data_setting_to_yojson (x : target_data_setting) =
  assoc_to_yojson
    [
      ( "TablePreparationMode",
        option_to_yojson table_preparation_mode_to_yojson x.table_preparation_mode );
    ]

let target_data_settings_to_yojson tree = list_to_yojson target_data_setting_to_yojson tree

let source_data_setting_to_yojson (x : source_data_setting) =
  assoc_to_yojson
    [
      ("CDCStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CDCStartTime", option_to_yojson iso8601_date_time_to_yojson x.cdc_start_time);
      ("CDCStopTime", option_to_yojson iso8601_date_time_to_yojson x.cdc_stop_time);
      ("SlotName", option_to_yojson string__to_yojson x.slot_name);
    ]

let source_data_settings_to_yojson tree = list_to_yojson source_data_setting_to_yojson tree
let secret_string_to_yojson = string_to_yojson
let integer_optional_to_yojson = int_to_yojson

let data_migration_settings_to_yojson (x : data_migration_settings) =
  assoc_to_yojson
    [
      ("NumberOfJobs", option_to_yojson integer_optional_to_yojson x.number_of_jobs);
      ( "CloudwatchLogsEnabled",
        option_to_yojson boolean_optional_to_yojson x.cloudwatch_logs_enabled );
      ("SelectionRules", option_to_yojson secret_string_to_yojson x.selection_rules);
    ]

let data_migration_to_yojson (x : data_migration) =
  assoc_to_yojson
    [
      ("DataMigrationName", option_to_yojson string__to_yojson x.data_migration_name);
      ("DataMigrationArn", option_to_yojson string__to_yojson x.data_migration_arn);
      ( "DataMigrationCreateTime",
        option_to_yojson iso8601_date_time_to_yojson x.data_migration_create_time );
      ( "DataMigrationStartTime",
        option_to_yojson iso8601_date_time_to_yojson x.data_migration_start_time );
      ( "DataMigrationEndTime",
        option_to_yojson iso8601_date_time_to_yojson x.data_migration_end_time );
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("MigrationProjectArn", option_to_yojson string__to_yojson x.migration_project_arn);
      ("DataMigrationType", option_to_yojson migration_type_value_to_yojson x.data_migration_type);
      ( "DataMigrationSettings",
        option_to_yojson data_migration_settings_to_yojson x.data_migration_settings );
      ("SourceDataSettings", option_to_yojson source_data_settings_to_yojson x.source_data_settings);
      ("TargetDataSettings", option_to_yojson target_data_settings_to_yojson x.target_data_settings);
      ( "DataMigrationStatistics",
        option_to_yojson data_migration_statistics_to_yojson x.data_migration_statistics );
      ("DataMigrationStatus", option_to_yojson string__to_yojson x.data_migration_status);
      ("PublicIpAddresses", option_to_yojson public_ip_address_list_to_yojson x.public_ip_addresses);
      ( "DataMigrationCidrBlocks",
        option_to_yojson data_migration_cidr_block_to_yojson x.data_migration_cidr_blocks );
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
      ("StopReason", option_to_yojson string__to_yojson x.stop_reason);
    ]

let stop_data_migration_response_to_yojson (x : stop_data_migration_response) =
  assoc_to_yojson [ ("DataMigration", option_to_yojson data_migration_to_yojson x.data_migration) ]

let stop_data_migration_message_to_yojson (x : stop_data_migration_message) =
  assoc_to_yojson
    [ ("DataMigrationIdentifier", Some (string__to_yojson x.data_migration_identifier)) ]

let s3_resource_not_found_fault_to_yojson (x : s3_resource_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let s3_access_denied_fault_to_yojson (x : s3_access_denied_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let resource_arn_to_yojson = string_to_yojson

let resource_already_exists_fault_to_yojson (x : resource_already_exists_fault) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
    ]

let kms_not_found_fault_to_yojson (x : kms_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_invalid_state_fault_to_yojson (x : kms_invalid_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_fault_to_yojson (x : kms_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_disabled_fault_to_yojson (x : kms_disabled_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_access_denied_fault_to_yojson (x : kms_access_denied_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let replication_task_assessment_run_to_yojson (x : replication_task_assessment_run) =
  assoc_to_yojson
    [
      ( "ReplicationTaskAssessmentRunArn",
        option_to_yojson string__to_yojson x.replication_task_assessment_run_arn );
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
      ("Status", option_to_yojson string__to_yojson x.status);
      ( "ReplicationTaskAssessmentRunCreationDate",
        option_to_yojson t_stamp_to_yojson x.replication_task_assessment_run_creation_date );
      ( "AssessmentProgress",
        option_to_yojson replication_task_assessment_run_progress_to_yojson x.assessment_progress );
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("ResultLocationBucket", option_to_yojson string__to_yojson x.result_location_bucket);
      ("ResultLocationFolder", option_to_yojson string__to_yojson x.result_location_folder);
      ("ResultEncryptionMode", option_to_yojson string__to_yojson x.result_encryption_mode);
      ("ResultKmsKeyArn", option_to_yojson string__to_yojson x.result_kms_key_arn);
      ("AssessmentRunName", option_to_yojson string__to_yojson x.assessment_run_name);
      ( "IsLatestTaskAssessmentRun",
        option_to_yojson boolean__to_yojson x.is_latest_task_assessment_run );
      ( "ResultStatistic",
        option_to_yojson replication_task_assessment_run_result_statistic_to_yojson
          x.result_statistic );
    ]

let start_replication_task_assessment_run_response_to_yojson
    (x : start_replication_task_assessment_run_response) =
  assoc_to_yojson
    [
      ( "ReplicationTaskAssessmentRun",
        option_to_yojson replication_task_assessment_run_to_yojson x.replication_task_assessment_run
      );
    ]

let exclude_test_list_to_yojson tree = list_to_yojson string__to_yojson tree
let include_test_list_to_yojson tree = list_to_yojson string__to_yojson tree

let start_replication_task_assessment_run_message_to_yojson
    (x : start_replication_task_assessment_run_message) =
  assoc_to_yojson
    [
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
      ("ServiceAccessRoleArn", Some (string__to_yojson x.service_access_role_arn));
      ("ResultLocationBucket", Some (string__to_yojson x.result_location_bucket));
      ("ResultLocationFolder", option_to_yojson string__to_yojson x.result_location_folder);
      ("ResultEncryptionMode", option_to_yojson string__to_yojson x.result_encryption_mode);
      ("ResultKmsKeyArn", option_to_yojson string__to_yojson x.result_kms_key_arn);
      ("AssessmentRunName", Some (string__to_yojson x.assessment_run_name));
      ("IncludeOnly", option_to_yojson include_test_list_to_yojson x.include_only);
      ("Exclude", option_to_yojson exclude_test_list_to_yojson x.exclude);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_replication_task_assessment_response_to_yojson
    (x : start_replication_task_assessment_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let start_replication_task_assessment_message_to_yojson
    (x : start_replication_task_assessment_message) =
  assoc_to_yojson [ ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn)) ]

let start_replication_task_response_to_yojson (x : start_replication_task_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let start_replication_task_type_value_to_yojson (x : start_replication_task_type_value) =
  match x with
  | START_REPLICATION -> `String "start-replication"
  | RESUME_PROCESSING -> `String "resume-processing"
  | RELOAD_TARGET -> `String "reload-target"

let start_replication_task_message_to_yojson (x : start_replication_task_message) =
  assoc_to_yojson
    [
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
      ( "StartReplicationTaskType",
        Some (start_replication_task_type_value_to_yojson x.start_replication_task_type) );
      ("CdcStartTime", option_to_yojson t_stamp_to_yojson x.cdc_start_time);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
    ]

let start_replication_response_to_yojson (x : start_replication_response) =
  assoc_to_yojson [ ("Replication", option_to_yojson replication_to_yojson x.replication) ]

let start_replication_message_to_yojson (x : start_replication_message) =
  assoc_to_yojson
    [
      ("ReplicationConfigArn", Some (string__to_yojson x.replication_config_arn));
      ("StartReplicationType", Some (string__to_yojson x.start_replication_type));
      ( "PremigrationAssessmentSettings",
        option_to_yojson string__to_yojson x.premigration_assessment_settings );
      ("CdcStartTime", option_to_yojson t_stamp_to_yojson x.cdc_start_time);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
    ]

let recommendation_settings_to_yojson (x : recommendation_settings) =
  assoc_to_yojson
    [
      ("InstanceSizingType", Some (string__to_yojson x.instance_sizing_type));
      ("WorkloadType", Some (string__to_yojson x.workload_type));
    ]

let start_recommendations_request_to_yojson (x : start_recommendations_request) =
  assoc_to_yojson
    [
      ("DatabaseId", Some (string__to_yojson x.database_id));
      ("Settings", Some (recommendation_settings_to_yojson x.settings));
    ]

let start_metadata_model_import_response_to_yojson (x : start_metadata_model_import_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let origin_type_value_to_yojson (x : origin_type_value) =
  match x with SOURCE -> `String "SOURCE" | TARGET -> `String "TARGET"

let migration_project_identifier_to_yojson = string_to_yojson

let start_metadata_model_import_message_to_yojson (x : start_metadata_model_import_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ("Origin", Some (origin_type_value_to_yojson x.origin));
      ("Refresh", option_to_yojson boolean__to_yojson x.refresh);
    ]

let start_metadata_model_export_to_target_response_to_yojson
    (x : start_metadata_model_export_to_target_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let start_metadata_model_export_to_target_message_to_yojson
    (x : start_metadata_model_export_to_target_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ( "OverwriteExtensionPack",
        option_to_yojson boolean_optional_to_yojson x.overwrite_extension_pack );
    ]

let start_metadata_model_export_as_script_response_to_yojson
    (x : start_metadata_model_export_as_script_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let start_metadata_model_export_as_script_message_to_yojson
    (x : start_metadata_model_export_as_script_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ("Origin", Some (origin_type_value_to_yojson x.origin));
      ("FileName", option_to_yojson string__to_yojson x.file_name);
    ]

let start_metadata_model_creation_response_to_yojson (x : start_metadata_model_creation_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let statement_properties_to_yojson (x : statement_properties) =
  assoc_to_yojson [ ("Definition", Some (string__to_yojson x.definition)) ]

let metadata_model_properties_to_yojson (x : metadata_model_properties) =
  match x with
  | StatementProperties arg ->
      assoc_to_yojson [ ("StatementProperties", Some (statement_properties_to_yojson arg)) ]

let start_metadata_model_creation_message_to_yojson (x : start_metadata_model_creation_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ("MetadataModelName", Some (string__to_yojson x.metadata_model_name));
      ("Properties", Some (metadata_model_properties_to_yojson x.properties));
    ]

let start_metadata_model_conversion_response_to_yojson
    (x : start_metadata_model_conversion_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let start_metadata_model_conversion_message_to_yojson (x : start_metadata_model_conversion_message)
    =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
    ]

let start_metadata_model_assessment_response_to_yojson
    (x : start_metadata_model_assessment_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let start_metadata_model_assessment_message_to_yojson (x : start_metadata_model_assessment_message)
    =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
    ]

let start_extension_pack_association_response_to_yojson
    (x : start_extension_pack_association_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let start_extension_pack_association_message_to_yojson
    (x : start_extension_pack_association_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let invalid_operation_fault_to_yojson (x : invalid_operation_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let start_data_migration_response_to_yojson (x : start_data_migration_response) =
  assoc_to_yojson [ ("DataMigration", option_to_yojson data_migration_to_yojson x.data_migration) ]

let start_replication_migration_type_value_to_yojson (x : start_replication_migration_type_value) =
  match x with
  | RELOAD_TARGET -> `String "reload-target"
  | RESUME_PROCESSING -> `String "resume-processing"
  | START_REPLICATION -> `String "start-replication"

let start_data_migration_message_to_yojson (x : start_data_migration_message) =
  assoc_to_yojson
    [
      ("DataMigrationIdentifier", Some (string__to_yojson x.data_migration_identifier));
      ("StartType", Some (start_replication_migration_type_value_to_yojson x.start_type));
    ]

let run_fleet_advisor_lsa_analysis_response_to_yojson (x : run_fleet_advisor_lsa_analysis_response)
    =
  assoc_to_yojson
    [
      ("LsaAnalysisId", option_to_yojson string__to_yojson x.lsa_analysis_id);
      ("Status", option_to_yojson string__to_yojson x.status);
    ]

let remove_tags_from_resource_response_to_yojson = unit_to_yojson
let key_list_to_yojson tree = list_to_yojson string__to_yojson tree

let remove_tags_from_resource_message_to_yojson (x : remove_tags_from_resource_message) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
      ("TagKeys", Some (key_list_to_yojson x.tag_keys));
    ]

let reload_tables_response_to_yojson (x : reload_tables_response) =
  assoc_to_yojson
    [ ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn) ]

let reload_option_value_to_yojson (x : reload_option_value) =
  match x with DATA_RELOAD -> `String "data-reload" | VALIDATE_ONLY -> `String "validate-only"

let table_to_reload_to_yojson (x : table_to_reload) =
  assoc_to_yojson
    [
      ("SchemaName", Some (string__to_yojson x.schema_name));
      ("TableName", Some (string__to_yojson x.table_name));
    ]

let table_list_to_reload_to_yojson tree = list_to_yojson table_to_reload_to_yojson tree

let reload_tables_message_to_yojson (x : reload_tables_message) =
  assoc_to_yojson
    [
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
      ("TablesToReload", Some (table_list_to_reload_to_yojson x.tables_to_reload));
      ("ReloadOption", option_to_yojson reload_option_value_to_yojson x.reload_option);
    ]

let reload_replication_tables_response_to_yojson (x : reload_replication_tables_response) =
  assoc_to_yojson
    [ ("ReplicationConfigArn", option_to_yojson string__to_yojson x.replication_config_arn) ]

let reload_replication_tables_message_to_yojson (x : reload_replication_tables_message) =
  assoc_to_yojson
    [
      ("ReplicationConfigArn", Some (string__to_yojson x.replication_config_arn));
      ("TablesToReload", Some (table_list_to_reload_to_yojson x.tables_to_reload));
      ("ReloadOption", option_to_yojson reload_option_value_to_yojson x.reload_option);
    ]

let refresh_schemas_status_type_value_to_yojson (x : refresh_schemas_status_type_value) =
  match x with
  | SUCCESSFUL -> `String "successful"
  | FAILED -> `String "failed"
  | REFRESHING -> `String "refreshing"

let refresh_schemas_status_to_yojson (x : refresh_schemas_status) =
  assoc_to_yojson
    [
      ("EndpointArn", option_to_yojson string__to_yojson x.endpoint_arn);
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
      ("Status", option_to_yojson refresh_schemas_status_type_value_to_yojson x.status);
      ("LastRefreshDate", option_to_yojson t_stamp_to_yojson x.last_refresh_date);
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
    ]

let refresh_schemas_response_to_yojson (x : refresh_schemas_response) =
  assoc_to_yojson
    [
      ( "RefreshSchemasStatus",
        option_to_yojson refresh_schemas_status_to_yojson x.refresh_schemas_status );
    ]

let refresh_schemas_message_to_yojson (x : refresh_schemas_message) =
  assoc_to_yojson
    [
      ("EndpointArn", Some (string__to_yojson x.endpoint_arn));
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
    ]

let kerberos_authentication_settings_to_yojson (x : kerberos_authentication_settings) =
  assoc_to_yojson
    [
      ("KeyCacheSecretId", option_to_yojson string__to_yojson x.key_cache_secret_id);
      ("KeyCacheSecretIamArn", option_to_yojson string__to_yojson x.key_cache_secret_iam_arn);
      ("Krb5FileContents", option_to_yojson string__to_yojson x.krb5_file_contents);
    ]

let replication_instance_ipv6_address_list_to_yojson tree = list_to_yojson string__to_yojson tree

let replication_instance_private_ip_address_list_to_yojson tree =
  list_to_yojson string__to_yojson tree

let replication_instance_public_ip_address_list_to_yojson tree =
  list_to_yojson string__to_yojson tree

let replication_instance_class_to_yojson = string_to_yojson

let replication_pending_modified_values_to_yojson (x : replication_pending_modified_values) =
  assoc_to_yojson
    [
      ( "ReplicationInstanceClass",
        option_to_yojson replication_instance_class_to_yojson x.replication_instance_class );
      ("AllocatedStorage", option_to_yojson integer_optional_to_yojson x.allocated_storage);
      ("MultiAZ", option_to_yojson boolean_optional_to_yojson x.multi_a_z);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
    ]

let availability_zone_to_yojson (x : availability_zone) =
  assoc_to_yojson [ ("Name", option_to_yojson string__to_yojson x.name) ]

let subnet_to_yojson (x : subnet) =
  assoc_to_yojson
    [
      ("SubnetIdentifier", option_to_yojson string__to_yojson x.subnet_identifier);
      ( "SubnetAvailabilityZone",
        option_to_yojson availability_zone_to_yojson x.subnet_availability_zone );
      ("SubnetStatus", option_to_yojson string__to_yojson x.subnet_status);
    ]

let subnet_list_to_yojson tree = list_to_yojson subnet_to_yojson tree

let replication_subnet_group_to_yojson (x : replication_subnet_group) =
  assoc_to_yojson
    [
      ( "ReplicationSubnetGroupIdentifier",
        option_to_yojson string__to_yojson x.replication_subnet_group_identifier );
      ( "ReplicationSubnetGroupDescription",
        option_to_yojson string__to_yojson x.replication_subnet_group_description );
      ("VpcId", option_to_yojson string__to_yojson x.vpc_id);
      ("SubnetGroupStatus", option_to_yojson string__to_yojson x.subnet_group_status);
      ("Subnets", option_to_yojson subnet_list_to_yojson x.subnets);
      ("SupportedNetworkTypes", option_to_yojson string_list_to_yojson x.supported_network_types);
      ("IsReadOnly", option_to_yojson boolean_optional_to_yojson x.is_read_only);
    ]

let vpc_security_group_membership_to_yojson (x : vpc_security_group_membership) =
  assoc_to_yojson
    [
      ("VpcSecurityGroupId", option_to_yojson string__to_yojson x.vpc_security_group_id);
      ("Status", option_to_yojson string__to_yojson x.status);
    ]

let vpc_security_group_membership_list_to_yojson tree =
  list_to_yojson vpc_security_group_membership_to_yojson tree

let replication_instance_to_yojson (x : replication_instance) =
  assoc_to_yojson
    [
      ( "ReplicationInstanceIdentifier",
        option_to_yojson string__to_yojson x.replication_instance_identifier );
      ( "ReplicationInstanceClass",
        option_to_yojson replication_instance_class_to_yojson x.replication_instance_class );
      ("ReplicationInstanceStatus", option_to_yojson string__to_yojson x.replication_instance_status);
      ("AllocatedStorage", option_to_yojson integer_to_yojson x.allocated_storage);
      ("InstanceCreateTime", option_to_yojson t_stamp_to_yojson x.instance_create_time);
      ( "VpcSecurityGroups",
        option_to_yojson vpc_security_group_membership_list_to_yojson x.vpc_security_groups );
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ( "ReplicationSubnetGroup",
        option_to_yojson replication_subnet_group_to_yojson x.replication_subnet_group );
      ( "PreferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ( "PendingModifiedValues",
        option_to_yojson replication_pending_modified_values_to_yojson x.pending_modified_values );
      ("MultiAZ", option_to_yojson boolean__to_yojson x.multi_a_z);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("AutoMinorVersionUpgrade", option_to_yojson boolean__to_yojson x.auto_minor_version_upgrade);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
      ( "ReplicationInstancePublicIpAddress",
        option_to_yojson string__to_yojson x.replication_instance_public_ip_address );
      ( "ReplicationInstancePrivateIpAddress",
        option_to_yojson string__to_yojson x.replication_instance_private_ip_address );
      ( "ReplicationInstancePublicIpAddresses",
        option_to_yojson replication_instance_public_ip_address_list_to_yojson
          x.replication_instance_public_ip_addresses );
      ( "ReplicationInstancePrivateIpAddresses",
        option_to_yojson replication_instance_private_ip_address_list_to_yojson
          x.replication_instance_private_ip_addresses );
      ( "ReplicationInstanceIpv6Addresses",
        option_to_yojson replication_instance_ipv6_address_list_to_yojson
          x.replication_instance_ipv6_addresses );
      ("PubliclyAccessible", option_to_yojson boolean__to_yojson x.publicly_accessible);
      ("SecondaryAvailabilityZone", option_to_yojson string__to_yojson x.secondary_availability_zone);
      ("FreeUntil", option_to_yojson t_stamp_to_yojson x.free_until);
      ("DnsNameServers", option_to_yojson string__to_yojson x.dns_name_servers);
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ( "KerberosAuthenticationSettings",
        option_to_yojson kerberos_authentication_settings_to_yojson
          x.kerberos_authentication_settings );
    ]

let reboot_replication_instance_response_to_yojson (x : reboot_replication_instance_response) =
  assoc_to_yojson
    [
      ("ReplicationInstance", option_to_yojson replication_instance_to_yojson x.replication_instance);
    ]

let reboot_replication_instance_message_to_yojson (x : reboot_replication_instance_message) =
  assoc_to_yojson
    [
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
      ("ForceFailover", option_to_yojson boolean_optional_to_yojson x.force_failover);
      ("ForcePlannedFailover", option_to_yojson boolean_optional_to_yojson x.force_planned_failover);
    ]

let move_replication_task_response_to_yojson (x : move_replication_task_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let move_replication_task_message_to_yojson (x : move_replication_task_message) =
  assoc_to_yojson
    [
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
      ("TargetReplicationInstanceArn", Some (string__to_yojson x.target_replication_instance_arn));
    ]

let modify_replication_task_response_to_yojson (x : modify_replication_task_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let modify_replication_task_message_to_yojson (x : modify_replication_task_message) =
  assoc_to_yojson
    [
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
      ("ReplicationTaskIdentifier", option_to_yojson string__to_yojson x.replication_task_identifier);
      ("MigrationType", option_to_yojson migration_type_value_to_yojson x.migration_type);
      ("TableMappings", option_to_yojson string__to_yojson x.table_mappings);
      ("ReplicationTaskSettings", option_to_yojson string__to_yojson x.replication_task_settings);
      ("CdcStartTime", option_to_yojson t_stamp_to_yojson x.cdc_start_time);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
      ("TaskData", option_to_yojson string__to_yojson x.task_data);
    ]

let subnet_already_in_use_to_yojson (x : subnet_already_in_use) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let replication_subnet_group_does_not_cover_enough_a_zs_to_yojson
    (x : replication_subnet_group_does_not_cover_enough_a_zs) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_subnet_to_yojson (x : invalid_subnet) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let modify_replication_subnet_group_response_to_yojson
    (x : modify_replication_subnet_group_response) =
  assoc_to_yojson
    [
      ( "ReplicationSubnetGroup",
        option_to_yojson replication_subnet_group_to_yojson x.replication_subnet_group );
    ]

let subnet_identifier_list_to_yojson tree = list_to_yojson string__to_yojson tree

let modify_replication_subnet_group_message_to_yojson (x : modify_replication_subnet_group_message)
    =
  assoc_to_yojson
    [
      ( "ReplicationSubnetGroupIdentifier",
        Some (string__to_yojson x.replication_subnet_group_identifier) );
      ( "ReplicationSubnetGroupDescription",
        option_to_yojson string__to_yojson x.replication_subnet_group_description );
      ("SubnetIds", Some (subnet_identifier_list_to_yojson x.subnet_ids));
    ]

let upgrade_dependency_failure_fault_to_yojson (x : upgrade_dependency_failure_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let storage_quota_exceeded_fault_to_yojson (x : storage_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let insufficient_resource_capacity_fault_to_yojson (x : insufficient_resource_capacity_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let modify_replication_instance_response_to_yojson (x : modify_replication_instance_response) =
  assoc_to_yojson
    [
      ("ReplicationInstance", option_to_yojson replication_instance_to_yojson x.replication_instance);
    ]

let vpc_security_group_id_list_to_yojson tree = list_to_yojson string__to_yojson tree

let modify_replication_instance_message_to_yojson (x : modify_replication_instance_message) =
  assoc_to_yojson
    [
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
      ("AllocatedStorage", option_to_yojson integer_optional_to_yojson x.allocated_storage);
      ("ApplyImmediately", option_to_yojson boolean__to_yojson x.apply_immediately);
      ( "ReplicationInstanceClass",
        option_to_yojson replication_instance_class_to_yojson x.replication_instance_class );
      ( "VpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "PreferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ("MultiAZ", option_to_yojson boolean_optional_to_yojson x.multi_a_z);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("AllowMajorVersionUpgrade", option_to_yojson boolean__to_yojson x.allow_major_version_upgrade);
      ( "AutoMinorVersionUpgrade",
        option_to_yojson boolean_optional_to_yojson x.auto_minor_version_upgrade );
      ( "ReplicationInstanceIdentifier",
        option_to_yojson string__to_yojson x.replication_instance_identifier );
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ( "KerberosAuthenticationSettings",
        option_to_yojson kerberos_authentication_settings_to_yojson
          x.kerberos_authentication_settings );
    ]

let compute_config_to_yojson (x : compute_config) =
  assoc_to_yojson
    [
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("DnsNameServers", option_to_yojson string__to_yojson x.dns_name_servers);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("MaxCapacityUnits", option_to_yojson integer_optional_to_yojson x.max_capacity_units);
      ("MinCapacityUnits", option_to_yojson integer_optional_to_yojson x.min_capacity_units);
      ("MultiAZ", option_to_yojson boolean_optional_to_yojson x.multi_a_z);
      ( "PreferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ("ReplicationSubnetGroupId", option_to_yojson string__to_yojson x.replication_subnet_group_id);
      ("VpcSecurityGroupIds", option_to_yojson string_list_to_yojson x.vpc_security_group_ids);
    ]

let replication_config_to_yojson (x : replication_config) =
  assoc_to_yojson
    [
      ( "ReplicationConfigIdentifier",
        option_to_yojson string__to_yojson x.replication_config_identifier );
      ("ReplicationConfigArn", option_to_yojson string__to_yojson x.replication_config_arn);
      ("SourceEndpointArn", option_to_yojson string__to_yojson x.source_endpoint_arn);
      ("TargetEndpointArn", option_to_yojson string__to_yojson x.target_endpoint_arn);
      ("ReplicationType", option_to_yojson migration_type_value_to_yojson x.replication_type);
      ("ComputeConfig", option_to_yojson compute_config_to_yojson x.compute_config);
      ("ReplicationSettings", option_to_yojson string__to_yojson x.replication_settings);
      ("SupplementalSettings", option_to_yojson string__to_yojson x.supplemental_settings);
      ("TableMappings", option_to_yojson string__to_yojson x.table_mappings);
      ( "ReplicationConfigCreateTime",
        option_to_yojson t_stamp_to_yojson x.replication_config_create_time );
      ( "ReplicationConfigUpdateTime",
        option_to_yojson t_stamp_to_yojson x.replication_config_update_time );
      ("IsReadOnly", option_to_yojson boolean_optional_to_yojson x.is_read_only);
    ]

let modify_replication_config_response_to_yojson (x : modify_replication_config_response) =
  assoc_to_yojson
    [ ("ReplicationConfig", option_to_yojson replication_config_to_yojson x.replication_config) ]

let modify_replication_config_message_to_yojson (x : modify_replication_config_message) =
  assoc_to_yojson
    [
      ("ReplicationConfigArn", Some (string__to_yojson x.replication_config_arn));
      ( "ReplicationConfigIdentifier",
        option_to_yojson string__to_yojson x.replication_config_identifier );
      ("ReplicationType", option_to_yojson migration_type_value_to_yojson x.replication_type);
      ("TableMappings", option_to_yojson string__to_yojson x.table_mappings);
      ("ReplicationSettings", option_to_yojson string__to_yojson x.replication_settings);
      ("SupplementalSettings", option_to_yojson string__to_yojson x.supplemental_settings);
      ("ComputeConfig", option_to_yojson compute_config_to_yojson x.compute_config);
      ("SourceEndpointArn", option_to_yojson string__to_yojson x.source_endpoint_arn);
      ("TargetEndpointArn", option_to_yojson string__to_yojson x.target_endpoint_arn);
    ]

let sc_application_attributes_to_yojson (x : sc_application_attributes) =
  assoc_to_yojson
    [
      ("S3BucketPath", option_to_yojson string__to_yojson x.s3_bucket_path);
      ("S3BucketRoleArn", option_to_yojson string__to_yojson x.s3_bucket_role_arn);
    ]

let data_provider_descriptor_to_yojson (x : data_provider_descriptor) =
  assoc_to_yojson
    [
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("DataProviderName", option_to_yojson string__to_yojson x.data_provider_name);
      ("DataProviderArn", option_to_yojson string__to_yojson x.data_provider_arn);
    ]

let data_provider_descriptor_list_to_yojson tree =
  list_to_yojson data_provider_descriptor_to_yojson tree

let migration_project_to_yojson (x : migration_project) =
  assoc_to_yojson
    [
      ("MigrationProjectName", option_to_yojson string__to_yojson x.migration_project_name);
      ("MigrationProjectArn", option_to_yojson string__to_yojson x.migration_project_arn);
      ( "MigrationProjectCreationTime",
        option_to_yojson iso8601_date_time_to_yojson x.migration_project_creation_time );
      ( "SourceDataProviderDescriptors",
        option_to_yojson data_provider_descriptor_list_to_yojson x.source_data_provider_descriptors
      );
      ( "TargetDataProviderDescriptors",
        option_to_yojson data_provider_descriptor_list_to_yojson x.target_data_provider_descriptors
      );
      ("InstanceProfileArn", option_to_yojson string__to_yojson x.instance_profile_arn);
      ("InstanceProfileName", option_to_yojson string__to_yojson x.instance_profile_name);
      ("TransformationRules", option_to_yojson string__to_yojson x.transformation_rules);
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "SchemaConversionApplicationAttributes",
        option_to_yojson sc_application_attributes_to_yojson
          x.schema_conversion_application_attributes );
    ]

let modify_migration_project_response_to_yojson (x : modify_migration_project_response) =
  assoc_to_yojson
    [ ("MigrationProject", option_to_yojson migration_project_to_yojson x.migration_project) ]

let data_provider_descriptor_definition_to_yojson (x : data_provider_descriptor_definition) =
  assoc_to_yojson
    [
      ("DataProviderIdentifier", Some (string__to_yojson x.data_provider_identifier));
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
    ]

let data_provider_descriptor_definition_list_to_yojson tree =
  list_to_yojson data_provider_descriptor_definition_to_yojson tree

let modify_migration_project_message_to_yojson (x : modify_migration_project_message) =
  assoc_to_yojson
    [
      ("MigrationProjectIdentifier", Some (string__to_yojson x.migration_project_identifier));
      ("MigrationProjectName", option_to_yojson string__to_yojson x.migration_project_name);
      ( "SourceDataProviderDescriptors",
        option_to_yojson data_provider_descriptor_definition_list_to_yojson
          x.source_data_provider_descriptors );
      ( "TargetDataProviderDescriptors",
        option_to_yojson data_provider_descriptor_definition_list_to_yojson
          x.target_data_provider_descriptors );
      ("InstanceProfileIdentifier", option_to_yojson string__to_yojson x.instance_profile_identifier);
      ("TransformationRules", option_to_yojson string__to_yojson x.transformation_rules);
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "SchemaConversionApplicationAttributes",
        option_to_yojson sc_application_attributes_to_yojson
          x.schema_conversion_application_attributes );
    ]

let instance_profile_to_yojson (x : instance_profile) =
  assoc_to_yojson
    [
      ("InstanceProfileArn", option_to_yojson string__to_yojson x.instance_profile_arn);
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("KmsKeyArn", option_to_yojson string__to_yojson x.kms_key_arn);
      ("PubliclyAccessible", option_to_yojson boolean_optional_to_yojson x.publicly_accessible);
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ("InstanceProfileName", option_to_yojson string__to_yojson x.instance_profile_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "InstanceProfileCreationTime",
        option_to_yojson iso8601_date_time_to_yojson x.instance_profile_creation_time );
      ("SubnetGroupIdentifier", option_to_yojson string__to_yojson x.subnet_group_identifier);
      ("VpcSecurityGroups", option_to_yojson string_list_to_yojson x.vpc_security_groups);
    ]

let modify_instance_profile_response_to_yojson (x : modify_instance_profile_response) =
  assoc_to_yojson
    [ ("InstanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile) ]

let modify_instance_profile_message_to_yojson (x : modify_instance_profile_message) =
  assoc_to_yojson
    [
      ("InstanceProfileIdentifier", Some (string__to_yojson x.instance_profile_identifier));
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("KmsKeyArn", option_to_yojson string__to_yojson x.kms_key_arn);
      ("PubliclyAccessible", option_to_yojson boolean_optional_to_yojson x.publicly_accessible);
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ("InstanceProfileName", option_to_yojson string__to_yojson x.instance_profile_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("SubnetGroupIdentifier", option_to_yojson string__to_yojson x.subnet_group_identifier);
      ("VpcSecurityGroups", option_to_yojson string_list_to_yojson x.vpc_security_groups);
    ]

let sns_no_authorization_fault_to_yojson (x : sns_no_authorization_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let sns_invalid_topic_fault_to_yojson (x : sns_invalid_topic_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_throttling_fault_to_yojson (x : kms_throttling_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let event_categories_list_to_yojson tree = list_to_yojson string__to_yojson tree
let source_ids_list_to_yojson tree = list_to_yojson string__to_yojson tree

let event_subscription_to_yojson (x : event_subscription) =
  assoc_to_yojson
    [
      ("CustomerAwsId", option_to_yojson string__to_yojson x.customer_aws_id);
      ("CustSubscriptionId", option_to_yojson string__to_yojson x.cust_subscription_id);
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("SubscriptionCreationTime", option_to_yojson string__to_yojson x.subscription_creation_time);
      ("SourceType", option_to_yojson string__to_yojson x.source_type);
      ("SourceIdsList", option_to_yojson source_ids_list_to_yojson x.source_ids_list);
      ( "EventCategoriesList",
        option_to_yojson event_categories_list_to_yojson x.event_categories_list );
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
    ]

let modify_event_subscription_response_to_yojson (x : modify_event_subscription_response) =
  assoc_to_yojson
    [ ("EventSubscription", option_to_yojson event_subscription_to_yojson x.event_subscription) ]

let modify_event_subscription_message_to_yojson (x : modify_event_subscription_message) =
  assoc_to_yojson
    [
      ("SubscriptionName", Some (string__to_yojson x.subscription_name));
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("SourceType", option_to_yojson string__to_yojson x.source_type);
      ("EventCategories", option_to_yojson event_categories_list_to_yojson x.event_categories);
      ("Enabled", option_to_yojson boolean_optional_to_yojson x.enabled);
    ]

let lakehouse_settings_to_yojson (x : lakehouse_settings) =
  assoc_to_yojson [ ("Arn", Some (string__to_yojson x.arn)) ]

let timestream_settings_to_yojson (x : timestream_settings) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (string__to_yojson x.database_name));
      ("MemoryDuration", Some (integer_optional_to_yojson x.memory_duration));
      ("MagneticDuration", Some (integer_optional_to_yojson x.magnetic_duration));
      ("CdcInsertsAndUpdates", option_to_yojson boolean_optional_to_yojson x.cdc_inserts_and_updates);
      ( "EnableMagneticStoreWrites",
        option_to_yojson boolean_optional_to_yojson x.enable_magnetic_store_writes );
    ]

let target_db_type_to_yojson (x : target_db_type) =
  match x with
  | SPECIFIC_DATABASE -> `String "specific-database"
  | MULTIPLE_DATABASES -> `String "multiple-databases"

let gcp_my_sql_settings_to_yojson (x : gcp_my_sql_settings) =
  assoc_to_yojson
    [
      ("AfterConnectScript", option_to_yojson string__to_yojson x.after_connect_script);
      ( "CleanSourceMetadataOnMismatch",
        option_to_yojson boolean_optional_to_yojson x.clean_source_metadata_on_mismatch );
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("EventsPollInterval", option_to_yojson integer_optional_to_yojson x.events_poll_interval);
      ("TargetDbType", option_to_yojson target_db_type_to_yojson x.target_db_type);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("ParallelLoadThreads", option_to_yojson integer_optional_to_yojson x.parallel_load_threads);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("ServerTimezone", option_to_yojson string__to_yojson x.server_timezone);
      ("Username", option_to_yojson string__to_yojson x.username);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
    ]

let redis_auth_type_value_to_yojson (x : redis_auth_type_value) =
  match x with
  | NONE -> `String "none"
  | AUTH_ROLE -> `String "auth-role"
  | AUTH_TOKEN -> `String "auth-token"

let ssl_security_protocol_value_to_yojson (x : ssl_security_protocol_value) =
  match x with PLAINTEXT -> `String "plaintext" | SSL_ENCRYPTION -> `String "ssl-encryption"

let redis_settings_to_yojson (x : redis_settings) =
  assoc_to_yojson
    [
      ("ServerName", Some (string__to_yojson x.server_name));
      ("Port", Some (integer_to_yojson x.port));
      ( "SslSecurityProtocol",
        option_to_yojson ssl_security_protocol_value_to_yojson x.ssl_security_protocol );
      ("AuthType", option_to_yojson redis_auth_type_value_to_yojson x.auth_type);
      ("AuthUserName", option_to_yojson string__to_yojson x.auth_user_name);
      ("AuthPassword", option_to_yojson secret_string_to_yojson x.auth_password);
      ("SslCaCertificateArn", option_to_yojson string__to_yojson x.ssl_ca_certificate_arn);
    ]

let nesting_level_value_to_yojson (x : nesting_level_value) =
  match x with NONE -> `String "none" | ONE -> `String "one"

let doc_db_settings_to_yojson (x : doc_db_settings) =
  assoc_to_yojson
    [
      ("Username", option_to_yojson string__to_yojson x.username);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("NestingLevel", option_to_yojson nesting_level_value_to_yojson x.nesting_level);
      ("ExtractDocId", option_to_yojson boolean_optional_to_yojson x.extract_doc_id);
      ("DocsToInvestigate", option_to_yojson integer_optional_to_yojson x.docs_to_investigate);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ("UseUpdateLookUp", option_to_yojson boolean_optional_to_yojson x.use_update_look_up);
      ( "ReplicateShardCollections",
        option_to_yojson boolean_optional_to_yojson x.replicate_shard_collections );
    ]

let ibm_db2_settings_to_yojson (x : ibm_db2_settings) =
  assoc_to_yojson
    [
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ( "SetDataCaptureChanges",
        option_to_yojson boolean_optional_to_yojson x.set_data_capture_changes );
      ("CurrentLsn", option_to_yojson string__to_yojson x.current_lsn);
      ("MaxKBytesPerRead", option_to_yojson integer_optional_to_yojson x.max_k_bytes_per_read);
      ("Username", option_to_yojson string__to_yojson x.username);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ("LoadTimeout", option_to_yojson integer_optional_to_yojson x.load_timeout);
      ("WriteBufferSize", option_to_yojson integer_optional_to_yojson x.write_buffer_size);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("KeepCsvFiles", option_to_yojson boolean_optional_to_yojson x.keep_csv_files);
    ]

let sql_server_authentication_method_to_yojson (x : sql_server_authentication_method) =
  match x with Password -> `String "password" | Kerberos -> `String "kerberos"

let tlog_access_mode_to_yojson (x : tlog_access_mode) =
  match x with
  | BackupOnly -> `String "BackupOnly"
  | PreferBackup -> `String "PreferBackup"
  | PreferTlog -> `String "PreferTlog"
  | TlogOnly -> `String "TlogOnly"

let safeguard_policy_to_yojson (x : safeguard_policy) =
  match x with
  | RELY_ON_SQL_SERVER_REPLICATION_AGENT -> `String "rely-on-sql-server-replication-agent"
  | EXCLUSIVE_AUTOMATIC_TRUNCATION -> `String "exclusive-automatic-truncation"
  | SHARED_AUTOMATIC_TRUNCATION -> `String "shared-automatic-truncation"

let microsoft_sql_server_settings_to_yojson (x : microsoft_sql_server_settings) =
  assoc_to_yojson
    [
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("BcpPacketSize", option_to_yojson integer_optional_to_yojson x.bcp_packet_size);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("ControlTablesFileGroup", option_to_yojson string__to_yojson x.control_tables_file_group);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ( "QuerySingleAlwaysOnNode",
        option_to_yojson boolean_optional_to_yojson x.query_single_always_on_node );
      ("ReadBackupOnly", option_to_yojson boolean_optional_to_yojson x.read_backup_only);
      ("SafeguardPolicy", option_to_yojson safeguard_policy_to_yojson x.safeguard_policy);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("UseBcpFullLoad", option_to_yojson boolean_optional_to_yojson x.use_bcp_full_load);
      ( "UseThirdPartyBackupDevice",
        option_to_yojson boolean_optional_to_yojson x.use_third_party_backup_device );
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ("TrimSpaceInChar", option_to_yojson boolean_optional_to_yojson x.trim_space_in_char);
      ("TlogAccessMode", option_to_yojson tlog_access_mode_to_yojson x.tlog_access_mode);
      ("ForceLobLookup", option_to_yojson boolean_optional_to_yojson x.force_lob_lookup);
      ( "AuthenticationMethod",
        option_to_yojson sql_server_authentication_method_to_yojson x.authentication_method );
    ]

let sybase_settings_to_yojson (x : sybase_settings) =
  assoc_to_yojson
    [
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Username", option_to_yojson string__to_yojson x.username);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
    ]

let oracle_authentication_method_to_yojson (x : oracle_authentication_method) =
  match x with Password -> `String "password" | Kerberos -> `String "kerberos"

let char_length_semantics_to_yojson (x : char_length_semantics) =
  match x with DEFAULT -> `String "default" | CHAR -> `String "char" | BYTE -> `String "byte"

let integer_list_to_yojson tree = list_to_yojson integer_to_yojson tree

let oracle_settings_to_yojson (x : oracle_settings) =
  assoc_to_yojson
    [
      ( "AddSupplementalLogging",
        option_to_yojson boolean_optional_to_yojson x.add_supplemental_logging );
      ("ArchivedLogDestId", option_to_yojson integer_optional_to_yojson x.archived_log_dest_id);
      ( "AdditionalArchivedLogDestId",
        option_to_yojson integer_optional_to_yojson x.additional_archived_log_dest_id );
      ( "ExtraArchivedLogDestIds",
        option_to_yojson integer_list_to_yojson x.extra_archived_log_dest_ids );
      ( "AllowSelectNestedTables",
        option_to_yojson boolean_optional_to_yojson x.allow_select_nested_tables );
      ( "ParallelAsmReadThreads",
        option_to_yojson integer_optional_to_yojson x.parallel_asm_read_threads );
      ("ReadAheadBlocks", option_to_yojson integer_optional_to_yojson x.read_ahead_blocks);
      ( "AccessAlternateDirectly",
        option_to_yojson boolean_optional_to_yojson x.access_alternate_directly );
      ( "UseAlternateFolderForOnline",
        option_to_yojson boolean_optional_to_yojson x.use_alternate_folder_for_online );
      ("OraclePathPrefix", option_to_yojson string__to_yojson x.oracle_path_prefix);
      ("UsePathPrefix", option_to_yojson string__to_yojson x.use_path_prefix);
      ("ReplacePathPrefix", option_to_yojson boolean_optional_to_yojson x.replace_path_prefix);
      ( "EnableHomogenousTablespace",
        option_to_yojson boolean_optional_to_yojson x.enable_homogenous_tablespace );
      ("DirectPathNoLog", option_to_yojson boolean_optional_to_yojson x.direct_path_no_log);
      ("ArchivedLogsOnly", option_to_yojson boolean_optional_to_yojson x.archived_logs_only);
      ("AsmPassword", option_to_yojson secret_string_to_yojson x.asm_password);
      ("AsmServer", option_to_yojson string__to_yojson x.asm_server);
      ("AsmUser", option_to_yojson string__to_yojson x.asm_user);
      ( "CharLengthSemantics",
        option_to_yojson char_length_semantics_to_yojson x.char_length_semantics );
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ( "DirectPathParallelLoad",
        option_to_yojson boolean_optional_to_yojson x.direct_path_parallel_load );
      ( "FailTasksOnLobTruncation",
        option_to_yojson boolean_optional_to_yojson x.fail_tasks_on_lob_truncation );
      ("NumberDatatypeScale", option_to_yojson integer_optional_to_yojson x.number_datatype_scale);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ReadTableSpaceName", option_to_yojson boolean_optional_to_yojson x.read_table_space_name);
      ("RetryInterval", option_to_yojson integer_optional_to_yojson x.retry_interval);
      ("SecurityDbEncryption", option_to_yojson secret_string_to_yojson x.security_db_encryption);
      ("SecurityDbEncryptionName", option_to_yojson string__to_yojson x.security_db_encryption_name);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ( "SpatialDataOptionToGeoJsonFunctionName",
        option_to_yojson string__to_yojson x.spatial_data_option_to_geo_json_function_name );
      ("StandbyDelayTime", option_to_yojson integer_optional_to_yojson x.standby_delay_time);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("UseBFile", option_to_yojson boolean_optional_to_yojson x.use_b_file);
      ( "UseDirectPathFullLoad",
        option_to_yojson boolean_optional_to_yojson x.use_direct_path_full_load );
      ("UseLogminerReader", option_to_yojson boolean_optional_to_yojson x.use_logminer_reader);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerOracleAsmAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_oracle_asm_access_role_arn );
      ( "SecretsManagerOracleAsmSecretId",
        option_to_yojson string__to_yojson x.secrets_manager_oracle_asm_secret_id );
      ("TrimSpaceInChar", option_to_yojson boolean_optional_to_yojson x.trim_space_in_char);
      ( "ConvertTimestampWithZoneToUTC",
        option_to_yojson boolean_optional_to_yojson x.convert_timestamp_with_zone_to_ut_c );
      ( "OpenTransactionWindow",
        option_to_yojson integer_optional_to_yojson x.open_transaction_window );
      ( "AuthenticationMethod",
        option_to_yojson oracle_authentication_method_to_yojson x.authentication_method );
    ]

let my_sql_authentication_method_to_yojson (x : my_sql_authentication_method) =
  match x with Password -> `String "password" | IAM -> `String "iam"

let my_sql_settings_to_yojson (x : my_sql_settings) =
  assoc_to_yojson
    [
      ("AfterConnectScript", option_to_yojson string__to_yojson x.after_connect_script);
      ( "CleanSourceMetadataOnMismatch",
        option_to_yojson boolean_optional_to_yojson x.clean_source_metadata_on_mismatch );
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("EventsPollInterval", option_to_yojson integer_optional_to_yojson x.events_poll_interval);
      ("TargetDbType", option_to_yojson target_db_type_to_yojson x.target_db_type);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("ParallelLoadThreads", option_to_yojson integer_optional_to_yojson x.parallel_load_threads);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("ServerTimezone", option_to_yojson string__to_yojson x.server_timezone);
      ("Username", option_to_yojson string__to_yojson x.username);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ("ExecuteTimeout", option_to_yojson integer_optional_to_yojson x.execute_timeout);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ( "AuthenticationMethod",
        option_to_yojson my_sql_authentication_method_to_yojson x.authentication_method );
    ]

let postgre_sql_authentication_method_to_yojson (x : postgre_sql_authentication_method) =
  match x with Password -> `String "password" | IAM -> `String "iam"

let database_mode_to_yojson (x : database_mode) =
  match x with DEFAULT -> `String "default" | BABELFISH -> `String "babelfish"

let long_varchar_mapping_type_to_yojson (x : long_varchar_mapping_type) =
  match x with WSTRING -> `String "wstring" | CLOB -> `String "clob" | NCLOB -> `String "nclob"

let plugin_name_value_to_yojson (x : plugin_name_value) =
  match x with
  | NO_PREFERENCE -> `String "no-preference"
  | TEST_DECODING -> `String "test-decoding"
  | PGLOGICAL -> `String "pglogical"

let postgre_sql_settings_to_yojson (x : postgre_sql_settings) =
  assoc_to_yojson
    [
      ("AfterConnectScript", option_to_yojson string__to_yojson x.after_connect_script);
      ("CaptureDdls", option_to_yojson boolean_optional_to_yojson x.capture_ddls);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("DdlArtifactsSchema", option_to_yojson string__to_yojson x.ddl_artifacts_schema);
      ("ExecuteTimeout", option_to_yojson integer_optional_to_yojson x.execute_timeout);
      ( "FailTasksOnLobTruncation",
        option_to_yojson boolean_optional_to_yojson x.fail_tasks_on_lob_truncation );
      ("HeartbeatEnable", option_to_yojson boolean_optional_to_yojson x.heartbeat_enable);
      ("HeartbeatSchema", option_to_yojson string__to_yojson x.heartbeat_schema);
      ("HeartbeatFrequency", option_to_yojson integer_optional_to_yojson x.heartbeat_frequency);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("SlotName", option_to_yojson string__to_yojson x.slot_name);
      ("PluginName", option_to_yojson plugin_name_value_to_yojson x.plugin_name);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ("TrimSpaceInChar", option_to_yojson boolean_optional_to_yojson x.trim_space_in_char);
      ("MapBooleanAsBoolean", option_to_yojson boolean_optional_to_yojson x.map_boolean_as_boolean);
      ("MapJsonbAsClob", option_to_yojson boolean_optional_to_yojson x.map_jsonb_as_clob);
      ( "MapLongVarcharAs",
        option_to_yojson long_varchar_mapping_type_to_yojson x.map_long_varchar_as );
      ("DatabaseMode", option_to_yojson database_mode_to_yojson x.database_mode);
      ("BabelfishDatabaseName", option_to_yojson string__to_yojson x.babelfish_database_name);
      ( "DisableUnicodeSourceFilter",
        option_to_yojson boolean_optional_to_yojson x.disable_unicode_source_filter );
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ( "AuthenticationMethod",
        option_to_yojson postgre_sql_authentication_method_to_yojson x.authentication_method );
    ]

let encryption_mode_value_to_yojson (x : encryption_mode_value) =
  match x with SSE_S3 -> `String "sse-s3" | SSE_KMS -> `String "sse-kms"

let redshift_settings_to_yojson (x : redshift_settings) =
  assoc_to_yojson
    [
      ("AcceptAnyDate", option_to_yojson boolean_optional_to_yojson x.accept_any_date);
      ("AfterConnectScript", option_to_yojson string__to_yojson x.after_connect_script);
      ("BucketFolder", option_to_yojson string__to_yojson x.bucket_folder);
      ("BucketName", option_to_yojson string__to_yojson x.bucket_name);
      ("CaseSensitiveNames", option_to_yojson boolean_optional_to_yojson x.case_sensitive_names);
      ("CompUpdate", option_to_yojson boolean_optional_to_yojson x.comp_update);
      ("ConnectionTimeout", option_to_yojson integer_optional_to_yojson x.connection_timeout);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("DateFormat", option_to_yojson string__to_yojson x.date_format);
      ("EmptyAsNull", option_to_yojson boolean_optional_to_yojson x.empty_as_null);
      ("EncryptionMode", option_to_yojson encryption_mode_value_to_yojson x.encryption_mode);
      ("ExplicitIds", option_to_yojson boolean_optional_to_yojson x.explicit_ids);
      ( "FileTransferUploadStreams",
        option_to_yojson integer_optional_to_yojson x.file_transfer_upload_streams );
      ("LoadTimeout", option_to_yojson integer_optional_to_yojson x.load_timeout);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("RemoveQuotes", option_to_yojson boolean_optional_to_yojson x.remove_quotes);
      ("ReplaceInvalidChars", option_to_yojson string__to_yojson x.replace_invalid_chars);
      ("ReplaceChars", option_to_yojson string__to_yojson x.replace_chars);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ( "ServerSideEncryptionKmsKeyId",
        option_to_yojson string__to_yojson x.server_side_encryption_kms_key_id );
      ("TimeFormat", option_to_yojson string__to_yojson x.time_format);
      ("TrimBlanks", option_to_yojson boolean_optional_to_yojson x.trim_blanks);
      ("TruncateColumns", option_to_yojson boolean_optional_to_yojson x.truncate_columns);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("WriteBufferSize", option_to_yojson integer_optional_to_yojson x.write_buffer_size);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ("MapBooleanAsBoolean", option_to_yojson boolean_optional_to_yojson x.map_boolean_as_boolean);
    ]

let neptune_settings_to_yojson (x : neptune_settings) =
  assoc_to_yojson
    [
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("S3BucketName", Some (string__to_yojson x.s3_bucket_name));
      ("S3BucketFolder", Some (string__to_yojson x.s3_bucket_folder));
      ("ErrorRetryDuration", option_to_yojson integer_optional_to_yojson x.error_retry_duration);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("MaxRetryCount", option_to_yojson integer_optional_to_yojson x.max_retry_count);
      ("IamAuthEnabled", option_to_yojson boolean_optional_to_yojson x.iam_auth_enabled);
    ]

let elasticsearch_settings_to_yojson (x : elasticsearch_settings) =
  assoc_to_yojson
    [
      ("ServiceAccessRoleArn", Some (string__to_yojson x.service_access_role_arn));
      ("EndpointUri", Some (string__to_yojson x.endpoint_uri));
      ( "FullLoadErrorPercentage",
        option_to_yojson integer_optional_to_yojson x.full_load_error_percentage );
      ("ErrorRetryDuration", option_to_yojson integer_optional_to_yojson x.error_retry_duration);
      ("UseNewMappingType", option_to_yojson boolean_optional_to_yojson x.use_new_mapping_type);
    ]

let kafka_ssl_endpoint_identification_algorithm_to_yojson
    (x : kafka_ssl_endpoint_identification_algorithm) =
  match x with NONE -> `String "none" | HTTPS -> `String "https"

let kafka_sasl_mechanism_to_yojson (x : kafka_sasl_mechanism) =
  match x with SCRAM_SHA_512 -> `String "scram-sha-512" | PLAIN -> `String "plain"

let kafka_security_protocol_to_yojson (x : kafka_security_protocol) =
  match x with
  | PLAINTEXT -> `String "plaintext"
  | SSL_AUTHENTICATION -> `String "ssl-authentication"
  | SSL_ENCRYPTION -> `String "ssl-encryption"
  | SASL_SSL -> `String "sasl-ssl"

let message_format_value_to_yojson (x : message_format_value) =
  match x with JSON -> `String "json" | JSON_UNFORMATTED -> `String "json-unformatted"

let kafka_settings_to_yojson (x : kafka_settings) =
  assoc_to_yojson
    [
      ("Broker", option_to_yojson string__to_yojson x.broker);
      ("Topic", option_to_yojson string__to_yojson x.topic);
      ("MessageFormat", option_to_yojson message_format_value_to_yojson x.message_format);
      ( "IncludeTransactionDetails",
        option_to_yojson boolean_optional_to_yojson x.include_transaction_details );
      ( "IncludePartitionValue",
        option_to_yojson boolean_optional_to_yojson x.include_partition_value );
      ( "PartitionIncludeSchemaTable",
        option_to_yojson boolean_optional_to_yojson x.partition_include_schema_table );
      ( "IncludeTableAlterOperations",
        option_to_yojson boolean_optional_to_yojson x.include_table_alter_operations );
      ( "IncludeControlDetails",
        option_to_yojson boolean_optional_to_yojson x.include_control_details );
      ("MessageMaxBytes", option_to_yojson integer_optional_to_yojson x.message_max_bytes);
      ("IncludeNullAndEmpty", option_to_yojson boolean_optional_to_yojson x.include_null_and_empty);
      ("SecurityProtocol", option_to_yojson kafka_security_protocol_to_yojson x.security_protocol);
      ("SslClientCertificateArn", option_to_yojson string__to_yojson x.ssl_client_certificate_arn);
      ("SslClientKeyArn", option_to_yojson string__to_yojson x.ssl_client_key_arn);
      ("SslClientKeyPassword", option_to_yojson secret_string_to_yojson x.ssl_client_key_password);
      ("SslCaCertificateArn", option_to_yojson string__to_yojson x.ssl_ca_certificate_arn);
      ("SaslUsername", option_to_yojson string__to_yojson x.sasl_username);
      ("SaslPassword", option_to_yojson secret_string_to_yojson x.sasl_password);
      ("NoHexPrefix", option_to_yojson boolean_optional_to_yojson x.no_hex_prefix);
      ("SaslMechanism", option_to_yojson kafka_sasl_mechanism_to_yojson x.sasl_mechanism);
      ( "SslEndpointIdentificationAlgorithm",
        option_to_yojson kafka_ssl_endpoint_identification_algorithm_to_yojson
          x.ssl_endpoint_identification_algorithm );
      ("UseLargeIntegerValue", option_to_yojson boolean_optional_to_yojson x.use_large_integer_value);
    ]

let kinesis_settings_to_yojson (x : kinesis_settings) =
  assoc_to_yojson
    [
      ("StreamArn", option_to_yojson string__to_yojson x.stream_arn);
      ("MessageFormat", option_to_yojson message_format_value_to_yojson x.message_format);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ( "IncludeTransactionDetails",
        option_to_yojson boolean_optional_to_yojson x.include_transaction_details );
      ( "IncludePartitionValue",
        option_to_yojson boolean_optional_to_yojson x.include_partition_value );
      ( "PartitionIncludeSchemaTable",
        option_to_yojson boolean_optional_to_yojson x.partition_include_schema_table );
      ( "IncludeTableAlterOperations",
        option_to_yojson boolean_optional_to_yojson x.include_table_alter_operations );
      ( "IncludeControlDetails",
        option_to_yojson boolean_optional_to_yojson x.include_control_details );
      ("IncludeNullAndEmpty", option_to_yojson boolean_optional_to_yojson x.include_null_and_empty);
      ("NoHexPrefix", option_to_yojson boolean_optional_to_yojson x.no_hex_prefix);
      ("UseLargeIntegerValue", option_to_yojson boolean_optional_to_yojson x.use_large_integer_value);
    ]

let auth_mechanism_value_to_yojson (x : auth_mechanism_value) =
  match x with
  | DEFAULT -> `String "default"
  | MONGODB_CR -> `String "mongodb_cr"
  | SCRAM_SHA_1 -> `String "scram_sha_1"

let auth_type_value_to_yojson (x : auth_type_value) =
  match x with NO -> `String "no" | PASSWORD -> `String "password"

let mongo_db_settings_to_yojson (x : mongo_db_settings) =
  assoc_to_yojson
    [
      ("Username", option_to_yojson string__to_yojson x.username);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("AuthType", option_to_yojson auth_type_value_to_yojson x.auth_type);
      ("AuthMechanism", option_to_yojson auth_mechanism_value_to_yojson x.auth_mechanism);
      ("NestingLevel", option_to_yojson nesting_level_value_to_yojson x.nesting_level);
      ("ExtractDocId", option_to_yojson string__to_yojson x.extract_doc_id);
      ("DocsToInvestigate", option_to_yojson string__to_yojson x.docs_to_investigate);
      ("AuthSource", option_to_yojson string__to_yojson x.auth_source);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ("UseUpdateLookUp", option_to_yojson boolean_optional_to_yojson x.use_update_look_up);
      ( "ReplicateShardCollections",
        option_to_yojson boolean_optional_to_yojson x.replicate_shard_collections );
    ]

let dms_transfer_settings_to_yojson (x : dms_transfer_settings) =
  assoc_to_yojson
    [
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("BucketName", option_to_yojson string__to_yojson x.bucket_name);
    ]

let canned_acl_for_objects_value_to_yojson (x : canned_acl_for_objects_value) =
  match x with
  | NONE -> `String "none"
  | PRIVATE -> `String "private"
  | PUBLIC_READ -> `String "public-read"
  | PUBLIC_READ_WRITE -> `String "public-read-write"
  | AUTHENTICATED_READ -> `String "authenticated-read"
  | AWS_EXEC_READ -> `String "aws-exec-read"
  | BUCKET_OWNER_READ -> `String "bucket-owner-read"
  | BUCKET_OWNER_FULL_CONTROL -> `String "bucket-owner-full-control"

let date_partition_delimiter_value_to_yojson (x : date_partition_delimiter_value) =
  match x with
  | SLASH -> `String "SLASH"
  | UNDERSCORE -> `String "UNDERSCORE"
  | DASH -> `String "DASH"
  | NONE -> `String "NONE"

let date_partition_sequence_value_to_yojson (x : date_partition_sequence_value) =
  match x with
  | YYYYMMDD -> `String "YYYYMMDD"
  | YYYYMMDDHH -> `String "YYYYMMDDHH"
  | YYYYMM -> `String "YYYYMM"
  | MMYYYYDD -> `String "MMYYYYDD"
  | DDMMYYYY -> `String "DDMMYYYY"

let parquet_version_value_to_yojson (x : parquet_version_value) =
  match x with PARQUET_1_0 -> `String "parquet-1-0" | PARQUET_2_0 -> `String "parquet-2-0"

let encoding_type_value_to_yojson (x : encoding_type_value) =
  match x with
  | PLAIN -> `String "plain"
  | PLAIN_DICTIONARY -> `String "plain-dictionary"
  | RLE_DICTIONARY -> `String "rle-dictionary"

let data_format_value_to_yojson (x : data_format_value) =
  match x with CSV -> `String "csv" | PARQUET -> `String "parquet"

let compression_type_value_to_yojson (x : compression_type_value) =
  match x with NONE -> `String "none" | GZIP -> `String "gzip"

let s3_settings_to_yojson (x : s3_settings) =
  assoc_to_yojson
    [
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("ExternalTableDefinition", option_to_yojson string__to_yojson x.external_table_definition);
      ("CsvRowDelimiter", option_to_yojson string__to_yojson x.csv_row_delimiter);
      ("CsvDelimiter", option_to_yojson string__to_yojson x.csv_delimiter);
      ("BucketFolder", option_to_yojson string__to_yojson x.bucket_folder);
      ("BucketName", option_to_yojson string__to_yojson x.bucket_name);
      ("CompressionType", option_to_yojson compression_type_value_to_yojson x.compression_type);
      ("EncryptionMode", option_to_yojson encryption_mode_value_to_yojson x.encryption_mode);
      ( "ServerSideEncryptionKmsKeyId",
        option_to_yojson string__to_yojson x.server_side_encryption_kms_key_id );
      ("DataFormat", option_to_yojson data_format_value_to_yojson x.data_format);
      ("EncodingType", option_to_yojson encoding_type_value_to_yojson x.encoding_type);
      ("DictPageSizeLimit", option_to_yojson integer_optional_to_yojson x.dict_page_size_limit);
      ("RowGroupLength", option_to_yojson integer_optional_to_yojson x.row_group_length);
      ("DataPageSize", option_to_yojson integer_optional_to_yojson x.data_page_size);
      ("ParquetVersion", option_to_yojson parquet_version_value_to_yojson x.parquet_version);
      ("EnableStatistics", option_to_yojson boolean_optional_to_yojson x.enable_statistics);
      ( "IncludeOpForFullLoad",
        option_to_yojson boolean_optional_to_yojson x.include_op_for_full_load );
      ("CdcInsertsOnly", option_to_yojson boolean_optional_to_yojson x.cdc_inserts_only);
      ("TimestampColumnName", option_to_yojson string__to_yojson x.timestamp_column_name);
      ( "ParquetTimestampInMillisecond",
        option_to_yojson boolean_optional_to_yojson x.parquet_timestamp_in_millisecond );
      ("CdcInsertsAndUpdates", option_to_yojson boolean_optional_to_yojson x.cdc_inserts_and_updates);
      ("DatePartitionEnabled", option_to_yojson boolean_optional_to_yojson x.date_partition_enabled);
      ( "DatePartitionSequence",
        option_to_yojson date_partition_sequence_value_to_yojson x.date_partition_sequence );
      ( "DatePartitionDelimiter",
        option_to_yojson date_partition_delimiter_value_to_yojson x.date_partition_delimiter );
      ("UseCsvNoSupValue", option_to_yojson boolean_optional_to_yojson x.use_csv_no_sup_value);
      ("CsvNoSupValue", option_to_yojson string__to_yojson x.csv_no_sup_value);
      ("PreserveTransactions", option_to_yojson boolean_optional_to_yojson x.preserve_transactions);
      ("CdcPath", option_to_yojson string__to_yojson x.cdc_path);
      ( "UseTaskStartTimeForFullLoadTimestamp",
        option_to_yojson boolean_optional_to_yojson x.use_task_start_time_for_full_load_timestamp );
      ( "CannedAclForObjects",
        option_to_yojson canned_acl_for_objects_value_to_yojson x.canned_acl_for_objects );
      ("AddColumnName", option_to_yojson boolean_optional_to_yojson x.add_column_name);
      ("CdcMaxBatchInterval", option_to_yojson integer_optional_to_yojson x.cdc_max_batch_interval);
      ("CdcMinFileSize", option_to_yojson integer_optional_to_yojson x.cdc_min_file_size);
      ("CsvNullValue", option_to_yojson string__to_yojson x.csv_null_value);
      ("IgnoreHeaderRows", option_to_yojson integer_optional_to_yojson x.ignore_header_rows);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("Rfc4180", option_to_yojson boolean_optional_to_yojson x.rfc4180);
      ("DatePartitionTimezone", option_to_yojson string__to_yojson x.date_partition_timezone);
      ( "AddTrailingPaddingCharacter",
        option_to_yojson boolean_optional_to_yojson x.add_trailing_padding_character );
      ("ExpectedBucketOwner", option_to_yojson string__to_yojson x.expected_bucket_owner);
      ( "GlueCatalogGeneration",
        option_to_yojson boolean_optional_to_yojson x.glue_catalog_generation );
    ]

let dynamo_db_settings_to_yojson (x : dynamo_db_settings) =
  assoc_to_yojson [ ("ServiceAccessRoleArn", Some (string__to_yojson x.service_access_role_arn)) ]

let dms_ssl_mode_value_to_yojson (x : dms_ssl_mode_value) =
  match x with
  | NONE -> `String "none"
  | REQUIRE -> `String "require"
  | VERIFY_CA -> `String "verify-ca"
  | VERIFY_FULL -> `String "verify-full"

let replication_endpoint_type_value_to_yojson (x : replication_endpoint_type_value) =
  match x with SOURCE -> `String "source" | TARGET -> `String "target"

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("EndpointIdentifier", option_to_yojson string__to_yojson x.endpoint_identifier);
      ("EndpointType", option_to_yojson replication_endpoint_type_value_to_yojson x.endpoint_type);
      ("EngineName", option_to_yojson string__to_yojson x.engine_name);
      ("EngineDisplayName", option_to_yojson string__to_yojson x.engine_display_name);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("ExtraConnectionAttributes", option_to_yojson string__to_yojson x.extra_connection_attributes);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("EndpointArn", option_to_yojson string__to_yojson x.endpoint_arn);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("ExternalTableDefinition", option_to_yojson string__to_yojson x.external_table_definition);
      ("ExternalId", option_to_yojson string__to_yojson x.external_id);
      ("IsReadOnly", option_to_yojson boolean_optional_to_yojson x.is_read_only);
      ("DynamoDbSettings", option_to_yojson dynamo_db_settings_to_yojson x.dynamo_db_settings);
      ("S3Settings", option_to_yojson s3_settings_to_yojson x.s3_settings);
      ( "DmsTransferSettings",
        option_to_yojson dms_transfer_settings_to_yojson x.dms_transfer_settings );
      ("MongoDbSettings", option_to_yojson mongo_db_settings_to_yojson x.mongo_db_settings);
      ("KinesisSettings", option_to_yojson kinesis_settings_to_yojson x.kinesis_settings);
      ("KafkaSettings", option_to_yojson kafka_settings_to_yojson x.kafka_settings);
      ( "ElasticsearchSettings",
        option_to_yojson elasticsearch_settings_to_yojson x.elasticsearch_settings );
      ("NeptuneSettings", option_to_yojson neptune_settings_to_yojson x.neptune_settings);
      ("RedshiftSettings", option_to_yojson redshift_settings_to_yojson x.redshift_settings);
      ("PostgreSQLSettings", option_to_yojson postgre_sql_settings_to_yojson x.postgre_sql_settings);
      ("MySQLSettings", option_to_yojson my_sql_settings_to_yojson x.my_sql_settings);
      ("OracleSettings", option_to_yojson oracle_settings_to_yojson x.oracle_settings);
      ("SybaseSettings", option_to_yojson sybase_settings_to_yojson x.sybase_settings);
      ( "MicrosoftSQLServerSettings",
        option_to_yojson microsoft_sql_server_settings_to_yojson x.microsoft_sql_server_settings );
      ("IBMDb2Settings", option_to_yojson ibm_db2_settings_to_yojson x.ibm_db2_settings);
      ("DocDbSettings", option_to_yojson doc_db_settings_to_yojson x.doc_db_settings);
      ("RedisSettings", option_to_yojson redis_settings_to_yojson x.redis_settings);
      ("GcpMySQLSettings", option_to_yojson gcp_my_sql_settings_to_yojson x.gcp_my_sql_settings);
      ("TimestreamSettings", option_to_yojson timestream_settings_to_yojson x.timestream_settings);
      ("LakehouseSettings", option_to_yojson lakehouse_settings_to_yojson x.lakehouse_settings);
    ]

let modify_endpoint_response_to_yojson (x : modify_endpoint_response) =
  assoc_to_yojson [ ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint) ]

let modify_endpoint_message_to_yojson (x : modify_endpoint_message) =
  assoc_to_yojson
    [
      ("EndpointArn", Some (string__to_yojson x.endpoint_arn));
      ("EndpointIdentifier", option_to_yojson string__to_yojson x.endpoint_identifier);
      ("EndpointType", option_to_yojson replication_endpoint_type_value_to_yojson x.endpoint_type);
      ("EngineName", option_to_yojson string__to_yojson x.engine_name);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("ExtraConnectionAttributes", option_to_yojson string__to_yojson x.extra_connection_attributes);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("ExternalTableDefinition", option_to_yojson string__to_yojson x.external_table_definition);
      ("DynamoDbSettings", option_to_yojson dynamo_db_settings_to_yojson x.dynamo_db_settings);
      ("S3Settings", option_to_yojson s3_settings_to_yojson x.s3_settings);
      ( "DmsTransferSettings",
        option_to_yojson dms_transfer_settings_to_yojson x.dms_transfer_settings );
      ("MongoDbSettings", option_to_yojson mongo_db_settings_to_yojson x.mongo_db_settings);
      ("KinesisSettings", option_to_yojson kinesis_settings_to_yojson x.kinesis_settings);
      ("KafkaSettings", option_to_yojson kafka_settings_to_yojson x.kafka_settings);
      ( "ElasticsearchSettings",
        option_to_yojson elasticsearch_settings_to_yojson x.elasticsearch_settings );
      ("NeptuneSettings", option_to_yojson neptune_settings_to_yojson x.neptune_settings);
      ("RedshiftSettings", option_to_yojson redshift_settings_to_yojson x.redshift_settings);
      ("PostgreSQLSettings", option_to_yojson postgre_sql_settings_to_yojson x.postgre_sql_settings);
      ("MySQLSettings", option_to_yojson my_sql_settings_to_yojson x.my_sql_settings);
      ("OracleSettings", option_to_yojson oracle_settings_to_yojson x.oracle_settings);
      ("SybaseSettings", option_to_yojson sybase_settings_to_yojson x.sybase_settings);
      ( "MicrosoftSQLServerSettings",
        option_to_yojson microsoft_sql_server_settings_to_yojson x.microsoft_sql_server_settings );
      ("IBMDb2Settings", option_to_yojson ibm_db2_settings_to_yojson x.ibm_db2_settings);
      ("DocDbSettings", option_to_yojson doc_db_settings_to_yojson x.doc_db_settings);
      ("RedisSettings", option_to_yojson redis_settings_to_yojson x.redis_settings);
      ("ExactSettings", option_to_yojson boolean_optional_to_yojson x.exact_settings);
      ("GcpMySQLSettings", option_to_yojson gcp_my_sql_settings_to_yojson x.gcp_my_sql_settings);
      ("TimestreamSettings", option_to_yojson timestream_settings_to_yojson x.timestream_settings);
    ]

let mongo_db_data_provider_settings_to_yojson (x : mongo_db_data_provider_settings) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("AuthType", option_to_yojson auth_type_value_to_yojson x.auth_type);
      ("AuthSource", option_to_yojson string__to_yojson x.auth_source);
      ("AuthMechanism", option_to_yojson auth_mechanism_value_to_yojson x.auth_mechanism);
    ]

let ibm_db2z_os_data_provider_settings_to_yojson (x : ibm_db2z_os_data_provider_settings) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
    ]

let ibm_db2_luw_data_provider_settings_to_yojson (x : ibm_db2_luw_data_provider_settings) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("EncryptionAlgorithm", option_to_yojson integer_optional_to_yojson x.encryption_algorithm);
      ("SecurityMechanism", option_to_yojson integer_optional_to_yojson x.security_mechanism);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
    ]

let maria_db_data_provider_settings_to_yojson (x : maria_db_data_provider_settings) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
    ]

let doc_db_data_provider_settings_to_yojson (x : doc_db_data_provider_settings) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
    ]

let microsoft_sql_server_data_provider_settings_to_yojson
    (x : microsoft_sql_server_data_provider_settings) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
    ]

let sybase_ase_data_provider_settings_to_yojson (x : sybase_ase_data_provider_settings) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("EncryptPassword", option_to_yojson boolean_optional_to_yojson x.encrypt_password);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
    ]

let oracle_data_provider_settings_to_yojson (x : oracle_data_provider_settings) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("AsmServer", option_to_yojson string__to_yojson x.asm_server);
      ( "SecretsManagerOracleAsmSecretId",
        option_to_yojson string__to_yojson x.secrets_manager_oracle_asm_secret_id );
      ( "SecretsManagerOracleAsmAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_oracle_asm_access_role_arn );
      ( "SecretsManagerSecurityDbEncryptionSecretId",
        option_to_yojson string__to_yojson x.secrets_manager_security_db_encryption_secret_id );
      ( "SecretsManagerSecurityDbEncryptionAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_security_db_encryption_access_role_arn
      );
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
    ]

let my_sql_data_provider_settings_to_yojson (x : my_sql_data_provider_settings) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
    ]

let postgre_sql_data_provider_settings_to_yojson (x : postgre_sql_data_provider_settings) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
    ]

let redshift_data_provider_settings_to_yojson (x : redshift_data_provider_settings) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
    ]

let data_provider_settings_to_yojson (x : data_provider_settings) =
  match x with
  | RedshiftSettings arg ->
      assoc_to_yojson [ ("RedshiftSettings", Some (redshift_data_provider_settings_to_yojson arg)) ]
  | PostgreSqlSettings arg ->
      assoc_to_yojson
        [ ("PostgreSqlSettings", Some (postgre_sql_data_provider_settings_to_yojson arg)) ]
  | MySqlSettings arg ->
      assoc_to_yojson [ ("MySqlSettings", Some (my_sql_data_provider_settings_to_yojson arg)) ]
  | OracleSettings arg ->
      assoc_to_yojson [ ("OracleSettings", Some (oracle_data_provider_settings_to_yojson arg)) ]
  | SybaseAseSettings arg ->
      assoc_to_yojson
        [ ("SybaseAseSettings", Some (sybase_ase_data_provider_settings_to_yojson arg)) ]
  | MicrosoftSqlServerSettings arg ->
      assoc_to_yojson
        [
          ( "MicrosoftSqlServerSettings",
            Some (microsoft_sql_server_data_provider_settings_to_yojson arg) );
        ]
  | DocDbSettings arg ->
      assoc_to_yojson [ ("DocDbSettings", Some (doc_db_data_provider_settings_to_yojson arg)) ]
  | MariaDbSettings arg ->
      assoc_to_yojson [ ("MariaDbSettings", Some (maria_db_data_provider_settings_to_yojson arg)) ]
  | IbmDb2LuwSettings arg ->
      assoc_to_yojson
        [ ("IbmDb2LuwSettings", Some (ibm_db2_luw_data_provider_settings_to_yojson arg)) ]
  | IbmDb2zOsSettings arg ->
      assoc_to_yojson
        [ ("IbmDb2zOsSettings", Some (ibm_db2z_os_data_provider_settings_to_yojson arg)) ]
  | MongoDbSettings arg ->
      assoc_to_yojson [ ("MongoDbSettings", Some (mongo_db_data_provider_settings_to_yojson arg)) ]

let data_provider_to_yojson (x : data_provider) =
  assoc_to_yojson
    [
      ("DataProviderName", option_to_yojson string__to_yojson x.data_provider_name);
      ("DataProviderArn", option_to_yojson string__to_yojson x.data_provider_arn);
      ( "DataProviderCreationTime",
        option_to_yojson iso8601_date_time_to_yojson x.data_provider_creation_time );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("Virtual", option_to_yojson boolean_optional_to_yojson x.\#virtual);
      ("Settings", option_to_yojson data_provider_settings_to_yojson x.settings);
    ]

let modify_data_provider_response_to_yojson (x : modify_data_provider_response) =
  assoc_to_yojson [ ("DataProvider", option_to_yojson data_provider_to_yojson x.data_provider) ]

let modify_data_provider_message_to_yojson (x : modify_data_provider_message) =
  assoc_to_yojson
    [
      ("DataProviderIdentifier", Some (string__to_yojson x.data_provider_identifier));
      ("DataProviderName", option_to_yojson string__to_yojson x.data_provider_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("Virtual", option_to_yojson boolean_optional_to_yojson x.\#virtual);
      ("ExactSettings", option_to_yojson boolean_optional_to_yojson x.exact_settings);
      ("Settings", option_to_yojson data_provider_settings_to_yojson x.settings);
    ]

let modify_data_migration_response_to_yojson (x : modify_data_migration_response) =
  assoc_to_yojson [ ("DataMigration", option_to_yojson data_migration_to_yojson x.data_migration) ]

let modify_data_migration_message_to_yojson (x : modify_data_migration_message) =
  assoc_to_yojson
    [
      ("DataMigrationIdentifier", Some (string__to_yojson x.data_migration_identifier));
      ("DataMigrationName", option_to_yojson string__to_yojson x.data_migration_name);
      ("EnableCloudwatchLogs", option_to_yojson boolean_optional_to_yojson x.enable_cloudwatch_logs);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("DataMigrationType", option_to_yojson migration_type_value_to_yojson x.data_migration_type);
      ("SourceDataSettings", option_to_yojson source_data_settings_to_yojson x.source_data_settings);
      ("TargetDataSettings", option_to_yojson target_data_settings_to_yojson x.target_data_settings);
      ("NumberOfJobs", option_to_yojson integer_optional_to_yojson x.number_of_jobs);
      ("SelectionRules", option_to_yojson secret_string_to_yojson x.selection_rules);
    ]

let modify_conversion_configuration_response_to_yojson
    (x : modify_conversion_configuration_response) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        option_to_yojson string__to_yojson x.migration_project_identifier );
    ]

let modify_conversion_configuration_message_to_yojson (x : modify_conversion_configuration_message)
    =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("ConversionConfiguration", Some (string__to_yojson x.conversion_configuration));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let arn_list_to_yojson tree = list_to_yojson string__to_yojson tree

let list_tags_for_resource_message_to_yojson (x : list_tags_for_resource_message) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ("ResourceArnList", option_to_yojson arn_list_to_yojson x.resource_arn_list);
    ]

let invalid_certificate_fault_to_yojson (x : invalid_certificate_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let certificate_wallet_to_yojson = blob_to_yojson

let certificate_to_yojson (x : certificate) =
  assoc_to_yojson
    [
      ("CertificateIdentifier", option_to_yojson string__to_yojson x.certificate_identifier);
      ("CertificateCreationDate", option_to_yojson t_stamp_to_yojson x.certificate_creation_date);
      ("CertificatePem", option_to_yojson string__to_yojson x.certificate_pem);
      ("CertificateWallet", option_to_yojson certificate_wallet_to_yojson x.certificate_wallet);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("CertificateOwner", option_to_yojson string__to_yojson x.certificate_owner);
      ("ValidFromDate", option_to_yojson t_stamp_to_yojson x.valid_from_date);
      ("ValidToDate", option_to_yojson t_stamp_to_yojson x.valid_to_date);
      ("SigningAlgorithm", option_to_yojson string__to_yojson x.signing_algorithm);
      ("KeyLength", option_to_yojson integer_optional_to_yojson x.key_length);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
    ]

let import_certificate_response_to_yojson (x : import_certificate_response) =
  assoc_to_yojson [ ("Certificate", option_to_yojson certificate_to_yojson x.certificate) ]

let import_certificate_message_to_yojson (x : import_certificate_message) =
  assoc_to_yojson
    [
      ("CertificateIdentifier", Some (string__to_yojson x.certificate_identifier));
      ("CertificatePem", option_to_yojson secret_string_to_yojson x.certificate_pem);
      ("CertificateWallet", option_to_yojson certificate_wallet_to_yojson x.certificate_wallet);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
    ]

let get_target_selection_rules_response_to_yojson (x : get_target_selection_rules_response) =
  assoc_to_yojson
    [ ("TargetSelectionRules", option_to_yojson string__to_yojson x.target_selection_rules) ]

let get_target_selection_rules_message_to_yojson (x : get_target_selection_rules_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
    ]

let export_metadata_model_assessment_result_entry_to_yojson
    (x : export_metadata_model_assessment_result_entry) =
  assoc_to_yojson
    [
      ("S3ObjectKey", option_to_yojson string__to_yojson x.s3_object_key);
      ("ObjectURL", option_to_yojson string__to_yojson x.object_ur_l);
    ]

let export_metadata_model_assessment_response_to_yojson
    (x : export_metadata_model_assessment_response) =
  assoc_to_yojson
    [
      ( "PdfReport",
        option_to_yojson export_metadata_model_assessment_result_entry_to_yojson x.pdf_report );
      ( "CsvReport",
        option_to_yojson export_metadata_model_assessment_result_entry_to_yojson x.csv_report );
    ]

let assessment_report_type_to_yojson (x : assessment_report_type) =
  match x with PDF -> `String "pdf" | CSV -> `String "csv"

let assessment_report_types_list_to_yojson tree =
  list_to_yojson assessment_report_type_to_yojson tree

let export_metadata_model_assessment_message_to_yojson
    (x : export_metadata_model_assessment_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ("FileName", option_to_yojson string__to_yojson x.file_name);
      ( "AssessmentReportTypes",
        option_to_yojson assessment_report_types_list_to_yojson x.assessment_report_types );
    ]

let double_optional_to_yojson = double_to_yojson
let long_optional_to_yojson = long_to_yojson

let table_statistics_to_yojson (x : table_statistics) =
  assoc_to_yojson
    [
      ("SchemaName", option_to_yojson string__to_yojson x.schema_name);
      ("TableName", option_to_yojson string__to_yojson x.table_name);
      ("Inserts", option_to_yojson long_to_yojson x.inserts);
      ("Deletes", option_to_yojson long_to_yojson x.deletes);
      ("Updates", option_to_yojson long_to_yojson x.updates);
      ("Ddls", option_to_yojson long_to_yojson x.ddls);
      ("AppliedInserts", option_to_yojson long_optional_to_yojson x.applied_inserts);
      ("AppliedDeletes", option_to_yojson long_optional_to_yojson x.applied_deletes);
      ("AppliedUpdates", option_to_yojson long_optional_to_yojson x.applied_updates);
      ("AppliedDdls", option_to_yojson long_optional_to_yojson x.applied_ddls);
      ("FullLoadRows", option_to_yojson long_to_yojson x.full_load_rows);
      ( "FullLoadCondtnlChkFailedRows",
        option_to_yojson long_to_yojson x.full_load_condtnl_chk_failed_rows );
      ("FullLoadErrorRows", option_to_yojson long_to_yojson x.full_load_error_rows);
      ("FullLoadStartTime", option_to_yojson t_stamp_to_yojson x.full_load_start_time);
      ("FullLoadEndTime", option_to_yojson t_stamp_to_yojson x.full_load_end_time);
      ("FullLoadReloaded", option_to_yojson boolean_optional_to_yojson x.full_load_reloaded);
      ("LastUpdateTime", option_to_yojson t_stamp_to_yojson x.last_update_time);
      ("TableState", option_to_yojson string__to_yojson x.table_state);
      ("ValidationPendingRecords", option_to_yojson long_to_yojson x.validation_pending_records);
      ("ValidationFailedRecords", option_to_yojson long_to_yojson x.validation_failed_records);
      ("ValidationSuspendedRecords", option_to_yojson long_to_yojson x.validation_suspended_records);
      ("ValidationState", option_to_yojson string__to_yojson x.validation_state);
      ("ValidationStateDetails", option_to_yojson string__to_yojson x.validation_state_details);
      ("ResyncState", option_to_yojson string__to_yojson x.resync_state);
      ("ResyncRowsAttempted", option_to_yojson long_optional_to_yojson x.resync_rows_attempted);
      ("ResyncRowsSucceeded", option_to_yojson long_optional_to_yojson x.resync_rows_succeeded);
      ("ResyncRowsFailed", option_to_yojson long_optional_to_yojson x.resync_rows_failed);
      ("ResyncProgress", option_to_yojson double_optional_to_yojson x.resync_progress);
    ]

let table_statistics_list_to_yojson tree = list_to_yojson table_statistics_to_yojson tree

let describe_table_statistics_response_to_yojson (x : describe_table_statistics_response) =
  assoc_to_yojson
    [
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
      ("TableStatistics", option_to_yojson table_statistics_list_to_yojson x.table_statistics);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let filter_value_list_to_yojson tree = list_to_yojson string__to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree

let describe_table_statistics_message_to_yojson (x : describe_table_statistics_message) =
  assoc_to_yojson
    [
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let schema_list_to_yojson tree = list_to_yojson string__to_yojson tree

let describe_schemas_response_to_yojson (x : describe_schemas_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Schemas", option_to_yojson schema_list_to_yojson x.schemas);
    ]

let describe_schemas_message_to_yojson (x : describe_schemas_message) =
  assoc_to_yojson
    [
      ("EndpointArn", Some (string__to_yojson x.endpoint_arn));
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let replication_task_list_to_yojson tree = list_to_yojson replication_task_to_yojson tree

let describe_replication_tasks_response_to_yojson (x : describe_replication_tasks_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("ReplicationTasks", option_to_yojson replication_task_list_to_yojson x.replication_tasks);
    ]

let describe_replication_tasks_message_to_yojson (x : describe_replication_tasks_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("WithoutSettings", option_to_yojson boolean_optional_to_yojson x.without_settings);
    ]

let replication_task_individual_assessment_to_yojson (x : replication_task_individual_assessment) =
  assoc_to_yojson
    [
      ( "ReplicationTaskIndividualAssessmentArn",
        option_to_yojson string__to_yojson x.replication_task_individual_assessment_arn );
      ( "ReplicationTaskAssessmentRunArn",
        option_to_yojson string__to_yojson x.replication_task_assessment_run_arn );
      ("IndividualAssessmentName", option_to_yojson string__to_yojson x.individual_assessment_name);
      ("Status", option_to_yojson string__to_yojson x.status);
      ( "ReplicationTaskIndividualAssessmentStartDate",
        option_to_yojson t_stamp_to_yojson x.replication_task_individual_assessment_start_date );
    ]

let replication_task_individual_assessment_list_to_yojson tree =
  list_to_yojson replication_task_individual_assessment_to_yojson tree

let describe_replication_task_individual_assessments_response_to_yojson
    (x : describe_replication_task_individual_assessments_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "ReplicationTaskIndividualAssessments",
        option_to_yojson replication_task_individual_assessment_list_to_yojson
          x.replication_task_individual_assessments );
    ]

let describe_replication_task_individual_assessments_message_to_yojson
    (x : describe_replication_task_individual_assessments_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let replication_task_assessment_run_list_to_yojson tree =
  list_to_yojson replication_task_assessment_run_to_yojson tree

let describe_replication_task_assessment_runs_response_to_yojson
    (x : describe_replication_task_assessment_runs_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "ReplicationTaskAssessmentRuns",
        option_to_yojson replication_task_assessment_run_list_to_yojson
          x.replication_task_assessment_runs );
    ]

let describe_replication_task_assessment_runs_message_to_yojson
    (x : describe_replication_task_assessment_runs_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let replication_task_assessment_result_to_yojson (x : replication_task_assessment_result) =
  assoc_to_yojson
    [
      ("ReplicationTaskIdentifier", option_to_yojson string__to_yojson x.replication_task_identifier);
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
      ( "ReplicationTaskLastAssessmentDate",
        option_to_yojson t_stamp_to_yojson x.replication_task_last_assessment_date );
      ("AssessmentStatus", option_to_yojson string__to_yojson x.assessment_status);
      ("AssessmentResultsFile", option_to_yojson string__to_yojson x.assessment_results_file);
      ("AssessmentResults", option_to_yojson string__to_yojson x.assessment_results);
      ("S3ObjectUrl", option_to_yojson secret_string_to_yojson x.s3_object_url);
    ]

let replication_task_assessment_result_list_to_yojson tree =
  list_to_yojson replication_task_assessment_result_to_yojson tree

let describe_replication_task_assessment_results_response_to_yojson
    (x : describe_replication_task_assessment_results_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("BucketName", option_to_yojson string__to_yojson x.bucket_name);
      ( "ReplicationTaskAssessmentResults",
        option_to_yojson replication_task_assessment_result_list_to_yojson
          x.replication_task_assessment_results );
    ]

let describe_replication_task_assessment_results_message_to_yojson
    (x : describe_replication_task_assessment_results_message) =
  assoc_to_yojson
    [
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let replication_table_statistics_list_to_yojson tree =
  list_to_yojson table_statistics_to_yojson tree

let describe_replication_table_statistics_response_to_yojson
    (x : describe_replication_table_statistics_response) =
  assoc_to_yojson
    [
      ("ReplicationConfigArn", option_to_yojson string__to_yojson x.replication_config_arn);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "ReplicationTableStatistics",
        option_to_yojson replication_table_statistics_list_to_yojson x.replication_table_statistics
      );
    ]

let describe_replication_table_statistics_message_to_yojson
    (x : describe_replication_table_statistics_message) =
  assoc_to_yojson
    [
      ("ReplicationConfigArn", Some (string__to_yojson x.replication_config_arn));
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let replication_subnet_groups_to_yojson tree =
  list_to_yojson replication_subnet_group_to_yojson tree

let describe_replication_subnet_groups_response_to_yojson
    (x : describe_replication_subnet_groups_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "ReplicationSubnetGroups",
        option_to_yojson replication_subnet_groups_to_yojson x.replication_subnet_groups );
    ]

let describe_replication_subnet_groups_message_to_yojson
    (x : describe_replication_subnet_groups_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let replication_list_to_yojson tree = list_to_yojson replication_to_yojson tree

let describe_replications_response_to_yojson (x : describe_replications_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Replications", option_to_yojson replication_list_to_yojson x.replications);
    ]

let describe_replications_message_to_yojson (x : describe_replications_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let replication_instance_task_log_to_yojson (x : replication_instance_task_log) =
  assoc_to_yojson
    [
      ("ReplicationTaskName", option_to_yojson string__to_yojson x.replication_task_name);
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
      ( "ReplicationInstanceTaskLogSize",
        option_to_yojson long_to_yojson x.replication_instance_task_log_size );
    ]

let replication_instance_task_logs_list_to_yojson tree =
  list_to_yojson replication_instance_task_log_to_yojson tree

let describe_replication_instance_task_logs_response_to_yojson
    (x : describe_replication_instance_task_logs_response) =
  assoc_to_yojson
    [
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
      ( "ReplicationInstanceTaskLogs",
        option_to_yojson replication_instance_task_logs_list_to_yojson
          x.replication_instance_task_logs );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_replication_instance_task_logs_message_to_yojson
    (x : describe_replication_instance_task_logs_message) =
  assoc_to_yojson
    [
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let replication_instance_list_to_yojson tree = list_to_yojson replication_instance_to_yojson tree

let describe_replication_instances_response_to_yojson (x : describe_replication_instances_response)
    =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "ReplicationInstances",
        option_to_yojson replication_instance_list_to_yojson x.replication_instances );
    ]

let describe_replication_instances_message_to_yojson (x : describe_replication_instances_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let replication_config_list_to_yojson tree = list_to_yojson replication_config_to_yojson tree

let describe_replication_configs_response_to_yojson (x : describe_replication_configs_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "ReplicationConfigs",
        option_to_yojson replication_config_list_to_yojson x.replication_configs );
    ]

let describe_replication_configs_message_to_yojson (x : describe_replication_configs_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_refresh_schemas_status_response_to_yojson
    (x : describe_refresh_schemas_status_response) =
  assoc_to_yojson
    [
      ( "RefreshSchemasStatus",
        option_to_yojson refresh_schemas_status_to_yojson x.refresh_schemas_status );
    ]

let describe_refresh_schemas_status_message_to_yojson (x : describe_refresh_schemas_status_message)
    =
  assoc_to_yojson [ ("EndpointArn", Some (string__to_yojson x.endpoint_arn)) ]

let rds_configuration_to_yojson (x : rds_configuration) =
  assoc_to_yojson
    [
      ("EngineEdition", option_to_yojson string__to_yojson x.engine_edition);
      ("InstanceType", option_to_yojson string__to_yojson x.instance_type);
      ("InstanceVcpu", option_to_yojson double_optional_to_yojson x.instance_vcpu);
      ("InstanceMemory", option_to_yojson double_optional_to_yojson x.instance_memory);
      ("StorageType", option_to_yojson string__to_yojson x.storage_type);
      ("StorageSize", option_to_yojson integer_optional_to_yojson x.storage_size);
      ("StorageIops", option_to_yojson integer_optional_to_yojson x.storage_iops);
      ("DeploymentOption", option_to_yojson string__to_yojson x.deployment_option);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
    ]

let rds_requirements_to_yojson (x : rds_requirements) =
  assoc_to_yojson
    [
      ("EngineEdition", option_to_yojson string__to_yojson x.engine_edition);
      ("InstanceVcpu", option_to_yojson double_optional_to_yojson x.instance_vcpu);
      ("InstanceMemory", option_to_yojson double_optional_to_yojson x.instance_memory);
      ("StorageSize", option_to_yojson integer_optional_to_yojson x.storage_size);
      ("StorageIops", option_to_yojson integer_optional_to_yojson x.storage_iops);
      ("DeploymentOption", option_to_yojson string__to_yojson x.deployment_option);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
    ]

let rds_recommendation_to_yojson (x : rds_recommendation) =
  assoc_to_yojson
    [
      ("RequirementsToTarget", option_to_yojson rds_requirements_to_yojson x.requirements_to_target);
      ("TargetConfiguration", option_to_yojson rds_configuration_to_yojson x.target_configuration);
    ]

let recommendation_data_to_yojson (x : recommendation_data) =
  assoc_to_yojson [ ("RdsEngine", option_to_yojson rds_recommendation_to_yojson x.rds_engine) ]

let recommendation_to_yojson (x : recommendation) =
  assoc_to_yojson
    [
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
      ("EngineName", option_to_yojson string__to_yojson x.engine_name);
      ("CreatedDate", option_to_yojson string__to_yojson x.created_date);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Preferred", option_to_yojson boolean_optional_to_yojson x.preferred);
      ("Settings", option_to_yojson recommendation_settings_to_yojson x.settings);
      ("Data", option_to_yojson recommendation_data_to_yojson x.data);
    ]

let recommendation_list_to_yojson tree = list_to_yojson recommendation_to_yojson tree

let describe_recommendations_response_to_yojson (x : describe_recommendations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Recommendations", option_to_yojson recommendation_list_to_yojson x.recommendations);
    ]

let describe_recommendations_request_to_yojson (x : describe_recommendations_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let limitation_to_yojson (x : limitation) =
  assoc_to_yojson
    [
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
      ("EngineName", option_to_yojson string__to_yojson x.engine_name);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Impact", option_to_yojson string__to_yojson x.impact);
      ("Type", option_to_yojson string__to_yojson x.type_);
    ]

let limitation_list_to_yojson tree = list_to_yojson limitation_to_yojson tree

let describe_recommendation_limitations_response_to_yojson
    (x : describe_recommendation_limitations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Limitations", option_to_yojson limitation_list_to_yojson x.limitations);
    ]

let describe_recommendation_limitations_request_to_yojson
    (x : describe_recommendation_limitations_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let pending_maintenance_action_to_yojson (x : pending_maintenance_action) =
  assoc_to_yojson
    [
      ("Action", option_to_yojson string__to_yojson x.action);
      ("AutoAppliedAfterDate", option_to_yojson t_stamp_to_yojson x.auto_applied_after_date);
      ("ForcedApplyDate", option_to_yojson t_stamp_to_yojson x.forced_apply_date);
      ("OptInStatus", option_to_yojson string__to_yojson x.opt_in_status);
      ("CurrentApplyDate", option_to_yojson t_stamp_to_yojson x.current_apply_date);
      ("Description", option_to_yojson string__to_yojson x.description);
    ]

let pending_maintenance_action_details_to_yojson tree =
  list_to_yojson pending_maintenance_action_to_yojson tree

let resource_pending_maintenance_actions_to_yojson (x : resource_pending_maintenance_actions) =
  assoc_to_yojson
    [
      ("ResourceIdentifier", option_to_yojson string__to_yojson x.resource_identifier);
      ( "PendingMaintenanceActionDetails",
        option_to_yojson pending_maintenance_action_details_to_yojson
          x.pending_maintenance_action_details );
    ]

let pending_maintenance_actions_to_yojson tree =
  list_to_yojson resource_pending_maintenance_actions_to_yojson tree

let describe_pending_maintenance_actions_response_to_yojson
    (x : describe_pending_maintenance_actions_response) =
  assoc_to_yojson
    [
      ( "PendingMaintenanceActions",
        option_to_yojson pending_maintenance_actions_to_yojson x.pending_maintenance_actions );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_pending_maintenance_actions_message_to_yojson
    (x : describe_pending_maintenance_actions_message) =
  assoc_to_yojson
    [
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
    ]

let release_status_values_to_yojson (x : release_status_values) =
  match x with BETA -> `String "beta" | PROD -> `String "prod"

let availability_zones_list_to_yojson tree = list_to_yojson string__to_yojson tree

let orderable_replication_instance_to_yojson (x : orderable_replication_instance) =
  assoc_to_yojson
    [
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ( "ReplicationInstanceClass",
        option_to_yojson replication_instance_class_to_yojson x.replication_instance_class );
      ("StorageType", option_to_yojson string__to_yojson x.storage_type);
      ("MinAllocatedStorage", option_to_yojson integer_to_yojson x.min_allocated_storage);
      ("MaxAllocatedStorage", option_to_yojson integer_to_yojson x.max_allocated_storage);
      ("DefaultAllocatedStorage", option_to_yojson integer_to_yojson x.default_allocated_storage);
      ("IncludedAllocatedStorage", option_to_yojson integer_to_yojson x.included_allocated_storage);
      ("AvailabilityZones", option_to_yojson availability_zones_list_to_yojson x.availability_zones);
      ("ReleaseStatus", option_to_yojson release_status_values_to_yojson x.release_status);
    ]

let orderable_replication_instance_list_to_yojson tree =
  list_to_yojson orderable_replication_instance_to_yojson tree

let describe_orderable_replication_instances_response_to_yojson
    (x : describe_orderable_replication_instances_response) =
  assoc_to_yojson
    [
      ( "OrderableReplicationInstances",
        option_to_yojson orderable_replication_instance_list_to_yojson
          x.orderable_replication_instances );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_orderable_replication_instances_message_to_yojson
    (x : describe_orderable_replication_instances_message) =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let migration_project_list_to_yojson tree = list_to_yojson migration_project_to_yojson tree

let describe_migration_projects_response_to_yojson (x : describe_migration_projects_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MigrationProjects", option_to_yojson migration_project_list_to_yojson x.migration_projects);
    ]

let describe_migration_projects_message_to_yojson (x : describe_migration_projects_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let processed_object_to_yojson (x : processed_object) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Type", option_to_yojson string__to_yojson x.type_);
      ("EndpointType", option_to_yojson string__to_yojson x.endpoint_type);
    ]

let progress_to_yojson (x : progress) =
  assoc_to_yojson
    [
      ("ProgressPercent", option_to_yojson double_optional_to_yojson x.progress_percent);
      ("TotalObjects", option_to_yojson long_to_yojson x.total_objects);
      ("ProgressStep", option_to_yojson string__to_yojson x.progress_step);
      ("ProcessedObject", option_to_yojson processed_object_to_yojson x.processed_object);
    ]

let export_sql_details_to_yojson (x : export_sql_details) =
  assoc_to_yojson
    [
      ("S3ObjectKey", option_to_yojson string__to_yojson x.s3_object_key);
      ("ObjectURL", option_to_yojson string__to_yojson x.object_ur_l);
    ]

let default_error_details_to_yojson (x : default_error_details) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let error_details_to_yojson (x : error_details) =
  match x with
  | DefaultErrorDetails arg ->
      assoc_to_yojson [ ("defaultErrorDetails", Some (default_error_details_to_yojson arg)) ]

let schema_conversion_request_to_yojson (x : schema_conversion_request) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson string__to_yojson x.status);
      ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier);
      ("MigrationProjectArn", option_to_yojson string__to_yojson x.migration_project_arn);
      ("Error", option_to_yojson error_details_to_yojson x.error);
      ("ExportSqlDetails", option_to_yojson export_sql_details_to_yojson x.export_sql_details);
      ("Progress", option_to_yojson progress_to_yojson x.progress);
    ]

let schema_conversion_request_list_to_yojson tree =
  list_to_yojson schema_conversion_request_to_yojson tree

let describe_metadata_model_imports_response_to_yojson
    (x : describe_metadata_model_imports_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
    ]

let describe_metadata_model_imports_message_to_yojson (x : describe_metadata_model_imports_message)
    =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
    ]

let describe_metadata_model_exports_to_target_response_to_yojson
    (x : describe_metadata_model_exports_to_target_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
    ]

let describe_metadata_model_exports_to_target_message_to_yojson
    (x : describe_metadata_model_exports_to_target_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
    ]

let describe_metadata_model_exports_as_script_response_to_yojson
    (x : describe_metadata_model_exports_as_script_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
    ]

let describe_metadata_model_exports_as_script_message_to_yojson
    (x : describe_metadata_model_exports_as_script_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
    ]

let describe_metadata_model_creations_response_to_yojson
    (x : describe_metadata_model_creations_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
    ]

let describe_metadata_model_creations_message_to_yojson
    (x : describe_metadata_model_creations_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let describe_metadata_model_conversions_response_to_yojson
    (x : describe_metadata_model_conversions_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
    ]

let describe_metadata_model_conversions_message_to_yojson
    (x : describe_metadata_model_conversions_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
    ]

let metadata_model_reference_to_yojson (x : metadata_model_reference) =
  assoc_to_yojson
    [
      ("MetadataModelName", option_to_yojson string__to_yojson x.metadata_model_name);
      ("SelectionRules", option_to_yojson string__to_yojson x.selection_rules);
    ]

let metadata_model_reference_list_to_yojson tree =
  list_to_yojson metadata_model_reference_to_yojson tree

let describe_metadata_model_children_response_to_yojson
    (x : describe_metadata_model_children_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "MetadataModelChildren",
        option_to_yojson metadata_model_reference_list_to_yojson x.metadata_model_children );
    ]

let describe_metadata_model_children_message_to_yojson
    (x : describe_metadata_model_children_message) =
  assoc_to_yojson
    [
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("Origin", Some (origin_type_value_to_yojson x.origin));
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
    ]

let describe_metadata_model_assessments_response_to_yojson
    (x : describe_metadata_model_assessments_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
    ]

let describe_metadata_model_assessments_message_to_yojson
    (x : describe_metadata_model_assessments_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
    ]

let describe_metadata_model_response_to_yojson (x : describe_metadata_model_response) =
  assoc_to_yojson
    [
      ("MetadataModelName", option_to_yojson string__to_yojson x.metadata_model_name);
      ("MetadataModelType", option_to_yojson string__to_yojson x.metadata_model_type);
      ( "TargetMetadataModels",
        option_to_yojson metadata_model_reference_list_to_yojson x.target_metadata_models );
      ("Definition", option_to_yojson string__to_yojson x.definition);
    ]

let describe_metadata_model_message_to_yojson (x : describe_metadata_model_message) =
  assoc_to_yojson
    [
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("Origin", Some (origin_type_value_to_yojson x.origin));
    ]

let instance_profile_list_to_yojson tree = list_to_yojson instance_profile_to_yojson tree

let describe_instance_profiles_response_to_yojson (x : describe_instance_profiles_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("InstanceProfiles", option_to_yojson instance_profile_list_to_yojson x.instance_profiles);
    ]

let describe_instance_profiles_message_to_yojson (x : describe_instance_profiles_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let schema_short_info_response_to_yojson (x : schema_short_info_response) =
  assoc_to_yojson
    [
      ("SchemaId", option_to_yojson string__to_yojson x.schema_id);
      ("SchemaName", option_to_yojson string__to_yojson x.schema_name);
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("DatabaseIpAddress", option_to_yojson string__to_yojson x.database_ip_address);
    ]

let database_short_info_response_to_yojson (x : database_short_info_response) =
  assoc_to_yojson
    [
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("DatabaseIpAddress", option_to_yojson string__to_yojson x.database_ip_address);
      ("DatabaseEngine", option_to_yojson string__to_yojson x.database_engine);
    ]

let server_short_info_response_to_yojson (x : server_short_info_response) =
  assoc_to_yojson
    [
      ("ServerId", option_to_yojson string__to_yojson x.server_id);
      ("IpAddress", option_to_yojson string__to_yojson x.ip_address);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let schema_response_to_yojson (x : schema_response) =
  assoc_to_yojson
    [
      ("CodeLineCount", option_to_yojson long_optional_to_yojson x.code_line_count);
      ("CodeSize", option_to_yojson long_optional_to_yojson x.code_size);
      ("Complexity", option_to_yojson string__to_yojson x.complexity);
      ("Server", option_to_yojson server_short_info_response_to_yojson x.server);
      ( "DatabaseInstance",
        option_to_yojson database_short_info_response_to_yojson x.database_instance );
      ("SchemaId", option_to_yojson string__to_yojson x.schema_id);
      ("SchemaName", option_to_yojson string__to_yojson x.schema_name);
      ("OriginalSchema", option_to_yojson schema_short_info_response_to_yojson x.original_schema);
      ("Similarity", option_to_yojson double_optional_to_yojson x.similarity);
    ]

let fleet_advisor_schema_list_to_yojson tree = list_to_yojson schema_response_to_yojson tree

let describe_fleet_advisor_schemas_response_to_yojson (x : describe_fleet_advisor_schemas_response)
    =
  assoc_to_yojson
    [
      ( "FleetAdvisorSchemas",
        option_to_yojson fleet_advisor_schema_list_to_yojson x.fleet_advisor_schemas );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_fleet_advisor_schemas_request_to_yojson (x : describe_fleet_advisor_schemas_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let fleet_advisor_schema_object_response_to_yojson (x : fleet_advisor_schema_object_response) =
  assoc_to_yojson
    [
      ("SchemaId", option_to_yojson string__to_yojson x.schema_id);
      ("ObjectType", option_to_yojson string__to_yojson x.object_type);
      ("NumberOfObjects", option_to_yojson long_optional_to_yojson x.number_of_objects);
      ("CodeLineCount", option_to_yojson long_optional_to_yojson x.code_line_count);
      ("CodeSize", option_to_yojson long_optional_to_yojson x.code_size);
    ]

let fleet_advisor_schema_object_list_to_yojson tree =
  list_to_yojson fleet_advisor_schema_object_response_to_yojson tree

let describe_fleet_advisor_schema_object_summary_response_to_yojson
    (x : describe_fleet_advisor_schema_object_summary_response) =
  assoc_to_yojson
    [
      ( "FleetAdvisorSchemaObjects",
        option_to_yojson fleet_advisor_schema_object_list_to_yojson x.fleet_advisor_schema_objects
      );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_fleet_advisor_schema_object_summary_request_to_yojson
    (x : describe_fleet_advisor_schema_object_summary_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let fleet_advisor_lsa_analysis_response_to_yojson (x : fleet_advisor_lsa_analysis_response) =
  assoc_to_yojson
    [
      ("LsaAnalysisId", option_to_yojson string__to_yojson x.lsa_analysis_id);
      ("Status", option_to_yojson string__to_yojson x.status);
    ]

let fleet_advisor_lsa_analysis_response_list_to_yojson tree =
  list_to_yojson fleet_advisor_lsa_analysis_response_to_yojson tree

let describe_fleet_advisor_lsa_analysis_response_to_yojson
    (x : describe_fleet_advisor_lsa_analysis_response) =
  assoc_to_yojson
    [
      ("Analysis", option_to_yojson fleet_advisor_lsa_analysis_response_list_to_yojson x.analysis);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_fleet_advisor_lsa_analysis_request_to_yojson
    (x : describe_fleet_advisor_lsa_analysis_request) =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let collector_short_info_response_to_yojson (x : collector_short_info_response) =
  assoc_to_yojson
    [
      ("CollectorReferencedId", option_to_yojson string__to_yojson x.collector_referenced_id);
      ("CollectorName", option_to_yojson string__to_yojson x.collector_name);
    ]

let collectors_list_to_yojson tree = list_to_yojson collector_short_info_response_to_yojson tree

let database_instance_software_details_response_to_yojson
    (x : database_instance_software_details_response) =
  assoc_to_yojson
    [
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("EngineEdition", option_to_yojson string__to_yojson x.engine_edition);
      ("ServicePack", option_to_yojson string__to_yojson x.service_pack);
      ("SupportLevel", option_to_yojson string__to_yojson x.support_level);
      ("OsArchitecture", option_to_yojson integer_optional_to_yojson x.os_architecture);
      ("Tooltip", option_to_yojson string__to_yojson x.tooltip);
    ]

let database_response_to_yojson (x : database_response) =
  assoc_to_yojson
    [
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("IpAddress", option_to_yojson string__to_yojson x.ip_address);
      ("NumberOfSchemas", option_to_yojson long_optional_to_yojson x.number_of_schemas);
      ("Server", option_to_yojson server_short_info_response_to_yojson x.server);
      ( "SoftwareDetails",
        option_to_yojson database_instance_software_details_response_to_yojson x.software_details );
      ("Collectors", option_to_yojson collectors_list_to_yojson x.collectors);
    ]

let database_list_to_yojson tree = list_to_yojson database_response_to_yojson tree

let describe_fleet_advisor_databases_response_to_yojson
    (x : describe_fleet_advisor_databases_response) =
  assoc_to_yojson
    [
      ("Databases", option_to_yojson database_list_to_yojson x.databases);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_fleet_advisor_databases_request_to_yojson
    (x : describe_fleet_advisor_databases_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let inventory_data_to_yojson (x : inventory_data) =
  assoc_to_yojson
    [
      ("NumberOfDatabases", option_to_yojson integer_optional_to_yojson x.number_of_databases);
      ("NumberOfSchemas", option_to_yojson integer_optional_to_yojson x.number_of_schemas);
    ]

let collector_status_to_yojson (x : collector_status) =
  match x with UNREGISTERED -> `String "UNREGISTERED" | ACTIVE -> `String "ACTIVE"

let collector_health_check_to_yojson (x : collector_health_check) =
  assoc_to_yojson
    [
      ("CollectorStatus", option_to_yojson collector_status_to_yojson x.collector_status);
      ( "LocalCollectorS3Access",
        option_to_yojson boolean_optional_to_yojson x.local_collector_s3_access );
      ("WebCollectorS3Access", option_to_yojson boolean_optional_to_yojson x.web_collector_s3_access);
      ( "WebCollectorGrantedRoleBasedAccess",
        option_to_yojson boolean_optional_to_yojson x.web_collector_granted_role_based_access );
    ]

let version_status_to_yojson (x : version_status) =
  match x with
  | UP_TO_DATE -> `String "UP_TO_DATE"
  | OUTDATED -> `String "OUTDATED"
  | UNSUPPORTED -> `String "UNSUPPORTED"

let collector_response_to_yojson (x : collector_response) =
  assoc_to_yojson
    [
      ("CollectorReferencedId", option_to_yojson string__to_yojson x.collector_referenced_id);
      ("CollectorName", option_to_yojson string__to_yojson x.collector_name);
      ("CollectorVersion", option_to_yojson string__to_yojson x.collector_version);
      ("VersionStatus", option_to_yojson version_status_to_yojson x.version_status);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ( "CollectorHealthCheck",
        option_to_yojson collector_health_check_to_yojson x.collector_health_check );
      ("LastDataReceived", option_to_yojson string__to_yojson x.last_data_received);
      ("RegisteredDate", option_to_yojson string__to_yojson x.registered_date);
      ("CreatedDate", option_to_yojson string__to_yojson x.created_date);
      ("ModifiedDate", option_to_yojson string__to_yojson x.modified_date);
      ("InventoryData", option_to_yojson inventory_data_to_yojson x.inventory_data);
    ]

let collector_responses_to_yojson tree = list_to_yojson collector_response_to_yojson tree

let describe_fleet_advisor_collectors_response_to_yojson
    (x : describe_fleet_advisor_collectors_response) =
  assoc_to_yojson
    [
      ("Collectors", option_to_yojson collector_responses_to_yojson x.collectors);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_fleet_advisor_collectors_request_to_yojson
    (x : describe_fleet_advisor_collectors_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_extension_pack_associations_response_to_yojson
    (x : describe_extension_pack_associations_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
    ]

let describe_extension_pack_associations_message_to_yojson
    (x : describe_extension_pack_associations_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
    ]

let event_subscriptions_list_to_yojson tree = list_to_yojson event_subscription_to_yojson tree

let describe_event_subscriptions_response_to_yojson (x : describe_event_subscriptions_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "EventSubscriptionsList",
        option_to_yojson event_subscriptions_list_to_yojson x.event_subscriptions_list );
    ]

let describe_event_subscriptions_message_to_yojson (x : describe_event_subscriptions_message) =
  assoc_to_yojson
    [
      ("SubscriptionName", option_to_yojson string__to_yojson x.subscription_name);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let source_type_to_yojson (x : source_type) =
  match x with Replication_instance -> `String "replication-instance"

let event_to_yojson (x : event) =
  assoc_to_yojson
    [
      ("SourceIdentifier", option_to_yojson string__to_yojson x.source_identifier);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("EventCategories", option_to_yojson event_categories_list_to_yojson x.event_categories);
      ("Date", option_to_yojson t_stamp_to_yojson x.date);
    ]

let event_list_to_yojson tree = list_to_yojson event_to_yojson tree

let describe_events_response_to_yojson (x : describe_events_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Events", option_to_yojson event_list_to_yojson x.events);
    ]

let describe_events_message_to_yojson (x : describe_events_message) =
  assoc_to_yojson
    [
      ("SourceIdentifier", option_to_yojson string__to_yojson x.source_identifier);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("StartTime", option_to_yojson t_stamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson t_stamp_to_yojson x.end_time);
      ("Duration", option_to_yojson integer_optional_to_yojson x.duration);
      ("EventCategories", option_to_yojson event_categories_list_to_yojson x.event_categories);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let event_category_group_to_yojson (x : event_category_group) =
  assoc_to_yojson
    [
      ("SourceType", option_to_yojson string__to_yojson x.source_type);
      ("EventCategories", option_to_yojson event_categories_list_to_yojson x.event_categories);
    ]

let event_category_group_list_to_yojson tree = list_to_yojson event_category_group_to_yojson tree

let describe_event_categories_response_to_yojson (x : describe_event_categories_response) =
  assoc_to_yojson
    [
      ( "EventCategoryGroupList",
        option_to_yojson event_category_group_list_to_yojson x.event_category_group_list );
    ]

let describe_event_categories_message_to_yojson (x : describe_event_categories_message) =
  assoc_to_yojson
    [
      ("SourceType", option_to_yojson string__to_yojson x.source_type);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let available_upgrades_list_to_yojson tree = list_to_yojson string__to_yojson tree

let engine_version_to_yojson (x : engine_version) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Lifecycle", option_to_yojson string__to_yojson x.lifecycle);
      ("ReleaseStatus", option_to_yojson release_status_values_to_yojson x.release_status);
      ("LaunchDate", option_to_yojson t_stamp_to_yojson x.launch_date);
      ("AutoUpgradeDate", option_to_yojson t_stamp_to_yojson x.auto_upgrade_date);
      ("DeprecationDate", option_to_yojson t_stamp_to_yojson x.deprecation_date);
      ("ForceUpgradeDate", option_to_yojson t_stamp_to_yojson x.force_upgrade_date);
      ("AvailableUpgrades", option_to_yojson available_upgrades_list_to_yojson x.available_upgrades);
    ]

let engine_version_list_to_yojson tree = list_to_yojson engine_version_to_yojson tree

let describe_engine_versions_response_to_yojson (x : describe_engine_versions_response) =
  assoc_to_yojson
    [
      ("EngineVersions", option_to_yojson engine_version_list_to_yojson x.engine_versions);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_engine_versions_message_to_yojson (x : describe_engine_versions_message) =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let supported_endpoint_type_to_yojson (x : supported_endpoint_type) =
  assoc_to_yojson
    [
      ("EngineName", option_to_yojson string__to_yojson x.engine_name);
      ("SupportsCDC", option_to_yojson boolean__to_yojson x.supports_cd_c);
      ("EndpointType", option_to_yojson replication_endpoint_type_value_to_yojson x.endpoint_type);
      ( "ReplicationInstanceEngineMinimumVersion",
        option_to_yojson string__to_yojson x.replication_instance_engine_minimum_version );
      ("EngineDisplayName", option_to_yojson string__to_yojson x.engine_display_name);
    ]

let supported_endpoint_type_list_to_yojson tree =
  list_to_yojson supported_endpoint_type_to_yojson tree

let describe_endpoint_types_response_to_yojson (x : describe_endpoint_types_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "SupportedEndpointTypes",
        option_to_yojson supported_endpoint_type_list_to_yojson x.supported_endpoint_types );
    ]

let describe_endpoint_types_message_to_yojson (x : describe_endpoint_types_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let endpoint_setting_enum_values_to_yojson tree = list_to_yojson string__to_yojson tree

let endpoint_setting_type_value_to_yojson (x : endpoint_setting_type_value) =
  match x with
  | STRING -> `String "string"
  | BOOLEAN -> `String "boolean"
  | INTEGER -> `String "integer"
  | ENUM -> `String "enum"

let endpoint_setting_to_yojson (x : endpoint_setting) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Type", option_to_yojson endpoint_setting_type_value_to_yojson x.type_);
      ("EnumValues", option_to_yojson endpoint_setting_enum_values_to_yojson x.enum_values);
      ("Sensitive", option_to_yojson boolean_optional_to_yojson x.sensitive);
      ("Units", option_to_yojson string__to_yojson x.units);
      ("Applicability", option_to_yojson string__to_yojson x.applicability);
      ("IntValueMin", option_to_yojson integer_optional_to_yojson x.int_value_min);
      ("IntValueMax", option_to_yojson integer_optional_to_yojson x.int_value_max);
      ("DefaultValue", option_to_yojson string__to_yojson x.default_value);
    ]

let endpoint_settings_list_to_yojson tree = list_to_yojson endpoint_setting_to_yojson tree

let describe_endpoint_settings_response_to_yojson (x : describe_endpoint_settings_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("EndpointSettings", option_to_yojson endpoint_settings_list_to_yojson x.endpoint_settings);
    ]

let describe_endpoint_settings_message_to_yojson (x : describe_endpoint_settings_message) =
  assoc_to_yojson
    [
      ("EngineName", Some (string__to_yojson x.engine_name));
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let endpoint_list_to_yojson tree = list_to_yojson endpoint_to_yojson tree

let describe_endpoints_response_to_yojson (x : describe_endpoints_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Endpoints", option_to_yojson endpoint_list_to_yojson x.endpoints);
    ]

let describe_endpoints_message_to_yojson (x : describe_endpoints_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let data_provider_list_to_yojson tree = list_to_yojson data_provider_to_yojson tree

let describe_data_providers_response_to_yojson (x : describe_data_providers_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("DataProviders", option_to_yojson data_provider_list_to_yojson x.data_providers);
    ]

let describe_data_providers_message_to_yojson (x : describe_data_providers_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let marker_to_yojson = string_to_yojson
let data_migrations_to_yojson tree = list_to_yojson data_migration_to_yojson tree

let describe_data_migrations_response_to_yojson (x : describe_data_migrations_response) =
  assoc_to_yojson
    [
      ("DataMigrations", option_to_yojson data_migrations_to_yojson x.data_migrations);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let describe_data_migrations_message_to_yojson (x : describe_data_migrations_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("WithoutSettings", option_to_yojson boolean_optional_to_yojson x.without_settings);
      ("WithoutStatistics", option_to_yojson boolean_optional_to_yojson x.without_statistics);
    ]

let describe_conversion_configuration_response_to_yojson
    (x : describe_conversion_configuration_response) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        option_to_yojson string__to_yojson x.migration_project_identifier );
      ("ConversionConfiguration", option_to_yojson string__to_yojson x.conversion_configuration);
    ]

let describe_conversion_configuration_message_to_yojson
    (x : describe_conversion_configuration_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let connection_list_to_yojson tree = list_to_yojson connection_to_yojson tree

let describe_connections_response_to_yojson (x : describe_connections_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Connections", option_to_yojson connection_list_to_yojson x.connections);
    ]

let describe_connections_message_to_yojson (x : describe_connections_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let certificate_list_to_yojson tree = list_to_yojson certificate_to_yojson tree

let describe_certificates_response_to_yojson (x : describe_certificates_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Certificates", option_to_yojson certificate_list_to_yojson x.certificates);
    ]

let describe_certificates_message_to_yojson (x : describe_certificates_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let individual_assessment_name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let describe_applicable_individual_assessments_response_to_yojson
    (x : describe_applicable_individual_assessments_response) =
  assoc_to_yojson
    [
      ( "IndividualAssessmentNames",
        option_to_yojson individual_assessment_name_list_to_yojson x.individual_assessment_names );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_applicable_individual_assessments_message_to_yojson
    (x : describe_applicable_individual_assessments_message) =
  assoc_to_yojson
    [
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
      ("ReplicationConfigArn", option_to_yojson string__to_yojson x.replication_config_arn);
      ("SourceEngineName", option_to_yojson string__to_yojson x.source_engine_name);
      ("TargetEngineName", option_to_yojson string__to_yojson x.target_engine_name);
      ("MigrationType", option_to_yojson migration_type_value_to_yojson x.migration_type);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_account_attributes_response_to_yojson (x : describe_account_attributes_response) =
  assoc_to_yojson
    [
      ("AccountQuotas", option_to_yojson account_quota_list_to_yojson x.account_quotas);
      ("UniqueAccountIdentifier", option_to_yojson string__to_yojson x.unique_account_identifier);
    ]

let describe_account_attributes_message_to_yojson = unit_to_yojson

let delete_replication_task_assessment_run_response_to_yojson
    (x : delete_replication_task_assessment_run_response) =
  assoc_to_yojson
    [
      ( "ReplicationTaskAssessmentRun",
        option_to_yojson replication_task_assessment_run_to_yojson x.replication_task_assessment_run
      );
    ]

let delete_replication_task_assessment_run_message_to_yojson
    (x : delete_replication_task_assessment_run_message) =
  assoc_to_yojson
    [
      ( "ReplicationTaskAssessmentRunArn",
        Some (string__to_yojson x.replication_task_assessment_run_arn) );
    ]

let delete_replication_task_response_to_yojson (x : delete_replication_task_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let delete_replication_task_message_to_yojson (x : delete_replication_task_message) =
  assoc_to_yojson [ ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn)) ]

let delete_replication_subnet_group_response_to_yojson = unit_to_yojson

let delete_replication_subnet_group_message_to_yojson (x : delete_replication_subnet_group_message)
    =
  assoc_to_yojson
    [
      ( "ReplicationSubnetGroupIdentifier",
        Some (string__to_yojson x.replication_subnet_group_identifier) );
    ]

let delete_replication_instance_response_to_yojson (x : delete_replication_instance_response) =
  assoc_to_yojson
    [
      ("ReplicationInstance", option_to_yojson replication_instance_to_yojson x.replication_instance);
    ]

let delete_replication_instance_message_to_yojson (x : delete_replication_instance_message) =
  assoc_to_yojson
    [ ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn)) ]

let delete_replication_config_response_to_yojson (x : delete_replication_config_response) =
  assoc_to_yojson
    [ ("ReplicationConfig", option_to_yojson replication_config_to_yojson x.replication_config) ]

let delete_replication_config_message_to_yojson (x : delete_replication_config_message) =
  assoc_to_yojson [ ("ReplicationConfigArn", Some (string__to_yojson x.replication_config_arn)) ]

let delete_migration_project_response_to_yojson (x : delete_migration_project_response) =
  assoc_to_yojson
    [ ("MigrationProject", option_to_yojson migration_project_to_yojson x.migration_project) ]

let delete_migration_project_message_to_yojson (x : delete_migration_project_message) =
  assoc_to_yojson
    [ ("MigrationProjectIdentifier", Some (string__to_yojson x.migration_project_identifier)) ]

let delete_instance_profile_response_to_yojson (x : delete_instance_profile_response) =
  assoc_to_yojson
    [ ("InstanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile) ]

let delete_instance_profile_message_to_yojson (x : delete_instance_profile_message) =
  assoc_to_yojson
    [ ("InstanceProfileIdentifier", Some (string__to_yojson x.instance_profile_identifier)) ]

let delete_fleet_advisor_databases_response_to_yojson (x : delete_fleet_advisor_databases_response)
    =
  assoc_to_yojson [ ("DatabaseIds", option_to_yojson string_list_to_yojson x.database_ids) ]

let delete_fleet_advisor_databases_request_to_yojson (x : delete_fleet_advisor_databases_request) =
  assoc_to_yojson [ ("DatabaseIds", Some (string_list_to_yojson x.database_ids)) ]

let collector_not_found_fault_to_yojson (x : collector_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let delete_collector_request_to_yojson (x : delete_collector_request) =
  assoc_to_yojson [ ("CollectorReferencedId", Some (string__to_yojson x.collector_referenced_id)) ]

let delete_event_subscription_response_to_yojson (x : delete_event_subscription_response) =
  assoc_to_yojson
    [ ("EventSubscription", option_to_yojson event_subscription_to_yojson x.event_subscription) ]

let delete_event_subscription_message_to_yojson (x : delete_event_subscription_message) =
  assoc_to_yojson [ ("SubscriptionName", Some (string__to_yojson x.subscription_name)) ]

let delete_endpoint_response_to_yojson (x : delete_endpoint_response) =
  assoc_to_yojson [ ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint) ]

let delete_endpoint_message_to_yojson (x : delete_endpoint_message) =
  assoc_to_yojson [ ("EndpointArn", Some (string__to_yojson x.endpoint_arn)) ]

let delete_data_provider_response_to_yojson (x : delete_data_provider_response) =
  assoc_to_yojson [ ("DataProvider", option_to_yojson data_provider_to_yojson x.data_provider) ]

let delete_data_provider_message_to_yojson (x : delete_data_provider_message) =
  assoc_to_yojson
    [ ("DataProviderIdentifier", Some (string__to_yojson x.data_provider_identifier)) ]

let delete_data_migration_response_to_yojson (x : delete_data_migration_response) =
  assoc_to_yojson [ ("DataMigration", option_to_yojson data_migration_to_yojson x.data_migration) ]

let delete_data_migration_message_to_yojson (x : delete_data_migration_message) =
  assoc_to_yojson
    [ ("DataMigrationIdentifier", Some (string__to_yojson x.data_migration_identifier)) ]

let delete_connection_response_to_yojson (x : delete_connection_response) =
  assoc_to_yojson [ ("Connection", option_to_yojson connection_to_yojson x.connection) ]

let delete_connection_message_to_yojson (x : delete_connection_message) =
  assoc_to_yojson
    [
      ("EndpointArn", Some (string__to_yojson x.endpoint_arn));
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
    ]

let delete_certificate_response_to_yojson (x : delete_certificate_response) =
  assoc_to_yojson [ ("Certificate", option_to_yojson certificate_to_yojson x.certificate) ]

let delete_certificate_message_to_yojson (x : delete_certificate_message) =
  assoc_to_yojson [ ("CertificateArn", Some (string__to_yojson x.certificate_arn)) ]

let create_replication_task_response_to_yojson (x : create_replication_task_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let create_replication_task_message_to_yojson (x : create_replication_task_message) =
  assoc_to_yojson
    [
      ("ReplicationTaskIdentifier", Some (string__to_yojson x.replication_task_identifier));
      ("SourceEndpointArn", Some (string__to_yojson x.source_endpoint_arn));
      ("TargetEndpointArn", Some (string__to_yojson x.target_endpoint_arn));
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
      ("MigrationType", Some (migration_type_value_to_yojson x.migration_type));
      ("TableMappings", Some (string__to_yojson x.table_mappings));
      ("ReplicationTaskSettings", option_to_yojson string__to_yojson x.replication_task_settings);
      ("CdcStartTime", option_to_yojson t_stamp_to_yojson x.cdc_start_time);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("TaskData", option_to_yojson string__to_yojson x.task_data);
      ("ResourceIdentifier", option_to_yojson string__to_yojson x.resource_identifier);
    ]

let create_replication_subnet_group_response_to_yojson
    (x : create_replication_subnet_group_response) =
  assoc_to_yojson
    [
      ( "ReplicationSubnetGroup",
        option_to_yojson replication_subnet_group_to_yojson x.replication_subnet_group );
    ]

let create_replication_subnet_group_message_to_yojson (x : create_replication_subnet_group_message)
    =
  assoc_to_yojson
    [
      ( "ReplicationSubnetGroupIdentifier",
        Some (string__to_yojson x.replication_subnet_group_identifier) );
      ( "ReplicationSubnetGroupDescription",
        Some (string__to_yojson x.replication_subnet_group_description) );
      ("SubnetIds", Some (subnet_identifier_list_to_yojson x.subnet_ids));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_replication_instance_response_to_yojson (x : create_replication_instance_response) =
  assoc_to_yojson
    [
      ("ReplicationInstance", option_to_yojson replication_instance_to_yojson x.replication_instance);
    ]

let create_replication_instance_message_to_yojson (x : create_replication_instance_message) =
  assoc_to_yojson
    [
      ("ReplicationInstanceIdentifier", Some (string__to_yojson x.replication_instance_identifier));
      ("AllocatedStorage", option_to_yojson integer_optional_to_yojson x.allocated_storage);
      ( "ReplicationInstanceClass",
        Some (replication_instance_class_to_yojson x.replication_instance_class) );
      ( "VpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ( "ReplicationSubnetGroupIdentifier",
        option_to_yojson string__to_yojson x.replication_subnet_group_identifier );
      ( "PreferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ("MultiAZ", option_to_yojson boolean_optional_to_yojson x.multi_a_z);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ( "AutoMinorVersionUpgrade",
        option_to_yojson boolean_optional_to_yojson x.auto_minor_version_upgrade );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("PubliclyAccessible", option_to_yojson boolean_optional_to_yojson x.publicly_accessible);
      ("DnsNameServers", option_to_yojson string__to_yojson x.dns_name_servers);
      ("ResourceIdentifier", option_to_yojson string__to_yojson x.resource_identifier);
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ( "KerberosAuthenticationSettings",
        option_to_yojson kerberos_authentication_settings_to_yojson
          x.kerberos_authentication_settings );
    ]

let create_replication_config_response_to_yojson (x : create_replication_config_response) =
  assoc_to_yojson
    [ ("ReplicationConfig", option_to_yojson replication_config_to_yojson x.replication_config) ]

let create_replication_config_message_to_yojson (x : create_replication_config_message) =
  assoc_to_yojson
    [
      ("ReplicationConfigIdentifier", Some (string__to_yojson x.replication_config_identifier));
      ("SourceEndpointArn", Some (string__to_yojson x.source_endpoint_arn));
      ("TargetEndpointArn", Some (string__to_yojson x.target_endpoint_arn));
      ("ComputeConfig", Some (compute_config_to_yojson x.compute_config));
      ("ReplicationType", Some (migration_type_value_to_yojson x.replication_type));
      ("TableMappings", Some (string__to_yojson x.table_mappings));
      ("ReplicationSettings", option_to_yojson string__to_yojson x.replication_settings);
      ("SupplementalSettings", option_to_yojson string__to_yojson x.supplemental_settings);
      ("ResourceIdentifier", option_to_yojson string__to_yojson x.resource_identifier);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_migration_project_response_to_yojson (x : create_migration_project_response) =
  assoc_to_yojson
    [ ("MigrationProject", option_to_yojson migration_project_to_yojson x.migration_project) ]

let create_migration_project_message_to_yojson (x : create_migration_project_message) =
  assoc_to_yojson
    [
      ("MigrationProjectName", option_to_yojson string__to_yojson x.migration_project_name);
      ( "SourceDataProviderDescriptors",
        Some (data_provider_descriptor_definition_list_to_yojson x.source_data_provider_descriptors)
      );
      ( "TargetDataProviderDescriptors",
        Some (data_provider_descriptor_definition_list_to_yojson x.target_data_provider_descriptors)
      );
      ("InstanceProfileIdentifier", Some (string__to_yojson x.instance_profile_identifier));
      ("TransformationRules", option_to_yojson string__to_yojson x.transformation_rules);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "SchemaConversionApplicationAttributes",
        option_to_yojson sc_application_attributes_to_yojson
          x.schema_conversion_application_attributes );
    ]

let create_instance_profile_response_to_yojson (x : create_instance_profile_response) =
  assoc_to_yojson
    [ ("InstanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile) ]

let create_instance_profile_message_to_yojson (x : create_instance_profile_message) =
  assoc_to_yojson
    [
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("KmsKeyArn", option_to_yojson string__to_yojson x.kms_key_arn);
      ("PubliclyAccessible", option_to_yojson boolean_optional_to_yojson x.publicly_accessible);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ("InstanceProfileName", option_to_yojson string__to_yojson x.instance_profile_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("SubnetGroupIdentifier", option_to_yojson string__to_yojson x.subnet_group_identifier);
      ("VpcSecurityGroups", option_to_yojson string_list_to_yojson x.vpc_security_groups);
    ]

let create_fleet_advisor_collector_response_to_yojson (x : create_fleet_advisor_collector_response)
    =
  assoc_to_yojson
    [
      ("CollectorReferencedId", option_to_yojson string__to_yojson x.collector_referenced_id);
      ("CollectorName", option_to_yojson string__to_yojson x.collector_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
    ]

let create_fleet_advisor_collector_request_to_yojson (x : create_fleet_advisor_collector_request) =
  assoc_to_yojson
    [
      ("CollectorName", Some (string__to_yojson x.collector_name));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ServiceAccessRoleArn", Some (string__to_yojson x.service_access_role_arn));
      ("S3BucketName", Some (string__to_yojson x.s3_bucket_name));
    ]

let create_event_subscription_response_to_yojson (x : create_event_subscription_response) =
  assoc_to_yojson
    [ ("EventSubscription", option_to_yojson event_subscription_to_yojson x.event_subscription) ]

let create_event_subscription_message_to_yojson (x : create_event_subscription_message) =
  assoc_to_yojson
    [
      ("SubscriptionName", Some (string__to_yojson x.subscription_name));
      ("SnsTopicArn", Some (string__to_yojson x.sns_topic_arn));
      ("SourceType", option_to_yojson string__to_yojson x.source_type);
      ("EventCategories", option_to_yojson event_categories_list_to_yojson x.event_categories);
      ("SourceIds", option_to_yojson source_ids_list_to_yojson x.source_ids);
      ("Enabled", option_to_yojson boolean_optional_to_yojson x.enabled);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_endpoint_response_to_yojson (x : create_endpoint_response) =
  assoc_to_yojson [ ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint) ]

let create_endpoint_message_to_yojson (x : create_endpoint_message) =
  assoc_to_yojson
    [
      ("EndpointIdentifier", Some (string__to_yojson x.endpoint_identifier));
      ("EndpointType", Some (replication_endpoint_type_value_to_yojson x.endpoint_type));
      ("EngineName", Some (string__to_yojson x.engine_name));
      ("Username", option_to_yojson string__to_yojson x.username);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("ExtraConnectionAttributes", option_to_yojson string__to_yojson x.extra_connection_attributes);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("ExternalTableDefinition", option_to_yojson string__to_yojson x.external_table_definition);
      ("DynamoDbSettings", option_to_yojson dynamo_db_settings_to_yojson x.dynamo_db_settings);
      ("S3Settings", option_to_yojson s3_settings_to_yojson x.s3_settings);
      ( "DmsTransferSettings",
        option_to_yojson dms_transfer_settings_to_yojson x.dms_transfer_settings );
      ("MongoDbSettings", option_to_yojson mongo_db_settings_to_yojson x.mongo_db_settings);
      ("KinesisSettings", option_to_yojson kinesis_settings_to_yojson x.kinesis_settings);
      ("KafkaSettings", option_to_yojson kafka_settings_to_yojson x.kafka_settings);
      ( "ElasticsearchSettings",
        option_to_yojson elasticsearch_settings_to_yojson x.elasticsearch_settings );
      ("NeptuneSettings", option_to_yojson neptune_settings_to_yojson x.neptune_settings);
      ("RedshiftSettings", option_to_yojson redshift_settings_to_yojson x.redshift_settings);
      ("PostgreSQLSettings", option_to_yojson postgre_sql_settings_to_yojson x.postgre_sql_settings);
      ("MySQLSettings", option_to_yojson my_sql_settings_to_yojson x.my_sql_settings);
      ("OracleSettings", option_to_yojson oracle_settings_to_yojson x.oracle_settings);
      ("SybaseSettings", option_to_yojson sybase_settings_to_yojson x.sybase_settings);
      ( "MicrosoftSQLServerSettings",
        option_to_yojson microsoft_sql_server_settings_to_yojson x.microsoft_sql_server_settings );
      ("IBMDb2Settings", option_to_yojson ibm_db2_settings_to_yojson x.ibm_db2_settings);
      ("ResourceIdentifier", option_to_yojson string__to_yojson x.resource_identifier);
      ("DocDbSettings", option_to_yojson doc_db_settings_to_yojson x.doc_db_settings);
      ("RedisSettings", option_to_yojson redis_settings_to_yojson x.redis_settings);
      ("GcpMySQLSettings", option_to_yojson gcp_my_sql_settings_to_yojson x.gcp_my_sql_settings);
      ("TimestreamSettings", option_to_yojson timestream_settings_to_yojson x.timestream_settings);
    ]

let create_data_provider_response_to_yojson (x : create_data_provider_response) =
  assoc_to_yojson [ ("DataProvider", option_to_yojson data_provider_to_yojson x.data_provider) ]

let create_data_provider_message_to_yojson (x : create_data_provider_message) =
  assoc_to_yojson
    [
      ("DataProviderName", option_to_yojson string__to_yojson x.data_provider_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Engine", Some (string__to_yojson x.engine));
      ("Virtual", option_to_yojson boolean_optional_to_yojson x.\#virtual);
      ("Settings", Some (data_provider_settings_to_yojson x.settings));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_data_migration_response_to_yojson (x : create_data_migration_response) =
  assoc_to_yojson [ ("DataMigration", option_to_yojson data_migration_to_yojson x.data_migration) ]

let create_data_migration_message_to_yojson (x : create_data_migration_message) =
  assoc_to_yojson
    [
      ("DataMigrationName", option_to_yojson string__to_yojson x.data_migration_name);
      ("MigrationProjectIdentifier", Some (string__to_yojson x.migration_project_identifier));
      ("DataMigrationType", Some (migration_type_value_to_yojson x.data_migration_type));
      ("ServiceAccessRoleArn", Some (string__to_yojson x.service_access_role_arn));
      ("EnableCloudwatchLogs", option_to_yojson boolean_optional_to_yojson x.enable_cloudwatch_logs);
      ("SourceDataSettings", option_to_yojson source_data_settings_to_yojson x.source_data_settings);
      ("TargetDataSettings", option_to_yojson target_data_settings_to_yojson x.target_data_settings);
      ("NumberOfJobs", option_to_yojson integer_optional_to_yojson x.number_of_jobs);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SelectionRules", option_to_yojson secret_string_to_yojson x.selection_rules);
    ]

let cancel_replication_task_assessment_run_response_to_yojson
    (x : cancel_replication_task_assessment_run_response) =
  assoc_to_yojson
    [
      ( "ReplicationTaskAssessmentRun",
        option_to_yojson replication_task_assessment_run_to_yojson x.replication_task_assessment_run
      );
    ]

let cancel_replication_task_assessment_run_message_to_yojson
    (x : cancel_replication_task_assessment_run_message) =
  assoc_to_yojson
    [
      ( "ReplicationTaskAssessmentRunArn",
        Some (string__to_yojson x.replication_task_assessment_run_arn) );
    ]

let cancel_metadata_model_creation_response_to_yojson (x : cancel_metadata_model_creation_response)
    =
  assoc_to_yojson [ ("Request", option_to_yojson schema_conversion_request_to_yojson x.request) ]

let cancel_metadata_model_creation_message_to_yojson (x : cancel_metadata_model_creation_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("RequestIdentifier", Some (string__to_yojson x.request_identifier));
    ]

let cancel_metadata_model_conversion_response_to_yojson
    (x : cancel_metadata_model_conversion_response) =
  assoc_to_yojson [ ("Request", option_to_yojson schema_conversion_request_to_yojson x.request) ]

let cancel_metadata_model_conversion_message_to_yojson
    (x : cancel_metadata_model_conversion_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("RequestIdentifier", Some (string__to_yojson x.request_identifier));
    ]

let batch_start_recommendations_error_entry_to_yojson (x : batch_start_recommendations_error_entry)
    =
  assoc_to_yojson
    [
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let batch_start_recommendations_error_entry_list_to_yojson tree =
  list_to_yojson batch_start_recommendations_error_entry_to_yojson tree

let batch_start_recommendations_response_to_yojson (x : batch_start_recommendations_response) =
  assoc_to_yojson
    [
      ( "ErrorEntries",
        option_to_yojson batch_start_recommendations_error_entry_list_to_yojson x.error_entries );
    ]

let start_recommendations_request_entry_to_yojson (x : start_recommendations_request_entry) =
  assoc_to_yojson
    [
      ("DatabaseId", Some (string__to_yojson x.database_id));
      ("Settings", Some (recommendation_settings_to_yojson x.settings));
    ]

let start_recommendations_request_entry_list_to_yojson tree =
  list_to_yojson start_recommendations_request_entry_to_yojson tree

let batch_start_recommendations_request_to_yojson (x : batch_start_recommendations_request) =
  assoc_to_yojson
    [ ("Data", option_to_yojson start_recommendations_request_entry_list_to_yojson x.data) ]

let apply_pending_maintenance_action_response_to_yojson
    (x : apply_pending_maintenance_action_response) =
  assoc_to_yojson
    [
      ( "ResourcePendingMaintenanceActions",
        option_to_yojson resource_pending_maintenance_actions_to_yojson
          x.resource_pending_maintenance_actions );
    ]

let apply_pending_maintenance_action_message_to_yojson
    (x : apply_pending_maintenance_action_message) =
  assoc_to_yojson
    [
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
      ("ApplyAction", Some (string__to_yojson x.apply_action));
      ("OptInType", Some (string__to_yojson x.opt_in_type));
    ]
