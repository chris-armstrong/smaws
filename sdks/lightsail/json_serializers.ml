open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson string__to_yojson x.code);
      ("docs", option_to_yojson string__to_yojson x.docs);
      ("message", option_to_yojson string__to_yojson x.message);
      ("tip", option_to_yojson string__to_yojson x.tip);
    ]

let access_direction_to_yojson (x : access_direction) =
  match x with Inbound -> `String "inbound" | Outbound -> `String "outbound"

let iso_date_to_yojson = timestamp_epoch_seconds_to_yojson

let access_key_last_used_to_yojson (x : access_key_last_used) =
  assoc_to_yojson
    [
      ("lastUsedDate", option_to_yojson iso_date_to_yojson x.last_used_date);
      ("region", option_to_yojson string__to_yojson x.region);
      ("serviceName", option_to_yojson string__to_yojson x.service_name);
    ]

let status_type_to_yojson (x : status_type) =
  match x with Active -> `String "Active" | Inactive -> `String "Inactive"

let non_empty_string_to_yojson = string_to_yojson
let iam_access_key_id_to_yojson = string_to_yojson

let access_key_to_yojson (x : access_key) =
  assoc_to_yojson
    [
      ("accessKeyId", option_to_yojson iam_access_key_id_to_yojson x.access_key_id);
      ("secretAccessKey", option_to_yojson non_empty_string_to_yojson x.secret_access_key);
      ("status", option_to_yojson status_type_to_yojson x.status);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("lastUsed", option_to_yojson access_key_last_used_to_yojson x.last_used);
    ]

let access_key_list_to_yojson tree = list_to_yojson access_key_to_yojson tree

let resource_receiving_access_to_yojson (x : resource_receiving_access) =
  assoc_to_yojson
    [
      ("name", option_to_yojson non_empty_string_to_yojson x.name);
      ("resourceType", option_to_yojson non_empty_string_to_yojson x.resource_type);
    ]

let access_receiver_list_to_yojson tree = list_to_yojson resource_receiving_access_to_yojson tree
let boolean__to_yojson = bool_to_yojson

let access_type_to_yojson (x : access_type) =
  match x with Public -> `String "public" | Private -> `String "private"

let access_rules_to_yojson (x : access_rules) =
  assoc_to_yojson
    [
      ("getObject", option_to_yojson access_type_to_yojson x.get_object);
      ("allowPublicOverrides", option_to_yojson boolean__to_yojson x.allow_public_overrides);
    ]

let bpa_status_message_to_yojson (x : bpa_status_message) =
  match x with
  | DEFAULTED_FOR_SLR_MISSING -> `String "DEFAULTED_FOR_SLR_MISSING"
  | SYNC_ON_HOLD -> `String "SYNC_ON_HOLD"
  | DEFAULTED_FOR_SLR_MISSING_ON_HOLD -> `String "DEFAULTED_FOR_SLR_MISSING_ON_HOLD"
  | Unknown -> `String "Unknown"

let account_level_bpa_sync_status_to_yojson (x : account_level_bpa_sync_status) =
  match x with
  | InSync -> `String "InSync"
  | Failed -> `String "Failed"
  | NeverSynced -> `String "NeverSynced"
  | Defaulted -> `String "Defaulted"

let account_level_bpa_sync_to_yojson (x : account_level_bpa_sync) =
  assoc_to_yojson
    [
      ("status", option_to_yojson account_level_bpa_sync_status_to_yojson x.status);
      ("lastSyncedAt", option_to_yojson iso_date_to_yojson x.last_synced_at);
      ("message", option_to_yojson bpa_status_message_to_yojson x.message);
      ("bpaImpactsLightsail", option_to_yojson boolean__to_yojson x.bpa_impacts_lightsail);
    ]

let account_setup_in_progress_exception_to_yojson (x : account_setup_in_progress_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson string__to_yojson x.code);
      ("docs", option_to_yojson string__to_yojson x.docs);
      ("message", option_to_yojson string__to_yojson x.message);
      ("tip", option_to_yojson string__to_yojson x.tip);
    ]

let time_of_day_to_yojson = string_to_yojson

let add_on_to_yojson (x : add_on) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("status", option_to_yojson string__to_yojson x.status);
      ("snapshotTimeOfDay", option_to_yojson time_of_day_to_yojson x.snapshot_time_of_day);
      ("nextSnapshotTimeOfDay", option_to_yojson time_of_day_to_yojson x.next_snapshot_time_of_day);
      ("threshold", option_to_yojson string__to_yojson x.threshold);
      ("duration", option_to_yojson string__to_yojson x.duration);
    ]

let add_on_list_to_yojson tree = list_to_yojson add_on_to_yojson tree

let stop_instance_on_idle_request_to_yojson (x : stop_instance_on_idle_request) =
  assoc_to_yojson
    [
      ("threshold", option_to_yojson string__to_yojson x.threshold);
      ("duration", option_to_yojson string__to_yojson x.duration);
    ]

let auto_snapshot_add_on_request_to_yojson (x : auto_snapshot_add_on_request) =
  assoc_to_yojson
    [ ("snapshotTimeOfDay", option_to_yojson time_of_day_to_yojson x.snapshot_time_of_day) ]

let add_on_type_to_yojson (x : add_on_type) =
  match x with
  | AutoSnapshot -> `String "AutoSnapshot"
  | StopInstanceOnIdle -> `String "StopInstanceOnIdle"

let add_on_request_to_yojson (x : add_on_request) =
  assoc_to_yojson
    [
      ("addOnType", Some (add_on_type_to_yojson x.add_on_type));
      ( "autoSnapshotAddOnRequest",
        option_to_yojson auto_snapshot_add_on_request_to_yojson x.auto_snapshot_add_on_request );
      ( "stopInstanceOnIdleRequest",
        option_to_yojson stop_instance_on_idle_request_to_yojson x.stop_instance_on_idle_request );
    ]

let add_on_request_list_to_yojson tree = list_to_yojson add_on_request_to_yojson tree
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("key", option_to_yojson tag_key_to_yojson x.key);
      ("value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let alarm_state_to_yojson (x : alarm_state) =
  match x with
  | OK -> `String "OK"
  | ALARM -> `String "ALARM"
  | INSUFFICIENT_DATA -> `String "INSUFFICIENT_DATA"

let notification_trigger_list_to_yojson tree = list_to_yojson alarm_state_to_yojson tree

let contact_protocol_to_yojson (x : contact_protocol) =
  match x with Email -> `String "Email" | SMS -> `String "SMS"

let contact_protocols_list_to_yojson tree = list_to_yojson contact_protocol_to_yojson tree

let metric_unit_to_yojson (x : metric_unit) =
  match x with
  | Seconds -> `String "Seconds"
  | Microseconds -> `String "Microseconds"
  | Milliseconds -> `String "Milliseconds"
  | Bytes -> `String "Bytes"
  | Kilobytes -> `String "Kilobytes"
  | Megabytes -> `String "Megabytes"
  | Gigabytes -> `String "Gigabytes"
  | Terabytes -> `String "Terabytes"
  | Bits -> `String "Bits"
  | Kilobits -> `String "Kilobits"
  | Megabits -> `String "Megabits"
  | Gigabits -> `String "Gigabits"
  | Terabits -> `String "Terabits"
  | Percent -> `String "Percent"
  | Count -> `String "Count"
  | BytesSecond -> `String "Bytes/Second"
  | KilobytesSecond -> `String "Kilobytes/Second"
  | MegabytesSecond -> `String "Megabytes/Second"
  | GigabytesSecond -> `String "Gigabytes/Second"
  | TerabytesSecond -> `String "Terabytes/Second"
  | BitsSecond -> `String "Bits/Second"
  | KilobitsSecond -> `String "Kilobits/Second"
  | MegabitsSecond -> `String "Megabits/Second"
  | GigabitsSecond -> `String "Gigabits/Second"
  | TerabitsSecond -> `String "Terabits/Second"
  | CountSecond -> `String "Count/Second"
  | None_ -> `String "None"

let metric_name_to_yojson (x : metric_name) =
  match x with
  | CPUUtilization -> `String "CPUUtilization"
  | NetworkIn -> `String "NetworkIn"
  | NetworkOut -> `String "NetworkOut"
  | StatusCheckFailed -> `String "StatusCheckFailed"
  | StatusCheckFailed_Instance -> `String "StatusCheckFailed_Instance"
  | StatusCheckFailed_System -> `String "StatusCheckFailed_System"
  | ClientTLSNegotiationErrorCount -> `String "ClientTLSNegotiationErrorCount"
  | HealthyHostCount -> `String "HealthyHostCount"
  | UnhealthyHostCount -> `String "UnhealthyHostCount"
  | HTTPCode_LB_4XX_Count -> `String "HTTPCode_LB_4XX_Count"
  | HTTPCode_LB_5XX_Count -> `String "HTTPCode_LB_5XX_Count"
  | HTTPCode_Instance_2XX_Count -> `String "HTTPCode_Instance_2XX_Count"
  | HTTPCode_Instance_3XX_Count -> `String "HTTPCode_Instance_3XX_Count"
  | HTTPCode_Instance_4XX_Count -> `String "HTTPCode_Instance_4XX_Count"
  | HTTPCode_Instance_5XX_Count -> `String "HTTPCode_Instance_5XX_Count"
  | InstanceResponseTime -> `String "InstanceResponseTime"
  | RejectedConnectionCount -> `String "RejectedConnectionCount"
  | RequestCount -> `String "RequestCount"
  | DatabaseConnections -> `String "DatabaseConnections"
  | DiskQueueDepth -> `String "DiskQueueDepth"
  | FreeStorageSpace -> `String "FreeStorageSpace"
  | NetworkReceiveThroughput -> `String "NetworkReceiveThroughput"
  | NetworkTransmitThroughput -> `String "NetworkTransmitThroughput"
  | BurstCapacityTime -> `String "BurstCapacityTime"
  | BurstCapacityPercentage -> `String "BurstCapacityPercentage"

let metric_statistic_to_yojson (x : metric_statistic) =
  match x with
  | Minimum -> `String "Minimum"
  | Maximum -> `String "Maximum"
  | Sum -> `String "Sum"
  | Average -> `String "Average"
  | SampleCount -> `String "SampleCount"

let treat_missing_data_to_yojson (x : treat_missing_data) =
  match x with
  | Breaching -> `String "breaching"
  | NotBreaching -> `String "notBreaching"
  | Ignore -> `String "ignore"
  | Missing -> `String "missing"

let integer_to_yojson = int_to_yojson
let double_to_yojson = double_to_yojson
let metric_period_to_yojson = int_to_yojson

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with
  | GreaterThanOrEqualToThreshold -> `String "GreaterThanOrEqualToThreshold"
  | GreaterThanThreshold -> `String "GreaterThanThreshold"
  | LessThanThreshold -> `String "LessThanThreshold"
  | LessThanOrEqualToThreshold -> `String "LessThanOrEqualToThreshold"

let resource_type_to_yojson (x : resource_type) =
  match x with
  | ContainerService -> `String "ContainerService"
  | Instance -> `String "Instance"
  | StaticIp -> `String "StaticIp"
  | KeyPair -> `String "KeyPair"
  | InstanceSnapshot -> `String "InstanceSnapshot"
  | Domain -> `String "Domain"
  | PeeredVpc -> `String "PeeredVpc"
  | LoadBalancer -> `String "LoadBalancer"
  | LoadBalancerTlsCertificate -> `String "LoadBalancerTlsCertificate"
  | Disk -> `String "Disk"
  | DiskSnapshot -> `String "DiskSnapshot"
  | RelationalDatabase -> `String "RelationalDatabase"
  | RelationalDatabaseSnapshot -> `String "RelationalDatabaseSnapshot"
  | ExportSnapshotRecord -> `String "ExportSnapshotRecord"
  | CloudFormationStackRecord -> `String "CloudFormationStackRecord"
  | Alarm -> `String "Alarm"
  | ContactMethod -> `String "ContactMethod"
  | Distribution -> `String "Distribution"
  | Certificate -> `String "Certificate"
  | Bucket -> `String "Bucket"

let resource_name_to_yojson = string_to_yojson
let resource_arn_to_yojson = string_to_yojson

let monitored_resource_info_to_yojson (x : monitored_resource_info) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
    ]

let region_name_to_yojson (x : region_name) =
  match x with
  | US_EAST_1 -> `String "us-east-1"
  | US_EAST_2 -> `String "us-east-2"
  | US_WEST_1 -> `String "us-west-1"
  | US_WEST_2 -> `String "us-west-2"
  | EU_WEST_1 -> `String "eu-west-1"
  | EU_WEST_2 -> `String "eu-west-2"
  | EU_WEST_3 -> `String "eu-west-3"
  | EU_CENTRAL_1 -> `String "eu-central-1"
  | EU_NORTH_1 -> `String "eu-north-1"
  | EU_SOUTH_2 -> `String "eu-south-2"
  | CA_CENTRAL_1 -> `String "ca-central-1"
  | AP_EAST_1 -> `String "ap-east-1"
  | AP_SOUTH_1 -> `String "ap-south-1"
  | AP_SOUTHEAST_1 -> `String "ap-southeast-1"
  | AP_SOUTHEAST_2 -> `String "ap-southeast-2"
  | AP_NORTHEAST_1 -> `String "ap-northeast-1"
  | AP_NORTHEAST_2 -> `String "ap-northeast-2"
  | AP_SOUTHEAST_3 -> `String "ap-southeast-3"
  | AP_SOUTHEAST_5 -> `String "ap-southeast-5"
  | SA_EAST_1 -> `String "sa-east-1"

let resource_location_to_yojson (x : resource_location) =
  assoc_to_yojson
    [
      ("availabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("regionName", option_to_yojson region_name_to_yojson x.region_name);
    ]

let alarm_to_yojson (x : alarm) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ( "monitoredResourceInfo",
        option_to_yojson monitored_resource_info_to_yojson x.monitored_resource_info );
      ("comparisonOperator", option_to_yojson comparison_operator_to_yojson x.comparison_operator);
      ("evaluationPeriods", option_to_yojson integer_to_yojson x.evaluation_periods);
      ("period", option_to_yojson metric_period_to_yojson x.period);
      ("threshold", option_to_yojson double_to_yojson x.threshold);
      ("datapointsToAlarm", option_to_yojson integer_to_yojson x.datapoints_to_alarm);
      ("treatMissingData", option_to_yojson treat_missing_data_to_yojson x.treat_missing_data);
      ("statistic", option_to_yojson metric_statistic_to_yojson x.statistic);
      ("metricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("state", option_to_yojson alarm_state_to_yojson x.state);
      ("unit", option_to_yojson metric_unit_to_yojson x.unit_);
      ("contactProtocols", option_to_yojson contact_protocols_list_to_yojson x.contact_protocols);
      ( "notificationTriggers",
        option_to_yojson notification_trigger_list_to_yojson x.notification_triggers );
      ("notificationEnabled", option_to_yojson boolean__to_yojson x.notification_enabled);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let alarms_list_to_yojson tree = list_to_yojson alarm_to_yojson tree

let unauthenticated_exception_to_yojson (x : unauthenticated_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson string__to_yojson x.code);
      ("docs", option_to_yojson string__to_yojson x.docs);
      ("message", option_to_yojson string__to_yojson x.message);
      ("tip", option_to_yojson string__to_yojson x.tip);
    ]

let service_exception_to_yojson (x : service_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson string__to_yojson x.code);
      ("docs", option_to_yojson string__to_yojson x.docs);
      ("message", option_to_yojson string__to_yojson x.message);
      ("tip", option_to_yojson string__to_yojson x.tip);
    ]

let region_setup_in_progress_exception_to_yojson (x : region_setup_in_progress_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson string__to_yojson x.code);
      ("docs", option_to_yojson string__to_yojson x.docs);
      ("message", option_to_yojson string__to_yojson x.message);
      ("tip", option_to_yojson string__to_yojson x.tip);
    ]

let operation_failure_exception_to_yojson (x : operation_failure_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson string__to_yojson x.code);
      ("docs", option_to_yojson string__to_yojson x.docs);
      ("message", option_to_yojson string__to_yojson x.message);
      ("tip", option_to_yojson string__to_yojson x.tip);
    ]

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson string__to_yojson x.code);
      ("docs", option_to_yojson string__to_yojson x.docs);
      ("message", option_to_yojson string__to_yojson x.message);
      ("tip", option_to_yojson string__to_yojson x.tip);
    ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson string__to_yojson x.code);
      ("docs", option_to_yojson string__to_yojson x.docs);
      ("message", option_to_yojson string__to_yojson x.message);
      ("tip", option_to_yojson string__to_yojson x.tip);
    ]

let operation_status_to_yojson (x : operation_status) =
  match x with
  | NotStarted -> `String "NotStarted"
  | Started -> `String "Started"
  | Failed -> `String "Failed"
  | Completed -> `String "Completed"
  | Succeeded -> `String "Succeeded"

let operation_type_to_yojson (x : operation_type) =
  match x with
  | DeleteKnownHostKeys -> `String "DeleteKnownHostKeys"
  | DeleteInstance -> `String "DeleteInstance"
  | CreateInstance -> `String "CreateInstance"
  | StopInstance -> `String "StopInstance"
  | StartInstance -> `String "StartInstance"
  | RebootInstance -> `String "RebootInstance"
  | OpenInstancePublicPorts -> `String "OpenInstancePublicPorts"
  | PutInstancePublicPorts -> `String "PutInstancePublicPorts"
  | CloseInstancePublicPorts -> `String "CloseInstancePublicPorts"
  | AllocateStaticIp -> `String "AllocateStaticIp"
  | ReleaseStaticIp -> `String "ReleaseStaticIp"
  | AttachStaticIp -> `String "AttachStaticIp"
  | DetachStaticIp -> `String "DetachStaticIp"
  | UpdateDomainEntry -> `String "UpdateDomainEntry"
  | DeleteDomainEntry -> `String "DeleteDomainEntry"
  | CreateDomain -> `String "CreateDomain"
  | DeleteDomain -> `String "DeleteDomain"
  | CreateInstanceSnapshot -> `String "CreateInstanceSnapshot"
  | DeleteInstanceSnapshot -> `String "DeleteInstanceSnapshot"
  | CreateInstancesFromSnapshot -> `String "CreateInstancesFromSnapshot"
  | CreateLoadBalancer -> `String "CreateLoadBalancer"
  | DeleteLoadBalancer -> `String "DeleteLoadBalancer"
  | AttachInstancesToLoadBalancer -> `String "AttachInstancesToLoadBalancer"
  | DetachInstancesFromLoadBalancer -> `String "DetachInstancesFromLoadBalancer"
  | UpdateLoadBalancerAttribute -> `String "UpdateLoadBalancerAttribute"
  | CreateLoadBalancerTlsCertificate -> `String "CreateLoadBalancerTlsCertificate"
  | DeleteLoadBalancerTlsCertificate -> `String "DeleteLoadBalancerTlsCertificate"
  | AttachLoadBalancerTlsCertificate -> `String "AttachLoadBalancerTlsCertificate"
  | CreateDisk -> `String "CreateDisk"
  | DeleteDisk -> `String "DeleteDisk"
  | AttachDisk -> `String "AttachDisk"
  | DetachDisk -> `String "DetachDisk"
  | CreateDiskSnapshot -> `String "CreateDiskSnapshot"
  | DeleteDiskSnapshot -> `String "DeleteDiskSnapshot"
  | CreateDiskFromSnapshot -> `String "CreateDiskFromSnapshot"
  | CreateRelationalDatabase -> `String "CreateRelationalDatabase"
  | UpdateRelationalDatabase -> `String "UpdateRelationalDatabase"
  | DeleteRelationalDatabase -> `String "DeleteRelationalDatabase"
  | CreateRelationalDatabaseFromSnapshot -> `String "CreateRelationalDatabaseFromSnapshot"
  | CreateRelationalDatabaseSnapshot -> `String "CreateRelationalDatabaseSnapshot"
  | DeleteRelationalDatabaseSnapshot -> `String "DeleteRelationalDatabaseSnapshot"
  | UpdateRelationalDatabaseParameters -> `String "UpdateRelationalDatabaseParameters"
  | StartRelationalDatabase -> `String "StartRelationalDatabase"
  | RebootRelationalDatabase -> `String "RebootRelationalDatabase"
  | StopRelationalDatabase -> `String "StopRelationalDatabase"
  | EnableAddOn -> `String "EnableAddOn"
  | DisableAddOn -> `String "DisableAddOn"
  | PutAlarm -> `String "PutAlarm"
  | GetAlarms -> `String "GetAlarms"
  | DeleteAlarm -> `String "DeleteAlarm"
  | TestAlarm -> `String "TestAlarm"
  | CreateContactMethod -> `String "CreateContactMethod"
  | GetContactMethods -> `String "GetContactMethods"
  | SendContactMethodVerification -> `String "SendContactMethodVerification"
  | DeleteContactMethod -> `String "DeleteContactMethod"
  | CreateDistribution -> `String "CreateDistribution"
  | UpdateDistribution -> `String "UpdateDistribution"
  | DeleteDistribution -> `String "DeleteDistribution"
  | ResetDistributionCache -> `String "ResetDistributionCache"
  | AttachCertificateToDistribution -> `String "AttachCertificateToDistribution"
  | DetachCertificateFromDistribution -> `String "DetachCertificateFromDistribution"
  | UpdateDistributionBundle -> `String "UpdateDistributionBundle"
  | SetIpAddressType -> `String "SetIpAddressType"
  | CreateCertificate -> `String "CreateCertificate"
  | DeleteCertificate -> `String "DeleteCertificate"
  | CreateContainerService -> `String "CreateContainerService"
  | UpdateContainerService -> `String "UpdateContainerService"
  | DeleteContainerService -> `String "DeleteContainerService"
  | CreateContainerServiceDeployment -> `String "CreateContainerServiceDeployment"
  | CreateContainerServiceRegistryLogin -> `String "CreateContainerServiceRegistryLogin"
  | RegisterContainerImage -> `String "RegisterContainerImage"
  | DeleteContainerImage -> `String "DeleteContainerImage"
  | CreateBucket -> `String "CreateBucket"
  | DeleteBucket -> `String "DeleteBucket"
  | CreateBucketAccessKey -> `String "CreateBucketAccessKey"
  | DeleteBucketAccessKey -> `String "DeleteBucketAccessKey"
  | UpdateBucketBundle -> `String "UpdateBucketBundle"
  | UpdateBucket -> `String "UpdateBucket"
  | SetResourceAccessForBucket -> `String "SetResourceAccessForBucket"
  | UpdateInstanceMetadataOptions -> `String "UpdateInstanceMetadataOptions"
  | StartGUISession -> `String "StartGUISession"
  | StopGUISession -> `String "StopGUISession"
  | SetupInstanceHttps -> `String "SetupInstanceHttps"

