open Smaws_Lib.Json.SerializeHelpers
open Types

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let allocated_storage_to_yojson = int_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let tag_value_to_yojson = string_to_yojson
let request_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tags", Some (request_tag_map_to_yojson x.tags));
    ]

let response_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson response_tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let bucket_to_yojson = string_to_yojson

let cluster_configuration_to_yojson (x : cluster_configuration) =
  assoc_to_yojson
    [
      ( "ingestQueryInstances",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.ingest_query_instances );
      ( "queryOnlyInstances",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.query_only_instances );
      ( "dedicatedCompactor",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.dedicated_compactor );
    ]

let cluster_deployment_type_to_yojson (x : cluster_deployment_type) =
  match x with MULTI_NODE_READ_REPLICAS -> `String "MULTI_NODE_READ_REPLICAS"

let cluster_status_to_yojson (x : cluster_status) =
  match x with
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | AVAILABLE -> `String "AVAILABLE"
  | FAILED -> `String "FAILED"
  | DELETED -> `String "DELETED"
  | MAINTENANCE -> `String "MAINTENANCE"
  | UPDATING_INSTANCE_TYPE -> `String "UPDATING_INSTANCE_TYPE"
  | REBOOTING -> `String "REBOOTING"
  | REBOOT_FAILED -> `String "REBOOT_FAILED"
  | PARTIALLY_AVAILABLE -> `String "PARTIALLY_AVAILABLE"

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | FIELD_VALIDATION_FAILED -> `String "FIELD_VALIDATION_FAILED"
  | OTHER -> `String "OTHER"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let db_cluster_id_to_yojson = string_to_yojson

let create_db_cluster_output_to_yojson (x : create_db_cluster_output) =
  assoc_to_yojson
    [
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
      ("dbClusterStatus", option_to_yojson cluster_status_to_yojson x.db_cluster_status);
    ]

let maintenance_window_to_yojson = string_to_yojson
let iana_timezone_to_yojson = string_to_yojson

let maintenance_schedule_to_yojson (x : maintenance_schedule) =
  assoc_to_yojson
    [
      ("timezone", Some (iana_timezone_to_yojson x.timezone));
      ( "preferredMaintenanceWindow",
        Some (maintenance_window_to_yojson x.preferred_maintenance_window) );
    ]

let s3_configuration_to_yojson (x : s3_configuration) =
  assoc_to_yojson
    [
      ("bucketName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.bucket_name));
      ("enabled", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled));
    ]

let log_delivery_configuration_to_yojson (x : log_delivery_configuration) =
  assoc_to_yojson [ ("s3Configuration", Some (s3_configuration_to_yojson x.s3_configuration)) ]

let failover_mode_to_yojson (x : failover_mode) =
  match x with AUTOMATIC -> `String "AUTOMATIC" | NO_FAILOVER -> `String "NO_FAILOVER"

let vpc_security_group_id_to_yojson = string_to_yojson
let vpc_security_group_id_list_to_yojson tree = list_to_yojson vpc_security_group_id_to_yojson tree
let vpc_subnet_id_to_yojson = string_to_yojson
let vpc_subnet_id_list_to_yojson tree = list_to_yojson vpc_subnet_id_to_yojson tree

let network_type_to_yojson (x : network_type) =
  match x with IPV4 -> `String "IPV4" | DUAL -> `String "DUAL"

let db_storage_type_to_yojson (x : db_storage_type) =
  match x with
  | INFLUX_IO_INCLUDED_T1 -> `String "InfluxIOIncludedT1"
  | INFLUX_IO_INCLUDED_T2 -> `String "InfluxIOIncludedT2"
  | INFLUX_IO_INCLUDED_T3 -> `String "InfluxIOIncludedT3"

