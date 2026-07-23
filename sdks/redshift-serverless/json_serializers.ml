open Smaws_Lib.Json.SerializeHelpers
open Types

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.code);
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let account_id_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let amazon_resource_name_to_yojson = string_to_yojson
let workgroup_name_to_yojson = string_to_yojson
let custom_domain_name_to_yojson = string_to_yojson
let custom_domain_certificate_arn_string_to_yojson = string_to_yojson

let association_to_yojson (x : association) =
  assoc_to_yojson
    [
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
      ( "customDomainCertificateExpiryTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.custom_domain_certificate_expiry_time );
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
    ]

let association_list_to_yojson tree = list_to_yojson association_to_yojson tree
let capacity_to_yojson = int_to_yojson
let catalog_name_string_to_yojson = string_to_yojson
let charge_to_yojson = double_to_yojson
let parameter_value_to_yojson = string_to_yojson
let parameter_key_to_yojson = string_to_yojson

let config_parameter_to_yojson (x : config_parameter) =
  assoc_to_yojson
    [
      ("parameterKey", option_to_yojson parameter_key_to_yojson x.parameter_key);
      ("parameterValue", option_to_yojson parameter_value_to_yojson x.parameter_value);
    ]

let config_parameter_list_to_yojson tree = list_to_yojson config_parameter_to_yojson tree

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let kms_key_id_to_yojson = string_to_yojson

let snapshot_status_to_yojson (x : snapshot_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | CREATING -> `String "CREATING"
  | DELETED -> `String "DELETED"
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"
  | COPYING -> `String "COPYING"

let snapshot_to_yojson (x : snapshot) =
  assoc_to_yojson
    [
      ( "namespaceName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name );
      ( "namespaceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_arn );
      ( "snapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name );
      ( "snapshotCreateTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.snapshot_create_time );
      ( "adminUsername",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.admin_username );
      ("status", option_to_yojson snapshot_status_to_yojson x.status);
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "ownerAccount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.owner_account );
      ( "totalBackupSizeInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.total_backup_size_in_mega_bytes );
      ( "actualIncrementalBackupSizeInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.actual_incremental_backup_size_in_mega_bytes );
      ( "backupProgressInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.backup_progress_in_mega_bytes );
      ( "currentBackupRateInMegaBytesPerSecond",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.current_backup_rate_in_mega_bytes_per_second );
      ( "estimatedSecondsToCompletion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.estimated_seconds_to_completion );
      ( "elapsedTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.elapsed_time_in_seconds );
      ( "snapshotRetentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshot_retention_period );
      ( "snapshotRemainingDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshot_remaining_days );
      ( "snapshotRetentionStartTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.snapshot_retention_start_time );
      ( "snapshotArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_arn );
      ( "accountsWithRestoreAccess",
        option_to_yojson account_id_list_to_yojson x.accounts_with_restore_access );
      ( "accountsWithProvisionedRestoreAccess",
        option_to_yojson account_id_list_to_yojson x.accounts_with_provisioned_restore_access );
      ( "adminPasswordSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.admin_password_secret_arn );
      ( "adminPasswordSecretKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.admin_password_secret_kms_key_id );
    ]

let convert_recovery_point_to_snapshot_response_to_yojson
    (x : convert_recovery_point_to_snapshot_response) =
  assoc_to_yojson [ ("snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let convert_recovery_point_to_snapshot_request_to_yojson
    (x : convert_recovery_point_to_snapshot_request) =
  assoc_to_yojson
    [
      ( "recoveryPointId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id) );
      ( "snapshotName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name) );
      ( "retentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.retention_period
      );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.code);
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let create_custom_domain_association_response_to_yojson
    (x : create_custom_domain_association_response) =
  assoc_to_yojson
    [
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
      ( "customDomainCertificateExpiryTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.custom_domain_certificate_expiry_time );
    ]

let create_custom_domain_association_request_to_yojson
    (x : create_custom_domain_association_request) =
  assoc_to_yojson
    [
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
      ("customDomainName", Some (custom_domain_name_to_yojson x.custom_domain_name));
      ( "customDomainCertificateArn",
        Some (custom_domain_certificate_arn_string_to_yojson x.custom_domain_certificate_arn) );
    ]

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ( "networkInterfaceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.network_interface_id );
      ( "subnetId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.subnet_id );
      ( "privateIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_ip_address );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "ipv6Address",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ipv6_address );
    ]

let network_interface_list_to_yojson tree = list_to_yojson network_interface_to_yojson tree

let vpc_endpoint_to_yojson (x : vpc_endpoint) =
  assoc_to_yojson
    [
      ( "vpcEndpointId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vpc_endpoint_id
      );
      ("vpcId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vpc_id);
      ("networkInterfaces", option_to_yojson network_interface_list_to_yojson x.network_interfaces);
    ]

let vpc_security_group_id_to_yojson = string_to_yojson

let vpc_security_group_membership_to_yojson (x : vpc_security_group_membership) =
  assoc_to_yojson
    [
      ( "vpcSecurityGroupId",
        option_to_yojson vpc_security_group_id_to_yojson x.vpc_security_group_id );
      ("status", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status);
    ]

let vpc_security_group_membership_list_to_yojson tree =
  list_to_yojson vpc_security_group_membership_to_yojson tree

let subnet_id_to_yojson = string_to_yojson
let subnet_id_list_to_yojson tree = list_to_yojson subnet_id_to_yojson tree

let endpoint_access_to_yojson (x : endpoint_access) =
  assoc_to_yojson
    [
      ( "endpointName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_name );
      ( "endpointStatus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_status
      );
      ( "workgroupName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name );
      ( "endpointCreateTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.endpoint_create_time );
      ("port", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.port);
      ("address", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.address);
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ( "vpcSecurityGroups",
        option_to_yojson vpc_security_group_membership_list_to_yojson x.vpc_security_groups );
      ("vpcEndpoint", option_to_yojson vpc_endpoint_to_yojson x.vpc_endpoint);
      ( "endpointArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_arn );
    ]

let create_endpoint_access_response_to_yojson (x : create_endpoint_access_response) =
  assoc_to_yojson [ ("endpoint", option_to_yojson endpoint_access_to_yojson x.endpoint) ]

let owner_account_to_yojson = string_to_yojson
let vpc_security_group_id_list_to_yojson tree = list_to_yojson vpc_security_group_id_to_yojson tree

let create_endpoint_access_request_to_yojson (x : create_endpoint_access_request) =
  assoc_to_yojson
    [
      ( "endpointName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_name) );
      ("subnetIds", Some (subnet_id_list_to_yojson x.subnet_ids));
      ( "workgroupName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name) );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
    ]

let namespace_status_to_yojson (x : namespace_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | MODIFYING -> `String "MODIFYING"
  | DELETING -> `String "DELETING"

let log_export_to_yojson (x : log_export) =
  match x with
  | USER_ACTIVITY_LOG -> `String "useractivitylog"
  | USER_LOG -> `String "userlog"
  | CONNECTION_LOG -> `String "connectionlog"

let log_export_list_to_yojson tree = list_to_yojson log_export_to_yojson tree
let iam_role_arn_to_yojson = string_to_yojson
let iam_role_arn_list_to_yojson tree = list_to_yojson iam_role_arn_to_yojson tree
let db_user_to_yojson = string_to_yojson
let namespace_name_to_yojson = string_to_yojson

let namespace_to_yojson (x : namespace) =
  assoc_to_yojson
    [
      ( "namespaceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_arn );
      ( "namespaceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_id );
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ("adminUsername", option_to_yojson db_user_to_yojson x.admin_username);
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ( "defaultIamRoleArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_iam_role_arn );
      ("iamRoles", option_to_yojson iam_role_arn_list_to_yojson x.iam_roles);
      ("logExports", option_to_yojson log_export_list_to_yojson x.log_exports);
      ("status", option_to_yojson namespace_status_to_yojson x.status);
      ( "creationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.creation_date );
      ( "adminPasswordSecretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.admin_password_secret_arn );
      ( "adminPasswordSecretKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.admin_password_secret_kms_key_id );
      ( "lakehouseRegistrationStatus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lakehouse_registration_status );
      ( "catalogArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.catalog_arn );
    ]

let create_namespace_response_to_yojson (x : create_namespace_response) =
  assoc_to_yojson [ ("namespace", option_to_yojson namespace_to_yojson x.namespace) ]

let redshift_idc_application_arn_to_yojson = string_to_yojson
let db_password_to_yojson = string_to_yojson

let create_namespace_request_to_yojson (x : create_namespace_request) =
  assoc_to_yojson
    [
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ("adminUsername", option_to_yojson db_user_to_yojson x.admin_username);
      ("adminUserPassword", option_to_yojson db_password_to_yojson x.admin_user_password);
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ( "defaultIamRoleArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_iam_role_arn );
      ("iamRoles", option_to_yojson iam_role_arn_list_to_yojson x.iam_roles);
      ("logExports", option_to_yojson log_export_list_to_yojson x.log_exports);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "manageAdminPassword",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.manage_admin_password );
      ( "adminPasswordSecretKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.admin_password_secret_kms_key_id );
      ( "redshiftIdcApplicationArn",
        option_to_yojson redshift_idc_application_arn_to_yojson x.redshift_idc_application_arn );
    ]

let status_to_yojson = string_to_yojson

let offering_type_to_yojson (x : offering_type) =
  match x with ALL_UPFRONT -> `String "ALL_UPFRONT" | NO_UPFRONT -> `String "NO_UPFRONT"

let currency_code_to_yojson = string_to_yojson
let duration_to_yojson = int_to_yojson
let offering_id_to_yojson = string_to_yojson

let reservation_offering_to_yojson (x : reservation_offering) =
  assoc_to_yojson
    [
      ("offeringId", option_to_yojson offering_id_to_yojson x.offering_id);
      ("duration", option_to_yojson duration_to_yojson x.duration);
      ("upfrontCharge", option_to_yojson charge_to_yojson x.upfront_charge);
      ("hourlyCharge", option_to_yojson charge_to_yojson x.hourly_charge);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("offeringType", option_to_yojson offering_type_to_yojson x.offering_type);
    ]

let reservation_arn_to_yojson = string_to_yojson
let reservation_id_to_yojson = string_to_yojson

let reservation_to_yojson (x : reservation) =
  assoc_to_yojson
    [
      ("reservationId", option_to_yojson reservation_id_to_yojson x.reservation_id);
      ("reservationArn", option_to_yojson reservation_arn_to_yojson x.reservation_arn);
      ( "startDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.start_date );
      ( "endDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.end_date );
      ("capacity", option_to_yojson capacity_to_yojson x.capacity);
      ("offering", option_to_yojson reservation_offering_to_yojson x.offering);
      ("status", option_to_yojson status_to_yojson x.status);
    ]

let create_reservation_response_to_yojson (x : create_reservation_response) =
  assoc_to_yojson [ ("reservation", option_to_yojson reservation_to_yojson x.reservation) ]

let create_reservation_request_to_yojson (x : create_reservation_request) =
  assoc_to_yojson
    [
      ("capacity", Some (capacity_to_yojson x.capacity));
      ("offeringId", Some (offering_id_to_yojson x.offering_id));
      ( "clientToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let snapshot_name_prefix_to_yojson = string_to_yojson

let create_snapshot_schedule_action_parameters_to_yojson
    (x : create_snapshot_schedule_action_parameters) =
  assoc_to_yojson
    [
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ("snapshotNamePrefix", Some (snapshot_name_prefix_to_yojson x.snapshot_name_prefix));
      ( "retentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.retention_period
      );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let target_action_to_yojson (x : target_action) =
  match x with
  | CreateSnapshot arg ->
      assoc_to_yojson
        [ ("createSnapshot", Some (create_snapshot_schedule_action_parameters_to_yojson arg)) ]

let state_to_yojson (x : state) =
  match x with ACTIVE -> `String "ACTIVE" | DISABLED -> `String "DISABLED"

let next_invocations_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson tree

let schedule_to_yojson (x : schedule) =
  match x with
  | At arg ->
      assoc_to_yojson
        [
          ("at", Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson arg));
        ]
  | Cron arg ->
      assoc_to_yojson
        [ ("cron", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]

let scheduled_action_name_to_yojson = string_to_yojson

let scheduled_action_response_to_yojson (x : scheduled_action_response) =
  assoc_to_yojson
    [
      ( "scheduledActionName",
        option_to_yojson scheduled_action_name_to_yojson x.scheduled_action_name );
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ( "scheduledActionDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_action_description );
      ("nextInvocations", option_to_yojson next_invocations_list_to_yojson x.next_invocations);
      ("roleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("state", option_to_yojson state_to_yojson x.state);
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ("targetAction", option_to_yojson target_action_to_yojson x.target_action);
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ( "scheduledActionUuid",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_action_uuid );
    ]

let create_scheduled_action_response_to_yojson (x : create_scheduled_action_response) =
  assoc_to_yojson
    [ ("scheduledAction", option_to_yojson scheduled_action_response_to_yojson x.scheduled_action) ]

let create_scheduled_action_request_to_yojson (x : create_scheduled_action_request) =
  assoc_to_yojson
    [
      ("scheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name));
      ("targetAction", Some (target_action_to_yojson x.target_action));
      ("schedule", Some (schedule_to_yojson x.schedule));
      ("roleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ( "enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
      ( "scheduledActionDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_action_description );
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
    ]

let create_snapshot_response_to_yojson (x : create_snapshot_response) =
  assoc_to_yojson [ ("snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let create_snapshot_request_to_yojson (x : create_snapshot_request) =
  assoc_to_yojson
    [
      ( "namespaceName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name) );
      ( "snapshotName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name) );
      ( "retentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.retention_period
      );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let snapshot_copy_configuration_to_yojson (x : snapshot_copy_configuration) =
  assoc_to_yojson
    [
      ( "snapshotCopyConfigurationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.snapshot_copy_configuration_id );
      ( "snapshotCopyConfigurationArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.snapshot_copy_configuration_arn );
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ( "destinationRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.destination_region );
      ( "snapshotRetentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshot_retention_period );
      ("destinationKmsKeyId", option_to_yojson kms_key_id_to_yojson x.destination_kms_key_id);
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
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ( "destinationRegion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.destination_region) );
      ( "snapshotRetentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshot_retention_period );
      ("destinationKmsKeyId", option_to_yojson kms_key_id_to_yojson x.destination_kms_key_id);
    ]

let usage_limit_breach_action_to_yojson (x : usage_limit_breach_action) =
  match x with
  | LOG -> `String "log"
  | EMIT_METRIC -> `String "emit-metric"
  | DEACTIVATE -> `String "deactivate"

let usage_limit_period_to_yojson (x : usage_limit_period) =
  match x with
  | DAILY -> `String "daily"
  | WEEKLY -> `String "weekly"
  | MONTHLY -> `String "monthly"

let usage_limit_usage_type_to_yojson (x : usage_limit_usage_type) =
  match x with
  | SERVERLESS_COMPUTE -> `String "serverless-compute"
  | CROSS_REGION_DATASHARING -> `String "cross-region-datasharing"

let usage_limit_to_yojson (x : usage_limit) =
  assoc_to_yojson
    [
      ( "usageLimitId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_limit_id );
      ( "usageLimitArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_limit_arn
      );
      ( "resourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn );
      ("usageType", option_to_yojson usage_limit_usage_type_to_yojson x.usage_type);
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.amount);
      ("period", option_to_yojson usage_limit_period_to_yojson x.period);
      ("breachAction", option_to_yojson usage_limit_breach_action_to_yojson x.breach_action);
    ]

let create_usage_limit_response_to_yojson (x : create_usage_limit_response) =
  assoc_to_yojson [ ("usageLimit", option_to_yojson usage_limit_to_yojson x.usage_limit) ]

let create_usage_limit_request_to_yojson (x : create_usage_limit_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
      ("usageType", Some (usage_limit_usage_type_to_yojson x.usage_type));
      ("amount", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.amount));
      ("period", option_to_yojson usage_limit_period_to_yojson x.period);
      ("breachAction", option_to_yojson usage_limit_breach_action_to_yojson x.breach_action);
    ]

let ipv6_cidr_block_not_found_exception_to_yojson (x : ipv6_cidr_block_not_found_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let insufficient_capacity_exception_to_yojson (x : insufficient_capacity_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let track_name_to_yojson = string_to_yojson

let performance_target_status_to_yojson (x : performance_target_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let performance_target_to_yojson (x : performance_target) =
  assoc_to_yojson
    [
      ("status", option_to_yojson performance_target_status_to_yojson x.status);
      ("level", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.level);
    ]

let ip_address_type_to_yojson = string_to_yojson

let vpc_ids_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let vpc_endpoint_list_to_yojson tree = list_to_yojson vpc_endpoint_to_yojson tree

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("address", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.address);
      ("port", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.port);
      ("vpcEndpoints", option_to_yojson vpc_endpoint_list_to_yojson x.vpc_endpoints);
    ]

let workgroup_status_to_yojson (x : workgroup_status) =
  match x with
  | CREATING -> `String "CREATING"
  | AVAILABLE -> `String "AVAILABLE"
  | MODIFYING -> `String "MODIFYING"
  | DELETING -> `String "DELETING"

let security_group_id_to_yojson = string_to_yojson
let security_group_id_list_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let workgroup_to_yojson (x : workgroup) =
  assoc_to_yojson
    [
      ( "workgroupId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_id );
      ( "workgroupArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_arn );
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ( "namespaceName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name );
      ( "baseCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.base_capacity );
      ( "enhancedVpcRouting",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enhanced_vpc_routing );
      ("configParameters", option_to_yojson config_parameter_list_to_yojson x.config_parameters);
      ("securityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("status", option_to_yojson workgroup_status_to_yojson x.status);
      ("endpoint", option_to_yojson endpoint_to_yojson x.endpoint);
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ( "creationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.creation_date );
      ("port", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.port);
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
      ( "customDomainCertificateExpiryTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.custom_domain_certificate_expiry_time );
      ( "workgroupVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_version
      );
      ( "patchVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.patch_version );
      ( "maxCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_capacity );
      ("crossAccountVpcs", option_to_yojson vpc_ids_to_yojson x.cross_account_vpcs);
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ( "pricePerformanceTarget",
        option_to_yojson performance_target_to_yojson x.price_performance_target );
      ("trackName", option_to_yojson track_name_to_yojson x.track_name);
      ("pendingTrackName", option_to_yojson track_name_to_yojson x.pending_track_name);
      ( "extraComputeForAutomaticOptimization",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.extra_compute_for_automatic_optimization );
    ]

let create_workgroup_response_to_yojson (x : create_workgroup_response) =
  assoc_to_yojson [ ("workgroup", option_to_yojson workgroup_to_yojson x.workgroup) ]

let create_workgroup_request_to_yojson (x : create_workgroup_request) =
  assoc_to_yojson
    [
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ( "baseCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.base_capacity );
      ( "enhancedVpcRouting",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enhanced_vpc_routing );
      ("configParameters", option_to_yojson config_parameter_list_to_yojson x.config_parameters);
      ("securityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("port", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.port);
      ( "maxCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_capacity );
      ( "pricePerformanceTarget",
        option_to_yojson performance_target_to_yojson x.price_performance_target );
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("trackName", option_to_yojson track_name_to_yojson x.track_name);
      ( "extraComputeForAutomaticOptimization",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.extra_compute_for_automatic_optimization );
    ]

let db_name_to_yojson = string_to_yojson
let delete_custom_domain_association_response_to_yojson = unit_to_yojson

let delete_custom_domain_association_request_to_yojson
    (x : delete_custom_domain_association_request) =
  assoc_to_yojson
    [
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
      ("customDomainName", Some (custom_domain_name_to_yojson x.custom_domain_name));
    ]

let delete_endpoint_access_response_to_yojson (x : delete_endpoint_access_response) =
  assoc_to_yojson [ ("endpoint", option_to_yojson endpoint_access_to_yojson x.endpoint) ]

let delete_endpoint_access_request_to_yojson (x : delete_endpoint_access_request) =
  assoc_to_yojson
    [
      ( "endpointName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_name) );
    ]

let delete_namespace_response_to_yojson (x : delete_namespace_response) =
  assoc_to_yojson [ ("namespace", Some (namespace_to_yojson x.namespace)) ]

let delete_namespace_request_to_yojson (x : delete_namespace_request) =
  assoc_to_yojson
    [
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ( "finalSnapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.final_snapshot_name );
      ( "finalSnapshotRetentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.final_snapshot_retention_period );
    ]

let delete_resource_policy_response_to_yojson = unit_to_yojson

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
    ]

let delete_scheduled_action_response_to_yojson (x : delete_scheduled_action_response) =
  assoc_to_yojson
    [ ("scheduledAction", option_to_yojson scheduled_action_response_to_yojson x.scheduled_action) ]

let delete_scheduled_action_request_to_yojson (x : delete_scheduled_action_request) =
  assoc_to_yojson
    [ ("scheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name)) ]

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

let delete_usage_limit_response_to_yojson (x : delete_usage_limit_response) =
  assoc_to_yojson [ ("usageLimit", option_to_yojson usage_limit_to_yojson x.usage_limit) ]

let delete_usage_limit_request_to_yojson (x : delete_usage_limit_request) =
  assoc_to_yojson
    [
      ( "usageLimitId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_limit_id) );
    ]

let delete_workgroup_response_to_yojson (x : delete_workgroup_response) =
  assoc_to_yojson [ ("workgroup", Some (workgroup_to_yojson x.workgroup)) ]

let delete_workgroup_request_to_yojson (x : delete_workgroup_request) =
  assoc_to_yojson [ ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name)) ]

let dry_run_exception_to_yojson (x : dry_run_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let endpoint_access_list_to_yojson tree = list_to_yojson endpoint_access_to_yojson tree

let get_credentials_response_to_yojson (x : get_credentials_response) =
  assoc_to_yojson
    [
      ("dbUser", option_to_yojson db_user_to_yojson x.db_user);
      ("dbPassword", option_to_yojson db_password_to_yojson x.db_password);
      ( "expiration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expiration );
      ( "nextRefreshTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.next_refresh_time );
    ]

let get_credentials_request_to_yojson (x : get_credentials_request) =
  assoc_to_yojson
    [
      ("dbName", option_to_yojson db_name_to_yojson x.db_name);
      ( "durationSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.duration_seconds
      );
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
    ]

let get_custom_domain_association_response_to_yojson (x : get_custom_domain_association_response) =
  assoc_to_yojson
    [
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
      ( "customDomainCertificateExpiryTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.custom_domain_certificate_expiry_time );
    ]

let get_custom_domain_association_request_to_yojson (x : get_custom_domain_association_request) =
  assoc_to_yojson
    [
      ("customDomainName", Some (custom_domain_name_to_yojson x.custom_domain_name));
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
    ]

let get_endpoint_access_response_to_yojson (x : get_endpoint_access_response) =
  assoc_to_yojson [ ("endpoint", option_to_yojson endpoint_access_to_yojson x.endpoint) ]

let get_endpoint_access_request_to_yojson (x : get_endpoint_access_request) =
  assoc_to_yojson
    [
      ( "endpointName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_name) );
    ]

let get_identity_center_auth_token_response_to_yojson (x : get_identity_center_auth_token_response)
    =
  assoc_to_yojson
    [
      ("token", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.token);
      ( "expirationTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.expiration_time );
    ]

let workgroup_name_list_to_yojson tree = list_to_yojson workgroup_name_to_yojson tree

let get_identity_center_auth_token_request_to_yojson (x : get_identity_center_auth_token_request) =
  assoc_to_yojson [ ("workgroupNames", Some (workgroup_name_list_to_yojson x.workgroup_names)) ]

let get_namespace_response_to_yojson (x : get_namespace_response) =
  assoc_to_yojson [ ("namespace", Some (namespace_to_yojson x.namespace)) ]

let get_namespace_request_to_yojson (x : get_namespace_request) =
  assoc_to_yojson [ ("namespaceName", Some (namespace_name_to_yojson x.namespace_name)) ]

let recovery_point_to_yojson (x : recovery_point) =
  assoc_to_yojson
    [
      ( "recoveryPointId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id
      );
      ( "recoveryPointCreateTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.recovery_point_create_time );
      ( "totalSizeInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.total_size_in_mega_bytes );
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ( "namespaceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_arn );
    ]

let get_recovery_point_response_to_yojson (x : get_recovery_point_response) =
  assoc_to_yojson [ ("recoveryPoint", option_to_yojson recovery_point_to_yojson x.recovery_point) ]

let get_recovery_point_request_to_yojson (x : get_recovery_point_request) =
  assoc_to_yojson
    [
      ( "recoveryPointId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id) );
    ]

let get_reservation_response_to_yojson (x : get_reservation_response) =
  assoc_to_yojson [ ("reservation", Some (reservation_to_yojson x.reservation)) ]

let get_reservation_request_to_yojson (x : get_reservation_request) =
  assoc_to_yojson [ ("reservationId", Some (reservation_id_to_yojson x.reservation_id)) ]

let get_reservation_offering_response_to_yojson (x : get_reservation_offering_response) =
  assoc_to_yojson
    [ ("reservationOffering", Some (reservation_offering_to_yojson x.reservation_offering)) ]

let get_reservation_offering_request_to_yojson (x : get_reservation_offering_request) =
  assoc_to_yojson [ ("offeringId", Some (offering_id_to_yojson x.offering_id)) ]

let resource_policy_to_yojson (x : resource_policy) =
  assoc_to_yojson
    [
      ( "resourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn );
      ("policy", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.policy);
    ]

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson
    [ ("resourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy) ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
    ]

let get_scheduled_action_response_to_yojson (x : get_scheduled_action_response) =
  assoc_to_yojson
    [ ("scheduledAction", option_to_yojson scheduled_action_response_to_yojson x.scheduled_action) ]

let get_scheduled_action_request_to_yojson (x : get_scheduled_action_request) =
  assoc_to_yojson
    [ ("scheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name)) ]

let get_snapshot_response_to_yojson (x : get_snapshot_response) =
  assoc_to_yojson [ ("snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let get_snapshot_request_to_yojson (x : get_snapshot_request) =
  assoc_to_yojson
    [
      ( "snapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name );
      ( "ownerAccount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.owner_account );
      ( "snapshotArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_arn );
    ]

let table_restore_status_to_yojson (x : table_restore_status) =
  assoc_to_yojson
    [
      ( "tableRestoreRequestId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.table_restore_request_id );
      ("status", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status);
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ( "requestTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.request_time );
      ( "namespaceName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name );
      ( "workgroupName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name );
      ( "snapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name );
      ( "progressInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.progress_in_mega_bytes );
      ( "totalDataInMegaBytes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.total_data_in_mega_bytes );
      ( "sourceDatabaseName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.source_database_name );
      ( "sourceSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.source_schema_name );
      ( "sourceTableName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_table_name
      );
      ( "targetDatabaseName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_database_name );
      ( "targetSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_schema_name );
      ( "newTableName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.new_table_name );
      ( "recoveryPointId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id
      );
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

let update_target_to_yojson (x : update_target) =
  assoc_to_yojson
    [
      ("trackName", option_to_yojson track_name_to_yojson x.track_name);
      ( "workgroupVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_version
      );
    ]

let update_targets_list_to_yojson tree = list_to_yojson update_target_to_yojson tree

let serverless_track_to_yojson (x : serverless_track) =
  assoc_to_yojson
    [
      ("trackName", option_to_yojson track_name_to_yojson x.track_name);
      ( "workgroupVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_version
      );
      ("updateTargets", option_to_yojson update_targets_list_to_yojson x.update_targets);
    ]

let get_track_response_to_yojson (x : get_track_response) =
  assoc_to_yojson [ ("track", option_to_yojson serverless_track_to_yojson x.track) ]

let get_track_request_to_yojson (x : get_track_request) =
  assoc_to_yojson [ ("trackName", Some (track_name_to_yojson x.track_name)) ]

let get_usage_limit_response_to_yojson (x : get_usage_limit_response) =
  assoc_to_yojson [ ("usageLimit", option_to_yojson usage_limit_to_yojson x.usage_limit) ]

let get_usage_limit_request_to_yojson (x : get_usage_limit_request) =
  assoc_to_yojson
    [
      ( "usageLimitId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_limit_id) );
    ]

let get_workgroup_response_to_yojson (x : get_workgroup_response) =
  assoc_to_yojson [ ("workgroup", Some (workgroup_to_yojson x.workgroup)) ]

let get_workgroup_request_to_yojson (x : get_workgroup_request) =
  assoc_to_yojson [ ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name)) ]

let invalid_pagination_exception_to_yojson (x : invalid_pagination_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let lakehouse_idc_registration_to_yojson (x : lakehouse_idc_registration) =
  match x with ASSOCIATE -> `String "Associate" | DISASSOCIATE -> `String "Disassociate"

let lakehouse_registration_to_yojson (x : lakehouse_registration) =
  match x with REGISTER -> `String "Register" | DEREGISTER -> `String "Deregister"

let pagination_token_to_yojson = string_to_yojson

let list_custom_domain_associations_response_to_yojson
    (x : list_custom_domain_associations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("associations", option_to_yojson association_list_to_yojson x.associations);
    ]

let list_custom_domain_associations_request_to_yojson (x : list_custom_domain_associations_request)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
    ]

let list_endpoint_access_response_to_yojson (x : list_endpoint_access_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("endpoints", Some (endpoint_access_list_to_yojson x.endpoints));
    ]

let list_endpoint_access_request_to_yojson (x : list_endpoint_access_request) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "workgroupName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name );
      ("vpcId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vpc_id);
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
    ]

let managed_workgroup_status_to_yojson (x : managed_workgroup_status) =
  match x with
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | MODIFYING -> `String "MODIFYING"
  | AVAILABLE -> `String "AVAILABLE"
  | NOT_AVAILABLE -> `String "NOT_AVAILABLE"

let source_arn_to_yojson = string_to_yojson
let managed_workgroup_name_to_yojson = string_to_yojson

let managed_workgroup_list_item_to_yojson (x : managed_workgroup_list_item) =
  assoc_to_yojson
    [
      ( "managedWorkgroupName",
        option_to_yojson managed_workgroup_name_to_yojson x.managed_workgroup_name );
      ( "managedWorkgroupId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.managed_workgroup_id );
      ("sourceArn", option_to_yojson source_arn_to_yojson x.source_arn);
      ("status", option_to_yojson managed_workgroup_status_to_yojson x.status);
      ( "creationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.creation_date );
    ]

let managed_workgroups_to_yojson tree = list_to_yojson managed_workgroup_list_item_to_yojson tree

let list_managed_workgroups_response_to_yojson (x : list_managed_workgroups_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("managedWorkgroups", option_to_yojson managed_workgroups_to_yojson x.managed_workgroups);
    ]

let list_managed_workgroups_request_to_yojson (x : list_managed_workgroups_request) =
  assoc_to_yojson
    [
      ("sourceArn", option_to_yojson source_arn_to_yojson x.source_arn);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let namespace_list_to_yojson tree = list_to_yojson namespace_to_yojson tree

let list_namespaces_response_to_yojson (x : list_namespaces_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("namespaces", Some (namespace_list_to_yojson x.namespaces));
    ]

let list_namespaces_request_to_yojson (x : list_namespaces_request) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let recovery_point_list_to_yojson tree = list_to_yojson recovery_point_to_yojson tree

let list_recovery_points_response_to_yojson (x : list_recovery_points_response) =
  assoc_to_yojson
    [
      ("recoveryPoints", option_to_yojson recovery_point_list_to_yojson x.recovery_points);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_recovery_points_request_to_yojson (x : list_recovery_points_request) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ( "namespaceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_arn );
    ]

let reservation_offerings_list_to_yojson tree = list_to_yojson reservation_offering_to_yojson tree

let list_reservation_offerings_response_to_yojson (x : list_reservation_offerings_response) =
  assoc_to_yojson
    [
      ( "reservationOfferingsList",
        Some (reservation_offerings_list_to_yojson x.reservation_offerings_list) );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_reservation_offerings_request_to_yojson (x : list_reservation_offerings_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let reservations_list_to_yojson tree = list_to_yojson reservation_to_yojson tree

let list_reservations_response_to_yojson (x : list_reservations_response) =
  assoc_to_yojson
    [
      ("reservationsList", Some (reservations_list_to_yojson x.reservations_list));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_reservations_request_to_yojson (x : list_reservations_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let scheduled_action_association_to_yojson (x : scheduled_action_association) =
  assoc_to_yojson
    [
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ( "scheduledActionName",
        option_to_yojson scheduled_action_name_to_yojson x.scheduled_action_name );
    ]

let scheduled_actions_list_to_yojson tree =
  list_to_yojson scheduled_action_association_to_yojson tree

let list_scheduled_actions_response_to_yojson (x : list_scheduled_actions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("scheduledActions", option_to_yojson scheduled_actions_list_to_yojson x.scheduled_actions);
    ]

let list_scheduled_actions_request_to_yojson (x : list_scheduled_actions_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
    ]

let snapshot_copy_configurations_to_yojson tree =
  list_to_yojson snapshot_copy_configuration_to_yojson tree

let list_snapshot_copy_configurations_response_to_yojson
    (x : list_snapshot_copy_configurations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "snapshotCopyConfigurations",
        Some (snapshot_copy_configurations_to_yojson x.snapshot_copy_configurations) );
    ]

let list_snapshot_copy_configurations_request_to_yojson
    (x : list_snapshot_copy_configurations_request) =
  assoc_to_yojson
    [
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let snapshot_list_to_yojson tree = list_to_yojson snapshot_to_yojson tree

let list_snapshots_response_to_yojson (x : list_snapshots_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("snapshots", option_to_yojson snapshot_list_to_yojson x.snapshots);
    ]

let list_snapshots_request_to_yojson (x : list_snapshots_request) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "namespaceName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name );
      ( "namespaceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_arn );
      ( "ownerAccount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.owner_account );
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
    ]

let table_restore_status_list_to_yojson tree = list_to_yojson table_restore_status_to_yojson tree

let list_table_restore_status_response_to_yojson (x : list_table_restore_status_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "tableRestoreStatuses",
        option_to_yojson table_restore_status_list_to_yojson x.table_restore_statuses );
    ]

let list_table_restore_status_request_to_yojson (x : list_table_restore_status_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "namespaceName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name );
      ( "workgroupName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let track_list_to_yojson tree = list_to_yojson serverless_track_to_yojson tree

let list_tracks_response_to_yojson (x : list_tracks_response) =
  assoc_to_yojson
    [
      ("tracks", option_to_yojson track_list_to_yojson x.tracks);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_tracks_request_to_yojson (x : list_tracks_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let usage_limits_to_yojson tree = list_to_yojson usage_limit_to_yojson tree

let list_usage_limits_response_to_yojson (x : list_usage_limits_response) =
  assoc_to_yojson
    [
      ("usageLimits", option_to_yojson usage_limits_to_yojson x.usage_limits);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_usage_limits_request_to_yojson (x : list_usage_limits_request) =
  assoc_to_yojson
    [
      ( "resourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn );
      ("usageType", option_to_yojson usage_limit_usage_type_to_yojson x.usage_type);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let workgroup_list_to_yojson tree = list_to_yojson workgroup_to_yojson tree

let list_workgroups_response_to_yojson (x : list_workgroups_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("workgroups", Some (workgroup_list_to_yojson x.workgroups));
    ]

let list_workgroups_request_to_yojson (x : list_workgroups_request) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("ownerAccount", option_to_yojson owner_account_to_yojson x.owner_account);
    ]

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [ ("resourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy) ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
      ("policy", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.policy));
    ]

let update_custom_domain_association_response_to_yojson
    (x : update_custom_domain_association_response) =
  assoc_to_yojson
    [
      ("customDomainName", option_to_yojson custom_domain_name_to_yojson x.custom_domain_name);
      ("workgroupName", option_to_yojson workgroup_name_to_yojson x.workgroup_name);
      ( "customDomainCertificateArn",
        option_to_yojson custom_domain_certificate_arn_string_to_yojson
          x.custom_domain_certificate_arn );
      ( "customDomainCertificateExpiryTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.custom_domain_certificate_expiry_time );
    ]

let update_custom_domain_association_request_to_yojson
    (x : update_custom_domain_association_request) =
  assoc_to_yojson
    [
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
      ("customDomainName", Some (custom_domain_name_to_yojson x.custom_domain_name));
      ( "customDomainCertificateArn",
        Some (custom_domain_certificate_arn_string_to_yojson x.custom_domain_certificate_arn) );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let restore_from_recovery_point_response_to_yojson (x : restore_from_recovery_point_response) =
  assoc_to_yojson
    [
      ( "recoveryPointId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id
      );
      ("namespace", option_to_yojson namespace_to_yojson x.namespace);
    ]

let restore_from_recovery_point_request_to_yojson (x : restore_from_recovery_point_request) =
  assoc_to_yojson
    [
      ( "recoveryPointId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id) );
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
    ]

let restore_from_snapshot_response_to_yojson (x : restore_from_snapshot_response) =
  assoc_to_yojson
    [
      ( "snapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name );
      ( "ownerAccount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.owner_account );
      ("namespace", option_to_yojson namespace_to_yojson x.namespace);
    ]

let restore_from_snapshot_request_to_yojson (x : restore_from_snapshot_request) =
  assoc_to_yojson
    [
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
      ( "snapshotName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name );
      ( "snapshotArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_arn );
      ( "ownerAccount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.owner_account );
      ( "manageAdminPassword",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.manage_admin_password );
      ( "adminPasswordSecretKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.admin_password_secret_kms_key_id );
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
      ( "namespaceName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name) );
      ( "workgroupName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name) );
      ( "recoveryPointId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recovery_point_id) );
      ( "sourceDatabaseName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_database_name) );
      ( "sourceSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.source_schema_name );
      ( "sourceTableName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_table_name) );
      ( "targetDatabaseName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_database_name );
      ( "targetSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_schema_name );
      ( "newTableName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.new_table_name) );
      ( "activateCaseSensitiveIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.activate_case_sensitive_identifier );
    ]

let restore_table_from_snapshot_response_to_yojson (x : restore_table_from_snapshot_response) =
  assoc_to_yojson
    [
      ("tableRestoreStatus", option_to_yojson table_restore_status_to_yojson x.table_restore_status);
    ]

let restore_table_from_snapshot_request_to_yojson (x : restore_table_from_snapshot_request) =
  assoc_to_yojson
    [
      ( "namespaceName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.namespace_name) );
      ( "workgroupName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.workgroup_name) );
      ( "snapshotName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name) );
      ( "sourceDatabaseName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_database_name) );
      ( "sourceSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.source_schema_name );
      ( "sourceTableName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_table_name) );
      ( "targetDatabaseName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_database_name );
      ( "targetSchemaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.target_schema_name );
      ( "newTableName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.new_table_name) );
      ( "activateCaseSensitiveIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.activate_case_sensitive_identifier );
    ]

let update_endpoint_access_response_to_yojson (x : update_endpoint_access_response) =
  assoc_to_yojson [ ("endpoint", option_to_yojson endpoint_access_to_yojson x.endpoint) ]

let update_endpoint_access_request_to_yojson (x : update_endpoint_access_request) =
  assoc_to_yojson
    [
      ( "endpointName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_name) );
      ( "vpcSecurityGroupIds",
        option_to_yojson vpc_security_group_id_list_to_yojson x.vpc_security_group_ids );
    ]

let update_lakehouse_configuration_response_to_yojson (x : update_lakehouse_configuration_response)
    =
  assoc_to_yojson
    [
      ("namespaceName", option_to_yojson namespace_name_to_yojson x.namespace_name);
      ( "lakehouseIdcApplicationArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lakehouse_idc_application_arn );
      ( "lakehouseRegistrationStatus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lakehouse_registration_status );
      ( "catalogArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.catalog_arn );
    ]

let update_lakehouse_configuration_request_to_yojson (x : update_lakehouse_configuration_request) =
  assoc_to_yojson
    [
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ( "lakehouseRegistration",
        option_to_yojson lakehouse_registration_to_yojson x.lakehouse_registration );
      ("catalogName", option_to_yojson catalog_name_string_to_yojson x.catalog_name);
      ( "lakehouseIdcRegistration",
        option_to_yojson lakehouse_idc_registration_to_yojson x.lakehouse_idc_registration );
      ( "lakehouseIdcApplicationArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lakehouse_idc_application_arn );
      ("dryRun", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.dry_run);
    ]

let update_namespace_response_to_yojson (x : update_namespace_response) =
  assoc_to_yojson [ ("namespace", Some (namespace_to_yojson x.namespace)) ]

let update_namespace_request_to_yojson (x : update_namespace_request) =
  assoc_to_yojson
    [
      ("namespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ("adminUserPassword", option_to_yojson db_password_to_yojson x.admin_user_password);
      ("adminUsername", option_to_yojson db_user_to_yojson x.admin_username);
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ( "defaultIamRoleArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_iam_role_arn );
      ("iamRoles", option_to_yojson iam_role_arn_list_to_yojson x.iam_roles);
      ("logExports", option_to_yojson log_export_list_to_yojson x.log_exports);
      ( "manageAdminPassword",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.manage_admin_password );
      ( "adminPasswordSecretKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.admin_password_secret_kms_key_id );
    ]

let update_scheduled_action_response_to_yojson (x : update_scheduled_action_response) =
  assoc_to_yojson
    [ ("scheduledAction", option_to_yojson scheduled_action_response_to_yojson x.scheduled_action) ]

let update_scheduled_action_request_to_yojson (x : update_scheduled_action_request) =
  assoc_to_yojson
    [
      ("scheduledActionName", Some (scheduled_action_name_to_yojson x.scheduled_action_name));
      ("targetAction", option_to_yojson target_action_to_yojson x.target_action);
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("roleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
      ( "scheduledActionDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_action_description );
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
    ]

let update_snapshot_response_to_yojson (x : update_snapshot_response) =
  assoc_to_yojson [ ("snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let update_snapshot_request_to_yojson (x : update_snapshot_request) =
  assoc_to_yojson
    [
      ( "snapshotName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_name) );
      ( "retentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.retention_period
      );
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
      ( "snapshotCopyConfigurationId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.snapshot_copy_configuration_id)
      );
      ( "snapshotRetentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.snapshot_retention_period );
    ]

let update_usage_limit_response_to_yojson (x : update_usage_limit_response) =
  assoc_to_yojson [ ("usageLimit", option_to_yojson usage_limit_to_yojson x.usage_limit) ]

let update_usage_limit_request_to_yojson (x : update_usage_limit_request) =
  assoc_to_yojson
    [
      ( "usageLimitId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_limit_id) );
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.amount);
      ("breachAction", option_to_yojson usage_limit_breach_action_to_yojson x.breach_action);
    ]

let update_workgroup_response_to_yojson (x : update_workgroup_response) =
  assoc_to_yojson [ ("workgroup", Some (workgroup_to_yojson x.workgroup)) ]

let update_workgroup_request_to_yojson (x : update_workgroup_request) =
  assoc_to_yojson
    [
      ("workgroupName", Some (workgroup_name_to_yojson x.workgroup_name));
      ( "baseCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.base_capacity );
      ( "enhancedVpcRouting",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enhanced_vpc_routing );
      ("configParameters", option_to_yojson config_parameter_list_to_yojson x.config_parameters);
      ( "publiclyAccessible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.publicly_accessible );
      ("subnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("securityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
      ("port", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.port);
      ( "maxCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_capacity );
      ("ipAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ( "pricePerformanceTarget",
        option_to_yojson performance_target_to_yojson x.price_performance_target );
      ("trackName", option_to_yojson track_name_to_yojson x.track_name);
      ( "extraComputeForAutomaticOptimization",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.extra_compute_for_automatic_optimization );
    ]
