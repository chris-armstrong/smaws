open Smaws_Lib.Json.SerializeHelpers
open Types

let character_set_type_to_yojson (x : character_set_type) =
  match x with NATIONAL -> `String "NATIONAL" | DATABASE -> `String "DATABASE"

let managed_resource_status_to_yojson (x : managed_resource_status) =
  match x with
  | DISABLING -> `String "DISABLING"
  | DISABLED -> `String "DISABLED"
  | ENABLING -> `String "ENABLING"
  | ENABLED -> `String "ENABLED"

let zero_etl_access_to_yojson (x : zero_etl_access) =
  assoc_to_yojson
    [
      ("cidr", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cidr);
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
    ]

let weeks_of_month_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree

let wallet_type_to_yojson (x : wallet_type) =
  match x with INSTANCE -> `String "INSTANCE" | REGIONAL -> `String "REGIONAL"

let vpc_endpoint_type_to_yojson (x : vpc_endpoint_type) =
  match x with SERVICENETWORK -> `String "SERVICENETWORK"

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "other"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | CANNOT_PARSE -> `String "cannotParse"
  | UNKNOWN_OPERATION -> `String "unknownOperation"

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let resource_status_to_yojson (x : resource_status) =
  match x with
  | MAINTENANCE_IN_PROGRESS -> `String "MAINTENANCE_IN_PROGRESS"
  | UPDATING -> `String "UPDATING"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"
  | PROVISIONING -> `String "PROVISIONING"
  | FAILED -> `String "FAILED"
  | AVAILABLE -> `String "AVAILABLE"

let update_odb_peering_connection_output_to_yojson (x : update_odb_peering_connection_output) =
  assoc_to_yojson
    [
      ( "odbPeeringConnectionId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_peering_connection_id)
      );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
    ]

let resource_id_or_arn_to_yojson = string_to_yojson
let resource_display_name_to_yojson = string_to_yojson
let peered_cidr_to_yojson = string_to_yojson
let peered_cidr_list_to_yojson tree = list_to_yojson peered_cidr_to_yojson tree

let update_odb_peering_connection_input_to_yojson (x : update_odb_peering_connection_input) =
  assoc_to_yojson
    [
      ( "peerNetworkCidrsToBeRemoved",
        option_to_yojson peered_cidr_list_to_yojson x.peer_network_cidrs_to_be_removed );
      ( "peerNetworkCidrsToBeAdded",
        option_to_yojson peered_cidr_list_to_yojson x.peer_network_cidrs_to_be_added );
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ("odbPeeringConnectionId", Some (resource_id_or_arn_to_yojson x.odb_peering_connection_id));
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
    [
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

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

let update_odb_network_output_to_yojson (x : update_odb_network_output) =
  assoc_to_yojson
    [
      ( "odbNetworkId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_id) );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
    ]

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let access_to_yojson (x : access) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let policy_document_to_yojson = string_to_yojson

let update_odb_network_input_to_yojson (x : update_odb_network_input) =
  assoc_to_yojson
    [
      ( "crossRegionS3RestoreSourcesToDisable",
        option_to_yojson string_list_to_yojson x.cross_region_s3_restore_sources_to_disable );
      ( "crossRegionS3RestoreSourcesToEnable",
        option_to_yojson string_list_to_yojson x.cross_region_s3_restore_sources_to_enable );
      ("kmsPolicyDocument", option_to_yojson policy_document_to_yojson x.kms_policy_document);
      ("stsPolicyDocument", option_to_yojson policy_document_to_yojson x.sts_policy_document);
      ("s3PolicyDocument", option_to_yojson policy_document_to_yojson x.s3_policy_document);
      ("kmsAccess", option_to_yojson access_to_yojson x.kms_access);
      ("stsAccess", option_to_yojson access_to_yojson x.sts_access);
      ("zeroEtlAccess", option_to_yojson access_to_yojson x.zero_etl_access);
      ("s3Access", option_to_yojson access_to_yojson x.s3_access);
      ("peeredCidrsToBeRemoved", option_to_yojson string_list_to_yojson x.peered_cidrs_to_be_removed);
      ("peeredCidrsToBeAdded", option_to_yojson string_list_to_yojson x.peered_cidrs_to_be_added);
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
    ]

let update_cloud_exadata_infrastructure_output_to_yojson
    (x : update_cloud_exadata_infrastructure_output) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cloud_exadata_infrastructure_id)
      );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
    ]

let day_of_week_name_to_yojson (x : day_of_week_name) =
  match x with
  | SUNDAY -> `String "SUNDAY"
  | SATURDAY -> `String "SATURDAY"
  | FRIDAY -> `String "FRIDAY"
  | THURSDAY -> `String "THURSDAY"
  | WEDNESDAY -> `String "WEDNESDAY"
  | TUESDAY -> `String "TUESDAY"
  | MONDAY -> `String "MONDAY"

let day_of_week_to_yojson (x : day_of_week) =
  assoc_to_yojson [ ("name", option_to_yojson day_of_week_name_to_yojson x.name) ]

let days_of_week_to_yojson tree = list_to_yojson day_of_week_to_yojson tree

let hours_of_day_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree

let month_name_to_yojson (x : month_name) =
  match x with
  | DECEMBER -> `String "DECEMBER"
  | NOVEMBER -> `String "NOVEMBER"
  | OCTOBER -> `String "OCTOBER"
  | SEPTEMBER -> `String "SEPTEMBER"
  | AUGUST -> `String "AUGUST"
  | JULY -> `String "JULY"
  | JUNE -> `String "JUNE"
  | MAY -> `String "MAY"
  | APRIL -> `String "APRIL"
  | MARCH -> `String "MARCH"
  | FEBRUARY -> `String "FEBRUARY"
  | JANUARY -> `String "JANUARY"

let month_to_yojson (x : month) =
  assoc_to_yojson [ ("name", option_to_yojson month_name_to_yojson x.name) ]

let months_to_yojson tree = list_to_yojson month_to_yojson tree

let patching_mode_type_to_yojson (x : patching_mode_type) =
  match x with NONROLLING -> `String "NONROLLING" | ROLLING -> `String "ROLLING"

let preference_type_to_yojson (x : preference_type) =
  match x with
  | CUSTOM_PREFERENCE -> `String "CUSTOM_PREFERENCE"
  | NO_PREFERENCE -> `String "NO_PREFERENCE"

let maintenance_window_to_yojson (x : maintenance_window) =
  assoc_to_yojson
    [
      ("weeksOfMonth", option_to_yojson weeks_of_month_to_yojson x.weeks_of_month);
      ("skipRu", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.skip_ru);
      ("preference", option_to_yojson preference_type_to_yojson x.preference);
      ("patchingMode", option_to_yojson patching_mode_type_to_yojson x.patching_mode);
      ("months", option_to_yojson months_to_yojson x.months);
      ( "leadTimeInWeeks",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.lead_time_in_weeks );
      ( "isCustomActionTimeoutEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_custom_action_timeout_enabled );
      ("hoursOfDay", option_to_yojson hours_of_day_to_yojson x.hours_of_day);
      ("daysOfWeek", option_to_yojson days_of_week_to_yojson x.days_of_week);
      ( "customActionTimeoutInMins",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.custom_action_timeout_in_mins );
    ]

let update_cloud_exadata_infrastructure_input_to_yojson
    (x : update_cloud_exadata_infrastructure_input) =
  assoc_to_yojson
    [
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
    ]

let autonomous_database_resource_status_to_yojson (x : autonomous_database_resource_status) =
  match x with
  | STANDBY -> `String "STANDBY"
  | INACCESSIBLE -> `String "INACCESSIBLE"
  | UPGRADING -> `String "UPGRADING"
  | ROLE_CHANGE_IN_PROGRESS -> `String "ROLE_CHANGE_IN_PROGRESS"
  | RECREATING -> `String "RECREATING"
  | RESTARTING -> `String "RESTARTING"
  | AVAILABLE_NEEDS_ATTENTION -> `String "AVAILABLE_NEEDS_ATTENTION"
  | SCALE_IN_PROGRESS -> `String "SCALE_IN_PROGRESS"
  | BACKUP_IN_PROGRESS -> `String "BACKUP_IN_PROGRESS"
  | RESTORE_FAILED -> `String "RESTORE_FAILED"
  | RESTORE_IN_PROGRESS -> `String "RESTORE_IN_PROGRESS"
  | UNAVAILABLE -> `String "UNAVAILABLE"
  | STARTING -> `String "STARTING"
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | MAINTENANCE_IN_PROGRESS -> `String "MAINTENANCE_IN_PROGRESS"
  | UPDATING -> `String "UPDATING"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"
  | PROVISIONING -> `String "PROVISIONING"
  | FAILED -> `String "FAILED"
  | AVAILABLE -> `String "AVAILABLE"

let update_autonomous_database_output_to_yojson (x : update_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
    ]

let sensitive_string_to_yojson = string_to_yojson

let db_workload_to_yojson (x : db_workload) =
  match x with
  | LH -> `String "LH"
  | APEX -> `String "APEX"
  | AJD -> `String "AJD"
  | OLTP -> `String "OLTP"

let database_tool_to_yojson (x : database_tool) =
  assoc_to_yojson
    [
      ( "maxIdleTimeInMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_idle_time_in_minutes );
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.compute_count );
      ("name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
      ( "isEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_enabled );
    ]

let database_tool_list_to_yojson tree = list_to_yojson database_tool_to_yojson tree

let database_edition_to_yojson (x : database_edition) =
  match x with
  | ENTERPRISE_EDITION -> `String "ENTERPRISE_EDITION"
  | STANDARD_EDITION -> `String "STANDARD_EDITION"

let license_model_to_yojson (x : license_model) =
  match x with
  | LICENSE_INCLUDED -> `String "LICENSE_INCLUDED"
  | BRING_YOUR_OWN_LICENSE -> `String "BRING_YOUR_OWN_LICENSE"

let autonomous_maintenance_schedule_type_to_yojson (x : autonomous_maintenance_schedule_type) =
  match x with REGULAR -> `String "REGULAR" | EARLY -> `String "EARLY"

let customer_contact_to_yojson (x : customer_contact) =
  assoc_to_yojson [ ("email", option_to_yojson sensitive_string_to_yojson x.email) ]

let customer_contacts_to_yojson tree = list_to_yojson customer_contact_to_yojson tree

let scheduled_operation_details_to_yojson (x : scheduled_operation_details) =
  assoc_to_yojson
    [
      ( "scheduledStopTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_stop_time );
      ( "scheduledStartTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_start_time );
      ("dayOfWeek", Some (day_of_week_to_yojson x.day_of_week));
    ]

let scheduled_operation_details_list_to_yojson tree =
  list_to_yojson scheduled_operation_details_to_yojson tree

let repeat_cadence_to_yojson (x : repeat_cadence) =
  match x with
  | YEARLY -> `String "YEARLY"
  | MONTHLY -> `String "MONTHLY"
  | WEEKLY -> `String "WEEKLY"
  | ONE_TIME -> `String "ONE_TIME"

let long_term_backup_schedule_to_yojson (x : long_term_backup_schedule) =
  assoc_to_yojson
    [
      ( "timeOfBackup",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_backup );
      ( "retentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retention_period_in_days );
      ("repeatCadence", option_to_yojson repeat_cadence_to_yojson x.repeat_cadence);
      ( "isDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_disabled );
    ]

let open_mode_to_yojson (x : open_mode) =
  match x with READ_WRITE -> `String "READ_WRITE" | READ_ONLY -> `String "READ_ONLY"

let permission_level_to_yojson (x : permission_level) =
  match x with UNRESTRICTED -> `String "UNRESTRICTED" | RESTRICTED -> `String "RESTRICTED"

let refreshable_mode_to_yojson (x : refreshable_mode) =
  match x with MANUAL -> `String "MANUAL" | AUTOMATIC -> `String "AUTOMATIC"

let resource_pool_summary_to_yojson (x : resource_pool_summary) =
  assoc_to_yojson
    [
      ( "availableComputeCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_compute_capacity );
      ( "totalComputeCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_compute_capacity );
      ( "availableStorageCapacityInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.available_storage_capacity_in_t_bs );
      ( "poolStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.pool_storage_size_in_t_bs );
      ( "poolSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.pool_size );
      ( "isDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_disabled );
    ]

let standby_allowlisted_ips_source_to_yojson (x : standby_allowlisted_ips_source) =
  match x with
  | NOT_APPLICABLE -> `String "NOT_APPLICABLE"
  | SEPARATE -> `String "SEPARATE"
  | PRIMARY -> `String "PRIMARY"

let encryption_key_provider_input_to_yojson (x : encryption_key_provider_input) =
  match x with AWS_KMS -> `String "AWS_KMS" | ORACLE_MANAGED -> `String "ORACLE_MANAGED"

let role_arn_to_yojson = string_to_yojson

