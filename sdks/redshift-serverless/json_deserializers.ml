open Smaws_Lib.Json.DeserializeHelpers
open Types

let workgroup_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "AVAILABLE" -> AVAILABLE
    | `String "MODIFYING" -> MODIFYING
    | `String "DELETING" -> DELETING
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkgroupStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkgroupStatus")
     : workgroup_status)
    : workgroup_status)

let workgroup_name_of_yojson = string_of_yojson
let workgroup_name_list_of_yojson tree path = list_of_yojson workgroup_name_of_yojson tree path
let parameter_key_of_yojson = string_of_yojson
let parameter_value_of_yojson = string_of_yojson

let config_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_value =
       option_of_yojson (value_for_key parameter_value_of_yojson "parameterValue") _list path;
     parameter_key =
       option_of_yojson (value_for_key parameter_key_of_yojson "parameterKey") _list path;
   }
    : config_parameter)

let config_parameter_list_of_yojson tree path = list_of_yojson config_parameter_of_yojson tree path
let security_group_id_of_yojson = string_of_yojson

let security_group_id_list_of_yojson tree path =
  list_of_yojson security_group_id_of_yojson tree path

let subnet_id_of_yojson = string_of_yojson
let subnet_id_list_of_yojson tree path = list_of_yojson subnet_id_of_yojson tree path

let network_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ipv6_address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ipv6Address")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     private_ip_address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "privateIpAddress")
         _list path;
     subnet_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "subnetId")
         _list path;
     network_interface_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "networkInterfaceId")
         _list path;
   }
    : network_interface)

let network_interface_list_of_yojson tree path =
  list_of_yojson network_interface_of_yojson tree path

let vpc_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_interfaces =
       option_of_yojson
         (value_for_key network_interface_list_of_yojson "networkInterfaces")
         _list path;
     vpc_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vpcId")
         _list path;
     vpc_endpoint_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vpcEndpointId")
         _list path;
   }
    : vpc_endpoint)

let vpc_endpoint_list_of_yojson tree path = list_of_yojson vpc_endpoint_of_yojson tree path

let endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoints =
       option_of_yojson (value_for_key vpc_endpoint_list_of_yojson "vpcEndpoints") _list path;
     port =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "port")
         _list path;
     address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "address")
         _list path;
   }
    : endpoint)

let custom_domain_name_of_yojson = string_of_yojson
let custom_domain_certificate_arn_string_of_yojson = string_of_yojson

let vpc_ids_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let ip_address_type_of_yojson = string_of_yojson

let performance_target_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PerformanceTargetStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PerformanceTargetStatus")
     : performance_target_status)
    : performance_target_status)

let performance_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     level =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "level")
         _list path;
     status =
       option_of_yojson (value_for_key performance_target_status_of_yojson "status") _list path;
   }
    : performance_target)

let track_name_of_yojson = string_of_yojson

let workgroup_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     extra_compute_for_automatic_optimization =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "extraComputeForAutomaticOptimization")
         _list path;
     pending_track_name =
       option_of_yojson (value_for_key track_name_of_yojson "pendingTrackName") _list path;
     track_name = option_of_yojson (value_for_key track_name_of_yojson "trackName") _list path;
     price_performance_target =
       option_of_yojson
         (value_for_key performance_target_of_yojson "pricePerformanceTarget")
         _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "ipAddressType") _list path;
     cross_account_vpcs =
       option_of_yojson (value_for_key vpc_ids_of_yojson "crossAccountVpcs") _list path;
     max_capacity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxCapacity")
         _list path;
     patch_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "patchVersion")
         _list path;
     workgroup_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupVersion")
         _list path;
     custom_domain_certificate_expiry_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "customDomainCertificateExpiryTime")
         _list path;
     custom_domain_certificate_arn =
       option_of_yojson
         (value_for_key custom_domain_certificate_arn_string_of_yojson "customDomainCertificateArn")
         _list path;
     custom_domain_name =
       option_of_yojson (value_for_key custom_domain_name_of_yojson "customDomainName") _list path;
     port =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "port")
         _list path;
     creation_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "creationDate")
         _list path;
     publicly_accessible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "publiclyAccessible")
         _list path;
     endpoint = option_of_yojson (value_for_key endpoint_of_yojson "endpoint") _list path;
     status = option_of_yojson (value_for_key workgroup_status_of_yojson "status") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_id_list_of_yojson "subnetIds") _list path;
     security_group_ids =
       option_of_yojson
         (value_for_key security_group_id_list_of_yojson "securityGroupIds")
         _list path;
     config_parameters =
       option_of_yojson
         (value_for_key config_parameter_list_of_yojson "configParameters")
         _list path;
     enhanced_vpc_routing =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "enhancedVpcRouting")
         _list path;
     base_capacity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "baseCapacity")
         _list path;
     namespace_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceName")
         _list path;
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_of_yojson "workgroupName") _list path;
     workgroup_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupArn")
         _list path;
     workgroup_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupId")
         _list path;
   }
    : workgroup)

let workgroup_list_of_yojson tree path = list_of_yojson workgroup_of_yojson tree path
let vpc_security_group_id_of_yojson = string_of_yojson

let vpc_security_group_membership_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "status")
         _list path;
     vpc_security_group_id =
       option_of_yojson
         (value_for_key vpc_security_group_id_of_yojson "vpcSecurityGroupId")
         _list path;
   }
    : vpc_security_group_membership)

let vpc_security_group_membership_list_of_yojson tree path =
  list_of_yojson vpc_security_group_membership_of_yojson tree path

let vpc_security_group_id_list_of_yojson tree path =
  list_of_yojson vpc_security_group_id_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception)

let usage_limit_usage_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "serverless-compute" -> SERVERLESS_COMPUTE
    | `String "cross-region-datasharing" -> CROSS_REGION_DATASHARING
    | `String value -> raise (deserialize_unknown_enum_value_error path "UsageLimitUsageType" value)
    | _ -> raise (deserialize_wrong_type_error path "UsageLimitUsageType")
     : usage_limit_usage_type)
    : usage_limit_usage_type)

