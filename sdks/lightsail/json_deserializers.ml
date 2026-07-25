open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key string__of_yojson "code") _list path;
     docs = option_of_yojson (value_for_key string__of_yojson "docs") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     tip = option_of_yojson (value_for_key string__of_yojson "tip") _list path;
   }
    : access_denied_exception)

let access_direction_of_yojson (tree : t) path =
  ((match tree with
    | `String "inbound" -> Inbound
    | `String "outbound" -> Outbound
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessDirection" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessDirection")
     : access_direction)
    : access_direction)

let iso_date_of_yojson = timestamp_epoch_seconds_of_yojson

let access_key_last_used_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_used_date = option_of_yojson (value_for_key iso_date_of_yojson "lastUsedDate") _list path;
     region = option_of_yojson (value_for_key string__of_yojson "region") _list path;
     service_name = option_of_yojson (value_for_key string__of_yojson "serviceName") _list path;
   }
    : access_key_last_used)

let status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> Active
    | `String "Inactive" -> Inactive
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "StatusType")
     : status_type)
    : status_type)

let non_empty_string_of_yojson = string_of_yojson
let iam_access_key_id_of_yojson = string_of_yojson

let access_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_key_id =
       option_of_yojson (value_for_key iam_access_key_id_of_yojson "accessKeyId") _list path;
     secret_access_key =
       option_of_yojson (value_for_key non_empty_string_of_yojson "secretAccessKey") _list path;
     status = option_of_yojson (value_for_key status_type_of_yojson "status") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     last_used =
       option_of_yojson (value_for_key access_key_last_used_of_yojson "lastUsed") _list path;
   }
    : access_key)

let access_key_list_of_yojson tree path = list_of_yojson access_key_of_yojson tree path

let resource_receiving_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key non_empty_string_of_yojson "name") _list path;
     resource_type =
       option_of_yojson (value_for_key non_empty_string_of_yojson "resourceType") _list path;
   }
    : resource_receiving_access)

let access_receiver_list_of_yojson tree path =
  list_of_yojson resource_receiving_access_of_yojson tree path

let boolean__of_yojson = bool_of_yojson

let access_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "public" -> Public
    | `String "private" -> Private
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessType")
     : access_type)
    : access_type)

let access_rules_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     get_object = option_of_yojson (value_for_key access_type_of_yojson "getObject") _list path;
     allow_public_overrides =
       option_of_yojson (value_for_key boolean__of_yojson "allowPublicOverrides") _list path;
   }
    : access_rules)

let bpa_status_message_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEFAULTED_FOR_SLR_MISSING" -> DEFAULTED_FOR_SLR_MISSING
    | `String "SYNC_ON_HOLD" -> SYNC_ON_HOLD
    | `String "DEFAULTED_FOR_SLR_MISSING_ON_HOLD" -> DEFAULTED_FOR_SLR_MISSING_ON_HOLD
    | `String "Unknown" -> Unknown
    | `String value -> raise (deserialize_unknown_enum_value_error path "BPAStatusMessage" value)
    | _ -> raise (deserialize_wrong_type_error path "BPAStatusMessage")
     : bpa_status_message)
    : bpa_status_message)

let account_level_bpa_sync_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "InSync" -> InSync
    | `String "Failed" -> Failed
    | `String "NeverSynced" -> NeverSynced
    | `String "Defaulted" -> Defaulted
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccountLevelBpaSyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountLevelBpaSyncStatus")
     : account_level_bpa_sync_status)
    : account_level_bpa_sync_status)

let account_level_bpa_sync_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key account_level_bpa_sync_status_of_yojson "status") _list path;
     last_synced_at = option_of_yojson (value_for_key iso_date_of_yojson "lastSyncedAt") _list path;
     message = option_of_yojson (value_for_key bpa_status_message_of_yojson "message") _list path;
     bpa_impacts_lightsail =
       option_of_yojson (value_for_key boolean__of_yojson "bpaImpactsLightsail") _list path;
   }
    : account_level_bpa_sync)

let account_setup_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key string__of_yojson "code") _list path;
     docs = option_of_yojson (value_for_key string__of_yojson "docs") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     tip = option_of_yojson (value_for_key string__of_yojson "tip") _list path;
   }
    : account_setup_in_progress_exception)

let time_of_day_of_yojson = string_of_yojson

let add_on_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     snapshot_time_of_day =
       option_of_yojson (value_for_key time_of_day_of_yojson "snapshotTimeOfDay") _list path;
     next_snapshot_time_of_day =
       option_of_yojson (value_for_key time_of_day_of_yojson "nextSnapshotTimeOfDay") _list path;
     threshold = option_of_yojson (value_for_key string__of_yojson "threshold") _list path;
     duration = option_of_yojson (value_for_key string__of_yojson "duration") _list path;
   }
    : add_on)

let add_on_list_of_yojson tree path = list_of_yojson add_on_of_yojson tree path

let stop_instance_on_idle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     threshold = option_of_yojson (value_for_key string__of_yojson "threshold") _list path;
     duration = option_of_yojson (value_for_key string__of_yojson "duration") _list path;
   }
    : stop_instance_on_idle_request)

let auto_snapshot_add_on_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_time_of_day =
       option_of_yojson (value_for_key time_of_day_of_yojson "snapshotTimeOfDay") _list path;
   }
    : auto_snapshot_add_on_request)

let add_on_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AutoSnapshot" -> AutoSnapshot
    | `String "StopInstanceOnIdle" -> StopInstanceOnIdle
    | `String value -> raise (deserialize_unknown_enum_value_error path "AddOnType" value)
    | _ -> raise (deserialize_wrong_type_error path "AddOnType")
     : add_on_type)
    : add_on_type)

let add_on_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     add_on_type = value_for_key add_on_type_of_yojson "addOnType" _list path;
     auto_snapshot_add_on_request =
       option_of_yojson
         (value_for_key auto_snapshot_add_on_request_of_yojson "autoSnapshotAddOnRequest")
         _list path;
     stop_instance_on_idle_request =
       option_of_yojson
         (value_for_key stop_instance_on_idle_request_of_yojson "stopInstanceOnIdleRequest")
         _list path;
   }
    : add_on_request)

let add_on_request_list_of_yojson tree path = list_of_yojson add_on_request_of_yojson tree path
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key tag_key_of_yojson "key") _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "value") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let alarm_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "OK" -> OK
    | `String "ALARM" -> ALARM
    | `String "INSUFFICIENT_DATA" -> INSUFFICIENT_DATA
    | `String value -> raise (deserialize_unknown_enum_value_error path "AlarmState" value)
    | _ -> raise (deserialize_wrong_type_error path "AlarmState")
     : alarm_state)
    : alarm_state)

let notification_trigger_list_of_yojson tree path = list_of_yojson alarm_state_of_yojson tree path

let contact_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "Email" -> Email
    | `String "SMS" -> SMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContactProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "ContactProtocol")
     : contact_protocol)
    : contact_protocol)

let contact_protocols_list_of_yojson tree path = list_of_yojson contact_protocol_of_yojson tree path

let metric_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "Seconds" -> Seconds
    | `String "Microseconds" -> Microseconds
    | `String "Milliseconds" -> Milliseconds
    | `String "Bytes" -> Bytes
    | `String "Kilobytes" -> Kilobytes
    | `String "Megabytes" -> Megabytes
    | `String "Gigabytes" -> Gigabytes
    | `String "Terabytes" -> Terabytes
    | `String "Bits" -> Bits
    | `String "Kilobits" -> Kilobits
    | `String "Megabits" -> Megabits
    | `String "Gigabits" -> Gigabits
    | `String "Terabits" -> Terabits
    | `String "Percent" -> Percent
    | `String "Count" -> Count
    | `String "Bytes/Second" -> BytesSecond
    | `String "Kilobytes/Second" -> KilobytesSecond
    | `String "Megabytes/Second" -> MegabytesSecond
    | `String "Gigabytes/Second" -> GigabytesSecond
    | `String "Terabytes/Second" -> TerabytesSecond
    | `String "Bits/Second" -> BitsSecond
    | `String "Kilobits/Second" -> KilobitsSecond
    | `String "Megabits/Second" -> MegabitsSecond
    | `String "Gigabits/Second" -> GigabitsSecond
    | `String "Terabits/Second" -> TerabitsSecond
    | `String "Count/Second" -> CountSecond
    | `String "None" -> None_
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricUnit")
     : metric_unit)
    : metric_unit)

let metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CPUUtilization" -> CPUUtilization
    | `String "NetworkIn" -> NetworkIn
    | `String "NetworkOut" -> NetworkOut
    | `String "StatusCheckFailed" -> StatusCheckFailed
    | `String "StatusCheckFailed_Instance" -> StatusCheckFailed_Instance
    | `String "StatusCheckFailed_System" -> StatusCheckFailed_System
    | `String "ClientTLSNegotiationErrorCount" -> ClientTLSNegotiationErrorCount
    | `String "HealthyHostCount" -> HealthyHostCount
    | `String "UnhealthyHostCount" -> UnhealthyHostCount
    | `String "HTTPCode_LB_4XX_Count" -> HTTPCode_LB_4XX_Count
    | `String "HTTPCode_LB_5XX_Count" -> HTTPCode_LB_5XX_Count
    | `String "HTTPCode_Instance_2XX_Count" -> HTTPCode_Instance_2XX_Count
    | `String "HTTPCode_Instance_3XX_Count" -> HTTPCode_Instance_3XX_Count
    | `String "HTTPCode_Instance_4XX_Count" -> HTTPCode_Instance_4XX_Count
    | `String "HTTPCode_Instance_5XX_Count" -> HTTPCode_Instance_5XX_Count
    | `String "InstanceResponseTime" -> InstanceResponseTime
    | `String "RejectedConnectionCount" -> RejectedConnectionCount
    | `String "RequestCount" -> RequestCount
    | `String "DatabaseConnections" -> DatabaseConnections
    | `String "DiskQueueDepth" -> DiskQueueDepth
    | `String "FreeStorageSpace" -> FreeStorageSpace
    | `String "NetworkReceiveThroughput" -> NetworkReceiveThroughput
    | `String "NetworkTransmitThroughput" -> NetworkTransmitThroughput
    | `String "BurstCapacityTime" -> BurstCapacityTime
    | `String "BurstCapacityPercentage" -> BurstCapacityPercentage
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricName")
     : metric_name)
    : metric_name)

let metric_statistic_of_yojson (tree : t) path =
  ((match tree with
    | `String "Minimum" -> Minimum
    | `String "Maximum" -> Maximum
    | `String "Sum" -> Sum
    | `String "Average" -> Average
    | `String "SampleCount" -> SampleCount
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricStatistic" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricStatistic")
     : metric_statistic)
    : metric_statistic)

let treat_missing_data_of_yojson (tree : t) path =
  ((match tree with
    | `String "breaching" -> Breaching
    | `String "notBreaching" -> NotBreaching
    | `String "ignore" -> Ignore
    | `String "missing" -> Missing
    | `String value -> raise (deserialize_unknown_enum_value_error path "TreatMissingData" value)
    | _ -> raise (deserialize_wrong_type_error path "TreatMissingData")
     : treat_missing_data)
    : treat_missing_data)

let integer_of_yojson = int_of_yojson
let double_of_yojson = double_of_yojson
let metric_period_of_yojson = int_of_yojson

let comparison_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "GreaterThanOrEqualToThreshold" -> GreaterThanOrEqualToThreshold
    | `String "GreaterThanThreshold" -> GreaterThanThreshold
    | `String "LessThanThreshold" -> LessThanThreshold
    | `String "LessThanOrEqualToThreshold" -> LessThanOrEqualToThreshold
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")
     : comparison_operator)
    : comparison_operator)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ContainerService" -> ContainerService
    | `String "Instance" -> Instance
    | `String "StaticIp" -> StaticIp
    | `String "KeyPair" -> KeyPair
    | `String "InstanceSnapshot" -> InstanceSnapshot
    | `String "Domain" -> Domain
    | `String "PeeredVpc" -> PeeredVpc
    | `String "LoadBalancer" -> LoadBalancer
    | `String "LoadBalancerTlsCertificate" -> LoadBalancerTlsCertificate
    | `String "Disk" -> Disk
    | `String "DiskSnapshot" -> DiskSnapshot
    | `String "RelationalDatabase" -> RelationalDatabase
    | `String "RelationalDatabaseSnapshot" -> RelationalDatabaseSnapshot
    | `String "ExportSnapshotRecord" -> ExportSnapshotRecord
    | `String "CloudFormationStackRecord" -> CloudFormationStackRecord
    | `String "Alarm" -> Alarm
    | `String "ContactMethod" -> ContactMethod
    | `String "Distribution" -> Distribution
    | `String "Certificate" -> Certificate
    | `String "Bucket" -> Bucket
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_name_of_yojson = string_of_yojson
let resource_arn_of_yojson = string_of_yojson

let monitored_resource_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
   }
    : monitored_resource_info)

let region_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "us-east-1" -> US_EAST_1
    | `String "us-east-2" -> US_EAST_2
    | `String "us-west-1" -> US_WEST_1
    | `String "us-west-2" -> US_WEST_2
    | `String "eu-west-1" -> EU_WEST_1
    | `String "eu-west-2" -> EU_WEST_2
    | `String "eu-west-3" -> EU_WEST_3
    | `String "eu-central-1" -> EU_CENTRAL_1
    | `String "eu-north-1" -> EU_NORTH_1
    | `String "eu-south-2" -> EU_SOUTH_2
    | `String "ca-central-1" -> CA_CENTRAL_1
    | `String "ap-east-1" -> AP_EAST_1
    | `String "ap-south-1" -> AP_SOUTH_1
    | `String "ap-southeast-1" -> AP_SOUTHEAST_1
    | `String "ap-southeast-2" -> AP_SOUTHEAST_2
    | `String "ap-northeast-1" -> AP_NORTHEAST_1
    | `String "ap-northeast-2" -> AP_NORTHEAST_2
    | `String "ap-southeast-3" -> AP_SOUTHEAST_3
    | `String "ap-southeast-5" -> AP_SOUTHEAST_5
    | `String "sa-east-1" -> SA_EAST_1
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegionName" value)
    | _ -> raise (deserialize_wrong_type_error path "RegionName")
     : region_name)
    : region_name)

let resource_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "availabilityZone") _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "regionName") _list path;
   }
    : resource_location)

let alarm_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     monitored_resource_info =
       option_of_yojson
         (value_for_key monitored_resource_info_of_yojson "monitoredResourceInfo")
         _list path;
     comparison_operator =
       option_of_yojson
         (value_for_key comparison_operator_of_yojson "comparisonOperator")
         _list path;
     evaluation_periods =
       option_of_yojson (value_for_key integer_of_yojson "evaluationPeriods") _list path;
     period = option_of_yojson (value_for_key metric_period_of_yojson "period") _list path;
     threshold = option_of_yojson (value_for_key double_of_yojson "threshold") _list path;
     datapoints_to_alarm =
       option_of_yojson (value_for_key integer_of_yojson "datapointsToAlarm") _list path;
     treat_missing_data =
       option_of_yojson (value_for_key treat_missing_data_of_yojson "treatMissingData") _list path;
     statistic = option_of_yojson (value_for_key metric_statistic_of_yojson "statistic") _list path;
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "metricName") _list path;
     state = option_of_yojson (value_for_key alarm_state_of_yojson "state") _list path;
     unit_ = option_of_yojson (value_for_key metric_unit_of_yojson "unit") _list path;
     contact_protocols =
       option_of_yojson
         (value_for_key contact_protocols_list_of_yojson "contactProtocols")
         _list path;
     notification_triggers =
       option_of_yojson
         (value_for_key notification_trigger_list_of_yojson "notificationTriggers")
         _list path;
     notification_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "notificationEnabled") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : alarm)

let alarms_list_of_yojson tree path = list_of_yojson alarm_of_yojson tree path

let unauthenticated_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key string__of_yojson "code") _list path;
     docs = option_of_yojson (value_for_key string__of_yojson "docs") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     tip = option_of_yojson (value_for_key string__of_yojson "tip") _list path;
   }
    : unauthenticated_exception)

let service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key string__of_yojson "code") _list path;
     docs = option_of_yojson (value_for_key string__of_yojson "docs") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     tip = option_of_yojson (value_for_key string__of_yojson "tip") _list path;
   }
    : service_exception)

let region_setup_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key string__of_yojson "code") _list path;
     docs = option_of_yojson (value_for_key string__of_yojson "docs") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     tip = option_of_yojson (value_for_key string__of_yojson "tip") _list path;
   }
    : region_setup_in_progress_exception)

let operation_failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key string__of_yojson "code") _list path;
     docs = option_of_yojson (value_for_key string__of_yojson "docs") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     tip = option_of_yojson (value_for_key string__of_yojson "tip") _list path;
   }
    : operation_failure_exception)

let not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key string__of_yojson "code") _list path;
     docs = option_of_yojson (value_for_key string__of_yojson "docs") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     tip = option_of_yojson (value_for_key string__of_yojson "tip") _list path;
   }
    : not_found_exception)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key string__of_yojson "code") _list path;
     docs = option_of_yojson (value_for_key string__of_yojson "docs") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     tip = option_of_yojson (value_for_key string__of_yojson "tip") _list path;
   }
    : invalid_input_exception)

let operation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NotStarted" -> NotStarted
    | `String "Started" -> Started
    | `String "Failed" -> Failed
    | `String "Completed" -> Completed
    | `String "Succeeded" -> Succeeded
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationStatus")
     : operation_status)
    : operation_status)

let operation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DeleteKnownHostKeys" -> DeleteKnownHostKeys
    | `String "DeleteInstance" -> DeleteInstance
    | `String "CreateInstance" -> CreateInstance
    | `String "StopInstance" -> StopInstance
    | `String "StartInstance" -> StartInstance
    | `String "RebootInstance" -> RebootInstance
    | `String "OpenInstancePublicPorts" -> OpenInstancePublicPorts
    | `String "PutInstancePublicPorts" -> PutInstancePublicPorts
    | `String "CloseInstancePublicPorts" -> CloseInstancePublicPorts
    | `String "AllocateStaticIp" -> AllocateStaticIp
    | `String "ReleaseStaticIp" -> ReleaseStaticIp
    | `String "AttachStaticIp" -> AttachStaticIp
    | `String "DetachStaticIp" -> DetachStaticIp
    | `String "UpdateDomainEntry" -> UpdateDomainEntry
    | `String "DeleteDomainEntry" -> DeleteDomainEntry
    | `String "CreateDomain" -> CreateDomain
    | `String "DeleteDomain" -> DeleteDomain
    | `String "CreateInstanceSnapshot" -> CreateInstanceSnapshot
    | `String "DeleteInstanceSnapshot" -> DeleteInstanceSnapshot
    | `String "CreateInstancesFromSnapshot" -> CreateInstancesFromSnapshot
    | `String "CreateLoadBalancer" -> CreateLoadBalancer
    | `String "DeleteLoadBalancer" -> DeleteLoadBalancer
    | `String "AttachInstancesToLoadBalancer" -> AttachInstancesToLoadBalancer
    | `String "DetachInstancesFromLoadBalancer" -> DetachInstancesFromLoadBalancer
    | `String "UpdateLoadBalancerAttribute" -> UpdateLoadBalancerAttribute
    | `String "CreateLoadBalancerTlsCertificate" -> CreateLoadBalancerTlsCertificate
    | `String "DeleteLoadBalancerTlsCertificate" -> DeleteLoadBalancerTlsCertificate
    | `String "AttachLoadBalancerTlsCertificate" -> AttachLoadBalancerTlsCertificate
    | `String "CreateDisk" -> CreateDisk
    | `String "DeleteDisk" -> DeleteDisk
    | `String "AttachDisk" -> AttachDisk
    | `String "DetachDisk" -> DetachDisk
    | `String "CreateDiskSnapshot" -> CreateDiskSnapshot
    | `String "DeleteDiskSnapshot" -> DeleteDiskSnapshot
    | `String "CreateDiskFromSnapshot" -> CreateDiskFromSnapshot
    | `String "CreateRelationalDatabase" -> CreateRelationalDatabase
    | `String "UpdateRelationalDatabase" -> UpdateRelationalDatabase
    | `String "DeleteRelationalDatabase" -> DeleteRelationalDatabase
    | `String "CreateRelationalDatabaseFromSnapshot" -> CreateRelationalDatabaseFromSnapshot
    | `String "CreateRelationalDatabaseSnapshot" -> CreateRelationalDatabaseSnapshot
    | `String "DeleteRelationalDatabaseSnapshot" -> DeleteRelationalDatabaseSnapshot
    | `String "UpdateRelationalDatabaseParameters" -> UpdateRelationalDatabaseParameters
    | `String "StartRelationalDatabase" -> StartRelationalDatabase
    | `String "RebootRelationalDatabase" -> RebootRelationalDatabase
    | `String "StopRelationalDatabase" -> StopRelationalDatabase
    | `String "EnableAddOn" -> EnableAddOn
    | `String "DisableAddOn" -> DisableAddOn
    | `String "PutAlarm" -> PutAlarm
    | `String "GetAlarms" -> GetAlarms
    | `String "DeleteAlarm" -> DeleteAlarm
    | `String "TestAlarm" -> TestAlarm
    | `String "CreateContactMethod" -> CreateContactMethod
    | `String "GetContactMethods" -> GetContactMethods
    | `String "SendContactMethodVerification" -> SendContactMethodVerification
    | `String "DeleteContactMethod" -> DeleteContactMethod
    | `String "CreateDistribution" -> CreateDistribution
    | `String "UpdateDistribution" -> UpdateDistribution
    | `String "DeleteDistribution" -> DeleteDistribution
    | `String "ResetDistributionCache" -> ResetDistributionCache
    | `String "AttachCertificateToDistribution" -> AttachCertificateToDistribution
    | `String "DetachCertificateFromDistribution" -> DetachCertificateFromDistribution
    | `String "UpdateDistributionBundle" -> UpdateDistributionBundle
    | `String "SetIpAddressType" -> SetIpAddressType
    | `String "CreateCertificate" -> CreateCertificate
    | `String "DeleteCertificate" -> DeleteCertificate
    | `String "CreateContainerService" -> CreateContainerService
    | `String "UpdateContainerService" -> UpdateContainerService
    | `String "DeleteContainerService" -> DeleteContainerService
    | `String "CreateContainerServiceDeployment" -> CreateContainerServiceDeployment
    | `String "CreateContainerServiceRegistryLogin" -> CreateContainerServiceRegistryLogin
    | `String "RegisterContainerImage" -> RegisterContainerImage
    | `String "DeleteContainerImage" -> DeleteContainerImage
    | `String "CreateBucket" -> CreateBucket
    | `String "DeleteBucket" -> DeleteBucket
    | `String "CreateBucketAccessKey" -> CreateBucketAccessKey
    | `String "DeleteBucketAccessKey" -> DeleteBucketAccessKey
    | `String "UpdateBucketBundle" -> UpdateBucketBundle
    | `String "UpdateBucket" -> UpdateBucket
    | `String "SetResourceAccessForBucket" -> SetResourceAccessForBucket
    | `String "UpdateInstanceMetadataOptions" -> UpdateInstanceMetadataOptions
    | `String "StartGUISession" -> StartGUISession
    | `String "StopGUISession" -> StopGUISession
    | `String "SetupInstanceHttps" -> SetupInstanceHttps
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationType")
     : operation_type)
    : operation_type)

