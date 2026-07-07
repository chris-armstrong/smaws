open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let vpc_security_group_membership_to_yojson (x : vpc_security_group_membership) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson string__to_yojson x.status);
      ("VpcSecurityGroupId", option_to_yojson string__to_yojson x.vpc_security_group_id);
    ]

let vpc_security_group_membership_list_to_yojson tree =
  list_to_yojson vpc_security_group_membership_to_yojson tree

let vpc_security_group_id_list_to_yojson tree = list_to_yojson string__to_yojson tree

let version_status_to_yojson (x : version_status) =
  match x with
  | UNSUPPORTED -> `String "UNSUPPORTED"
  | OUTDATED -> `String "OUTDATED"
  | UP_TO_DATE -> `String "UP_TO_DATE"

let exception_message_to_yojson = string_to_yojson

let upgrade_dependency_failure_fault_to_yojson (x : upgrade_dependency_failure_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let update_subscriptions_to_event_bridge_response_to_yojson
    (x : update_subscriptions_to_event_bridge_response) =
  assoc_to_yojson [ ("Result", option_to_yojson string__to_yojson x.result_) ]

let boolean_optional_to_yojson = bool_to_yojson

let update_subscriptions_to_event_bridge_message_to_yojson
    (x : update_subscriptions_to_event_bridge_message) =
  assoc_to_yojson [ ("ForceMove", option_to_yojson boolean_optional_to_yojson x.force_move) ]

let invalid_resource_state_fault_to_yojson (x : invalid_resource_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let access_denied_fault_to_yojson (x : access_denied_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let tlog_access_mode_to_yojson (x : tlog_access_mode) =
  match x with
  | TlogOnly -> `String "TlogOnly"
  | PreferTlog -> `String "PreferTlog"
  | PreferBackup -> `String "PreferBackup"
  | BackupOnly -> `String "BackupOnly"

let integer_optional_to_yojson = int_to_yojson

let timestream_settings_to_yojson (x : timestream_settings) =
  assoc_to_yojson
    [
      ( "EnableMagneticStoreWrites",
        option_to_yojson boolean_optional_to_yojson x.enable_magnetic_store_writes );
      ("CdcInsertsAndUpdates", option_to_yojson boolean_optional_to_yojson x.cdc_inserts_and_updates);
      ("MagneticDuration", Some (integer_optional_to_yojson x.magnetic_duration));
      ("MemoryDuration", Some (integer_optional_to_yojson x.memory_duration));
      ("DatabaseName", Some (string__to_yojson x.database_name));
    ]

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ( "ReplicationInstanceIdentifier",
        option_to_yojson string__to_yojson x.replication_instance_identifier );
      ("EndpointIdentifier", option_to_yojson string__to_yojson x.endpoint_identifier);
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("EndpointArn", option_to_yojson string__to_yojson x.endpoint_arn);
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
    ]

let test_connection_response_to_yojson (x : test_connection_response) =
  assoc_to_yojson [ ("Connection", option_to_yojson connection_to_yojson x.connection) ]

let test_connection_message_to_yojson (x : test_connection_message) =
  assoc_to_yojson
    [
      ("EndpointArn", Some (string__to_yojson x.endpoint_arn));
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
    ]

let resource_quota_exceeded_fault_to_yojson (x : resource_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let resource_not_found_fault_to_yojson (x : resource_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_key_not_accessible_fault_to_yojson (x : kms_key_not_accessible_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let target_db_type_to_yojson (x : target_db_type) =
  match x with
  | MULTIPLE_DATABASES -> `String "multiple-databases"
  | SPECIFIC_DATABASE -> `String "specific-database"

let table_preparation_mode_to_yojson (x : table_preparation_mode) =
  match x with
  | DROP_TABLES_ON_TARGET -> `String "drop-tables-on-target"
  | TRUNCATE -> `String "truncate"
  | DO_NOTHING -> `String "do-nothing"

let target_data_setting_to_yojson (x : target_data_setting) =
  assoc_to_yojson
    [
      ( "TablePreparationMode",
        option_to_yojson table_preparation_mode_to_yojson x.table_preparation_mode );
    ]

let target_data_settings_to_yojson tree = list_to_yojson target_data_setting_to_yojson tree

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Key", option_to_yojson string__to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let table_to_reload_to_yojson (x : table_to_reload) =
  assoc_to_yojson
    [
      ("TableName", Some (string__to_yojson x.table_name));
      ("SchemaName", Some (string__to_yojson x.schema_name));
    ]

let long_to_yojson = long_to_yojson
let long_optional_to_yojson = long_to_yojson
let t_stamp_to_yojson = timestamp_epoch_seconds_to_yojson
let double_optional_to_yojson = double_to_yojson

let table_statistics_to_yojson (x : table_statistics) =
  assoc_to_yojson
    [
      ("ResyncProgress", option_to_yojson double_optional_to_yojson x.resync_progress);
      ("ResyncRowsFailed", option_to_yojson long_optional_to_yojson x.resync_rows_failed);
      ("ResyncRowsSucceeded", option_to_yojson long_optional_to_yojson x.resync_rows_succeeded);
      ("ResyncRowsAttempted", option_to_yojson long_optional_to_yojson x.resync_rows_attempted);
      ("ResyncState", option_to_yojson string__to_yojson x.resync_state);
      ("ValidationStateDetails", option_to_yojson string__to_yojson x.validation_state_details);
      ("ValidationState", option_to_yojson string__to_yojson x.validation_state);
      ("ValidationSuspendedRecords", option_to_yojson long_to_yojson x.validation_suspended_records);
      ("ValidationFailedRecords", option_to_yojson long_to_yojson x.validation_failed_records);
      ("ValidationPendingRecords", option_to_yojson long_to_yojson x.validation_pending_records);
      ("TableState", option_to_yojson string__to_yojson x.table_state);
      ("LastUpdateTime", option_to_yojson t_stamp_to_yojson x.last_update_time);
      ("FullLoadReloaded", option_to_yojson boolean_optional_to_yojson x.full_load_reloaded);
      ("FullLoadEndTime", option_to_yojson t_stamp_to_yojson x.full_load_end_time);
      ("FullLoadStartTime", option_to_yojson t_stamp_to_yojson x.full_load_start_time);
      ("FullLoadErrorRows", option_to_yojson long_to_yojson x.full_load_error_rows);
      ( "FullLoadCondtnlChkFailedRows",
        option_to_yojson long_to_yojson x.full_load_condtnl_chk_failed_rows );
      ("FullLoadRows", option_to_yojson long_to_yojson x.full_load_rows);
      ("AppliedDdls", option_to_yojson long_optional_to_yojson x.applied_ddls);
      ("AppliedUpdates", option_to_yojson long_optional_to_yojson x.applied_updates);
      ("AppliedDeletes", option_to_yojson long_optional_to_yojson x.applied_deletes);
      ("AppliedInserts", option_to_yojson long_optional_to_yojson x.applied_inserts);
      ("Ddls", option_to_yojson long_to_yojson x.ddls);
      ("Updates", option_to_yojson long_to_yojson x.updates);
      ("Deletes", option_to_yojson long_to_yojson x.deletes);
      ("Inserts", option_to_yojson long_to_yojson x.inserts);
      ("TableName", option_to_yojson string__to_yojson x.table_name);
      ("SchemaName", option_to_yojson string__to_yojson x.schema_name);
    ]

let table_statistics_list_to_yojson tree = list_to_yojson table_statistics_to_yojson tree
let table_list_to_reload_to_yojson tree = list_to_yojson table_to_reload_to_yojson tree
let secret_string_to_yojson = string_to_yojson

let sybase_settings_to_yojson (x : sybase_settings) =
  assoc_to_yojson
    [
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("Username", option_to_yojson string__to_yojson x.username);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
    ]

let dms_ssl_mode_value_to_yojson (x : dms_ssl_mode_value) =
  match x with
  | VERIFY_FULL -> `String "verify-full"
  | VERIFY_CA -> `String "verify-ca"
  | REQUIRE -> `String "require"
  | NONE -> `String "none"