let usage_limit_period_of_yojson (tree : t) path =
  ((match tree with
    | `String "daily" -> DAILY
    | `String "weekly" -> WEEKLY
    | `String "monthly" -> MONTHLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "UsageLimitPeriod" value)
    | _ -> raise (deserialize_wrong_type_error path "UsageLimitPeriod")
     : usage_limit_period)
    : usage_limit_period)

let usage_limit_breach_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "log" -> LOG
    | `String "emit-metric" -> EMIT_METRIC
    | `String "deactivate" -> DEACTIVATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UsageLimitBreachAction" value)
    | _ -> raise (deserialize_wrong_type_error path "UsageLimitBreachAction")
     : usage_limit_breach_action)
    : usage_limit_breach_action)

let usage_limit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     breach_action =
       option_of_yojson
         (value_for_key usage_limit_breach_action_of_yojson "breachAction")
         _list path;
     period = option_of_yojson (value_for_key usage_limit_period_of_yojson "period") _list path;
     amount =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "amount")
         _list path;
     usage_type =
       option_of_yojson (value_for_key usage_limit_usage_type_of_yojson "usageType") _list path;
     resource_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceArn")
         _list path;
     usage_limit_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "usageLimitArn")
         _list path;
     usage_limit_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "usageLimitId")
         _list path;
   }
    : usage_limit)

let usage_limits_of_yojson tree path = list_of_yojson usage_limit_of_yojson tree path

let update_workgroup_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workgroup = value_for_key workgroup_of_yojson "workgroup" _list path }
    : update_workgroup_response)

let update_workgroup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     extra_compute_for_automatic_optimization =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "extraComputeForAutomaticOptimization")
         _list path;
     track_name = option_of_yojson (value_for_key track_name_of_yojson "trackName") _list path;
     price_performance_target =
       option_of_yojson
         (value_for_key performance_target_of_yojson "pricePerformanceTarget")
         _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "ipAddressType") _list path;
     max_capacity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxCapacity")
         _list path;
     port =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "port")
         _list path;
     security_group_ids =
       option_of_yojson
         (value_for_key security_group_id_list_of_yojson "securityGroupIds")
         _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_id_list_of_yojson "subnetIds") _list path;
     publicly_accessible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "publiclyAccessible")
         _list path;
     config_parameters =
       option_of_yojson
         (value_for_key config_parameter_list_of_yojson "configParameters")
         _list path;
     enhanced_vpc_routing =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "enhancedVpcRouting")
         _list path;
     base_capacity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "baseCapacity")
         _list path;
     workgroup_name = value_for_key workgroup_name_of_yojson "workgroupName" _list path;
   }
    : update_workgroup_request)

let amazon_resource_name_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "resourceName") _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : resource_not_found_exception)

let ipv6_cidr_block_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : ipv6_cidr_block_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let insufficient_capacity_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : insufficient_capacity_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : conflict_exception)

let update_usage_limit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ usage_limit = option_of_yojson (value_for_key usage_limit_of_yojson "usageLimit") _list path }
    : update_usage_limit_response)

let update_usage_limit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     breach_action =
       option_of_yojson
         (value_for_key usage_limit_breach_action_of_yojson "breachAction")
         _list path;
     amount =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "amount")
         _list path;
     usage_limit_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "usageLimitId" _list
         path;
   }
    : update_usage_limit_request)

let update_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workgroup_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupVersion")
         _list path;
     track_name = option_of_yojson (value_for_key track_name_of_yojson "trackName") _list path;
   }
    : update_target)

let update_targets_list_of_yojson tree path = list_of_yojson update_target_of_yojson tree path

let snapshot_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "CREATING" -> CREATING
    | `String "DELETED" -> DELETED
    | `String "CANCELLED" -> CANCELLED
    | `String "FAILED" -> FAILED
    | `String "COPYING" -> COPYING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnapshotStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotStatus")
     : snapshot_status)
    : snapshot_status)

let kms_key_id_of_yojson = string_of_yojson

let account_id_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let snapshot_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     admin_password_secret_kms_key_id =
       option_of_yojson
         (value_for_key kms_key_id_of_yojson "adminPasswordSecretKmsKeyId")
         _list path;
     admin_password_secret_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "adminPasswordSecretArn")
         _list path;
     accounts_with_provisioned_restore_access =
       option_of_yojson
         (value_for_key account_id_list_of_yojson "accountsWithProvisionedRestoreAccess")
         _list path;
     accounts_with_restore_access =
       option_of_yojson
         (value_for_key account_id_list_of_yojson "accountsWithRestoreAccess")
         _list path;
     snapshot_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotArn")
         _list path;
     snapshot_retention_start_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "snapshotRetentionStartTime")
         _list path;
     snapshot_remaining_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "snapshotRemainingDays")
         _list path;
     snapshot_retention_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "snapshotRetentionPeriod")
         _list path;
     elapsed_time_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "elapsedTimeInSeconds")
         _list path;
     estimated_seconds_to_completion =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "estimatedSecondsToCompletion")
         _list path;
     current_backup_rate_in_mega_bytes_per_second =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "currentBackupRateInMegaBytesPerSecond")
         _list path;
     backup_progress_in_mega_bytes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "backupProgressInMegaBytes")
         _list path;
     actual_incremental_backup_size_in_mega_bytes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "actualIncrementalBackupSizeInMegaBytes")
         _list path;
     total_backup_size_in_mega_bytes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "totalBackupSizeInMegaBytes")
         _list path;
     owner_account =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ownerAccount")
         _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
     status = option_of_yojson (value_for_key snapshot_status_of_yojson "status") _list path;
     admin_username =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "adminUsername")
         _list path;
     snapshot_create_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "snapshotCreateTime")
         _list path;
     snapshot_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotName")
         _list path;
     namespace_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceArn")
         _list path;
     namespace_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceName")
         _list path;
   }
    : snapshot)

let update_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot = option_of_yojson (value_for_key snapshot_of_yojson "snapshot") _list path }
    : update_snapshot_response)

let update_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "retentionPeriod")
         _list path;
     snapshot_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotName" _list
         path;
   }
    : update_snapshot_request)

let namespace_name_of_yojson = string_of_yojson

let snapshot_copy_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "destinationKmsKeyId") _list path;
     snapshot_retention_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "snapshotRetentionPeriod")
         _list path;
     destination_region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "destinationRegion")
         _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     snapshot_copy_configuration_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "snapshotCopyConfigurationArn")
         _list path;
     snapshot_copy_configuration_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "snapshotCopyConfigurationId")
         _list path;
   }
    : snapshot_copy_configuration)

let update_snapshot_copy_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_copy_configuration =
       value_for_key snapshot_copy_configuration_of_yojson "snapshotCopyConfiguration" _list path;
   }
    : update_snapshot_copy_configuration_response)

let update_snapshot_copy_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_retention_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "snapshotRetentionPeriod")
         _list path;
     snapshot_copy_configuration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "snapshotCopyConfigurationId" _list path;
   }
    : update_snapshot_copy_configuration_request)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
     code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "code")
         _list path;
   }
    : access_denied_exception)

let scheduled_action_name_of_yojson = string_of_yojson

let schedule_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "cron" -> Cron (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "at" ->
       At (Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Schedule" unknown)
    : schedule)

let next_invocations_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson tree path

let iam_role_arn_of_yojson = string_of_yojson

let state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "State" value)
    | _ -> raise (deserialize_wrong_type_error path "State")
     : state)
    : state)

let snapshot_name_prefix_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "value" _list path;
     key = value_for_key tag_key_of_yojson "key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let create_snapshot_schedule_action_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     retention_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "retentionPeriod")
         _list path;
     snapshot_name_prefix =
       value_for_key snapshot_name_prefix_of_yojson "snapshotNamePrefix" _list path;
     namespace_name = value_for_key namespace_name_of_yojson "namespaceName" _list path;
   }
    : create_snapshot_schedule_action_parameters)

let target_action_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "createSnapshot" ->
       CreateSnapshot (create_snapshot_schedule_action_parameters_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "TargetAction" unknown)
    : target_action)

let scheduled_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_action_uuid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "scheduledActionUuid")
         _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     target_action =
       option_of_yojson (value_for_key target_action_of_yojson "targetAction") _list path;
     end_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "endTime")
         _list path;
     start_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "startTime")
         _list path;
     state = option_of_yojson (value_for_key state_of_yojson "state") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "roleArn") _list path;
     next_invocations =
       option_of_yojson (value_for_key next_invocations_list_of_yojson "nextInvocations") _list path;
     scheduled_action_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "scheduledActionDescription")
         _list path;
     schedule = option_of_yojson (value_for_key schedule_of_yojson "schedule") _list path;
     scheduled_action_name =
       option_of_yojson
         (value_for_key scheduled_action_name_of_yojson "scheduledActionName")
         _list path;
   }
    : scheduled_action_response)

let update_scheduled_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_action =
       option_of_yojson
         (value_for_key scheduled_action_response_of_yojson "scheduledAction")
         _list path;
   }
    : update_scheduled_action_response)

let update_scheduled_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "endTime")
         _list path;
     start_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "startTime")
         _list path;
     scheduled_action_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "scheduledActionDescription")
         _list path;
     enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "enabled")
         _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "roleArn") _list path;
     schedule = option_of_yojson (value_for_key schedule_of_yojson "schedule") _list path;
     target_action =
       option_of_yojson (value_for_key target_action_of_yojson "targetAction") _list path;
     scheduled_action_name =
       value_for_key scheduled_action_name_of_yojson "scheduledActionName" _list path;
   }
    : update_scheduled_action_request)

let db_user_of_yojson = string_of_yojson
let iam_role_arn_list_of_yojson tree path = list_of_yojson iam_role_arn_of_yojson tree path

let log_export_of_yojson (tree : t) path =
  ((match tree with
    | `String "useractivitylog" -> USER_ACTIVITY_LOG
    | `String "userlog" -> USER_LOG
    | `String "connectionlog" -> CONNECTION_LOG
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogExport" value)
    | _ -> raise (deserialize_wrong_type_error path "LogExport")
     : log_export)
    : log_export)

