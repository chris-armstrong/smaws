open Smaws_Lib.Json.DeserializeHelpers
open Types

let character_set_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NATIONAL" -> NATIONAL
    | `String "DATABASE" -> DATABASE
    | `String value -> raise (deserialize_unknown_enum_value_error path "characterSetType" value)
    | _ -> raise (deserialize_wrong_type_error path "characterSetType")
     : character_set_type)
    : character_set_type)

let managed_resource_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLING" -> DISABLING
    | `String "DISABLED" -> DISABLED
    | `String "ENABLING" -> ENABLING
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ManagedResourceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ManagedResourceStatus")
     : managed_resource_status)
    : managed_resource_status)

let zero_etl_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cidr =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "cidr")
         _list path;
     status = option_of_yojson (value_for_key managed_resource_status_of_yojson "status") _list path;
   }
    : zero_etl_access)

let weeks_of_month_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson tree path

let wallet_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSTANCE" -> INSTANCE
    | `String "REGIONAL" -> REGIONAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "WalletType" value)
    | _ -> raise (deserialize_wrong_type_error path "WalletType")
     : wallet_type)
    : wallet_type)

let vpc_endpoint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVICENETWORK" -> SERVICENETWORK
    | `String value -> raise (deserialize_unknown_enum_value_error path "VpcEndpointType" value)
    | _ -> raise (deserialize_wrong_type_error path "VpcEndpointType")
     : vpc_endpoint_type)
    : vpc_endpoint_type)

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "other" -> OTHER
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_list =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fieldList")
         _list path;
     reason = value_for_key validation_exception_reason_of_yojson "reason" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception)

let resource_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "MAINTENANCE_IN_PROGRESS" -> MAINTENANCE_IN_PROGRESS
    | `String "UPDATING" -> UPDATING
    | `String "TERMINATING" -> TERMINATING
    | `String "TERMINATED" -> TERMINATED
    | `String "PROVISIONING" -> PROVISIONING
    | `String "FAILED" -> FAILED
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceStatus")
     : resource_status)
    : resource_status)

let update_odb_peering_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     odb_peering_connection_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "odbPeeringConnectionId" _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
   }
    : update_odb_peering_connection_output)

let resource_id_or_arn_of_yojson = string_of_yojson
let resource_display_name_of_yojson = string_of_yojson
let peered_cidr_of_yojson = string_of_yojson
let peered_cidr_list_of_yojson tree path = list_of_yojson peered_cidr_of_yojson tree path

let update_odb_peering_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     peer_network_cidrs_to_be_removed =
       option_of_yojson
         (value_for_key peered_cidr_list_of_yojson "peerNetworkCidrsToBeRemoved")
         _list path;
     peer_network_cidrs_to_be_added =
       option_of_yojson
         (value_for_key peered_cidr_list_of_yojson "peerNetworkCidrsToBeAdded")
         _list path;
     display_name =
       option_of_yojson (value_for_key resource_display_name_of_yojson "displayName") _list path;
     odb_peering_connection_id =
       value_for_key resource_id_or_arn_of_yojson "odbPeeringConnectionId" _list path;
   }
    : update_odb_peering_connection_input)

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
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retryAfterSeconds")
         _list path;
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

let update_odb_network_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     odb_network_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "odbNetworkId" _list
         path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
   }
    : update_odb_network_output)

let string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let access_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Access" value)
    | _ -> raise (deserialize_wrong_type_error path "Access")
     : access)
    : access)

let policy_document_of_yojson = string_of_yojson

let update_odb_network_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_region_s3_restore_sources_to_disable =
       option_of_yojson
         (value_for_key string_list_of_yojson "crossRegionS3RestoreSourcesToDisable")
         _list path;
     cross_region_s3_restore_sources_to_enable =
       option_of_yojson
         (value_for_key string_list_of_yojson "crossRegionS3RestoreSourcesToEnable")
         _list path;
     kms_policy_document =
       option_of_yojson (value_for_key policy_document_of_yojson "kmsPolicyDocument") _list path;
     sts_policy_document =
       option_of_yojson (value_for_key policy_document_of_yojson "stsPolicyDocument") _list path;
     s3_policy_document =
       option_of_yojson (value_for_key policy_document_of_yojson "s3PolicyDocument") _list path;
     kms_access = option_of_yojson (value_for_key access_of_yojson "kmsAccess") _list path;
     sts_access = option_of_yojson (value_for_key access_of_yojson "stsAccess") _list path;
     zero_etl_access = option_of_yojson (value_for_key access_of_yojson "zeroEtlAccess") _list path;
     s3_access = option_of_yojson (value_for_key access_of_yojson "s3Access") _list path;
     peered_cidrs_to_be_removed =
       option_of_yojson (value_for_key string_list_of_yojson "peeredCidrsToBeRemoved") _list path;
     peered_cidrs_to_be_added =
       option_of_yojson (value_for_key string_list_of_yojson "peeredCidrsToBeAdded") _list path;
     display_name =
       option_of_yojson (value_for_key resource_display_name_of_yojson "displayName") _list path;
     odb_network_id = value_for_key resource_id_or_arn_of_yojson "odbNetworkId" _list path;
   }
    : update_odb_network_input)

let update_cloud_exadata_infrastructure_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_exadata_infrastructure_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "cloudExadataInfrastructureId" _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
   }
    : update_cloud_exadata_infrastructure_output)

let day_of_week_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUNDAY" -> SUNDAY
    | `String "SATURDAY" -> SATURDAY
    | `String "FRIDAY" -> FRIDAY
    | `String "THURSDAY" -> THURSDAY
    | `String "WEDNESDAY" -> WEDNESDAY
    | `String "TUESDAY" -> TUESDAY
    | `String "MONDAY" -> MONDAY
    | `String value -> raise (deserialize_unknown_enum_value_error path "DayOfWeekName" value)
    | _ -> raise (deserialize_wrong_type_error path "DayOfWeekName")
     : day_of_week_name)
    : day_of_week_name)

let day_of_week_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key day_of_week_name_of_yojson "name") _list path }
    : day_of_week)

let days_of_week_of_yojson tree path = list_of_yojson day_of_week_of_yojson tree path

let hours_of_day_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson tree path

let month_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "DECEMBER" -> DECEMBER
    | `String "NOVEMBER" -> NOVEMBER
    | `String "OCTOBER" -> OCTOBER
    | `String "SEPTEMBER" -> SEPTEMBER
    | `String "AUGUST" -> AUGUST
    | `String "JULY" -> JULY
    | `String "JUNE" -> JUNE
    | `String "MAY" -> MAY
    | `String "APRIL" -> APRIL
    | `String "MARCH" -> MARCH
    | `String "FEBRUARY" -> FEBRUARY
    | `String "JANUARY" -> JANUARY
    | `String value -> raise (deserialize_unknown_enum_value_error path "MonthName" value)
    | _ -> raise (deserialize_wrong_type_error path "MonthName")
     : month_name)
    : month_name)

let month_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key month_name_of_yojson "name") _list path } : month)

let months_of_yojson tree path = list_of_yojson month_of_yojson tree path

let patching_mode_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONROLLING" -> NONROLLING
    | `String "ROLLING" -> ROLLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchingModeType" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchingModeType")
     : patching_mode_type)
    : patching_mode_type)

let preference_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM_PREFERENCE" -> CUSTOM_PREFERENCE
    | `String "NO_PREFERENCE" -> NO_PREFERENCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PreferenceType" value)
    | _ -> raise (deserialize_wrong_type_error path "PreferenceType")
     : preference_type)
    : preference_type)

let maintenance_window_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     weeks_of_month =
       option_of_yojson (value_for_key weeks_of_month_of_yojson "weeksOfMonth") _list path;
     skip_ru =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "skipRu")
         _list path;
     preference = option_of_yojson (value_for_key preference_type_of_yojson "preference") _list path;
     patching_mode =
       option_of_yojson (value_for_key patching_mode_type_of_yojson "patchingMode") _list path;
     months = option_of_yojson (value_for_key months_of_yojson "months") _list path;
     lead_time_in_weeks =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "leadTimeInWeeks")
         _list path;
     is_custom_action_timeout_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isCustomActionTimeoutEnabled")
         _list path;
     hours_of_day = option_of_yojson (value_for_key hours_of_day_of_yojson "hoursOfDay") _list path;
     days_of_week = option_of_yojson (value_for_key days_of_week_of_yojson "daysOfWeek") _list path;
     custom_action_timeout_in_mins =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "customActionTimeoutInMins")
         _list path;
   }
    : maintenance_window)

let update_cloud_exadata_infrastructure_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maintenance_window =
       option_of_yojson (value_for_key maintenance_window_of_yojson "maintenanceWindow") _list path;
     cloud_exadata_infrastructure_id =
       value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId" _list path;
   }
    : update_cloud_exadata_infrastructure_input)

let autonomous_database_resource_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDBY" -> STANDBY
    | `String "INACCESSIBLE" -> INACCESSIBLE
    | `String "UPGRADING" -> UPGRADING
    | `String "ROLE_CHANGE_IN_PROGRESS" -> ROLE_CHANGE_IN_PROGRESS
    | `String "RECREATING" -> RECREATING
    | `String "RESTARTING" -> RESTARTING
    | `String "AVAILABLE_NEEDS_ATTENTION" -> AVAILABLE_NEEDS_ATTENTION
    | `String "SCALE_IN_PROGRESS" -> SCALE_IN_PROGRESS
    | `String "BACKUP_IN_PROGRESS" -> BACKUP_IN_PROGRESS
    | `String "RESTORE_FAILED" -> RESTORE_FAILED
    | `String "RESTORE_IN_PROGRESS" -> RESTORE_IN_PROGRESS
    | `String "UNAVAILABLE" -> UNAVAILABLE
    | `String "STARTING" -> STARTING
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "MAINTENANCE_IN_PROGRESS" -> MAINTENANCE_IN_PROGRESS
    | `String "UPDATING" -> UPDATING
    | `String "TERMINATING" -> TERMINATING
    | `String "TERMINATED" -> TERMINATED
    | `String "PROVISIONING" -> PROVISIONING
    | `String "FAILED" -> FAILED
    | `String "AVAILABLE" -> AVAILABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutonomousDatabaseResourceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutonomousDatabaseResourceStatus")
     : autonomous_database_resource_status)
    : autonomous_database_resource_status)

let update_autonomous_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     autonomous_database_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "autonomousDatabaseId" _list path;
   }
    : update_autonomous_database_output)

let sensitive_string_of_yojson = string_of_yojson

let db_workload_of_yojson (tree : t) path =
  ((match tree with
    | `String "LH" -> LH
    | `String "APEX" -> APEX
    | `String "AJD" -> AJD
    | `String "OLTP" -> OLTP
    | `String value -> raise (deserialize_unknown_enum_value_error path "DbWorkload" value)
    | _ -> raise (deserialize_wrong_type_error path "DbWorkload")
     : db_workload)
    : db_workload)

let database_tool_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_idle_time_in_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "maxIdleTimeInMinutes")
         _list path;
     compute_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "computeCount")
         _list path;
     name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name")
         _list path;
     is_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "isEnabled")
         _list path;
   }
    : database_tool)

let database_tool_list_of_yojson tree path = list_of_yojson database_tool_of_yojson tree path

let database_edition_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENTERPRISE_EDITION" -> ENTERPRISE_EDITION
    | `String "STANDARD_EDITION" -> STANDARD_EDITION
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatabaseEdition" value)
    | _ -> raise (deserialize_wrong_type_error path "DatabaseEdition")
     : database_edition)
    : database_edition)

let license_model_of_yojson (tree : t) path =
  ((match tree with
    | `String "LICENSE_INCLUDED" -> LICENSE_INCLUDED
    | `String "BRING_YOUR_OWN_LICENSE" -> BRING_YOUR_OWN_LICENSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "LicenseModel" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseModel")
     : license_model)
    : license_model)

let autonomous_maintenance_schedule_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "REGULAR" -> REGULAR
    | `String "EARLY" -> EARLY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutonomousMaintenanceScheduleType" value)
    | _ -> raise (deserialize_wrong_type_error path "AutonomousMaintenanceScheduleType")
     : autonomous_maintenance_schedule_type)
    : autonomous_maintenance_schedule_type)

let customer_contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ email = option_of_yojson (value_for_key sensitive_string_of_yojson "email") _list path }
    : customer_contact)

let customer_contacts_of_yojson tree path = list_of_yojson customer_contact_of_yojson tree path

let scheduled_operation_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_stop_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "scheduledStopTime")
         _list path;
     scheduled_start_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "scheduledStartTime")
         _list path;
     day_of_week = value_for_key day_of_week_of_yojson "dayOfWeek" _list path;
   }
    : scheduled_operation_details)

let scheduled_operation_details_list_of_yojson tree path =
  list_of_yojson scheduled_operation_details_of_yojson tree path

let repeat_cadence_of_yojson (tree : t) path =
  ((match tree with
    | `String "YEARLY" -> YEARLY
    | `String "MONTHLY" -> MONTHLY
    | `String "WEEKLY" -> WEEKLY
    | `String "ONE_TIME" -> ONE_TIME
    | `String value -> raise (deserialize_unknown_enum_value_error path "RepeatCadence" value)
    | _ -> raise (deserialize_wrong_type_error path "RepeatCadence")
     : repeat_cadence)
    : repeat_cadence)

let long_term_backup_schedule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_of_backup =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfBackup")
         _list path;
     retention_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retentionPeriodInDays")
         _list path;
     repeat_cadence =
       option_of_yojson (value_for_key repeat_cadence_of_yojson "repeatCadence") _list path;
     is_disabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "isDisabled")
         _list path;
   }
    : long_term_backup_schedule)

let open_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "READ_WRITE" -> READ_WRITE
    | `String "READ_ONLY" -> READ_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpenMode" value)
    | _ -> raise (deserialize_wrong_type_error path "OpenMode")
     : open_mode)
    : open_mode)

let permission_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNRESTRICTED" -> UNRESTRICTED
    | `String "RESTRICTED" -> RESTRICTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "PermissionLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "PermissionLevel")
     : permission_level)
    : permission_level)

let refreshable_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "MANUAL" -> MANUAL
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "RefreshableMode" value)
    | _ -> raise (deserialize_wrong_type_error path "RefreshableMode")
     : refreshable_mode)
    : refreshable_mode)

let resource_pool_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     available_compute_capacity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableComputeCapacity")
         _list path;
     total_compute_capacity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "totalComputeCapacity")
         _list path;
     available_storage_capacity_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "availableStorageCapacityInTBs")
         _list path;
     pool_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "poolStorageSizeInTBs")
         _list path;
     pool_size =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "poolSize")
         _list path;
     is_disabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "isDisabled")
         _list path;
   }
    : resource_pool_summary)

let standby_allowlisted_ips_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_APPLICABLE" -> NOT_APPLICABLE
    | `String "SEPARATE" -> SEPARATE
    | `String "PRIMARY" -> PRIMARY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StandbyAllowlistedIpsSource" value)
    | _ -> raise (deserialize_wrong_type_error path "StandbyAllowlistedIpsSource")
     : standby_allowlisted_ips_source)
    : standby_allowlisted_ips_source)