let sybase_ase_data_provider_settings_to_yojson (x : sybase_ase_data_provider_settings) =
  assoc_to_yojson
    [
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("EncryptPassword", option_to_yojson boolean_optional_to_yojson x.encrypt_password);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let boolean__to_yojson = bool_to_yojson

let replication_endpoint_type_value_to_yojson (x : replication_endpoint_type_value) =
  match x with TARGET -> `String "target" | SOURCE -> `String "source"

let supported_endpoint_type_to_yojson (x : supported_endpoint_type) =
  assoc_to_yojson
    [
      ("EngineDisplayName", option_to_yojson string__to_yojson x.engine_display_name);
      ( "ReplicationInstanceEngineMinimumVersion",
        option_to_yojson string__to_yojson x.replication_instance_engine_minimum_version );
      ("EndpointType", option_to_yojson replication_endpoint_type_value_to_yojson x.endpoint_type);
      ("SupportsCDC", option_to_yojson boolean__to_yojson x.supports_cd_c);
      ("EngineName", option_to_yojson string__to_yojson x.engine_name);
    ]

let supported_endpoint_type_list_to_yojson tree =
  list_to_yojson supported_endpoint_type_to_yojson tree

let availability_zone_to_yojson (x : availability_zone) =
  assoc_to_yojson [ ("Name", option_to_yojson string__to_yojson x.name) ]

let subnet_to_yojson (x : subnet) =
  assoc_to_yojson
    [
      ("SubnetStatus", option_to_yojson string__to_yojson x.subnet_status);
      ( "SubnetAvailabilityZone",
        option_to_yojson availability_zone_to_yojson x.subnet_availability_zone );
      ("SubnetIdentifier", option_to_yojson string__to_yojson x.subnet_identifier);
    ]

let subnet_list_to_yojson tree = list_to_yojson subnet_to_yojson tree
let subnet_identifier_list_to_yojson tree = list_to_yojson string__to_yojson tree

let subnet_already_in_use_to_yojson (x : subnet_already_in_use) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let storage_quota_exceeded_fault_to_yojson (x : storage_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let migration_type_value_to_yojson (x : migration_type_value) =
  match x with
  | FULL_LOAD_AND_CDC -> `String "full-load-and-cdc"
  | CDC -> `String "cdc"
  | FULL_LOAD -> `String "full-load"

let integer_to_yojson = int_to_yojson

let replication_task_stats_to_yojson (x : replication_task_stats) =
  assoc_to_yojson
    [
      ("FullLoadFinishDate", option_to_yojson t_stamp_to_yojson x.full_load_finish_date);
      ("FullLoadStartDate", option_to_yojson t_stamp_to_yojson x.full_load_start_date);
      ("StopDate", option_to_yojson t_stamp_to_yojson x.stop_date);
      ("StartDate", option_to_yojson t_stamp_to_yojson x.start_date);
      ("FreshStartDate", option_to_yojson t_stamp_to_yojson x.fresh_start_date);
      ("TablesErrored", option_to_yojson integer_to_yojson x.tables_errored);
      ("TablesQueued", option_to_yojson integer_to_yojson x.tables_queued);
      ("TablesLoading", option_to_yojson integer_to_yojson x.tables_loading);
      ("TablesLoaded", option_to_yojson integer_to_yojson x.tables_loaded);
      ("ElapsedTimeMillis", option_to_yojson long_to_yojson x.elapsed_time_millis);
      ("FullLoadProgressPercent", option_to_yojson integer_to_yojson x.full_load_progress_percent);
    ]

let replication_task_to_yojson (x : replication_task) =
  assoc_to_yojson
    [
      ( "TargetReplicationInstanceArn",
        option_to_yojson string__to_yojson x.target_replication_instance_arn );
      ("TaskData", option_to_yojson string__to_yojson x.task_data);
      ( "ReplicationTaskStats",
        option_to_yojson replication_task_stats_to_yojson x.replication_task_stats );
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
      ("RecoveryCheckpoint", option_to_yojson string__to_yojson x.recovery_checkpoint);
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("ReplicationTaskStartDate", option_to_yojson t_stamp_to_yojson x.replication_task_start_date);
      ( "ReplicationTaskCreationDate",
        option_to_yojson t_stamp_to_yojson x.replication_task_creation_date );
      ("StopReason", option_to_yojson string__to_yojson x.stop_reason);
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("ReplicationTaskSettings", option_to_yojson string__to_yojson x.replication_task_settings);
      ("TableMappings", option_to_yojson string__to_yojson x.table_mappings);
      ("MigrationType", option_to_yojson migration_type_value_to_yojson x.migration_type);
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
      ("TargetEndpointArn", option_to_yojson string__to_yojson x.target_endpoint_arn);
      ("SourceEndpointArn", option_to_yojson string__to_yojson x.source_endpoint_arn);
      ("ReplicationTaskIdentifier", option_to_yojson string__to_yojson x.replication_task_identifier);
    ]

let stop_replication_task_response_to_yojson (x : stop_replication_task_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let stop_replication_task_message_to_yojson (x : stop_replication_task_message) =
  assoc_to_yojson [ ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn)) ]

let provision_data_to_yojson (x : provision_data) =
  assoc_to_yojson
    [
      ( "ReasonForNewProvisioningData",
        option_to_yojson string__to_yojson x.reason_for_new_provisioning_data );
      ( "DateNewProvisioningDataAvailable",
        option_to_yojson t_stamp_to_yojson x.date_new_provisioning_data_available );
      ( "IsNewProvisioningAvailable",
        option_to_yojson boolean__to_yojson x.is_new_provisioning_available );
      ("DateProvisioned", option_to_yojson t_stamp_to_yojson x.date_provisioned);
      ("ProvisionedCapacityUnits", option_to_yojson integer_to_yojson x.provisioned_capacity_units);
      ("ProvisionState", option_to_yojson string__to_yojson x.provision_state);
    ]

let replication_task_assessment_run_progress_to_yojson
    (x : replication_task_assessment_run_progress) =
  assoc_to_yojson
    [
      ( "IndividualAssessmentCompletedCount",
        option_to_yojson integer_to_yojson x.individual_assessment_completed_count );
      ("IndividualAssessmentCount", option_to_yojson integer_to_yojson x.individual_assessment_count);
    ]

let replication_task_assessment_run_result_statistic_to_yojson
    (x : replication_task_assessment_run_result_statistic) =
  assoc_to_yojson
    [
      ("Skipped", option_to_yojson integer_to_yojson x.skipped);
      ("Cancelled", option_to_yojson integer_to_yojson x.cancelled);
      ("Warning", option_to_yojson integer_to_yojson x.warning);
      ("Error", option_to_yojson integer_to_yojson x.error);
      ("Failed", option_to_yojson integer_to_yojson x.failed);
      ("Passed", option_to_yojson integer_to_yojson x.passed);
    ]

let premigration_assessment_status_to_yojson (x : premigration_assessment_status) =
  assoc_to_yojson
    [
      ( "ResultStatistic",
        option_to_yojson replication_task_assessment_run_result_statistic_to_yojson
          x.result_statistic );
      ("ResultKmsKeyArn", option_to_yojson string__to_yojson x.result_kms_key_arn);
      ("ResultEncryptionMode", option_to_yojson string__to_yojson x.result_encryption_mode);
      ("ResultLocationFolder", option_to_yojson string__to_yojson x.result_location_folder);
      ("ResultLocationBucket", option_to_yojson string__to_yojson x.result_location_bucket);
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
      ( "AssessmentProgress",
        option_to_yojson replication_task_assessment_run_progress_to_yojson x.assessment_progress );
      ( "PremigrationAssessmentRunCreationDate",
        option_to_yojson t_stamp_to_yojson x.premigration_assessment_run_creation_date );
      ("Status", option_to_yojson string__to_yojson x.status);
      ("FailOnAssessmentFailure", option_to_yojson boolean__to_yojson x.fail_on_assessment_failure);
      ( "PremigrationAssessmentRunArn",
        option_to_yojson string__to_yojson x.premigration_assessment_run_arn );
    ]

let premigration_assessment_status_list_to_yojson tree =
  list_to_yojson premigration_assessment_status_to_yojson tree

let replication_stats_to_yojson (x : replication_stats) =
  assoc_to_yojson
    [
      ("FullLoadFinishDate", option_to_yojson t_stamp_to_yojson x.full_load_finish_date);
      ("FullLoadStartDate", option_to_yojson t_stamp_to_yojson x.full_load_start_date);
      ("StopDate", option_to_yojson t_stamp_to_yojson x.stop_date);
      ("StartDate", option_to_yojson t_stamp_to_yojson x.start_date);
      ("FreshStartDate", option_to_yojson t_stamp_to_yojson x.fresh_start_date);
      ("TablesErrored", option_to_yojson integer_to_yojson x.tables_errored);
      ("TablesQueued", option_to_yojson integer_to_yojson x.tables_queued);
      ("TablesLoading", option_to_yojson integer_to_yojson x.tables_loading);
      ("TablesLoaded", option_to_yojson integer_to_yojson x.tables_loaded);
      ("ElapsedTimeMillis", option_to_yojson long_to_yojson x.elapsed_time_millis);
      ("FullLoadProgressPercent", option_to_yojson integer_to_yojson x.full_load_progress_percent);
    ]

let replication_to_yojson (x : replication) =
  assoc_to_yojson
    [
      ("IsReadOnly", option_to_yojson boolean_optional_to_yojson x.is_read_only);
      ( "ReplicationDeprovisionTime",
        option_to_yojson t_stamp_to_yojson x.replication_deprovision_time );
      ("ReplicationLastStopTime", option_to_yojson t_stamp_to_yojson x.replication_last_stop_time);
      ("ReplicationUpdateTime", option_to_yojson t_stamp_to_yojson x.replication_update_time);
      ("ReplicationCreateTime", option_to_yojson t_stamp_to_yojson x.replication_create_time);
      ("RecoveryCheckpoint", option_to_yojson string__to_yojson x.recovery_checkpoint);
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CdcStartTime", option_to_yojson t_stamp_to_yojson x.cdc_start_time);
      ("StartReplicationType", option_to_yojson string__to_yojson x.start_replication_type);
      ("ReplicationStats", option_to_yojson replication_stats_to_yojson x.replication_stats);
      ("FailureMessages", option_to_yojson string_list_to_yojson x.failure_messages);
      ("StopReason", option_to_yojson string__to_yojson x.stop_reason);
      ( "PremigrationAssessmentStatuses",
        option_to_yojson premigration_assessment_status_list_to_yojson
          x.premigration_assessment_statuses );
      ("ProvisionData", option_to_yojson provision_data_to_yojson x.provision_data);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("ReplicationType", option_to_yojson migration_type_value_to_yojson x.replication_type);
      ("TargetEndpointArn", option_to_yojson string__to_yojson x.target_endpoint_arn);
      ("SourceEndpointArn", option_to_yojson string__to_yojson x.source_endpoint_arn);
      ("ReplicationConfigArn", option_to_yojson string__to_yojson x.replication_config_arn);
      ( "ReplicationConfigIdentifier",
        option_to_yojson string__to_yojson x.replication_config_identifier );
    ]

let stop_replication_response_to_yojson (x : stop_replication_response) =
  assoc_to_yojson [ ("Replication", option_to_yojson replication_to_yojson x.replication) ]

let stop_replication_message_to_yojson (x : stop_replication_message) =
  assoc_to_yojson [ ("ReplicationConfigArn", Some (string__to_yojson x.replication_config_arn)) ]

let iso8601_date_time_to_yojson = timestamp_iso_8601_to_yojson

let data_migration_settings_to_yojson (x : data_migration_settings) =
  assoc_to_yojson
    [
      ("SelectionRules", option_to_yojson secret_string_to_yojson x.selection_rules);
      ( "CloudwatchLogsEnabled",
        option_to_yojson boolean_optional_to_yojson x.cloudwatch_logs_enabled );
      ("NumberOfJobs", option_to_yojson integer_optional_to_yojson x.number_of_jobs);
    ]

let source_data_setting_to_yojson (x : source_data_setting) =
  assoc_to_yojson
    [
      ("SlotName", option_to_yojson string__to_yojson x.slot_name);
      ("CDCStopTime", option_to_yojson iso8601_date_time_to_yojson x.cdc_stop_time);
      ("CDCStartTime", option_to_yojson iso8601_date_time_to_yojson x.cdc_start_time);
      ("CDCStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
    ]

let source_data_settings_to_yojson tree = list_to_yojson source_data_setting_to_yojson tree

let data_migration_statistics_to_yojson (x : data_migration_statistics) =
  assoc_to_yojson
    [
      ("StopTime", option_to_yojson iso8601_date_time_to_yojson x.stop_time);
      ("StartTime", option_to_yojson iso8601_date_time_to_yojson x.start_time);
      ("TablesErrored", option_to_yojson integer_to_yojson x.tables_errored);
      ("TablesQueued", option_to_yojson integer_to_yojson x.tables_queued);
      ("CDCLatency", option_to_yojson integer_to_yojson x.cdc_latency);
      ("FullLoadPercentage", option_to_yojson integer_to_yojson x.full_load_percentage);
      ("TablesLoading", option_to_yojson integer_to_yojson x.tables_loading);
      ("ElapsedTimeMillis", option_to_yojson long_to_yojson x.elapsed_time_millis);
      ("TablesLoaded", option_to_yojson integer_to_yojson x.tables_loaded);
    ]

let public_ip_address_list_to_yojson tree = list_to_yojson string__to_yojson tree
let data_migration_cidr_block_to_yojson tree = list_to_yojson string__to_yojson tree

let data_migration_to_yojson (x : data_migration) =
  assoc_to_yojson
    [
      ("StopReason", option_to_yojson string__to_yojson x.stop_reason);
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
      ( "DataMigrationCidrBlocks",
        option_to_yojson data_migration_cidr_block_to_yojson x.data_migration_cidr_blocks );
      ("PublicIpAddresses", option_to_yojson public_ip_address_list_to_yojson x.public_ip_addresses);
      ("DataMigrationStatus", option_to_yojson string__to_yojson x.data_migration_status);
      ( "DataMigrationStatistics",
        option_to_yojson data_migration_statistics_to_yojson x.data_migration_statistics );
      ("TargetDataSettings", option_to_yojson target_data_settings_to_yojson x.target_data_settings);
      ("SourceDataSettings", option_to_yojson source_data_settings_to_yojson x.source_data_settings);
      ( "DataMigrationSettings",
        option_to_yojson data_migration_settings_to_yojson x.data_migration_settings );
      ("DataMigrationType", option_to_yojson migration_type_value_to_yojson x.data_migration_type);
      ("MigrationProjectArn", option_to_yojson string__to_yojson x.migration_project_arn);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ( "DataMigrationEndTime",
        option_to_yojson iso8601_date_time_to_yojson x.data_migration_end_time );
      ( "DataMigrationStartTime",
        option_to_yojson iso8601_date_time_to_yojson x.data_migration_start_time );
      ( "DataMigrationCreateTime",
        option_to_yojson iso8601_date_time_to_yojson x.data_migration_create_time );
      ("DataMigrationArn", option_to_yojson string__to_yojson x.data_migration_arn);
      ("DataMigrationName", option_to_yojson string__to_yojson x.data_migration_name);
    ]

let stop_data_migration_response_to_yojson (x : stop_data_migration_response) =
  assoc_to_yojson [ ("DataMigration", option_to_yojson data_migration_to_yojson x.data_migration) ]

let stop_data_migration_message_to_yojson (x : stop_data_migration_message) =
  assoc_to_yojson
    [ ("DataMigrationIdentifier", Some (string__to_yojson x.data_migration_identifier)) ]

let failed_dependency_fault_to_yojson (x : failed_dependency_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let statement_properties_to_yojson (x : statement_properties) =
  assoc_to_yojson [ ("Definition", Some (string__to_yojson x.definition)) ]

let start_replication_task_type_value_to_yojson (x : start_replication_task_type_value) =
  match x with
  | RELOAD_TARGET -> `String "reload-target"
  | RESUME_PROCESSING -> `String "resume-processing"
  | START_REPLICATION -> `String "start-replication"

let start_replication_task_response_to_yojson (x : start_replication_task_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let start_replication_task_message_to_yojson (x : start_replication_task_message) =
  assoc_to_yojson
    [
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CdcStartTime", option_to_yojson t_stamp_to_yojson x.cdc_start_time);
      ( "StartReplicationTaskType",
        Some (start_replication_task_type_value_to_yojson x.start_replication_task_type) );
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
    ]

let replication_task_assessment_run_to_yojson (x : replication_task_assessment_run) =
  assoc_to_yojson
    [
      ( "ResultStatistic",
        option_to_yojson replication_task_assessment_run_result_statistic_to_yojson
          x.result_statistic );
      ( "IsLatestTaskAssessmentRun",
        option_to_yojson boolean__to_yojson x.is_latest_task_assessment_run );
      ("AssessmentRunName", option_to_yojson string__to_yojson x.assessment_run_name);
      ("ResultKmsKeyArn", option_to_yojson string__to_yojson x.result_kms_key_arn);
      ("ResultEncryptionMode", option_to_yojson string__to_yojson x.result_encryption_mode);
      ("ResultLocationFolder", option_to_yojson string__to_yojson x.result_location_folder);
      ("ResultLocationBucket", option_to_yojson string__to_yojson x.result_location_bucket);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
      ( "AssessmentProgress",
        option_to_yojson replication_task_assessment_run_progress_to_yojson x.assessment_progress );
      ( "ReplicationTaskAssessmentRunCreationDate",
        option_to_yojson t_stamp_to_yojson x.replication_task_assessment_run_creation_date );
      ("Status", option_to_yojson string__to_yojson x.status);
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
      ( "ReplicationTaskAssessmentRunArn",
        option_to_yojson string__to_yojson x.replication_task_assessment_run_arn );
    ]

let start_replication_task_assessment_run_response_to_yojson
    (x : start_replication_task_assessment_run_response) =
  assoc_to_yojson
    [
      ( "ReplicationTaskAssessmentRun",
        option_to_yojson replication_task_assessment_run_to_yojson x.replication_task_assessment_run
      );
    ]

let include_test_list_to_yojson tree = list_to_yojson string__to_yojson tree
let exclude_test_list_to_yojson tree = list_to_yojson string__to_yojson tree

let start_replication_task_assessment_run_message_to_yojson
    (x : start_replication_task_assessment_run_message) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Exclude", option_to_yojson exclude_test_list_to_yojson x.exclude);
      ("IncludeOnly", option_to_yojson include_test_list_to_yojson x.include_only);
      ("AssessmentRunName", Some (string__to_yojson x.assessment_run_name));
      ("ResultKmsKeyArn", option_to_yojson string__to_yojson x.result_kms_key_arn);
      ("ResultEncryptionMode", option_to_yojson string__to_yojson x.result_encryption_mode);
      ("ResultLocationFolder", option_to_yojson string__to_yojson x.result_location_folder);
      ("ResultLocationBucket", Some (string__to_yojson x.result_location_bucket));
      ("ServiceAccessRoleArn", Some (string__to_yojson x.service_access_role_arn));
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
    ]

let s3_resource_not_found_fault_to_yojson (x : s3_resource_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let s3_access_denied_fault_to_yojson (x : s3_access_denied_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let resource_arn_to_yojson = string_to_yojson

let resource_already_exists_fault_to_yojson (x : resource_already_exists_fault) =
  assoc_to_yojson
    [
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("message", option_to_yojson exception_message_to_yojson x.message);
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

let start_replication_task_assessment_response_to_yojson
    (x : start_replication_task_assessment_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let start_replication_task_assessment_message_to_yojson
    (x : start_replication_task_assessment_message) =
  assoc_to_yojson [ ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn)) ]

let start_replication_response_to_yojson (x : start_replication_response) =
  assoc_to_yojson [ ("Replication", option_to_yojson replication_to_yojson x.replication) ]

let start_replication_migration_type_value_to_yojson (x : start_replication_migration_type_value) =
  match x with
  | START_REPLICATION -> `String "start-replication"
  | RESUME_PROCESSING -> `String "resume-processing"
  | RELOAD_TARGET -> `String "reload-target"

let start_replication_message_to_yojson (x : start_replication_message) =
  assoc_to_yojson
    [
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CdcStartTime", option_to_yojson t_stamp_to_yojson x.cdc_start_time);
      ( "PremigrationAssessmentSettings",
        option_to_yojson string__to_yojson x.premigration_assessment_settings );
      ("StartReplicationType", Some (string__to_yojson x.start_replication_type));
      ("ReplicationConfigArn", Some (string__to_yojson x.replication_config_arn));
    ]

let recommendation_settings_to_yojson (x : recommendation_settings) =
  assoc_to_yojson
    [
      ("WorkloadType", Some (string__to_yojson x.workload_type));
      ("InstanceSizingType", Some (string__to_yojson x.instance_sizing_type));
    ]

let start_recommendations_request_entry_to_yojson (x : start_recommendations_request_entry) =
  assoc_to_yojson
    [
      ("Settings", Some (recommendation_settings_to_yojson x.settings));
      ("DatabaseId", Some (string__to_yojson x.database_id));
    ]

let start_recommendations_request_entry_list_to_yojson tree =
  list_to_yojson start_recommendations_request_entry_to_yojson tree

let start_recommendations_request_to_yojson (x : start_recommendations_request) =
  assoc_to_yojson
    [
      ("Settings", Some (recommendation_settings_to_yojson x.settings));
      ("DatabaseId", Some (string__to_yojson x.database_id));
    ]

let start_metadata_model_import_response_to_yojson (x : start_metadata_model_import_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let migration_project_identifier_to_yojson = string_to_yojson

let origin_type_value_to_yojson (x : origin_type_value) =
  match x with TARGET -> `String "TARGET" | SOURCE -> `String "SOURCE"

let start_metadata_model_import_message_to_yojson (x : start_metadata_model_import_message) =
  assoc_to_yojson
    [
      ("Refresh", option_to_yojson boolean__to_yojson x.refresh);
      ("Origin", Some (origin_type_value_to_yojson x.origin));
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let start_metadata_model_export_to_target_response_to_yojson
    (x : start_metadata_model_export_to_target_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let start_metadata_model_export_to_target_message_to_yojson
    (x : start_metadata_model_export_to_target_message) =
  assoc_to_yojson
    [
      ( "OverwriteExtensionPack",
        option_to_yojson boolean_optional_to_yojson x.overwrite_extension_pack );
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let start_metadata_model_export_as_script_response_to_yojson
    (x : start_metadata_model_export_as_script_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let start_metadata_model_export_as_script_message_to_yojson
    (x : start_metadata_model_export_as_script_message) =
  assoc_to_yojson
    [
      ("FileName", option_to_yojson string__to_yojson x.file_name);
      ("Origin", Some (origin_type_value_to_yojson x.origin));
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let start_metadata_model_creation_response_to_yojson (x : start_metadata_model_creation_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let metadata_model_properties_to_yojson (x : metadata_model_properties) =
  match x with
  | StatementProperties arg ->
      assoc_to_yojson [ ("StatementProperties", Some (statement_properties_to_yojson arg)) ]

let start_metadata_model_creation_message_to_yojson (x : start_metadata_model_creation_message) =
  assoc_to_yojson
    [
      ("Properties", Some (metadata_model_properties_to_yojson x.properties));
      ("MetadataModelName", Some (string__to_yojson x.metadata_model_name));
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let start_metadata_model_conversion_response_to_yojson
    (x : start_metadata_model_conversion_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let start_metadata_model_conversion_message_to_yojson (x : start_metadata_model_conversion_message)
    =
  assoc_to_yojson
    [
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let start_metadata_model_assessment_response_to_yojson
    (x : start_metadata_model_assessment_response) =
  assoc_to_yojson [ ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier) ]

let start_metadata_model_assessment_message_to_yojson (x : start_metadata_model_assessment_message)
    =
  assoc_to_yojson
    [
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
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

let start_data_migration_response_to_yojson (x : start_data_migration_response) =
  assoc_to_yojson [ ("DataMigration", option_to_yojson data_migration_to_yojson x.data_migration) ]

let start_data_migration_message_to_yojson (x : start_data_migration_message) =
  assoc_to_yojson
    [
      ("StartType", Some (start_replication_migration_type_value_to_yojson x.start_type));
      ("DataMigrationIdentifier", Some (string__to_yojson x.data_migration_identifier));
    ]

let invalid_operation_fault_to_yojson (x : invalid_operation_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let ssl_security_protocol_value_to_yojson (x : ssl_security_protocol_value) =
  match x with SSL_ENCRYPTION -> `String "ssl-encryption" | PLAINTEXT -> `String "plaintext"

let sql_server_authentication_method_to_yojson (x : sql_server_authentication_method) =
  match x with Kerberos -> `String "kerberos" | Password -> `String "password"

let source_type_to_yojson (x : source_type) =
  match x with Replication_instance -> `String "replication-instance"

let source_ids_list_to_yojson tree = list_to_yojson string__to_yojson tree

let server_short_info_response_to_yojson (x : server_short_info_response) =
  assoc_to_yojson
    [
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("IpAddress", option_to_yojson string__to_yojson x.ip_address);
      ("ServerId", option_to_yojson string__to_yojson x.server_id);
    ]

let schema_short_info_response_to_yojson (x : schema_short_info_response) =
  assoc_to_yojson
    [
      ("DatabaseIpAddress", option_to_yojson string__to_yojson x.database_ip_address);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
      ("SchemaName", option_to_yojson string__to_yojson x.schema_name);
      ("SchemaId", option_to_yojson string__to_yojson x.schema_id);
    ]

let database_short_info_response_to_yojson (x : database_short_info_response) =
  assoc_to_yojson
    [
      ("DatabaseEngine", option_to_yojson string__to_yojson x.database_engine);
      ("DatabaseIpAddress", option_to_yojson string__to_yojson x.database_ip_address);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
    ]

let schema_response_to_yojson (x : schema_response) =
  assoc_to_yojson
    [
      ("Similarity", option_to_yojson double_optional_to_yojson x.similarity);
      ("OriginalSchema", option_to_yojson schema_short_info_response_to_yojson x.original_schema);
      ("SchemaName", option_to_yojson string__to_yojson x.schema_name);
      ("SchemaId", option_to_yojson string__to_yojson x.schema_id);
      ( "DatabaseInstance",
        option_to_yojson database_short_info_response_to_yojson x.database_instance );
      ("Server", option_to_yojson server_short_info_response_to_yojson x.server);
      ("Complexity", option_to_yojson string__to_yojson x.complexity);
      ("CodeSize", option_to_yojson long_optional_to_yojson x.code_size);
      ("CodeLineCount", option_to_yojson long_optional_to_yojson x.code_line_count);
    ]

let schema_list_to_yojson tree = list_to_yojson string__to_yojson tree

let default_error_details_to_yojson (x : default_error_details) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let error_details_to_yojson (x : error_details) =
  match x with
  | DefaultErrorDetails arg ->
      assoc_to_yojson [ ("defaultErrorDetails", Some (default_error_details_to_yojson arg)) ]

let export_sql_details_to_yojson (x : export_sql_details) =
  assoc_to_yojson
    [
      ("ObjectURL", option_to_yojson string__to_yojson x.object_ur_l);
      ("S3ObjectKey", option_to_yojson string__to_yojson x.s3_object_key);
    ]

let processed_object_to_yojson (x : processed_object) =
  assoc_to_yojson
    [
      ("EndpointType", option_to_yojson string__to_yojson x.endpoint_type);
      ("Type", option_to_yojson string__to_yojson x.type_);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let progress_to_yojson (x : progress) =
  assoc_to_yojson
    [
      ("ProcessedObject", option_to_yojson processed_object_to_yojson x.processed_object);
      ("ProgressStep", option_to_yojson string__to_yojson x.progress_step);
      ("TotalObjects", option_to_yojson long_to_yojson x.total_objects);
      ("ProgressPercent", option_to_yojson double_optional_to_yojson x.progress_percent);
    ]

let schema_conversion_request_to_yojson (x : schema_conversion_request) =
  assoc_to_yojson
    [
      ("Progress", option_to_yojson progress_to_yojson x.progress);
      ("ExportSqlDetails", option_to_yojson export_sql_details_to_yojson x.export_sql_details);
      ("Error", option_to_yojson error_details_to_yojson x.error);
      ("MigrationProjectArn", option_to_yojson string__to_yojson x.migration_project_arn);
      ("RequestIdentifier", option_to_yojson string__to_yojson x.request_identifier);
      ("Status", option_to_yojson string__to_yojson x.status);
    ]

let schema_conversion_request_list_to_yojson tree =
  list_to_yojson schema_conversion_request_to_yojson tree

let safeguard_policy_to_yojson (x : safeguard_policy) =
  match x with
  | SHARED_AUTOMATIC_TRUNCATION -> `String "shared-automatic-truncation"
  | EXCLUSIVE_AUTOMATIC_TRUNCATION -> `String "exclusive-automatic-truncation"
  | RELY_ON_SQL_SERVER_REPLICATION_AGENT -> `String "rely-on-sql-server-replication-agent"

let sns_no_authorization_fault_to_yojson (x : sns_no_authorization_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let sns_invalid_topic_fault_to_yojson (x : sns_invalid_topic_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let sc_application_attributes_to_yojson (x : sc_application_attributes) =
  assoc_to_yojson
    [
      ("S3BucketRoleArn", option_to_yojson string__to_yojson x.s3_bucket_role_arn);
      ("S3BucketPath", option_to_yojson string__to_yojson x.s3_bucket_path);
    ]

let compression_type_value_to_yojson (x : compression_type_value) =
  match x with GZIP -> `String "gzip" | NONE -> `String "none"

let encryption_mode_value_to_yojson (x : encryption_mode_value) =
  match x with SSE_KMS -> `String "sse-kms" | SSE_S3 -> `String "sse-s3"

let data_format_value_to_yojson (x : data_format_value) =
  match x with PARQUET -> `String "parquet" | CSV -> `String "csv"

let encoding_type_value_to_yojson (x : encoding_type_value) =
  match x with
  | RLE_DICTIONARY -> `String "rle-dictionary"
  | PLAIN_DICTIONARY -> `String "plain-dictionary"
  | PLAIN -> `String "plain"

let parquet_version_value_to_yojson (x : parquet_version_value) =
  match x with PARQUET_2_0 -> `String "parquet-2-0" | PARQUET_1_0 -> `String "parquet-1-0"

let date_partition_sequence_value_to_yojson (x : date_partition_sequence_value) =
  match x with
  | DDMMYYYY -> `String "DDMMYYYY"
  | MMYYYYDD -> `String "MMYYYYDD"
  | YYYYMM -> `String "YYYYMM"
  | YYYYMMDDHH -> `String "YYYYMMDDHH"
  | YYYYMMDD -> `String "YYYYMMDD"

let date_partition_delimiter_value_to_yojson (x : date_partition_delimiter_value) =
  match x with
  | NONE -> `String "NONE"
  | DASH -> `String "DASH"
  | UNDERSCORE -> `String "UNDERSCORE"
  | SLASH -> `String "SLASH"

let canned_acl_for_objects_value_to_yojson (x : canned_acl_for_objects_value) =
  match x with
  | BUCKET_OWNER_FULL_CONTROL -> `String "bucket-owner-full-control"
  | BUCKET_OWNER_READ -> `String "bucket-owner-read"
  | AWS_EXEC_READ -> `String "aws-exec-read"
  | AUTHENTICATED_READ -> `String "authenticated-read"
  | PUBLIC_READ_WRITE -> `String "public-read-write"
  | PUBLIC_READ -> `String "public-read"
  | PRIVATE -> `String "private"
  | NONE -> `String "none"

let s3_settings_to_yojson (x : s3_settings) =
  assoc_to_yojson
    [
      ( "GlueCatalogGeneration",
        option_to_yojson boolean_optional_to_yojson x.glue_catalog_generation );
      ("ExpectedBucketOwner", option_to_yojson string__to_yojson x.expected_bucket_owner);
      ( "AddTrailingPaddingCharacter",
        option_to_yojson boolean_optional_to_yojson x.add_trailing_padding_character );
      ("DatePartitionTimezone", option_to_yojson string__to_yojson x.date_partition_timezone);
      ("Rfc4180", option_to_yojson boolean_optional_to_yojson x.rfc4180);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("IgnoreHeaderRows", option_to_yojson integer_optional_to_yojson x.ignore_header_rows);
      ("CsvNullValue", option_to_yojson string__to_yojson x.csv_null_value);
      ("CdcMinFileSize", option_to_yojson integer_optional_to_yojson x.cdc_min_file_size);
      ("CdcMaxBatchInterval", option_to_yojson integer_optional_to_yojson x.cdc_max_batch_interval);
      ("AddColumnName", option_to_yojson boolean_optional_to_yojson x.add_column_name);
      ( "CannedAclForObjects",
        option_to_yojson canned_acl_for_objects_value_to_yojson x.canned_acl_for_objects );
      ( "UseTaskStartTimeForFullLoadTimestamp",
        option_to_yojson boolean_optional_to_yojson x.use_task_start_time_for_full_load_timestamp );
      ("CdcPath", option_to_yojson string__to_yojson x.cdc_path);
      ("PreserveTransactions", option_to_yojson boolean_optional_to_yojson x.preserve_transactions);
      ("CsvNoSupValue", option_to_yojson string__to_yojson x.csv_no_sup_value);
      ("UseCsvNoSupValue", option_to_yojson boolean_optional_to_yojson x.use_csv_no_sup_value);
      ( "DatePartitionDelimiter",
        option_to_yojson date_partition_delimiter_value_to_yojson x.date_partition_delimiter );
      ( "DatePartitionSequence",
        option_to_yojson date_partition_sequence_value_to_yojson x.date_partition_sequence );
      ("DatePartitionEnabled", option_to_yojson boolean_optional_to_yojson x.date_partition_enabled);
      ("CdcInsertsAndUpdates", option_to_yojson boolean_optional_to_yojson x.cdc_inserts_and_updates);
      ( "ParquetTimestampInMillisecond",
        option_to_yojson boolean_optional_to_yojson x.parquet_timestamp_in_millisecond );
      ("TimestampColumnName", option_to_yojson string__to_yojson x.timestamp_column_name);
      ("CdcInsertsOnly", option_to_yojson boolean_optional_to_yojson x.cdc_inserts_only);
      ( "IncludeOpForFullLoad",
        option_to_yojson boolean_optional_to_yojson x.include_op_for_full_load );
      ("EnableStatistics", option_to_yojson boolean_optional_to_yojson x.enable_statistics);
      ("ParquetVersion", option_to_yojson parquet_version_value_to_yojson x.parquet_version);
      ("DataPageSize", option_to_yojson integer_optional_to_yojson x.data_page_size);
      ("RowGroupLength", option_to_yojson integer_optional_to_yojson x.row_group_length);
      ("DictPageSizeLimit", option_to_yojson integer_optional_to_yojson x.dict_page_size_limit);
      ("EncodingType", option_to_yojson encoding_type_value_to_yojson x.encoding_type);
      ("DataFormat", option_to_yojson data_format_value_to_yojson x.data_format);
      ( "ServerSideEncryptionKmsKeyId",
        option_to_yojson string__to_yojson x.server_side_encryption_kms_key_id );
      ("EncryptionMode", option_to_yojson encryption_mode_value_to_yojson x.encryption_mode);
      ("CompressionType", option_to_yojson compression_type_value_to_yojson x.compression_type);
      ("BucketName", option_to_yojson string__to_yojson x.bucket_name);
      ("BucketFolder", option_to_yojson string__to_yojson x.bucket_folder);
      ("CsvDelimiter", option_to_yojson string__to_yojson x.csv_delimiter);
      ("CsvRowDelimiter", option_to_yojson string__to_yojson x.csv_row_delimiter);
      ("ExternalTableDefinition", option_to_yojson string__to_yojson x.external_table_definition);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
    ]

let run_fleet_advisor_lsa_analysis_response_to_yojson (x : run_fleet_advisor_lsa_analysis_response)
    =
  assoc_to_yojson
    [
      ("Status", option_to_yojson string__to_yojson x.status);
      ("LsaAnalysisId", option_to_yojson string__to_yojson x.lsa_analysis_id);
    ]

let pending_maintenance_action_to_yojson (x : pending_maintenance_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson string__to_yojson x.description);
      ("CurrentApplyDate", option_to_yojson t_stamp_to_yojson x.current_apply_date);
      ("OptInStatus", option_to_yojson string__to_yojson x.opt_in_status);
      ("ForcedApplyDate", option_to_yojson t_stamp_to_yojson x.forced_apply_date);
      ("AutoAppliedAfterDate", option_to_yojson t_stamp_to_yojson x.auto_applied_after_date);
      ("Action", option_to_yojson string__to_yojson x.action);
    ]

let pending_maintenance_action_details_to_yojson tree =
  list_to_yojson pending_maintenance_action_to_yojson tree

let resource_pending_maintenance_actions_to_yojson (x : resource_pending_maintenance_actions) =
  assoc_to_yojson
    [
      ( "PendingMaintenanceActionDetails",
        option_to_yojson pending_maintenance_action_details_to_yojson
          x.pending_maintenance_action_details );
      ("ResourceIdentifier", option_to_yojson string__to_yojson x.resource_identifier);
    ]

let replication_task_list_to_yojson tree = list_to_yojson replication_task_to_yojson tree

let replication_task_individual_assessment_to_yojson (x : replication_task_individual_assessment) =
  assoc_to_yojson
    [
      ( "ReplicationTaskIndividualAssessmentStartDate",
        option_to_yojson t_stamp_to_yojson x.replication_task_individual_assessment_start_date );
      ("Status", option_to_yojson string__to_yojson x.status);
      ("IndividualAssessmentName", option_to_yojson string__to_yojson x.individual_assessment_name);
      ( "ReplicationTaskAssessmentRunArn",
        option_to_yojson string__to_yojson x.replication_task_assessment_run_arn );
      ( "ReplicationTaskIndividualAssessmentArn",
        option_to_yojson string__to_yojson x.replication_task_individual_assessment_arn );
    ]

let replication_task_individual_assessment_list_to_yojson tree =
  list_to_yojson replication_task_individual_assessment_to_yojson tree

let replication_task_assessment_run_list_to_yojson tree =
  list_to_yojson replication_task_assessment_run_to_yojson tree

let replication_task_assessment_result_to_yojson (x : replication_task_assessment_result) =
  assoc_to_yojson
    [
      ("S3ObjectUrl", option_to_yojson secret_string_to_yojson x.s3_object_url);
      ("AssessmentResults", option_to_yojson string__to_yojson x.assessment_results);
      ("AssessmentResultsFile", option_to_yojson string__to_yojson x.assessment_results_file);
      ("AssessmentStatus", option_to_yojson string__to_yojson x.assessment_status);
      ( "ReplicationTaskLastAssessmentDate",
        option_to_yojson t_stamp_to_yojson x.replication_task_last_assessment_date );
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
      ("ReplicationTaskIdentifier", option_to_yojson string__to_yojson x.replication_task_identifier);
    ]

let replication_task_assessment_result_list_to_yojson tree =
  list_to_yojson replication_task_assessment_result_to_yojson tree

let replication_table_statistics_list_to_yojson tree =
  list_to_yojson table_statistics_to_yojson tree

let replication_subnet_group_to_yojson (x : replication_subnet_group) =
  assoc_to_yojson
    [
      ("IsReadOnly", option_to_yojson boolean_optional_to_yojson x.is_read_only);
      ("SupportedNetworkTypes", option_to_yojson string_list_to_yojson x.supported_network_types);
      ("Subnets", option_to_yojson subnet_list_to_yojson x.subnets);
      ("SubnetGroupStatus", option_to_yojson string__to_yojson x.subnet_group_status);
      ("VpcId", option_to_yojson string__to_yojson x.vpc_id);
      ( "ReplicationSubnetGroupDescription",
        option_to_yojson string__to_yojson x.replication_subnet_group_description );
      ( "ReplicationSubnetGroupIdentifier",
        option_to_yojson string__to_yojson x.replication_subnet_group_identifier );
    ]

let replication_subnet_groups_to_yojson tree =
  list_to_yojson replication_subnet_group_to_yojson tree

let replication_subnet_group_does_not_cover_enough_a_zs_to_yojson
    (x : replication_subnet_group_does_not_cover_enough_a_zs) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let replication_instance_class_to_yojson = string_to_yojson

let replication_pending_modified_values_to_yojson (x : replication_pending_modified_values) =
  assoc_to_yojson
    [
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("MultiAZ", option_to_yojson boolean_optional_to_yojson x.multi_a_z);
      ("AllocatedStorage", option_to_yojson integer_optional_to_yojson x.allocated_storage);
      ( "ReplicationInstanceClass",
        option_to_yojson replication_instance_class_to_yojson x.replication_instance_class );
    ]

let replication_list_to_yojson tree = list_to_yojson replication_to_yojson tree

let replication_instance_task_log_to_yojson (x : replication_instance_task_log) =
  assoc_to_yojson
    [
      ( "ReplicationInstanceTaskLogSize",
        option_to_yojson long_to_yojson x.replication_instance_task_log_size );
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
      ("ReplicationTaskName", option_to_yojson string__to_yojson x.replication_task_name);
    ]

let replication_instance_task_logs_list_to_yojson tree =
  list_to_yojson replication_instance_task_log_to_yojson tree

let replication_instance_public_ip_address_list_to_yojson tree =
  list_to_yojson string__to_yojson tree

let replication_instance_private_ip_address_list_to_yojson tree =
  list_to_yojson string__to_yojson tree

let replication_instance_ipv6_address_list_to_yojson tree = list_to_yojson string__to_yojson tree

let kerberos_authentication_settings_to_yojson (x : kerberos_authentication_settings) =
  assoc_to_yojson
    [
      ("Krb5FileContents", option_to_yojson string__to_yojson x.krb5_file_contents);
      ("KeyCacheSecretIamArn", option_to_yojson string__to_yojson x.key_cache_secret_iam_arn);
      ("KeyCacheSecretId", option_to_yojson string__to_yojson x.key_cache_secret_id);
    ]

let replication_instance_to_yojson (x : replication_instance) =
  assoc_to_yojson
    [
      ( "KerberosAuthenticationSettings",
        option_to_yojson kerberos_authentication_settings_to_yojson
          x.kerberos_authentication_settings );
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ("DnsNameServers", option_to_yojson string__to_yojson x.dns_name_servers);
      ("FreeUntil", option_to_yojson t_stamp_to_yojson x.free_until);
      ("SecondaryAvailabilityZone", option_to_yojson string__to_yojson x.secondary_availability_zone);
      ("PubliclyAccessible", option_to_yojson boolean__to_yojson x.publicly_accessible);
      ( "ReplicationInstanceIpv6Addresses",
        option_to_yojson replication_instance_ipv6_address_list_to_yojson
          x.replication_instance_ipv6_addresses );
      ( "ReplicationInstancePrivateIpAddresses",
        option_to_yojson replication_instance_private_ip_address_list_to_yojson
          x.replication_instance_private_ip_addresses );
      ( "ReplicationInstancePublicIpAddresses",
        option_to_yojson replication_instance_public_ip_address_list_to_yojson
          x.replication_instance_public_ip_addresses );
      ( "ReplicationInstancePrivateIpAddress",
        option_to_yojson string__to_yojson x.replication_instance_private_ip_address );
      ( "ReplicationInstancePublicIpAddress",
        option_to_yojson string__to_yojson x.replication_instance_public_ip_address );
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("AutoMinorVersionUpgrade", option_to_yojson boolean__to_yojson x.auto_minor_version_upgrade);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("MultiAZ", option_to_yojson boolean__to_yojson x.multi_a_z);
      ( "PendingModifiedValues",
        option_to_yojson replication_pending_modified_values_to_yojson x.pending_modified_values );
      ( "PreferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ( "ReplicationSubnetGroup",
        option_to_yojson replication_subnet_group_to_yojson x.replication_subnet_group );
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ( "VpcSecurityGroups",
        option_to_yojson vpc_security_group_membership_list_to_yojson x.vpc_security_groups );
      ("InstanceCreateTime", option_to_yojson t_stamp_to_yojson x.instance_create_time);
      ("AllocatedStorage", option_to_yojson integer_to_yojson x.allocated_storage);
      ("ReplicationInstanceStatus", option_to_yojson string__to_yojson x.replication_instance_status);
      ( "ReplicationInstanceClass",
        option_to_yojson replication_instance_class_to_yojson x.replication_instance_class );
      ( "ReplicationInstanceIdentifier",
        option_to_yojson string__to_yojson x.replication_instance_identifier );
    ]

let replication_instance_list_to_yojson tree = list_to_yojson replication_instance_to_yojson tree

let compute_config_to_yojson (x : compute_config) =
  assoc_to_yojson
    [
      ("VpcSecurityGroupIds", option_to_yojson string_list_to_yojson x.vpc_security_group_ids);
      ("ReplicationSubnetGroupId", option_to_yojson string__to_yojson x.replication_subnet_group_id);
      ( "PreferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ("MultiAZ", option_to_yojson boolean_optional_to_yojson x.multi_a_z);
      ("MinCapacityUnits", option_to_yojson integer_optional_to_yojson x.min_capacity_units);
      ("MaxCapacityUnits", option_to_yojson integer_optional_to_yojson x.max_capacity_units);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("DnsNameServers", option_to_yojson string__to_yojson x.dns_name_servers);
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
    ]

let replication_config_to_yojson (x : replication_config) =
  assoc_to_yojson
    [
      ("IsReadOnly", option_to_yojson boolean_optional_to_yojson x.is_read_only);
      ( "ReplicationConfigUpdateTime",
        option_to_yojson t_stamp_to_yojson x.replication_config_update_time );
      ( "ReplicationConfigCreateTime",
        option_to_yojson t_stamp_to_yojson x.replication_config_create_time );
      ("TableMappings", option_to_yojson string__to_yojson x.table_mappings);
      ("SupplementalSettings", option_to_yojson string__to_yojson x.supplemental_settings);
      ("ReplicationSettings", option_to_yojson string__to_yojson x.replication_settings);
      ("ComputeConfig", option_to_yojson compute_config_to_yojson x.compute_config);
      ("ReplicationType", option_to_yojson migration_type_value_to_yojson x.replication_type);
      ("TargetEndpointArn", option_to_yojson string__to_yojson x.target_endpoint_arn);
      ("SourceEndpointArn", option_to_yojson string__to_yojson x.source_endpoint_arn);
      ("ReplicationConfigArn", option_to_yojson string__to_yojson x.replication_config_arn);
      ( "ReplicationConfigIdentifier",
        option_to_yojson string__to_yojson x.replication_config_identifier );
    ]

let replication_config_list_to_yojson tree = list_to_yojson replication_config_to_yojson tree
let remove_tags_from_resource_response_to_yojson = unit_to_yojson
let key_list_to_yojson tree = list_to_yojson string__to_yojson tree

let remove_tags_from_resource_message_to_yojson (x : remove_tags_from_resource_message) =
  assoc_to_yojson
    [
      ("TagKeys", Some (key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
    ]

let reload_tables_response_to_yojson (x : reload_tables_response) =
  assoc_to_yojson
    [ ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn) ]

let reload_option_value_to_yojson (x : reload_option_value) =
  match x with VALIDATE_ONLY -> `String "validate-only" | DATA_RELOAD -> `String "data-reload"

let reload_tables_message_to_yojson (x : reload_tables_message) =
  assoc_to_yojson
    [
      ("ReloadOption", option_to_yojson reload_option_value_to_yojson x.reload_option);
      ("TablesToReload", Some (table_list_to_reload_to_yojson x.tables_to_reload));
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
    ]

let reload_replication_tables_response_to_yojson (x : reload_replication_tables_response) =
  assoc_to_yojson
    [ ("ReplicationConfigArn", option_to_yojson string__to_yojson x.replication_config_arn) ]

let reload_replication_tables_message_to_yojson (x : reload_replication_tables_message) =
  assoc_to_yojson
    [
      ("ReloadOption", option_to_yojson reload_option_value_to_yojson x.reload_option);
      ("TablesToReload", Some (table_list_to_reload_to_yojson x.tables_to_reload));
      ("ReplicationConfigArn", Some (string__to_yojson x.replication_config_arn));
    ]

let release_status_values_to_yojson (x : release_status_values) =
  match x with PROD -> `String "prod" | BETA -> `String "beta"

let refresh_schemas_status_type_value_to_yojson (x : refresh_schemas_status_type_value) =
  match x with
  | REFRESHING -> `String "refreshing"
  | FAILED -> `String "failed"
  | SUCCESSFUL -> `String "successful"

let refresh_schemas_status_to_yojson (x : refresh_schemas_status) =
  assoc_to_yojson
    [
      ("LastFailureMessage", option_to_yojson string__to_yojson x.last_failure_message);
      ("LastRefreshDate", option_to_yojson t_stamp_to_yojson x.last_refresh_date);
      ("Status", option_to_yojson refresh_schemas_status_type_value_to_yojson x.status);
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
      ("EndpointArn", option_to_yojson string__to_yojson x.endpoint_arn);
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
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
      ("EndpointArn", Some (string__to_yojson x.endpoint_arn));
    ]

let redshift_settings_to_yojson (x : redshift_settings) =
  assoc_to_yojson
    [
      ("MapBooleanAsBoolean", option_to_yojson boolean_optional_to_yojson x.map_boolean_as_boolean);
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("WriteBufferSize", option_to_yojson integer_optional_to_yojson x.write_buffer_size);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("TruncateColumns", option_to_yojson boolean_optional_to_yojson x.truncate_columns);
      ("TrimBlanks", option_to_yojson boolean_optional_to_yojson x.trim_blanks);
      ("TimeFormat", option_to_yojson string__to_yojson x.time_format);
      ( "ServerSideEncryptionKmsKeyId",
        option_to_yojson string__to_yojson x.server_side_encryption_kms_key_id );
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("ReplaceChars", option_to_yojson string__to_yojson x.replace_chars);
      ("ReplaceInvalidChars", option_to_yojson string__to_yojson x.replace_invalid_chars);
      ("RemoveQuotes", option_to_yojson boolean_optional_to_yojson x.remove_quotes);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("LoadTimeout", option_to_yojson integer_optional_to_yojson x.load_timeout);
      ( "FileTransferUploadStreams",
        option_to_yojson integer_optional_to_yojson x.file_transfer_upload_streams );
      ("ExplicitIds", option_to_yojson boolean_optional_to_yojson x.explicit_ids);
      ("EncryptionMode", option_to_yojson encryption_mode_value_to_yojson x.encryption_mode);
      ("EmptyAsNull", option_to_yojson boolean_optional_to_yojson x.empty_as_null);
      ("DateFormat", option_to_yojson string__to_yojson x.date_format);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("ConnectionTimeout", option_to_yojson integer_optional_to_yojson x.connection_timeout);
      ("CompUpdate", option_to_yojson boolean_optional_to_yojson x.comp_update);
      ("CaseSensitiveNames", option_to_yojson boolean_optional_to_yojson x.case_sensitive_names);
      ("BucketName", option_to_yojson string__to_yojson x.bucket_name);
      ("BucketFolder", option_to_yojson string__to_yojson x.bucket_folder);
      ("AfterConnectScript", option_to_yojson string__to_yojson x.after_connect_script);
      ("AcceptAnyDate", option_to_yojson boolean_optional_to_yojson x.accept_any_date);
    ]

let redshift_data_provider_settings_to_yojson (x : redshift_data_provider_settings) =
  assoc_to_yojson
    [
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let redis_auth_type_value_to_yojson (x : redis_auth_type_value) =
  match x with
  | AUTH_TOKEN -> `String "auth-token"
  | AUTH_ROLE -> `String "auth-role"
  | NONE -> `String "none"

let redis_settings_to_yojson (x : redis_settings) =
  assoc_to_yojson
    [
      ("SslCaCertificateArn", option_to_yojson string__to_yojson x.ssl_ca_certificate_arn);
      ("AuthPassword", option_to_yojson secret_string_to_yojson x.auth_password);
      ("AuthUserName", option_to_yojson string__to_yojson x.auth_user_name);
      ("AuthType", option_to_yojson redis_auth_type_value_to_yojson x.auth_type);
      ( "SslSecurityProtocol",
        option_to_yojson ssl_security_protocol_value_to_yojson x.ssl_security_protocol );
      ("Port", Some (integer_to_yojson x.port));
      ("ServerName", Some (string__to_yojson x.server_name));
    ]

let rds_requirements_to_yojson (x : rds_requirements) =
  assoc_to_yojson
    [
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("DeploymentOption", option_to_yojson string__to_yojson x.deployment_option);
      ("StorageIops", option_to_yojson integer_optional_to_yojson x.storage_iops);
      ("StorageSize", option_to_yojson integer_optional_to_yojson x.storage_size);
      ("InstanceMemory", option_to_yojson double_optional_to_yojson x.instance_memory);
      ("InstanceVcpu", option_to_yojson double_optional_to_yojson x.instance_vcpu);
      ("EngineEdition", option_to_yojson string__to_yojson x.engine_edition);
    ]

let rds_configuration_to_yojson (x : rds_configuration) =
  assoc_to_yojson
    [
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("DeploymentOption", option_to_yojson string__to_yojson x.deployment_option);
      ("StorageIops", option_to_yojson integer_optional_to_yojson x.storage_iops);
      ("StorageSize", option_to_yojson integer_optional_to_yojson x.storage_size);
      ("StorageType", option_to_yojson string__to_yojson x.storage_type);
      ("InstanceMemory", option_to_yojson double_optional_to_yojson x.instance_memory);
      ("InstanceVcpu", option_to_yojson double_optional_to_yojson x.instance_vcpu);
      ("InstanceType", option_to_yojson string__to_yojson x.instance_type);
      ("EngineEdition", option_to_yojson string__to_yojson x.engine_edition);
    ]

let rds_recommendation_to_yojson (x : rds_recommendation) =
  assoc_to_yojson
    [
      ("TargetConfiguration", option_to_yojson rds_configuration_to_yojson x.target_configuration);
      ("RequirementsToTarget", option_to_yojson rds_requirements_to_yojson x.requirements_to_target);
    ]

let recommendation_data_to_yojson (x : recommendation_data) =
  assoc_to_yojson [ ("RdsEngine", option_to_yojson rds_recommendation_to_yojson x.rds_engine) ]

let recommendation_to_yojson (x : recommendation) =
  assoc_to_yojson
    [
      ("Data", option_to_yojson recommendation_data_to_yojson x.data);
      ("Settings", option_to_yojson recommendation_settings_to_yojson x.settings);
      ("Preferred", option_to_yojson boolean_optional_to_yojson x.preferred);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("CreatedDate", option_to_yojson string__to_yojson x.created_date);
      ("EngineName", option_to_yojson string__to_yojson x.engine_name);
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
    ]

let recommendation_list_to_yojson tree = list_to_yojson recommendation_to_yojson tree

let reboot_replication_instance_response_to_yojson (x : reboot_replication_instance_response) =
  assoc_to_yojson
    [
      ("ReplicationInstance", option_to_yojson replication_instance_to_yojson x.replication_instance);
    ]

let reboot_replication_instance_message_to_yojson (x : reboot_replication_instance_message) =
  assoc_to_yojson
    [
      ("ForcePlannedFailover", option_to_yojson boolean_optional_to_yojson x.force_planned_failover);
      ("ForceFailover", option_to_yojson boolean_optional_to_yojson x.force_failover);
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
    ]

let postgre_sql_data_provider_settings_to_yojson (x : postgre_sql_data_provider_settings) =
  assoc_to_yojson
    [
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let plugin_name_value_to_yojson (x : plugin_name_value) =
  match x with
  | PGLOGICAL -> `String "pglogical"
  | TEST_DECODING -> `String "test-decoding"
  | NO_PREFERENCE -> `String "no-preference"

let long_varchar_mapping_type_to_yojson (x : long_varchar_mapping_type) =
  match x with NCLOB -> `String "nclob" | CLOB -> `String "clob" | WSTRING -> `String "wstring"

let database_mode_to_yojson (x : database_mode) =
  match x with BABELFISH -> `String "babelfish" | DEFAULT -> `String "default"

let postgre_sql_authentication_method_to_yojson (x : postgre_sql_authentication_method) =
  match x with IAM -> `String "iam" | Password -> `String "password"

let postgre_sql_settings_to_yojson (x : postgre_sql_settings) =
  assoc_to_yojson
    [
      ( "AuthenticationMethod",
        option_to_yojson postgre_sql_authentication_method_to_yojson x.authentication_method );
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ( "DisableUnicodeSourceFilter",
        option_to_yojson boolean_optional_to_yojson x.disable_unicode_source_filter );
      ("BabelfishDatabaseName", option_to_yojson string__to_yojson x.babelfish_database_name);
      ("DatabaseMode", option_to_yojson database_mode_to_yojson x.database_mode);
      ( "MapLongVarcharAs",
        option_to_yojson long_varchar_mapping_type_to_yojson x.map_long_varchar_as );
      ("MapJsonbAsClob", option_to_yojson boolean_optional_to_yojson x.map_jsonb_as_clob);
      ("MapBooleanAsBoolean", option_to_yojson boolean_optional_to_yojson x.map_boolean_as_boolean);
      ("TrimSpaceInChar", option_to_yojson boolean_optional_to_yojson x.trim_space_in_char);
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("PluginName", option_to_yojson plugin_name_value_to_yojson x.plugin_name);
      ("SlotName", option_to_yojson string__to_yojson x.slot_name);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("HeartbeatFrequency", option_to_yojson integer_optional_to_yojson x.heartbeat_frequency);
      ("HeartbeatSchema", option_to_yojson string__to_yojson x.heartbeat_schema);
      ("HeartbeatEnable", option_to_yojson boolean_optional_to_yojson x.heartbeat_enable);
      ( "FailTasksOnLobTruncation",
        option_to_yojson boolean_optional_to_yojson x.fail_tasks_on_lob_truncation );
      ("ExecuteTimeout", option_to_yojson integer_optional_to_yojson x.execute_timeout);
      ("DdlArtifactsSchema", option_to_yojson string__to_yojson x.ddl_artifacts_schema);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("CaptureDdls", option_to_yojson boolean_optional_to_yojson x.capture_ddls);
      ("AfterConnectScript", option_to_yojson string__to_yojson x.after_connect_script);
    ]

let pending_maintenance_actions_to_yojson tree =
  list_to_yojson resource_pending_maintenance_actions_to_yojson tree

let availability_zones_list_to_yojson tree = list_to_yojson string__to_yojson tree

let orderable_replication_instance_to_yojson (x : orderable_replication_instance) =
  assoc_to_yojson
    [
      ("ReleaseStatus", option_to_yojson release_status_values_to_yojson x.release_status);
      ("AvailabilityZones", option_to_yojson availability_zones_list_to_yojson x.availability_zones);
      ("IncludedAllocatedStorage", option_to_yojson integer_to_yojson x.included_allocated_storage);
      ("DefaultAllocatedStorage", option_to_yojson integer_to_yojson x.default_allocated_storage);
      ("MaxAllocatedStorage", option_to_yojson integer_to_yojson x.max_allocated_storage);
      ("MinAllocatedStorage", option_to_yojson integer_to_yojson x.min_allocated_storage);
      ("StorageType", option_to_yojson string__to_yojson x.storage_type);
      ( "ReplicationInstanceClass",
        option_to_yojson replication_instance_class_to_yojson x.replication_instance_class );
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
    ]

let orderable_replication_instance_list_to_yojson tree =
  list_to_yojson orderable_replication_instance_to_yojson tree

let integer_list_to_yojson tree = list_to_yojson integer_to_yojson tree

let char_length_semantics_to_yojson (x : char_length_semantics) =
  match x with BYTE -> `String "byte" | CHAR -> `String "char" | DEFAULT -> `String "default"

let oracle_authentication_method_to_yojson (x : oracle_authentication_method) =
  match x with Kerberos -> `String "kerberos" | Password -> `String "password"

let oracle_settings_to_yojson (x : oracle_settings) =
  assoc_to_yojson
    [
      ( "AuthenticationMethod",
        option_to_yojson oracle_authentication_method_to_yojson x.authentication_method );
      ( "OpenTransactionWindow",
        option_to_yojson integer_optional_to_yojson x.open_transaction_window );
      ( "ConvertTimestampWithZoneToUTC",
        option_to_yojson boolean_optional_to_yojson x.convert_timestamp_with_zone_to_ut_c );
      ("TrimSpaceInChar", option_to_yojson boolean_optional_to_yojson x.trim_space_in_char);
      ( "SecretsManagerOracleAsmSecretId",
        option_to_yojson string__to_yojson x.secrets_manager_oracle_asm_secret_id );
      ( "SecretsManagerOracleAsmAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_oracle_asm_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("UseLogminerReader", option_to_yojson boolean_optional_to_yojson x.use_logminer_reader);
      ( "UseDirectPathFullLoad",
        option_to_yojson boolean_optional_to_yojson x.use_direct_path_full_load );
      ("UseBFile", option_to_yojson boolean_optional_to_yojson x.use_b_file);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("StandbyDelayTime", option_to_yojson integer_optional_to_yojson x.standby_delay_time);
      ( "SpatialDataOptionToGeoJsonFunctionName",
        option_to_yojson string__to_yojson x.spatial_data_option_to_geo_json_function_name );
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("SecurityDbEncryptionName", option_to_yojson string__to_yojson x.security_db_encryption_name);
      ("SecurityDbEncryption", option_to_yojson secret_string_to_yojson x.security_db_encryption);
      ("RetryInterval", option_to_yojson integer_optional_to_yojson x.retry_interval);
      ("ReadTableSpaceName", option_to_yojson boolean_optional_to_yojson x.read_table_space_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("NumberDatatypeScale", option_to_yojson integer_optional_to_yojson x.number_datatype_scale);
      ( "FailTasksOnLobTruncation",
        option_to_yojson boolean_optional_to_yojson x.fail_tasks_on_lob_truncation );
      ( "DirectPathParallelLoad",
        option_to_yojson boolean_optional_to_yojson x.direct_path_parallel_load );
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ( "CharLengthSemantics",
        option_to_yojson char_length_semantics_to_yojson x.char_length_semantics );
      ("AsmUser", option_to_yojson string__to_yojson x.asm_user);
      ("AsmServer", option_to_yojson string__to_yojson x.asm_server);
      ("AsmPassword", option_to_yojson secret_string_to_yojson x.asm_password);
      ("ArchivedLogsOnly", option_to_yojson boolean_optional_to_yojson x.archived_logs_only);
      ("DirectPathNoLog", option_to_yojson boolean_optional_to_yojson x.direct_path_no_log);
      ( "EnableHomogenousTablespace",
        option_to_yojson boolean_optional_to_yojson x.enable_homogenous_tablespace );
      ("ReplacePathPrefix", option_to_yojson boolean_optional_to_yojson x.replace_path_prefix);
      ("UsePathPrefix", option_to_yojson string__to_yojson x.use_path_prefix);
      ("OraclePathPrefix", option_to_yojson string__to_yojson x.oracle_path_prefix);
      ( "UseAlternateFolderForOnline",
        option_to_yojson boolean_optional_to_yojson x.use_alternate_folder_for_online );
      ( "AccessAlternateDirectly",
        option_to_yojson boolean_optional_to_yojson x.access_alternate_directly );
      ("ReadAheadBlocks", option_to_yojson integer_optional_to_yojson x.read_ahead_blocks);
      ( "ParallelAsmReadThreads",
        option_to_yojson integer_optional_to_yojson x.parallel_asm_read_threads );
      ( "AllowSelectNestedTables",
        option_to_yojson boolean_optional_to_yojson x.allow_select_nested_tables );
      ( "ExtraArchivedLogDestIds",
        option_to_yojson integer_list_to_yojson x.extra_archived_log_dest_ids );
      ( "AdditionalArchivedLogDestId",
        option_to_yojson integer_optional_to_yojson x.additional_archived_log_dest_id );
      ("ArchivedLogDestId", option_to_yojson integer_optional_to_yojson x.archived_log_dest_id);
      ( "AddSupplementalLogging",
        option_to_yojson boolean_optional_to_yojson x.add_supplemental_logging );
    ]

let oracle_data_provider_settings_to_yojson (x : oracle_data_provider_settings) =
  assoc_to_yojson
    [
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ( "SecretsManagerSecurityDbEncryptionAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_security_db_encryption_access_role_arn
      );
      ( "SecretsManagerSecurityDbEncryptionSecretId",
        option_to_yojson string__to_yojson x.secrets_manager_security_db_encryption_secret_id );
      ( "SecretsManagerOracleAsmAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_oracle_asm_access_role_arn );
      ( "SecretsManagerOracleAsmSecretId",
        option_to_yojson string__to_yojson x.secrets_manager_oracle_asm_secret_id );
      ("AsmServer", option_to_yojson string__to_yojson x.asm_server);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let nesting_level_value_to_yojson (x : nesting_level_value) =
  match x with ONE -> `String "one" | NONE -> `String "none"

let neptune_settings_to_yojson (x : neptune_settings) =
  assoc_to_yojson
    [
      ("IamAuthEnabled", option_to_yojson boolean_optional_to_yojson x.iam_auth_enabled);
      ("MaxRetryCount", option_to_yojson integer_optional_to_yojson x.max_retry_count);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("ErrorRetryDuration", option_to_yojson integer_optional_to_yojson x.error_retry_duration);
      ("S3BucketFolder", Some (string__to_yojson x.s3_bucket_folder));
      ("S3BucketName", Some (string__to_yojson x.s3_bucket_name));
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
    ]

let my_sql_data_provider_settings_to_yojson (x : my_sql_data_provider_settings) =
  assoc_to_yojson
    [
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let my_sql_authentication_method_to_yojson (x : my_sql_authentication_method) =
  match x with IAM -> `String "iam" | Password -> `String "password"

let my_sql_settings_to_yojson (x : my_sql_settings) =
  assoc_to_yojson
    [
      ( "AuthenticationMethod",
        option_to_yojson my_sql_authentication_method_to_yojson x.authentication_method );
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("ExecuteTimeout", option_to_yojson integer_optional_to_yojson x.execute_timeout);
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("Username", option_to_yojson string__to_yojson x.username);
      ("ServerTimezone", option_to_yojson string__to_yojson x.server_timezone);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("ParallelLoadThreads", option_to_yojson integer_optional_to_yojson x.parallel_load_threads);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("TargetDbType", option_to_yojson target_db_type_to_yojson x.target_db_type);
      ("EventsPollInterval", option_to_yojson integer_optional_to_yojson x.events_poll_interval);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ( "CleanSourceMetadataOnMismatch",
        option_to_yojson boolean_optional_to_yojson x.clean_source_metadata_on_mismatch );
      ("AfterConnectScript", option_to_yojson string__to_yojson x.after_connect_script);
    ]

let move_replication_task_response_to_yojson (x : move_replication_task_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let move_replication_task_message_to_yojson (x : move_replication_task_message) =
  assoc_to_yojson
    [
      ("TargetReplicationInstanceArn", Some (string__to_yojson x.target_replication_instance_arn));
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
    ]

let auth_type_value_to_yojson (x : auth_type_value) =
  match x with PASSWORD -> `String "password" | NO -> `String "no"

let auth_mechanism_value_to_yojson (x : auth_mechanism_value) =
  match x with
  | SCRAM_SHA_1 -> `String "scram_sha_1"
  | MONGODB_CR -> `String "mongodb_cr"
  | DEFAULT -> `String "default"

let mongo_db_settings_to_yojson (x : mongo_db_settings) =
  assoc_to_yojson
    [
      ( "ReplicateShardCollections",
        option_to_yojson boolean_optional_to_yojson x.replicate_shard_collections );
      ("UseUpdateLookUp", option_to_yojson boolean_optional_to_yojson x.use_update_look_up);
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("AuthSource", option_to_yojson string__to_yojson x.auth_source);
      ("DocsToInvestigate", option_to_yojson string__to_yojson x.docs_to_investigate);
      ("ExtractDocId", option_to_yojson string__to_yojson x.extract_doc_id);
      ("NestingLevel", option_to_yojson nesting_level_value_to_yojson x.nesting_level);
      ("AuthMechanism", option_to_yojson auth_mechanism_value_to_yojson x.auth_mechanism);
      ("AuthType", option_to_yojson auth_type_value_to_yojson x.auth_type);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("Username", option_to_yojson string__to_yojson x.username);
    ]

let mongo_db_data_provider_settings_to_yojson (x : mongo_db_data_provider_settings) =
  assoc_to_yojson
    [
      ("AuthMechanism", option_to_yojson auth_mechanism_value_to_yojson x.auth_mechanism);
      ("AuthSource", option_to_yojson string__to_yojson x.auth_source);
      ("AuthType", option_to_yojson auth_type_value_to_yojson x.auth_type);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let modify_replication_task_response_to_yojson (x : modify_replication_task_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let modify_replication_task_message_to_yojson (x : modify_replication_task_message) =
  assoc_to_yojson
    [
      ("TaskData", option_to_yojson string__to_yojson x.task_data);
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CdcStartTime", option_to_yojson t_stamp_to_yojson x.cdc_start_time);
      ("ReplicationTaskSettings", option_to_yojson string__to_yojson x.replication_task_settings);
      ("TableMappings", option_to_yojson string__to_yojson x.table_mappings);
      ("MigrationType", option_to_yojson migration_type_value_to_yojson x.migration_type);
      ("ReplicationTaskIdentifier", option_to_yojson string__to_yojson x.replication_task_identifier);
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
    ]

let modify_replication_subnet_group_response_to_yojson
    (x : modify_replication_subnet_group_response) =
  assoc_to_yojson
    [
      ( "ReplicationSubnetGroup",
        option_to_yojson replication_subnet_group_to_yojson x.replication_subnet_group );
    ]

let modify_replication_subnet_group_message_to_yojson (x : modify_replication_subnet_group_message)
    =
  assoc_to_yojson
    [
      ("SubnetIds", Some (subnet_identifier_list_to_yojson x.subnet_ids));
      ( "ReplicationSubnetGroupDescription",
        option_to_yojson string__to_yojson x.replication_subnet_group_description );
      ( "ReplicationSubnetGroupIdentifier",
        Some (string__to_yojson x.replication_subnet_group_identifier) );
    ]

let invalid_subnet_to_yojson (x : invalid_subnet) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let modify_replication_instance_response_to_yojson (x : modify_replication_instance_response) =
  assoc_to_yojson
    [
      ("ReplicationInstance", option_to_yojson replication_instance_to_yojson x.replication_instance);
    ]

let modify_replication_instance_message_to_yojson (x : modify_replication_instance_message) =
  assoc_to_yojson
    [
      ( "KerberosAuthenticationSettings",
        option_to_yojson kerberos_authentication_settings_to_yojson
          x.kerberos_authentication_settings );
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ( "ReplicationInstanceIdentifier",
        option_to_yojson string__to_yojson x.replication_instance_identifier );
      ( "AutoMinorVersionUpgrade",
        option_to_yojson boolean_optional_to_yojson x.auto_minor_version_upgrade );
      ("AllowMajorVersionUpgrade", option_to_yojson boolean__to_yojson x.allow_major_version_upgrade);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("MultiAZ", option_to_yojson boolean_optional_to_yojson x.multi_a_z);
      ( "PreferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ( "VpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "ReplicationInstanceClass",
        option_to_yojson replication_instance_class_to_yojson x.replication_instance_class );
      ("ApplyImmediately", option_to_yojson boolean__to_yojson x.apply_immediately);
      ("AllocatedStorage", option_to_yojson integer_optional_to_yojson x.allocated_storage);
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
    ]

let insufficient_resource_capacity_fault_to_yojson (x : insufficient_resource_capacity_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let modify_replication_config_response_to_yojson (x : modify_replication_config_response) =
  assoc_to_yojson
    [ ("ReplicationConfig", option_to_yojson replication_config_to_yojson x.replication_config) ]

let modify_replication_config_message_to_yojson (x : modify_replication_config_message) =
  assoc_to_yojson
    [
      ("TargetEndpointArn", option_to_yojson string__to_yojson x.target_endpoint_arn);
      ("SourceEndpointArn", option_to_yojson string__to_yojson x.source_endpoint_arn);
      ("ComputeConfig", option_to_yojson compute_config_to_yojson x.compute_config);
      ("SupplementalSettings", option_to_yojson string__to_yojson x.supplemental_settings);
      ("ReplicationSettings", option_to_yojson string__to_yojson x.replication_settings);
      ("TableMappings", option_to_yojson string__to_yojson x.table_mappings);
      ("ReplicationType", option_to_yojson migration_type_value_to_yojson x.replication_type);
      ( "ReplicationConfigIdentifier",
        option_to_yojson string__to_yojson x.replication_config_identifier );
      ("ReplicationConfigArn", Some (string__to_yojson x.replication_config_arn));
    ]

let data_provider_descriptor_to_yojson (x : data_provider_descriptor) =
  assoc_to_yojson
    [
      ("DataProviderArn", option_to_yojson string__to_yojson x.data_provider_arn);
      ("DataProviderName", option_to_yojson string__to_yojson x.data_provider_name);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
    ]

let data_provider_descriptor_list_to_yojson tree =
  list_to_yojson data_provider_descriptor_to_yojson tree

let migration_project_to_yojson (x : migration_project) =
  assoc_to_yojson
    [
      ( "SchemaConversionApplicationAttributes",
        option_to_yojson sc_application_attributes_to_yojson
          x.schema_conversion_application_attributes );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("TransformationRules", option_to_yojson string__to_yojson x.transformation_rules);
      ("InstanceProfileName", option_to_yojson string__to_yojson x.instance_profile_name);
      ("InstanceProfileArn", option_to_yojson string__to_yojson x.instance_profile_arn);
      ( "TargetDataProviderDescriptors",
        option_to_yojson data_provider_descriptor_list_to_yojson x.target_data_provider_descriptors
      );
      ( "SourceDataProviderDescriptors",
        option_to_yojson data_provider_descriptor_list_to_yojson x.source_data_provider_descriptors
      );
      ( "MigrationProjectCreationTime",
        option_to_yojson iso8601_date_time_to_yojson x.migration_project_creation_time );
      ("MigrationProjectArn", option_to_yojson string__to_yojson x.migration_project_arn);
      ("MigrationProjectName", option_to_yojson string__to_yojson x.migration_project_name);
    ]

let modify_migration_project_response_to_yojson (x : modify_migration_project_response) =
  assoc_to_yojson
    [ ("MigrationProject", option_to_yojson migration_project_to_yojson x.migration_project) ]

let data_provider_descriptor_definition_to_yojson (x : data_provider_descriptor_definition) =
  assoc_to_yojson
    [
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ("DataProviderIdentifier", Some (string__to_yojson x.data_provider_identifier));
    ]

let data_provider_descriptor_definition_list_to_yojson tree =
  list_to_yojson data_provider_descriptor_definition_to_yojson tree

let modify_migration_project_message_to_yojson (x : modify_migration_project_message) =
  assoc_to_yojson
    [
      ( "SchemaConversionApplicationAttributes",
        option_to_yojson sc_application_attributes_to_yojson
          x.schema_conversion_application_attributes );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("TransformationRules", option_to_yojson string__to_yojson x.transformation_rules);
      ("InstanceProfileIdentifier", option_to_yojson string__to_yojson x.instance_profile_identifier);
      ( "TargetDataProviderDescriptors",
        option_to_yojson data_provider_descriptor_definition_list_to_yojson
          x.target_data_provider_descriptors );
      ( "SourceDataProviderDescriptors",
        option_to_yojson data_provider_descriptor_definition_list_to_yojson
          x.source_data_provider_descriptors );
      ("MigrationProjectName", option_to_yojson string__to_yojson x.migration_project_name);
      ("MigrationProjectIdentifier", Some (string__to_yojson x.migration_project_identifier));
    ]

let instance_profile_to_yojson (x : instance_profile) =
  assoc_to_yojson
    [
      ("VpcSecurityGroups", option_to_yojson string_list_to_yojson x.vpc_security_groups);
      ("SubnetGroupIdentifier", option_to_yojson string__to_yojson x.subnet_group_identifier);
      ( "InstanceProfileCreationTime",
        option_to_yojson iso8601_date_time_to_yojson x.instance_profile_creation_time );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("InstanceProfileName", option_to_yojson string__to_yojson x.instance_profile_name);
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ("PubliclyAccessible", option_to_yojson boolean_optional_to_yojson x.publicly_accessible);
      ("KmsKeyArn", option_to_yojson string__to_yojson x.kms_key_arn);
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("InstanceProfileArn", option_to_yojson string__to_yojson x.instance_profile_arn);
    ]

let modify_instance_profile_response_to_yojson (x : modify_instance_profile_response) =
  assoc_to_yojson
    [ ("InstanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile) ]

let modify_instance_profile_message_to_yojson (x : modify_instance_profile_message) =
  assoc_to_yojson
    [
      ("VpcSecurityGroups", option_to_yojson string_list_to_yojson x.vpc_security_groups);
      ("SubnetGroupIdentifier", option_to_yojson string__to_yojson x.subnet_group_identifier);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("InstanceProfileName", option_to_yojson string__to_yojson x.instance_profile_name);
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ("PubliclyAccessible", option_to_yojson boolean_optional_to_yojson x.publicly_accessible);
      ("KmsKeyArn", option_to_yojson string__to_yojson x.kms_key_arn);
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("InstanceProfileIdentifier", Some (string__to_yojson x.instance_profile_identifier));
    ]

let event_categories_list_to_yojson tree = list_to_yojson string__to_yojson tree

let event_subscription_to_yojson (x : event_subscription) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
      ( "EventCategoriesList",
        option_to_yojson event_categories_list_to_yojson x.event_categories_list );
      ("SourceIdsList", option_to_yojson source_ids_list_to_yojson x.source_ids_list);
      ("SourceType", option_to_yojson string__to_yojson x.source_type);
      ("SubscriptionCreationTime", option_to_yojson string__to_yojson x.subscription_creation_time);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("CustSubscriptionId", option_to_yojson string__to_yojson x.cust_subscription_id);
      ("CustomerAwsId", option_to_yojson string__to_yojson x.customer_aws_id);
    ]

let modify_event_subscription_response_to_yojson (x : modify_event_subscription_response) =
  assoc_to_yojson
    [ ("EventSubscription", option_to_yojson event_subscription_to_yojson x.event_subscription) ]

let modify_event_subscription_message_to_yojson (x : modify_event_subscription_message) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean_optional_to_yojson x.enabled);
      ("EventCategories", option_to_yojson event_categories_list_to_yojson x.event_categories);
      ("SourceType", option_to_yojson string__to_yojson x.source_type);
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("SubscriptionName", Some (string__to_yojson x.subscription_name));
    ]

let kms_throttling_fault_to_yojson (x : kms_throttling_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let dynamo_db_settings_to_yojson (x : dynamo_db_settings) =
  assoc_to_yojson [ ("ServiceAccessRoleArn", Some (string__to_yojson x.service_access_role_arn)) ]

let dms_transfer_settings_to_yojson (x : dms_transfer_settings) =
  assoc_to_yojson
    [
      ("BucketName", option_to_yojson string__to_yojson x.bucket_name);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
    ]

let message_format_value_to_yojson (x : message_format_value) =
  match x with JSON_UNFORMATTED -> `String "json-unformatted" | JSON -> `String "json"

let kinesis_settings_to_yojson (x : kinesis_settings) =
  assoc_to_yojson
    [
      ("UseLargeIntegerValue", option_to_yojson boolean_optional_to_yojson x.use_large_integer_value);
      ("NoHexPrefix", option_to_yojson boolean_optional_to_yojson x.no_hex_prefix);
      ("IncludeNullAndEmpty", option_to_yojson boolean_optional_to_yojson x.include_null_and_empty);
      ( "IncludeControlDetails",
        option_to_yojson boolean_optional_to_yojson x.include_control_details );
      ( "IncludeTableAlterOperations",
        option_to_yojson boolean_optional_to_yojson x.include_table_alter_operations );
      ( "PartitionIncludeSchemaTable",
        option_to_yojson boolean_optional_to_yojson x.partition_include_schema_table );
      ( "IncludePartitionValue",
        option_to_yojson boolean_optional_to_yojson x.include_partition_value );
      ( "IncludeTransactionDetails",
        option_to_yojson boolean_optional_to_yojson x.include_transaction_details );
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("MessageFormat", option_to_yojson message_format_value_to_yojson x.message_format);
      ("StreamArn", option_to_yojson string__to_yojson x.stream_arn);
    ]

let kafka_security_protocol_to_yojson (x : kafka_security_protocol) =
  match x with
  | SASL_SSL -> `String "sasl-ssl"
  | SSL_ENCRYPTION -> `String "ssl-encryption"
  | SSL_AUTHENTICATION -> `String "ssl-authentication"
  | PLAINTEXT -> `String "plaintext"

let kafka_sasl_mechanism_to_yojson (x : kafka_sasl_mechanism) =
  match x with PLAIN -> `String "plain" | SCRAM_SHA_512 -> `String "scram-sha-512"

let kafka_ssl_endpoint_identification_algorithm_to_yojson
    (x : kafka_ssl_endpoint_identification_algorithm) =
  match x with HTTPS -> `String "https" | NONE -> `String "none"

let kafka_settings_to_yojson (x : kafka_settings) =
  assoc_to_yojson
    [
      ("UseLargeIntegerValue", option_to_yojson boolean_optional_to_yojson x.use_large_integer_value);
      ( "SslEndpointIdentificationAlgorithm",
        option_to_yojson kafka_ssl_endpoint_identification_algorithm_to_yojson
          x.ssl_endpoint_identification_algorithm );
      ("SaslMechanism", option_to_yojson kafka_sasl_mechanism_to_yojson x.sasl_mechanism);
      ("NoHexPrefix", option_to_yojson boolean_optional_to_yojson x.no_hex_prefix);
      ("SaslPassword", option_to_yojson secret_string_to_yojson x.sasl_password);
      ("SaslUsername", option_to_yojson string__to_yojson x.sasl_username);
      ("SslCaCertificateArn", option_to_yojson string__to_yojson x.ssl_ca_certificate_arn);
      ("SslClientKeyPassword", option_to_yojson secret_string_to_yojson x.ssl_client_key_password);
      ("SslClientKeyArn", option_to_yojson string__to_yojson x.ssl_client_key_arn);
      ("SslClientCertificateArn", option_to_yojson string__to_yojson x.ssl_client_certificate_arn);
      ("SecurityProtocol", option_to_yojson kafka_security_protocol_to_yojson x.security_protocol);
      ("IncludeNullAndEmpty", option_to_yojson boolean_optional_to_yojson x.include_null_and_empty);
      ("MessageMaxBytes", option_to_yojson integer_optional_to_yojson x.message_max_bytes);
      ( "IncludeControlDetails",
        option_to_yojson boolean_optional_to_yojson x.include_control_details );
      ( "IncludeTableAlterOperations",
        option_to_yojson boolean_optional_to_yojson x.include_table_alter_operations );
      ( "PartitionIncludeSchemaTable",
        option_to_yojson boolean_optional_to_yojson x.partition_include_schema_table );
      ( "IncludePartitionValue",
        option_to_yojson boolean_optional_to_yojson x.include_partition_value );
      ( "IncludeTransactionDetails",
        option_to_yojson boolean_optional_to_yojson x.include_transaction_details );
      ("MessageFormat", option_to_yojson message_format_value_to_yojson x.message_format);
      ("Topic", option_to_yojson string__to_yojson x.topic);
      ("Broker", option_to_yojson string__to_yojson x.broker);
    ]

let elasticsearch_settings_to_yojson (x : elasticsearch_settings) =
  assoc_to_yojson
    [
      ("UseNewMappingType", option_to_yojson boolean_optional_to_yojson x.use_new_mapping_type);
      ("ErrorRetryDuration", option_to_yojson integer_optional_to_yojson x.error_retry_duration);
      ( "FullLoadErrorPercentage",
        option_to_yojson integer_optional_to_yojson x.full_load_error_percentage );
      ("EndpointUri", Some (string__to_yojson x.endpoint_uri));
      ("ServiceAccessRoleArn", Some (string__to_yojson x.service_access_role_arn));
    ]

let microsoft_sql_server_settings_to_yojson (x : microsoft_sql_server_settings) =
  assoc_to_yojson
    [
      ( "AuthenticationMethod",
        option_to_yojson sql_server_authentication_method_to_yojson x.authentication_method );
      ("ForceLobLookup", option_to_yojson boolean_optional_to_yojson x.force_lob_lookup);
      ("TlogAccessMode", option_to_yojson tlog_access_mode_to_yojson x.tlog_access_mode);
      ("TrimSpaceInChar", option_to_yojson boolean_optional_to_yojson x.trim_space_in_char);
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ( "UseThirdPartyBackupDevice",
        option_to_yojson boolean_optional_to_yojson x.use_third_party_backup_device );
      ("UseBcpFullLoad", option_to_yojson boolean_optional_to_yojson x.use_bcp_full_load);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("SafeguardPolicy", option_to_yojson safeguard_policy_to_yojson x.safeguard_policy);
      ("ReadBackupOnly", option_to_yojson boolean_optional_to_yojson x.read_backup_only);
      ( "QuerySingleAlwaysOnNode",
        option_to_yojson boolean_optional_to_yojson x.query_single_always_on_node );
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("ControlTablesFileGroup", option_to_yojson string__to_yojson x.control_tables_file_group);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("BcpPacketSize", option_to_yojson integer_optional_to_yojson x.bcp_packet_size);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
    ]

let ibm_db2_settings_to_yojson (x : ibm_db2_settings) =
  assoc_to_yojson
    [
      ("KeepCsvFiles", option_to_yojson boolean_optional_to_yojson x.keep_csv_files);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("WriteBufferSize", option_to_yojson integer_optional_to_yojson x.write_buffer_size);
      ("LoadTimeout", option_to_yojson integer_optional_to_yojson x.load_timeout);
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("Username", option_to_yojson string__to_yojson x.username);
      ("MaxKBytesPerRead", option_to_yojson integer_optional_to_yojson x.max_k_bytes_per_read);
      ("CurrentLsn", option_to_yojson string__to_yojson x.current_lsn);
      ( "SetDataCaptureChanges",
        option_to_yojson boolean_optional_to_yojson x.set_data_capture_changes );
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
    ]

let doc_db_settings_to_yojson (x : doc_db_settings) =
  assoc_to_yojson
    [
      ( "ReplicateShardCollections",
        option_to_yojson boolean_optional_to_yojson x.replicate_shard_collections );
      ("UseUpdateLookUp", option_to_yojson boolean_optional_to_yojson x.use_update_look_up);
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("DocsToInvestigate", option_to_yojson integer_optional_to_yojson x.docs_to_investigate);
      ("ExtractDocId", option_to_yojson boolean_optional_to_yojson x.extract_doc_id);
      ("NestingLevel", option_to_yojson nesting_level_value_to_yojson x.nesting_level);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("Username", option_to_yojson string__to_yojson x.username);
    ]

let gcp_my_sql_settings_to_yojson (x : gcp_my_sql_settings) =
  assoc_to_yojson
    [
      ("SecretsManagerSecretId", option_to_yojson string__to_yojson x.secrets_manager_secret_id);
      ( "SecretsManagerAccessRoleArn",
        option_to_yojson string__to_yojson x.secrets_manager_access_role_arn );
      ("Username", option_to_yojson string__to_yojson x.username);
      ("ServerTimezone", option_to_yojson string__to_yojson x.server_timezone);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("ParallelLoadThreads", option_to_yojson integer_optional_to_yojson x.parallel_load_threads);
      ("MaxFileSize", option_to_yojson integer_optional_to_yojson x.max_file_size);
      ("TargetDbType", option_to_yojson target_db_type_to_yojson x.target_db_type);
      ("EventsPollInterval", option_to_yojson integer_optional_to_yojson x.events_poll_interval);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ( "CleanSourceMetadataOnMismatch",
        option_to_yojson boolean_optional_to_yojson x.clean_source_metadata_on_mismatch );
      ("AfterConnectScript", option_to_yojson string__to_yojson x.after_connect_script);
    ]

let lakehouse_settings_to_yojson (x : lakehouse_settings) =
  assoc_to_yojson [ ("Arn", Some (string__to_yojson x.arn)) ]

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("LakehouseSettings", option_to_yojson lakehouse_settings_to_yojson x.lakehouse_settings);
      ("TimestreamSettings", option_to_yojson timestream_settings_to_yojson x.timestream_settings);
      ("GcpMySQLSettings", option_to_yojson gcp_my_sql_settings_to_yojson x.gcp_my_sql_settings);
      ("RedisSettings", option_to_yojson redis_settings_to_yojson x.redis_settings);
      ("DocDbSettings", option_to_yojson doc_db_settings_to_yojson x.doc_db_settings);
      ("IBMDb2Settings", option_to_yojson ibm_db2_settings_to_yojson x.ibm_db2_settings);
      ( "MicrosoftSQLServerSettings",
        option_to_yojson microsoft_sql_server_settings_to_yojson x.microsoft_sql_server_settings );
      ("SybaseSettings", option_to_yojson sybase_settings_to_yojson x.sybase_settings);
      ("OracleSettings", option_to_yojson oracle_settings_to_yojson x.oracle_settings);
      ("MySQLSettings", option_to_yojson my_sql_settings_to_yojson x.my_sql_settings);
      ("PostgreSQLSettings", option_to_yojson postgre_sql_settings_to_yojson x.postgre_sql_settings);
      ("RedshiftSettings", option_to_yojson redshift_settings_to_yojson x.redshift_settings);
      ("NeptuneSettings", option_to_yojson neptune_settings_to_yojson x.neptune_settings);
      ( "ElasticsearchSettings",
        option_to_yojson elasticsearch_settings_to_yojson x.elasticsearch_settings );
      ("KafkaSettings", option_to_yojson kafka_settings_to_yojson x.kafka_settings);
      ("KinesisSettings", option_to_yojson kinesis_settings_to_yojson x.kinesis_settings);
      ("MongoDbSettings", option_to_yojson mongo_db_settings_to_yojson x.mongo_db_settings);
      ( "DmsTransferSettings",
        option_to_yojson dms_transfer_settings_to_yojson x.dms_transfer_settings );
      ("S3Settings", option_to_yojson s3_settings_to_yojson x.s3_settings);
      ("DynamoDbSettings", option_to_yojson dynamo_db_settings_to_yojson x.dynamo_db_settings);
      ("IsReadOnly", option_to_yojson boolean_optional_to_yojson x.is_read_only);
      ("ExternalId", option_to_yojson string__to_yojson x.external_id);
      ("ExternalTableDefinition", option_to_yojson string__to_yojson x.external_table_definition);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("EndpointArn", option_to_yojson string__to_yojson x.endpoint_arn);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("ExtraConnectionAttributes", option_to_yojson string__to_yojson x.extra_connection_attributes);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("EngineDisplayName", option_to_yojson string__to_yojson x.engine_display_name);
      ("EngineName", option_to_yojson string__to_yojson x.engine_name);
      ("EndpointType", option_to_yojson replication_endpoint_type_value_to_yojson x.endpoint_type);
      ("EndpointIdentifier", option_to_yojson string__to_yojson x.endpoint_identifier);
    ]

let modify_endpoint_response_to_yojson (x : modify_endpoint_response) =
  assoc_to_yojson [ ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint) ]

let modify_endpoint_message_to_yojson (x : modify_endpoint_message) =
  assoc_to_yojson
    [
      ("TimestreamSettings", option_to_yojson timestream_settings_to_yojson x.timestream_settings);
      ("GcpMySQLSettings", option_to_yojson gcp_my_sql_settings_to_yojson x.gcp_my_sql_settings);
      ("ExactSettings", option_to_yojson boolean_optional_to_yojson x.exact_settings);
      ("RedisSettings", option_to_yojson redis_settings_to_yojson x.redis_settings);
      ("DocDbSettings", option_to_yojson doc_db_settings_to_yojson x.doc_db_settings);
      ("IBMDb2Settings", option_to_yojson ibm_db2_settings_to_yojson x.ibm_db2_settings);
      ( "MicrosoftSQLServerSettings",
        option_to_yojson microsoft_sql_server_settings_to_yojson x.microsoft_sql_server_settings );
      ("SybaseSettings", option_to_yojson sybase_settings_to_yojson x.sybase_settings);
      ("OracleSettings", option_to_yojson oracle_settings_to_yojson x.oracle_settings);
      ("MySQLSettings", option_to_yojson my_sql_settings_to_yojson x.my_sql_settings);
      ("PostgreSQLSettings", option_to_yojson postgre_sql_settings_to_yojson x.postgre_sql_settings);
      ("RedshiftSettings", option_to_yojson redshift_settings_to_yojson x.redshift_settings);
      ("NeptuneSettings", option_to_yojson neptune_settings_to_yojson x.neptune_settings);
      ( "ElasticsearchSettings",
        option_to_yojson elasticsearch_settings_to_yojson x.elasticsearch_settings );
      ("KafkaSettings", option_to_yojson kafka_settings_to_yojson x.kafka_settings);
      ("KinesisSettings", option_to_yojson kinesis_settings_to_yojson x.kinesis_settings);
      ("MongoDbSettings", option_to_yojson mongo_db_settings_to_yojson x.mongo_db_settings);
      ( "DmsTransferSettings",
        option_to_yojson dms_transfer_settings_to_yojson x.dms_transfer_settings );
      ("S3Settings", option_to_yojson s3_settings_to_yojson x.s3_settings);
      ("DynamoDbSettings", option_to_yojson dynamo_db_settings_to_yojson x.dynamo_db_settings);
      ("ExternalTableDefinition", option_to_yojson string__to_yojson x.external_table_definition);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("ExtraConnectionAttributes", option_to_yojson string__to_yojson x.extra_connection_attributes);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("EngineName", option_to_yojson string__to_yojson x.engine_name);
      ("EndpointType", option_to_yojson replication_endpoint_type_value_to_yojson x.endpoint_type);
      ("EndpointIdentifier", option_to_yojson string__to_yojson x.endpoint_identifier);
      ("EndpointArn", Some (string__to_yojson x.endpoint_arn));
    ]

let microsoft_sql_server_data_provider_settings_to_yojson
    (x : microsoft_sql_server_data_provider_settings) =
  assoc_to_yojson
    [
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let doc_db_data_provider_settings_to_yojson (x : doc_db_data_provider_settings) =
  assoc_to_yojson
    [
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let maria_db_data_provider_settings_to_yojson (x : maria_db_data_provider_settings) =
  assoc_to_yojson
    [
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let ibm_db2_luw_data_provider_settings_to_yojson (x : ibm_db2_luw_data_provider_settings) =
  assoc_to_yojson
    [
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("SecurityMechanism", option_to_yojson integer_optional_to_yojson x.security_mechanism);
      ("EncryptionAlgorithm", option_to_yojson integer_optional_to_yojson x.encryption_algorithm);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let ibm_db2z_os_data_provider_settings_to_yojson (x : ibm_db2z_os_data_provider_settings) =
  assoc_to_yojson
    [
      ("S3AccessRoleArn", option_to_yojson string__to_yojson x.s3_access_role_arn);
      ("S3Path", option_to_yojson string__to_yojson x.s3_path);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
    ]

let data_provider_settings_to_yojson (x : data_provider_settings) =
  match x with
  | MongoDbSettings arg ->
      assoc_to_yojson [ ("MongoDbSettings", Some (mongo_db_data_provider_settings_to_yojson arg)) ]
  | IbmDb2zOsSettings arg ->
      assoc_to_yojson
        [ ("IbmDb2zOsSettings", Some (ibm_db2z_os_data_provider_settings_to_yojson arg)) ]
  | IbmDb2LuwSettings arg ->
      assoc_to_yojson
        [ ("IbmDb2LuwSettings", Some (ibm_db2_luw_data_provider_settings_to_yojson arg)) ]
  | MariaDbSettings arg ->
      assoc_to_yojson [ ("MariaDbSettings", Some (maria_db_data_provider_settings_to_yojson arg)) ]
  | DocDbSettings arg ->
      assoc_to_yojson [ ("DocDbSettings", Some (doc_db_data_provider_settings_to_yojson arg)) ]
  | MicrosoftSqlServerSettings arg ->
      assoc_to_yojson
        [
          ( "MicrosoftSqlServerSettings",
            Some (microsoft_sql_server_data_provider_settings_to_yojson arg) );
        ]
  | SybaseAseSettings arg ->
      assoc_to_yojson
        [ ("SybaseAseSettings", Some (sybase_ase_data_provider_settings_to_yojson arg)) ]
  | OracleSettings arg ->
      assoc_to_yojson [ ("OracleSettings", Some (oracle_data_provider_settings_to_yojson arg)) ]
  | MySqlSettings arg ->
      assoc_to_yojson [ ("MySqlSettings", Some (my_sql_data_provider_settings_to_yojson arg)) ]
  | PostgreSqlSettings arg ->
      assoc_to_yojson
        [ ("PostgreSqlSettings", Some (postgre_sql_data_provider_settings_to_yojson arg)) ]
  | RedshiftSettings arg ->
      assoc_to_yojson [ ("RedshiftSettings", Some (redshift_data_provider_settings_to_yojson arg)) ]

let data_provider_to_yojson (x : data_provider) =
  assoc_to_yojson
    [
      ("Settings", option_to_yojson data_provider_settings_to_yojson x.settings);
      ("Virtual", option_to_yojson boolean_optional_to_yojson x.\#virtual);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "DataProviderCreationTime",
        option_to_yojson iso8601_date_time_to_yojson x.data_provider_creation_time );
      ("DataProviderArn", option_to_yojson string__to_yojson x.data_provider_arn);
      ("DataProviderName", option_to_yojson string__to_yojson x.data_provider_name);
    ]

let modify_data_provider_response_to_yojson (x : modify_data_provider_response) =
  assoc_to_yojson [ ("DataProvider", option_to_yojson data_provider_to_yojson x.data_provider) ]

let modify_data_provider_message_to_yojson (x : modify_data_provider_message) =
  assoc_to_yojson
    [
      ("Settings", option_to_yojson data_provider_settings_to_yojson x.settings);
      ("ExactSettings", option_to_yojson boolean_optional_to_yojson x.exact_settings);
      ("Virtual", option_to_yojson boolean_optional_to_yojson x.\#virtual);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("DataProviderName", option_to_yojson string__to_yojson x.data_provider_name);
      ("DataProviderIdentifier", Some (string__to_yojson x.data_provider_identifier));
    ]

let modify_data_migration_response_to_yojson (x : modify_data_migration_response) =
  assoc_to_yojson [ ("DataMigration", option_to_yojson data_migration_to_yojson x.data_migration) ]

let modify_data_migration_message_to_yojson (x : modify_data_migration_message) =
  assoc_to_yojson
    [
      ("SelectionRules", option_to_yojson secret_string_to_yojson x.selection_rules);
      ("NumberOfJobs", option_to_yojson integer_optional_to_yojson x.number_of_jobs);
      ("TargetDataSettings", option_to_yojson target_data_settings_to_yojson x.target_data_settings);
      ("SourceDataSettings", option_to_yojson source_data_settings_to_yojson x.source_data_settings);
      ("DataMigrationType", option_to_yojson migration_type_value_to_yojson x.data_migration_type);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("EnableCloudwatchLogs", option_to_yojson boolean_optional_to_yojson x.enable_cloudwatch_logs);
      ("DataMigrationName", option_to_yojson string__to_yojson x.data_migration_name);
      ("DataMigrationIdentifier", Some (string__to_yojson x.data_migration_identifier));
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
      ("ConversionConfiguration", Some (string__to_yojson x.conversion_configuration));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let migration_project_list_to_yojson tree = list_to_yojson migration_project_to_yojson tree

let metadata_model_reference_to_yojson (x : metadata_model_reference) =
  assoc_to_yojson
    [
      ("SelectionRules", option_to_yojson string__to_yojson x.selection_rules);
      ("MetadataModelName", option_to_yojson string__to_yojson x.metadata_model_name);
    ]

let metadata_model_reference_list_to_yojson tree =
  list_to_yojson metadata_model_reference_to_yojson tree

let marker_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let arn_list_to_yojson tree = list_to_yojson string__to_yojson tree

let list_tags_for_resource_message_to_yojson (x : list_tags_for_resource_message) =
  assoc_to_yojson
    [
      ("ResourceArnList", option_to_yojson arn_list_to_yojson x.resource_arn_list);
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
    ]

let limitation_to_yojson (x : limitation) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson string__to_yojson x.type_);
      ("Impact", option_to_yojson string__to_yojson x.impact);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("EngineName", option_to_yojson string__to_yojson x.engine_name);
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
    ]

let limitation_list_to_yojson tree = list_to_yojson limitation_to_yojson tree

let inventory_data_to_yojson (x : inventory_data) =
  assoc_to_yojson
    [
      ("NumberOfSchemas", option_to_yojson integer_optional_to_yojson x.number_of_schemas);
      ("NumberOfDatabases", option_to_yojson integer_optional_to_yojson x.number_of_databases);
    ]

let invalid_certificate_fault_to_yojson (x : invalid_certificate_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let instance_profile_list_to_yojson tree = list_to_yojson instance_profile_to_yojson tree
let individual_assessment_name_list_to_yojson tree = list_to_yojson string__to_yojson tree
let certificate_wallet_to_yojson = blob_to_yojson

let certificate_to_yojson (x : certificate) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("KeyLength", option_to_yojson integer_optional_to_yojson x.key_length);
      ("SigningAlgorithm", option_to_yojson string__to_yojson x.signing_algorithm);
      ("ValidToDate", option_to_yojson t_stamp_to_yojson x.valid_to_date);
      ("ValidFromDate", option_to_yojson t_stamp_to_yojson x.valid_from_date);
      ("CertificateOwner", option_to_yojson string__to_yojson x.certificate_owner);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("CertificateWallet", option_to_yojson certificate_wallet_to_yojson x.certificate_wallet);
      ("CertificatePem", option_to_yojson string__to_yojson x.certificate_pem);
      ("CertificateCreationDate", option_to_yojson t_stamp_to_yojson x.certificate_creation_date);
      ("CertificateIdentifier", option_to_yojson string__to_yojson x.certificate_identifier);
    ]

let import_certificate_response_to_yojson (x : import_certificate_response) =
  assoc_to_yojson [ ("Certificate", option_to_yojson certificate_to_yojson x.certificate) ]

let import_certificate_message_to_yojson (x : import_certificate_message) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CertificateWallet", option_to_yojson certificate_wallet_to_yojson x.certificate_wallet);
      ("CertificatePem", option_to_yojson secret_string_to_yojson x.certificate_pem);
      ("CertificateIdentifier", Some (string__to_yojson x.certificate_identifier));
    ]

let get_target_selection_rules_response_to_yojson (x : get_target_selection_rules_response) =
  assoc_to_yojson
    [ ("TargetSelectionRules", option_to_yojson string__to_yojson x.target_selection_rules) ]

let get_target_selection_rules_message_to_yojson (x : get_target_selection_rules_message) =
  assoc_to_yojson
    [
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let fleet_advisor_schema_object_response_to_yojson (x : fleet_advisor_schema_object_response) =
  assoc_to_yojson
    [
      ("CodeSize", option_to_yojson long_optional_to_yojson x.code_size);
      ("CodeLineCount", option_to_yojson long_optional_to_yojson x.code_line_count);
      ("NumberOfObjects", option_to_yojson long_optional_to_yojson x.number_of_objects);
      ("ObjectType", option_to_yojson string__to_yojson x.object_type);
      ("SchemaId", option_to_yojson string__to_yojson x.schema_id);
    ]

let fleet_advisor_schema_object_list_to_yojson tree =
  list_to_yojson fleet_advisor_schema_object_response_to_yojson tree

let fleet_advisor_schema_list_to_yojson tree = list_to_yojson schema_response_to_yojson tree

let fleet_advisor_lsa_analysis_response_to_yojson (x : fleet_advisor_lsa_analysis_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson string__to_yojson x.status);
      ("LsaAnalysisId", option_to_yojson string__to_yojson x.lsa_analysis_id);
    ]

let fleet_advisor_lsa_analysis_response_list_to_yojson tree =
  list_to_yojson fleet_advisor_lsa_analysis_response_to_yojson tree

let filter_value_list_to_yojson tree = list_to_yojson string__to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (string__to_yojson x.name));
    ]

let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree

let export_metadata_model_assessment_result_entry_to_yojson
    (x : export_metadata_model_assessment_result_entry) =
  assoc_to_yojson
    [
      ("ObjectURL", option_to_yojson string__to_yojson x.object_ur_l);
      ("S3ObjectKey", option_to_yojson string__to_yojson x.s3_object_key);
    ]

let export_metadata_model_assessment_response_to_yojson
    (x : export_metadata_model_assessment_response) =
  assoc_to_yojson
    [
      ( "CsvReport",
        option_to_yojson export_metadata_model_assessment_result_entry_to_yojson x.csv_report );
      ( "PdfReport",
        option_to_yojson export_metadata_model_assessment_result_entry_to_yojson x.pdf_report );
    ]

let assessment_report_type_to_yojson (x : assessment_report_type) =
  match x with CSV -> `String "csv" | PDF -> `String "pdf"

let assessment_report_types_list_to_yojson tree =
  list_to_yojson assessment_report_type_to_yojson tree

let export_metadata_model_assessment_message_to_yojson
    (x : export_metadata_model_assessment_message) =
  assoc_to_yojson
    [
      ( "AssessmentReportTypes",
        option_to_yojson assessment_report_types_list_to_yojson x.assessment_report_types );
      ("FileName", option_to_yojson string__to_yojson x.file_name);
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let event_subscriptions_list_to_yojson tree = list_to_yojson event_subscription_to_yojson tree

let event_to_yojson (x : event) =
  assoc_to_yojson
    [
      ("Date", option_to_yojson t_stamp_to_yojson x.date);
      ("EventCategories", option_to_yojson event_categories_list_to_yojson x.event_categories);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("SourceIdentifier", option_to_yojson string__to_yojson x.source_identifier);
    ]

let event_list_to_yojson tree = list_to_yojson event_to_yojson tree

let event_category_group_to_yojson (x : event_category_group) =
  assoc_to_yojson
    [
      ("EventCategories", option_to_yojson event_categories_list_to_yojson x.event_categories);
      ("SourceType", option_to_yojson string__to_yojson x.source_type);
    ]

let event_category_group_list_to_yojson tree = list_to_yojson event_category_group_to_yojson tree
let available_upgrades_list_to_yojson tree = list_to_yojson string__to_yojson tree

let engine_version_to_yojson (x : engine_version) =
  assoc_to_yojson
    [
      ("AvailableUpgrades", option_to_yojson available_upgrades_list_to_yojson x.available_upgrades);
      ("ForceUpgradeDate", option_to_yojson t_stamp_to_yojson x.force_upgrade_date);
      ("DeprecationDate", option_to_yojson t_stamp_to_yojson x.deprecation_date);
      ("AutoUpgradeDate", option_to_yojson t_stamp_to_yojson x.auto_upgrade_date);
      ("LaunchDate", option_to_yojson t_stamp_to_yojson x.launch_date);
      ("ReleaseStatus", option_to_yojson release_status_values_to_yojson x.release_status);
      ("Lifecycle", option_to_yojson string__to_yojson x.lifecycle);
      ("Version", option_to_yojson string__to_yojson x.version);
    ]

let engine_version_list_to_yojson tree = list_to_yojson engine_version_to_yojson tree

let endpoint_setting_type_value_to_yojson (x : endpoint_setting_type_value) =
  match x with
  | ENUM -> `String "enum"
  | INTEGER -> `String "integer"
  | BOOLEAN -> `String "boolean"
  | STRING -> `String "string"

let endpoint_setting_enum_values_to_yojson tree = list_to_yojson string__to_yojson tree

let endpoint_setting_to_yojson (x : endpoint_setting) =
  assoc_to_yojson
    [
      ("DefaultValue", option_to_yojson string__to_yojson x.default_value);
      ("IntValueMax", option_to_yojson integer_optional_to_yojson x.int_value_max);
      ("IntValueMin", option_to_yojson integer_optional_to_yojson x.int_value_min);
      ("Applicability", option_to_yojson string__to_yojson x.applicability);
      ("Units", option_to_yojson string__to_yojson x.units);
      ("Sensitive", option_to_yojson boolean_optional_to_yojson x.sensitive);
      ("EnumValues", option_to_yojson endpoint_setting_enum_values_to_yojson x.enum_values);
      ("Type", option_to_yojson endpoint_setting_type_value_to_yojson x.type_);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let endpoint_settings_list_to_yojson tree = list_to_yojson endpoint_setting_to_yojson tree
let endpoint_list_to_yojson tree = list_to_yojson endpoint_to_yojson tree

let describe_table_statistics_response_to_yojson (x : describe_table_statistics_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("TableStatistics", option_to_yojson table_statistics_list_to_yojson x.table_statistics);
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
    ]

let describe_table_statistics_message_to_yojson (x : describe_table_statistics_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn));
    ]

let describe_schemas_response_to_yojson (x : describe_schemas_response) =
  assoc_to_yojson
    [
      ("Schemas", option_to_yojson schema_list_to_yojson x.schemas);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_schemas_message_to_yojson (x : describe_schemas_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("EndpointArn", Some (string__to_yojson x.endpoint_arn));
    ]

let describe_replications_response_to_yojson (x : describe_replications_response) =
  assoc_to_yojson
    [
      ("Replications", option_to_yojson replication_list_to_yojson x.replications);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_replications_message_to_yojson (x : describe_replications_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_replication_tasks_response_to_yojson (x : describe_replication_tasks_response) =
  assoc_to_yojson
    [
      ("ReplicationTasks", option_to_yojson replication_task_list_to_yojson x.replication_tasks);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_replication_tasks_message_to_yojson (x : describe_replication_tasks_message) =
  assoc_to_yojson
    [
      ("WithoutSettings", option_to_yojson boolean_optional_to_yojson x.without_settings);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_replication_task_individual_assessments_response_to_yojson
    (x : describe_replication_task_individual_assessments_response) =
  assoc_to_yojson
    [
      ( "ReplicationTaskIndividualAssessments",
        option_to_yojson replication_task_individual_assessment_list_to_yojson
          x.replication_task_individual_assessments );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_replication_task_individual_assessments_message_to_yojson
    (x : describe_replication_task_individual_assessments_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_replication_task_assessment_runs_response_to_yojson
    (x : describe_replication_task_assessment_runs_response) =
  assoc_to_yojson
    [
      ( "ReplicationTaskAssessmentRuns",
        option_to_yojson replication_task_assessment_run_list_to_yojson
          x.replication_task_assessment_runs );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_replication_task_assessment_runs_message_to_yojson
    (x : describe_replication_task_assessment_runs_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_replication_task_assessment_results_response_to_yojson
    (x : describe_replication_task_assessment_results_response) =
  assoc_to_yojson
    [
      ( "ReplicationTaskAssessmentResults",
        option_to_yojson replication_task_assessment_result_list_to_yojson
          x.replication_task_assessment_results );
      ("BucketName", option_to_yojson string__to_yojson x.bucket_name);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_replication_task_assessment_results_message_to_yojson
    (x : describe_replication_task_assessment_results_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
    ]

let describe_replication_table_statistics_response_to_yojson
    (x : describe_replication_table_statistics_response) =
  assoc_to_yojson
    [
      ( "ReplicationTableStatistics",
        option_to_yojson replication_table_statistics_list_to_yojson x.replication_table_statistics
      );
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("ReplicationConfigArn", option_to_yojson string__to_yojson x.replication_config_arn);
    ]

let describe_replication_table_statistics_message_to_yojson
    (x : describe_replication_table_statistics_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("ReplicationConfigArn", Some (string__to_yojson x.replication_config_arn));
    ]

let describe_replication_subnet_groups_response_to_yojson
    (x : describe_replication_subnet_groups_response) =
  assoc_to_yojson
    [
      ( "ReplicationSubnetGroups",
        option_to_yojson replication_subnet_groups_to_yojson x.replication_subnet_groups );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_replication_subnet_groups_message_to_yojson
    (x : describe_replication_subnet_groups_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_replication_instances_response_to_yojson (x : describe_replication_instances_response)
    =
  assoc_to_yojson
    [
      ( "ReplicationInstances",
        option_to_yojson replication_instance_list_to_yojson x.replication_instances );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_replication_instances_message_to_yojson (x : describe_replication_instances_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_replication_instance_task_logs_response_to_yojson
    (x : describe_replication_instance_task_logs_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "ReplicationInstanceTaskLogs",
        option_to_yojson replication_instance_task_logs_list_to_yojson
          x.replication_instance_task_logs );
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
    ]

let describe_replication_instance_task_logs_message_to_yojson
    (x : describe_replication_instance_task_logs_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
    ]

let describe_replication_configs_response_to_yojson (x : describe_replication_configs_response) =
  assoc_to_yojson
    [
      ( "ReplicationConfigs",
        option_to_yojson replication_config_list_to_yojson x.replication_configs );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_replication_configs_message_to_yojson (x : describe_replication_configs_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
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

let describe_recommendations_response_to_yojson (x : describe_recommendations_response) =
  assoc_to_yojson
    [
      ("Recommendations", option_to_yojson recommendation_list_to_yojson x.recommendations);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_recommendations_request_to_yojson (x : describe_recommendations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_recommendation_limitations_response_to_yojson
    (x : describe_recommendation_limitations_response) =
  assoc_to_yojson
    [
      ("Limitations", option_to_yojson limitation_list_to_yojson x.limitations);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_recommendation_limitations_request_to_yojson
    (x : describe_recommendation_limitations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_pending_maintenance_actions_response_to_yojson
    (x : describe_pending_maintenance_actions_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "PendingMaintenanceActions",
        option_to_yojson pending_maintenance_actions_to_yojson x.pending_maintenance_actions );
    ]

let describe_pending_maintenance_actions_message_to_yojson
    (x : describe_pending_maintenance_actions_message) =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
    ]

let describe_orderable_replication_instances_response_to_yojson
    (x : describe_orderable_replication_instances_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "OrderableReplicationInstances",
        option_to_yojson orderable_replication_instance_list_to_yojson
          x.orderable_replication_instances );
    ]

let describe_orderable_replication_instances_message_to_yojson
    (x : describe_orderable_replication_instances_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
    ]

let describe_migration_projects_response_to_yojson (x : describe_migration_projects_response) =
  assoc_to_yojson
    [
      ("MigrationProjects", option_to_yojson migration_project_list_to_yojson x.migration_projects);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_migration_projects_message_to_yojson (x : describe_migration_projects_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_metadata_model_response_to_yojson (x : describe_metadata_model_response) =
  assoc_to_yojson
    [
      ("Definition", option_to_yojson string__to_yojson x.definition);
      ( "TargetMetadataModels",
        option_to_yojson metadata_model_reference_list_to_yojson x.target_metadata_models );
      ("MetadataModelType", option_to_yojson string__to_yojson x.metadata_model_type);
      ("MetadataModelName", option_to_yojson string__to_yojson x.metadata_model_name);
    ]

let describe_metadata_model_message_to_yojson (x : describe_metadata_model_message) =
  assoc_to_yojson
    [
      ("Origin", Some (origin_type_value_to_yojson x.origin));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
    ]

let describe_metadata_model_imports_response_to_yojson
    (x : describe_metadata_model_imports_response) =
  assoc_to_yojson
    [
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_metadata_model_imports_message_to_yojson (x : describe_metadata_model_imports_message)
    =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let describe_metadata_model_exports_to_target_response_to_yojson
    (x : describe_metadata_model_exports_to_target_response) =
  assoc_to_yojson
    [
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_metadata_model_exports_to_target_message_to_yojson
    (x : describe_metadata_model_exports_to_target_message) =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let describe_metadata_model_exports_as_script_response_to_yojson
    (x : describe_metadata_model_exports_as_script_response) =
  assoc_to_yojson
    [
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_metadata_model_exports_as_script_message_to_yojson
    (x : describe_metadata_model_exports_as_script_message) =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let describe_metadata_model_creations_response_to_yojson
    (x : describe_metadata_model_creations_response) =
  assoc_to_yojson
    [
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_metadata_model_creations_message_to_yojson
    (x : describe_metadata_model_creations_message) =
  assoc_to_yojson
    [
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_metadata_model_conversions_response_to_yojson
    (x : describe_metadata_model_conversions_response) =
  assoc_to_yojson
    [
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_metadata_model_conversions_message_to_yojson
    (x : describe_metadata_model_conversions_message) =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let describe_metadata_model_children_response_to_yojson
    (x : describe_metadata_model_children_response) =
  assoc_to_yojson
    [
      ( "MetadataModelChildren",
        option_to_yojson metadata_model_reference_list_to_yojson x.metadata_model_children );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_metadata_model_children_message_to_yojson
    (x : describe_metadata_model_children_message) =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Origin", Some (origin_type_value_to_yojson x.origin));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
      ("SelectionRules", Some (string__to_yojson x.selection_rules));
    ]

let describe_metadata_model_assessments_response_to_yojson
    (x : describe_metadata_model_assessments_response) =
  assoc_to_yojson
    [
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_metadata_model_assessments_message_to_yojson
    (x : describe_metadata_model_assessments_message) =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let describe_instance_profiles_response_to_yojson (x : describe_instance_profiles_response) =
  assoc_to_yojson
    [
      ("InstanceProfiles", option_to_yojson instance_profile_list_to_yojson x.instance_profiles);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_instance_profiles_message_to_yojson (x : describe_instance_profiles_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_fleet_advisor_schemas_response_to_yojson (x : describe_fleet_advisor_schemas_response)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "FleetAdvisorSchemas",
        option_to_yojson fleet_advisor_schema_list_to_yojson x.fleet_advisor_schemas );
    ]

let describe_fleet_advisor_schemas_request_to_yojson (x : describe_fleet_advisor_schemas_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_fleet_advisor_schema_object_summary_response_to_yojson
    (x : describe_fleet_advisor_schema_object_summary_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "FleetAdvisorSchemaObjects",
        option_to_yojson fleet_advisor_schema_object_list_to_yojson x.fleet_advisor_schema_objects
      );
    ]

let describe_fleet_advisor_schema_object_summary_request_to_yojson
    (x : describe_fleet_advisor_schema_object_summary_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_fleet_advisor_lsa_analysis_response_to_yojson
    (x : describe_fleet_advisor_lsa_analysis_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Analysis", option_to_yojson fleet_advisor_lsa_analysis_response_list_to_yojson x.analysis);
    ]

let describe_fleet_advisor_lsa_analysis_request_to_yojson
    (x : describe_fleet_advisor_lsa_analysis_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
    ]

let database_instance_software_details_response_to_yojson
    (x : database_instance_software_details_response) =
  assoc_to_yojson
    [
      ("Tooltip", option_to_yojson string__to_yojson x.tooltip);
      ("OsArchitecture", option_to_yojson integer_optional_to_yojson x.os_architecture);
      ("SupportLevel", option_to_yojson string__to_yojson x.support_level);
      ("ServicePack", option_to_yojson string__to_yojson x.service_pack);
      ("EngineEdition", option_to_yojson string__to_yojson x.engine_edition);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("Engine", option_to_yojson string__to_yojson x.engine);
    ]

let collector_short_info_response_to_yojson (x : collector_short_info_response) =
  assoc_to_yojson
    [
      ("CollectorName", option_to_yojson string__to_yojson x.collector_name);
      ("CollectorReferencedId", option_to_yojson string__to_yojson x.collector_referenced_id);
    ]

let collectors_list_to_yojson tree = list_to_yojson collector_short_info_response_to_yojson tree

let database_response_to_yojson (x : database_response) =
  assoc_to_yojson
    [
      ("Collectors", option_to_yojson collectors_list_to_yojson x.collectors);
      ( "SoftwareDetails",
        option_to_yojson database_instance_software_details_response_to_yojson x.software_details );
      ("Server", option_to_yojson server_short_info_response_to_yojson x.server);
      ("NumberOfSchemas", option_to_yojson long_optional_to_yojson x.number_of_schemas);
      ("IpAddress", option_to_yojson string__to_yojson x.ip_address);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
    ]

let database_list_to_yojson tree = list_to_yojson database_response_to_yojson tree

let describe_fleet_advisor_databases_response_to_yojson
    (x : describe_fleet_advisor_databases_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Databases", option_to_yojson database_list_to_yojson x.databases);
    ]

let describe_fleet_advisor_databases_request_to_yojson
    (x : describe_fleet_advisor_databases_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let collector_status_to_yojson (x : collector_status) =
  match x with ACTIVE -> `String "ACTIVE" | UNREGISTERED -> `String "UNREGISTERED"

let collector_health_check_to_yojson (x : collector_health_check) =
  assoc_to_yojson
    [
      ( "WebCollectorGrantedRoleBasedAccess",
        option_to_yojson boolean_optional_to_yojson x.web_collector_granted_role_based_access );
      ("WebCollectorS3Access", option_to_yojson boolean_optional_to_yojson x.web_collector_s3_access);
      ( "LocalCollectorS3Access",
        option_to_yojson boolean_optional_to_yojson x.local_collector_s3_access );
      ("CollectorStatus", option_to_yojson collector_status_to_yojson x.collector_status);
    ]

let collector_response_to_yojson (x : collector_response) =
  assoc_to_yojson
    [
      ("InventoryData", option_to_yojson inventory_data_to_yojson x.inventory_data);
      ("ModifiedDate", option_to_yojson string__to_yojson x.modified_date);
      ("CreatedDate", option_to_yojson string__to_yojson x.created_date);
      ("RegisteredDate", option_to_yojson string__to_yojson x.registered_date);
      ("LastDataReceived", option_to_yojson string__to_yojson x.last_data_received);
      ( "CollectorHealthCheck",
        option_to_yojson collector_health_check_to_yojson x.collector_health_check );
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("VersionStatus", option_to_yojson version_status_to_yojson x.version_status);
      ("CollectorVersion", option_to_yojson string__to_yojson x.collector_version);
      ("CollectorName", option_to_yojson string__to_yojson x.collector_name);
      ("CollectorReferencedId", option_to_yojson string__to_yojson x.collector_referenced_id);
    ]

let collector_responses_to_yojson tree = list_to_yojson collector_response_to_yojson tree

let describe_fleet_advisor_collectors_response_to_yojson
    (x : describe_fleet_advisor_collectors_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Collectors", option_to_yojson collector_responses_to_yojson x.collectors);
    ]

let describe_fleet_advisor_collectors_request_to_yojson
    (x : describe_fleet_advisor_collectors_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_extension_pack_associations_response_to_yojson
    (x : describe_extension_pack_associations_response) =
  assoc_to_yojson
    [
      ("Requests", option_to_yojson schema_conversion_request_list_to_yojson x.requests);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_extension_pack_associations_message_to_yojson
    (x : describe_extension_pack_associations_message) =
  assoc_to_yojson
    [
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let describe_events_response_to_yojson (x : describe_events_response) =
  assoc_to_yojson
    [
      ("Events", option_to_yojson event_list_to_yojson x.events);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_events_message_to_yojson (x : describe_events_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("EventCategories", option_to_yojson event_categories_list_to_yojson x.event_categories);
      ("Duration", option_to_yojson integer_optional_to_yojson x.duration);
      ("EndTime", option_to_yojson t_stamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson t_stamp_to_yojson x.start_time);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("SourceIdentifier", option_to_yojson string__to_yojson x.source_identifier);
    ]

let describe_event_subscriptions_response_to_yojson (x : describe_event_subscriptions_response) =
  assoc_to_yojson
    [
      ( "EventSubscriptionsList",
        option_to_yojson event_subscriptions_list_to_yojson x.event_subscriptions_list );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_event_subscriptions_message_to_yojson (x : describe_event_subscriptions_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("SubscriptionName", option_to_yojson string__to_yojson x.subscription_name);
    ]

let describe_event_categories_response_to_yojson (x : describe_event_categories_response) =
  assoc_to_yojson
    [
      ( "EventCategoryGroupList",
        option_to_yojson event_category_group_list_to_yojson x.event_category_group_list );
    ]

let describe_event_categories_message_to_yojson (x : describe_event_categories_message) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("SourceType", option_to_yojson string__to_yojson x.source_type);
    ]

let describe_engine_versions_response_to_yojson (x : describe_engine_versions_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("EngineVersions", option_to_yojson engine_version_list_to_yojson x.engine_versions);
    ]

let describe_engine_versions_message_to_yojson (x : describe_engine_versions_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
    ]

let describe_endpoints_response_to_yojson (x : describe_endpoints_response) =
  assoc_to_yojson
    [
      ("Endpoints", option_to_yojson endpoint_list_to_yojson x.endpoints);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_endpoints_message_to_yojson (x : describe_endpoints_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_endpoint_types_response_to_yojson (x : describe_endpoint_types_response) =
  assoc_to_yojson
    [
      ( "SupportedEndpointTypes",
        option_to_yojson supported_endpoint_type_list_to_yojson x.supported_endpoint_types );
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_endpoint_types_message_to_yojson (x : describe_endpoint_types_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_endpoint_settings_response_to_yojson (x : describe_endpoint_settings_response) =
  assoc_to_yojson
    [
      ("EndpointSettings", option_to_yojson endpoint_settings_list_to_yojson x.endpoint_settings);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_endpoint_settings_message_to_yojson (x : describe_endpoint_settings_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("EngineName", Some (string__to_yojson x.engine_name));
    ]

let data_provider_list_to_yojson tree = list_to_yojson data_provider_to_yojson tree

let describe_data_providers_response_to_yojson (x : describe_data_providers_response) =
  assoc_to_yojson
    [
      ("DataProviders", option_to_yojson data_provider_list_to_yojson x.data_providers);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_data_providers_message_to_yojson (x : describe_data_providers_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let data_migrations_to_yojson tree = list_to_yojson data_migration_to_yojson tree

let describe_data_migrations_response_to_yojson (x : describe_data_migrations_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("DataMigrations", option_to_yojson data_migrations_to_yojson x.data_migrations);
    ]

let describe_data_migrations_message_to_yojson (x : describe_data_migrations_message) =
  assoc_to_yojson
    [
      ("WithoutStatistics", option_to_yojson boolean_optional_to_yojson x.without_statistics);
      ("WithoutSettings", option_to_yojson boolean_optional_to_yojson x.without_settings);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_conversion_configuration_response_to_yojson
    (x : describe_conversion_configuration_response) =
  assoc_to_yojson
    [
      ("ConversionConfiguration", option_to_yojson string__to_yojson x.conversion_configuration);
      ( "MigrationProjectIdentifier",
        option_to_yojson string__to_yojson x.migration_project_identifier );
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
      ("Connections", option_to_yojson connection_list_to_yojson x.connections);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_connections_message_to_yojson (x : describe_connections_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let certificate_list_to_yojson tree = list_to_yojson certificate_to_yojson tree

let describe_certificates_response_to_yojson (x : describe_certificates_response) =
  assoc_to_yojson
    [
      ("Certificates", option_to_yojson certificate_list_to_yojson x.certificates);
      ("Marker", option_to_yojson string__to_yojson x.marker);
    ]

let describe_certificates_message_to_yojson (x : describe_certificates_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let describe_applicable_individual_assessments_response_to_yojson
    (x : describe_applicable_individual_assessments_response) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ( "IndividualAssessmentNames",
        option_to_yojson individual_assessment_name_list_to_yojson x.individual_assessment_names );
    ]

let describe_applicable_individual_assessments_message_to_yojson
    (x : describe_applicable_individual_assessments_message) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson string__to_yojson x.marker);
      ("MaxRecords", option_to_yojson integer_optional_to_yojson x.max_records);
      ("MigrationType", option_to_yojson migration_type_value_to_yojson x.migration_type);
      ("TargetEngineName", option_to_yojson string__to_yojson x.target_engine_name);
      ("SourceEngineName", option_to_yojson string__to_yojson x.source_engine_name);
      ("ReplicationConfigArn", option_to_yojson string__to_yojson x.replication_config_arn);
      ("ReplicationInstanceArn", option_to_yojson string__to_yojson x.replication_instance_arn);
      ("ReplicationTaskArn", option_to_yojson string__to_yojson x.replication_task_arn);
    ]

let account_quota_to_yojson (x : account_quota) =
  assoc_to_yojson
    [
      ("Max", option_to_yojson long_to_yojson x.max);
      ("Used", option_to_yojson long_to_yojson x.used);
      ("AccountQuotaName", option_to_yojson string__to_yojson x.account_quota_name);
    ]

let account_quota_list_to_yojson tree = list_to_yojson account_quota_to_yojson tree

let describe_account_attributes_response_to_yojson (x : describe_account_attributes_response) =
  assoc_to_yojson
    [
      ("UniqueAccountIdentifier", option_to_yojson string__to_yojson x.unique_account_identifier);
      ("AccountQuotas", option_to_yojson account_quota_list_to_yojson x.account_quotas);
    ]

let describe_account_attributes_message_to_yojson = unit_to_yojson

let delete_replication_task_response_to_yojson (x : delete_replication_task_response) =
  assoc_to_yojson
    [ ("ReplicationTask", option_to_yojson replication_task_to_yojson x.replication_task) ]

let delete_replication_task_message_to_yojson (x : delete_replication_task_message) =
  assoc_to_yojson [ ("ReplicationTaskArn", Some (string__to_yojson x.replication_task_arn)) ]

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
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
      ("EndpointArn", Some (string__to_yojson x.endpoint_arn));
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
      ("ResourceIdentifier", option_to_yojson string__to_yojson x.resource_identifier);
      ("TaskData", option_to_yojson string__to_yojson x.task_data);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CdcStopPosition", option_to_yojson string__to_yojson x.cdc_stop_position);
      ("CdcStartPosition", option_to_yojson string__to_yojson x.cdc_start_position);
      ("CdcStartTime", option_to_yojson t_stamp_to_yojson x.cdc_start_time);
      ("ReplicationTaskSettings", option_to_yojson string__to_yojson x.replication_task_settings);
      ("TableMappings", Some (string__to_yojson x.table_mappings));
      ("MigrationType", Some (migration_type_value_to_yojson x.migration_type));
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
      ("TargetEndpointArn", Some (string__to_yojson x.target_endpoint_arn));
      ("SourceEndpointArn", Some (string__to_yojson x.source_endpoint_arn));
      ("ReplicationTaskIdentifier", Some (string__to_yojson x.replication_task_identifier));
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
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SubnetIds", Some (subnet_identifier_list_to_yojson x.subnet_ids));
      ( "ReplicationSubnetGroupDescription",
        Some (string__to_yojson x.replication_subnet_group_description) );
      ( "ReplicationSubnetGroupIdentifier",
        Some (string__to_yojson x.replication_subnet_group_identifier) );
    ]

let create_replication_instance_response_to_yojson (x : create_replication_instance_response) =
  assoc_to_yojson
    [
      ("ReplicationInstance", option_to_yojson replication_instance_to_yojson x.replication_instance);
    ]

let create_replication_instance_message_to_yojson (x : create_replication_instance_message) =
  assoc_to_yojson
    [
      ( "KerberosAuthenticationSettings",
        option_to_yojson kerberos_authentication_settings_to_yojson
          x.kerberos_authentication_settings );
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ("ResourceIdentifier", option_to_yojson string__to_yojson x.resource_identifier);
      ("DnsNameServers", option_to_yojson string__to_yojson x.dns_name_servers);
      ("PubliclyAccessible", option_to_yojson boolean_optional_to_yojson x.publicly_accessible);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "AutoMinorVersionUpgrade",
        option_to_yojson boolean_optional_to_yojson x.auto_minor_version_upgrade );
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("MultiAZ", option_to_yojson boolean_optional_to_yojson x.multi_a_z);
      ( "PreferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ( "ReplicationSubnetGroupIdentifier",
        option_to_yojson string__to_yojson x.replication_subnet_group_identifier );
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ( "VpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "ReplicationInstanceClass",
        Some (replication_instance_class_to_yojson x.replication_instance_class) );
      ("AllocatedStorage", option_to_yojson integer_optional_to_yojson x.allocated_storage);
      ("ReplicationInstanceIdentifier", Some (string__to_yojson x.replication_instance_identifier));
    ]

let create_replication_config_response_to_yojson (x : create_replication_config_response) =
  assoc_to_yojson
    [ ("ReplicationConfig", option_to_yojson replication_config_to_yojson x.replication_config) ]

let create_replication_config_message_to_yojson (x : create_replication_config_message) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ResourceIdentifier", option_to_yojson string__to_yojson x.resource_identifier);
      ("SupplementalSettings", option_to_yojson string__to_yojson x.supplemental_settings);
      ("ReplicationSettings", option_to_yojson string__to_yojson x.replication_settings);
      ("TableMappings", Some (string__to_yojson x.table_mappings));
      ("ReplicationType", Some (migration_type_value_to_yojson x.replication_type));
      ("ComputeConfig", Some (compute_config_to_yojson x.compute_config));
      ("TargetEndpointArn", Some (string__to_yojson x.target_endpoint_arn));
      ("SourceEndpointArn", Some (string__to_yojson x.source_endpoint_arn));
      ("ReplicationConfigIdentifier", Some (string__to_yojson x.replication_config_identifier));
    ]

let create_migration_project_response_to_yojson (x : create_migration_project_response) =
  assoc_to_yojson
    [ ("MigrationProject", option_to_yojson migration_project_to_yojson x.migration_project) ]

let create_migration_project_message_to_yojson (x : create_migration_project_message) =
  assoc_to_yojson
    [
      ( "SchemaConversionApplicationAttributes",
        option_to_yojson sc_application_attributes_to_yojson
          x.schema_conversion_application_attributes );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("TransformationRules", option_to_yojson string__to_yojson x.transformation_rules);
      ("InstanceProfileIdentifier", Some (string__to_yojson x.instance_profile_identifier));
      ( "TargetDataProviderDescriptors",
        Some (data_provider_descriptor_definition_list_to_yojson x.target_data_provider_descriptors)
      );
      ( "SourceDataProviderDescriptors",
        Some (data_provider_descriptor_definition_list_to_yojson x.source_data_provider_descriptors)
      );
      ("MigrationProjectName", option_to_yojson string__to_yojson x.migration_project_name);
    ]

let create_instance_profile_response_to_yojson (x : create_instance_profile_response) =
  assoc_to_yojson
    [ ("InstanceProfile", option_to_yojson instance_profile_to_yojson x.instance_profile) ]

let create_instance_profile_message_to_yojson (x : create_instance_profile_message) =
  assoc_to_yojson
    [
      ("VpcSecurityGroups", option_to_yojson string_list_to_yojson x.vpc_security_groups);
      ("SubnetGroupIdentifier", option_to_yojson string__to_yojson x.subnet_group_identifier);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("InstanceProfileName", option_to_yojson string__to_yojson x.instance_profile_name);
      ("NetworkType", option_to_yojson string__to_yojson x.network_type);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("PubliclyAccessible", option_to_yojson boolean_optional_to_yojson x.publicly_accessible);
      ("KmsKeyArn", option_to_yojson string__to_yojson x.kms_key_arn);
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
    ]

let create_fleet_advisor_collector_response_to_yojson (x : create_fleet_advisor_collector_response)
    =
  assoc_to_yojson
    [
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("CollectorName", option_to_yojson string__to_yojson x.collector_name);
      ("CollectorReferencedId", option_to_yojson string__to_yojson x.collector_referenced_id);
    ]

let create_fleet_advisor_collector_request_to_yojson (x : create_fleet_advisor_collector_request) =
  assoc_to_yojson
    [
      ("S3BucketName", Some (string__to_yojson x.s3_bucket_name));
      ("ServiceAccessRoleArn", Some (string__to_yojson x.service_access_role_arn));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("CollectorName", Some (string__to_yojson x.collector_name));
    ]

let create_event_subscription_response_to_yojson (x : create_event_subscription_response) =
  assoc_to_yojson
    [ ("EventSubscription", option_to_yojson event_subscription_to_yojson x.event_subscription) ]

let create_event_subscription_message_to_yojson (x : create_event_subscription_message) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Enabled", option_to_yojson boolean_optional_to_yojson x.enabled);
      ("SourceIds", option_to_yojson source_ids_list_to_yojson x.source_ids);
      ("EventCategories", option_to_yojson event_categories_list_to_yojson x.event_categories);
      ("SourceType", option_to_yojson string__to_yojson x.source_type);
      ("SnsTopicArn", Some (string__to_yojson x.sns_topic_arn));
      ("SubscriptionName", Some (string__to_yojson x.subscription_name));
    ]

let create_endpoint_response_to_yojson (x : create_endpoint_response) =
  assoc_to_yojson [ ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint) ]

let create_endpoint_message_to_yojson (x : create_endpoint_message) =
  assoc_to_yojson
    [
      ("TimestreamSettings", option_to_yojson timestream_settings_to_yojson x.timestream_settings);
      ("GcpMySQLSettings", option_to_yojson gcp_my_sql_settings_to_yojson x.gcp_my_sql_settings);
      ("RedisSettings", option_to_yojson redis_settings_to_yojson x.redis_settings);
      ("DocDbSettings", option_to_yojson doc_db_settings_to_yojson x.doc_db_settings);
      ("ResourceIdentifier", option_to_yojson string__to_yojson x.resource_identifier);
      ("IBMDb2Settings", option_to_yojson ibm_db2_settings_to_yojson x.ibm_db2_settings);
      ( "MicrosoftSQLServerSettings",
        option_to_yojson microsoft_sql_server_settings_to_yojson x.microsoft_sql_server_settings );
      ("SybaseSettings", option_to_yojson sybase_settings_to_yojson x.sybase_settings);
      ("OracleSettings", option_to_yojson oracle_settings_to_yojson x.oracle_settings);
      ("MySQLSettings", option_to_yojson my_sql_settings_to_yojson x.my_sql_settings);
      ("PostgreSQLSettings", option_to_yojson postgre_sql_settings_to_yojson x.postgre_sql_settings);
      ("RedshiftSettings", option_to_yojson redshift_settings_to_yojson x.redshift_settings);
      ("NeptuneSettings", option_to_yojson neptune_settings_to_yojson x.neptune_settings);
      ( "ElasticsearchSettings",
        option_to_yojson elasticsearch_settings_to_yojson x.elasticsearch_settings );
      ("KafkaSettings", option_to_yojson kafka_settings_to_yojson x.kafka_settings);
      ("KinesisSettings", option_to_yojson kinesis_settings_to_yojson x.kinesis_settings);
      ("MongoDbSettings", option_to_yojson mongo_db_settings_to_yojson x.mongo_db_settings);
      ( "DmsTransferSettings",
        option_to_yojson dms_transfer_settings_to_yojson x.dms_transfer_settings );
      ("S3Settings", option_to_yojson s3_settings_to_yojson x.s3_settings);
      ("DynamoDbSettings", option_to_yojson dynamo_db_settings_to_yojson x.dynamo_db_settings);
      ("ExternalTableDefinition", option_to_yojson string__to_yojson x.external_table_definition);
      ("ServiceAccessRoleArn", option_to_yojson string__to_yojson x.service_access_role_arn);
      ("SslMode", option_to_yojson dms_ssl_mode_value_to_yojson x.ssl_mode);
      ("CertificateArn", option_to_yojson string__to_yojson x.certificate_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("ExtraConnectionAttributes", option_to_yojson string__to_yojson x.extra_connection_attributes);
      ("DatabaseName", option_to_yojson string__to_yojson x.database_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ServerName", option_to_yojson string__to_yojson x.server_name);
      ("Password", option_to_yojson secret_string_to_yojson x.password);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("EngineName", Some (string__to_yojson x.engine_name));
      ("EndpointType", Some (replication_endpoint_type_value_to_yojson x.endpoint_type));
      ("EndpointIdentifier", Some (string__to_yojson x.endpoint_identifier));
    ]

let create_data_provider_response_to_yojson (x : create_data_provider_response) =
  assoc_to_yojson [ ("DataProvider", option_to_yojson data_provider_to_yojson x.data_provider) ]

let create_data_provider_message_to_yojson (x : create_data_provider_message) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Settings", Some (data_provider_settings_to_yojson x.settings));
      ("Virtual", option_to_yojson boolean_optional_to_yojson x.\#virtual);
      ("Engine", Some (string__to_yojson x.engine));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("DataProviderName", option_to_yojson string__to_yojson x.data_provider_name);
    ]

let create_data_migration_response_to_yojson (x : create_data_migration_response) =
  assoc_to_yojson [ ("DataMigration", option_to_yojson data_migration_to_yojson x.data_migration) ]

let create_data_migration_message_to_yojson (x : create_data_migration_message) =
  assoc_to_yojson
    [
      ("SelectionRules", option_to_yojson secret_string_to_yojson x.selection_rules);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NumberOfJobs", option_to_yojson integer_optional_to_yojson x.number_of_jobs);
      ("TargetDataSettings", option_to_yojson target_data_settings_to_yojson x.target_data_settings);
      ("SourceDataSettings", option_to_yojson source_data_settings_to_yojson x.source_data_settings);
      ("EnableCloudwatchLogs", option_to_yojson boolean_optional_to_yojson x.enable_cloudwatch_logs);
      ("ServiceAccessRoleArn", Some (string__to_yojson x.service_access_role_arn));
      ("DataMigrationType", Some (migration_type_value_to_yojson x.data_migration_type));
      ("MigrationProjectIdentifier", Some (string__to_yojson x.migration_project_identifier));
      ("DataMigrationName", option_to_yojson string__to_yojson x.data_migration_name);
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
      ("RequestIdentifier", Some (string__to_yojson x.request_identifier));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let cancel_metadata_model_conversion_response_to_yojson
    (x : cancel_metadata_model_conversion_response) =
  assoc_to_yojson [ ("Request", option_to_yojson schema_conversion_request_to_yojson x.request) ]

let cancel_metadata_model_conversion_message_to_yojson
    (x : cancel_metadata_model_conversion_message) =
  assoc_to_yojson
    [
      ("RequestIdentifier", Some (string__to_yojson x.request_identifier));
      ( "MigrationProjectIdentifier",
        Some (migration_project_identifier_to_yojson x.migration_project_identifier) );
    ]

let batch_start_recommendations_error_entry_to_yojson (x : batch_start_recommendations_error_entry)
    =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("DatabaseId", option_to_yojson string__to_yojson x.database_id);
    ]

let batch_start_recommendations_error_entry_list_to_yojson tree =
  list_to_yojson batch_start_recommendations_error_entry_to_yojson tree

let batch_start_recommendations_response_to_yojson (x : batch_start_recommendations_response) =
  assoc_to_yojson
    [
      ( "ErrorEntries",
        option_to_yojson batch_start_recommendations_error_entry_list_to_yojson x.error_entries );
    ]

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
      ("OptInType", Some (string__to_yojson x.opt_in_type));
      ("ApplyAction", Some (string__to_yojson x.apply_action));
      ("ReplicationInstanceArn", Some (string__to_yojson x.replication_instance_arn));
    ]

let add_tags_to_resource_response_to_yojson = unit_to_yojson

let add_tags_to_resource_message_to_yojson (x : add_tags_to_resource_message) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
    ]
