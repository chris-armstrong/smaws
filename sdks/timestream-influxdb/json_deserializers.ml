open Smaws_Lib.Json.DeserializeHelpers
open Types

let vpc_subnet_id_of_yojson = string_of_yojson
let vpc_subnet_id_list_of_yojson tree path = list_of_yojson vpc_subnet_id_of_yojson tree path
let vpc_security_group_id_of_yojson = string_of_yojson

let vpc_security_group_id_list_of_yojson tree path =
  list_of_yojson vpc_security_group_id_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "OTHER" -> OTHER
    | `String "FIELD_VALIDATION_FAILED" -> FIELD_VALIDATION_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = value_for_key validation_exception_reason_of_yojson "reason" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception)

let username_of_yojson = string_of_yojson
let db_instance_id_of_yojson = string_of_yojson
let db_instance_name_of_yojson = string_of_yojson
let arn_of_yojson = string_of_yojson

let status_of_yojson (tree : t) path =
  ((match tree with
    | `String "REBOOT_FAILED" -> REBOOT_FAILED
    | `String "REBOOTING" -> REBOOTING
    | `String "MAINTENANCE" -> MAINTENANCE
    | `String "UPDATING_INSTANCE_TYPE" -> UPDATING_INSTANCE_TYPE
    | `String "UPDATING_DEPLOYMENT_TYPE" -> UPDATING_DEPLOYMENT_TYPE
    | `String "FAILED" -> FAILED
    | `String "DELETED" -> DELETED
    | `String "UPDATING" -> UPDATING
    | `String "MODIFYING" -> MODIFYING
    | `String "DELETING" -> DELETING
    | `String "AVAILABLE" -> AVAILABLE
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "Status" value)
    | _ -> raise (deserialize_wrong_type_error path "Status")
     : status)
    : status)

let port_of_yojson = int_of_yojson

let network_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DUAL" -> DUAL
    | `String "IPV4" -> IPV4
    | `String value -> raise (deserialize_unknown_enum_value_error path "NetworkType" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkType")
     : network_type)
    : network_type)

let db_instance_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "db.influx.24xlarge" -> DB_INFLUX_24XLARGE
    | `String "db.influx.16xlarge" -> DB_INFLUX_16XLARGE
    | `String "db.influx.12xlarge" -> DB_INFLUX_12XLARGE
    | `String "db.influx.8xlarge" -> DB_INFLUX_8XLARGE
    | `String "db.influx.4xlarge" -> DB_INFLUX_4XLARGE
    | `String "db.influx.2xlarge" -> DB_INFLUX_2XLARGE
    | `String "db.influx.xlarge" -> DB_INFLUX_XLARGE
    | `String "db.influx.large" -> DB_INFLUX_LARGE
    | `String "db.influx.medium" -> DB_INFLUX_MEDIUM
    | `String value -> raise (deserialize_unknown_enum_value_error path "DbInstanceType" value)
    | _ -> raise (deserialize_wrong_type_error path "DbInstanceType")
     : db_instance_type)
    : db_instance_type)

let db_storage_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "InfluxIOIncludedT3" -> INFLUX_IO_INCLUDED_T3
    | `String "InfluxIOIncludedT2" -> INFLUX_IO_INCLUDED_T2
    | `String "InfluxIOIncludedT1" -> INFLUX_IO_INCLUDED_T1
    | `String value -> raise (deserialize_unknown_enum_value_error path "DbStorageType" value)
    | _ -> raise (deserialize_wrong_type_error path "DbStorageType")
     : db_storage_type)
    : db_storage_type)

let allocated_storage_of_yojson = int_of_yojson