let encryption_key_provider_input_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_KMS" -> AWS_KMS
    | `String "ORACLE_MANAGED" -> ORACLE_MANAGED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EncryptionKeyProviderInput" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionKeyProviderInput")
     : encryption_key_provider_input)
    : encryption_key_provider_input)

let role_arn_of_yojson = string_of_yojson

let external_id_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "tenant_ocid" -> TENANT_OCID
    | `String "compartment_ocid" -> COMPARTMENT_OCID
    | `String "database_ocid" -> DATABASE_OCID
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExternalIdType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExternalIdType")
     : external_id_type)
    : external_id_type)

let kms_key_id_or_arn_of_yojson = string_of_yojson

let aws_encryption_key_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key kms_key_id_or_arn_of_yojson "kmsKeyId") _list path;
     external_id_type =
       option_of_yojson (value_for_key external_id_type_of_yojson "externalIdType") _list path;
     iam_role_arn = option_of_yojson (value_for_key role_arn_of_yojson "iamRoleArn") _list path;
   }
    : aws_encryption_key_configuration_input)

let encryption_key_configuration_input_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "awsEncryptionKey" ->
       AwsEncryptionKey (aws_encryption_key_configuration_input_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "EncryptionKeyConfigurationInput" unknown)
    : encryption_key_configuration_input)

let update_autonomous_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_key_configuration =
       option_of_yojson
         (value_for_key encryption_key_configuration_input_of_yojson "encryptionKeyConfiguration")
         _list path;
     encryption_key_provider =
       option_of_yojson
         (value_for_key encryption_key_provider_input_of_yojson "encryptionKeyProvider")
         _list path;
     time_of_auto_refresh_start =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfAutoRefreshStart")
         _list path;
     auto_refresh_point_lag_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "autoRefreshPointLagInSeconds")
         _list path;
     auto_refresh_frequency_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "autoRefreshFrequencyInSeconds")
         _list path;
     allowlisted_ips =
       option_of_yojson (value_for_key string_list_of_yojson "allowlistedIps") _list path;
     standby_allowlisted_ips =
       option_of_yojson (value_for_key string_list_of_yojson "standbyAllowlistedIps") _list path;
     standby_allowlisted_ips_source =
       option_of_yojson
         (value_for_key standby_allowlisted_ips_source_of_yojson "standbyAllowlistedIpsSource")
         _list path;
     resource_pool_summary =
       option_of_yojson
         (value_for_key resource_pool_summary_of_yojson "resourcePoolSummary")
         _list path;
     resource_pool_leader_id =
       option_of_yojson
         (value_for_key resource_id_or_arn_of_yojson "resourcePoolLeaderId")
         _list path;
     peer_db_id =
       option_of_yojson (value_for_key resource_id_or_arn_of_yojson "peerDbId") _list path;
     private_endpoint_label =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "privateEndpointLabel")
         _list path;
     private_endpoint_ip =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "privateEndpointIp")
         _list path;
     refreshable_mode =
       option_of_yojson (value_for_key refreshable_mode_of_yojson "refreshableMode") _list path;
     permission_level =
       option_of_yojson (value_for_key permission_level_of_yojson "permissionLevel") _list path;
     open_mode = option_of_yojson (value_for_key open_mode_of_yojson "openMode") _list path;
     long_term_backup_schedule =
       option_of_yojson
         (value_for_key long_term_backup_schedule_of_yojson "longTermBackupSchedule")
         _list path;
     scheduled_operations =
       option_of_yojson
         (value_for_key scheduled_operation_details_list_of_yojson "scheduledOperations")
         _list path;
     customer_contacts_to_send_to_oc_i =
       option_of_yojson
         (value_for_key customer_contacts_of_yojson "customerContactsToSendToOCI")
         _list path;
     autonomous_maintenance_schedule_type =
       option_of_yojson
         (value_for_key autonomous_maintenance_schedule_type_of_yojson
            "autonomousMaintenanceScheduleType")
         _list path;
     local_adg_auto_failover_max_data_loss_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "localAdgAutoFailoverMaxDataLossLimit")
         _list path;
     byol_compute_count_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "byolComputeCountLimit")
         _list path;
     backup_retention_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "backupRetentionPeriodInDays")
         _list path;
     is_disconnect_peer =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isDisconnectPeer")
         _list path;
     is_refreshable_clone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isRefreshableClone")
         _list path;
     is_mtls_connection_required =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isMtlsConnectionRequired")
         _list path;
     is_local_data_guard_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isLocalDataGuardEnabled")
         _list path;
     is_backup_retention_locked =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isBackupRetentionLocked")
         _list path;
     is_auto_scaling_for_storage_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isAutoScalingForStorageEnabled")
         _list path;
     is_auto_scaling_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isAutoScalingEnabled")
         _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     database_edition =
       option_of_yojson (value_for_key database_edition_of_yojson "databaseEdition") _list path;
     db_tools_details =
       option_of_yojson (value_for_key database_tool_list_of_yojson "dbToolsDetails") _list path;
     db_workload = option_of_yojson (value_for_key db_workload_of_yojson "dbWorkload") _list path;
     db_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbVersion")
         _list path;
     db_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbName")
         _list path;
     display_name =
       option_of_yojson (value_for_key resource_display_name_of_yojson "displayName") _list path;
     data_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataStorageSizeInGBs")
         _list path;
     data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataStorageSizeInTBs")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     compute_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "computeCount")
         _list path;
     admin_password =
       option_of_yojson (value_for_key sensitive_string_of_yojson "adminPassword") _list path;
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : update_autonomous_database_input)

let update_autonomous_database_backup_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_backup_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "autonomousDatabaseBackupId" _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
   }
    : update_autonomous_database_backup_output)

let resource_id_of_yojson = string_of_yojson

let update_autonomous_database_backup_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retentionPeriodInDays")
         _list path;
     autonomous_database_backup_id =
       value_for_key resource_id_of_yojson "autonomousDatabaseBackupId" _list path;
   }
    : update_autonomous_database_backup_input)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_keys_of_yojson "tagKeys" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
   }
    : untag_resource_request)

let transportable_tablespace_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tts_bundle_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ttsBundleUrl")
         _list path;
   }
    : transportable_tablespace)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let request_tag_map_of_yojson tree path =
  map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key request_tag_map_of_yojson "tags" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
   }
    : tag_resource_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "quotaCode" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : service_quota_exceeded_exception)

let system_version_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     system_versions =
       option_of_yojson (value_for_key string_list_of_yojson "systemVersions") _list path;
     shape =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shape")
         _list path;
     gi_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "giVersion")
         _list path;
   }
    : system_version_summary)

let system_version_list_of_yojson tree path =
  list_of_yojson system_version_summary_of_yojson tree path

let switchover_autonomous_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     autonomous_database_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "autonomousDatabaseId" _list path;
   }
    : switchover_autonomous_database_output)

let switchover_autonomous_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     peer_db_arn = option_of_yojson (value_for_key resource_arn_of_yojson "peerDbArn") _list path;
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : switchover_autonomous_database_input)

let supported_aws_integration_of_yojson (tree : t) path =
  ((match tree with
    | `String "KmsTde" -> KmsTde
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SupportedAwsIntegration" value)
    | _ -> raise (deserialize_wrong_type_error path "SupportedAwsIntegration")
     : supported_aws_integration)
    : supported_aws_integration)

let subscription_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
   }
    : subscription_error)

let subscription_errors_of_yojson tree path = list_of_yojson subscription_error_of_yojson tree path

let sts_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sts_policy_document =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "stsPolicyDocument")
         _list path;
     domain_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "domainName")
         _list path;
     ipv4_addresses =
       option_of_yojson (value_for_key string_list_of_yojson "ipv4Addresses") _list path;
     status = option_of_yojson (value_for_key managed_resource_status_of_yojson "status") _list path;
   }
    : sts_access)

let db_node_resource_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STARTING" -> STARTING
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "UPDATING" -> UPDATING
    | `String "TERMINATING" -> TERMINATING
    | `String "TERMINATED" -> TERMINATED
    | `String "PROVISIONING" -> PROVISIONING
    | `String "FAILED" -> FAILED
    | `String "AVAILABLE" -> AVAILABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DbNodeResourceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DbNodeResourceStatus")
     : db_node_resource_status)
    : db_node_resource_status)

let stop_db_node_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key db_node_resource_status_of_yojson "status") _list path;
     db_node_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbNodeId" _list path;
   }
    : stop_db_node_output)

let stop_db_node_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_node_id = value_for_key resource_id_of_yojson "dbNodeId" _list path;
     cloud_vm_cluster_id = value_for_key resource_id_of_yojson "cloudVmClusterId" _list path;
   }
    : stop_db_node_input)

let stop_autonomous_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     autonomous_database_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "autonomousDatabaseId" _list path;
   }
    : stop_autonomous_database_output)

let stop_autonomous_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : stop_autonomous_database_input)

let start_db_node_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key db_node_resource_status_of_yojson "status") _list path;
     db_node_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbNodeId" _list path;
   }
    : start_db_node_output)

let start_db_node_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_node_id = value_for_key resource_id_of_yojson "dbNodeId" _list path;
     cloud_vm_cluster_id = value_for_key resource_id_of_yojson "cloudVmClusterId" _list path;
   }
    : start_db_node_input)

let start_autonomous_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     autonomous_database_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "autonomousDatabaseId" _list path;
   }
    : start_autonomous_database_output)

let start_autonomous_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : start_autonomous_database_input)

let source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLONE_TO_REFRESHABLE" -> CLONE_TO_REFRESHABLE
    | `String "CROSS_REGION_DISASTER_RECOVERY" -> CROSS_REGION_DISASTER_RECOVERY
    | `String "CROSS_REGION_DATAGUARD" -> CROSS_REGION_DATAGUARD
    | `String "BACKUP_FROM_TIMESTAMP" -> BACKUP_FROM_TIMESTAMP
    | `String "BACKUP_FROM_ID" -> BACKUP_FROM_ID
    | `String "DATABASE" -> DATABASE
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceType")
     : source_type)
    : source_type)

let clone_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PARTIAL" -> PARTIAL
    | `String "METADATA" -> METADATA
    | `String "FULL" -> FULL
    | `String value -> raise (deserialize_unknown_enum_value_error path "CloneType" value)
    | _ -> raise (deserialize_wrong_type_error path "CloneType")
     : clone_type)
    : clone_type)

let database_clone_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clone_type = value_for_key clone_type_of_yojson "cloneType" _list path;
     source_autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "sourceAutonomousDatabaseId" _list path;
   }
    : database_clone_configuration)

let integer_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson tree path

let restore_from_backup_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clone_table_space_list =
       option_of_yojson (value_for_key integer_list_of_yojson "cloneTableSpaceList") _list path;
     clone_type = value_for_key clone_type_of_yojson "cloneType" _list path;
     autonomous_database_backup_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseBackupId" _list path;
   }
    : restore_from_backup_configuration)

let point_in_time_restore_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clone_table_space_list =
       option_of_yojson (value_for_key integer_list_of_yojson "cloneTableSpaceList") _list path;
     use_latest_available_backup_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "useLatestAvailableBackupTimestamp")
         _list path;
     timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timestamp")
         _list path;
     clone_type = value_for_key clone_type_of_yojson "cloneType" _list path;
     source_autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "sourceAutonomousDatabaseId" _list path;
   }
    : point_in_time_restore_configuration)

let arn_of_yojson = string_of_yojson

let cross_region_data_guard_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_autonomous_database_arn =
       value_for_key arn_of_yojson "sourceAutonomousDatabaseArn" _list path;
   }
    : cross_region_data_guard_configuration)

let disaster_recovery_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BACKUP_BASED" -> BACKUP_BASED
    | `String "ADG" -> ADG
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DisasterRecoveryType" value)
    | _ -> raise (deserialize_wrong_type_error path "DisasterRecoveryType")
     : disaster_recovery_type)
    : disaster_recovery_type)

let cross_region_disaster_recovery_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_replicate_automatic_backups =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isReplicateAutomaticBackups")
         _list path;
     remote_disaster_recovery_type =
       value_for_key disaster_recovery_type_of_yojson "remoteDisasterRecoveryType" _list path;
     source_autonomous_database_arn =
       value_for_key arn_of_yojson "sourceAutonomousDatabaseArn" _list path;
   }
    : cross_region_disaster_recovery_configuration)

let clone_to_refreshable_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clone_type = option_of_yojson (value_for_key clone_type_of_yojson "cloneType") _list path;
     open_mode = option_of_yojson (value_for_key open_mode_of_yojson "openMode") _list path;
     time_of_auto_refresh_start =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfAutoRefreshStart")
         _list path;
     auto_refresh_point_lag_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "autoRefreshPointLagInSeconds")
         _list path;
     auto_refresh_frequency_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "autoRefreshFrequencyInSeconds")
         _list path;
     refreshable_mode =
       option_of_yojson (value_for_key refreshable_mode_of_yojson "refreshableMode") _list path;
     source_autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "sourceAutonomousDatabaseId" _list path;
   }
    : clone_to_refreshable_configuration)

let source_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "cloneToRefreshable" ->
       CloneToRefreshable (clone_to_refreshable_configuration_of_yojson value_ path)
   | "crossRegionDisasterRecovery" ->
       CrossRegionDisasterRecovery
         (cross_region_disaster_recovery_configuration_of_yojson value_ path)
   | "crossRegionDataGuard" ->
       CrossRegionDataGuard (cross_region_data_guard_configuration_of_yojson value_ path)
   | "pointInTimeRestore" ->
       PointInTimeRestore (point_in_time_restore_configuration_of_yojson value_ path)
   | "restoreFromBackup" ->
       RestoreFromBackup (restore_from_backup_configuration_of_yojson value_ path)
   | "databaseClone" -> DatabaseClone (database_clone_configuration_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "SourceConfiguration" unknown)
    : source_configuration)

let shrink_autonomous_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     autonomous_database_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "autonomousDatabaseId" _list path;
   }
    : shrink_autonomous_database_output)

let shrink_autonomous_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : shrink_autonomous_database_input)

let shape_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AMPERE_FLEX_A1" -> AMPERE_FLEX_A1
    | `String "INTEL_FLEX_X9" -> INTEL_FLEX_X9
    | `String "INTEL" -> INTEL
    | `String "AMD" -> AMD
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShapeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ShapeType")
     : shape_type)
    : shape_type)

let service_network_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_type =
       option_of_yojson (value_for_key vpc_endpoint_type_of_yojson "vpcEndpointType") _list path;
     vpc_endpoint_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vpcEndpointId")
         _list path;
   }
    : service_network_endpoint)

let sensitive_string_list_of_yojson tree path = list_of_yojson sensitive_string_of_yojson tree path

let s3_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_policy_document =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "s3PolicyDocument")
         _list path;
     domain_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "domainName")
         _list path;
     ipv4_addresses =
       option_of_yojson (value_for_key string_list_of_yojson "ipv4Addresses") _list path;
     status = option_of_yojson (value_for_key managed_resource_status_of_yojson "status") _list path;
   }
    : s3_access)

let restore_autonomous_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     autonomous_database_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "autonomousDatabaseId" _list path;
   }
    : restore_autonomous_database_output)

let restore_autonomous_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
         "timestamp" _list path;
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : restore_autonomous_database_input)

let response_tag_map_of_yojson tree path =
  map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let resource_id_list_of_yojson tree path = list_of_yojson resource_id_of_yojson tree path

let refreshable_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_REFRESHING" -> NOT_REFRESHING
    | `String "REFRESHING" -> REFRESHING
    | `String value -> raise (deserialize_unknown_enum_value_error path "RefreshableStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RefreshableStatus")
     : refreshable_status)
    : refreshable_status)

let reboot_db_node_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key db_node_resource_status_of_yojson "status") _list path;
     db_node_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbNodeId" _list path;
   }
    : reboot_db_node_output)

let reboot_db_node_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_node_id = value_for_key resource_id_of_yojson "dbNodeId" _list path;
     cloud_vm_cluster_id = value_for_key resource_id_of_yojson "cloudVmClusterId" _list path;
   }
    : reboot_db_node_input)

let reboot_autonomous_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     autonomous_database_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "autonomousDatabaseId" _list path;
   }
    : reboot_autonomous_database_output)

let reboot_autonomous_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_online_reboot =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "isOnlineReboot")
         _list path;
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : reboot_autonomous_database_input)

let peer_network_route_table_id_of_yojson = string_of_yojson

let peer_network_route_table_id_list_of_yojson tree path =
  list_of_yojson peer_network_route_table_id_of_yojson tree path

let operations_insights_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED_DISABLING" -> FAILED_DISABLING
    | `String "FAILED_ENABLING" -> FAILED_ENABLING
    | `String "NOT_ENABLED" -> NOT_ENABLED
    | `String "DISABLING" -> DISABLING
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OperationsInsightsStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationsInsightsStatus")
     : operations_insights_status)
    : operations_insights_status)