let log_export_list_of_yojson tree path = list_of_yojson log_export_of_yojson tree path

let namespace_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "MODIFYING" -> MODIFYING
    | `String "DELETING" -> DELETING
    | `String value -> raise (deserialize_unknown_enum_value_error path "NamespaceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "NamespaceStatus")
     : namespace_status)
    : namespace_status)

let namespace_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "catalogArn")
         _list path;
     lakehouse_registration_status =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "lakehouseRegistrationStatus")
         _list path;
     admin_password_secret_kms_key_id =
       option_of_yojson
         (value_for_key kms_key_id_of_yojson "adminPasswordSecretKmsKeyId")
         _list path;
     admin_password_secret_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "adminPasswordSecretArn")
         _list path;
     creation_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "creationDate")
         _list path;
     status = option_of_yojson (value_for_key namespace_status_of_yojson "status") _list path;
     log_exports =
       option_of_yojson (value_for_key log_export_list_of_yojson "logExports") _list path;
     iam_roles = option_of_yojson (value_for_key iam_role_arn_list_of_yojson "iamRoles") _list path;
     default_iam_role_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "defaultIamRoleArn")
         _list path;
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId")
         _list path;
     db_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbName")
         _list path;
     admin_username = option_of_yojson (value_for_key db_user_of_yojson "adminUsername") _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     namespace_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceId")
         _list path;
     namespace_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceArn")
         _list path;
   }
    : namespace)

let update_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ namespace = value_for_key namespace_of_yojson "namespace" _list path }
    : update_namespace_response)

let db_password_of_yojson = string_of_yojson

let update_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     admin_password_secret_kms_key_id =
       option_of_yojson
         (value_for_key kms_key_id_of_yojson "adminPasswordSecretKmsKeyId")
         _list path;
     manage_admin_password =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "manageAdminPassword")
         _list path;
     log_exports =
       option_of_yojson (value_for_key log_export_list_of_yojson "logExports") _list path;
     iam_roles = option_of_yojson (value_for_key iam_role_arn_list_of_yojson "iamRoles") _list path;
     default_iam_role_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "defaultIamRoleArn")
         _list path;
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId")
         _list path;
     admin_username = option_of_yojson (value_for_key db_user_of_yojson "adminUsername") _list path;
     admin_user_password =
       option_of_yojson (value_for_key db_password_of_yojson "adminUserPassword") _list path;
     namespace_name = value_for_key namespace_name_of_yojson "namespaceName" _list path;
   }
    : update_namespace_request)

let update_lakehouse_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "catalogArn")
         _list path;
     lakehouse_registration_status =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "lakehouseRegistrationStatus")
         _list path;
     lakehouse_idc_application_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "lakehouseIdcApplicationArn")
         _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
   }
    : update_lakehouse_configuration_response)

let lakehouse_registration_of_yojson (tree : t) path =
  ((match tree with
    | `String "Register" -> REGISTER
    | `String "Deregister" -> DEREGISTER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LakehouseRegistration" value)
    | _ -> raise (deserialize_wrong_type_error path "LakehouseRegistration")
     : lakehouse_registration)
    : lakehouse_registration)

let catalog_name_string_of_yojson = string_of_yojson