let deployment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WITH_MULTIAZ_STANDBY" -> WITH_MULTIAZ_STANDBY
    | `String "SINGLE_AZ" -> SINGLE_AZ
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentType")
     : deployment_type)
    : deployment_type)

let db_parameter_group_identifier_of_yojson = string_of_yojson

let s3_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "enabled" _list path;
     bucket_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "bucketName" _list
         path;
   }
    : s3_configuration)

let log_delivery_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_configuration = value_for_key s3_configuration_of_yojson "s3Configuration" _list path }
    : log_delivery_configuration)

let db_cluster_id_of_yojson = string_of_yojson

let instance_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROCESS" -> PROCESS
    | `String "COMPACT" -> COMPACT
    | `String "QUERY" -> QUERY
    | `String "INGEST" -> INGEST
    | `String "REPLICA" -> REPLICA
    | `String "STANDBY" -> STANDBY
    | `String "PRIMARY" -> PRIMARY
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceMode" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceMode")
     : instance_mode)
    : instance_mode)

let instance_mode_list_of_yojson tree path = list_of_yojson instance_mode_of_yojson tree path
let iana_timezone_of_yojson = string_of_yojson
let maintenance_window_of_yojson = string_of_yojson

let maintenance_schedule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     preferred_maintenance_window =
       value_for_key maintenance_window_of_yojson "preferredMaintenanceWindow" _list path;
     timezone = value_for_key iana_timezone_of_yojson "timezone" _list path;
   }
    : maintenance_schedule)

let update_db_instance_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "nextMaintenanceTime")
         _list path;
     last_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "lastMaintenanceTime")
         _list path;
     maintenance_schedule =
       option_of_yojson
         (value_for_key maintenance_schedule_of_yojson "maintenanceSchedule")
         _list path;
     instance_modes =
       option_of_yojson (value_for_key instance_mode_list_of_yojson "instanceModes") _list path;
     instance_mode =
       option_of_yojson (value_for_key instance_mode_of_yojson "instanceMode") _list path;
     db_cluster_id =
       option_of_yojson (value_for_key db_cluster_id_of_yojson "dbClusterId") _list path;
     influx_auth_parameters_secret_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "influxAuthParametersSecretArn")
         _list path;
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_of_yojson "logDeliveryConfiguration")
         _list path;
     secondary_availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "secondaryAvailabilityZone")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     db_parameter_group_identifier =
       option_of_yojson
         (value_for_key db_parameter_group_identifier_of_yojson "dbParameterGroupIdentifier")
         _list path;
     vpc_security_group_ids =
       option_of_yojson
         (value_for_key vpc_security_group_id_list_of_yojson "vpcSecurityGroupIds")
         _list path;
     publicly_accessible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "publiclyAccessible")
         _list path;
     vpc_subnet_ids = value_for_key vpc_subnet_id_list_of_yojson "vpcSubnetIds" _list path;
     deployment_type =
       option_of_yojson (value_for_key deployment_type_of_yojson "deploymentType") _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     db_instance_type =
       option_of_yojson (value_for_key db_instance_type_of_yojson "dbInstanceType") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpoint")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_instance_name_of_yojson "name" _list path;
     id = value_for_key db_instance_id_of_yojson "id" _list path;
   }
    : update_db_instance_output)

let db_instance_identifier_of_yojson = string_of_yojson

let update_db_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maintenance_schedule =
       option_of_yojson
         (value_for_key maintenance_schedule_of_yojson "maintenanceSchedule")
         _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     deployment_type =
       option_of_yojson (value_for_key deployment_type_of_yojson "deploymentType") _list path;
     db_instance_type =
       option_of_yojson (value_for_key db_instance_type_of_yojson "dbInstanceType") _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     db_parameter_group_identifier =
       option_of_yojson
         (value_for_key db_parameter_group_identifier_of_yojson "dbParameterGroupIdentifier")
         _list path;
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_of_yojson "logDeliveryConfiguration")
         _list path;
     identifier = value_for_key db_instance_identifier_of_yojson "identifier" _list path;
   }
    : update_db_instance_input)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retryAfterSeconds")
         _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : access_denied_exception)

let cluster_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PARTIALLY_AVAILABLE" -> PARTIALLY_AVAILABLE
    | `String "REBOOT_FAILED" -> REBOOT_FAILED
    | `String "REBOOTING" -> REBOOTING
    | `String "UPDATING_INSTANCE_TYPE" -> UPDATING_INSTANCE_TYPE
    | `String "MAINTENANCE" -> MAINTENANCE
    | `String "DELETED" -> DELETED
    | `String "FAILED" -> FAILED
    | `String "AVAILABLE" -> AVAILABLE
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClusterStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterStatus")
     : cluster_status)
    : cluster_status)

let update_db_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_cluster_status =
       option_of_yojson (value_for_key cluster_status_of_yojson "dbClusterStatus") _list path;
   }
    : update_db_cluster_output)

let failover_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_FAILOVER" -> NO_FAILOVER
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "FailoverMode" value)
    | _ -> raise (deserialize_wrong_type_error path "FailoverMode")
     : failover_mode)
    : failover_mode)

let update_db_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maintenance_schedule =
       option_of_yojson
         (value_for_key maintenance_schedule_of_yojson "maintenanceSchedule")
         _list path;
     failover_mode =
       option_of_yojson (value_for_key failover_mode_of_yojson "failoverMode") _list path;
     db_instance_type =
       option_of_yojson (value_for_key db_instance_type_of_yojson "dbInstanceType") _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     db_parameter_group_identifier =
       option_of_yojson
         (value_for_key db_parameter_group_identifier_of_yojson "dbParameterGroupIdentifier")
         _list path;
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_of_yojson "logDeliveryConfiguration")
         _list path;
     db_cluster_id = value_for_key db_cluster_id_of_yojson "dbClusterId" _list path;
   }
    : update_db_cluster_input)

let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_keys_of_yojson "tagKeys" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : untag_resource_request)