let okv_encryption_key_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     okv_uri =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "okvUri" _list path;
     okv_kms_key =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "okvKmsKey" _list
         path;
     directory_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "directoryName" _list
         path;
     certificate_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "certificateId")
         _list path;
     certificate_directory_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "certificateDirectoryName" _list path;
   }
    : okv_encryption_key_configuration)

let odb_peering_connection_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     peer_network_cidrs =
       option_of_yojson (value_for_key peered_cidr_list_of_yojson "peerNetworkCidrs") _list path;
     odb_peering_connection_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "odbPeeringConnectionType")
         _list path;
     peer_network_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "peerNetworkArn")
         _list path;
     odb_network_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "odbNetworkArn")
         _list path;
     odb_peering_connection_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "odbPeeringConnectionArn")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     odb_peering_connection_id =
       value_for_key resource_id_or_arn_of_yojson "odbPeeringConnectionId" _list path;
   }
    : odb_peering_connection_summary)

let odb_peering_connection_list_of_yojson tree path =
  list_of_yojson odb_peering_connection_summary_of_yojson tree path

let odb_peering_connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     peer_network_cidrs =
       option_of_yojson (value_for_key peered_cidr_list_of_yojson "peerNetworkCidrs") _list path;
     odb_peering_connection_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "odbPeeringConnectionType")
         _list path;
     peer_network_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "peerNetworkArn")
         _list path;
     odb_network_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "odbNetworkArn")
         _list path;
     odb_peering_connection_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "odbPeeringConnectionArn")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     odb_peering_connection_id =
       value_for_key resource_id_or_arn_of_yojson "odbPeeringConnectionId" _list path;
   }
    : odb_peering_connection)

let oci_dns_forwarding_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oci_dns_listener_ip =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociDnsListenerIp")
         _list path;
     domain_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "domainName")
         _list path;
   }
    : oci_dns_forwarding_config)

let oci_dns_forwarding_config_list_of_yojson tree path =
  list_of_yojson oci_dns_forwarding_config_of_yojson tree path

let managed_s3_backup_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ipv4_addresses =
       option_of_yojson (value_for_key string_list_of_yojson "ipv4Addresses") _list path;
     status = option_of_yojson (value_for_key managed_resource_status_of_yojson "status") _list path;
   }
    : managed_s3_backup_access)

let kms_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_policy_document =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "kmsPolicyDocument")
         _list path;
     domain_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "domainName")
         _list path;
     ipv4_addresses =
       option_of_yojson (value_for_key string_list_of_yojson "ipv4Addresses") _list path;
     status = option_of_yojson (value_for_key managed_resource_status_of_yojson "status") _list path;
   }
    : kms_access)

let cross_region_s3_restore_sources_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key managed_resource_status_of_yojson "status") _list path;
     ipv4_addresses =
       option_of_yojson (value_for_key string_list_of_yojson "ipv4Addresses") _list path;
     region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "region")
         _list path;
   }
    : cross_region_s3_restore_sources_access)

let cross_region_s3_restore_sources_access_list_of_yojson tree path =
  list_of_yojson cross_region_s3_restore_sources_access_of_yojson tree path

let managed_services_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_region_s3_restore_sources_access =
       option_of_yojson
         (value_for_key cross_region_s3_restore_sources_access_list_of_yojson
            "crossRegionS3RestoreSourcesAccess")
         _list path;
     kms_access = option_of_yojson (value_for_key kms_access_of_yojson "kmsAccess") _list path;
     sts_access = option_of_yojson (value_for_key sts_access_of_yojson "stsAccess") _list path;
     s3_access = option_of_yojson (value_for_key s3_access_of_yojson "s3Access") _list path;
     zero_etl_access =
       option_of_yojson (value_for_key zero_etl_access_of_yojson "zeroEtlAccess") _list path;
     managed_s3_backup_access =
       option_of_yojson
         (value_for_key managed_s3_backup_access_of_yojson "managedS3BackupAccess")
         _list path;
     service_network_endpoint =
       option_of_yojson
         (value_for_key service_network_endpoint_of_yojson "serviceNetworkEndpoint")
         _list path;
     managed_services_ipv4_cidrs =
       option_of_yojson (value_for_key string_list_of_yojson "managedServicesIpv4Cidrs") _list path;
     resource_gateway_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "resourceGatewayArn") _list path;
     service_network_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "serviceNetworkArn") _list path;
   }
    : managed_services)

let odb_network_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_placement_group_ids =
       option_of_yojson (value_for_key resource_id_list_of_yojson "ec2PlacementGroupIds") _list path;
     managed_services =
       option_of_yojson (value_for_key managed_services_of_yojson "managedServices") _list path;
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     oci_dns_forwarding_configs =
       option_of_yojson
         (value_for_key oci_dns_forwarding_config_list_of_yojson "ociDnsForwardingConfigs")
         _list path;
     oci_vcn_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociVcnUrl")
         _list path;
     oci_vcn_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociVcnId")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     oci_network_anchor_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociNetworkAnchorUrl")
         _list path;
     oci_network_anchor_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociNetworkAnchorId")
         _list path;
     peered_cidrs = option_of_yojson (value_for_key string_list_of_yojson "peeredCidrs") _list path;
     default_dns_prefix =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "defaultDnsPrefix")
         _list path;
     custom_domain_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "customDomainName")
         _list path;
     backup_subnet_cidr =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "backupSubnetCidr")
         _list path;
     client_subnet_cidr =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientSubnetCidr")
         _list path;
     availability_zone_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "availabilityZoneId")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     odb_network_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "odbNetworkArn")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     odb_network_id = value_for_key resource_id_or_arn_of_yojson "odbNetworkId" _list path;
   }
    : odb_network_summary)

let odb_network_list_of_yojson tree path = list_of_yojson odb_network_summary_of_yojson tree path

let odb_network_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_placement_group_ids =
       option_of_yojson (value_for_key resource_id_list_of_yojson "ec2PlacementGroupIds") _list path;
     managed_services =
       option_of_yojson (value_for_key managed_services_of_yojson "managedServices") _list path;
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     oci_dns_forwarding_configs =
       option_of_yojson
         (value_for_key oci_dns_forwarding_config_list_of_yojson "ociDnsForwardingConfigs")
         _list path;
     oci_vcn_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociVcnUrl")
         _list path;
     oci_vcn_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociVcnId")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     oci_network_anchor_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociNetworkAnchorUrl")
         _list path;
     oci_network_anchor_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociNetworkAnchorId")
         _list path;
     peered_cidrs = option_of_yojson (value_for_key string_list_of_yojson "peeredCidrs") _list path;
     default_dns_prefix =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "defaultDnsPrefix")
         _list path;
     custom_domain_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "customDomainName")
         _list path;
     backup_subnet_cidr =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "backupSubnetCidr")
         _list path;
     client_subnet_cidr =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientSubnetCidr")
         _list path;
     availability_zone_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "availabilityZoneId")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     odb_network_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "odbNetworkArn")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     odb_network_id = value_for_key resource_id_or_arn_of_yojson "odbNetworkId" _list path;
   }
    : odb_network)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key response_tag_map_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let list_system_versions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     system_versions = value_for_key system_version_list_of_yojson "systemVersions" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_system_versions_output)

let list_system_versions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shape =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shape" _list path;
     gi_version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "giVersion" _list
         path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_system_versions_input)

let gi_version_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "version")
         _list path;
   }
    : gi_version_summary)

let gi_version_list_of_yojson tree path = list_of_yojson gi_version_summary_of_yojson tree path

let list_gi_versions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gi_versions = value_for_key gi_version_list_of_yojson "giVersions" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_gi_versions_output)

let list_gi_versions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shape =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shape")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_gi_versions_input)

let compute_model_of_yojson (tree : t) path =
  ((match tree with
    | `String "OCPU" -> OCPU
    | `String "ECPU" -> ECPU
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComputeModel" value)
    | _ -> raise (deserialize_wrong_type_error path "ComputeModel")
     : compute_model)
    : compute_model)

let db_system_shape_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     are_server_types_supported =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "areServerTypesSupported")
         _list path;
     compute_model =
       option_of_yojson (value_for_key compute_model_of_yojson "computeModel") _list path;
     name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name")
         _list path;
     shape_type = option_of_yojson (value_for_key shape_type_of_yojson "shapeType") _list path;
     shape_family =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shapeFamily")
         _list path;
     runtime_minimum_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "runtimeMinimumCoreCount")
         _list path;
     minimum_node_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "minimumNodeCount")
         _list path;
     minimum_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "minimumCoreCount")
         _list path;
     min_storage_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "minStorageCount")
         _list path;
     min_memory_per_node_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "minMemoryPerNodeInGBs")
         _list path;
     min_db_node_storage_per_node_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "minDbNodeStoragePerNodeInGBs")
         _list path;
     min_data_storage_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "minDataStorageInTBs")
         _list path;
     min_core_count_per_node =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "minCoreCountPerNode")
         _list path;
     maximum_node_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maximumNodeCount")
         _list path;
     max_storage_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxStorageCount")
         _list path;
     core_count_increment =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "coreCountIncrement")
         _list path;
     available_memory_per_node_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableMemoryPerNodeInGBs")
         _list path;
     available_memory_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableMemoryInGBs")
         _list path;
     available_db_node_storage_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableDbNodeStorageInGBs")
         _list path;
     available_db_node_per_node_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableDbNodePerNodeInGBs")
         _list path;
     available_data_storage_per_server_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableDataStoragePerServerInTBs")
         _list path;
     available_data_storage_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableDataStorageInTBs")
         _list path;
     available_core_count_per_node =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableCoreCountPerNode")
         _list path;
     available_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableCoreCount")
         _list path;
   }
    : db_system_shape_summary)

let db_system_shape_list_of_yojson tree path =
  list_of_yojson db_system_shape_summary_of_yojson tree path

let list_db_system_shapes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_system_shapes = value_for_key db_system_shape_list_of_yojson "dbSystemShapes" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_db_system_shapes_output)

let list_db_system_shapes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "availabilityZoneId")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_db_system_shapes_input)

let autonomous_database_version_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "version")
         _list path;
     details =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "details")
         _list path;
     db_workload = option_of_yojson (value_for_key db_workload_of_yojson "dbWorkload") _list path;
   }
    : autonomous_database_version_summary)

let autonomous_database_version_list_of_yojson tree path =
  list_of_yojson autonomous_database_version_summary_of_yojson tree path

let list_autonomous_database_versions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_versions =
       value_for_key autonomous_database_version_list_of_yojson "autonomousDatabaseVersions" _list
         path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_autonomous_database_versions_output)

let list_autonomous_database_versions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_workload = option_of_yojson (value_for_key db_workload_of_yojson "dbWorkload") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_autonomous_database_versions_input)

let autonomous_database_character_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     character_set =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "characterSet")
         _list path;
   }
    : autonomous_database_character_set_summary)

let autonomous_database_character_set_list_of_yojson tree path =
  list_of_yojson autonomous_database_character_set_summary_of_yojson tree path

let list_autonomous_database_character_sets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_character_sets =
       value_for_key autonomous_database_character_set_list_of_yojson
         "autonomousDatabaseCharacterSets" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_autonomous_database_character_sets_output)

let list_autonomous_database_character_sets_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     character_set_type =
       option_of_yojson (value_for_key character_set_type_of_yojson "characterSetType") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_autonomous_database_character_sets_input)

let initialize_service_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let initialize_service_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oci_identity_domain =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "ociIdentityDomain")
         _list path;
   }
    : initialize_service_input)

let oci_onboarding_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CANCELED" -> CANCELED
    | `String "SUSPENDED" -> SUSPENDED
    | `String "PUBLIC_OFFER_UNSUPPORTED" -> PUBLIC_OFFER_UNSUPPORTED
    | `String "FAILED" -> FAILED
    | `String "ACTIVE_LIMITED" -> ACTIVE_LIMITED
    | `String "ACTIVE" -> ACTIVE
    | `String "ACTIVE_IN_HOME_REGION" -> ACTIVE_IN_HOME_REGION
    | `String "ACTIVATING" -> ACTIVATING
    | `String "PENDING_INITIALIZATION" -> PENDING_INITIALIZATION
    | `String "PENDING_CUSTOMER_ACTION" -> PENDING_CUSTOMER_ACTION
    | `String "PENDING_LINK_GENERATION" -> PENDING_LINK_GENERATION
    | `String "NOT_STARTED" -> NOT_STARTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "OciOnboardingStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OciOnboardingStatus")
     : oci_onboarding_status)
    : oci_onboarding_status)

let oci_identity_domain_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_setup_cloud_formation_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "accountSetupCloudFormationUrl")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     oci_identity_domain_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociIdentityDomainUrl")
         _list path;
     oci_identity_domain_resource_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociIdentityDomainResourceUrl")
         _list path;
     oci_identity_domain_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociIdentityDomainId")
         _list path;
   }
    : oci_identity_domain)

let oci_aws_integration_of_yojson (tree : t) path =
  ((match tree with
    | `String "KmsTde" -> KmsTde
    | `String value -> raise (deserialize_unknown_enum_value_error path "OciAwsIntegration" value)
    | _ -> raise (deserialize_wrong_type_error path "OciAwsIntegration")
     : oci_aws_integration)
    : oci_aws_integration)

let oci_iam_role_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_integration =
       option_of_yojson (value_for_key oci_aws_integration_of_yojson "awsIntegration") _list path;
     iam_role_arn = option_of_yojson (value_for_key role_arn_of_yojson "iamRoleArn") _list path;
   }
    : oci_iam_role)

let oci_iam_role_list_of_yojson tree path = list_of_yojson oci_iam_role_of_yojson tree path

let get_oci_onboarding_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription_errors =
       option_of_yojson
         (value_for_key subscription_errors_of_yojson "subscriptionErrors")
         _list path;
     linked_oci_compartment_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "linkedOciCompartmentId")
         _list path;
     linked_oci_tenancy_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "linkedOciTenancyId")
         _list path;
     autonomous_database_oci_integration_iam_roles =
       option_of_yojson
         (value_for_key oci_iam_role_list_of_yojson "autonomousDatabaseOciIntegrationIamRoles")
         _list path;
     oci_identity_domain =
       option_of_yojson (value_for_key oci_identity_domain_of_yojson "ociIdentityDomain") _list path;
     new_tenancy_activation_link =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "newTenancyActivationLink")
         _list path;
     existing_tenancy_activation_link =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "existingTenancyActivationLink")
         _list path;
     status = option_of_yojson (value_for_key oci_onboarding_status_of_yojson "status") _list path;
   }
    : get_oci_onboarding_status_output)

let get_oci_onboarding_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_iam_role_from_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_iam_role_from_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
     aws_integration = value_for_key supported_aws_integration_of_yojson "awsIntegration" _list path;
     iam_role_arn = value_for_key role_arn_of_yojson "iamRoleArn" _list path;
   }
    : disassociate_iam_role_from_resource_input)

let associate_iam_role_to_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_iam_role_to_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
     aws_integration = value_for_key supported_aws_integration_of_yojson "awsIntegration" _list path;
     iam_role_arn = value_for_key role_arn_of_yojson "iamRoleArn" _list path;
   }
    : associate_iam_role_to_resource_input)

let accept_marketplace_registration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let accept_marketplace_registration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marketplace_registration_token =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "marketplaceRegistrationToken" _list path;
   }
    : accept_marketplace_registration_input)

let oci_encryption_key_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vault_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vaultId" _list path;
     kms_key_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId" _list path;
   }
    : oci_encryption_key_configuration)

let objective_of_yojson (tree : t) path =
  ((match tree with
    | `String "LOW_LATENCY" -> LOW_LATENCY
    | `String "HIGH_THROUGHPUT" -> HIGH_THROUGHPUT
    | `String "BASIC" -> BASIC
    | `String "BALANCED" -> BALANCED
    | `String "AUTO" -> AUTO
    | `String value -> raise (deserialize_unknown_enum_value_error path "Objective" value)
    | _ -> raise (deserialize_wrong_type_error path "Objective")
     : objective)
    : objective)

let net_services_architecture_of_yojson (tree : t) path =
  ((match tree with
    | `String "SHARED" -> SHARED
    | `String "DEDICATED" -> DEDICATED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NetServicesArchitecture" value)
    | _ -> raise (deserialize_wrong_type_error path "NetServicesArchitecture")
     : net_services_architecture)
    : net_services_architecture)

let list_odb_peering_connections_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     odb_peering_connections =
       value_for_key odb_peering_connection_list_of_yojson "odbPeeringConnections" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_odb_peering_connections_output)

let list_odb_peering_connections_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     odb_network_id =
       option_of_yojson (value_for_key resource_id_or_arn_of_yojson "odbNetworkId") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_odb_peering_connections_input)

let list_odb_networks_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     odb_networks = value_for_key odb_network_list_of_yojson "odbNetworks" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_odb_networks_output)

let list_odb_networks_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_odb_networks_input)

let db_server_patching_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SCHEDULED" -> SCHEDULED
    | `String "MAINTENANCE_IN_PROGRESS" -> MAINTENANCE_IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "COMPLETE" -> COMPLETE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DbServerPatchingStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DbServerPatchingStatus")
     : db_server_patching_status)
    : db_server_patching_status)