let lakehouse_idc_registration_of_yojson (tree : t) path =
  ((match tree with
    | `String "Associate" -> ASSOCIATE
    | `String "Disassociate" -> DISASSOCIATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LakehouseIdcRegistration" value)
    | _ -> raise (deserialize_wrong_type_error path "LakehouseIdcRegistration")
     : lakehouse_idc_registration)
    : lakehouse_idc_registration)

let update_lakehouse_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "dryRun")
         _list path;
     lakehouse_idc_application_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "lakehouseIdcApplicationArn")
         _list path;
     lakehouse_idc_registration =
       option_of_yojson
         (value_for_key lakehouse_idc_registration_of_yojson "lakehouseIdcRegistration")
         _list path;
     catalog_name =
       option_of_yojson (value_for_key catalog_name_string_of_yojson "catalogName") _list path;
     lakehouse_registration =
       option_of_yojson
         (value_for_key lakehouse_registration_of_yojson "lakehouseRegistration")
         _list path;
     namespace_name = value_for_key namespace_name_of_yojson "namespaceName" _list path;
   }
    : update_lakehouse_configuration_request)

let dry_run_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : dry_run_exception)

let endpoint_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpointArn")
         _list path;
     vpc_endpoint = option_of_yojson (value_for_key vpc_endpoint_of_yojson "vpcEndpoint") _list path;
     vpc_security_groups =
       option_of_yojson
         (value_for_key vpc_security_group_membership_list_of_yojson "vpcSecurityGroups")
         _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_id_list_of_yojson "subnetIds") _list path;
     address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "address")
         _list path;
     port =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "port")
         _list path;
     endpoint_create_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "endpointCreateTime")
         _list path;
     workgroup_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupName")
         _list path;
     endpoint_status =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpointStatus")
         _list path;
     endpoint_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpointName")
         _list path;
   }
    : endpoint_access)

let update_endpoint_access_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint = option_of_yojson (value_for_key endpoint_access_of_yojson "endpoint") _list path }
    : update_endpoint_access_response)

let update_endpoint_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_security_group_ids =
       option_of_yojson
         (value_for_key vpc_security_group_id_list_of_yojson "vpcSecurityGroupIds")
         _list path;
     endpoint_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpointName" _list
         path;
   }
    : update_endpoint_access_request)

let update_custom_domain_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_domain_certificate_expiry_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "customDomainCertificateExpiryTime")
         _list path;
     custom_domain_certificate_arn =
       option_of_yojson
         (value_for_key custom_domain_certificate_arn_string_of_yojson "customDomainCertificateArn")
         _list path;
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_of_yojson "workgroupName") _list path;
     custom_domain_name =
       option_of_yojson (value_for_key custom_domain_name_of_yojson "customDomainName") _list path;
   }
    : update_custom_domain_association_response)

let update_custom_domain_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_domain_certificate_arn =
       value_for_key custom_domain_certificate_arn_string_of_yojson "customDomainCertificateArn"
         _list path;
     custom_domain_name = value_for_key custom_domain_name_of_yojson "customDomainName" _list path;
     workgroup_name = value_for_key workgroup_name_of_yojson "workgroupName" _list path;
   }
    : update_custom_domain_association_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
     code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "code")
         _list path;
   }
    : throttling_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
     resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path;
   }
    : untag_resource_request)

let serverless_track_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_targets =
       option_of_yojson (value_for_key update_targets_list_of_yojson "updateTargets") _list path;
     workgroup_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupVersion")
         _list path;
     track_name = option_of_yojson (value_for_key track_name_of_yojson "trackName") _list path;
   }
    : serverless_track)

let track_list_of_yojson tree path = list_of_yojson serverless_track_of_yojson tree path

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "resourceName") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : too_many_tags_exception)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path;
   }
    : tag_resource_request)

let table_restore_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recovery_point_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "recoveryPointId")
         _list path;
     new_table_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "newTableName")
         _list path;
     target_schema_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "targetSchemaName")
         _list path;
     target_database_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "targetDatabaseName")
         _list path;
     source_table_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sourceTableName")
         _list path;
     source_schema_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sourceSchemaName")
         _list path;
     source_database_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "sourceDatabaseName")
         _list path;
     total_data_in_mega_bytes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "totalDataInMegaBytes")
         _list path;
     progress_in_mega_bytes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "progressInMegaBytes")
         _list path;
     snapshot_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotName")
         _list path;
     workgroup_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupName")
         _list path;
     namespace_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceName")
         _list path;
     request_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "requestTime")
         _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
     status =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "status")
         _list path;
     table_restore_request_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "tableRestoreRequestId")
         _list path;
   }
    : table_restore_status)

let table_restore_status_list_of_yojson tree path =
  list_of_yojson table_restore_status_of_yojson tree path

let status_of_yojson = string_of_yojson
let source_arn_of_yojson = string_of_yojson
let snapshot_list_of_yojson tree path = list_of_yojson snapshot_of_yojson tree path

let snapshot_copy_configurations_of_yojson tree path =
  list_of_yojson snapshot_copy_configuration_of_yojson tree path

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : service_quota_exceeded_exception)

let scheduled_action_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_action_name =
       option_of_yojson
         (value_for_key scheduled_action_name_of_yojson "scheduledActionName")
         _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
   }
    : scheduled_action_association)

let scheduled_actions_list_of_yojson tree path =
  list_of_yojson scheduled_action_association_of_yojson tree path

let restore_table_from_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_restore_status =
       option_of_yojson
         (value_for_key table_restore_status_of_yojson "tableRestoreStatus")
         _list path;
   }
    : restore_table_from_snapshot_response)

let restore_table_from_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activate_case_sensitive_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "activateCaseSensitiveIdentifier")
         _list path;
     new_table_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "newTableName" _list
         path;
     target_schema_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "targetSchemaName")
         _list path;
     target_database_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "targetDatabaseName")
         _list path;
     source_table_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sourceTableName"
         _list path;
     source_schema_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sourceSchemaName")
         _list path;
     source_database_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sourceDatabaseName"
         _list path;
     snapshot_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotName" _list
         path;
     workgroup_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupName" _list
         path;
     namespace_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceName" _list
         path;
   }
    : restore_table_from_snapshot_request)

let restore_table_from_recovery_point_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_restore_status =
       option_of_yojson
         (value_for_key table_restore_status_of_yojson "tableRestoreStatus")
         _list path;
   }
    : restore_table_from_recovery_point_response)