let tracing_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "disabled" -> DISABLED
    | `String "jaeger" -> JAEGER
    | `String "log" -> LOG
    | `String value -> raise (deserialize_unknown_enum_value_error path "TracingType" value)
    | _ -> raise (deserialize_wrong_type_error path "TracingType")
     : tracing_type)
    : tracing_type)

let tag_value_of_yojson = string_of_yojson

let request_tag_map_of_yojson tree path =
  map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key request_tag_map_of_yojson "tags" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : tag_resource_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : service_quota_exceeded_exception)

let response_tag_map_of_yojson tree path =
  map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let reboot_db_instance_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "nextMaintenanceTime")
         _list path;
     last_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "lastMaintenanceTime")
         _list path;
     maintenance_schedule =
       option_of_yojson
         (value_for_key maintenance_schedule_of_yojson "maintenanceSchedule")
         _list path;
     instance_modes =
       option_of_yojson (value_for_key instance_mode_list_of_yojson "instanceModes") _list path;
     instance_mode =
       option_of_yojson (value_for_key instance_mode_of_yojson "instanceMode") _list path;
     db_cluster_id =
       option_of_yojson (value_for_key db_cluster_id_of_yojson "dbClusterId") _list path;
     influx_auth_parameters_secret_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "influxAuthParametersSecretArn")
         _list path;
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_of_yojson "logDeliveryConfiguration")
         _list path;
     secondary_availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "secondaryAvailabilityZone")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     db_parameter_group_identifier =
       option_of_yojson
         (value_for_key db_parameter_group_identifier_of_yojson "dbParameterGroupIdentifier")
         _list path;
     vpc_security_group_ids =
       option_of_yojson
         (value_for_key vpc_security_group_id_list_of_yojson "vpcSecurityGroupIds")
         _list path;
     publicly_accessible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "publiclyAccessible")
         _list path;
     vpc_subnet_ids = value_for_key vpc_subnet_id_list_of_yojson "vpcSubnetIds" _list path;
     deployment_type =
       option_of_yojson (value_for_key deployment_type_of_yojson "deploymentType") _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     db_instance_type =
       option_of_yojson (value_for_key db_instance_type_of_yojson "dbInstanceType") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpoint")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_instance_name_of_yojson "name" _list path;
     id = value_for_key db_instance_id_of_yojson "id" _list path;
   }
    : reboot_db_instance_output)

let reboot_db_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key db_instance_identifier_of_yojson "identifier" _list path }
    : reboot_db_instance_input)

let reboot_db_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_cluster_status =
       option_of_yojson (value_for_key cluster_status_of_yojson "dbClusterStatus") _list path;
   }
    : reboot_db_cluster_output)

let db_instance_id_list_of_yojson tree path = list_of_yojson db_instance_id_of_yojson tree path

let reboot_db_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_ids =
       option_of_yojson (value_for_key db_instance_id_list_of_yojson "instanceIds") _list path;
     db_cluster_id = value_for_key db_cluster_id_of_yojson "dbClusterId" _list path;
   }
    : reboot_db_cluster_input)

let percent_or_absolute_long_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "absolute" -> Absolute (Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson value_ path)
   | "percent" -> Percent (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "PercentOrAbsoluteLong" unknown)
    : percent_or_absolute_long)

let password_of_yojson = string_of_yojson

let log_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "error" -> ERROR
    | `String "info" -> INFO
    | `String "debug" -> DEBUG
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "LogLevel")
     : log_level)
    : log_level)

let duration_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "days" -> DAYS
    | `String "milliseconds" -> MILLISECONDS
    | `String "seconds" -> SECONDS
    | `String "minutes" -> MINUTES
    | `String "hours" -> HOURS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DurationType" value)
    | _ -> raise (deserialize_wrong_type_error path "DurationType")
     : duration_type)
    : duration_type)

let duration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "value" _list path;
     duration_type = value_for_key duration_type_of_yojson "durationType" _list path;
   }
    : duration)

let influx_d_bv2_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ui_disabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "uiDisabled")
         _list path;
     storage_wal_max_write_delay =
       option_of_yojson (value_for_key duration_of_yojson "storageWalMaxWriteDelay") _list path;
     storage_wal_max_concurrent_writes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "storageWalMaxConcurrentWrites")
         _list path;
     storage_series_id_set_cache_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "storageSeriesIdSetCacheSize")
         _list path;
     storage_series_file_max_concurrent_snapshot_compactions =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "storageSeriesFileMaxConcurrentSnapshotCompactions")
         _list path;
     storage_retention_check_interval =
       option_of_yojson
         (value_for_key duration_of_yojson "storageRetentionCheckInterval")
         _list path;
     storage_no_validate_field_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "storageNoValidateFieldSize")
         _list path;
     storage_max_index_log_file_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "storageMaxIndexLogFileSize")
         _list path;
     storage_max_concurrent_compactions =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "storageMaxConcurrentCompactions")
         _list path;
     storage_compact_throughput_burst =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "storageCompactThroughputBurst")
         _list path;
     storage_compact_full_write_cold_duration =
       option_of_yojson
         (value_for_key duration_of_yojson "storageCompactFullWriteColdDuration")
         _list path;
     storage_cache_snapshot_write_cold_duration =
       option_of_yojson
         (value_for_key duration_of_yojson "storageCacheSnapshotWriteColdDuration")
         _list path;
     storage_cache_snapshot_memory_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "storageCacheSnapshotMemorySize")
         _list path;
     storage_cache_max_memory_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "storageCacheMaxMemorySize")
         _list path;
     session_renew_disabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "sessionRenewDisabled")
         _list path;
     session_length =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "sessionLength")
         _list path;
     query_memory_bytes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "queryMemoryBytes")
         _list path;
     query_max_memory_bytes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "queryMaxMemoryBytes")
         _list path;
     query_initial_memory_bytes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "queryInitialMemoryBytes")
         _list path;
     pprof_disabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "pprofDisabled")
         _list path;
     influxql_max_select_series =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "influxqlMaxSelectSeries")
         _list path;
     influxql_max_select_point =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "influxqlMaxSelectPoint")
         _list path;
     influxql_max_select_buckets =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "influxqlMaxSelectBuckets")
         _list path;
     http_write_timeout =
       option_of_yojson (value_for_key duration_of_yojson "httpWriteTimeout") _list path;
     http_read_timeout =
       option_of_yojson (value_for_key duration_of_yojson "httpReadTimeout") _list path;
     http_read_header_timeout =
       option_of_yojson (value_for_key duration_of_yojson "httpReadHeaderTimeout") _list path;
     http_idle_timeout =
       option_of_yojson (value_for_key duration_of_yojson "httpIdleTimeout") _list path;
     metrics_disabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "metricsDisabled")
         _list path;
     tracing_type = option_of_yojson (value_for_key tracing_type_of_yojson "tracingType") _list path;
     query_queue_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "queryQueueSize")
         _list path;
     query_concurrency =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "queryConcurrency")
         _list path;
     no_tasks =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "noTasks")
         _list path;
     log_level = option_of_yojson (value_for_key log_level_of_yojson "logLevel") _list path;
     flux_log_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "fluxLogEnabled")
         _list path;
   }
    : influx_d_bv2_parameters)

let log_formats_of_yojson (tree : t) path =
  ((match tree with
    | `String "full" -> FULL
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogFormats" value)
    | _ -> raise (deserialize_wrong_type_error path "LogFormats")
     : log_formats)
    : log_formats)