let db_server_patching_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_patching_started =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "timePatchingStarted")
         _list path;
     time_patching_ended =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "timePatchingEnded")
         _list path;
     patching_status =
       option_of_yojson
         (value_for_key db_server_patching_status_of_yojson "patchingStatus")
         _list path;
     estimated_patch_duration =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "estimatedPatchDuration")
         _list path;
   }
    : db_server_patching_details)

let db_server_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_virtual_machine_ids =
       option_of_yojson
         (value_for_key string_list_of_yojson "autonomousVirtualMachineIds")
         _list path;
     autonomous_vm_cluster_ids =
       option_of_yojson (value_for_key string_list_of_yojson "autonomousVmClusterIds") _list path;
     compute_model =
       option_of_yojson (value_for_key compute_model_of_yojson "computeModel") _list path;
     vm_cluster_ids =
       option_of_yojson (value_for_key string_list_of_yojson "vmClusterIds") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     shape =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shape")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     max_memory_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxMemoryInGBs")
         _list path;
     max_db_node_storage_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "maxDbNodeStorageInGBs")
         _list path;
     max_cpu_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxCpuCount")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     exadata_infrastructure_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "exadataInfrastructureId")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     db_server_patching_details =
       option_of_yojson
         (value_for_key db_server_patching_details_of_yojson "dbServerPatchingDetails")
         _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     db_server_id = option_of_yojson (value_for_key resource_id_of_yojson "dbServerId") _list path;
   }
    : db_server_summary)

let db_server_list_of_yojson tree path = list_of_yojson db_server_summary_of_yojson tree path

let list_db_servers_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_servers = value_for_key db_server_list_of_yojson "dbServers" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_db_servers_output)

let list_db_servers_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     cloud_exadata_infrastructure_id =
       value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId" _list path;
   }
    : list_db_servers_input)

let db_node_maintenance_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VMDB_REBOOT_MIGRATION" -> VMDB_REBOOT_MIGRATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DbNodeMaintenanceType" value)
    | _ -> raise (deserialize_wrong_type_error path "DbNodeMaintenanceType")
     : db_node_maintenance_type)
    : db_node_maintenance_type)

let db_node_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vnic_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vnicId")
         _list path;
     vnic2_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vnic2Id")
         _list path;
     total_cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "totalCpuCoreCount")
         _list path;
     time_maintenance_window_start =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "timeMaintenanceWindowStart")
         _list path;
     time_maintenance_window_end =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "timeMaintenanceWindowEnd")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     software_storage_size_in_g_b =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "softwareStorageSizeInGB")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     maintenance_type =
       option_of_yojson
         (value_for_key db_node_maintenance_type_of_yojson "maintenanceType")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     hostname =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hostname")
         _list path;
     host_ip_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hostIpId")
         _list path;
     fault_domain =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "faultDomain")
         _list path;
     db_system_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbSystemId")
         _list path;
     db_server_id = option_of_yojson (value_for_key resource_id_of_yojson "dbServerId") _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     backup_vnic_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "backupVnicId")
         _list path;
     backup_vnic2_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "backupVnic2Id")
         _list path;
     backup_ip_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "backupIpId")
         _list path;
     additional_details =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "additionalDetails")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key db_node_resource_status_of_yojson "status") _list path;
     db_node_arn = option_of_yojson (value_for_key resource_arn_of_yojson "dbNodeArn") _list path;
     db_node_id = option_of_yojson (value_for_key resource_id_of_yojson "dbNodeId") _list path;
   }
    : db_node_summary)

let db_node_list_of_yojson tree path = list_of_yojson db_node_summary_of_yojson tree path

let list_db_nodes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_nodes = value_for_key db_node_list_of_yojson "dbNodes" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_db_nodes_output)

let list_db_nodes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_vm_cluster_id = value_for_key resource_id_of_yojson "cloudVmClusterId" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_db_nodes_input)

let data_collection_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_incident_logs_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isIncidentLogsEnabled")
         _list path;
     is_health_monitoring_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isHealthMonitoringEnabled")
         _list path;
     is_diagnostics_events_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isDiagnosticsEventsEnabled")
         _list path;
   }
    : data_collection_options)

let disk_redundancy_of_yojson (tree : t) path =
  ((match tree with
    | `String "NORMAL" -> NORMAL
    | `String "HIGH" -> HIGH
    | `String value -> raise (deserialize_unknown_enum_value_error path "DiskRedundancy" value)
    | _ -> raise (deserialize_wrong_type_error path "DiskRedundancy")
     : disk_redundancy)
    : disk_redundancy)

let db_iorm_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     share =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "share")
         _list path;
     flash_cache_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "flashCacheLimit")
         _list path;
     db_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbName")
         _list path;
   }
    : db_iorm_config)

let db_iorm_config_list_of_yojson tree path = list_of_yojson db_iorm_config_of_yojson tree path

let iorm_lifecycle_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATING" -> UPDATING
    | `String "FAILED" -> FAILED
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String "BOOTSTRAPPING" -> BOOTSTRAPPING
    | `String value -> raise (deserialize_unknown_enum_value_error path "IormLifecycleState" value)
    | _ -> raise (deserialize_wrong_type_error path "IormLifecycleState")
     : iorm_lifecycle_state)
    : iorm_lifecycle_state)

let exadata_iorm_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     objective = option_of_yojson (value_for_key objective_of_yojson "objective") _list path;
     lifecycle_state =
       option_of_yojson (value_for_key iorm_lifecycle_state_of_yojson "lifecycleState") _list path;
     lifecycle_details =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "lifecycleDetails")
         _list path;
     db_plans = option_of_yojson (value_for_key db_iorm_config_list_of_yojson "dbPlans") _list path;
   }
    : exadata_iorm_config)

let iam_role_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNKNOWN" -> UNKNOWN
    | `String "PARTIALLY_CONNECTED" -> PARTIALLY_CONNECTED
    | `String "DISCONNECTED" -> DISCONNECTED
    | `String "CONNECTED" -> CONNECTED
    | `String "FAILED" -> FAILED
    | `String "DISASSOCIATING" -> DISASSOCIATING
    | `String "ASSOCIATING" -> ASSOCIATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "IamRoleStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "IamRoleStatus")
     : iam_role_status)
    : iam_role_status)

let iam_role_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_integration =
       option_of_yojson
         (value_for_key supported_aws_integration_of_yojson "awsIntegration")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key iam_role_status_of_yojson "status") _list path;
     iam_role_arn = option_of_yojson (value_for_key role_arn_of_yojson "iamRoleArn") _list path;
   }
    : iam_role)

let iam_role_list_of_yojson tree path = list_of_yojson iam_role_of_yojson tree path

let cloud_vm_cluster_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iam_roles = option_of_yojson (value_for_key iam_role_list_of_yojson "iamRoles") _list path;
     compute_model =
       option_of_yojson (value_for_key compute_model_of_yojson "computeModel") _list path;
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     odb_network_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "odbNetworkArn") _list path;
     odb_network_id =
       option_of_yojson (value_for_key resource_id_or_arn_of_yojson "odbNetworkId") _list path;
     vip_ids = option_of_yojson (value_for_key string_list_of_yojson "vipIds") _list path;
     time_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "timeZone")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     system_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "systemVersion")
         _list path;
     storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "storageSizeInGBs")
         _list path;
     ssh_public_keys =
       option_of_yojson (value_for_key sensitive_string_list_of_yojson "sshPublicKeys") _list path;
     shape =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shape")
         _list path;
     scan_ip_ids = option_of_yojson (value_for_key string_list_of_yojson "scanIpIds") _list path;
     scan_dns_record_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "scanDnsRecordId")
         _list path;
     scan_dns_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "scanDnsName")
         _list path;
     domain =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "domain")
         _list path;
     oci_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociUrl")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     node_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "nodeCount")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     listener_port =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "listenerPort")
         _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     last_update_history_entry_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "lastUpdateHistoryEntryId")
         _list path;
     is_sparse_diskgroup_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isSparseDiskgroupEnabled")
         _list path;
     is_local_backup_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isLocalBackupEnabled")
         _list path;
     iorm_config_cache =
       option_of_yojson (value_for_key exadata_iorm_config_of_yojson "iormConfigCache") _list path;
     hostname =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hostname")
         _list path;
     gi_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "giVersion")
         _list path;
     disk_redundancy =
       option_of_yojson (value_for_key disk_redundancy_of_yojson "diskRedundancy") _list path;
     db_servers = option_of_yojson (value_for_key string_list_of_yojson "dbServers") _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "dataStorageSizeInTBs")
         _list path;
     data_collection_options =
       option_of_yojson
         (value_for_key data_collection_options_of_yojson "dataCollectionOptions")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     cluster_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clusterName")
         _list path;
     cloud_exadata_infrastructure_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "cloudExadataInfrastructureArn")
         _list path;
     cloud_exadata_infrastructure_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "cloudExadataInfrastructureId")
         _list path;
     cloud_vm_cluster_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "cloudVmClusterArn")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     cloud_vm_cluster_id = value_for_key resource_id_of_yojson "cloudVmClusterId" _list path;
   }
    : cloud_vm_cluster_summary)

let cloud_vm_cluster_list_of_yojson tree path =
  list_of_yojson cloud_vm_cluster_summary_of_yojson tree path

let list_cloud_vm_clusters_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_vm_clusters = value_for_key cloud_vm_cluster_list_of_yojson "cloudVmClusters" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_cloud_vm_clusters_output)

let list_cloud_vm_clusters_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_exadata_infrastructure_id =
       option_of_yojson
         (value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_cloud_vm_clusters_input)

let cloud_exadata_infrastructure_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute_model =
       option_of_yojson (value_for_key compute_model_of_yojson "computeModel") _list path;
     storage_server_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "storageServerType")
         _list path;
     database_server_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "databaseServerType")
         _list path;
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     total_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "totalStorageSizeInGBs")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     storage_server_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "storageServerVersion")
         _list path;
     storage_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "storageCount")
         _list path;
     shape =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shape")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     oci_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociUrl")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     next_maintenance_run_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "nextMaintenanceRunId")
         _list path;
     monthly_storage_server_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "monthlyStorageServerVersion")
         _list path;
     monthly_db_server_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "monthlyDbServerVersion")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     max_memory_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxMemoryInGBs")
         _list path;
     max_db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "maxDbNodeStorageSizeInGBs")
         _list path;
     max_data_storage_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "maxDataStorageInTBs")
         _list path;
     max_cpu_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxCpuCount")
         _list path;
     maintenance_window =
       option_of_yojson (value_for_key maintenance_window_of_yojson "maintenanceWindow") _list path;
     last_maintenance_run_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "lastMaintenanceRunId")
         _list path;
     db_server_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbServerVersion")
         _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "dataStorageSizeInTBs")
         _list path;
     customer_contacts_to_send_to_oc_i =
       option_of_yojson
         (value_for_key customer_contacts_of_yojson "customerContactsToSendToOCI")
         _list path;
     cpu_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCount")
         _list path;
     compute_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "computeCount")
         _list path;
     availability_zone_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "availabilityZoneId")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     available_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableStorageSizeInGBs")
         _list path;
     additional_storage_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "additionalStorageCount")
         _list path;
     activated_storage_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "activatedStorageCount")
         _list path;
     cloud_exadata_infrastructure_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "cloudExadataInfrastructureArn")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     cloud_exadata_infrastructure_id =
       value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId" _list path;
   }
    : cloud_exadata_infrastructure_summary)

let cloud_exadata_infrastructure_list_of_yojson tree path =
  list_of_yojson cloud_exadata_infrastructure_summary_of_yojson tree path

let list_cloud_exadata_infrastructures_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_exadata_infrastructures =
       value_for_key cloud_exadata_infrastructure_list_of_yojson "cloudExadataInfrastructures" _list
         path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_cloud_exadata_infrastructures_output)

let list_cloud_exadata_infrastructures_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_cloud_exadata_infrastructures_input)

let cloud_autonomous_vm_cluster_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iam_roles = option_of_yojson (value_for_key iam_role_list_of_yojson "iamRoles") _list path;
     total_container_databases =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "totalContainerDatabases")
         _list path;
     time_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "timeZone")
         _list path;
     time_ords_certificate_expires =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOrdsCertificateExpires")
         _list path;
     time_database_ssl_certificate_expires =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeDatabaseSslCertificateExpires")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     shape =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shape")
         _list path;
     scan_listener_port_tls =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scanListenerPortTls")
         _list path;
     scan_listener_port_non_tls =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scanListenerPortNonTls")
         _list path;
     reserved_cpus =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "reservedCpus")
         _list path;
     reclaimable_cpus =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "reclaimableCpus")
         _list path;
     provisioned_cpus =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "provisionedCpus")
         _list path;
     provisioned_autonomous_container_databases =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "provisionedAutonomousContainerDatabases")
         _list path;
     provisionable_autonomous_container_databases =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "provisionableAutonomousContainerDatabases")
         _list path;
     non_provisionable_autonomous_container_databases =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "nonProvisionableAutonomousContainerDatabases")
         _list path;
     node_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "nodeCount")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     memory_per_oracle_compute_unit_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "memoryPerOracleComputeUnitInGBs")
         _list path;
     max_acds_lowest_scaled_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "maxAcdsLowestScaledValue")
         _list path;
     maintenance_window =
       option_of_yojson (value_for_key maintenance_window_of_yojson "maintenanceWindow") _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     is_mtls_enabled_vm_cluster =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isMtlsEnabledVmCluster")
         _list path;
     oci_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociUrl")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     hostname =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hostname")
         _list path;
     exadata_storage_in_t_bs_lowest_scaled_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "exadataStorageInTBsLowestScaledValue")
         _list path;
     domain =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "domain")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     db_servers = option_of_yojson (value_for_key string_list_of_yojson "dbServers") _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "dataStorageSizeInTBs")
         _list path;
     data_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "dataStorageSizeInGBs")
         _list path;
     cpu_percentage =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "cpuPercentage")
         _list path;
     cpu_core_count_per_node =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "cpuCoreCountPerNode")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     compute_model =
       option_of_yojson (value_for_key compute_model_of_yojson "computeModel") _list path;
     available_cpus =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "availableCpus")
         _list path;
     available_container_databases =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableContainerDatabases")
         _list path;
     available_autonomous_data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "availableAutonomousDataStorageSizeInTBs")
         _list path;
     autonomous_data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "autonomousDataStorageSizeInTBs")
         _list path;
     autonomous_data_storage_percentage =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
            "autonomousDataStoragePercentage")
         _list path;
     cloud_exadata_infrastructure_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "cloudExadataInfrastructureArn")
         _list path;
     cloud_exadata_infrastructure_id =
       option_of_yojson
         (value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson (value_for_key resource_display_name_of_yojson "displayName") _list path;
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     odb_network_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "odbNetworkArn") _list path;
     odb_network_id =
       option_of_yojson (value_for_key resource_id_or_arn_of_yojson "odbNetworkId") _list path;
     cloud_autonomous_vm_cluster_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "cloudAutonomousVmClusterArn")
         _list path;
     cloud_autonomous_vm_cluster_id =
       value_for_key resource_id_of_yojson "cloudAutonomousVmClusterId" _list path;
   }
    : cloud_autonomous_vm_cluster_summary)

let cloud_autonomous_vm_cluster_list_of_yojson tree path =
  list_of_yojson cloud_autonomous_vm_cluster_summary_of_yojson tree path

let list_cloud_autonomous_vm_clusters_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_autonomous_vm_clusters =
       value_for_key cloud_autonomous_vm_cluster_list_of_yojson "cloudAutonomousVmClusters" _list
         path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_cloud_autonomous_vm_clusters_output)

let list_cloud_autonomous_vm_clusters_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_exadata_infrastructure_id =
       option_of_yojson
         (value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_cloud_autonomous_vm_clusters_input)

let autonomous_virtual_machine_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     cloud_autonomous_vm_cluster_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "cloudAutonomousVmClusterId")
         _list path;
     client_ip_address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientIpAddress")
         _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     db_server_display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "dbServerDisplayName")
         _list path;
     db_server_id = option_of_yojson (value_for_key resource_id_of_yojson "dbServerId") _list path;
     vm_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vmName")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     autonomous_virtual_machine_id =
       option_of_yojson
         (value_for_key resource_id_of_yojson "autonomousVirtualMachineId")
         _list path;
   }
    : autonomous_virtual_machine_summary)

let autonomous_virtual_machine_list_of_yojson tree path =
  list_of_yojson autonomous_virtual_machine_summary_of_yojson tree path

let list_autonomous_virtual_machines_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_virtual_machines =
       value_for_key autonomous_virtual_machine_list_of_yojson "autonomousVirtualMachines" _list
         path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_autonomous_virtual_machines_output)

let list_autonomous_virtual_machines_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_autonomous_vm_cluster_id =
       value_for_key resource_id_of_yojson "cloudAutonomousVmClusterId" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_autonomous_virtual_machines_input)

let database_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLONE" -> CLONE
    | `String "REGULAR" -> REGULAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatabaseType" value)
    | _ -> raise (deserialize_wrong_type_error path "DatabaseType")
     : database_type)
    : database_type)

