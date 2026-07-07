open Smaws_Lib.Json.SerializeHelpers
open Types

let vpc_subnet_id_to_yojson = string_to_yojson
let vpc_subnet_id_list_to_yojson tree = list_to_yojson vpc_subnet_id_to_yojson tree
let vpc_security_group_id_to_yojson = string_to_yojson
let vpc_security_group_id_list_to_yojson tree = list_to_yojson vpc_security_group_id_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "OTHER"
  | FIELD_VALIDATION_FAILED -> `String "FIELD_VALIDATION_FAILED"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let username_to_yojson = string_to_yojson
let db_instance_id_to_yojson = string_to_yojson
let db_instance_name_to_yojson = string_to_yojson
let arn_to_yojson = string_to_yojson

let status_to_yojson (x : status) =
  match x with
  | REBOOT_FAILED -> `String "REBOOT_FAILED"
  | REBOOTING -> `String "REBOOTING"
  | MAINTENANCE -> `String "MAINTENANCE"
  | UPDATING_INSTANCE_TYPE -> `String "UPDATING_INSTANCE_TYPE"
  | UPDATING_DEPLOYMENT_TYPE -> `String "UPDATING_DEPLOYMENT_TYPE"
  | FAILED -> `String "FAILED"
  | DELETED -> `String "DELETED"
  | UPDATING -> `String "UPDATING"
  | MODIFYING -> `String "MODIFYING"
  | DELETING -> `String "DELETING"
  | AVAILABLE -> `String "AVAILABLE"
  | CREATING -> `String "CREATING"

let port_to_yojson = int_to_yojson

let network_type_to_yojson (x : network_type) =
  match x with DUAL -> `String "DUAL" | IPV4 -> `String "IPV4"

let db_instance_type_to_yojson (x : db_instance_type) =
  match x with
  | DB_INFLUX_24XLARGE -> `String "db.influx.24xlarge"
  | DB_INFLUX_16XLARGE -> `String "db.influx.16xlarge"
  | DB_INFLUX_12XLARGE -> `String "db.influx.12xlarge"
  | DB_INFLUX_8XLARGE -> `String "db.influx.8xlarge"
  | DB_INFLUX_4XLARGE -> `String "db.influx.4xlarge"
  | DB_INFLUX_2XLARGE -> `String "db.influx.2xlarge"
  | DB_INFLUX_XLARGE -> `String "db.influx.xlarge"
  | DB_INFLUX_LARGE -> `String "db.influx.large"
  | DB_INFLUX_MEDIUM -> `String "db.influx.medium"

let db_storage_type_to_yojson (x : db_storage_type) =
  match x with
  | INFLUX_IO_INCLUDED_T3 -> `String "InfluxIOIncludedT3"
  | INFLUX_IO_INCLUDED_T2 -> `String "InfluxIOIncludedT2"
  | INFLUX_IO_INCLUDED_T1 -> `String "InfluxIOIncludedT1"

let allocated_storage_to_yojson = int_to_yojson

let deployment_type_to_yojson (x : deployment_type) =
  match x with
  | WITH_MULTIAZ_STANDBY -> `String "WITH_MULTIAZ_STANDBY"
  | SINGLE_AZ -> `String "SINGLE_AZ"

let db_parameter_group_identifier_to_yojson = string_to_yojson

let s3_configuration_to_yojson (x : s3_configuration) =
  assoc_to_yojson
    [
      ("enabled", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled));
      ("bucketName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.bucket_name));
    ]

let log_delivery_configuration_to_yojson (x : log_delivery_configuration) =
  assoc_to_yojson [ ("s3Configuration", Some (s3_configuration_to_yojson x.s3_configuration)) ]

let db_cluster_id_to_yojson = string_to_yojson

let instance_mode_to_yojson (x : instance_mode) =
  match x with
  | PROCESS -> `String "PROCESS"
  | COMPACT -> `String "COMPACT"
  | QUERY -> `String "QUERY"
  | INGEST -> `String "INGEST"
  | REPLICA -> `String "REPLICA"
  | STANDBY -> `String "STANDBY"
  | PRIMARY -> `String "PRIMARY"