let restore_table_from_recovery_point_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activate_case_sensitive_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "activateCaseSensitiveIdentifier")
         _list path;
     new_table_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "newTableName" _list
         path;
     target_schema_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "targetSchemaName")
         _list path;
     target_database_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "targetDatabaseName")
         _list path;
     source_table_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sourceTableName"
         _list path;
     source_schema_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sourceSchemaName")
         _list path;
     source_database_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sourceDatabaseName"
         _list path;
     recovery_point_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "recoveryPointId"
         _list path;
     workgroup_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupName" _list
         path;
     namespace_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceName" _list
         path;
   }
    : restore_table_from_recovery_point_request)

let restore_from_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace = option_of_yojson (value_for_key namespace_of_yojson "namespace") _list path;
     owner_account =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ownerAccount")
         _list path;
     snapshot_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotName")
         _list path;
   }
    : restore_from_snapshot_response)

let restore_from_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     admin_password_secret_kms_key_id =
       option_of_yojson
         (value_for_key kms_key_id_of_yojson "adminPasswordSecretKmsKeyId")
         _list path;
     manage_admin_password =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "manageAdminPassword")
         _list path;
     owner_account =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ownerAccount")
         _list path;
     snapshot_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotArn")
         _list path;
     snapshot_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotName")
         _list path;
     workgroup_name = value_for_key workgroup_name_of_yojson "workgroupName" _list path;
     namespace_name = value_for_key namespace_name_of_yojson "namespaceName" _list path;
   }
    : restore_from_snapshot_request)

let restore_from_recovery_point_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace = option_of_yojson (value_for_key namespace_of_yojson "namespace") _list path;
     recovery_point_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "recoveryPointId")
         _list path;
   }
    : restore_from_recovery_point_response)

let restore_from_recovery_point_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workgroup_name = value_for_key workgroup_name_of_yojson "workgroupName" _list path;
     namespace_name = value_for_key namespace_name_of_yojson "namespaceName" _list path;
     recovery_point_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "recoveryPointId"
         _list path;
   }
    : restore_from_recovery_point_request)

let resource_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "policy")
         _list path;
     resource_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceArn")
         _list path;
   }
    : resource_policy)

let reservation_id_of_yojson = string_of_yojson
let reservation_arn_of_yojson = string_of_yojson
let capacity_of_yojson = int_of_yojson
let offering_id_of_yojson = string_of_yojson
let duration_of_yojson = int_of_yojson
let charge_of_yojson = double_of_yojson
let currency_code_of_yojson = string_of_yojson

let offering_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL_UPFRONT" -> ALL_UPFRONT
    | `String "NO_UPFRONT" -> NO_UPFRONT
    | `String value -> raise (deserialize_unknown_enum_value_error path "OfferingType" value)
    | _ -> raise (deserialize_wrong_type_error path "OfferingType")
     : offering_type)
    : offering_type)

let reservation_offering_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offering_type =
       option_of_yojson (value_for_key offering_type_of_yojson "offeringType") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     hourly_charge = option_of_yojson (value_for_key charge_of_yojson "hourlyCharge") _list path;
     upfront_charge = option_of_yojson (value_for_key charge_of_yojson "upfrontCharge") _list path;
     duration = option_of_yojson (value_for_key duration_of_yojson "duration") _list path;
     offering_id = option_of_yojson (value_for_key offering_id_of_yojson "offeringId") _list path;
   }
    : reservation_offering)

let reservation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     offering =
       option_of_yojson (value_for_key reservation_offering_of_yojson "offering") _list path;
     capacity = option_of_yojson (value_for_key capacity_of_yojson "capacity") _list path;
     end_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "endDate")
         _list path;
     start_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "startDate")
         _list path;
     reservation_arn =
       option_of_yojson (value_for_key reservation_arn_of_yojson "reservationArn") _list path;
     reservation_id =
       option_of_yojson (value_for_key reservation_id_of_yojson "reservationId") _list path;
   }
    : reservation)

let reservations_list_of_yojson tree path = list_of_yojson reservation_of_yojson tree path

let reservation_offerings_list_of_yojson tree path =
  list_of_yojson reservation_offering_of_yojson tree path

let put_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_policy =
       option_of_yojson (value_for_key resource_policy_of_yojson "resourcePolicy") _list path;
   }
    : put_resource_policy_response)

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "policy" _list path;
     resource_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceArn" _list
         path;
   }
    : put_resource_policy_request)

let invalid_pagination_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : invalid_pagination_exception)

let pagination_token_of_yojson = string_of_yojson

let list_tracks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     tracks = option_of_yojson (value_for_key track_list_of_yojson "tracks") _list path;
   }
    : list_tracks_response)

let list_tracks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_tracks_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_of_yojson "workgroupName") _list path;
     custom_domain_name =
       option_of_yojson (value_for_key custom_domain_name_of_yojson "customDomainName") _list path;
     custom_domain_certificate_expiry_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "customDomainCertificateExpiryTime")
         _list path;
     custom_domain_certificate_arn =
       option_of_yojson
         (value_for_key custom_domain_certificate_arn_string_of_yojson "customDomainCertificateArn")
         _list path;
   }
    : association)

let association_list_of_yojson tree path = list_of_yojson association_of_yojson tree path

let list_custom_domain_associations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associations =
       option_of_yojson (value_for_key association_list_of_yojson "associations") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_custom_domain_associations_response)

let list_custom_domain_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_domain_certificate_arn =
       option_of_yojson
         (value_for_key custom_domain_certificate_arn_string_of_yojson "customDomainCertificateArn")
         _list path;
     custom_domain_name =
       option_of_yojson (value_for_key custom_domain_name_of_yojson "customDomainName") _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_custom_domain_associations_request)

let get_track_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ track = option_of_yojson (value_for_key serverless_track_of_yojson "track") _list path }
    : get_track_response)

let get_track_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ track_name = value_for_key track_name_of_yojson "trackName" _list path } : get_track_request)

let get_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_policy =
       option_of_yojson (value_for_key resource_policy_of_yojson "resourcePolicy") _list path;
   }
    : get_resource_policy_response)

let get_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceArn" _list
         path;
   }
    : get_resource_policy_request)

let get_identity_center_auth_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiration_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "expirationTime")
         _list path;
     token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "token")
         _list path;
   }
    : get_identity_center_auth_token_response)

let get_identity_center_auth_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workgroup_names = value_for_key workgroup_name_list_of_yojson "workgroupNames" _list path }
    : get_identity_center_auth_token_request)