let data_fusion_runtime_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "multi-thread-alt" -> MULTI_THREAD_ALT
    | `String "multi-thread" -> MULTI_THREAD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataFusionRuntimeType" value)
    | _ -> raise (deserialize_wrong_type_error path "DataFusionRuntimeType")
     : data_fusion_runtime_type)
    : data_fusion_runtime_type)

let influx_d_bv3_core_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hard_delete_default_duration =
       option_of_yojson (value_for_key duration_of_yojson "hardDeleteDefaultDuration") _list path;
     delete_grace_period =
       option_of_yojson (value_for_key duration_of_yojson "deleteGracePeriod") _list path;
     retention_check_interval =
       option_of_yojson (value_for_key duration_of_yojson "retentionCheckInterval") _list path;
     gen1_lookback_duration =
       option_of_yojson (value_for_key duration_of_yojson "gen1LookbackDuration") _list path;
     table_index_cache_concurrency_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "tableIndexCacheConcurrencyLimit")
         _list path;
     table_index_cache_max_entries =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "tableIndexCacheMaxEntries")
         _list path;
     wal_replay_concurrency_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "walReplayConcurrencyLimit")
         _list path;
     wal_replay_fail_on_error =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "walReplayFailOnError")
         _list path;
     parquet_mem_cache_size =
       option_of_yojson
         (value_for_key percent_or_absolute_long_of_yojson "parquetMemCacheSize")
         _list path;
     exec_mem_pool_bytes =
       option_of_yojson
         (value_for_key percent_or_absolute_long_of_yojson "execMemPoolBytes")
         _list path;
     gen1_duration = option_of_yojson (value_for_key duration_of_yojson "gen1Duration") _list path;
     distinct_cache_eviction_interval =
       option_of_yojson
         (value_for_key duration_of_yojson "distinctCacheEvictionInterval")
         _list path;
     last_cache_eviction_interval =
       option_of_yojson (value_for_key duration_of_yojson "lastCacheEvictionInterval") _list path;
     parquet_mem_cache_query_path_duration =
       option_of_yojson
         (value_for_key duration_of_yojson "parquetMemCacheQueryPathDuration")
         _list path;
     disable_parquet_mem_cache =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "disableParquetMemCache")
         _list path;
     parquet_mem_cache_prune_interval =
       option_of_yojson (value_for_key duration_of_yojson "parquetMemCachePruneInterval") _list path;
     parquet_mem_cache_prune_percentage =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
            "parquetMemCachePrunePercentage")
         _list path;
     preemptive_cache_age =
       option_of_yojson (value_for_key duration_of_yojson "preemptiveCacheAge") _list path;
     snapshotted_wal_files_to_keep =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "snapshottedWalFilesToKeep")
         _list path;
     wal_max_write_buffer_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "walMaxWriteBufferSize")
         _list path;
     wal_snapshot_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "walSnapshotSize")
         _list path;
     force_snapshot_mem_threshold =
       option_of_yojson
         (value_for_key percent_or_absolute_long_of_yojson "forceSnapshotMemThreshold")
         _list path;
     max_http_request_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "maxHttpRequestSize")
         _list path;
     data_fusion_config =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dataFusionConfig")
         _list path;
     data_fusion_use_cached_parquet_loader =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "dataFusionUseCachedParquetLoader")
         _list path;
     data_fusion_max_parquet_fanout =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionMaxParquetFanout")
         _list path;
     data_fusion_runtime_thread_priority =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionRuntimeThreadPriority")
         _list path;
     data_fusion_runtime_thread_keep_alive =
       option_of_yojson
         (value_for_key duration_of_yojson "dataFusionRuntimeThreadKeepAlive")
         _list path;
     data_fusion_runtime_max_io_events_per_tick =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionRuntimeMaxIoEventsPerTick")
         _list path;
     data_fusion_runtime_max_blocking_threads =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionRuntimeMaxBlockingThreads")
         _list path;
     data_fusion_runtime_global_queue_interval =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionRuntimeGlobalQueueInterval")
         _list path;
     data_fusion_runtime_event_interval =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionRuntimeEventInterval")
         _list path;
     data_fusion_runtime_disable_lifo_slot =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "dataFusionRuntimeDisableLifoSlot")
         _list path;
     data_fusion_runtime_type =
       option_of_yojson
         (value_for_key data_fusion_runtime_type_of_yojson "dataFusionRuntimeType")
         _list path;
     data_fusion_num_threads =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionNumThreads")
         _list path;
     log_format = option_of_yojson (value_for_key log_formats_of_yojson "logFormat") _list path;
     log_filter =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "logFilter")
         _list path;
     query_log_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "queryLogSize")
         _list path;
     query_file_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "queryFileLimit")
         _list path;
   }
    : influx_d_bv3_core_parameters)

let influx_d_bv3_enterprise_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_sync_interval =
       option_of_yojson (value_for_key duration_of_yojson "catalogSyncInterval") _list path;
     replication_interval =
       option_of_yojson (value_for_key duration_of_yojson "replicationInterval") _list path;
     distinct_value_cache_disable_from_history =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "distinctValueCacheDisableFromHistory")
         _list path;
     last_value_cache_disable_from_history =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "lastValueCacheDisableFromHistory")
         _list path;
     compaction_check_interval =
       option_of_yojson (value_for_key duration_of_yojson "compactionCheckInterval") _list path;
     compaction_cleanup_wait =
       option_of_yojson (value_for_key duration_of_yojson "compactionCleanupWait") _list path;
     compaction_multipliers =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "compactionMultipliers")
         _list path;
     compaction_gen2_duration =
       option_of_yojson (value_for_key duration_of_yojson "compactionGen2Duration") _list path;
     compaction_max_num_files_per_plan =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "compactionMaxNumFilesPerPlan")
         _list path;
     compaction_row_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "compactionRowLimit")
         _list path;
     dedicated_compactor =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "dedicatedCompactor"
         _list path;
     query_only_instances =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "queryOnlyInstances"
         _list path;
     ingest_query_instances =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "ingestQueryInstances" _list path;
     hard_delete_default_duration =
       option_of_yojson (value_for_key duration_of_yojson "hardDeleteDefaultDuration") _list path;
     delete_grace_period =
       option_of_yojson (value_for_key duration_of_yojson "deleteGracePeriod") _list path;
     retention_check_interval =
       option_of_yojson (value_for_key duration_of_yojson "retentionCheckInterval") _list path;
     gen1_lookback_duration =
       option_of_yojson (value_for_key duration_of_yojson "gen1LookbackDuration") _list path;
     table_index_cache_concurrency_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "tableIndexCacheConcurrencyLimit")
         _list path;
     table_index_cache_max_entries =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "tableIndexCacheMaxEntries")
         _list path;
     wal_replay_concurrency_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "walReplayConcurrencyLimit")
         _list path;
     wal_replay_fail_on_error =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "walReplayFailOnError")
         _list path;
     parquet_mem_cache_size =
       option_of_yojson
         (value_for_key percent_or_absolute_long_of_yojson "parquetMemCacheSize")
         _list path;
     exec_mem_pool_bytes =
       option_of_yojson
         (value_for_key percent_or_absolute_long_of_yojson "execMemPoolBytes")
         _list path;
     gen1_duration = option_of_yojson (value_for_key duration_of_yojson "gen1Duration") _list path;
     distinct_cache_eviction_interval =
       option_of_yojson
         (value_for_key duration_of_yojson "distinctCacheEvictionInterval")
         _list path;
     last_cache_eviction_interval =
       option_of_yojson (value_for_key duration_of_yojson "lastCacheEvictionInterval") _list path;
     parquet_mem_cache_query_path_duration =
       option_of_yojson
         (value_for_key duration_of_yojson "parquetMemCacheQueryPathDuration")
         _list path;
     disable_parquet_mem_cache =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "disableParquetMemCache")
         _list path;
     parquet_mem_cache_prune_interval =
       option_of_yojson (value_for_key duration_of_yojson "parquetMemCachePruneInterval") _list path;
     parquet_mem_cache_prune_percentage =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
            "parquetMemCachePrunePercentage")
         _list path;
     preemptive_cache_age =
       option_of_yojson (value_for_key duration_of_yojson "preemptiveCacheAge") _list path;
     snapshotted_wal_files_to_keep =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "snapshottedWalFilesToKeep")
         _list path;
     wal_max_write_buffer_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "walMaxWriteBufferSize")
         _list path;
     wal_snapshot_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "walSnapshotSize")
         _list path;
     force_snapshot_mem_threshold =
       option_of_yojson
         (value_for_key percent_or_absolute_long_of_yojson "forceSnapshotMemThreshold")
         _list path;
     max_http_request_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "maxHttpRequestSize")
         _list path;
     data_fusion_config =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dataFusionConfig")
         _list path;
     data_fusion_use_cached_parquet_loader =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "dataFusionUseCachedParquetLoader")
         _list path;
     data_fusion_max_parquet_fanout =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionMaxParquetFanout")
         _list path;
     data_fusion_runtime_thread_priority =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionRuntimeThreadPriority")
         _list path;
     data_fusion_runtime_thread_keep_alive =
       option_of_yojson
         (value_for_key duration_of_yojson "dataFusionRuntimeThreadKeepAlive")
         _list path;
     data_fusion_runtime_max_io_events_per_tick =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionRuntimeMaxIoEventsPerTick")
         _list path;
     data_fusion_runtime_max_blocking_threads =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionRuntimeMaxBlockingThreads")
         _list path;
     data_fusion_runtime_global_queue_interval =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionRuntimeGlobalQueueInterval")
         _list path;
     data_fusion_runtime_event_interval =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionRuntimeEventInterval")
         _list path;
     data_fusion_runtime_disable_lifo_slot =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "dataFusionRuntimeDisableLifoSlot")
         _list path;
     data_fusion_runtime_type =
       option_of_yojson
         (value_for_key data_fusion_runtime_type_of_yojson "dataFusionRuntimeType")
         _list path;
     data_fusion_num_threads =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataFusionNumThreads")
         _list path;
     log_format = option_of_yojson (value_for_key log_formats_of_yojson "logFormat") _list path;
     log_filter =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "logFilter")
         _list path;
     query_log_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "queryLogSize")
         _list path;
     query_file_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "queryFileLimit")
         _list path;
   }
    : influx_d_bv3_enterprise_parameters)

let parameters_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "InfluxDBv3Enterprise" ->
       InfluxDBv3Enterprise (influx_d_bv3_enterprise_parameters_of_yojson value_ path)
   | "InfluxDBv3Core" -> InfluxDBv3Core (influx_d_bv3_core_parameters_of_yojson value_ path)
   | "InfluxDBv2" -> InfluxDBv2 (influx_d_bv2_parameters_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Parameters" unknown)
    : parameters)

let organization_of_yojson = string_of_yojson
let next_token_of_yojson = string_of_yojson
let max_results_of_yojson = int_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key response_tag_map_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let db_parameter_group_id_of_yojson = string_of_yojson
let db_parameter_group_name_of_yojson = string_of_yojson

let db_parameter_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_parameter_group_name_of_yojson "name" _list path;
     id = value_for_key db_parameter_group_id_of_yojson "id" _list path;
   }
    : db_parameter_group_summary)

let db_parameter_group_summary_list_of_yojson tree path =
  list_of_yojson db_parameter_group_summary_of_yojson tree path

let list_db_parameter_groups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     items = value_for_key db_parameter_group_summary_list_of_yojson "items" _list path;
   }
    : list_db_parameter_groups_output)

let list_db_parameter_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_db_parameter_groups_input)

let db_instance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_type =
       option_of_yojson (value_for_key deployment_type_of_yojson "deploymentType") _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     db_instance_type =
       option_of_yojson (value_for_key db_instance_type_of_yojson "dbInstanceType") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpoint")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_instance_name_of_yojson "name" _list path;
     id = value_for_key db_instance_id_of_yojson "id" _list path;
   }
    : db_instance_summary)

let db_instance_summary_list_of_yojson tree path =
  list_of_yojson db_instance_summary_of_yojson tree path

let list_db_instances_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     items = value_for_key db_instance_summary_list_of_yojson "items" _list path;
   }
    : list_db_instances_output)

let list_db_instances_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_db_instances_input)

let db_instance_for_cluster_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_modes =
       option_of_yojson (value_for_key instance_mode_list_of_yojson "instanceModes") _list path;
     instance_mode =
       option_of_yojson (value_for_key instance_mode_of_yojson "instanceMode") _list path;
     deployment_type =
       option_of_yojson (value_for_key deployment_type_of_yojson "deploymentType") _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     db_instance_type =
       option_of_yojson (value_for_key db_instance_type_of_yojson "dbInstanceType") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpoint")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_instance_name_of_yojson "name" _list path;
     id = value_for_key db_instance_id_of_yojson "id" _list path;
   }
    : db_instance_for_cluster_summary)

let db_instance_for_cluster_summary_list_of_yojson tree path =
  list_of_yojson db_instance_for_cluster_summary_of_yojson tree path

let list_db_instances_for_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     items = value_for_key db_instance_for_cluster_summary_list_of_yojson "items" _list path;
   }
    : list_db_instances_for_cluster_output)

let list_db_instances_for_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     db_cluster_id = value_for_key db_cluster_id_of_yojson "dbClusterId" _list path;
   }
    : list_db_instances_for_cluster_input)

let db_cluster_name_of_yojson = string_of_yojson

let cluster_deployment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MULTI_NODE_READ_REPLICAS" -> MULTI_NODE_READ_REPLICAS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ClusterDeploymentType" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterDeploymentType")
     : cluster_deployment_type)
    : cluster_deployment_type)

let engine_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INFLUXDB_V3_ENTERPRISE" -> INFLUXDB_V3_ENTERPRISE
    | `String "INFLUXDB_V3_CORE" -> INFLUXDB_V3_CORE
    | `String "INFLUXDB_V2" -> INFLUXDB_V2
    | `String value -> raise (deserialize_unknown_enum_value_error path "EngineType" value)
    | _ -> raise (deserialize_wrong_type_error path "EngineType")
     : engine_type)
    : engine_type)