let database_connection_string_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let database_connection_string_profile_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "value")
         _list path;
     tls_authentication =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "tlsAuthentication")
         _list path;
     syntax_format =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "syntaxFormat")
         _list path;
     session_mode =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sessionMode")
         _list path;
     protocol =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "protocol")
         _list path;
     is_regional =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "isRegional")
         _list path;
     host_format =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hostFormat")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     consumer_group =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "consumerGroup")
         _list path;
   }
    : database_connection_string_profile)

let database_connection_string_profile_list_of_yojson tree path =
  list_of_yojson database_connection_string_profile_of_yojson tree path

let autonomous_database_connection_strings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profiles =
       option_of_yojson
         (value_for_key database_connection_string_profile_list_of_yojson "profiles")
         _list path;
     low =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "low")
         _list path;
     medium =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "medium")
         _list path;
     high =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "high")
         _list path;
     dedicated =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dedicated")
         _list path;
     all_connection_strings =
       option_of_yojson
         (value_for_key database_connection_string_map_of_yojson "allConnectionStrings")
         _list path;
   }
    : autonomous_database_connection_strings)

let autonomous_database_apex_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ords_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ordsVersion")
         _list path;
     apex_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "apexVersion")
         _list path;
   }
    : autonomous_database_apex)

let database_standby_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_maintenance_end =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeMaintenanceEnd")
         _list path;
     time_maintenance_begin =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeMaintenanceBegin")
         _list path;
     time_disaster_recovery_role_changed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeDisasterRecoveryRoleChanged")
         _list path;
     time_data_guard_role_changed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeDataGuardRoleChanged")
         _list path;
     maintenance_target_component =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "maintenanceTargetComponent")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     lag_time_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "lagTimeInSeconds")
         _list path;
     availability_domain =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "availabilityDomain")
         _list path;
   }
    : database_standby_summary)

let data_safe_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "NOT_REGISTERED" -> NOT_REGISTERED
    | `String "DEREGISTERING" -> DEREGISTERING
    | `String "REGISTERED" -> REGISTERED
    | `String "REGISTERING" -> REGISTERING
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataSafeStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DataSafeStatus")
     : data_safe_status)
    : data_safe_status)

let database_management_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED_DISABLING" -> FAILED_DISABLING
    | `String "FAILED_ENABLING" -> FAILED_ENABLING
    | `String "NOT_ENABLED" -> NOT_ENABLED
    | `String "DISABLING" -> DISABLING
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DatabaseManagementStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DatabaseManagementStatus")
     : database_management_status)
    : database_management_status)

let autonomous_database_connection_urls_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sql_dev_web_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sqlDevWebUrl")
         _list path;
     spatial_studio_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "spatialStudioUrl")
         _list path;
     ords_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ordsUrl")
         _list path;
     mongo_db_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "mongoDbUrl")
         _list path;
     machine_learning_user_management_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "machineLearningUserManagementUrl")
         _list path;
     machine_learning_notebook_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "machineLearningNotebookUrl")
         _list path;
     graph_studio_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "graphStudioUrl")
         _list path;
     database_transforms_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "databaseTransformsUrl")
         _list path;
     apex_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "apexUrl")
         _list path;
   }
    : autonomous_database_connection_urls)

let data_guard_role_of_yojson (tree : t) path =
  ((match tree with
    | `String "SNAPSHOT_STANDBY" -> SNAPSHOT_STANDBY
    | `String "BACKUP_COPY" -> BACKUP_COPY
    | `String "DISABLED_STANDBY" -> DISABLED_STANDBY
    | `String "STANDBY" -> STANDBY
    | `String "PRIMARY" -> PRIMARY
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataGuardRole" value)
    | _ -> raise (deserialize_wrong_type_error path "DataGuardRole")
     : data_guard_role)
    : data_guard_role)

let disaster_recovery_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_snapshot_standby_enabled_till =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeSnapshotStandbyEnabledTill")
         _list path;
     is_snapshot_standby =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isSnapshotStandby")
         _list path;
     is_replicate_automatic_backups =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isReplicateAutomaticBackups")
         _list path;
     disaster_recovery_type =
       option_of_yojson
         (value_for_key disaster_recovery_type_of_yojson "disasterRecoveryType")
         _list path;
   }
    : disaster_recovery_configuration)

let encryption_key_provider_of_yojson (tree : t) path =
  ((match tree with
    | `String "OCI" -> OCI
    | `String "OKV" -> OKV
    | `String "AWS_KMS" -> AWS_KMS
    | `String "ORACLE_MANAGED" -> ORACLE_MANAGED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EncryptionKeyProvider" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionKeyProvider")
     : encryption_key_provider)
    : encryption_key_provider)

let aws_encryption_key_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key kms_key_id_or_arn_of_yojson "kmsKeyId") _list path;
     external_id_type =
       option_of_yojson (value_for_key external_id_type_of_yojson "externalIdType") _list path;
     iam_role_arn = option_of_yojson (value_for_key role_arn_of_yojson "iamRoleArn") _list path;
   }
    : aws_encryption_key_configuration)

let encryption_key_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "okvEncryptionKey" -> OkvEncryptionKey (okv_encryption_key_configuration_of_yojson value_ path)
   | "ociEncryptionKey" -> OciEncryptionKey (oci_encryption_key_configuration_of_yojson value_ path)
   | "awsEncryptionKey" -> AwsEncryptionKey (aws_encryption_key_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "EncryptionKeyConfiguration" unknown)
    : encryption_key_configuration)

let encryption_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_key_configuration =
       option_of_yojson
         (value_for_key encryption_key_configuration_of_yojson "encryptionKeyConfiguration")
         _list path;
     encryption_key_provider =
       option_of_yojson
         (value_for_key encryption_key_provider_of_yojson "encryptionKeyProvider")
         _list path;
   }
    : encryption_summary)

let autonomous_database_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_undeleted =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeUndeleted")
         _list path;
     next_long_term_backup_time_stamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "nextLongTermBackupTimeStamp")
         _list path;
     time_until_reconnect_clone_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeUntilReconnectCloneEnabled")
         _list path;
     time_disaster_recovery_role_changed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeDisasterRecoveryRoleChanged")
         _list path;
     time_reclamation_of_free_autonomous_database =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeReclamationOfFreeAutonomousDatabase")
         _list path;
     time_deletion_of_free_autonomous_database =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeDeletionOfFreeAutonomousDatabase")
         _list path;
     time_of_auto_refresh_start =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfAutoRefreshStart")
         _list path;
     time_of_next_refresh =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfNextRefresh")
         _list path;
     time_of_last_refresh_point =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfLastRefreshPoint")
         _list path;
     time_of_last_refresh =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfLastRefresh")
         _list path;
     time_of_last_failover =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfLastFailover")
         _list path;
     time_of_last_switchover =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfLastSwitchover")
         _list path;
     time_data_guard_role_changed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeDataGuardRoleChanged")
         _list path;
     time_local_data_guard_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeLocalDataGuardEnabled")
         _list path;
     time_maintenance_end =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeMaintenanceEnd")
         _list path;
     time_maintenance_begin =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeMaintenanceBegin")
         _list path;
     time_of_last_backup =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfLastBackup")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     encryption_summary =
       option_of_yojson (value_for_key encryption_summary_of_yojson "encryptionSummary") _list path;
     resource_pool_summary =
       option_of_yojson
         (value_for_key resource_pool_summary_of_yojson "resourcePoolSummary")
         _list path;
     total_backup_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "totalBackupStorageSizeInGBs")
         _list path;
     is_backup_retention_locked =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isBackupRetentionLocked")
         _list path;
     long_term_backup_schedule =
       option_of_yojson
         (value_for_key long_term_backup_schedule_of_yojson "longTermBackupSchedule")
         _list path;
     backup_retention_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "backupRetentionPeriodInDays")
         _list path;
     clone_table_space_list =
       option_of_yojson (value_for_key integer_list_of_yojson "cloneTableSpaceList") _list path;
     is_reconnect_clone_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isReconnectCloneEnabled")
         _list path;
     auto_refresh_point_lag_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "autoRefreshPointLagInSeconds")
         _list path;
     auto_refresh_frequency_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "autoRefreshFrequencyInSeconds")
         _list path;
     refreshable_status =
       option_of_yojson (value_for_key refreshable_status_of_yojson "refreshableStatus") _list path;
     refreshable_mode =
       option_of_yojson (value_for_key refreshable_mode_of_yojson "refreshableMode") _list path;
     is_refreshable_clone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isRefreshableClone")
         _list path;
     remote_disaster_recovery_configuration =
       option_of_yojson
         (value_for_key disaster_recovery_configuration_of_yojson
            "remoteDisasterRecoveryConfiguration")
         _list path;
     local_adg_auto_failover_max_data_loss_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "localAdgAutoFailoverMaxDataLossLimit")
         _list path;
     failed_data_recovery_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "failedDataRecoveryInSeconds")
         _list path;
     peer_db_ids = option_of_yojson (value_for_key string_list_of_yojson "peerDbIds") _list path;
     role = option_of_yojson (value_for_key data_guard_role_of_yojson "role") _list path;
     local_disaster_recovery_type =
       option_of_yojson
         (value_for_key disaster_recovery_type_of_yojson "localDisasterRecoveryType")
         _list path;
     is_remote_data_guard_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isRemoteDataGuardEnabled")
         _list path;
     is_local_data_guard_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isLocalDataGuardEnabled")
         _list path;
     standby_allowlisted_ips_source =
       option_of_yojson
         (value_for_key standby_allowlisted_ips_source_of_yojson "standbyAllowlistedIpsSource")
         _list path;
     standby_allowlisted_ips =
       option_of_yojson (value_for_key string_list_of_yojson "standbyAllowlistedIps") _list path;
     allowlisted_ips =
       option_of_yojson (value_for_key string_list_of_yojson "allowlistedIps") _list path;
     private_endpoint_label =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "privateEndpointLabel")
         _list path;
     private_endpoint_ip =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "privateEndpointIp")
         _list path;
     private_endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "privateEndpoint")
         _list path;
     odb_network_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "odbNetworkArn") _list path;
     odb_network_id =
       option_of_yojson (value_for_key resource_id_of_yojson "odbNetworkId") _list path;
     is_auto_scaling_for_storage_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isAutoScalingForStorageEnabled")
         _list path;
     in_memory_area_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "inMemoryAreaInGBs")
         _list path;
     allocated_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "allocatedStorageSizeInTBs")
         _list path;
     actual_used_data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "actualUsedDataStorageSizeInTBs")
         _list path;
     used_data_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "usedDataStorageSizeInGBs")
         _list path;
     used_data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "usedDataStorageSizeInTBs")
         _list path;
     data_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataStorageSizeInGBs")
         _list path;
     data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "dataStorageSizeInTBs")
         _list path;
     is_auto_scaling_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isAutoScalingEnabled")
         _list path;
     provisionable_cpus =
       option_of_yojson (value_for_key integer_list_of_yojson "provisionableCpus") _list path;
     memory_per_oracle_compute_unit_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "memoryPerOracleComputeUnitInGBs")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     compute_model =
       option_of_yojson (value_for_key compute_model_of_yojson "computeModel") _list path;
     compute_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "computeCount")
         _list path;
     resource_pool_leader_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "resourcePoolLeaderId")
         _list path;
     scheduled_operations =
       option_of_yojson
         (value_for_key scheduled_operation_details_list_of_yojson "scheduledOperations")
         _list path;
     db_tools_details =
       option_of_yojson (value_for_key database_tool_list_of_yojson "dbToolsDetails") _list path;
     connection_urls =
       option_of_yojson
         (value_for_key autonomous_database_connection_urls_of_yojson "connectionUrls")
         _list path;
     maintenance_target_component =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "maintenanceTargetComponent")
         _list path;
     availability_zone_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "availabilityZoneId")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     operations_insights_status =
       option_of_yojson
         (value_for_key operations_insights_status_of_yojson "operationsInsightsStatus")
         _list path;
     database_management_status =
       option_of_yojson
         (value_for_key database_management_status_of_yojson "databaseManagementStatus")
         _list path;
     data_safe_status =
       option_of_yojson (value_for_key data_safe_status_of_yojson "dataSafeStatus") _list path;
     local_standby_db =
       option_of_yojson
         (value_for_key database_standby_summary_of_yojson "localStandbyDb")
         _list path;
     standby_db =
       option_of_yojson (value_for_key database_standby_summary_of_yojson "standbyDb") _list path;
     apex_details =
       option_of_yojson (value_for_key autonomous_database_apex_of_yojson "apexDetails") _list path;
     customer_contacts =
       option_of_yojson (value_for_key customer_contacts_of_yojson "customerContacts") _list path;
     sql_web_developer_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "sqlWebDeveloperUrl")
         _list path;
     service_console_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "serviceConsoleUrl")
         _list path;
     connection_string_details =
       option_of_yojson
         (value_for_key autonomous_database_connection_strings_of_yojson "connectionStringDetails")
         _list path;
     byol_compute_count_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "byolComputeCountLimit")
         _list path;
     available_upgrade_versions =
       option_of_yojson (value_for_key string_list_of_yojson "availableUpgradeVersions") _list path;
     net_services_architecture =
       option_of_yojson
         (value_for_key net_services_architecture_of_yojson "netServicesArchitecture")
         _list path;
     autonomous_maintenance_schedule_type =
       option_of_yojson
         (value_for_key autonomous_maintenance_schedule_type_of_yojson
            "autonomousMaintenanceScheduleType")
         _list path;
     is_mtls_connection_required =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isMtlsConnectionRequired")
         _list path;
     permission_level =
       option_of_yojson (value_for_key permission_level_of_yojson "permissionLevel") _list path;
     open_mode = option_of_yojson (value_for_key open_mode_of_yojson "openMode") _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     database_edition =
       option_of_yojson (value_for_key database_edition_of_yojson "databaseEdition") _list path;
     ncharacter_set =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ncharacterSet")
         _list path;
     character_set =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "characterSet")
         _list path;
     db_workload = option_of_yojson (value_for_key db_workload_of_yojson "dbWorkload") _list path;
     db_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbVersion")
         _list path;
     database_type =
       option_of_yojson (value_for_key database_type_of_yojson "databaseType") _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     source_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sourceId")
         _list path;
     db_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbName")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     oci_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociUrl")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     autonomous_database_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "autonomousDatabaseArn") _list path;
     autonomous_database_id =
       option_of_yojson
         (value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId")
         _list path;
   }
    : autonomous_database_summary)

let autonomous_database_list_of_yojson tree path =
  list_of_yojson autonomous_database_summary_of_yojson tree path

let list_autonomous_databases_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_databases =
       value_for_key autonomous_database_list_of_yojson "autonomousDatabases" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_autonomous_databases_output)

let list_autonomous_databases_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_autonomous_databases_input)

let autonomous_database_peer_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "region")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     autonomous_database_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "autonomousDatabaseArn") _list path;
     autonomous_database_id =
       option_of_yojson (value_for_key resource_id_of_yojson "autonomousDatabaseId") _list path;
   }
    : autonomous_database_peer_summary)

let autonomous_database_peer_list_of_yojson tree path =
  list_of_yojson autonomous_database_peer_summary_of_yojson tree path

let list_autonomous_database_peers_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_peers =
       value_for_key autonomous_database_peer_list_of_yojson "autonomousDatabasePeers" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_autonomous_database_peers_output)

let list_autonomous_database_peers_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_autonomous_database_peers_input)

let list_autonomous_database_clones_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_clones =
       value_for_key autonomous_database_list_of_yojson "autonomousDatabaseClones" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_autonomous_database_clones_output)

let list_autonomous_database_clones_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_autonomous_database_clones_input)

let autonomous_database_backup_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String "CREATING" -> CREATING
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutonomousDatabaseBackupStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutonomousDatabaseBackupStatus")
     : autonomous_database_backup_status)
    : autonomous_database_backup_status)

let autonomous_database_backup_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ROLL_FORWARD_IMAGE_COPY" -> ROLL_FORWARD_IMAGE_COPY
    | `String "CUMULATIVE_INCREMENTAL" -> CUMULATIVE_INCREMENTAL
    | `String "VIRTUAL_FULL" -> VIRTUAL_FULL
    | `String "LONGTERM" -> LONGTERM
    | `String "FULL" -> FULL
    | `String "INCREMENTAL" -> INCREMENTAL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutonomousDatabaseBackupType" value)
    | _ -> raise (deserialize_wrong_type_error path "AutonomousDatabaseBackupType")
     : autonomous_database_backup_type)
    : autonomous_database_backup_type)