let operation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "resourceName") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     is_terminal = option_of_yojson (value_for_key boolean__of_yojson "isTerminal") _list path;
     operation_details =
       option_of_yojson (value_for_key string__of_yojson "operationDetails") _list path;
     operation_type =
       option_of_yojson (value_for_key operation_type_of_yojson "operationType") _list path;
     status = option_of_yojson (value_for_key operation_status_of_yojson "status") _list path;
     status_changed_at =
       option_of_yojson (value_for_key iso_date_of_yojson "statusChangedAt") _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "errorCode") _list path;
     error_details = option_of_yojson (value_for_key string__of_yojson "errorDetails") _list path;
   }
    : operation)

let operation_list_of_yojson tree path = list_of_yojson operation_of_yojson tree path

let allocate_static_ip_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : allocate_static_ip_result)

let allocate_static_ip_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ static_ip_name = value_for_key resource_name_of_yojson "staticIpName" _list path }
    : allocate_static_ip_request)

let app_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "LfR" -> LfR
    | `String value -> raise (deserialize_unknown_enum_value_error path "AppCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "AppCategory")
     : app_category)
    : app_category)

let app_category_list_of_yojson tree path = list_of_yojson app_category_of_yojson tree path

let attach_certificate_to_distribution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : attach_certificate_to_distribution_result)

let attach_certificate_to_distribution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     distribution_name = value_for_key resource_name_of_yojson "distributionName" _list path;
     certificate_name = value_for_key resource_name_of_yojson "certificateName" _list path;
   }
    : attach_certificate_to_distribution_request)

let attach_disk_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : attach_disk_result)

let attach_disk_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_name = value_for_key resource_name_of_yojson "diskName" _list path;
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
     disk_path = value_for_key non_empty_string_of_yojson "diskPath" _list path;
     auto_mounting = option_of_yojson (value_for_key boolean__of_yojson "autoMounting") _list path;
   }
    : attach_disk_request)

let attach_instances_to_load_balancer_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : attach_instances_to_load_balancer_result)

let resource_name_list_of_yojson tree path = list_of_yojson resource_name_of_yojson tree path

let attach_instances_to_load_balancer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     load_balancer_name = value_for_key resource_name_of_yojson "loadBalancerName" _list path;
     instance_names = value_for_key resource_name_list_of_yojson "instanceNames" _list path;
   }
    : attach_instances_to_load_balancer_request)

let attach_load_balancer_tls_certificate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : attach_load_balancer_tls_certificate_result)

let attach_load_balancer_tls_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     load_balancer_name = value_for_key resource_name_of_yojson "loadBalancerName" _list path;
     certificate_name = value_for_key resource_name_of_yojson "certificateName" _list path;
   }
    : attach_load_balancer_tls_certificate_request)

let attach_static_ip_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : attach_static_ip_result)

let attach_static_ip_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     static_ip_name = value_for_key resource_name_of_yojson "staticIpName" _list path;
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
   }
    : attach_static_ip_request)

let attached_disk_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     path = option_of_yojson (value_for_key string__of_yojson "path") _list path;
     size_in_gb = option_of_yojson (value_for_key integer_of_yojson "sizeInGb") _list path;
   }
    : attached_disk)

let attached_disk_list_of_yojson tree path = list_of_yojson attached_disk_of_yojson tree path

let disk_map_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     original_disk_path =
       option_of_yojson (value_for_key non_empty_string_of_yojson "originalDiskPath") _list path;
     new_disk_name =
       option_of_yojson (value_for_key resource_name_of_yojson "newDiskName") _list path;
   }
    : disk_map)

let disk_map_list_of_yojson tree path = list_of_yojson disk_map_of_yojson tree path

let attached_disk_map_of_yojson tree path =
  map_of_yojson resource_name_of_yojson disk_map_list_of_yojson tree path

let auto_mount_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Failed" -> Failed
    | `String "Pending" -> Pending
    | `String "Mounted" -> Mounted
    | `String "NotMounted" -> NotMounted
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutoMountStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoMountStatus")
     : auto_mount_status)
    : auto_mount_status)

let auto_snapshot_date_of_yojson = string_of_yojson

let auto_snapshot_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Success" -> SUCCESS
    | `String "Failed" -> FAILED
    | `String "InProgress" -> IN_PROGRESS
    | `String "NotFound" -> NOT_FOUND
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutoSnapshotStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoSnapshotStatus")
     : auto_snapshot_status)
    : auto_snapshot_status)

let auto_snapshot_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date = option_of_yojson (value_for_key string__of_yojson "date") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     status = option_of_yojson (value_for_key auto_snapshot_status_of_yojson "status") _list path;
     from_attached_disks =
       option_of_yojson (value_for_key attached_disk_list_of_yojson "fromAttachedDisks") _list path;
   }
    : auto_snapshot_details)

let auto_snapshot_details_list_of_yojson tree path =
  list_of_yojson auto_snapshot_details_of_yojson tree path

let availability_zone_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     zone_name = option_of_yojson (value_for_key non_empty_string_of_yojson "zoneName") _list path;
     state = option_of_yojson (value_for_key non_empty_string_of_yojson "state") _list path;
   }
    : availability_zone)

let availability_zone_list_of_yojson tree path =
  list_of_yojson availability_zone_of_yojson tree path

let base64_of_yojson = string_of_yojson

let behavior_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "dont-cache" -> DontCacheSetting
    | `String "cache" -> CacheSetting
    | `String value -> raise (deserialize_unknown_enum_value_error path "BehaviorEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "BehaviorEnum")
     : behavior_enum)
    : behavior_enum)

let instance_platform_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINUX_UNIX" -> LinuxUnix
    | `String "WINDOWS" -> Windows
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstancePlatform" value)
    | _ -> raise (deserialize_wrong_type_error path "InstancePlatform")
     : instance_platform)
    : instance_platform)

let blueprint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "os" -> Os
    | `String "app" -> App
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlueprintType" value)
    | _ -> raise (deserialize_wrong_type_error path "BlueprintType")
     : blueprint_type)
    : blueprint_type)

let blueprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blueprint_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "blueprintId") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     group = option_of_yojson (value_for_key non_empty_string_of_yojson "group") _list path;
     type_ = option_of_yojson (value_for_key blueprint_type_of_yojson "type") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     is_active = option_of_yojson (value_for_key boolean__of_yojson "isActive") _list path;
     min_power = option_of_yojson (value_for_key integer_of_yojson "minPower") _list path;
     version = option_of_yojson (value_for_key string__of_yojson "version") _list path;
     version_code = option_of_yojson (value_for_key string__of_yojson "versionCode") _list path;
     product_url = option_of_yojson (value_for_key string__of_yojson "productUrl") _list path;
     license_url = option_of_yojson (value_for_key string__of_yojson "licenseUrl") _list path;
     platform = option_of_yojson (value_for_key instance_platform_of_yojson "platform") _list path;
     app_category = option_of_yojson (value_for_key app_category_of_yojson "appCategory") _list path;
   }
    : blueprint)

let blueprint_list_of_yojson tree path = list_of_yojson blueprint_of_yojson tree path
let bucket_cors_expose_headers_of_yojson tree path = list_of_yojson string__of_yojson tree path
let bucket_cors_allowed_headers_of_yojson tree path = list_of_yojson string__of_yojson tree path
let bucket_cors_allowed_origins_of_yojson tree path = list_of_yojson string__of_yojson tree path
let bucket_cors_allowed_method_of_yojson = string_of_yojson

let bucket_cors_allowed_methods_of_yojson tree path =
  list_of_yojson bucket_cors_allowed_method_of_yojson tree path

let bucket_cors_rule_id_of_yojson = string_of_yojson

let bucket_cors_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key bucket_cors_rule_id_of_yojson "id") _list path;
     allowed_methods =
       value_for_key bucket_cors_allowed_methods_of_yojson "allowedMethods" _list path;
     allowed_origins =
       value_for_key bucket_cors_allowed_origins_of_yojson "allowedOrigins" _list path;
     allowed_headers =
       option_of_yojson
         (value_for_key bucket_cors_allowed_headers_of_yojson "allowedHeaders")
         _list path;
     expose_headers =
       option_of_yojson
         (value_for_key bucket_cors_expose_headers_of_yojson "exposeHeaders")
         _list path;
     max_age_seconds = option_of_yojson (value_for_key integer_of_yojson "maxAgeSeconds") _list path;
   }
    : bucket_cors_rule)

let bucket_cors_rules_of_yojson tree path = list_of_yojson bucket_cors_rule_of_yojson tree path

let bucket_cors_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rules = option_of_yojson (value_for_key bucket_cors_rules_of_yojson "rules") _list path }
    : bucket_cors_config)

let bucket_access_log_prefix_of_yojson = string_of_yojson
let bucket_name_of_yojson = string_of_yojson

let bucket_access_log_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = value_for_key boolean__of_yojson "enabled" _list path;
     destination = option_of_yojson (value_for_key bucket_name_of_yojson "destination") _list path;
     prefix =
       option_of_yojson (value_for_key bucket_access_log_prefix_of_yojson "prefix") _list path;
   }
    : bucket_access_log_config)

let bucket_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key non_empty_string_of_yojson "code") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : bucket_state)

let partner_id_list_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let bucket_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson (value_for_key non_empty_string_of_yojson "resourceType") _list path;
     access_rules = option_of_yojson (value_for_key access_rules_of_yojson "accessRules") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     bundle_id = option_of_yojson (value_for_key non_empty_string_of_yojson "bundleId") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     url = option_of_yojson (value_for_key non_empty_string_of_yojson "url") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     name = option_of_yojson (value_for_key bucket_name_of_yojson "name") _list path;
     support_code =
       option_of_yojson (value_for_key non_empty_string_of_yojson "supportCode") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     object_versioning =
       option_of_yojson (value_for_key non_empty_string_of_yojson "objectVersioning") _list path;
     able_to_update_bundle =
       option_of_yojson (value_for_key boolean__of_yojson "ableToUpdateBundle") _list path;
     readonly_access_accounts =
       option_of_yojson
         (value_for_key partner_id_list_of_yojson "readonlyAccessAccounts")
         _list path;
     resources_receiving_access =
       option_of_yojson
         (value_for_key access_receiver_list_of_yojson "resourcesReceivingAccess")
         _list path;
     state = option_of_yojson (value_for_key bucket_state_of_yojson "state") _list path;
     access_log_config =
       option_of_yojson
         (value_for_key bucket_access_log_config_of_yojson "accessLogConfig")
         _list path;
     cors = option_of_yojson (value_for_key bucket_cors_config_of_yojson "cors") _list path;
   }
    : bucket)

let float__of_yojson = float_of_yojson

let bucket_bundle_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bundle_id = option_of_yojson (value_for_key non_empty_string_of_yojson "bundleId") _list path;
     name = option_of_yojson (value_for_key non_empty_string_of_yojson "name") _list path;
     price = option_of_yojson (value_for_key float__of_yojson "price") _list path;
     storage_per_month_in_gb =
       option_of_yojson (value_for_key integer_of_yojson "storagePerMonthInGb") _list path;
     transfer_per_month_in_gb =
       option_of_yojson (value_for_key integer_of_yojson "transferPerMonthInGb") _list path;
     is_active = option_of_yojson (value_for_key boolean__of_yojson "isActive") _list path;
   }
    : bucket_bundle)

let bucket_bundle_list_of_yojson tree path = list_of_yojson bucket_bundle_of_yojson tree path
let bucket_list_of_yojson tree path = list_of_yojson bucket_of_yojson tree path

let bucket_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "BucketSizeBytes" -> BucketSizeBytes
    | `String "NumberOfObjects" -> NumberOfObjects
    | `String value -> raise (deserialize_unknown_enum_value_error path "BucketMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "BucketMetricName")
     : bucket_metric_name)
    : bucket_metric_name)

let instance_platform_list_of_yojson tree path =
  list_of_yojson instance_platform_of_yojson tree path

let bundle_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     price = option_of_yojson (value_for_key float__of_yojson "price") _list path;
     cpu_count = option_of_yojson (value_for_key integer_of_yojson "cpuCount") _list path;
     disk_size_in_gb = option_of_yojson (value_for_key integer_of_yojson "diskSizeInGb") _list path;
     bundle_id = option_of_yojson (value_for_key non_empty_string_of_yojson "bundleId") _list path;
     instance_type = option_of_yojson (value_for_key string__of_yojson "instanceType") _list path;
     is_active = option_of_yojson (value_for_key boolean__of_yojson "isActive") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     power = option_of_yojson (value_for_key integer_of_yojson "power") _list path;
     ram_size_in_gb = option_of_yojson (value_for_key float__of_yojson "ramSizeInGb") _list path;
     transfer_per_month_in_gb =
       option_of_yojson (value_for_key integer_of_yojson "transferPerMonthInGb") _list path;
     supported_platforms =
       option_of_yojson
         (value_for_key instance_platform_list_of_yojson "supportedPlatforms")
         _list path;
     supported_app_categories =
       option_of_yojson
         (value_for_key app_category_list_of_yojson "supportedAppCategories")
         _list path;
     public_ipv4_address_count =
       option_of_yojson (value_for_key integer_of_yojson "publicIpv4AddressCount") _list path;
   }
    : bundle)

let bundle_list_of_yojson tree path = list_of_yojson bundle_of_yojson tree path

let cache_behavior_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ behavior = option_of_yojson (value_for_key behavior_enum_of_yojson "behavior") _list path }
    : cache_behavior)

let cache_behavior_per_path_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     path = option_of_yojson (value_for_key string__of_yojson "path") _list path;
     behavior = option_of_yojson (value_for_key behavior_enum_of_yojson "behavior") _list path;
   }
    : cache_behavior_per_path)

let cache_behavior_list_of_yojson tree path =
  list_of_yojson cache_behavior_per_path_of_yojson tree path

let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let query_string_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     option_ = option_of_yojson (value_for_key boolean__of_yojson "option") _list path;
     query_strings_allow_list =
       option_of_yojson (value_for_key string_list_of_yojson "queryStringsAllowList") _list path;
   }
    : query_string_object)

let header_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "Accept" -> Accept
    | `String "Accept-Charset" -> AcceptCharset
    | `String "Accept-Datetime" -> AcceptDatetime
    | `String "Accept-Encoding" -> AcceptEncoding
    | `String "Accept-Language" -> AcceptLanguage
    | `String "Authorization" -> Authorization
    | `String "CloudFront-Forwarded-Proto" -> CloudFrontForwardedProto
    | `String "CloudFront-Is-Desktop-Viewer" -> CloudFrontIsDesktopViewer
    | `String "CloudFront-Is-Mobile-Viewer" -> CloudFrontIsMobileViewer
    | `String "CloudFront-Is-SmartTV-Viewer" -> CloudFrontIsSmartTVViewer
    | `String "CloudFront-Is-Tablet-Viewer" -> CloudFrontIsTabletViewer
    | `String "CloudFront-Viewer-Country" -> CloudFrontViewerCountry
    | `String "Host" -> Host
    | `String "Origin" -> Origin
    | `String "Referer" -> Referer
    | `String value -> raise (deserialize_unknown_enum_value_error path "HeaderEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "HeaderEnum")
     : header_enum)
    : header_enum)

let header_forward_list_of_yojson tree path = list_of_yojson header_enum_of_yojson tree path

let forward_values_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> None_
    | `String "allow-list" -> AllowList
    | `String "all" -> All
    | `String value -> raise (deserialize_unknown_enum_value_error path "ForwardValues" value)
    | _ -> raise (deserialize_wrong_type_error path "ForwardValues")
     : forward_values)
    : forward_values)

let header_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     option_ = option_of_yojson (value_for_key forward_values_of_yojson "option") _list path;
     headers_allow_list =
       option_of_yojson (value_for_key header_forward_list_of_yojson "headersAllowList") _list path;
   }
    : header_object)

let cookie_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     option_ = option_of_yojson (value_for_key forward_values_of_yojson "option") _list path;
     cookies_allow_list =
       option_of_yojson (value_for_key string_list_of_yojson "cookiesAllowList") _list path;
   }
    : cookie_object)

let long_of_yojson = long_of_yojson

let cache_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_tt_l = option_of_yojson (value_for_key long_of_yojson "defaultTTL") _list path;
     minimum_tt_l = option_of_yojson (value_for_key long_of_yojson "minimumTTL") _list path;
     maximum_tt_l = option_of_yojson (value_for_key long_of_yojson "maximumTTL") _list path;
     allowed_http_methods =
       option_of_yojson (value_for_key non_empty_string_of_yojson "allowedHTTPMethods") _list path;
     cached_http_methods =
       option_of_yojson (value_for_key non_empty_string_of_yojson "cachedHTTPMethods") _list path;
     forwarded_cookies =
       option_of_yojson (value_for_key cookie_object_of_yojson "forwardedCookies") _list path;
     forwarded_headers =
       option_of_yojson (value_for_key header_object_of_yojson "forwardedHeaders") _list path;
     forwarded_query_strings =
       option_of_yojson
         (value_for_key query_string_object_of_yojson "forwardedQueryStrings")
         _list path;
   }
    : cache_settings)

let revocation_reason_of_yojson = string_of_yojson
let renewal_status_reason_of_yojson = string_of_yojson

let renewal_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PendingAutoRenewal" -> PendingAutoRenewal
    | `String "PendingValidation" -> PendingValidation
    | `String "Success" -> Success
    | `String "Failed" -> Failed
    | `String value -> raise (deserialize_unknown_enum_value_error path "RenewalStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RenewalStatus")
     : renewal_status)
    : renewal_status)

let certificate_domain_validation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_VALIDATION" -> PendingValidation
    | `String "FAILED" -> Failed
    | `String "SUCCESS" -> Success
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateDomainValidationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateDomainValidationStatus")
     : certificate_domain_validation_status)
    : certificate_domain_validation_status)

let dns_record_creation_state_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCEEDED" -> Succeeded
    | `String "STARTED" -> Started
    | `String "FAILED" -> Failed
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DnsRecordCreationStateCode" value)
    | _ -> raise (deserialize_wrong_type_error path "DnsRecordCreationStateCode")
     : dns_record_creation_state_code)
    : dns_record_creation_state_code)

let dns_record_creation_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code =
       option_of_yojson (value_for_key dns_record_creation_state_code_of_yojson "code") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : dns_record_creation_state)

let resource_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key string__of_yojson "type") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "value") _list path;
   }
    : resource_record)

let domain_name_of_yojson = string_of_yojson

let domain_validation_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path;
     resource_record =
       option_of_yojson (value_for_key resource_record_of_yojson "resourceRecord") _list path;
     dns_record_creation_state =
       option_of_yojson
         (value_for_key dns_record_creation_state_of_yojson "dnsRecordCreationState")
         _list path;
     validation_status =
       option_of_yojson
         (value_for_key certificate_domain_validation_status_of_yojson "validationStatus")
         _list path;
   }
    : domain_validation_record)

let domain_validation_record_list_of_yojson tree path =
  list_of_yojson domain_validation_record_of_yojson tree path

let renewal_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_validation_records =
       option_of_yojson
         (value_for_key domain_validation_record_list_of_yojson "domainValidationRecords")
         _list path;
     renewal_status =
       option_of_yojson (value_for_key renewal_status_of_yojson "renewalStatus") _list path;
     renewal_status_reason =
       option_of_yojson
         (value_for_key renewal_status_reason_of_yojson "renewalStatusReason")
         _list path;
     updated_at = option_of_yojson (value_for_key iso_date_of_yojson "updatedAt") _list path;
   }
    : renewal_summary)

let eligible_to_renew_of_yojson = string_of_yojson
let issuer_c_a_of_yojson = string_of_yojson
let key_algorithm_of_yojson = string_of_yojson
let in_use_resource_count_of_yojson = int_of_yojson
let request_failure_reason_of_yojson = string_of_yojson

let subject_alternative_name_list_of_yojson tree path =
  list_of_yojson domain_name_of_yojson tree path

let serial_number_of_yojson = string_of_yojson

let certificate_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_VALIDATION" -> PendingValidation
    | `String "ISSUED" -> Issued
    | `String "INACTIVE" -> Inactive
    | `String "EXPIRED" -> Expired
    | `String "VALIDATION_TIMED_OUT" -> ValidationTimedOut
    | `String "REVOKED" -> Revoked
    | `String "FAILED" -> Failed
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateStatus")
     : certificate_status)
    : certificate_status)

let certificate_name_of_yojson = string_of_yojson

let certificate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key certificate_name_of_yojson "name") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path;
     status = option_of_yojson (value_for_key certificate_status_of_yojson "status") _list path;
     serial_number =
       option_of_yojson (value_for_key serial_number_of_yojson "serialNumber") _list path;
     subject_alternative_names =
       option_of_yojson
         (value_for_key subject_alternative_name_list_of_yojson "subjectAlternativeNames")
         _list path;
     domain_validation_records =
       option_of_yojson
         (value_for_key domain_validation_record_list_of_yojson "domainValidationRecords")
         _list path;
     request_failure_reason =
       option_of_yojson
         (value_for_key request_failure_reason_of_yojson "requestFailureReason")
         _list path;
     in_use_resource_count =
       option_of_yojson
         (value_for_key in_use_resource_count_of_yojson "inUseResourceCount")
         _list path;
     key_algorithm =
       option_of_yojson (value_for_key key_algorithm_of_yojson "keyAlgorithm") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     issued_at = option_of_yojson (value_for_key iso_date_of_yojson "issuedAt") _list path;
     issuer_c_a = option_of_yojson (value_for_key issuer_c_a_of_yojson "issuerCA") _list path;
     not_before = option_of_yojson (value_for_key iso_date_of_yojson "notBefore") _list path;
     not_after = option_of_yojson (value_for_key iso_date_of_yojson "notAfter") _list path;
     eligible_to_renew =
       option_of_yojson (value_for_key eligible_to_renew_of_yojson "eligibleToRenew") _list path;
     renewal_summary =
       option_of_yojson (value_for_key renewal_summary_of_yojson "renewalSummary") _list path;
     revoked_at = option_of_yojson (value_for_key iso_date_of_yojson "revokedAt") _list path;
     revocation_reason =
       option_of_yojson (value_for_key revocation_reason_of_yojson "revocationReason") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
   }
    : certificate)

let certificate_provider_of_yojson (tree : t) path =
  ((match tree with
    | `String "LetsEncrypt" -> LetsEncrypt
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateProvider" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateProvider")
     : certificate_provider)
    : certificate_provider)