let get_custom_domain_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_domain_certificate_expiry_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "customDomainCertificateExpiryTime")
         _list path;
     custom_domain_certificate_arn =
       option_of_yojson
         (value_for_key custom_domain_certificate_arn_string_of_yojson "customDomainCertificateArn")
         _list path;
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_of_yojson "workgroupName") _list path;
     custom_domain_name =
       option_of_yojson (value_for_key custom_domain_name_of_yojson "customDomainName") _list path;
   }
    : get_custom_domain_association_response)

let get_custom_domain_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workgroup_name = value_for_key workgroup_name_of_yojson "workgroupName" _list path;
     custom_domain_name = value_for_key custom_domain_name_of_yojson "customDomainName" _list path;
   }
    : get_custom_domain_association_request)

let get_credentials_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_refresh_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "nextRefreshTime")
         _list path;
     expiration =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiration")
         _list path;
     db_password = option_of_yojson (value_for_key db_password_of_yojson "dbPassword") _list path;
     db_user = option_of_yojson (value_for_key db_user_of_yojson "dbUser") _list path;
   }
    : get_credentials_response)

let db_name_of_yojson = string_of_yojson

let get_credentials_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_domain_name =
       option_of_yojson (value_for_key custom_domain_name_of_yojson "customDomainName") _list path;
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_of_yojson "workgroupName") _list path;
     duration_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "durationSeconds")
         _list path;
     db_name = option_of_yojson (value_for_key db_name_of_yojson "dbName") _list path;
   }
    : get_credentials_request)

let delete_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceArn" _list
         path;
   }
    : delete_resource_policy_request)

let delete_custom_domain_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_custom_domain_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_domain_name = value_for_key custom_domain_name_of_yojson "customDomainName" _list path;
     workgroup_name = value_for_key workgroup_name_of_yojson "workgroupName" _list path;
   }
    : delete_custom_domain_association_request)

let create_custom_domain_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_domain_certificate_expiry_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "customDomainCertificateExpiryTime")
         _list path;
     custom_domain_certificate_arn =
       option_of_yojson
         (value_for_key custom_domain_certificate_arn_string_of_yojson "customDomainCertificateArn")
         _list path;
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_of_yojson "workgroupName") _list path;
     custom_domain_name =
       option_of_yojson (value_for_key custom_domain_name_of_yojson "customDomainName") _list path;
   }
    : create_custom_domain_association_response)

let create_custom_domain_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_domain_certificate_arn =
       value_for_key custom_domain_certificate_arn_string_of_yojson "customDomainCertificateArn"
         _list path;
     custom_domain_name = value_for_key custom_domain_name_of_yojson "customDomainName" _list path;
     workgroup_name = value_for_key workgroup_name_of_yojson "workgroupName" _list path;
   }
    : create_custom_domain_association_request)

let redshift_idc_application_arn_of_yojson = string_of_yojson

let recovery_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceArn")
         _list path;
     workgroup_name =
       option_of_yojson (value_for_key workgroup_name_of_yojson "workgroupName") _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     total_size_in_mega_bytes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "totalSizeInMegaBytes")
         _list path;
     recovery_point_create_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "recoveryPointCreateTime")
         _list path;
     recovery_point_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "recoveryPointId")
         _list path;
   }
    : recovery_point)

let recovery_point_list_of_yojson tree path = list_of_yojson recovery_point_of_yojson tree path
let owner_account_of_yojson = string_of_yojson
let namespace_list_of_yojson tree path = list_of_yojson namespace_of_yojson tree path
let managed_workgroup_name_of_yojson = string_of_yojson

let managed_workgroup_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_AVAILABLE" -> NOT_AVAILABLE
    | `String "AVAILABLE" -> AVAILABLE
    | `String "MODIFYING" -> MODIFYING
    | `String "DELETING" -> DELETING
    | `String "CREATING" -> CREATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ManagedWorkgroupStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ManagedWorkgroupStatus")
     : managed_workgroup_status)
    : managed_workgroup_status)

let managed_workgroup_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "creationDate")
         _list path;
     status =
       option_of_yojson (value_for_key managed_workgroup_status_of_yojson "status") _list path;
     source_arn = option_of_yojson (value_for_key source_arn_of_yojson "sourceArn") _list path;
     managed_workgroup_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "managedWorkgroupId")
         _list path;
     managed_workgroup_name =
       option_of_yojson
         (value_for_key managed_workgroup_name_of_yojson "managedWorkgroupName")
         _list path;
   }
    : managed_workgroup_list_item)

let managed_workgroups_of_yojson tree path =
  list_of_yojson managed_workgroup_list_item_of_yojson tree path

let list_workgroups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workgroups = value_for_key workgroup_list_of_yojson "workgroups" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_workgroups_response)

let list_workgroups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_account =
       option_of_yojson (value_for_key owner_account_of_yojson "ownerAccount") _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_workgroups_request)

let list_usage_limits_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     usage_limits = option_of_yojson (value_for_key usage_limits_of_yojson "usageLimits") _list path;
   }
    : list_usage_limits_response)

let list_usage_limits_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     usage_type =
       option_of_yojson (value_for_key usage_limit_usage_type_of_yojson "usageType") _list path;
     resource_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceArn")
         _list path;
   }
    : list_usage_limits_request)

let list_table_restore_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_restore_statuses =
       option_of_yojson
         (value_for_key table_restore_status_list_of_yojson "tableRestoreStatuses")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_table_restore_status_response)

let list_table_restore_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workgroup_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupName")
         _list path;
     namespace_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceName")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_table_restore_status_request)

let list_snapshots_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshots = option_of_yojson (value_for_key snapshot_list_of_yojson "snapshots") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_snapshots_response)

let list_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "endTime")
         _list path;
     start_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "startTime")
         _list path;
     owner_account =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ownerAccount")
         _list path;
     namespace_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceArn")
         _list path;
     namespace_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceName")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_snapshots_request)

let list_snapshot_copy_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_copy_configurations =
       value_for_key snapshot_copy_configurations_of_yojson "snapshotCopyConfigurations" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_snapshot_copy_configurations_response)

let list_snapshot_copy_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
   }
    : list_snapshot_copy_configurations_request)

let list_scheduled_actions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_actions =
       option_of_yojson
         (value_for_key scheduled_actions_list_of_yojson "scheduledActions")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_scheduled_actions_response)

let list_scheduled_actions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_scheduled_actions_request)

let list_reservations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     reservations_list = value_for_key reservations_list_of_yojson "reservationsList" _list path;
   }
    : list_reservations_response)

let list_reservations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_reservations_request)