let autonomous_database_backup_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson (value_for_key autonomous_database_backup_type_of_yojson "type") _list path;
     time_ended =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeEnded")
         _list path;
     time_started =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeStarted")
         _list path;
     time_available_till =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeAvailableTill")
         _list path;
     size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "sizeInTBs")
         _list path;
     retention_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retentionPeriodInDays")
         _list path;
     is_automatic =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "isAutomatic")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_backup_status_of_yojson "status")
         _list path;
     db_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbVersion")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     autonomous_database_id =
       option_of_yojson (value_for_key resource_id_of_yojson "autonomousDatabaseId") _list path;
     autonomous_database_backup_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "autonomousDatabaseBackupArn")
         _list path;
     autonomous_database_backup_id =
       option_of_yojson
         (value_for_key resource_id_of_yojson "autonomousDatabaseBackupId")
         _list path;
   }
    : autonomous_database_backup_summary)

let autonomous_database_backup_list_of_yojson tree path =
  list_of_yojson autonomous_database_backup_summary_of_yojson tree path

let list_autonomous_database_backups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_backups =
       value_for_key autonomous_database_backup_list_of_yojson "autonomousDatabaseBackups" _list
         path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_autonomous_database_backups_output)

let list_autonomous_database_backups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson (value_for_key autonomous_database_backup_type_of_yojson "type") _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_backup_status_of_yojson "status")
         _list path;
     autonomous_database_id = value_for_key resource_id_of_yojson "autonomousDatabaseId" _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
   }
    : list_autonomous_database_backups_input)

let hostname_of_yojson = string_of_yojson

let get_odb_peering_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     odb_peering_connection =
       option_of_yojson
         (value_for_key odb_peering_connection_of_yojson "odbPeeringConnection")
         _list path;
   }
    : get_odb_peering_connection_output)

let get_odb_peering_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     odb_peering_connection_id =
       value_for_key resource_id_or_arn_of_yojson "odbPeeringConnectionId" _list path;
   }
    : get_odb_peering_connection_input)

let get_odb_network_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ odb_network = option_of_yojson (value_for_key odb_network_of_yojson "odbNetwork") _list path }
    : get_odb_network_output)

let get_odb_network_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ odb_network_id = value_for_key resource_id_or_arn_of_yojson "odbNetworkId" _list path }
    : get_odb_network_input)

let db_server_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_virtual_machine_ids =
       option_of_yojson
         (value_for_key string_list_of_yojson "autonomousVirtualMachineIds")
         _list path;
     autonomous_vm_cluster_ids =
       option_of_yojson (value_for_key string_list_of_yojson "autonomousVmClusterIds") _list path;
     compute_model =
       option_of_yojson (value_for_key compute_model_of_yojson "computeModel") _list path;
     vm_cluster_ids =
       option_of_yojson (value_for_key string_list_of_yojson "vmClusterIds") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     shape =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shape")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     max_memory_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxMemoryInGBs")
         _list path;
     max_db_node_storage_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "maxDbNodeStorageInGBs")
         _list path;
     max_cpu_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxCpuCount")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     exadata_infrastructure_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "exadataInfrastructureId")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     db_server_patching_details =
       option_of_yojson
         (value_for_key db_server_patching_details_of_yojson "dbServerPatchingDetails")
         _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     db_server_id = option_of_yojson (value_for_key resource_id_of_yojson "dbServerId") _list path;
   }
    : db_server)

let get_db_server_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ db_server = option_of_yojson (value_for_key db_server_of_yojson "dbServer") _list path }
    : get_db_server_output)

let get_db_server_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_server_id = value_for_key resource_id_of_yojson "dbServerId" _list path;
     cloud_exadata_infrastructure_id =
       value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId" _list path;
   }
    : get_db_server_input)

let db_node_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     floating_ip_address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "floatingIpAddress")
         _list path;
     private_ip_address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "privateIpAddress")
         _list path;
     vnic_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vnicId")
         _list path;
     vnic2_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vnic2Id")
         _list path;
     total_cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "totalCpuCoreCount")
         _list path;
     time_maintenance_window_start =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "timeMaintenanceWindowStart")
         _list path;
     time_maintenance_window_end =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "timeMaintenanceWindowEnd")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     software_storage_size_in_g_b =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "softwareStorageSizeInGB")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     maintenance_type =
       option_of_yojson
         (value_for_key db_node_maintenance_type_of_yojson "maintenanceType")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     hostname =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hostname")
         _list path;
     host_ip_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hostIpId")
         _list path;
     fault_domain =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "faultDomain")
         _list path;
     db_system_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbSystemId")
         _list path;
     db_server_id = option_of_yojson (value_for_key resource_id_of_yojson "dbServerId") _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     backup_vnic_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "backupVnicId")
         _list path;
     backup_vnic2_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "backupVnic2Id")
         _list path;
     backup_ip_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "backupIpId")
         _list path;
     additional_details =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "additionalDetails")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key db_node_resource_status_of_yojson "status") _list path;
     db_node_arn = option_of_yojson (value_for_key resource_arn_of_yojson "dbNodeArn") _list path;
     db_node_id = option_of_yojson (value_for_key resource_id_of_yojson "dbNodeId") _list path;
   }
    : db_node)

let get_db_node_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ db_node = option_of_yojson (value_for_key db_node_of_yojson "dbNode") _list path }
    : get_db_node_output)

let get_db_node_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_node_id = value_for_key resource_id_of_yojson "dbNodeId" _list path;
     cloud_vm_cluster_id = value_for_key resource_id_of_yojson "cloudVmClusterId" _list path;
   }
    : get_db_node_input)

let cloud_vm_cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iam_roles = option_of_yojson (value_for_key iam_role_list_of_yojson "iamRoles") _list path;
     compute_model =
       option_of_yojson (value_for_key compute_model_of_yojson "computeModel") _list path;
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     odb_network_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "odbNetworkArn") _list path;
     odb_network_id =
       option_of_yojson (value_for_key resource_id_or_arn_of_yojson "odbNetworkId") _list path;
     vip_ids = option_of_yojson (value_for_key string_list_of_yojson "vipIds") _list path;
     time_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "timeZone")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     system_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "systemVersion")
         _list path;
     storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "storageSizeInGBs")
         _list path;
     ssh_public_keys =
       option_of_yojson (value_for_key sensitive_string_list_of_yojson "sshPublicKeys") _list path;
     shape =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shape")
         _list path;
     scan_ip_ids = option_of_yojson (value_for_key string_list_of_yojson "scanIpIds") _list path;
     scan_dns_record_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "scanDnsRecordId")
         _list path;
     scan_dns_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "scanDnsName")
         _list path;
     domain =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "domain")
         _list path;
     oci_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociUrl")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     node_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "nodeCount")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     listener_port =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "listenerPort")
         _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     last_update_history_entry_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "lastUpdateHistoryEntryId")
         _list path;
     is_sparse_diskgroup_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isSparseDiskgroupEnabled")
         _list path;
     is_local_backup_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isLocalBackupEnabled")
         _list path;
     iorm_config_cache =
       option_of_yojson (value_for_key exadata_iorm_config_of_yojson "iormConfigCache") _list path;
     hostname =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hostname")
         _list path;
     gi_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "giVersion")
         _list path;
     disk_redundancy =
       option_of_yojson (value_for_key disk_redundancy_of_yojson "diskRedundancy") _list path;
     db_servers = option_of_yojson (value_for_key string_list_of_yojson "dbServers") _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "dataStorageSizeInTBs")
         _list path;
     data_collection_options =
       option_of_yojson
         (value_for_key data_collection_options_of_yojson "dataCollectionOptions")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     cluster_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clusterName")
         _list path;
     cloud_exadata_infrastructure_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "cloudExadataInfrastructureArn")
         _list path;
     cloud_exadata_infrastructure_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "cloudExadataInfrastructureId")
         _list path;
     cloud_vm_cluster_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "cloudVmClusterArn")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     cloud_vm_cluster_id = value_for_key resource_id_of_yojson "cloudVmClusterId" _list path;
   }
    : cloud_vm_cluster)

let get_cloud_vm_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_vm_cluster =
       option_of_yojson (value_for_key cloud_vm_cluster_of_yojson "cloudVmCluster") _list path;
   }
    : get_cloud_vm_cluster_output)

let get_cloud_vm_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cloud_vm_cluster_id = value_for_key resource_id_of_yojson "cloudVmClusterId" _list path }
    : get_cloud_vm_cluster_input)

let cloud_autonomous_vm_cluster_resource_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unallocated_adb_storage_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "unallocatedAdbStorageInTBs")
         _list path;
     cloud_autonomous_vm_cluster_id =
       option_of_yojson
         (value_for_key resource_id_of_yojson "cloudAutonomousVmClusterId")
         _list path;
   }
    : cloud_autonomous_vm_cluster_resource_details)

let cloud_autonomous_vm_cluster_resource_details_list_of_yojson tree path =
  list_of_yojson cloud_autonomous_vm_cluster_resource_details_of_yojson tree path

let cloud_exadata_infrastructure_unallocated_resources_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ocpus =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "ocpus")
         _list path;
     memory_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memoryInGBs")
         _list path;
     local_storage_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "localStorageInGBs")
         _list path;
     cloud_exadata_infrastructure_id =
       option_of_yojson
         (value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId")
         _list path;
     exadata_storage_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "exadataStorageInTBs")
         _list path;
     cloud_exadata_infrastructure_display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "cloudExadataInfrastructureDisplayName")
         _list path;
     cloud_autonomous_vm_clusters =
       option_of_yojson
         (value_for_key cloud_autonomous_vm_cluster_resource_details_list_of_yojson
            "cloudAutonomousVmClusters")
         _list path;
   }
    : cloud_exadata_infrastructure_unallocated_resources)

let get_cloud_exadata_infrastructure_unallocated_resources_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_exadata_infrastructure_unallocated_resources =
       option_of_yojson
         (value_for_key cloud_exadata_infrastructure_unallocated_resources_of_yojson
            "cloudExadataInfrastructureUnallocatedResources")
         _list path;
   }
    : get_cloud_exadata_infrastructure_unallocated_resources_output)

let get_cloud_exadata_infrastructure_unallocated_resources_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_servers = option_of_yojson (value_for_key string_list_of_yojson "dbServers") _list path;
     cloud_exadata_infrastructure_id =
       value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId" _list path;
   }
    : get_cloud_exadata_infrastructure_unallocated_resources_input)