let operation_to_yojson (x : operation) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("resourceName", option_to_yojson resource_name_to_yojson x.resource_name);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("isTerminal", option_to_yojson boolean__to_yojson x.is_terminal);
      ("operationDetails", option_to_yojson string__to_yojson x.operation_details);
      ("operationType", option_to_yojson operation_type_to_yojson x.operation_type);
      ("status", option_to_yojson operation_status_to_yojson x.status);
      ("statusChangedAt", option_to_yojson iso_date_to_yojson x.status_changed_at);
      ("errorCode", option_to_yojson string__to_yojson x.error_code);
      ("errorDetails", option_to_yojson string__to_yojson x.error_details);
    ]

let operation_list_to_yojson tree = list_to_yojson operation_to_yojson tree

let allocate_static_ip_result_to_yojson (x : allocate_static_ip_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let allocate_static_ip_request_to_yojson (x : allocate_static_ip_request) =
  assoc_to_yojson [ ("staticIpName", Some (resource_name_to_yojson x.static_ip_name)) ]

let app_category_to_yojson (x : app_category) = match x with LfR -> `String "LfR"
let app_category_list_to_yojson tree = list_to_yojson app_category_to_yojson tree

let attach_certificate_to_distribution_result_to_yojson
    (x : attach_certificate_to_distribution_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let attach_certificate_to_distribution_request_to_yojson
    (x : attach_certificate_to_distribution_request) =
  assoc_to_yojson
    [
      ("distributionName", Some (resource_name_to_yojson x.distribution_name));
      ("certificateName", Some (resource_name_to_yojson x.certificate_name));
    ]

let attach_disk_result_to_yojson (x : attach_disk_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let attach_disk_request_to_yojson (x : attach_disk_request) =
  assoc_to_yojson
    [
      ("diskName", Some (resource_name_to_yojson x.disk_name));
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
      ("diskPath", Some (non_empty_string_to_yojson x.disk_path));
      ("autoMounting", option_to_yojson boolean__to_yojson x.auto_mounting);
    ]

let attach_instances_to_load_balancer_result_to_yojson
    (x : attach_instances_to_load_balancer_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let resource_name_list_to_yojson tree = list_to_yojson resource_name_to_yojson tree

let attach_instances_to_load_balancer_request_to_yojson
    (x : attach_instances_to_load_balancer_request) =
  assoc_to_yojson
    [
      ("loadBalancerName", Some (resource_name_to_yojson x.load_balancer_name));
      ("instanceNames", Some (resource_name_list_to_yojson x.instance_names));
    ]

let attach_load_balancer_tls_certificate_result_to_yojson
    (x : attach_load_balancer_tls_certificate_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let attach_load_balancer_tls_certificate_request_to_yojson
    (x : attach_load_balancer_tls_certificate_request) =
  assoc_to_yojson
    [
      ("loadBalancerName", Some (resource_name_to_yojson x.load_balancer_name));
      ("certificateName", Some (resource_name_to_yojson x.certificate_name));
    ]

let attach_static_ip_result_to_yojson (x : attach_static_ip_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let attach_static_ip_request_to_yojson (x : attach_static_ip_request) =
  assoc_to_yojson
    [
      ("staticIpName", Some (resource_name_to_yojson x.static_ip_name));
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
    ]

let attached_disk_to_yojson (x : attached_disk) =
  assoc_to_yojson
    [
      ("path", option_to_yojson string__to_yojson x.path);
      ("sizeInGb", option_to_yojson integer_to_yojson x.size_in_gb);
    ]

let attached_disk_list_to_yojson tree = list_to_yojson attached_disk_to_yojson tree

let disk_map_to_yojson (x : disk_map) =
  assoc_to_yojson
    [
      ("originalDiskPath", option_to_yojson non_empty_string_to_yojson x.original_disk_path);
      ("newDiskName", option_to_yojson resource_name_to_yojson x.new_disk_name);
    ]

let disk_map_list_to_yojson tree = list_to_yojson disk_map_to_yojson tree

let attached_disk_map_to_yojson tree =
  map_to_yojson resource_name_to_yojson disk_map_list_to_yojson tree

let auto_mount_status_to_yojson (x : auto_mount_status) =
  match x with
  | Failed -> `String "Failed"
  | Pending -> `String "Pending"
  | Mounted -> `String "Mounted"
  | NotMounted -> `String "NotMounted"

let auto_snapshot_date_to_yojson = string_to_yojson

let auto_snapshot_status_to_yojson (x : auto_snapshot_status) =
  match x with
  | SUCCESS -> `String "Success"
  | FAILED -> `String "Failed"
  | IN_PROGRESS -> `String "InProgress"
  | NOT_FOUND -> `String "NotFound"

let auto_snapshot_details_to_yojson (x : auto_snapshot_details) =
  assoc_to_yojson
    [
      ("date", option_to_yojson string__to_yojson x.date);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("status", option_to_yojson auto_snapshot_status_to_yojson x.status);
      ("fromAttachedDisks", option_to_yojson attached_disk_list_to_yojson x.from_attached_disks);
    ]

let auto_snapshot_details_list_to_yojson tree = list_to_yojson auto_snapshot_details_to_yojson tree

let availability_zone_to_yojson (x : availability_zone) =
  assoc_to_yojson
    [
      ("zoneName", option_to_yojson non_empty_string_to_yojson x.zone_name);
      ("state", option_to_yojson non_empty_string_to_yojson x.state);
    ]

let availability_zone_list_to_yojson tree = list_to_yojson availability_zone_to_yojson tree
let base64_to_yojson = string_to_yojson

let behavior_enum_to_yojson (x : behavior_enum) =
  match x with DontCacheSetting -> `String "dont-cache" | CacheSetting -> `String "cache"

let instance_platform_to_yojson (x : instance_platform) =
  match x with LinuxUnix -> `String "LINUX_UNIX" | Windows -> `String "WINDOWS"

let blueprint_type_to_yojson (x : blueprint_type) =
  match x with Os -> `String "os" | App -> `String "app"

let blueprint_to_yojson (x : blueprint) =
  assoc_to_yojson
    [
      ("blueprintId", option_to_yojson non_empty_string_to_yojson x.blueprint_id);
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("group", option_to_yojson non_empty_string_to_yojson x.group);
      ("type", option_to_yojson blueprint_type_to_yojson x.type_);
      ("description", option_to_yojson string__to_yojson x.description);
      ("isActive", option_to_yojson boolean__to_yojson x.is_active);
      ("minPower", option_to_yojson integer_to_yojson x.min_power);
      ("version", option_to_yojson string__to_yojson x.version);
      ("versionCode", option_to_yojson string__to_yojson x.version_code);
      ("productUrl", option_to_yojson string__to_yojson x.product_url);
      ("licenseUrl", option_to_yojson string__to_yojson x.license_url);
      ("platform", option_to_yojson instance_platform_to_yojson x.platform);
      ("appCategory", option_to_yojson app_category_to_yojson x.app_category);
    ]

let blueprint_list_to_yojson tree = list_to_yojson blueprint_to_yojson tree
let bucket_cors_expose_headers_to_yojson tree = list_to_yojson string__to_yojson tree
let bucket_cors_allowed_headers_to_yojson tree = list_to_yojson string__to_yojson tree
let bucket_cors_allowed_origins_to_yojson tree = list_to_yojson string__to_yojson tree
let bucket_cors_allowed_method_to_yojson = string_to_yojson

let bucket_cors_allowed_methods_to_yojson tree =
  list_to_yojson bucket_cors_allowed_method_to_yojson tree

let bucket_cors_rule_id_to_yojson = string_to_yojson

let bucket_cors_rule_to_yojson (x : bucket_cors_rule) =
  assoc_to_yojson
    [
      ("id", option_to_yojson bucket_cors_rule_id_to_yojson x.id);
      ("allowedMethods", Some (bucket_cors_allowed_methods_to_yojson x.allowed_methods));
      ("allowedOrigins", Some (bucket_cors_allowed_origins_to_yojson x.allowed_origins));
      ("allowedHeaders", option_to_yojson bucket_cors_allowed_headers_to_yojson x.allowed_headers);
      ("exposeHeaders", option_to_yojson bucket_cors_expose_headers_to_yojson x.expose_headers);
      ("maxAgeSeconds", option_to_yojson integer_to_yojson x.max_age_seconds);
    ]

let bucket_cors_rules_to_yojson tree = list_to_yojson bucket_cors_rule_to_yojson tree

let bucket_cors_config_to_yojson (x : bucket_cors_config) =
  assoc_to_yojson [ ("rules", option_to_yojson bucket_cors_rules_to_yojson x.rules) ]

let bucket_access_log_prefix_to_yojson = string_to_yojson
let bucket_name_to_yojson = string_to_yojson

let bucket_access_log_config_to_yojson (x : bucket_access_log_config) =
  assoc_to_yojson
    [
      ("enabled", Some (boolean__to_yojson x.enabled));
      ("destination", option_to_yojson bucket_name_to_yojson x.destination);
      ("prefix", option_to_yojson bucket_access_log_prefix_to_yojson x.prefix);
    ]

let bucket_state_to_yojson (x : bucket_state) =
  assoc_to_yojson
    [
      ("code", option_to_yojson non_empty_string_to_yojson x.code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let partner_id_list_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let bucket_to_yojson (x : bucket) =
  assoc_to_yojson
    [
      ("resourceType", option_to_yojson non_empty_string_to_yojson x.resource_type);
      ("accessRules", option_to_yojson access_rules_to_yojson x.access_rules);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("bundleId", option_to_yojson non_empty_string_to_yojson x.bundle_id);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("url", option_to_yojson non_empty_string_to_yojson x.url);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("name", option_to_yojson bucket_name_to_yojson x.name);
      ("supportCode", option_to_yojson non_empty_string_to_yojson x.support_code);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("objectVersioning", option_to_yojson non_empty_string_to_yojson x.object_versioning);
      ("ableToUpdateBundle", option_to_yojson boolean__to_yojson x.able_to_update_bundle);
      ( "readonlyAccessAccounts",
        option_to_yojson partner_id_list_to_yojson x.readonly_access_accounts );
      ( "resourcesReceivingAccess",
        option_to_yojson access_receiver_list_to_yojson x.resources_receiving_access );
      ("state", option_to_yojson bucket_state_to_yojson x.state);
      ("accessLogConfig", option_to_yojson bucket_access_log_config_to_yojson x.access_log_config);
      ("cors", option_to_yojson bucket_cors_config_to_yojson x.cors);
    ]

let float__to_yojson = float_to_yojson

let bucket_bundle_to_yojson (x : bucket_bundle) =
  assoc_to_yojson
    [
      ("bundleId", option_to_yojson non_empty_string_to_yojson x.bundle_id);
      ("name", option_to_yojson non_empty_string_to_yojson x.name);
      ("price", option_to_yojson float__to_yojson x.price);
      ("storagePerMonthInGb", option_to_yojson integer_to_yojson x.storage_per_month_in_gb);
      ("transferPerMonthInGb", option_to_yojson integer_to_yojson x.transfer_per_month_in_gb);
      ("isActive", option_to_yojson boolean__to_yojson x.is_active);
    ]

let bucket_bundle_list_to_yojson tree = list_to_yojson bucket_bundle_to_yojson tree
let bucket_list_to_yojson tree = list_to_yojson bucket_to_yojson tree

let bucket_metric_name_to_yojson (x : bucket_metric_name) =
  match x with
  | BucketSizeBytes -> `String "BucketSizeBytes"
  | NumberOfObjects -> `String "NumberOfObjects"

let instance_platform_list_to_yojson tree = list_to_yojson instance_platform_to_yojson tree

let bundle_to_yojson (x : bundle) =
  assoc_to_yojson
    [
      ("price", option_to_yojson float__to_yojson x.price);
      ("cpuCount", option_to_yojson integer_to_yojson x.cpu_count);
      ("diskSizeInGb", option_to_yojson integer_to_yojson x.disk_size_in_gb);
      ("bundleId", option_to_yojson non_empty_string_to_yojson x.bundle_id);
      ("instanceType", option_to_yojson string__to_yojson x.instance_type);
      ("isActive", option_to_yojson boolean__to_yojson x.is_active);
      ("name", option_to_yojson string__to_yojson x.name);
      ("power", option_to_yojson integer_to_yojson x.power);
      ("ramSizeInGb", option_to_yojson float__to_yojson x.ram_size_in_gb);
      ("transferPerMonthInGb", option_to_yojson integer_to_yojson x.transfer_per_month_in_gb);
      ("supportedPlatforms", option_to_yojson instance_platform_list_to_yojson x.supported_platforms);
      ( "supportedAppCategories",
        option_to_yojson app_category_list_to_yojson x.supported_app_categories );
      ("publicIpv4AddressCount", option_to_yojson integer_to_yojson x.public_ipv4_address_count);
    ]

let bundle_list_to_yojson tree = list_to_yojson bundle_to_yojson tree

let cache_behavior_to_yojson (x : cache_behavior) =
  assoc_to_yojson [ ("behavior", option_to_yojson behavior_enum_to_yojson x.behavior) ]

let cache_behavior_per_path_to_yojson (x : cache_behavior_per_path) =
  assoc_to_yojson
    [
      ("path", option_to_yojson string__to_yojson x.path);
      ("behavior", option_to_yojson behavior_enum_to_yojson x.behavior);
    ]

let cache_behavior_list_to_yojson tree = list_to_yojson cache_behavior_per_path_to_yojson tree
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let query_string_object_to_yojson (x : query_string_object) =
  assoc_to_yojson
    [
      ("option", option_to_yojson boolean__to_yojson x.option_);
      ("queryStringsAllowList", option_to_yojson string_list_to_yojson x.query_strings_allow_list);
    ]

let header_enum_to_yojson (x : header_enum) =
  match x with
  | Accept -> `String "Accept"
  | AcceptCharset -> `String "Accept-Charset"
  | AcceptDatetime -> `String "Accept-Datetime"
  | AcceptEncoding -> `String "Accept-Encoding"
  | AcceptLanguage -> `String "Accept-Language"
  | Authorization -> `String "Authorization"
  | CloudFrontForwardedProto -> `String "CloudFront-Forwarded-Proto"
  | CloudFrontIsDesktopViewer -> `String "CloudFront-Is-Desktop-Viewer"
  | CloudFrontIsMobileViewer -> `String "CloudFront-Is-Mobile-Viewer"
  | CloudFrontIsSmartTVViewer -> `String "CloudFront-Is-SmartTV-Viewer"
  | CloudFrontIsTabletViewer -> `String "CloudFront-Is-Tablet-Viewer"
  | CloudFrontViewerCountry -> `String "CloudFront-Viewer-Country"
  | Host -> `String "Host"
  | Origin -> `String "Origin"
  | Referer -> `String "Referer"

let header_forward_list_to_yojson tree = list_to_yojson header_enum_to_yojson tree

let forward_values_to_yojson (x : forward_values) =
  match x with None_ -> `String "none" | AllowList -> `String "allow-list" | All -> `String "all"

let header_object_to_yojson (x : header_object) =
  assoc_to_yojson
    [
      ("option", option_to_yojson forward_values_to_yojson x.option_);
      ("headersAllowList", option_to_yojson header_forward_list_to_yojson x.headers_allow_list);
    ]

let cookie_object_to_yojson (x : cookie_object) =
  assoc_to_yojson
    [
      ("option", option_to_yojson forward_values_to_yojson x.option_);
      ("cookiesAllowList", option_to_yojson string_list_to_yojson x.cookies_allow_list);
    ]

let long_to_yojson = long_to_yojson

let cache_settings_to_yojson (x : cache_settings) =
  assoc_to_yojson
    [
      ("defaultTTL", option_to_yojson long_to_yojson x.default_tt_l);
      ("minimumTTL", option_to_yojson long_to_yojson x.minimum_tt_l);
      ("maximumTTL", option_to_yojson long_to_yojson x.maximum_tt_l);
      ("allowedHTTPMethods", option_to_yojson non_empty_string_to_yojson x.allowed_http_methods);
      ("cachedHTTPMethods", option_to_yojson non_empty_string_to_yojson x.cached_http_methods);
      ("forwardedCookies", option_to_yojson cookie_object_to_yojson x.forwarded_cookies);
      ("forwardedHeaders", option_to_yojson header_object_to_yojson x.forwarded_headers);
      ( "forwardedQueryStrings",
        option_to_yojson query_string_object_to_yojson x.forwarded_query_strings );
    ]

let revocation_reason_to_yojson = string_to_yojson
let renewal_status_reason_to_yojson = string_to_yojson

let renewal_status_to_yojson (x : renewal_status) =
  match x with
  | PendingAutoRenewal -> `String "PendingAutoRenewal"
  | PendingValidation -> `String "PendingValidation"
  | Success -> `String "Success"
  | Failed -> `String "Failed"

let certificate_domain_validation_status_to_yojson (x : certificate_domain_validation_status) =
  match x with
  | PendingValidation -> `String "PENDING_VALIDATION"
  | Failed -> `String "FAILED"
  | Success -> `String "SUCCESS"

let dns_record_creation_state_code_to_yojson (x : dns_record_creation_state_code) =
  match x with
  | Succeeded -> `String "SUCCEEDED"
  | Started -> `String "STARTED"
  | Failed -> `String "FAILED"

let dns_record_creation_state_to_yojson (x : dns_record_creation_state) =
  assoc_to_yojson
    [
      ("code", option_to_yojson dns_record_creation_state_code_to_yojson x.code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let resource_record_to_yojson (x : resource_record) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("type", option_to_yojson string__to_yojson x.type_);
      ("value", option_to_yojson string__to_yojson x.value);
    ]

let domain_name_to_yojson = string_to_yojson

let domain_validation_record_to_yojson (x : domain_validation_record) =
  assoc_to_yojson
    [
      ("domainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("resourceRecord", option_to_yojson resource_record_to_yojson x.resource_record);
      ( "dnsRecordCreationState",
        option_to_yojson dns_record_creation_state_to_yojson x.dns_record_creation_state );
      ( "validationStatus",
        option_to_yojson certificate_domain_validation_status_to_yojson x.validation_status );
    ]

let domain_validation_record_list_to_yojson tree =
  list_to_yojson domain_validation_record_to_yojson tree

let renewal_summary_to_yojson (x : renewal_summary) =
  assoc_to_yojson
    [
      ( "domainValidationRecords",
        option_to_yojson domain_validation_record_list_to_yojson x.domain_validation_records );
      ("renewalStatus", option_to_yojson renewal_status_to_yojson x.renewal_status);
      ( "renewalStatusReason",
        option_to_yojson renewal_status_reason_to_yojson x.renewal_status_reason );
      ("updatedAt", option_to_yojson iso_date_to_yojson x.updated_at);
    ]

let eligible_to_renew_to_yojson = string_to_yojson
let issuer_c_a_to_yojson = string_to_yojson
let key_algorithm_to_yojson = string_to_yojson
let in_use_resource_count_to_yojson = int_to_yojson
let request_failure_reason_to_yojson = string_to_yojson
let subject_alternative_name_list_to_yojson tree = list_to_yojson domain_name_to_yojson tree
let serial_number_to_yojson = string_to_yojson

let certificate_status_to_yojson (x : certificate_status) =
  match x with
  | PendingValidation -> `String "PENDING_VALIDATION"
  | Issued -> `String "ISSUED"
  | Inactive -> `String "INACTIVE"
  | Expired -> `String "EXPIRED"
  | ValidationTimedOut -> `String "VALIDATION_TIMED_OUT"
  | Revoked -> `String "REVOKED"
  | Failed -> `String "FAILED"

let certificate_name_to_yojson = string_to_yojson

let certificate_to_yojson (x : certificate) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("name", option_to_yojson certificate_name_to_yojson x.name);
      ("domainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("status", option_to_yojson certificate_status_to_yojson x.status);
      ("serialNumber", option_to_yojson serial_number_to_yojson x.serial_number);
      ( "subjectAlternativeNames",
        option_to_yojson subject_alternative_name_list_to_yojson x.subject_alternative_names );
      ( "domainValidationRecords",
        option_to_yojson domain_validation_record_list_to_yojson x.domain_validation_records );
      ( "requestFailureReason",
        option_to_yojson request_failure_reason_to_yojson x.request_failure_reason );
      ( "inUseResourceCount",
        option_to_yojson in_use_resource_count_to_yojson x.in_use_resource_count );
      ("keyAlgorithm", option_to_yojson key_algorithm_to_yojson x.key_algorithm);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("issuedAt", option_to_yojson iso_date_to_yojson x.issued_at);
      ("issuerCA", option_to_yojson issuer_c_a_to_yojson x.issuer_c_a);
      ("notBefore", option_to_yojson iso_date_to_yojson x.not_before);
      ("notAfter", option_to_yojson iso_date_to_yojson x.not_after);
      ("eligibleToRenew", option_to_yojson eligible_to_renew_to_yojson x.eligible_to_renew);
      ("renewalSummary", option_to_yojson renewal_summary_to_yojson x.renewal_summary);
      ("revokedAt", option_to_yojson iso_date_to_yojson x.revoked_at);
      ("revocationReason", option_to_yojson revocation_reason_to_yojson x.revocation_reason);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
    ]

let certificate_provider_to_yojson (x : certificate_provider) =
  match x with LetsEncrypt -> `String "LetsEncrypt"

let certificate_status_list_to_yojson tree = list_to_yojson certificate_status_to_yojson tree

let certificate_summary_to_yojson (x : certificate_summary) =
  assoc_to_yojson
    [
      ("certificateArn", option_to_yojson non_empty_string_to_yojson x.certificate_arn);
      ("certificateName", option_to_yojson certificate_name_to_yojson x.certificate_name);
      ("domainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("certificateDetail", option_to_yojson certificate_to_yojson x.certificate_detail);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let certificate_summary_list_to_yojson tree = list_to_yojson certificate_summary_to_yojson tree

let close_instance_public_ports_result_to_yojson (x : close_instance_public_ports_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let network_protocol_to_yojson (x : network_protocol) =
  match x with
  | TCP -> `String "tcp"
  | ALL -> `String "all"
  | UDP -> `String "udp"
  | ICMP -> `String "icmp"
  | ICMPV6 -> `String "icmpv6"

let port_to_yojson = int_to_yojson

let port_info_to_yojson (x : port_info) =
  assoc_to_yojson
    [
      ("fromPort", option_to_yojson port_to_yojson x.from_port);
      ("toPort", option_to_yojson port_to_yojson x.to_port);
      ("protocol", option_to_yojson network_protocol_to_yojson x.protocol);
      ("cidrs", option_to_yojson string_list_to_yojson x.cidrs);
      ("ipv6Cidrs", option_to_yojson string_list_to_yojson x.ipv6_cidrs);
      ("cidrListAliases", option_to_yojson string_list_to_yojson x.cidr_list_aliases);
    ]

let close_instance_public_ports_request_to_yojson (x : close_instance_public_ports_request) =
  assoc_to_yojson
    [
      ("portInfo", Some (port_info_to_yojson x.port_info));
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
    ]

let destination_info_to_yojson (x : destination_info) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("service", option_to_yojson non_empty_string_to_yojson x.service);
    ]