let certificate_status_list_of_yojson tree path =
  list_of_yojson certificate_status_of_yojson tree path

let certificate_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn =
       option_of_yojson (value_for_key non_empty_string_of_yojson "certificateArn") _list path;
     certificate_name =
       option_of_yojson (value_for_key certificate_name_of_yojson "certificateName") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path;
     certificate_detail =
       option_of_yojson (value_for_key certificate_of_yojson "certificateDetail") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : certificate_summary)

let certificate_summary_list_of_yojson tree path =
  list_of_yojson certificate_summary_of_yojson tree path

let close_instance_public_ports_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : close_instance_public_ports_result)

let network_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "tcp" -> TCP
    | `String "all" -> ALL
    | `String "udp" -> UDP
    | `String "icmp" -> ICMP
    | `String "icmpv6" -> ICMPV6
    | `String value -> raise (deserialize_unknown_enum_value_error path "NetworkProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkProtocol")
     : network_protocol)
    : network_protocol)

let port_of_yojson = int_of_yojson

let port_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_port = option_of_yojson (value_for_key port_of_yojson "fromPort") _list path;
     to_port = option_of_yojson (value_for_key port_of_yojson "toPort") _list path;
     protocol = option_of_yojson (value_for_key network_protocol_of_yojson "protocol") _list path;
     cidrs = option_of_yojson (value_for_key string_list_of_yojson "cidrs") _list path;
     ipv6_cidrs = option_of_yojson (value_for_key string_list_of_yojson "ipv6Cidrs") _list path;
     cidr_list_aliases =
       option_of_yojson (value_for_key string_list_of_yojson "cidrListAliases") _list path;
   }
    : port_info)

let close_instance_public_ports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port_info = value_for_key port_info_of_yojson "portInfo" _list path;
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
   }
    : close_instance_public_ports_request)

let destination_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     service = option_of_yojson (value_for_key non_empty_string_of_yojson "service") _list path;
   }
    : destination_info)

let cloud_formation_stack_record_source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ExportSnapshotRecord" -> ExportSnapshotRecord
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "CloudFormationStackRecordSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "CloudFormationStackRecordSourceType")
     : cloud_formation_stack_record_source_type)
    : cloud_formation_stack_record_source_type)

let cloud_formation_stack_record_source_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson
         (value_for_key cloud_formation_stack_record_source_type_of_yojson "resourceType")
         _list path;
     name = option_of_yojson (value_for_key non_empty_string_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
   }
    : cloud_formation_stack_record_source_info)

let cloud_formation_stack_record_source_info_list_of_yojson tree path =
  list_of_yojson cloud_formation_stack_record_source_info_of_yojson tree path

let record_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "Started" -> Started
    | `String "Succeeded" -> Succeeded
    | `String "Failed" -> Failed
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordState" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordState")
     : record_state)
    : record_state)

let cloud_formation_stack_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     state = option_of_yojson (value_for_key record_state_of_yojson "state") _list path;
     source_info =
       option_of_yojson
         (value_for_key cloud_formation_stack_record_source_info_list_of_yojson "sourceInfo")
         _list path;
     destination_info =
       option_of_yojson (value_for_key destination_info_of_yojson "destinationInfo") _list path;
   }
    : cloud_formation_stack_record)

let cloud_formation_stack_record_list_of_yojson tree path =
  list_of_yojson cloud_formation_stack_record_of_yojson tree path

let contact_method_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PendingVerification" -> PendingVerification
    | `String "Valid" -> Valid
    | `String "Invalid" -> Invalid
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContactMethodStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContactMethodStatus")
     : contact_method_status)
    : contact_method_status)

let contact_method_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contact_endpoint =
       option_of_yojson (value_for_key non_empty_string_of_yojson "contactEndpoint") _list path;
     status = option_of_yojson (value_for_key contact_method_status_of_yojson "status") _list path;
     protocol = option_of_yojson (value_for_key contact_protocol_of_yojson "protocol") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : contact_method)

let contact_method_verification_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "Email" -> Email
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContactMethodVerificationProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "ContactMethodVerificationProtocol")
     : contact_method_verification_protocol)
    : contact_method_verification_protocol)

let contact_methods_list_of_yojson tree path = list_of_yojson contact_method_of_yojson tree path

let container_service_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "HTTP" -> HTTP
    | `String "HTTPS" -> HTTPS
    | `String "TCP" -> TCP
    | `String "UDP" -> UDP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerServiceProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServiceProtocol")
     : container_service_protocol)
    : container_service_protocol)

let port_map_of_yojson tree path =
  map_of_yojson string__of_yojson container_service_protocol_of_yojson tree path

let environment_of_yojson tree path = map_of_yojson string__of_yojson string__of_yojson tree path

let container_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image = option_of_yojson (value_for_key string__of_yojson "image") _list path;
     command = option_of_yojson (value_for_key string_list_of_yojson "command") _list path;
     environment = option_of_yojson (value_for_key environment_of_yojson "environment") _list path;
     ports = option_of_yojson (value_for_key port_map_of_yojson "ports") _list path;
   }
    : container)

let container_image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image = option_of_yojson (value_for_key string__of_yojson "image") _list path;
     digest = option_of_yojson (value_for_key string__of_yojson "digest") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
   }
    : container_image)

let container_image_list_of_yojson tree path = list_of_yojson container_image_of_yojson tree path
let container_label_of_yojson = string_of_yojson
let container_name_of_yojson = string_of_yojson

let container_map_of_yojson tree path =
  map_of_yojson container_name_of_yojson container_of_yojson tree path

let container_service_ecr_image_puller_role_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_active = option_of_yojson (value_for_key boolean__of_yojson "isActive") _list path;
     principal_arn = option_of_yojson (value_for_key string__of_yojson "principalArn") _list path;
   }
    : container_service_ecr_image_puller_role)

let private_registry_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ecr_image_puller_role =
       option_of_yojson
         (value_for_key container_service_ecr_image_puller_role_of_yojson "ecrImagePullerRole")
         _list path;
   }
    : private_registry_access)

let container_service_public_domains_list_of_yojson tree path =
  list_of_yojson string__of_yojson tree path

let container_service_public_domains_of_yojson tree path =
  map_of_yojson string__of_yojson container_service_public_domains_list_of_yojson tree path

let container_service_health_check_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     healthy_threshold =
       option_of_yojson (value_for_key integer_of_yojson "healthyThreshold") _list path;
     unhealthy_threshold =
       option_of_yojson (value_for_key integer_of_yojson "unhealthyThreshold") _list path;
     timeout_seconds =
       option_of_yojson (value_for_key integer_of_yojson "timeoutSeconds") _list path;
     interval_seconds =
       option_of_yojson (value_for_key integer_of_yojson "intervalSeconds") _list path;
     path = option_of_yojson (value_for_key string__of_yojson "path") _list path;
     success_codes = option_of_yojson (value_for_key string__of_yojson "successCodes") _list path;
   }
    : container_service_health_check_config)

let container_service_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name = option_of_yojson (value_for_key string__of_yojson "containerName") _list path;
     container_port = option_of_yojson (value_for_key integer_of_yojson "containerPort") _list path;
     health_check =
       option_of_yojson
         (value_for_key container_service_health_check_config_of_yojson "healthCheck")
         _list path;
   }
    : container_service_endpoint)

let container_service_deployment_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVATING" -> ACTIVATING
    | `String "ACTIVE" -> ACTIVE
    | `String "INACTIVE" -> INACTIVE
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerServiceDeploymentState" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServiceDeploymentState")
     : container_service_deployment_state)
    : container_service_deployment_state)

let container_service_deployment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key integer_of_yojson "version") _list path;
     state =
       option_of_yojson
         (value_for_key container_service_deployment_state_of_yojson "state")
         _list path;
     containers = option_of_yojson (value_for_key container_map_of_yojson "containers") _list path;
     public_endpoint =
       option_of_yojson
         (value_for_key container_service_endpoint_of_yojson "publicEndpoint")
         _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
   }
    : container_service_deployment)

let container_service_scale_of_yojson = int_of_yojson

let container_service_state_detail_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING_SYSTEM_RESOURCES" -> CREATING_SYSTEM_RESOURCES
    | `String "CREATING_NETWORK_INFRASTRUCTURE" -> CREATING_NETWORK_INFRASTRUCTURE
    | `String "PROVISIONING_CERTIFICATE" -> PROVISIONING_CERTIFICATE
    | `String "PROVISIONING_SERVICE" -> PROVISIONING_SERVICE
    | `String "CREATING_DEPLOYMENT" -> CREATING_DEPLOYMENT
    | `String "EVALUATING_HEALTH_CHECK" -> EVALUATING_HEALTH_CHECK
    | `String "ACTIVATING_DEPLOYMENT" -> ACTIVATING_DEPLOYMENT
    | `String "CERTIFICATE_LIMIT_EXCEEDED" -> CERTIFICATE_LIMIT_EXCEEDED
    | `String "UNKNOWN_ERROR" -> UNKNOWN_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerServiceStateDetailCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServiceStateDetailCode")
     : container_service_state_detail_code)
    : container_service_state_detail_code)

let container_service_state_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code =
       option_of_yojson
         (value_for_key container_service_state_detail_code_of_yojson "code")
         _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : container_service_state_detail)

let container_service_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "READY" -> READY
    | `String "RUNNING" -> RUNNING
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "DISABLED" -> DISABLED
    | `String "DEPLOYING" -> DEPLOYING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerServiceState" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServiceState")
     : container_service_state)
    : container_service_state)

let container_service_power_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "nano" -> Nano
    | `String "micro" -> Micro
    | `String "small" -> Small
    | `String "medium" -> Medium
    | `String "large" -> Large
    | `String "xlarge" -> Xlarge
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerServicePowerName" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServicePowerName")
     : container_service_power_name)
    : container_service_power_name)

let container_service_name_of_yojson = string_of_yojson

let container_service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_service_name =
       option_of_yojson
         (value_for_key container_service_name_of_yojson "containerServiceName")
         _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     power =
       option_of_yojson (value_for_key container_service_power_name_of_yojson "power") _list path;
     power_id = option_of_yojson (value_for_key string__of_yojson "powerId") _list path;
     state = option_of_yojson (value_for_key container_service_state_of_yojson "state") _list path;
     state_detail =
       option_of_yojson
         (value_for_key container_service_state_detail_of_yojson "stateDetail")
         _list path;
     scale = option_of_yojson (value_for_key container_service_scale_of_yojson "scale") _list path;
     current_deployment =
       option_of_yojson
         (value_for_key container_service_deployment_of_yojson "currentDeployment")
         _list path;
     next_deployment =
       option_of_yojson
         (value_for_key container_service_deployment_of_yojson "nextDeployment")
         _list path;
     is_disabled = option_of_yojson (value_for_key boolean__of_yojson "isDisabled") _list path;
     principal_arn = option_of_yojson (value_for_key string__of_yojson "principalArn") _list path;
     private_domain_name =
       option_of_yojson (value_for_key string__of_yojson "privateDomainName") _list path;
     public_domain_names =
       option_of_yojson
         (value_for_key container_service_public_domains_of_yojson "publicDomainNames")
         _list path;
     url = option_of_yojson (value_for_key string__of_yojson "url") _list path;
     private_registry_access =
       option_of_yojson
         (value_for_key private_registry_access_of_yojson "privateRegistryAccess")
         _list path;
   }
    : container_service)

let container_service_deployment_list_of_yojson tree path =
  list_of_yojson container_service_deployment_of_yojson tree path

let endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_name = value_for_key string__of_yojson "containerName" _list path;
     container_port = value_for_key integer_of_yojson "containerPort" _list path;
     health_check =
       option_of_yojson
         (value_for_key container_service_health_check_config_of_yojson "healthCheck")
         _list path;
   }
    : endpoint_request)

let container_service_deployment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     containers = option_of_yojson (value_for_key container_map_of_yojson "containers") _list path;
     public_endpoint =
       option_of_yojson (value_for_key endpoint_request_of_yojson "publicEndpoint") _list path;
   }
    : container_service_deployment_request)

let container_service_ecr_image_puller_role_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ is_active = option_of_yojson (value_for_key boolean__of_yojson "isActive") _list path }
    : container_service_ecr_image_puller_role_request)

let container_service_list_of_yojson tree path =
  list_of_yojson container_service_of_yojson tree path

let container_service_log_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : container_service_log_event)

let container_service_log_event_list_of_yojson tree path =
  list_of_yojson container_service_log_event_of_yojson tree path

let container_service_metadata_entry_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let container_service_metadata_entry_list_of_yojson tree path =
  list_of_yojson container_service_metadata_entry_of_yojson tree path

let container_service_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CPUUtilization" -> CPUUtilization
    | `String "MemoryUtilization" -> MemoryUtilization
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerServiceMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServiceMetricName")
     : container_service_metric_name)
    : container_service_metric_name)

let container_service_power_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     power_id = option_of_yojson (value_for_key string__of_yojson "powerId") _list path;
     price = option_of_yojson (value_for_key float__of_yojson "price") _list path;
     cpu_count = option_of_yojson (value_for_key float__of_yojson "cpuCount") _list path;
     ram_size_in_gb = option_of_yojson (value_for_key float__of_yojson "ramSizeInGb") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     is_active = option_of_yojson (value_for_key boolean__of_yojson "isActive") _list path;
   }
    : container_service_power)

let container_service_power_list_of_yojson tree path =
  list_of_yojson container_service_power_of_yojson tree path

let container_service_registry_login_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = option_of_yojson (value_for_key string__of_yojson "username") _list path;
     password = option_of_yojson (value_for_key string__of_yojson "password") _list path;
     expires_at = option_of_yojson (value_for_key iso_date_of_yojson "expiresAt") _list path;
     registry = option_of_yojson (value_for_key string__of_yojson "registry") _list path;
   }
    : container_service_registry_login)

let container_services_list_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_services =
       option_of_yojson
         (value_for_key container_service_list_of_yojson "containerServices")
         _list path;
   }
    : container_services_list_result)

let copy_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : copy_snapshot_result)

let copy_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_snapshot_name =
       option_of_yojson (value_for_key resource_name_of_yojson "sourceSnapshotName") _list path;
     source_resource_name =
       option_of_yojson (value_for_key string__of_yojson "sourceResourceName") _list path;
     restore_date = option_of_yojson (value_for_key string__of_yojson "restoreDate") _list path;
     use_latest_restorable_auto_snapshot =
       option_of_yojson
         (value_for_key boolean__of_yojson "useLatestRestorableAutoSnapshot")
         _list path;
     target_snapshot_name = value_for_key resource_name_of_yojson "targetSnapshotName" _list path;
     source_region = value_for_key region_name_of_yojson "sourceRegion" _list path;
   }
    : copy_snapshot_request)

let time_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start = option_of_yojson (value_for_key iso_date_of_yojson "start") _list path;
     end_ = option_of_yojson (value_for_key iso_date_of_yojson "end") _list path;
   }
    : time_period)

let currency_of_yojson (tree : t) path =
  ((match tree with
    | `String "USD" -> USD
    | `String value -> raise (deserialize_unknown_enum_value_error path "Currency" value)
    | _ -> raise (deserialize_wrong_type_error path "Currency")
     : currency)
    : currency)