let db_cluster_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engine_type = option_of_yojson (value_for_key engine_type_of_yojson "engineType") _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
     db_instance_type =
       option_of_yojson (value_for_key db_instance_type_of_yojson "dbInstanceType") _list path;
     deployment_type =
       option_of_yojson
         (value_for_key cluster_deployment_type_of_yojson "deploymentType")
         _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     reader_endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "readerEndpoint")
         _list path;
     endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpoint")
         _list path;
     status = option_of_yojson (value_for_key cluster_status_of_yojson "status") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_cluster_name_of_yojson "name" _list path;
     id = value_for_key db_cluster_id_of_yojson "id" _list path;
   }
    : db_cluster_summary)

let db_cluster_summary_list_of_yojson tree path =
  list_of_yojson db_cluster_summary_of_yojson tree path

let list_db_clusters_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     items = value_for_key db_cluster_summary_list_of_yojson "items" _list path;
   }
    : list_db_clusters_output)

let list_db_clusters_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_db_clusters_input)

let get_db_parameter_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameters_of_yojson "parameters") _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_parameter_group_name_of_yojson "name" _list path;
     id = value_for_key db_parameter_group_id_of_yojson "id" _list path;
   }
    : get_db_parameter_group_output)

let get_db_parameter_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key db_parameter_group_identifier_of_yojson "identifier" _list path }
    : get_db_parameter_group_input)