let cloud_formation_stack_record_source_type_to_yojson
    (x : cloud_formation_stack_record_source_type) =
  match x with ExportSnapshotRecord -> `String "ExportSnapshotRecord"

let cloud_formation_stack_record_source_info_to_yojson
    (x : cloud_formation_stack_record_source_info) =
  assoc_to_yojson
    [
      ( "resourceType",
        option_to_yojson cloud_formation_stack_record_source_type_to_yojson x.resource_type );
      ("name", option_to_yojson non_empty_string_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
    ]

let cloud_formation_stack_record_source_info_list_to_yojson tree =
  list_to_yojson cloud_formation_stack_record_source_info_to_yojson tree

let record_state_to_yojson (x : record_state) =
  match x with
  | Started -> `String "Started"
  | Succeeded -> `String "Succeeded"
  | Failed -> `String "Failed"

let cloud_formation_stack_record_to_yojson (x : cloud_formation_stack_record) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("state", option_to_yojson record_state_to_yojson x.state);
      ( "sourceInfo",
        option_to_yojson cloud_formation_stack_record_source_info_list_to_yojson x.source_info );
      ("destinationInfo", option_to_yojson destination_info_to_yojson x.destination_info);
    ]

let cloud_formation_stack_record_list_to_yojson tree =
  list_to_yojson cloud_formation_stack_record_to_yojson tree

let contact_method_status_to_yojson (x : contact_method_status) =
  match x with
  | PendingVerification -> `String "PendingVerification"
  | Valid -> `String "Valid"
  | Invalid -> `String "Invalid"

let contact_method_to_yojson (x : contact_method) =
  assoc_to_yojson
    [
      ("contactEndpoint", option_to_yojson non_empty_string_to_yojson x.contact_endpoint);
      ("status", option_to_yojson contact_method_status_to_yojson x.status);
      ("protocol", option_to_yojson contact_protocol_to_yojson x.protocol);
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let contact_method_verification_protocol_to_yojson (x : contact_method_verification_protocol) =
  match x with Email -> `String "Email"

let contact_methods_list_to_yojson tree = list_to_yojson contact_method_to_yojson tree

let container_service_protocol_to_yojson (x : container_service_protocol) =
  match x with
  | HTTP -> `String "HTTP"
  | HTTPS -> `String "HTTPS"
  | TCP -> `String "TCP"
  | UDP -> `String "UDP"

let port_map_to_yojson tree =
  map_to_yojson string__to_yojson container_service_protocol_to_yojson tree

let environment_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let container_to_yojson (x : container) =
  assoc_to_yojson
    [
      ("image", option_to_yojson string__to_yojson x.image);
      ("command", option_to_yojson string_list_to_yojson x.command);
      ("environment", option_to_yojson environment_to_yojson x.environment);
      ("ports", option_to_yojson port_map_to_yojson x.ports);
    ]

let container_image_to_yojson (x : container_image) =
  assoc_to_yojson
    [
      ("image", option_to_yojson string__to_yojson x.image);
      ("digest", option_to_yojson string__to_yojson x.digest);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
    ]

let container_image_list_to_yojson tree = list_to_yojson container_image_to_yojson tree
let container_label_to_yojson = string_to_yojson
let container_name_to_yojson = string_to_yojson
let container_map_to_yojson tree = map_to_yojson container_name_to_yojson container_to_yojson tree

let container_service_ecr_image_puller_role_to_yojson (x : container_service_ecr_image_puller_role)
    =
  assoc_to_yojson
    [
      ("isActive", option_to_yojson boolean__to_yojson x.is_active);
      ("principalArn", option_to_yojson string__to_yojson x.principal_arn);
    ]

let private_registry_access_to_yojson (x : private_registry_access) =
  assoc_to_yojson
    [
      ( "ecrImagePullerRole",
        option_to_yojson container_service_ecr_image_puller_role_to_yojson x.ecr_image_puller_role
      );
    ]

let container_service_public_domains_list_to_yojson tree = list_to_yojson string__to_yojson tree

let container_service_public_domains_to_yojson tree =
  map_to_yojson string__to_yojson container_service_public_domains_list_to_yojson tree

let container_service_health_check_config_to_yojson (x : container_service_health_check_config) =
  assoc_to_yojson
    [
      ("healthyThreshold", option_to_yojson integer_to_yojson x.healthy_threshold);
      ("unhealthyThreshold", option_to_yojson integer_to_yojson x.unhealthy_threshold);
      ("timeoutSeconds", option_to_yojson integer_to_yojson x.timeout_seconds);
      ("intervalSeconds", option_to_yojson integer_to_yojson x.interval_seconds);
      ("path", option_to_yojson string__to_yojson x.path);
      ("successCodes", option_to_yojson string__to_yojson x.success_codes);
    ]

let container_service_endpoint_to_yojson (x : container_service_endpoint) =
  assoc_to_yojson
    [
      ("containerName", option_to_yojson string__to_yojson x.container_name);
      ("containerPort", option_to_yojson integer_to_yojson x.container_port);
      ( "healthCheck",
        option_to_yojson container_service_health_check_config_to_yojson x.health_check );
    ]

let container_service_deployment_state_to_yojson (x : container_service_deployment_state) =
  match x with
  | ACTIVATING -> `String "ACTIVATING"
  | ACTIVE -> `String "ACTIVE"
  | INACTIVE -> `String "INACTIVE"
  | FAILED -> `String "FAILED"

let container_service_deployment_to_yojson (x : container_service_deployment) =
  assoc_to_yojson
    [
      ("version", option_to_yojson integer_to_yojson x.version);
      ("state", option_to_yojson container_service_deployment_state_to_yojson x.state);
      ("containers", option_to_yojson container_map_to_yojson x.containers);
      ("publicEndpoint", option_to_yojson container_service_endpoint_to_yojson x.public_endpoint);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
    ]

let container_service_scale_to_yojson = int_to_yojson

let container_service_state_detail_code_to_yojson (x : container_service_state_detail_code) =
  match x with
  | CREATING_SYSTEM_RESOURCES -> `String "CREATING_SYSTEM_RESOURCES"
  | CREATING_NETWORK_INFRASTRUCTURE -> `String "CREATING_NETWORK_INFRASTRUCTURE"
  | PROVISIONING_CERTIFICATE -> `String "PROVISIONING_CERTIFICATE"
  | PROVISIONING_SERVICE -> `String "PROVISIONING_SERVICE"
  | CREATING_DEPLOYMENT -> `String "CREATING_DEPLOYMENT"
  | EVALUATING_HEALTH_CHECK -> `String "EVALUATING_HEALTH_CHECK"
  | ACTIVATING_DEPLOYMENT -> `String "ACTIVATING_DEPLOYMENT"
  | CERTIFICATE_LIMIT_EXCEEDED -> `String "CERTIFICATE_LIMIT_EXCEEDED"
  | UNKNOWN_ERROR -> `String "UNKNOWN_ERROR"

let container_service_state_detail_to_yojson (x : container_service_state_detail) =
  assoc_to_yojson
    [
      ("code", option_to_yojson container_service_state_detail_code_to_yojson x.code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let container_service_state_to_yojson (x : container_service_state) =
  match x with
  | PENDING -> `String "PENDING"
  | READY -> `String "READY"
  | RUNNING -> `String "RUNNING"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | DISABLED -> `String "DISABLED"
  | DEPLOYING -> `String "DEPLOYING"

let container_service_power_name_to_yojson (x : container_service_power_name) =
  match x with
  | Nano -> `String "nano"
  | Micro -> `String "micro"
  | Small -> `String "small"
  | Medium -> `String "medium"
  | Large -> `String "large"
  | Xlarge -> `String "xlarge"

let container_service_name_to_yojson = string_to_yojson

let container_service_to_yojson (x : container_service) =
  assoc_to_yojson
    [
      ( "containerServiceName",
        option_to_yojson container_service_name_to_yojson x.container_service_name );
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("power", option_to_yojson container_service_power_name_to_yojson x.power);
      ("powerId", option_to_yojson string__to_yojson x.power_id);
      ("state", option_to_yojson container_service_state_to_yojson x.state);
      ("stateDetail", option_to_yojson container_service_state_detail_to_yojson x.state_detail);
      ("scale", option_to_yojson container_service_scale_to_yojson x.scale);
      ( "currentDeployment",
        option_to_yojson container_service_deployment_to_yojson x.current_deployment );
      ("nextDeployment", option_to_yojson container_service_deployment_to_yojson x.next_deployment);
      ("isDisabled", option_to_yojson boolean__to_yojson x.is_disabled);
      ("principalArn", option_to_yojson string__to_yojson x.principal_arn);
      ("privateDomainName", option_to_yojson string__to_yojson x.private_domain_name);
      ( "publicDomainNames",
        option_to_yojson container_service_public_domains_to_yojson x.public_domain_names );
      ("url", option_to_yojson string__to_yojson x.url);
      ( "privateRegistryAccess",
        option_to_yojson private_registry_access_to_yojson x.private_registry_access );
    ]

let container_service_deployment_list_to_yojson tree =
  list_to_yojson container_service_deployment_to_yojson tree

let endpoint_request_to_yojson (x : endpoint_request) =
  assoc_to_yojson
    [
      ("containerName", Some (string__to_yojson x.container_name));
      ("containerPort", Some (integer_to_yojson x.container_port));
      ( "healthCheck",
        option_to_yojson container_service_health_check_config_to_yojson x.health_check );
    ]

let container_service_deployment_request_to_yojson (x : container_service_deployment_request) =
  assoc_to_yojson
    [
      ("containers", option_to_yojson container_map_to_yojson x.containers);
      ("publicEndpoint", option_to_yojson endpoint_request_to_yojson x.public_endpoint);
    ]

let container_service_ecr_image_puller_role_request_to_yojson
    (x : container_service_ecr_image_puller_role_request) =
  assoc_to_yojson [ ("isActive", option_to_yojson boolean__to_yojson x.is_active) ]

let container_service_list_to_yojson tree = list_to_yojson container_service_to_yojson tree