let external_id_type_to_yojson (x : external_id_type) =
  match x with
  | TENANT_OCID -> `String "tenant_ocid"
  | COMPARTMENT_OCID -> `String "compartment_ocid"
  | DATABASE_OCID -> `String "database_ocid"

let kms_key_id_or_arn_to_yojson = string_to_yojson

let aws_encryption_key_configuration_input_to_yojson (x : aws_encryption_key_configuration_input) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson kms_key_id_or_arn_to_yojson x.kms_key_id);
      ("externalIdType", option_to_yojson external_id_type_to_yojson x.external_id_type);
      ("iamRoleArn", option_to_yojson role_arn_to_yojson x.iam_role_arn);
    ]

let encryption_key_configuration_input_to_yojson (x : encryption_key_configuration_input) =
  match x with
  | AwsEncryptionKey arg ->
      assoc_to_yojson
        [ ("awsEncryptionKey", Some (aws_encryption_key_configuration_input_to_yojson arg)) ]

let update_autonomous_database_input_to_yojson (x : update_autonomous_database_input) =
  assoc_to_yojson
    [
      ( "encryptionKeyConfiguration",
        option_to_yojson encryption_key_configuration_input_to_yojson x.encryption_key_configuration
      );
      ( "encryptionKeyProvider",
        option_to_yojson encryption_key_provider_input_to_yojson x.encryption_key_provider );
      ( "timeOfAutoRefreshStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_auto_refresh_start );
      ( "autoRefreshPointLagInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_point_lag_in_seconds );
      ( "autoRefreshFrequencyInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_frequency_in_seconds );
      ("allowlistedIps", option_to_yojson string_list_to_yojson x.allowlisted_ips);
      ("standbyAllowlistedIps", option_to_yojson string_list_to_yojson x.standby_allowlisted_ips);
      ( "standbyAllowlistedIpsSource",
        option_to_yojson standby_allowlisted_ips_source_to_yojson x.standby_allowlisted_ips_source
      );
      ( "resourcePoolSummary",
        option_to_yojson resource_pool_summary_to_yojson x.resource_pool_summary );
      ( "resourcePoolLeaderId",
        option_to_yojson resource_id_or_arn_to_yojson x.resource_pool_leader_id );
      ("peerDbId", option_to_yojson resource_id_or_arn_to_yojson x.peer_db_id);
      ( "privateEndpointLabel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_label );
      ( "privateEndpointIp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_ip );
      ("refreshableMode", option_to_yojson refreshable_mode_to_yojson x.refreshable_mode);
      ("permissionLevel", option_to_yojson permission_level_to_yojson x.permission_level);
      ("openMode", option_to_yojson open_mode_to_yojson x.open_mode);
      ( "longTermBackupSchedule",
        option_to_yojson long_term_backup_schedule_to_yojson x.long_term_backup_schedule );
      ( "scheduledOperations",
        option_to_yojson scheduled_operation_details_list_to_yojson x.scheduled_operations );
      ( "customerContactsToSendToOCI",
        option_to_yojson customer_contacts_to_yojson x.customer_contacts_to_send_to_oc_i );
      ( "autonomousMaintenanceScheduleType",
        option_to_yojson autonomous_maintenance_schedule_type_to_yojson
          x.autonomous_maintenance_schedule_type );
      ( "localAdgAutoFailoverMaxDataLossLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.local_adg_auto_failover_max_data_loss_limit );
      ( "byolComputeCountLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.byol_compute_count_limit );
      ( "backupRetentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.backup_retention_period_in_days );
      ( "isDisconnectPeer",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_disconnect_peer );
      ( "isRefreshableClone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_refreshable_clone );
      ( "isMtlsConnectionRequired",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_connection_required );
      ( "isLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_data_guard_enabled );
      ( "isBackupRetentionLocked",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_backup_retention_locked );
      ( "isAutoScalingForStorageEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_for_storage_enabled );
      ( "isAutoScalingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_enabled );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("databaseEdition", option_to_yojson database_edition_to_yojson x.database_edition);
      ("dbToolsDetails", option_to_yojson database_tool_list_to_yojson x.db_tools_details);
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_t_bs );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.compute_count );
      ("adminPassword", option_to_yojson sensitive_string_to_yojson x.admin_password);
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
    ]

let update_autonomous_database_backup_output_to_yojson
    (x : update_autonomous_database_backup_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseBackupId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_backup_id)
      );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
    ]

let resource_id_to_yojson = string_to_yojson

let update_autonomous_database_backup_input_to_yojson (x : update_autonomous_database_backup_input)
    =
  assoc_to_yojson
    [
      ( "retentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retention_period_in_days );
      ("autonomousDatabaseBackupId", Some (resource_id_to_yojson x.autonomous_database_backup_id));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let transportable_tablespace_to_yojson (x : transportable_tablespace) =
  assoc_to_yojson
    [
      ( "ttsBundleUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tts_bundle_url );
    ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson
let request_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (request_tag_map_to_yojson x.tags));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("quotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let system_version_summary_to_yojson (x : system_version_summary) =
  assoc_to_yojson
    [
      ("systemVersions", option_to_yojson string_list_to_yojson x.system_versions);
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "giVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.gi_version );
    ]

let system_version_list_to_yojson tree = list_to_yojson system_version_summary_to_yojson tree

let switchover_autonomous_database_output_to_yojson (x : switchover_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
    ]

let switchover_autonomous_database_input_to_yojson (x : switchover_autonomous_database_input) =
  assoc_to_yojson
    [
      ("peerDbArn", option_to_yojson resource_arn_to_yojson x.peer_db_arn);
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
    ]

let supported_aws_integration_to_yojson (x : supported_aws_integration) =
  match x with KmsTde -> `String "KmsTde"

let subscription_error_to_yojson (x : subscription_error) =
  assoc_to_yojson
    [
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
    ]

let subscription_errors_to_yojson tree = list_to_yojson subscription_error_to_yojson tree