let instance_mode_list_to_yojson tree = list_to_yojson instance_mode_to_yojson tree
let iana_timezone_to_yojson = string_to_yojson
let maintenance_window_to_yojson = string_to_yojson

let maintenance_schedule_to_yojson (x : maintenance_schedule) =
  assoc_to_yojson
    [
      ( "preferredMaintenanceWindow",
        Some (maintenance_window_to_yojson x.preferred_maintenance_window) );
      ("timezone", Some (iana_timezone_to_yojson x.timezone));
    ]

let update_db_instance_output_to_yojson (x : update_db_instance_output) =
  assoc_to_yojson
    [
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "secondaryAvailabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.secondary_availability_zone );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("status", option_to_yojson status_to_yojson x.status);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("id", Some (db_instance_id_to_yojson x.id));
    ]

let db_instance_identifier_to_yojson = string_to_yojson

let update_db_instance_input_to_yojson (x : update_db_instance_input) =
  assoc_to_yojson
    [
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ("identifier", Some (db_instance_identifier_to_yojson x.identifier));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let cluster_status_to_yojson (x : cluster_status) =
  match x with
  | PARTIALLY_AVAILABLE -> `String "PARTIALLY_AVAILABLE"
  | REBOOT_FAILED -> `String "REBOOT_FAILED"
  | REBOOTING -> `String "REBOOTING"
  | UPDATING_INSTANCE_TYPE -> `String "UPDATING_INSTANCE_TYPE"
  | MAINTENANCE -> `String "MAINTENANCE"
  | DELETED -> `String "DELETED"
  | FAILED -> `String "FAILED"
  | AVAILABLE -> `String "AVAILABLE"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"

let update_db_cluster_output_to_yojson (x : update_db_cluster_output) =
  assoc_to_yojson
    [ ("dbClusterStatus", option_to_yojson cluster_status_to_yojson x.db_cluster_status) ]

let failover_mode_to_yojson (x : failover_mode) =
  match x with NO_FAILOVER -> `String "NO_FAILOVER" | AUTOMATIC -> `String "AUTOMATIC"

let update_db_cluster_input_to_yojson (x : update_db_cluster_input) =
  assoc_to_yojson
    [
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ("failoverMode", option_to_yojson failover_mode_to_yojson x.failover_mode);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ("dbClusterId", Some (db_cluster_id_to_yojson x.db_cluster_id));
    ]

let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let tracing_type_to_yojson (x : tracing_type) =
  match x with DISABLED -> `String "disabled" | JAEGER -> `String "jaeger" | LOG -> `String "log"

let tag_value_to_yojson = string_to_yojson
let request_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (request_tag_map_to_yojson x.tags));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let response_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let reboot_db_instance_output_to_yojson (x : reboot_db_instance_output) =
  assoc_to_yojson
    [
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "secondaryAvailabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.secondary_availability_zone );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("status", option_to_yojson status_to_yojson x.status);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("id", Some (db_instance_id_to_yojson x.id));
    ]

let reboot_db_instance_input_to_yojson (x : reboot_db_instance_input) =
  assoc_to_yojson [ ("identifier", Some (db_instance_identifier_to_yojson x.identifier)) ]

let reboot_db_cluster_output_to_yojson (x : reboot_db_cluster_output) =
  assoc_to_yojson
    [ ("dbClusterStatus", option_to_yojson cluster_status_to_yojson x.db_cluster_status) ]

let db_instance_id_list_to_yojson tree = list_to_yojson db_instance_id_to_yojson tree

let reboot_db_cluster_input_to_yojson (x : reboot_db_cluster_input) =
  assoc_to_yojson
    [
      ("instanceIds", option_to_yojson db_instance_id_list_to_yojson x.instance_ids);
      ("dbClusterId", Some (db_cluster_id_to_yojson x.db_cluster_id));
    ]

let percent_or_absolute_long_to_yojson (x : percent_or_absolute_long) =
  match x with
  | Absolute arg ->
      assoc_to_yojson
        [ ("absolute", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson arg)) ]
  | Percent arg ->
      assoc_to_yojson
        [ ("percent", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]

let password_to_yojson = string_to_yojson

let log_level_to_yojson (x : log_level) =
  match x with ERROR -> `String "error" | INFO -> `String "info" | DEBUG -> `String "debug"

let duration_type_to_yojson (x : duration_type) =
  match x with
  | DAYS -> `String "days"
  | MILLISECONDS -> `String "milliseconds"
  | SECONDS -> `String "seconds"
  | MINUTES -> `String "minutes"
  | HOURS -> `String "hours"

let duration_to_yojson (x : duration) =
  assoc_to_yojson
    [
      ("value", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.value));
      ("durationType", Some (duration_type_to_yojson x.duration_type));
    ]

let influx_d_bv2_parameters_to_yojson (x : influx_d_bv2_parameters) =
  assoc_to_yojson
    [
      ( "uiDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.ui_disabled );
      ("storageWalMaxWriteDelay", option_to_yojson duration_to_yojson x.storage_wal_max_write_delay);
      ( "storageWalMaxConcurrentWrites",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.storage_wal_max_concurrent_writes );
      ( "storageSeriesIdSetCacheSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.storage_series_id_set_cache_size );
      ( "storageSeriesFileMaxConcurrentSnapshotCompactions",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.storage_series_file_max_concurrent_snapshot_compactions );
      ( "storageRetentionCheckInterval",
        option_to_yojson duration_to_yojson x.storage_retention_check_interval );
      ( "storageNoValidateFieldSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.storage_no_validate_field_size );
      ( "storageMaxIndexLogFileSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.storage_max_index_log_file_size );
      ( "storageMaxConcurrentCompactions",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.storage_max_concurrent_compactions );
      ( "storageCompactThroughputBurst",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.storage_compact_throughput_burst );
      ( "storageCompactFullWriteColdDuration",
        option_to_yojson duration_to_yojson x.storage_compact_full_write_cold_duration );
      ( "storageCacheSnapshotWriteColdDuration",
        option_to_yojson duration_to_yojson x.storage_cache_snapshot_write_cold_duration );
      ( "storageCacheSnapshotMemorySize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.storage_cache_snapshot_memory_size );
      ( "storageCacheMaxMemorySize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.storage_cache_max_memory_size );
      ( "sessionRenewDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.session_renew_disabled );
      ( "sessionLength",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.session_length );
      ( "queryMemoryBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.query_memory_bytes
      );
      ( "queryMaxMemoryBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.query_max_memory_bytes );
      ( "queryInitialMemoryBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.query_initial_memory_bytes );
      ( "pprofDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.pprof_disabled
      );
      ( "influxqlMaxSelectSeries",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.influxql_max_select_series );
      ( "influxqlMaxSelectPoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.influxql_max_select_point );
      ( "influxqlMaxSelectBuckets",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.influxql_max_select_buckets );
      ("httpWriteTimeout", option_to_yojson duration_to_yojson x.http_write_timeout);
      ("httpReadTimeout", option_to_yojson duration_to_yojson x.http_read_timeout);
      ("httpReadHeaderTimeout", option_to_yojson duration_to_yojson x.http_read_header_timeout);
      ("httpIdleTimeout", option_to_yojson duration_to_yojson x.http_idle_timeout);
      ( "metricsDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.metrics_disabled
      );
      ("tracingType", option_to_yojson tracing_type_to_yojson x.tracing_type);
      ( "queryQueueSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_queue_size
      );
      ( "queryConcurrency",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_concurrency
      );
      ( "noTasks",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.no_tasks );
      ("logLevel", option_to_yojson log_level_to_yojson x.log_level);
      ( "fluxLogEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.flux_log_enabled
      );
    ]

let log_formats_to_yojson (x : log_formats) = match x with FULL -> `String "full"

let data_fusion_runtime_type_to_yojson (x : data_fusion_runtime_type) =
  match x with
  | MULTI_THREAD_ALT -> `String "multi-thread-alt"
  | MULTI_THREAD -> `String "multi-thread"

let influx_d_bv3_core_parameters_to_yojson (x : influx_d_bv3_core_parameters) =
  assoc_to_yojson
    [
      ( "hardDeleteDefaultDuration",
        option_to_yojson duration_to_yojson x.hard_delete_default_duration );
      ("deleteGracePeriod", option_to_yojson duration_to_yojson x.delete_grace_period);
      ("retentionCheckInterval", option_to_yojson duration_to_yojson x.retention_check_interval);
      ("gen1LookbackDuration", option_to_yojson duration_to_yojson x.gen1_lookback_duration);
      ( "tableIndexCacheConcurrencyLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.table_index_cache_concurrency_limit );
      ( "tableIndexCacheMaxEntries",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.table_index_cache_max_entries );
      ( "walReplayConcurrencyLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.wal_replay_concurrency_limit );
      ( "walReplayFailOnError",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.wal_replay_fail_on_error );
      ( "parquetMemCacheSize",
        option_to_yojson percent_or_absolute_long_to_yojson x.parquet_mem_cache_size );
      ("execMemPoolBytes", option_to_yojson percent_or_absolute_long_to_yojson x.exec_mem_pool_bytes);
      ("gen1Duration", option_to_yojson duration_to_yojson x.gen1_duration);
      ( "distinctCacheEvictionInterval",
        option_to_yojson duration_to_yojson x.distinct_cache_eviction_interval );
      ( "lastCacheEvictionInterval",
        option_to_yojson duration_to_yojson x.last_cache_eviction_interval );
      ( "parquetMemCacheQueryPathDuration",
        option_to_yojson duration_to_yojson x.parquet_mem_cache_query_path_duration );
      ( "disableParquetMemCache",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.disable_parquet_mem_cache );
      ( "parquetMemCachePruneInterval",
        option_to_yojson duration_to_yojson x.parquet_mem_cache_prune_interval );
      ( "parquetMemCachePrunePercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
          x.parquet_mem_cache_prune_percentage );
      ("preemptiveCacheAge", option_to_yojson duration_to_yojson x.preemptive_cache_age);
      ( "snapshottedWalFilesToKeep",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshotted_wal_files_to_keep );
      ( "walMaxWriteBufferSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.wal_max_write_buffer_size );
      ( "walSnapshotSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.wal_snapshot_size
      );
      ( "forceSnapshotMemThreshold",
        option_to_yojson percent_or_absolute_long_to_yojson x.force_snapshot_mem_threshold );
      ( "maxHttpRequestSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.max_http_request_size );
      ( "dataFusionConfig",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.data_fusion_config );
      ( "dataFusionUseCachedParquetLoader",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.data_fusion_use_cached_parquet_loader );
      ( "dataFusionMaxParquetFanout",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_max_parquet_fanout );
      ( "dataFusionRuntimeThreadPriority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_thread_priority );
      ( "dataFusionRuntimeThreadKeepAlive",
        option_to_yojson duration_to_yojson x.data_fusion_runtime_thread_keep_alive );
      ( "dataFusionRuntimeMaxIoEventsPerTick",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_max_io_events_per_tick );
      ( "dataFusionRuntimeMaxBlockingThreads",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_max_blocking_threads );
      ( "dataFusionRuntimeGlobalQueueInterval",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_global_queue_interval );
      ( "dataFusionRuntimeEventInterval",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_event_interval );
      ( "dataFusionRuntimeDisableLifoSlot",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.data_fusion_runtime_disable_lifo_slot );
      ( "dataFusionRuntimeType",
        option_to_yojson data_fusion_runtime_type_to_yojson x.data_fusion_runtime_type );
      ( "dataFusionNumThreads",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_num_threads );
      ("logFormat", option_to_yojson log_formats_to_yojson x.log_format);
      ( "logFilter",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.log_filter );
      ( "queryLogSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_log_size );
      ( "queryFileLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_file_limit
      );
    ]

let influx_d_bv3_enterprise_parameters_to_yojson (x : influx_d_bv3_enterprise_parameters) =
  assoc_to_yojson
    [
      ("catalogSyncInterval", option_to_yojson duration_to_yojson x.catalog_sync_interval);
      ("replicationInterval", option_to_yojson duration_to_yojson x.replication_interval);
      ( "distinctValueCacheDisableFromHistory",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.distinct_value_cache_disable_from_history );
      ( "lastValueCacheDisableFromHistory",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.last_value_cache_disable_from_history );
      ("compactionCheckInterval", option_to_yojson duration_to_yojson x.compaction_check_interval);
      ("compactionCleanupWait", option_to_yojson duration_to_yojson x.compaction_cleanup_wait);
      ( "compactionMultipliers",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.compaction_multipliers );
      ("compactionGen2Duration", option_to_yojson duration_to_yojson x.compaction_gen2_duration);
      ( "compactionMaxNumFilesPerPlan",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.compaction_max_num_files_per_plan );
      ( "compactionRowLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.compaction_row_limit );
      ( "dedicatedCompactor",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.dedicated_compactor) );
      ( "queryOnlyInstances",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_only_instances) );
      ( "ingestQueryInstances",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.ingest_query_instances) );
      ( "hardDeleteDefaultDuration",
        option_to_yojson duration_to_yojson x.hard_delete_default_duration );
      ("deleteGracePeriod", option_to_yojson duration_to_yojson x.delete_grace_period);
      ("retentionCheckInterval", option_to_yojson duration_to_yojson x.retention_check_interval);
      ("gen1LookbackDuration", option_to_yojson duration_to_yojson x.gen1_lookback_duration);
      ( "tableIndexCacheConcurrencyLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.table_index_cache_concurrency_limit );
      ( "tableIndexCacheMaxEntries",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.table_index_cache_max_entries );
      ( "walReplayConcurrencyLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.wal_replay_concurrency_limit );
      ( "walReplayFailOnError",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.wal_replay_fail_on_error );
      ( "parquetMemCacheSize",
        option_to_yojson percent_or_absolute_long_to_yojson x.parquet_mem_cache_size );
      ("execMemPoolBytes", option_to_yojson percent_or_absolute_long_to_yojson x.exec_mem_pool_bytes);
      ("gen1Duration", option_to_yojson duration_to_yojson x.gen1_duration);
      ( "distinctCacheEvictionInterval",
        option_to_yojson duration_to_yojson x.distinct_cache_eviction_interval );
      ( "lastCacheEvictionInterval",
        option_to_yojson duration_to_yojson x.last_cache_eviction_interval );
      ( "parquetMemCacheQueryPathDuration",
        option_to_yojson duration_to_yojson x.parquet_mem_cache_query_path_duration );
      ( "disableParquetMemCache",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.disable_parquet_mem_cache );
      ( "parquetMemCachePruneInterval",
        option_to_yojson duration_to_yojson x.parquet_mem_cache_prune_interval );
      ( "parquetMemCachePrunePercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
          x.parquet_mem_cache_prune_percentage );
      ("preemptiveCacheAge", option_to_yojson duration_to_yojson x.preemptive_cache_age);
      ( "snapshottedWalFilesToKeep",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshotted_wal_files_to_keep );
      ( "walMaxWriteBufferSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.wal_max_write_buffer_size );
      ( "walSnapshotSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.wal_snapshot_size
      );
      ( "forceSnapshotMemThreshold",
        option_to_yojson percent_or_absolute_long_to_yojson x.force_snapshot_mem_threshold );
      ( "maxHttpRequestSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.max_http_request_size );
      ( "dataFusionConfig",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.data_fusion_config );
      ( "dataFusionUseCachedParquetLoader",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.data_fusion_use_cached_parquet_loader );
      ( "dataFusionMaxParquetFanout",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_max_parquet_fanout );
      ( "dataFusionRuntimeThreadPriority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_thread_priority );
      ( "dataFusionRuntimeThreadKeepAlive",
        option_to_yojson duration_to_yojson x.data_fusion_runtime_thread_keep_alive );
      ( "dataFusionRuntimeMaxIoEventsPerTick",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_max_io_events_per_tick );
      ( "dataFusionRuntimeMaxBlockingThreads",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_max_blocking_threads );
      ( "dataFusionRuntimeGlobalQueueInterval",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_global_queue_interval );
      ( "dataFusionRuntimeEventInterval",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_event_interval );
      ( "dataFusionRuntimeDisableLifoSlot",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.data_fusion_runtime_disable_lifo_slot );
      ( "dataFusionRuntimeType",
        option_to_yojson data_fusion_runtime_type_to_yojson x.data_fusion_runtime_type );
      ( "dataFusionNumThreads",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_num_threads );
      ("logFormat", option_to_yojson log_formats_to_yojson x.log_format);
      ( "logFilter",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.log_filter );
      ( "queryLogSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_log_size );
      ( "queryFileLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_file_limit
      );
    ]

let parameters_to_yojson (x : parameters) =
  match x with
  | InfluxDBv3Enterprise arg ->
      assoc_to_yojson
        [ ("InfluxDBv3Enterprise", Some (influx_d_bv3_enterprise_parameters_to_yojson arg)) ]
  | InfluxDBv3Core arg ->
      assoc_to_yojson [ ("InfluxDBv3Core", Some (influx_d_bv3_core_parameters_to_yojson arg)) ]
  | InfluxDBv2 arg ->
      assoc_to_yojson [ ("InfluxDBv2", Some (influx_d_bv2_parameters_to_yojson arg)) ]

let organization_to_yojson = string_to_yojson
let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson response_tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let db_parameter_group_id_to_yojson = string_to_yojson
let db_parameter_group_name_to_yojson = string_to_yojson

let db_parameter_group_summary_to_yojson (x : db_parameter_group_summary) =
  assoc_to_yojson
    [
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_parameter_group_name_to_yojson x.name));
      ("id", Some (db_parameter_group_id_to_yojson x.id));
    ]

let db_parameter_group_summary_list_to_yojson tree =
  list_to_yojson db_parameter_group_summary_to_yojson tree

let list_db_parameter_groups_output_to_yojson (x : list_db_parameter_groups_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("items", Some (db_parameter_group_summary_list_to_yojson x.items));
    ]

let list_db_parameter_groups_input_to_yojson (x : list_db_parameter_groups_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let db_instance_summary_to_yojson (x : db_instance_summary) =
  assoc_to_yojson
    [
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("status", option_to_yojson status_to_yojson x.status);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("id", Some (db_instance_id_to_yojson x.id));
    ]

let db_instance_summary_list_to_yojson tree = list_to_yojson db_instance_summary_to_yojson tree

let list_db_instances_output_to_yojson (x : list_db_instances_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("items", Some (db_instance_summary_list_to_yojson x.items));
    ]

let list_db_instances_input_to_yojson (x : list_db_instances_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let db_instance_for_cluster_summary_to_yojson (x : db_instance_for_cluster_summary) =
  assoc_to_yojson
    [
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("status", option_to_yojson status_to_yojson x.status);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("id", Some (db_instance_id_to_yojson x.id));
    ]

let db_instance_for_cluster_summary_list_to_yojson tree =
  list_to_yojson db_instance_for_cluster_summary_to_yojson tree

let list_db_instances_for_cluster_output_to_yojson (x : list_db_instances_for_cluster_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("items", Some (db_instance_for_cluster_summary_list_to_yojson x.items));
    ]

let list_db_instances_for_cluster_input_to_yojson (x : list_db_instances_for_cluster_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("dbClusterId", Some (db_cluster_id_to_yojson x.db_cluster_id));
    ]

let db_cluster_name_to_yojson = string_to_yojson

let cluster_deployment_type_to_yojson (x : cluster_deployment_type) =
  match x with MULTI_NODE_READ_REPLICAS -> `String "MULTI_NODE_READ_REPLICAS"

let engine_type_to_yojson (x : engine_type) =
  match x with
  | INFLUXDB_V3_ENTERPRISE -> `String "INFLUXDB_V3_ENTERPRISE"
  | INFLUXDB_V3_CORE -> `String "INFLUXDB_V3_CORE"
  | INFLUXDB_V2 -> `String "INFLUXDB_V2"

let db_cluster_summary_to_yojson (x : db_cluster_summary) =
  assoc_to_yojson
    [
      ("engineType", option_to_yojson engine_type_to_yojson x.engine_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("deploymentType", option_to_yojson cluster_deployment_type_to_yojson x.deployment_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "readerEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reader_endpoint
      );
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("status", option_to_yojson cluster_status_to_yojson x.status);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_cluster_name_to_yojson x.name));
      ("id", Some (db_cluster_id_to_yojson x.id));
    ]

let db_cluster_summary_list_to_yojson tree = list_to_yojson db_cluster_summary_to_yojson tree

let list_db_clusters_output_to_yojson (x : list_db_clusters_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("items", Some (db_cluster_summary_list_to_yojson x.items));
    ]

let list_db_clusters_input_to_yojson (x : list_db_clusters_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_db_parameter_group_output_to_yojson (x : get_db_parameter_group_output) =
  assoc_to_yojson
    [
      ("parameters", option_to_yojson parameters_to_yojson x.parameters);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_parameter_group_name_to_yojson x.name));
      ("id", Some (db_parameter_group_id_to_yojson x.id));
    ]

let get_db_parameter_group_input_to_yojson (x : get_db_parameter_group_input) =
  assoc_to_yojson [ ("identifier", Some (db_parameter_group_identifier_to_yojson x.identifier)) ]

let get_db_instance_output_to_yojson (x : get_db_instance_output) =
  assoc_to_yojson
    [
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "secondaryAvailabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.secondary_availability_zone );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("status", option_to_yojson status_to_yojson x.status);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("id", Some (db_instance_id_to_yojson x.id));
    ]

let get_db_instance_input_to_yojson (x : get_db_instance_input) =
  assoc_to_yojson [ ("identifier", Some (db_instance_identifier_to_yojson x.identifier)) ]

let cluster_configuration_to_yojson (x : cluster_configuration) =
  assoc_to_yojson
    [
      ( "dedicatedCompactor",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.dedicated_compactor );
      ( "queryOnlyInstances",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.query_only_instances );
      ( "ingestQueryInstances",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.ingest_query_instances );
    ]

let get_db_cluster_output_to_yojson (x : get_db_cluster_output) =
  assoc_to_yojson
    [
      ( "clusterConfiguration",
        option_to_yojson cluster_configuration_to_yojson x.cluster_configuration );
      ("failoverMode", option_to_yojson failover_mode_to_yojson x.failover_mode);
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ("vpcSubnetIds", option_to_yojson vpc_subnet_id_list_to_yojson x.vpc_subnet_ids);
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("engineType", option_to_yojson engine_type_to_yojson x.engine_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("deploymentType", option_to_yojson cluster_deployment_type_to_yojson x.deployment_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "readerEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reader_endpoint
      );
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("status", option_to_yojson cluster_status_to_yojson x.status);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_cluster_name_to_yojson x.name));
      ("id", Some (db_cluster_id_to_yojson x.id));
    ]

let get_db_cluster_input_to_yojson (x : get_db_cluster_input) =
  assoc_to_yojson [ ("dbClusterId", Some (db_cluster_id_to_yojson x.db_cluster_id)) ]

let delete_db_instance_output_to_yojson (x : delete_db_instance_output) =
  assoc_to_yojson
    [
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "secondaryAvailabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.secondary_availability_zone );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("status", option_to_yojson status_to_yojson x.status);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("id", Some (db_instance_id_to_yojson x.id));
    ]

let delete_db_instance_input_to_yojson (x : delete_db_instance_input) =
  assoc_to_yojson [ ("identifier", Some (db_instance_identifier_to_yojson x.identifier)) ]

let delete_db_cluster_output_to_yojson (x : delete_db_cluster_output) =
  assoc_to_yojson
    [ ("dbClusterStatus", option_to_yojson cluster_status_to_yojson x.db_cluster_status) ]

let delete_db_cluster_input_to_yojson (x : delete_db_cluster_input) =
  assoc_to_yojson [ ("dbClusterId", Some (db_cluster_id_to_yojson x.db_cluster_id)) ]

let create_db_parameter_group_output_to_yojson (x : create_db_parameter_group_output) =
  assoc_to_yojson
    [
      ("parameters", option_to_yojson parameters_to_yojson x.parameters);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_parameter_group_name_to_yojson x.name));
      ("id", Some (db_parameter_group_id_to_yojson x.id));
    ]

let create_db_parameter_group_input_to_yojson (x : create_db_parameter_group_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ("parameters", option_to_yojson parameters_to_yojson x.parameters);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("name", Some (db_parameter_group_name_to_yojson x.name));
    ]

let create_db_instance_output_to_yojson (x : create_db_instance_output) =
  assoc_to_yojson
    [
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "secondaryAvailabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.secondary_availability_zone );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("status", option_to_yojson status_to_yojson x.status);
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("id", Some (db_instance_id_to_yojson x.id));
    ]

let bucket_to_yojson = string_to_yojson

let create_db_instance_input_to_yojson (x : create_db_instance_input) =
  assoc_to_yojson
    [
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("port", option_to_yojson port_to_yojson x.port);
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ("allocatedStorage", Some (allocated_storage_to_yojson x.allocated_storage));
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("vpcSecurityGroupIds", Some (vpc_security_group_id_list_to_yojson x.vpc_security_group_ids));
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ("dbInstanceType", Some (db_instance_type_to_yojson x.db_instance_type));
      ("bucket", option_to_yojson bucket_to_yojson x.bucket);
      ("organization", option_to_yojson organization_to_yojson x.organization);
      ("password", Some (password_to_yojson x.password));
      ("username", option_to_yojson username_to_yojson x.username);
      ("name", Some (db_instance_name_to_yojson x.name));
    ]

let create_db_cluster_output_to_yojson (x : create_db_cluster_output) =
  assoc_to_yojson
    [
      ("dbClusterStatus", option_to_yojson cluster_status_to_yojson x.db_cluster_status);
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
    ]

let create_db_cluster_input_to_yojson (x : create_db_cluster_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ("failoverMode", option_to_yojson failover_mode_to_yojson x.failover_mode);
      ("deploymentType", option_to_yojson cluster_deployment_type_to_yojson x.deployment_type);
      ("vpcSecurityGroupIds", Some (vpc_security_group_id_list_to_yojson x.vpc_security_group_ids));
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("dbInstanceType", Some (db_instance_type_to_yojson x.db_instance_type));
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ("port", option_to_yojson port_to_yojson x.port);
      ("bucket", option_to_yojson bucket_to_yojson x.bucket);
      ("organization", option_to_yojson organization_to_yojson x.organization);
      ("password", option_to_yojson password_to_yojson x.password);
      ("username", option_to_yojson username_to_yojson x.username);
      ("name", Some (db_cluster_name_to_yojson x.name));
    ]