let get_db_instance_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "nextMaintenanceTime")
         _list path;
     last_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "lastMaintenanceTime")
         _list path;
     maintenance_schedule =
       option_of_yojson
         (value_for_key maintenance_schedule_of_yojson "maintenanceSchedule")
         _list path;
     instance_modes =
       option_of_yojson (value_for_key instance_mode_list_of_yojson "instanceModes") _list path;
     instance_mode =
       option_of_yojson (value_for_key instance_mode_of_yojson "instanceMode") _list path;
     db_cluster_id =
       option_of_yojson (value_for_key db_cluster_id_of_yojson "dbClusterId") _list path;
     influx_auth_parameters_secret_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "influxAuthParametersSecretArn")
         _list path;
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_of_yojson "logDeliveryConfiguration")
         _list path;
     secondary_availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "secondaryAvailabilityZone")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     db_parameter_group_identifier =
       option_of_yojson
         (value_for_key db_parameter_group_identifier_of_yojson "dbParameterGroupIdentifier")
         _list path;
     vpc_security_group_ids =
       option_of_yojson
         (value_for_key vpc_security_group_id_list_of_yojson "vpcSecurityGroupIds")
         _list path;
     publicly_accessible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "publiclyAccessible")
         _list path;
     vpc_subnet_ids = value_for_key vpc_subnet_id_list_of_yojson "vpcSubnetIds" _list path;
     deployment_type =
       option_of_yojson (value_for_key deployment_type_of_yojson "deploymentType") _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     db_instance_type =
       option_of_yojson (value_for_key db_instance_type_of_yojson "dbInstanceType") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpoint")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_instance_name_of_yojson "name" _list path;
     id = value_for_key db_instance_id_of_yojson "id" _list path;
   }
    : get_db_instance_output)