let pricing_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "GB" -> GB
    | `String "Hrs" -> Hrs
    | `String "GB-Mo" -> GBMo
    | `String "Bundles" -> Bundles
    | `String "Queries" -> Queries
    | `String value -> raise (deserialize_unknown_enum_value_error path "PricingUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "PricingUnit")
     : pricing_unit)
    : pricing_unit)

let estimate_by_time_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage_cost = option_of_yojson (value_for_key double_of_yojson "usageCost") _list path;
     pricing_unit = option_of_yojson (value_for_key pricing_unit_of_yojson "pricingUnit") _list path;
     unit_ = option_of_yojson (value_for_key double_of_yojson "unit") _list path;
     currency = option_of_yojson (value_for_key currency_of_yojson "currency") _list path;
     time_period = option_of_yojson (value_for_key time_period_of_yojson "timePeriod") _list path;
   }
    : estimate_by_time)

let estimates_by_time_of_yojson tree path = list_of_yojson estimate_by_time_of_yojson tree path

let cost_estimate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage_type = option_of_yojson (value_for_key non_empty_string_of_yojson "usageType") _list path;
     results_by_time =
       option_of_yojson (value_for_key estimates_by_time_of_yojson "resultsByTime") _list path;
   }
    : cost_estimate)

let cost_estimates_of_yojson tree path = list_of_yojson cost_estimate_of_yojson tree path

let create_bucket_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket = option_of_yojson (value_for_key bucket_of_yojson "bucket") _list path;
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_bucket_result)

let create_bucket_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = value_for_key bucket_name_of_yojson "bucketName" _list path;
     bundle_id = value_for_key non_empty_string_of_yojson "bundleId" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     enable_object_versioning =
       option_of_yojson (value_for_key boolean__of_yojson "enableObjectVersioning") _list path;
   }
    : create_bucket_request)

let create_bucket_access_key_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_key = option_of_yojson (value_for_key access_key_of_yojson "accessKey") _list path;
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_bucket_access_key_result)

let create_bucket_access_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ bucket_name = value_for_key bucket_name_of_yojson "bucketName" _list path }
    : create_bucket_access_key_request)

let create_certificate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate =
       option_of_yojson (value_for_key certificate_summary_of_yojson "certificate") _list path;
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_certificate_result)

let create_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_name = value_for_key certificate_name_of_yojson "certificateName" _list path;
     domain_name = value_for_key domain_name_of_yojson "domainName" _list path;
     subject_alternative_names =
       option_of_yojson
         (value_for_key subject_alternative_name_list_of_yojson "subjectAlternativeNames")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_certificate_request)

let create_cloud_formation_stack_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_cloud_formation_stack_result)

let port_info_source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEFAULT" -> Default
    | `String "INSTANCE" -> Instance
    | `String "NONE" -> None_
    | `String "CLOSED" -> Closed
    | `String value -> raise (deserialize_unknown_enum_value_error path "PortInfoSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "PortInfoSourceType")
     : port_info_source_type)
    : port_info_source_type)

let instance_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_name = value_for_key resource_name_of_yojson "sourceName" _list path;
     instance_type = value_for_key non_empty_string_of_yojson "instanceType" _list path;
     port_info_source = value_for_key port_info_source_type_of_yojson "portInfoSource" _list path;
     user_data = option_of_yojson (value_for_key string__of_yojson "userData") _list path;
     availability_zone = value_for_key string__of_yojson "availabilityZone" _list path;
   }
    : instance_entry)

let instance_entry_list_of_yojson tree path = list_of_yojson instance_entry_of_yojson tree path

let create_cloud_formation_stack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instances = value_for_key instance_entry_list_of_yojson "instances" _list path }
    : create_cloud_formation_stack_request)

let create_contact_method_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_contact_method_result)

let string_max256_of_yojson = string_of_yojson

let create_contact_method_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protocol = value_for_key contact_protocol_of_yojson "protocol" _list path;
     contact_endpoint = value_for_key string_max256_of_yojson "contactEndpoint" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_contact_method_request)

let create_container_service_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_service =
       option_of_yojson (value_for_key container_service_of_yojson "containerService") _list path;
   }
    : create_container_service_result)

let private_registry_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ecr_image_puller_role =
       option_of_yojson
         (value_for_key container_service_ecr_image_puller_role_request_of_yojson
            "ecrImagePullerRole")
         _list path;
   }
    : private_registry_access_request)

let create_container_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = value_for_key container_service_name_of_yojson "serviceName" _list path;
     power = value_for_key container_service_power_name_of_yojson "power" _list path;
     scale = value_for_key container_service_scale_of_yojson "scale" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     public_domain_names =
       option_of_yojson
         (value_for_key container_service_public_domains_of_yojson "publicDomainNames")
         _list path;
     deployment =
       option_of_yojson
         (value_for_key container_service_deployment_request_of_yojson "deployment")
         _list path;
     private_registry_access =
       option_of_yojson
         (value_for_key private_registry_access_request_of_yojson "privateRegistryAccess")
         _list path;
   }
    : create_container_service_request)

let create_container_service_deployment_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_service =
       option_of_yojson (value_for_key container_service_of_yojson "containerService") _list path;
   }
    : create_container_service_deployment_result)

let create_container_service_deployment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = value_for_key container_service_name_of_yojson "serviceName" _list path;
     containers = option_of_yojson (value_for_key container_map_of_yojson "containers") _list path;
     public_endpoint =
       option_of_yojson (value_for_key endpoint_request_of_yojson "publicEndpoint") _list path;
   }
    : create_container_service_deployment_request)

let create_container_service_registry_login_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_login =
       option_of_yojson
         (value_for_key container_service_registry_login_of_yojson "registryLogin")
         _list path;
   }
    : create_container_service_registry_login_result)

let create_container_service_registry_login_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_disk_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_disk_result)

let create_disk_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_name = value_for_key resource_name_of_yojson "diskName" _list path;
     availability_zone = value_for_key non_empty_string_of_yojson "availabilityZone" _list path;
     size_in_gb = value_for_key integer_of_yojson "sizeInGb" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     add_ons = option_of_yojson (value_for_key add_on_request_list_of_yojson "addOns") _list path;
   }
    : create_disk_request)

let create_disk_from_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_disk_from_snapshot_result)

let create_disk_from_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_name = value_for_key resource_name_of_yojson "diskName" _list path;
     disk_snapshot_name =
       option_of_yojson (value_for_key resource_name_of_yojson "diskSnapshotName") _list path;
     availability_zone = value_for_key non_empty_string_of_yojson "availabilityZone" _list path;
     size_in_gb = value_for_key integer_of_yojson "sizeInGb" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     add_ons = option_of_yojson (value_for_key add_on_request_list_of_yojson "addOns") _list path;
     source_disk_name =
       option_of_yojson (value_for_key string__of_yojson "sourceDiskName") _list path;
     restore_date = option_of_yojson (value_for_key string__of_yojson "restoreDate") _list path;
     use_latest_restorable_auto_snapshot =
       option_of_yojson
         (value_for_key boolean__of_yojson "useLatestRestorableAutoSnapshot")
         _list path;
   }
    : create_disk_from_snapshot_request)

let create_disk_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_disk_snapshot_result)

let create_disk_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_name = option_of_yojson (value_for_key resource_name_of_yojson "diskName") _list path;
     disk_snapshot_name = value_for_key resource_name_of_yojson "diskSnapshotName" _list path;
     instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "instanceName") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_disk_snapshot_request)

let ip_address_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "dualstack" -> DUALSTACK
    | `String "ipv4" -> IPV4
    | `String "ipv6" -> IPV6
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpAddressType" value)
    | _ -> raise (deserialize_wrong_type_error path "IpAddressType")
     : ip_address_type)
    : ip_address_type)

let origin_ip_address_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "ipv4" -> IPV4
    | `String "ipv6" -> IPV6
    | `String "dualstack" -> DUALSTACK
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OriginIpAddressTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "OriginIpAddressTypeEnum")
     : origin_ip_address_type_enum)
    : origin_ip_address_type_enum)

let origin_protocol_policy_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "http-only" -> HTTPOnly
    | `String "https-only" -> HTTPSOnly
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OriginProtocolPolicyEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "OriginProtocolPolicyEnum")
     : origin_protocol_policy_enum)
    : origin_protocol_policy_enum)

let origin_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "regionName") _list path;
     protocol_policy =
       option_of_yojson
         (value_for_key origin_protocol_policy_enum_of_yojson "protocolPolicy")
         _list path;
     response_timeout =
       option_of_yojson (value_for_key integer_of_yojson "responseTimeout") _list path;
     ip_address_type =
       option_of_yojson
         (value_for_key origin_ip_address_type_enum_of_yojson "ipAddressType")
         _list path;
   }
    : origin)

let lightsail_distribution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     alternative_domain_names =
       option_of_yojson (value_for_key string_list_of_yojson "alternativeDomainNames") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     is_enabled = option_of_yojson (value_for_key boolean__of_yojson "isEnabled") _list path;
     domain_name = option_of_yojson (value_for_key string__of_yojson "domainName") _list path;
     bundle_id = option_of_yojson (value_for_key string__of_yojson "bundleId") _list path;
     certificate_name =
       option_of_yojson (value_for_key resource_name_of_yojson "certificateName") _list path;
     origin = option_of_yojson (value_for_key origin_of_yojson "origin") _list path;
     origin_public_dn_s =
       option_of_yojson (value_for_key string__of_yojson "originPublicDNS") _list path;
     default_cache_behavior =
       option_of_yojson (value_for_key cache_behavior_of_yojson "defaultCacheBehavior") _list path;
     cache_behavior_settings =
       option_of_yojson (value_for_key cache_settings_of_yojson "cacheBehaviorSettings") _list path;
     cache_behaviors =
       option_of_yojson (value_for_key cache_behavior_list_of_yojson "cacheBehaviors") _list path;
     able_to_update_bundle =
       option_of_yojson (value_for_key boolean__of_yojson "ableToUpdateBundle") _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "ipAddressType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     viewer_minimum_tls_protocol_version =
       option_of_yojson
         (value_for_key string__of_yojson "viewerMinimumTlsProtocolVersion")
         _list path;
   }
    : lightsail_distribution)

let create_distribution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     distribution =
       option_of_yojson (value_for_key lightsail_distribution_of_yojson "distribution") _list path;
     operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path;
   }
    : create_distribution_result)

let viewer_minimum_tls_protocol_version_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "TLSv1.1_2016" -> TLSv11_2016
    | `String "TLSv1.2_2018" -> TLSv12_2018
    | `String "TLSv1.2_2019" -> TLSv12_2019
    | `String "TLSv1.2_2021" -> TLSv12_2021
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ViewerMinimumTlsProtocolVersionEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ViewerMinimumTlsProtocolVersionEnum")
     : viewer_minimum_tls_protocol_version_enum)
    : viewer_minimum_tls_protocol_version_enum)

let input_origin_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "regionName") _list path;
     protocol_policy =
       option_of_yojson
         (value_for_key origin_protocol_policy_enum_of_yojson "protocolPolicy")
         _list path;
     response_timeout =
       option_of_yojson (value_for_key integer_of_yojson "responseTimeout") _list path;
     ip_address_type =
       option_of_yojson
         (value_for_key origin_ip_address_type_enum_of_yojson "ipAddressType")
         _list path;
   }
    : input_origin)

let create_distribution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     distribution_name = value_for_key resource_name_of_yojson "distributionName" _list path;
     origin = value_for_key input_origin_of_yojson "origin" _list path;
     default_cache_behavior =
       value_for_key cache_behavior_of_yojson "defaultCacheBehavior" _list path;
     cache_behavior_settings =
       option_of_yojson (value_for_key cache_settings_of_yojson "cacheBehaviorSettings") _list path;
     cache_behaviors =
       option_of_yojson (value_for_key cache_behavior_list_of_yojson "cacheBehaviors") _list path;
     bundle_id = value_for_key string__of_yojson "bundleId" _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "ipAddressType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     certificate_name =
       option_of_yojson (value_for_key resource_name_of_yojson "certificateName") _list path;
     viewer_minimum_tls_protocol_version =
       option_of_yojson
         (value_for_key viewer_minimum_tls_protocol_version_enum_of_yojson
            "viewerMinimumTlsProtocolVersion")
         _list path;
   }
    : create_distribution_request)

let create_domain_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : create_domain_result)

let create_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "domainName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_domain_request)

let create_domain_entry_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : create_domain_entry_result)

let domain_entry_options_keys_of_yojson = string_of_yojson

let domain_entry_options_of_yojson tree path =
  map_of_yojson domain_entry_options_keys_of_yojson string__of_yojson tree path

let domain_entry_type_of_yojson = string_of_yojson

let domain_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "id") _list path;
     name = option_of_yojson (value_for_key domain_name_of_yojson "name") _list path;
     target = option_of_yojson (value_for_key string__of_yojson "target") _list path;
     is_alias = option_of_yojson (value_for_key boolean__of_yojson "isAlias") _list path;
     type_ = option_of_yojson (value_for_key domain_entry_type_of_yojson "type") _list path;
     options = option_of_yojson (value_for_key domain_entry_options_of_yojson "options") _list path;
   }
    : domain_entry)

let create_domain_entry_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "domainName" _list path;
     domain_entry = value_for_key domain_entry_of_yojson "domainEntry" _list path;
   }
    : create_domain_entry_request)

let sensitive_non_empty_string_of_yojson = string_of_yojson

let session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key non_empty_string_of_yojson "name") _list path;
     url = option_of_yojson (value_for_key sensitive_non_empty_string_of_yojson "url") _list path;
     is_primary = option_of_yojson (value_for_key boolean__of_yojson "isPrimary") _list path;
   }
    : session)

let sessions_of_yojson tree path = list_of_yojson session_of_yojson tree path

let status_of_yojson (tree : t) path =
  ((match tree with
    | `String "startExpired" -> StartExpired
    | `String "notStarted" -> NotStarted
    | `String "started" -> Started
    | `String "starting" -> Starting
    | `String "stopped" -> Stopped
    | `String "stopping" -> Stopping
    | `String "settingUpInstance" -> SettingUpInstance
    | `String "failedInstanceCreation" -> FailedInstanceCreation
    | `String "failedStartingGUISession" -> FailedStartingGUISession
    | `String "failedStoppingGUISession" -> FailedStoppingGUISession
    | `String value -> raise (deserialize_unknown_enum_value_error path "Status" value)
    | _ -> raise (deserialize_wrong_type_error path "Status")
     : status)
    : status)

let create_gui_session_access_details_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "resourceName") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     percentage_complete =
       option_of_yojson (value_for_key integer_of_yojson "percentageComplete") _list path;
     failure_reason = option_of_yojson (value_for_key string__of_yojson "failureReason") _list path;
     sessions = option_of_yojson (value_for_key sessions_of_yojson "sessions") _list path;
   }
    : create_gui_session_access_details_result)

let create_gui_session_access_details_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_name = value_for_key resource_name_of_yojson "resourceName" _list path }
    : create_gui_session_access_details_request)

let create_instance_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_instance_snapshot_result)

let create_instance_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_snapshot_name =
       value_for_key resource_name_of_yojson "instanceSnapshotName" _list path;
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_instance_snapshot_request)

let create_instances_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_instances_result)

let create_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_names = value_for_key string_list_of_yojson "instanceNames" _list path;
     availability_zone = value_for_key string__of_yojson "availabilityZone" _list path;
     custom_image_name =
       option_of_yojson (value_for_key resource_name_of_yojson "customImageName") _list path;
     blueprint_id = value_for_key non_empty_string_of_yojson "blueprintId" _list path;
     bundle_id = value_for_key non_empty_string_of_yojson "bundleId" _list path;
     user_data = option_of_yojson (value_for_key string__of_yojson "userData") _list path;
     key_pair_name =
       option_of_yojson (value_for_key resource_name_of_yojson "keyPairName") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     add_ons = option_of_yojson (value_for_key add_on_request_list_of_yojson "addOns") _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "ipAddressType") _list path;
   }
    : create_instances_request)

let create_instances_from_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_instances_from_snapshot_result)

let create_instances_from_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_names = value_for_key string_list_of_yojson "instanceNames" _list path;
     attached_disk_mapping =
       option_of_yojson (value_for_key attached_disk_map_of_yojson "attachedDiskMapping") _list path;
     availability_zone = value_for_key string__of_yojson "availabilityZone" _list path;
     instance_snapshot_name =
       option_of_yojson (value_for_key resource_name_of_yojson "instanceSnapshotName") _list path;
     bundle_id = value_for_key non_empty_string_of_yojson "bundleId" _list path;
     user_data = option_of_yojson (value_for_key string__of_yojson "userData") _list path;
     key_pair_name =
       option_of_yojson (value_for_key resource_name_of_yojson "keyPairName") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     add_ons = option_of_yojson (value_for_key add_on_request_list_of_yojson "addOns") _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "ipAddressType") _list path;
     source_instance_name =
       option_of_yojson (value_for_key string__of_yojson "sourceInstanceName") _list path;
     restore_date = option_of_yojson (value_for_key string__of_yojson "restoreDate") _list path;
     use_latest_restorable_auto_snapshot =
       option_of_yojson
         (value_for_key boolean__of_yojson "useLatestRestorableAutoSnapshot")
         _list path;
   }
    : create_instances_from_snapshot_request)

let key_pair_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     fingerprint = option_of_yojson (value_for_key base64_of_yojson "fingerprint") _list path;
   }
    : key_pair)

let create_key_pair_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_pair = option_of_yojson (value_for_key key_pair_of_yojson "keyPair") _list path;
     public_key_base64 =
       option_of_yojson (value_for_key base64_of_yojson "publicKeyBase64") _list path;
     private_key_base64 =
       option_of_yojson (value_for_key base64_of_yojson "privateKeyBase64") _list path;
     operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path;
   }
    : create_key_pair_result)

let create_key_pair_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_pair_name = value_for_key resource_name_of_yojson "keyPairName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_key_pair_request)

let create_load_balancer_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_load_balancer_result)

let domain_name_list_of_yojson tree path = list_of_yojson domain_name_of_yojson tree path

let create_load_balancer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     load_balancer_name = value_for_key resource_name_of_yojson "loadBalancerName" _list path;
     instance_port = value_for_key port_of_yojson "instancePort" _list path;
     health_check_path =
       option_of_yojson (value_for_key string__of_yojson "healthCheckPath") _list path;
     certificate_name =
       option_of_yojson (value_for_key resource_name_of_yojson "certificateName") _list path;
     certificate_domain_name =
       option_of_yojson (value_for_key domain_name_of_yojson "certificateDomainName") _list path;
     certificate_alternative_names =
       option_of_yojson
         (value_for_key domain_name_list_of_yojson "certificateAlternativeNames")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "ipAddressType") _list path;
     tls_policy_name = option_of_yojson (value_for_key string__of_yojson "tlsPolicyName") _list path;
   }
    : create_load_balancer_request)

let create_load_balancer_tls_certificate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_load_balancer_tls_certificate_result)

let create_load_balancer_tls_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     load_balancer_name = value_for_key resource_name_of_yojson "loadBalancerName" _list path;
     certificate_name = value_for_key resource_name_of_yojson "certificateName" _list path;
     certificate_domain_name =
       value_for_key domain_name_of_yojson "certificateDomainName" _list path;
     certificate_alternative_names =
       option_of_yojson
         (value_for_key domain_name_list_of_yojson "certificateAlternativeNames")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_load_balancer_tls_certificate_request)

let create_relational_database_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_relational_database_result)

let sensitive_string_of_yojson = string_of_yojson

let create_relational_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "availabilityZone") _list path;
     relational_database_blueprint_id =
       value_for_key string__of_yojson "relationalDatabaseBlueprintId" _list path;
     relational_database_bundle_id =
       value_for_key string__of_yojson "relationalDatabaseBundleId" _list path;
     master_database_name = value_for_key string__of_yojson "masterDatabaseName" _list path;
     master_username = value_for_key string__of_yojson "masterUsername" _list path;
     master_user_password =
       option_of_yojson (value_for_key sensitive_string_of_yojson "masterUserPassword") _list path;
     preferred_backup_window =
       option_of_yojson (value_for_key string__of_yojson "preferredBackupWindow") _list path;
     preferred_maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "preferredMaintenanceWindow") _list path;
     publicly_accessible =
       option_of_yojson (value_for_key boolean__of_yojson "publiclyAccessible") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_relational_database_request)

let create_relational_database_from_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_relational_database_from_snapshot_result)

let create_relational_database_from_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "availabilityZone") _list path;
     publicly_accessible =
       option_of_yojson (value_for_key boolean__of_yojson "publiclyAccessible") _list path;
     relational_database_snapshot_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "relationalDatabaseSnapshotName")
         _list path;
     relational_database_bundle_id =
       option_of_yojson (value_for_key string__of_yojson "relationalDatabaseBundleId") _list path;
     source_relational_database_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "sourceRelationalDatabaseName")
         _list path;
     restore_time = option_of_yojson (value_for_key iso_date_of_yojson "restoreTime") _list path;
     use_latest_restorable_time =
       option_of_yojson (value_for_key boolean__of_yojson "useLatestRestorableTime") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_relational_database_from_snapshot_request)

let create_relational_database_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : create_relational_database_snapshot_result)

let create_relational_database_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     relational_database_snapshot_name =
       value_for_key resource_name_of_yojson "relationalDatabaseSnapshotName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_relational_database_snapshot_request)

let delete_alarm_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_alarm_result)

let delete_alarm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alarm_name = value_for_key resource_name_of_yojson "alarmName" _list path }
    : delete_alarm_request)

let delete_auto_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_auto_snapshot_result)

let delete_auto_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = value_for_key resource_name_of_yojson "resourceName" _list path;
     date = value_for_key auto_snapshot_date_of_yojson "date" _list path;
   }
    : delete_auto_snapshot_request)

let delete_bucket_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_bucket_result)

let delete_bucket_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = value_for_key bucket_name_of_yojson "bucketName" _list path;
     force_delete = option_of_yojson (value_for_key boolean__of_yojson "forceDelete") _list path;
   }
    : delete_bucket_request)

let delete_bucket_access_key_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_bucket_access_key_result)

let delete_bucket_access_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = value_for_key bucket_name_of_yojson "bucketName" _list path;
     access_key_id = value_for_key non_empty_string_of_yojson "accessKeyId" _list path;
   }
    : delete_bucket_access_key_request)

let delete_certificate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_certificate_result)

let delete_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_name = value_for_key certificate_name_of_yojson "certificateName" _list path }
    : delete_certificate_request)

let delete_contact_method_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_contact_method_result)

let delete_contact_method_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ protocol = value_for_key contact_protocol_of_yojson "protocol" _list path }
    : delete_contact_method_request)

let delete_container_image_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_container_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = value_for_key container_service_name_of_yojson "serviceName" _list path;
     image = value_for_key string__of_yojson "image" _list path;
   }
    : delete_container_image_request)

let delete_container_service_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_container_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_name = value_for_key container_service_name_of_yojson "serviceName" _list path }
    : delete_container_service_request)

let delete_disk_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_disk_result)

let delete_disk_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_name = value_for_key resource_name_of_yojson "diskName" _list path;
     force_delete_add_ons =
       option_of_yojson (value_for_key boolean__of_yojson "forceDeleteAddOns") _list path;
   }
    : delete_disk_request)

let delete_disk_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_disk_snapshot_result)

let delete_disk_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ disk_snapshot_name = value_for_key resource_name_of_yojson "diskSnapshotName" _list path }
    : delete_disk_snapshot_request)

let delete_distribution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : delete_distribution_result)

let delete_distribution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     distribution_name =
       option_of_yojson (value_for_key resource_name_of_yojson "distributionName") _list path;
   }
    : delete_distribution_request)

let delete_domain_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : delete_domain_result)

let delete_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "domainName" _list path }
    : delete_domain_request)

let delete_domain_entry_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : delete_domain_entry_result)

let delete_domain_entry_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "domainName" _list path;
     domain_entry = value_for_key domain_entry_of_yojson "domainEntry" _list path;
   }
    : delete_domain_entry_request)

let delete_instance_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_instance_result)

let delete_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
     force_delete_add_ons =
       option_of_yojson (value_for_key boolean__of_yojson "forceDeleteAddOns") _list path;
   }
    : delete_instance_request)

let delete_instance_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_instance_snapshot_result)

let delete_instance_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_snapshot_name =
       value_for_key resource_name_of_yojson "instanceSnapshotName" _list path;
   }
    : delete_instance_snapshot_request)

let delete_key_pair_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : delete_key_pair_result)

let delete_key_pair_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_pair_name = value_for_key resource_name_of_yojson "keyPairName" _list path;
     expected_fingerprint =
       option_of_yojson (value_for_key string__of_yojson "expectedFingerprint") _list path;
   }
    : delete_key_pair_request)

let delete_known_host_keys_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_known_host_keys_result)

let delete_known_host_keys_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_name = value_for_key resource_name_of_yojson "instanceName" _list path }
    : delete_known_host_keys_request)

let delete_load_balancer_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_load_balancer_result)

let delete_load_balancer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ load_balancer_name = value_for_key resource_name_of_yojson "loadBalancerName" _list path }
    : delete_load_balancer_request)

let delete_load_balancer_tls_certificate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_load_balancer_tls_certificate_result)