let list_reservation_offerings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     reservation_offerings_list =
       value_for_key reservation_offerings_list_of_yojson "reservationOfferingsList" _list path;
   }
    : list_reservation_offerings_response)

let list_reservation_offerings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_reservation_offerings_request)

let list_recovery_points_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     recovery_points =
       option_of_yojson (value_for_key recovery_point_list_of_yojson "recoveryPoints") _list path;
   }
    : list_recovery_points_response)

let list_recovery_points_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceArn")
         _list path;
     namespace_name =
       option_of_yojson (value_for_key namespace_name_of_yojson "namespaceName") _list path;
     end_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "endTime")
         _list path;
     start_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "startTime")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_recovery_points_request)

let list_namespaces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespaces = value_for_key namespace_list_of_yojson "namespaces" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_namespaces_response)

let list_namespaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_namespaces_request)

let list_managed_workgroups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_workgroups =
       option_of_yojson (value_for_key managed_workgroups_of_yojson "managedWorkgroups") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_managed_workgroups_response)

let list_managed_workgroups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     source_arn = option_of_yojson (value_for_key source_arn_of_yojson "sourceArn") _list path;
   }
    : list_managed_workgroups_request)

let endpoint_access_list_of_yojson tree path = list_of_yojson endpoint_access_of_yojson tree path

let list_endpoint_access_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoints = value_for_key endpoint_access_list_of_yojson "endpoints" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_endpoint_access_response)

let list_endpoint_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_account =
       option_of_yojson (value_for_key owner_account_of_yojson "ownerAccount") _list path;
     vpc_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vpcId")
         _list path;
     workgroup_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupName")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_endpoint_access_request)

let get_workgroup_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workgroup = value_for_key workgroup_of_yojson "workgroup" _list path }
    : get_workgroup_response)

let get_workgroup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workgroup_name = value_for_key workgroup_name_of_yojson "workgroupName" _list path }
    : get_workgroup_request)

let get_usage_limit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ usage_limit = option_of_yojson (value_for_key usage_limit_of_yojson "usageLimit") _list path }
    : get_usage_limit_response)

let get_usage_limit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage_limit_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "usageLimitId" _list
         path;
   }
    : get_usage_limit_request)

let get_table_restore_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_restore_status =
       option_of_yojson
         (value_for_key table_restore_status_of_yojson "tableRestoreStatus")
         _list path;
   }
    : get_table_restore_status_response)

let get_table_restore_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_restore_request_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "tableRestoreRequestId" _list path;
   }
    : get_table_restore_status_request)

let get_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot = option_of_yojson (value_for_key snapshot_of_yojson "snapshot") _list path }
    : get_snapshot_response)

let get_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotArn")
         _list path;
     owner_account =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ownerAccount")
         _list path;
     snapshot_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotName")
         _list path;
   }
    : get_snapshot_request)

let get_scheduled_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_action =
       option_of_yojson
         (value_for_key scheduled_action_response_of_yojson "scheduledAction")
         _list path;
   }
    : get_scheduled_action_response)

let get_scheduled_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_action_name =
       value_for_key scheduled_action_name_of_yojson "scheduledActionName" _list path;
   }
    : get_scheduled_action_request)

let get_reservation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ reservation = value_for_key reservation_of_yojson "reservation" _list path }
    : get_reservation_response)

let get_reservation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ reservation_id = value_for_key reservation_id_of_yojson "reservationId" _list path }
    : get_reservation_request)

let get_reservation_offering_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reservation_offering =
       value_for_key reservation_offering_of_yojson "reservationOffering" _list path;
   }
    : get_reservation_offering_response)

let get_reservation_offering_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ offering_id = value_for_key offering_id_of_yojson "offeringId" _list path }
    : get_reservation_offering_request)

let get_recovery_point_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recovery_point =
       option_of_yojson (value_for_key recovery_point_of_yojson "recoveryPoint") _list path;
   }
    : get_recovery_point_response)

let get_recovery_point_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recovery_point_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "recoveryPointId"
         _list path;
   }
    : get_recovery_point_request)

let get_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ namespace = value_for_key namespace_of_yojson "namespace" _list path }
    : get_namespace_response)

let get_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ namespace_name = value_for_key namespace_name_of_yojson "namespaceName" _list path }
    : get_namespace_request)

let get_endpoint_access_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint = option_of_yojson (value_for_key endpoint_access_of_yojson "endpoint") _list path }
    : get_endpoint_access_response)

let get_endpoint_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpointName" _list
         path;
   }
    : get_endpoint_access_request)

let delete_workgroup_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workgroup = value_for_key workgroup_of_yojson "workgroup" _list path }
    : delete_workgroup_response)

let delete_workgroup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workgroup_name = value_for_key workgroup_name_of_yojson "workgroupName" _list path }
    : delete_workgroup_request)

let delete_usage_limit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ usage_limit = option_of_yojson (value_for_key usage_limit_of_yojson "usageLimit") _list path }
    : delete_usage_limit_response)

let delete_usage_limit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage_limit_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "usageLimitId" _list
         path;
   }
    : delete_usage_limit_request)

let delete_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot = option_of_yojson (value_for_key snapshot_of_yojson "snapshot") _list path }
    : delete_snapshot_response)

let delete_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotName" _list
         path;
   }
    : delete_snapshot_request)

let delete_snapshot_copy_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_copy_configuration =
       value_for_key snapshot_copy_configuration_of_yojson "snapshotCopyConfiguration" _list path;
   }
    : delete_snapshot_copy_configuration_response)

let delete_snapshot_copy_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_copy_configuration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "snapshotCopyConfigurationId" _list path;
   }
    : delete_snapshot_copy_configuration_request)

let delete_scheduled_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_action =
       option_of_yojson
         (value_for_key scheduled_action_response_of_yojson "scheduledAction")
         _list path;
   }
    : delete_scheduled_action_response)

let delete_scheduled_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_action_name =
       value_for_key scheduled_action_name_of_yojson "scheduledActionName" _list path;
   }
    : delete_scheduled_action_request)

let delete_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ namespace = value_for_key namespace_of_yojson "namespace" _list path }
    : delete_namespace_response)

let delete_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     final_snapshot_retention_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "finalSnapshotRetentionPeriod")
         _list path;
     final_snapshot_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "finalSnapshotName")
         _list path;
     namespace_name = value_for_key namespace_name_of_yojson "namespaceName" _list path;
   }
    : delete_namespace_request)

let delete_endpoint_access_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint = option_of_yojson (value_for_key endpoint_access_of_yojson "endpoint") _list path }
    : delete_endpoint_access_response)