let get_db_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key db_instance_identifier_of_yojson "identifier" _list path }
    : get_db_instance_input)

let cluster_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dedicated_compactor =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "dedicatedCompactor")
         _list path;
     query_only_instances =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "queryOnlyInstances")
         _list path;
     ingest_query_instances =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "ingestQueryInstances")
         _list path;
   }
    : cluster_configuration)

let get_db_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_configuration =
       option_of_yojson
         (value_for_key cluster_configuration_of_yojson "clusterConfiguration")
         _list path;
     failover_mode =
       option_of_yojson (value_for_key failover_mode_of_yojson "failoverMode") _list path;
     vpc_security_group_ids =
       option_of_yojson
         (value_for_key vpc_security_group_id_list_of_yojson "vpcSecurityGroupIds")
         _list path;
     vpc_subnet_ids =
       option_of_yojson (value_for_key vpc_subnet_id_list_of_yojson "vpcSubnetIds") _list path;
     influx_auth_parameters_secret_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "influxAuthParametersSecretArn")
         _list path;
     next_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "nextMaintenanceTime")
         _list path;
     last_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "lastMaintenanceTime")
         _list path;
     maintenance_schedule =
       option_of_yojson
         (value_for_key maintenance_schedule_of_yojson "maintenanceSchedule")
         _list path;
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_of_yojson "logDeliveryConfiguration")
         _list path;
     db_parameter_group_identifier =
       option_of_yojson
         (value_for_key db_parameter_group_identifier_of_yojson "dbParameterGroupIdentifier")
         _list path;
     publicly_accessible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "publiclyAccessible")
         _list path;
     engine_type = option_of_yojson (value_for_key engine_type_of_yojson "engineType") _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
     db_instance_type =
       option_of_yojson (value_for_key db_instance_type_of_yojson "dbInstanceType") _list path;
     deployment_type =
       option_of_yojson
         (value_for_key cluster_deployment_type_of_yojson "deploymentType")
         _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     reader_endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "readerEndpoint")
         _list path;
     endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpoint")
         _list path;
     status = option_of_yojson (value_for_key cluster_status_of_yojson "status") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_cluster_name_of_yojson "name" _list path;
     id = value_for_key db_cluster_id_of_yojson "id" _list path;
   }
    : get_db_cluster_output)

let get_db_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ db_cluster_id = value_for_key db_cluster_id_of_yojson "dbClusterId" _list path }
    : get_db_cluster_input)

let delete_db_instance_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "nextMaintenanceTime")
         _list path;
     last_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "lastMaintenanceTime")
         _list path;
     maintenance_schedule =
       option_of_yojson
         (value_for_key maintenance_schedule_of_yojson "maintenanceSchedule")
         _list path;
     instance_modes =
       option_of_yojson (value_for_key instance_mode_list_of_yojson "instanceModes") _list path;
     instance_mode =
       option_of_yojson (value_for_key instance_mode_of_yojson "instanceMode") _list path;
     db_cluster_id =
       option_of_yojson (value_for_key db_cluster_id_of_yojson "dbClusterId") _list path;
     influx_auth_parameters_secret_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "influxAuthParametersSecretArn")
         _list path;
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_of_yojson "logDeliveryConfiguration")
         _list path;
     secondary_availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "secondaryAvailabilityZone")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     db_parameter_group_identifier =
       option_of_yojson
         (value_for_key db_parameter_group_identifier_of_yojson "dbParameterGroupIdentifier")
         _list path;
     vpc_security_group_ids =
       option_of_yojson
         (value_for_key vpc_security_group_id_list_of_yojson "vpcSecurityGroupIds")
         _list path;
     publicly_accessible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "publiclyAccessible")
         _list path;
     vpc_subnet_ids = value_for_key vpc_subnet_id_list_of_yojson "vpcSubnetIds" _list path;
     deployment_type =
       option_of_yojson (value_for_key deployment_type_of_yojson "deploymentType") _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     db_instance_type =
       option_of_yojson (value_for_key db_instance_type_of_yojson "dbInstanceType") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpoint")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_instance_name_of_yojson "name" _list path;
     id = value_for_key db_instance_id_of_yojson "id" _list path;
   }
    : delete_db_instance_output)

let delete_db_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key db_instance_identifier_of_yojson "identifier" _list path }
    : delete_db_instance_input)

let delete_db_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_cluster_status =
       option_of_yojson (value_for_key cluster_status_of_yojson "dbClusterStatus") _list path;
   }
    : delete_db_cluster_output)

let delete_db_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ db_cluster_id = value_for_key db_cluster_id_of_yojson "dbClusterId" _list path }
    : delete_db_cluster_input)

let create_db_parameter_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameters_of_yojson "parameters") _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_parameter_group_name_of_yojson "name" _list path;
     id = value_for_key db_parameter_group_id_of_yojson "id" _list path;
   }
    : create_db_parameter_group_output)