let db_instance_type_to_yojson (x : db_instance_type) =
  match x with
  | DB_INFLUX_MEDIUM -> `String "db.influx.medium"
  | DB_INFLUX_LARGE -> `String "db.influx.large"
  | DB_INFLUX_XLARGE -> `String "db.influx.xlarge"
  | DB_INFLUX_2XLARGE -> `String "db.influx.2xlarge"
  | DB_INFLUX_4XLARGE -> `String "db.influx.4xlarge"
  | DB_INFLUX_8XLARGE -> `String "db.influx.8xlarge"
  | DB_INFLUX_12XLARGE -> `String "db.influx.12xlarge"
  | DB_INFLUX_16XLARGE -> `String "db.influx.16xlarge"
  | DB_INFLUX_24XLARGE -> `String "db.influx.24xlarge"

let db_parameter_group_identifier_to_yojson = string_to_yojson
let port_to_yojson = int_to_yojson
let organization_to_yojson = string_to_yojson
let password_to_yojson = string_to_yojson
let username_to_yojson = string_to_yojson
let db_cluster_name_to_yojson = string_to_yojson

let create_db_cluster_input_to_yojson (x : create_db_cluster_input) =
  assoc_to_yojson
    [
      ("name", Some (db_cluster_name_to_yojson x.name));
      ("username", option_to_yojson username_to_yojson x.username);
      ("password", option_to_yojson password_to_yojson x.password);
      ("organization", option_to_yojson organization_to_yojson x.organization);
      ("bucket", option_to_yojson bucket_to_yojson x.bucket);
      ("port", option_to_yojson port_to_yojson x.port);
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ("dbInstanceType", Some (db_instance_type_to_yojson x.db_instance_type));
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ("vpcSecurityGroupIds", Some (vpc_security_group_id_list_to_yojson x.vpc_security_group_ids));
      ("deploymentType", option_to_yojson cluster_deployment_type_to_yojson x.deployment_type);
      ("failoverMode", option_to_yojson failover_mode_to_yojson x.failover_mode);
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
    ]

let instance_mode_to_yojson (x : instance_mode) =
  match x with
  | PRIMARY -> `String "PRIMARY"
  | STANDBY -> `String "STANDBY"
  | REPLICA -> `String "REPLICA"
  | INGEST -> `String "INGEST"
  | QUERY -> `String "QUERY"
  | COMPACT -> `String "COMPACT"
  | PROCESS -> `String "PROCESS"

let instance_mode_list_to_yojson tree = list_to_yojson instance_mode_to_yojson tree

let deployment_type_to_yojson (x : deployment_type) =
  match x with
  | SINGLE_AZ -> `String "SINGLE_AZ"
  | WITH_MULTIAZ_STANDBY -> `String "WITH_MULTIAZ_STANDBY"

let status_to_yojson (x : status) =
  match x with
  | CREATING -> `String "CREATING"
  | AVAILABLE -> `String "AVAILABLE"
  | DELETING -> `String "DELETING"
  | MODIFYING -> `String "MODIFYING"
  | UPDATING -> `String "UPDATING"
  | DELETED -> `String "DELETED"
  | FAILED -> `String "FAILED"
  | UPDATING_DEPLOYMENT_TYPE -> `String "UPDATING_DEPLOYMENT_TYPE"
  | UPDATING_INSTANCE_TYPE -> `String "UPDATING_INSTANCE_TYPE"
  | MAINTENANCE -> `String "MAINTENANCE"
  | REBOOTING -> `String "REBOOTING"
  | REBOOT_FAILED -> `String "REBOOT_FAILED"

let db_instance_name_to_yojson = string_to_yojson
let db_instance_id_to_yojson = string_to_yojson

let create_db_instance_output_to_yojson (x : create_db_instance_output) =
  assoc_to_yojson
    [
      ("id", Some (db_instance_id_to_yojson x.id));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("status", option_to_yojson status_to_yojson x.status);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("port", option_to_yojson port_to_yojson x.port);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "secondaryAvailabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.secondary_availability_zone );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
    ]

let create_db_instance_input_to_yojson (x : create_db_instance_input) =
  assoc_to_yojson
    [
      ("name", Some (db_instance_name_to_yojson x.name));
      ("username", option_to_yojson username_to_yojson x.username);
      ("password", Some (password_to_yojson x.password));
      ("organization", option_to_yojson organization_to_yojson x.organization);
      ("bucket", option_to_yojson bucket_to_yojson x.bucket);
      ("dbInstanceType", Some (db_instance_type_to_yojson x.db_instance_type));
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ("vpcSecurityGroupIds", Some (vpc_security_group_id_list_to_yojson x.vpc_security_group_ids));
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", Some (allocated_storage_to_yojson x.allocated_storage));
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ("port", option_to_yojson port_to_yojson x.port);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
    ]