let delete_endpoint_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpointName" _list
         path;
   }
    : delete_endpoint_access_request)

let create_workgroup_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workgroup = option_of_yojson (value_for_key workgroup_of_yojson "workgroup") _list path }
    : create_workgroup_response)

let create_workgroup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     extra_compute_for_automatic_optimization =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "extraComputeForAutomaticOptimization")
         _list path;
     track_name = option_of_yojson (value_for_key track_name_of_yojson "trackName") _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "ipAddressType") _list path;
     price_performance_target =
       option_of_yojson
         (value_for_key performance_target_of_yojson "pricePerformanceTarget")
         _list path;
     max_capacity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxCapacity")
         _list path;
     port =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "port")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     publicly_accessible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "publiclyAccessible")
         _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_id_list_of_yojson "subnetIds") _list path;
     security_group_ids =
       option_of_yojson
         (value_for_key security_group_id_list_of_yojson "securityGroupIds")
         _list path;
     config_parameters =
       option_of_yojson
         (value_for_key config_parameter_list_of_yojson "configParameters")
         _list path;
     enhanced_vpc_routing =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "enhancedVpcRouting")
         _list path;
     base_capacity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "baseCapacity")
         _list path;
     namespace_name = value_for_key namespace_name_of_yojson "namespaceName" _list path;
     workgroup_name = value_for_key workgroup_name_of_yojson "workgroupName" _list path;
   }
    : create_workgroup_request)

let create_usage_limit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ usage_limit = option_of_yojson (value_for_key usage_limit_of_yojson "usageLimit") _list path }
    : create_usage_limit_response)

let create_usage_limit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     breach_action =
       option_of_yojson
         (value_for_key usage_limit_breach_action_of_yojson "breachAction")
         _list path;
     period = option_of_yojson (value_for_key usage_limit_period_of_yojson "period") _list path;
     amount =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "amount" _list path;
     usage_type = value_for_key usage_limit_usage_type_of_yojson "usageType" _list path;
     resource_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceArn" _list
         path;
   }
    : create_usage_limit_request)

let create_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot = option_of_yojson (value_for_key snapshot_of_yojson "snapshot") _list path }
    : create_snapshot_response)

let create_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     retention_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "retentionPeriod")
         _list path;
     snapshot_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotName" _list
         path;
     namespace_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "namespaceName" _list
         path;
   }
    : create_snapshot_request)

let create_snapshot_copy_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_copy_configuration =
       value_for_key snapshot_copy_configuration_of_yojson "snapshotCopyConfiguration" _list path;
   }
    : create_snapshot_copy_configuration_response)

let create_snapshot_copy_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "destinationKmsKeyId") _list path;
     snapshot_retention_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "snapshotRetentionPeriod")
         _list path;
     destination_region =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "destinationRegion"
         _list path;
     namespace_name = value_for_key namespace_name_of_yojson "namespaceName" _list path;
   }
    : create_snapshot_copy_configuration_request)

let create_scheduled_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_action =
       option_of_yojson
         (value_for_key scheduled_action_response_of_yojson "scheduledAction")
         _list path;
   }
    : create_scheduled_action_response)

let create_scheduled_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "endTime")
         _list path;
     start_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "startTime")
         _list path;
     scheduled_action_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "scheduledActionDescription")
         _list path;
     enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "enabled")
         _list path;
     namespace_name = value_for_key namespace_name_of_yojson "namespaceName" _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "roleArn" _list path;
     schedule = value_for_key schedule_of_yojson "schedule" _list path;
     target_action = value_for_key target_action_of_yojson "targetAction" _list path;
     scheduled_action_name =
       value_for_key scheduled_action_name_of_yojson "scheduledActionName" _list path;
   }
    : create_scheduled_action_request)

let create_reservation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ reservation = option_of_yojson (value_for_key reservation_of_yojson "reservation") _list path }
    : create_reservation_response)

let create_reservation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientToken")
         _list path;
     offering_id = value_for_key offering_id_of_yojson "offeringId" _list path;
     capacity = value_for_key capacity_of_yojson "capacity" _list path;
   }
    : create_reservation_request)

let create_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ namespace = option_of_yojson (value_for_key namespace_of_yojson "namespace") _list path }
    : create_namespace_response)

let create_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redshift_idc_application_arn =
       option_of_yojson
         (value_for_key redshift_idc_application_arn_of_yojson "redshiftIdcApplicationArn")
         _list path;
     admin_password_secret_kms_key_id =
       option_of_yojson
         (value_for_key kms_key_id_of_yojson "adminPasswordSecretKmsKeyId")
         _list path;
     manage_admin_password =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "manageAdminPassword")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     log_exports =
       option_of_yojson (value_for_key log_export_list_of_yojson "logExports") _list path;
     iam_roles = option_of_yojson (value_for_key iam_role_arn_list_of_yojson "iamRoles") _list path;
     default_iam_role_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "defaultIamRoleArn")
         _list path;
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId")
         _list path;
     db_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbName")
         _list path;
     admin_user_password =
       option_of_yojson (value_for_key db_password_of_yojson "adminUserPassword") _list path;
     admin_username = option_of_yojson (value_for_key db_user_of_yojson "adminUsername") _list path;
     namespace_name = value_for_key namespace_name_of_yojson "namespaceName" _list path;
   }
    : create_namespace_request)

let create_endpoint_access_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint = option_of_yojson (value_for_key endpoint_access_of_yojson "endpoint") _list path }
    : create_endpoint_access_response)

let create_endpoint_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_account =
       option_of_yojson (value_for_key owner_account_of_yojson "ownerAccount") _list path;
     vpc_security_group_ids =
       option_of_yojson
         (value_for_key vpc_security_group_id_list_of_yojson "vpcSecurityGroupIds")
         _list path;
     workgroup_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "workgroupName" _list
         path;
     subnet_ids = value_for_key subnet_id_list_of_yojson "subnetIds" _list path;
     endpoint_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endpointName" _list
         path;
   }
    : create_endpoint_access_request)

let convert_recovery_point_to_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot = option_of_yojson (value_for_key snapshot_of_yojson "snapshot") _list path }
    : convert_recovery_point_to_snapshot_response)

let convert_recovery_point_to_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     retention_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "retentionPeriod")
         _list path;
     snapshot_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "snapshotName" _list
         path;
     recovery_point_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "recoveryPointId"
         _list path;
   }
    : convert_recovery_point_to_snapshot_request)
