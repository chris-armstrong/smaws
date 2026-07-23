open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | UNKNOWN_OPERATION -> `String "unknownOperation"
  | CANNOT_PARSE -> `String "cannotParse"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | OTHER -> `String "other"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
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
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let accept_marketplace_registration_output_to_yojson = unit_to_yojson

let accept_marketplace_registration_input_to_yojson (x : accept_marketplace_registration_input) =
  assoc_to_yojson
    [
      ( "marketplaceRegistrationToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.marketplace_registration_token)
      );
    ]

let access_to_yojson (x : access) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let arn_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let associate_iam_role_to_resource_output_to_yojson = unit_to_yojson

let supported_aws_integration_to_yojson (x : supported_aws_integration) =
  match x with KmsTde -> `String "KmsTde"

let role_arn_to_yojson = string_to_yojson

let associate_iam_role_to_resource_input_to_yojson (x : associate_iam_role_to_resource_input) =
  assoc_to_yojson
    [
      ("iamRoleArn", Some (role_arn_to_yojson x.iam_role_arn));
      ("awsIntegration", Some (supported_aws_integration_to_yojson x.aws_integration));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let okv_encryption_key_configuration_to_yojson (x : okv_encryption_key_configuration) =
  assoc_to_yojson
    [
      ( "certificateDirectoryName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.certificate_directory_name)
      );
      ( "certificateId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.certificate_id );
      ( "directoryName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.directory_name) );
      ("okvKmsKey", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.okv_kms_key));
      ("okvUri", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.okv_uri));
    ]

let oci_encryption_key_configuration_to_yojson (x : oci_encryption_key_configuration) =
  assoc_to_yojson
    [
      ("kmsKeyId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id));
      ("vaultId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vault_id));
    ]

let kms_key_id_or_arn_to_yojson = string_to_yojson

let external_id_type_to_yojson (x : external_id_type) =
  match x with
  | DATABASE_OCID -> `String "database_ocid"
  | COMPARTMENT_OCID -> `String "compartment_ocid"
  | TENANT_OCID -> `String "tenant_ocid"

let aws_encryption_key_configuration_to_yojson (x : aws_encryption_key_configuration) =
  assoc_to_yojson
    [
      ("iamRoleArn", option_to_yojson role_arn_to_yojson x.iam_role_arn);
      ("externalIdType", option_to_yojson external_id_type_to_yojson x.external_id_type);
      ("kmsKeyId", option_to_yojson kms_key_id_or_arn_to_yojson x.kms_key_id);
    ]

let encryption_key_configuration_to_yojson (x : encryption_key_configuration) =
  match x with
  | AwsEncryptionKey arg ->
      assoc_to_yojson
        [ ("awsEncryptionKey", Some (aws_encryption_key_configuration_to_yojson arg)) ]
  | OciEncryptionKey arg ->
      assoc_to_yojson
        [ ("ociEncryptionKey", Some (oci_encryption_key_configuration_to_yojson arg)) ]
  | OkvEncryptionKey arg ->
      assoc_to_yojson
        [ ("okvEncryptionKey", Some (okv_encryption_key_configuration_to_yojson arg)) ]

let encryption_key_provider_to_yojson (x : encryption_key_provider) =
  match x with
  | ORACLE_MANAGED -> `String "ORACLE_MANAGED"
  | AWS_KMS -> `String "AWS_KMS"
  | OKV -> `String "OKV"
  | OCI -> `String "OCI"

let encryption_summary_to_yojson (x : encryption_summary) =
  assoc_to_yojson
    [
      ( "encryptionKeyProvider",
        option_to_yojson encryption_key_provider_to_yojson x.encryption_key_provider );
      ( "encryptionKeyConfiguration",
        option_to_yojson encryption_key_configuration_to_yojson x.encryption_key_configuration );
    ]

let resource_pool_summary_to_yojson (x : resource_pool_summary) =
  assoc_to_yojson
    [
      ( "isDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_disabled );
      ( "poolSize",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.pool_size );
      ( "poolStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.pool_storage_size_in_t_bs );
      ( "availableStorageCapacityInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.available_storage_capacity_in_t_bs );
      ( "totalComputeCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_compute_capacity );
      ( "availableComputeCapacity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_compute_capacity );
    ]

let repeat_cadence_to_yojson (x : repeat_cadence) =
  match x with
  | ONE_TIME -> `String "ONE_TIME"
  | WEEKLY -> `String "WEEKLY"
  | MONTHLY -> `String "MONTHLY"
  | YEARLY -> `String "YEARLY"

let long_term_backup_schedule_to_yojson (x : long_term_backup_schedule) =
  assoc_to_yojson
    [
      ( "isDisabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_disabled );
      ("repeatCadence", option_to_yojson repeat_cadence_to_yojson x.repeat_cadence);
      ( "retentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retention_period_in_days );
      ( "timeOfBackup",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_backup );
    ]

let integer_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree

let refreshable_status_to_yojson (x : refreshable_status) =
  match x with REFRESHING -> `String "REFRESHING" | NOT_REFRESHING -> `String "NOT_REFRESHING"

let refreshable_mode_to_yojson (x : refreshable_mode) =
  match x with AUTOMATIC -> `String "AUTOMATIC" | MANUAL -> `String "MANUAL"

let disaster_recovery_type_to_yojson (x : disaster_recovery_type) =
  match x with ADG -> `String "ADG" | BACKUP_BASED -> `String "BACKUP_BASED"

let disaster_recovery_configuration_to_yojson (x : disaster_recovery_configuration) =
  assoc_to_yojson
    [
      ( "disasterRecoveryType",
        option_to_yojson disaster_recovery_type_to_yojson x.disaster_recovery_type );
      ( "isReplicateAutomaticBackups",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_replicate_automatic_backups );
      ( "isSnapshotStandby",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_snapshot_standby );
      ( "timeSnapshotStandbyEnabledTill",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_snapshot_standby_enabled_till );
    ]

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let data_guard_role_to_yojson (x : data_guard_role) =
  match x with
  | PRIMARY -> `String "PRIMARY"
  | STANDBY -> `String "STANDBY"
  | DISABLED_STANDBY -> `String "DISABLED_STANDBY"
  | BACKUP_COPY -> `String "BACKUP_COPY"
  | SNAPSHOT_STANDBY -> `String "SNAPSHOT_STANDBY"

let standby_allowlisted_ips_source_to_yojson (x : standby_allowlisted_ips_source) =
  match x with
  | PRIMARY -> `String "PRIMARY"
  | SEPARATE -> `String "SEPARATE"
  | NOT_APPLICABLE -> `String "NOT_APPLICABLE"

let resource_arn_to_yojson = string_to_yojson
let resource_id_to_yojson = string_to_yojson

let compute_model_to_yojson (x : compute_model) =
  match x with ECPU -> `String "ECPU" | OCPU -> `String "OCPU"

let day_of_week_name_to_yojson (x : day_of_week_name) =
  match x with
  | MONDAY -> `String "MONDAY"
  | TUESDAY -> `String "TUESDAY"
  | WEDNESDAY -> `String "WEDNESDAY"
  | THURSDAY -> `String "THURSDAY"
  | FRIDAY -> `String "FRIDAY"
  | SATURDAY -> `String "SATURDAY"
  | SUNDAY -> `String "SUNDAY"

let day_of_week_to_yojson (x : day_of_week) =
  assoc_to_yojson [ ("name", option_to_yojson day_of_week_name_to_yojson x.name) ]

let scheduled_operation_details_to_yojson (x : scheduled_operation_details) =
  assoc_to_yojson
    [
      ("dayOfWeek", Some (day_of_week_to_yojson x.day_of_week));
      ( "scheduledStartTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_start_time );
      ( "scheduledStopTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scheduled_stop_time );
    ]

let scheduled_operation_details_list_to_yojson tree =
  list_to_yojson scheduled_operation_details_to_yojson tree

let database_tool_to_yojson (x : database_tool) =
  assoc_to_yojson
    [
      ( "isEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_enabled );
      ("name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.compute_count );
      ( "maxIdleTimeInMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_idle_time_in_minutes );
    ]

let database_tool_list_to_yojson tree = list_to_yojson database_tool_to_yojson tree

let autonomous_database_connection_urls_to_yojson (x : autonomous_database_connection_urls) =
  assoc_to_yojson
    [
      ( "apexUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.apex_url );
      ( "databaseTransformsUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.database_transforms_url );
      ( "graphStudioUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.graph_studio_url
      );
      ( "machineLearningNotebookUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.machine_learning_notebook_url );
      ( "machineLearningUserManagementUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.machine_learning_user_management_url );
      ( "mongoDbUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.mongo_db_url );
      ( "ordsUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ords_url );
      ( "spatialStudioUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.spatial_studio_url );
      ( "sqlDevWebUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sql_dev_web_url
      );
    ]

let operations_insights_status_to_yojson (x : operations_insights_status) =
  match x with
  | ENABLING -> `String "ENABLING"
  | ENABLED -> `String "ENABLED"
  | DISABLING -> `String "DISABLING"
  | NOT_ENABLED -> `String "NOT_ENABLED"
  | FAILED_ENABLING -> `String "FAILED_ENABLING"
  | FAILED_DISABLING -> `String "FAILED_DISABLING"

let database_management_status_to_yojson (x : database_management_status) =
  match x with
  | ENABLING -> `String "ENABLING"
  | ENABLED -> `String "ENABLED"
  | DISABLING -> `String "DISABLING"
  | NOT_ENABLED -> `String "NOT_ENABLED"
  | FAILED_ENABLING -> `String "FAILED_ENABLING"
  | FAILED_DISABLING -> `String "FAILED_DISABLING"

let data_safe_status_to_yojson (x : data_safe_status) =
  match x with
  | REGISTERING -> `String "REGISTERING"
  | REGISTERED -> `String "REGISTERED"
  | DEREGISTERING -> `String "DEREGISTERING"
  | NOT_REGISTERED -> `String "NOT_REGISTERED"
  | FAILED -> `String "FAILED"

let autonomous_database_resource_status_to_yojson (x : autonomous_database_resource_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | FAILED -> `String "FAILED"
  | PROVISIONING -> `String "PROVISIONING"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | UPDATING -> `String "UPDATING"
  | MAINTENANCE_IN_PROGRESS -> `String "MAINTENANCE_IN_PROGRESS"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"
  | STARTING -> `String "STARTING"
  | UNAVAILABLE -> `String "UNAVAILABLE"
  | RESTORE_IN_PROGRESS -> `String "RESTORE_IN_PROGRESS"
  | RESTORE_FAILED -> `String "RESTORE_FAILED"
  | BACKUP_IN_PROGRESS -> `String "BACKUP_IN_PROGRESS"
  | SCALE_IN_PROGRESS -> `String "SCALE_IN_PROGRESS"
  | AVAILABLE_NEEDS_ATTENTION -> `String "AVAILABLE_NEEDS_ATTENTION"
  | RESTARTING -> `String "RESTARTING"
  | RECREATING -> `String "RECREATING"
  | ROLE_CHANGE_IN_PROGRESS -> `String "ROLE_CHANGE_IN_PROGRESS"
  | UPGRADING -> `String "UPGRADING"
  | INACCESSIBLE -> `String "INACCESSIBLE"
  | STANDBY -> `String "STANDBY"

let database_standby_summary_to_yojson (x : database_standby_summary) =
  assoc_to_yojson
    [
      ( "availabilityDomain",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_domain );
      ( "lagTimeInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.lag_time_in_seconds );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "maintenanceTargetComponent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.maintenance_target_component );
      ( "timeDataGuardRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_data_guard_role_changed );
      ( "timeDisasterRecoveryRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_disaster_recovery_role_changed );
      ( "timeMaintenanceBegin",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_begin );
      ( "timeMaintenanceEnd",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_end );
    ]

let autonomous_database_apex_to_yojson (x : autonomous_database_apex) =
  assoc_to_yojson
    [
      ( "apexVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.apex_version );
      ( "ordsVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ords_version );
    ]

let sensitive_string_to_yojson = string_to_yojson

let customer_contact_to_yojson (x : customer_contact) =
  assoc_to_yojson [ ("email", option_to_yojson sensitive_string_to_yojson x.email) ]

let customer_contacts_to_yojson tree = list_to_yojson customer_contact_to_yojson tree

let database_connection_string_profile_to_yojson (x : database_connection_string_profile) =
  assoc_to_yojson
    [
      ( "consumerGroup",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.consumer_group );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "hostFormat",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.host_format );
      ( "isRegional",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_regional );
      ( "protocol",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.protocol );
      ( "sessionMode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.session_mode );
      ( "syntaxFormat",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.syntax_format );
      ( "tlsAuthentication",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.tls_authentication );
      ("value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value);
    ]

let database_connection_string_profile_list_to_yojson tree =
  list_to_yojson database_connection_string_profile_to_yojson tree

let database_connection_string_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let autonomous_database_connection_strings_to_yojson (x : autonomous_database_connection_strings) =
  assoc_to_yojson
    [
      ( "allConnectionStrings",
        option_to_yojson database_connection_string_map_to_yojson x.all_connection_strings );
      ( "dedicated",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.dedicated );
      ("high", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.high);
      ("medium", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.medium);
      ("low", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.low);
      ("profiles", option_to_yojson database_connection_string_profile_list_to_yojson x.profiles);
    ]

let net_services_architecture_to_yojson (x : net_services_architecture) =
  match x with DEDICATED -> `String "DEDICATED" | SHARED -> `String "SHARED"

let autonomous_maintenance_schedule_type_to_yojson (x : autonomous_maintenance_schedule_type) =
  match x with EARLY -> `String "EARLY" | REGULAR -> `String "REGULAR"

let permission_level_to_yojson (x : permission_level) =
  match x with RESTRICTED -> `String "RESTRICTED" | UNRESTRICTED -> `String "UNRESTRICTED"

let open_mode_to_yojson (x : open_mode) =
  match x with READ_ONLY -> `String "READ_ONLY" | READ_WRITE -> `String "READ_WRITE"

let license_model_to_yojson (x : license_model) =
  match x with
  | BRING_YOUR_OWN_LICENSE -> `String "BRING_YOUR_OWN_LICENSE"
  | LICENSE_INCLUDED -> `String "LICENSE_INCLUDED"

let database_edition_to_yojson (x : database_edition) =
  match x with
  | STANDARD_EDITION -> `String "STANDARD_EDITION"
  | ENTERPRISE_EDITION -> `String "ENTERPRISE_EDITION"

let db_workload_to_yojson (x : db_workload) =
  match x with
  | OLTP -> `String "OLTP"
  | AJD -> `String "AJD"
  | APEX -> `String "APEX"
  | LH -> `String "LH"

let database_type_to_yojson (x : database_type) =
  match x with REGULAR -> `String "REGULAR" | CLONE -> `String "CLONE"

let resource_id_or_arn_to_yojson = string_to_yojson

let autonomous_database_to_yojson (x : autonomous_database) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseId",
        option_to_yojson resource_id_or_arn_to_yojson x.autonomous_database_id );
      ("autonomousDatabaseArn", option_to_yojson resource_arn_to_yojson x.autonomous_database_arn);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ( "sourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_id );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("databaseType", option_to_yojson database_type_to_yojson x.database_type);
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
      ( "characterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.character_set );
      ( "ncharacterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ncharacter_set );
      ("databaseEdition", option_to_yojson database_edition_to_yojson x.database_edition);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("openMode", option_to_yojson open_mode_to_yojson x.open_mode);
      ("permissionLevel", option_to_yojson permission_level_to_yojson x.permission_level);
      ( "isMtlsConnectionRequired",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_connection_required );
      ( "autonomousMaintenanceScheduleType",
        option_to_yojson autonomous_maintenance_schedule_type_to_yojson
          x.autonomous_maintenance_schedule_type );
      ( "netServicesArchitecture",
        option_to_yojson net_services_architecture_to_yojson x.net_services_architecture );
      ( "availableUpgradeVersions",
        option_to_yojson string_list_to_yojson x.available_upgrade_versions );
      ( "byolComputeCountLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.byol_compute_count_limit );
      ( "connectionStringDetails",
        option_to_yojson autonomous_database_connection_strings_to_yojson
          x.connection_string_details );
      ( "serviceConsoleUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.service_console_url );
      ( "sqlWebDeveloperUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.sql_web_developer_url );
      ("customerContacts", option_to_yojson customer_contacts_to_yojson x.customer_contacts);
      ("apexDetails", option_to_yojson autonomous_database_apex_to_yojson x.apex_details);
      ("standbyDb", option_to_yojson database_standby_summary_to_yojson x.standby_db);
      ("localStandbyDb", option_to_yojson database_standby_summary_to_yojson x.local_standby_db);
      ("dataSafeStatus", option_to_yojson data_safe_status_to_yojson x.data_safe_status);
      ( "databaseManagementStatus",
        option_to_yojson database_management_status_to_yojson x.database_management_status );
      ( "operationsInsightsStatus",
        option_to_yojson operations_insights_status_to_yojson x.operations_insights_status );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "maintenanceTargetComponent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.maintenance_target_component );
      ( "connectionUrls",
        option_to_yojson autonomous_database_connection_urls_to_yojson x.connection_urls );
      ("dbToolsDetails", option_to_yojson database_tool_list_to_yojson x.db_tools_details);
      ( "scheduledOperations",
        option_to_yojson scheduled_operation_details_list_to_yojson x.scheduled_operations );
      ( "resourcePoolLeaderId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.resource_pool_leader_id );
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.compute_count );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "memoryPerOracleComputeUnitInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_per_oracle_compute_unit_in_g_bs );
      ("provisionableCpus", option_to_yojson integer_list_to_yojson x.provisionable_cpus);
      ( "isAutoScalingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_enabled );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_g_bs );
      ( "usedDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.used_data_storage_size_in_t_bs );
      ( "usedDataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.used_data_storage_size_in_g_bs );
      ( "actualUsedDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.actual_used_data_storage_size_in_t_bs );
      ( "allocatedStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.allocated_storage_size_in_t_bs );
      ( "inMemoryAreaInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.in_memory_area_in_g_bs );
      ( "isAutoScalingForStorageEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_for_storage_enabled );
      ("odbNetworkId", option_to_yojson resource_id_to_yojson x.odb_network_id);
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ( "privateEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.private_endpoint
      );
      ( "privateEndpointIp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_ip );
      ( "privateEndpointLabel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_label );
      ("allowlistedIps", option_to_yojson string_list_to_yojson x.allowlisted_ips);
      ("standbyAllowlistedIps", option_to_yojson string_list_to_yojson x.standby_allowlisted_ips);
      ( "standbyAllowlistedIpsSource",
        option_to_yojson standby_allowlisted_ips_source_to_yojson x.standby_allowlisted_ips_source
      );
      ( "isLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_data_guard_enabled );
      ( "isRemoteDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_remote_data_guard_enabled );
      ( "localDisasterRecoveryType",
        option_to_yojson disaster_recovery_type_to_yojson x.local_disaster_recovery_type );
      ("role", option_to_yojson data_guard_role_to_yojson x.role);
      ("peerDbIds", option_to_yojson string_list_to_yojson x.peer_db_ids);
      ( "failedDataRecoveryInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.failed_data_recovery_in_seconds );
      ( "localAdgAutoFailoverMaxDataLossLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.local_adg_auto_failover_max_data_loss_limit );
      ( "remoteDisasterRecoveryConfiguration",
        option_to_yojson disaster_recovery_configuration_to_yojson
          x.remote_disaster_recovery_configuration );
      ( "isRefreshableClone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_refreshable_clone );
      ("refreshableMode", option_to_yojson refreshable_mode_to_yojson x.refreshable_mode);
      ("refreshableStatus", option_to_yojson refreshable_status_to_yojson x.refreshable_status);
      ( "autoRefreshFrequencyInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_frequency_in_seconds );
      ( "autoRefreshPointLagInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_point_lag_in_seconds );
      ( "isReconnectCloneEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_reconnect_clone_enabled );
      ("cloneTableSpaceList", option_to_yojson integer_list_to_yojson x.clone_table_space_list);
      ( "backupRetentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.backup_retention_period_in_days );
      ( "longTermBackupSchedule",
        option_to_yojson long_term_backup_schedule_to_yojson x.long_term_backup_schedule );
      ( "isBackupRetentionLocked",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_backup_retention_locked );
      ( "totalBackupStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.total_backup_storage_size_in_g_bs );
      ( "resourcePoolSummary",
        option_to_yojson resource_pool_summary_to_yojson x.resource_pool_summary );
      ("encryptionSummary", option_to_yojson encryption_summary_to_yojson x.encryption_summary);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "timeOfLastBackup",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_backup );
      ( "timeMaintenanceBegin",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_begin );
      ( "timeMaintenanceEnd",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_end );
      ( "timeLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_local_data_guard_enabled );
      ( "timeDataGuardRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_data_guard_role_changed );
      ( "timeOfLastSwitchover",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_switchover );
      ( "timeOfLastFailover",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_failover );
      ( "timeOfLastRefresh",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_refresh );
      ( "timeOfLastRefreshPoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_refresh_point );
      ( "timeOfNextRefresh",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_next_refresh );
      ( "timeOfAutoRefreshStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_auto_refresh_start );
      ( "timeDeletionOfFreeAutonomousDatabase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_deletion_of_free_autonomous_database );
      ( "timeReclamationOfFreeAutonomousDatabase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_reclamation_of_free_autonomous_database );
      ( "timeDisasterRecoveryRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_disaster_recovery_role_changed );
      ( "timeUntilReconnectCloneEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_until_reconnect_clone_enabled );
      ( "nextLongTermBackupTimeStamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_long_term_backup_time_stamp );
      ( "timeUndeleted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_undeleted );
    ]

let autonomous_database_backup_type_to_yojson (x : autonomous_database_backup_type) =
  match x with
  | INCREMENTAL -> `String "INCREMENTAL"
  | FULL -> `String "FULL"
  | LONGTERM -> `String "LONGTERM"
  | VIRTUAL_FULL -> `String "VIRTUAL_FULL"
  | CUMULATIVE_INCREMENTAL -> `String "CUMULATIVE_INCREMENTAL"
  | ROLL_FORWARD_IMAGE_COPY -> `String "ROLL_FORWARD_IMAGE_COPY"

let autonomous_database_backup_status_to_yojson (x : autonomous_database_backup_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"

let autonomous_database_backup_to_yojson (x : autonomous_database_backup) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseBackupId",
        option_to_yojson resource_id_to_yojson x.autonomous_database_backup_id );
      ( "autonomousDatabaseBackupArn",
        option_to_yojson resource_arn_to_yojson x.autonomous_database_backup_arn );
      ("autonomousDatabaseId", option_to_yojson resource_id_to_yojson x.autonomous_database_id);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ("status", option_to_yojson autonomous_database_backup_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "isAutomatic",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_automatic );
      ( "retentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retention_period_in_days );
      ( "sizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.size_in_t_bs );
      ( "timeAvailableTill",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_available_till );
      ( "timeStarted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_started );
      ( "timeEnded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_ended );
      ("type", option_to_yojson autonomous_database_backup_type_to_yojson x.type_);
    ]

let autonomous_database_backup_summary_to_yojson (x : autonomous_database_backup_summary) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseBackupId",
        option_to_yojson resource_id_to_yojson x.autonomous_database_backup_id );
      ( "autonomousDatabaseBackupArn",
        option_to_yojson resource_arn_to_yojson x.autonomous_database_backup_arn );
      ("autonomousDatabaseId", option_to_yojson resource_id_to_yojson x.autonomous_database_id);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ("status", option_to_yojson autonomous_database_backup_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "isAutomatic",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_automatic );
      ( "retentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retention_period_in_days );
      ( "sizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.size_in_t_bs );
      ( "timeAvailableTill",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_available_till );
      ( "timeStarted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_started );
      ( "timeEnded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_ended );
      ("type", option_to_yojson autonomous_database_backup_type_to_yojson x.type_);
    ]

let autonomous_database_backup_list_to_yojson tree =
  list_to_yojson autonomous_database_backup_summary_to_yojson tree

let autonomous_database_character_set_summary_to_yojson
    (x : autonomous_database_character_set_summary) =
  assoc_to_yojson
    [
      ( "characterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.character_set );
    ]

let autonomous_database_character_set_list_to_yojson tree =
  list_to_yojson autonomous_database_character_set_summary_to_yojson tree

let autonomous_database_summary_to_yojson (x : autonomous_database_summary) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseId",
        option_to_yojson resource_id_or_arn_to_yojson x.autonomous_database_id );
      ("autonomousDatabaseArn", option_to_yojson resource_arn_to_yojson x.autonomous_database_arn);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ( "sourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.source_id );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("databaseType", option_to_yojson database_type_to_yojson x.database_type);
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
      ( "characterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.character_set );
      ( "ncharacterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ncharacter_set );
      ("databaseEdition", option_to_yojson database_edition_to_yojson x.database_edition);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("openMode", option_to_yojson open_mode_to_yojson x.open_mode);
      ("permissionLevel", option_to_yojson permission_level_to_yojson x.permission_level);
      ( "isMtlsConnectionRequired",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_connection_required );
      ( "autonomousMaintenanceScheduleType",
        option_to_yojson autonomous_maintenance_schedule_type_to_yojson
          x.autonomous_maintenance_schedule_type );
      ( "netServicesArchitecture",
        option_to_yojson net_services_architecture_to_yojson x.net_services_architecture );
      ( "availableUpgradeVersions",
        option_to_yojson string_list_to_yojson x.available_upgrade_versions );
      ( "byolComputeCountLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.byol_compute_count_limit );
      ( "connectionStringDetails",
        option_to_yojson autonomous_database_connection_strings_to_yojson
          x.connection_string_details );
      ( "serviceConsoleUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.service_console_url );
      ( "sqlWebDeveloperUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.sql_web_developer_url );
      ("customerContacts", option_to_yojson customer_contacts_to_yojson x.customer_contacts);
      ("apexDetails", option_to_yojson autonomous_database_apex_to_yojson x.apex_details);
      ("standbyDb", option_to_yojson database_standby_summary_to_yojson x.standby_db);
      ("localStandbyDb", option_to_yojson database_standby_summary_to_yojson x.local_standby_db);
      ("dataSafeStatus", option_to_yojson data_safe_status_to_yojson x.data_safe_status);
      ( "databaseManagementStatus",
        option_to_yojson database_management_status_to_yojson x.database_management_status );
      ( "operationsInsightsStatus",
        option_to_yojson operations_insights_status_to_yojson x.operations_insights_status );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "maintenanceTargetComponent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.maintenance_target_component );
      ( "connectionUrls",
        option_to_yojson autonomous_database_connection_urls_to_yojson x.connection_urls );
      ("dbToolsDetails", option_to_yojson database_tool_list_to_yojson x.db_tools_details);
      ( "scheduledOperations",
        option_to_yojson scheduled_operation_details_list_to_yojson x.scheduled_operations );
      ( "resourcePoolLeaderId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.resource_pool_leader_id );
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.compute_count );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "memoryPerOracleComputeUnitInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_per_oracle_compute_unit_in_g_bs );
      ("provisionableCpus", option_to_yojson integer_list_to_yojson x.provisionable_cpus);
      ( "isAutoScalingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_enabled );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_g_bs );
      ( "usedDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.used_data_storage_size_in_t_bs );
      ( "usedDataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.used_data_storage_size_in_g_bs );
      ( "actualUsedDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.actual_used_data_storage_size_in_t_bs );
      ( "allocatedStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.allocated_storage_size_in_t_bs );
      ( "inMemoryAreaInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.in_memory_area_in_g_bs );
      ( "isAutoScalingForStorageEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_for_storage_enabled );
      ("odbNetworkId", option_to_yojson resource_id_to_yojson x.odb_network_id);
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ( "privateEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.private_endpoint
      );
      ( "privateEndpointIp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_ip );
      ( "privateEndpointLabel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_label );
      ("allowlistedIps", option_to_yojson string_list_to_yojson x.allowlisted_ips);
      ("standbyAllowlistedIps", option_to_yojson string_list_to_yojson x.standby_allowlisted_ips);
      ( "standbyAllowlistedIpsSource",
        option_to_yojson standby_allowlisted_ips_source_to_yojson x.standby_allowlisted_ips_source
      );
      ( "isLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_data_guard_enabled );
      ( "isRemoteDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_remote_data_guard_enabled );
      ( "localDisasterRecoveryType",
        option_to_yojson disaster_recovery_type_to_yojson x.local_disaster_recovery_type );
      ("role", option_to_yojson data_guard_role_to_yojson x.role);
      ("peerDbIds", option_to_yojson string_list_to_yojson x.peer_db_ids);
      ( "failedDataRecoveryInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.failed_data_recovery_in_seconds );
      ( "localAdgAutoFailoverMaxDataLossLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.local_adg_auto_failover_max_data_loss_limit );
      ( "remoteDisasterRecoveryConfiguration",
        option_to_yojson disaster_recovery_configuration_to_yojson
          x.remote_disaster_recovery_configuration );
      ( "isRefreshableClone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_refreshable_clone );
      ("refreshableMode", option_to_yojson refreshable_mode_to_yojson x.refreshable_mode);
      ("refreshableStatus", option_to_yojson refreshable_status_to_yojson x.refreshable_status);
      ( "autoRefreshFrequencyInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_frequency_in_seconds );
      ( "autoRefreshPointLagInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_point_lag_in_seconds );
      ( "isReconnectCloneEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_reconnect_clone_enabled );
      ("cloneTableSpaceList", option_to_yojson integer_list_to_yojson x.clone_table_space_list);
      ( "backupRetentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.backup_retention_period_in_days );
      ( "longTermBackupSchedule",
        option_to_yojson long_term_backup_schedule_to_yojson x.long_term_backup_schedule );
      ( "isBackupRetentionLocked",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_backup_retention_locked );
      ( "totalBackupStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.total_backup_storage_size_in_g_bs );
      ( "resourcePoolSummary",
        option_to_yojson resource_pool_summary_to_yojson x.resource_pool_summary );
      ("encryptionSummary", option_to_yojson encryption_summary_to_yojson x.encryption_summary);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "timeOfLastBackup",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_backup );
      ( "timeMaintenanceBegin",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_begin );
      ( "timeMaintenanceEnd",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_maintenance_end );
      ( "timeLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_local_data_guard_enabled );
      ( "timeDataGuardRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_data_guard_role_changed );
      ( "timeOfLastSwitchover",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_switchover );
      ( "timeOfLastFailover",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_failover );
      ( "timeOfLastRefresh",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_refresh );
      ( "timeOfLastRefreshPoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_last_refresh_point );
      ( "timeOfNextRefresh",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_next_refresh );
      ( "timeOfAutoRefreshStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_auto_refresh_start );
      ( "timeDeletionOfFreeAutonomousDatabase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_deletion_of_free_autonomous_database );
      ( "timeReclamationOfFreeAutonomousDatabase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_reclamation_of_free_autonomous_database );
      ( "timeDisasterRecoveryRoleChanged",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_disaster_recovery_role_changed );
      ( "timeUntilReconnectCloneEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_until_reconnect_clone_enabled );
      ( "nextLongTermBackupTimeStamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.next_long_term_backup_time_stamp );
      ( "timeUndeleted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_undeleted );
    ]

let autonomous_database_list_to_yojson tree =
  list_to_yojson autonomous_database_summary_to_yojson tree

let autonomous_database_peer_summary_to_yojson (x : autonomous_database_peer_summary) =
  assoc_to_yojson
    [
      ("autonomousDatabaseId", option_to_yojson resource_id_to_yojson x.autonomous_database_id);
      ("autonomousDatabaseArn", option_to_yojson resource_arn_to_yojson x.autonomous_database_arn);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
    ]

let autonomous_database_peer_list_to_yojson tree =
  list_to_yojson autonomous_database_peer_summary_to_yojson tree

let autonomous_database_version_summary_to_yojson (x : autonomous_database_version_summary) =
  assoc_to_yojson
    [
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
      ("details", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.details);
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
    ]

let autonomous_database_version_list_to_yojson tree =
  list_to_yojson autonomous_database_version_summary_to_yojson tree

let autonomous_database_wallet_status_to_yojson (x : autonomous_database_wallet_status) =
  match x with ACTIVE -> `String "ACTIVE" | UPDATING -> `String "UPDATING"

let autonomous_database_wallet_details_to_yojson (x : autonomous_database_wallet_details) =
  assoc_to_yojson
    [
      ("status", option_to_yojson autonomous_database_wallet_status_to_yojson x.status);
      ( "timeRotated",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_rotated );
    ]

let autonomous_database_wallet_file_to_yojson = blob_to_yojson

let resource_status_to_yojson (x : resource_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | FAILED -> `String "FAILED"
  | PROVISIONING -> `String "PROVISIONING"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | UPDATING -> `String "UPDATING"
  | MAINTENANCE_IN_PROGRESS -> `String "MAINTENANCE_IN_PROGRESS"

let autonomous_virtual_machine_summary_to_yojson (x : autonomous_virtual_machine_summary) =
  assoc_to_yojson
    [
      ( "autonomousVirtualMachineId",
        option_to_yojson resource_id_to_yojson x.autonomous_virtual_machine_id );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("vmName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vm_name);
      ("dbServerId", option_to_yojson resource_id_to_yojson x.db_server_id);
      ( "dbServerDisplayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.db_server_display_name );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "clientIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_ip_address
      );
      ( "cloudAutonomousVmClusterId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_autonomous_vm_cluster_id );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
    ]

let autonomous_virtual_machine_list_to_yojson tree =
  list_to_yojson autonomous_virtual_machine_summary_to_yojson tree

let aws_encryption_key_configuration_input_to_yojson (x : aws_encryption_key_configuration_input) =
  assoc_to_yojson
    [
      ("iamRoleArn", option_to_yojson role_arn_to_yojson x.iam_role_arn);
      ("externalIdType", option_to_yojson external_id_type_to_yojson x.external_id_type);
      ("kmsKeyId", option_to_yojson kms_key_id_or_arn_to_yojson x.kms_key_id);
    ]

let clone_type_to_yojson (x : clone_type) =
  match x with
  | FULL -> `String "FULL"
  | METADATA -> `String "METADATA"
  | PARTIAL -> `String "PARTIAL"

let clone_to_refreshable_configuration_to_yojson (x : clone_to_refreshable_configuration) =
  assoc_to_yojson
    [
      ( "sourceAutonomousDatabaseId",
        Some (resource_id_or_arn_to_yojson x.source_autonomous_database_id) );
      ("refreshableMode", option_to_yojson refreshable_mode_to_yojson x.refreshable_mode);
      ( "autoRefreshFrequencyInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_frequency_in_seconds );
      ( "autoRefreshPointLagInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_point_lag_in_seconds );
      ( "timeOfAutoRefreshStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_auto_refresh_start );
      ("openMode", option_to_yojson open_mode_to_yojson x.open_mode);
      ("cloneType", option_to_yojson clone_type_to_yojson x.clone_type);
    ]

let iam_role_status_to_yojson (x : iam_role_status) =
  match x with
  | ASSOCIATING -> `String "ASSOCIATING"
  | DISASSOCIATING -> `String "DISASSOCIATING"
  | FAILED -> `String "FAILED"
  | CONNECTED -> `String "CONNECTED"
  | DISCONNECTED -> `String "DISCONNECTED"
  | PARTIALLY_CONNECTED -> `String "PARTIALLY_CONNECTED"
  | UNKNOWN -> `String "UNKNOWN"

let iam_role_to_yojson (x : iam_role) =
  assoc_to_yojson
    [
      ("iamRoleArn", option_to_yojson role_arn_to_yojson x.iam_role_arn);
      ("status", option_to_yojson iam_role_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("awsIntegration", option_to_yojson supported_aws_integration_to_yojson x.aws_integration);
    ]

let iam_role_list_to_yojson tree = list_to_yojson iam_role_to_yojson tree

let weeks_of_month_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree

let preference_type_to_yojson (x : preference_type) =
  match x with
  | NO_PREFERENCE -> `String "NO_PREFERENCE"
  | CUSTOM_PREFERENCE -> `String "CUSTOM_PREFERENCE"

let patching_mode_type_to_yojson (x : patching_mode_type) =
  match x with ROLLING -> `String "ROLLING" | NONROLLING -> `String "NONROLLING"

let month_name_to_yojson (x : month_name) =
  match x with
  | JANUARY -> `String "JANUARY"
  | FEBRUARY -> `String "FEBRUARY"
  | MARCH -> `String "MARCH"
  | APRIL -> `String "APRIL"
  | MAY -> `String "MAY"
  | JUNE -> `String "JUNE"
  | JULY -> `String "JULY"
  | AUGUST -> `String "AUGUST"
  | SEPTEMBER -> `String "SEPTEMBER"
  | OCTOBER -> `String "OCTOBER"
  | NOVEMBER -> `String "NOVEMBER"
  | DECEMBER -> `String "DECEMBER"

let month_to_yojson (x : month) =
  assoc_to_yojson [ ("name", option_to_yojson month_name_to_yojson x.name) ]

let months_to_yojson tree = list_to_yojson month_to_yojson tree

let hours_of_day_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree

let days_of_week_to_yojson tree = list_to_yojson day_of_week_to_yojson tree

let maintenance_window_to_yojson (x : maintenance_window) =
  assoc_to_yojson
    [
      ( "customActionTimeoutInMins",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.custom_action_timeout_in_mins );
      ("daysOfWeek", option_to_yojson days_of_week_to_yojson x.days_of_week);
      ("hoursOfDay", option_to_yojson hours_of_day_to_yojson x.hours_of_day);
      ( "isCustomActionTimeoutEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_custom_action_timeout_enabled );
      ( "leadTimeInWeeks",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.lead_time_in_weeks );
      ("months", option_to_yojson months_to_yojson x.months);
      ("patchingMode", option_to_yojson patching_mode_type_to_yojson x.patching_mode);
      ("preference", option_to_yojson preference_type_to_yojson x.preference);
      ("skipRu", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.skip_ru);
      ("weeksOfMonth", option_to_yojson weeks_of_month_to_yojson x.weeks_of_month);
    ]

let resource_display_name_to_yojson = string_to_yojson

let cloud_autonomous_vm_cluster_to_yojson (x : cloud_autonomous_vm_cluster) =
  assoc_to_yojson
    [
      ("cloudAutonomousVmClusterId", Some (resource_id_to_yojson x.cloud_autonomous_vm_cluster_id));
      ( "cloudAutonomousVmClusterArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_autonomous_vm_cluster_arn );
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cloudExadataInfrastructureId",
        option_to_yojson resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson resource_arn_to_yojson x.cloud_exadata_infrastructure_arn );
      ( "autonomousDataStoragePercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
          x.autonomous_data_storage_percentage );
      ( "autonomousDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.autonomous_data_storage_size_in_t_bs );
      ( "availableAutonomousDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.available_autonomous_data_storage_size_in_t_bs );
      ( "availableContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_container_databases );
      ( "availableCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.available_cpus );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "cpuCoreCountPerNode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.cpu_core_count_per_node );
      ( "cpuPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.cpu_percentage );
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("domain", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain);
      ( "exadataStorageInTBsLowestScaledValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.exadata_storage_in_t_bs_lowest_scaled_value );
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ( "isMtlsEnabledVmCluster",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_enabled_vm_cluster );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "maxAcdsLowestScaledValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_acds_lowest_scaled_value );
      ( "memoryPerOracleComputeUnitInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_per_oracle_compute_unit_in_g_bs );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "nodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.node_count );
      ( "nonProvisionableAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.non_provisionable_autonomous_container_databases );
      ( "provisionableAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.provisionable_autonomous_container_databases );
      ( "provisionedAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.provisioned_autonomous_container_databases );
      ( "provisionedCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.provisioned_cpus
      );
      ( "reclaimableCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.reclaimable_cpus
      );
      ( "reservedCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.reserved_cpus );
      ( "scanListenerPortNonTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_non_tls );
      ( "scanListenerPortTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_tls );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "timeDatabaseSslCertificateExpires",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_database_ssl_certificate_expires );
      ( "timeOrdsCertificateExpires",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_ords_certificate_expires );
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ( "totalContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_container_databases );
      ("iamRoles", option_to_yojson iam_role_list_to_yojson x.iam_roles);
    ]

let cloud_autonomous_vm_cluster_summary_to_yojson (x : cloud_autonomous_vm_cluster_summary) =
  assoc_to_yojson
    [
      ("cloudAutonomousVmClusterId", Some (resource_id_to_yojson x.cloud_autonomous_vm_cluster_id));
      ( "cloudAutonomousVmClusterArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_autonomous_vm_cluster_arn );
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cloudExadataInfrastructureId",
        option_to_yojson resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson resource_arn_to_yojson x.cloud_exadata_infrastructure_arn );
      ( "autonomousDataStoragePercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
          x.autonomous_data_storage_percentage );
      ( "autonomousDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.autonomous_data_storage_size_in_t_bs );
      ( "availableAutonomousDataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.available_autonomous_data_storage_size_in_t_bs );
      ( "availableContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_container_databases );
      ( "availableCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.available_cpus );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "cpuCoreCountPerNode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.cpu_core_count_per_node );
      ( "cpuPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.cpu_percentage );
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_g_bs );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("domain", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain);
      ( "exadataStorageInTBsLowestScaledValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.exadata_storage_in_t_bs_lowest_scaled_value );
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ( "isMtlsEnabledVmCluster",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_enabled_vm_cluster );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "maxAcdsLowestScaledValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_acds_lowest_scaled_value );
      ( "memoryPerOracleComputeUnitInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_per_oracle_compute_unit_in_g_bs );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "nodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.node_count );
      ( "nonProvisionableAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.non_provisionable_autonomous_container_databases );
      ( "provisionableAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.provisionable_autonomous_container_databases );
      ( "provisionedAutonomousContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.provisioned_autonomous_container_databases );
      ( "provisionedCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.provisioned_cpus
      );
      ( "reclaimableCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.reclaimable_cpus
      );
      ( "reservedCpus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.reserved_cpus );
      ( "scanListenerPortNonTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_non_tls );
      ( "scanListenerPortTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_tls );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "timeDatabaseSslCertificateExpires",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_database_ssl_certificate_expires );
      ( "timeOrdsCertificateExpires",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_ords_certificate_expires );
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ( "totalContainerDatabases",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_container_databases );
      ("iamRoles", option_to_yojson iam_role_list_to_yojson x.iam_roles);
    ]

let cloud_autonomous_vm_cluster_list_to_yojson tree =
  list_to_yojson cloud_autonomous_vm_cluster_summary_to_yojson tree

let cloud_autonomous_vm_cluster_resource_details_to_yojson
    (x : cloud_autonomous_vm_cluster_resource_details) =
  assoc_to_yojson
    [
      ( "cloudAutonomousVmClusterId",
        option_to_yojson resource_id_to_yojson x.cloud_autonomous_vm_cluster_id );
      ( "unallocatedAdbStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.unallocated_adb_storage_in_t_bs );
    ]

let cloud_autonomous_vm_cluster_resource_details_list_to_yojson tree =
  list_to_yojson cloud_autonomous_vm_cluster_resource_details_to_yojson tree

let cloud_exadata_infrastructure_to_yojson (x : cloud_exadata_infrastructure) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_exadata_infrastructure_arn );
      ( "activatedStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.activated_storage_count );
      ( "additionalStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.additional_storage_count );
      ( "availableStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_storage_size_in_g_bs );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.compute_count );
      ( "cpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_count );
      ( "customerContactsToSendToOCI",
        option_to_yojson customer_contacts_to_yojson x.customer_contacts_to_send_to_oc_i );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "dbServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_server_version
      );
      ( "lastMaintenanceRunId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_maintenance_run_id );
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "maxCpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_cpu_count );
      ( "maxDataStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.max_data_storage_in_t_bs );
      ( "maxDbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_db_node_storage_size_in_g_bs );
      ( "maxMemoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_memory_in_g_bs );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "monthlyDbServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_db_server_version );
      ( "monthlyStorageServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_storage_server_version );
      ( "nextMaintenanceRunId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.next_maintenance_run_id );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "storageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.storage_count );
      ( "storageServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.storage_server_version );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "totalStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_storage_size_in_g_bs );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "databaseServerType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.database_server_type );
      ( "storageServerType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.storage_server_type );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
    ]

let cloud_exadata_infrastructure_summary_to_yojson (x : cloud_exadata_infrastructure_summary) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_exadata_infrastructure_arn );
      ( "activatedStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.activated_storage_count );
      ( "additionalStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.additional_storage_count );
      ( "availableStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_storage_size_in_g_bs );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.compute_count );
      ( "cpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_count );
      ( "customerContactsToSendToOCI",
        option_to_yojson customer_contacts_to_yojson x.customer_contacts_to_send_to_oc_i );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "dbServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_server_version
      );
      ( "lastMaintenanceRunId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_maintenance_run_id );
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "maxCpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_cpu_count );
      ( "maxDataStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.max_data_storage_in_t_bs );
      ( "maxDbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_db_node_storage_size_in_g_bs );
      ( "maxMemoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_memory_in_g_bs );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "monthlyDbServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_db_server_version );
      ( "monthlyStorageServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_storage_server_version );
      ( "nextMaintenanceRunId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.next_maintenance_run_id );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "storageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.storage_count );
      ( "storageServerVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.storage_server_version );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "totalStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_storage_size_in_g_bs );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ( "databaseServerType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.database_server_type );
      ( "storageServerType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.storage_server_type );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
    ]

let cloud_exadata_infrastructure_list_to_yojson tree =
  list_to_yojson cloud_exadata_infrastructure_summary_to_yojson tree

let cloud_exadata_infrastructure_unallocated_resources_to_yojson
    (x : cloud_exadata_infrastructure_unallocated_resources) =
  assoc_to_yojson
    [
      ( "cloudAutonomousVmClusters",
        option_to_yojson cloud_autonomous_vm_cluster_resource_details_list_to_yojson
          x.cloud_autonomous_vm_clusters );
      ( "cloudExadataInfrastructureDisplayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_exadata_infrastructure_display_name );
      ( "exadataStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.exadata_storage_in_t_bs );
      ( "cloudExadataInfrastructureId",
        option_to_yojson resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id );
      ( "localStorageInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.local_storage_in_g_bs );
      ( "memoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.memory_in_g_bs );
      ("ocpus", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.ocpus);
    ]

let sensitive_string_list_to_yojson tree = list_to_yojson sensitive_string_to_yojson tree

let objective_to_yojson (x : objective) =
  match x with
  | AUTO -> `String "AUTO"
  | BALANCED -> `String "BALANCED"
  | BASIC -> `String "BASIC"
  | HIGH_THROUGHPUT -> `String "HIGH_THROUGHPUT"
  | LOW_LATENCY -> `String "LOW_LATENCY"

let iorm_lifecycle_state_to_yojson (x : iorm_lifecycle_state) =
  match x with
  | BOOTSTRAPPING -> `String "BOOTSTRAPPING"
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"
  | FAILED -> `String "FAILED"
  | UPDATING -> `String "UPDATING"

let db_iorm_config_to_yojson (x : db_iorm_config) =
  assoc_to_yojson
    [
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ( "flashCacheLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.flash_cache_limit
      );
      ("share", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.share);
    ]

let db_iorm_config_list_to_yojson tree = list_to_yojson db_iorm_config_to_yojson tree

let exadata_iorm_config_to_yojson (x : exadata_iorm_config) =
  assoc_to_yojson
    [
      ("dbPlans", option_to_yojson db_iorm_config_list_to_yojson x.db_plans);
      ( "lifecycleDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.lifecycle_details
      );
      ("lifecycleState", option_to_yojson iorm_lifecycle_state_to_yojson x.lifecycle_state);
      ("objective", option_to_yojson objective_to_yojson x.objective);
    ]

let disk_redundancy_to_yojson (x : disk_redundancy) =
  match x with HIGH -> `String "HIGH" | NORMAL -> `String "NORMAL"

let data_collection_options_to_yojson (x : data_collection_options) =
  assoc_to_yojson
    [
      ( "isDiagnosticsEventsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_diagnostics_events_enabled );
      ( "isHealthMonitoringEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_health_monitoring_enabled );
      ( "isIncidentLogsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_incident_logs_enabled );
    ]

let cloud_vm_cluster_to_yojson (x : cloud_vm_cluster) =
  assoc_to_yojson
    [
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cloudVmClusterArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_vm_cluster_arn );
      ( "cloudExadataInfrastructureId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_exadata_infrastructure_id );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson resource_arn_to_yojson x.cloud_exadata_infrastructure_arn );
      ( "clusterName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_name );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "dataCollectionOptions",
        option_to_yojson data_collection_options_to_yojson x.data_collection_options );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ("diskRedundancy", option_to_yojson disk_redundancy_to_yojson x.disk_redundancy);
      ( "giVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.gi_version );
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ("iormConfigCache", option_to_yojson exadata_iorm_config_to_yojson x.iorm_config_cache);
      ( "isLocalBackupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_backup_enabled );
      ( "isSparseDiskgroupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_sparse_diskgroup_enabled );
      ( "lastUpdateHistoryEntryId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_update_history_entry_id );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "listenerPort",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.listener_port );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "nodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.node_count );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ("domain", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain);
      ( "scanDnsName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.scan_dns_name );
      ( "scanDnsRecordId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scan_dns_record_id );
      ("scanIpIds", option_to_yojson string_list_to_yojson x.scan_ip_ids);
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ("sshPublicKeys", option_to_yojson sensitive_string_list_to_yojson x.ssh_public_keys);
      ( "storageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.storage_size_in_g_bs );
      ( "systemVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.system_version );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ("vipIds", option_to_yojson string_list_to_yojson x.vip_ids);
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ("iamRoles", option_to_yojson iam_role_list_to_yojson x.iam_roles);
    ]

let cloud_vm_cluster_summary_to_yojson (x : cloud_vm_cluster_summary) =
  assoc_to_yojson
    [
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cloudVmClusterArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_vm_cluster_arn );
      ( "cloudExadataInfrastructureId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.cloud_exadata_infrastructure_id );
      ( "cloudExadataInfrastructureArn",
        option_to_yojson resource_arn_to_yojson x.cloud_exadata_infrastructure_arn );
      ( "clusterName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cluster_name );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "dataCollectionOptions",
        option_to_yojson data_collection_options_to_yojson x.data_collection_options );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ("diskRedundancy", option_to_yojson disk_redundancy_to_yojson x.disk_redundancy);
      ( "giVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.gi_version );
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ("iormConfigCache", option_to_yojson exadata_iorm_config_to_yojson x.iorm_config_cache);
      ( "isLocalBackupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_backup_enabled );
      ( "isSparseDiskgroupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_sparse_diskgroup_enabled );
      ( "lastUpdateHistoryEntryId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_update_history_entry_id );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "listenerPort",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.listener_port );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "nodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.node_count );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("ociUrl", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_url);
      ("domain", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain);
      ( "scanDnsName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.scan_dns_name );
      ( "scanDnsRecordId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.scan_dns_record_id );
      ("scanIpIds", option_to_yojson string_list_to_yojson x.scan_ip_ids);
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ("sshPublicKeys", option_to_yojson sensitive_string_list_to_yojson x.ssh_public_keys);
      ( "storageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.storage_size_in_g_bs );
      ( "systemVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.system_version );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ("vipIds", option_to_yojson string_list_to_yojson x.vip_ids);
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
      ("odbNetworkArn", option_to_yojson resource_arn_to_yojson x.odb_network_arn);
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ("iamRoles", option_to_yojson iam_role_list_to_yojson x.iam_roles);
    ]

let cloud_vm_cluster_list_to_yojson tree = list_to_yojson cloud_vm_cluster_summary_to_yojson tree
let cluster_name_to_yojson = string_to_yojson

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("quotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
    ]

let create_autonomous_database_output_to_yojson (x : create_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let request_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let general_input_string_to_yojson = string_to_yojson

let encryption_key_configuration_input_to_yojson (x : encryption_key_configuration_input) =
  match x with
  | AwsEncryptionKey arg ->
      assoc_to_yojson
        [ ("awsEncryptionKey", Some (aws_encryption_key_configuration_input_to_yojson arg)) ]

let encryption_key_provider_input_to_yojson (x : encryption_key_provider_input) =
  match x with ORACLE_MANAGED -> `String "ORACLE_MANAGED" | AWS_KMS -> `String "AWS_KMS"

let cross_region_disaster_recovery_configuration_to_yojson
    (x : cross_region_disaster_recovery_configuration) =
  assoc_to_yojson
    [
      ("sourceAutonomousDatabaseArn", Some (arn_to_yojson x.source_autonomous_database_arn));
      ( "remoteDisasterRecoveryType",
        Some (disaster_recovery_type_to_yojson x.remote_disaster_recovery_type) );
      ( "isReplicateAutomaticBackups",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_replicate_automatic_backups );
    ]

let cross_region_data_guard_configuration_to_yojson (x : cross_region_data_guard_configuration) =
  assoc_to_yojson
    [ ("sourceAutonomousDatabaseArn", Some (arn_to_yojson x.source_autonomous_database_arn)) ]

let point_in_time_restore_configuration_to_yojson (x : point_in_time_restore_configuration) =
  assoc_to_yojson
    [
      ( "sourceAutonomousDatabaseId",
        Some (resource_id_or_arn_to_yojson x.source_autonomous_database_id) );
      ("cloneType", Some (clone_type_to_yojson x.clone_type));
      ( "timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.timestamp );
      ( "useLatestAvailableBackupTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.use_latest_available_backup_timestamp );
      ("cloneTableSpaceList", option_to_yojson integer_list_to_yojson x.clone_table_space_list);
    ]

let restore_from_backup_configuration_to_yojson (x : restore_from_backup_configuration) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseBackupId",
        Some (resource_id_or_arn_to_yojson x.autonomous_database_backup_id) );
      ("cloneType", Some (clone_type_to_yojson x.clone_type));
      ("cloneTableSpaceList", option_to_yojson integer_list_to_yojson x.clone_table_space_list);
    ]

let database_clone_configuration_to_yojson (x : database_clone_configuration) =
  assoc_to_yojson
    [
      ( "sourceAutonomousDatabaseId",
        Some (resource_id_or_arn_to_yojson x.source_autonomous_database_id) );
      ("cloneType", Some (clone_type_to_yojson x.clone_type));
    ]

let source_configuration_to_yojson (x : source_configuration) =
  match x with
  | DatabaseClone arg ->
      assoc_to_yojson [ ("databaseClone", Some (database_clone_configuration_to_yojson arg)) ]
  | RestoreFromBackup arg ->
      assoc_to_yojson
        [ ("restoreFromBackup", Some (restore_from_backup_configuration_to_yojson arg)) ]
  | PointInTimeRestore arg ->
      assoc_to_yojson
        [ ("pointInTimeRestore", Some (point_in_time_restore_configuration_to_yojson arg)) ]
  | CrossRegionDataGuard arg ->
      assoc_to_yojson
        [ ("crossRegionDataGuard", Some (cross_region_data_guard_configuration_to_yojson arg)) ]
  | CrossRegionDisasterRecovery arg ->
      assoc_to_yojson
        [
          ( "crossRegionDisasterRecovery",
            Some (cross_region_disaster_recovery_configuration_to_yojson arg) );
        ]
  | CloneToRefreshable arg ->
      assoc_to_yojson
        [ ("cloneToRefreshable", Some (clone_to_refreshable_configuration_to_yojson arg)) ]

let source_type_to_yojson (x : source_type) =
  match x with
  | NONE -> `String "NONE"
  | DATABASE -> `String "DATABASE"
  | BACKUP_FROM_ID -> `String "BACKUP_FROM_ID"
  | BACKUP_FROM_TIMESTAMP -> `String "BACKUP_FROM_TIMESTAMP"
  | CROSS_REGION_DATAGUARD -> `String "CROSS_REGION_DATAGUARD"
  | CROSS_REGION_DISASTER_RECOVERY -> `String "CROSS_REGION_DISASTER_RECOVERY"
  | CLONE_TO_REFRESHABLE -> `String "CLONE_TO_REFRESHABLE"

let transportable_tablespace_to_yojson (x : transportable_tablespace) =
  assoc_to_yojson
    [
      ( "ttsBundleUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tts_bundle_url );
    ]

let create_autonomous_database_input_to_yojson (x : create_autonomous_database_input) =
  assoc_to_yojson
    [
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ("adminPassword", option_to_yojson sensitive_string_to_yojson x.admin_password);
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.compute_count );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_g_bs );
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
      ( "isAutoScalingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_enabled );
      ( "isAutoScalingForStorageEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_for_storage_enabled );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "characterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.character_set );
      ( "ncharacterSet",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ncharacter_set );
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ("databaseEdition", option_to_yojson database_edition_to_yojson x.database_edition);
      ( "standbyAllowlistedIpsSource",
        option_to_yojson standby_allowlisted_ips_source_to_yojson x.standby_allowlisted_ips_source
      );
      ( "autonomousMaintenanceScheduleType",
        option_to_yojson autonomous_maintenance_schedule_type_to_yojson
          x.autonomous_maintenance_schedule_type );
      ( "backupRetentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.backup_retention_period_in_days );
      ( "byolComputeCountLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.byol_compute_count_limit );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "customerContactsToSendToOCI",
        option_to_yojson customer_contacts_to_yojson x.customer_contacts_to_send_to_oc_i );
      ( "privateEndpointIp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_ip );
      ( "privateEndpointLabel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_label );
      ( "resourcePoolLeaderId",
        option_to_yojson resource_id_or_arn_to_yojson x.resource_pool_leader_id );
      ( "resourcePoolSummary",
        option_to_yojson resource_pool_summary_to_yojson x.resource_pool_summary );
      ( "scheduledOperations",
        option_to_yojson scheduled_operation_details_list_to_yojson x.scheduled_operations );
      ("standbyAllowlistedIps", option_to_yojson string_list_to_yojson x.standby_allowlisted_ips);
      ("allowlistedIps", option_to_yojson string_list_to_yojson x.allowlisted_ips);
      ( "transportableTablespace",
        option_to_yojson transportable_tablespace_to_yojson x.transportable_tablespace );
      ( "isBackupRetentionLocked",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_backup_retention_locked );
      ( "isLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_data_guard_enabled );
      ( "isMtlsConnectionRequired",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_connection_required );
      ("dbToolsDetails", option_to_yojson database_tool_list_to_yojson x.db_tools_details);
      ("source", option_to_yojson source_type_to_yojson x.source);
      ("sourceConfiguration", option_to_yojson source_configuration_to_yojson x.source_configuration);
      ( "encryptionKeyProvider",
        option_to_yojson encryption_key_provider_input_to_yojson x.encryption_key_provider );
      ( "encryptionKeyConfiguration",
        option_to_yojson encryption_key_configuration_input_to_yojson x.encryption_key_configuration
      );
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
    ]

let create_autonomous_database_backup_output_to_yojson
    (x : create_autonomous_database_backup_output) =
  assoc_to_yojson
    [
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "autonomousDatabaseBackupId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_backup_id)
      );
    ]

let create_autonomous_database_backup_input_to_yojson (x : create_autonomous_database_backup_input)
    =
  assoc_to_yojson
    [
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ( "retentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retention_period_in_days );
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
    ]

let create_autonomous_database_wallet_output_to_yojson
    (x : create_autonomous_database_wallet_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseWalletFile",
        Some (autonomous_database_wallet_file_to_yojson x.autonomous_database_wallet_file) );
    ]

let wallet_type_to_yojson (x : wallet_type) =
  match x with REGIONAL -> `String "REGIONAL" | INSTANCE -> `String "INSTANCE"

let create_autonomous_database_wallet_input_to_yojson (x : create_autonomous_database_wallet_input)
    =
  assoc_to_yojson
    [
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
      ("walletType", option_to_yojson wallet_type_to_yojson x.wallet_type);
      ("password", Some (sensitive_string_to_yojson x.password));
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_cloud_autonomous_vm_cluster_output_to_yojson
    (x : create_cloud_autonomous_vm_cluster_output) =
  assoc_to_yojson
    [
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cloudAutonomousVmClusterId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cloud_autonomous_vm_cluster_id)
      );
    ]

let create_cloud_autonomous_vm_cluster_input_to_yojson
    (x : create_cloud_autonomous_vm_cluster_input) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
      ("displayName", Some (resource_display_name_to_yojson x.display_name));
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "autonomousDataStorageSizeInTBs",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
             x.autonomous_data_storage_size_in_t_bs) );
      ( "cpuCoreCountPerNode",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count_per_node) );
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ( "isMtlsEnabledVmCluster",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_enabled_vm_cluster );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "memoryPerOracleComputeUnitInGBs",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
             x.memory_per_oracle_compute_unit_in_g_bs) );
      ( "scanListenerPortNonTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_non_tls );
      ( "scanListenerPortTls",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_tls );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ( "totalContainerDatabases",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.total_container_databases)
      );
    ]

let create_cloud_exadata_infrastructure_output_to_yojson
    (x : create_cloud_exadata_infrastructure_output) =
  assoc_to_yojson
    [
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cloudExadataInfrastructureId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cloud_exadata_infrastructure_id)
      );
    ]

let create_cloud_exadata_infrastructure_input_to_yojson
    (x : create_cloud_exadata_infrastructure_input) =
  assoc_to_yojson
    [
      ("displayName", Some (resource_display_name_to_yojson x.display_name));
      ("shape", Some (general_input_string_to_yojson x.shape));
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "computeCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.compute_count) );
      ( "customerContactsToSendToOCI",
        option_to_yojson customer_contacts_to_yojson x.customer_contacts_to_send_to_oc_i );
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
      ( "storageCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.storage_count) );
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("databaseServerType", option_to_yojson general_input_string_to_yojson x.database_server_type);
      ("storageServerType", option_to_yojson general_input_string_to_yojson x.storage_server_type);
    ]

let create_cloud_vm_cluster_output_to_yojson (x : create_cloud_vm_cluster_output) =
  assoc_to_yojson
    [
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cloudVmClusterId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cloud_vm_cluster_id) );
    ]

let hostname_to_yojson = string_to_yojson

let create_cloud_vm_cluster_input_to_yojson (x : create_cloud_vm_cluster_input) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
      ( "cpuCoreCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count) );
      ("displayName", Some (resource_display_name_to_yojson x.display_name));
      ("giVersion", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.gi_version));
      ("hostname", Some (hostname_to_yojson x.hostname));
      ("sshPublicKeys", Some (string_list_to_yojson x.ssh_public_keys));
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
      ("clusterName", option_to_yojson cluster_name_to_yojson x.cluster_name);
      ( "dataCollectionOptions",
        option_to_yojson data_collection_options_to_yojson x.data_collection_options );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "isLocalBackupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_backup_enabled );
      ( "isSparseDiskgroupEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_sparse_diskgroup_enabled );
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "systemVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.system_version );
      ( "timeZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.time_zone );
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "scanListenerPortTcp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.scan_listener_port_tcp );
    ]

let create_odb_network_output_to_yojson (x : create_odb_network_output) =
  assoc_to_yojson
    [
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "odbNetworkId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_id) );
    ]

let policy_document_to_yojson = string_to_yojson

let create_odb_network_input_to_yojson (x : create_odb_network_input) =
  assoc_to_yojson
    [
      ("displayName", Some (resource_display_name_to_yojson x.display_name));
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "clientSubnetCidr",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_subnet_cidr) );
      ( "backupSubnetCidr",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.backup_subnet_cidr );
      ( "customDomainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.custom_domain_name );
      ( "defaultDnsPrefix",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_dns_prefix );
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("s3Access", option_to_yojson access_to_yojson x.s3_access);
      ("zeroEtlAccess", option_to_yojson access_to_yojson x.zero_etl_access);
      ("stsAccess", option_to_yojson access_to_yojson x.sts_access);
      ("kmsAccess", option_to_yojson access_to_yojson x.kms_access);
      ("s3PolicyDocument", option_to_yojson policy_document_to_yojson x.s3_policy_document);
      ("stsPolicyDocument", option_to_yojson policy_document_to_yojson x.sts_policy_document);
      ("kmsPolicyDocument", option_to_yojson policy_document_to_yojson x.kms_policy_document);
      ( "crossRegionS3RestoreSourcesToEnable",
        option_to_yojson string_list_to_yojson x.cross_region_s3_restore_sources_to_enable );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
    ]

let create_odb_peering_connection_output_to_yojson (x : create_odb_peering_connection_output) =
  assoc_to_yojson
    [
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "odbPeeringConnectionId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_peering_connection_id)
      );
    ]

let peer_network_route_table_id_to_yojson = string_to_yojson

let peer_network_route_table_id_list_to_yojson tree =
  list_to_yojson peer_network_route_table_id_to_yojson tree

let peered_cidr_to_yojson = string_to_yojson
let peered_cidr_list_to_yojson tree = list_to_yojson peered_cidr_to_yojson tree

let create_odb_peering_connection_input_to_yojson (x : create_odb_peering_connection_input) =
  assoc_to_yojson
    [
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
      ("peerNetworkId", Some (resource_id_or_arn_to_yojson x.peer_network_id));
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ( "peerNetworkCidrsToBeAdded",
        option_to_yojson peered_cidr_list_to_yojson x.peer_network_cidrs_to_be_added );
      ( "peerNetworkRouteTableIds",
        option_to_yojson peer_network_route_table_id_list_to_yojson x.peer_network_route_table_ids
      );
      ( "clientToken",
        Some
          (general_input_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
    ]

let managed_resource_status_to_yojson (x : managed_resource_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"
  | DISABLED -> `String "DISABLED"
  | DISABLING -> `String "DISABLING"

let cross_region_s3_restore_sources_access_to_yojson (x : cross_region_s3_restore_sources_access) =
  assoc_to_yojson
    [
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("ipv4Addresses", option_to_yojson string_list_to_yojson x.ipv4_addresses);
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
    ]

let cross_region_s3_restore_sources_access_list_to_yojson tree =
  list_to_yojson cross_region_s3_restore_sources_access_to_yojson tree

let db_node_maintenance_type_to_yojson (x : db_node_maintenance_type) =
  match x with VMDB_REBOOT_MIGRATION -> `String "VMDB_REBOOT_MIGRATION"

let db_node_resource_status_to_yojson (x : db_node_resource_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | FAILED -> `String "FAILED"
  | PROVISIONING -> `String "PROVISIONING"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | UPDATING -> `String "UPDATING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"
  | STARTING -> `String "STARTING"

let db_node_to_yojson (x : db_node) =
  assoc_to_yojson
    [
      ("dbNodeId", option_to_yojson resource_id_to_yojson x.db_node_id);
      ("dbNodeArn", option_to_yojson resource_arn_to_yojson x.db_node_arn);
      ("status", option_to_yojson db_node_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "additionalDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.additional_details );
      ( "backupIpId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_ip_id );
      ( "backupVnic2Id",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_vnic2_id
      );
      ( "backupVnicId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_vnic_id );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ("dbServerId", option_to_yojson resource_id_to_yojson x.db_server_id);
      ( "dbSystemId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_system_id );
      ( "faultDomain",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.fault_domain );
      ( "hostIpId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.host_ip_id );
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("maintenanceType", option_to_yojson db_node_maintenance_type_to_yojson x.maintenance_type);
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "softwareStorageSizeInGB",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.software_storage_size_in_g_b );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "timeMaintenanceWindowEnd",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_maintenance_window_end );
      ( "timeMaintenanceWindowStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_maintenance_window_start );
      ( "totalCpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_cpu_core_count );
      ( "vnic2Id",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vnic2_id );
      ("vnicId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vnic_id);
      ( "privateIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_ip_address );
      ( "floatingIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.floating_ip_address );
    ]

let db_node_summary_to_yojson (x : db_node_summary) =
  assoc_to_yojson
    [
      ("dbNodeId", option_to_yojson resource_id_to_yojson x.db_node_id);
      ("dbNodeArn", option_to_yojson resource_arn_to_yojson x.db_node_arn);
      ("status", option_to_yojson db_node_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "additionalDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.additional_details );
      ( "backupIpId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_ip_id );
      ( "backupVnic2Id",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_vnic2_id
      );
      ( "backupVnicId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.backup_vnic_id );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ("dbServerId", option_to_yojson resource_id_to_yojson x.db_server_id);
      ( "dbSystemId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_system_id );
      ( "faultDomain",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.fault_domain );
      ( "hostIpId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.host_ip_id );
      ( "hostname",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hostname );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ("maintenanceType", option_to_yojson db_node_maintenance_type_to_yojson x.maintenance_type);
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ( "softwareStorageSizeInGB",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.software_storage_size_in_g_b );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "timeMaintenanceWindowEnd",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_maintenance_window_end );
      ( "timeMaintenanceWindowStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_maintenance_window_start );
      ( "totalCpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.total_cpu_core_count );
      ( "vnic2Id",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vnic2_id );
      ("vnicId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vnic_id);
    ]

let db_node_list_to_yojson tree = list_to_yojson db_node_summary_to_yojson tree

let db_server_patching_status_to_yojson (x : db_server_patching_status) =
  match x with
  | COMPLETE -> `String "COMPLETE"
  | FAILED -> `String "FAILED"
  | MAINTENANCE_IN_PROGRESS -> `String "MAINTENANCE_IN_PROGRESS"
  | SCHEDULED -> `String "SCHEDULED"

let db_server_patching_details_to_yojson (x : db_server_patching_details) =
  assoc_to_yojson
    [
      ( "estimatedPatchDuration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.estimated_patch_duration );
      ("patchingStatus", option_to_yojson db_server_patching_status_to_yojson x.patching_status);
      ( "timePatchingEnded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_patching_ended );
      ( "timePatchingStarted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.time_patching_started );
    ]

let db_server_to_yojson (x : db_server) =
  assoc_to_yojson
    [
      ("dbServerId", option_to_yojson resource_id_to_yojson x.db_server_id);
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "dbServerPatchingDetails",
        option_to_yojson db_server_patching_details_to_yojson x.db_server_patching_details );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "exadataInfrastructureId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.exadata_infrastructure_id );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "maxCpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_cpu_count );
      ( "maxDbNodeStorageInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_db_node_storage_in_g_bs );
      ( "maxMemoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_memory_in_g_bs );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("vmClusterIds", option_to_yojson string_list_to_yojson x.vm_cluster_ids);
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ("autonomousVmClusterIds", option_to_yojson string_list_to_yojson x.autonomous_vm_cluster_ids);
      ( "autonomousVirtualMachineIds",
        option_to_yojson string_list_to_yojson x.autonomous_virtual_machine_ids );
    ]

let db_server_summary_to_yojson (x : db_server_summary) =
  assoc_to_yojson
    [
      ("dbServerId", option_to_yojson resource_id_to_yojson x.db_server_id);
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "dbNodeStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.db_node_storage_size_in_g_bs );
      ( "dbServerPatchingDetails",
        option_to_yojson db_server_patching_details_to_yojson x.db_server_patching_details );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ( "exadataInfrastructureId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.exadata_infrastructure_id );
      ("ocid", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ocid);
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "maxCpuCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_cpu_count );
      ( "maxDbNodeStorageInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_db_node_storage_in_g_bs );
      ( "maxMemoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.max_memory_in_g_bs );
      ( "memorySizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_g_bs );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("vmClusterIds", option_to_yojson string_list_to_yojson x.vm_cluster_ids);
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ("autonomousVmClusterIds", option_to_yojson string_list_to_yojson x.autonomous_vm_cluster_ids);
      ( "autonomousVirtualMachineIds",
        option_to_yojson string_list_to_yojson x.autonomous_virtual_machine_ids );
    ]

let db_server_list_to_yojson tree = list_to_yojson db_server_summary_to_yojson tree

let shape_type_to_yojson (x : shape_type) =
  match x with
  | AMD -> `String "AMD"
  | INTEL -> `String "INTEL"
  | INTEL_FLEX_X9 -> `String "INTEL_FLEX_X9"
  | AMPERE_FLEX_A1 -> `String "AMPERE_FLEX_A1"

let db_system_shape_summary_to_yojson (x : db_system_shape_summary) =
  assoc_to_yojson
    [
      ( "availableCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_core_count );
      ( "availableCoreCountPerNode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_core_count_per_node );
      ( "availableDataStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_data_storage_in_t_bs );
      ( "availableDataStoragePerServerInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_data_storage_per_server_in_t_bs );
      ( "availableDbNodePerNodeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_db_node_per_node_in_g_bs );
      ( "availableDbNodeStorageInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_db_node_storage_in_g_bs );
      ( "availableMemoryInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_memory_in_g_bs );
      ( "availableMemoryPerNodeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.available_memory_per_node_in_g_bs );
      ( "coreCountIncrement",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.core_count_increment );
      ( "maxStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_storage_count
      );
      ( "maximumNodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.maximum_node_count );
      ( "minCoreCountPerNode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.min_core_count_per_node );
      ( "minDataStorageInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.min_data_storage_in_t_bs );
      ( "minDbNodeStoragePerNodeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.min_db_node_storage_per_node_in_g_bs );
      ( "minMemoryPerNodeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.min_memory_per_node_in_g_bs );
      ( "minStorageCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_storage_count
      );
      ( "minimumCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.minimum_core_count );
      ( "minimumNodeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.minimum_node_count );
      ( "runtimeMinimumCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.runtime_minimum_core_count );
      ( "shapeFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape_family );
      ("shapeType", option_to_yojson shape_type_to_yojson x.shape_type);
      ("name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
      ("computeModel", option_to_yojson compute_model_to_yojson x.compute_model);
      ( "areServerTypesSupported",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.are_server_types_supported );
    ]

let db_system_shape_list_to_yojson tree = list_to_yojson db_system_shape_summary_to_yojson tree
let delete_autonomous_database_output_to_yojson = unit_to_yojson

let delete_autonomous_database_input_to_yojson (x : delete_autonomous_database_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id)) ]

let delete_autonomous_database_backup_output_to_yojson = unit_to_yojson

let delete_autonomous_database_backup_input_to_yojson (x : delete_autonomous_database_backup_input)
    =
  assoc_to_yojson
    [ ("autonomousDatabaseBackupId", Some (resource_id_to_yojson x.autonomous_database_backup_id)) ]

let delete_cloud_autonomous_vm_cluster_output_to_yojson = unit_to_yojson

let delete_cloud_autonomous_vm_cluster_input_to_yojson
    (x : delete_cloud_autonomous_vm_cluster_input) =
  assoc_to_yojson
    [
      ("cloudAutonomousVmClusterId", Some (resource_id_to_yojson x.cloud_autonomous_vm_cluster_id));
    ]

let delete_cloud_exadata_infrastructure_output_to_yojson = unit_to_yojson

let delete_cloud_exadata_infrastructure_input_to_yojson
    (x : delete_cloud_exadata_infrastructure_input) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
    ]

let delete_cloud_vm_cluster_output_to_yojson = unit_to_yojson

let delete_cloud_vm_cluster_input_to_yojson (x : delete_cloud_vm_cluster_input) =
  assoc_to_yojson [ ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id)) ]

let delete_odb_network_output_to_yojson = unit_to_yojson

let delete_odb_network_input_to_yojson (x : delete_odb_network_input) =
  assoc_to_yojson
    [
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
      ( "deleteAssociatedResources",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.delete_associated_resources)
      );
    ]

let delete_odb_peering_connection_output_to_yojson = unit_to_yojson

let delete_odb_peering_connection_input_to_yojson (x : delete_odb_peering_connection_input) =
  assoc_to_yojson
    [ ("odbPeeringConnectionId", Some (resource_id_or_arn_to_yojson x.odb_peering_connection_id)) ]

let disassociate_iam_role_from_resource_output_to_yojson = unit_to_yojson

let disassociate_iam_role_from_resource_input_to_yojson
    (x : disassociate_iam_role_from_resource_input) =
  assoc_to_yojson
    [
      ("iamRoleArn", Some (role_arn_to_yojson x.iam_role_arn));
      ("awsIntegration", Some (supported_aws_integration_to_yojson x.aws_integration));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let failover_autonomous_database_output_to_yojson (x : failover_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let failover_autonomous_database_input_to_yojson (x : failover_autonomous_database_input) =
  assoc_to_yojson
    [
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
      ("peerDbArn", option_to_yojson resource_arn_to_yojson x.peer_db_arn);
    ]

let get_autonomous_database_output_to_yojson (x : get_autonomous_database_output) =
  assoc_to_yojson
    [ ("autonomousDatabase", Some (autonomous_database_to_yojson x.autonomous_database)) ]

let get_autonomous_database_input_to_yojson (x : get_autonomous_database_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id)) ]

let get_autonomous_database_backup_output_to_yojson (x : get_autonomous_database_backup_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseBackup",
        option_to_yojson autonomous_database_backup_to_yojson x.autonomous_database_backup );
    ]

let get_autonomous_database_backup_input_to_yojson (x : get_autonomous_database_backup_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseBackupId", Some (resource_id_to_yojson x.autonomous_database_backup_id)) ]

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
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
      ("dbServers", option_to_yojson string_list_to_yojson x.db_servers);
    ]

let get_cloud_vm_cluster_output_to_yojson (x : get_cloud_vm_cluster_output) =
  assoc_to_yojson
    [ ("cloudVmCluster", option_to_yojson cloud_vm_cluster_to_yojson x.cloud_vm_cluster) ]

let get_cloud_vm_cluster_input_to_yojson (x : get_cloud_vm_cluster_input) =
  assoc_to_yojson [ ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id)) ]

let get_db_node_output_to_yojson (x : get_db_node_output) =
  assoc_to_yojson [ ("dbNode", option_to_yojson db_node_to_yojson x.db_node) ]

let get_db_node_input_to_yojson (x : get_db_node_input) =
  assoc_to_yojson
    [
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
      ("dbNodeId", Some (resource_id_to_yojson x.db_node_id));
    ]

let get_db_server_output_to_yojson (x : get_db_server_output) =
  assoc_to_yojson [ ("dbServer", option_to_yojson db_server_to_yojson x.db_server) ]

let get_db_server_input_to_yojson (x : get_db_server_input) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
      ("dbServerId", Some (resource_id_to_yojson x.db_server_id));
    ]

let subscription_error_to_yojson (x : subscription_error) =
  assoc_to_yojson
    [
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
    ]

let subscription_errors_to_yojson tree = list_to_yojson subscription_error_to_yojson tree

let oci_aws_integration_to_yojson (x : oci_aws_integration) =
  match x with KmsTde -> `String "KmsTde"

let oci_iam_role_to_yojson (x : oci_iam_role) =
  assoc_to_yojson
    [
      ("iamRoleArn", option_to_yojson role_arn_to_yojson x.iam_role_arn);
      ("awsIntegration", option_to_yojson oci_aws_integration_to_yojson x.aws_integration);
    ]

let oci_iam_role_list_to_yojson tree = list_to_yojson oci_iam_role_to_yojson tree

let oci_identity_domain_to_yojson (x : oci_identity_domain) =
  assoc_to_yojson
    [
      ( "ociIdentityDomainId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_identity_domain_id );
      ( "ociIdentityDomainResourceUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_identity_domain_resource_url );
      ( "ociIdentityDomainUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_identity_domain_url );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "accountSetupCloudFormationUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.account_setup_cloud_formation_url );
    ]

let oci_onboarding_status_to_yojson (x : oci_onboarding_status) =
  match x with
  | NOT_STARTED -> `String "NOT_STARTED"
  | PENDING_LINK_GENERATION -> `String "PENDING_LINK_GENERATION"
  | PENDING_CUSTOMER_ACTION -> `String "PENDING_CUSTOMER_ACTION"
  | PENDING_INITIALIZATION -> `String "PENDING_INITIALIZATION"
  | ACTIVATING -> `String "ACTIVATING"
  | ACTIVE_IN_HOME_REGION -> `String "ACTIVE_IN_HOME_REGION"
  | ACTIVE -> `String "ACTIVE"
  | ACTIVE_LIMITED -> `String "ACTIVE_LIMITED"
  | FAILED -> `String "FAILED"
  | PUBLIC_OFFER_UNSUPPORTED -> `String "PUBLIC_OFFER_UNSUPPORTED"
  | SUSPENDED -> `String "SUSPENDED"
  | CANCELED -> `String "CANCELED"

let get_oci_onboarding_status_output_to_yojson (x : get_oci_onboarding_status_output) =
  assoc_to_yojson
    [
      ("status", option_to_yojson oci_onboarding_status_to_yojson x.status);
      ( "existingTenancyActivationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.existing_tenancy_activation_link );
      ( "newTenancyActivationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.new_tenancy_activation_link );
      ("ociIdentityDomain", option_to_yojson oci_identity_domain_to_yojson x.oci_identity_domain);
      ( "autonomousDatabaseOciIntegrationIamRoles",
        option_to_yojson oci_iam_role_list_to_yojson x.autonomous_database_oci_integration_iam_roles
      );
      ( "linkedOciTenancyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.linked_oci_tenancy_id );
      ( "linkedOciCompartmentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.linked_oci_compartment_id );
      ("subscriptionErrors", option_to_yojson subscription_errors_to_yojson x.subscription_errors);
    ]

let get_oci_onboarding_status_input_to_yojson = unit_to_yojson
let resource_id_list_to_yojson tree = list_to_yojson resource_id_to_yojson tree

let kms_access_to_yojson (x : kms_access) =
  assoc_to_yojson
    [
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
      ("ipv4Addresses", option_to_yojson string_list_to_yojson x.ipv4_addresses);
      ( "domainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain_name );
      ( "kmsPolicyDocument",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.kms_policy_document );
    ]

let sts_access_to_yojson (x : sts_access) =
  assoc_to_yojson
    [
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
      ("ipv4Addresses", option_to_yojson string_list_to_yojson x.ipv4_addresses);
      ( "domainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain_name );
      ( "stsPolicyDocument",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.sts_policy_document );
    ]

let s3_access_to_yojson (x : s3_access) =
  assoc_to_yojson
    [
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
      ("ipv4Addresses", option_to_yojson string_list_to_yojson x.ipv4_addresses);
      ( "domainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain_name );
      ( "s3PolicyDocument",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.s3_policy_document );
    ]

let zero_etl_access_to_yojson (x : zero_etl_access) =
  assoc_to_yojson
    [
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
      ("cidr", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cidr);
    ]

let managed_s3_backup_access_to_yojson (x : managed_s3_backup_access) =
  assoc_to_yojson
    [
      ("status", option_to_yojson managed_resource_status_to_yojson x.status);
      ("ipv4Addresses", option_to_yojson string_list_to_yojson x.ipv4_addresses);
    ]

let vpc_endpoint_type_to_yojson (x : vpc_endpoint_type) =
  match x with SERVICENETWORK -> `String "SERVICENETWORK"

let service_network_endpoint_to_yojson (x : service_network_endpoint) =
  assoc_to_yojson
    [
      ( "vpcEndpointId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vpc_endpoint_id
      );
      ("vpcEndpointType", option_to_yojson vpc_endpoint_type_to_yojson x.vpc_endpoint_type);
    ]

let managed_services_to_yojson (x : managed_services) =
  assoc_to_yojson
    [
      ("serviceNetworkArn", option_to_yojson resource_arn_to_yojson x.service_network_arn);
      ("resourceGatewayArn", option_to_yojson resource_arn_to_yojson x.resource_gateway_arn);
      ( "managedServicesIpv4Cidrs",
        option_to_yojson string_list_to_yojson x.managed_services_ipv4_cidrs );
      ( "serviceNetworkEndpoint",
        option_to_yojson service_network_endpoint_to_yojson x.service_network_endpoint );
      ( "managedS3BackupAccess",
        option_to_yojson managed_s3_backup_access_to_yojson x.managed_s3_backup_access );
      ("zeroEtlAccess", option_to_yojson zero_etl_access_to_yojson x.zero_etl_access);
      ("s3Access", option_to_yojson s3_access_to_yojson x.s3_access);
      ("stsAccess", option_to_yojson sts_access_to_yojson x.sts_access);
      ("kmsAccess", option_to_yojson kms_access_to_yojson x.kms_access);
      ( "crossRegionS3RestoreSourcesAccess",
        option_to_yojson cross_region_s3_restore_sources_access_list_to_yojson
          x.cross_region_s3_restore_sources_access );
    ]

let oci_dns_forwarding_config_to_yojson (x : oci_dns_forwarding_config) =
  assoc_to_yojson
    [
      ( "domainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.domain_name );
      ( "ociDnsListenerIp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_dns_listener_ip );
    ]

let oci_dns_forwarding_config_list_to_yojson tree =
  list_to_yojson oci_dns_forwarding_config_to_yojson tree

let odb_network_to_yojson (x : odb_network) =
  assoc_to_yojson
    [
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "odbNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_arn
      );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "clientSubnetCidr",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.client_subnet_cidr );
      ( "backupSubnetCidr",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.backup_subnet_cidr );
      ( "customDomainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.custom_domain_name );
      ( "defaultDnsPrefix",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_dns_prefix );
      ("peeredCidrs", option_to_yojson string_list_to_yojson x.peered_cidrs);
      ( "ociNetworkAnchorId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_network_anchor_id );
      ( "ociNetworkAnchorUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_network_anchor_url );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "ociVcnId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_vcn_id );
      ( "ociVcnUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_vcn_url );
      ( "ociDnsForwardingConfigs",
        option_to_yojson oci_dns_forwarding_config_list_to_yojson x.oci_dns_forwarding_configs );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ("managedServices", option_to_yojson managed_services_to_yojson x.managed_services);
      ("ec2PlacementGroupIds", option_to_yojson resource_id_list_to_yojson x.ec2_placement_group_ids);
    ]

let get_odb_network_output_to_yojson (x : get_odb_network_output) =
  assoc_to_yojson [ ("odbNetwork", option_to_yojson odb_network_to_yojson x.odb_network) ]

let get_odb_network_input_to_yojson (x : get_odb_network_input) =
  assoc_to_yojson [ ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id)) ]

let odb_peering_connection_to_yojson (x : odb_peering_connection) =
  assoc_to_yojson
    [
      ("odbPeeringConnectionId", Some (resource_id_or_arn_to_yojson x.odb_peering_connection_id));
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "odbPeeringConnectionArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.odb_peering_connection_arn );
      ( "odbNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_arn
      );
      ( "peerNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.peer_network_arn
      );
      ( "odbPeeringConnectionType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.odb_peering_connection_type );
      ("peerNetworkCidrs", option_to_yojson peered_cidr_list_to_yojson x.peer_network_cidrs);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
    ]

let get_odb_peering_connection_output_to_yojson (x : get_odb_peering_connection_output) =
  assoc_to_yojson
    [
      ( "odbPeeringConnection",
        option_to_yojson odb_peering_connection_to_yojson x.odb_peering_connection );
    ]

let get_odb_peering_connection_input_to_yojson (x : get_odb_peering_connection_input) =
  assoc_to_yojson
    [ ("odbPeeringConnectionId", Some (resource_id_or_arn_to_yojson x.odb_peering_connection_id)) ]

let gi_version_summary_to_yojson (x : gi_version_summary) =
  assoc_to_yojson
    [
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
    ]

let gi_version_list_to_yojson tree = list_to_yojson gi_version_summary_to_yojson tree
let initialize_service_output_to_yojson = unit_to_yojson

let initialize_service_input_to_yojson (x : initialize_service_input) =
  assoc_to_yojson
    [
      ( "ociIdentityDomain",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.oci_identity_domain );
    ]

let list_autonomous_database_backups_output_to_yojson (x : list_autonomous_database_backups_output)
    =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "autonomousDatabaseBackups",
        Some (autonomous_database_backup_list_to_yojson x.autonomous_database_backups) );
    ]

let list_autonomous_database_backups_input_to_yojson (x : list_autonomous_database_backups_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("autonomousDatabaseId", Some (resource_id_to_yojson x.autonomous_database_id));
      ("status", option_to_yojson autonomous_database_backup_status_to_yojson x.status);
      ("type", option_to_yojson autonomous_database_backup_type_to_yojson x.type_);
    ]

let list_autonomous_database_character_sets_output_to_yojson
    (x : list_autonomous_database_character_sets_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "autonomousDatabaseCharacterSets",
        Some (autonomous_database_character_set_list_to_yojson x.autonomous_database_character_sets)
      );
    ]

let character_set_type_to_yojson (x : character_set_type) =
  match x with DATABASE -> `String "DATABASE" | NATIONAL -> `String "NATIONAL"

let list_autonomous_database_character_sets_input_to_yojson
    (x : list_autonomous_database_character_sets_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("characterSetType", option_to_yojson character_set_type_to_yojson x.character_set_type);
    ]

let list_autonomous_database_clones_output_to_yojson (x : list_autonomous_database_clones_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "autonomousDatabaseClones",
        Some (autonomous_database_list_to_yojson x.autonomous_database_clones) );
    ]

let list_autonomous_database_clones_input_to_yojson (x : list_autonomous_database_clones_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
    ]

let list_autonomous_database_peers_output_to_yojson (x : list_autonomous_database_peers_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "autonomousDatabasePeers",
        Some (autonomous_database_peer_list_to_yojson x.autonomous_database_peers) );
    ]

let list_autonomous_database_peers_input_to_yojson (x : list_autonomous_database_peers_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
    ]

let list_autonomous_database_versions_output_to_yojson
    (x : list_autonomous_database_versions_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "autonomousDatabaseVersions",
        Some (autonomous_database_version_list_to_yojson x.autonomous_database_versions) );
    ]

let list_autonomous_database_versions_input_to_yojson (x : list_autonomous_database_versions_input)
    =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
    ]

let list_autonomous_databases_output_to_yojson (x : list_autonomous_databases_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("autonomousDatabases", Some (autonomous_database_list_to_yojson x.autonomous_databases));
    ]

let list_autonomous_databases_input_to_yojson (x : list_autonomous_databases_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_autonomous_virtual_machines_output_to_yojson (x : list_autonomous_virtual_machines_output)
    =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "autonomousVirtualMachines",
        Some (autonomous_virtual_machine_list_to_yojson x.autonomous_virtual_machines) );
    ]

let list_autonomous_virtual_machines_input_to_yojson (x : list_autonomous_virtual_machines_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("cloudAutonomousVmClusterId", Some (resource_id_to_yojson x.cloud_autonomous_vm_cluster_id));
    ]

let list_cloud_autonomous_vm_clusters_output_to_yojson
    (x : list_cloud_autonomous_vm_clusters_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "cloudAutonomousVmClusters",
        Some (cloud_autonomous_vm_cluster_list_to_yojson x.cloud_autonomous_vm_clusters) );
    ]

let list_cloud_autonomous_vm_clusters_input_to_yojson (x : list_cloud_autonomous_vm_clusters_input)
    =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "cloudExadataInfrastructureId",
        option_to_yojson resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id );
    ]

let list_cloud_exadata_infrastructures_output_to_yojson
    (x : list_cloud_exadata_infrastructures_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "cloudExadataInfrastructures",
        Some (cloud_exadata_infrastructure_list_to_yojson x.cloud_exadata_infrastructures) );
    ]

let list_cloud_exadata_infrastructures_input_to_yojson
    (x : list_cloud_exadata_infrastructures_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_cloud_vm_clusters_output_to_yojson (x : list_cloud_vm_clusters_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("cloudVmClusters", Some (cloud_vm_cluster_list_to_yojson x.cloud_vm_clusters));
    ]

let list_cloud_vm_clusters_input_to_yojson (x : list_cloud_vm_clusters_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "cloudExadataInfrastructureId",
        option_to_yojson resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id );
    ]

let list_db_nodes_output_to_yojson (x : list_db_nodes_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("dbNodes", Some (db_node_list_to_yojson x.db_nodes));
    ]

let list_db_nodes_input_to_yojson (x : list_db_nodes_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
    ]

let list_db_servers_output_to_yojson (x : list_db_servers_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("dbServers", Some (db_server_list_to_yojson x.db_servers));
    ]

let list_db_servers_input_to_yojson (x : list_db_servers_input) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_db_system_shapes_output_to_yojson (x : list_db_system_shapes_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("dbSystemShapes", Some (db_system_shape_list_to_yojson x.db_system_shapes));
    ]

let list_db_system_shapes_input_to_yojson (x : list_db_system_shapes_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
    ]

let list_gi_versions_output_to_yojson (x : list_gi_versions_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("giVersions", Some (gi_version_list_to_yojson x.gi_versions));
    ]

let list_gi_versions_input_to_yojson (x : list_gi_versions_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
    ]

let odb_network_summary_to_yojson (x : odb_network_summary) =
  assoc_to_yojson
    [
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "odbNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_arn
      );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "availabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "clientSubnetCidr",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.client_subnet_cidr );
      ( "backupSubnetCidr",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.backup_subnet_cidr );
      ( "customDomainName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.custom_domain_name );
      ( "defaultDnsPrefix",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.default_dns_prefix );
      ("peeredCidrs", option_to_yojson string_list_to_yojson x.peered_cidrs);
      ( "ociNetworkAnchorId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_network_anchor_id );
      ( "ociNetworkAnchorUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_network_anchor_url );
      ( "ociResourceAnchorName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.oci_resource_anchor_name );
      ( "ociVcnId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_vcn_id );
      ( "ociVcnUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.oci_vcn_url );
      ( "ociDnsForwardingConfigs",
        option_to_yojson oci_dns_forwarding_config_list_to_yojson x.oci_dns_forwarding_configs );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
      ("managedServices", option_to_yojson managed_services_to_yojson x.managed_services);
      ("ec2PlacementGroupIds", option_to_yojson resource_id_list_to_yojson x.ec2_placement_group_ids);
    ]

let odb_network_list_to_yojson tree = list_to_yojson odb_network_summary_to_yojson tree

let list_odb_networks_output_to_yojson (x : list_odb_networks_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("odbNetworks", Some (odb_network_list_to_yojson x.odb_networks));
    ]

let list_odb_networks_input_to_yojson (x : list_odb_networks_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let odb_peering_connection_summary_to_yojson (x : odb_peering_connection_summary) =
  assoc_to_yojson
    [
      ("odbPeeringConnectionId", Some (resource_id_or_arn_to_yojson x.odb_peering_connection_id));
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "odbPeeringConnectionArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.odb_peering_connection_arn );
      ( "odbNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_arn
      );
      ( "peerNetworkArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.peer_network_arn
      );
      ( "odbPeeringConnectionType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.odb_peering_connection_type );
      ("peerNetworkCidrs", option_to_yojson peered_cidr_list_to_yojson x.peer_network_cidrs);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "percentProgress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.percent_progress
      );
    ]

let odb_peering_connection_list_to_yojson tree =
  list_to_yojson odb_peering_connection_summary_to_yojson tree

let list_odb_peering_connections_output_to_yojson (x : list_odb_peering_connections_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "odbPeeringConnections",
        Some (odb_peering_connection_list_to_yojson x.odb_peering_connections) );
    ]

let list_odb_peering_connections_input_to_yojson (x : list_odb_peering_connections_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("odbNetworkId", option_to_yojson resource_id_or_arn_to_yojson x.odb_network_id);
    ]

let system_version_summary_to_yojson (x : system_version_summary) =
  assoc_to_yojson
    [
      ( "giVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.gi_version );
      ("shape", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape);
      ("systemVersions", option_to_yojson string_list_to_yojson x.system_versions);
    ]

let system_version_list_to_yojson tree = list_to_yojson system_version_summary_to_yojson tree

let list_system_versions_output_to_yojson (x : list_system_versions_output) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("systemVersions", Some (system_version_list_to_yojson x.system_versions));
    ]

let list_system_versions_input_to_yojson (x : list_system_versions_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("giVersion", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.gi_version));
      ("shape", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.shape));
    ]

let response_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson response_tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("tags", Some (request_tag_map_to_yojson x.tags));
    ]

let reboot_autonomous_database_output_to_yojson (x : reboot_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let reboot_autonomous_database_input_to_yojson (x : reboot_autonomous_database_input) =
  assoc_to_yojson
    [
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
      ( "isOnlineReboot",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_online_reboot
      );
    ]

let reboot_db_node_output_to_yojson (x : reboot_db_node_output) =
  assoc_to_yojson
    [
      ("dbNodeId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_node_id));
      ("status", option_to_yojson db_node_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let reboot_db_node_input_to_yojson (x : reboot_db_node_input) =
  assoc_to_yojson
    [
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
      ("dbNodeId", Some (resource_id_to_yojson x.db_node_id));
    ]

let restore_autonomous_database_output_to_yojson (x : restore_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let restore_autonomous_database_input_to_yojson (x : restore_autonomous_database_input) =
  assoc_to_yojson
    [
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
      ( "timestamp",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson x.timestamp) );
    ]

let shrink_autonomous_database_output_to_yojson (x : shrink_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let shrink_autonomous_database_input_to_yojson (x : shrink_autonomous_database_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id)) ]

let start_autonomous_database_output_to_yojson (x : start_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let start_autonomous_database_input_to_yojson (x : start_autonomous_database_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id)) ]

let start_db_node_output_to_yojson (x : start_db_node_output) =
  assoc_to_yojson
    [
      ("dbNodeId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_node_id));
      ("status", option_to_yojson db_node_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let start_db_node_input_to_yojson (x : start_db_node_input) =
  assoc_to_yojson
    [
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
      ("dbNodeId", Some (resource_id_to_yojson x.db_node_id));
    ]

let stop_autonomous_database_output_to_yojson (x : stop_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let stop_autonomous_database_input_to_yojson (x : stop_autonomous_database_input) =
  assoc_to_yojson
    [ ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id)) ]

let stop_db_node_output_to_yojson (x : stop_db_node_output) =
  assoc_to_yojson
    [
      ("dbNodeId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_node_id));
      ("status", option_to_yojson db_node_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let stop_db_node_input_to_yojson (x : stop_db_node_input) =
  assoc_to_yojson
    [
      ("cloudVmClusterId", Some (resource_id_to_yojson x.cloud_vm_cluster_id));
      ("dbNodeId", Some (resource_id_to_yojson x.db_node_id));
    ]

let switchover_autonomous_database_output_to_yojson (x : switchover_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let switchover_autonomous_database_input_to_yojson (x : switchover_autonomous_database_input) =
  assoc_to_yojson
    [
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
      ("peerDbArn", option_to_yojson resource_arn_to_yojson x.peer_db_arn);
    ]

let update_autonomous_database_output_to_yojson (x : update_autonomous_database_output) =
  assoc_to_yojson
    [
      ( "autonomousDatabaseId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_id) );
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson autonomous_database_resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
    ]

let update_autonomous_database_input_to_yojson (x : update_autonomous_database_input) =
  assoc_to_yojson
    [
      ("autonomousDatabaseId", Some (resource_id_or_arn_to_yojson x.autonomous_database_id));
      ("adminPassword", option_to_yojson sensitive_string_to_yojson x.admin_password);
      ( "computeCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.compute_count );
      ( "cpuCoreCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.cpu_core_count );
      ( "dataStorageSizeInTBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_t_bs );
      ( "dataStorageSizeInGBs",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.data_storage_size_in_g_bs );
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ("dbName", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_name);
      ( "dbVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_version );
      ("dbWorkload", option_to_yojson db_workload_to_yojson x.db_workload);
      ("dbToolsDetails", option_to_yojson database_tool_list_to_yojson x.db_tools_details);
      ("databaseEdition", option_to_yojson database_edition_to_yojson x.database_edition);
      ("licenseModel", option_to_yojson license_model_to_yojson x.license_model);
      ( "isAutoScalingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_enabled );
      ( "isAutoScalingForStorageEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_auto_scaling_for_storage_enabled );
      ( "isBackupRetentionLocked",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_backup_retention_locked );
      ( "isLocalDataGuardEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_local_data_guard_enabled );
      ( "isMtlsConnectionRequired",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_mtls_connection_required );
      ( "isRefreshableClone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_refreshable_clone );
      ( "isDisconnectPeer",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.is_disconnect_peer );
      ( "backupRetentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.backup_retention_period_in_days );
      ( "byolComputeCountLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.byol_compute_count_limit );
      ( "localAdgAutoFailoverMaxDataLossLimit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.local_adg_auto_failover_max_data_loss_limit );
      ( "autonomousMaintenanceScheduleType",
        option_to_yojson autonomous_maintenance_schedule_type_to_yojson
          x.autonomous_maintenance_schedule_type );
      ( "customerContactsToSendToOCI",
        option_to_yojson customer_contacts_to_yojson x.customer_contacts_to_send_to_oc_i );
      ( "scheduledOperations",
        option_to_yojson scheduled_operation_details_list_to_yojson x.scheduled_operations );
      ( "longTermBackupSchedule",
        option_to_yojson long_term_backup_schedule_to_yojson x.long_term_backup_schedule );
      ("openMode", option_to_yojson open_mode_to_yojson x.open_mode);
      ("permissionLevel", option_to_yojson permission_level_to_yojson x.permission_level);
      ("refreshableMode", option_to_yojson refreshable_mode_to_yojson x.refreshable_mode);
      ( "privateEndpointIp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_ip );
      ( "privateEndpointLabel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.private_endpoint_label );
      ("peerDbId", option_to_yojson resource_id_or_arn_to_yojson x.peer_db_id);
      ( "resourcePoolLeaderId",
        option_to_yojson resource_id_or_arn_to_yojson x.resource_pool_leader_id );
      ( "resourcePoolSummary",
        option_to_yojson resource_pool_summary_to_yojson x.resource_pool_summary );
      ( "standbyAllowlistedIpsSource",
        option_to_yojson standby_allowlisted_ips_source_to_yojson x.standby_allowlisted_ips_source
      );
      ("standbyAllowlistedIps", option_to_yojson string_list_to_yojson x.standby_allowlisted_ips);
      ("allowlistedIps", option_to_yojson string_list_to_yojson x.allowlisted_ips);
      ( "autoRefreshFrequencyInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_frequency_in_seconds );
      ( "autoRefreshPointLagInSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.auto_refresh_point_lag_in_seconds );
      ( "timeOfAutoRefreshStart",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.time_of_auto_refresh_start );
      ( "encryptionKeyProvider",
        option_to_yojson encryption_key_provider_input_to_yojson x.encryption_key_provider );
      ( "encryptionKeyConfiguration",
        option_to_yojson encryption_key_configuration_input_to_yojson x.encryption_key_configuration
      );
    ]

let update_autonomous_database_backup_output_to_yojson
    (x : update_autonomous_database_backup_output) =
  assoc_to_yojson
    [
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "autonomousDatabaseBackupId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.autonomous_database_backup_id)
      );
    ]

let update_autonomous_database_backup_input_to_yojson (x : update_autonomous_database_backup_input)
    =
  assoc_to_yojson
    [
      ("autonomousDatabaseBackupId", Some (resource_id_to_yojson x.autonomous_database_backup_id));
      ( "retentionPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retention_period_in_days );
    ]

let update_cloud_exadata_infrastructure_output_to_yojson
    (x : update_cloud_exadata_infrastructure_output) =
  assoc_to_yojson
    [
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "cloudExadataInfrastructureId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.cloud_exadata_infrastructure_id)
      );
    ]

let update_cloud_exadata_infrastructure_input_to_yojson
    (x : update_cloud_exadata_infrastructure_input) =
  assoc_to_yojson
    [
      ( "cloudExadataInfrastructureId",
        Some (resource_id_or_arn_to_yojson x.cloud_exadata_infrastructure_id) );
      ("maintenanceWindow", option_to_yojson maintenance_window_to_yojson x.maintenance_window);
    ]

let update_odb_network_output_to_yojson (x : update_odb_network_output) =
  assoc_to_yojson
    [
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "odbNetworkId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_network_id) );
    ]

let update_odb_network_input_to_yojson (x : update_odb_network_input) =
  assoc_to_yojson
    [
      ("odbNetworkId", Some (resource_id_or_arn_to_yojson x.odb_network_id));
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ("peeredCidrsToBeAdded", option_to_yojson string_list_to_yojson x.peered_cidrs_to_be_added);
      ("peeredCidrsToBeRemoved", option_to_yojson string_list_to_yojson x.peered_cidrs_to_be_removed);
      ("s3Access", option_to_yojson access_to_yojson x.s3_access);
      ("zeroEtlAccess", option_to_yojson access_to_yojson x.zero_etl_access);
      ("stsAccess", option_to_yojson access_to_yojson x.sts_access);
      ("kmsAccess", option_to_yojson access_to_yojson x.kms_access);
      ("s3PolicyDocument", option_to_yojson policy_document_to_yojson x.s3_policy_document);
      ("stsPolicyDocument", option_to_yojson policy_document_to_yojson x.sts_policy_document);
      ("kmsPolicyDocument", option_to_yojson policy_document_to_yojson x.kms_policy_document);
      ( "crossRegionS3RestoreSourcesToEnable",
        option_to_yojson string_list_to_yojson x.cross_region_s3_restore_sources_to_enable );
      ( "crossRegionS3RestoreSourcesToDisable",
        option_to_yojson string_list_to_yojson x.cross_region_s3_restore_sources_to_disable );
    ]

let update_odb_peering_connection_output_to_yojson (x : update_odb_peering_connection_output) =
  assoc_to_yojson
    [
      ( "displayName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.display_name );
      ("status", option_to_yojson resource_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "odbPeeringConnectionId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.odb_peering_connection_id)
      );
    ]

let update_odb_peering_connection_input_to_yojson (x : update_odb_peering_connection_input) =
  assoc_to_yojson
    [
      ("odbPeeringConnectionId", Some (resource_id_or_arn_to_yojson x.odb_peering_connection_id));
      ("displayName", option_to_yojson resource_display_name_to_yojson x.display_name);
      ( "peerNetworkCidrsToBeAdded",
        option_to_yojson peered_cidr_list_to_yojson x.peer_network_cidrs_to_be_added );
      ( "peerNetworkCidrsToBeRemoved",
        option_to_yojson peered_cidr_list_to_yojson x.peer_network_cidrs_to_be_removed );
    ]