let container_service_log_event_to_yojson (x : container_service_log_event) =
  assoc_to_yojson
    [
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let container_service_log_event_list_to_yojson tree =
  list_to_yojson container_service_log_event_to_yojson tree

let container_service_metadata_entry_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let container_service_metadata_entry_list_to_yojson tree =
  list_to_yojson container_service_metadata_entry_to_yojson tree

let container_service_metric_name_to_yojson (x : container_service_metric_name) =
  match x with
  | CPUUtilization -> `String "CPUUtilization"
  | MemoryUtilization -> `String "MemoryUtilization"

let container_service_power_to_yojson (x : container_service_power) =
  assoc_to_yojson
    [
      ("powerId", option_to_yojson string__to_yojson x.power_id);
      ("price", option_to_yojson float__to_yojson x.price);
      ("cpuCount", option_to_yojson float__to_yojson x.cpu_count);
      ("ramSizeInGb", option_to_yojson float__to_yojson x.ram_size_in_gb);
      ("name", option_to_yojson string__to_yojson x.name);
      ("isActive", option_to_yojson boolean__to_yojson x.is_active);
    ]

let container_service_power_list_to_yojson tree =
  list_to_yojson container_service_power_to_yojson tree

let container_service_registry_login_to_yojson (x : container_service_registry_login) =
  assoc_to_yojson
    [
      ("username", option_to_yojson string__to_yojson x.username);
      ("password", option_to_yojson string__to_yojson x.password);
      ("expiresAt", option_to_yojson iso_date_to_yojson x.expires_at);
      ("registry", option_to_yojson string__to_yojson x.registry);
    ]

let container_services_list_result_to_yojson (x : container_services_list_result) =
  assoc_to_yojson
    [
      ("containerServices", option_to_yojson container_service_list_to_yojson x.container_services);
    ]

let copy_snapshot_result_to_yojson (x : copy_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let copy_snapshot_request_to_yojson (x : copy_snapshot_request) =
  assoc_to_yojson
    [
      ("sourceSnapshotName", option_to_yojson resource_name_to_yojson x.source_snapshot_name);
      ("sourceResourceName", option_to_yojson string__to_yojson x.source_resource_name);
      ("restoreDate", option_to_yojson string__to_yojson x.restore_date);
      ( "useLatestRestorableAutoSnapshot",
        option_to_yojson boolean__to_yojson x.use_latest_restorable_auto_snapshot );
      ("targetSnapshotName", Some (resource_name_to_yojson x.target_snapshot_name));
      ("sourceRegion", Some (region_name_to_yojson x.source_region));
    ]

let time_period_to_yojson (x : time_period) =
  assoc_to_yojson
    [
      ("start", option_to_yojson iso_date_to_yojson x.start);
      ("end", option_to_yojson iso_date_to_yojson x.end_);
    ]

let currency_to_yojson (x : currency) = match x with USD -> `String "USD"

let pricing_unit_to_yojson (x : pricing_unit) =
  match x with
  | GB -> `String "GB"
  | Hrs -> `String "Hrs"
  | GBMo -> `String "GB-Mo"
  | Bundles -> `String "Bundles"
  | Queries -> `String "Queries"

let estimate_by_time_to_yojson (x : estimate_by_time) =
  assoc_to_yojson
    [
      ("usageCost", option_to_yojson double_to_yojson x.usage_cost);
      ("pricingUnit", option_to_yojson pricing_unit_to_yojson x.pricing_unit);
      ("unit", option_to_yojson double_to_yojson x.unit_);
      ("currency", option_to_yojson currency_to_yojson x.currency);
      ("timePeriod", option_to_yojson time_period_to_yojson x.time_period);
    ]

let estimates_by_time_to_yojson tree = list_to_yojson estimate_by_time_to_yojson tree

let cost_estimate_to_yojson (x : cost_estimate) =
  assoc_to_yojson
    [
      ("usageType", option_to_yojson non_empty_string_to_yojson x.usage_type);
      ("resultsByTime", option_to_yojson estimates_by_time_to_yojson x.results_by_time);
    ]

let cost_estimates_to_yojson tree = list_to_yojson cost_estimate_to_yojson tree

let create_bucket_result_to_yojson (x : create_bucket_result) =
  assoc_to_yojson
    [
      ("bucket", option_to_yojson bucket_to_yojson x.bucket);
      ("operations", option_to_yojson operation_list_to_yojson x.operations);
    ]

let create_bucket_request_to_yojson (x : create_bucket_request) =
  assoc_to_yojson
    [
      ("bucketName", Some (bucket_name_to_yojson x.bucket_name));
      ("bundleId", Some (non_empty_string_to_yojson x.bundle_id));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("enableObjectVersioning", option_to_yojson boolean__to_yojson x.enable_object_versioning);
    ]

let create_bucket_access_key_result_to_yojson (x : create_bucket_access_key_result) =
  assoc_to_yojson
    [
      ("accessKey", option_to_yojson access_key_to_yojson x.access_key);
      ("operations", option_to_yojson operation_list_to_yojson x.operations);
    ]

let create_bucket_access_key_request_to_yojson (x : create_bucket_access_key_request) =
  assoc_to_yojson [ ("bucketName", Some (bucket_name_to_yojson x.bucket_name)) ]

let create_certificate_result_to_yojson (x : create_certificate_result) =
  assoc_to_yojson
    [
      ("certificate", option_to_yojson certificate_summary_to_yojson x.certificate);
      ("operations", option_to_yojson operation_list_to_yojson x.operations);
    ]

let create_certificate_request_to_yojson (x : create_certificate_request) =
  assoc_to_yojson
    [
      ("certificateName", Some (certificate_name_to_yojson x.certificate_name));
      ("domainName", Some (domain_name_to_yojson x.domain_name));
      ( "subjectAlternativeNames",
        option_to_yojson subject_alternative_name_list_to_yojson x.subject_alternative_names );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_cloud_formation_stack_result_to_yojson (x : create_cloud_formation_stack_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let port_info_source_type_to_yojson (x : port_info_source_type) =
  match x with
  | Default -> `String "DEFAULT"
  | Instance -> `String "INSTANCE"
  | None_ -> `String "NONE"
  | Closed -> `String "CLOSED"

let instance_entry_to_yojson (x : instance_entry) =
  assoc_to_yojson
    [
      ("sourceName", Some (resource_name_to_yojson x.source_name));
      ("instanceType", Some (non_empty_string_to_yojson x.instance_type));
      ("portInfoSource", Some (port_info_source_type_to_yojson x.port_info_source));
      ("userData", option_to_yojson string__to_yojson x.user_data);
      ("availabilityZone", Some (string__to_yojson x.availability_zone));
    ]

let instance_entry_list_to_yojson tree = list_to_yojson instance_entry_to_yojson tree

let create_cloud_formation_stack_request_to_yojson (x : create_cloud_formation_stack_request) =
  assoc_to_yojson [ ("instances", Some (instance_entry_list_to_yojson x.instances)) ]

let create_contact_method_result_to_yojson (x : create_contact_method_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let string_max256_to_yojson = string_to_yojson

let create_contact_method_request_to_yojson (x : create_contact_method_request) =
  assoc_to_yojson
    [
      ("protocol", Some (contact_protocol_to_yojson x.protocol));
      ("contactEndpoint", Some (string_max256_to_yojson x.contact_endpoint));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_container_service_result_to_yojson (x : create_container_service_result) =
  assoc_to_yojson
    [ ("containerService", option_to_yojson container_service_to_yojson x.container_service) ]

let private_registry_access_request_to_yojson (x : private_registry_access_request) =
  assoc_to_yojson
    [
      ( "ecrImagePullerRole",
        option_to_yojson container_service_ecr_image_puller_role_request_to_yojson
          x.ecr_image_puller_role );
    ]

let create_container_service_request_to_yojson (x : create_container_service_request) =
  assoc_to_yojson
    [
      ("serviceName", Some (container_service_name_to_yojson x.service_name));
      ("power", Some (container_service_power_name_to_yojson x.power));
      ("scale", Some (container_service_scale_to_yojson x.scale));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "publicDomainNames",
        option_to_yojson container_service_public_domains_to_yojson x.public_domain_names );
      ("deployment", option_to_yojson container_service_deployment_request_to_yojson x.deployment);
      ( "privateRegistryAccess",
        option_to_yojson private_registry_access_request_to_yojson x.private_registry_access );
    ]

let create_container_service_deployment_result_to_yojson
    (x : create_container_service_deployment_result) =
  assoc_to_yojson
    [ ("containerService", option_to_yojson container_service_to_yojson x.container_service) ]

let create_container_service_deployment_request_to_yojson
    (x : create_container_service_deployment_request) =
  assoc_to_yojson
    [
      ("serviceName", Some (container_service_name_to_yojson x.service_name));
      ("containers", option_to_yojson container_map_to_yojson x.containers);
      ("publicEndpoint", option_to_yojson endpoint_request_to_yojson x.public_endpoint);
    ]

let create_container_service_registry_login_result_to_yojson
    (x : create_container_service_registry_login_result) =
  assoc_to_yojson
    [
      ("registryLogin", option_to_yojson container_service_registry_login_to_yojson x.registry_login);
    ]

let create_container_service_registry_login_request_to_yojson = unit_to_yojson

let create_disk_result_to_yojson (x : create_disk_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let create_disk_request_to_yojson (x : create_disk_request) =
  assoc_to_yojson
    [
      ("diskName", Some (resource_name_to_yojson x.disk_name));
      ("availabilityZone", Some (non_empty_string_to_yojson x.availability_zone));
      ("sizeInGb", Some (integer_to_yojson x.size_in_gb));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("addOns", option_to_yojson add_on_request_list_to_yojson x.add_ons);
    ]

let create_disk_from_snapshot_result_to_yojson (x : create_disk_from_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let create_disk_from_snapshot_request_to_yojson (x : create_disk_from_snapshot_request) =
  assoc_to_yojson
    [
      ("diskName", Some (resource_name_to_yojson x.disk_name));
      ("diskSnapshotName", option_to_yojson resource_name_to_yojson x.disk_snapshot_name);
      ("availabilityZone", Some (non_empty_string_to_yojson x.availability_zone));
      ("sizeInGb", Some (integer_to_yojson x.size_in_gb));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("addOns", option_to_yojson add_on_request_list_to_yojson x.add_ons);
      ("sourceDiskName", option_to_yojson string__to_yojson x.source_disk_name);
      ("restoreDate", option_to_yojson string__to_yojson x.restore_date);
      ( "useLatestRestorableAutoSnapshot",
        option_to_yojson boolean__to_yojson x.use_latest_restorable_auto_snapshot );
    ]

let create_disk_snapshot_result_to_yojson (x : create_disk_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let create_disk_snapshot_request_to_yojson (x : create_disk_snapshot_request) =
  assoc_to_yojson
    [
      ("diskName", option_to_yojson resource_name_to_yojson x.disk_name);
      ("diskSnapshotName", Some (resource_name_to_yojson x.disk_snapshot_name));
      ("instanceName", option_to_yojson resource_name_to_yojson x.instance_name);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let ip_address_type_to_yojson (x : ip_address_type) =
  match x with DUALSTACK -> `String "dualstack" | IPV4 -> `String "ipv4" | IPV6 -> `String "ipv6"

let origin_ip_address_type_enum_to_yojson (x : origin_ip_address_type_enum) =
  match x with IPV4 -> `String "ipv4" | IPV6 -> `String "ipv6" | DUALSTACK -> `String "dualstack"

let origin_protocol_policy_enum_to_yojson (x : origin_protocol_policy_enum) =
  match x with HTTPOnly -> `String "http-only" | HTTPSOnly -> `String "https-only"

let origin_to_yojson (x : origin) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("regionName", option_to_yojson region_name_to_yojson x.region_name);
      ("protocolPolicy", option_to_yojson origin_protocol_policy_enum_to_yojson x.protocol_policy);
      ("responseTimeout", option_to_yojson integer_to_yojson x.response_timeout);
      ("ipAddressType", option_to_yojson origin_ip_address_type_enum_to_yojson x.ip_address_type);
    ]

let lightsail_distribution_to_yojson (x : lightsail_distribution) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("alternativeDomainNames", option_to_yojson string_list_to_yojson x.alternative_domain_names);
      ("status", option_to_yojson string__to_yojson x.status);
      ("isEnabled", option_to_yojson boolean__to_yojson x.is_enabled);
      ("domainName", option_to_yojson string__to_yojson x.domain_name);
      ("bundleId", option_to_yojson string__to_yojson x.bundle_id);
      ("certificateName", option_to_yojson resource_name_to_yojson x.certificate_name);
      ("origin", option_to_yojson origin_to_yojson x.origin);
      ("originPublicDNS", option_to_yojson string__to_yojson x.origin_public_dn_s);
      ("defaultCacheBehavior", option_to_yojson cache_behavior_to_yojson x.default_cache_behavior);
      ("cacheBehaviorSettings", option_to_yojson cache_settings_to_yojson x.cache_behavior_settings);
      ("cacheBehaviors", option_to_yojson cache_behavior_list_to_yojson x.cache_behaviors);
      ("ableToUpdateBundle", option_to_yojson boolean__to_yojson x.able_to_update_bundle);
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "viewerMinimumTlsProtocolVersion",
        option_to_yojson string__to_yojson x.viewer_minimum_tls_protocol_version );
    ]

let create_distribution_result_to_yojson (x : create_distribution_result) =
  assoc_to_yojson
    [
      ("distribution", option_to_yojson lightsail_distribution_to_yojson x.distribution);
      ("operation", option_to_yojson operation_to_yojson x.operation);
    ]

let viewer_minimum_tls_protocol_version_enum_to_yojson
    (x : viewer_minimum_tls_protocol_version_enum) =
  match x with
  | TLSv11_2016 -> `String "TLSv1.1_2016"
  | TLSv12_2018 -> `String "TLSv1.2_2018"
  | TLSv12_2019 -> `String "TLSv1.2_2019"
  | TLSv12_2021 -> `String "TLSv1.2_2021"

let input_origin_to_yojson (x : input_origin) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("regionName", option_to_yojson region_name_to_yojson x.region_name);
      ("protocolPolicy", option_to_yojson origin_protocol_policy_enum_to_yojson x.protocol_policy);
      ("responseTimeout", option_to_yojson integer_to_yojson x.response_timeout);
      ("ipAddressType", option_to_yojson origin_ip_address_type_enum_to_yojson x.ip_address_type);
    ]

let create_distribution_request_to_yojson (x : create_distribution_request) =
  assoc_to_yojson
    [
      ("distributionName", Some (resource_name_to_yojson x.distribution_name));
      ("origin", Some (input_origin_to_yojson x.origin));
      ("defaultCacheBehavior", Some (cache_behavior_to_yojson x.default_cache_behavior));
      ("cacheBehaviorSettings", option_to_yojson cache_settings_to_yojson x.cache_behavior_settings);
      ("cacheBehaviors", option_to_yojson cache_behavior_list_to_yojson x.cache_behaviors);
      ("bundleId", Some (string__to_yojson x.bundle_id));
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("certificateName", option_to_yojson resource_name_to_yojson x.certificate_name);
      ( "viewerMinimumTlsProtocolVersion",
        option_to_yojson viewer_minimum_tls_protocol_version_enum_to_yojson
          x.viewer_minimum_tls_protocol_version );
    ]

let create_domain_result_to_yojson (x : create_domain_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let create_domain_request_to_yojson (x : create_domain_request) =
  assoc_to_yojson
    [
      ("domainName", Some (domain_name_to_yojson x.domain_name));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_domain_entry_result_to_yojson (x : create_domain_entry_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let domain_entry_options_keys_to_yojson = string_to_yojson

let domain_entry_options_to_yojson tree =
  map_to_yojson domain_entry_options_keys_to_yojson string__to_yojson tree

let domain_entry_type_to_yojson = string_to_yojson

let domain_entry_to_yojson (x : domain_entry) =
  assoc_to_yojson
    [
      ("id", option_to_yojson non_empty_string_to_yojson x.id);
      ("name", option_to_yojson domain_name_to_yojson x.name);
      ("target", option_to_yojson string__to_yojson x.target);
      ("isAlias", option_to_yojson boolean__to_yojson x.is_alias);
      ("type", option_to_yojson domain_entry_type_to_yojson x.type_);
      ("options", option_to_yojson domain_entry_options_to_yojson x.options);
    ]

let create_domain_entry_request_to_yojson (x : create_domain_entry_request) =
  assoc_to_yojson
    [
      ("domainName", Some (domain_name_to_yojson x.domain_name));
      ("domainEntry", Some (domain_entry_to_yojson x.domain_entry));
    ]

let sensitive_non_empty_string_to_yojson = string_to_yojson

let session_to_yojson (x : session) =
  assoc_to_yojson
    [
      ("name", option_to_yojson non_empty_string_to_yojson x.name);
      ("url", option_to_yojson sensitive_non_empty_string_to_yojson x.url);
      ("isPrimary", option_to_yojson boolean__to_yojson x.is_primary);
    ]

let sessions_to_yojson tree = list_to_yojson session_to_yojson tree

let status_to_yojson (x : status) =
  match x with
  | StartExpired -> `String "startExpired"
  | NotStarted -> `String "notStarted"
  | Started -> `String "started"
  | Starting -> `String "starting"
  | Stopped -> `String "stopped"
  | Stopping -> `String "stopping"
  | SettingUpInstance -> `String "settingUpInstance"
  | FailedInstanceCreation -> `String "failedInstanceCreation"
  | FailedStartingGUISession -> `String "failedStartingGUISession"
  | FailedStoppingGUISession -> `String "failedStoppingGUISession"

let create_gui_session_access_details_result_to_yojson
    (x : create_gui_session_access_details_result) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson resource_name_to_yojson x.resource_name);
      ("status", option_to_yojson status_to_yojson x.status);
      ("percentageComplete", option_to_yojson integer_to_yojson x.percentage_complete);
      ("failureReason", option_to_yojson string__to_yojson x.failure_reason);
      ("sessions", option_to_yojson sessions_to_yojson x.sessions);
    ]

let create_gui_session_access_details_request_to_yojson
    (x : create_gui_session_access_details_request) =
  assoc_to_yojson [ ("resourceName", Some (resource_name_to_yojson x.resource_name)) ]

let create_instance_snapshot_result_to_yojson (x : create_instance_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let create_instance_snapshot_request_to_yojson (x : create_instance_snapshot_request) =
  assoc_to_yojson
    [
      ("instanceSnapshotName", Some (resource_name_to_yojson x.instance_snapshot_name));
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_instances_result_to_yojson (x : create_instances_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let create_instances_request_to_yojson (x : create_instances_request) =
  assoc_to_yojson
    [
      ("instanceNames", Some (string_list_to_yojson x.instance_names));
      ("availabilityZone", Some (string__to_yojson x.availability_zone));
      ("customImageName", option_to_yojson resource_name_to_yojson x.custom_image_name);
      ("blueprintId", Some (non_empty_string_to_yojson x.blueprint_id));
      ("bundleId", Some (non_empty_string_to_yojson x.bundle_id));
      ("userData", option_to_yojson string__to_yojson x.user_data);
      ("keyPairName", option_to_yojson resource_name_to_yojson x.key_pair_name);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("addOns", option_to_yojson add_on_request_list_to_yojson x.add_ons);
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
    ]

let create_instances_from_snapshot_result_to_yojson (x : create_instances_from_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let create_instances_from_snapshot_request_to_yojson (x : create_instances_from_snapshot_request) =
  assoc_to_yojson
    [
      ("instanceNames", Some (string_list_to_yojson x.instance_names));
      ("attachedDiskMapping", option_to_yojson attached_disk_map_to_yojson x.attached_disk_mapping);
      ("availabilityZone", Some (string__to_yojson x.availability_zone));
      ("instanceSnapshotName", option_to_yojson resource_name_to_yojson x.instance_snapshot_name);
      ("bundleId", Some (non_empty_string_to_yojson x.bundle_id));
      ("userData", option_to_yojson string__to_yojson x.user_data);
      ("keyPairName", option_to_yojson resource_name_to_yojson x.key_pair_name);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("addOns", option_to_yojson add_on_request_list_to_yojson x.add_ons);
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("sourceInstanceName", option_to_yojson string__to_yojson x.source_instance_name);
      ("restoreDate", option_to_yojson string__to_yojson x.restore_date);
      ( "useLatestRestorableAutoSnapshot",
        option_to_yojson boolean__to_yojson x.use_latest_restorable_auto_snapshot );
    ]

let key_pair_to_yojson (x : key_pair) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("fingerprint", option_to_yojson base64_to_yojson x.fingerprint);
    ]

let create_key_pair_result_to_yojson (x : create_key_pair_result) =
  assoc_to_yojson
    [
      ("keyPair", option_to_yojson key_pair_to_yojson x.key_pair);
      ("publicKeyBase64", option_to_yojson base64_to_yojson x.public_key_base64);
      ("privateKeyBase64", option_to_yojson base64_to_yojson x.private_key_base64);
      ("operation", option_to_yojson operation_to_yojson x.operation);
    ]

let create_key_pair_request_to_yojson (x : create_key_pair_request) =
  assoc_to_yojson
    [
      ("keyPairName", Some (resource_name_to_yojson x.key_pair_name));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_load_balancer_result_to_yojson (x : create_load_balancer_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let domain_name_list_to_yojson tree = list_to_yojson domain_name_to_yojson tree

let create_load_balancer_request_to_yojson (x : create_load_balancer_request) =
  assoc_to_yojson
    [
      ("loadBalancerName", Some (resource_name_to_yojson x.load_balancer_name));
      ("instancePort", Some (port_to_yojson x.instance_port));
      ("healthCheckPath", option_to_yojson string__to_yojson x.health_check_path);
      ("certificateName", option_to_yojson resource_name_to_yojson x.certificate_name);
      ("certificateDomainName", option_to_yojson domain_name_to_yojson x.certificate_domain_name);
      ( "certificateAlternativeNames",
        option_to_yojson domain_name_list_to_yojson x.certificate_alternative_names );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("tlsPolicyName", option_to_yojson string__to_yojson x.tls_policy_name);
    ]

let create_load_balancer_tls_certificate_result_to_yojson
    (x : create_load_balancer_tls_certificate_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let create_load_balancer_tls_certificate_request_to_yojson
    (x : create_load_balancer_tls_certificate_request) =
  assoc_to_yojson
    [
      ("loadBalancerName", Some (resource_name_to_yojson x.load_balancer_name));
      ("certificateName", Some (resource_name_to_yojson x.certificate_name));
      ("certificateDomainName", Some (domain_name_to_yojson x.certificate_domain_name));
      ( "certificateAlternativeNames",
        option_to_yojson domain_name_list_to_yojson x.certificate_alternative_names );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_relational_database_result_to_yojson (x : create_relational_database_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let sensitive_string_to_yojson = string_to_yojson

let create_relational_database_request_to_yojson (x : create_relational_database_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ("availabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("relationalDatabaseBlueprintId", Some (string__to_yojson x.relational_database_blueprint_id));
      ("relationalDatabaseBundleId", Some (string__to_yojson x.relational_database_bundle_id));
      ("masterDatabaseName", Some (string__to_yojson x.master_database_name));
      ("masterUsername", Some (string__to_yojson x.master_username));
      ("masterUserPassword", option_to_yojson sensitive_string_to_yojson x.master_user_password);
      ("preferredBackupWindow", option_to_yojson string__to_yojson x.preferred_backup_window);
      ( "preferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ("publiclyAccessible", option_to_yojson boolean__to_yojson x.publicly_accessible);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_relational_database_from_snapshot_result_to_yojson
    (x : create_relational_database_from_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let create_relational_database_from_snapshot_request_to_yojson
    (x : create_relational_database_from_snapshot_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ("availabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("publiclyAccessible", option_to_yojson boolean__to_yojson x.publicly_accessible);
      ( "relationalDatabaseSnapshotName",
        option_to_yojson resource_name_to_yojson x.relational_database_snapshot_name );
      ( "relationalDatabaseBundleId",
        option_to_yojson string__to_yojson x.relational_database_bundle_id );
      ( "sourceRelationalDatabaseName",
        option_to_yojson resource_name_to_yojson x.source_relational_database_name );
      ("restoreTime", option_to_yojson iso_date_to_yojson x.restore_time);
      ("useLatestRestorableTime", option_to_yojson boolean__to_yojson x.use_latest_restorable_time);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_relational_database_snapshot_result_to_yojson
    (x : create_relational_database_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let create_relational_database_snapshot_request_to_yojson
    (x : create_relational_database_snapshot_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ( "relationalDatabaseSnapshotName",
        Some (resource_name_to_yojson x.relational_database_snapshot_name) );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let delete_alarm_result_to_yojson (x : delete_alarm_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_alarm_request_to_yojson (x : delete_alarm_request) =
  assoc_to_yojson [ ("alarmName", Some (resource_name_to_yojson x.alarm_name)) ]

let delete_auto_snapshot_result_to_yojson (x : delete_auto_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_auto_snapshot_request_to_yojson (x : delete_auto_snapshot_request) =
  assoc_to_yojson
    [
      ("resourceName", Some (resource_name_to_yojson x.resource_name));
      ("date", Some (auto_snapshot_date_to_yojson x.date));
    ]

let delete_bucket_result_to_yojson (x : delete_bucket_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_bucket_request_to_yojson (x : delete_bucket_request) =
  assoc_to_yojson
    [
      ("bucketName", Some (bucket_name_to_yojson x.bucket_name));
      ("forceDelete", option_to_yojson boolean__to_yojson x.force_delete);
    ]

let delete_bucket_access_key_result_to_yojson (x : delete_bucket_access_key_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_bucket_access_key_request_to_yojson (x : delete_bucket_access_key_request) =
  assoc_to_yojson
    [
      ("bucketName", Some (bucket_name_to_yojson x.bucket_name));
      ("accessKeyId", Some (non_empty_string_to_yojson x.access_key_id));
    ]

let delete_certificate_result_to_yojson (x : delete_certificate_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_certificate_request_to_yojson (x : delete_certificate_request) =
  assoc_to_yojson [ ("certificateName", Some (certificate_name_to_yojson x.certificate_name)) ]

let delete_contact_method_result_to_yojson (x : delete_contact_method_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_contact_method_request_to_yojson (x : delete_contact_method_request) =
  assoc_to_yojson [ ("protocol", Some (contact_protocol_to_yojson x.protocol)) ]

let delete_container_image_result_to_yojson = unit_to_yojson

let delete_container_image_request_to_yojson (x : delete_container_image_request) =
  assoc_to_yojson
    [
      ("serviceName", Some (container_service_name_to_yojson x.service_name));
      ("image", Some (string__to_yojson x.image));
    ]

let delete_container_service_result_to_yojson = unit_to_yojson

let delete_container_service_request_to_yojson (x : delete_container_service_request) =
  assoc_to_yojson [ ("serviceName", Some (container_service_name_to_yojson x.service_name)) ]

let delete_disk_result_to_yojson (x : delete_disk_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_disk_request_to_yojson (x : delete_disk_request) =
  assoc_to_yojson
    [
      ("diskName", Some (resource_name_to_yojson x.disk_name));
      ("forceDeleteAddOns", option_to_yojson boolean__to_yojson x.force_delete_add_ons);
    ]

let delete_disk_snapshot_result_to_yojson (x : delete_disk_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_disk_snapshot_request_to_yojson (x : delete_disk_snapshot_request) =
  assoc_to_yojson [ ("diskSnapshotName", Some (resource_name_to_yojson x.disk_snapshot_name)) ]

let delete_distribution_result_to_yojson (x : delete_distribution_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let delete_distribution_request_to_yojson (x : delete_distribution_request) =
  assoc_to_yojson
    [ ("distributionName", option_to_yojson resource_name_to_yojson x.distribution_name) ]

let delete_domain_result_to_yojson (x : delete_domain_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let delete_domain_request_to_yojson (x : delete_domain_request) =
  assoc_to_yojson [ ("domainName", Some (domain_name_to_yojson x.domain_name)) ]

let delete_domain_entry_result_to_yojson (x : delete_domain_entry_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let delete_domain_entry_request_to_yojson (x : delete_domain_entry_request) =
  assoc_to_yojson
    [
      ("domainName", Some (domain_name_to_yojson x.domain_name));
      ("domainEntry", Some (domain_entry_to_yojson x.domain_entry));
    ]

let delete_instance_result_to_yojson (x : delete_instance_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_instance_request_to_yojson (x : delete_instance_request) =
  assoc_to_yojson
    [
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
      ("forceDeleteAddOns", option_to_yojson boolean__to_yojson x.force_delete_add_ons);
    ]

let delete_instance_snapshot_result_to_yojson (x : delete_instance_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_instance_snapshot_request_to_yojson (x : delete_instance_snapshot_request) =
  assoc_to_yojson
    [ ("instanceSnapshotName", Some (resource_name_to_yojson x.instance_snapshot_name)) ]

let delete_key_pair_result_to_yojson (x : delete_key_pair_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let delete_key_pair_request_to_yojson (x : delete_key_pair_request) =
  assoc_to_yojson
    [
      ("keyPairName", Some (resource_name_to_yojson x.key_pair_name));
      ("expectedFingerprint", option_to_yojson string__to_yojson x.expected_fingerprint);
    ]

let delete_known_host_keys_result_to_yojson (x : delete_known_host_keys_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_known_host_keys_request_to_yojson (x : delete_known_host_keys_request) =
  assoc_to_yojson [ ("instanceName", Some (resource_name_to_yojson x.instance_name)) ]

let delete_load_balancer_result_to_yojson (x : delete_load_balancer_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_load_balancer_request_to_yojson (x : delete_load_balancer_request) =
  assoc_to_yojson [ ("loadBalancerName", Some (resource_name_to_yojson x.load_balancer_name)) ]

let delete_load_balancer_tls_certificate_result_to_yojson
    (x : delete_load_balancer_tls_certificate_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_load_balancer_tls_certificate_request_to_yojson
    (x : delete_load_balancer_tls_certificate_request) =
  assoc_to_yojson
    [
      ("loadBalancerName", Some (resource_name_to_yojson x.load_balancer_name));
      ("certificateName", Some (resource_name_to_yojson x.certificate_name));
      ("force", option_to_yojson boolean__to_yojson x.force);
    ]

let delete_relational_database_result_to_yojson (x : delete_relational_database_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_relational_database_request_to_yojson (x : delete_relational_database_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ("skipFinalSnapshot", option_to_yojson boolean__to_yojson x.skip_final_snapshot);
      ( "finalRelationalDatabaseSnapshotName",
        option_to_yojson resource_name_to_yojson x.final_relational_database_snapshot_name );
    ]

let delete_relational_database_snapshot_result_to_yojson
    (x : delete_relational_database_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let delete_relational_database_snapshot_request_to_yojson
    (x : delete_relational_database_snapshot_request) =
  assoc_to_yojson
    [
      ( "relationalDatabaseSnapshotName",
        Some (resource_name_to_yojson x.relational_database_snapshot_name) );
    ]

let detach_certificate_from_distribution_result_to_yojson
    (x : detach_certificate_from_distribution_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let detach_certificate_from_distribution_request_to_yojson
    (x : detach_certificate_from_distribution_request) =
  assoc_to_yojson [ ("distributionName", Some (resource_name_to_yojson x.distribution_name)) ]

let detach_disk_result_to_yojson (x : detach_disk_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let detach_disk_request_to_yojson (x : detach_disk_request) =
  assoc_to_yojson [ ("diskName", Some (resource_name_to_yojson x.disk_name)) ]

let detach_instances_from_load_balancer_result_to_yojson
    (x : detach_instances_from_load_balancer_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let detach_instances_from_load_balancer_request_to_yojson
    (x : detach_instances_from_load_balancer_request) =
  assoc_to_yojson
    [
      ("loadBalancerName", Some (resource_name_to_yojson x.load_balancer_name));
      ("instanceNames", Some (resource_name_list_to_yojson x.instance_names));
    ]

let detach_static_ip_result_to_yojson (x : detach_static_ip_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let detach_static_ip_request_to_yojson (x : detach_static_ip_request) =
  assoc_to_yojson [ ("staticIpName", Some (resource_name_to_yojson x.static_ip_name)) ]

let disable_add_on_result_to_yojson (x : disable_add_on_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let disable_add_on_request_to_yojson (x : disable_add_on_request) =
  assoc_to_yojson
    [
      ("addOnType", Some (add_on_type_to_yojson x.add_on_type));
      ("resourceName", Some (resource_name_to_yojson x.resource_name));
    ]

let disk_state_to_yojson (x : disk_state) =
  match x with
  | Pending -> `String "pending"
  | Error_ -> `String "error"
  | Available -> `String "available"
  | InUse -> `String "in-use"
  | Unknown -> `String "unknown"

let disk_to_yojson (x : disk) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("addOns", option_to_yojson add_on_list_to_yojson x.add_ons);
      ("sizeInGb", option_to_yojson integer_to_yojson x.size_in_gb);
      ("isSystemDisk", option_to_yojson boolean__to_yojson x.is_system_disk);
      ("iops", option_to_yojson integer_to_yojson x.iops);
      ("path", option_to_yojson string__to_yojson x.path);
      ("state", option_to_yojson disk_state_to_yojson x.state);
      ("attachedTo", option_to_yojson resource_name_to_yojson x.attached_to);
      ("isAttached", option_to_yojson boolean__to_yojson x.is_attached);
      ("attachmentState", option_to_yojson string__to_yojson x.attachment_state);
      ("gbInUse", option_to_yojson integer_to_yojson x.gb_in_use);
      ("autoMountStatus", option_to_yojson auto_mount_status_to_yojson x.auto_mount_status);
    ]

let disk_info_to_yojson (x : disk_info) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("path", option_to_yojson non_empty_string_to_yojson x.path);
      ("sizeInGb", option_to_yojson integer_to_yojson x.size_in_gb);
      ("isSystemDisk", option_to_yojson boolean__to_yojson x.is_system_disk);
    ]

let disk_info_list_to_yojson tree = list_to_yojson disk_info_to_yojson tree
let disk_list_to_yojson tree = list_to_yojson disk_to_yojson tree

let disk_snapshot_state_to_yojson (x : disk_snapshot_state) =
  match x with
  | Pending -> `String "pending"
  | Completed -> `String "completed"
  | Error_ -> `String "error"
  | Unknown -> `String "unknown"

let disk_snapshot_to_yojson (x : disk_snapshot) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("sizeInGb", option_to_yojson integer_to_yojson x.size_in_gb);
      ("state", option_to_yojson disk_snapshot_state_to_yojson x.state);
      ("progress", option_to_yojson string__to_yojson x.progress);
      ("fromDiskName", option_to_yojson resource_name_to_yojson x.from_disk_name);
      ("fromDiskArn", option_to_yojson non_empty_string_to_yojson x.from_disk_arn);
      ("fromInstanceName", option_to_yojson resource_name_to_yojson x.from_instance_name);
      ("fromInstanceArn", option_to_yojson non_empty_string_to_yojson x.from_instance_arn);
      ("isFromAutoSnapshot", option_to_yojson boolean__to_yojson x.is_from_auto_snapshot);
    ]

let disk_snapshot_info_to_yojson (x : disk_snapshot_info) =
  assoc_to_yojson [ ("sizeInGb", option_to_yojson integer_to_yojson x.size_in_gb) ]

let disk_snapshot_list_to_yojson tree = list_to_yojson disk_snapshot_to_yojson tree

let distribution_bundle_to_yojson (x : distribution_bundle) =
  assoc_to_yojson
    [
      ("bundleId", option_to_yojson string__to_yojson x.bundle_id);
      ("name", option_to_yojson string__to_yojson x.name);
      ("price", option_to_yojson float__to_yojson x.price);
      ("transferPerMonthInGb", option_to_yojson integer_to_yojson x.transfer_per_month_in_gb);
      ("isActive", option_to_yojson boolean__to_yojson x.is_active);
    ]

let distribution_bundle_list_to_yojson tree = list_to_yojson distribution_bundle_to_yojson tree
let distribution_list_to_yojson tree = list_to_yojson lightsail_distribution_to_yojson tree

let distribution_metric_name_to_yojson (x : distribution_metric_name) =
  match x with
  | Requests -> `String "Requests"
  | BytesDownloaded -> `String "BytesDownloaded"
  | BytesUploaded -> `String "BytesUploaded"
  | TotalErrorRate -> `String "TotalErrorRate"
  | Http4xxErrorRate -> `String "Http4xxErrorRate"
  | Http5xxErrorRate -> `String "Http5xxErrorRate"

let r53_hosted_zone_deletion_state_code_to_yojson (x : r53_hosted_zone_deletion_state_code) =
  match x with
  | Succeeded -> `String "SUCCEEDED"
  | Pending -> `String "PENDING"
  | Failed -> `String "FAILED"
  | Started -> `String "STARTED"

let r53_hosted_zone_deletion_state_to_yojson (x : r53_hosted_zone_deletion_state) =
  assoc_to_yojson
    [
      ("code", option_to_yojson r53_hosted_zone_deletion_state_code_to_yojson x.code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let name_servers_update_state_code_to_yojson (x : name_servers_update_state_code) =
  match x with
  | Succeeded -> `String "SUCCEEDED"
  | Pending -> `String "PENDING"
  | Failed -> `String "FAILED"
  | Started -> `String "STARTED"

let name_servers_update_state_to_yojson (x : name_servers_update_state) =
  assoc_to_yojson
    [
      ("code", option_to_yojson name_servers_update_state_code_to_yojson x.code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let registered_domain_delegation_info_to_yojson (x : registered_domain_delegation_info) =
  assoc_to_yojson
    [
      ( "nameServersUpdateState",
        option_to_yojson name_servers_update_state_to_yojson x.name_servers_update_state );
      ( "r53HostedZoneDeletionState",
        option_to_yojson r53_hosted_zone_deletion_state_to_yojson x.r53_hosted_zone_deletion_state
      );
    ]

let domain_entry_list_to_yojson tree = list_to_yojson domain_entry_to_yojson tree

let domain_to_yojson (x : domain) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("domainEntries", option_to_yojson domain_entry_list_to_yojson x.domain_entries);
      ( "registeredDomainDelegationInfo",
        option_to_yojson registered_domain_delegation_info_to_yojson
          x.registered_domain_delegation_info );
    ]

let domain_list_to_yojson tree = list_to_yojson domain_to_yojson tree

let download_default_key_pair_result_to_yojson (x : download_default_key_pair_result) =
  assoc_to_yojson
    [
      ("publicKeyBase64", option_to_yojson base64_to_yojson x.public_key_base64);
      ("privateKeyBase64", option_to_yojson base64_to_yojson x.private_key_base64);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
    ]

let download_default_key_pair_request_to_yojson = unit_to_yojson
let email_address_to_yojson = string_to_yojson

let enable_add_on_result_to_yojson (x : enable_add_on_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let enable_add_on_request_to_yojson (x : enable_add_on_request) =
  assoc_to_yojson
    [
      ("resourceName", Some (resource_name_to_yojson x.resource_name));
      ("addOnRequest", Some (add_on_request_to_yojson x.add_on_request));
    ]

let export_snapshot_result_to_yojson (x : export_snapshot_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let export_snapshot_request_to_yojson (x : export_snapshot_request) =
  assoc_to_yojson [ ("sourceSnapshotName", Some (resource_name_to_yojson x.source_snapshot_name)) ]

let instance_snapshot_info_to_yojson (x : instance_snapshot_info) =
  assoc_to_yojson
    [
      ("fromBundleId", option_to_yojson non_empty_string_to_yojson x.from_bundle_id);
      ("fromBlueprintId", option_to_yojson non_empty_string_to_yojson x.from_blueprint_id);
      ("fromDiskInfo", option_to_yojson disk_info_list_to_yojson x.from_disk_info);
    ]

let export_snapshot_record_source_type_to_yojson (x : export_snapshot_record_source_type) =
  match x with
  | InstanceSnapshot -> `String "InstanceSnapshot"
  | DiskSnapshot -> `String "DiskSnapshot"

let export_snapshot_record_source_info_to_yojson (x : export_snapshot_record_source_info) =
  assoc_to_yojson
    [
      ("resourceType", option_to_yojson export_snapshot_record_source_type_to_yojson x.resource_type);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("name", option_to_yojson non_empty_string_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("fromResourceName", option_to_yojson non_empty_string_to_yojson x.from_resource_name);
      ("fromResourceArn", option_to_yojson non_empty_string_to_yojson x.from_resource_arn);
      ( "instanceSnapshotInfo",
        option_to_yojson instance_snapshot_info_to_yojson x.instance_snapshot_info );
      ("diskSnapshotInfo", option_to_yojson disk_snapshot_info_to_yojson x.disk_snapshot_info);
    ]

let export_snapshot_record_to_yojson (x : export_snapshot_record) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("state", option_to_yojson record_state_to_yojson x.state);
      ("sourceInfo", option_to_yojson export_snapshot_record_source_info_to_yojson x.source_info);
      ("destinationInfo", option_to_yojson destination_info_to_yojson x.destination_info);
    ]

let export_snapshot_record_list_to_yojson tree =
  list_to_yojson export_snapshot_record_to_yojson tree

let get_active_names_result_to_yojson (x : get_active_names_result) =
  assoc_to_yojson
    [
      ("activeNames", option_to_yojson string_list_to_yojson x.active_names);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_active_names_request_to_yojson (x : get_active_names_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let get_alarms_result_to_yojson (x : get_alarms_result) =
  assoc_to_yojson
    [
      ("alarms", option_to_yojson alarms_list_to_yojson x.alarms);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_alarms_request_to_yojson (x : get_alarms_request) =
  assoc_to_yojson
    [
      ("alarmName", option_to_yojson resource_name_to_yojson x.alarm_name);
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
      ("monitoredResourceName", option_to_yojson resource_name_to_yojson x.monitored_resource_name);
    ]

let get_auto_snapshots_result_to_yojson (x : get_auto_snapshots_result) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson resource_name_to_yojson x.resource_name);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("autoSnapshots", option_to_yojson auto_snapshot_details_list_to_yojson x.auto_snapshots);
    ]

let get_auto_snapshots_request_to_yojson (x : get_auto_snapshots_request) =
  assoc_to_yojson [ ("resourceName", Some (resource_name_to_yojson x.resource_name)) ]

let get_blueprints_result_to_yojson (x : get_blueprints_result) =
  assoc_to_yojson
    [
      ("blueprints", option_to_yojson blueprint_list_to_yojson x.blueprints);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_blueprints_request_to_yojson (x : get_blueprints_request) =
  assoc_to_yojson
    [
      ("includeInactive", option_to_yojson boolean__to_yojson x.include_inactive);
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
      ("appCategory", option_to_yojson app_category_to_yojson x.app_category);
    ]

let get_bucket_access_keys_result_to_yojson (x : get_bucket_access_keys_result) =
  assoc_to_yojson [ ("accessKeys", option_to_yojson access_key_list_to_yojson x.access_keys) ]

let get_bucket_access_keys_request_to_yojson (x : get_bucket_access_keys_request) =
  assoc_to_yojson [ ("bucketName", Some (bucket_name_to_yojson x.bucket_name)) ]

let get_bucket_bundles_result_to_yojson (x : get_bucket_bundles_result) =
  assoc_to_yojson [ ("bundles", option_to_yojson bucket_bundle_list_to_yojson x.bundles) ]

let get_bucket_bundles_request_to_yojson (x : get_bucket_bundles_request) =
  assoc_to_yojson [ ("includeInactive", option_to_yojson boolean__to_yojson x.include_inactive) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let metric_datapoint_to_yojson (x : metric_datapoint) =
  assoc_to_yojson
    [
      ("average", option_to_yojson double_to_yojson x.average);
      ("maximum", option_to_yojson double_to_yojson x.maximum);
      ("minimum", option_to_yojson double_to_yojson x.minimum);
      ("sampleCount", option_to_yojson double_to_yojson x.sample_count);
      ("sum", option_to_yojson double_to_yojson x.sum);
      ("timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("unit", option_to_yojson metric_unit_to_yojson x.unit_);
    ]

let metric_datapoint_list_to_yojson tree = list_to_yojson metric_datapoint_to_yojson tree

let get_bucket_metric_data_result_to_yojson (x : get_bucket_metric_data_result) =
  assoc_to_yojson
    [
      ("metricName", option_to_yojson bucket_metric_name_to_yojson x.metric_name);
      ("metricData", option_to_yojson metric_datapoint_list_to_yojson x.metric_data);
    ]

let metric_statistic_list_to_yojson tree = list_to_yojson metric_statistic_to_yojson tree

let get_bucket_metric_data_request_to_yojson (x : get_bucket_metric_data_request) =
  assoc_to_yojson
    [
      ("bucketName", Some (bucket_name_to_yojson x.bucket_name));
      ("metricName", Some (bucket_metric_name_to_yojson x.metric_name));
      ("startTime", Some (iso_date_to_yojson x.start_time));
      ("endTime", Some (iso_date_to_yojson x.end_time));
      ("period", Some (metric_period_to_yojson x.period));
      ("statistics", Some (metric_statistic_list_to_yojson x.statistics));
      ("unit", Some (metric_unit_to_yojson x.unit_));
    ]

let get_buckets_result_to_yojson (x : get_buckets_result) =
  assoc_to_yojson
    [
      ("buckets", option_to_yojson bucket_list_to_yojson x.buckets);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
      ( "accountLevelBpaSync",
        option_to_yojson account_level_bpa_sync_to_yojson x.account_level_bpa_sync );
    ]

let get_buckets_request_to_yojson (x : get_buckets_request) =
  assoc_to_yojson
    [
      ("bucketName", option_to_yojson bucket_name_to_yojson x.bucket_name);
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
      ( "includeConnectedResources",
        option_to_yojson boolean__to_yojson x.include_connected_resources );
      ("includeCors", option_to_yojson boolean__to_yojson x.include_cors);
    ]

let get_bundles_result_to_yojson (x : get_bundles_result) =
  assoc_to_yojson
    [
      ("bundles", option_to_yojson bundle_list_to_yojson x.bundles);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_bundles_request_to_yojson (x : get_bundles_request) =
  assoc_to_yojson
    [
      ("includeInactive", option_to_yojson boolean__to_yojson x.include_inactive);
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
      ("appCategory", option_to_yojson app_category_to_yojson x.app_category);
    ]

let get_certificates_result_to_yojson (x : get_certificates_result) =
  assoc_to_yojson
    [
      ("certificates", option_to_yojson certificate_summary_list_to_yojson x.certificates);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let include_certificate_details_to_yojson = bool_to_yojson

let get_certificates_request_to_yojson (x : get_certificates_request) =
  assoc_to_yojson
    [
      ( "certificateStatuses",
        option_to_yojson certificate_status_list_to_yojson x.certificate_statuses );
      ( "includeCertificateDetails",
        option_to_yojson include_certificate_details_to_yojson x.include_certificate_details );
      ("certificateName", option_to_yojson certificate_name_to_yojson x.certificate_name);
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
    ]

let get_cloud_formation_stack_records_result_to_yojson
    (x : get_cloud_formation_stack_records_result) =
  assoc_to_yojson
    [
      ( "cloudFormationStackRecords",
        option_to_yojson cloud_formation_stack_record_list_to_yojson x.cloud_formation_stack_records
      );
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_cloud_formation_stack_records_request_to_yojson
    (x : get_cloud_formation_stack_records_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let get_contact_methods_result_to_yojson (x : get_contact_methods_result) =
  assoc_to_yojson
    [ ("contactMethods", option_to_yojson contact_methods_list_to_yojson x.contact_methods) ]

let get_contact_methods_request_to_yojson (x : get_contact_methods_request) =
  assoc_to_yojson [ ("protocols", option_to_yojson contact_protocols_list_to_yojson x.protocols) ]

let get_container_api_metadata_result_to_yojson (x : get_container_api_metadata_result) =
  assoc_to_yojson
    [ ("metadata", option_to_yojson container_service_metadata_entry_list_to_yojson x.metadata) ]

let get_container_api_metadata_request_to_yojson = unit_to_yojson

let get_container_images_result_to_yojson (x : get_container_images_result) =
  assoc_to_yojson
    [ ("containerImages", option_to_yojson container_image_list_to_yojson x.container_images) ]

let get_container_images_request_to_yojson (x : get_container_images_request) =
  assoc_to_yojson [ ("serviceName", Some (container_service_name_to_yojson x.service_name)) ]

let get_container_log_result_to_yojson (x : get_container_log_result) =
  assoc_to_yojson
    [
      ("logEvents", option_to_yojson container_service_log_event_list_to_yojson x.log_events);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_container_log_request_to_yojson (x : get_container_log_request) =
  assoc_to_yojson
    [
      ("serviceName", Some (container_service_name_to_yojson x.service_name));
      ("containerName", Some (string__to_yojson x.container_name));
      ("startTime", option_to_yojson iso_date_to_yojson x.start_time);
      ("endTime", option_to_yojson iso_date_to_yojson x.end_time);
      ("filterPattern", option_to_yojson string__to_yojson x.filter_pattern);
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
    ]

let get_container_service_deployments_result_to_yojson
    (x : get_container_service_deployments_result) =
  assoc_to_yojson
    [ ("deployments", option_to_yojson container_service_deployment_list_to_yojson x.deployments) ]

let get_container_service_deployments_request_to_yojson
    (x : get_container_service_deployments_request) =
  assoc_to_yojson [ ("serviceName", Some (container_service_name_to_yojson x.service_name)) ]

let get_container_service_metric_data_result_to_yojson
    (x : get_container_service_metric_data_result) =
  assoc_to_yojson
    [
      ("metricName", option_to_yojson container_service_metric_name_to_yojson x.metric_name);
      ("metricData", option_to_yojson metric_datapoint_list_to_yojson x.metric_data);
    ]

let get_container_service_metric_data_request_to_yojson
    (x : get_container_service_metric_data_request) =
  assoc_to_yojson
    [
      ("serviceName", Some (container_service_name_to_yojson x.service_name));
      ("metricName", Some (container_service_metric_name_to_yojson x.metric_name));
      ("startTime", Some (iso_date_to_yojson x.start_time));
      ("endTime", Some (iso_date_to_yojson x.end_time));
      ("period", Some (metric_period_to_yojson x.period));
      ("statistics", Some (metric_statistic_list_to_yojson x.statistics));
    ]

let get_container_service_powers_result_to_yojson (x : get_container_service_powers_result) =
  assoc_to_yojson [ ("powers", option_to_yojson container_service_power_list_to_yojson x.powers) ]

let get_container_service_powers_request_to_yojson = unit_to_yojson

let get_container_services_request_to_yojson (x : get_container_services_request) =
  assoc_to_yojson
    [ ("serviceName", option_to_yojson container_service_name_to_yojson x.service_name) ]

let resource_budget_estimate_to_yojson (x : resource_budget_estimate) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson resource_name_to_yojson x.resource_name);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("costEstimates", option_to_yojson cost_estimates_to_yojson x.cost_estimates);
      ("startTime", option_to_yojson iso_date_to_yojson x.start_time);
      ("endTime", option_to_yojson iso_date_to_yojson x.end_time);
    ]

let resources_budget_estimate_to_yojson tree =
  list_to_yojson resource_budget_estimate_to_yojson tree

let get_cost_estimate_result_to_yojson (x : get_cost_estimate_result) =
  assoc_to_yojson
    [
      ( "resourcesBudgetEstimate",
        option_to_yojson resources_budget_estimate_to_yojson x.resources_budget_estimate );
    ]

let get_cost_estimate_request_to_yojson (x : get_cost_estimate_request) =
  assoc_to_yojson
    [
      ("resourceName", Some (resource_name_to_yojson x.resource_name));
      ("startTime", Some (iso_date_to_yojson x.start_time));
      ("endTime", Some (iso_date_to_yojson x.end_time));
    ]

let get_disk_result_to_yojson (x : get_disk_result) =
  assoc_to_yojson [ ("disk", option_to_yojson disk_to_yojson x.disk) ]

let get_disk_request_to_yojson (x : get_disk_request) =
  assoc_to_yojson [ ("diskName", Some (resource_name_to_yojson x.disk_name)) ]

let get_disk_snapshot_result_to_yojson (x : get_disk_snapshot_result) =
  assoc_to_yojson [ ("diskSnapshot", option_to_yojson disk_snapshot_to_yojson x.disk_snapshot) ]

let get_disk_snapshot_request_to_yojson (x : get_disk_snapshot_request) =
  assoc_to_yojson [ ("diskSnapshotName", Some (resource_name_to_yojson x.disk_snapshot_name)) ]

let get_disk_snapshots_result_to_yojson (x : get_disk_snapshots_result) =
  assoc_to_yojson
    [
      ("diskSnapshots", option_to_yojson disk_snapshot_list_to_yojson x.disk_snapshots);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_disk_snapshots_request_to_yojson (x : get_disk_snapshots_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let get_disks_result_to_yojson (x : get_disks_result) =
  assoc_to_yojson
    [
      ("disks", option_to_yojson disk_list_to_yojson x.disks);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_disks_request_to_yojson (x : get_disks_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let get_distribution_bundles_result_to_yojson (x : get_distribution_bundles_result) =
  assoc_to_yojson [ ("bundles", option_to_yojson distribution_bundle_list_to_yojson x.bundles) ]

let get_distribution_bundles_request_to_yojson = unit_to_yojson

let get_distribution_latest_cache_reset_result_to_yojson
    (x : get_distribution_latest_cache_reset_result) =
  assoc_to_yojson
    [
      ("status", option_to_yojson string__to_yojson x.status);
      ("createTime", option_to_yojson iso_date_to_yojson x.create_time);
    ]

let get_distribution_latest_cache_reset_request_to_yojson
    (x : get_distribution_latest_cache_reset_request) =
  assoc_to_yojson
    [ ("distributionName", option_to_yojson resource_name_to_yojson x.distribution_name) ]

let get_distribution_metric_data_result_to_yojson (x : get_distribution_metric_data_result) =
  assoc_to_yojson
    [
      ("metricName", option_to_yojson distribution_metric_name_to_yojson x.metric_name);
      ("metricData", option_to_yojson metric_datapoint_list_to_yojson x.metric_data);
    ]

let get_distribution_metric_data_request_to_yojson (x : get_distribution_metric_data_request) =
  assoc_to_yojson
    [
      ("distributionName", Some (resource_name_to_yojson x.distribution_name));
      ("metricName", Some (distribution_metric_name_to_yojson x.metric_name));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ("period", Some (metric_period_to_yojson x.period));
      ("unit", Some (metric_unit_to_yojson x.unit_));
      ("statistics", Some (metric_statistic_list_to_yojson x.statistics));
    ]

let get_distributions_result_to_yojson (x : get_distributions_result) =
  assoc_to_yojson
    [
      ("distributions", option_to_yojson distribution_list_to_yojson x.distributions);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_distributions_request_to_yojson (x : get_distributions_request) =
  assoc_to_yojson
    [
      ("distributionName", option_to_yojson resource_name_to_yojson x.distribution_name);
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
    ]

let get_domain_result_to_yojson (x : get_domain_result) =
  assoc_to_yojson [ ("domain", option_to_yojson domain_to_yojson x.domain) ]

let get_domain_request_to_yojson (x : get_domain_request) =
  assoc_to_yojson [ ("domainName", Some (domain_name_to_yojson x.domain_name)) ]

let get_domains_result_to_yojson (x : get_domains_result) =
  assoc_to_yojson
    [
      ("domains", option_to_yojson domain_list_to_yojson x.domains);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_domains_request_to_yojson (x : get_domains_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let get_export_snapshot_records_result_to_yojson (x : get_export_snapshot_records_result) =
  assoc_to_yojson
    [
      ( "exportSnapshotRecords",
        option_to_yojson export_snapshot_record_list_to_yojson x.export_snapshot_records );
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_export_snapshot_records_request_to_yojson (x : get_export_snapshot_records_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let http_protocol_ipv6_to_yojson (x : http_protocol_ipv6) =
  match x with Disabled -> `String "disabled" | Enabled -> `String "enabled"

let http_endpoint_to_yojson (x : http_endpoint) =
  match x with Disabled -> `String "disabled" | Enabled -> `String "enabled"

let http_tokens_to_yojson (x : http_tokens) =
  match x with Optional -> `String "optional" | Required -> `String "required"

let instance_metadata_state_to_yojson (x : instance_metadata_state) =
  match x with Pending -> `String "pending" | Applied -> `String "applied"

let instance_metadata_options_to_yojson (x : instance_metadata_options) =
  assoc_to_yojson
    [
      ("state", option_to_yojson instance_metadata_state_to_yojson x.state);
      ("httpTokens", option_to_yojson http_tokens_to_yojson x.http_tokens);
      ("httpEndpoint", option_to_yojson http_endpoint_to_yojson x.http_endpoint);
      ("httpPutResponseHopLimit", option_to_yojson integer_to_yojson x.http_put_response_hop_limit);
      ("httpProtocolIpv6", option_to_yojson http_protocol_ipv6_to_yojson x.http_protocol_ipv6);
    ]

let instance_state_to_yojson (x : instance_state) =
  assoc_to_yojson
    [
      ("code", option_to_yojson integer_to_yojson x.code);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let port_access_type_to_yojson (x : port_access_type) =
  match x with Public -> `String "Public" | Private -> `String "Private"

let instance_port_info_to_yojson (x : instance_port_info) =
  assoc_to_yojson
    [
      ("fromPort", option_to_yojson port_to_yojson x.from_port);
      ("toPort", option_to_yojson port_to_yojson x.to_port);
      ("protocol", option_to_yojson network_protocol_to_yojson x.protocol);
      ("accessFrom", option_to_yojson string__to_yojson x.access_from);
      ("accessType", option_to_yojson port_access_type_to_yojson x.access_type);
      ("commonName", option_to_yojson string__to_yojson x.common_name);
      ("accessDirection", option_to_yojson access_direction_to_yojson x.access_direction);
      ("cidrs", option_to_yojson string_list_to_yojson x.cidrs);
      ("ipv6Cidrs", option_to_yojson string_list_to_yojson x.ipv6_cidrs);
      ("cidrListAliases", option_to_yojson string_list_to_yojson x.cidr_list_aliases);
    ]

let instance_port_info_list_to_yojson tree = list_to_yojson instance_port_info_to_yojson tree

let monthly_transfer_to_yojson (x : monthly_transfer) =
  assoc_to_yojson
    [ ("gbPerMonthAllocated", option_to_yojson integer_to_yojson x.gb_per_month_allocated) ]

let instance_networking_to_yojson (x : instance_networking) =
  assoc_to_yojson
    [
      ("monthlyTransfer", option_to_yojson monthly_transfer_to_yojson x.monthly_transfer);
      ("ports", option_to_yojson instance_port_info_list_to_yojson x.ports);
    ]

let instance_hardware_to_yojson (x : instance_hardware) =
  assoc_to_yojson
    [
      ("cpuCount", option_to_yojson integer_to_yojson x.cpu_count);
      ("disks", option_to_yojson disk_list_to_yojson x.disks);
      ("ramSizeInGb", option_to_yojson float__to_yojson x.ram_size_in_gb);
    ]

let ipv6_address_to_yojson = string_to_yojson
let ipv6_address_list_to_yojson tree = list_to_yojson ipv6_address_to_yojson tree
let ip_address_to_yojson = string_to_yojson

let instance_to_yojson (x : instance) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("blueprintId", option_to_yojson non_empty_string_to_yojson x.blueprint_id);
      ("blueprintName", option_to_yojson non_empty_string_to_yojson x.blueprint_name);
      ("bundleId", option_to_yojson non_empty_string_to_yojson x.bundle_id);
      ("addOns", option_to_yojson add_on_list_to_yojson x.add_ons);
      ("isStaticIp", option_to_yojson boolean__to_yojson x.is_static_ip);
      ("privateIpAddress", option_to_yojson ip_address_to_yojson x.private_ip_address);
      ("publicIpAddress", option_to_yojson ip_address_to_yojson x.public_ip_address);
      ("ipv6Addresses", option_to_yojson ipv6_address_list_to_yojson x.ipv6_addresses);
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("hardware", option_to_yojson instance_hardware_to_yojson x.hardware);
      ("networking", option_to_yojson instance_networking_to_yojson x.networking);
      ("state", option_to_yojson instance_state_to_yojson x.state);
      ("username", option_to_yojson non_empty_string_to_yojson x.username);
      ("sshKeyName", option_to_yojson resource_name_to_yojson x.ssh_key_name);
      ("metadataOptions", option_to_yojson instance_metadata_options_to_yojson x.metadata_options);
    ]

let get_instance_result_to_yojson (x : get_instance_result) =
  assoc_to_yojson [ ("instance", option_to_yojson instance_to_yojson x.instance) ]

let get_instance_request_to_yojson (x : get_instance_request) =
  assoc_to_yojson [ ("instanceName", Some (resource_name_to_yojson x.instance_name)) ]

let host_key_attributes_to_yojson (x : host_key_attributes) =
  assoc_to_yojson
    [
      ("algorithm", option_to_yojson string__to_yojson x.algorithm);
      ("publicKey", option_to_yojson string__to_yojson x.public_key);
      ("witnessedAt", option_to_yojson iso_date_to_yojson x.witnessed_at);
      ("fingerprintSHA1", option_to_yojson string__to_yojson x.fingerprint_sh_a1);
      ("fingerprintSHA256", option_to_yojson string__to_yojson x.fingerprint_sh_a256);
      ("notValidBefore", option_to_yojson iso_date_to_yojson x.not_valid_before);
      ("notValidAfter", option_to_yojson iso_date_to_yojson x.not_valid_after);
    ]

let host_keys_list_to_yojson tree = list_to_yojson host_key_attributes_to_yojson tree

let instance_access_protocol_to_yojson (x : instance_access_protocol) =
  match x with Ssh -> `String "ssh" | Rdp -> `String "rdp"

let password_data_to_yojson (x : password_data) =
  assoc_to_yojson
    [
      ("ciphertext", option_to_yojson string__to_yojson x.ciphertext);
      ("keyPairName", option_to_yojson resource_name_to_yojson x.key_pair_name);
    ]

let instance_access_details_to_yojson (x : instance_access_details) =
  assoc_to_yojson
    [
      ("certKey", option_to_yojson string__to_yojson x.cert_key);
      ("expiresAt", option_to_yojson iso_date_to_yojson x.expires_at);
      ("ipAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("ipv6Addresses", option_to_yojson ipv6_address_list_to_yojson x.ipv6_addresses);
      ("password", option_to_yojson string__to_yojson x.password);
      ("passwordData", option_to_yojson password_data_to_yojson x.password_data);
      ("privateKey", option_to_yojson string__to_yojson x.private_key);
      ("protocol", option_to_yojson instance_access_protocol_to_yojson x.protocol);
      ("instanceName", option_to_yojson resource_name_to_yojson x.instance_name);
      ("username", option_to_yojson string__to_yojson x.username);
      ("hostKeys", option_to_yojson host_keys_list_to_yojson x.host_keys);
    ]

let get_instance_access_details_result_to_yojson (x : get_instance_access_details_result) =
  assoc_to_yojson
    [ ("accessDetails", option_to_yojson instance_access_details_to_yojson x.access_details) ]

let get_instance_access_details_request_to_yojson (x : get_instance_access_details_request) =
  assoc_to_yojson
    [
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
      ("protocol", option_to_yojson instance_access_protocol_to_yojson x.protocol);
    ]

let instance_metric_name_to_yojson (x : instance_metric_name) =
  match x with
  | CPUUtilization -> `String "CPUUtilization"
  | NetworkIn -> `String "NetworkIn"
  | NetworkOut -> `String "NetworkOut"
  | StatusCheckFailed -> `String "StatusCheckFailed"
  | StatusCheckFailed_Instance -> `String "StatusCheckFailed_Instance"
  | StatusCheckFailed_System -> `String "StatusCheckFailed_System"
  | BurstCapacityTime -> `String "BurstCapacityTime"
  | BurstCapacityPercentage -> `String "BurstCapacityPercentage"
  | MetadataNoToken -> `String "MetadataNoToken"

let get_instance_metric_data_result_to_yojson (x : get_instance_metric_data_result) =
  assoc_to_yojson
    [
      ("metricName", option_to_yojson instance_metric_name_to_yojson x.metric_name);
      ("metricData", option_to_yojson metric_datapoint_list_to_yojson x.metric_data);
    ]

let get_instance_metric_data_request_to_yojson (x : get_instance_metric_data_request) =
  assoc_to_yojson
    [
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
      ("metricName", Some (instance_metric_name_to_yojson x.metric_name));
      ("period", Some (metric_period_to_yojson x.period));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ("unit", Some (metric_unit_to_yojson x.unit_));
      ("statistics", Some (metric_statistic_list_to_yojson x.statistics));
    ]

let port_state_to_yojson (x : port_state) =
  match x with Open -> `String "open" | Closed -> `String "closed"

let instance_port_state_to_yojson (x : instance_port_state) =
  assoc_to_yojson
    [
      ("fromPort", option_to_yojson port_to_yojson x.from_port);
      ("toPort", option_to_yojson port_to_yojson x.to_port);
      ("protocol", option_to_yojson network_protocol_to_yojson x.protocol);
      ("state", option_to_yojson port_state_to_yojson x.state);
      ("cidrs", option_to_yojson string_list_to_yojson x.cidrs);
      ("ipv6Cidrs", option_to_yojson string_list_to_yojson x.ipv6_cidrs);
      ("cidrListAliases", option_to_yojson string_list_to_yojson x.cidr_list_aliases);
    ]

let instance_port_state_list_to_yojson tree = list_to_yojson instance_port_state_to_yojson tree

let get_instance_port_states_result_to_yojson (x : get_instance_port_states_result) =
  assoc_to_yojson
    [ ("portStates", option_to_yojson instance_port_state_list_to_yojson x.port_states) ]

let get_instance_port_states_request_to_yojson (x : get_instance_port_states_request) =
  assoc_to_yojson [ ("instanceName", Some (resource_name_to_yojson x.instance_name)) ]

let instance_snapshot_state_to_yojson (x : instance_snapshot_state) =
  match x with
  | Pending -> `String "pending"
  | Error_ -> `String "error"
  | Available -> `String "available"

let instance_snapshot_to_yojson (x : instance_snapshot) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("state", option_to_yojson instance_snapshot_state_to_yojson x.state);
      ("progress", option_to_yojson string__to_yojson x.progress);
      ("fromAttachedDisks", option_to_yojson disk_list_to_yojson x.from_attached_disks);
      ("fromInstanceName", option_to_yojson resource_name_to_yojson x.from_instance_name);
      ("fromInstanceArn", option_to_yojson non_empty_string_to_yojson x.from_instance_arn);
      ("fromBlueprintId", option_to_yojson string__to_yojson x.from_blueprint_id);
      ("fromBundleId", option_to_yojson string__to_yojson x.from_bundle_id);
      ("isFromAutoSnapshot", option_to_yojson boolean__to_yojson x.is_from_auto_snapshot);
      ("sizeInGb", option_to_yojson integer_to_yojson x.size_in_gb);
    ]

let get_instance_snapshot_result_to_yojson (x : get_instance_snapshot_result) =
  assoc_to_yojson
    [ ("instanceSnapshot", option_to_yojson instance_snapshot_to_yojson x.instance_snapshot) ]

let get_instance_snapshot_request_to_yojson (x : get_instance_snapshot_request) =
  assoc_to_yojson
    [ ("instanceSnapshotName", Some (resource_name_to_yojson x.instance_snapshot_name)) ]

let instance_snapshot_list_to_yojson tree = list_to_yojson instance_snapshot_to_yojson tree

let get_instance_snapshots_result_to_yojson (x : get_instance_snapshots_result) =
  assoc_to_yojson
    [
      ("instanceSnapshots", option_to_yojson instance_snapshot_list_to_yojson x.instance_snapshots);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_instance_snapshots_request_to_yojson (x : get_instance_snapshots_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let get_instance_state_result_to_yojson (x : get_instance_state_result) =
  assoc_to_yojson [ ("state", option_to_yojson instance_state_to_yojson x.state) ]

let get_instance_state_request_to_yojson (x : get_instance_state_request) =
  assoc_to_yojson [ ("instanceName", Some (resource_name_to_yojson x.instance_name)) ]

let instance_list_to_yojson tree = list_to_yojson instance_to_yojson tree

let get_instances_result_to_yojson (x : get_instances_result) =
  assoc_to_yojson
    [
      ("instances", option_to_yojson instance_list_to_yojson x.instances);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_instances_request_to_yojson (x : get_instances_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let get_key_pair_result_to_yojson (x : get_key_pair_result) =
  assoc_to_yojson [ ("keyPair", option_to_yojson key_pair_to_yojson x.key_pair) ]

let get_key_pair_request_to_yojson (x : get_key_pair_request) =
  assoc_to_yojson [ ("keyPairName", Some (resource_name_to_yojson x.key_pair_name)) ]

let key_pair_list_to_yojson tree = list_to_yojson key_pair_to_yojson tree

let get_key_pairs_result_to_yojson (x : get_key_pairs_result) =
  assoc_to_yojson
    [
      ("keyPairs", option_to_yojson key_pair_list_to_yojson x.key_pairs);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_key_pairs_request_to_yojson (x : get_key_pairs_request) =
  assoc_to_yojson
    [
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
      ("includeDefaultKeyPair", option_to_yojson boolean__to_yojson x.include_default_key_pair);
    ]

let load_balancer_attribute_name_to_yojson (x : load_balancer_attribute_name) =
  match x with
  | HealthCheckPath -> `String "HealthCheckPath"
  | SessionStickinessEnabled -> `String "SessionStickinessEnabled"
  | SessionStickiness_LB_CookieDurationSeconds ->
      `String "SessionStickiness_LB_CookieDurationSeconds"
  | HttpsRedirectionEnabled -> `String "HttpsRedirectionEnabled"
  | TlsPolicyName -> `String "TlsPolicyName"

let load_balancer_configuration_options_to_yojson tree =
  map_to_yojson load_balancer_attribute_name_to_yojson string__to_yojson tree

let load_balancer_tls_certificate_summary_to_yojson (x : load_balancer_tls_certificate_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("isAttached", option_to_yojson boolean__to_yojson x.is_attached);
    ]

let load_balancer_tls_certificate_summary_list_to_yojson tree =
  list_to_yojson load_balancer_tls_certificate_summary_to_yojson tree

let instance_health_reason_to_yojson (x : instance_health_reason) =
  match x with
  | LbRegistrationInProgress -> `String "Lb.RegistrationInProgress"
  | LbInitialHealthChecking -> `String "Lb.InitialHealthChecking"
  | LbInternalError -> `String "Lb.InternalError"
  | InstanceResponseCodeMismatch -> `String "Instance.ResponseCodeMismatch"
  | InstanceTimeout -> `String "Instance.Timeout"
  | InstanceFailedHealthChecks -> `String "Instance.FailedHealthChecks"
  | InstanceNotRegistered -> `String "Instance.NotRegistered"
  | InstanceNotInUse -> `String "Instance.NotInUse"
  | InstanceDeregistrationInProgress -> `String "Instance.DeregistrationInProgress"
  | InstanceInvalidState -> `String "Instance.InvalidState"
  | InstanceIpUnusable -> `String "Instance.IpUnusable"

let instance_health_state_to_yojson (x : instance_health_state) =
  match x with
  | Initial -> `String "initial"
  | Healthy -> `String "healthy"
  | Unhealthy -> `String "unhealthy"
  | Unused -> `String "unused"
  | Draining -> `String "draining"
  | Unavailable -> `String "unavailable"

let instance_health_summary_to_yojson (x : instance_health_summary) =
  assoc_to_yojson
    [
      ("instanceName", option_to_yojson resource_name_to_yojson x.instance_name);
      ("instanceHealth", option_to_yojson instance_health_state_to_yojson x.instance_health);
      ( "instanceHealthReason",
        option_to_yojson instance_health_reason_to_yojson x.instance_health_reason );
    ]

let instance_health_summary_list_to_yojson tree =
  list_to_yojson instance_health_summary_to_yojson tree

let port_list_to_yojson tree = list_to_yojson port_to_yojson tree

let load_balancer_protocol_to_yojson (x : load_balancer_protocol) =
  match x with HTTP_HTTPS -> `String "HTTP_HTTPS" | HTTP -> `String "HTTP"

let load_balancer_state_to_yojson (x : load_balancer_state) =
  match x with
  | Active -> `String "active"
  | Provisioning -> `String "provisioning"
  | ActiveImpaired -> `String "active_impaired"
  | Failed -> `String "failed"
  | Unknown -> `String "unknown"

let load_balancer_to_yojson (x : load_balancer) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("dnsName", option_to_yojson non_empty_string_to_yojson x.dns_name);
      ("state", option_to_yojson load_balancer_state_to_yojson x.state);
      ("protocol", option_to_yojson load_balancer_protocol_to_yojson x.protocol);
      ("publicPorts", option_to_yojson port_list_to_yojson x.public_ports);
      ("healthCheckPath", option_to_yojson non_empty_string_to_yojson x.health_check_path);
      ("instancePort", option_to_yojson integer_to_yojson x.instance_port);
      ( "instanceHealthSummary",
        option_to_yojson instance_health_summary_list_to_yojson x.instance_health_summary );
      ( "tlsCertificateSummaries",
        option_to_yojson load_balancer_tls_certificate_summary_list_to_yojson
          x.tls_certificate_summaries );
      ( "configurationOptions",
        option_to_yojson load_balancer_configuration_options_to_yojson x.configuration_options );
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("httpsRedirectionEnabled", option_to_yojson boolean__to_yojson x.https_redirection_enabled);
      ("tlsPolicyName", option_to_yojson resource_name_to_yojson x.tls_policy_name);
    ]

let get_load_balancer_result_to_yojson (x : get_load_balancer_result) =
  assoc_to_yojson [ ("loadBalancer", option_to_yojson load_balancer_to_yojson x.load_balancer) ]

let get_load_balancer_request_to_yojson (x : get_load_balancer_request) =
  assoc_to_yojson [ ("loadBalancerName", Some (resource_name_to_yojson x.load_balancer_name)) ]

let load_balancer_metric_name_to_yojson (x : load_balancer_metric_name) =
  match x with
  | ClientTLSNegotiationErrorCount -> `String "ClientTLSNegotiationErrorCount"
  | HealthyHostCount -> `String "HealthyHostCount"
  | UnhealthyHostCount -> `String "UnhealthyHostCount"
  | HTTPCode_LB_4XX_Count -> `String "HTTPCode_LB_4XX_Count"
  | HTTPCode_LB_5XX_Count -> `String "HTTPCode_LB_5XX_Count"
  | HTTPCode_Instance_2XX_Count -> `String "HTTPCode_Instance_2XX_Count"
  | HTTPCode_Instance_3XX_Count -> `String "HTTPCode_Instance_3XX_Count"
  | HTTPCode_Instance_4XX_Count -> `String "HTTPCode_Instance_4XX_Count"
  | HTTPCode_Instance_5XX_Count -> `String "HTTPCode_Instance_5XX_Count"
  | InstanceResponseTime -> `String "InstanceResponseTime"
  | RejectedConnectionCount -> `String "RejectedConnectionCount"
  | RequestCount -> `String "RequestCount"

let get_load_balancer_metric_data_result_to_yojson (x : get_load_balancer_metric_data_result) =
  assoc_to_yojson
    [
      ("metricName", option_to_yojson load_balancer_metric_name_to_yojson x.metric_name);
      ("metricData", option_to_yojson metric_datapoint_list_to_yojson x.metric_data);
    ]

let get_load_balancer_metric_data_request_to_yojson (x : get_load_balancer_metric_data_request) =
  assoc_to_yojson
    [
      ("loadBalancerName", Some (resource_name_to_yojson x.load_balancer_name));
      ("metricName", Some (load_balancer_metric_name_to_yojson x.metric_name));
      ("period", Some (metric_period_to_yojson x.period));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ("unit", Some (metric_unit_to_yojson x.unit_));
      ("statistics", Some (metric_statistic_list_to_yojson x.statistics));
    ]

let load_balancer_tls_certificate_revocation_reason_to_yojson
    (x : load_balancer_tls_certificate_revocation_reason) =
  match x with
  | Unspecified -> `String "UNSPECIFIED"
  | KeyCompromise -> `String "KEY_COMPROMISE"
  | CaCompromise -> `String "CA_COMPROMISE"
  | AffiliationChanged -> `String "AFFILIATION_CHANGED"
  | Superceded -> `String "SUPERCEDED"
  | CessationOfOperation -> `String "CESSATION_OF_OPERATION"
  | CertificateHold -> `String "CERTIFICATE_HOLD"
  | RemoveFromCrl -> `String "REMOVE_FROM_CRL"
  | PrivilegeWithdrawn -> `String "PRIVILEGE_WITHDRAWN"
  | AACompromise -> `String "A_A_COMPROMISE"

let load_balancer_tls_certificate_domain_status_to_yojson
    (x : load_balancer_tls_certificate_domain_status) =
  match x with
  | PendingValidation -> `String "PENDING_VALIDATION"
  | Failed -> `String "FAILED"
  | Success -> `String "SUCCESS"

let load_balancer_tls_certificate_domain_validation_option_to_yojson
    (x : load_balancer_tls_certificate_domain_validation_option) =
  assoc_to_yojson
    [
      ("domainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ( "validationStatus",
        option_to_yojson load_balancer_tls_certificate_domain_status_to_yojson x.validation_status
      );
    ]

let load_balancer_tls_certificate_domain_validation_option_list_to_yojson tree =
  list_to_yojson load_balancer_tls_certificate_domain_validation_option_to_yojson tree

let load_balancer_tls_certificate_renewal_status_to_yojson
    (x : load_balancer_tls_certificate_renewal_status) =
  match x with
  | PendingAutoRenewal -> `String "PENDING_AUTO_RENEWAL"
  | PendingValidation -> `String "PENDING_VALIDATION"
  | Success -> `String "SUCCESS"
  | Failed -> `String "FAILED"

let load_balancer_tls_certificate_renewal_summary_to_yojson
    (x : load_balancer_tls_certificate_renewal_summary) =
  assoc_to_yojson
    [
      ( "renewalStatus",
        option_to_yojson load_balancer_tls_certificate_renewal_status_to_yojson x.renewal_status );
      ( "domainValidationOptions",
        option_to_yojson load_balancer_tls_certificate_domain_validation_option_list_to_yojson
          x.domain_validation_options );
    ]

let load_balancer_tls_certificate_failure_reason_to_yojson
    (x : load_balancer_tls_certificate_failure_reason) =
  match x with
  | NoAvailableContacts -> `String "NO_AVAILABLE_CONTACTS"
  | AdditionalVerificationRequired -> `String "ADDITIONAL_VERIFICATION_REQUIRED"
  | DomainNotAllowed -> `String "DOMAIN_NOT_ALLOWED"
  | InvalidPublicDomain -> `String "INVALID_PUBLIC_DOMAIN"
  | Other -> `String "OTHER"

let load_balancer_tls_certificate_dns_record_creation_state_code_to_yojson
    (x : load_balancer_tls_certificate_dns_record_creation_state_code) =
  match x with
  | Succeeded -> `String "SUCCEEDED"
  | Started -> `String "STARTED"
  | Failed -> `String "FAILED"

let load_balancer_tls_certificate_dns_record_creation_state_to_yojson
    (x : load_balancer_tls_certificate_dns_record_creation_state) =
  assoc_to_yojson
    [
      ( "code",
        option_to_yojson load_balancer_tls_certificate_dns_record_creation_state_code_to_yojson
          x.code );
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let load_balancer_tls_certificate_domain_validation_record_to_yojson
    (x : load_balancer_tls_certificate_domain_validation_record) =
  assoc_to_yojson
    [
      ("name", option_to_yojson non_empty_string_to_yojson x.name);
      ("type", option_to_yojson non_empty_string_to_yojson x.type_);
      ("value", option_to_yojson non_empty_string_to_yojson x.value);
      ( "validationStatus",
        option_to_yojson load_balancer_tls_certificate_domain_status_to_yojson x.validation_status
      );
      ("domainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ( "dnsRecordCreationState",
        option_to_yojson load_balancer_tls_certificate_dns_record_creation_state_to_yojson
          x.dns_record_creation_state );
    ]

let load_balancer_tls_certificate_domain_validation_record_list_to_yojson tree =
  list_to_yojson load_balancer_tls_certificate_domain_validation_record_to_yojson tree

let load_balancer_tls_certificate_status_to_yojson (x : load_balancer_tls_certificate_status) =
  match x with
  | PendingValidation -> `String "PENDING_VALIDATION"
  | Issued -> `String "ISSUED"
  | Inactive -> `String "INACTIVE"
  | Expired -> `String "EXPIRED"
  | ValidationTimedOut -> `String "VALIDATION_TIMED_OUT"
  | Revoked -> `String "REVOKED"
  | Failed -> `String "FAILED"
  | Unknown -> `String "UNKNOWN"

let load_balancer_tls_certificate_to_yojson (x : load_balancer_tls_certificate) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("loadBalancerName", option_to_yojson resource_name_to_yojson x.load_balancer_name);
      ("isAttached", option_to_yojson boolean__to_yojson x.is_attached);
      ("status", option_to_yojson load_balancer_tls_certificate_status_to_yojson x.status);
      ("domainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ( "domainValidationRecords",
        option_to_yojson load_balancer_tls_certificate_domain_validation_record_list_to_yojson
          x.domain_validation_records );
      ( "failureReason",
        option_to_yojson load_balancer_tls_certificate_failure_reason_to_yojson x.failure_reason );
      ("issuedAt", option_to_yojson iso_date_to_yojson x.issued_at);
      ("issuer", option_to_yojson non_empty_string_to_yojson x.issuer);
      ("keyAlgorithm", option_to_yojson non_empty_string_to_yojson x.key_algorithm);
      ("notAfter", option_to_yojson iso_date_to_yojson x.not_after);
      ("notBefore", option_to_yojson iso_date_to_yojson x.not_before);
      ( "renewalSummary",
        option_to_yojson load_balancer_tls_certificate_renewal_summary_to_yojson x.renewal_summary
      );
      ( "revocationReason",
        option_to_yojson load_balancer_tls_certificate_revocation_reason_to_yojson
          x.revocation_reason );
      ("revokedAt", option_to_yojson iso_date_to_yojson x.revoked_at);
      ("serial", option_to_yojson non_empty_string_to_yojson x.serial);
      ("signatureAlgorithm", option_to_yojson non_empty_string_to_yojson x.signature_algorithm);
      ("subject", option_to_yojson non_empty_string_to_yojson x.subject);
      ("subjectAlternativeNames", option_to_yojson string_list_to_yojson x.subject_alternative_names);
    ]

let load_balancer_tls_certificate_list_to_yojson tree =
  list_to_yojson load_balancer_tls_certificate_to_yojson tree

let get_load_balancer_tls_certificates_result_to_yojson
    (x : get_load_balancer_tls_certificates_result) =
  assoc_to_yojson
    [
      ( "tlsCertificates",
        option_to_yojson load_balancer_tls_certificate_list_to_yojson x.tls_certificates );
    ]

let get_load_balancer_tls_certificates_request_to_yojson
    (x : get_load_balancer_tls_certificates_request) =
  assoc_to_yojson [ ("loadBalancerName", Some (resource_name_to_yojson x.load_balancer_name)) ]

let load_balancer_tls_policy_to_yojson (x : load_balancer_tls_policy) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("isDefault", option_to_yojson boolean__to_yojson x.is_default);
      ("description", option_to_yojson string__to_yojson x.description);
      ("protocols", option_to_yojson string_list_to_yojson x.protocols);
      ("ciphers", option_to_yojson string_list_to_yojson x.ciphers);
    ]

let load_balancer_tls_policy_list_to_yojson tree =
  list_to_yojson load_balancer_tls_policy_to_yojson tree

let get_load_balancer_tls_policies_result_to_yojson (x : get_load_balancer_tls_policies_result) =
  assoc_to_yojson
    [
      ("tlsPolicies", option_to_yojson load_balancer_tls_policy_list_to_yojson x.tls_policies);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_load_balancer_tls_policies_request_to_yojson (x : get_load_balancer_tls_policies_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let load_balancer_list_to_yojson tree = list_to_yojson load_balancer_to_yojson tree

let get_load_balancers_result_to_yojson (x : get_load_balancers_result) =
  assoc_to_yojson
    [
      ("loadBalancers", option_to_yojson load_balancer_list_to_yojson x.load_balancers);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_load_balancers_request_to_yojson (x : get_load_balancers_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let get_operation_result_to_yojson (x : get_operation_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let get_operation_request_to_yojson (x : get_operation_request) =
  assoc_to_yojson [ ("operationId", Some (non_empty_string_to_yojson x.operation_id)) ]

let get_operations_result_to_yojson (x : get_operations_result) =
  assoc_to_yojson
    [
      ("operations", option_to_yojson operation_list_to_yojson x.operations);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_operations_request_to_yojson (x : get_operations_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let get_operations_for_resource_result_to_yojson (x : get_operations_for_resource_result) =
  assoc_to_yojson
    [
      ("operations", option_to_yojson operation_list_to_yojson x.operations);
      ("nextPageCount", option_to_yojson string__to_yojson x.next_page_count);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_operations_for_resource_request_to_yojson (x : get_operations_for_resource_request) =
  assoc_to_yojson
    [
      ("resourceName", Some (resource_name_to_yojson x.resource_name));
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
    ]

let region_to_yojson (x : region) =
  assoc_to_yojson
    [
      ("continentCode", option_to_yojson string__to_yojson x.continent_code);
      ("description", option_to_yojson string__to_yojson x.description);
      ("displayName", option_to_yojson string__to_yojson x.display_name);
      ("name", option_to_yojson region_name_to_yojson x.name);
      ("availabilityZones", option_to_yojson availability_zone_list_to_yojson x.availability_zones);
      ( "relationalDatabaseAvailabilityZones",
        option_to_yojson availability_zone_list_to_yojson x.relational_database_availability_zones
      );
    ]

let region_list_to_yojson tree = list_to_yojson region_to_yojson tree

let get_regions_result_to_yojson (x : get_regions_result) =
  assoc_to_yojson [ ("regions", option_to_yojson region_list_to_yojson x.regions) ]

let get_regions_request_to_yojson (x : get_regions_request) =
  assoc_to_yojson
    [
      ("includeAvailabilityZones", option_to_yojson boolean__to_yojson x.include_availability_zones);
      ( "includeRelationalDatabaseAvailabilityZones",
        option_to_yojson boolean__to_yojson x.include_relational_database_availability_zones );
    ]

let pending_maintenance_action_to_yojson (x : pending_maintenance_action) =
  assoc_to_yojson
    [
      ("action", option_to_yojson non_empty_string_to_yojson x.action);
      ("description", option_to_yojson non_empty_string_to_yojson x.description);
      ("currentApplyDate", option_to_yojson iso_date_to_yojson x.current_apply_date);
    ]

let pending_maintenance_action_list_to_yojson tree =
  list_to_yojson pending_maintenance_action_to_yojson tree

let relational_database_endpoint_to_yojson (x : relational_database_endpoint) =
  assoc_to_yojson
    [
      ("port", option_to_yojson integer_to_yojson x.port);
      ("address", option_to_yojson non_empty_string_to_yojson x.address);
    ]

let pending_modified_relational_database_values_to_yojson
    (x : pending_modified_relational_database_values) =
  assoc_to_yojson
    [
      ("masterUserPassword", option_to_yojson string__to_yojson x.master_user_password);
      ("engineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("backupRetentionEnabled", option_to_yojson boolean__to_yojson x.backup_retention_enabled);
    ]

let relational_database_hardware_to_yojson (x : relational_database_hardware) =
  assoc_to_yojson
    [
      ("cpuCount", option_to_yojson integer_to_yojson x.cpu_count);
      ("diskSizeInGb", option_to_yojson integer_to_yojson x.disk_size_in_gb);
      ("ramSizeInGb", option_to_yojson float__to_yojson x.ram_size_in_gb);
    ]

let relational_database_to_yojson (x : relational_database) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "relationalDatabaseBlueprintId",
        option_to_yojson non_empty_string_to_yojson x.relational_database_blueprint_id );
      ( "relationalDatabaseBundleId",
        option_to_yojson non_empty_string_to_yojson x.relational_database_bundle_id );
      ("masterDatabaseName", option_to_yojson string__to_yojson x.master_database_name);
      ("hardware", option_to_yojson relational_database_hardware_to_yojson x.hardware);
      ("state", option_to_yojson non_empty_string_to_yojson x.state);
      ("secondaryAvailabilityZone", option_to_yojson string__to_yojson x.secondary_availability_zone);
      ("backupRetentionEnabled", option_to_yojson boolean__to_yojson x.backup_retention_enabled);
      ( "pendingModifiedValues",
        option_to_yojson pending_modified_relational_database_values_to_yojson
          x.pending_modified_values );
      ("engine", option_to_yojson non_empty_string_to_yojson x.engine);
      ("engineVersion", option_to_yojson non_empty_string_to_yojson x.engine_version);
      ("latestRestorableTime", option_to_yojson iso_date_to_yojson x.latest_restorable_time);
      ("masterUsername", option_to_yojson non_empty_string_to_yojson x.master_username);
      ("parameterApplyStatus", option_to_yojson non_empty_string_to_yojson x.parameter_apply_status);
      ( "preferredBackupWindow",
        option_to_yojson non_empty_string_to_yojson x.preferred_backup_window );
      ( "preferredMaintenanceWindow",
        option_to_yojson non_empty_string_to_yojson x.preferred_maintenance_window );
      ("publiclyAccessible", option_to_yojson boolean__to_yojson x.publicly_accessible);
      ("masterEndpoint", option_to_yojson relational_database_endpoint_to_yojson x.master_endpoint);
      ( "pendingMaintenanceActions",
        option_to_yojson pending_maintenance_action_list_to_yojson x.pending_maintenance_actions );
      ("caCertificateIdentifier", option_to_yojson string__to_yojson x.ca_certificate_identifier);
    ]

let get_relational_database_result_to_yojson (x : get_relational_database_result) =
  assoc_to_yojson
    [ ("relationalDatabase", option_to_yojson relational_database_to_yojson x.relational_database) ]

let get_relational_database_request_to_yojson (x : get_relational_database_request) =
  assoc_to_yojson
    [ ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name)) ]

let relational_database_engine_to_yojson (x : relational_database_engine) =
  match x with MYSQL -> `String "mysql"

let relational_database_blueprint_to_yojson (x : relational_database_blueprint) =
  assoc_to_yojson
    [
      ("blueprintId", option_to_yojson string__to_yojson x.blueprint_id);
      ("engine", option_to_yojson relational_database_engine_to_yojson x.engine);
      ("engineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("engineDescription", option_to_yojson string__to_yojson x.engine_description);
      ("engineVersionDescription", option_to_yojson string__to_yojson x.engine_version_description);
      ("isEngineDefault", option_to_yojson boolean__to_yojson x.is_engine_default);
    ]

let relational_database_blueprint_list_to_yojson tree =
  list_to_yojson relational_database_blueprint_to_yojson tree

let get_relational_database_blueprints_result_to_yojson
    (x : get_relational_database_blueprints_result) =
  assoc_to_yojson
    [
      ("blueprints", option_to_yojson relational_database_blueprint_list_to_yojson x.blueprints);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_relational_database_blueprints_request_to_yojson
    (x : get_relational_database_blueprints_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let relational_database_bundle_to_yojson (x : relational_database_bundle) =
  assoc_to_yojson
    [
      ("bundleId", option_to_yojson string__to_yojson x.bundle_id);
      ("name", option_to_yojson string__to_yojson x.name);
      ("price", option_to_yojson float__to_yojson x.price);
      ("ramSizeInGb", option_to_yojson float__to_yojson x.ram_size_in_gb);
      ("diskSizeInGb", option_to_yojson integer_to_yojson x.disk_size_in_gb);
      ("transferPerMonthInGb", option_to_yojson integer_to_yojson x.transfer_per_month_in_gb);
      ("cpuCount", option_to_yojson integer_to_yojson x.cpu_count);
      ("isEncrypted", option_to_yojson boolean__to_yojson x.is_encrypted);
      ("isActive", option_to_yojson boolean__to_yojson x.is_active);
    ]

let relational_database_bundle_list_to_yojson tree =
  list_to_yojson relational_database_bundle_to_yojson tree

let get_relational_database_bundles_result_to_yojson (x : get_relational_database_bundles_result) =
  assoc_to_yojson
    [
      ("bundles", option_to_yojson relational_database_bundle_list_to_yojson x.bundles);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_relational_database_bundles_request_to_yojson (x : get_relational_database_bundles_request)
    =
  assoc_to_yojson
    [
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
      ("includeInactive", option_to_yojson boolean__to_yojson x.include_inactive);
    ]

let relational_database_event_to_yojson (x : relational_database_event) =
  assoc_to_yojson
    [
      ("resource", option_to_yojson resource_name_to_yojson x.resource);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("message", option_to_yojson string__to_yojson x.message);
      ("eventCategories", option_to_yojson string_list_to_yojson x.event_categories);
    ]

let relational_database_event_list_to_yojson tree =
  list_to_yojson relational_database_event_to_yojson tree

let get_relational_database_events_result_to_yojson (x : get_relational_database_events_result) =
  assoc_to_yojson
    [
      ( "relationalDatabaseEvents",
        option_to_yojson relational_database_event_list_to_yojson x.relational_database_events );
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_relational_database_events_request_to_yojson (x : get_relational_database_events_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ("durationInMinutes", option_to_yojson integer_to_yojson x.duration_in_minutes);
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
    ]

let log_event_to_yojson (x : log_event) =
  assoc_to_yojson
    [
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let log_event_list_to_yojson tree = list_to_yojson log_event_to_yojson tree

let get_relational_database_log_events_result_to_yojson
    (x : get_relational_database_log_events_result) =
  assoc_to_yojson
    [
      ("resourceLogEvents", option_to_yojson log_event_list_to_yojson x.resource_log_events);
      ("nextBackwardToken", option_to_yojson string__to_yojson x.next_backward_token);
      ("nextForwardToken", option_to_yojson string__to_yojson x.next_forward_token);
    ]

let get_relational_database_log_events_request_to_yojson
    (x : get_relational_database_log_events_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ("logStreamName", Some (string__to_yojson x.log_stream_name));
      ("startTime", option_to_yojson iso_date_to_yojson x.start_time);
      ("endTime", option_to_yojson iso_date_to_yojson x.end_time);
      ("startFromHead", option_to_yojson boolean__to_yojson x.start_from_head);
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
    ]

let get_relational_database_log_streams_result_to_yojson
    (x : get_relational_database_log_streams_result) =
  assoc_to_yojson [ ("logStreams", option_to_yojson string_list_to_yojson x.log_streams) ]

let get_relational_database_log_streams_request_to_yojson
    (x : get_relational_database_log_streams_request) =
  assoc_to_yojson
    [ ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name)) ]

let get_relational_database_master_user_password_result_to_yojson
    (x : get_relational_database_master_user_password_result) =
  assoc_to_yojson
    [
      ("masterUserPassword", option_to_yojson sensitive_string_to_yojson x.master_user_password);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
    ]

let relational_database_password_version_to_yojson (x : relational_database_password_version) =
  match x with
  | CURRENT -> `String "CURRENT"
  | PREVIOUS -> `String "PREVIOUS"
  | PENDING -> `String "PENDING"

let get_relational_database_master_user_password_request_to_yojson
    (x : get_relational_database_master_user_password_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ( "passwordVersion",
        option_to_yojson relational_database_password_version_to_yojson x.password_version );
    ]

let relational_database_metric_name_to_yojson (x : relational_database_metric_name) =
  match x with
  | CPUUtilization -> `String "CPUUtilization"
  | DatabaseConnections -> `String "DatabaseConnections"
  | DiskQueueDepth -> `String "DiskQueueDepth"
  | FreeStorageSpace -> `String "FreeStorageSpace"
  | NetworkReceiveThroughput -> `String "NetworkReceiveThroughput"
  | NetworkTransmitThroughput -> `String "NetworkTransmitThroughput"

let get_relational_database_metric_data_result_to_yojson
    (x : get_relational_database_metric_data_result) =
  assoc_to_yojson
    [
      ("metricName", option_to_yojson relational_database_metric_name_to_yojson x.metric_name);
      ("metricData", option_to_yojson metric_datapoint_list_to_yojson x.metric_data);
    ]

let get_relational_database_metric_data_request_to_yojson
    (x : get_relational_database_metric_data_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ("metricName", Some (relational_database_metric_name_to_yojson x.metric_name));
      ("period", Some (metric_period_to_yojson x.period));
      ("startTime", Some (iso_date_to_yojson x.start_time));
      ("endTime", Some (iso_date_to_yojson x.end_time));
      ("unit", Some (metric_unit_to_yojson x.unit_));
      ("statistics", Some (metric_statistic_list_to_yojson x.statistics));
    ]

let relational_database_parameter_to_yojson (x : relational_database_parameter) =
  assoc_to_yojson
    [
      ("allowedValues", option_to_yojson string__to_yojson x.allowed_values);
      ("applyMethod", option_to_yojson string__to_yojson x.apply_method);
      ("applyType", option_to_yojson string__to_yojson x.apply_type);
      ("dataType", option_to_yojson string__to_yojson x.data_type);
      ("description", option_to_yojson string__to_yojson x.description);
      ("isModifiable", option_to_yojson boolean__to_yojson x.is_modifiable);
      ("parameterName", option_to_yojson string__to_yojson x.parameter_name);
      ("parameterValue", option_to_yojson string__to_yojson x.parameter_value);
    ]

let relational_database_parameter_list_to_yojson tree =
  list_to_yojson relational_database_parameter_to_yojson tree

let get_relational_database_parameters_result_to_yojson
    (x : get_relational_database_parameters_result) =
  assoc_to_yojson
    [
      ("parameters", option_to_yojson relational_database_parameter_list_to_yojson x.parameters);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_relational_database_parameters_request_to_yojson
    (x : get_relational_database_parameters_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ("pageToken", option_to_yojson string__to_yojson x.page_token);
    ]

let relational_database_snapshot_to_yojson (x : relational_database_snapshot) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("engine", option_to_yojson non_empty_string_to_yojson x.engine);
      ("engineVersion", option_to_yojson non_empty_string_to_yojson x.engine_version);
      ("sizeInGb", option_to_yojson integer_to_yojson x.size_in_gb);
      ("state", option_to_yojson non_empty_string_to_yojson x.state);
      ( "fromRelationalDatabaseName",
        option_to_yojson non_empty_string_to_yojson x.from_relational_database_name );
      ( "fromRelationalDatabaseArn",
        option_to_yojson non_empty_string_to_yojson x.from_relational_database_arn );
      ( "fromRelationalDatabaseBundleId",
        option_to_yojson string__to_yojson x.from_relational_database_bundle_id );
      ( "fromRelationalDatabaseBlueprintId",
        option_to_yojson string__to_yojson x.from_relational_database_blueprint_id );
    ]

let get_relational_database_snapshot_result_to_yojson (x : get_relational_database_snapshot_result)
    =
  assoc_to_yojson
    [
      ( "relationalDatabaseSnapshot",
        option_to_yojson relational_database_snapshot_to_yojson x.relational_database_snapshot );
    ]

let get_relational_database_snapshot_request_to_yojson
    (x : get_relational_database_snapshot_request) =
  assoc_to_yojson
    [
      ( "relationalDatabaseSnapshotName",
        Some (resource_name_to_yojson x.relational_database_snapshot_name) );
    ]

let relational_database_snapshot_list_to_yojson tree =
  list_to_yojson relational_database_snapshot_to_yojson tree

let get_relational_database_snapshots_result_to_yojson
    (x : get_relational_database_snapshots_result) =
  assoc_to_yojson
    [
      ( "relationalDatabaseSnapshots",
        option_to_yojson relational_database_snapshot_list_to_yojson x.relational_database_snapshots
      );
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_relational_database_snapshots_request_to_yojson
    (x : get_relational_database_snapshots_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let relational_database_list_to_yojson tree = list_to_yojson relational_database_to_yojson tree

let get_relational_databases_result_to_yojson (x : get_relational_databases_result) =
  assoc_to_yojson
    [
      ( "relationalDatabases",
        option_to_yojson relational_database_list_to_yojson x.relational_databases );
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_relational_databases_request_to_yojson (x : get_relational_databases_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let setup_history_page_token_to_yojson = string_to_yojson

let setup_status_to_yojson (x : setup_status) =
  match x with
  | Succeeded -> `String "succeeded"
  | Failed -> `String "failed"
  | InProgress -> `String "inProgress"

let setup_execution_details_to_yojson (x : setup_execution_details) =
  assoc_to_yojson
    [
      ("command", option_to_yojson string__to_yojson x.command);
      ("dateTime", option_to_yojson iso_date_to_yojson x.date_time);
      ("name", option_to_yojson non_empty_string_to_yojson x.name);
      ("status", option_to_yojson setup_status_to_yojson x.status);
      ("standardError", option_to_yojson string__to_yojson x.standard_error);
      ("standardOutput", option_to_yojson string__to_yojson x.standard_output);
      ("version", option_to_yojson string__to_yojson x.version);
    ]

let setup_execution_details_list_to_yojson tree =
  list_to_yojson setup_execution_details_to_yojson tree

let setup_history_resource_to_yojson (x : setup_history_resource) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
    ]

let setup_domain_name_to_yojson = string_to_yojson
let setup_domain_name_list_to_yojson tree = list_to_yojson setup_domain_name_to_yojson tree

let setup_request_to_yojson (x : setup_request) =
  assoc_to_yojson
    [
      ("instanceName", option_to_yojson resource_name_to_yojson x.instance_name);
      ("domainNames", option_to_yojson setup_domain_name_list_to_yojson x.domain_names);
      ("certificateProvider", option_to_yojson certificate_provider_to_yojson x.certificate_provider);
    ]

let setup_history_to_yojson (x : setup_history) =
  assoc_to_yojson
    [
      ("operationId", option_to_yojson non_empty_string_to_yojson x.operation_id);
      ("request", option_to_yojson setup_request_to_yojson x.request);
      ("resource", option_to_yojson setup_history_resource_to_yojson x.resource);
      ( "executionDetails",
        option_to_yojson setup_execution_details_list_to_yojson x.execution_details );
      ("status", option_to_yojson setup_status_to_yojson x.status);
    ]

let setup_history_list_to_yojson tree = list_to_yojson setup_history_to_yojson tree

let get_setup_history_result_to_yojson (x : get_setup_history_result) =
  assoc_to_yojson
    [
      ("setupHistory", option_to_yojson setup_history_list_to_yojson x.setup_history);
      ("nextPageToken", option_to_yojson setup_history_page_token_to_yojson x.next_page_token);
    ]

let get_setup_history_request_to_yojson (x : get_setup_history_request) =
  assoc_to_yojson
    [
      ("resourceName", Some (resource_name_to_yojson x.resource_name));
      ("pageToken", option_to_yojson setup_history_page_token_to_yojson x.page_token);
    ]

let static_ip_to_yojson (x : static_ip) =
  assoc_to_yojson
    [
      ("name", option_to_yojson resource_name_to_yojson x.name);
      ("arn", option_to_yojson non_empty_string_to_yojson x.arn);
      ("supportCode", option_to_yojson string__to_yojson x.support_code);
      ("createdAt", option_to_yojson iso_date_to_yojson x.created_at);
      ("location", option_to_yojson resource_location_to_yojson x.location);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ipAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("attachedTo", option_to_yojson resource_name_to_yojson x.attached_to);
      ("isAttached", option_to_yojson boolean__to_yojson x.is_attached);
    ]

let get_static_ip_result_to_yojson (x : get_static_ip_result) =
  assoc_to_yojson [ ("staticIp", option_to_yojson static_ip_to_yojson x.static_ip) ]

let get_static_ip_request_to_yojson (x : get_static_ip_request) =
  assoc_to_yojson [ ("staticIpName", Some (resource_name_to_yojson x.static_ip_name)) ]

let static_ip_list_to_yojson tree = list_to_yojson static_ip_to_yojson tree

let get_static_ips_result_to_yojson (x : get_static_ips_result) =
  assoc_to_yojson
    [
      ("staticIps", option_to_yojson static_ip_list_to_yojson x.static_ips);
      ("nextPageToken", option_to_yojson string__to_yojson x.next_page_token);
    ]

let get_static_ips_request_to_yojson (x : get_static_ips_request) =
  assoc_to_yojson [ ("pageToken", option_to_yojson string__to_yojson x.page_token) ]

let import_key_pair_result_to_yojson (x : import_key_pair_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let import_key_pair_request_to_yojson (x : import_key_pair_request) =
  assoc_to_yojson
    [
      ("keyPairName", Some (resource_name_to_yojson x.key_pair_name));
      ("publicKeyBase64", Some (base64_to_yojson x.public_key_base64));
    ]

let is_vpc_peered_result_to_yojson (x : is_vpc_peered_result) =
  assoc_to_yojson [ ("isPeered", option_to_yojson boolean__to_yojson x.is_peered) ]

let is_vpc_peered_request_to_yojson = unit_to_yojson

let update_relational_database_parameters_result_to_yojson
    (x : update_relational_database_parameters_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let update_relational_database_parameters_request_to_yojson
    (x : update_relational_database_parameters_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ("parameters", Some (relational_database_parameter_list_to_yojson x.parameters));
    ]

let update_relational_database_result_to_yojson (x : update_relational_database_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let update_relational_database_request_to_yojson (x : update_relational_database_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ("masterUserPassword", option_to_yojson sensitive_string_to_yojson x.master_user_password);
      ("rotateMasterUserPassword", option_to_yojson boolean__to_yojson x.rotate_master_user_password);
      ("preferredBackupWindow", option_to_yojson string__to_yojson x.preferred_backup_window);
      ( "preferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ("enableBackupRetention", option_to_yojson boolean__to_yojson x.enable_backup_retention);
      ("disableBackupRetention", option_to_yojson boolean__to_yojson x.disable_backup_retention);
      ("publiclyAccessible", option_to_yojson boolean__to_yojson x.publicly_accessible);
      ("applyImmediately", option_to_yojson boolean__to_yojson x.apply_immediately);
      ("caCertificateIdentifier", option_to_yojson string__to_yojson x.ca_certificate_identifier);
      ( "relationalDatabaseBlueprintId",
        option_to_yojson string__to_yojson x.relational_database_blueprint_id );
    ]

let update_load_balancer_attribute_result_to_yojson (x : update_load_balancer_attribute_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let update_load_balancer_attribute_request_to_yojson (x : update_load_balancer_attribute_request) =
  assoc_to_yojson
    [
      ("loadBalancerName", Some (resource_name_to_yojson x.load_balancer_name));
      ("attributeName", Some (load_balancer_attribute_name_to_yojson x.attribute_name));
      ("attributeValue", Some (string_max256_to_yojson x.attribute_value));
    ]

let update_instance_metadata_options_result_to_yojson (x : update_instance_metadata_options_result)
    =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let update_instance_metadata_options_request_to_yojson
    (x : update_instance_metadata_options_request) =
  assoc_to_yojson
    [
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
      ("httpTokens", option_to_yojson http_tokens_to_yojson x.http_tokens);
      ("httpEndpoint", option_to_yojson http_endpoint_to_yojson x.http_endpoint);
      ("httpPutResponseHopLimit", option_to_yojson integer_to_yojson x.http_put_response_hop_limit);
      ("httpProtocolIpv6", option_to_yojson http_protocol_ipv6_to_yojson x.http_protocol_ipv6);
    ]

let update_domain_entry_result_to_yojson (x : update_domain_entry_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let update_domain_entry_request_to_yojson (x : update_domain_entry_request) =
  assoc_to_yojson
    [
      ("domainName", Some (domain_name_to_yojson x.domain_name));
      ("domainEntry", Some (domain_entry_to_yojson x.domain_entry));
    ]

let update_distribution_bundle_result_to_yojson (x : update_distribution_bundle_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let update_distribution_bundle_request_to_yojson (x : update_distribution_bundle_request) =
  assoc_to_yojson
    [
      ("distributionName", option_to_yojson resource_name_to_yojson x.distribution_name);
      ("bundleId", option_to_yojson string__to_yojson x.bundle_id);
    ]

let update_distribution_result_to_yojson (x : update_distribution_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let update_distribution_request_to_yojson (x : update_distribution_request) =
  assoc_to_yojson
    [
      ("distributionName", Some (resource_name_to_yojson x.distribution_name));
      ("origin", option_to_yojson input_origin_to_yojson x.origin);
      ("defaultCacheBehavior", option_to_yojson cache_behavior_to_yojson x.default_cache_behavior);
      ("cacheBehaviorSettings", option_to_yojson cache_settings_to_yojson x.cache_behavior_settings);
      ("cacheBehaviors", option_to_yojson cache_behavior_list_to_yojson x.cache_behaviors);
      ("isEnabled", option_to_yojson boolean__to_yojson x.is_enabled);
      ( "viewerMinimumTlsProtocolVersion",
        option_to_yojson viewer_minimum_tls_protocol_version_enum_to_yojson
          x.viewer_minimum_tls_protocol_version );
      ("certificateName", option_to_yojson resource_name_to_yojson x.certificate_name);
      ("useDefaultCertificate", option_to_yojson boolean__to_yojson x.use_default_certificate);
    ]

let update_container_service_result_to_yojson (x : update_container_service_result) =
  assoc_to_yojson
    [ ("containerService", option_to_yojson container_service_to_yojson x.container_service) ]

let update_container_service_request_to_yojson (x : update_container_service_request) =
  assoc_to_yojson
    [
      ("serviceName", Some (container_service_name_to_yojson x.service_name));
      ("power", option_to_yojson container_service_power_name_to_yojson x.power);
      ("scale", option_to_yojson container_service_scale_to_yojson x.scale);
      ("isDisabled", option_to_yojson boolean__to_yojson x.is_disabled);
      ( "publicDomainNames",
        option_to_yojson container_service_public_domains_to_yojson x.public_domain_names );
      ( "privateRegistryAccess",
        option_to_yojson private_registry_access_request_to_yojson x.private_registry_access );
    ]

let update_bucket_bundle_result_to_yojson (x : update_bucket_bundle_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let update_bucket_bundle_request_to_yojson (x : update_bucket_bundle_request) =
  assoc_to_yojson
    [
      ("bucketName", Some (bucket_name_to_yojson x.bucket_name));
      ("bundleId", Some (non_empty_string_to_yojson x.bundle_id));
    ]

let update_bucket_result_to_yojson (x : update_bucket_result) =
  assoc_to_yojson
    [
      ("bucket", option_to_yojson bucket_to_yojson x.bucket);
      ("operations", option_to_yojson operation_list_to_yojson x.operations);
    ]

let update_bucket_request_to_yojson (x : update_bucket_request) =
  assoc_to_yojson
    [
      ("bucketName", Some (bucket_name_to_yojson x.bucket_name));
      ("accessRules", option_to_yojson access_rules_to_yojson x.access_rules);
      ("versioning", option_to_yojson non_empty_string_to_yojson x.versioning);
      ( "readonlyAccessAccounts",
        option_to_yojson partner_id_list_to_yojson x.readonly_access_accounts );
      ("accessLogConfig", option_to_yojson bucket_access_log_config_to_yojson x.access_log_config);
      ("cors", option_to_yojson bucket_cors_config_to_yojson x.cors);
    ]

let untag_resource_result_to_yojson (x : untag_resource_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceName", Some (resource_name_to_yojson x.resource_name));
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let unpeer_vpc_result_to_yojson (x : unpeer_vpc_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let unpeer_vpc_request_to_yojson = unit_to_yojson

let test_alarm_result_to_yojson (x : test_alarm_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let test_alarm_request_to_yojson (x : test_alarm_request) =
  assoc_to_yojson
    [
      ("alarmName", Some (resource_name_to_yojson x.alarm_name));
      ("state", Some (alarm_state_to_yojson x.state));
    ]

let tag_resource_result_to_yojson (x : tag_resource_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceName", Some (resource_name_to_yojson x.resource_name));
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let stop_relational_database_result_to_yojson (x : stop_relational_database_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let stop_relational_database_request_to_yojson (x : stop_relational_database_request) =
  assoc_to_yojson
    [
      ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name));
      ( "relationalDatabaseSnapshotName",
        option_to_yojson resource_name_to_yojson x.relational_database_snapshot_name );
    ]

let stop_instance_result_to_yojson (x : stop_instance_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let stop_instance_request_to_yojson (x : stop_instance_request) =
  assoc_to_yojson
    [
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
      ("force", option_to_yojson boolean__to_yojson x.force);
    ]

let stop_gui_session_result_to_yojson (x : stop_gui_session_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let stop_gui_session_request_to_yojson (x : stop_gui_session_request) =
  assoc_to_yojson [ ("resourceName", Some (resource_name_to_yojson x.resource_name)) ]

let start_relational_database_result_to_yojson (x : start_relational_database_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let start_relational_database_request_to_yojson (x : start_relational_database_request) =
  assoc_to_yojson
    [ ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name)) ]

let start_instance_result_to_yojson (x : start_instance_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let start_instance_request_to_yojson (x : start_instance_request) =
  assoc_to_yojson [ ("instanceName", Some (resource_name_to_yojson x.instance_name)) ]

let start_gui_session_result_to_yojson (x : start_gui_session_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let start_gui_session_request_to_yojson (x : start_gui_session_request) =
  assoc_to_yojson [ ("resourceName", Some (resource_name_to_yojson x.resource_name)) ]

let setup_instance_https_result_to_yojson (x : setup_instance_https_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let setup_instance_https_request_to_yojson (x : setup_instance_https_request) =
  assoc_to_yojson
    [
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
      ("emailAddress", Some (email_address_to_yojson x.email_address));
      ("domainNames", Some (setup_domain_name_list_to_yojson x.domain_names));
      ("certificateProvider", Some (certificate_provider_to_yojson x.certificate_provider));
    ]

let set_resource_access_for_bucket_result_to_yojson (x : set_resource_access_for_bucket_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let resource_bucket_access_to_yojson (x : resource_bucket_access) =
  match x with Allow -> `String "allow" | Deny -> `String "deny"

let set_resource_access_for_bucket_request_to_yojson (x : set_resource_access_for_bucket_request) =
  assoc_to_yojson
    [
      ("resourceName", Some (resource_name_to_yojson x.resource_name));
      ("bucketName", Some (bucket_name_to_yojson x.bucket_name));
      ("access", Some (resource_bucket_access_to_yojson x.access));
    ]

let set_ip_address_type_result_to_yojson (x : set_ip_address_type_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let set_ip_address_type_request_to_yojson (x : set_ip_address_type_request) =
  assoc_to_yojson
    [
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("resourceName", Some (resource_name_to_yojson x.resource_name));
      ("ipAddressType", Some (ip_address_type_to_yojson x.ip_address_type));
      ("acceptBundleUpdate", option_to_yojson boolean__to_yojson x.accept_bundle_update);
    ]

let send_contact_method_verification_result_to_yojson (x : send_contact_method_verification_result)
    =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let send_contact_method_verification_request_to_yojson
    (x : send_contact_method_verification_request) =
  assoc_to_yojson [ ("protocol", Some (contact_method_verification_protocol_to_yojson x.protocol)) ]

let reset_distribution_cache_result_to_yojson (x : reset_distribution_cache_result) =
  assoc_to_yojson
    [
      ("status", option_to_yojson string__to_yojson x.status);
      ("createTime", option_to_yojson iso_date_to_yojson x.create_time);
      ("operation", option_to_yojson operation_to_yojson x.operation);
    ]

let reset_distribution_cache_request_to_yojson (x : reset_distribution_cache_request) =
  assoc_to_yojson
    [ ("distributionName", option_to_yojson resource_name_to_yojson x.distribution_name) ]

let release_static_ip_result_to_yojson (x : release_static_ip_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let release_static_ip_request_to_yojson (x : release_static_ip_request) =
  assoc_to_yojson [ ("staticIpName", Some (resource_name_to_yojson x.static_ip_name)) ]

let register_container_image_result_to_yojson (x : register_container_image_result) =
  assoc_to_yojson
    [ ("containerImage", option_to_yojson container_image_to_yojson x.container_image) ]

let register_container_image_request_to_yojson (x : register_container_image_request) =
  assoc_to_yojson
    [
      ("serviceName", Some (container_service_name_to_yojson x.service_name));
      ("label", Some (container_label_to_yojson x.label));
      ("digest", Some (string__to_yojson x.digest));
    ]

let reboot_relational_database_result_to_yojson (x : reboot_relational_database_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let reboot_relational_database_request_to_yojson (x : reboot_relational_database_request) =
  assoc_to_yojson
    [ ("relationalDatabaseName", Some (resource_name_to_yojson x.relational_database_name)) ]

let reboot_instance_result_to_yojson (x : reboot_instance_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let reboot_instance_request_to_yojson (x : reboot_instance_request) =
  assoc_to_yojson [ ("instanceName", Some (resource_name_to_yojson x.instance_name)) ]

let put_instance_public_ports_result_to_yojson (x : put_instance_public_ports_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let port_info_list_to_yojson tree = list_to_yojson port_info_to_yojson tree

let put_instance_public_ports_request_to_yojson (x : put_instance_public_ports_request) =
  assoc_to_yojson
    [
      ("portInfos", Some (port_info_list_to_yojson x.port_infos));
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
    ]

let put_alarm_result_to_yojson (x : put_alarm_result) =
  assoc_to_yojson [ ("operations", option_to_yojson operation_list_to_yojson x.operations) ]

let put_alarm_request_to_yojson (x : put_alarm_request) =
  assoc_to_yojson
    [
      ("alarmName", Some (resource_name_to_yojson x.alarm_name));
      ("metricName", Some (metric_name_to_yojson x.metric_name));
      ("monitoredResourceName", Some (resource_name_to_yojson x.monitored_resource_name));
      ("comparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
      ("threshold", Some (double_to_yojson x.threshold));
      ("evaluationPeriods", Some (integer_to_yojson x.evaluation_periods));
      ("datapointsToAlarm", option_to_yojson integer_to_yojson x.datapoints_to_alarm);
      ("treatMissingData", option_to_yojson treat_missing_data_to_yojson x.treat_missing_data);
      ("contactProtocols", option_to_yojson contact_protocols_list_to_yojson x.contact_protocols);
      ( "notificationTriggers",
        option_to_yojson notification_trigger_list_to_yojson x.notification_triggers );
      ("notificationEnabled", option_to_yojson boolean__to_yojson x.notification_enabled);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let peer_vpc_result_to_yojson (x : peer_vpc_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let peer_vpc_request_to_yojson = unit_to_yojson

let open_instance_public_ports_result_to_yojson (x : open_instance_public_ports_result) =
  assoc_to_yojson [ ("operation", option_to_yojson operation_to_yojson x.operation) ]

let open_instance_public_ports_request_to_yojson (x : open_instance_public_ports_request) =
  assoc_to_yojson
    [
      ("portInfo", Some (port_info_to_yojson x.port_info));
      ("instanceName", Some (resource_name_to_yojson x.instance_name));
    ]