let delete_load_balancer_tls_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     load_balancer_name = value_for_key resource_name_of_yojson "loadBalancerName" _list path;
     certificate_name = value_for_key resource_name_of_yojson "certificateName" _list path;
     force = option_of_yojson (value_for_key boolean__of_yojson "force") _list path;
   }
    : delete_load_balancer_tls_certificate_request)

let delete_relational_database_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_relational_database_result)

let delete_relational_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     skip_final_snapshot =
       option_of_yojson (value_for_key boolean__of_yojson "skipFinalSnapshot") _list path;
     final_relational_database_snapshot_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "finalRelationalDatabaseSnapshotName")
         _list path;
   }
    : delete_relational_database_request)

let delete_relational_database_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : delete_relational_database_snapshot_result)

let delete_relational_database_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_snapshot_name =
       value_for_key resource_name_of_yojson "relationalDatabaseSnapshotName" _list path;
   }
    : delete_relational_database_snapshot_request)

let detach_certificate_from_distribution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : detach_certificate_from_distribution_result)

let detach_certificate_from_distribution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ distribution_name = value_for_key resource_name_of_yojson "distributionName" _list path }
    : detach_certificate_from_distribution_request)

let detach_disk_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : detach_disk_result)

let detach_disk_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ disk_name = value_for_key resource_name_of_yojson "diskName" _list path }
    : detach_disk_request)

let detach_instances_from_load_balancer_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : detach_instances_from_load_balancer_result)

let detach_instances_from_load_balancer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     load_balancer_name = value_for_key resource_name_of_yojson "loadBalancerName" _list path;
     instance_names = value_for_key resource_name_list_of_yojson "instanceNames" _list path;
   }
    : detach_instances_from_load_balancer_request)

let detach_static_ip_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : detach_static_ip_result)

let detach_static_ip_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ static_ip_name = value_for_key resource_name_of_yojson "staticIpName" _list path }
    : detach_static_ip_request)

let disable_add_on_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : disable_add_on_result)

let disable_add_on_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     add_on_type = value_for_key add_on_type_of_yojson "addOnType" _list path;
     resource_name = value_for_key resource_name_of_yojson "resourceName" _list path;
   }
    : disable_add_on_request)

let disk_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "pending" -> Pending
    | `String "error" -> Error_
    | `String "available" -> Available
    | `String "in-use" -> InUse
    | `String "unknown" -> Unknown
    | `String value -> raise (deserialize_unknown_enum_value_error path "DiskState" value)
    | _ -> raise (deserialize_wrong_type_error path "DiskState")
     : disk_state)
    : disk_state)

let disk_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     add_ons = option_of_yojson (value_for_key add_on_list_of_yojson "addOns") _list path;
     size_in_gb = option_of_yojson (value_for_key integer_of_yojson "sizeInGb") _list path;
     is_system_disk = option_of_yojson (value_for_key boolean__of_yojson "isSystemDisk") _list path;
     iops = option_of_yojson (value_for_key integer_of_yojson "iops") _list path;
     path = option_of_yojson (value_for_key string__of_yojson "path") _list path;
     state = option_of_yojson (value_for_key disk_state_of_yojson "state") _list path;
     attached_to = option_of_yojson (value_for_key resource_name_of_yojson "attachedTo") _list path;
     is_attached = option_of_yojson (value_for_key boolean__of_yojson "isAttached") _list path;
     attachment_state =
       option_of_yojson (value_for_key string__of_yojson "attachmentState") _list path;
     gb_in_use = option_of_yojson (value_for_key integer_of_yojson "gbInUse") _list path;
     auto_mount_status =
       option_of_yojson (value_for_key auto_mount_status_of_yojson "autoMountStatus") _list path;
   }
    : disk)

let disk_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     path = option_of_yojson (value_for_key non_empty_string_of_yojson "path") _list path;
     size_in_gb = option_of_yojson (value_for_key integer_of_yojson "sizeInGb") _list path;
     is_system_disk = option_of_yojson (value_for_key boolean__of_yojson "isSystemDisk") _list path;
   }
    : disk_info)

let disk_info_list_of_yojson tree path = list_of_yojson disk_info_of_yojson tree path
let disk_list_of_yojson tree path = list_of_yojson disk_of_yojson tree path

let disk_snapshot_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "pending" -> Pending
    | `String "completed" -> Completed
    | `String "error" -> Error_
    | `String "unknown" -> Unknown
    | `String value -> raise (deserialize_unknown_enum_value_error path "DiskSnapshotState" value)
    | _ -> raise (deserialize_wrong_type_error path "DiskSnapshotState")
     : disk_snapshot_state)
    : disk_snapshot_state)

let disk_snapshot_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     size_in_gb = option_of_yojson (value_for_key integer_of_yojson "sizeInGb") _list path;
     state = option_of_yojson (value_for_key disk_snapshot_state_of_yojson "state") _list path;
     progress = option_of_yojson (value_for_key string__of_yojson "progress") _list path;
     from_disk_name =
       option_of_yojson (value_for_key resource_name_of_yojson "fromDiskName") _list path;
     from_disk_arn =
       option_of_yojson (value_for_key non_empty_string_of_yojson "fromDiskArn") _list path;
     from_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "fromInstanceName") _list path;
     from_instance_arn =
       option_of_yojson (value_for_key non_empty_string_of_yojson "fromInstanceArn") _list path;
     is_from_auto_snapshot =
       option_of_yojson (value_for_key boolean__of_yojson "isFromAutoSnapshot") _list path;
   }
    : disk_snapshot)

let disk_snapshot_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ size_in_gb = option_of_yojson (value_for_key integer_of_yojson "sizeInGb") _list path }
    : disk_snapshot_info)

let disk_snapshot_list_of_yojson tree path = list_of_yojson disk_snapshot_of_yojson tree path

let distribution_bundle_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bundle_id = option_of_yojson (value_for_key string__of_yojson "bundleId") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     price = option_of_yojson (value_for_key float__of_yojson "price") _list path;
     transfer_per_month_in_gb =
       option_of_yojson (value_for_key integer_of_yojson "transferPerMonthInGb") _list path;
     is_active = option_of_yojson (value_for_key boolean__of_yojson "isActive") _list path;
   }
    : distribution_bundle)

let distribution_bundle_list_of_yojson tree path =
  list_of_yojson distribution_bundle_of_yojson tree path

let distribution_list_of_yojson tree path =
  list_of_yojson lightsail_distribution_of_yojson tree path

let distribution_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Requests" -> Requests
    | `String "BytesDownloaded" -> BytesDownloaded
    | `String "BytesUploaded" -> BytesUploaded
    | `String "TotalErrorRate" -> TotalErrorRate
    | `String "Http4xxErrorRate" -> Http4xxErrorRate
    | `String "Http5xxErrorRate" -> Http5xxErrorRate
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DistributionMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "DistributionMetricName")
     : distribution_metric_name)
    : distribution_metric_name)

let r53_hosted_zone_deletion_state_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCEEDED" -> Succeeded
    | `String "PENDING" -> Pending
    | `String "FAILED" -> Failed
    | `String "STARTED" -> Started
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "R53HostedZoneDeletionStateCode" value)
    | _ -> raise (deserialize_wrong_type_error path "R53HostedZoneDeletionStateCode")
     : r53_hosted_zone_deletion_state_code)
    : r53_hosted_zone_deletion_state_code)

let r53_hosted_zone_deletion_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code =
       option_of_yojson
         (value_for_key r53_hosted_zone_deletion_state_code_of_yojson "code")
         _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : r53_hosted_zone_deletion_state)

let name_servers_update_state_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCEEDED" -> Succeeded
    | `String "PENDING" -> Pending
    | `String "FAILED" -> Failed
    | `String "STARTED" -> Started
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NameServersUpdateStateCode" value)
    | _ -> raise (deserialize_wrong_type_error path "NameServersUpdateStateCode")
     : name_servers_update_state_code)
    : name_servers_update_state_code)

let name_servers_update_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code =
       option_of_yojson (value_for_key name_servers_update_state_code_of_yojson "code") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : name_servers_update_state)

let registered_domain_delegation_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name_servers_update_state =
       option_of_yojson
         (value_for_key name_servers_update_state_of_yojson "nameServersUpdateState")
         _list path;
     r53_hosted_zone_deletion_state =
       option_of_yojson
         (value_for_key r53_hosted_zone_deletion_state_of_yojson "r53HostedZoneDeletionState")
         _list path;
   }
    : registered_domain_delegation_info)

let domain_entry_list_of_yojson tree path = list_of_yojson domain_entry_of_yojson tree path

let domain_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     domain_entries =
       option_of_yojson (value_for_key domain_entry_list_of_yojson "domainEntries") _list path;
     registered_domain_delegation_info =
       option_of_yojson
         (value_for_key registered_domain_delegation_info_of_yojson "registeredDomainDelegationInfo")
         _list path;
   }
    : domain)

let domain_list_of_yojson tree path = list_of_yojson domain_of_yojson tree path

let download_default_key_pair_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     public_key_base64 =
       option_of_yojson (value_for_key base64_of_yojson "publicKeyBase64") _list path;
     private_key_base64 =
       option_of_yojson (value_for_key base64_of_yojson "privateKeyBase64") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
   }
    : download_default_key_pair_result)

let download_default_key_pair_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let email_address_of_yojson = string_of_yojson

let enable_add_on_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : enable_add_on_result)

let enable_add_on_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = value_for_key resource_name_of_yojson "resourceName" _list path;
     add_on_request = value_for_key add_on_request_of_yojson "addOnRequest" _list path;
   }
    : enable_add_on_request)

let export_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : export_snapshot_result)

let export_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ source_snapshot_name = value_for_key resource_name_of_yojson "sourceSnapshotName" _list path }
    : export_snapshot_request)

let instance_snapshot_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_bundle_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "fromBundleId") _list path;
     from_blueprint_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "fromBlueprintId") _list path;
     from_disk_info =
       option_of_yojson (value_for_key disk_info_list_of_yojson "fromDiskInfo") _list path;
   }
    : instance_snapshot_info)

let export_snapshot_record_source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "InstanceSnapshot" -> InstanceSnapshot
    | `String "DiskSnapshot" -> DiskSnapshot
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExportSnapshotRecordSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportSnapshotRecordSourceType")
     : export_snapshot_record_source_type)
    : export_snapshot_record_source_type)

let export_snapshot_record_source_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson
         (value_for_key export_snapshot_record_source_type_of_yojson "resourceType")
         _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     name = option_of_yojson (value_for_key non_empty_string_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     from_resource_name =
       option_of_yojson (value_for_key non_empty_string_of_yojson "fromResourceName") _list path;
     from_resource_arn =
       option_of_yojson (value_for_key non_empty_string_of_yojson "fromResourceArn") _list path;
     instance_snapshot_info =
       option_of_yojson
         (value_for_key instance_snapshot_info_of_yojson "instanceSnapshotInfo")
         _list path;
     disk_snapshot_info =
       option_of_yojson (value_for_key disk_snapshot_info_of_yojson "diskSnapshotInfo") _list path;
   }
    : export_snapshot_record_source_info)

let export_snapshot_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     state = option_of_yojson (value_for_key record_state_of_yojson "state") _list path;
     source_info =
       option_of_yojson
         (value_for_key export_snapshot_record_source_info_of_yojson "sourceInfo")
         _list path;
     destination_info =
       option_of_yojson (value_for_key destination_info_of_yojson "destinationInfo") _list path;
   }
    : export_snapshot_record)

let export_snapshot_record_list_of_yojson tree path =
  list_of_yojson export_snapshot_record_of_yojson tree path

let get_active_names_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_names = option_of_yojson (value_for_key string_list_of_yojson "activeNames") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_active_names_result)

let get_active_names_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_active_names_request)

let get_alarms_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alarms = option_of_yojson (value_for_key alarms_list_of_yojson "alarms") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_alarms_result)

let get_alarms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alarm_name = option_of_yojson (value_for_key resource_name_of_yojson "alarmName") _list path;
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
     monitored_resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "monitoredResourceName") _list path;
   }
    : get_alarms_request)

let get_auto_snapshots_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "resourceName") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     auto_snapshots =
       option_of_yojson
         (value_for_key auto_snapshot_details_list_of_yojson "autoSnapshots")
         _list path;
   }
    : get_auto_snapshots_result)

let get_auto_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_name = value_for_key resource_name_of_yojson "resourceName" _list path }
    : get_auto_snapshots_request)

let get_blueprints_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blueprints = option_of_yojson (value_for_key blueprint_list_of_yojson "blueprints") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_blueprints_result)

let get_blueprints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_inactive =
       option_of_yojson (value_for_key boolean__of_yojson "includeInactive") _list path;
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
     app_category = option_of_yojson (value_for_key app_category_of_yojson "appCategory") _list path;
   }
    : get_blueprints_request)

let get_bucket_access_keys_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_keys =
       option_of_yojson (value_for_key access_key_list_of_yojson "accessKeys") _list path;
   }
    : get_bucket_access_keys_result)

let get_bucket_access_keys_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ bucket_name = value_for_key bucket_name_of_yojson "bucketName" _list path }
    : get_bucket_access_keys_request)

let get_bucket_bundles_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ bundles = option_of_yojson (value_for_key bucket_bundle_list_of_yojson "bundles") _list path }
    : get_bucket_bundles_result)

let get_bucket_bundles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_inactive =
       option_of_yojson (value_for_key boolean__of_yojson "includeInactive") _list path;
   }
    : get_bucket_bundles_request)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let metric_datapoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     average = option_of_yojson (value_for_key double_of_yojson "average") _list path;
     maximum = option_of_yojson (value_for_key double_of_yojson "maximum") _list path;
     minimum = option_of_yojson (value_for_key double_of_yojson "minimum") _list path;
     sample_count = option_of_yojson (value_for_key double_of_yojson "sampleCount") _list path;
     sum = option_of_yojson (value_for_key double_of_yojson "sum") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "timestamp") _list path;
     unit_ = option_of_yojson (value_for_key metric_unit_of_yojson "unit") _list path;
   }
    : metric_datapoint)

let metric_datapoint_list_of_yojson tree path = list_of_yojson metric_datapoint_of_yojson tree path

let get_bucket_metric_data_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name =
       option_of_yojson (value_for_key bucket_metric_name_of_yojson "metricName") _list path;
     metric_data =
       option_of_yojson (value_for_key metric_datapoint_list_of_yojson "metricData") _list path;
   }
    : get_bucket_metric_data_result)

let metric_statistic_list_of_yojson tree path = list_of_yojson metric_statistic_of_yojson tree path

let get_bucket_metric_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = value_for_key bucket_name_of_yojson "bucketName" _list path;
     metric_name = value_for_key bucket_metric_name_of_yojson "metricName" _list path;
     start_time = value_for_key iso_date_of_yojson "startTime" _list path;
     end_time = value_for_key iso_date_of_yojson "endTime" _list path;
     period = value_for_key metric_period_of_yojson "period" _list path;
     statistics = value_for_key metric_statistic_list_of_yojson "statistics" _list path;
     unit_ = value_for_key metric_unit_of_yojson "unit" _list path;
   }
    : get_bucket_metric_data_request)

let get_buckets_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     buckets = option_of_yojson (value_for_key bucket_list_of_yojson "buckets") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
     account_level_bpa_sync =
       option_of_yojson
         (value_for_key account_level_bpa_sync_of_yojson "accountLevelBpaSync")
         _list path;
   }
    : get_buckets_result)

let get_buckets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = option_of_yojson (value_for_key bucket_name_of_yojson "bucketName") _list path;
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
     include_connected_resources =
       option_of_yojson (value_for_key boolean__of_yojson "includeConnectedResources") _list path;
     include_cors = option_of_yojson (value_for_key boolean__of_yojson "includeCors") _list path;
   }
    : get_buckets_request)

let get_bundles_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bundles = option_of_yojson (value_for_key bundle_list_of_yojson "bundles") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_bundles_result)

let get_bundles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_inactive =
       option_of_yojson (value_for_key boolean__of_yojson "includeInactive") _list path;
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
     app_category = option_of_yojson (value_for_key app_category_of_yojson "appCategory") _list path;
   }
    : get_bundles_request)

let get_certificates_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificates =
       option_of_yojson (value_for_key certificate_summary_list_of_yojson "certificates") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_certificates_result)

let include_certificate_details_of_yojson = bool_of_yojson

let get_certificates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_statuses =
       option_of_yojson
         (value_for_key certificate_status_list_of_yojson "certificateStatuses")
         _list path;
     include_certificate_details =
       option_of_yojson
         (value_for_key include_certificate_details_of_yojson "includeCertificateDetails")
         _list path;
     certificate_name =
       option_of_yojson (value_for_key certificate_name_of_yojson "certificateName") _list path;
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
   }
    : get_certificates_request)

let get_cloud_formation_stack_records_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_formation_stack_records =
       option_of_yojson
         (value_for_key cloud_formation_stack_record_list_of_yojson "cloudFormationStackRecords")
         _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_cloud_formation_stack_records_result)

let get_cloud_formation_stack_records_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_cloud_formation_stack_records_request)

let get_contact_methods_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contact_methods =
       option_of_yojson (value_for_key contact_methods_list_of_yojson "contactMethods") _list path;
   }
    : get_contact_methods_result)

let get_contact_methods_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protocols =
       option_of_yojson (value_for_key contact_protocols_list_of_yojson "protocols") _list path;
   }
    : get_contact_methods_request)

let get_container_api_metadata_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata =
       option_of_yojson
         (value_for_key container_service_metadata_entry_list_of_yojson "metadata")
         _list path;
   }
    : get_container_api_metadata_result)

let get_container_api_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_container_images_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_images =
       option_of_yojson (value_for_key container_image_list_of_yojson "containerImages") _list path;
   }
    : get_container_images_result)

let get_container_images_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_name = value_for_key container_service_name_of_yojson "serviceName" _list path }
    : get_container_images_request)

let get_container_log_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_events =
       option_of_yojson
         (value_for_key container_service_log_event_list_of_yojson "logEvents")
         _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_container_log_result)

let get_container_log_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = value_for_key container_service_name_of_yojson "serviceName" _list path;
     container_name = value_for_key string__of_yojson "containerName" _list path;
     start_time = option_of_yojson (value_for_key iso_date_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key iso_date_of_yojson "endTime") _list path;
     filter_pattern = option_of_yojson (value_for_key string__of_yojson "filterPattern") _list path;
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
   }
    : get_container_log_request)

let get_container_service_deployments_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployments =
       option_of_yojson
         (value_for_key container_service_deployment_list_of_yojson "deployments")
         _list path;
   }
    : get_container_service_deployments_result)

let get_container_service_deployments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ service_name = value_for_key container_service_name_of_yojson "serviceName" _list path }
    : get_container_service_deployments_request)

let get_container_service_metric_data_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name =
       option_of_yojson
         (value_for_key container_service_metric_name_of_yojson "metricName")
         _list path;
     metric_data =
       option_of_yojson (value_for_key metric_datapoint_list_of_yojson "metricData") _list path;
   }
    : get_container_service_metric_data_result)

let get_container_service_metric_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = value_for_key container_service_name_of_yojson "serviceName" _list path;
     metric_name = value_for_key container_service_metric_name_of_yojson "metricName" _list path;
     start_time = value_for_key iso_date_of_yojson "startTime" _list path;
     end_time = value_for_key iso_date_of_yojson "endTime" _list path;
     period = value_for_key metric_period_of_yojson "period" _list path;
     statistics = value_for_key metric_statistic_list_of_yojson "statistics" _list path;
   }
    : get_container_service_metric_data_request)

let get_container_service_powers_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     powers =
       option_of_yojson (value_for_key container_service_power_list_of_yojson "powers") _list path;
   }
    : get_container_service_powers_result)

let get_container_service_powers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_container_services_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name =
       option_of_yojson (value_for_key container_service_name_of_yojson "serviceName") _list path;
   }
    : get_container_services_request)

let resource_budget_estimate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "resourceName") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     cost_estimates =
       option_of_yojson (value_for_key cost_estimates_of_yojson "costEstimates") _list path;
     start_time = option_of_yojson (value_for_key iso_date_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key iso_date_of_yojson "endTime") _list path;
   }
    : resource_budget_estimate)

let resources_budget_estimate_of_yojson tree path =
  list_of_yojson resource_budget_estimate_of_yojson tree path

let get_cost_estimate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resources_budget_estimate =
       option_of_yojson
         (value_for_key resources_budget_estimate_of_yojson "resourcesBudgetEstimate")
         _list path;
   }
    : get_cost_estimate_result)

let get_cost_estimate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = value_for_key resource_name_of_yojson "resourceName" _list path;
     start_time = value_for_key iso_date_of_yojson "startTime" _list path;
     end_time = value_for_key iso_date_of_yojson "endTime" _list path;
   }
    : get_cost_estimate_request)

let get_disk_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ disk = option_of_yojson (value_for_key disk_of_yojson "disk") _list path } : get_disk_result)

let get_disk_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ disk_name = value_for_key resource_name_of_yojson "diskName" _list path } : get_disk_request)

let get_disk_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_snapshot =
       option_of_yojson (value_for_key disk_snapshot_of_yojson "diskSnapshot") _list path;
   }
    : get_disk_snapshot_result)

let get_disk_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ disk_snapshot_name = value_for_key resource_name_of_yojson "diskSnapshotName" _list path }
    : get_disk_snapshot_request)

let get_disk_snapshots_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_snapshots =
       option_of_yojson (value_for_key disk_snapshot_list_of_yojson "diskSnapshots") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_disk_snapshots_result)

let get_disk_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_disk_snapshots_request)

let get_disks_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disks = option_of_yojson (value_for_key disk_list_of_yojson "disks") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_disks_result)

let get_disks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_disks_request)

let get_distribution_bundles_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bundles =
       option_of_yojson (value_for_key distribution_bundle_list_of_yojson "bundles") _list path;
   }
    : get_distribution_bundles_result)

let get_distribution_bundles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_distribution_latest_cache_reset_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     create_time = option_of_yojson (value_for_key iso_date_of_yojson "createTime") _list path;
   }
    : get_distribution_latest_cache_reset_result)

let get_distribution_latest_cache_reset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     distribution_name =
       option_of_yojson (value_for_key resource_name_of_yojson "distributionName") _list path;
   }
    : get_distribution_latest_cache_reset_request)

let get_distribution_metric_data_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name =
       option_of_yojson (value_for_key distribution_metric_name_of_yojson "metricName") _list path;
     metric_data =
       option_of_yojson (value_for_key metric_datapoint_list_of_yojson "metricData") _list path;
   }
    : get_distribution_metric_data_result)

let get_distribution_metric_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     distribution_name = value_for_key resource_name_of_yojson "distributionName" _list path;
     metric_name = value_for_key distribution_metric_name_of_yojson "metricName" _list path;
     start_time = value_for_key timestamp_of_yojson "startTime" _list path;
     end_time = value_for_key timestamp_of_yojson "endTime" _list path;
     period = value_for_key metric_period_of_yojson "period" _list path;
     unit_ = value_for_key metric_unit_of_yojson "unit" _list path;
     statistics = value_for_key metric_statistic_list_of_yojson "statistics" _list path;
   }
    : get_distribution_metric_data_request)

let get_distributions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     distributions =
       option_of_yojson (value_for_key distribution_list_of_yojson "distributions") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_distributions_result)

let get_distributions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     distribution_name =
       option_of_yojson (value_for_key resource_name_of_yojson "distributionName") _list path;
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
   }
    : get_distributions_request)

let get_domain_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain = option_of_yojson (value_for_key domain_of_yojson "domain") _list path }
    : get_domain_result)

let get_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_name = value_for_key domain_name_of_yojson "domainName" _list path }
    : get_domain_request)

let get_domains_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domains = option_of_yojson (value_for_key domain_list_of_yojson "domains") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_domains_result)

let get_domains_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_domains_request)

let get_export_snapshot_records_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_snapshot_records =
       option_of_yojson
         (value_for_key export_snapshot_record_list_of_yojson "exportSnapshotRecords")
         _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_export_snapshot_records_result)

let get_export_snapshot_records_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_export_snapshot_records_request)

let http_protocol_ipv6_of_yojson (tree : t) path =
  ((match tree with
    | `String "disabled" -> Disabled
    | `String "enabled" -> Enabled
    | `String value -> raise (deserialize_unknown_enum_value_error path "HttpProtocolIpv6" value)
    | _ -> raise (deserialize_wrong_type_error path "HttpProtocolIpv6")
     : http_protocol_ipv6)
    : http_protocol_ipv6)