let duration_type_to_yojson (x : duration_type) =
  match x with
  | HOURS -> `String "hours"
  | MINUTES -> `String "minutes"
  | SECONDS -> `String "seconds"
  | MILLISECONDS -> `String "milliseconds"
  | DAYS -> `String "days"

let duration_to_yojson (x : duration) =
  assoc_to_yojson
    [
      ("durationType", Some (duration_type_to_yojson x.duration_type));
      ("value", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.value));
    ]

let percent_or_absolute_long_to_yojson (x : percent_or_absolute_long) =
  match x with
  | Percent arg ->
      assoc_to_yojson
        [ ("percent", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | Absolute arg ->
      assoc_to_yojson
        [ ("absolute", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson arg)) ]

let data_fusion_runtime_type_to_yojson (x : data_fusion_runtime_type) =
  match x with
  | MULTI_THREAD -> `String "multi-thread"
  | MULTI_THREAD_ALT -> `String "multi-thread-alt"

let log_formats_to_yojson (x : log_formats) = match x with FULL -> `String "full"

let influx_d_bv3_enterprise_parameters_to_yojson (x : influx_d_bv3_enterprise_parameters) =
  assoc_to_yojson
    [
      ( "queryFileLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_file_limit
      );
      ( "queryLogSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_log_size );
      ( "logFilter",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.log_filter );
      ("logFormat", option_to_yojson log_formats_to_yojson x.log_format);
      ( "dataFusionNumThreads",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_num_threads );
      ( "dataFusionRuntimeType",
        option_to_yojson data_fusion_runtime_type_to_yojson x.data_fusion_runtime_type );
      ( "dataFusionRuntimeDisableLifoSlot",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.data_fusion_runtime_disable_lifo_slot );
      ( "dataFusionRuntimeEventInterval",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_event_interval );
      ( "dataFusionRuntimeGlobalQueueInterval",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_global_queue_interval );
      ( "dataFusionRuntimeMaxBlockingThreads",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_max_blocking_threads );
      ( "dataFusionRuntimeMaxIoEventsPerTick",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_max_io_events_per_tick );
      ( "dataFusionRuntimeThreadKeepAlive",
        option_to_yojson duration_to_yojson x.data_fusion_runtime_thread_keep_alive );
      ( "dataFusionRuntimeThreadPriority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_thread_priority );
      ( "dataFusionMaxParquetFanout",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_max_parquet_fanout );
      ( "dataFusionUseCachedParquetLoader",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.data_fusion_use_cached_parquet_loader );
      ( "dataFusionConfig",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.data_fusion_config );
      ( "maxHttpRequestSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.max_http_request_size );
      ( "forceSnapshotMemThreshold",
        option_to_yojson percent_or_absolute_long_to_yojson x.force_snapshot_mem_threshold );
      ( "walSnapshotSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.wal_snapshot_size
      );
      ( "walMaxWriteBufferSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.wal_max_write_buffer_size );
      ( "snapshottedWalFilesToKeep",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshotted_wal_files_to_keep );
      ("preemptiveCacheAge", option_to_yojson duration_to_yojson x.preemptive_cache_age);
      ( "parquetMemCachePrunePercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
          x.parquet_mem_cache_prune_percentage );
      ( "parquetMemCachePruneInterval",
        option_to_yojson duration_to_yojson x.parquet_mem_cache_prune_interval );
      ( "disableParquetMemCache",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.disable_parquet_mem_cache );
      ( "parquetMemCacheQueryPathDuration",
        option_to_yojson duration_to_yojson x.parquet_mem_cache_query_path_duration );
      ( "lastCacheEvictionInterval",
        option_to_yojson duration_to_yojson x.last_cache_eviction_interval );
      ( "distinctCacheEvictionInterval",
        option_to_yojson duration_to_yojson x.distinct_cache_eviction_interval );
      ("gen1Duration", option_to_yojson duration_to_yojson x.gen1_duration);
      ("execMemPoolBytes", option_to_yojson percent_or_absolute_long_to_yojson x.exec_mem_pool_bytes);
      ( "parquetMemCacheSize",
        option_to_yojson percent_or_absolute_long_to_yojson x.parquet_mem_cache_size );
      ( "walReplayFailOnError",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.wal_replay_fail_on_error );
      ( "walReplayConcurrencyLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.wal_replay_concurrency_limit );
      ( "tableIndexCacheMaxEntries",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.table_index_cache_max_entries );
      ( "tableIndexCacheConcurrencyLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.table_index_cache_concurrency_limit );
      ("gen1LookbackDuration", option_to_yojson duration_to_yojson x.gen1_lookback_duration);
      ("retentionCheckInterval", option_to_yojson duration_to_yojson x.retention_check_interval);
      ("deleteGracePeriod", option_to_yojson duration_to_yojson x.delete_grace_period);
      ( "hardDeleteDefaultDuration",
        option_to_yojson duration_to_yojson x.hard_delete_default_duration );
      ( "ingestQueryInstances",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.ingest_query_instances) );
      ( "queryOnlyInstances",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_only_instances) );
      ( "dedicatedCompactor",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.dedicated_compactor) );
      ( "compactionRowLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.compaction_row_limit );
      ( "compactionMaxNumFilesPerPlan",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.compaction_max_num_files_per_plan );
      ("compactionGen2Duration", option_to_yojson duration_to_yojson x.compaction_gen2_duration);
      ( "compactionMultipliers",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.compaction_multipliers );
      ("compactionCleanupWait", option_to_yojson duration_to_yojson x.compaction_cleanup_wait);
      ("compactionCheckInterval", option_to_yojson duration_to_yojson x.compaction_check_interval);
      ( "lastValueCacheDisableFromHistory",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.last_value_cache_disable_from_history );
      ( "distinctValueCacheDisableFromHistory",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.distinct_value_cache_disable_from_history );
      ("replicationInterval", option_to_yojson duration_to_yojson x.replication_interval);
      ("catalogSyncInterval", option_to_yojson duration_to_yojson x.catalog_sync_interval);
    ]

let influx_d_bv3_core_parameters_to_yojson (x : influx_d_bv3_core_parameters) =
  assoc_to_yojson
    [
      ( "queryFileLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_file_limit
      );
      ( "queryLogSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_log_size );
      ( "logFilter",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.log_filter );
      ("logFormat", option_to_yojson log_formats_to_yojson x.log_format);
      ( "dataFusionNumThreads",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_num_threads );
      ( "dataFusionRuntimeType",
        option_to_yojson data_fusion_runtime_type_to_yojson x.data_fusion_runtime_type );
      ( "dataFusionRuntimeDisableLifoSlot",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.data_fusion_runtime_disable_lifo_slot );
      ( "dataFusionRuntimeEventInterval",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_event_interval );
      ( "dataFusionRuntimeGlobalQueueInterval",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_global_queue_interval );
      ( "dataFusionRuntimeMaxBlockingThreads",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_max_blocking_threads );
      ( "dataFusionRuntimeMaxIoEventsPerTick",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_max_io_events_per_tick );
      ( "dataFusionRuntimeThreadKeepAlive",
        option_to_yojson duration_to_yojson x.data_fusion_runtime_thread_keep_alive );
      ( "dataFusionRuntimeThreadPriority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_runtime_thread_priority );
      ( "dataFusionMaxParquetFanout",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_fusion_max_parquet_fanout );
      ( "dataFusionUseCachedParquetLoader",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.data_fusion_use_cached_parquet_loader );
      ( "dataFusionConfig",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.data_fusion_config );
      ( "maxHttpRequestSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.max_http_request_size );
      ( "forceSnapshotMemThreshold",
        option_to_yojson percent_or_absolute_long_to_yojson x.force_snapshot_mem_threshold );
      ( "walSnapshotSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.wal_snapshot_size
      );
      ( "walMaxWriteBufferSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.wal_max_write_buffer_size );
      ( "snapshottedWalFilesToKeep",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshotted_wal_files_to_keep );
      ("preemptiveCacheAge", option_to_yojson duration_to_yojson x.preemptive_cache_age);
      ( "parquetMemCachePrunePercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
          x.parquet_mem_cache_prune_percentage );
      ( "parquetMemCachePruneInterval",
        option_to_yojson duration_to_yojson x.parquet_mem_cache_prune_interval );
      ( "disableParquetMemCache",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.disable_parquet_mem_cache );
      ( "parquetMemCacheQueryPathDuration",
        option_to_yojson duration_to_yojson x.parquet_mem_cache_query_path_duration );
      ( "lastCacheEvictionInterval",
        option_to_yojson duration_to_yojson x.last_cache_eviction_interval );
      ( "distinctCacheEvictionInterval",
        option_to_yojson duration_to_yojson x.distinct_cache_eviction_interval );
      ("gen1Duration", option_to_yojson duration_to_yojson x.gen1_duration);
      ("execMemPoolBytes", option_to_yojson percent_or_absolute_long_to_yojson x.exec_mem_pool_bytes);
      ( "parquetMemCacheSize",
        option_to_yojson percent_or_absolute_long_to_yojson x.parquet_mem_cache_size );
      ( "walReplayFailOnError",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.wal_replay_fail_on_error );
      ( "walReplayConcurrencyLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.wal_replay_concurrency_limit );
      ( "tableIndexCacheMaxEntries",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.table_index_cache_max_entries );
      ( "tableIndexCacheConcurrencyLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.table_index_cache_concurrency_limit );
      ("gen1LookbackDuration", option_to_yojson duration_to_yojson x.gen1_lookback_duration);
      ("retentionCheckInterval", option_to_yojson duration_to_yojson x.retention_check_interval);
      ("deleteGracePeriod", option_to_yojson duration_to_yojson x.delete_grace_period);
      ( "hardDeleteDefaultDuration",
        option_to_yojson duration_to_yojson x.hard_delete_default_duration );
    ]

let tracing_type_to_yojson (x : tracing_type) =
  match x with LOG -> `String "log" | JAEGER -> `String "jaeger" | DISABLED -> `String "disabled"

let log_level_to_yojson (x : log_level) =
  match x with DEBUG -> `String "debug" | INFO -> `String "info" | ERROR -> `String "error"

let influx_d_bv2_parameters_to_yojson (x : influx_d_bv2_parameters) =
  assoc_to_yojson
    [
      ( "fluxLogEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.flux_log_enabled
      );
      ("logLevel", option_to_yojson log_level_to_yojson x.log_level);
      ( "noTasks",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.no_tasks );
      ( "queryConcurrency",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_concurrency
      );
      ( "queryQueueSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.query_queue_size
      );
      ("tracingType", option_to_yojson tracing_type_to_yojson x.tracing_type);
      ( "metricsDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.metrics_disabled
      );
      ("httpIdleTimeout", option_to_yojson duration_to_yojson x.http_idle_timeout);
      ("httpReadHeaderTimeout", option_to_yojson duration_to_yojson x.http_read_header_timeout);
      ("httpReadTimeout", option_to_yojson duration_to_yojson x.http_read_timeout);
      ("httpWriteTimeout", option_to_yojson duration_to_yojson x.http_write_timeout);
      ( "influxqlMaxSelectBuckets",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.influxql_max_select_buckets );
      ( "influxqlMaxSelectPoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.influxql_max_select_point );
      ( "influxqlMaxSelectSeries",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.influxql_max_select_series );
      ( "pprofDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.pprof_disabled
      );
      ( "queryInitialMemoryBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.query_initial_memory_bytes );
      ( "queryMaxMemoryBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.query_max_memory_bytes );
      ( "queryMemoryBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.query_memory_bytes
      );
      ( "sessionLength",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.session_length );
      ( "sessionRenewDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.session_renew_disabled );
      ( "storageCacheMaxMemorySize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.storage_cache_max_memory_size );
      ( "storageCacheSnapshotMemorySize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.storage_cache_snapshot_memory_size );
      ( "storageCacheSnapshotWriteColdDuration",
        option_to_yojson duration_to_yojson x.storage_cache_snapshot_write_cold_duration );
      ( "storageCompactFullWriteColdDuration",
        option_to_yojson duration_to_yojson x.storage_compact_full_write_cold_duration );
      ( "storageCompactThroughputBurst",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.storage_compact_throughput_burst );
      ( "storageMaxConcurrentCompactions",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.storage_max_concurrent_compactions );
      ( "storageMaxIndexLogFileSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.storage_max_index_log_file_size );
      ( "storageNoValidateFieldSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.storage_no_validate_field_size );
      ( "storageRetentionCheckInterval",
        option_to_yojson duration_to_yojson x.storage_retention_check_interval );
      ( "storageSeriesFileMaxConcurrentSnapshotCompactions",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.storage_series_file_max_concurrent_snapshot_compactions );
      ( "storageSeriesIdSetCacheSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.storage_series_id_set_cache_size );
      ( "storageWalMaxConcurrentWrites",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.storage_wal_max_concurrent_writes );
      ("storageWalMaxWriteDelay", option_to_yojson duration_to_yojson x.storage_wal_max_write_delay);
      ( "uiDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.ui_disabled );
    ]

let parameters_to_yojson (x : parameters) =
  match x with
  | InfluxDBv2 arg ->
      assoc_to_yojson [ ("InfluxDBv2", Some (influx_d_bv2_parameters_to_yojson arg)) ]
  | InfluxDBv3Core arg ->
      assoc_to_yojson [ ("InfluxDBv3Core", Some (influx_d_bv3_core_parameters_to_yojson arg)) ]
  | InfluxDBv3Enterprise arg ->
      assoc_to_yojson
        [ ("InfluxDBv3Enterprise", Some (influx_d_bv3_enterprise_parameters_to_yojson arg)) ]

let db_parameter_group_name_to_yojson = string_to_yojson
let db_parameter_group_id_to_yojson = string_to_yojson

let create_db_parameter_group_output_to_yojson (x : create_db_parameter_group_output) =
  assoc_to_yojson
    [
      ("id", Some (db_parameter_group_id_to_yojson x.id));
      ("name", Some (db_parameter_group_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("parameters", option_to_yojson parameters_to_yojson x.parameters);
    ]

let create_db_parameter_group_input_to_yojson (x : create_db_parameter_group_input) =
  assoc_to_yojson
    [
      ("name", Some (db_parameter_group_name_to_yojson x.name));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("parameters", option_to_yojson parameters_to_yojson x.parameters);
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
    ]

let engine_type_to_yojson (x : engine_type) =
  match x with
  | INFLUXDB_V2 -> `String "INFLUXDB_V2"
  | INFLUXDB_V3_CORE -> `String "INFLUXDB_V3_CORE"
  | INFLUXDB_V3_ENTERPRISE -> `String "INFLUXDB_V3_ENTERPRISE"

let db_cluster_summary_to_yojson (x : db_cluster_summary) =
  assoc_to_yojson
    [
      ("id", Some (db_cluster_id_to_yojson x.id));
      ("name", Some (db_cluster_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("status", option_to_yojson cluster_status_to_yojson x.status);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ( "readerEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reader_endpoint
      );
      ("port", option_to_yojson port_to_yojson x.port);
      ("deploymentType", option_to_yojson cluster_deployment_type_to_yojson x.deployment_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("engineType", option_to_yojson engine_type_to_yojson x.engine_type);
    ]

let db_cluster_summary_list_to_yojson tree = list_to_yojson db_cluster_summary_to_yojson tree

let db_instance_for_cluster_summary_to_yojson (x : db_instance_for_cluster_summary) =
  assoc_to_yojson
    [
      ("id", Some (db_instance_id_to_yojson x.id));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("status", option_to_yojson status_to_yojson x.status);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("port", option_to_yojson port_to_yojson x.port);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
    ]

let db_instance_for_cluster_summary_list_to_yojson tree =
  list_to_yojson db_instance_for_cluster_summary_to_yojson tree

let db_instance_id_list_to_yojson tree = list_to_yojson db_instance_id_to_yojson tree
let db_instance_identifier_to_yojson = string_to_yojson

let db_instance_summary_to_yojson (x : db_instance_summary) =
  assoc_to_yojson
    [
      ("id", Some (db_instance_id_to_yojson x.id));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("status", option_to_yojson status_to_yojson x.status);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("port", option_to_yojson port_to_yojson x.port);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
    ]

let db_instance_summary_list_to_yojson tree = list_to_yojson db_instance_summary_to_yojson tree

let db_parameter_group_summary_to_yojson (x : db_parameter_group_summary) =
  assoc_to_yojson
    [
      ("id", Some (db_parameter_group_id_to_yojson x.id));
      ("name", Some (db_parameter_group_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
    ]

let db_parameter_group_summary_list_to_yojson tree =
  list_to_yojson db_parameter_group_summary_to_yojson tree

let delete_db_cluster_output_to_yojson (x : delete_db_cluster_output) =
  assoc_to_yojson
    [ ("dbClusterStatus", option_to_yojson cluster_status_to_yojson x.db_cluster_status) ]

let delete_db_cluster_input_to_yojson (x : delete_db_cluster_input) =
  assoc_to_yojson [ ("dbClusterId", Some (db_cluster_id_to_yojson x.db_cluster_id)) ]

let delete_db_instance_output_to_yojson (x : delete_db_instance_output) =
  assoc_to_yojson
    [
      ("id", Some (db_instance_id_to_yojson x.id));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("status", option_to_yojson status_to_yojson x.status);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("port", option_to_yojson port_to_yojson x.port);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "secondaryAvailabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.secondary_availability_zone );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
    ]

let delete_db_instance_input_to_yojson (x : delete_db_instance_input) =
  assoc_to_yojson [ ("identifier", Some (db_instance_identifier_to_yojson x.identifier)) ]

let get_db_cluster_output_to_yojson (x : get_db_cluster_output) =
  assoc_to_yojson
    [
      ("id", Some (db_cluster_id_to_yojson x.id));
      ("name", Some (db_cluster_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("status", option_to_yojson cluster_status_to_yojson x.status);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ( "readerEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reader_endpoint
      );
      ("port", option_to_yojson port_to_yojson x.port);
      ("deploymentType", option_to_yojson cluster_deployment_type_to_yojson x.deployment_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("engineType", option_to_yojson engine_type_to_yojson x.engine_type);
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ("vpcSubnetIds", option_to_yojson vpc_subnet_id_list_to_yojson x.vpc_subnet_ids);
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ("failoverMode", option_to_yojson failover_mode_to_yojson x.failover_mode);
      ( "clusterConfiguration",
        option_to_yojson cluster_configuration_to_yojson x.cluster_configuration );
    ]

let get_db_cluster_input_to_yojson (x : get_db_cluster_input) =
  assoc_to_yojson [ ("dbClusterId", Some (db_cluster_id_to_yojson x.db_cluster_id)) ]

let get_db_instance_output_to_yojson (x : get_db_instance_output) =
  assoc_to_yojson
    [
      ("id", Some (db_instance_id_to_yojson x.id));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("status", option_to_yojson status_to_yojson x.status);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("port", option_to_yojson port_to_yojson x.port);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "secondaryAvailabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.secondary_availability_zone );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
    ]

let get_db_instance_input_to_yojson (x : get_db_instance_input) =
  assoc_to_yojson [ ("identifier", Some (db_instance_identifier_to_yojson x.identifier)) ]

let get_db_parameter_group_output_to_yojson (x : get_db_parameter_group_output) =
  assoc_to_yojson
    [
      ("id", Some (db_parameter_group_id_to_yojson x.id));
      ("name", Some (db_parameter_group_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("parameters", option_to_yojson parameters_to_yojson x.parameters);
    ]

let get_db_parameter_group_input_to_yojson (x : get_db_parameter_group_input) =
  assoc_to_yojson [ ("identifier", Some (db_parameter_group_identifier_to_yojson x.identifier)) ]

let next_token_to_yojson = string_to_yojson

let list_db_clusters_output_to_yojson (x : list_db_clusters_output) =
  assoc_to_yojson
    [
      ("items", Some (db_cluster_summary_list_to_yojson x.items));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_db_clusters_input_to_yojson (x : list_db_clusters_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_db_instances_output_to_yojson (x : list_db_instances_output) =
  assoc_to_yojson
    [
      ("items", Some (db_instance_summary_list_to_yojson x.items));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_db_instances_input_to_yojson (x : list_db_instances_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_db_instances_for_cluster_output_to_yojson (x : list_db_instances_for_cluster_output) =
  assoc_to_yojson
    [
      ("items", Some (db_instance_for_cluster_summary_list_to_yojson x.items));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_db_instances_for_cluster_input_to_yojson (x : list_db_instances_for_cluster_input) =
  assoc_to_yojson
    [
      ("dbClusterId", Some (db_cluster_id_to_yojson x.db_cluster_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_db_parameter_groups_output_to_yojson (x : list_db_parameter_groups_output) =
  assoc_to_yojson
    [
      ("items", Some (db_parameter_group_summary_list_to_yojson x.items));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_db_parameter_groups_input_to_yojson (x : list_db_parameter_groups_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let reboot_db_cluster_output_to_yojson (x : reboot_db_cluster_output) =
  assoc_to_yojson
    [ ("dbClusterStatus", option_to_yojson cluster_status_to_yojson x.db_cluster_status) ]

let reboot_db_cluster_input_to_yojson (x : reboot_db_cluster_input) =
  assoc_to_yojson
    [
      ("dbClusterId", Some (db_cluster_id_to_yojson x.db_cluster_id));
      ("instanceIds", option_to_yojson db_instance_id_list_to_yojson x.instance_ids);
    ]

let reboot_db_instance_output_to_yojson (x : reboot_db_instance_output) =
  assoc_to_yojson
    [
      ("id", Some (db_instance_id_to_yojson x.id));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("status", option_to_yojson status_to_yojson x.status);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("port", option_to_yojson port_to_yojson x.port);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "secondaryAvailabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.secondary_availability_zone );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
    ]

let reboot_db_instance_input_to_yojson (x : reboot_db_instance_input) =
  assoc_to_yojson [ ("identifier", Some (db_instance_identifier_to_yojson x.identifier)) ]

let update_db_cluster_output_to_yojson (x : update_db_cluster_output) =
  assoc_to_yojson
    [ ("dbClusterStatus", option_to_yojson cluster_status_to_yojson x.db_cluster_status) ]

let update_db_cluster_input_to_yojson (x : update_db_cluster_input) =
  assoc_to_yojson
    [
      ("dbClusterId", Some (db_cluster_id_to_yojson x.db_cluster_id));
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ("port", option_to_yojson port_to_yojson x.port);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("failoverMode", option_to_yojson failover_mode_to_yojson x.failover_mode);
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
    ]

let update_db_instance_output_to_yojson (x : update_db_instance_output) =
  assoc_to_yojson
    [
      ("id", Some (db_instance_id_to_yojson x.id));
      ("name", Some (db_instance_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
      ("status", option_to_yojson status_to_yojson x.status);
      ( "endpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint );
      ("port", option_to_yojson port_to_yojson x.port);
      ("networkType", option_to_yojson network_type_to_yojson x.network_type);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("vpcSubnetIds", Some (vpc_subnet_id_list_to_yojson x.vpc_subnet_ids));
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "secondaryAvailabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.secondary_availability_zone );
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "influxAuthParametersSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.influx_auth_parameters_secret_arn );
      ("dbClusterId", option_to_yojson db_cluster_id_to_yojson x.db_cluster_id);
      ("instanceMode", option_to_yojson instance_mode_to_yojson x.instance_mode);
      ("instanceModes", option_to_yojson instance_mode_list_to_yojson x.instance_modes);
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
      ( "lastMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_maintenance_time );
      ( "nextMaintenanceTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_maintenance_time );
    ]

let update_db_instance_input_to_yojson (x : update_db_instance_input) =
  assoc_to_yojson
    [
      ("identifier", Some (db_instance_identifier_to_yojson x.identifier));
      ( "logDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_to_yojson x.log_delivery_configuration );
      ( "dbParameterGroupIdentifier",
        option_to_yojson db_parameter_group_identifier_to_yojson x.db_parameter_group_identifier );
      ("port", option_to_yojson port_to_yojson x.port);
      ("dbInstanceType", option_to_yojson db_instance_type_to_yojson x.db_instance_type);
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("dbStorageType", option_to_yojson db_storage_type_to_yojson x.db_storage_type);
      ("allocatedStorage", option_to_yojson allocated_storage_to_yojson x.allocated_storage);
      ("maintenanceSchedule", option_to_yojson maintenance_schedule_to_yojson x.maintenance_schedule);
    ]