let create_db_parameter_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
     parameters = option_of_yojson (value_for_key parameters_of_yojson "parameters") _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     name = value_for_key db_parameter_group_name_of_yojson "name" _list path;
   }
    : create_db_parameter_group_input)

let create_db_instance_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "nextMaintenanceTime")
         _list path;
     last_maintenance_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "lastMaintenanceTime")
         _list path;
     maintenance_schedule =
       option_of_yojson
         (value_for_key maintenance_schedule_of_yojson "maintenanceSchedule")
         _list path;
     instance_modes =
       option_of_yojson (value_for_key instance_mode_list_of_yojson "instanceModes") _list path;
     instance_mode =
       option_of_yojson (value_for_key instance_mode_of_yojson "instanceMode") _list path;
     db_cluster_id =
       option_of_yojson (value_for_key db_cluster_id_of_yojson "dbClusterId") _list path;
     influx_auth_parameters_secret_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "influxAuthParametersSecretArn")
         _list path;
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_of_yojson "logDeliveryConfiguration")
         _list path;
     secondary_availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "secondaryAvailabilityZone")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     db_parameter_group_identifier =
       option_of_yojson
         (value_for_key db_parameter_group_identifier_of_yojson "dbParameterGroupIdentifier")
         _list path;
     vpc_security_group_ids =
       option_of_yojson
         (value_for_key vpc_security_group_id_list_of_yojson "vpcSecurityGroupIds")
         _list path;
     publicly_accessible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "publiclyAccessible")
         _list path;
     vpc_subnet_ids = value_for_key vpc_subnet_id_list_of_yojson "vpcSubnetIds" _list path;
     deployment_type =
       option_of_yojson (value_for_key deployment_type_of_yojson "deploymentType") _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     db_instance_type =
       option_of_yojson (value_for_key db_instance_type_of_yojson "dbInstanceType") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpoint")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
     name = value_for_key db_instance_name_of_yojson "name" _list path;
     id = value_for_key db_instance_id_of_yojson "id" _list path;
   }
    : create_db_instance_output)

let bucket_of_yojson = string_of_yojson

let create_db_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
     maintenance_schedule =
       option_of_yojson
         (value_for_key maintenance_schedule_of_yojson "maintenanceSchedule")
         _list path;
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_of_yojson "logDeliveryConfiguration")
         _list path;
     deployment_type =
       option_of_yojson (value_for_key deployment_type_of_yojson "deploymentType") _list path;
     db_parameter_group_identifier =
       option_of_yojson
         (value_for_key db_parameter_group_identifier_of_yojson "dbParameterGroupIdentifier")
         _list path;
     allocated_storage = value_for_key allocated_storage_of_yojson "allocatedStorage" _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     publicly_accessible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "publiclyAccessible")
         _list path;
     vpc_security_group_ids =
       value_for_key vpc_security_group_id_list_of_yojson "vpcSecurityGroupIds" _list path;
     vpc_subnet_ids = value_for_key vpc_subnet_id_list_of_yojson "vpcSubnetIds" _list path;
     db_instance_type = value_for_key db_instance_type_of_yojson "dbInstanceType" _list path;
     bucket = option_of_yojson (value_for_key bucket_of_yojson "bucket") _list path;
     organization =
       option_of_yojson (value_for_key organization_of_yojson "organization") _list path;
     password = value_for_key password_of_yojson "password" _list path;
     username = option_of_yojson (value_for_key username_of_yojson "username") _list path;
     name = value_for_key db_instance_name_of_yojson "name" _list path;
   }
    : create_db_instance_input)

let create_db_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_cluster_status =
       option_of_yojson (value_for_key cluster_status_of_yojson "dbClusterStatus") _list path;
     db_cluster_id =
       option_of_yojson (value_for_key db_cluster_id_of_yojson "dbClusterId") _list path;
   }
    : create_db_cluster_output)

let create_db_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
     maintenance_schedule =
       option_of_yojson
         (value_for_key maintenance_schedule_of_yojson "maintenanceSchedule")
         _list path;
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_of_yojson "logDeliveryConfiguration")
         _list path;
     failover_mode =
       option_of_yojson (value_for_key failover_mode_of_yojson "failoverMode") _list path;
     deployment_type =
       option_of_yojson
         (value_for_key cluster_deployment_type_of_yojson "deploymentType")
         _list path;
     vpc_security_group_ids =
       value_for_key vpc_security_group_id_list_of_yojson "vpcSecurityGroupIds" _list path;
     vpc_subnet_ids = value_for_key vpc_subnet_id_list_of_yojson "vpcSubnetIds" _list path;
     publicly_accessible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "publiclyAccessible")
         _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "networkType") _list path;
     allocated_storage =
       option_of_yojson (value_for_key allocated_storage_of_yojson "allocatedStorage") _list path;
     db_storage_type =
       option_of_yojson (value_for_key db_storage_type_of_yojson "dbStorageType") _list path;
     db_instance_type = value_for_key db_instance_type_of_yojson "dbInstanceType" _list path;
     db_parameter_group_identifier =
       option_of_yojson
         (value_for_key db_parameter_group_identifier_of_yojson "dbParameterGroupIdentifier")
         _list path;
     port = option_of_yojson (value_for_key port_of_yojson "port") _list path;
     bucket = option_of_yojson (value_for_key bucket_of_yojson "bucket") _list path;
     organization =
       option_of_yojson (value_for_key organization_of_yojson "organization") _list path;
     password = option_of_yojson (value_for_key password_of_yojson "password") _list path;
     username = option_of_yojson (value_for_key username_of_yojson "username") _list path;
     name = value_for_key db_cluster_name_of_yojson "name" _list path;
   }
    : create_db_cluster_input)