let cloud_exadata_infrastructure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute_model =
       option_of_yojson (value_for_key compute_model_of_yojson "computeModel") _list path;
     storage_server_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "storageServerType")
         _list path;
     database_server_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "databaseServerType")
         _list path;
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     total_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "totalStorageSizeInGBs")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     storage_server_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "storageServerVersion")
         _list path;
     storage_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "storageCount")
         _list path;
     shape =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shape")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     oci_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociUrl")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     next_maintenance_run_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "nextMaintenanceRunId")
         _list path;
     monthly_storage_server_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "monthlyStorageServerVersion")
         _list path;
     monthly_db_server_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "monthlyDbServerVersion")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     max_memory_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxMemoryInGBs")
         _list path;
     max_db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "maxDbNodeStorageSizeInGBs")
         _list path;
     max_data_storage_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "maxDataStorageInTBs")
         _list path;
     max_cpu_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxCpuCount")
         _list path;
     maintenance_window =
       option_of_yojson (value_for_key maintenance_window_of_yojson "maintenanceWindow") _list path;
     last_maintenance_run_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "lastMaintenanceRunId")
         _list path;
     db_server_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbServerVersion")
         _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "dataStorageSizeInTBs")
         _list path;
     customer_contacts_to_send_to_oc_i =
       option_of_yojson
         (value_for_key customer_contacts_of_yojson "customerContactsToSendToOCI")
         _list path;
     cpu_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCount")
         _list path;
     compute_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "computeCount")
         _list path;
     availability_zone_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "availabilityZoneId")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     available_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableStorageSizeInGBs")
         _list path;
     additional_storage_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "additionalStorageCount")
         _list path;
     activated_storage_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "activatedStorageCount")
         _list path;
     cloud_exadata_infrastructure_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "cloudExadataInfrastructureArn")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     cloud_exadata_infrastructure_id =
       value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId" _list path;
   }
    : cloud_exadata_infrastructure)

let get_cloud_exadata_infrastructure_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_exadata_infrastructure =
       option_of_yojson
         (value_for_key cloud_exadata_infrastructure_of_yojson "cloudExadataInfrastructure")
         _list path;
   }
    : get_cloud_exadata_infrastructure_output)

let get_cloud_exadata_infrastructure_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_exadata_infrastructure_id =
       value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId" _list path;
   }
    : get_cloud_exadata_infrastructure_input)

let cloud_autonomous_vm_cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iam_roles = option_of_yojson (value_for_key iam_role_list_of_yojson "iamRoles") _list path;
     total_container_databases =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "totalContainerDatabases")
         _list path;
     time_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "timeZone")
         _list path;
     time_ords_certificate_expires =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOrdsCertificateExpires")
         _list path;
     time_database_ssl_certificate_expires =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeDatabaseSslCertificateExpires")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     shape =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "shape")
         _list path;
     scan_listener_port_tls =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scanListenerPortTls")
         _list path;
     scan_listener_port_non_tls =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scanListenerPortNonTls")
         _list path;
     reserved_cpus =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "reservedCpus")
         _list path;
     reclaimable_cpus =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "reclaimableCpus")
         _list path;
     provisioned_cpus =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "provisionedCpus")
         _list path;
     provisioned_autonomous_container_databases =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "provisionedAutonomousContainerDatabases")
         _list path;
     provisionable_autonomous_container_databases =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "provisionableAutonomousContainerDatabases")
         _list path;
     non_provisionable_autonomous_container_databases =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "nonProvisionableAutonomousContainerDatabases")
         _list path;
     node_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "nodeCount")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     memory_per_oracle_compute_unit_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "memoryPerOracleComputeUnitInGBs")
         _list path;
     max_acds_lowest_scaled_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "maxAcdsLowestScaledValue")
         _list path;
     maintenance_window =
       option_of_yojson (value_for_key maintenance_window_of_yojson "maintenanceWindow") _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     is_mtls_enabled_vm_cluster =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isMtlsEnabledVmCluster")
         _list path;
     oci_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociUrl")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     hostname =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hostname")
         _list path;
     exadata_storage_in_t_bs_lowest_scaled_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "exadataStorageInTBsLowestScaledValue")
         _list path;
     domain =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "domain")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     db_servers = option_of_yojson (value_for_key string_list_of_yojson "dbServers") _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "dataStorageSizeInTBs")
         _list path;
     data_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "dataStorageSizeInGBs")
         _list path;
     cpu_percentage =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "cpuPercentage")
         _list path;
     cpu_core_count_per_node =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "cpuCoreCountPerNode")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     compute_model =
       option_of_yojson (value_for_key compute_model_of_yojson "computeModel") _list path;
     available_cpus =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "availableCpus")
         _list path;
     available_container_databases =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "availableContainerDatabases")
         _list path;
     available_autonomous_data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "availableAutonomousDataStorageSizeInTBs")
         _list path;
     autonomous_data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "autonomousDataStorageSizeInTBs")
         _list path;
     autonomous_data_storage_percentage =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
            "autonomousDataStoragePercentage")
         _list path;
     cloud_exadata_infrastructure_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "cloudExadataInfrastructureArn")
         _list path;
     cloud_exadata_infrastructure_id =
       option_of_yojson
         (value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson (value_for_key resource_display_name_of_yojson "displayName") _list path;
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     odb_network_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "odbNetworkArn") _list path;
     odb_network_id =
       option_of_yojson (value_for_key resource_id_or_arn_of_yojson "odbNetworkId") _list path;
     cloud_autonomous_vm_cluster_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "cloudAutonomousVmClusterArn")
         _list path;
     cloud_autonomous_vm_cluster_id =
       value_for_key resource_id_of_yojson "cloudAutonomousVmClusterId" _list path;
   }
    : cloud_autonomous_vm_cluster)

let get_cloud_autonomous_vm_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_autonomous_vm_cluster =
       option_of_yojson
         (value_for_key cloud_autonomous_vm_cluster_of_yojson "cloudAutonomousVmCluster")
         _list path;
   }
    : get_cloud_autonomous_vm_cluster_output)

let get_cloud_autonomous_vm_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_autonomous_vm_cluster_id =
       value_for_key resource_id_of_yojson "cloudAutonomousVmClusterId" _list path;
   }
    : get_cloud_autonomous_vm_cluster_input)

let autonomous_database_wallet_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATING" -> UPDATING
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutonomousDatabaseWalletStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutonomousDatabaseWalletStatus")
     : autonomous_database_wallet_status)
    : autonomous_database_wallet_status)

let autonomous_database_wallet_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_rotated =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeRotated")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_wallet_status_of_yojson "status")
         _list path;
   }
    : autonomous_database_wallet_details)

let get_autonomous_database_wallet_details_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_wallet_details =
       value_for_key autonomous_database_wallet_details_of_yojson "autonomousDatabaseWalletDetails"
         _list path;
   }
    : get_autonomous_database_wallet_details_output)

let get_autonomous_database_wallet_details_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : get_autonomous_database_wallet_details_input)

let autonomous_database_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_undeleted =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeUndeleted")
         _list path;
     next_long_term_backup_time_stamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "nextLongTermBackupTimeStamp")
         _list path;
     time_until_reconnect_clone_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeUntilReconnectCloneEnabled")
         _list path;
     time_disaster_recovery_role_changed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeDisasterRecoveryRoleChanged")
         _list path;
     time_reclamation_of_free_autonomous_database =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeReclamationOfFreeAutonomousDatabase")
         _list path;
     time_deletion_of_free_autonomous_database =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeDeletionOfFreeAutonomousDatabase")
         _list path;
     time_of_auto_refresh_start =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfAutoRefreshStart")
         _list path;
     time_of_next_refresh =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfNextRefresh")
         _list path;
     time_of_last_refresh_point =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfLastRefreshPoint")
         _list path;
     time_of_last_refresh =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfLastRefresh")
         _list path;
     time_of_last_failover =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfLastFailover")
         _list path;
     time_of_last_switchover =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfLastSwitchover")
         _list path;
     time_data_guard_role_changed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeDataGuardRoleChanged")
         _list path;
     time_local_data_guard_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeLocalDataGuardEnabled")
         _list path;
     time_maintenance_end =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeMaintenanceEnd")
         _list path;
     time_maintenance_begin =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeMaintenanceBegin")
         _list path;
     time_of_last_backup =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeOfLastBackup")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "createdAt")
         _list path;
     encryption_summary =
       option_of_yojson (value_for_key encryption_summary_of_yojson "encryptionSummary") _list path;
     resource_pool_summary =
       option_of_yojson
         (value_for_key resource_pool_summary_of_yojson "resourcePoolSummary")
         _list path;
     total_backup_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "totalBackupStorageSizeInGBs")
         _list path;
     is_backup_retention_locked =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isBackupRetentionLocked")
         _list path;
     long_term_backup_schedule =
       option_of_yojson
         (value_for_key long_term_backup_schedule_of_yojson "longTermBackupSchedule")
         _list path;
     backup_retention_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "backupRetentionPeriodInDays")
         _list path;
     clone_table_space_list =
       option_of_yojson (value_for_key integer_list_of_yojson "cloneTableSpaceList") _list path;
     is_reconnect_clone_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isReconnectCloneEnabled")
         _list path;
     auto_refresh_point_lag_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "autoRefreshPointLagInSeconds")
         _list path;
     auto_refresh_frequency_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "autoRefreshFrequencyInSeconds")
         _list path;
     refreshable_status =
       option_of_yojson (value_for_key refreshable_status_of_yojson "refreshableStatus") _list path;
     refreshable_mode =
       option_of_yojson (value_for_key refreshable_mode_of_yojson "refreshableMode") _list path;
     is_refreshable_clone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isRefreshableClone")
         _list path;
     remote_disaster_recovery_configuration =
       option_of_yojson
         (value_for_key disaster_recovery_configuration_of_yojson
            "remoteDisasterRecoveryConfiguration")
         _list path;
     local_adg_auto_failover_max_data_loss_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "localAdgAutoFailoverMaxDataLossLimit")
         _list path;
     failed_data_recovery_in_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "failedDataRecoveryInSeconds")
         _list path;
     peer_db_ids = option_of_yojson (value_for_key string_list_of_yojson "peerDbIds") _list path;
     role = option_of_yojson (value_for_key data_guard_role_of_yojson "role") _list path;
     local_disaster_recovery_type =
       option_of_yojson
         (value_for_key disaster_recovery_type_of_yojson "localDisasterRecoveryType")
         _list path;
     is_remote_data_guard_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isRemoteDataGuardEnabled")
         _list path;
     is_local_data_guard_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isLocalDataGuardEnabled")
         _list path;
     standby_allowlisted_ips_source =
       option_of_yojson
         (value_for_key standby_allowlisted_ips_source_of_yojson "standbyAllowlistedIpsSource")
         _list path;
     standby_allowlisted_ips =
       option_of_yojson (value_for_key string_list_of_yojson "standbyAllowlistedIps") _list path;
     allowlisted_ips =
       option_of_yojson (value_for_key string_list_of_yojson "allowlistedIps") _list path;
     private_endpoint_label =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "privateEndpointLabel")
         _list path;
     private_endpoint_ip =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "privateEndpointIp")
         _list path;
     private_endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "privateEndpoint")
         _list path;
     odb_network_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "odbNetworkArn") _list path;
     odb_network_id =
       option_of_yojson (value_for_key resource_id_of_yojson "odbNetworkId") _list path;
     is_auto_scaling_for_storage_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isAutoScalingForStorageEnabled")
         _list path;
     in_memory_area_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "inMemoryAreaInGBs")
         _list path;
     allocated_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "allocatedStorageSizeInTBs")
         _list path;
     actual_used_data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "actualUsedDataStorageSizeInTBs")
         _list path;
     used_data_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "usedDataStorageSizeInGBs")
         _list path;
     used_data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "usedDataStorageSizeInTBs")
         _list path;
     data_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataStorageSizeInGBs")
         _list path;
     data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "dataStorageSizeInTBs")
         _list path;
     is_auto_scaling_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isAutoScalingEnabled")
         _list path;
     provisionable_cpus =
       option_of_yojson (value_for_key integer_list_of_yojson "provisionableCpus") _list path;
     memory_per_oracle_compute_unit_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "memoryPerOracleComputeUnitInGBs")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     compute_model =
       option_of_yojson (value_for_key compute_model_of_yojson "computeModel") _list path;
     compute_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "computeCount")
         _list path;
     resource_pool_leader_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "resourcePoolLeaderId")
         _list path;
     scheduled_operations =
       option_of_yojson
         (value_for_key scheduled_operation_details_list_of_yojson "scheduledOperations")
         _list path;
     db_tools_details =
       option_of_yojson (value_for_key database_tool_list_of_yojson "dbToolsDetails") _list path;
     connection_urls =
       option_of_yojson
         (value_for_key autonomous_database_connection_urls_of_yojson "connectionUrls")
         _list path;
     maintenance_target_component =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "maintenanceTargetComponent")
         _list path;
     availability_zone_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "availabilityZoneId")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     operations_insights_status =
       option_of_yojson
         (value_for_key operations_insights_status_of_yojson "operationsInsightsStatus")
         _list path;
     database_management_status =
       option_of_yojson
         (value_for_key database_management_status_of_yojson "databaseManagementStatus")
         _list path;
     data_safe_status =
       option_of_yojson (value_for_key data_safe_status_of_yojson "dataSafeStatus") _list path;
     local_standby_db =
       option_of_yojson
         (value_for_key database_standby_summary_of_yojson "localStandbyDb")
         _list path;
     standby_db =
       option_of_yojson (value_for_key database_standby_summary_of_yojson "standbyDb") _list path;
     apex_details =
       option_of_yojson (value_for_key autonomous_database_apex_of_yojson "apexDetails") _list path;
     customer_contacts =
       option_of_yojson (value_for_key customer_contacts_of_yojson "customerContacts") _list path;
     sql_web_developer_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "sqlWebDeveloperUrl")
         _list path;
     service_console_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "serviceConsoleUrl")
         _list path;
     connection_string_details =
       option_of_yojson
         (value_for_key autonomous_database_connection_strings_of_yojson "connectionStringDetails")
         _list path;
     byol_compute_count_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "byolComputeCountLimit")
         _list path;
     available_upgrade_versions =
       option_of_yojson (value_for_key string_list_of_yojson "availableUpgradeVersions") _list path;
     net_services_architecture =
       option_of_yojson
         (value_for_key net_services_architecture_of_yojson "netServicesArchitecture")
         _list path;
     autonomous_maintenance_schedule_type =
       option_of_yojson
         (value_for_key autonomous_maintenance_schedule_type_of_yojson
            "autonomousMaintenanceScheduleType")
         _list path;
     is_mtls_connection_required =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isMtlsConnectionRequired")
         _list path;
     permission_level =
       option_of_yojson (value_for_key permission_level_of_yojson "permissionLevel") _list path;
     open_mode = option_of_yojson (value_for_key open_mode_of_yojson "openMode") _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     database_edition =
       option_of_yojson (value_for_key database_edition_of_yojson "databaseEdition") _list path;
     ncharacter_set =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ncharacterSet")
         _list path;
     character_set =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "characterSet")
         _list path;
     db_workload = option_of_yojson (value_for_key db_workload_of_yojson "dbWorkload") _list path;
     db_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbVersion")
         _list path;
     database_type =
       option_of_yojson (value_for_key database_type_of_yojson "databaseType") _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     source_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "sourceId")
         _list path;
     db_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbName")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     oci_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ociUrl")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     percent_progress =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "percentProgress")
         _list path;
     oci_resource_anchor_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ociResourceAnchorName")
         _list path;
     autonomous_database_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "autonomousDatabaseArn") _list path;
     autonomous_database_id =
       option_of_yojson
         (value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId")
         _list path;
   }
    : autonomous_database)

let get_autonomous_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database =
       value_for_key autonomous_database_of_yojson "autonomousDatabase" _list path;
   }
    : get_autonomous_database_output)

let get_autonomous_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : get_autonomous_database_input)