let http_endpoint_of_yojson (tree : t) path =
  ((match tree with
    | `String "disabled" -> Disabled
    | `String "enabled" -> Enabled
    | `String value -> raise (deserialize_unknown_enum_value_error path "HttpEndpoint" value)
    | _ -> raise (deserialize_wrong_type_error path "HttpEndpoint")
     : http_endpoint)
    : http_endpoint)

let http_tokens_of_yojson (tree : t) path =
  ((match tree with
    | `String "optional" -> Optional
    | `String "required" -> Required
    | `String value -> raise (deserialize_unknown_enum_value_error path "HttpTokens" value)
    | _ -> raise (deserialize_wrong_type_error path "HttpTokens")
     : http_tokens)
    : http_tokens)

let instance_metadata_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "pending" -> Pending
    | `String "applied" -> Applied
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceMetadataState" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceMetadataState")
     : instance_metadata_state)
    : instance_metadata_state)

let instance_metadata_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key instance_metadata_state_of_yojson "state") _list path;
     http_tokens = option_of_yojson (value_for_key http_tokens_of_yojson "httpTokens") _list path;
     http_endpoint =
       option_of_yojson (value_for_key http_endpoint_of_yojson "httpEndpoint") _list path;
     http_put_response_hop_limit =
       option_of_yojson (value_for_key integer_of_yojson "httpPutResponseHopLimit") _list path;
     http_protocol_ipv6 =
       option_of_yojson (value_for_key http_protocol_ipv6_of_yojson "httpProtocolIpv6") _list path;
   }
    : instance_metadata_options)

let instance_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key integer_of_yojson "code") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : instance_state)

let port_access_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Public" -> Public
    | `String "Private" -> Private
    | `String value -> raise (deserialize_unknown_enum_value_error path "PortAccessType" value)
    | _ -> raise (deserialize_wrong_type_error path "PortAccessType")
     : port_access_type)
    : port_access_type)

let instance_port_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_port = option_of_yojson (value_for_key port_of_yojson "fromPort") _list path;
     to_port = option_of_yojson (value_for_key port_of_yojson "toPort") _list path;
     protocol = option_of_yojson (value_for_key network_protocol_of_yojson "protocol") _list path;
     access_from = option_of_yojson (value_for_key string__of_yojson "accessFrom") _list path;
     access_type =
       option_of_yojson (value_for_key port_access_type_of_yojson "accessType") _list path;
     common_name = option_of_yojson (value_for_key string__of_yojson "commonName") _list path;
     access_direction =
       option_of_yojson (value_for_key access_direction_of_yojson "accessDirection") _list path;
     cidrs = option_of_yojson (value_for_key string_list_of_yojson "cidrs") _list path;
     ipv6_cidrs = option_of_yojson (value_for_key string_list_of_yojson "ipv6Cidrs") _list path;
     cidr_list_aliases =
       option_of_yojson (value_for_key string_list_of_yojson "cidrListAliases") _list path;
   }
    : instance_port_info)

let instance_port_info_list_of_yojson tree path =
  list_of_yojson instance_port_info_of_yojson tree path

let monthly_transfer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gb_per_month_allocated =
       option_of_yojson (value_for_key integer_of_yojson "gbPerMonthAllocated") _list path;
   }
    : monthly_transfer)

let instance_networking_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_transfer =
       option_of_yojson (value_for_key monthly_transfer_of_yojson "monthlyTransfer") _list path;
     ports = option_of_yojson (value_for_key instance_port_info_list_of_yojson "ports") _list path;
   }
    : instance_networking)

let instance_hardware_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cpu_count = option_of_yojson (value_for_key integer_of_yojson "cpuCount") _list path;
     disks = option_of_yojson (value_for_key disk_list_of_yojson "disks") _list path;
     ram_size_in_gb = option_of_yojson (value_for_key float__of_yojson "ramSizeInGb") _list path;
   }
    : instance_hardware)

let ipv6_address_of_yojson = string_of_yojson
let ipv6_address_list_of_yojson tree path = list_of_yojson ipv6_address_of_yojson tree path
let ip_address_of_yojson = string_of_yojson

let instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     blueprint_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "blueprintId") _list path;
     blueprint_name =
       option_of_yojson (value_for_key non_empty_string_of_yojson "blueprintName") _list path;
     bundle_id = option_of_yojson (value_for_key non_empty_string_of_yojson "bundleId") _list path;
     add_ons = option_of_yojson (value_for_key add_on_list_of_yojson "addOns") _list path;
     is_static_ip = option_of_yojson (value_for_key boolean__of_yojson "isStaticIp") _list path;
     private_ip_address =
       option_of_yojson (value_for_key ip_address_of_yojson "privateIpAddress") _list path;
     public_ip_address =
       option_of_yojson (value_for_key ip_address_of_yojson "publicIpAddress") _list path;
     ipv6_addresses =
       option_of_yojson (value_for_key ipv6_address_list_of_yojson "ipv6Addresses") _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "ipAddressType") _list path;
     hardware = option_of_yojson (value_for_key instance_hardware_of_yojson "hardware") _list path;
     networking =
       option_of_yojson (value_for_key instance_networking_of_yojson "networking") _list path;
     state = option_of_yojson (value_for_key instance_state_of_yojson "state") _list path;
     username = option_of_yojson (value_for_key non_empty_string_of_yojson "username") _list path;
     ssh_key_name = option_of_yojson (value_for_key resource_name_of_yojson "sshKeyName") _list path;
     metadata_options =
       option_of_yojson
         (value_for_key instance_metadata_options_of_yojson "metadataOptions")
         _list path;
   }
    : instance)

let get_instance_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance = option_of_yojson (value_for_key instance_of_yojson "instance") _list path }
    : get_instance_result)

let get_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_name = value_for_key resource_name_of_yojson "instanceName" _list path }
    : get_instance_request)

let host_key_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     algorithm = option_of_yojson (value_for_key string__of_yojson "algorithm") _list path;
     public_key = option_of_yojson (value_for_key string__of_yojson "publicKey") _list path;
     witnessed_at = option_of_yojson (value_for_key iso_date_of_yojson "witnessedAt") _list path;
     fingerprint_sh_a1 =
       option_of_yojson (value_for_key string__of_yojson "fingerprintSHA1") _list path;
     fingerprint_sh_a256 =
       option_of_yojson (value_for_key string__of_yojson "fingerprintSHA256") _list path;
     not_valid_before =
       option_of_yojson (value_for_key iso_date_of_yojson "notValidBefore") _list path;
     not_valid_after =
       option_of_yojson (value_for_key iso_date_of_yojson "notValidAfter") _list path;
   }
    : host_key_attributes)

let host_keys_list_of_yojson tree path = list_of_yojson host_key_attributes_of_yojson tree path

let instance_access_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "ssh" -> Ssh
    | `String "rdp" -> Rdp
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceAccessProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceAccessProtocol")
     : instance_access_protocol)
    : instance_access_protocol)

let password_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ciphertext = option_of_yojson (value_for_key string__of_yojson "ciphertext") _list path;
     key_pair_name =
       option_of_yojson (value_for_key resource_name_of_yojson "keyPairName") _list path;
   }
    : password_data)

let instance_access_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cert_key = option_of_yojson (value_for_key string__of_yojson "certKey") _list path;
     expires_at = option_of_yojson (value_for_key iso_date_of_yojson "expiresAt") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "ipAddress") _list path;
     ipv6_addresses =
       option_of_yojson (value_for_key ipv6_address_list_of_yojson "ipv6Addresses") _list path;
     password = option_of_yojson (value_for_key string__of_yojson "password") _list path;
     password_data =
       option_of_yojson (value_for_key password_data_of_yojson "passwordData") _list path;
     private_key = option_of_yojson (value_for_key string__of_yojson "privateKey") _list path;
     protocol =
       option_of_yojson (value_for_key instance_access_protocol_of_yojson "protocol") _list path;
     instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "instanceName") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "username") _list path;
     host_keys = option_of_yojson (value_for_key host_keys_list_of_yojson "hostKeys") _list path;
   }
    : instance_access_details)

let get_instance_access_details_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_details =
       option_of_yojson (value_for_key instance_access_details_of_yojson "accessDetails") _list path;
   }
    : get_instance_access_details_result)

let get_instance_access_details_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
     protocol =
       option_of_yojson (value_for_key instance_access_protocol_of_yojson "protocol") _list path;
   }
    : get_instance_access_details_request)

let instance_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CPUUtilization" -> CPUUtilization
    | `String "NetworkIn" -> NetworkIn
    | `String "NetworkOut" -> NetworkOut
    | `String "StatusCheckFailed" -> StatusCheckFailed
    | `String "StatusCheckFailed_Instance" -> StatusCheckFailed_Instance
    | `String "StatusCheckFailed_System" -> StatusCheckFailed_System
    | `String "BurstCapacityTime" -> BurstCapacityTime
    | `String "BurstCapacityPercentage" -> BurstCapacityPercentage
    | `String "MetadataNoToken" -> MetadataNoToken
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceMetricName")
     : instance_metric_name)
    : instance_metric_name)

let get_instance_metric_data_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name =
       option_of_yojson (value_for_key instance_metric_name_of_yojson "metricName") _list path;
     metric_data =
       option_of_yojson (value_for_key metric_datapoint_list_of_yojson "metricData") _list path;
   }
    : get_instance_metric_data_result)

let get_instance_metric_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
     metric_name = value_for_key instance_metric_name_of_yojson "metricName" _list path;
     period = value_for_key metric_period_of_yojson "period" _list path;
     start_time = value_for_key timestamp_of_yojson "startTime" _list path;
     end_time = value_for_key timestamp_of_yojson "endTime" _list path;
     unit_ = value_for_key metric_unit_of_yojson "unit" _list path;
     statistics = value_for_key metric_statistic_list_of_yojson "statistics" _list path;
   }
    : get_instance_metric_data_request)

let port_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "open" -> Open
    | `String "closed" -> Closed
    | `String value -> raise (deserialize_unknown_enum_value_error path "PortState" value)
    | _ -> raise (deserialize_wrong_type_error path "PortState")
     : port_state)
    : port_state)

let instance_port_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_port = option_of_yojson (value_for_key port_of_yojson "fromPort") _list path;
     to_port = option_of_yojson (value_for_key port_of_yojson "toPort") _list path;
     protocol = option_of_yojson (value_for_key network_protocol_of_yojson "protocol") _list path;
     state = option_of_yojson (value_for_key port_state_of_yojson "state") _list path;
     cidrs = option_of_yojson (value_for_key string_list_of_yojson "cidrs") _list path;
     ipv6_cidrs = option_of_yojson (value_for_key string_list_of_yojson "ipv6Cidrs") _list path;
     cidr_list_aliases =
       option_of_yojson (value_for_key string_list_of_yojson "cidrListAliases") _list path;
   }
    : instance_port_state)

let instance_port_state_list_of_yojson tree path =
  list_of_yojson instance_port_state_of_yojson tree path

let get_instance_port_states_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port_states =
       option_of_yojson (value_for_key instance_port_state_list_of_yojson "portStates") _list path;
   }
    : get_instance_port_states_result)

let get_instance_port_states_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_name = value_for_key resource_name_of_yojson "instanceName" _list path }
    : get_instance_port_states_request)

let instance_snapshot_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "pending" -> Pending
    | `String "error" -> Error_
    | `String "available" -> Available
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceSnapshotState" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceSnapshotState")
     : instance_snapshot_state)
    : instance_snapshot_state)

let instance_snapshot_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     state = option_of_yojson (value_for_key instance_snapshot_state_of_yojson "state") _list path;
     progress = option_of_yojson (value_for_key string__of_yojson "progress") _list path;
     from_attached_disks =
       option_of_yojson (value_for_key disk_list_of_yojson "fromAttachedDisks") _list path;
     from_instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "fromInstanceName") _list path;
     from_instance_arn =
       option_of_yojson (value_for_key non_empty_string_of_yojson "fromInstanceArn") _list path;
     from_blueprint_id =
       option_of_yojson (value_for_key string__of_yojson "fromBlueprintId") _list path;
     from_bundle_id = option_of_yojson (value_for_key string__of_yojson "fromBundleId") _list path;
     is_from_auto_snapshot =
       option_of_yojson (value_for_key boolean__of_yojson "isFromAutoSnapshot") _list path;
     size_in_gb = option_of_yojson (value_for_key integer_of_yojson "sizeInGb") _list path;
   }
    : instance_snapshot)

let get_instance_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_snapshot =
       option_of_yojson (value_for_key instance_snapshot_of_yojson "instanceSnapshot") _list path;
   }
    : get_instance_snapshot_result)

let get_instance_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_snapshot_name =
       value_for_key resource_name_of_yojson "instanceSnapshotName" _list path;
   }
    : get_instance_snapshot_request)

let instance_snapshot_list_of_yojson tree path =
  list_of_yojson instance_snapshot_of_yojson tree path

let get_instance_snapshots_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_snapshots =
       option_of_yojson
         (value_for_key instance_snapshot_list_of_yojson "instanceSnapshots")
         _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_instance_snapshots_result)

let get_instance_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_instance_snapshots_request)

let get_instance_state_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ state = option_of_yojson (value_for_key instance_state_of_yojson "state") _list path }
    : get_instance_state_result)

let get_instance_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_name = value_for_key resource_name_of_yojson "instanceName" _list path }
    : get_instance_state_request)

let instance_list_of_yojson tree path = list_of_yojson instance_of_yojson tree path

let get_instances_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instances = option_of_yojson (value_for_key instance_list_of_yojson "instances") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_instances_result)

let get_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_instances_request)

let get_key_pair_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_pair = option_of_yojson (value_for_key key_pair_of_yojson "keyPair") _list path }
    : get_key_pair_result)

let get_key_pair_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_pair_name = value_for_key resource_name_of_yojson "keyPairName" _list path }
    : get_key_pair_request)

let key_pair_list_of_yojson tree path = list_of_yojson key_pair_of_yojson tree path

let get_key_pairs_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_pairs = option_of_yojson (value_for_key key_pair_list_of_yojson "keyPairs") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_key_pairs_result)

let get_key_pairs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
     include_default_key_pair =
       option_of_yojson (value_for_key boolean__of_yojson "includeDefaultKeyPair") _list path;
   }
    : get_key_pairs_request)

let load_balancer_attribute_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "HealthCheckPath" -> HealthCheckPath
    | `String "SessionStickinessEnabled" -> SessionStickinessEnabled
    | `String "SessionStickiness_LB_CookieDurationSeconds" ->
        SessionStickiness_LB_CookieDurationSeconds
    | `String "HttpsRedirectionEnabled" -> HttpsRedirectionEnabled
    | `String "TlsPolicyName" -> TlsPolicyName
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LoadBalancerAttributeName" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerAttributeName")
     : load_balancer_attribute_name)
    : load_balancer_attribute_name)

let load_balancer_configuration_options_of_yojson tree path =
  map_of_yojson load_balancer_attribute_name_of_yojson string__of_yojson tree path

let load_balancer_tls_certificate_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     is_attached = option_of_yojson (value_for_key boolean__of_yojson "isAttached") _list path;
   }
    : load_balancer_tls_certificate_summary)

let load_balancer_tls_certificate_summary_list_of_yojson tree path =
  list_of_yojson load_balancer_tls_certificate_summary_of_yojson tree path

let instance_health_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "Lb.RegistrationInProgress" -> LbRegistrationInProgress
    | `String "Lb.InitialHealthChecking" -> LbInitialHealthChecking
    | `String "Lb.InternalError" -> LbInternalError
    | `String "Instance.ResponseCodeMismatch" -> InstanceResponseCodeMismatch
    | `String "Instance.Timeout" -> InstanceTimeout
    | `String "Instance.FailedHealthChecks" -> InstanceFailedHealthChecks
    | `String "Instance.NotRegistered" -> InstanceNotRegistered
    | `String "Instance.NotInUse" -> InstanceNotInUse
    | `String "Instance.DeregistrationInProgress" -> InstanceDeregistrationInProgress
    | `String "Instance.InvalidState" -> InstanceInvalidState
    | `String "Instance.IpUnusable" -> InstanceIpUnusable
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceHealthReason" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceHealthReason")
     : instance_health_reason)
    : instance_health_reason)

let instance_health_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "initial" -> Initial
    | `String "healthy" -> Healthy
    | `String "unhealthy" -> Unhealthy
    | `String "unused" -> Unused
    | `String "draining" -> Draining
    | `String "unavailable" -> Unavailable
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceHealthState" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceHealthState")
     : instance_health_state)
    : instance_health_state)

let instance_health_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "instanceName") _list path;
     instance_health =
       option_of_yojson (value_for_key instance_health_state_of_yojson "instanceHealth") _list path;
     instance_health_reason =
       option_of_yojson
         (value_for_key instance_health_reason_of_yojson "instanceHealthReason")
         _list path;
   }
    : instance_health_summary)

let instance_health_summary_list_of_yojson tree path =
  list_of_yojson instance_health_summary_of_yojson tree path

let port_list_of_yojson tree path = list_of_yojson port_of_yojson tree path

let load_balancer_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "HTTP_HTTPS" -> HTTP_HTTPS
    | `String "HTTP" -> HTTP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LoadBalancerProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerProtocol")
     : load_balancer_protocol)
    : load_balancer_protocol)

let load_balancer_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "active" -> Active
    | `String "provisioning" -> Provisioning
    | `String "active_impaired" -> ActiveImpaired
    | `String "failed" -> Failed
    | `String "unknown" -> Unknown
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadBalancerState" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerState")
     : load_balancer_state)
    : load_balancer_state)

let load_balancer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     dns_name = option_of_yojson (value_for_key non_empty_string_of_yojson "dnsName") _list path;
     state = option_of_yojson (value_for_key load_balancer_state_of_yojson "state") _list path;
     protocol =
       option_of_yojson (value_for_key load_balancer_protocol_of_yojson "protocol") _list path;
     public_ports = option_of_yojson (value_for_key port_list_of_yojson "publicPorts") _list path;
     health_check_path =
       option_of_yojson (value_for_key non_empty_string_of_yojson "healthCheckPath") _list path;
     instance_port = option_of_yojson (value_for_key integer_of_yojson "instancePort") _list path;
     instance_health_summary =
       option_of_yojson
         (value_for_key instance_health_summary_list_of_yojson "instanceHealthSummary")
         _list path;
     tls_certificate_summaries =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_summary_list_of_yojson
            "tlsCertificateSummaries")
         _list path;
     configuration_options =
       option_of_yojson
         (value_for_key load_balancer_configuration_options_of_yojson "configurationOptions")
         _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "ipAddressType") _list path;
     https_redirection_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "httpsRedirectionEnabled") _list path;
     tls_policy_name =
       option_of_yojson (value_for_key resource_name_of_yojson "tlsPolicyName") _list path;
   }
    : load_balancer)

