open Smaws_Lib.Json.SerializeHelpers
open Types

let workgroup_status_to_yojson (x : workgroup_status) =
  match x with
  | CREATING -> `String "CREATING"
  | AVAILABLE -> `String "AVAILABLE"
  | MODIFYING -> `String "MODIFYING"
  | DELETING -> `String "DELETING"

let workgroup_name_to_yojson = string_to_yojson
let workgroup_name_list_to_yojson tree = list_to_yojson workgroup_name_to_yojson tree
let parameter_key_to_yojson = string_to_yojson
let parameter_value_to_yojson = string_to_yojson

let config_parameter_to_yojson (x : config_parameter) =
  assoc_to_yojson
    [
      ("parameterValue", option_to_yojson parameter_value_to_yojson x.parameter_value);
      ("parameterKey", option_to_yojson parameter_key_to_yojson x.parameter_key);
    ]

let config_parameter_list_to_yojson tree = list_to_yojson config_parameter_to_yojson tree
let security_group_id_to_yojson = string_to_yojson
let security_group_id_list_to_yojson tree = list_to_yojson security_group_id_to_yojson tree
let subnet_id_to_yojson = string_to_yojson
let subnet_id_list_to_yojson tree = list_to_yojson subnet_id_to_yojson tree

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ( "ipv6Address",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ipv6_address );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "privateIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_ip_address );
      ( "subnetId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.subnet_id );
      ( "networkInterfaceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.network_interface_id );
    ]

let network_interface_list_to_yojson tree = list_to_yojson network_interface_to_yojson tree

let vpc_endpoint_to_yojson (x : vpc_endpoint) =
  assoc_to_yojson
    [
      ("networkInterfaces", option_to_yojson network_interface_list_to_yojson x.network_interfaces);
      ("vpcId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vpc_id);
      ( "vpcEndpointId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vpc_endpoint_id
      );
    ]

let vpc_endpoint_list_to_yojson tree = list_to_yojson vpc_endpoint_to_yojson tree

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("vpcEndpoints", option_to_yojson vpc_endpoint_list_to_yojson x.vpc_endpoints);
      ("port", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.port);
      ("address", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.address);
    ]

let custom_domain_name_to_yojson = string_to_yojson
let custom_domain_certificate_arn_string_to_yojson = string_to_yojson

let vpc_ids_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let ip_address_type_to_yojson = string_to_yojson

let performance_target_status_to_yojson (x : performance_target_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let performance_target_to_yojson (x : performance_target) =
  assoc_to_yojson
    [
      ("level", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.level);
      ("status", option_to_yojson performance_target_status_to_yojson x.status);
    ]

let track_name_to_yojson = string_to_yojson

let workgroup_to_yojson (x : workgroup) =
  assoc_to_yojson
    [
      ( "extraComputeForAutomaticOptimization",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.extra_compute_for_automatic_optimization );
      ("pendingTrackName", option_to_yojson track_name_to_yojson x.pending_track_name);
      ("trackName", option_to_yojson track_name_to_yojson x.track_name);
      ( "pricePerformanceTarget",
        option_to_yojson performance_target_to_yojson x.price_performance_target );
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("crossAccountVpcs", option_to_yojson vpc_ids_to_yojson x.cross_account_vpcs);
      ( "maxCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_capacity );
      ( "patchVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.patch_version );
      ( "workgroupVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_version
      );
      ( "customDomainCertificateExpiryTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.custom_domain_certificate_expiry_time );
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
      ("port", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.port);
      ( "creationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.creation_date );
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("endpoint", option_to_yojson endpoint_to_yojson x.endpoint);
      ("status", option_to_yojson workgroup_status_to_yojson x.status);
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("securityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
      ("configParameters", option_to_yojson config_parameter_list_to_yojson x.config_parameters);
      ( "enhancedVpcRouting",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enhanced_vpc_routing );
      ( "baseCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.base_capacity );
      ( "namespaceName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name );
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ( "workgroupArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_arn );
      ( "workgroupId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_id );
    ]

let workgroup_list_to_yojson tree = list_to_yojson workgroup_to_yojson tree
let vpc_security_group_id_to_yojson = string_to_yojson

let vpc_security_group_membership_to_yojson (x : vpc_security_group_membership) =
  assoc_to_yojson
    [
      ("status", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status);
      ( "vpcSecurityGroupId",
        option_to_yojson vpc_security_group_id_to_yojson x.vpc_security_group_id );
    ]

let vpc_security_group_membership_list_to_yojson tree =
  list_to_yojson vpc_security_group_membership_to_yojson tree

let vpc_security_group_id_list_to_yojson tree = list_to_yojson vpc_security_group_id_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let usage_limit_usage_type_to_yojson (x : usage_limit_usage_type) =
  match x with
  | SERVERLESS_COMPUTE -> `String "serverless-compute"
  | CROSS_REGION_DATASHARING -> `String "cross-region-datasharing"

let usage_limit_period_to_yojson (x : usage_limit_period) =
  match x with
  | DAILY -> `String "daily"
  | WEEKLY -> `String "weekly"
  | MONTHLY -> `String "monthly"

let usage_limit_breach_action_to_yojson (x : usage_limit_breach_action) =
  match x with
  | LOG -> `String "log"
  | EMIT_METRIC -> `String "emit-metric"
  | DEACTIVATE -> `String "deactivate"

let usage_limit_to_yojson (x : usage_limit) =
  assoc_to_yojson
    [
      ("breachAction", option_to_yojson usage_limit_breach_action_to_yojson x.breach_action);
      ("period", option_to_yojson usage_limit_period_to_yojson x.period);
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.amount);
      ("usageType", option_to_yojson usage_limit_usage_type_to_yojson x.usage_type);
      ( "resourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn );
      ( "usageLimitArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_limit_arn
      );
      ( "usageLimitId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_limit_id );
    ]

let usage_limits_to_yojson tree = list_to_yojson usage_limit_to_yojson tree

let update_workgroup_response_to_yojson (x : update_workgroup_response) =
  assoc_to_yojson [ ("workgroup", Some (workgroup_to_yojson x.workgroup)) ]

let update_workgroup_request_to_yojson (x : update_workgroup_request) =
  assoc_to_yojson
    [
      ( "extraComputeForAutomaticOptimization",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.extra_compute_for_automatic_optimization );
      ("trackName", option_to_yojson track_name_to_yojson x.track_name);
      ( "pricePerformanceTarget",
        option_to_yojson performance_target_to_yojson x.price_performance_target );
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ( "maxCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_capacity );
      ("port", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.port);
      ("securityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("configParameters", option_to_yojson config_parameter_list_to_yojson x.config_parameters);
      ( "enhancedVpcRouting",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enhanced_vpc_routing );
      ( "baseCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.base_capacity );
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
    ]

let amazon_resource_name_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let ipv6_cidr_block_not_found_exception_to_yojson (x : ipv6_cidr_block_not_found_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let insufficient_capacity_exception_to_yojson (x : insufficient_capacity_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let update_usage_limit_response_to_yojson (x : update_usage_limit_response) =
  assoc_to_yojson [ ("usageLimit", option_to_yojson usage_limit_to_yojson x.usage_limit) ]

let update_usage_limit_request_to_yojson (x : update_usage_limit_request) =
  assoc_to_yojson
    [
      ("breachAction", option_to_yojson usage_limit_breach_action_to_yojson x.breach_action);
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.amount);
      ( "usageLimitId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_limit_id) );
    ]

let update_target_to_yojson (x : update_target) =
  assoc_to_yojson
    [
      ( "workgroupVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_version
      );
      ("trackName", option_to_yojson track_name_to_yojson x.track_name);
    ]

let update_targets_list_to_yojson tree = list_to_yojson update_target_to_yojson tree

let snapshot_status_to_yojson (x : snapshot_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | CREATING -> `String "CREATING"
  | DELETED -> `String "DELETED"
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"
  | COPYING -> `String "COPYING"

let kms_key_id_to_yojson = string_to_yojson

let account_id_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let snapshot_to_yojson (x : snapshot) =
  assoc_to_yojson
    [
      ( "adminPasswordSecretKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.admin_password_secret_kms_key_id );
      ( "adminPasswordSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.admin_password_secret_arn );
      ( "accountsWithProvisionedRestoreAccess",
        option_to_yojson account_id_list_to_yojson x.accounts_with_provisioned_restore_access );
      ( "accountsWithRestoreAccess",
        option_to_yojson account_id_list_to_yojson x.accounts_with_restore_access );
      ( "snapshotArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_arn );
      ( "snapshotRetentionStartTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.snapshot_retention_start_time );
      ( "snapshotRemainingDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshot_remaining_days );
      ( "snapshotRetentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshot_retention_period );
      ( "elapsedTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.elapsed_time_in_seconds );
      ( "estimatedSecondsToCompletion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.estimated_seconds_to_completion );
      ( "currentBackupRateInMegaBytesPerSecond",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.current_backup_rate_in_mega_bytes_per_second );
      ( "backupProgressInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.backup_progress_in_mega_bytes );
      ( "actualIncrementalBackupSizeInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.actual_incremental_backup_size_in_mega_bytes );
      ( "totalBackupSizeInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.total_backup_size_in_mega_bytes );
      ( "ownerAccount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.owner_account );
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("status", option_to_yojson snapshot_status_to_yojson x.status);
      ( "adminUsername",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.admin_username );
      ( "snapshotCreateTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.snapshot_create_time );
      ( "snapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name );
      ( "namespaceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_arn );
      ( "namespaceName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name );
    ]

let update_snapshot_response_to_yojson (x : update_snapshot_response) =
  assoc_to_yojson [ ("snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let update_snapshot_request_to_yojson (x : update_snapshot_request) =
  assoc_to_yojson
    [
      ( "retentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.retention_period
      );
      ( "snapshotName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name) );
    ]

let namespace_name_to_yojson = string_to_yojson

let snapshot_copy_configuration_to_yojson (x : snapshot_copy_configuration) =
  assoc_to_yojson
    [
      ("destinationKmsKeyId", option_to_yojson kms_key_id_to_yojson x.destination_kms_key_id);
      ( "snapshotRetentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshot_retention_period );
      ( "destinationRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.destination_region );
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ( "snapshotCopyConfigurationArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.snapshot_copy_configuration_arn );
      ( "snapshotCopyConfigurationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.snapshot_copy_configuration_id );
    ]

let update_snapshot_copy_configuration_response_to_yojson
    (x : update_snapshot_copy_configuration_response) =
  assoc_to_yojson
    [
      ( "snapshotCopyConfiguration",
        Some (snapshot_copy_configuration_to_yojson x.snapshot_copy_configuration) );
    ]

let update_snapshot_copy_configuration_request_to_yojson
    (x : update_snapshot_copy_configuration_request) =
  assoc_to_yojson
    [
      ( "snapshotRetentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshot_retention_period );
      ( "snapshotCopyConfigurationId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_copy_configuration_id)
      );
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("code", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.code);
    ]

let scheduled_action_name_to_yojson = string_to_yojson

let schedule_to_yojson (x : schedule) =
  match x with
  | Cron arg ->
      assoc_to_yojson
        [ ("cron", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | At arg ->
      assoc_to_yojson
        [
          ("at", Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson arg));
        ]

let next_invocations_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson tree

let iam_role_arn_to_yojson = string_to_yojson

let state_to_yojson (x : state) =
  match x with ACTIVE -> `String "ACTIVE" | DISABLED -> `String "DISABLED"

let snapshot_name_prefix_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("value", Some (tag_value_to_yojson x.value)); ("key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_snapshot_schedule_action_parameters_to_yojson
    (x : create_snapshot_schedule_action_parameters) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "retentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.retention_period
      );
      ("snapshotNamePrefix", Some (snapshot_name_prefix_to_yojson x.snapshot_name_prefix));
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
    ]

let target_action_to_yojson (x : target_action) =
  match x with
  | CreateSnapshot arg ->
      assoc_to_yojson
        [ ("createSnapshot", Some (create_snapshot_schedule_action_parameters_to_yojson arg)) ]

let scheduled_action_response_to_yojson (x : scheduled_action_response) =
  assoc_to_yojson
    [
      ( "scheduledActionUuid",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_action_uuid );
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ("targetAction", option_to_yojson target_action_to_yojson x.target_action);
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ("state", option_to_yojson state_to_yojson x.state);
      ("roleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("nextInvocations", option_to_yojson next_invocations_list_to_yojson x.next_invocations);
      ( "scheduledActionDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_action_description );
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ( "scheduledActionName",
        option_to_yojson scheduled_action_name_to_yojson x.scheduled_action_name );
    ]

let update_scheduled_action_response_to_yojson (x : update_scheduled_action_response) =
  assoc_to_yojson
    [ ("scheduledAction", option_to_yojson scheduled_action_response_to_yojson x.scheduled_action) ]

let update_scheduled_action_request_to_yojson (x : update_scheduled_action_request) =
  assoc_to_yojson
    [
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ( "scheduledActionDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_action_description );
      ( "enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
      ("roleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("targetAction", option_to_yojson target_action_to_yojson x.target_action);
      ("scheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name));
    ]

let db_user_to_yojson = string_to_yojson
let iam_role_arn_list_to_yojson tree = list_to_yojson iam_role_arn_to_yojson tree

let log_export_to_yojson (x : log_export) =
  match x with
  | USER_ACTIVITY_LOG -> `String "useractivitylog"
  | USER_LOG -> `String "userlog"
  | CONNECTION_LOG -> `String "connectionlog"

let log_export_list_to_yojson tree = list_to_yojson log_export_to_yojson tree

let namespace_status_to_yojson (x : namespace_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | MODIFYING -> `String "MODIFYING"
  | DELETING -> `String "DELETING"

let namespace_to_yojson (x : namespace) =
  assoc_to_yojson
    [
      ( "catalogArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.catalog_arn );
      ( "lakehouseRegistrationStatus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lakehouse_registration_status );
      ( "adminPasswordSecretKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.admin_password_secret_kms_key_id );
      ( "adminPasswordSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.admin_password_secret_arn );
      ( "creationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.creation_date );
      ("status", option_to_yojson namespace_status_to_yojson x.status);
      ("logExports", option_to_yojson log_export_list_to_yojson x.log_exports);
      ("iamRoles", option_to_yojson iam_role_arn_list_to_yojson x.iam_roles);
      ( "defaultIamRoleArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_iam_role_arn );
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ("adminUsername", option_to_yojson db_user_to_yojson x.admin_username);
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ( "namespaceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_id );
      ( "namespaceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_arn );
    ]

let update_namespace_response_to_yojson (x : update_namespace_response) =
  assoc_to_yojson [ ("namespace", Some (namespace_to_yojson x.namespace)) ]

let db_password_to_yojson = string_to_yojson

let update_namespace_request_to_yojson (x : update_namespace_request) =
  assoc_to_yojson
    [
      ( "adminPasswordSecretKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.admin_password_secret_kms_key_id );
      ( "manageAdminPassword",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.manage_admin_password );
      ("logExports", option_to_yojson log_export_list_to_yojson x.log_exports);
      ("iamRoles", option_to_yojson iam_role_arn_list_to_yojson x.iam_roles);
      ( "defaultIamRoleArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_iam_role_arn );
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ("adminUsername", option_to_yojson db_user_to_yojson x.admin_username);
      ("adminUserPassword", option_to_yojson db_password_to_yojson x.admin_user_password);
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
    ]

let update_lakehouse_configuration_response_to_yojson (x : update_lakehouse_configuration_response)
    =
  assoc_to_yojson
    [
      ( "catalogArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.catalog_arn );
      ( "lakehouseRegistrationStatus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lakehouse_registration_status );
      ( "lakehouseIdcApplicationArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lakehouse_idc_application_arn );
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
    ]

let lakehouse_registration_to_yojson (x : lakehouse_registration) =
  match x with REGISTER -> `String "Register" | DEREGISTER -> `String "Deregister"

let catalog_name_string_to_yojson = string_to_yojson

let lakehouse_idc_registration_to_yojson (x : lakehouse_idc_registration) =
  match x with ASSOCIATE -> `String "Associate" | DISASSOCIATE -> `String "Disassociate"

let update_lakehouse_configuration_request_to_yojson (x : update_lakehouse_configuration_request) =
  assoc_to_yojson
    [
      ("dryRun", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.dry_run);
      ( "lakehouseIdcApplicationArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lakehouse_idc_application_arn );
      ( "lakehouseIdcRegistration",
        option_to_yojson lakehouse_idc_registration_to_yojson x.lakehouse_idc_registration );
      ("catalogName", option_to_yojson catalog_name_string_to_yojson x.catalog_name);
      ( "lakehouseRegistration",
        option_to_yojson lakehouse_registration_to_yojson x.lakehouse_registration );
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
    ]

let dry_run_exception_to_yojson (x : dry_run_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let endpoint_access_to_yojson (x : endpoint_access) =
  assoc_to_yojson
    [
      ( "endpointArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_arn );
      ("vpcEndpoint", option_to_yojson vpc_endpoint_to_yojson x.vpc_endpoint);
      ( "vpcSecurityGroups",
        option_to_yojson vpc_security_group_membership_list_to_yojson x.vpc_security_groups );
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("address", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.address);
      ("port", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.port);
      ( "endpointCreateTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.endpoint_create_time );
      ( "workgroupName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name );
      ( "endpointStatus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_status
      );
      ( "endpointName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_name );
    ]

let update_endpoint_access_response_to_yojson (x : update_endpoint_access_response) =
  assoc_to_yojson [ ("endpoint", option_to_yojson endpoint_access_to_yojson x.endpoint) ]

let update_endpoint_access_request_to_yojson (x : update_endpoint_access_request) =
  assoc_to_yojson
    [
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "endpointName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_name) );
    ]

let update_custom_domain_association_response_to_yojson
    (x : update_custom_domain_association_response) =
  assoc_to_yojson
    [
      ( "customDomainCertificateExpiryTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.custom_domain_certificate_expiry_time );
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
    ]

let update_custom_domain_association_request_to_yojson
    (x : update_custom_domain_association_request) =
  assoc_to_yojson
    [
      ( "customDomainCertificateArn",
        Some (custom_domain_certificate_arn_string_to_yojson x.custom_domain_certificate_arn) );
      ("customDomainName", Some (custom_domain_name_to_yojson x.custom_domain_name));
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("code", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.code);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let serverless_track_to_yojson (x : serverless_track) =
  assoc_to_yojson
    [
      ("updateTargets", option_to_yojson update_targets_list_to_yojson x.update_targets);
      ( "workgroupVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_version
      );
      ("trackName", option_to_yojson track_name_to_yojson x.track_name);
    ]

let track_list_to_yojson tree = list_to_yojson serverless_track_to_yojson tree

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let table_restore_status_to_yojson (x : table_restore_status) =
  assoc_to_yojson
    [
      ( "recoveryPointId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id
      );
      ( "newTableName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.new_table_name );
      ( "targetSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_schema_name );
      ( "targetDatabaseName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_database_name );
      ( "sourceTableName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_table_name
      );
      ( "sourceSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.source_schema_name );
      ( "sourceDatabaseName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.source_database_name );
      ( "totalDataInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.total_data_in_mega_bytes );
      ( "progressInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.progress_in_mega_bytes );
      ( "snapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name );
      ( "workgroupName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name );
      ( "namespaceName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name );
      ( "requestTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.request_time );
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("status", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status);
      ( "tableRestoreRequestId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.table_restore_request_id );
    ]

let table_restore_status_list_to_yojson tree = list_to_yojson table_restore_status_to_yojson tree
let status_to_yojson = string_to_yojson
let source_arn_to_yojson = string_to_yojson
let snapshot_list_to_yojson tree = list_to_yojson snapshot_to_yojson tree

let snapshot_copy_configurations_to_yojson tree =
  list_to_yojson snapshot_copy_configuration_to_yojson tree

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let scheduled_action_association_to_yojson (x : scheduled_action_association) =
  assoc_to_yojson
    [
      ( "scheduledActionName",
        option_to_yojson scheduled_action_name_to_yojson x.scheduled_action_name );
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
    ]

let scheduled_actions_list_to_yojson tree =
  list_to_yojson scheduled_action_association_to_yojson tree

let restore_table_from_snapshot_response_to_yojson (x : restore_table_from_snapshot_response) =
  assoc_to_yojson
    [
      ("tableRestoreStatus", option_to_yojson table_restore_status_to_yojson x.table_restore_status);
    ]

let restore_table_from_snapshot_request_to_yojson (x : restore_table_from_snapshot_request) =
  assoc_to_yojson
    [
      ( "activateCaseSensitiveIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.activate_case_sensitive_identifier );
      ( "newTableName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.new_table_name) );
      ( "targetSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_schema_name );
      ( "targetDatabaseName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_database_name );
      ( "sourceTableName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_table_name) );
      ( "sourceSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.source_schema_name );
      ( "sourceDatabaseName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_database_name) );
      ( "snapshotName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name) );
      ( "workgroupName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name) );
      ( "namespaceName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name) );
    ]

let restore_table_from_recovery_point_response_to_yojson
    (x : restore_table_from_recovery_point_response) =
  assoc_to_yojson
    [
      ("tableRestoreStatus", option_to_yojson table_restore_status_to_yojson x.table_restore_status);
    ]

let restore_table_from_recovery_point_request_to_yojson
    (x : restore_table_from_recovery_point_request) =
  assoc_to_yojson
    [
      ( "activateCaseSensitiveIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.activate_case_sensitive_identifier );
      ( "newTableName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.new_table_name) );
      ( "targetSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_schema_name );
      ( "targetDatabaseName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_database_name );
      ( "sourceTableName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_table_name) );
      ( "sourceSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.source_schema_name );
      ( "sourceDatabaseName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_database_name) );
      ( "recoveryPointId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id) );
      ( "workgroupName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name) );
      ( "namespaceName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name) );
    ]

let restore_from_snapshot_response_to_yojson (x : restore_from_snapshot_response) =
  assoc_to_yojson
    [
      ("namespace", option_to_yojson namespace_to_yojson x.namespace);
      ( "ownerAccount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.owner_account );
      ( "snapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name );
    ]

let restore_from_snapshot_request_to_yojson (x : restore_from_snapshot_request) =
  assoc_to_yojson
    [
      ( "adminPasswordSecretKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.admin_password_secret_kms_key_id );
      ( "manageAdminPassword",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.manage_admin_password );
      ( "ownerAccount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.owner_account );
      ( "snapshotArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_arn );
      ( "snapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name );
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
    ]

let restore_from_recovery_point_response_to_yojson (x : restore_from_recovery_point_response) =
  assoc_to_yojson
    [
      ("namespace", option_to_yojson namespace_to_yojson x.namespace);
      ( "recoveryPointId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id
      );
    ]

let restore_from_recovery_point_request_to_yojson (x : restore_from_recovery_point_request) =
  assoc_to_yojson
    [
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ( "recoveryPointId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id) );
    ]

let resource_policy_to_yojson (x : resource_policy) =
  assoc_to_yojson
    [
      ("policy", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.policy);
      ( "resourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn );
    ]

let reservation_id_to_yojson = string_to_yojson
let reservation_arn_to_yojson = string_to_yojson
let capacity_to_yojson = int_to_yojson
let offering_id_to_yojson = string_to_yojson
let duration_to_yojson = int_to_yojson
let charge_to_yojson = double_to_yojson
let currency_code_to_yojson = string_to_yojson

let offering_type_to_yojson (x : offering_type) =
  match x with ALL_UPFRONT -> `String "ALL_UPFRONT" | NO_UPFRONT -> `String "NO_UPFRONT"

let reservation_offering_to_yojson (x : reservation_offering) =
  assoc_to_yojson
    [
      ("offeringType", option_to_yojson offering_type_to_yojson x.offering_type);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("hourlyCharge", option_to_yojson charge_to_yojson x.hourly_charge);
      ("upfrontCharge", option_to_yojson charge_to_yojson x.upfront_charge);
      ("duration", option_to_yojson duration_to_yojson x.duration);
      ("offeringId", option_to_yojson offering_id_to_yojson x.offering_id);
    ]

let reservation_to_yojson (x : reservation) =
  assoc_to_yojson
    [
      ("status", option_to_yojson status_to_yojson x.status);
      ("offering", option_to_yojson reservation_offering_to_yojson x.offering);
      ("capacity", option_to_yojson capacity_to_yojson x.capacity);
      ( "endDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.end_date );
      ( "startDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.start_date );
      ("reservationArn", option_to_yojson reservation_arn_to_yojson x.reservation_arn);
      ("reservationId", option_to_yojson reservation_id_to_yojson x.reservation_id);
    ]

let reservations_list_to_yojson tree = list_to_yojson reservation_to_yojson tree
let reservation_offerings_list_to_yojson tree = list_to_yojson reservation_offering_to_yojson tree

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [ ("resourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy) ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("policy", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.policy));
      ("resourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
    ]

let invalid_pagination_exception_to_yojson (x : invalid_pagination_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let pagination_token_to_yojson = string_to_yojson

let list_tracks_response_to_yojson (x : list_tracks_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("tracks", option_to_yojson track_list_to_yojson x.tracks);
    ]

let list_tracks_request_to_yojson (x : list_tracks_request) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let association_to_yojson (x : association) =
  assoc_to_yojson
    [
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
      ( "customDomainCertificateExpiryTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.custom_domain_certificate_expiry_time );
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
    ]

let association_list_to_yojson tree = list_to_yojson association_to_yojson tree

let list_custom_domain_associations_response_to_yojson
    (x : list_custom_domain_associations_response) =
  assoc_to_yojson
    [
      ("associations", option_to_yojson association_list_to_yojson x.associations);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_custom_domain_associations_request_to_yojson (x : list_custom_domain_associations_request)
    =
  assoc_to_yojson
    [
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let get_track_response_to_yojson (x : get_track_response) =
  assoc_to_yojson [ ("track", option_to_yojson serverless_track_to_yojson x.track) ]

let get_track_request_to_yojson (x : get_track_request) =
  assoc_to_yojson [ ("trackName", Some (track_name_to_yojson x.track_name)) ]

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson
    [ ("resourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy) ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
    ]

let get_identity_center_auth_token_response_to_yojson (x : get_identity_center_auth_token_response)
    =
  assoc_to_yojson
    [
      ( "expirationTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.expiration_time );
      ("token", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.token);
    ]

let get_identity_center_auth_token_request_to_yojson (x : get_identity_center_auth_token_request) =
  assoc_to_yojson [ ("workgroupNames", Some (workgroup_name_list_to_yojson x.workgroup_names)) ]

let get_custom_domain_association_response_to_yojson (x : get_custom_domain_association_response) =
  assoc_to_yojson
    [
      ( "customDomainCertificateExpiryTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.custom_domain_certificate_expiry_time );
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
    ]

let get_custom_domain_association_request_to_yojson (x : get_custom_domain_association_request) =
  assoc_to_yojson
    [
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
      ("customDomainName", Some (custom_domain_name_to_yojson x.custom_domain_name));
    ]

let get_credentials_response_to_yojson (x : get_credentials_response) =
  assoc_to_yojson
    [
      ( "nextRefreshTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.next_refresh_time );
      ( "expiration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expiration );
      ("dbPassword", option_to_yojson db_password_to_yojson x.db_password);
      ("dbUser", option_to_yojson db_user_to_yojson x.db_user);
    ]

let db_name_to_yojson = string_to_yojson

let get_credentials_request_to_yojson (x : get_credentials_request) =
  assoc_to_yojson
    [
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ( "durationSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.duration_seconds
      );
      ("dbName", option_to_yojson db_name_to_yojson x.db_name);
    ]

let delete_resource_policy_response_to_yojson = unit_to_yojson

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
    ]

let delete_custom_domain_association_response_to_yojson = unit_to_yojson

let delete_custom_domain_association_request_to_yojson
    (x : delete_custom_domain_association_request) =
  assoc_to_yojson
    [
      ("customDomainName", Some (custom_domain_name_to_yojson x.custom_domain_name));
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
    ]

let create_custom_domain_association_response_to_yojson
    (x : create_custom_domain_association_response) =
  assoc_to_yojson
    [
      ( "customDomainCertificateExpiryTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.custom_domain_certificate_expiry_time );
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
    ]

let create_custom_domain_association_request_to_yojson
    (x : create_custom_domain_association_request) =
  assoc_to_yojson
    [
      ( "customDomainCertificateArn",
        Some (custom_domain_certificate_arn_string_to_yojson x.custom_domain_certificate_arn) );
      ("customDomainName", Some (custom_domain_name_to_yojson x.custom_domain_name));
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
    ]

let redshift_idc_application_arn_to_yojson = string_to_yojson

let recovery_point_to_yojson (x : recovery_point) =
  assoc_to_yojson
    [
      ( "namespaceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_arn );
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ( "totalSizeInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.total_size_in_mega_bytes );
      ( "recoveryPointCreateTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.recovery_point_create_time );
      ( "recoveryPointId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id
      );
    ]

let recovery_point_list_to_yojson tree = list_to_yojson recovery_point_to_yojson tree
let owner_account_to_yojson = string_to_yojson
let namespace_list_to_yojson tree = list_to_yojson namespace_to_yojson tree
let managed_workgroup_name_to_yojson = string_to_yojson

let managed_workgroup_status_to_yojson (x : managed_workgroup_status) =
  match x with
  | NOT_AVAILABLE -> `String "NOT_AVAILABLE"
  | AVAILABLE -> `String "AVAILABLE"
  | MODIFYING -> `String "MODIFYING"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"

let managed_workgroup_list_item_to_yojson (x : managed_workgroup_list_item) =
  assoc_to_yojson
    [
      ( "creationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.creation_date );
      ("status", option_to_yojson managed_workgroup_status_to_yojson x.status);
      ("sourceArn", option_to_yojson source_arn_to_yojson x.source_arn);
      ( "managedWorkgroupId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.managed_workgroup_id );
      ( "managedWorkgroupName",
        option_to_yojson managed_workgroup_name_to_yojson x.managed_workgroup_name );
    ]

let managed_workgroups_to_yojson tree = list_to_yojson managed_workgroup_list_item_to_yojson tree

let list_workgroups_response_to_yojson (x : list_workgroups_response) =
  assoc_to_yojson
    [
      ("workgroups", Some (workgroup_list_to_yojson x.workgroups));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_workgroups_request_to_yojson (x : list_workgroups_request) =
  assoc_to_yojson
    [
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_usage_limits_response_to_yojson (x : list_usage_limits_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("usageLimits", option_to_yojson usage_limits_to_yojson x.usage_limits);
    ]

let list_usage_limits_request_to_yojson (x : list_usage_limits_request) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("usageType", option_to_yojson usage_limit_usage_type_to_yojson x.usage_type);
      ( "resourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn );
    ]

let list_table_restore_status_response_to_yojson (x : list_table_restore_status_response) =
  assoc_to_yojson
    [
      ( "tableRestoreStatuses",
        option_to_yojson table_restore_status_list_to_yojson x.table_restore_statuses );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_table_restore_status_request_to_yojson (x : list_table_restore_status_request) =
  assoc_to_yojson
    [
      ( "workgroupName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name );
      ( "namespaceName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_snapshots_response_to_yojson (x : list_snapshots_response) =
  assoc_to_yojson
    [
      ("snapshots", option_to_yojson snapshot_list_to_yojson x.snapshots);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_snapshots_request_to_yojson (x : list_snapshots_request) =
  assoc_to_yojson
    [
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ( "ownerAccount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.owner_account );
      ( "namespaceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_arn );
      ( "namespaceName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_snapshot_copy_configurations_response_to_yojson
    (x : list_snapshot_copy_configurations_response) =
  assoc_to_yojson
    [
      ( "snapshotCopyConfigurations",
        Some (snapshot_copy_configurations_to_yojson x.snapshot_copy_configurations) );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_snapshot_copy_configurations_request_to_yojson
    (x : list_snapshot_copy_configurations_request) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
    ]

let list_scheduled_actions_response_to_yojson (x : list_scheduled_actions_response) =
  assoc_to_yojson
    [
      ("scheduledActions", option_to_yojson scheduled_actions_list_to_yojson x.scheduled_actions);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_scheduled_actions_request_to_yojson (x : list_scheduled_actions_request) =
  assoc_to_yojson
    [
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_reservations_response_to_yojson (x : list_reservations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("reservationsList", Some (reservations_list_to_yojson x.reservations_list));
    ]

let list_reservations_request_to_yojson (x : list_reservations_request) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_reservation_offerings_response_to_yojson (x : list_reservation_offerings_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "reservationOfferingsList",
        Some (reservation_offerings_list_to_yojson x.reservation_offerings_list) );
    ]

let list_reservation_offerings_request_to_yojson (x : list_reservation_offerings_request) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_recovery_points_response_to_yojson (x : list_recovery_points_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("recoveryPoints", option_to_yojson recovery_point_list_to_yojson x.recovery_points);
    ]

let list_recovery_points_request_to_yojson (x : list_recovery_points_request) =
  assoc_to_yojson
    [
      ( "namespaceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_arn );
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_namespaces_response_to_yojson (x : list_namespaces_response) =
  assoc_to_yojson
    [
      ("namespaces", Some (namespace_list_to_yojson x.namespaces));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_namespaces_request_to_yojson (x : list_namespaces_request) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_managed_workgroups_response_to_yojson (x : list_managed_workgroups_response) =
  assoc_to_yojson
    [
      ("managedWorkgroups", option_to_yojson managed_workgroups_to_yojson x.managed_workgroups);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_managed_workgroups_request_to_yojson (x : list_managed_workgroups_request) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("sourceArn", option_to_yojson source_arn_to_yojson x.source_arn);
    ]

let endpoint_access_list_to_yojson tree = list_to_yojson endpoint_access_to_yojson tree

let list_endpoint_access_response_to_yojson (x : list_endpoint_access_response) =
  assoc_to_yojson
    [
      ("endpoints", Some (endpoint_access_list_to_yojson x.endpoints));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_endpoint_access_request_to_yojson (x : list_endpoint_access_request) =
  assoc_to_yojson
    [
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ("vpcId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vpc_id);
      ( "workgroupName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let get_workgroup_response_to_yojson (x : get_workgroup_response) =
  assoc_to_yojson [ ("workgroup", Some (workgroup_to_yojson x.workgroup)) ]

let get_workgroup_request_to_yojson (x : get_workgroup_request) =
  assoc_to_yojson [ ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name)) ]

let get_usage_limit_response_to_yojson (x : get_usage_limit_response) =
  assoc_to_yojson [ ("usageLimit", option_to_yojson usage_limit_to_yojson x.usage_limit) ]

let get_usage_limit_request_to_yojson (x : get_usage_limit_request) =
  assoc_to_yojson
    [
      ( "usageLimitId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_limit_id) );
    ]

let get_table_restore_status_response_to_yojson (x : get_table_restore_status_response) =
  assoc_to_yojson
    [
      ("tableRestoreStatus", option_to_yojson table_restore_status_to_yojson x.table_restore_status);
    ]

let get_table_restore_status_request_to_yojson (x : get_table_restore_status_request) =
  assoc_to_yojson
    [
      ( "tableRestoreRequestId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.table_restore_request_id) );
    ]

let get_snapshot_response_to_yojson (x : get_snapshot_response) =
  assoc_to_yojson [ ("snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let get_snapshot_request_to_yojson (x : get_snapshot_request) =
  assoc_to_yojson
    [
      ( "snapshotArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_arn );
      ( "ownerAccount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.owner_account );
      ( "snapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name );
    ]

let get_scheduled_action_response_to_yojson (x : get_scheduled_action_response) =
  assoc_to_yojson
    [ ("scheduledAction", option_to_yojson scheduled_action_response_to_yojson x.scheduled_action) ]

let get_scheduled_action_request_to_yojson (x : get_scheduled_action_request) =
  assoc_to_yojson
    [ ("scheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name)) ]

let get_reservation_response_to_yojson (x : get_reservation_response) =
  assoc_to_yojson [ ("reservation", Some (reservation_to_yojson x.reservation)) ]

let get_reservation_request_to_yojson (x : get_reservation_request) =
  assoc_to_yojson [ ("reservationId", Some (reservation_id_to_yojson x.reservation_id)) ]

let get_reservation_offering_response_to_yojson (x : get_reservation_offering_response) =
  assoc_to_yojson
    [ ("reservationOffering", Some (reservation_offering_to_yojson x.reservation_offering)) ]

let get_reservation_offering_request_to_yojson (x : get_reservation_offering_request) =
  assoc_to_yojson [ ("offeringId", Some (offering_id_to_yojson x.offering_id)) ]

let get_recovery_point_response_to_yojson (x : get_recovery_point_response) =
  assoc_to_yojson [ ("recoveryPoint", option_to_yojson recovery_point_to_yojson x.recovery_point) ]

let get_recovery_point_request_to_yojson (x : get_recovery_point_request) =
  assoc_to_yojson
    [
      ( "recoveryPointId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id) );
    ]

let get_namespace_response_to_yojson (x : get_namespace_response) =
  assoc_to_yojson [ ("namespace", Some (namespace_to_yojson x.namespace)) ]

let get_namespace_request_to_yojson (x : get_namespace_request) =
  assoc_to_yojson [ ("namespaceName", Some (namespace_name_to_yojson x.namespace_name)) ]

let get_endpoint_access_response_to_yojson (x : get_endpoint_access_response) =
  assoc_to_yojson [ ("endpoint", option_to_yojson endpoint_access_to_yojson x.endpoint) ]

let get_endpoint_access_request_to_yojson (x : get_endpoint_access_request) =
  assoc_to_yojson
    [
      ( "endpointName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_name) );
    ]

let delete_workgroup_response_to_yojson (x : delete_workgroup_response) =
  assoc_to_yojson [ ("workgroup", Some (workgroup_to_yojson x.workgroup)) ]

let delete_workgroup_request_to_yojson (x : delete_workgroup_request) =
  assoc_to_yojson [ ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name)) ]

let delete_usage_limit_response_to_yojson (x : delete_usage_limit_response) =
  assoc_to_yojson [ ("usageLimit", option_to_yojson usage_limit_to_yojson x.usage_limit) ]

let delete_usage_limit_request_to_yojson (x : delete_usage_limit_request) =
  assoc_to_yojson
    [
      ( "usageLimitId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_limit_id) );
    ]

let delete_snapshot_response_to_yojson (x : delete_snapshot_response) =
  assoc_to_yojson [ ("snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let delete_snapshot_request_to_yojson (x : delete_snapshot_request) =
  assoc_to_yojson
    [
      ( "snapshotName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name) );
    ]

let delete_snapshot_copy_configuration_response_to_yojson
    (x : delete_snapshot_copy_configuration_response) =
  assoc_to_yojson
    [
      ( "snapshotCopyConfiguration",
        Some (snapshot_copy_configuration_to_yojson x.snapshot_copy_configuration) );
    ]

let delete_snapshot_copy_configuration_request_to_yojson
    (x : delete_snapshot_copy_configuration_request) =
  assoc_to_yojson
    [
      ( "snapshotCopyConfigurationId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_copy_configuration_id)
      );
    ]

let delete_scheduled_action_response_to_yojson (x : delete_scheduled_action_response) =
  assoc_to_yojson
    [ ("scheduledAction", option_to_yojson scheduled_action_response_to_yojson x.scheduled_action) ]

let delete_scheduled_action_request_to_yojson (x : delete_scheduled_action_request) =
  assoc_to_yojson
    [ ("scheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name)) ]

let delete_namespace_response_to_yojson (x : delete_namespace_response) =
  assoc_to_yojson [ ("namespace", Some (namespace_to_yojson x.namespace)) ]

let delete_namespace_request_to_yojson (x : delete_namespace_request) =
  assoc_to_yojson
    [
      ( "finalSnapshotRetentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.final_snapshot_retention_period );
      ( "finalSnapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.final_snapshot_name );
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
    ]

let delete_endpoint_access_response_to_yojson (x : delete_endpoint_access_response) =
  assoc_to_yojson [ ("endpoint", option_to_yojson endpoint_access_to_yojson x.endpoint) ]

let delete_endpoint_access_request_to_yojson (x : delete_endpoint_access_request) =
  assoc_to_yojson
    [
      ( "endpointName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_name) );
    ]

let create_workgroup_response_to_yojson (x : create_workgroup_response) =
  assoc_to_yojson [ ("workgroup", option_to_yojson workgroup_to_yojson x.workgroup) ]

let create_workgroup_request_to_yojson (x : create_workgroup_request) =
  assoc_to_yojson
    [
      ( "extraComputeForAutomaticOptimization",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.extra_compute_for_automatic_optimization );
      ("trackName", option_to_yojson track_name_to_yojson x.track_name);
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ( "pricePerformanceTarget",
        option_to_yojson performance_target_to_yojson x.price_performance_target );
      ( "maxCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_capacity );
      ("port", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.port);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("securityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
      ("configParameters", option_to_yojson config_parameter_list_to_yojson x.config_parameters);
      ( "enhancedVpcRouting",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enhanced_vpc_routing );
      ( "baseCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.base_capacity );
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
    ]

let create_usage_limit_response_to_yojson (x : create_usage_limit_response) =
  assoc_to_yojson [ ("usageLimit", option_to_yojson usage_limit_to_yojson x.usage_limit) ]

let create_usage_limit_request_to_yojson (x : create_usage_limit_request) =
  assoc_to_yojson
    [
      ("breachAction", option_to_yojson usage_limit_breach_action_to_yojson x.breach_action);
      ("period", option_to_yojson usage_limit_period_to_yojson x.period);
      ("amount", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.amount));
      ("usageType", Some (usage_limit_usage_type_to_yojson x.usage_type));
      ("resourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
    ]

let create_snapshot_response_to_yojson (x : create_snapshot_response) =
  assoc_to_yojson [ ("snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let create_snapshot_request_to_yojson (x : create_snapshot_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "retentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.retention_period
      );
      ( "snapshotName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name) );
      ( "namespaceName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name) );
    ]

let create_snapshot_copy_configuration_response_to_yojson
    (x : create_snapshot_copy_configuration_response) =
  assoc_to_yojson
    [
      ( "snapshotCopyConfiguration",
        Some (snapshot_copy_configuration_to_yojson x.snapshot_copy_configuration) );
    ]

let create_snapshot_copy_configuration_request_to_yojson
    (x : create_snapshot_copy_configuration_request) =
  assoc_to_yojson
    [
      ("destinationKmsKeyId", option_to_yojson kms_key_id_to_yojson x.destination_kms_key_id);
      ( "snapshotRetentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshot_retention_period );
      ( "destinationRegion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.destination_region) );
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
    ]

let create_scheduled_action_response_to_yojson (x : create_scheduled_action_response) =
  assoc_to_yojson
    [ ("scheduledAction", option_to_yojson scheduled_action_response_to_yojson x.scheduled_action) ]

let create_scheduled_action_request_to_yojson (x : create_scheduled_action_request) =
  assoc_to_yojson
    [
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ( "scheduledActionDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_action_description );
      ( "enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ("roleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("schedule", Some (schedule_to_yojson x.schedule));
      ("targetAction", Some (target_action_to_yojson x.target_action));
      ("scheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name));
    ]

let create_reservation_response_to_yojson (x : create_reservation_response) =
  assoc_to_yojson [ ("reservation", option_to_yojson reservation_to_yojson x.reservation) ]

let create_reservation_request_to_yojson (x : create_reservation_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("offeringId", Some (offering_id_to_yojson x.offering_id));
      ("capacity", Some (capacity_to_yojson x.capacity));
    ]

let create_namespace_response_to_yojson (x : create_namespace_response) =
  assoc_to_yojson [ ("namespace", option_to_yojson namespace_to_yojson x.namespace) ]

let create_namespace_request_to_yojson (x : create_namespace_request) =
  assoc_to_yojson
    [
      ( "redshiftIdcApplicationArn",
        option_to_yojson redshift_idc_application_arn_to_yojson x.redshift_idc_application_arn );
      ( "adminPasswordSecretKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.admin_password_secret_kms_key_id );
      ( "manageAdminPassword",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.manage_admin_password );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("logExports", option_to_yojson log_export_list_to_yojson x.log_exports);
      ("iamRoles", option_to_yojson iam_role_arn_list_to_yojson x.iam_roles);
      ( "defaultIamRoleArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_iam_role_arn );
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ("adminUserPassword", option_to_yojson db_password_to_yojson x.admin_user_password);
      ("adminUsername", option_to_yojson db_user_to_yojson x.admin_username);
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
    ]

let create_endpoint_access_response_to_yojson (x : create_endpoint_access_response) =
  assoc_to_yojson [ ("endpoint", option_to_yojson endpoint_access_to_yojson x.endpoint) ]

let create_endpoint_access_request_to_yojson (x : create_endpoint_access_request) =
  assoc_to_yojson
    [
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ( "workgroupName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name) );
      ("subnetIds", Some (subnet_id_list_to_yojson x.subnet_ids));
      ( "endpointName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_name) );
    ]

let convert_recovery_point_to_snapshot_response_to_yojson
    (x : convert_recovery_point_to_snapshot_response) =
  assoc_to_yojson [ ("snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let convert_recovery_point_to_snapshot_request_to_yojson
    (x : convert_recovery_point_to_snapshot_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "retentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.retention_period
      );
      ( "snapshotName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name) );
      ( "recoveryPointId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id) );
    ]