let autonomous_database_backup_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson (value_for_key autonomous_database_backup_type_of_yojson "type") _list path;
     time_ended =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeEnded")
         _list path;
     time_started =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeStarted")
         _list path;
     time_available_till =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "timeAvailableTill")
         _list path;
     size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "sizeInTBs")
         _list path;
     retention_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retentionPeriodInDays")
         _list path;
     is_automatic =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "isAutomatic")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_backup_status_of_yojson "status")
         _list path;
     db_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbVersion")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     ocid =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ocid")
         _list path;
     autonomous_database_id =
       option_of_yojson (value_for_key resource_id_of_yojson "autonomousDatabaseId") _list path;
     autonomous_database_backup_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "autonomousDatabaseBackupArn")
         _list path;
     autonomous_database_backup_id =
       option_of_yojson
         (value_for_key resource_id_of_yojson "autonomousDatabaseBackupId")
         _list path;
   }
    : autonomous_database_backup)

let get_autonomous_database_backup_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_backup =
       option_of_yojson
         (value_for_key autonomous_database_backup_of_yojson "autonomousDatabaseBackup")
         _list path;
   }
    : get_autonomous_database_backup_output)

let get_autonomous_database_backup_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_backup_id =
       value_for_key resource_id_of_yojson "autonomousDatabaseBackupId" _list path;
   }
    : get_autonomous_database_backup_input)

let general_input_string_of_yojson = string_of_yojson

let failover_autonomous_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     autonomous_database_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "autonomousDatabaseId" _list path;
   }
    : failover_autonomous_database_output)

let failover_autonomous_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     peer_db_arn = option_of_yojson (value_for_key resource_arn_of_yojson "peerDbArn") _list path;
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : failover_autonomous_database_input)

let delete_odb_peering_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_odb_peering_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     odb_peering_connection_id =
       value_for_key resource_id_or_arn_of_yojson "odbPeeringConnectionId" _list path;
   }
    : delete_odb_peering_connection_input)

let delete_odb_network_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_odb_network_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_associated_resources =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
         "deleteAssociatedResources" _list path;
     odb_network_id = value_for_key resource_id_or_arn_of_yojson "odbNetworkId" _list path;
   }
    : delete_odb_network_input)

let delete_cloud_vm_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_cloud_vm_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cloud_vm_cluster_id = value_for_key resource_id_of_yojson "cloudVmClusterId" _list path }
    : delete_cloud_vm_cluster_input)

let delete_cloud_exadata_infrastructure_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_cloud_exadata_infrastructure_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_exadata_infrastructure_id =
       value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId" _list path;
   }
    : delete_cloud_exadata_infrastructure_input)

let delete_cloud_autonomous_vm_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_cloud_autonomous_vm_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_autonomous_vm_cluster_id =
       value_for_key resource_id_of_yojson "cloudAutonomousVmClusterId" _list path;
   }
    : delete_cloud_autonomous_vm_cluster_input)

let delete_autonomous_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_autonomous_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : delete_autonomous_database_input)

let delete_autonomous_database_backup_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_autonomous_database_backup_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_backup_id =
       value_for_key resource_id_of_yojson "autonomousDatabaseBackupId" _list path;
   }
    : delete_autonomous_database_backup_input)

let create_odb_peering_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     odb_peering_connection_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "odbPeeringConnectionId" _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
   }
    : create_odb_peering_connection_output)

let create_odb_peering_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
     client_token =
       option_of_yojson (value_for_key general_input_string_of_yojson "clientToken") _list path;
     peer_network_route_table_ids =
       option_of_yojson
         (value_for_key peer_network_route_table_id_list_of_yojson "peerNetworkRouteTableIds")
         _list path;
     peer_network_cidrs_to_be_added =
       option_of_yojson
         (value_for_key peered_cidr_list_of_yojson "peerNetworkCidrsToBeAdded")
         _list path;
     display_name =
       option_of_yojson (value_for_key resource_display_name_of_yojson "displayName") _list path;
     peer_network_id = value_for_key resource_id_or_arn_of_yojson "peerNetworkId" _list path;
     odb_network_id = value_for_key resource_id_or_arn_of_yojson "odbNetworkId" _list path;
   }
    : create_odb_peering_connection_input)

let create_odb_network_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     odb_network_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "odbNetworkId" _list
         path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
   }
    : create_odb_network_output)

let create_odb_network_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
     cross_region_s3_restore_sources_to_enable =
       option_of_yojson
         (value_for_key string_list_of_yojson "crossRegionS3RestoreSourcesToEnable")
         _list path;
     kms_policy_document =
       option_of_yojson (value_for_key policy_document_of_yojson "kmsPolicyDocument") _list path;
     sts_policy_document =
       option_of_yojson (value_for_key policy_document_of_yojson "stsPolicyDocument") _list path;
     s3_policy_document =
       option_of_yojson (value_for_key policy_document_of_yojson "s3PolicyDocument") _list path;
     kms_access = option_of_yojson (value_for_key access_of_yojson "kmsAccess") _list path;
     sts_access = option_of_yojson (value_for_key access_of_yojson "stsAccess") _list path;
     zero_etl_access = option_of_yojson (value_for_key access_of_yojson "zeroEtlAccess") _list path;
     s3_access = option_of_yojson (value_for_key access_of_yojson "s3Access") _list path;
     client_token =
       option_of_yojson (value_for_key general_input_string_of_yojson "clientToken") _list path;
     default_dns_prefix =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "defaultDnsPrefix")
         _list path;
     custom_domain_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "customDomainName")
         _list path;
     backup_subnet_cidr =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "backupSubnetCidr")
         _list path;
     client_subnet_cidr =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "clientSubnetCidr"
         _list path;
     availability_zone_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "availabilityZoneId")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     display_name = value_for_key resource_display_name_of_yojson "displayName" _list path;
   }
    : create_odb_network_input)

let create_cloud_vm_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_vm_cluster_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "cloudVmClusterId"
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
   }
    : create_cloud_vm_cluster_output)

let cluster_name_of_yojson = string_of_yojson

let create_cloud_vm_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scan_listener_port_tcp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scanListenerPortTcp")
         _list path;
     client_token =
       option_of_yojson (value_for_key general_input_string_of_yojson "clientToken") _list path;
     time_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "timeZone")
         _list path;
     system_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "systemVersion")
         _list path;
     memory_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInGBs")
         _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     is_sparse_diskgroup_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isSparseDiskgroupEnabled")
         _list path;
     is_local_backup_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isLocalBackupEnabled")
         _list path;
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
     db_servers = option_of_yojson (value_for_key string_list_of_yojson "dbServers") _list path;
     db_node_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dbNodeStorageSizeInGBs")
         _list path;
     data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "dataStorageSizeInTBs")
         _list path;
     data_collection_options =
       option_of_yojson
         (value_for_key data_collection_options_of_yojson "dataCollectionOptions")
         _list path;
     cluster_name = option_of_yojson (value_for_key cluster_name_of_yojson "clusterName") _list path;
     odb_network_id = value_for_key resource_id_or_arn_of_yojson "odbNetworkId" _list path;
     ssh_public_keys = value_for_key string_list_of_yojson "sshPublicKeys" _list path;
     hostname = value_for_key hostname_of_yojson "hostname" _list path;
     gi_version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "giVersion" _list
         path;
     display_name = value_for_key resource_display_name_of_yojson "displayName" _list path;
     cpu_core_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount" _list
         path;
     cloud_exadata_infrastructure_id =
       value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId" _list path;
   }
    : create_cloud_vm_cluster_input)

let create_cloud_exadata_infrastructure_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_exadata_infrastructure_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "cloudExadataInfrastructureId" _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
   }
    : create_cloud_exadata_infrastructure_output)

let create_cloud_exadata_infrastructure_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_server_type =
       option_of_yojson
         (value_for_key general_input_string_of_yojson "storageServerType")
         _list path;
     database_server_type =
       option_of_yojson
         (value_for_key general_input_string_of_yojson "databaseServerType")
         _list path;
     client_token =
       option_of_yojson (value_for_key general_input_string_of_yojson "clientToken") _list path;
     storage_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "storageCount" _list
         path;
     maintenance_window =
       option_of_yojson (value_for_key maintenance_window_of_yojson "maintenanceWindow") _list path;
     customer_contacts_to_send_to_oc_i =
       option_of_yojson
         (value_for_key customer_contacts_of_yojson "customerContactsToSendToOCI")
         _list path;
     compute_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "computeCount" _list
         path;
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
     availability_zone_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "availabilityZoneId")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     shape = value_for_key general_input_string_of_yojson "shape" _list path;
     display_name = value_for_key resource_display_name_of_yojson "displayName" _list path;
   }
    : create_cloud_exadata_infrastructure_input)

let create_cloud_autonomous_vm_cluster_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_autonomous_vm_cluster_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "cloudAutonomousVmClusterId" _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
   }
    : create_cloud_autonomous_vm_cluster_output)

let create_cloud_autonomous_vm_cluster_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_container_databases =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "totalContainerDatabases" _list path;
     time_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "timeZone")
         _list path;
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
     scan_listener_port_tls =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scanListenerPortTls")
         _list path;
     scan_listener_port_non_tls =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "scanListenerPortNonTls")
         _list path;
     memory_per_oracle_compute_unit_in_g_bs =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "memoryPerOracleComputeUnitInGBs" _list path;
     maintenance_window =
       option_of_yojson (value_for_key maintenance_window_of_yojson "maintenanceWindow") _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     is_mtls_enabled_vm_cluster =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isMtlsEnabledVmCluster")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     db_servers = option_of_yojson (value_for_key string_list_of_yojson "dbServers") _list path;
     cpu_core_count_per_node =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCountPerNode"
         _list path;
     autonomous_data_storage_size_in_t_bs =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
         "autonomousDataStorageSizeInTBs" _list path;
     client_token =
       option_of_yojson (value_for_key general_input_string_of_yojson "clientToken") _list path;
     display_name = value_for_key resource_display_name_of_yojson "displayName" _list path;
     odb_network_id = value_for_key resource_id_or_arn_of_yojson "odbNetworkId" _list path;
     cloud_exadata_infrastructure_id =
       value_for_key resource_id_or_arn_of_yojson "cloudExadataInfrastructureId" _list path;
   }
    : create_cloud_autonomous_vm_cluster_input)

let autonomous_database_wallet_file_of_yojson = blob_of_yojson

let create_autonomous_database_wallet_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_wallet_file =
       value_for_key autonomous_database_wallet_file_of_yojson "autonomousDatabaseWalletFile" _list
         path;
   }
    : create_autonomous_database_wallet_output)

let create_autonomous_database_wallet_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key general_input_string_of_yojson "clientToken") _list path;
     password = value_for_key sensitive_string_of_yojson "password" _list path;
     wallet_type = option_of_yojson (value_for_key wallet_type_of_yojson "walletType") _list path;
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : create_autonomous_database_wallet_input)

let create_autonomous_database_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key autonomous_database_resource_status_of_yojson "status")
         _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
     autonomous_database_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "autonomousDatabaseId" _list path;
   }
    : create_autonomous_database_output)

let create_autonomous_database_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
     client_token =
       option_of_yojson (value_for_key general_input_string_of_yojson "clientToken") _list path;
     encryption_key_configuration =
       option_of_yojson
         (value_for_key encryption_key_configuration_input_of_yojson "encryptionKeyConfiguration")
         _list path;
     encryption_key_provider =
       option_of_yojson
         (value_for_key encryption_key_provider_input_of_yojson "encryptionKeyProvider")
         _list path;
     source_configuration =
       option_of_yojson
         (value_for_key source_configuration_of_yojson "sourceConfiguration")
         _list path;
     source = option_of_yojson (value_for_key source_type_of_yojson "source") _list path;
     db_tools_details =
       option_of_yojson (value_for_key database_tool_list_of_yojson "dbToolsDetails") _list path;
     is_mtls_connection_required =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isMtlsConnectionRequired")
         _list path;
     is_local_data_guard_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isLocalDataGuardEnabled")
         _list path;
     is_backup_retention_locked =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isBackupRetentionLocked")
         _list path;
     transportable_tablespace =
       option_of_yojson
         (value_for_key transportable_tablespace_of_yojson "transportableTablespace")
         _list path;
     allowlisted_ips =
       option_of_yojson (value_for_key string_list_of_yojson "allowlistedIps") _list path;
     standby_allowlisted_ips =
       option_of_yojson (value_for_key string_list_of_yojson "standbyAllowlistedIps") _list path;
     scheduled_operations =
       option_of_yojson
         (value_for_key scheduled_operation_details_list_of_yojson "scheduledOperations")
         _list path;
     resource_pool_summary =
       option_of_yojson
         (value_for_key resource_pool_summary_of_yojson "resourcePoolSummary")
         _list path;
     resource_pool_leader_id =
       option_of_yojson
         (value_for_key resource_id_or_arn_of_yojson "resourcePoolLeaderId")
         _list path;
     private_endpoint_label =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "privateEndpointLabel")
         _list path;
     private_endpoint_ip =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "privateEndpointIp")
         _list path;
     customer_contacts_to_send_to_oc_i =
       option_of_yojson
         (value_for_key customer_contacts_of_yojson "customerContactsToSendToOCI")
         _list path;
     cpu_core_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "cpuCoreCount")
         _list path;
     byol_compute_count_limit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "byolComputeCountLimit")
         _list path;
     backup_retention_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "backupRetentionPeriodInDays")
         _list path;
     autonomous_maintenance_schedule_type =
       option_of_yojson
         (value_for_key autonomous_maintenance_schedule_type_of_yojson
            "autonomousMaintenanceScheduleType")
         _list path;
     standby_allowlisted_ips_source =
       option_of_yojson
         (value_for_key standby_allowlisted_ips_source_of_yojson "standbyAllowlistedIpsSource")
         _list path;
     database_edition =
       option_of_yojson (value_for_key database_edition_of_yojson "databaseEdition") _list path;
     db_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbVersion")
         _list path;
     ncharacter_set =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ncharacterSet")
         _list path;
     character_set =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "characterSet")
         _list path;
     license_model =
       option_of_yojson (value_for_key license_model_of_yojson "licenseModel") _list path;
     is_auto_scaling_for_storage_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isAutoScalingForStorageEnabled")
         _list path;
     is_auto_scaling_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "isAutoScalingEnabled")
         _list path;
     db_workload = option_of_yojson (value_for_key db_workload_of_yojson "dbWorkload") _list path;
     data_storage_size_in_g_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataStorageSizeInGBs")
         _list path;
     data_storage_size_in_t_bs =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "dataStorageSizeInTBs")
         _list path;
     compute_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "computeCount")
         _list path;
     admin_password =
       option_of_yojson (value_for_key sensitive_string_of_yojson "adminPassword") _list path;
     db_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbName")
         _list path;
     display_name =
       option_of_yojson (value_for_key resource_display_name_of_yojson "displayName") _list path;
     odb_network_id =
       option_of_yojson (value_for_key resource_id_or_arn_of_yojson "odbNetworkId") _list path;
   }
    : create_autonomous_database_input)

let create_autonomous_database_backup_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     autonomous_database_backup_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "autonomousDatabaseBackupId" _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key resource_status_of_yojson "status") _list path;
     display_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "displayName")
         _list path;
   }
    : create_autonomous_database_backup_output)

let create_autonomous_database_backup_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
     client_token =
       option_of_yojson (value_for_key general_input_string_of_yojson "clientToken") _list path;
     retention_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retentionPeriodInDays")
         _list path;
     display_name =
       option_of_yojson (value_for_key resource_display_name_of_yojson "displayName") _list path;
     autonomous_database_id =
       value_for_key resource_id_or_arn_of_yojson "autonomousDatabaseId" _list path;
   }
    : create_autonomous_database_backup_input)