let get_load_balancer_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     load_balancer =
       option_of_yojson (value_for_key load_balancer_of_yojson "loadBalancer") _list path;
   }
    : get_load_balancer_result)

let get_load_balancer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ load_balancer_name = value_for_key resource_name_of_yojson "loadBalancerName" _list path }
    : get_load_balancer_request)

let load_balancer_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "ClientTLSNegotiationErrorCount" -> ClientTLSNegotiationErrorCount
    | `String "HealthyHostCount" -> HealthyHostCount
    | `String "UnhealthyHostCount" -> UnhealthyHostCount
    | `String "HTTPCode_LB_4XX_Count" -> HTTPCode_LB_4XX_Count
    | `String "HTTPCode_LB_5XX_Count" -> HTTPCode_LB_5XX_Count
    | `String "HTTPCode_Instance_2XX_Count" -> HTTPCode_Instance_2XX_Count
    | `String "HTTPCode_Instance_3XX_Count" -> HTTPCode_Instance_3XX_Count
    | `String "HTTPCode_Instance_4XX_Count" -> HTTPCode_Instance_4XX_Count
    | `String "HTTPCode_Instance_5XX_Count" -> HTTPCode_Instance_5XX_Count
    | `String "InstanceResponseTime" -> InstanceResponseTime
    | `String "RejectedConnectionCount" -> RejectedConnectionCount
    | `String "RequestCount" -> RequestCount
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LoadBalancerMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerMetricName")
     : load_balancer_metric_name)
    : load_balancer_metric_name)

let get_load_balancer_metric_data_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name =
       option_of_yojson (value_for_key load_balancer_metric_name_of_yojson "metricName") _list path;
     metric_data =
       option_of_yojson (value_for_key metric_datapoint_list_of_yojson "metricData") _list path;
   }
    : get_load_balancer_metric_data_result)

let get_load_balancer_metric_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     load_balancer_name = value_for_key resource_name_of_yojson "loadBalancerName" _list path;
     metric_name = value_for_key load_balancer_metric_name_of_yojson "metricName" _list path;
     period = value_for_key metric_period_of_yojson "period" _list path;
     start_time = value_for_key timestamp_of_yojson "startTime" _list path;
     end_time = value_for_key timestamp_of_yojson "endTime" _list path;
     unit_ = value_for_key metric_unit_of_yojson "unit" _list path;
     statistics = value_for_key metric_statistic_list_of_yojson "statistics" _list path;
   }
    : get_load_balancer_metric_data_request)

let load_balancer_tls_certificate_revocation_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNSPECIFIED" -> Unspecified
    | `String "KEY_COMPROMISE" -> KeyCompromise
    | `String "CA_COMPROMISE" -> CaCompromise
    | `String "AFFILIATION_CHANGED" -> AffiliationChanged
    | `String "SUPERCEDED" -> Superceded
    | `String "CESSATION_OF_OPERATION" -> CessationOfOperation
    | `String "CERTIFICATE_HOLD" -> CertificateHold
    | `String "REMOVE_FROM_CRL" -> RemoveFromCrl
    | `String "PRIVILEGE_WITHDRAWN" -> PrivilegeWithdrawn
    | `String "A_A_COMPROMISE" -> AACompromise
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "LoadBalancerTlsCertificateRevocationReason"
             value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerTlsCertificateRevocationReason")
     : load_balancer_tls_certificate_revocation_reason)
    : load_balancer_tls_certificate_revocation_reason)

let load_balancer_tls_certificate_domain_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_VALIDATION" -> PendingValidation
    | `String "FAILED" -> Failed
    | `String "SUCCESS" -> Success
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "LoadBalancerTlsCertificateDomainStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerTlsCertificateDomainStatus")
     : load_balancer_tls_certificate_domain_status)
    : load_balancer_tls_certificate_domain_status)

let load_balancer_tls_certificate_domain_validation_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path;
     validation_status =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_domain_status_of_yojson "validationStatus")
         _list path;
   }
    : load_balancer_tls_certificate_domain_validation_option)

let load_balancer_tls_certificate_domain_validation_option_list_of_yojson tree path =
  list_of_yojson load_balancer_tls_certificate_domain_validation_option_of_yojson tree path

let load_balancer_tls_certificate_renewal_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_AUTO_RENEWAL" -> PendingAutoRenewal
    | `String "PENDING_VALIDATION" -> PendingValidation
    | `String "SUCCESS" -> Success
    | `String "FAILED" -> Failed
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "LoadBalancerTlsCertificateRenewalStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerTlsCertificateRenewalStatus")
     : load_balancer_tls_certificate_renewal_status)
    : load_balancer_tls_certificate_renewal_status)

let load_balancer_tls_certificate_renewal_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     renewal_status =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_renewal_status_of_yojson "renewalStatus")
         _list path;
     domain_validation_options =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_domain_validation_option_list_of_yojson
            "domainValidationOptions")
         _list path;
   }
    : load_balancer_tls_certificate_renewal_summary)

let load_balancer_tls_certificate_failure_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_AVAILABLE_CONTACTS" -> NoAvailableContacts
    | `String "ADDITIONAL_VERIFICATION_REQUIRED" -> AdditionalVerificationRequired
    | `String "DOMAIN_NOT_ALLOWED" -> DomainNotAllowed
    | `String "INVALID_PUBLIC_DOMAIN" -> InvalidPublicDomain
    | `String "OTHER" -> Other
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "LoadBalancerTlsCertificateFailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerTlsCertificateFailureReason")
     : load_balancer_tls_certificate_failure_reason)
    : load_balancer_tls_certificate_failure_reason)

let load_balancer_tls_certificate_dns_record_creation_state_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCEEDED" -> Succeeded
    | `String "STARTED" -> Started
    | `String "FAILED" -> Failed
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "LoadBalancerTlsCertificateDnsRecordCreationStateCode" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "LoadBalancerTlsCertificateDnsRecordCreationStateCode")
     : load_balancer_tls_certificate_dns_record_creation_state_code)
    : load_balancer_tls_certificate_dns_record_creation_state_code)

let load_balancer_tls_certificate_dns_record_creation_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_dns_record_creation_state_code_of_yojson
            "code")
         _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : load_balancer_tls_certificate_dns_record_creation_state)

let load_balancer_tls_certificate_domain_validation_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key non_empty_string_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key non_empty_string_of_yojson "type") _list path;
     value = option_of_yojson (value_for_key non_empty_string_of_yojson "value") _list path;
     validation_status =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_domain_status_of_yojson "validationStatus")
         _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path;
     dns_record_creation_state =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_dns_record_creation_state_of_yojson
            "dnsRecordCreationState")
         _list path;
   }
    : load_balancer_tls_certificate_domain_validation_record)

let load_balancer_tls_certificate_domain_validation_record_list_of_yojson tree path =
  list_of_yojson load_balancer_tls_certificate_domain_validation_record_of_yojson tree path

let load_balancer_tls_certificate_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_VALIDATION" -> PendingValidation
    | `String "ISSUED" -> Issued
    | `String "INACTIVE" -> Inactive
    | `String "EXPIRED" -> Expired
    | `String "VALIDATION_TIMED_OUT" -> ValidationTimedOut
    | `String "REVOKED" -> Revoked
    | `String "FAILED" -> Failed
    | `String "UNKNOWN" -> Unknown
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LoadBalancerTlsCertificateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerTlsCertificateStatus")
     : load_balancer_tls_certificate_status)
    : load_balancer_tls_certificate_status)

let load_balancer_tls_certificate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     load_balancer_name =
       option_of_yojson (value_for_key resource_name_of_yojson "loadBalancerName") _list path;
     is_attached = option_of_yojson (value_for_key boolean__of_yojson "isAttached") _list path;
     status =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_status_of_yojson "status")
         _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "domainName") _list path;
     domain_validation_records =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_domain_validation_record_list_of_yojson
            "domainValidationRecords")
         _list path;
     failure_reason =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_failure_reason_of_yojson "failureReason")
         _list path;
     issued_at = option_of_yojson (value_for_key iso_date_of_yojson "issuedAt") _list path;
     issuer = option_of_yojson (value_for_key non_empty_string_of_yojson "issuer") _list path;
     key_algorithm =
       option_of_yojson (value_for_key non_empty_string_of_yojson "keyAlgorithm") _list path;
     not_after = option_of_yojson (value_for_key iso_date_of_yojson "notAfter") _list path;
     not_before = option_of_yojson (value_for_key iso_date_of_yojson "notBefore") _list path;
     renewal_summary =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_renewal_summary_of_yojson "renewalSummary")
         _list path;
     revocation_reason =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_revocation_reason_of_yojson "revocationReason")
         _list path;
     revoked_at = option_of_yojson (value_for_key iso_date_of_yojson "revokedAt") _list path;
     serial = option_of_yojson (value_for_key non_empty_string_of_yojson "serial") _list path;
     signature_algorithm =
       option_of_yojson (value_for_key non_empty_string_of_yojson "signatureAlgorithm") _list path;
     subject = option_of_yojson (value_for_key non_empty_string_of_yojson "subject") _list path;
     subject_alternative_names =
       option_of_yojson (value_for_key string_list_of_yojson "subjectAlternativeNames") _list path;
   }
    : load_balancer_tls_certificate)

let load_balancer_tls_certificate_list_of_yojson tree path =
  list_of_yojson load_balancer_tls_certificate_of_yojson tree path

let get_load_balancer_tls_certificates_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tls_certificates =
       option_of_yojson
         (value_for_key load_balancer_tls_certificate_list_of_yojson "tlsCertificates")
         _list path;
   }
    : get_load_balancer_tls_certificates_result)

let get_load_balancer_tls_certificates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ load_balancer_name = value_for_key resource_name_of_yojson "loadBalancerName" _list path }
    : get_load_balancer_tls_certificates_request)

let load_balancer_tls_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     is_default = option_of_yojson (value_for_key boolean__of_yojson "isDefault") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     protocols = option_of_yojson (value_for_key string_list_of_yojson "protocols") _list path;
     ciphers = option_of_yojson (value_for_key string_list_of_yojson "ciphers") _list path;
   }
    : load_balancer_tls_policy)

let load_balancer_tls_policy_list_of_yojson tree path =
  list_of_yojson load_balancer_tls_policy_of_yojson tree path

let get_load_balancer_tls_policies_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tls_policies =
       option_of_yojson
         (value_for_key load_balancer_tls_policy_list_of_yojson "tlsPolicies")
         _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_load_balancer_tls_policies_result)

let get_load_balancer_tls_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_load_balancer_tls_policies_request)

let load_balancer_list_of_yojson tree path = list_of_yojson load_balancer_of_yojson tree path

let get_load_balancers_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     load_balancers =
       option_of_yojson (value_for_key load_balancer_list_of_yojson "loadBalancers") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_load_balancers_result)

let get_load_balancers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_load_balancers_request)

let get_operation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : get_operation_result)

let get_operation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation_id = value_for_key non_empty_string_of_yojson "operationId" _list path }
    : get_operation_request)

let get_operations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_operations_result)

let get_operations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_operations_request)

let get_operations_for_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
     next_page_count = option_of_yojson (value_for_key string__of_yojson "nextPageCount") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_operations_for_resource_result)

let get_operations_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = value_for_key resource_name_of_yojson "resourceName" _list path;
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
   }
    : get_operations_for_resource_request)

let region_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     continent_code = option_of_yojson (value_for_key string__of_yojson "continentCode") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     display_name = option_of_yojson (value_for_key string__of_yojson "displayName") _list path;
     name = option_of_yojson (value_for_key region_name_of_yojson "name") _list path;
     availability_zones =
       option_of_yojson
         (value_for_key availability_zone_list_of_yojson "availabilityZones")
         _list path;
     relational_database_availability_zones =
       option_of_yojson
         (value_for_key availability_zone_list_of_yojson "relationalDatabaseAvailabilityZones")
         _list path;
   }
    : region)

let region_list_of_yojson tree path = list_of_yojson region_of_yojson tree path

let get_regions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ regions = option_of_yojson (value_for_key region_list_of_yojson "regions") _list path }
    : get_regions_result)

let get_regions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_availability_zones =
       option_of_yojson (value_for_key boolean__of_yojson "includeAvailabilityZones") _list path;
     include_relational_database_availability_zones =
       option_of_yojson
         (value_for_key boolean__of_yojson "includeRelationalDatabaseAvailabilityZones")
         _list path;
   }
    : get_regions_request)

let pending_maintenance_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = option_of_yojson (value_for_key non_empty_string_of_yojson "action") _list path;
     description =
       option_of_yojson (value_for_key non_empty_string_of_yojson "description") _list path;
     current_apply_date =
       option_of_yojson (value_for_key iso_date_of_yojson "currentApplyDate") _list path;
   }
    : pending_maintenance_action)

let pending_maintenance_action_list_of_yojson tree path =
  list_of_yojson pending_maintenance_action_of_yojson tree path

let relational_database_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port = option_of_yojson (value_for_key integer_of_yojson "port") _list path;
     address = option_of_yojson (value_for_key non_empty_string_of_yojson "address") _list path;
   }
    : relational_database_endpoint)

let pending_modified_relational_database_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     master_user_password =
       option_of_yojson (value_for_key string__of_yojson "masterUserPassword") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "engineVersion") _list path;
     backup_retention_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "backupRetentionEnabled") _list path;
   }
    : pending_modified_relational_database_values)

let relational_database_hardware_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cpu_count = option_of_yojson (value_for_key integer_of_yojson "cpuCount") _list path;
     disk_size_in_gb = option_of_yojson (value_for_key integer_of_yojson "diskSizeInGb") _list path;
     ram_size_in_gb = option_of_yojson (value_for_key float__of_yojson "ramSizeInGb") _list path;
   }
    : relational_database_hardware)

let relational_database_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     relational_database_blueprint_id =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "relationalDatabaseBlueprintId")
         _list path;
     relational_database_bundle_id =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "relationalDatabaseBundleId")
         _list path;
     master_database_name =
       option_of_yojson (value_for_key string__of_yojson "masterDatabaseName") _list path;
     hardware =
       option_of_yojson (value_for_key relational_database_hardware_of_yojson "hardware") _list path;
     state = option_of_yojson (value_for_key non_empty_string_of_yojson "state") _list path;
     secondary_availability_zone =
       option_of_yojson (value_for_key string__of_yojson "secondaryAvailabilityZone") _list path;
     backup_retention_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "backupRetentionEnabled") _list path;
     pending_modified_values =
       option_of_yojson
         (value_for_key pending_modified_relational_database_values_of_yojson
            "pendingModifiedValues")
         _list path;
     engine = option_of_yojson (value_for_key non_empty_string_of_yojson "engine") _list path;
     engine_version =
       option_of_yojson (value_for_key non_empty_string_of_yojson "engineVersion") _list path;
     latest_restorable_time =
       option_of_yojson (value_for_key iso_date_of_yojson "latestRestorableTime") _list path;
     master_username =
       option_of_yojson (value_for_key non_empty_string_of_yojson "masterUsername") _list path;
     parameter_apply_status =
       option_of_yojson (value_for_key non_empty_string_of_yojson "parameterApplyStatus") _list path;
     preferred_backup_window =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "preferredBackupWindow")
         _list path;
     preferred_maintenance_window =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "preferredMaintenanceWindow")
         _list path;
     publicly_accessible =
       option_of_yojson (value_for_key boolean__of_yojson "publiclyAccessible") _list path;
     master_endpoint =
       option_of_yojson
         (value_for_key relational_database_endpoint_of_yojson "masterEndpoint")
         _list path;
     pending_maintenance_actions =
       option_of_yojson
         (value_for_key pending_maintenance_action_list_of_yojson "pendingMaintenanceActions")
         _list path;
     ca_certificate_identifier =
       option_of_yojson (value_for_key string__of_yojson "caCertificateIdentifier") _list path;
   }
    : relational_database)

let get_relational_database_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database =
       option_of_yojson
         (value_for_key relational_database_of_yojson "relationalDatabase")
         _list path;
   }
    : get_relational_database_result)

let get_relational_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
   }
    : get_relational_database_request)

let relational_database_engine_of_yojson (tree : t) path =
  ((match tree with
    | `String "mysql" -> MYSQL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RelationalDatabaseEngine" value)
    | _ -> raise (deserialize_wrong_type_error path "RelationalDatabaseEngine")
     : relational_database_engine)
    : relational_database_engine)

let relational_database_blueprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blueprint_id = option_of_yojson (value_for_key string__of_yojson "blueprintId") _list path;
     engine =
       option_of_yojson (value_for_key relational_database_engine_of_yojson "engine") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "engineVersion") _list path;
     engine_description =
       option_of_yojson (value_for_key string__of_yojson "engineDescription") _list path;
     engine_version_description =
       option_of_yojson (value_for_key string__of_yojson "engineVersionDescription") _list path;
     is_engine_default =
       option_of_yojson (value_for_key boolean__of_yojson "isEngineDefault") _list path;
   }
    : relational_database_blueprint)

let relational_database_blueprint_list_of_yojson tree path =
  list_of_yojson relational_database_blueprint_of_yojson tree path

let get_relational_database_blueprints_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blueprints =
       option_of_yojson
         (value_for_key relational_database_blueprint_list_of_yojson "blueprints")
         _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_relational_database_blueprints_result)

let get_relational_database_blueprints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_relational_database_blueprints_request)

let relational_database_bundle_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bundle_id = option_of_yojson (value_for_key string__of_yojson "bundleId") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
     price = option_of_yojson (value_for_key float__of_yojson "price") _list path;
     ram_size_in_gb = option_of_yojson (value_for_key float__of_yojson "ramSizeInGb") _list path;
     disk_size_in_gb = option_of_yojson (value_for_key integer_of_yojson "diskSizeInGb") _list path;
     transfer_per_month_in_gb =
       option_of_yojson (value_for_key integer_of_yojson "transferPerMonthInGb") _list path;
     cpu_count = option_of_yojson (value_for_key integer_of_yojson "cpuCount") _list path;
     is_encrypted = option_of_yojson (value_for_key boolean__of_yojson "isEncrypted") _list path;
     is_active = option_of_yojson (value_for_key boolean__of_yojson "isActive") _list path;
   }
    : relational_database_bundle)

let relational_database_bundle_list_of_yojson tree path =
  list_of_yojson relational_database_bundle_of_yojson tree path

let get_relational_database_bundles_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bundles =
       option_of_yojson
         (value_for_key relational_database_bundle_list_of_yojson "bundles")
         _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_relational_database_bundles_result)

let get_relational_database_bundles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
     include_inactive =
       option_of_yojson (value_for_key boolean__of_yojson "includeInactive") _list path;
   }
    : get_relational_database_bundles_request)

let relational_database_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource = option_of_yojson (value_for_key resource_name_of_yojson "resource") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     event_categories =
       option_of_yojson (value_for_key string_list_of_yojson "eventCategories") _list path;
   }
    : relational_database_event)

let relational_database_event_list_of_yojson tree path =
  list_of_yojson relational_database_event_of_yojson tree path

let get_relational_database_events_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_events =
       option_of_yojson
         (value_for_key relational_database_event_list_of_yojson "relationalDatabaseEvents")
         _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_relational_database_events_result)

let get_relational_database_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     duration_in_minutes =
       option_of_yojson (value_for_key integer_of_yojson "durationInMinutes") _list path;
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
   }
    : get_relational_database_events_request)

let log_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : log_event)

let log_event_list_of_yojson tree path = list_of_yojson log_event_of_yojson tree path

let get_relational_database_log_events_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_log_events =
       option_of_yojson (value_for_key log_event_list_of_yojson "resourceLogEvents") _list path;
     next_backward_token =
       option_of_yojson (value_for_key string__of_yojson "nextBackwardToken") _list path;
     next_forward_token =
       option_of_yojson (value_for_key string__of_yojson "nextForwardToken") _list path;
   }
    : get_relational_database_log_events_result)

let get_relational_database_log_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     log_stream_name = value_for_key string__of_yojson "logStreamName" _list path;
     start_time = option_of_yojson (value_for_key iso_date_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key iso_date_of_yojson "endTime") _list path;
     start_from_head =
       option_of_yojson (value_for_key boolean__of_yojson "startFromHead") _list path;
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
   }
    : get_relational_database_log_events_request)

let get_relational_database_log_streams_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ log_streams = option_of_yojson (value_for_key string_list_of_yojson "logStreams") _list path }
    : get_relational_database_log_streams_result)

let get_relational_database_log_streams_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
   }
    : get_relational_database_log_streams_request)

let get_relational_database_master_user_password_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     master_user_password =
       option_of_yojson (value_for_key sensitive_string_of_yojson "masterUserPassword") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
   }
    : get_relational_database_master_user_password_result)

let relational_database_password_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "CURRENT" -> CURRENT
    | `String "PREVIOUS" -> PREVIOUS
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RelationalDatabasePasswordVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "RelationalDatabasePasswordVersion")
     : relational_database_password_version)
    : relational_database_password_version)

let get_relational_database_master_user_password_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     password_version =
       option_of_yojson
         (value_for_key relational_database_password_version_of_yojson "passwordVersion")
         _list path;
   }
    : get_relational_database_master_user_password_request)