let sts_access_to_yojson (x : sts_access) =
  assoc_to_yojson
    [
      ( "stsPolicyDocument",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.sts_policy_document );
      ( "domainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain_name );
      ("ipv4Addresses", option_to_yojson string_list_to_yojson x.ipv4_addresses);
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
    ]

let db_node_resource_status_to_yojson (x : db_node_resource_status) =
  match x with
  | STARTING -> `String "STARTING"
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | UPDATING -> `String "UPDATING"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"
  | PROVISIONING -> `String "PROVISIONING"
  | FAILED -> `String "FAILED"
  | AVAILABLE -> `String "AVAILABLE"

let stop_db_node_output_to_yojson (x : stop_db_node_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson db_node_resource_status_to_yojson x.status);
      ("dbNodeId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_node_id));
    ]

let stop_db_node_input_to_yojson (x : stop_db_node_input) =
  assoc_to_yojson
    [
      ("dbNodeId", Some (resource_id_to_yojson x.db_node_id));
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
    ]

let stop_autonomous_database_output_to_yojson (x : stop_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
    ]

let stop_autonomous_database_input_to_yojson (x : stop_autonomous_database_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id)) ]

let start_db_node_output_to_yojson (x : start_db_node_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson db_node_resource_status_to_yojson x.status);
      ("dbNodeId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_node_id));
    ]

let start_db_node_input_to_yojson (x : start_db_node_input) =
  assoc_to_yojson
    [
      ("dbNodeId", Some (resource_id_to_yojson x.db_node_id));
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
    ]

let start_autonomous_database_output_to_yojson (x : start_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
    ]

let start_autonomous_database_input_to_yojson (x : start_autonomous_database_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id)) ]

let source_type_to_yojson (x : source_type) =
  match x with
  | CLONE_TO_REFRESHABLE -> `String "CLONE_TO_REFRESHABLE"
  | CROSS_REGION_DISASTER_RECOVERY -> `String "CROSS_REGION_DISASTER_RECOVERY"
  | CROSS_REGION_DATAGUARD -> `String "CROSS_REGION_DATAGUARD"
  | BACKUP_FROM_TIMESTAMP -> `String "BACKUP_FROM_TIMESTAMP"
  | BACKUP_FROM_ID -> `String "BACKUP_FROM_ID"
  | DATABASE -> `String "DATABASE"
  | NONE -> `String "NONE"

let clone_type_to_yojson (x : clone_type) =
  match x with
  | PARTIAL -> `String "PARTIAL"
  | METADATA -> `String "METADATA"
  | FULL -> `String "FULL"

let database_clone_configuration_to_yojson (x : database_clone_configuration) =
  assoc_to_yojson
    [
      ("cloneType", Some (clone_type_to_yojson x.clone_type));
      ( "sourceAutonomousDatabaseId",
        Some (resource_id_or_arn_to_yojson x.source_autonomous_database_id) );
    ]

let integer_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree

let restore_from_backup_configuration_to_yojson (x : restore_from_backup_configuration) =
  assoc_to_yojson
    [
      ("cloneTableSpaceList", option_to_yojson integer_list_to_yojson x.clone_table_space_list);
      ("cloneType", Some (clone_type_to_yojson x.clone_type));
      ( "autonomousDatabaseBackupId",
        Some (resource_id_or_arn_to_yojson x.autonomous_database_backup_id) );
    ]

let point_in_time_restore_configuration_to_yojson (x : point_in_time_restore_configuration) =
  assoc_to_yojson
    [
      ("cloneTableSpaceList", option_to_yojson integer_list_to_yojson x.clone_table_space_list);
      ( "useLatestAvailableBackupTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.use_latest_available_backup_timestamp );
      ( "timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.timestamp );
      ("cloneType", Some (clone_type_to_yojson x.clone_type));
      ( "sourceAutonomousDatabaseId",
        Some (resource_id_or_arn_to_yojson x.source_autonomous_database_id) );
    ]

let arn_to_yojson = string_to_yojson

let cross_region_data_guard_configuration_to_yojson (x : cross_region_data_guard_configuration) =
  assoc_to_yojson
    [ ("sourceAutonomousDatabaseArn", Some (arn_to_yojson x.source_autonomous_database_arn)) ]

let disaster_recovery_type_to_yojson (x : disaster_recovery_type) =
  match x with BACKUP_BASED -> `String "BACKUP_BASED" | ADG -> `String "ADG"

let cross_region_disaster_recovery_configuration_to_yojson
    (x : cross_region_disaster_recovery_configuration) =
  assoc_to_yojson
    [
      ( "isReplicateAutomaticBackups",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_replicate_automatic_backups );
      ( "remoteDisasterRecoveryType",
        Some (disaster_recovery_type_to_yojson x.remote_disaster_recovery_type) );
      ("sourceAutonomousDatabaseArn", Some (arn_to_yojson x.source_autonomous_database_arn));
    ]

let clone_to_refreshable_configuration_to_yojson (x : clone_to_refreshable_configuration) =
  assoc_to_yojson
    [
      ("cloneType", option_to_yojson clone_type_to_yojson x.clone_type);
      ("openMode", option_to_yojson open_mode_to_yojson x.open_mode);
      ( "timeOfAutoRefreshStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_auto_refresh_start );
      ( "autoRefreshPointLagInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_point_lag_in_seconds );
      ( "autoRefreshFrequencyInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_frequency_in_seconds );
      ("refreshableMode", option_to_yojson refreshable_mode_to_yojson x.refreshable_mode);
      ( "sourceAutonomousDatabaseId",
        Some (resource_id_or_arn_to_yojson x.source_autonomous_database_id) );
    ]

let source_configuration_to_yojson (x : source_configuration) =
  match x with
  | CloneToRefreshable arg ->
      assoc_to_yojson
        [ ("cloneToRefreshable", Some (clone_to_refreshable_configuration_to_yojson arg)) ]
  | CrossRegionDisasterRecovery arg ->
      assoc_to_yojson
        [
          ( "crossRegionDisasterRecovery",
            Some (cross_region_disaster_recovery_configuration_to_yojson arg) );
        ]
  | CrossRegionDataGuard arg ->
      assoc_to_yojson
        [ ("crossRegionDataGuard", Some (cross_region_data_guard_configuration_to_yojson arg)) ]
  | PointInTimeRestore arg ->
      assoc_to_yojson
        [ ("pointInTimeRestore", Some (point_in_time_restore_configuration_to_yojson arg)) ]
  | RestoreFromBackup arg ->
      assoc_to_yojson
        [ ("restoreFromBackup", Some (restore_from_backup_configuration_to_yojson arg)) ]
  | DatabaseClone arg ->
      assoc_to_yojson [ ("databaseClone", Some (database_clone_configuration_to_yojson arg)) ]

let shrink_autonomous_database_output_to_yojson (x : shrink_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
    ]

let shrink_autonomous_database_input_to_yojson (x : shrink_autonomous_database_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id)) ]

let shape_type_to_yojson (x : shape_type) =
  match x with
  | AMPERE_FLEX_A1 -> `String "AMPERE_FLEX_A1"
  | INTEL_FLEX_X9 -> `String "INTEL_FLEX_X9"
  | INTEL -> `String "INTEL"
  | AMD -> `String "AMD"

let service_network_endpoint_to_yojson (x : service_network_endpoint) =
  assoc_to_yojson
    [
      ("vpcEndpointType", option_to_yojson vpc_endpoint_type_to_yojson x.vpc_endpoint_type);
      ( "vpcEndpointId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vpc_endpoint_id
      );
    ]

let sensitive_string_list_to_yojson tree = list_to_yojson sensitive_string_to_yojson tree

let s3_access_to_yojson (x : s3_access) =
  assoc_to_yojson
    [
      ( "s3PolicyDocument",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.s3_policy_document );
      ( "domainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain_name );
      ("ipv4Addresses", option_to_yojson string_list_to_yojson x.ipv4_addresses);
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
    ]

let restore_autonomous_database_output_to_yojson (x : restore_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
    ]

let restore_autonomous_database_input_to_yojson (x : restore_autonomous_database_input) =
  assoc_to_yojson
    [
      ( "timestamp",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.timestamp) );
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
    ]

let response_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let resource_id_list_to_yojson tree = list_to_yojson resource_id_to_yojson tree

let refreshable_status_to_yojson (x : refreshable_status) =
  match x with NOT_REFRESHING -> `String "NOT_REFRESHING" | REFRESHING -> `String "REFRESHING"

let reboot_db_node_output_to_yojson (x : reboot_db_node_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson db_node_resource_status_to_yojson x.status);
      ("dbNodeId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_node_id));
    ]

let reboot_db_node_input_to_yojson (x : reboot_db_node_input) =
  assoc_to_yojson
    [
      ("dbNodeId", Some (resource_id_to_yojson x.db_node_id));
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
    ]

let reboot_autonomous_database_output_to_yojson (x : reboot_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
    ]

let reboot_autonomous_database_input_to_yojson (x : reboot_autonomous_database_input) =
  assoc_to_yojson
    [
      ( "isOnlineReboot",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_online_reboot
      );
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
    ]

let peer_network_route_table_id_to_yojson = string_to_yojson

let peer_network_route_table_id_list_to_yojson tree =
  list_to_yojson peer_network_route_table_id_to_yojson tree

let operations_insights_status_to_yojson (x : operations_insights_status) =
  match x with
  | FAILED_DISABLING -> `String "FAILED_DISABLING"
  | FAILED_ENABLING -> `String "FAILED_ENABLING"
  | NOT_ENABLED -> `String "NOT_ENABLED"
  | DISABLING -> `String "DISABLING"
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"

let okv_encryption_key_configuration_to_yojson (x : okv_encryption_key_configuration) =
  assoc_to_yojson
    [
      ("okvUri", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.okv_uri));
      ("okvKmsKey", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.okv_kms_key));
      ( "directoryName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.directory_name) );
      ( "certificateId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.certificate_id );
      ( "certificateDirectoryName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.certificate_directory_name)
      );
    ]

let odb_peering_connection_summary_to_yojson (x : odb_peering_connection_summary) =
  assoc_to_yojson
    [
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("peerNetworkCidrs", option_to_yojson peered_cidr_list_to_yojson x.peer_network_cidrs);
      ( "odbPeeringConnectionType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.odb_peering_connection_type );
      ( "peerNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.peer_network_arn
      );
      ( "odbNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_arn
      );
      ( "odbPeeringConnectionArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.odb_peering_connection_arn );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("odbPeeringConnectionId", Some (resource_id_or_arn_to_yojson x.odb_peering_connection_id));
    ]

let odb_peering_connection_list_to_yojson tree =
  list_to_yojson odb_peering_connection_summary_to_yojson tree

let odb_peering_connection_to_yojson (x : odb_peering_connection) =
  assoc_to_yojson
    [
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("peerNetworkCidrs", option_to_yojson peered_cidr_list_to_yojson x.peer_network_cidrs);
      ( "odbPeeringConnectionType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.odb_peering_connection_type );
      ( "peerNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.peer_network_arn
      );
      ( "odbNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_arn
      );
      ( "odbPeeringConnectionArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.odb_peering_connection_arn );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("odbPeeringConnectionId", Some (resource_id_or_arn_to_yojson x.odb_peering_connection_id));
    ]

let oci_dns_forwarding_config_to_yojson (x : oci_dns_forwarding_config) =
  assoc_to_yojson
    [
      ( "ociDnsListenerIp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_dns_listener_ip );
      ( "domainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain_name );
    ]

let oci_dns_forwarding_config_list_to_yojson tree =
  list_to_yojson oci_dns_forwarding_config_to_yojson tree

let managed_s3_backup_access_to_yojson (x : managed_s3_backup_access) =
  assoc_to_yojson
    [
      ("ipv4Addresses", option_to_yojson string_list_to_yojson x.ipv4_addresses);
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
    ]

let kms_access_to_yojson (x : kms_access) =
  assoc_to_yojson
    [
      ( "kmsPolicyDocument",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.kms_policy_document );
      ( "domainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain_name );
      ("ipv4Addresses", option_to_yojson string_list_to_yojson x.ipv4_addresses);
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
    ]

let cross_region_s3_restore_sources_access_to_yojson (x : cross_region_s3_restore_sources_access) =
  assoc_to_yojson
    [
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
      ("ipv4Addresses", option_to_yojson string_list_to_yojson x.ipv4_addresses);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
    ]

let cross_region_s3_restore_sources_access_list_to_yojson tree =
  list_to_yojson cross_region_s3_restore_sources_access_to_yojson tree

let managed_services_to_yojson (x : managed_services) =
  assoc_to_yojson
    [
      ( "crossRegionS3RestoreSourcesAccess",
        option_to_yojson cross_region_s3_restore_sources_access_list_to_yojson
          x.cross_region_s3_restore_sources_access );
      ("kmsAccess", option_to_yojson kms_access_to_yojson x.kms_access);
      ("stsAccess", option_to_yojson sts_access_to_yojson x.sts_access);
      ("s3Access", option_to_yojson s3_access_to_yojson x.s3_access);
      ("zeroEtlAccess", option_to_yojson zero_etl_access_to_yojson x.zero_etl_access);
      ( "managedS3BackupAccess",
        option_to_yojson managed_s3_backup_access_to_yojson x.managed_s3_backup_access );
      ( "serviceNetworkEndpoint",
        option_to_yojson service_network_endpoint_to_yojson x.service_network_endpoint );
      ( "managedServicesIpv4Cidrs",
        option_to_yojson string_list_to_yojson x.managed_services_ipv4_cidrs );
      ("resourceGatewayArn", option_to_yojson resource_arn_to_yojson x.resource_gateway_arn);
      ("serviceNetworkArn", option_to_yojson resource_arn_to_yojson x.service_network_arn);
    ]

let odb_network_summary_to_yojson (x : odb_network_summary) =
  assoc_to_yojson
    [
      ("ec2PlacementGroupIds", option_to_yojson resource_id_list_to_yojson x.ec2_placement_group_ids);
      ("managedServices", option_to_yojson managed_services_to_yojson x.managed_services);
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "ociDnsForwardingConfigs",
        option_to_yojson oci_dns_forwarding_config_list_to_yojson x.oci_dns_forwarding_configs );
      ( "ociVcnUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_vcn_url );
      ( "ociVcnId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_vcn_id );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "ociNetworkAnchorUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_network_anchor_url );
      ( "ociNetworkAnchorId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_network_anchor_id );
      ("peeredCidrs", option_to_yojson string_list_to_yojson x.peered_cidrs);
      ( "defaultDnsPrefix",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_dns_prefix );
      ( "customDomainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.custom_domain_name );
      ( "backupSubnetCidr",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.backup_subnet_cidr );
      ( "clientSubnetCidr",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.client_subnet_cidr );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "odbNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_arn
      );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
    ]

let odb_network_list_to_yojson tree = list_to_yojson odb_network_summary_to_yojson tree

let odb_network_to_yojson (x : odb_network) =
  assoc_to_yojson
    [
      ("ec2PlacementGroupIds", option_to_yojson resource_id_list_to_yojson x.ec2_placement_group_ids);
      ("managedServices", option_to_yojson managed_services_to_yojson x.managed_services);
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "ociDnsForwardingConfigs",
        option_to_yojson oci_dns_forwarding_config_list_to_yojson x.oci_dns_forwarding_configs );
      ( "ociVcnUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_vcn_url );
      ( "ociVcnId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_vcn_id );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "ociNetworkAnchorUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_network_anchor_url );
      ( "ociNetworkAnchorId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_network_anchor_id );
      ("peeredCidrs", option_to_yojson string_list_to_yojson x.peered_cidrs);
      ( "defaultDnsPrefix",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_dns_prefix );
      ( "customDomainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.custom_domain_name );
      ( "backupSubnetCidr",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.backup_subnet_cidr );
      ( "clientSubnetCidr",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.client_subnet_cidr );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "odbNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_arn
      );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson response_tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let list_system_versions_output_to_yojson (x : list_system_versions_output) =
  assoc_to_yojson
    [
      ("systemVersions", Some (system_version_list_to_yojson x.system_versions));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_system_versions_input_to_yojson (x : list_system_versions_input) =
  assoc_to_yojson
    [
      ("shape", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape));
      ("giVersion", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.gi_version));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let gi_version_summary_to_yojson (x : gi_version_summary) =
  assoc_to_yojson
    [
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
    ]

let gi_version_list_to_yojson tree = list_to_yojson gi_version_summary_to_yojson tree

let list_gi_versions_output_to_yojson (x : list_gi_versions_output) =
  assoc_to_yojson
    [
      ("giVersions", Some (gi_version_list_to_yojson x.gi_versions));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_gi_versions_input_to_yojson (x : list_gi_versions_input) =
  assoc_to_yojson
    [
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let compute_model_to_yojson (x : compute_model) =
  match x with OCPU -> `String "OCPU" | ECPU -> `String "ECPU"

let db_system_shape_summary_to_yojson (x : db_system_shape_summary) =
  assoc_to_yojson
    [
      ( "areServerTypesSupported",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.are_server_types_supported );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ("name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
      ("shapeType", option_to_yojson shape_type_to_yojson x.shape_type);
      ( "shapeFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape_family );
      ( "runtimeMinimumCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.runtime_minimum_core_count );
      ( "minimumNodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.minimum_node_count );
      ( "minimumCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.minimum_core_count );
      ( "minStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_storage_count
      );
      ( "minMemoryPerNodeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.min_memory_per_node_in_g_bs );
      ( "minDbNodeStoragePerNodeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.min_db_node_storage_per_node_in_g_bs );
      ( "minDataStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.min_data_storage_in_t_bs );
      ( "minCoreCountPerNode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.min_core_count_per_node );
      ( "maximumNodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.maximum_node_count );
      ( "maxStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_storage_count
      );
      ( "coreCountIncrement",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.core_count_increment );
      ( "availableMemoryPerNodeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_memory_per_node_in_g_bs );
      ( "availableMemoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_memory_in_g_bs );
      ( "availableDbNodeStorageInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_db_node_storage_in_g_bs );
      ( "availableDbNodePerNodeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_db_node_per_node_in_g_bs );
      ( "availableDataStoragePerServerInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_data_storage_per_server_in_t_bs );
      ( "availableDataStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_data_storage_in_t_bs );
      ( "availableCoreCountPerNode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_core_count_per_node );
      ( "availableCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_core_count );
    ]

let db_system_shape_list_to_yojson tree = list_to_yojson db_system_shape_summary_to_yojson tree

let list_db_system_shapes_output_to_yojson (x : list_db_system_shapes_output) =
  assoc_to_yojson
    [
      ("dbSystemShapes", Some (db_system_shape_list_to_yojson x.db_system_shapes));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_db_system_shapes_input_to_yojson (x : list_db_system_shapes_input) =
  assoc_to_yojson
    [
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let autonomous_database_version_summary_to_yojson (x : autonomous_database_version_summary) =
  assoc_to_yojson
    [
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
      ("details", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.details);
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
    ]

let autonomous_database_version_list_to_yojson tree =
  list_to_yojson autonomous_database_version_summary_to_yojson tree

let list_autonomous_database_versions_output_to_yojson
    (x : list_autonomous_database_versions_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseVersions",
        Some (autonomous_database_version_list_to_yojson x.autonomous_database_versions) );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_autonomous_database_versions_input_to_yojson (x : list_autonomous_database_versions_input)
    =
  assoc_to_yojson
    [
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let autonomous_database_character_set_summary_to_yojson
    (x : autonomous_database_character_set_summary) =
  assoc_to_yojson
    [
      ( "characterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.character_set );
    ]

let autonomous_database_character_set_list_to_yojson tree =
  list_to_yojson autonomous_database_character_set_summary_to_yojson tree

let list_autonomous_database_character_sets_output_to_yojson
    (x : list_autonomous_database_character_sets_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseCharacterSets",
        Some (autonomous_database_character_set_list_to_yojson x.autonomous_database_character_sets)
      );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_autonomous_database_character_sets_input_to_yojson
    (x : list_autonomous_database_character_sets_input) =
  assoc_to_yojson
    [
      ("characterSetType", option_to_yojson character_set_type_to_yojson x.character_set_type);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let initialize_service_output_to_yojson = unit_to_yojson

let initialize_service_input_to_yojson (x : initialize_service_input) =
  assoc_to_yojson
    [
      ( "ociIdentityDomain",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.oci_identity_domain );
    ]

let oci_onboarding_status_to_yojson (x : oci_onboarding_status) =
  match x with
  | CANCELED -> `String "CANCELED"
  | SUSPENDED -> `String "SUSPENDED"
  | PUBLIC_OFFER_UNSUPPORTED -> `String "PUBLIC_OFFER_UNSUPPORTED"
  | FAILED -> `String "FAILED"
  | ACTIVE_LIMITED -> `String "ACTIVE_LIMITED"
  | ACTIVE -> `String "ACTIVE"
  | ACTIVE_IN_HOME_REGION -> `String "ACTIVE_IN_HOME_REGION"
  | ACTIVATING -> `String "ACTIVATING"
  | PENDING_INITIALIZATION -> `String "PENDING_INITIALIZATION"
  | PENDING_CUSTOMER_ACTION -> `String "PENDING_CUSTOMER_ACTION"
  | PENDING_LINK_GENERATION -> `String "PENDING_LINK_GENERATION"
  | NOT_STARTED -> `String "NOT_STARTED"

let oci_identity_domain_to_yojson (x : oci_identity_domain) =
  assoc_to_yojson
    [
      ( "accountSetupCloudFormationUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.account_setup_cloud_formation_url );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "ociIdentityDomainUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_identity_domain_url );
      ( "ociIdentityDomainResourceUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_identity_domain_resource_url );
      ( "ociIdentityDomainId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_identity_domain_id );
    ]

let oci_aws_integration_to_yojson (x : oci_aws_integration) =
  match x with KmsTde -> `String "KmsTde"

let oci_iam_role_to_yojson (x : oci_iam_role) =
  assoc_to_yojson
    [
      ("awsIntegration", option_to_yojson oci_aws_integration_to_yojson x.aws_integration);
      ("iamRoleArn", option_to_yojson role_arn_to_yojson x.iam_role_arn);
    ]

let oci_iam_role_list_to_yojson tree = list_to_yojson oci_iam_role_to_yojson tree

let get_oci_onboarding_status_output_to_yojson (x : get_oci_onboarding_status_output) =
  assoc_to_yojson
    [
      ("subscriptionErrors", option_to_yojson subscription_errors_to_yojson x.subscription_errors);
      ( "linkedOciCompartmentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.linked_oci_compartment_id );
      ( "linkedOciTenancyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.linked_oci_tenancy_id );
      ( "autonomousDatabaseOciIntegrationIamRoles",
        option_to_yojson oci_iam_role_list_to_yojson x.autonomous_database_oci_integration_iam_roles
      );
      ("ociIdentityDomain", option_to_yojson oci_identity_domain_to_yojson x.oci_identity_domain);
      ( "newTenancyActivationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.new_tenancy_activation_link );
      ( "existingTenancyActivationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.existing_tenancy_activation_link );
      ("status", option_to_yojson oci_onboarding_status_to_yojson x.status);
    ]

let get_oci_onboarding_status_input_to_yojson = unit_to_yojson
let disassociate_iam_role_from_resource_output_to_yojson = unit_to_yojson

let disassociate_iam_role_from_resource_input_to_yojson
    (x : disassociate_iam_role_from_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("awsIntegration", Some (supported_aws_integration_to_yojson x.aws_integration));
      ("iamRoleArn", Some (role_arn_to_yojson x.iam_role_arn));
    ]

let associate_iam_role_to_resource_output_to_yojson = unit_to_yojson

let associate_iam_role_to_resource_input_to_yojson (x : associate_iam_role_to_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("awsIntegration", Some (supported_aws_integration_to_yojson x.aws_integration));
      ("iamRoleArn", Some (role_arn_to_yojson x.iam_role_arn));
    ]

let accept_marketplace_registration_output_to_yojson = unit_to_yojson

let accept_marketplace_registration_input_to_yojson (x : accept_marketplace_registration_input) =
  assoc_to_yojson
    [
      ( "marketplaceRegistrationToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.marketplace_registration_token)
      );
    ]

let oci_encryption_key_configuration_to_yojson (x : oci_encryption_key_configuration) =
  assoc_to_yojson
    [
      ("vaultId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vault_id));
      ("kmsKeyId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id));
    ]

let objective_to_yojson (x : objective) =
  match x with
  | LOW_LATENCY -> `String "LOW_LATENCY"
  | HIGH_THROUGHPUT -> `String "HIGH_THROUGHPUT"
  | BASIC -> `String "BASIC"
  | BALANCED -> `String "BALANCED"
  | AUTO -> `String "AUTO"

let net_services_architecture_to_yojson (x : net_services_architecture) =
  match x with SHARED -> `String "SHARED" | DEDICATED -> `String "DEDICATED"

let list_odb_peering_connections_output_to_yojson (x : list_odb_peering_connections_output) =
  assoc_to_yojson
    [
      ( "odbPeeringConnections",
        Some (odb_peering_connection_list_to_yojson x.odb_peering_connections) );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_odb_peering_connections_input_to_yojson (x : list_odb_peering_connections_input) =
  assoc_to_yojson
    [
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_odb_networks_output_to_yojson (x : list_odb_networks_output) =
  assoc_to_yojson
    [
      ("odbNetworks", Some (odb_network_list_to_yojson x.odb_networks));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_odb_networks_input_to_yojson (x : list_odb_networks_input) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let db_server_patching_status_to_yojson (x : db_server_patching_status) =
  match x with
  | SCHEDULED -> `String "SCHEDULED"
  | MAINTENANCE_IN_PROGRESS -> `String "MAINTENANCE_IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | COMPLETE -> `String "COMPLETE"

let db_server_patching_details_to_yojson (x : db_server_patching_details) =
  assoc_to_yojson
    [
      ( "timePatchingStarted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_patching_started );
      ( "timePatchingEnded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_patching_ended );
      ("patchingStatus", option_to_yojson db_server_patching_status_to_yojson x.patching_status);
      ( "estimatedPatchDuration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.estimated_patch_duration );
    ]

let db_server_summary_to_yojson (x : db_server_summary) =
  assoc_to_yojson
    [
      ( "autonomousVirtualMachineIds",
        option_to_yojson string_list_to_yojson x.autonomous_virtual_machine_ids );
      ("autonomousVmClusterIds", option_to_yojson string_list_to_yojson x.autonomous_vm_cluster_ids);
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ("vmClusterIds", option_to_yojson string_list_to_yojson x.vm_cluster_ids);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "maxMemoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_memory_in_g_bs );
      ( "maxDbNodeStorageInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_db_node_storage_in_g_bs );
      ( "maxCpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_cpu_count );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "exadataInfrastructureId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.exadata_infrastructure_id );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "dbServerPatchingDetails",
        option_to_yojson db_server_patching_details_to_yojson x.db_server_patching_details );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ("dbServerId", option_to_yojson resource_id_to_yojson x.db_server_id);
    ]

let db_server_list_to_yojson tree = list_to_yojson db_server_summary_to_yojson tree

let list_db_servers_output_to_yojson (x : list_db_servers_output) =
  assoc_to_yojson
    [
      ("dbServers", Some (db_server_list_to_yojson x.db_servers));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_db_servers_input_to_yojson (x : list_db_servers_input) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
    ]

let db_node_maintenance_type_to_yojson (x : db_node_maintenance_type) =
  match x with VMDB_REBOOT_MIGRATION -> `String "VMDB_REBOOT_MIGRATION"

let db_node_summary_to_yojson (x : db_node_summary) =
  assoc_to_yojson
    [
      ("vnicId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vnic_id);
      ( "vnic2Id",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vnic2_id );
      ( "totalCpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_cpu_core_count );
      ( "timeMaintenanceWindowStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_maintenance_window_start );
      ( "timeMaintenanceWindowEnd",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_maintenance_window_end );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "softwareStorageSizeInGB",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.software_storage_size_in_g_b );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ("maintenanceType", option_to_yojson db_node_maintenance_type_to_yojson x.maintenance_type);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ( "hostIpId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.host_ip_id );
      ( "faultDomain",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.fault_domain );
      ( "dbSystemId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_system_id );
      ("dbServerId", option_to_yojson resource_id_to_yojson x.db_server_id);
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "backupVnicId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_vnic_id );
      ( "backupVnic2Id",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_vnic2_id
      );
      ( "backupIpId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_ip_id );
      ( "additionalDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.additional_details );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson db_node_resource_status_to_yojson x.status);
      ("dbNodeArn", option_to_yojson resource_arn_to_yojson x.db_node_arn);
      ("dbNodeId", option_to_yojson resource_id_to_yojson x.db_node_id);
    ]

let db_node_list_to_yojson tree = list_to_yojson db_node_summary_to_yojson tree

let list_db_nodes_output_to_yojson (x : list_db_nodes_output) =
  assoc_to_yojson
    [
      ("dbNodes", Some (db_node_list_to_yojson x.db_nodes));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_db_nodes_input_to_yojson (x : list_db_nodes_input) =
  assoc_to_yojson
    [
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let data_collection_options_to_yojson (x : data_collection_options) =
  assoc_to_yojson
    [
      ( "isIncidentLogsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_incident_logs_enabled );
      ( "isHealthMonitoringEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_health_monitoring_enabled );
      ( "isDiagnosticsEventsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_diagnostics_events_enabled );
    ]

let disk_redundancy_to_yojson (x : disk_redundancy) =
  match x with NORMAL -> `String "NORMAL" | HIGH -> `String "HIGH"

let db_iorm_config_to_yojson (x : db_iorm_config) =
  assoc_to_yojson
    [
      ("share", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.share);
      ( "flashCacheLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.flash_cache_limit
      );
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
    ]

let db_iorm_config_list_to_yojson tree = list_to_yojson db_iorm_config_to_yojson tree

let iorm_lifecycle_state_to_yojson (x : iorm_lifecycle_state) =
  match x with
  | UPDATING -> `String "UPDATING"
  | FAILED -> `String "FAILED"
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"

let exadata_iorm_config_to_yojson (x : exadata_iorm_config) =
  assoc_to_yojson
    [
      ("objective", option_to_yojson objective_to_yojson x.objective);
      ("lifecycleState", option_to_yojson iorm_lifecycle_state_to_yojson x.lifecycle_state);
      ( "lifecycleDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.lifecycle_details
      );
      ("dbPlans", option_to_yojson db_iorm_config_list_to_yojson x.db_plans);
    ]

let iam_role_status_to_yojson (x : iam_role_status) =
  match x with
  | UNKNOWN -> `String "UNKNOWN"
  | PARTIALLY_CONNECTED -> `String "PARTIALLY_CONNECTED"
  | DISCONNECTED -> `String "DISCONNECTED"
  | CONNECTED -> `String "CONNECTED"
  | FAILED -> `String "FAILED"
  | DISASSOCIATING -> `String "DISASSOCIATING"
  | ASSOCIATING -> `String "ASSOCIATING"

let iam_role_to_yojson (x : iam_role) =
  assoc_to_yojson
    [
      ("awsIntegration", option_to_yojson supported_aws_integration_to_yojson x.aws_integration);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson iam_role_status_to_yojson x.status);
      ("iamRoleArn", option_to_yojson role_arn_to_yojson x.iam_role_arn);
    ]

let iam_role_list_to_yojson tree = list_to_yojson iam_role_to_yojson tree

let cloud_vm_cluster_summary_to_yojson (x : cloud_vm_cluster_summary) =
  assoc_to_yojson
    [
      ("iamRoles", option_to_yojson iam_role_list_to_yojson x.iam_roles);
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
      ("vipIds", option_to_yojson string_list_to_yojson x.vip_ids);
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "systemVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.system_version );
      ( "storageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.storage_size_in_g_bs );
      ("sshPublicKeys", option_to_yojson sensitive_string_list_to_yojson x.ssh_public_keys);
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ("scanIpIds", option_to_yojson string_list_to_yojson x.scan_ip_ids);
      ( "scanDnsRecordId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scan_dns_record_id );
      ( "scanDnsName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.scan_dns_name );
      ("domain", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain);
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "nodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.node_count );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "listenerPort",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.listener_port );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "lastUpdateHistoryEntryId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_update_history_entry_id );
      ( "isSparseDiskgroupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_sparse_diskgroup_enabled );
      ( "isLocalBackupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_backup_enabled );
      ("iormConfigCache", option_to_yojson exadata_iorm_config_to_yojson x.iorm_config_cache);
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ( "giVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.gi_version );
      ("diskRedundancy", option_to_yojson disk_redundancy_to_yojson x.disk_redundancy);
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dataCollectionOptions",
        option_to_yojson data_collection_options_to_yojson x.data_collection_options );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "clusterName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_name );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson resource_arn_to_yojson x.cloud_exadata_infrastructure_arn );
      ( "cloudExadataInfrastructureId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_exadata_infrastructure_id );
      ( "cloudVmClusterArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_vm_cluster_arn );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
    ]

let cloud_vm_cluster_list_to_yojson tree = list_to_yojson cloud_vm_cluster_summary_to_yojson tree

let list_cloud_vm_clusters_output_to_yojson (x : list_cloud_vm_clusters_output) =
  assoc_to_yojson
    [
      ("cloudVmClusters", Some (cloud_vm_cluster_list_to_yojson x.cloud_vm_clusters));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_cloud_vm_clusters_input_to_yojson (x : list_cloud_vm_clusters_input) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        option_to_yojson resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let cloud_exadata_infrastructure_summary_to_yojson (x : cloud_exadata_infrastructure_summary) =
  assoc_to_yojson
    [
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "storageServerType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.storage_server_type );
      ( "databaseServerType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.database_server_type );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "totalStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_storage_size_in_g_bs );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "storageServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.storage_server_version );
      ( "storageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.storage_count );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "nextMaintenanceRunId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.next_maintenance_run_id );
      ( "monthlyStorageServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_storage_server_version );
      ( "monthlyDbServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_db_server_version );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "maxMemoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_memory_in_g_bs );
      ( "maxDbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_db_node_storage_size_in_g_bs );
      ( "maxDataStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.max_data_storage_in_t_bs );
      ( "maxCpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_cpu_count );
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "lastMaintenanceRunId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_maintenance_run_id );
      ( "dbServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_server_version
      );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "customerContactsToSendToOCI",
        option_to_yojson customer_contacts_to_yojson x.customer_contacts_to_send_to_oc_i );
      ( "cpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_count );
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.compute_count );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "availableStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_storage_size_in_g_bs );
      ( "additionalStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.additional_storage_count );
      ( "activatedStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.activated_storage_count );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_exadata_infrastructure_arn );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
    ]

let cloud_exadata_infrastructure_list_to_yojson tree =
  list_to_yojson cloud_exadata_infrastructure_summary_to_yojson tree

let list_cloud_exadata_infrastructures_output_to_yojson
    (x : list_cloud_exadata_infrastructures_output) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructures",
        Some (cloud_exadata_infrastructure_list_to_yojson x.cloud_exadata_infrastructures) );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_cloud_exadata_infrastructures_input_to_yojson
    (x : list_cloud_exadata_infrastructures_input) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let cloud_autonomous_vm_cluster_summary_to_yojson (x : cloud_autonomous_vm_cluster_summary) =
  assoc_to_yojson
    [
      ("iamRoles", option_to_yojson iam_role_list_to_yojson x.iam_roles);
      ( "totalContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_container_databases );
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ( "timeOrdsCertificateExpires",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_ords_certificate_expires );
      ( "timeDatabaseSslCertificateExpires",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_database_ssl_certificate_expires );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "scanListenerPortTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_tls );
      ( "scanListenerPortNonTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_non_tls );
      ( "reservedCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.reserved_cpus );
      ( "reclaimableCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.reclaimable_cpus
      );
      ( "provisionedCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.provisioned_cpus
      );
      ( "provisionedAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.provisioned_autonomous_container_databases );
      ( "provisionableAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.provisionable_autonomous_container_databases );
      ( "nonProvisionableAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.non_provisionable_autonomous_container_databases );
      ( "nodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.node_count );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "memoryPerOracleComputeUnitInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_per_oracle_compute_unit_in_g_bs );
      ( "maxAcdsLowestScaledValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_acds_lowest_scaled_value );
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "isMtlsEnabledVmCluster",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_enabled_vm_cluster );
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ( "exadataStorageInTBsLowestScaledValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.exadata_storage_in_t_bs_lowest_scaled_value );
      ("domain", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_g_bs );
      ( "cpuPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.cpu_percentage );
      ( "cpuCoreCountPerNode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.cpu_core_count_per_node );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "availableCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.available_cpus );
      ( "availableContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_container_databases );
      ( "availableAutonomousDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.available_autonomous_data_storage_size_in_t_bs );
      ( "autonomousDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.autonomous_data_storage_size_in_t_bs );
      ( "autonomousDataStoragePercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
          x.autonomous_data_storage_percentage );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson resource_arn_to_yojson x.cloud_exadata_infrastructure_arn );
      ( "cloudExadataInfrastructureId",
        option_to_yojson resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
      ( "cloudAutonomousVmClusterArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_autonomous_vm_cluster_arn );
      ("cloudAutonomousVmClusterId", Some (resource_id_to_yojson x.cloud_autonomous_vm_cluster_id));
    ]

let cloud_autonomous_vm_cluster_list_to_yojson tree =
  list_to_yojson cloud_autonomous_vm_cluster_summary_to_yojson tree

let list_cloud_autonomous_vm_clusters_output_to_yojson
    (x : list_cloud_autonomous_vm_clusters_output) =
  assoc_to_yojson
    [
      ( "cloudAutonomousVmClusters",
        Some (cloud_autonomous_vm_cluster_list_to_yojson x.cloud_autonomous_vm_clusters) );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_cloud_autonomous_vm_clusters_input_to_yojson (x : list_cloud_autonomous_vm_clusters_input)
    =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        option_to_yojson resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let autonomous_virtual_machine_summary_to_yojson (x : autonomous_virtual_machine_summary) =
  assoc_to_yojson
    [
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "cloudAutonomousVmClusterId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_autonomous_vm_cluster_id );
      ( "clientIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_ip_address
      );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "dbServerDisplayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.db_server_display_name );
      ("dbServerId", option_to_yojson resource_id_to_yojson x.db_server_id);
      ("vmName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vm_name);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "autonomousVirtualMachineId",
        option_to_yojson resource_id_to_yojson x.autonomous_virtual_machine_id );
    ]

let autonomous_virtual_machine_list_to_yojson tree =
  list_to_yojson autonomous_virtual_machine_summary_to_yojson tree

let list_autonomous_virtual_machines_output_to_yojson (x : list_autonomous_virtual_machines_output)
    =
  assoc_to_yojson
    [
      ( "autonomousVirtualMachines",
        Some (autonomous_virtual_machine_list_to_yojson x.autonomous_virtual_machines) );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_autonomous_virtual_machines_input_to_yojson (x : list_autonomous_virtual_machines_input) =
  assoc_to_yojson
    [
      ("cloudAutonomousVmClusterId", Some (resource_id_to_yojson x.cloud_autonomous_vm_cluster_id));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let database_type_to_yojson (x : database_type) =
  match x with CLONE -> `String "CLONE" | REGULAR -> `String "REGULAR"

let database_connection_string_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let database_connection_string_profile_to_yojson (x : database_connection_string_profile) =
  assoc_to_yojson
    [
      ("value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value);
      ( "tlsAuthentication",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.tls_authentication );
      ( "syntaxFormat",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.syntax_format );
      ( "sessionMode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.session_mode );
      ( "protocol",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.protocol );
      ( "isRegional",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_regional );
      ( "hostFormat",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.host_format );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "consumerGroup",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.consumer_group );
    ]

let database_connection_string_profile_list_to_yojson tree =
  list_to_yojson database_connection_string_profile_to_yojson tree

let autonomous_database_connection_strings_to_yojson (x : autonomous_database_connection_strings) =
  assoc_to_yojson
    [
      ("profiles", option_to_yojson database_connection_string_profile_list_to_yojson x.profiles);
      ("low", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.low);
      ("medium", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.medium);
      ("high", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.high);
      ( "dedicated",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.dedicated );
      ( "allConnectionStrings",
        option_to_yojson database_connection_string_map_to_yojson x.all_connection_strings );
    ]

let autonomous_database_apex_to_yojson (x : autonomous_database_apex) =
  assoc_to_yojson
    [
      ( "ordsVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ords_version );
      ( "apexVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.apex_version );
    ]

let database_standby_summary_to_yojson (x : database_standby_summary) =
  assoc_to_yojson
    [
      ( "timeMaintenanceEnd",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_end );
      ( "timeMaintenanceBegin",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_begin );
      ( "timeDisasterRecoveryRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_disaster_recovery_role_changed );
      ( "timeDataGuardRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_data_guard_role_changed );
      ( "maintenanceTargetComponent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.maintenance_target_component );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "lagTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.lag_time_in_seconds );
      ( "availabilityDomain",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_domain );
    ]

let data_safe_status_to_yojson (x : data_safe_status) =
  match x with
  | FAILED -> `String "FAILED"
  | NOT_REGISTERED -> `String "NOT_REGISTERED"
  | DEREGISTERING -> `String "DEREGISTERING"
  | REGISTERED -> `String "REGISTERED"
  | REGISTERING -> `String "REGISTERING"

let database_management_status_to_yojson (x : database_management_status) =
  match x with
  | FAILED_DISABLING -> `String "FAILED_DISABLING"
  | FAILED_ENABLING -> `String "FAILED_ENABLING"
  | NOT_ENABLED -> `String "NOT_ENABLED"
  | DISABLING -> `String "DISABLING"
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"

let autonomous_database_connection_urls_to_yojson (x : autonomous_database_connection_urls) =
  assoc_to_yojson
    [
      ( "sqlDevWebUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sql_dev_web_url
      );
      ( "spatialStudioUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.spatial_studio_url );
      ( "ordsUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ords_url );
      ( "mongoDbUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.mongo_db_url );
      ( "machineLearningUserManagementUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.machine_learning_user_management_url );
      ( "machineLearningNotebookUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.machine_learning_notebook_url );
      ( "graphStudioUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.graph_studio_url
      );
      ( "databaseTransformsUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.database_transforms_url );
      ( "apexUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.apex_url );
    ]

let data_guard_role_to_yojson (x : data_guard_role) =
  match x with
  | SNAPSHOT_STANDBY -> `String "SNAPSHOT_STANDBY"
  | BACKUP_COPY -> `String "BACKUP_COPY"
  | DISABLED_STANDBY -> `String "DISABLED_STANDBY"
  | STANDBY -> `String "STANDBY"
  | PRIMARY -> `String "PRIMARY"

let disaster_recovery_configuration_to_yojson (x : disaster_recovery_configuration) =
  assoc_to_yojson
    [
      ( "timeSnapshotStandbyEnabledTill",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_snapshot_standby_enabled_till );
      ( "isSnapshotStandby",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_snapshot_standby );
      ( "isReplicateAutomaticBackups",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_replicate_automatic_backups );
      ( "disasterRecoveryType",
        option_to_yojson disaster_recovery_type_to_yojson x.disaster_recovery_type );
    ]

let encryption_key_provider_to_yojson (x : encryption_key_provider) =
  match x with
  | OCI -> `String "OCI"
  | OKV -> `String "OKV"
  | AWS_KMS -> `String "AWS_KMS"
  | ORACLE_MANAGED -> `String "ORACLE_MANAGED"

let aws_encryption_key_configuration_to_yojson (x : aws_encryption_key_configuration) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson kms_key_id_or_arn_to_yojson x.kms_key_id);
      ("externalIdType", option_to_yojson external_id_type_to_yojson x.external_id_type);
      ("iamRoleArn", option_to_yojson role_arn_to_yojson x.iam_role_arn);
    ]

let encryption_key_configuration_to_yojson (x : encryption_key_configuration) =
  match x with
  | OkvEncryptionKey arg ->
      assoc_to_yojson
        [ ("okvEncryptionKey", Some (okv_encryption_key_configuration_to_yojson arg)) ]
  | OciEncryptionKey arg ->
      assoc_to_yojson
        [ ("ociEncryptionKey", Some (oci_encryption_key_configuration_to_yojson arg)) ]
  | AwsEncryptionKey arg ->
      assoc_to_yojson
        [ ("awsEncryptionKey", Some (aws_encryption_key_configuration_to_yojson arg)) ]

let encryption_summary_to_yojson (x : encryption_summary) =
  assoc_to_yojson
    [
      ( "encryptionKeyConfiguration",
        option_to_yojson encryption_key_configuration_to_yojson x.encryption_key_configuration );
      ( "encryptionKeyProvider",
        option_to_yojson encryption_key_provider_to_yojson x.encryption_key_provider );
    ]

let autonomous_database_summary_to_yojson (x : autonomous_database_summary) =
  assoc_to_yojson
    [
      ( "timeUndeleted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_undeleted );
      ( "nextLongTermBackupTimeStamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_long_term_backup_time_stamp );
      ( "timeUntilReconnectCloneEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_until_reconnect_clone_enabled );
      ( "timeDisasterRecoveryRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_disaster_recovery_role_changed );
      ( "timeReclamationOfFreeAutonomousDatabase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_reclamation_of_free_autonomous_database );
      ( "timeDeletionOfFreeAutonomousDatabase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_deletion_of_free_autonomous_database );
      ( "timeOfAutoRefreshStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_auto_refresh_start );
      ( "timeOfNextRefresh",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_next_refresh );
      ( "timeOfLastRefreshPoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_refresh_point );
      ( "timeOfLastRefresh",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_refresh );
      ( "timeOfLastFailover",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_failover );
      ( "timeOfLastSwitchover",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_switchover );
      ( "timeDataGuardRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_data_guard_role_changed );
      ( "timeLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_local_data_guard_enabled );
      ( "timeMaintenanceEnd",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_end );
      ( "timeMaintenanceBegin",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_begin );
      ( "timeOfLastBackup",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_backup );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("encryptionSummary", option_to_yojson encryption_summary_to_yojson x.encryption_summary);
      ( "resourcePoolSummary",
        option_to_yojson resource_pool_summary_to_yojson x.resource_pool_summary );
      ( "totalBackupStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.total_backup_storage_size_in_g_bs );
      ( "isBackupRetentionLocked",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_backup_retention_locked );
      ( "longTermBackupSchedule",
        option_to_yojson long_term_backup_schedule_to_yojson x.long_term_backup_schedule );
      ( "backupRetentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.backup_retention_period_in_days );
      ("cloneTableSpaceList", option_to_yojson integer_list_to_yojson x.clone_table_space_list);
      ( "isReconnectCloneEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_reconnect_clone_enabled );
      ( "autoRefreshPointLagInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_point_lag_in_seconds );
      ( "autoRefreshFrequencyInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_frequency_in_seconds );
      ("refreshableStatus", option_to_yojson refreshable_status_to_yojson x.refreshable_status);
      ("refreshableMode", option_to_yojson refreshable_mode_to_yojson x.refreshable_mode);
      ( "isRefreshableClone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_refreshable_clone );
      ( "remoteDisasterRecoveryConfiguration",
        option_to_yojson disaster_recovery_configuration_to_yojson
          x.remote_disaster_recovery_configuration );
      ( "localAdgAutoFailoverMaxDataLossLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.local_adg_auto_failover_max_data_loss_limit );
      ( "failedDataRecoveryInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.failed_data_recovery_in_seconds );
      ("peerDbIds", option_to_yojson string_list_to_yojson x.peer_db_ids);
      ("role", option_to_yojson data_guard_role_to_yojson x.role);
      ( "localDisasterRecoveryType",
        option_to_yojson disaster_recovery_type_to_yojson x.local_disaster_recovery_type );
      ( "isRemoteDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_remote_data_guard_enabled );
      ( "isLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_data_guard_enabled );
      ( "standbyAllowlistedIpsSource",
        option_to_yojson standby_allowlisted_ips_source_to_yojson x.standby_allowlisted_ips_source
      );
      ("standbyAllowlistedIps", option_to_yojson string_list_to_yojson x.standby_allowlisted_ips);
      ("allowlistedIps", option_to_yojson string_list_to_yojson x.allowlisted_ips);
      ( "privateEndpointLabel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_label );
      ( "privateEndpointIp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_ip );
      ( "privateEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.private_endpoint
      );
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ("odbNetworkId", option_to_yojson resource_id_to_yojson x.odb_network_id);
      ( "isAutoScalingForStorageEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_for_storage_enabled );
      ( "inMemoryAreaInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.in_memory_area_in_g_bs );
      ( "allocatedStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.allocated_storage_size_in_t_bs );
      ( "actualUsedDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.actual_used_data_storage_size_in_t_bs );
      ( "usedDataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.used_data_storage_size_in_g_bs );
      ( "usedDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.used_data_storage_size_in_t_bs );
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "isAutoScalingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_enabled );
      ("provisionableCpus", option_to_yojson integer_list_to_yojson x.provisionable_cpus);
      ( "memoryPerOracleComputeUnitInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_per_oracle_compute_unit_in_g_bs );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.compute_count );
      ( "resourcePoolLeaderId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.resource_pool_leader_id );
      ( "scheduledOperations",
        option_to_yojson scheduled_operation_details_list_to_yojson x.scheduled_operations );
      ("dbToolsDetails", option_to_yojson database_tool_list_to_yojson x.db_tools_details);
      ( "connectionUrls",
        option_to_yojson autonomous_database_connection_urls_to_yojson x.connection_urls );
      ( "maintenanceTargetComponent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.maintenance_target_component );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "operationsInsightsStatus",
        option_to_yojson operations_insights_status_to_yojson x.operations_insights_status );
      ( "databaseManagementStatus",
        option_to_yojson database_management_status_to_yojson x.database_management_status );
      ("dataSafeStatus", option_to_yojson data_safe_status_to_yojson x.data_safe_status);
      ("localStandbyDb", option_to_yojson database_standby_summary_to_yojson x.local_standby_db);
      ("standbyDb", option_to_yojson database_standby_summary_to_yojson x.standby_db);
      ("apexDetails", option_to_yojson autonomous_database_apex_to_yojson x.apex_details);
      ("customerContacts", option_to_yojson customer_contacts_to_yojson x.customer_contacts);
      ( "sqlWebDeveloperUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.sql_web_developer_url );
      ( "serviceConsoleUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.service_console_url );
      ( "connectionStringDetails",
        option_to_yojson autonomous_database_connection_strings_to_yojson
          x.connection_string_details );
      ( "byolComputeCountLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.byol_compute_count_limit );
      ( "availableUpgradeVersions",
        option_to_yojson string_list_to_yojson x.available_upgrade_versions );
      ( "netServicesArchitecture",
        option_to_yojson net_services_architecture_to_yojson x.net_services_architecture );
      ( "autonomousMaintenanceScheduleType",
        option_to_yojson autonomous_maintenance_schedule_type_to_yojson
          x.autonomous_maintenance_schedule_type );
      ( "isMtlsConnectionRequired",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_connection_required );
      ("permissionLevel", option_to_yojson permission_level_to_yojson x.permission_level);
      ("openMode", option_to_yojson open_mode_to_yojson x.open_mode);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("databaseEdition", option_to_yojson database_edition_to_yojson x.database_edition);
      ( "ncharacterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ncharacter_set );
      ( "characterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.character_set );
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ("databaseType", option_to_yojson database_type_to_yojson x.database_type);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "sourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_id );
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("autonomousDatabaseArn", option_to_yojson resource_arn_to_yojson x.autonomous_database_arn);
      ( "autonomousDatabaseId",
        option_to_yojson resource_id_or_arn_to_yojson x.autonomous_database_id );
    ]

let autonomous_database_list_to_yojson tree =
  list_to_yojson autonomous_database_summary_to_yojson tree

let list_autonomous_databases_output_to_yojson (x : list_autonomous_databases_output) =
  assoc_to_yojson
    [
      ("autonomousDatabases", Some (autonomous_database_list_to_yojson x.autonomous_databases));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_autonomous_databases_input_to_yojson (x : list_autonomous_databases_input) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let autonomous_database_peer_summary_to_yojson (x : autonomous_database_peer_summary) =
  assoc_to_yojson
    [
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("autonomousDatabaseArn", option_to_yojson resource_arn_to_yojson x.autonomous_database_arn);
      ("autonomousDatabaseId", option_to_yojson resource_id_to_yojson x.autonomous_database_id);
    ]

let autonomous_database_peer_list_to_yojson tree =
  list_to_yojson autonomous_database_peer_summary_to_yojson tree

let list_autonomous_database_peers_output_to_yojson (x : list_autonomous_database_peers_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabasePeers",
        Some (autonomous_database_peer_list_to_yojson x.autonomous_database_peers) );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_autonomous_database_peers_input_to_yojson (x : list_autonomous_database_peers_input) =
  assoc_to_yojson
    [
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_autonomous_database_clones_output_to_yojson (x : list_autonomous_database_clones_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseClones",
        Some (autonomous_database_list_to_yojson x.autonomous_database_clones) );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_autonomous_database_clones_input_to_yojson (x : list_autonomous_database_clones_input) =
  assoc_to_yojson
    [
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let autonomous_database_backup_status_to_yojson (x : autonomous_database_backup_status) =
  match x with
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"

let autonomous_database_backup_type_to_yojson (x : autonomous_database_backup_type) =
  match x with
  | ROLL_FORWARD_IMAGE_COPY -> `String "ROLL_FORWARD_IMAGE_COPY"
  | CUMULATIVE_INCREMENTAL -> `String "CUMULATIVE_INCREMENTAL"
  | VIRTUAL_FULL -> `String "VIRTUAL_FULL"
  | LONGTERM -> `String "LONGTERM"
  | FULL -> `String "FULL"
  | INCREMENTAL -> `String "INCREMENTAL"

let autonomous_database_backup_summary_to_yojson (x : autonomous_database_backup_summary) =
  assoc_to_yojson
    [
      ("type", option_to_yojson autonomous_database_backup_type_to_yojson x.type_);
      ( "timeEnded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_ended );
      ( "timeStarted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_started );
      ( "timeAvailableTill",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_available_till );
      ( "sizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.size_in_t_bs );
      ( "retentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retention_period_in_days );
      ( "isAutomatic",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_automatic );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_backup_status_to_yojson x.status);
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("autonomousDatabaseId", option_to_yojson resource_id_to_yojson x.autonomous_database_id);
      ( "autonomousDatabaseBackupArn",
        option_to_yojson resource_arn_to_yojson x.autonomous_database_backup_arn );
      ( "autonomousDatabaseBackupId",
        option_to_yojson resource_id_to_yojson x.autonomous_database_backup_id );
    ]

let autonomous_database_backup_list_to_yojson tree =
  list_to_yojson autonomous_database_backup_summary_to_yojson tree

let list_autonomous_database_backups_output_to_yojson (x : list_autonomous_database_backups_output)
    =
  assoc_to_yojson
    [
      ( "autonomousDatabaseBackups",
        Some (autonomous_database_backup_list_to_yojson x.autonomous_database_backups) );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_autonomous_database_backups_input_to_yojson (x : list_autonomous_database_backups_input) =
  assoc_to_yojson
    [
      ("type", option_to_yojson autonomous_database_backup_type_to_yojson x.type_);
      ("status", option_to_yojson autonomous_database_backup_status_to_yojson x.status);
      ("autonomousDatabaseId", Some (resource_id_to_yojson x.autonomous_database_id));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let hostname_to_yojson = string_to_yojson

let get_odb_peering_connection_output_to_yojson (x : get_odb_peering_connection_output) =
  assoc_to_yojson
    [
      ( "odbPeeringConnection",
        option_to_yojson odb_peering_connection_to_yojson x.odb_peering_connection );
    ]

let get_odb_peering_connection_input_to_yojson (x : get_odb_peering_connection_input) =
  assoc_to_yojson
    [ ("odbPeeringConnectionId", Some (resource_id_or_arn_to_yojson x.odb_peering_connection_id)) ]

let get_odb_network_output_to_yojson (x : get_odb_network_output) =
  assoc_to_yojson [ ("odbNetwork", option_to_yojson odb_network_to_yojson x.odb_network) ]

let get_odb_network_input_to_yojson (x : get_odb_network_input) =
  assoc_to_yojson [ ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id)) ]

let db_server_to_yojson (x : db_server) =
  assoc_to_yojson
    [
      ( "autonomousVirtualMachineIds",
        option_to_yojson string_list_to_yojson x.autonomous_virtual_machine_ids );
      ("autonomousVmClusterIds", option_to_yojson string_list_to_yojson x.autonomous_vm_cluster_ids);
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ("vmClusterIds", option_to_yojson string_list_to_yojson x.vm_cluster_ids);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "maxMemoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_memory_in_g_bs );
      ( "maxDbNodeStorageInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_db_node_storage_in_g_bs );
      ( "maxCpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_cpu_count );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "exadataInfrastructureId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.exadata_infrastructure_id );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "dbServerPatchingDetails",
        option_to_yojson db_server_patching_details_to_yojson x.db_server_patching_details );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ("dbServerId", option_to_yojson resource_id_to_yojson x.db_server_id);
    ]

let get_db_server_output_to_yojson (x : get_db_server_output) =
  assoc_to_yojson [ ("dbServer", option_to_yojson db_server_to_yojson x.db_server) ]

let get_db_server_input_to_yojson (x : get_db_server_input) =
  assoc_to_yojson
    [
      ("dbServerId", Some (resource_id_to_yojson x.db_server_id));
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
    ]

let db_node_to_yojson (x : db_node) =
  assoc_to_yojson
    [
      ( "floatingIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.floating_ip_address );
      ( "privateIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_ip_address );
      ("vnicId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vnic_id);
      ( "vnic2Id",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vnic2_id );
      ( "totalCpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_cpu_core_count );
      ( "timeMaintenanceWindowStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_maintenance_window_start );
      ( "timeMaintenanceWindowEnd",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_maintenance_window_end );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "softwareStorageSizeInGB",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.software_storage_size_in_g_b );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ("maintenanceType", option_to_yojson db_node_maintenance_type_to_yojson x.maintenance_type);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ( "hostIpId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.host_ip_id );
      ( "faultDomain",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.fault_domain );
      ( "dbSystemId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_system_id );
      ("dbServerId", option_to_yojson resource_id_to_yojson x.db_server_id);
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "backupVnicId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_vnic_id );
      ( "backupVnic2Id",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_vnic2_id
      );
      ( "backupIpId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_ip_id );
      ( "additionalDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.additional_details );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson db_node_resource_status_to_yojson x.status);
      ("dbNodeArn", option_to_yojson resource_arn_to_yojson x.db_node_arn);
      ("dbNodeId", option_to_yojson resource_id_to_yojson x.db_node_id);
    ]

let get_db_node_output_to_yojson (x : get_db_node_output) =
  assoc_to_yojson [ ("dbNode", option_to_yojson db_node_to_yojson x.db_node) ]

let get_db_node_input_to_yojson (x : get_db_node_input) =
  assoc_to_yojson
    [
      ("dbNodeId", Some (resource_id_to_yojson x.db_node_id));
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
    ]

let cloud_vm_cluster_to_yojson (x : cloud_vm_cluster) =
  assoc_to_yojson
    [
      ("iamRoles", option_to_yojson iam_role_list_to_yojson x.iam_roles);
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
      ("vipIds", option_to_yojson string_list_to_yojson x.vip_ids);
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "systemVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.system_version );
      ( "storageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.storage_size_in_g_bs );
      ("sshPublicKeys", option_to_yojson sensitive_string_list_to_yojson x.ssh_public_keys);
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ("scanIpIds", option_to_yojson string_list_to_yojson x.scan_ip_ids);
      ( "scanDnsRecordId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scan_dns_record_id );
      ( "scanDnsName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.scan_dns_name );
      ("domain", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain);
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "nodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.node_count );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "listenerPort",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.listener_port );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "lastUpdateHistoryEntryId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_update_history_entry_id );
      ( "isSparseDiskgroupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_sparse_diskgroup_enabled );
      ( "isLocalBackupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_backup_enabled );
      ("iormConfigCache", option_to_yojson exadata_iorm_config_to_yojson x.iorm_config_cache);
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ( "giVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.gi_version );
      ("diskRedundancy", option_to_yojson disk_redundancy_to_yojson x.disk_redundancy);
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dataCollectionOptions",
        option_to_yojson data_collection_options_to_yojson x.data_collection_options );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "clusterName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_name );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson resource_arn_to_yojson x.cloud_exadata_infrastructure_arn );
      ( "cloudExadataInfrastructureId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_exadata_infrastructure_id );
      ( "cloudVmClusterArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_vm_cluster_arn );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
    ]

let get_cloud_vm_cluster_output_to_yojson (x : get_cloud_vm_cluster_output) =
  assoc_to_yojson
    [ ("cloudVmCluster", option_to_yojson cloud_vm_cluster_to_yojson x.cloud_vm_cluster) ]

let get_cloud_vm_cluster_input_to_yojson (x : get_cloud_vm_cluster_input) =
  assoc_to_yojson [ ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id)) ]

let cloud_autonomous_vm_cluster_resource_details_to_yojson
    (x : cloud_autonomous_vm_cluster_resource_details) =
  assoc_to_yojson
    [
      ( "unallocatedAdbStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.unallocated_adb_storage_in_t_bs );
      ( "cloudAutonomousVmClusterId",
        option_to_yojson resource_id_to_yojson x.cloud_autonomous_vm_cluster_id );
    ]

let cloud_autonomous_vm_cluster_resource_details_list_to_yojson tree =
  list_to_yojson cloud_autonomous_vm_cluster_resource_details_to_yojson tree

let cloud_exadata_infrastructure_unallocated_resources_to_yojson
    (x : cloud_exadata_infrastructure_unallocated_resources) =
  assoc_to_yojson
    [
      ("ocpus", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.ocpus);
      ( "memoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.memory_in_g_bs );
      ( "localStorageInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.local_storage_in_g_bs );
      ( "cloudExadataInfrastructureId",
        option_to_yojson resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id );
      ( "exadataStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.exadata_storage_in_t_bs );
      ( "cloudExadataInfrastructureDisplayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_exadata_infrastructure_display_name );
      ( "cloudAutonomousVmClusters",
        option_to_yojson cloud_autonomous_vm_cluster_resource_details_list_to_yojson
          x.cloud_autonomous_vm_clusters );
    ]

let get_cloud_exadata_infrastructure_unallocated_resources_output_to_yojson
    (x : get_cloud_exadata_infrastructure_unallocated_resources_output) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureUnallocatedResources",
        option_to_yojson cloud_exadata_infrastructure_unallocated_resources_to_yojson
          x.cloud_exadata_infrastructure_unallocated_resources );
    ]

let get_cloud_exadata_infrastructure_unallocated_resources_input_to_yojson
    (x : get_cloud_exadata_infrastructure_unallocated_resources_input) =
  assoc_to_yojson
    [
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
    ]

let cloud_exadata_infrastructure_to_yojson (x : cloud_exadata_infrastructure) =
  assoc_to_yojson
    [
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "storageServerType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.storage_server_type );
      ( "databaseServerType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.database_server_type );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "totalStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_storage_size_in_g_bs );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "storageServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.storage_server_version );
      ( "storageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.storage_count );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "nextMaintenanceRunId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.next_maintenance_run_id );
      ( "monthlyStorageServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_storage_server_version );
      ( "monthlyDbServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_db_server_version );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "maxMemoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_memory_in_g_bs );
      ( "maxDbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_db_node_storage_size_in_g_bs );
      ( "maxDataStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.max_data_storage_in_t_bs );
      ( "maxCpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_cpu_count );
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "lastMaintenanceRunId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_maintenance_run_id );
      ( "dbServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_server_version
      );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "customerContactsToSendToOCI",
        option_to_yojson customer_contacts_to_yojson x.customer_contacts_to_send_to_oc_i );
      ( "cpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_count );
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.compute_count );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "availableStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_storage_size_in_g_bs );
      ( "additionalStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.additional_storage_count );
      ( "activatedStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.activated_storage_count );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_exadata_infrastructure_arn );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
    ]

let get_cloud_exadata_infrastructure_output_to_yojson (x : get_cloud_exadata_infrastructure_output)
    =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructure",
        option_to_yojson cloud_exadata_infrastructure_to_yojson x.cloud_exadata_infrastructure );
    ]

let get_cloud_exadata_infrastructure_input_to_yojson (x : get_cloud_exadata_infrastructure_input) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
    ]

let cloud_autonomous_vm_cluster_to_yojson (x : cloud_autonomous_vm_cluster) =
  assoc_to_yojson
    [
      ("iamRoles", option_to_yojson iam_role_list_to_yojson x.iam_roles);
      ( "totalContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_container_databases );
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ( "timeOrdsCertificateExpires",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_ords_certificate_expires );
      ( "timeDatabaseSslCertificateExpires",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_database_ssl_certificate_expires );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "scanListenerPortTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_tls );
      ( "scanListenerPortNonTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_non_tls );
      ( "reservedCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.reserved_cpus );
      ( "reclaimableCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.reclaimable_cpus
      );
      ( "provisionedCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.provisioned_cpus
      );
      ( "provisionedAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.provisioned_autonomous_container_databases );
      ( "provisionableAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.provisionable_autonomous_container_databases );
      ( "nonProvisionableAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.non_provisionable_autonomous_container_databases );
      ( "nodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.node_count );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "memoryPerOracleComputeUnitInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_per_oracle_compute_unit_in_g_bs );
      ( "maxAcdsLowestScaledValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_acds_lowest_scaled_value );
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "isMtlsEnabledVmCluster",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_enabled_vm_cluster );
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ( "exadataStorageInTBsLowestScaledValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.exadata_storage_in_t_bs_lowest_scaled_value );
      ("domain", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_g_bs );
      ( "cpuPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.cpu_percentage );
      ( "cpuCoreCountPerNode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.cpu_core_count_per_node );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "availableCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.available_cpus );
      ( "availableContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_container_databases );
      ( "availableAutonomousDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.available_autonomous_data_storage_size_in_t_bs );
      ( "autonomousDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.autonomous_data_storage_size_in_t_bs );
      ( "autonomousDataStoragePercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
          x.autonomous_data_storage_percentage );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson resource_arn_to_yojson x.cloud_exadata_infrastructure_arn );
      ( "cloudExadataInfrastructureId",
        option_to_yojson resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
      ( "cloudAutonomousVmClusterArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_autonomous_vm_cluster_arn );
      ("cloudAutonomousVmClusterId", Some (resource_id_to_yojson x.cloud_autonomous_vm_cluster_id));
    ]

let get_cloud_autonomous_vm_cluster_output_to_yojson (x : get_cloud_autonomous_vm_cluster_output) =
  assoc_to_yojson
    [
      ( "cloudAutonomousVmCluster",
        option_to_yojson cloud_autonomous_vm_cluster_to_yojson x.cloud_autonomous_vm_cluster );
    ]

let get_cloud_autonomous_vm_cluster_input_to_yojson (x : get_cloud_autonomous_vm_cluster_input) =
  assoc_to_yojson
    [
      ("cloudAutonomousVmClusterId", Some (resource_id_to_yojson x.cloud_autonomous_vm_cluster_id));
    ]

let autonomous_database_wallet_status_to_yojson (x : autonomous_database_wallet_status) =
  match x with UPDATING -> `String "UPDATING" | ACTIVE -> `String "ACTIVE"

let autonomous_database_wallet_details_to_yojson (x : autonomous_database_wallet_details) =
  assoc_to_yojson
    [
      ( "timeRotated",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_rotated );
      ("status", option_to_yojson autonomous_database_wallet_status_to_yojson x.status);
    ]

let get_autonomous_database_wallet_details_output_to_yojson
    (x : get_autonomous_database_wallet_details_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseWalletDetails",
        Some (autonomous_database_wallet_details_to_yojson x.autonomous_database_wallet_details) );
    ]

let get_autonomous_database_wallet_details_input_to_yojson
    (x : get_autonomous_database_wallet_details_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id)) ]

let autonomous_database_to_yojson (x : autonomous_database) =
  assoc_to_yojson
    [
      ( "timeUndeleted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_undeleted );
      ( "nextLongTermBackupTimeStamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_long_term_backup_time_stamp );
      ( "timeUntilReconnectCloneEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_until_reconnect_clone_enabled );
      ( "timeDisasterRecoveryRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_disaster_recovery_role_changed );
      ( "timeReclamationOfFreeAutonomousDatabase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_reclamation_of_free_autonomous_database );
      ( "timeDeletionOfFreeAutonomousDatabase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_deletion_of_free_autonomous_database );
      ( "timeOfAutoRefreshStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_auto_refresh_start );
      ( "timeOfNextRefresh",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_next_refresh );
      ( "timeOfLastRefreshPoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_refresh_point );
      ( "timeOfLastRefresh",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_refresh );
      ( "timeOfLastFailover",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_failover );
      ( "timeOfLastSwitchover",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_switchover );
      ( "timeDataGuardRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_data_guard_role_changed );
      ( "timeLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_local_data_guard_enabled );
      ( "timeMaintenanceEnd",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_end );
      ( "timeMaintenanceBegin",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_begin );
      ( "timeOfLastBackup",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_backup );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("encryptionSummary", option_to_yojson encryption_summary_to_yojson x.encryption_summary);
      ( "resourcePoolSummary",
        option_to_yojson resource_pool_summary_to_yojson x.resource_pool_summary );
      ( "totalBackupStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.total_backup_storage_size_in_g_bs );
      ( "isBackupRetentionLocked",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_backup_retention_locked );
      ( "longTermBackupSchedule",
        option_to_yojson long_term_backup_schedule_to_yojson x.long_term_backup_schedule );
      ( "backupRetentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.backup_retention_period_in_days );
      ("cloneTableSpaceList", option_to_yojson integer_list_to_yojson x.clone_table_space_list);
      ( "isReconnectCloneEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_reconnect_clone_enabled );
      ( "autoRefreshPointLagInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_point_lag_in_seconds );
      ( "autoRefreshFrequencyInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_frequency_in_seconds );
      ("refreshableStatus", option_to_yojson refreshable_status_to_yojson x.refreshable_status);
      ("refreshableMode", option_to_yojson refreshable_mode_to_yojson x.refreshable_mode);
      ( "isRefreshableClone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_refreshable_clone );
      ( "remoteDisasterRecoveryConfiguration",
        option_to_yojson disaster_recovery_configuration_to_yojson
          x.remote_disaster_recovery_configuration );
      ( "localAdgAutoFailoverMaxDataLossLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.local_adg_auto_failover_max_data_loss_limit );
      ( "failedDataRecoveryInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.failed_data_recovery_in_seconds );
      ("peerDbIds", option_to_yojson string_list_to_yojson x.peer_db_ids);
      ("role", option_to_yojson data_guard_role_to_yojson x.role);
      ( "localDisasterRecoveryType",
        option_to_yojson disaster_recovery_type_to_yojson x.local_disaster_recovery_type );
      ( "isRemoteDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_remote_data_guard_enabled );
      ( "isLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_data_guard_enabled );
      ( "standbyAllowlistedIpsSource",
        option_to_yojson standby_allowlisted_ips_source_to_yojson x.standby_allowlisted_ips_source
      );
      ("standbyAllowlistedIps", option_to_yojson string_list_to_yojson x.standby_allowlisted_ips);
      ("allowlistedIps", option_to_yojson string_list_to_yojson x.allowlisted_ips);
      ( "privateEndpointLabel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_label );
      ( "privateEndpointIp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_ip );
      ( "privateEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.private_endpoint
      );
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ("odbNetworkId", option_to_yojson resource_id_to_yojson x.odb_network_id);
      ( "isAutoScalingForStorageEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_for_storage_enabled );
      ( "inMemoryAreaInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.in_memory_area_in_g_bs );
      ( "allocatedStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.allocated_storage_size_in_t_bs );
      ( "actualUsedDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.actual_used_data_storage_size_in_t_bs );
      ( "usedDataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.used_data_storage_size_in_g_bs );
      ( "usedDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.used_data_storage_size_in_t_bs );
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "isAutoScalingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_enabled );
      ("provisionableCpus", option_to_yojson integer_list_to_yojson x.provisionable_cpus);
      ( "memoryPerOracleComputeUnitInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_per_oracle_compute_unit_in_g_bs );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.compute_count );
      ( "resourcePoolLeaderId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.resource_pool_leader_id );
      ( "scheduledOperations",
        option_to_yojson scheduled_operation_details_list_to_yojson x.scheduled_operations );
      ("dbToolsDetails", option_to_yojson database_tool_list_to_yojson x.db_tools_details);
      ( "connectionUrls",
        option_to_yojson autonomous_database_connection_urls_to_yojson x.connection_urls );
      ( "maintenanceTargetComponent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.maintenance_target_component );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "operationsInsightsStatus",
        option_to_yojson operations_insights_status_to_yojson x.operations_insights_status );
      ( "databaseManagementStatus",
        option_to_yojson database_management_status_to_yojson x.database_management_status );
      ("dataSafeStatus", option_to_yojson data_safe_status_to_yojson x.data_safe_status);
      ("localStandbyDb", option_to_yojson database_standby_summary_to_yojson x.local_standby_db);
      ("standbyDb", option_to_yojson database_standby_summary_to_yojson x.standby_db);
      ("apexDetails", option_to_yojson autonomous_database_apex_to_yojson x.apex_details);
      ("customerContacts", option_to_yojson customer_contacts_to_yojson x.customer_contacts);
      ( "sqlWebDeveloperUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.sql_web_developer_url );
      ( "serviceConsoleUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.service_console_url );
      ( "connectionStringDetails",
        option_to_yojson autonomous_database_connection_strings_to_yojson
          x.connection_string_details );
      ( "byolComputeCountLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.byol_compute_count_limit );
      ( "availableUpgradeVersions",
        option_to_yojson string_list_to_yojson x.available_upgrade_versions );
      ( "netServicesArchitecture",
        option_to_yojson net_services_architecture_to_yojson x.net_services_architecture );
      ( "autonomousMaintenanceScheduleType",
        option_to_yojson autonomous_maintenance_schedule_type_to_yojson
          x.autonomous_maintenance_schedule_type );
      ( "isMtlsConnectionRequired",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_connection_required );
      ("permissionLevel", option_to_yojson permission_level_to_yojson x.permission_level);
      ("openMode", option_to_yojson open_mode_to_yojson x.open_mode);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("databaseEdition", option_to_yojson database_edition_to_yojson x.database_edition);
      ( "ncharacterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ncharacter_set );
      ( "characterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.character_set );
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ("databaseType", option_to_yojson database_type_to_yojson x.database_type);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "sourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_id );
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("autonomousDatabaseArn", option_to_yojson resource_arn_to_yojson x.autonomous_database_arn);
      ( "autonomousDatabaseId",
        option_to_yojson resource_id_or_arn_to_yojson x.autonomous_database_id );
    ]

let get_autonomous_database_output_to_yojson (x : get_autonomous_database_output) =
  assoc_to_yojson
    [ ("autonomousDatabase", Some (autonomous_database_to_yojson x.autonomous_database)) ]

let get_autonomous_database_input_to_yojson (x : get_autonomous_database_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id)) ]

let autonomous_database_backup_to_yojson (x : autonomous_database_backup) =
  assoc_to_yojson
    [
      ("type", option_to_yojson autonomous_database_backup_type_to_yojson x.type_);
      ( "timeEnded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_ended );
      ( "timeStarted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_started );
      ( "timeAvailableTill",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_available_till );
      ( "sizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.size_in_t_bs );
      ( "retentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retention_period_in_days );
      ( "isAutomatic",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_automatic );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_backup_status_to_yojson x.status);
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("autonomousDatabaseId", option_to_yojson resource_id_to_yojson x.autonomous_database_id);
      ( "autonomousDatabaseBackupArn",
        option_to_yojson resource_arn_to_yojson x.autonomous_database_backup_arn );
      ( "autonomousDatabaseBackupId",
        option_to_yojson resource_id_to_yojson x.autonomous_database_backup_id );
    ]

let get_autonomous_database_backup_output_to_yojson (x : get_autonomous_database_backup_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseBackup",
        option_to_yojson autonomous_database_backup_to_yojson x.autonomous_database_backup );
    ]

let get_autonomous_database_backup_input_to_yojson (x : get_autonomous_database_backup_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseBackupId", Some (resource_id_to_yojson x.autonomous_database_backup_id)) ]

let general_input_string_to_yojson = string_to_yojson

let failover_autonomous_database_output_to_yojson (x : failover_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
    ]

let failover_autonomous_database_input_to_yojson (x : failover_autonomous_database_input) =
  assoc_to_yojson
    [
      ("peerDbArn", option_to_yojson resource_arn_to_yojson x.peer_db_arn);
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
    ]

let delete_odb_peering_connection_output_to_yojson = unit_to_yojson

let delete_odb_peering_connection_input_to_yojson (x : delete_odb_peering_connection_input) =
  assoc_to_yojson
    [ ("odbPeeringConnectionId", Some (resource_id_or_arn_to_yojson x.odb_peering_connection_id)) ]

let delete_odb_network_output_to_yojson = unit_to_yojson

let delete_odb_network_input_to_yojson (x : delete_odb_network_input) =
  assoc_to_yojson
    [
      ( "deleteAssociatedResources",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.delete_associated_resources)
      );
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
    ]

let delete_cloud_vm_cluster_output_to_yojson = unit_to_yojson

let delete_cloud_vm_cluster_input_to_yojson (x : delete_cloud_vm_cluster_input) =
  assoc_to_yojson [ ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id)) ]

let delete_cloud_exadata_infrastructure_output_to_yojson = unit_to_yojson

let delete_cloud_exadata_infrastructure_input_to_yojson
    (x : delete_cloud_exadata_infrastructure_input) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
    ]

let delete_cloud_autonomous_vm_cluster_output_to_yojson = unit_to_yojson

let delete_cloud_autonomous_vm_cluster_input_to_yojson
    (x : delete_cloud_autonomous_vm_cluster_input) =
  assoc_to_yojson
    [
      ("cloudAutonomousVmClusterId", Some (resource_id_to_yojson x.cloud_autonomous_vm_cluster_id));
    ]

let delete_autonomous_database_output_to_yojson = unit_to_yojson

let delete_autonomous_database_input_to_yojson (x : delete_autonomous_database_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id)) ]

let delete_autonomous_database_backup_output_to_yojson = unit_to_yojson

let delete_autonomous_database_backup_input_to_yojson (x : delete_autonomous_database_backup_input)
    =
  assoc_to_yojson
    [ ("autonomousDatabaseBackupId", Some (resource_id_to_yojson x.autonomous_database_backup_id)) ]

let create_odb_peering_connection_output_to_yojson (x : create_odb_peering_connection_output) =
  assoc_to_yojson
    [
      ( "odbPeeringConnectionId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_peering_connection_id)
      );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
    ]

let create_odb_peering_connection_input_to_yojson (x : create_odb_peering_connection_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "peerNetworkRouteTableIds",
        option_to_yojson peer_network_route_table_id_list_to_yojson x.peer_network_route_table_ids
      );
      ( "peerNetworkCidrsToBeAdded",
        option_to_yojson peered_cidr_list_to_yojson x.peer_network_cidrs_to_be_added );
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ("peerNetworkId", Some (resource_id_or_arn_to_yojson x.peer_network_id));
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
    ]

let create_odb_network_output_to_yojson (x : create_odb_network_output) =
  assoc_to_yojson
    [
      ( "odbNetworkId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_id) );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
    ]

let create_odb_network_input_to_yojson (x : create_odb_network_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "crossRegionS3RestoreSourcesToEnable",
        option_to_yojson string_list_to_yojson x.cross_region_s3_restore_sources_to_enable );
      ("kmsPolicyDocument", option_to_yojson policy_document_to_yojson x.kms_policy_document);
      ("stsPolicyDocument", option_to_yojson policy_document_to_yojson x.sts_policy_document);
      ("s3PolicyDocument", option_to_yojson policy_document_to_yojson x.s3_policy_document);
      ("kmsAccess", option_to_yojson access_to_yojson x.kms_access);
      ("stsAccess", option_to_yojson access_to_yojson x.sts_access);
      ("zeroEtlAccess", option_to_yojson access_to_yojson x.zero_etl_access);
      ("s3Access", option_to_yojson access_to_yojson x.s3_access);
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "defaultDnsPrefix",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_dns_prefix );
      ( "customDomainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.custom_domain_name );
      ( "backupSubnetCidr",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.backup_subnet_cidr );
      ( "clientSubnetCidr",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_subnet_cidr) );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ("displayName", Some (resource_display_name_to_yojson x.display_name));
    ]

let create_cloud_vm_cluster_output_to_yojson (x : create_cloud_vm_cluster_output) =
  assoc_to_yojson
    [
      ( "cloudVmClusterId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cloud_vm_cluster_id) );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
    ]

let cluster_name_to_yojson = string_to_yojson

let create_cloud_vm_cluster_input_to_yojson (x : create_cloud_vm_cluster_input) =
  assoc_to_yojson
    [
      ( "scanListenerPortTcp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_tcp );
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ( "systemVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.system_version );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "isSparseDiskgroupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_sparse_diskgroup_enabled );
      ( "isLocalBackupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_backup_enabled );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dataCollectionOptions",
        option_to_yojson data_collection_options_to_yojson x.data_collection_options );
      ("clusterName", option_to_yojson cluster_name_to_yojson x.cluster_name);
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
      ("sshPublicKeys", Some (string_list_to_yojson x.ssh_public_keys));
      ("hostname", Some (hostname_to_yojson x.hostname));
      ("giVersion", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.gi_version));
      ("displayName", Some (resource_display_name_to_yojson x.display_name));
      ( "cpuCoreCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count) );
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
    ]

let create_cloud_exadata_infrastructure_output_to_yojson
    (x : create_cloud_exadata_infrastructure_output) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cloud_exadata_infrastructure_id)
      );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
    ]

let create_cloud_exadata_infrastructure_input_to_yojson
    (x : create_cloud_exadata_infrastructure_input) =
  assoc_to_yojson
    [
      ("storageServerType", option_to_yojson general_input_string_to_yojson x.storage_server_type);
      ("databaseServerType", option_to_yojson general_input_string_to_yojson x.database_server_type);
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "storageCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.storage_count) );
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "customerContactsToSendToOCI",
        option_to_yojson customer_contacts_to_yojson x.customer_contacts_to_send_to_oc_i );
      ( "computeCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.compute_count) );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ("shape", Some (general_input_string_to_yojson x.shape));
      ("displayName", Some (resource_display_name_to_yojson x.display_name));
    ]

let create_cloud_autonomous_vm_cluster_output_to_yojson
    (x : create_cloud_autonomous_vm_cluster_output) =
  assoc_to_yojson
    [
      ( "cloudAutonomousVmClusterId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cloud_autonomous_vm_cluster_id)
      );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
    ]

let create_cloud_autonomous_vm_cluster_input_to_yojson
    (x : create_cloud_autonomous_vm_cluster_input) =
  assoc_to_yojson
    [
      ( "totalContainerDatabases",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.total_container_databases)
      );
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "scanListenerPortTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_tls );
      ( "scanListenerPortNonTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_non_tls );
      ( "memoryPerOracleComputeUnitInGBs",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
             x.memory_per_oracle_compute_unit_in_g_bs) );
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "isMtlsEnabledVmCluster",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_enabled_vm_cluster );
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ( "cpuCoreCountPerNode",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count_per_node) );
      ( "autonomousDataStorageSizeInTBs",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
             x.autonomous_data_storage_size_in_t_bs) );
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("displayName", Some (resource_display_name_to_yojson x.display_name));
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
    ]

let autonomous_database_wallet_file_to_yojson = blob_to_yojson

let create_autonomous_database_wallet_output_to_yojson
    (x : create_autonomous_database_wallet_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseWalletFile",
        Some (autonomous_database_wallet_file_to_yojson x.autonomous_database_wallet_file) );
    ]

let create_autonomous_database_wallet_input_to_yojson (x : create_autonomous_database_wallet_input)
    =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("password", Some (sensitive_string_to_yojson x.password));
      ("walletType", option_to_yojson wallet_type_to_yojson x.wallet_type);
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
    ]

let create_autonomous_database_output_to_yojson (x : create_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
    ]

let create_autonomous_database_input_to_yojson (x : create_autonomous_database_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "encryptionKeyConfiguration",
        option_to_yojson encryption_key_configuration_input_to_yojson x.encryption_key_configuration
      );
      ( "encryptionKeyProvider",
        option_to_yojson encryption_key_provider_input_to_yojson x.encryption_key_provider );
      ("sourceConfiguration", option_to_yojson source_configuration_to_yojson x.source_configuration);
      ("source", option_to_yojson source_type_to_yojson x.source);
      ("dbToolsDetails", option_to_yojson database_tool_list_to_yojson x.db_tools_details);
      ( "isMtlsConnectionRequired",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_connection_required );
      ( "isLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_data_guard_enabled );
      ( "isBackupRetentionLocked",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_backup_retention_locked );
      ( "transportableTablespace",
        option_to_yojson transportable_tablespace_to_yojson x.transportable_tablespace );
      ("allowlistedIps", option_to_yojson string_list_to_yojson x.allowlisted_ips);
      ("standbyAllowlistedIps", option_to_yojson string_list_to_yojson x.standby_allowlisted_ips);
      ( "scheduledOperations",
        option_to_yojson scheduled_operation_details_list_to_yojson x.scheduled_operations );
      ( "resourcePoolSummary",
        option_to_yojson resource_pool_summary_to_yojson x.resource_pool_summary );
      ( "resourcePoolLeaderId",
        option_to_yojson resource_id_or_arn_to_yojson x.resource_pool_leader_id );
      ( "privateEndpointLabel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_label );
      ( "privateEndpointIp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_ip );
      ( "customerContactsToSendToOCI",
        option_to_yojson customer_contacts_to_yojson x.customer_contacts_to_send_to_oc_i );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "byolComputeCountLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.byol_compute_count_limit );
      ( "backupRetentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.backup_retention_period_in_days );
      ( "autonomousMaintenanceScheduleType",
        option_to_yojson autonomous_maintenance_schedule_type_to_yojson
          x.autonomous_maintenance_schedule_type );
      ( "standbyAllowlistedIpsSource",
        option_to_yojson standby_allowlisted_ips_source_to_yojson x.standby_allowlisted_ips_source
      );
      ("databaseEdition", option_to_yojson database_edition_to_yojson x.database_edition);
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ( "ncharacterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ncharacter_set );
      ( "characterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.character_set );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "isAutoScalingForStorageEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_for_storage_enabled );
      ( "isAutoScalingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_enabled );
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_t_bs );
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.compute_count );
      ("adminPassword", option_to_yojson sensitive_string_to_yojson x.admin_password);
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
    ]

let create_autonomous_database_backup_output_to_yojson
    (x : create_autonomous_database_backup_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseBackupId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_backup_id)
      );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
    ]

let create_autonomous_database_backup_input_to_yojson (x : create_autonomous_database_backup_input)
    =
  assoc_to_yojson
    [
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "retentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retention_period_in_days );
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
    ]