let relational_database_metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CPUUtilization" -> CPUUtilization
    | `String "DatabaseConnections" -> DatabaseConnections
    | `String "DiskQueueDepth" -> DiskQueueDepth
    | `String "FreeStorageSpace" -> FreeStorageSpace
    | `String "NetworkReceiveThroughput" -> NetworkReceiveThroughput
    | `String "NetworkTransmitThroughput" -> NetworkTransmitThroughput
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RelationalDatabaseMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "RelationalDatabaseMetricName")
     : relational_database_metric_name)
    : relational_database_metric_name)

let get_relational_database_metric_data_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name =
       option_of_yojson
         (value_for_key relational_database_metric_name_of_yojson "metricName")
         _list path;
     metric_data =
       option_of_yojson (value_for_key metric_datapoint_list_of_yojson "metricData") _list path;
   }
    : get_relational_database_metric_data_result)

let get_relational_database_metric_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     metric_name = value_for_key relational_database_metric_name_of_yojson "metricName" _list path;
     period = value_for_key metric_period_of_yojson "period" _list path;
     start_time = value_for_key iso_date_of_yojson "startTime" _list path;
     end_time = value_for_key iso_date_of_yojson "endTime" _list path;
     unit_ = value_for_key metric_unit_of_yojson "unit" _list path;
     statistics = value_for_key metric_statistic_list_of_yojson "statistics" _list path;
   }
    : get_relational_database_metric_data_request)

let relational_database_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allowed_values = option_of_yojson (value_for_key string__of_yojson "allowedValues") _list path;
     apply_method = option_of_yojson (value_for_key string__of_yojson "applyMethod") _list path;
     apply_type = option_of_yojson (value_for_key string__of_yojson "applyType") _list path;
     data_type = option_of_yojson (value_for_key string__of_yojson "dataType") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     is_modifiable = option_of_yojson (value_for_key boolean__of_yojson "isModifiable") _list path;
     parameter_name = option_of_yojson (value_for_key string__of_yojson "parameterName") _list path;
     parameter_value =
       option_of_yojson (value_for_key string__of_yojson "parameterValue") _list path;
   }
    : relational_database_parameter)

let relational_database_parameter_list_of_yojson tree path =
  list_of_yojson relational_database_parameter_of_yojson tree path

let get_relational_database_parameters_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters =
       option_of_yojson
         (value_for_key relational_database_parameter_list_of_yojson "parameters")
         _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_relational_database_parameters_result)

let get_relational_database_parameters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path;
   }
    : get_relational_database_parameters_request)

let relational_database_snapshot_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     engine = option_of_yojson (value_for_key non_empty_string_of_yojson "engine") _list path;
     engine_version =
       option_of_yojson (value_for_key non_empty_string_of_yojson "engineVersion") _list path;
     size_in_gb = option_of_yojson (value_for_key integer_of_yojson "sizeInGb") _list path;
     state = option_of_yojson (value_for_key non_empty_string_of_yojson "state") _list path;
     from_relational_database_name =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "fromRelationalDatabaseName")
         _list path;
     from_relational_database_arn =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "fromRelationalDatabaseArn")
         _list path;
     from_relational_database_bundle_id =
       option_of_yojson
         (value_for_key string__of_yojson "fromRelationalDatabaseBundleId")
         _list path;
     from_relational_database_blueprint_id =
       option_of_yojson
         (value_for_key string__of_yojson "fromRelationalDatabaseBlueprintId")
         _list path;
   }
    : relational_database_snapshot)

let get_relational_database_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_snapshot =
       option_of_yojson
         (value_for_key relational_database_snapshot_of_yojson "relationalDatabaseSnapshot")
         _list path;
   }
    : get_relational_database_snapshot_result)

let get_relational_database_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_snapshot_name =
       value_for_key resource_name_of_yojson "relationalDatabaseSnapshotName" _list path;
   }
    : get_relational_database_snapshot_request)

let relational_database_snapshot_list_of_yojson tree path =
  list_of_yojson relational_database_snapshot_of_yojson tree path

let get_relational_database_snapshots_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_snapshots =
       option_of_yojson
         (value_for_key relational_database_snapshot_list_of_yojson "relationalDatabaseSnapshots")
         _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_relational_database_snapshots_result)

let get_relational_database_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_relational_database_snapshots_request)

let relational_database_list_of_yojson tree path =
  list_of_yojson relational_database_of_yojson tree path

let get_relational_databases_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_databases =
       option_of_yojson
         (value_for_key relational_database_list_of_yojson "relationalDatabases")
         _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_relational_databases_result)

let get_relational_databases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_relational_databases_request)

let setup_history_page_token_of_yojson = string_of_yojson

let setup_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "succeeded" -> Succeeded
    | `String "failed" -> Failed
    | `String "inProgress" -> InProgress
    | `String value -> raise (deserialize_unknown_enum_value_error path "SetupStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SetupStatus")
     : setup_status)
    : setup_status)

let setup_execution_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command = option_of_yojson (value_for_key string__of_yojson "command") _list path;
     date_time = option_of_yojson (value_for_key iso_date_of_yojson "dateTime") _list path;
     name = option_of_yojson (value_for_key non_empty_string_of_yojson "name") _list path;
     status = option_of_yojson (value_for_key setup_status_of_yojson "status") _list path;
     standard_error = option_of_yojson (value_for_key string__of_yojson "standardError") _list path;
     standard_output =
       option_of_yojson (value_for_key string__of_yojson "standardOutput") _list path;
     version = option_of_yojson (value_for_key string__of_yojson "version") _list path;
   }
    : setup_execution_details)

let setup_execution_details_list_of_yojson tree path =
  list_of_yojson setup_execution_details_of_yojson tree path

let setup_history_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
   }
    : setup_history_resource)

let setup_domain_name_of_yojson = string_of_yojson

let setup_domain_name_list_of_yojson tree path =
  list_of_yojson setup_domain_name_of_yojson tree path

let setup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_name =
       option_of_yojson (value_for_key resource_name_of_yojson "instanceName") _list path;
     domain_names =
       option_of_yojson (value_for_key setup_domain_name_list_of_yojson "domainNames") _list path;
     certificate_provider =
       option_of_yojson
         (value_for_key certificate_provider_of_yojson "certificateProvider")
         _list path;
   }
    : setup_request)

let setup_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "operationId") _list path;
     request = option_of_yojson (value_for_key setup_request_of_yojson "request") _list path;
     resource =
       option_of_yojson (value_for_key setup_history_resource_of_yojson "resource") _list path;
     execution_details =
       option_of_yojson
         (value_for_key setup_execution_details_list_of_yojson "executionDetails")
         _list path;
     status = option_of_yojson (value_for_key setup_status_of_yojson "status") _list path;
   }
    : setup_history)

let setup_history_list_of_yojson tree path = list_of_yojson setup_history_of_yojson tree path

let get_setup_history_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     setup_history =
       option_of_yojson (value_for_key setup_history_list_of_yojson "setupHistory") _list path;
     next_page_token =
       option_of_yojson
         (value_for_key setup_history_page_token_of_yojson "nextPageToken")
         _list path;
   }
    : get_setup_history_result)

let get_setup_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = value_for_key resource_name_of_yojson "resourceName" _list path;
     page_token =
       option_of_yojson (value_for_key setup_history_page_token_of_yojson "pageToken") _list path;
   }
    : get_setup_history_request)

let static_ip_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key non_empty_string_of_yojson "arn") _list path;
     support_code = option_of_yojson (value_for_key string__of_yojson "supportCode") _list path;
     created_at = option_of_yojson (value_for_key iso_date_of_yojson "createdAt") _list path;
     location = option_of_yojson (value_for_key resource_location_of_yojson "location") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "ipAddress") _list path;
     attached_to = option_of_yojson (value_for_key resource_name_of_yojson "attachedTo") _list path;
     is_attached = option_of_yojson (value_for_key boolean__of_yojson "isAttached") _list path;
   }
    : static_ip)

let get_static_ip_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ static_ip = option_of_yojson (value_for_key static_ip_of_yojson "staticIp") _list path }
    : get_static_ip_result)

let get_static_ip_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ static_ip_name = value_for_key resource_name_of_yojson "staticIpName" _list path }
    : get_static_ip_request)

let static_ip_list_of_yojson tree path = list_of_yojson static_ip_of_yojson tree path

let get_static_ips_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     static_ips = option_of_yojson (value_for_key static_ip_list_of_yojson "staticIps") _list path;
     next_page_token = option_of_yojson (value_for_key string__of_yojson "nextPageToken") _list path;
   }
    : get_static_ips_result)

let get_static_ips_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_token = option_of_yojson (value_for_key string__of_yojson "pageToken") _list path }
    : get_static_ips_request)

let import_key_pair_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : import_key_pair_result)

let import_key_pair_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_pair_name = value_for_key resource_name_of_yojson "keyPairName" _list path;
     public_key_base64 = value_for_key base64_of_yojson "publicKeyBase64" _list path;
   }
    : import_key_pair_request)

let is_vpc_peered_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ is_peered = option_of_yojson (value_for_key boolean__of_yojson "isPeered") _list path }
    : is_vpc_peered_result)

let is_vpc_peered_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_relational_database_parameters_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : update_relational_database_parameters_result)

let update_relational_database_parameters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     parameters = value_for_key relational_database_parameter_list_of_yojson "parameters" _list path;
   }
    : update_relational_database_parameters_request)

let update_relational_database_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : update_relational_database_result)

let update_relational_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     master_user_password =
       option_of_yojson (value_for_key sensitive_string_of_yojson "masterUserPassword") _list path;
     rotate_master_user_password =
       option_of_yojson (value_for_key boolean__of_yojson "rotateMasterUserPassword") _list path;
     preferred_backup_window =
       option_of_yojson (value_for_key string__of_yojson "preferredBackupWindow") _list path;
     preferred_maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "preferredMaintenanceWindow") _list path;
     enable_backup_retention =
       option_of_yojson (value_for_key boolean__of_yojson "enableBackupRetention") _list path;
     disable_backup_retention =
       option_of_yojson (value_for_key boolean__of_yojson "disableBackupRetention") _list path;
     publicly_accessible =
       option_of_yojson (value_for_key boolean__of_yojson "publiclyAccessible") _list path;
     apply_immediately =
       option_of_yojson (value_for_key boolean__of_yojson "applyImmediately") _list path;
     ca_certificate_identifier =
       option_of_yojson (value_for_key string__of_yojson "caCertificateIdentifier") _list path;
     relational_database_blueprint_id =
       option_of_yojson (value_for_key string__of_yojson "relationalDatabaseBlueprintId") _list path;
   }
    : update_relational_database_request)

let update_load_balancer_attribute_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : update_load_balancer_attribute_result)

let update_load_balancer_attribute_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     load_balancer_name = value_for_key resource_name_of_yojson "loadBalancerName" _list path;
     attribute_name =
       value_for_key load_balancer_attribute_name_of_yojson "attributeName" _list path;
     attribute_value = value_for_key string_max256_of_yojson "attributeValue" _list path;
   }
    : update_load_balancer_attribute_request)

let update_instance_metadata_options_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : update_instance_metadata_options_result)

let update_instance_metadata_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
     http_tokens = option_of_yojson (value_for_key http_tokens_of_yojson "httpTokens") _list path;
     http_endpoint =
       option_of_yojson (value_for_key http_endpoint_of_yojson "httpEndpoint") _list path;
     http_put_response_hop_limit =
       option_of_yojson (value_for_key integer_of_yojson "httpPutResponseHopLimit") _list path;
     http_protocol_ipv6 =
       option_of_yojson (value_for_key http_protocol_ipv6_of_yojson "httpProtocolIpv6") _list path;
   }
    : update_instance_metadata_options_request)

let update_domain_entry_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : update_domain_entry_result)

let update_domain_entry_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "domainName" _list path;
     domain_entry = value_for_key domain_entry_of_yojson "domainEntry" _list path;
   }
    : update_domain_entry_request)

let update_distribution_bundle_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : update_distribution_bundle_result)

let update_distribution_bundle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     distribution_name =
       option_of_yojson (value_for_key resource_name_of_yojson "distributionName") _list path;
     bundle_id = option_of_yojson (value_for_key string__of_yojson "bundleId") _list path;
   }
    : update_distribution_bundle_request)

let update_distribution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : update_distribution_result)

let update_distribution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     distribution_name = value_for_key resource_name_of_yojson "distributionName" _list path;
     origin = option_of_yojson (value_for_key input_origin_of_yojson "origin") _list path;
     default_cache_behavior =
       option_of_yojson (value_for_key cache_behavior_of_yojson "defaultCacheBehavior") _list path;
     cache_behavior_settings =
       option_of_yojson (value_for_key cache_settings_of_yojson "cacheBehaviorSettings") _list path;
     cache_behaviors =
       option_of_yojson (value_for_key cache_behavior_list_of_yojson "cacheBehaviors") _list path;
     is_enabled = option_of_yojson (value_for_key boolean__of_yojson "isEnabled") _list path;
     viewer_minimum_tls_protocol_version =
       option_of_yojson
         (value_for_key viewer_minimum_tls_protocol_version_enum_of_yojson
            "viewerMinimumTlsProtocolVersion")
         _list path;
     certificate_name =
       option_of_yojson (value_for_key resource_name_of_yojson "certificateName") _list path;
     use_default_certificate =
       option_of_yojson (value_for_key boolean__of_yojson "useDefaultCertificate") _list path;
   }
    : update_distribution_request)

let update_container_service_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_service =
       option_of_yojson (value_for_key container_service_of_yojson "containerService") _list path;
   }
    : update_container_service_result)

let update_container_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = value_for_key container_service_name_of_yojson "serviceName" _list path;
     power =
       option_of_yojson (value_for_key container_service_power_name_of_yojson "power") _list path;
     scale = option_of_yojson (value_for_key container_service_scale_of_yojson "scale") _list path;
     is_disabled = option_of_yojson (value_for_key boolean__of_yojson "isDisabled") _list path;
     public_domain_names =
       option_of_yojson
         (value_for_key container_service_public_domains_of_yojson "publicDomainNames")
         _list path;
     private_registry_access =
       option_of_yojson
         (value_for_key private_registry_access_request_of_yojson "privateRegistryAccess")
         _list path;
   }
    : update_container_service_request)

let update_bucket_bundle_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : update_bucket_bundle_result)

let update_bucket_bundle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = value_for_key bucket_name_of_yojson "bucketName" _list path;
     bundle_id = value_for_key non_empty_string_of_yojson "bundleId" _list path;
   }
    : update_bucket_bundle_request)

let update_bucket_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket = option_of_yojson (value_for_key bucket_of_yojson "bucket") _list path;
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : update_bucket_result)

let update_bucket_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = value_for_key bucket_name_of_yojson "bucketName" _list path;
     access_rules = option_of_yojson (value_for_key access_rules_of_yojson "accessRules") _list path;
     versioning =
       option_of_yojson (value_for_key non_empty_string_of_yojson "versioning") _list path;
     readonly_access_accounts =
       option_of_yojson
         (value_for_key partner_id_list_of_yojson "readonlyAccessAccounts")
         _list path;
     access_log_config =
       option_of_yojson
         (value_for_key bucket_access_log_config_of_yojson "accessLogConfig")
         _list path;
     cors = option_of_yojson (value_for_key bucket_cors_config_of_yojson "cors") _list path;
   }
    : update_bucket_request)

let untag_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : untag_resource_result)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = value_for_key resource_name_of_yojson "resourceName" _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
   }
    : untag_resource_request)

let unpeer_vpc_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : unpeer_vpc_result)

let unpeer_vpc_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let test_alarm_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : test_alarm_result)

let test_alarm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alarm_name = value_for_key resource_name_of_yojson "alarmName" _list path;
     state = value_for_key alarm_state_of_yojson "state" _list path;
   }
    : test_alarm_request)

let tag_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : tag_resource_result)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = value_for_key resource_name_of_yojson "resourceName" _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
     tags = value_for_key tag_list_of_yojson "tags" _list path;
   }
    : tag_resource_request)

let stop_relational_database_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : stop_relational_database_result)

let stop_relational_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
     relational_database_snapshot_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "relationalDatabaseSnapshotName")
         _list path;
   }
    : stop_relational_database_request)

let stop_instance_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : stop_instance_result)

let stop_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
     force = option_of_yojson (value_for_key boolean__of_yojson "force") _list path;
   }
    : stop_instance_request)

let stop_gui_session_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : stop_gui_session_result)

let stop_gui_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_name = value_for_key resource_name_of_yojson "resourceName" _list path }
    : stop_gui_session_request)

let start_relational_database_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : start_relational_database_result)

let start_relational_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
   }
    : start_relational_database_request)

let start_instance_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : start_instance_result)

let start_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_name = value_for_key resource_name_of_yojson "instanceName" _list path }
    : start_instance_request)

let start_gui_session_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : start_gui_session_result)

let start_gui_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_name = value_for_key resource_name_of_yojson "resourceName" _list path }
    : start_gui_session_request)

let setup_instance_https_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : setup_instance_https_result)

let setup_instance_https_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
     email_address = value_for_key email_address_of_yojson "emailAddress" _list path;
     domain_names = value_for_key setup_domain_name_list_of_yojson "domainNames" _list path;
     certificate_provider =
       value_for_key certificate_provider_of_yojson "certificateProvider" _list path;
   }
    : setup_instance_https_request)

let set_resource_access_for_bucket_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : set_resource_access_for_bucket_result)

let resource_bucket_access_of_yojson (tree : t) path =
  ((match tree with
    | `String "allow" -> Allow
    | `String "deny" -> Deny
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceBucketAccess" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceBucketAccess")
     : resource_bucket_access)
    : resource_bucket_access)

let set_resource_access_for_bucket_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = value_for_key resource_name_of_yojson "resourceName" _list path;
     bucket_name = value_for_key bucket_name_of_yojson "bucketName" _list path;
     access = value_for_key resource_bucket_access_of_yojson "access" _list path;
   }
    : set_resource_access_for_bucket_request)

let set_ip_address_type_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : set_ip_address_type_result)

let set_ip_address_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     resource_name = value_for_key resource_name_of_yojson "resourceName" _list path;
     ip_address_type = value_for_key ip_address_type_of_yojson "ipAddressType" _list path;
     accept_bundle_update =
       option_of_yojson (value_for_key boolean__of_yojson "acceptBundleUpdate") _list path;
   }
    : set_ip_address_type_request)

let send_contact_method_verification_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : send_contact_method_verification_result)

let send_contact_method_verification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ protocol = value_for_key contact_method_verification_protocol_of_yojson "protocol" _list path }
    : send_contact_method_verification_request)

let reset_distribution_cache_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     create_time = option_of_yojson (value_for_key iso_date_of_yojson "createTime") _list path;
     operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path;
   }
    : reset_distribution_cache_result)

let reset_distribution_cache_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     distribution_name =
       option_of_yojson (value_for_key resource_name_of_yojson "distributionName") _list path;
   }
    : reset_distribution_cache_request)

let release_static_ip_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : release_static_ip_result)

let release_static_ip_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ static_ip_name = value_for_key resource_name_of_yojson "staticIpName" _list path }
    : release_static_ip_request)

let register_container_image_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_image =
       option_of_yojson (value_for_key container_image_of_yojson "containerImage") _list path;
   }
    : register_container_image_result)

let register_container_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = value_for_key container_service_name_of_yojson "serviceName" _list path;
     label = value_for_key container_label_of_yojson "label" _list path;
     digest = value_for_key string__of_yojson "digest" _list path;
   }
    : register_container_image_request)

let reboot_relational_database_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : reboot_relational_database_result)

let reboot_relational_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relational_database_name =
       value_for_key resource_name_of_yojson "relationalDatabaseName" _list path;
   }
    : reboot_relational_database_request)

let reboot_instance_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : reboot_instance_result)

let reboot_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_name = value_for_key resource_name_of_yojson "instanceName" _list path }
    : reboot_instance_request)

let put_instance_public_ports_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : put_instance_public_ports_result)

let port_info_list_of_yojson tree path = list_of_yojson port_info_of_yojson tree path

let put_instance_public_ports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port_infos = value_for_key port_info_list_of_yojson "portInfos" _list path;
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
   }
    : put_instance_public_ports_request)

let put_alarm_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operations = option_of_yojson (value_for_key operation_list_of_yojson "operations") _list path;
   }
    : put_alarm_result)

let put_alarm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alarm_name = value_for_key resource_name_of_yojson "alarmName" _list path;
     metric_name = value_for_key metric_name_of_yojson "metricName" _list path;
     monitored_resource_name =
       value_for_key resource_name_of_yojson "monitoredResourceName" _list path;
     comparison_operator =
       value_for_key comparison_operator_of_yojson "comparisonOperator" _list path;
     threshold = value_for_key double_of_yojson "threshold" _list path;
     evaluation_periods = value_for_key integer_of_yojson "evaluationPeriods" _list path;
     datapoints_to_alarm =
       option_of_yojson (value_for_key integer_of_yojson "datapointsToAlarm") _list path;
     treat_missing_data =
       option_of_yojson (value_for_key treat_missing_data_of_yojson "treatMissingData") _list path;
     contact_protocols =
       option_of_yojson
         (value_for_key contact_protocols_list_of_yojson "contactProtocols")
         _list path;
     notification_triggers =
       option_of_yojson
         (value_for_key notification_trigger_list_of_yojson "notificationTriggers")
         _list path;
     notification_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "notificationEnabled") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : put_alarm_request)

let peer_vpc_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : peer_vpc_result)

let peer_vpc_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let open_instance_public_ports_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ operation = option_of_yojson (value_for_key operation_of_yojson "operation") _list path }
    : open_instance_public_ports_result)

let open_instance_public_ports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port_info = value_for_key port_info_of_yojson "portInfo" _list path;
     instance_name = value_for_key resource_name_of_yojson "instanceName" _list path;
   }
    : open_instance_public_ports_request)
