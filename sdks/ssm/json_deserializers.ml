open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "Message" _list path } : access_denied_exception)

let access_key_id_type_of_yojson = string_of_yojson
let access_key_secret_type_of_yojson = string_of_yojson
let access_request_id_of_yojson = string_of_yojson

let access_request_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Approved" -> APPROVED
    | `String "Rejected" -> REJECTED
    | `String "Revoked" -> REVOKED
    | `String "Expired" -> EXPIRED
    | `String "Pending" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessRequestStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessRequestStatus")
     : access_request_status)
    : access_request_status)

let access_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Standard" -> STANDARD
    | `String "JustInTime" -> JUSTINTIME
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessType")
     : access_type)
    : access_type)

let account_of_yojson = string_of_yojson
let account_id_of_yojson = string_of_yojson
let account_id_list_of_yojson tree path = list_of_yojson account_id_of_yojson tree path
let shared_document_version_of_yojson = string_of_yojson

let account_sharing_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     shared_document_version =
       option_of_yojson
         (value_for_key shared_document_version_of_yojson "SharedDocumentVersion")
         _list path;
   }
    : account_sharing_info)

let account_sharing_info_list_of_yojson tree path =
  list_of_yojson account_sharing_info_of_yojson tree path

let accounts_of_yojson tree path = list_of_yojson account_of_yojson tree path
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let created_date_of_yojson = timestamp_epoch_seconds_of_yojson
let boolean__of_yojson = bool_of_yojson
let expiration_date_of_yojson = timestamp_epoch_seconds_of_yojson
let registrations_count_of_yojson = int_of_yojson
let registration_limit_of_yojson = int_of_yojson
let iam_role_of_yojson = string_of_yojson
let default_instance_name_of_yojson = string_of_yojson
let activation_description_of_yojson = string_of_yojson
let activation_id_of_yojson = string_of_yojson

let activation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activation_id =
       option_of_yojson (value_for_key activation_id_of_yojson "ActivationId") _list path;
     description =
       option_of_yojson (value_for_key activation_description_of_yojson "Description") _list path;
     default_instance_name =
       option_of_yojson
         (value_for_key default_instance_name_of_yojson "DefaultInstanceName")
         _list path;
     iam_role = option_of_yojson (value_for_key iam_role_of_yojson "IamRole") _list path;
     registration_limit =
       option_of_yojson (value_for_key registration_limit_of_yojson "RegistrationLimit") _list path;
     registrations_count =
       option_of_yojson
         (value_for_key registrations_count_of_yojson "RegistrationsCount")
         _list path;
     expiration_date =
       option_of_yojson (value_for_key expiration_date_of_yojson "ExpirationDate") _list path;
     expired = option_of_yojson (value_for_key boolean__of_yojson "Expired") _list path;
     created_date = option_of_yojson (value_for_key created_date_of_yojson "CreatedDate") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : activation)

let activation_code_of_yojson = string_of_yojson
let activation_list_of_yojson tree path = list_of_yojson activation_of_yojson tree path

let too_many_updates_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : too_many_updates)

let too_many_tags_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let invalid_resource_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let invalid_resource_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : internal_server_error)

let add_tags_to_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_id_of_yojson = string_of_yojson

let resource_type_for_tagging_of_yojson (tree : t) path =
  ((match tree with
    | `String "Document" -> DOCUMENT
    | `String "ManagedInstance" -> MANAGED_INSTANCE
    | `String "MaintenanceWindow" -> MAINTENANCE_WINDOW
    | `String "Parameter" -> PARAMETER
    | `String "PatchBaseline" -> PATCH_BASELINE
    | `String "OpsItem" -> OPS_ITEM
    | `String "OpsMetadata" -> OPSMETADATA
    | `String "Automation" -> AUTOMATION
    | `String "Association" -> ASSOCIATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceTypeForTagging" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceTypeForTagging")
     : resource_type_for_tagging)
    : resource_type_for_tagging)

let add_tags_to_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_for_tagging_of_yojson "ResourceType" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : add_tags_to_resource_request)

let agent_error_code_of_yojson = string_of_yojson
let agent_type_of_yojson = string_of_yojson
let agent_version_of_yojson = string_of_yojson
let aggregator_schema_only_of_yojson = bool_of_yojson
let alarm_name_of_yojson = string_of_yojson

let alarm_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key alarm_name_of_yojson "Name" _list path } : alarm)

let alarm_list_of_yojson tree path = list_of_yojson alarm_of_yojson tree path

let alarm_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ignore_poll_alarm_failure =
       option_of_yojson (value_for_key boolean__of_yojson "IgnorePollAlarmFailure") _list path;
     alarms = value_for_key alarm_list_of_yojson "Alarms" _list path;
   }
    : alarm_configuration)

let external_alarm_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNKNOWN" -> UNKNOWN
    | `String "ALARM" -> ALARM
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExternalAlarmState" value)
    | _ -> raise (deserialize_wrong_type_error path "ExternalAlarmState")
     : external_alarm_state)
    : external_alarm_state)

let alarm_state_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key alarm_name_of_yojson "Name" _list path;
     state = value_for_key external_alarm_state_of_yojson "State" _list path;
   }
    : alarm_state_information)

let alarm_state_information_list_of_yojson tree path =
  list_of_yojson alarm_state_information_of_yojson tree path

let allowed_pattern_of_yojson = string_of_yojson

let already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : already_exists_exception)

let service_setting_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : service_setting_not_found)

let update_service_setting_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let service_setting_value_of_yojson = string_of_yojson
let service_setting_id_of_yojson = string_of_yojson

let update_service_setting_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     setting_id = value_for_key service_setting_id_of_yojson "SettingId" _list path;
     setting_value = value_for_key service_setting_value_of_yojson "SettingValue" _list path;
   }
    : update_service_setting_request)

let resource_data_sync_type_of_yojson = string_of_yojson
let resource_data_sync_name_of_yojson = string_of_yojson

let resource_data_sync_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_name =
       option_of_yojson (value_for_key resource_data_sync_name_of_yojson "SyncName") _list path;
     sync_type =
       option_of_yojson (value_for_key resource_data_sync_type_of_yojson "SyncType") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : resource_data_sync_not_found_exception)

let resource_data_sync_invalid_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_data_sync_invalid_configuration_exception)

let resource_data_sync_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_data_sync_conflict_exception)

let update_resource_data_sync_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_data_sync_enable_all_ops_data_sources_of_yojson = bool_of_yojson
let resource_data_sync_include_future_regions_of_yojson = bool_of_yojson
let resource_data_sync_source_region_of_yojson = string_of_yojson

let resource_data_sync_source_region_list_of_yojson tree path =
  list_of_yojson resource_data_sync_source_region_of_yojson tree path

let resource_data_sync_organizational_unit_id_of_yojson = string_of_yojson

let resource_data_sync_organizational_unit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organizational_unit_id =
       option_of_yojson
         (value_for_key resource_data_sync_organizational_unit_id_of_yojson "OrganizationalUnitId")
         _list path;
   }
    : resource_data_sync_organizational_unit)

let resource_data_sync_organizational_unit_list_of_yojson tree path =
  list_of_yojson resource_data_sync_organizational_unit_of_yojson tree path

let resource_data_sync_organization_source_type_of_yojson = string_of_yojson

let resource_data_sync_aws_organizations_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_source_type =
       value_for_key resource_data_sync_organization_source_type_of_yojson "OrganizationSourceType"
         _list path;
     organizational_units =
       option_of_yojson
         (value_for_key resource_data_sync_organizational_unit_list_of_yojson "OrganizationalUnits")
         _list path;
   }
    : resource_data_sync_aws_organizations_source)

let resource_data_sync_source_type_of_yojson = string_of_yojson

let resource_data_sync_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_type = value_for_key resource_data_sync_source_type_of_yojson "SourceType" _list path;
     aws_organizations_source =
       option_of_yojson
         (value_for_key resource_data_sync_aws_organizations_source_of_yojson
            "AwsOrganizationsSource")
         _list path;
     source_regions =
       value_for_key resource_data_sync_source_region_list_of_yojson "SourceRegions" _list path;
     include_future_regions =
       option_of_yojson
         (value_for_key resource_data_sync_include_future_regions_of_yojson "IncludeFutureRegions")
         _list path;
     enable_all_ops_data_sources =
       option_of_yojson
         (value_for_key resource_data_sync_enable_all_ops_data_sources_of_yojson
            "EnableAllOpsDataSources")
         _list path;
   }
    : resource_data_sync_source)

let update_resource_data_sync_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_name = value_for_key resource_data_sync_name_of_yojson "SyncName" _list path;
     sync_type = value_for_key resource_data_sync_type_of_yojson "SyncType" _list path;
     sync_source = value_for_key resource_data_sync_source_of_yojson "SyncSource" _list path;
   }
    : update_resource_data_sync_request)

let does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : does_not_exist_exception)

let patch_compliance_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLIANT" -> Compliant
    | `String "NON_COMPLIANT" -> NonCompliant
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PatchComplianceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchComplianceStatus")
     : patch_compliance_status)
    : patch_compliance_status)

let patch_source_configuration_of_yojson = string_of_yojson
let patch_source_product_of_yojson = string_of_yojson

let patch_source_product_list_of_yojson tree path =
  list_of_yojson patch_source_product_of_yojson tree path

let patch_source_name_of_yojson = string_of_yojson

let patch_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key patch_source_name_of_yojson "Name" _list path;
     products = value_for_key patch_source_product_list_of_yojson "Products" _list path;
     configuration = value_for_key patch_source_configuration_of_yojson "Configuration" _list path;
   }
    : patch_source)

let patch_source_list_of_yojson tree path = list_of_yojson patch_source_of_yojson tree path
let baseline_description_of_yojson = string_of_yojson
let date_time_of_yojson = timestamp_epoch_seconds_of_yojson

let patch_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW_AS_DEPENDENCY" -> AllowAsDependency
    | `String "BLOCK" -> Block
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchAction" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchAction")
     : patch_action)
    : patch_action)

let patch_id_of_yojson = string_of_yojson
let patch_id_list_of_yojson tree path = list_of_yojson patch_id_of_yojson tree path

let patch_compliance_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "CRITICAL" -> Critical
    | `String "HIGH" -> High
    | `String "MEDIUM" -> Medium
    | `String "LOW" -> Low
    | `String "INFORMATIONAL" -> Informational
    | `String "UNSPECIFIED" -> Unspecified
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PatchComplianceLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchComplianceLevel")
     : patch_compliance_level)
    : patch_compliance_level)

let patch_string_date_time_of_yojson = string_of_yojson
let approve_after_days_of_yojson = int_of_yojson
let patch_filter_value_of_yojson = string_of_yojson

let patch_filter_value_list_of_yojson tree path =
  list_of_yojson patch_filter_value_of_yojson tree path

let patch_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "ARCH" -> Arch
    | `String "ADVISORY_ID" -> AdvisoryId
    | `String "BUGZILLA_ID" -> BugzillaId
    | `String "PATCH_SET" -> PatchSet
    | `String "PRODUCT" -> Product
    | `String "PRODUCT_FAMILY" -> ProductFamily
    | `String "CLASSIFICATION" -> Classification
    | `String "CVE_ID" -> CVEId
    | `String "EPOCH" -> Epoch
    | `String "MSRC_SEVERITY" -> MsrcSeverity
    | `String "NAME" -> Name
    | `String "PATCH_ID" -> PatchId
    | `String "SECTION" -> Section
    | `String "PRIORITY" -> Priority
    | `String "REPOSITORY" -> Repository
    | `String "RELEASE" -> Release
    | `String "SEVERITY" -> Severity
    | `String "SECURITY" -> Security
    | `String "VERSION" -> Version
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchFilterKey")
     : patch_filter_key)
    : patch_filter_key)

let patch_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key patch_filter_key_of_yojson "Key" _list path;
     values = value_for_key patch_filter_value_list_of_yojson "Values" _list path;
   }
    : patch_filter)

let patch_filter_list_of_yojson tree path = list_of_yojson patch_filter_of_yojson tree path

let patch_filter_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ patch_filters = value_for_key patch_filter_list_of_yojson "PatchFilters" _list path }
    : patch_filter_group)

let patch_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     patch_filter_group = value_for_key patch_filter_group_of_yojson "PatchFilterGroup" _list path;
     compliance_level =
       option_of_yojson
         (value_for_key patch_compliance_level_of_yojson "ComplianceLevel")
         _list path;
     approve_after_days =
       option_of_yojson (value_for_key approve_after_days_of_yojson "ApproveAfterDays") _list path;
     approve_until_date =
       option_of_yojson
         (value_for_key patch_string_date_time_of_yojson "ApproveUntilDate")
         _list path;
     enable_non_security =
       option_of_yojson (value_for_key boolean__of_yojson "EnableNonSecurity") _list path;
   }
    : patch_rule)

let patch_rule_list_of_yojson tree path = list_of_yojson patch_rule_of_yojson tree path

let patch_rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ patch_rules = value_for_key patch_rule_list_of_yojson "PatchRules" _list path }
    : patch_rule_group)

let operating_system_of_yojson (tree : t) path =
  ((match tree with
    | `String "WINDOWS" -> Windows
    | `String "AMAZON_LINUX" -> AmazonLinux
    | `String "AMAZON_LINUX_2" -> AmazonLinux2
    | `String "AMAZON_LINUX_2022" -> AmazonLinux2022
    | `String "UBUNTU" -> Ubuntu
    | `String "REDHAT_ENTERPRISE_LINUX" -> RedhatEnterpriseLinux
    | `String "SUSE" -> Suse
    | `String "CENTOS" -> CentOS
    | `String "ORACLE_LINUX" -> OracleLinux
    | `String "DEBIAN" -> Debian
    | `String "MACOS" -> MacOS
    | `String "RASPBIAN" -> Raspbian
    | `String "ROCKY_LINUX" -> Rocky_Linux
    | `String "ALMA_LINUX" -> AlmaLinux
    | `String "AMAZON_LINUX_2023" -> AmazonLinux2023
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperatingSystem" value)
    | _ -> raise (deserialize_wrong_type_error path "OperatingSystem")
     : operating_system)
    : operating_system)

let baseline_name_of_yojson = string_of_yojson
let baseline_id_of_yojson = string_of_yojson

let update_patch_baseline_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_id = option_of_yojson (value_for_key baseline_id_of_yojson "BaselineId") _list path;
     name = option_of_yojson (value_for_key baseline_name_of_yojson "Name") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     global_filters =
       option_of_yojson (value_for_key patch_filter_group_of_yojson "GlobalFilters") _list path;
     approval_rules =
       option_of_yojson (value_for_key patch_rule_group_of_yojson "ApprovalRules") _list path;
     approved_patches =
       option_of_yojson (value_for_key patch_id_list_of_yojson "ApprovedPatches") _list path;
     approved_patches_compliance_level =
       option_of_yojson
         (value_for_key patch_compliance_level_of_yojson "ApprovedPatchesComplianceLevel")
         _list path;
     approved_patches_enable_non_security =
       option_of_yojson
         (value_for_key boolean__of_yojson "ApprovedPatchesEnableNonSecurity")
         _list path;
     rejected_patches =
       option_of_yojson (value_for_key patch_id_list_of_yojson "RejectedPatches") _list path;
     rejected_patches_action =
       option_of_yojson (value_for_key patch_action_of_yojson "RejectedPatchesAction") _list path;
     created_date = option_of_yojson (value_for_key date_time_of_yojson "CreatedDate") _list path;
     modified_date = option_of_yojson (value_for_key date_time_of_yojson "ModifiedDate") _list path;
     description =
       option_of_yojson (value_for_key baseline_description_of_yojson "Description") _list path;
     sources = option_of_yojson (value_for_key patch_source_list_of_yojson "Sources") _list path;
     available_security_updates_compliance_status =
       option_of_yojson
         (value_for_key patch_compliance_status_of_yojson "AvailableSecurityUpdatesComplianceStatus")
         _list path;
   }
    : update_patch_baseline_result)

let update_patch_baseline_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_id = value_for_key baseline_id_of_yojson "BaselineId" _list path;
     name = option_of_yojson (value_for_key baseline_name_of_yojson "Name") _list path;
     global_filters =
       option_of_yojson (value_for_key patch_filter_group_of_yojson "GlobalFilters") _list path;
     approval_rules =
       option_of_yojson (value_for_key patch_rule_group_of_yojson "ApprovalRules") _list path;
     approved_patches =
       option_of_yojson (value_for_key patch_id_list_of_yojson "ApprovedPatches") _list path;
     approved_patches_compliance_level =
       option_of_yojson
         (value_for_key patch_compliance_level_of_yojson "ApprovedPatchesComplianceLevel")
         _list path;
     approved_patches_enable_non_security =
       option_of_yojson
         (value_for_key boolean__of_yojson "ApprovedPatchesEnableNonSecurity")
         _list path;
     rejected_patches =
       option_of_yojson (value_for_key patch_id_list_of_yojson "RejectedPatches") _list path;
     rejected_patches_action =
       option_of_yojson (value_for_key patch_action_of_yojson "RejectedPatchesAction") _list path;
     description =
       option_of_yojson (value_for_key baseline_description_of_yojson "Description") _list path;
     sources = option_of_yojson (value_for_key patch_source_list_of_yojson "Sources") _list path;
     available_security_updates_compliance_status =
       option_of_yojson
         (value_for_key patch_compliance_status_of_yojson "AvailableSecurityUpdatesComplianceStatus")
         _list path;
     replace = option_of_yojson (value_for_key boolean__of_yojson "Replace") _list path;
   }
    : update_patch_baseline_request)

let ops_metadata_too_many_updates_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : ops_metadata_too_many_updates_exception)

let ops_metadata_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : ops_metadata_not_found_exception)

let ops_metadata_key_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : ops_metadata_key_limit_exceeded_exception)

let ops_metadata_invalid_argument_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : ops_metadata_invalid_argument_exception)

let ops_metadata_arn_of_yojson = string_of_yojson

let update_ops_metadata_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_metadata_arn =
       option_of_yojson (value_for_key ops_metadata_arn_of_yojson "OpsMetadataArn") _list path;
   }
    : update_ops_metadata_result)

let metadata_key_of_yojson = string_of_yojson

let metadata_keys_to_delete_list_of_yojson tree path =
  list_of_yojson metadata_key_of_yojson tree path

let metadata_value_string_of_yojson = string_of_yojson

let metadata_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ value = option_of_yojson (value_for_key metadata_value_string_of_yojson "Value") _list path }
    : metadata_value)

let metadata_map_of_yojson tree path =
  map_of_yojson metadata_key_of_yojson metadata_value_of_yojson tree path

let update_ops_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_metadata_arn = value_for_key ops_metadata_arn_of_yojson "OpsMetadataArn" _list path;
     metadata_to_update =
       option_of_yojson (value_for_key metadata_map_of_yojson "MetadataToUpdate") _list path;
     keys_to_delete =
       option_of_yojson
         (value_for_key metadata_keys_to_delete_list_of_yojson "KeysToDelete")
         _list path;
   }
    : update_ops_metadata_request)

let ops_item_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : ops_item_not_found_exception)

let integer_of_yojson = int_of_yojson
let ops_item_parameter_names_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let ops_item_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_types =
       option_of_yojson
         (value_for_key ops_item_parameter_names_list_of_yojson "ResourceTypes")
         _list path;
     limit = option_of_yojson (value_for_key integer_of_yojson "Limit") _list path;
     limit_type = option_of_yojson (value_for_key string__of_yojson "LimitType") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : ops_item_limit_exceeded_exception)

let ops_item_invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_names =
       option_of_yojson
         (value_for_key ops_item_parameter_names_list_of_yojson "ParameterNames")
         _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : ops_item_invalid_parameter_exception)

let ops_item_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : ops_item_conflict_exception)

let ops_item_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     ops_item_id = option_of_yojson (value_for_key string__of_yojson "OpsItemId") _list path;
   }
    : ops_item_already_exists_exception)

let ops_item_access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : ops_item_access_denied_exception)

let update_ops_item_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let ops_item_arn_of_yojson = string_of_yojson
let ops_item_severity_of_yojson = string_of_yojson
let ops_item_category_of_yojson = string_of_yojson
let ops_item_title_of_yojson = string_of_yojson
let ops_item_id_of_yojson = string_of_yojson

let ops_item_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Open" -> OPEN
    | `String "InProgress" -> IN_PROGRESS
    | `String "Resolved" -> RESOLVED
    | `String "Pending" -> PENDING
    | `String "TimedOut" -> TIMED_OUT
    | `String "Cancelling" -> CANCELLING
    | `String "Cancelled" -> CANCELLED
    | `String "Failed" -> FAILED
    | `String "CompletedWithSuccess" -> COMPLETED_WITH_SUCCESS
    | `String "CompletedWithFailure" -> COMPLETED_WITH_FAILURE
    | `String "Scheduled" -> SCHEDULED
    | `String "RunbookInProgress" -> RUNBOOK_IN_PROGRESS
    | `String "PendingChangeCalendarOverride" -> PENDING_CHANGE_CALENDAR_OVERRIDE
    | `String "ChangeCalendarOverrideApproved" -> CHANGE_CALENDAR_OVERRIDE_APPROVED
    | `String "ChangeCalendarOverrideRejected" -> CHANGE_CALENDAR_OVERRIDE_REJECTED
    | `String "PendingApproval" -> PENDING_APPROVAL
    | `String "Approved" -> APPROVED
    | `String "Revoked" -> REVOKED
    | `String "Rejected" -> REJECTED
    | `String "Closed" -> CLOSED
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsItemStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemStatus")
     : ops_item_status)
    : ops_item_status)

let related_ops_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ops_item_id = value_for_key string__of_yojson "OpsItemId" _list path } : related_ops_item)

let related_ops_items_of_yojson tree path = list_of_yojson related_ops_item_of_yojson tree path
let ops_item_priority_of_yojson = int_of_yojson

let ops_item_notification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = option_of_yojson (value_for_key string__of_yojson "Arn") _list path }
    : ops_item_notification)

let ops_item_notifications_of_yojson tree path =
  list_of_yojson ops_item_notification_of_yojson tree path

let ops_item_ops_data_keys_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let ops_item_data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SearchableString" -> SEARCHABLE_STRING
    | `String "String" -> STRING
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsItemDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemDataType")
     : ops_item_data_type)
    : ops_item_data_type)

let ops_item_data_value_string_of_yojson = string_of_yojson

let ops_item_data_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson (value_for_key ops_item_data_value_string_of_yojson "Value") _list path;
     type_ = option_of_yojson (value_for_key ops_item_data_type_of_yojson "Type") _list path;
   }
    : ops_item_data_value)

let ops_item_data_key_of_yojson = string_of_yojson

let ops_item_operational_data_of_yojson tree path =
  map_of_yojson ops_item_data_key_of_yojson ops_item_data_value_of_yojson tree path

let ops_item_description_of_yojson = string_of_yojson

let update_ops_item_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key ops_item_description_of_yojson "Description") _list path;
     operational_data =
       option_of_yojson
         (value_for_key ops_item_operational_data_of_yojson "OperationalData")
         _list path;
     operational_data_to_delete =
       option_of_yojson
         (value_for_key ops_item_ops_data_keys_list_of_yojson "OperationalDataToDelete")
         _list path;
     notifications =
       option_of_yojson (value_for_key ops_item_notifications_of_yojson "Notifications") _list path;
     priority = option_of_yojson (value_for_key ops_item_priority_of_yojson "Priority") _list path;
     related_ops_items =
       option_of_yojson (value_for_key related_ops_items_of_yojson "RelatedOpsItems") _list path;
     status = option_of_yojson (value_for_key ops_item_status_of_yojson "Status") _list path;
     ops_item_id = value_for_key ops_item_id_of_yojson "OpsItemId" _list path;
     title = option_of_yojson (value_for_key ops_item_title_of_yojson "Title") _list path;
     category = option_of_yojson (value_for_key ops_item_category_of_yojson "Category") _list path;
     severity = option_of_yojson (value_for_key ops_item_severity_of_yojson "Severity") _list path;
     actual_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "ActualStartTime") _list path;
     actual_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "ActualEndTime") _list path;
     planned_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "PlannedStartTime") _list path;
     planned_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "PlannedEndTime") _list path;
     ops_item_arn = option_of_yojson (value_for_key ops_item_arn_of_yojson "OpsItemArn") _list path;
   }
    : update_ops_item_request)

let invalid_instance_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_instance_id)

let update_managed_instance_role_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let managed_instance_id_of_yojson = string_of_yojson

let update_managed_instance_role_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = value_for_key managed_instance_id_of_yojson "InstanceId" _list path;
     iam_role = value_for_key iam_role_of_yojson "IamRole" _list path;
   }
    : update_managed_instance_role_request)

let maintenance_window_task_cutoff_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTINUE_TASK" -> ContinueTask
    | `String "CANCEL_TASK" -> CancelTask
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "MaintenanceWindowTaskCutoffBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "MaintenanceWindowTaskCutoffBehavior")
     : maintenance_window_task_cutoff_behavior)
    : maintenance_window_task_cutoff_behavior)

let maintenance_window_description_of_yojson = string_of_yojson
let maintenance_window_name_of_yojson = string_of_yojson
let s3_region_of_yojson = string_of_yojson
let s3_key_prefix_of_yojson = string_of_yojson
let s3_bucket_name_of_yojson = string_of_yojson

let logging_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket_name = value_for_key s3_bucket_name_of_yojson "S3BucketName" _list path;
     s3_key_prefix =
       option_of_yojson (value_for_key s3_key_prefix_of_yojson "S3KeyPrefix") _list path;
     s3_region = value_for_key s3_region_of_yojson "S3Region" _list path;
   }
    : logging_info)

let max_errors_of_yojson = string_of_yojson
let max_concurrency_of_yojson = string_of_yojson
let maintenance_window_task_priority_of_yojson = int_of_yojson
let maintenance_window_lambda_payload_of_yojson = blob_of_yojson
let maintenance_window_lambda_qualifier_of_yojson = string_of_yojson
let maintenance_window_lambda_client_context_of_yojson = string_of_yojson

let maintenance_window_lambda_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_context =
       option_of_yojson
         (value_for_key maintenance_window_lambda_client_context_of_yojson "ClientContext")
         _list path;
     qualifier =
       option_of_yojson
         (value_for_key maintenance_window_lambda_qualifier_of_yojson "Qualifier")
         _list path;
     payload =
       option_of_yojson
         (value_for_key maintenance_window_lambda_payload_of_yojson "Payload")
         _list path;
   }
    : maintenance_window_lambda_parameters)

let maintenance_window_step_functions_name_of_yojson = string_of_yojson
let maintenance_window_step_functions_input_of_yojson = string_of_yojson

let maintenance_window_step_functions_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input =
       option_of_yojson
         (value_for_key maintenance_window_step_functions_input_of_yojson "Input")
         _list path;
     name =
       option_of_yojson
         (value_for_key maintenance_window_step_functions_name_of_yojson "Name")
         _list path;
   }
    : maintenance_window_step_functions_parameters)

let automation_parameter_value_of_yojson = string_of_yojson

let automation_parameter_value_list_of_yojson tree path =
  list_of_yojson automation_parameter_value_of_yojson tree path

let automation_parameter_key_of_yojson = string_of_yojson

let automation_parameter_map_of_yojson tree path =
  map_of_yojson automation_parameter_key_of_yojson automation_parameter_value_list_of_yojson tree
    path

let document_version_of_yojson = string_of_yojson

let maintenance_window_automation_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     parameters =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Parameters") _list path;
   }
    : maintenance_window_automation_parameters)

let timeout_seconds_of_yojson = int_of_yojson
let service_role_of_yojson = string_of_yojson
let parameter_value_of_yojson = string_of_yojson
let parameter_value_list_of_yojson tree path = list_of_yojson parameter_value_of_yojson tree path
let parameter_name_of_yojson = string_of_yojson

let parameters_of_yojson tree path =
  map_of_yojson parameter_name_of_yojson parameter_value_list_of_yojson tree path

let notification_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Command" -> Command
    | `String "Invocation" -> Invocation
    | `String value -> raise (deserialize_unknown_enum_value_error path "NotificationType" value)
    | _ -> raise (deserialize_wrong_type_error path "NotificationType")
     : notification_type)
    : notification_type)

let notification_event_of_yojson (tree : t) path =
  ((match tree with
    | `String "All" -> ALL
    | `String "InProgress" -> IN_PROGRESS
    | `String "Success" -> SUCCESS
    | `String "TimedOut" -> TIMED_OUT
    | `String "Cancelled" -> CANCELLED
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "NotificationEvent" value)
    | _ -> raise (deserialize_wrong_type_error path "NotificationEvent")
     : notification_event)
    : notification_event)

let notification_event_list_of_yojson tree path =
  list_of_yojson notification_event_of_yojson tree path

let notification_arn_of_yojson = string_of_yojson

let notification_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notification_arn =
       option_of_yojson (value_for_key notification_arn_of_yojson "NotificationArn") _list path;
     notification_events =
       option_of_yojson
         (value_for_key notification_event_list_of_yojson "NotificationEvents")
         _list path;
     notification_type =
       option_of_yojson (value_for_key notification_type_of_yojson "NotificationType") _list path;
   }
    : notification_config)

let document_hash_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Sha256" -> SHA256
    | `String "Sha1" -> SHA1
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentHashType" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentHashType")
     : document_hash_type)
    : document_hash_type)

let document_hash_of_yojson = string_of_yojson
let cloud_watch_output_enabled_of_yojson = bool_of_yojson
let cloud_watch_log_group_name_of_yojson = string_of_yojson

let cloud_watch_output_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_log_group_name =
       option_of_yojson
         (value_for_key cloud_watch_log_group_name_of_yojson "CloudWatchLogGroupName")
         _list path;
     cloud_watch_output_enabled =
       option_of_yojson
         (value_for_key cloud_watch_output_enabled_of_yojson "CloudWatchOutputEnabled")
         _list path;
   }
    : cloud_watch_output_config)

let comment_of_yojson = string_of_yojson

let maintenance_window_run_command_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comment = option_of_yojson (value_for_key comment_of_yojson "Comment") _list path;
     cloud_watch_output_config =
       option_of_yojson
         (value_for_key cloud_watch_output_config_of_yojson "CloudWatchOutputConfig")
         _list path;
     document_hash =
       option_of_yojson (value_for_key document_hash_of_yojson "DocumentHash") _list path;
     document_hash_type =
       option_of_yojson (value_for_key document_hash_type_of_yojson "DocumentHashType") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     notification_config =
       option_of_yojson
         (value_for_key notification_config_of_yojson "NotificationConfig")
         _list path;
     output_s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name_of_yojson "OutputS3BucketName") _list path;
     output_s3_key_prefix =
       option_of_yojson (value_for_key s3_key_prefix_of_yojson "OutputS3KeyPrefix") _list path;
     parameters = option_of_yojson (value_for_key parameters_of_yojson "Parameters") _list path;
     service_role_arn =
       option_of_yojson (value_for_key service_role_of_yojson "ServiceRoleArn") _list path;
     timeout_seconds =
       option_of_yojson (value_for_key timeout_seconds_of_yojson "TimeoutSeconds") _list path;
   }
    : maintenance_window_run_command_parameters)

let maintenance_window_task_invocation_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     run_command =
       option_of_yojson
         (value_for_key maintenance_window_run_command_parameters_of_yojson "RunCommand")
         _list path;
     automation =
       option_of_yojson
         (value_for_key maintenance_window_automation_parameters_of_yojson "Automation")
         _list path;
     step_functions =
       option_of_yojson
         (value_for_key maintenance_window_step_functions_parameters_of_yojson "StepFunctions")
         _list path;
     lambda =
       option_of_yojson
         (value_for_key maintenance_window_lambda_parameters_of_yojson "Lambda")
         _list path;
   }
    : maintenance_window_task_invocation_parameters)

let maintenance_window_task_parameter_value_of_yojson = string_of_yojson

let maintenance_window_task_parameter_value_list_of_yojson tree path =
  list_of_yojson maintenance_window_task_parameter_value_of_yojson tree path

let maintenance_window_task_parameter_value_expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values =
       option_of_yojson
         (value_for_key maintenance_window_task_parameter_value_list_of_yojson "Values")
         _list path;
   }
    : maintenance_window_task_parameter_value_expression)

let maintenance_window_task_parameter_name_of_yojson = string_of_yojson

let maintenance_window_task_parameters_of_yojson tree path =
  map_of_yojson maintenance_window_task_parameter_name_of_yojson
    maintenance_window_task_parameter_value_expression_of_yojson tree path

let maintenance_window_task_arn_of_yojson = string_of_yojson
let target_value_of_yojson = string_of_yojson
let target_values_of_yojson tree path = list_of_yojson target_value_of_yojson tree path
let target_key_of_yojson = string_of_yojson

let target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key target_key_of_yojson "Key") _list path;
     values = option_of_yojson (value_for_key target_values_of_yojson "Values") _list path;
   }
    : target)

let targets_of_yojson tree path = list_of_yojson target_of_yojson tree path
let maintenance_window_task_id_of_yojson = string_of_yojson
let maintenance_window_id_of_yojson = string_of_yojson

let update_maintenance_window_task_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     window_task_id =
       option_of_yojson
         (value_for_key maintenance_window_task_id_of_yojson "WindowTaskId")
         _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     task_arn =
       option_of_yojson (value_for_key maintenance_window_task_arn_of_yojson "TaskArn") _list path;
     service_role_arn =
       option_of_yojson (value_for_key service_role_of_yojson "ServiceRoleArn") _list path;
     task_parameters =
       option_of_yojson
         (value_for_key maintenance_window_task_parameters_of_yojson "TaskParameters")
         _list path;
     task_invocation_parameters =
       option_of_yojson
         (value_for_key maintenance_window_task_invocation_parameters_of_yojson
            "TaskInvocationParameters")
         _list path;
     priority =
       option_of_yojson
         (value_for_key maintenance_window_task_priority_of_yojson "Priority")
         _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     logging_info = option_of_yojson (value_for_key logging_info_of_yojson "LoggingInfo") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     cutoff_behavior =
       option_of_yojson
         (value_for_key maintenance_window_task_cutoff_behavior_of_yojson "CutoffBehavior")
         _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
   }
    : update_maintenance_window_task_result)

let update_maintenance_window_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path;
     window_task_id = value_for_key maintenance_window_task_id_of_yojson "WindowTaskId" _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     task_arn =
       option_of_yojson (value_for_key maintenance_window_task_arn_of_yojson "TaskArn") _list path;
     service_role_arn =
       option_of_yojson (value_for_key service_role_of_yojson "ServiceRoleArn") _list path;
     task_parameters =
       option_of_yojson
         (value_for_key maintenance_window_task_parameters_of_yojson "TaskParameters")
         _list path;
     task_invocation_parameters =
       option_of_yojson
         (value_for_key maintenance_window_task_invocation_parameters_of_yojson
            "TaskInvocationParameters")
         _list path;
     priority =
       option_of_yojson
         (value_for_key maintenance_window_task_priority_of_yojson "Priority")
         _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     logging_info = option_of_yojson (value_for_key logging_info_of_yojson "LoggingInfo") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     replace = option_of_yojson (value_for_key boolean__of_yojson "Replace") _list path;
     cutoff_behavior =
       option_of_yojson
         (value_for_key maintenance_window_task_cutoff_behavior_of_yojson "CutoffBehavior")
         _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
   }
    : update_maintenance_window_task_request)

let owner_information_of_yojson = string_of_yojson
let maintenance_window_target_id_of_yojson = string_of_yojson

let update_maintenance_window_target_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     window_target_id =
       option_of_yojson
         (value_for_key maintenance_window_target_id_of_yojson "WindowTargetId")
         _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     owner_information =
       option_of_yojson (value_for_key owner_information_of_yojson "OwnerInformation") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
   }
    : update_maintenance_window_target_result)

let update_maintenance_window_target_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path;
     window_target_id =
       value_for_key maintenance_window_target_id_of_yojson "WindowTargetId" _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     owner_information =
       option_of_yojson (value_for_key owner_information_of_yojson "OwnerInformation") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     replace = option_of_yojson (value_for_key boolean__of_yojson "Replace") _list path;
   }
    : update_maintenance_window_target_request)

let maintenance_window_enabled_of_yojson = bool_of_yojson
let maintenance_window_allow_unassociated_targets_of_yojson = bool_of_yojson
let maintenance_window_cutoff_of_yojson = int_of_yojson
let maintenance_window_duration_hours_of_yojson = int_of_yojson
let maintenance_window_offset_of_yojson = int_of_yojson
let maintenance_window_timezone_of_yojson = string_of_yojson
let maintenance_window_schedule_of_yojson = string_of_yojson
let maintenance_window_string_date_time_of_yojson = string_of_yojson

let update_maintenance_window_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     start_date =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "StartDate")
         _list path;
     end_date =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "EndDate")
         _list path;
     schedule =
       option_of_yojson (value_for_key maintenance_window_schedule_of_yojson "Schedule") _list path;
     schedule_timezone =
       option_of_yojson
         (value_for_key maintenance_window_timezone_of_yojson "ScheduleTimezone")
         _list path;
     schedule_offset =
       option_of_yojson
         (value_for_key maintenance_window_offset_of_yojson "ScheduleOffset")
         _list path;
     duration =
       option_of_yojson
         (value_for_key maintenance_window_duration_hours_of_yojson "Duration")
         _list path;
     cutoff =
       option_of_yojson (value_for_key maintenance_window_cutoff_of_yojson "Cutoff") _list path;
     allow_unassociated_targets =
       option_of_yojson
         (value_for_key maintenance_window_allow_unassociated_targets_of_yojson
            "AllowUnassociatedTargets")
         _list path;
     enabled =
       option_of_yojson (value_for_key maintenance_window_enabled_of_yojson "Enabled") _list path;
   }
    : update_maintenance_window_result)

let update_maintenance_window_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     start_date =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "StartDate")
         _list path;
     end_date =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "EndDate")
         _list path;
     schedule =
       option_of_yojson (value_for_key maintenance_window_schedule_of_yojson "Schedule") _list path;
     schedule_timezone =
       option_of_yojson
         (value_for_key maintenance_window_timezone_of_yojson "ScheduleTimezone")
         _list path;
     schedule_offset =
       option_of_yojson
         (value_for_key maintenance_window_offset_of_yojson "ScheduleOffset")
         _list path;
     duration =
       option_of_yojson
         (value_for_key maintenance_window_duration_hours_of_yojson "Duration")
         _list path;
     cutoff =
       option_of_yojson (value_for_key maintenance_window_cutoff_of_yojson "Cutoff") _list path;
     allow_unassociated_targets =
       option_of_yojson
         (value_for_key maintenance_window_allow_unassociated_targets_of_yojson
            "AllowUnassociatedTargets")
         _list path;
     enabled =
       option_of_yojson (value_for_key maintenance_window_enabled_of_yojson "Enabled") _list path;
     replace = option_of_yojson (value_for_key boolean__of_yojson "Replace") _list path;
   }
    : update_maintenance_window_request)

let invalid_document_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_document_version)

let invalid_document_operation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_document_operation)

let invalid_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_document)

let update_document_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let document_review_comment_of_yojson = string_of_yojson

let document_review_comment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Comment" -> Comment
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DocumentReviewCommentType" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentReviewCommentType")
     : document_review_comment_type)
    : document_review_comment_type)

let document_review_comment_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson (value_for_key document_review_comment_type_of_yojson "Type") _list path;
     content =
       option_of_yojson (value_for_key document_review_comment_of_yojson "Content") _list path;
   }
    : document_review_comment_source)

let document_review_comment_list_of_yojson tree path =
  list_of_yojson document_review_comment_source_of_yojson tree path

let document_review_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "SendForReview" -> SendForReview
    | `String "UpdateReview" -> UpdateReview
    | `String "Approve" -> Approve
    | `String "Reject" -> Reject
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DocumentReviewAction" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentReviewAction")
     : document_review_action)
    : document_review_action)

let document_reviews_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key document_review_action_of_yojson "Action" _list path;
     comment =
       option_of_yojson (value_for_key document_review_comment_list_of_yojson "Comment") _list path;
   }
    : document_reviews)

let document_name_of_yojson = string_of_yojson

let update_document_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_name_of_yojson "Name" _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     document_reviews = value_for_key document_reviews_of_yojson "DocumentReviews" _list path;
   }
    : update_document_metadata_request)

let invalid_document_schema_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_document_schema_version)

let document_version_name_of_yojson = string_of_yojson

let document_default_version_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key document_name_of_yojson "Name") _list path;
     default_version =
       option_of_yojson (value_for_key document_version_of_yojson "DefaultVersion") _list path;
     default_version_name =
       option_of_yojson
         (value_for_key document_version_name_of_yojson "DefaultVersionName")
         _list path;
   }
    : document_default_version_description)

let update_document_default_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key document_default_version_description_of_yojson "Description")
         _list path;
   }
    : update_document_default_version_result)

let document_version_number_of_yojson = string_of_yojson

let update_document_default_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_name_of_yojson "Name" _list path;
     document_version = value_for_key document_version_number_of_yojson "DocumentVersion" _list path;
   }
    : update_document_default_version_request)

let max_document_size_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : max_document_size_exceeded)

let invalid_document_content_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_document_content)

let duplicate_document_version_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : duplicate_document_version_name)

let duplicate_document_content_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : duplicate_document_content)

let document_version_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : document_version_limit_exceeded)

let category_of_yojson = string_of_yojson
let category_enum_list_of_yojson tree path = list_of_yojson category_of_yojson tree path
let category_list_of_yojson tree path = list_of_yojson category_of_yojson tree path

let review_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPROVED" -> APPROVED
    | `String "NOT_REVIEWED" -> NOT_REVIEWED
    | `String "PENDING" -> PENDING
    | `String "REJECTED" -> REJECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReviewStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReviewStatus")
     : review_status)
    : review_status)

let reviewer_of_yojson = string_of_yojson

let review_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reviewed_time = option_of_yojson (value_for_key date_time_of_yojson "ReviewedTime") _list path;
     status = option_of_yojson (value_for_key review_status_of_yojson "Status") _list path;
     reviewer = option_of_yojson (value_for_key reviewer_of_yojson "Reviewer") _list path;
   }
    : review_information)

let review_information_list_of_yojson tree path =
  list_of_yojson review_information_of_yojson tree path

let document_author_of_yojson = string_of_yojson
let require_type_of_yojson = string_of_yojson
let document_ar_n_of_yojson = string_of_yojson

let document_requires_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_ar_n_of_yojson "Name" _list path;
     version = option_of_yojson (value_for_key document_version_of_yojson "Version") _list path;
     require_type = option_of_yojson (value_for_key require_type_of_yojson "RequireType") _list path;
     version_name =
       option_of_yojson (value_for_key document_version_name_of_yojson "VersionName") _list path;
   }
    : document_requires)

let document_requires_list_of_yojson tree path =
  list_of_yojson document_requires_of_yojson tree path

let attachment_name_of_yojson = string_of_yojson

let attachment_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key attachment_name_of_yojson "Name") _list path }
    : attachment_information)

let attachment_information_list_of_yojson tree path =
  list_of_yojson attachment_information_of_yojson tree path

let target_type_of_yojson = string_of_yojson

let document_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "YAML" -> YAML
    | `String "JSON" -> JSON
    | `String "TEXT" -> TEXT
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentFormat")
     : document_format)
    : document_format)

let document_schema_version_of_yojson = string_of_yojson

let document_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Command" -> Command
    | `String "Policy" -> Policy
    | `String "Automation" -> Automation
    | `String "Session" -> Session
    | `String "Package" -> Package
    | `String "ApplicationConfiguration" -> ApplicationConfiguration
    | `String "ApplicationConfigurationSchema" -> ApplicationConfigurationSchema
    | `String "DeploymentStrategy" -> DeploymentStrategy
    | `String "ChangeCalendar" -> ChangeCalendar
    | `String "Automation.ChangeTemplate" -> ChangeTemplate
    | `String "ProblemAnalysis" -> ProblemAnalysis
    | `String "ProblemAnalysisTemplate" -> ProblemAnalysisTemplate
    | `String "CloudFormation" -> CloudFormation
    | `String "ConformancePackTemplate" -> ConformancePackTemplate
    | `String "QuickSetup" -> QuickSetup
    | `String "ManualApprovalPolicy" -> ManualApprovalPolicy
    | `String "AutoApprovalPolicy" -> AutoApprovalPolicy
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentType" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentType")
     : document_type)
    : document_type)

let platform_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Windows" -> WINDOWS
    | `String "Linux" -> LINUX
    | `String "MacOS" -> MACOS
    | `String value -> raise (deserialize_unknown_enum_value_error path "PlatformType" value)
    | _ -> raise (deserialize_wrong_type_error path "PlatformType")
     : platform_type)
    : platform_type)

let platform_type_list_of_yojson tree path = list_of_yojson platform_type_of_yojson tree path
let document_parameter_default_value_of_yojson = string_of_yojson
let document_parameter_descrption_of_yojson = string_of_yojson

let document_parameter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "String" -> String
    | `String "StringList" -> StringList
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DocumentParameterType" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentParameterType")
     : document_parameter_type)
    : document_parameter_type)

let document_parameter_name_of_yojson = string_of_yojson

let document_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key document_parameter_name_of_yojson "Name") _list path;
     type_ = option_of_yojson (value_for_key document_parameter_type_of_yojson "Type") _list path;
     description =
       option_of_yojson
         (value_for_key document_parameter_descrption_of_yojson "Description")
         _list path;
     default_value =
       option_of_yojson
         (value_for_key document_parameter_default_value_of_yojson "DefaultValue")
         _list path;
   }
    : document_parameter)

let document_parameter_list_of_yojson tree path =
  list_of_yojson document_parameter_of_yojson tree path

let description_in_document_of_yojson = string_of_yojson
let document_status_information_of_yojson = string_of_yojson

let document_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Creating" -> Creating
    | `String "Active" -> Active
    | `String "Updating" -> Updating
    | `String "Deleting" -> Deleting
    | `String "Failed" -> Failed
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentStatus")
     : document_status)
    : document_status)

let document_owner_of_yojson = string_of_yojson
let document_display_name_of_yojson = string_of_yojson
let document_sha1_of_yojson = string_of_yojson

let document_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sha1 = option_of_yojson (value_for_key document_sha1_of_yojson "Sha1") _list path;
     hash = option_of_yojson (value_for_key document_hash_of_yojson "Hash") _list path;
     hash_type = option_of_yojson (value_for_key document_hash_type_of_yojson "HashType") _list path;
     name = option_of_yojson (value_for_key document_ar_n_of_yojson "Name") _list path;
     display_name =
       option_of_yojson (value_for_key document_display_name_of_yojson "DisplayName") _list path;
     version_name =
       option_of_yojson (value_for_key document_version_name_of_yojson "VersionName") _list path;
     owner = option_of_yojson (value_for_key document_owner_of_yojson "Owner") _list path;
     created_date = option_of_yojson (value_for_key date_time_of_yojson "CreatedDate") _list path;
     status = option_of_yojson (value_for_key document_status_of_yojson "Status") _list path;
     status_information =
       option_of_yojson
         (value_for_key document_status_information_of_yojson "StatusInformation")
         _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     description =
       option_of_yojson (value_for_key description_in_document_of_yojson "Description") _list path;
     parameters =
       option_of_yojson (value_for_key document_parameter_list_of_yojson "Parameters") _list path;
     platform_types =
       option_of_yojson (value_for_key platform_type_list_of_yojson "PlatformTypes") _list path;
     document_type =
       option_of_yojson (value_for_key document_type_of_yojson "DocumentType") _list path;
     schema_version =
       option_of_yojson (value_for_key document_schema_version_of_yojson "SchemaVersion") _list path;
     latest_version =
       option_of_yojson (value_for_key document_version_of_yojson "LatestVersion") _list path;
     default_version =
       option_of_yojson (value_for_key document_version_of_yojson "DefaultVersion") _list path;
     document_format =
       option_of_yojson (value_for_key document_format_of_yojson "DocumentFormat") _list path;
     target_type = option_of_yojson (value_for_key target_type_of_yojson "TargetType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     attachments_information =
       option_of_yojson
         (value_for_key attachment_information_list_of_yojson "AttachmentsInformation")
         _list path;
     requires =
       option_of_yojson (value_for_key document_requires_list_of_yojson "Requires") _list path;
     author = option_of_yojson (value_for_key document_author_of_yojson "Author") _list path;
     review_information =
       option_of_yojson
         (value_for_key review_information_list_of_yojson "ReviewInformation")
         _list path;
     approved_version =
       option_of_yojson (value_for_key document_version_of_yojson "ApprovedVersion") _list path;
     pending_review_version =
       option_of_yojson (value_for_key document_version_of_yojson "PendingReviewVersion") _list path;
     review_status =
       option_of_yojson (value_for_key review_status_of_yojson "ReviewStatus") _list path;
     category = option_of_yojson (value_for_key category_list_of_yojson "Category") _list path;
     category_enum =
       option_of_yojson (value_for_key category_enum_list_of_yojson "CategoryEnum") _list path;
   }
    : document_description)

let update_document_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_description =
       option_of_yojson
         (value_for_key document_description_of_yojson "DocumentDescription")
         _list path;
   }
    : update_document_result)

let attachment_identifier_of_yojson = string_of_yojson
let attachments_source_value_of_yojson = string_of_yojson

let attachments_source_values_of_yojson tree path =
  list_of_yojson attachments_source_value_of_yojson tree path

let attachments_source_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "SourceUrl" -> SourceUrl
    | `String "S3FileUrl" -> S3FileUrl
    | `String "AttachmentReference" -> AttachmentReference
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AttachmentsSourceKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AttachmentsSourceKey")
     : attachments_source_key)
    : attachments_source_key)

let attachments_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key attachments_source_key_of_yojson "Key") _list path;
     values =
       option_of_yojson (value_for_key attachments_source_values_of_yojson "Values") _list path;
     name = option_of_yojson (value_for_key attachment_identifier_of_yojson "Name") _list path;
   }
    : attachments_source)

let attachments_source_list_of_yojson tree path =
  list_of_yojson attachments_source_of_yojson tree path

let document_content_of_yojson = string_of_yojson

let update_document_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content = value_for_key document_content_of_yojson "Content" _list path;
     attachments =
       option_of_yojson (value_for_key attachments_source_list_of_yojson "Attachments") _list path;
     name = value_for_key document_name_of_yojson "Name" _list path;
     display_name =
       option_of_yojson (value_for_key document_display_name_of_yojson "DisplayName") _list path;
     version_name =
       option_of_yojson (value_for_key document_version_name_of_yojson "VersionName") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     document_format =
       option_of_yojson (value_for_key document_format_of_yojson "DocumentFormat") _list path;
     target_type = option_of_yojson (value_for_key target_type_of_yojson "TargetType") _list path;
   }
    : update_document_request)

let status_unchanged_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let association_does_not_exist_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : association_does_not_exist)

let association_dispatch_assume_role_arn_of_yojson = string_of_yojson
let target_map_value_of_yojson = string_of_yojson
let target_map_value_list_of_yojson tree path = list_of_yojson target_map_value_of_yojson tree path
let target_map_key_of_yojson = string_of_yojson

let target_map_of_yojson tree path =
  map_of_yojson target_map_key_of_yojson target_map_value_list_of_yojson tree path

let target_maps_of_yojson tree path = list_of_yojson target_map_of_yojson tree path
let duration_of_yojson = int_of_yojson
let schedule_offset_of_yojson = int_of_yojson
let exclude_account_of_yojson = string_of_yojson
let exclude_accounts_of_yojson tree path = list_of_yojson exclude_account_of_yojson tree path
let execution_role_name_of_yojson = string_of_yojson
let region_of_yojson = string_of_yojson
let regions_of_yojson tree path = list_of_yojson region_of_yojson tree path

let target_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accounts = option_of_yojson (value_for_key accounts_of_yojson "Accounts") _list path;
     regions = option_of_yojson (value_for_key regions_of_yojson "Regions") _list path;
     target_location_max_concurrency =
       option_of_yojson
         (value_for_key max_concurrency_of_yojson "TargetLocationMaxConcurrency")
         _list path;
     target_location_max_errors =
       option_of_yojson (value_for_key max_errors_of_yojson "TargetLocationMaxErrors") _list path;
     execution_role_name =
       option_of_yojson (value_for_key execution_role_name_of_yojson "ExecutionRoleName") _list path;
     target_location_alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "TargetLocationAlarmConfiguration")
         _list path;
     include_child_organization_units =
       option_of_yojson
         (value_for_key boolean__of_yojson "IncludeChildOrganizationUnits")
         _list path;
     exclude_accounts =
       option_of_yojson (value_for_key exclude_accounts_of_yojson "ExcludeAccounts") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     targets_max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "TargetsMaxConcurrency") _list path;
     targets_max_errors =
       option_of_yojson (value_for_key max_errors_of_yojson "TargetsMaxErrors") _list path;
   }
    : target_location)

let target_locations_of_yojson tree path = list_of_yojson target_location_of_yojson tree path
let calendar_name_or_ar_n_of_yojson = string_of_yojson

let calendar_name_or_arn_list_of_yojson tree path =
  list_of_yojson calendar_name_or_ar_n_of_yojson tree path

let apply_only_at_cron_interval_of_yojson = bool_of_yojson

let association_sync_compliance_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTO" -> Auto
    | `String "MANUAL" -> Manual
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AssociationSyncCompliance" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationSyncCompliance")
     : association_sync_compliance)
    : association_sync_compliance)

let association_compliance_severity_of_yojson (tree : t) path =
  ((match tree with
    | `String "CRITICAL" -> Critical
    | `String "HIGH" -> High
    | `String "MEDIUM" -> Medium
    | `String "LOW" -> Low
    | `String "UNSPECIFIED" -> Unspecified
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AssociationComplianceSeverity" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationComplianceSeverity")
     : association_compliance_severity)
    : association_compliance_severity)

let association_name_of_yojson = string_of_yojson

let s3_output_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_s3_region =
       option_of_yojson (value_for_key s3_region_of_yojson "OutputS3Region") _list path;
     output_s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name_of_yojson "OutputS3BucketName") _list path;
     output_s3_key_prefix =
       option_of_yojson (value_for_key s3_key_prefix_of_yojson "OutputS3KeyPrefix") _list path;
   }
    : s3_output_location)

let instance_association_output_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_location =
       option_of_yojson (value_for_key s3_output_location_of_yojson "S3Location") _list path;
   }
    : instance_association_output_location)

let schedule_expression_of_yojson = string_of_yojson
let association_id_of_yojson = string_of_yojson
let automation_target_parameter_name_of_yojson = string_of_yojson
let instance_count_of_yojson = int_of_yojson
let status_name_of_yojson = string_of_yojson

let association_status_aggregated_count_of_yojson tree path =
  map_of_yojson status_name_of_yojson instance_count_of_yojson tree path

let association_overview_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key status_name_of_yojson "Status") _list path;
     detailed_status =
       option_of_yojson (value_for_key status_name_of_yojson "DetailedStatus") _list path;
     association_status_aggregated_count =
       option_of_yojson
         (value_for_key association_status_aggregated_count_of_yojson
            "AssociationStatusAggregatedCount")
         _list path;
   }
    : association_overview)

let status_additional_info_of_yojson = string_of_yojson
let status_message_of_yojson = string_of_yojson

let association_status_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending" -> Pending
    | `String "Success" -> Success
    | `String "Failed" -> Failed
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AssociationStatusName" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationStatusName")
     : association_status_name)
    : association_status_name)

let association_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date = value_for_key date_time_of_yojson "Date" _list path;
     name = value_for_key association_status_name_of_yojson "Name" _list path;
     message = value_for_key status_message_of_yojson "Message" _list path;
     additional_info =
       option_of_yojson (value_for_key status_additional_info_of_yojson "AdditionalInfo") _list path;
   }
    : association_status)

let association_version_of_yojson = string_of_yojson
let instance_id_of_yojson = string_of_yojson

let association_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key document_ar_n_of_yojson "Name") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     association_version =
       option_of_yojson
         (value_for_key association_version_of_yojson "AssociationVersion")
         _list path;
     date = option_of_yojson (value_for_key date_time_of_yojson "Date") _list path;
     last_update_association_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastUpdateAssociationDate") _list path;
     status = option_of_yojson (value_for_key association_status_of_yojson "Status") _list path;
     overview =
       option_of_yojson (value_for_key association_overview_of_yojson "Overview") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     automation_target_parameter_name =
       option_of_yojson
         (value_for_key automation_target_parameter_name_of_yojson "AutomationTargetParameterName")
         _list path;
     parameters = option_of_yojson (value_for_key parameters_of_yojson "Parameters") _list path;
     association_id =
       option_of_yojson (value_for_key association_id_of_yojson "AssociationId") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "ScheduleExpression")
         _list path;
     output_location =
       option_of_yojson
         (value_for_key instance_association_output_location_of_yojson "OutputLocation")
         _list path;
     last_execution_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastExecutionDate") _list path;
     last_successful_execution_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastSuccessfulExecutionDate") _list path;
     association_name =
       option_of_yojson (value_for_key association_name_of_yojson "AssociationName") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     compliance_severity =
       option_of_yojson
         (value_for_key association_compliance_severity_of_yojson "ComplianceSeverity")
         _list path;
     sync_compliance =
       option_of_yojson
         (value_for_key association_sync_compliance_of_yojson "SyncCompliance")
         _list path;
     apply_only_at_cron_interval =
       option_of_yojson
         (value_for_key apply_only_at_cron_interval_of_yojson "ApplyOnlyAtCronInterval")
         _list path;
     calendar_names =
       option_of_yojson
         (value_for_key calendar_name_or_arn_list_of_yojson "CalendarNames")
         _list path;
     target_locations =
       option_of_yojson (value_for_key target_locations_of_yojson "TargetLocations") _list path;
     schedule_offset =
       option_of_yojson (value_for_key schedule_offset_of_yojson "ScheduleOffset") _list path;
     duration = option_of_yojson (value_for_key duration_of_yojson "Duration") _list path;
     target_maps = option_of_yojson (value_for_key target_maps_of_yojson "TargetMaps") _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
     triggered_alarms =
       option_of_yojson
         (value_for_key alarm_state_information_list_of_yojson "TriggeredAlarms")
         _list path;
     association_dispatch_assume_role =
       option_of_yojson
         (value_for_key association_dispatch_assume_role_arn_of_yojson
            "AssociationDispatchAssumeRole")
         _list path;
   }
    : association_description)

let update_association_status_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_description =
       option_of_yojson
         (value_for_key association_description_of_yojson "AssociationDescription")
         _list path;
   }
    : update_association_status_result)

let update_association_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_ar_n_of_yojson "Name" _list path;
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
     association_status = value_for_key association_status_of_yojson "AssociationStatus" _list path;
   }
    : update_association_status_request)

let invalid_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_update)

let invalid_target_maps_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_target_maps)

let invalid_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_target)

let invalid_schedule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_schedule)

let invalid_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_parameters)

let invalid_output_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let invalid_association_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_association_version)

let association_version_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : association_version_limit_exceeded)

let update_association_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_description =
       option_of_yojson
         (value_for_key association_description_of_yojson "AssociationDescription")
         _list path;
   }
    : update_association_result)

let update_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id = value_for_key association_id_of_yojson "AssociationId" _list path;
     parameters = option_of_yojson (value_for_key parameters_of_yojson "Parameters") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "ScheduleExpression")
         _list path;
     output_location =
       option_of_yojson
         (value_for_key instance_association_output_location_of_yojson "OutputLocation")
         _list path;
     name = option_of_yojson (value_for_key document_ar_n_of_yojson "Name") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     association_name =
       option_of_yojson (value_for_key association_name_of_yojson "AssociationName") _list path;
     association_version =
       option_of_yojson
         (value_for_key association_version_of_yojson "AssociationVersion")
         _list path;
     automation_target_parameter_name =
       option_of_yojson
         (value_for_key automation_target_parameter_name_of_yojson "AutomationTargetParameterName")
         _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     compliance_severity =
       option_of_yojson
         (value_for_key association_compliance_severity_of_yojson "ComplianceSeverity")
         _list path;
     sync_compliance =
       option_of_yojson
         (value_for_key association_sync_compliance_of_yojson "SyncCompliance")
         _list path;
     apply_only_at_cron_interval =
       option_of_yojson
         (value_for_key apply_only_at_cron_interval_of_yojson "ApplyOnlyAtCronInterval")
         _list path;
     calendar_names =
       option_of_yojson
         (value_for_key calendar_name_or_arn_list_of_yojson "CalendarNames")
         _list path;
     target_locations =
       option_of_yojson (value_for_key target_locations_of_yojson "TargetLocations") _list path;
     schedule_offset =
       option_of_yojson (value_for_key schedule_offset_of_yojson "ScheduleOffset") _list path;
     duration = option_of_yojson (value_for_key duration_of_yojson "Duration") _list path;
     target_maps = option_of_yojson (value_for_key target_maps_of_yojson "TargetMaps") _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
     association_dispatch_assume_role =
       option_of_yojson
         (value_for_key association_dispatch_assume_role_arn_of_yojson
            "AssociationDispatchAssumeRole")
         _list path;
   }
    : update_association_request)

let parameter_version_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : parameter_version_not_found)

let parameter_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : parameter_not_found)

let parameter_label_of_yojson = string_of_yojson
let parameter_label_list_of_yojson tree path = list_of_yojson parameter_label_of_yojson tree path

let unlabel_parameter_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     removed_labels =
       option_of_yojson (value_for_key parameter_label_list_of_yojson "RemovedLabels") _list path;
     invalid_labels =
       option_of_yojson (value_for_key parameter_label_list_of_yojson "InvalidLabels") _list path;
   }
    : unlabel_parameter_version_result)

let ps_parameter_version_of_yojson = long_of_yojson
let ps_parameter_name_of_yojson = string_of_yojson

let unlabel_parameter_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key ps_parameter_name_of_yojson "Name" _list path;
     parameter_version = value_for_key ps_parameter_version_of_yojson "ParameterVersion" _list path;
     labels = value_for_key parameter_label_list_of_yojson "Labels" _list path;
   }
    : unlabel_parameter_version_request)

let session_id_of_yojson = string_of_yojson

let terminate_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path }
    : terminate_session_response)

let terminate_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key session_id_of_yojson "SessionId" _list path }
    : terminate_session_request)

let invalid_automation_status_update_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_automation_status_update_exception)

let automation_execution_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : automation_execution_not_found_exception)

let stop_automation_execution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Complete" -> COMPLETE
    | `String "Cancel" -> CANCEL
    | `String value -> raise (deserialize_unknown_enum_value_error path "StopType" value)
    | _ -> raise (deserialize_wrong_type_error path "StopType")
     : stop_type)
    : stop_type)

let automation_execution_id_of_yojson = string_of_yojson

let stop_automation_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_execution_id =
       value_for_key automation_execution_id_of_yojson "AutomationExecutionId" _list path;
     type_ = option_of_yojson (value_for_key stop_type_of_yojson "Type") _list path;
   }
    : stop_automation_execution_request)

let target_not_connected_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : target_not_connected)

let stream_url_of_yojson = string_of_yojson
let token_value_of_yojson = string_of_yojson

let start_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
     token_value = option_of_yojson (value_for_key token_value_of_yojson "TokenValue") _list path;
     stream_url = option_of_yojson (value_for_key stream_url_of_yojson "StreamUrl") _list path;
   }
    : start_session_response)

let session_manager_parameter_value_of_yojson = string_of_yojson

let session_manager_parameter_value_list_of_yojson tree path =
  list_of_yojson session_manager_parameter_value_of_yojson tree path

let session_manager_parameter_name_of_yojson = string_of_yojson

let session_manager_parameters_of_yojson tree path =
  map_of_yojson session_manager_parameter_name_of_yojson
    session_manager_parameter_value_list_of_yojson tree path

let session_reason_of_yojson = string_of_yojson
let session_target_of_yojson = string_of_yojson

let start_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target = value_for_key session_target_of_yojson "Target" _list path;
     document_name =
       option_of_yojson (value_for_key document_ar_n_of_yojson "DocumentName") _list path;
     reason = option_of_yojson (value_for_key session_reason_of_yojson "Reason") _list path;
     parameters =
       option_of_yojson (value_for_key session_manager_parameters_of_yojson "Parameters") _list path;
   }
    : start_session_request)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     reason_code = option_of_yojson (value_for_key string__of_yojson "ReasonCode") _list path;
   }
    : validation_exception)

let execution_preview_id_of_yojson = string_of_yojson

let start_execution_preview_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_preview_id =
       option_of_yojson
         (value_for_key execution_preview_id_of_yojson "ExecutionPreviewId")
         _list path;
   }
    : start_execution_preview_response)

let target_locations_ur_l_of_yojson = string_of_yojson

let automation_execution_inputs_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Parameters") _list path;
     target_parameter_name =
       option_of_yojson
         (value_for_key automation_parameter_key_of_yojson "TargetParameterName")
         _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     target_maps = option_of_yojson (value_for_key target_maps_of_yojson "TargetMaps") _list path;
     target_locations =
       option_of_yojson (value_for_key target_locations_of_yojson "TargetLocations") _list path;
     target_locations_ur_l =
       option_of_yojson
         (value_for_key target_locations_ur_l_of_yojson "TargetLocationsURL")
         _list path;
   }
    : automation_execution_inputs)

let execution_inputs_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Automation" -> Automation (automation_execution_inputs_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ExecutionInputs" unknown)
    : execution_inputs)

let start_execution_preview_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_name = value_for_key document_name_of_yojson "DocumentName" _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     execution_inputs =
       option_of_yojson (value_for_key execution_inputs_of_yojson "ExecutionInputs") _list path;
   }
    : start_execution_preview_request)

let no_longer_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : no_longer_supported_exception)

let invalid_automation_execution_parameters_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_automation_execution_parameters_exception)

let idempotent_parameter_mismatch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : idempotent_parameter_mismatch)

let automation_execution_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : automation_execution_limit_exceeded_exception)

let automation_definition_version_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : automation_definition_version_not_found_exception)

let automation_definition_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : automation_definition_not_found_exception)

let automation_definition_not_approved_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : automation_definition_not_approved_exception)

let start_change_request_execution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_execution_id =
       option_of_yojson
         (value_for_key automation_execution_id_of_yojson "AutomationExecutionId")
         _list path;
   }
    : start_change_request_execution_result)

let change_details_value_of_yojson = string_of_yojson

let runbook_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_name = value_for_key document_ar_n_of_yojson "DocumentName" _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     parameters =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Parameters") _list path;
     target_parameter_name =
       option_of_yojson
         (value_for_key automation_parameter_key_of_yojson "TargetParameterName")
         _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     target_maps = option_of_yojson (value_for_key target_maps_of_yojson "TargetMaps") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     target_locations =
       option_of_yojson (value_for_key target_locations_of_yojson "TargetLocations") _list path;
   }
    : runbook)

let runbooks_of_yojson tree path = list_of_yojson runbook_of_yojson tree path
let idempotency_token_of_yojson = string_of_yojson
let change_request_name_of_yojson = string_of_yojson

let start_change_request_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_time =
       option_of_yojson (value_for_key date_time_of_yojson "ScheduledTime") _list path;
     document_name = value_for_key document_ar_n_of_yojson "DocumentName" _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     parameters =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Parameters") _list path;
     change_request_name =
       option_of_yojson (value_for_key change_request_name_of_yojson "ChangeRequestName") _list path;
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientToken") _list path;
     auto_approve = option_of_yojson (value_for_key boolean__of_yojson "AutoApprove") _list path;
     runbooks = value_for_key runbooks_of_yojson "Runbooks" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     scheduled_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "ScheduledEndTime") _list path;
     change_details =
       option_of_yojson (value_for_key change_details_value_of_yojson "ChangeDetails") _list path;
   }
    : start_change_request_execution_request)

let start_automation_execution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_execution_id =
       option_of_yojson
         (value_for_key automation_execution_id_of_yojson "AutomationExecutionId")
         _list path;
   }
    : start_automation_execution_result)

let execution_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "Auto" -> Auto
    | `String "Interactive" -> Interactive
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionMode")
     : execution_mode)
    : execution_mode)

let start_automation_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_name = value_for_key document_ar_n_of_yojson "DocumentName" _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     parameters =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Parameters") _list path;
     client_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "ClientToken") _list path;
     mode = option_of_yojson (value_for_key execution_mode_of_yojson "Mode") _list path;
     target_parameter_name =
       option_of_yojson
         (value_for_key automation_parameter_key_of_yojson "TargetParameterName")
         _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     target_maps = option_of_yojson (value_for_key target_maps_of_yojson "TargetMaps") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     target_locations =
       option_of_yojson (value_for_key target_locations_of_yojson "TargetLocations") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
     target_locations_ur_l =
       option_of_yojson
         (value_for_key target_locations_ur_l_of_yojson "TargetLocationsURL")
         _list path;
   }
    : start_automation_execution_request)

let invalid_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_association)

let start_associations_once_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let association_id_list_of_yojson tree path = list_of_yojson association_id_of_yojson tree path

let start_associations_once_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ association_ids = value_for_key association_id_list_of_yojson "AssociationIds" _list path }
    : start_associations_once_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key string__of_yojson "Message" _list path;
     quota_code = option_of_yojson (value_for_key string__of_yojson "QuotaCode") _list path;
     service_code = option_of_yojson (value_for_key string__of_yojson "ServiceCode") _list path;
   }
    : throttling_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key string__of_yojson "Message" _list path;
     resource_id = option_of_yojson (value_for_key string__of_yojson "ResourceId") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
     quota_code = value_for_key string__of_yojson "QuotaCode" _list path;
     service_code = value_for_key string__of_yojson "ServiceCode" _list path;
   }
    : service_quota_exceeded_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_not_found_exception)

let start_access_request_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_request_id =
       option_of_yojson (value_for_key access_request_id_of_yojson "AccessRequestId") _list path;
   }
    : start_access_request_response)

let string1to256_of_yojson = string_of_yojson

let start_access_request_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = value_for_key string1to256_of_yojson "Reason" _list path;
     targets = value_for_key targets_of_yojson "Targets" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_access_request_request)

let unsupported_platform_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : unsupported_platform_type)

let invalid_role_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_role)

let invalid_output_folder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let invalid_notification_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_notification_config)

let duplicate_instance_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delivery_timed_out_count_of_yojson = int_of_yojson
let error_count_of_yojson = int_of_yojson
let completed_count_of_yojson = int_of_yojson
let target_count_of_yojson = int_of_yojson
let status_details_of_yojson = string_of_yojson

let command_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending" -> PENDING
    | `String "InProgress" -> IN_PROGRESS
    | `String "Success" -> SUCCESS
    | `String "Cancelled" -> CANCELLED
    | `String "Failed" -> FAILED
    | `String "TimedOut" -> TIMED_OUT
    | `String "Cancelling" -> CANCELLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "CommandStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CommandStatus")
     : command_status)
    : command_status)

let instance_id_list_of_yojson tree path = list_of_yojson instance_id_of_yojson tree path
let command_id_of_yojson = string_of_yojson

let command_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command_id = option_of_yojson (value_for_key command_id_of_yojson "CommandId") _list path;
     document_name =
       option_of_yojson (value_for_key document_name_of_yojson "DocumentName") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     comment = option_of_yojson (value_for_key comment_of_yojson "Comment") _list path;
     expires_after = option_of_yojson (value_for_key date_time_of_yojson "ExpiresAfter") _list path;
     parameters = option_of_yojson (value_for_key parameters_of_yojson "Parameters") _list path;
     instance_ids =
       option_of_yojson (value_for_key instance_id_list_of_yojson "InstanceIds") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     requested_date_time =
       option_of_yojson (value_for_key date_time_of_yojson "RequestedDateTime") _list path;
     status = option_of_yojson (value_for_key command_status_of_yojson "Status") _list path;
     status_details =
       option_of_yojson (value_for_key status_details_of_yojson "StatusDetails") _list path;
     output_s3_region =
       option_of_yojson (value_for_key s3_region_of_yojson "OutputS3Region") _list path;
     output_s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name_of_yojson "OutputS3BucketName") _list path;
     output_s3_key_prefix =
       option_of_yojson (value_for_key s3_key_prefix_of_yojson "OutputS3KeyPrefix") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     target_count = option_of_yojson (value_for_key target_count_of_yojson "TargetCount") _list path;
     completed_count =
       option_of_yojson (value_for_key completed_count_of_yojson "CompletedCount") _list path;
     error_count = option_of_yojson (value_for_key error_count_of_yojson "ErrorCount") _list path;
     delivery_timed_out_count =
       option_of_yojson
         (value_for_key delivery_timed_out_count_of_yojson "DeliveryTimedOutCount")
         _list path;
     service_role = option_of_yojson (value_for_key service_role_of_yojson "ServiceRole") _list path;
     notification_config =
       option_of_yojson
         (value_for_key notification_config_of_yojson "NotificationConfig")
         _list path;
     cloud_watch_output_config =
       option_of_yojson
         (value_for_key cloud_watch_output_config_of_yojson "CloudWatchOutputConfig")
         _list path;
     timeout_seconds =
       option_of_yojson (value_for_key timeout_seconds_of_yojson "TimeoutSeconds") _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
     triggered_alarms =
       option_of_yojson
         (value_for_key alarm_state_information_list_of_yojson "TriggeredAlarms")
         _list path;
   }
    : command)

let send_command_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ command = option_of_yojson (value_for_key command_of_yojson "Command") _list path }
    : send_command_result)

let send_command_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_ids =
       option_of_yojson (value_for_key instance_id_list_of_yojson "InstanceIds") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     document_name = value_for_key document_ar_n_of_yojson "DocumentName" _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     document_hash =
       option_of_yojson (value_for_key document_hash_of_yojson "DocumentHash") _list path;
     document_hash_type =
       option_of_yojson (value_for_key document_hash_type_of_yojson "DocumentHashType") _list path;
     timeout_seconds =
       option_of_yojson (value_for_key timeout_seconds_of_yojson "TimeoutSeconds") _list path;
     comment = option_of_yojson (value_for_key comment_of_yojson "Comment") _list path;
     parameters = option_of_yojson (value_for_key parameters_of_yojson "Parameters") _list path;
     output_s3_region =
       option_of_yojson (value_for_key s3_region_of_yojson "OutputS3Region") _list path;
     output_s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name_of_yojson "OutputS3BucketName") _list path;
     output_s3_key_prefix =
       option_of_yojson (value_for_key s3_key_prefix_of_yojson "OutputS3KeyPrefix") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     service_role_arn =
       option_of_yojson (value_for_key service_role_of_yojson "ServiceRoleArn") _list path;
     notification_config =
       option_of_yojson
         (value_for_key notification_config_of_yojson "NotificationConfig")
         _list path;
     cloud_watch_output_config =
       option_of_yojson
         (value_for_key cloud_watch_output_config_of_yojson "CloudWatchOutputConfig")
         _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
   }
    : send_command_request)

let invalid_automation_signal_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_automation_signal_exception)

let automation_step_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : automation_step_not_found_exception)

let send_automation_signal_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let signal_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Approve" -> APPROVE
    | `String "Reject" -> REJECT
    | `String "StartStep" -> START_STEP
    | `String "StopStep" -> STOP_STEP
    | `String "Resume" -> RESUME
    | `String "Revoke" -> REVOKE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SignalType" value)
    | _ -> raise (deserialize_wrong_type_error path "SignalType")
     : signal_type)
    : signal_type)

let send_automation_signal_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_execution_id =
       value_for_key automation_execution_id_of_yojson "AutomationExecutionId" _list path;
     signal_type = value_for_key signal_type_of_yojson "SignalType" _list path;
     payload =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Payload") _list path;
   }
    : send_automation_signal_request)

let resume_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
     token_value = option_of_yojson (value_for_key token_value_of_yojson "TokenValue") _list path;
     stream_url = option_of_yojson (value_for_key stream_url_of_yojson "StreamUrl") _list path;
   }
    : resume_session_response)

let resume_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key session_id_of_yojson "SessionId" _list path }
    : resume_session_request)

let service_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     setting_id =
       option_of_yojson (value_for_key service_setting_id_of_yojson "SettingId") _list path;
     setting_value =
       option_of_yojson (value_for_key service_setting_value_of_yojson "SettingValue") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedDate") _list path;
     last_modified_user =
       option_of_yojson (value_for_key string__of_yojson "LastModifiedUser") _list path;
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
   }
    : service_setting)

let reset_service_setting_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_setting =
       option_of_yojson (value_for_key service_setting_of_yojson "ServiceSetting") _list path;
   }
    : reset_service_setting_result)

let reset_service_setting_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ setting_id = value_for_key service_setting_id_of_yojson "SettingId" _list path }
    : reset_service_setting_request)

let remove_tags_from_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let remove_tags_from_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_for_tagging_of_yojson "ResourceType" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     tag_keys = value_for_key key_list_of_yojson "TagKeys" _list path;
   }
    : remove_tags_from_resource_request)

let resource_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_limit_exceeded_exception)

let feature_not_available_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : feature_not_available_exception)

let register_task_with_maintenance_window_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_task_id =
       option_of_yojson
         (value_for_key maintenance_window_task_id_of_yojson "WindowTaskId")
         _list path;
   }
    : register_task_with_maintenance_window_result)

let client_token_of_yojson = string_of_yojson

let maintenance_window_task_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RUN_COMMAND" -> RunCommand
    | `String "AUTOMATION" -> Automation
    | `String "STEP_FUNCTIONS" -> StepFunctions
    | `String "LAMBDA" -> Lambda
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MaintenanceWindowTaskType" value)
    | _ -> raise (deserialize_wrong_type_error path "MaintenanceWindowTaskType")
     : maintenance_window_task_type)
    : maintenance_window_task_type)

let register_task_with_maintenance_window_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     task_arn = value_for_key maintenance_window_task_arn_of_yojson "TaskArn" _list path;
     service_role_arn =
       option_of_yojson (value_for_key service_role_of_yojson "ServiceRoleArn") _list path;
     task_type = value_for_key maintenance_window_task_type_of_yojson "TaskType" _list path;
     task_parameters =
       option_of_yojson
         (value_for_key maintenance_window_task_parameters_of_yojson "TaskParameters")
         _list path;
     task_invocation_parameters =
       option_of_yojson
         (value_for_key maintenance_window_task_invocation_parameters_of_yojson
            "TaskInvocationParameters")
         _list path;
     priority =
       option_of_yojson
         (value_for_key maintenance_window_task_priority_of_yojson "Priority")
         _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     logging_info = option_of_yojson (value_for_key logging_info_of_yojson "LoggingInfo") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     cutoff_behavior =
       option_of_yojson
         (value_for_key maintenance_window_task_cutoff_behavior_of_yojson "CutoffBehavior")
         _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
   }
    : register_task_with_maintenance_window_request)

let register_target_with_maintenance_window_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_target_id =
       option_of_yojson
         (value_for_key maintenance_window_target_id_of_yojson "WindowTargetId")
         _list path;
   }
    : register_target_with_maintenance_window_result)

let maintenance_window_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSTANCE" -> Instance
    | `String "RESOURCE_GROUP" -> ResourceGroup
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MaintenanceWindowResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "MaintenanceWindowResourceType")
     : maintenance_window_resource_type)
    : maintenance_window_resource_type)

let register_target_with_maintenance_window_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path;
     resource_type =
       value_for_key maintenance_window_resource_type_of_yojson "ResourceType" _list path;
     targets = value_for_key targets_of_yojson "Targets" _list path;
     owner_information =
       option_of_yojson (value_for_key owner_information_of_yojson "OwnerInformation") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : register_target_with_maintenance_window_request)

let patch_group_of_yojson = string_of_yojson

let register_patch_baseline_for_patch_group_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_id = option_of_yojson (value_for_key baseline_id_of_yojson "BaselineId") _list path;
     patch_group = option_of_yojson (value_for_key patch_group_of_yojson "PatchGroup") _list path;
   }
    : register_patch_baseline_for_patch_group_result)

let register_patch_baseline_for_patch_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_id = value_for_key baseline_id_of_yojson "BaselineId" _list path;
     patch_group = value_for_key patch_group_of_yojson "PatchGroup" _list path;
   }
    : register_patch_baseline_for_patch_group_request)

let register_default_patch_baseline_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ baseline_id = option_of_yojson (value_for_key baseline_id_of_yojson "BaselineId") _list path }
    : register_default_patch_baseline_result)

let register_default_patch_baseline_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ baseline_id = value_for_key baseline_id_of_yojson "BaselineId" _list path }
    : register_default_patch_baseline_request)

let resource_policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_policy_not_found_exception)

let resource_policy_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key integer_of_yojson "Limit") _list path;
     limit_type = option_of_yojson (value_for_key string__of_yojson "LimitType") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : resource_policy_limit_exceeded_exception)

let resource_policy_parameter_names_list_of_yojson tree path =
  list_of_yojson string__of_yojson tree path

let resource_policy_invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_names =
       option_of_yojson
         (value_for_key resource_policy_parameter_names_list_of_yojson "ParameterNames")
         _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : resource_policy_invalid_parameter_exception)

let resource_policy_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_policy_conflict_exception)

let malformed_resource_policy_document_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : malformed_resource_policy_document_exception)

let policy_hash_of_yojson = string_of_yojson
let policy_id_of_yojson = string_of_yojson

let put_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_id = option_of_yojson (value_for_key policy_id_of_yojson "PolicyId") _list path;
     policy_hash = option_of_yojson (value_for_key policy_hash_of_yojson "PolicyHash") _list path;
   }
    : put_resource_policy_response)

let policy_of_yojson = string_of_yojson
let resource_arn_string_of_yojson = string_of_yojson

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
     policy = value_for_key policy_of_yojson "Policy" _list path;
     policy_id = option_of_yojson (value_for_key policy_id_of_yojson "PolicyId") _list path;
     policy_hash = option_of_yojson (value_for_key policy_hash_of_yojson "PolicyHash") _list path;
   }
    : put_resource_policy_request)

let unsupported_parameter_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : unsupported_parameter_type)

let policies_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : policies_limit_exceeded_exception)

let parameter_pattern_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : parameter_pattern_mismatch_exception)

let parameter_max_version_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : parameter_max_version_limit_exceeded)

let parameter_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : parameter_limit_exceeded)

let parameter_already_exists_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : parameter_already_exists)

let invalid_policy_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_policy_type_exception)

let invalid_policy_attribute_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_policy_attribute_exception)

let invalid_key_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_key_id)

let invalid_allowed_pattern_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_allowed_pattern_exception)

let incompatible_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : incompatible_policy_exception)

let hierarchy_type_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : hierarchy_type_mismatch_exception)

let hierarchy_level_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : hierarchy_level_limit_exceeded_exception)

let parameter_tier_of_yojson (tree : t) path =
  ((match tree with
    | `String "Standard" -> STANDARD
    | `String "Advanced" -> ADVANCED
    | `String "Intelligent-Tiering" -> INTELLIGENT_TIERING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParameterTier" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterTier")
     : parameter_tier)
    : parameter_tier)

let put_parameter_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key ps_parameter_version_of_yojson "Version") _list path;
     tier = option_of_yojson (value_for_key parameter_tier_of_yojson "Tier") _list path;
   }
    : put_parameter_result)

let parameter_data_type_of_yojson = string_of_yojson
let parameter_policies_of_yojson = string_of_yojson
let parameter_key_id_of_yojson = string_of_yojson

let parameter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "String" -> STRING
    | `String "StringList" -> STRING_LIST
    | `String "SecureString" -> SECURE_STRING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParameterType" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterType")
     : parameter_type)
    : parameter_type)

let ps_parameter_value_of_yojson = string_of_yojson
let parameter_description_of_yojson = string_of_yojson

let put_parameter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key ps_parameter_name_of_yojson "Name" _list path;
     description =
       option_of_yojson (value_for_key parameter_description_of_yojson "Description") _list path;
     value = value_for_key ps_parameter_value_of_yojson "Value" _list path;
     type_ = option_of_yojson (value_for_key parameter_type_of_yojson "Type") _list path;
     key_id = option_of_yojson (value_for_key parameter_key_id_of_yojson "KeyId") _list path;
     overwrite = option_of_yojson (value_for_key boolean__of_yojson "Overwrite") _list path;
     allowed_pattern =
       option_of_yojson (value_for_key allowed_pattern_of_yojson "AllowedPattern") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     tier = option_of_yojson (value_for_key parameter_tier_of_yojson "Tier") _list path;
     policies = option_of_yojson (value_for_key parameter_policies_of_yojson "Policies") _list path;
     data_type =
       option_of_yojson (value_for_key parameter_data_type_of_yojson "DataType") _list path;
   }
    : put_parameter_request)

let unsupported_inventory_schema_version_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : unsupported_inventory_schema_version_exception)

let inventory_item_type_name_of_yojson = string_of_yojson

let unsupported_inventory_item_context_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name =
       option_of_yojson (value_for_key inventory_item_type_name_of_yojson "TypeName") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : unsupported_inventory_item_context_exception)

let total_size_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : total_size_limit_exceeded_exception)

let sub_type_count_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : sub_type_count_limit_exceeded_exception)

let item_size_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name =
       option_of_yojson (value_for_key inventory_item_type_name_of_yojson "TypeName") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : item_size_limit_exceeded_exception)

let item_content_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name =
       option_of_yojson (value_for_key inventory_item_type_name_of_yojson "TypeName") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : item_content_mismatch_exception)

let invalid_type_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_type_name_exception)

let invalid_item_content_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name =
       option_of_yojson (value_for_key inventory_item_type_name_of_yojson "TypeName") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : invalid_item_content_exception)

let invalid_inventory_item_context_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_inventory_item_context_exception)

let custom_schema_count_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : custom_schema_count_limit_exceeded_exception)

let put_inventory_message_of_yojson = string_of_yojson

let put_inventory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key put_inventory_message_of_yojson "Message") _list path;
   }
    : put_inventory_result)

let attribute_value_of_yojson = string_of_yojson
let attribute_name_of_yojson = string_of_yojson

let inventory_item_content_context_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let inventory_item_entry_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let inventory_item_entry_list_of_yojson tree path =
  list_of_yojson inventory_item_entry_of_yojson tree path

let inventory_item_content_hash_of_yojson = string_of_yojson
let inventory_item_capture_time_of_yojson = string_of_yojson
let inventory_item_schema_version_of_yojson = string_of_yojson

let inventory_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = value_for_key inventory_item_type_name_of_yojson "TypeName" _list path;
     schema_version =
       value_for_key inventory_item_schema_version_of_yojson "SchemaVersion" _list path;
     capture_time = value_for_key inventory_item_capture_time_of_yojson "CaptureTime" _list path;
     content_hash =
       option_of_yojson
         (value_for_key inventory_item_content_hash_of_yojson "ContentHash")
         _list path;
     content =
       option_of_yojson (value_for_key inventory_item_entry_list_of_yojson "Content") _list path;
     context =
       option_of_yojson
         (value_for_key inventory_item_content_context_of_yojson "Context")
         _list path;
   }
    : inventory_item)

let inventory_item_list_of_yojson tree path = list_of_yojson inventory_item_of_yojson tree path

let put_inventory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
     items = value_for_key inventory_item_list_of_yojson "Items" _list path;
   }
    : put_inventory_request)

let compliance_type_count_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : compliance_type_count_limit_exceeded_exception)

let put_compliance_items_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let compliance_upload_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETE" -> Complete
    | `String "PARTIAL" -> Partial
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ComplianceUploadType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComplianceUploadType")
     : compliance_upload_type)
    : compliance_upload_type)

let compliance_item_content_hash_of_yojson = string_of_yojson

let compliance_item_details_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let compliance_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLIANT" -> Compliant
    | `String "NON_COMPLIANT" -> NonCompliant
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComplianceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ComplianceStatus")
     : compliance_status)
    : compliance_status)

let compliance_severity_of_yojson (tree : t) path =
  ((match tree with
    | `String "CRITICAL" -> Critical
    | `String "HIGH" -> High
    | `String "MEDIUM" -> Medium
    | `String "LOW" -> Low
    | `String "INFORMATIONAL" -> Informational
    | `String "UNSPECIFIED" -> Unspecified
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComplianceSeverity" value)
    | _ -> raise (deserialize_wrong_type_error path "ComplianceSeverity")
     : compliance_severity)
    : compliance_severity)

let compliance_item_title_of_yojson = string_of_yojson
let compliance_item_id_of_yojson = string_of_yojson

let compliance_item_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key compliance_item_id_of_yojson "Id") _list path;
     title = option_of_yojson (value_for_key compliance_item_title_of_yojson "Title") _list path;
     severity = value_for_key compliance_severity_of_yojson "Severity" _list path;
     status = value_for_key compliance_status_of_yojson "Status" _list path;
     details =
       option_of_yojson (value_for_key compliance_item_details_of_yojson "Details") _list path;
   }
    : compliance_item_entry)

let compliance_item_entry_list_of_yojson tree path =
  list_of_yojson compliance_item_entry_of_yojson tree path

let compliance_execution_type_of_yojson = string_of_yojson
let compliance_execution_id_of_yojson = string_of_yojson

let compliance_execution_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_time = value_for_key date_time_of_yojson "ExecutionTime" _list path;
     execution_id =
       option_of_yojson (value_for_key compliance_execution_id_of_yojson "ExecutionId") _list path;
     execution_type =
       option_of_yojson
         (value_for_key compliance_execution_type_of_yojson "ExecutionType")
         _list path;
   }
    : compliance_execution_summary)

let compliance_type_name_of_yojson = string_of_yojson
let compliance_resource_type_of_yojson = string_of_yojson
let compliance_resource_id_of_yojson = string_of_yojson

let put_compliance_items_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key compliance_resource_id_of_yojson "ResourceId" _list path;
     resource_type = value_for_key compliance_resource_type_of_yojson "ResourceType" _list path;
     compliance_type = value_for_key compliance_type_name_of_yojson "ComplianceType" _list path;
     execution_summary =
       value_for_key compliance_execution_summary_of_yojson "ExecutionSummary" _list path;
     items = value_for_key compliance_item_entry_list_of_yojson "Items" _list path;
     item_content_hash =
       option_of_yojson
         (value_for_key compliance_item_content_hash_of_yojson "ItemContentHash")
         _list path;
     upload_type =
       option_of_yojson (value_for_key compliance_upload_type_of_yojson "UploadType") _list path;
   }
    : put_compliance_items_request)

let invalid_permission_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_permission_type)

let document_permission_limit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : document_permission_limit)

let document_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : document_limit_exceeded)

let modify_document_permission_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let document_permission_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Share" -> SHARE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DocumentPermissionType" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentPermissionType")
     : document_permission_type)
    : document_permission_type)

let modify_document_permission_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_name_of_yojson "Name" _list path;
     permission_type = value_for_key document_permission_type_of_yojson "PermissionType" _list path;
     account_ids_to_add =
       option_of_yojson (value_for_key account_id_list_of_yojson "AccountIdsToAdd") _list path;
     account_ids_to_remove =
       option_of_yojson (value_for_key account_id_list_of_yojson "AccountIdsToRemove") _list path;
     shared_document_version =
       option_of_yojson
         (value_for_key shared_document_version_of_yojson "SharedDocumentVersion")
         _list path;
   }
    : modify_document_permission_request)

let list_tags_for_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path }
    : list_tags_for_resource_result)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_for_tagging_of_yojson "ResourceType" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
   }
    : list_tags_for_resource_request)

let invalid_next_token_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_next_token)

let next_token_of_yojson = string_of_yojson
let last_resource_data_sync_message_of_yojson = string_of_yojson
let resource_data_sync_created_time_of_yojson = timestamp_epoch_seconds_of_yojson

let last_resource_data_sync_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Successful" -> SUCCESSFUL
    | `String "Failed" -> FAILED
    | `String "InProgress" -> INPROGRESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LastResourceDataSyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LastResourceDataSyncStatus")
     : last_resource_data_sync_status)
    : last_resource_data_sync_status)

let resource_data_sync_last_modified_time_of_yojson = timestamp_epoch_seconds_of_yojson
let last_successful_resource_data_sync_time_of_yojson = timestamp_epoch_seconds_of_yojson
let last_resource_data_sync_time_of_yojson = timestamp_epoch_seconds_of_yojson
let resource_data_sync_destination_data_sharing_type_of_yojson = string_of_yojson

let resource_data_sync_destination_data_sharing_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_data_sharing_type =
       option_of_yojson
         (value_for_key resource_data_sync_destination_data_sharing_type_of_yojson
            "DestinationDataSharingType")
         _list path;
   }
    : resource_data_sync_destination_data_sharing)

let resource_data_sync_awskms_key_ar_n_of_yojson = string_of_yojson
let resource_data_sync_s3_region_of_yojson = string_of_yojson

let resource_data_sync_s3_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "JsonSerDe" -> JSON_SERDE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceDataSyncS3Format" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceDataSyncS3Format")
     : resource_data_sync_s3_format)
    : resource_data_sync_s3_format)

let resource_data_sync_s3_prefix_of_yojson = string_of_yojson
let resource_data_sync_s3_bucket_name_of_yojson = string_of_yojson

let resource_data_sync_s3_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = value_for_key resource_data_sync_s3_bucket_name_of_yojson "BucketName" _list path;
     prefix =
       option_of_yojson (value_for_key resource_data_sync_s3_prefix_of_yojson "Prefix") _list path;
     sync_format = value_for_key resource_data_sync_s3_format_of_yojson "SyncFormat" _list path;
     region = value_for_key resource_data_sync_s3_region_of_yojson "Region" _list path;
     awskms_key_ar_n =
       option_of_yojson
         (value_for_key resource_data_sync_awskms_key_ar_n_of_yojson "AWSKMSKeyARN")
         _list path;
     destination_data_sharing =
       option_of_yojson
         (value_for_key resource_data_sync_destination_data_sharing_of_yojson
            "DestinationDataSharing")
         _list path;
   }
    : resource_data_sync_s3_destination)

let resource_data_sync_state_of_yojson = string_of_yojson

let resource_data_sync_source_with_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_type =
       option_of_yojson
         (value_for_key resource_data_sync_source_type_of_yojson "SourceType")
         _list path;
     aws_organizations_source =
       option_of_yojson
         (value_for_key resource_data_sync_aws_organizations_source_of_yojson
            "AwsOrganizationsSource")
         _list path;
     source_regions =
       option_of_yojson
         (value_for_key resource_data_sync_source_region_list_of_yojson "SourceRegions")
         _list path;
     include_future_regions =
       option_of_yojson
         (value_for_key resource_data_sync_include_future_regions_of_yojson "IncludeFutureRegions")
         _list path;
     state = option_of_yojson (value_for_key resource_data_sync_state_of_yojson "State") _list path;
     enable_all_ops_data_sources =
       option_of_yojson
         (value_for_key resource_data_sync_enable_all_ops_data_sources_of_yojson
            "EnableAllOpsDataSources")
         _list path;
   }
    : resource_data_sync_source_with_state)

let resource_data_sync_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_name =
       option_of_yojson (value_for_key resource_data_sync_name_of_yojson "SyncName") _list path;
     sync_type =
       option_of_yojson (value_for_key resource_data_sync_type_of_yojson "SyncType") _list path;
     sync_source =
       option_of_yojson
         (value_for_key resource_data_sync_source_with_state_of_yojson "SyncSource")
         _list path;
     s3_destination =
       option_of_yojson
         (value_for_key resource_data_sync_s3_destination_of_yojson "S3Destination")
         _list path;
     last_sync_time =
       option_of_yojson
         (value_for_key last_resource_data_sync_time_of_yojson "LastSyncTime")
         _list path;
     last_successful_sync_time =
       option_of_yojson
         (value_for_key last_successful_resource_data_sync_time_of_yojson "LastSuccessfulSyncTime")
         _list path;
     sync_last_modified_time =
       option_of_yojson
         (value_for_key resource_data_sync_last_modified_time_of_yojson "SyncLastModifiedTime")
         _list path;
     last_status =
       option_of_yojson
         (value_for_key last_resource_data_sync_status_of_yojson "LastStatus")
         _list path;
     sync_created_time =
       option_of_yojson
         (value_for_key resource_data_sync_created_time_of_yojson "SyncCreatedTime")
         _list path;
     last_sync_status_message =
       option_of_yojson
         (value_for_key last_resource_data_sync_message_of_yojson "LastSyncStatusMessage")
         _list path;
   }
    : resource_data_sync_item)

let resource_data_sync_item_list_of_yojson tree path =
  list_of_yojson resource_data_sync_item_of_yojson tree path

let list_resource_data_sync_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_data_sync_items =
       option_of_yojson
         (value_for_key resource_data_sync_item_list_of_yojson "ResourceDataSyncItems")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_resource_data_sync_result)

let max_results_of_yojson = int_of_yojson

let list_resource_data_sync_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_type =
       option_of_yojson (value_for_key resource_data_sync_type_of_yojson "SyncType") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_resource_data_sync_request)

let invalid_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_filter)

let compliance_summary_count_of_yojson = int_of_yojson

let severity_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     critical_count =
       option_of_yojson
         (value_for_key compliance_summary_count_of_yojson "CriticalCount")
         _list path;
     high_count =
       option_of_yojson (value_for_key compliance_summary_count_of_yojson "HighCount") _list path;
     medium_count =
       option_of_yojson (value_for_key compliance_summary_count_of_yojson "MediumCount") _list path;
     low_count =
       option_of_yojson (value_for_key compliance_summary_count_of_yojson "LowCount") _list path;
     informational_count =
       option_of_yojson
         (value_for_key compliance_summary_count_of_yojson "InformationalCount")
         _list path;
     unspecified_count =
       option_of_yojson
         (value_for_key compliance_summary_count_of_yojson "UnspecifiedCount")
         _list path;
   }
    : severity_summary)

let non_compliant_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     non_compliant_count =
       option_of_yojson
         (value_for_key compliance_summary_count_of_yojson "NonCompliantCount")
         _list path;
     severity_summary =
       option_of_yojson (value_for_key severity_summary_of_yojson "SeveritySummary") _list path;
   }
    : non_compliant_summary)

let compliant_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliant_count =
       option_of_yojson
         (value_for_key compliance_summary_count_of_yojson "CompliantCount")
         _list path;
     severity_summary =
       option_of_yojson (value_for_key severity_summary_of_yojson "SeveritySummary") _list path;
   }
    : compliant_summary)

let resource_compliance_summary_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_type =
       option_of_yojson (value_for_key compliance_type_name_of_yojson "ComplianceType") _list path;
     resource_type =
       option_of_yojson (value_for_key compliance_resource_type_of_yojson "ResourceType") _list path;
     resource_id =
       option_of_yojson (value_for_key compliance_resource_id_of_yojson "ResourceId") _list path;
     status = option_of_yojson (value_for_key compliance_status_of_yojson "Status") _list path;
     overall_severity =
       option_of_yojson (value_for_key compliance_severity_of_yojson "OverallSeverity") _list path;
     execution_summary =
       option_of_yojson
         (value_for_key compliance_execution_summary_of_yojson "ExecutionSummary")
         _list path;
     compliant_summary =
       option_of_yojson (value_for_key compliant_summary_of_yojson "CompliantSummary") _list path;
     non_compliant_summary =
       option_of_yojson
         (value_for_key non_compliant_summary_of_yojson "NonCompliantSummary")
         _list path;
   }
    : resource_compliance_summary_item)

let resource_compliance_summary_item_list_of_yojson tree path =
  list_of_yojson resource_compliance_summary_item_of_yojson tree path

let list_resource_compliance_summaries_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_compliance_summary_items =
       option_of_yojson
         (value_for_key resource_compliance_summary_item_list_of_yojson
            "ResourceComplianceSummaryItems")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_resource_compliance_summaries_result)

let compliance_query_operator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUAL" -> Equal
    | `String "NOT_EQUAL" -> NotEqual
    | `String "BEGIN_WITH" -> BeginWith
    | `String "LESS_THAN" -> LessThan
    | `String "GREATER_THAN" -> GreaterThan
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ComplianceQueryOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComplianceQueryOperatorType")
     : compliance_query_operator_type)
    : compliance_query_operator_type)

let compliance_filter_value_of_yojson = string_of_yojson

let compliance_string_filter_value_list_of_yojson tree path =
  list_of_yojson compliance_filter_value_of_yojson tree path

let compliance_string_filter_key_of_yojson = string_of_yojson

let compliance_string_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key compliance_string_filter_key_of_yojson "Key") _list path;
     values =
       option_of_yojson
         (value_for_key compliance_string_filter_value_list_of_yojson "Values")
         _list path;
     type_ =
       option_of_yojson (value_for_key compliance_query_operator_type_of_yojson "Type") _list path;
   }
    : compliance_string_filter)

let compliance_string_filter_list_of_yojson tree path =
  list_of_yojson compliance_string_filter_of_yojson tree path

let list_resource_compliance_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key compliance_string_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_resource_compliance_summaries_request)

let ops_metadata_resource_id_of_yojson = string_of_yojson

let ops_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       option_of_yojson (value_for_key ops_metadata_resource_id_of_yojson "ResourceId") _list path;
     ops_metadata_arn =
       option_of_yojson (value_for_key ops_metadata_arn_of_yojson "OpsMetadataArn") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedDate") _list path;
     last_modified_user =
       option_of_yojson (value_for_key string__of_yojson "LastModifiedUser") _list path;
     creation_date = option_of_yojson (value_for_key date_time_of_yojson "CreationDate") _list path;
   }
    : ops_metadata)

let ops_metadata_list_of_yojson tree path = list_of_yojson ops_metadata_of_yojson tree path

let list_ops_metadata_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_metadata_list =
       option_of_yojson (value_for_key ops_metadata_list_of_yojson "OpsMetadataList") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_ops_metadata_result)

let list_ops_metadata_max_results_of_yojson = int_of_yojson
let ops_metadata_filter_value_of_yojson = string_of_yojson

let ops_metadata_filter_value_list_of_yojson tree path =
  list_of_yojson ops_metadata_filter_value_of_yojson tree path

let ops_metadata_filter_key_of_yojson = string_of_yojson

let ops_metadata_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key ops_metadata_filter_key_of_yojson "Key" _list path;
     values = value_for_key ops_metadata_filter_value_list_of_yojson "Values" _list path;
   }
    : ops_metadata_filter)

let ops_metadata_filter_list_of_yojson tree path =
  list_of_yojson ops_metadata_filter_of_yojson tree path

let list_ops_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key ops_metadata_filter_list_of_yojson "Filters") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_ops_metadata_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_ops_metadata_request)

let ops_item_identity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = option_of_yojson (value_for_key string__of_yojson "Arn") _list path }
    : ops_item_identity)

let ops_item_related_item_association_resource_uri_of_yojson = string_of_yojson
let ops_item_related_item_association_type_of_yojson = string_of_yojson
let ops_item_related_item_association_resource_type_of_yojson = string_of_yojson
let ops_item_related_item_association_id_of_yojson = string_of_yojson

let ops_item_related_item_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_item_id = option_of_yojson (value_for_key ops_item_id_of_yojson "OpsItemId") _list path;
     association_id =
       option_of_yojson
         (value_for_key ops_item_related_item_association_id_of_yojson "AssociationId")
         _list path;
     resource_type =
       option_of_yojson
         (value_for_key ops_item_related_item_association_resource_type_of_yojson "ResourceType")
         _list path;
     association_type =
       option_of_yojson
         (value_for_key ops_item_related_item_association_type_of_yojson "AssociationType")
         _list path;
     resource_uri =
       option_of_yojson
         (value_for_key ops_item_related_item_association_resource_uri_of_yojson "ResourceUri")
         _list path;
     created_by =
       option_of_yojson (value_for_key ops_item_identity_of_yojson "CreatedBy") _list path;
     created_time = option_of_yojson (value_for_key date_time_of_yojson "CreatedTime") _list path;
     last_modified_by =
       option_of_yojson (value_for_key ops_item_identity_of_yojson "LastModifiedBy") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
   }
    : ops_item_related_item_summary)

let ops_item_related_item_summaries_of_yojson tree path =
  list_of_yojson ops_item_related_item_summary_of_yojson tree path

let list_ops_item_related_items_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     summaries =
       option_of_yojson
         (value_for_key ops_item_related_item_summaries_of_yojson "Summaries")
         _list path;
   }
    : list_ops_item_related_items_response)

let ops_item_related_items_max_results_of_yojson = int_of_yojson

let ops_item_related_items_filter_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "Equal" -> EQUAL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OpsItemRelatedItemsFilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemRelatedItemsFilterOperator")
     : ops_item_related_items_filter_operator)
    : ops_item_related_items_filter_operator)

let ops_item_related_items_filter_value_of_yojson = string_of_yojson

let ops_item_related_items_filter_values_of_yojson tree path =
  list_of_yojson ops_item_related_items_filter_value_of_yojson tree path

let ops_item_related_items_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "AssociationId" -> ASSOCIATION_ID
    | `String "ResourceUri" -> RESOURCE_URI
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OpsItemRelatedItemsFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemRelatedItemsFilterKey")
     : ops_item_related_items_filter_key)
    : ops_item_related_items_filter_key)

let ops_item_related_items_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key ops_item_related_items_filter_key_of_yojson "Key" _list path;
     values = value_for_key ops_item_related_items_filter_values_of_yojson "Values" _list path;
     operator = value_for_key ops_item_related_items_filter_operator_of_yojson "Operator" _list path;
   }
    : ops_item_related_items_filter)

let ops_item_related_items_filters_of_yojson tree path =
  list_of_yojson ops_item_related_items_filter_of_yojson tree path

let list_ops_item_related_items_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_item_id = option_of_yojson (value_for_key ops_item_id_of_yojson "OpsItemId") _list path;
     filters =
       option_of_yojson
         (value_for_key ops_item_related_items_filters_of_yojson "Filters")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key ops_item_related_items_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_ops_item_related_items_request)

let ops_item_event_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_item_id = option_of_yojson (value_for_key string__of_yojson "OpsItemId") _list path;
     event_id = option_of_yojson (value_for_key string__of_yojson "EventId") _list path;
     source = option_of_yojson (value_for_key string__of_yojson "Source") _list path;
     detail_type = option_of_yojson (value_for_key string__of_yojson "DetailType") _list path;
     detail = option_of_yojson (value_for_key string__of_yojson "Detail") _list path;
     created_by =
       option_of_yojson (value_for_key ops_item_identity_of_yojson "CreatedBy") _list path;
     created_time = option_of_yojson (value_for_key date_time_of_yojson "CreatedTime") _list path;
   }
    : ops_item_event_summary)

let ops_item_event_summaries_of_yojson tree path =
  list_of_yojson ops_item_event_summary_of_yojson tree path

let list_ops_item_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     summaries =
       option_of_yojson (value_for_key ops_item_event_summaries_of_yojson "Summaries") _list path;
   }
    : list_ops_item_events_response)

let ops_item_event_max_results_of_yojson = int_of_yojson

let ops_item_event_filter_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "Equal" -> EQUAL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OpsItemEventFilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemEventFilterOperator")
     : ops_item_event_filter_operator)
    : ops_item_event_filter_operator)

let ops_item_event_filter_value_of_yojson = string_of_yojson

let ops_item_event_filter_values_of_yojson tree path =
  list_of_yojson ops_item_event_filter_value_of_yojson tree path

let ops_item_event_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "OpsItemId" -> OPSITEM_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OpsItemEventFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemEventFilterKey")
     : ops_item_event_filter_key)
    : ops_item_event_filter_key)

let ops_item_event_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key ops_item_event_filter_key_of_yojson "Key" _list path;
     values = value_for_key ops_item_event_filter_values_of_yojson "Values" _list path;
     operator = value_for_key ops_item_event_filter_operator_of_yojson "Operator" _list path;
   }
    : ops_item_event_filter)

let ops_item_event_filters_of_yojson tree path =
  list_of_yojson ops_item_event_filter_of_yojson tree path

let list_ops_item_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key ops_item_event_filters_of_yojson "Filters") _list path;
     max_results =
       option_of_yojson (value_for_key ops_item_event_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_ops_item_events_request)

let unsupported_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : unsupported_operation_exception)

let invalid_aggregator_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_aggregator_exception)

let node_summary_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let node_summary_list_of_yojson tree path = list_of_yojson node_summary_of_yojson tree path

let list_nodes_summary_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary = option_of_yojson (value_for_key node_summary_list_of_yojson "Summary") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_nodes_summary_result)

let node_attribute_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "AgentVersion" -> AGENT_VERSION
    | `String "PlatformName" -> PLATFORM_NAME
    | `String "PlatformType" -> PLATFORM_TYPE
    | `String "PlatformVersion" -> PLATFORM_VERSION
    | `String "Region" -> REGION
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "NodeAttributeName" value)
    | _ -> raise (deserialize_wrong_type_error path "NodeAttributeName")
     : node_attribute_name)
    : node_attribute_name)

let node_type_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Instance" -> INSTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "NodeTypeName" value)
    | _ -> raise (deserialize_wrong_type_error path "NodeTypeName")
     : node_type_name)
    : node_type_name)

let node_aggregator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Count" -> COUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "NodeAggregatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "NodeAggregatorType")
     : node_aggregator_type)
    : node_aggregator_type)

let rec node_aggregator_list_of_yojson tree path =
  list_of_yojson node_aggregator_of_yojson tree path

and node_aggregator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregator_type = value_for_key node_aggregator_type_of_yojson "AggregatorType" _list path;
     type_name = value_for_key node_type_name_of_yojson "TypeName" _list path;
     attribute_name = value_for_key node_attribute_name_of_yojson "AttributeName" _list path;
     aggregators =
       option_of_yojson (value_for_key node_aggregator_list_of_yojson "Aggregators") _list path;
   }
    : node_aggregator)

let node_filter_operator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Equal" -> EQUAL
    | `String "NotEqual" -> NOT_EQUAL
    | `String "BeginWith" -> BEGIN_WITH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NodeFilterOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "NodeFilterOperatorType")
     : node_filter_operator_type)
    : node_filter_operator_type)

let node_filter_value_of_yojson = string_of_yojson

let node_filter_value_list_of_yojson tree path =
  list_of_yojson node_filter_value_of_yojson tree path

let node_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "AgentType" -> AGENT_TYPE
    | `String "AgentVersion" -> AGENT_VERSION
    | `String "ComputerName" -> COMPUTER_NAME
    | `String "InstanceId" -> INSTANCE_ID
    | `String "InstanceStatus" -> INSTANCE_STATUS
    | `String "IpAddress" -> IP_ADDRESS
    | `String "ManagedStatus" -> MANAGED_STATUS
    | `String "PlatformName" -> PLATFORM_NAME
    | `String "PlatformType" -> PLATFORM_TYPE
    | `String "PlatformVersion" -> PLATFORM_VERSION
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "OrganizationalUnitId" -> ORGANIZATIONAL_UNIT_ID
    | `String "OrganizationalUnitPath" -> ORGANIZATIONAL_UNIT_PATH
    | `String "Region" -> REGION
    | `String "AccountId" -> ACCOUNT_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "NodeFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "NodeFilterKey")
     : node_filter_key)
    : node_filter_key)

let node_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key node_filter_key_of_yojson "Key" _list path;
     values = value_for_key node_filter_value_list_of_yojson "Values" _list path;
     type_ = option_of_yojson (value_for_key node_filter_operator_type_of_yojson "Type") _list path;
   }
    : node_filter)

let node_filter_list_of_yojson tree path = list_of_yojson node_filter_of_yojson tree path

let list_nodes_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_name =
       option_of_yojson (value_for_key resource_data_sync_name_of_yojson "SyncName") _list path;
     filters = option_of_yojson (value_for_key node_filter_list_of_yojson "Filters") _list path;
     aggregators = value_for_key node_aggregator_list_of_yojson "Aggregators" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_nodes_summary_request)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ManagedInstance" -> MANAGED_INSTANCE
    | `String "EC2Instance" -> EC2_INSTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let platform_version_of_yojson = string_of_yojson
let platform_name_of_yojson = string_of_yojson

let managed_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "All" -> ALL
    | `String "Managed" -> MANAGED
    | `String "Unmanaged" -> UNMANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ManagedStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ManagedStatus")
     : managed_status)
    : managed_status)

let ip_address_of_yojson = string_of_yojson
let instance_status_of_yojson = string_of_yojson
let computer_name_of_yojson = string_of_yojson

let instance_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agent_type = option_of_yojson (value_for_key agent_type_of_yojson "AgentType") _list path;
     agent_version =
       option_of_yojson (value_for_key agent_version_of_yojson "AgentVersion") _list path;
     computer_name =
       option_of_yojson (value_for_key computer_name_of_yojson "ComputerName") _list path;
     instance_status =
       option_of_yojson (value_for_key instance_status_of_yojson "InstanceStatus") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
     managed_status =
       option_of_yojson (value_for_key managed_status_of_yojson "ManagedStatus") _list path;
     platform_type =
       option_of_yojson (value_for_key platform_type_of_yojson "PlatformType") _list path;
     platform_name =
       option_of_yojson (value_for_key platform_name_of_yojson "PlatformName") _list path;
     platform_version =
       option_of_yojson (value_for_key platform_version_of_yojson "PlatformVersion") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
   }
    : instance_info)

let node_type_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Instance" -> Instance (instance_info_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "NodeType" unknown)
    : node_type)

let node_region_of_yojson = string_of_yojson
let node_organizational_unit_path_of_yojson = string_of_yojson
let node_organizational_unit_id_of_yojson = string_of_yojson
let node_account_id_of_yojson = string_of_yojson

let node_owner_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key node_account_id_of_yojson "AccountId") _list path;
     organizational_unit_id =
       option_of_yojson
         (value_for_key node_organizational_unit_id_of_yojson "OrganizationalUnitId")
         _list path;
     organizational_unit_path =
       option_of_yojson
         (value_for_key node_organizational_unit_path_of_yojson "OrganizationalUnitPath")
         _list path;
   }
    : node_owner_info)

let node_id_of_yojson = string_of_yojson
let node_capture_time_of_yojson = timestamp_epoch_seconds_of_yojson

let node_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capture_time =
       option_of_yojson (value_for_key node_capture_time_of_yojson "CaptureTime") _list path;
     id = option_of_yojson (value_for_key node_id_of_yojson "Id") _list path;
     owner = option_of_yojson (value_for_key node_owner_info_of_yojson "Owner") _list path;
     region = option_of_yojson (value_for_key node_region_of_yojson "Region") _list path;
     node_type = option_of_yojson (value_for_key node_type_of_yojson "NodeType") _list path;
   }
    : node)

let node_list_of_yojson tree path = list_of_yojson node_of_yojson tree path

let list_nodes_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nodes = option_of_yojson (value_for_key node_list_of_yojson "Nodes") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_nodes_result)

let list_nodes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_name =
       option_of_yojson (value_for_key resource_data_sync_name_of_yojson "SyncName") _list path;
     filters = option_of_yojson (value_for_key node_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_nodes_request)

let list_inventory_entries_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name =
       option_of_yojson (value_for_key inventory_item_type_name_of_yojson "TypeName") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     schema_version =
       option_of_yojson
         (value_for_key inventory_item_schema_version_of_yojson "SchemaVersion")
         _list path;
     capture_time =
       option_of_yojson
         (value_for_key inventory_item_capture_time_of_yojson "CaptureTime")
         _list path;
     entries =
       option_of_yojson (value_for_key inventory_item_entry_list_of_yojson "Entries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_inventory_entries_result)

let inventory_query_operator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Equal" -> EQUAL
    | `String "NotEqual" -> NOT_EQUAL
    | `String "BeginWith" -> BEGIN_WITH
    | `String "LessThan" -> LESS_THAN
    | `String "GreaterThan" -> GREATER_THAN
    | `String "Exists" -> EXISTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InventoryQueryOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "InventoryQueryOperatorType")
     : inventory_query_operator_type)
    : inventory_query_operator_type)

let inventory_filter_value_of_yojson = string_of_yojson

let inventory_filter_value_list_of_yojson tree path =
  list_of_yojson inventory_filter_value_of_yojson tree path

let inventory_filter_key_of_yojson = string_of_yojson

let inventory_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key inventory_filter_key_of_yojson "Key" _list path;
     values = value_for_key inventory_filter_value_list_of_yojson "Values" _list path;
     type_ =
       option_of_yojson (value_for_key inventory_query_operator_type_of_yojson "Type") _list path;
   }
    : inventory_filter)

let inventory_filter_list_of_yojson tree path = list_of_yojson inventory_filter_of_yojson tree path

let list_inventory_entries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
     type_name = value_for_key inventory_item_type_name_of_yojson "TypeName" _list path;
     filters = option_of_yojson (value_for_key inventory_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_inventory_entries_request)

let document_version_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key document_name_of_yojson "Name") _list path;
     display_name =
       option_of_yojson (value_for_key document_display_name_of_yojson "DisplayName") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     version_name =
       option_of_yojson (value_for_key document_version_name_of_yojson "VersionName") _list path;
     created_date = option_of_yojson (value_for_key date_time_of_yojson "CreatedDate") _list path;
     is_default_version =
       option_of_yojson (value_for_key boolean__of_yojson "IsDefaultVersion") _list path;
     document_format =
       option_of_yojson (value_for_key document_format_of_yojson "DocumentFormat") _list path;
     status = option_of_yojson (value_for_key document_status_of_yojson "Status") _list path;
     status_information =
       option_of_yojson
         (value_for_key document_status_information_of_yojson "StatusInformation")
         _list path;
     review_status =
       option_of_yojson (value_for_key review_status_of_yojson "ReviewStatus") _list path;
   }
    : document_version_info)

let document_version_list_of_yojson tree path =
  list_of_yojson document_version_info_of_yojson tree path

let list_document_versions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_versions =
       option_of_yojson
         (value_for_key document_version_list_of_yojson "DocumentVersions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_document_versions_result)

let list_document_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_ar_n_of_yojson "Name" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_document_versions_request)

let invalid_filter_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let document_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key document_ar_n_of_yojson "Name") _list path;
     created_date = option_of_yojson (value_for_key date_time_of_yojson "CreatedDate") _list path;
     display_name =
       option_of_yojson (value_for_key document_display_name_of_yojson "DisplayName") _list path;
     owner = option_of_yojson (value_for_key document_owner_of_yojson "Owner") _list path;
     version_name =
       option_of_yojson (value_for_key document_version_name_of_yojson "VersionName") _list path;
     platform_types =
       option_of_yojson (value_for_key platform_type_list_of_yojson "PlatformTypes") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     document_type =
       option_of_yojson (value_for_key document_type_of_yojson "DocumentType") _list path;
     schema_version =
       option_of_yojson (value_for_key document_schema_version_of_yojson "SchemaVersion") _list path;
     document_format =
       option_of_yojson (value_for_key document_format_of_yojson "DocumentFormat") _list path;
     target_type = option_of_yojson (value_for_key target_type_of_yojson "TargetType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     requires =
       option_of_yojson (value_for_key document_requires_list_of_yojson "Requires") _list path;
     review_status =
       option_of_yojson (value_for_key review_status_of_yojson "ReviewStatus") _list path;
     author = option_of_yojson (value_for_key document_author_of_yojson "Author") _list path;
   }
    : document_identifier)

let document_identifier_list_of_yojson tree path =
  list_of_yojson document_identifier_of_yojson tree path

let list_documents_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_identifiers =
       option_of_yojson
         (value_for_key document_identifier_list_of_yojson "DocumentIdentifiers")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_documents_result)

let document_key_values_filter_value_of_yojson = string_of_yojson

let document_key_values_filter_values_of_yojson tree path =
  list_of_yojson document_key_values_filter_value_of_yojson tree path

let document_key_values_filter_key_of_yojson = string_of_yojson

let document_key_values_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key =
       option_of_yojson (value_for_key document_key_values_filter_key_of_yojson "Key") _list path;
     values =
       option_of_yojson
         (value_for_key document_key_values_filter_values_of_yojson "Values")
         _list path;
   }
    : document_key_values_filter)

let document_key_values_filter_list_of_yojson tree path =
  list_of_yojson document_key_values_filter_of_yojson tree path

let document_filter_value_of_yojson = string_of_yojson

let document_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "Name" -> Name
    | `String "Owner" -> Owner
    | `String "PlatformTypes" -> PlatformTypes
    | `String "DocumentType" -> DocumentType
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentFilterKey")
     : document_filter_key)
    : document_filter_key)

let document_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key document_filter_key_of_yojson "key" _list path;
     value = value_for_key document_filter_value_of_yojson "value" _list path;
   }
    : document_filter)

let document_filter_list_of_yojson tree path = list_of_yojson document_filter_of_yojson tree path

let list_documents_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_filter_list =
       option_of_yojson
         (value_for_key document_filter_list_of_yojson "DocumentFilterList")
         _list path;
     filters =
       option_of_yojson
         (value_for_key document_key_values_filter_list_of_yojson "Filters")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_documents_request)

let document_reviewer_response_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_time = option_of_yojson (value_for_key date_time_of_yojson "CreateTime") _list path;
     updated_time = option_of_yojson (value_for_key date_time_of_yojson "UpdatedTime") _list path;
     review_status =
       option_of_yojson (value_for_key review_status_of_yojson "ReviewStatus") _list path;
     comment =
       option_of_yojson (value_for_key document_review_comment_list_of_yojson "Comment") _list path;
     reviewer = option_of_yojson (value_for_key reviewer_of_yojson "Reviewer") _list path;
   }
    : document_reviewer_response_source)

let document_reviewer_response_list_of_yojson tree path =
  list_of_yojson document_reviewer_response_source_of_yojson tree path

let document_metadata_response_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reviewer_response =
       option_of_yojson
         (value_for_key document_reviewer_response_list_of_yojson "ReviewerResponse")
         _list path;
   }
    : document_metadata_response_info)

let list_document_metadata_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key document_name_of_yojson "Name") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     author = option_of_yojson (value_for_key document_author_of_yojson "Author") _list path;
     metadata =
       option_of_yojson
         (value_for_key document_metadata_response_info_of_yojson "Metadata")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_document_metadata_history_response)

let document_metadata_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "DocumentReviews" -> DocumentReviews
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DocumentMetadataEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentMetadataEnum")
     : document_metadata_enum)
    : document_metadata_enum)

let list_document_metadata_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_name_of_yojson "Name" _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     metadata = value_for_key document_metadata_enum_of_yojson "Metadata" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_document_metadata_history_request)

let compliance_summary_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_type =
       option_of_yojson (value_for_key compliance_type_name_of_yojson "ComplianceType") _list path;
     compliant_summary =
       option_of_yojson (value_for_key compliant_summary_of_yojson "CompliantSummary") _list path;
     non_compliant_summary =
       option_of_yojson
         (value_for_key non_compliant_summary_of_yojson "NonCompliantSummary")
         _list path;
   }
    : compliance_summary_item)

let compliance_summary_item_list_of_yojson tree path =
  list_of_yojson compliance_summary_item_of_yojson tree path

let list_compliance_summaries_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_summary_items =
       option_of_yojson
         (value_for_key compliance_summary_item_list_of_yojson "ComplianceSummaryItems")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_compliance_summaries_result)

let list_compliance_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key compliance_string_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_compliance_summaries_request)

let compliance_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_type =
       option_of_yojson (value_for_key compliance_type_name_of_yojson "ComplianceType") _list path;
     resource_type =
       option_of_yojson (value_for_key compliance_resource_type_of_yojson "ResourceType") _list path;
     resource_id =
       option_of_yojson (value_for_key compliance_resource_id_of_yojson "ResourceId") _list path;
     id = option_of_yojson (value_for_key compliance_item_id_of_yojson "Id") _list path;
     title = option_of_yojson (value_for_key compliance_item_title_of_yojson "Title") _list path;
     status = option_of_yojson (value_for_key compliance_status_of_yojson "Status") _list path;
     severity = option_of_yojson (value_for_key compliance_severity_of_yojson "Severity") _list path;
     execution_summary =
       option_of_yojson
         (value_for_key compliance_execution_summary_of_yojson "ExecutionSummary")
         _list path;
     details =
       option_of_yojson (value_for_key compliance_item_details_of_yojson "Details") _list path;
   }
    : compliance_item)

let compliance_item_list_of_yojson tree path = list_of_yojson compliance_item_of_yojson tree path

let list_compliance_items_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compliance_items =
       option_of_yojson (value_for_key compliance_item_list_of_yojson "ComplianceItems") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_compliance_items_result)

let compliance_resource_type_list_of_yojson tree path =
  list_of_yojson compliance_resource_type_of_yojson tree path

let compliance_resource_id_list_of_yojson tree path =
  list_of_yojson compliance_resource_id_of_yojson tree path

let list_compliance_items_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key compliance_string_filter_list_of_yojson "Filters") _list path;
     resource_ids =
       option_of_yojson
         (value_for_key compliance_resource_id_list_of_yojson "ResourceIds")
         _list path;
     resource_types =
       option_of_yojson
         (value_for_key compliance_resource_type_list_of_yojson "ResourceTypes")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_compliance_items_request)

let invalid_command_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let command_list_of_yojson tree path = list_of_yojson command_of_yojson tree path

let list_commands_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commands = option_of_yojson (value_for_key command_list_of_yojson "Commands") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_commands_result)

let command_filter_value_of_yojson = string_of_yojson

let command_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "InvokedAfter" -> INVOKED_AFTER
    | `String "InvokedBefore" -> INVOKED_BEFORE
    | `String "Status" -> STATUS
    | `String "ExecutionStage" -> EXECUTION_STAGE
    | `String "DocumentName" -> DOCUMENT_NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "CommandFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "CommandFilterKey")
     : command_filter_key)
    : command_filter_key)

let command_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key command_filter_key_of_yojson "key" _list path;
     value = value_for_key command_filter_value_of_yojson "value" _list path;
   }
    : command_filter)

let command_filter_list_of_yojson tree path = list_of_yojson command_filter_of_yojson tree path
let command_max_results_of_yojson = int_of_yojson

let list_commands_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command_id = option_of_yojson (value_for_key command_id_of_yojson "CommandId") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     max_results =
       option_of_yojson (value_for_key command_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key command_filter_list_of_yojson "Filters") _list path;
   }
    : list_commands_request)

let url_of_yojson = string_of_yojson
let command_plugin_output_of_yojson = string_of_yojson
let response_code_of_yojson = int_of_yojson

let command_plugin_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending" -> PENDING
    | `String "InProgress" -> IN_PROGRESS
    | `String "Success" -> SUCCESS
    | `String "TimedOut" -> TIMED_OUT
    | `String "Cancelled" -> CANCELLED
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CommandPluginStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CommandPluginStatus")
     : command_plugin_status)
    : command_plugin_status)

let command_plugin_name_of_yojson = string_of_yojson

let command_plugin_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key command_plugin_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key command_plugin_status_of_yojson "Status") _list path;
     status_details =
       option_of_yojson (value_for_key status_details_of_yojson "StatusDetails") _list path;
     response_code =
       option_of_yojson (value_for_key response_code_of_yojson "ResponseCode") _list path;
     response_start_date_time =
       option_of_yojson (value_for_key date_time_of_yojson "ResponseStartDateTime") _list path;
     response_finish_date_time =
       option_of_yojson (value_for_key date_time_of_yojson "ResponseFinishDateTime") _list path;
     output = option_of_yojson (value_for_key command_plugin_output_of_yojson "Output") _list path;
     standard_output_url =
       option_of_yojson (value_for_key url_of_yojson "StandardOutputUrl") _list path;
     standard_error_url =
       option_of_yojson (value_for_key url_of_yojson "StandardErrorUrl") _list path;
     output_s3_region =
       option_of_yojson (value_for_key s3_region_of_yojson "OutputS3Region") _list path;
     output_s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name_of_yojson "OutputS3BucketName") _list path;
     output_s3_key_prefix =
       option_of_yojson (value_for_key s3_key_prefix_of_yojson "OutputS3KeyPrefix") _list path;
   }
    : command_plugin)

let command_plugin_list_of_yojson tree path = list_of_yojson command_plugin_of_yojson tree path
let invocation_trace_output_of_yojson = string_of_yojson

let command_invocation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending" -> PENDING
    | `String "InProgress" -> IN_PROGRESS
    | `String "Delayed" -> DELAYED
    | `String "Success" -> SUCCESS
    | `String "Cancelled" -> CANCELLED
    | `String "TimedOut" -> TIMED_OUT
    | `String "Failed" -> FAILED
    | `String "Cancelling" -> CANCELLING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CommandInvocationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CommandInvocationStatus")
     : command_invocation_status)
    : command_invocation_status)

let instance_tag_name_of_yojson = string_of_yojson

let command_invocation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command_id = option_of_yojson (value_for_key command_id_of_yojson "CommandId") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     instance_name =
       option_of_yojson (value_for_key instance_tag_name_of_yojson "InstanceName") _list path;
     comment = option_of_yojson (value_for_key comment_of_yojson "Comment") _list path;
     document_name =
       option_of_yojson (value_for_key document_name_of_yojson "DocumentName") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     requested_date_time =
       option_of_yojson (value_for_key date_time_of_yojson "RequestedDateTime") _list path;
     status =
       option_of_yojson (value_for_key command_invocation_status_of_yojson "Status") _list path;
     status_details =
       option_of_yojson (value_for_key status_details_of_yojson "StatusDetails") _list path;
     trace_output =
       option_of_yojson (value_for_key invocation_trace_output_of_yojson "TraceOutput") _list path;
     standard_output_url =
       option_of_yojson (value_for_key url_of_yojson "StandardOutputUrl") _list path;
     standard_error_url =
       option_of_yojson (value_for_key url_of_yojson "StandardErrorUrl") _list path;
     command_plugins =
       option_of_yojson (value_for_key command_plugin_list_of_yojson "CommandPlugins") _list path;
     service_role = option_of_yojson (value_for_key service_role_of_yojson "ServiceRole") _list path;
     notification_config =
       option_of_yojson
         (value_for_key notification_config_of_yojson "NotificationConfig")
         _list path;
     cloud_watch_output_config =
       option_of_yojson
         (value_for_key cloud_watch_output_config_of_yojson "CloudWatchOutputConfig")
         _list path;
   }
    : command_invocation)

let command_invocation_list_of_yojson tree path =
  list_of_yojson command_invocation_of_yojson tree path

let list_command_invocations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command_invocations =
       option_of_yojson
         (value_for_key command_invocation_list_of_yojson "CommandInvocations")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_command_invocations_result)

let list_command_invocations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command_id = option_of_yojson (value_for_key command_id_of_yojson "CommandId") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     max_results =
       option_of_yojson (value_for_key command_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key command_filter_list_of_yojson "Filters") _list path;
     details = option_of_yojson (value_for_key boolean__of_yojson "Details") _list path;
   }
    : list_command_invocations_request)

let association_version_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       option_of_yojson (value_for_key association_id_of_yojson "AssociationId") _list path;
     association_version =
       option_of_yojson
         (value_for_key association_version_of_yojson "AssociationVersion")
         _list path;
     created_date = option_of_yojson (value_for_key date_time_of_yojson "CreatedDate") _list path;
     name = option_of_yojson (value_for_key document_ar_n_of_yojson "Name") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     parameters = option_of_yojson (value_for_key parameters_of_yojson "Parameters") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "ScheduleExpression")
         _list path;
     output_location =
       option_of_yojson
         (value_for_key instance_association_output_location_of_yojson "OutputLocation")
         _list path;
     association_name =
       option_of_yojson (value_for_key association_name_of_yojson "AssociationName") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     compliance_severity =
       option_of_yojson
         (value_for_key association_compliance_severity_of_yojson "ComplianceSeverity")
         _list path;
     sync_compliance =
       option_of_yojson
         (value_for_key association_sync_compliance_of_yojson "SyncCompliance")
         _list path;
     apply_only_at_cron_interval =
       option_of_yojson
         (value_for_key apply_only_at_cron_interval_of_yojson "ApplyOnlyAtCronInterval")
         _list path;
     calendar_names =
       option_of_yojson
         (value_for_key calendar_name_or_arn_list_of_yojson "CalendarNames")
         _list path;
     target_locations =
       option_of_yojson (value_for_key target_locations_of_yojson "TargetLocations") _list path;
     schedule_offset =
       option_of_yojson (value_for_key schedule_offset_of_yojson "ScheduleOffset") _list path;
     duration = option_of_yojson (value_for_key duration_of_yojson "Duration") _list path;
     target_maps = option_of_yojson (value_for_key target_maps_of_yojson "TargetMaps") _list path;
     association_dispatch_assume_role =
       option_of_yojson
         (value_for_key association_dispatch_assume_role_arn_of_yojson
            "AssociationDispatchAssumeRole")
         _list path;
   }
    : association_version_info)

let association_version_list_of_yojson tree path =
  list_of_yojson association_version_info_of_yojson tree path

let list_association_versions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_versions =
       option_of_yojson
         (value_for_key association_version_list_of_yojson "AssociationVersions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_association_versions_result)

let list_association_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id = value_for_key association_id_of_yojson "AssociationId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_association_versions_request)

let association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key document_ar_n_of_yojson "Name") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     association_id =
       option_of_yojson (value_for_key association_id_of_yojson "AssociationId") _list path;
     association_version =
       option_of_yojson
         (value_for_key association_version_of_yojson "AssociationVersion")
         _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     last_execution_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastExecutionDate") _list path;
     overview =
       option_of_yojson (value_for_key association_overview_of_yojson "Overview") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "ScheduleExpression")
         _list path;
     association_name =
       option_of_yojson (value_for_key association_name_of_yojson "AssociationName") _list path;
     schedule_offset =
       option_of_yojson (value_for_key schedule_offset_of_yojson "ScheduleOffset") _list path;
     duration = option_of_yojson (value_for_key duration_of_yojson "Duration") _list path;
     target_maps = option_of_yojson (value_for_key target_maps_of_yojson "TargetMaps") _list path;
   }
    : association)

let association_list_of_yojson tree path = list_of_yojson association_of_yojson tree path

let list_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associations =
       option_of_yojson (value_for_key association_list_of_yojson "Associations") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_associations_result)

let association_filter_value_of_yojson = string_of_yojson

let association_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "InstanceId" -> InstanceId
    | `String "Name" -> Name
    | `String "AssociationId" -> AssociationId
    | `String "AssociationStatusName" -> Status
    | `String "LastExecutedBefore" -> LastExecutedBefore
    | `String "LastExecutedAfter" -> LastExecutedAfter
    | `String "AssociationName" -> AssociationName
    | `String "ResourceGroupName" -> ResourceGroupName
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AssociationFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationFilterKey")
     : association_filter_key)
    : association_filter_key)

let association_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key association_filter_key_of_yojson "key" _list path;
     value = value_for_key association_filter_value_of_yojson "value" _list path;
   }
    : association_filter)

let association_filter_list_of_yojson tree path =
  list_of_yojson association_filter_of_yojson tree path

let list_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_filter_list =
       option_of_yojson
         (value_for_key association_filter_list_of_yojson "AssociationFilterList")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_associations_request)

let parameter_version_label_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : parameter_version_label_limit_exceeded)

let label_parameter_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invalid_labels =
       option_of_yojson (value_for_key parameter_label_list_of_yojson "InvalidLabels") _list path;
     parameter_version =
       option_of_yojson (value_for_key ps_parameter_version_of_yojson "ParameterVersion") _list path;
   }
    : label_parameter_version_result)

let label_parameter_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key ps_parameter_name_of_yojson "Name" _list path;
     parameter_version =
       option_of_yojson (value_for_key ps_parameter_version_of_yojson "ParameterVersion") _list path;
     labels = value_for_key parameter_label_list_of_yojson "Labels" _list path;
   }
    : label_parameter_version_request)

let get_service_setting_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_setting =
       option_of_yojson (value_for_key service_setting_of_yojson "ServiceSetting") _list path;
   }
    : get_service_setting_result)

let get_service_setting_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ setting_id = value_for_key service_setting_id_of_yojson "SettingId" _list path }
    : get_service_setting_request)

let get_resource_policies_response_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_id = option_of_yojson (value_for_key policy_id_of_yojson "PolicyId") _list path;
     policy_hash = option_of_yojson (value_for_key policy_hash_of_yojson "PolicyHash") _list path;
     policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path;
   }
    : get_resource_policies_response_entry)

let get_resource_policies_response_entries_of_yojson tree path =
  list_of_yojson get_resource_policies_response_entry_of_yojson tree path

let get_resource_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     policies =
       option_of_yojson
         (value_for_key get_resource_policies_response_entries_of_yojson "Policies")
         _list path;
   }
    : get_resource_policies_response)

let resource_policy_max_results_of_yojson = int_of_yojson

let get_resource_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key resource_policy_max_results_of_yojson "MaxResults")
         _list path;
   }
    : get_resource_policies_request)

let get_patch_baseline_for_patch_group_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_id = option_of_yojson (value_for_key baseline_id_of_yojson "BaselineId") _list path;
     patch_group = option_of_yojson (value_for_key patch_group_of_yojson "PatchGroup") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
   }
    : get_patch_baseline_for_patch_group_result)

let get_patch_baseline_for_patch_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     patch_group = value_for_key patch_group_of_yojson "PatchGroup" _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
   }
    : get_patch_baseline_for_patch_group_request)

let patch_group_list_of_yojson tree path = list_of_yojson patch_group_of_yojson tree path

let get_patch_baseline_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_id = option_of_yojson (value_for_key baseline_id_of_yojson "BaselineId") _list path;
     name = option_of_yojson (value_for_key baseline_name_of_yojson "Name") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     global_filters =
       option_of_yojson (value_for_key patch_filter_group_of_yojson "GlobalFilters") _list path;
     approval_rules =
       option_of_yojson (value_for_key patch_rule_group_of_yojson "ApprovalRules") _list path;
     approved_patches =
       option_of_yojson (value_for_key patch_id_list_of_yojson "ApprovedPatches") _list path;
     approved_patches_compliance_level =
       option_of_yojson
         (value_for_key patch_compliance_level_of_yojson "ApprovedPatchesComplianceLevel")
         _list path;
     approved_patches_enable_non_security =
       option_of_yojson
         (value_for_key boolean__of_yojson "ApprovedPatchesEnableNonSecurity")
         _list path;
     rejected_patches =
       option_of_yojson (value_for_key patch_id_list_of_yojson "RejectedPatches") _list path;
     rejected_patches_action =
       option_of_yojson (value_for_key patch_action_of_yojson "RejectedPatchesAction") _list path;
     patch_groups =
       option_of_yojson (value_for_key patch_group_list_of_yojson "PatchGroups") _list path;
     created_date = option_of_yojson (value_for_key date_time_of_yojson "CreatedDate") _list path;
     modified_date = option_of_yojson (value_for_key date_time_of_yojson "ModifiedDate") _list path;
     description =
       option_of_yojson (value_for_key baseline_description_of_yojson "Description") _list path;
     sources = option_of_yojson (value_for_key patch_source_list_of_yojson "Sources") _list path;
     available_security_updates_compliance_status =
       option_of_yojson
         (value_for_key patch_compliance_status_of_yojson "AvailableSecurityUpdatesComplianceStatus")
         _list path;
   }
    : get_patch_baseline_result)

let get_patch_baseline_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ baseline_id = value_for_key baseline_id_of_yojson "BaselineId" _list path }
    : get_patch_baseline_request)

let invalid_filter_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_filter_value)

let invalid_filter_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_filter_option)

let ps_parameter_selector_of_yojson = string_of_yojson

let parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key ps_parameter_name_of_yojson "Name") _list path;
     type_ = option_of_yojson (value_for_key parameter_type_of_yojson "Type") _list path;
     value = option_of_yojson (value_for_key ps_parameter_value_of_yojson "Value") _list path;
     version = option_of_yojson (value_for_key ps_parameter_version_of_yojson "Version") _list path;
     selector =
       option_of_yojson (value_for_key ps_parameter_selector_of_yojson "Selector") _list path;
     source_result = option_of_yojson (value_for_key string__of_yojson "SourceResult") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedDate") _list path;
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     data_type =
       option_of_yojson (value_for_key parameter_data_type_of_yojson "DataType") _list path;
   }
    : parameter)

let parameter_list_of_yojson tree path = list_of_yojson parameter_of_yojson tree path

let get_parameters_by_path_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameter_list_of_yojson "Parameters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_parameters_by_path_result)

let get_parameters_by_path_max_results_of_yojson = int_of_yojson
let parameter_string_filter_value_of_yojson = string_of_yojson

let parameter_string_filter_value_list_of_yojson tree path =
  list_of_yojson parameter_string_filter_value_of_yojson tree path

let parameter_string_query_option_of_yojson = string_of_yojson
let parameter_string_filter_key_of_yojson = string_of_yojson

let parameter_string_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key parameter_string_filter_key_of_yojson "Key" _list path;
     option_ =
       option_of_yojson (value_for_key parameter_string_query_option_of_yojson "Option") _list path;
     values =
       option_of_yojson
         (value_for_key parameter_string_filter_value_list_of_yojson "Values")
         _list path;
   }
    : parameter_string_filter)

let parameter_string_filter_list_of_yojson tree path =
  list_of_yojson parameter_string_filter_of_yojson tree path

let get_parameters_by_path_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     path = value_for_key ps_parameter_name_of_yojson "Path" _list path;
     recursive = option_of_yojson (value_for_key boolean__of_yojson "Recursive") _list path;
     parameter_filters =
       option_of_yojson
         (value_for_key parameter_string_filter_list_of_yojson "ParameterFilters")
         _list path;
     with_decryption =
       option_of_yojson (value_for_key boolean__of_yojson "WithDecryption") _list path;
     max_results =
       option_of_yojson
         (value_for_key get_parameters_by_path_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_parameters_by_path_request)

let parameter_name_list_of_yojson tree path = list_of_yojson ps_parameter_name_of_yojson tree path

let get_parameters_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameter_list_of_yojson "Parameters") _list path;
     invalid_parameters =
       option_of_yojson (value_for_key parameter_name_list_of_yojson "InvalidParameters") _list path;
   }
    : get_parameters_result)

let get_parameters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     names = value_for_key parameter_name_list_of_yojson "Names" _list path;
     with_decryption =
       option_of_yojson (value_for_key boolean__of_yojson "WithDecryption") _list path;
   }
    : get_parameters_request)

let parameter_inline_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_text = option_of_yojson (value_for_key string__of_yojson "PolicyText") _list path;
     policy_type = option_of_yojson (value_for_key string__of_yojson "PolicyType") _list path;
     policy_status = option_of_yojson (value_for_key string__of_yojson "PolicyStatus") _list path;
   }
    : parameter_inline_policy)

let parameter_policy_list_of_yojson tree path =
  list_of_yojson parameter_inline_policy_of_yojson tree path

let parameter_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key ps_parameter_name_of_yojson "Name") _list path;
     type_ = option_of_yojson (value_for_key parameter_type_of_yojson "Type") _list path;
     key_id = option_of_yojson (value_for_key parameter_key_id_of_yojson "KeyId") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedDate") _list path;
     last_modified_user =
       option_of_yojson (value_for_key string__of_yojson "LastModifiedUser") _list path;
     description =
       option_of_yojson (value_for_key parameter_description_of_yojson "Description") _list path;
     value = option_of_yojson (value_for_key ps_parameter_value_of_yojson "Value") _list path;
     allowed_pattern =
       option_of_yojson (value_for_key allowed_pattern_of_yojson "AllowedPattern") _list path;
     version = option_of_yojson (value_for_key ps_parameter_version_of_yojson "Version") _list path;
     labels = option_of_yojson (value_for_key parameter_label_list_of_yojson "Labels") _list path;
     tier = option_of_yojson (value_for_key parameter_tier_of_yojson "Tier") _list path;
     policies =
       option_of_yojson (value_for_key parameter_policy_list_of_yojson "Policies") _list path;
     data_type =
       option_of_yojson (value_for_key parameter_data_type_of_yojson "DataType") _list path;
   }
    : parameter_history)

let parameter_history_list_of_yojson tree path =
  list_of_yojson parameter_history_of_yojson tree path

let get_parameter_history_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters =
       option_of_yojson (value_for_key parameter_history_list_of_yojson "Parameters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_parameter_history_result)

let get_parameter_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key ps_parameter_name_of_yojson "Name" _list path;
     with_decryption =
       option_of_yojson (value_for_key boolean__of_yojson "WithDecryption") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_parameter_history_request)

let get_parameter_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ parameter = option_of_yojson (value_for_key parameter_of_yojson "Parameter") _list path }
    : get_parameter_result)

let get_parameter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key ps_parameter_name_of_yojson "Name" _list path;
     with_decryption =
       option_of_yojson (value_for_key boolean__of_yojson "WithDecryption") _list path;
   }
    : get_parameter_request)

let ops_entity_item_entry_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let ops_entity_item_entry_list_of_yojson tree path =
  list_of_yojson ops_entity_item_entry_of_yojson tree path

let ops_entity_item_capture_time_of_yojson = string_of_yojson

let ops_entity_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capture_time =
       option_of_yojson
         (value_for_key ops_entity_item_capture_time_of_yojson "CaptureTime")
         _list path;
     content =
       option_of_yojson (value_for_key ops_entity_item_entry_list_of_yojson "Content") _list path;
   }
    : ops_entity_item)

let ops_entity_item_key_of_yojson = string_of_yojson

let ops_entity_item_map_of_yojson tree path =
  map_of_yojson ops_entity_item_key_of_yojson ops_entity_item_of_yojson tree path

let ops_entity_id_of_yojson = string_of_yojson

let ops_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key ops_entity_id_of_yojson "Id") _list path;
     data = option_of_yojson (value_for_key ops_entity_item_map_of_yojson "Data") _list path;
   }
    : ops_entity)

let ops_entity_list_of_yojson tree path = list_of_yojson ops_entity_of_yojson tree path

let get_ops_summary_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = option_of_yojson (value_for_key ops_entity_list_of_yojson "Entities") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_ops_summary_result)

let ops_data_type_name_of_yojson = string_of_yojson

let ops_result_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ type_name = value_for_key ops_data_type_name_of_yojson "TypeName" _list path }
    : ops_result_attribute)

let ops_result_attribute_list_of_yojson tree path =
  list_of_yojson ops_result_attribute_of_yojson tree path

let ops_filter_operator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Equal" -> EQUAL
    | `String "NotEqual" -> NOT_EQUAL
    | `String "BeginWith" -> BEGIN_WITH
    | `String "LessThan" -> LESS_THAN
    | `String "GreaterThan" -> GREATER_THAN
    | `String "Exists" -> EXISTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OpsFilterOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsFilterOperatorType")
     : ops_filter_operator_type)
    : ops_filter_operator_type)

let ops_filter_value_of_yojson = string_of_yojson
let ops_filter_value_list_of_yojson tree path = list_of_yojson ops_filter_value_of_yojson tree path
let ops_filter_key_of_yojson = string_of_yojson

let ops_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key ops_filter_key_of_yojson "Key" _list path;
     values = value_for_key ops_filter_value_list_of_yojson "Values" _list path;
     type_ = option_of_yojson (value_for_key ops_filter_operator_type_of_yojson "Type") _list path;
   }
    : ops_filter)

let ops_filter_list_of_yojson tree path = list_of_yojson ops_filter_of_yojson tree path
let ops_aggregator_value_of_yojson = string_of_yojson
let ops_aggregator_value_key_of_yojson = string_of_yojson

let ops_aggregator_value_map_of_yojson tree path =
  map_of_yojson ops_aggregator_value_key_of_yojson ops_aggregator_value_of_yojson tree path

let ops_data_attribute_name_of_yojson = string_of_yojson
let ops_aggregator_type_of_yojson = string_of_yojson

let rec ops_aggregator_list_of_yojson tree path = list_of_yojson ops_aggregator_of_yojson tree path

and ops_aggregator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregator_type =
       option_of_yojson (value_for_key ops_aggregator_type_of_yojson "AggregatorType") _list path;
     type_name = option_of_yojson (value_for_key ops_data_type_name_of_yojson "TypeName") _list path;
     attribute_name =
       option_of_yojson (value_for_key ops_data_attribute_name_of_yojson "AttributeName") _list path;
     values =
       option_of_yojson (value_for_key ops_aggregator_value_map_of_yojson "Values") _list path;
     filters = option_of_yojson (value_for_key ops_filter_list_of_yojson "Filters") _list path;
     aggregators =
       option_of_yojson (value_for_key ops_aggregator_list_of_yojson "Aggregators") _list path;
   }
    : ops_aggregator)

let get_ops_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_name =
       option_of_yojson (value_for_key resource_data_sync_name_of_yojson "SyncName") _list path;
     filters = option_of_yojson (value_for_key ops_filter_list_of_yojson "Filters") _list path;
     aggregators =
       option_of_yojson (value_for_key ops_aggregator_list_of_yojson "Aggregators") _list path;
     result_attributes =
       option_of_yojson
         (value_for_key ops_result_attribute_list_of_yojson "ResultAttributes")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : get_ops_summary_request)

let get_ops_metadata_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       option_of_yojson (value_for_key ops_metadata_resource_id_of_yojson "ResourceId") _list path;
     metadata = option_of_yojson (value_for_key metadata_map_of_yojson "Metadata") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_ops_metadata_result)

let get_ops_metadata_max_results_of_yojson = int_of_yojson

let get_ops_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_metadata_arn = value_for_key ops_metadata_arn_of_yojson "OpsMetadataArn" _list path;
     max_results =
       option_of_yojson
         (value_for_key get_ops_metadata_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_ops_metadata_request)

let ops_item_source_of_yojson = string_of_yojson
let ops_item_type_of_yojson = string_of_yojson

let ops_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_by = option_of_yojson (value_for_key string__of_yojson "CreatedBy") _list path;
     ops_item_type =
       option_of_yojson (value_for_key ops_item_type_of_yojson "OpsItemType") _list path;
     created_time = option_of_yojson (value_for_key date_time_of_yojson "CreatedTime") _list path;
     description =
       option_of_yojson (value_for_key ops_item_description_of_yojson "Description") _list path;
     last_modified_by =
       option_of_yojson (value_for_key string__of_yojson "LastModifiedBy") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
     notifications =
       option_of_yojson (value_for_key ops_item_notifications_of_yojson "Notifications") _list path;
     priority = option_of_yojson (value_for_key ops_item_priority_of_yojson "Priority") _list path;
     related_ops_items =
       option_of_yojson (value_for_key related_ops_items_of_yojson "RelatedOpsItems") _list path;
     status = option_of_yojson (value_for_key ops_item_status_of_yojson "Status") _list path;
     ops_item_id = option_of_yojson (value_for_key ops_item_id_of_yojson "OpsItemId") _list path;
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     title = option_of_yojson (value_for_key ops_item_title_of_yojson "Title") _list path;
     source = option_of_yojson (value_for_key ops_item_source_of_yojson "Source") _list path;
     operational_data =
       option_of_yojson
         (value_for_key ops_item_operational_data_of_yojson "OperationalData")
         _list path;
     category = option_of_yojson (value_for_key ops_item_category_of_yojson "Category") _list path;
     severity = option_of_yojson (value_for_key ops_item_severity_of_yojson "Severity") _list path;
     actual_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "ActualStartTime") _list path;
     actual_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "ActualEndTime") _list path;
     planned_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "PlannedStartTime") _list path;
     planned_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "PlannedEndTime") _list path;
     ops_item_arn = option_of_yojson (value_for_key ops_item_arn_of_yojson "OpsItemArn") _list path;
   }
    : ops_item)

let get_ops_item_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ops_item = option_of_yojson (value_for_key ops_item_of_yojson "OpsItem") _list path }
    : get_ops_item_response)

let get_ops_item_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_item_id = value_for_key ops_item_id_of_yojson "OpsItemId" _list path;
     ops_item_arn = option_of_yojson (value_for_key ops_item_arn_of_yojson "OpsItemArn") _list path;
   }
    : get_ops_item_request)

let get_maintenance_window_task_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     window_task_id =
       option_of_yojson
         (value_for_key maintenance_window_task_id_of_yojson "WindowTaskId")
         _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     task_arn =
       option_of_yojson (value_for_key maintenance_window_task_arn_of_yojson "TaskArn") _list path;
     service_role_arn =
       option_of_yojson (value_for_key service_role_of_yojson "ServiceRoleArn") _list path;
     task_type =
       option_of_yojson (value_for_key maintenance_window_task_type_of_yojson "TaskType") _list path;
     task_parameters =
       option_of_yojson
         (value_for_key maintenance_window_task_parameters_of_yojson "TaskParameters")
         _list path;
     task_invocation_parameters =
       option_of_yojson
         (value_for_key maintenance_window_task_invocation_parameters_of_yojson
            "TaskInvocationParameters")
         _list path;
     priority =
       option_of_yojson
         (value_for_key maintenance_window_task_priority_of_yojson "Priority")
         _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     logging_info = option_of_yojson (value_for_key logging_info_of_yojson "LoggingInfo") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     cutoff_behavior =
       option_of_yojson
         (value_for_key maintenance_window_task_cutoff_behavior_of_yojson "CutoffBehavior")
         _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
   }
    : get_maintenance_window_task_result)

let get_maintenance_window_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path;
     window_task_id = value_for_key maintenance_window_task_id_of_yojson "WindowTaskId" _list path;
   }
    : get_maintenance_window_task_request)

let maintenance_window_task_target_id_of_yojson = string_of_yojson
let maintenance_window_execution_status_details_of_yojson = string_of_yojson

let maintenance_window_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> Pending
    | `String "IN_PROGRESS" -> InProgress
    | `String "SUCCESS" -> Success
    | `String "FAILED" -> Failed
    | `String "TIMED_OUT" -> TimedOut
    | `String "CANCELLING" -> Cancelling
    | `String "CANCELLED" -> Cancelled
    | `String "SKIPPED_OVERLAPPING" -> SkippedOverlapping
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MaintenanceWindowExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MaintenanceWindowExecutionStatus")
     : maintenance_window_execution_status)
    : maintenance_window_execution_status)

let maintenance_window_execution_task_invocation_parameters_of_yojson = string_of_yojson
let maintenance_window_execution_task_execution_id_of_yojson = string_of_yojson
let maintenance_window_execution_task_invocation_id_of_yojson = string_of_yojson
let maintenance_window_execution_task_id_of_yojson = string_of_yojson
let maintenance_window_execution_id_of_yojson = string_of_yojson

let get_maintenance_window_execution_task_invocation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId")
         _list path;
     task_execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_id_of_yojson "TaskExecutionId")
         _list path;
     invocation_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_invocation_id_of_yojson "InvocationId")
         _list path;
     execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_execution_id_of_yojson "ExecutionId")
         _list path;
     task_type =
       option_of_yojson (value_for_key maintenance_window_task_type_of_yojson "TaskType") _list path;
     parameters =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_invocation_parameters_of_yojson
            "Parameters")
         _list path;
     status =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_of_yojson "Status")
         _list path;
     status_details =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_details_of_yojson "StatusDetails")
         _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     owner_information =
       option_of_yojson (value_for_key owner_information_of_yojson "OwnerInformation") _list path;
     window_target_id =
       option_of_yojson
         (value_for_key maintenance_window_task_target_id_of_yojson "WindowTargetId")
         _list path;
   }
    : get_maintenance_window_execution_task_invocation_result)

let get_maintenance_window_execution_task_invocation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId" _list path;
     task_id = value_for_key maintenance_window_execution_task_id_of_yojson "TaskId" _list path;
     invocation_id =
       value_for_key maintenance_window_execution_task_invocation_id_of_yojson "InvocationId" _list
         path;
   }
    : get_maintenance_window_execution_task_invocation_request)

let maintenance_window_task_parameters_list_of_yojson tree path =
  list_of_yojson maintenance_window_task_parameters_of_yojson tree path

let get_maintenance_window_execution_task_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId")
         _list path;
     task_execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_id_of_yojson "TaskExecutionId")
         _list path;
     task_arn =
       option_of_yojson (value_for_key maintenance_window_task_arn_of_yojson "TaskArn") _list path;
     service_role = option_of_yojson (value_for_key service_role_of_yojson "ServiceRole") _list path;
     type_ =
       option_of_yojson (value_for_key maintenance_window_task_type_of_yojson "Type") _list path;
     task_parameters =
       option_of_yojson
         (value_for_key maintenance_window_task_parameters_list_of_yojson "TaskParameters")
         _list path;
     priority =
       option_of_yojson
         (value_for_key maintenance_window_task_priority_of_yojson "Priority")
         _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     status =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_of_yojson "Status")
         _list path;
     status_details =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_details_of_yojson "StatusDetails")
         _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
     triggered_alarms =
       option_of_yojson
         (value_for_key alarm_state_information_list_of_yojson "TriggeredAlarms")
         _list path;
   }
    : get_maintenance_window_execution_task_result)

let get_maintenance_window_execution_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId" _list path;
     task_id = value_for_key maintenance_window_execution_task_id_of_yojson "TaskId" _list path;
   }
    : get_maintenance_window_execution_task_request)

let maintenance_window_execution_task_id_list_of_yojson tree path =
  list_of_yojson maintenance_window_execution_task_id_of_yojson tree path

let get_maintenance_window_execution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId")
         _list path;
     task_ids =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_id_list_of_yojson "TaskIds")
         _list path;
     status =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_of_yojson "Status")
         _list path;
     status_details =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_details_of_yojson "StatusDetails")
         _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
   }
    : get_maintenance_window_execution_result)

let get_maintenance_window_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId" _list path;
   }
    : get_maintenance_window_execution_request)

let get_maintenance_window_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     start_date =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "StartDate")
         _list path;
     end_date =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "EndDate")
         _list path;
     schedule =
       option_of_yojson (value_for_key maintenance_window_schedule_of_yojson "Schedule") _list path;
     schedule_timezone =
       option_of_yojson
         (value_for_key maintenance_window_timezone_of_yojson "ScheduleTimezone")
         _list path;
     schedule_offset =
       option_of_yojson
         (value_for_key maintenance_window_offset_of_yojson "ScheduleOffset")
         _list path;
     next_execution_time =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "NextExecutionTime")
         _list path;
     duration =
       option_of_yojson
         (value_for_key maintenance_window_duration_hours_of_yojson "Duration")
         _list path;
     cutoff =
       option_of_yojson (value_for_key maintenance_window_cutoff_of_yojson "Cutoff") _list path;
     allow_unassociated_targets =
       option_of_yojson
         (value_for_key maintenance_window_allow_unassociated_targets_of_yojson
            "AllowUnassociatedTargets")
         _list path;
     enabled =
       option_of_yojson (value_for_key maintenance_window_enabled_of_yojson "Enabled") _list path;
     created_date = option_of_yojson (value_for_key date_time_of_yojson "CreatedDate") _list path;
     modified_date = option_of_yojson (value_for_key date_time_of_yojson "ModifiedDate") _list path;
   }
    : get_maintenance_window_result)

let get_maintenance_window_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path }
    : get_maintenance_window_request)

let inventory_type_display_name_of_yojson = string_of_yojson

let inventory_attribute_data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "string" -> STRING
    | `String "number" -> NUMBER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InventoryAttributeDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "InventoryAttributeDataType")
     : inventory_attribute_data_type)
    : inventory_attribute_data_type)

let inventory_item_attribute_name_of_yojson = string_of_yojson

let inventory_item_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key inventory_item_attribute_name_of_yojson "Name" _list path;
     data_type = value_for_key inventory_attribute_data_type_of_yojson "DataType" _list path;
   }
    : inventory_item_attribute)

let inventory_item_attribute_list_of_yojson tree path =
  list_of_yojson inventory_item_attribute_of_yojson tree path

let inventory_item_schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = value_for_key inventory_item_type_name_of_yojson "TypeName" _list path;
     version =
       option_of_yojson (value_for_key inventory_item_schema_version_of_yojson "Version") _list path;
     attributes = value_for_key inventory_item_attribute_list_of_yojson "Attributes" _list path;
     display_name =
       option_of_yojson
         (value_for_key inventory_type_display_name_of_yojson "DisplayName")
         _list path;
   }
    : inventory_item_schema)

let inventory_item_schema_result_list_of_yojson tree path =
  list_of_yojson inventory_item_schema_of_yojson tree path

let get_inventory_schema_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schemas =
       option_of_yojson
         (value_for_key inventory_item_schema_result_list_of_yojson "Schemas")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_inventory_schema_result)

let is_sub_type_schema_of_yojson = bool_of_yojson
let get_inventory_schema_max_results_of_yojson = int_of_yojson
let inventory_item_type_name_filter_of_yojson = string_of_yojson

let get_inventory_schema_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name =
       option_of_yojson
         (value_for_key inventory_item_type_name_filter_of_yojson "TypeName")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key get_inventory_schema_max_results_of_yojson "MaxResults")
         _list path;
     aggregator =
       option_of_yojson (value_for_key aggregator_schema_only_of_yojson "Aggregator") _list path;
     sub_type = option_of_yojson (value_for_key is_sub_type_schema_of_yojson "SubType") _list path;
   }
    : get_inventory_schema_request)

let invalid_result_attribute_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_result_attribute_exception)

let invalid_inventory_group_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_inventory_group_exception)

let inventory_result_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = value_for_key inventory_item_type_name_of_yojson "TypeName" _list path;
     schema_version =
       value_for_key inventory_item_schema_version_of_yojson "SchemaVersion" _list path;
     capture_time =
       option_of_yojson
         (value_for_key inventory_item_capture_time_of_yojson "CaptureTime")
         _list path;
     content_hash =
       option_of_yojson
         (value_for_key inventory_item_content_hash_of_yojson "ContentHash")
         _list path;
     content = value_for_key inventory_item_entry_list_of_yojson "Content" _list path;
   }
    : inventory_result_item)

let inventory_result_item_key_of_yojson = string_of_yojson

let inventory_result_item_map_of_yojson tree path =
  map_of_yojson inventory_result_item_key_of_yojson inventory_result_item_of_yojson tree path

let inventory_result_entity_id_of_yojson = string_of_yojson

let inventory_result_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key inventory_result_entity_id_of_yojson "Id") _list path;
     data = option_of_yojson (value_for_key inventory_result_item_map_of_yojson "Data") _list path;
   }
    : inventory_result_entity)

let inventory_result_entity_list_of_yojson tree path =
  list_of_yojson inventory_result_entity_of_yojson tree path

let get_inventory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities =
       option_of_yojson (value_for_key inventory_result_entity_list_of_yojson "Entities") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_inventory_result)

let result_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ type_name = value_for_key inventory_item_type_name_of_yojson "TypeName" _list path }
    : result_attribute)

let result_attribute_list_of_yojson tree path = list_of_yojson result_attribute_of_yojson tree path
let inventory_group_name_of_yojson = string_of_yojson

let inventory_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key inventory_group_name_of_yojson "Name" _list path;
     filters = value_for_key inventory_filter_list_of_yojson "Filters" _list path;
   }
    : inventory_group)

let inventory_group_list_of_yojson tree path = list_of_yojson inventory_group_of_yojson tree path
let inventory_aggregator_expression_of_yojson = string_of_yojson

let rec inventory_aggregator_list_of_yojson tree path =
  list_of_yojson inventory_aggregator_of_yojson tree path

and inventory_aggregator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expression =
       option_of_yojson
         (value_for_key inventory_aggregator_expression_of_yojson "Expression")
         _list path;
     aggregators =
       option_of_yojson (value_for_key inventory_aggregator_list_of_yojson "Aggregators") _list path;
     groups = option_of_yojson (value_for_key inventory_group_list_of_yojson "Groups") _list path;
   }
    : inventory_aggregator)

let get_inventory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key inventory_filter_list_of_yojson "Filters") _list path;
     aggregators =
       option_of_yojson (value_for_key inventory_aggregator_list_of_yojson "Aggregators") _list path;
     result_attributes =
       option_of_yojson
         (value_for_key result_attribute_list_of_yojson "ResultAttributes")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : get_inventory_request)

let target_preview_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     count = option_of_yojson (value_for_key integer_of_yojson "Count") _list path;
     target_type = option_of_yojson (value_for_key string__of_yojson "TargetType") _list path;
   }
    : target_preview)

let target_preview_list_of_yojson tree path = list_of_yojson target_preview_of_yojson tree path
let region_list_of_yojson tree path = list_of_yojson region_of_yojson tree path

let impact_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Mutating" -> MUTATING
    | `String "NonMutating" -> NON_MUTATING
    | `String "Undetermined" -> UNDETERMINED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImpactType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImpactType")
     : impact_type)
    : impact_type)

let step_preview_map_of_yojson tree path =
  map_of_yojson impact_type_of_yojson integer_of_yojson tree path

let automation_execution_preview_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     step_previews =
       option_of_yojson (value_for_key step_preview_map_of_yojson "StepPreviews") _list path;
     regions = option_of_yojson (value_for_key region_list_of_yojson "Regions") _list path;
     target_previews =
       option_of_yojson (value_for_key target_preview_list_of_yojson "TargetPreviews") _list path;
     total_accounts = option_of_yojson (value_for_key integer_of_yojson "TotalAccounts") _list path;
   }
    : automation_execution_preview)

let execution_preview_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Automation" -> Automation (automation_execution_preview_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ExecutionPreview" unknown)
    : execution_preview)

let execution_preview_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending" -> PENDING
    | `String "InProgress" -> IN_PROGRESS
    | `String "Success" -> SUCCESS
    | `String "Failed" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExecutionPreviewStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionPreviewStatus")
     : execution_preview_status)
    : execution_preview_status)

let get_execution_preview_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_preview_id =
       option_of_yojson
         (value_for_key execution_preview_id_of_yojson "ExecutionPreviewId")
         _list path;
     ended_at = option_of_yojson (value_for_key date_time_of_yojson "EndedAt") _list path;
     status =
       option_of_yojson (value_for_key execution_preview_status_of_yojson "Status") _list path;
     status_message = option_of_yojson (value_for_key string__of_yojson "StatusMessage") _list path;
     execution_preview =
       option_of_yojson (value_for_key execution_preview_of_yojson "ExecutionPreview") _list path;
   }
    : get_execution_preview_response)

let get_execution_preview_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_preview_id =
       value_for_key execution_preview_id_of_yojson "ExecutionPreviewId" _list path;
   }
    : get_execution_preview_request)

let attachment_url_of_yojson = string_of_yojson

let attachment_hash_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Sha256" -> SHA256
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttachmentHashType" value)
    | _ -> raise (deserialize_wrong_type_error path "AttachmentHashType")
     : attachment_hash_type)
    : attachment_hash_type)

let attachment_hash_of_yojson = string_of_yojson
let content_length_of_yojson = long_of_yojson

let attachment_content_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key attachment_name_of_yojson "Name") _list path;
     size = option_of_yojson (value_for_key content_length_of_yojson "Size") _list path;
     hash = option_of_yojson (value_for_key attachment_hash_of_yojson "Hash") _list path;
     hash_type =
       option_of_yojson (value_for_key attachment_hash_type_of_yojson "HashType") _list path;
     url = option_of_yojson (value_for_key attachment_url_of_yojson "Url") _list path;
   }
    : attachment_content)

let attachment_content_list_of_yojson tree path =
  list_of_yojson attachment_content_of_yojson tree path

let get_document_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key document_ar_n_of_yojson "Name") _list path;
     created_date = option_of_yojson (value_for_key date_time_of_yojson "CreatedDate") _list path;
     display_name =
       option_of_yojson (value_for_key document_display_name_of_yojson "DisplayName") _list path;
     version_name =
       option_of_yojson (value_for_key document_version_name_of_yojson "VersionName") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     status = option_of_yojson (value_for_key document_status_of_yojson "Status") _list path;
     status_information =
       option_of_yojson
         (value_for_key document_status_information_of_yojson "StatusInformation")
         _list path;
     content = option_of_yojson (value_for_key document_content_of_yojson "Content") _list path;
     document_type =
       option_of_yojson (value_for_key document_type_of_yojson "DocumentType") _list path;
     document_format =
       option_of_yojson (value_for_key document_format_of_yojson "DocumentFormat") _list path;
     requires =
       option_of_yojson (value_for_key document_requires_list_of_yojson "Requires") _list path;
     attachments_content =
       option_of_yojson
         (value_for_key attachment_content_list_of_yojson "AttachmentsContent")
         _list path;
     review_status =
       option_of_yojson (value_for_key review_status_of_yojson "ReviewStatus") _list path;
   }
    : get_document_result)

let get_document_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_ar_n_of_yojson "Name" _list path;
     version_name =
       option_of_yojson (value_for_key document_version_name_of_yojson "VersionName") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     document_format =
       option_of_yojson (value_for_key document_format_of_yojson "DocumentFormat") _list path;
   }
    : get_document_request)

let unsupported_operating_system_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : unsupported_operating_system)

let unsupported_feature_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : unsupported_feature_required_exception)

let product_of_yojson = string_of_yojson
let snapshot_download_url_of_yojson = string_of_yojson
let snapshot_id_of_yojson = string_of_yojson

let get_deployable_patch_snapshot_for_instance_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path;
     snapshot_download_url =
       option_of_yojson
         (value_for_key snapshot_download_url_of_yojson "SnapshotDownloadUrl")
         _list path;
     product = option_of_yojson (value_for_key product_of_yojson "Product") _list path;
   }
    : get_deployable_patch_snapshot_for_instance_result)

let baseline_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     global_filters =
       option_of_yojson (value_for_key patch_filter_group_of_yojson "GlobalFilters") _list path;
     approval_rules =
       option_of_yojson (value_for_key patch_rule_group_of_yojson "ApprovalRules") _list path;
     approved_patches =
       option_of_yojson (value_for_key patch_id_list_of_yojson "ApprovedPatches") _list path;
     approved_patches_compliance_level =
       option_of_yojson
         (value_for_key patch_compliance_level_of_yojson "ApprovedPatchesComplianceLevel")
         _list path;
     rejected_patches =
       option_of_yojson (value_for_key patch_id_list_of_yojson "RejectedPatches") _list path;
     rejected_patches_action =
       option_of_yojson (value_for_key patch_action_of_yojson "RejectedPatchesAction") _list path;
     approved_patches_enable_non_security =
       option_of_yojson
         (value_for_key boolean__of_yojson "ApprovedPatchesEnableNonSecurity")
         _list path;
     sources = option_of_yojson (value_for_key patch_source_list_of_yojson "Sources") _list path;
     available_security_updates_compliance_status =
       option_of_yojson
         (value_for_key patch_compliance_status_of_yojson "AvailableSecurityUpdatesComplianceStatus")
         _list path;
   }
    : baseline_override)

let get_deployable_patch_snapshot_for_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
     snapshot_id = value_for_key snapshot_id_of_yojson "SnapshotId" _list path;
     baseline_override =
       option_of_yojson (value_for_key baseline_override_of_yojson "BaselineOverride") _list path;
     use_s3_dual_stack_endpoint =
       option_of_yojson (value_for_key boolean__of_yojson "UseS3DualStackEndpoint") _list path;
   }
    : get_deployable_patch_snapshot_for_instance_request)

let get_default_patch_baseline_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_id = option_of_yojson (value_for_key baseline_id_of_yojson "BaselineId") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
   }
    : get_default_patch_baseline_result)

let get_default_patch_baseline_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
   }
    : get_default_patch_baseline_request)

let connection_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "connected" -> CONNECTED
    | `String "notconnected" -> NOT_CONNECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionStatus")
     : connection_status)
    : connection_status)

let get_connection_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target = option_of_yojson (value_for_key session_target_of_yojson "Target") _list path;
     status = option_of_yojson (value_for_key connection_status_of_yojson "Status") _list path;
   }
    : get_connection_status_response)

let get_connection_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ target = value_for_key session_target_of_yojson "Target" _list path }
    : get_connection_status_request)

let invocation_does_not_exist_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let invalid_plugin_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let standard_error_content_of_yojson = string_of_yojson
let standard_output_content_of_yojson = string_of_yojson
let string_date_time_of_yojson = string_of_yojson

let get_command_invocation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command_id = option_of_yojson (value_for_key command_id_of_yojson "CommandId") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     comment = option_of_yojson (value_for_key comment_of_yojson "Comment") _list path;
     document_name =
       option_of_yojson (value_for_key document_name_of_yojson "DocumentName") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     plugin_name =
       option_of_yojson (value_for_key command_plugin_name_of_yojson "PluginName") _list path;
     response_code =
       option_of_yojson (value_for_key response_code_of_yojson "ResponseCode") _list path;
     execution_start_date_time =
       option_of_yojson
         (value_for_key string_date_time_of_yojson "ExecutionStartDateTime")
         _list path;
     execution_elapsed_time =
       option_of_yojson (value_for_key string_date_time_of_yojson "ExecutionElapsedTime") _list path;
     execution_end_date_time =
       option_of_yojson (value_for_key string_date_time_of_yojson "ExecutionEndDateTime") _list path;
     status =
       option_of_yojson (value_for_key command_invocation_status_of_yojson "Status") _list path;
     status_details =
       option_of_yojson (value_for_key status_details_of_yojson "StatusDetails") _list path;
     standard_output_content =
       option_of_yojson
         (value_for_key standard_output_content_of_yojson "StandardOutputContent")
         _list path;
     standard_output_url =
       option_of_yojson (value_for_key url_of_yojson "StandardOutputUrl") _list path;
     standard_error_content =
       option_of_yojson
         (value_for_key standard_error_content_of_yojson "StandardErrorContent")
         _list path;
     standard_error_url =
       option_of_yojson (value_for_key url_of_yojson "StandardErrorUrl") _list path;
     cloud_watch_output_config =
       option_of_yojson
         (value_for_key cloud_watch_output_config_of_yojson "CloudWatchOutputConfig")
         _list path;
   }
    : get_command_invocation_result)

let get_command_invocation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command_id = value_for_key command_id_of_yojson "CommandId" _list path;
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
     plugin_name =
       option_of_yojson (value_for_key command_plugin_name_of_yojson "PluginName") _list path;
   }
    : get_command_invocation_request)

let unsupported_calendar_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : unsupported_calendar_exception)

let invalid_document_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_document_type)

let iso8601_string_of_yojson = string_of_yojson

let calendar_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPEN" -> OPEN
    | `String "CLOSED" -> CLOSED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CalendarState" value)
    | _ -> raise (deserialize_wrong_type_error path "CalendarState")
     : calendar_state)
    : calendar_state)

let get_calendar_state_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key calendar_state_of_yojson "State") _list path;
     at_time = option_of_yojson (value_for_key iso8601_string_of_yojson "AtTime") _list path;
     next_transition_time =
       option_of_yojson (value_for_key iso8601_string_of_yojson "NextTransitionTime") _list path;
   }
    : get_calendar_state_response)

let get_calendar_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     calendar_names = value_for_key calendar_name_or_arn_list_of_yojson "CalendarNames" _list path;
     at_time = option_of_yojson (value_for_key iso8601_string_of_yojson "AtTime") _list path;
   }
    : get_calendar_state_request)

let automation_subtype_of_yojson (tree : t) path =
  ((match tree with
    | `String "ChangeRequest" -> ChangeRequest
    | `String "AccessRequest" -> AccessRequest
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutomationSubtype" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationSubtype")
     : automation_subtype)
    : automation_subtype)

let progress_counters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_steps = option_of_yojson (value_for_key integer_of_yojson "TotalSteps") _list path;
     success_steps = option_of_yojson (value_for_key integer_of_yojson "SuccessSteps") _list path;
     failed_steps = option_of_yojson (value_for_key integer_of_yojson "FailedSteps") _list path;
     cancelled_steps =
       option_of_yojson (value_for_key integer_of_yojson "CancelledSteps") _list path;
     timed_out_steps = option_of_yojson (value_for_key integer_of_yojson "TimedOutSteps") _list path;
   }
    : progress_counters)

let target_parameter_list_of_yojson tree path = list_of_yojson parameter_value_of_yojson tree path

let resolved_targets_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_values =
       option_of_yojson (value_for_key target_parameter_list_of_yojson "ParameterValues") _list path;
     truncated = option_of_yojson (value_for_key boolean__of_yojson "Truncated") _list path;
   }
    : resolved_targets)

let automation_action_name_of_yojson = string_of_yojson

let parent_step_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     step_execution_id =
       option_of_yojson (value_for_key string__of_yojson "StepExecutionId") _list path;
     step_name = option_of_yojson (value_for_key string__of_yojson "StepName") _list path;
     action = option_of_yojson (value_for_key automation_action_name_of_yojson "Action") _list path;
     iteration = option_of_yojson (value_for_key integer_of_yojson "Iteration") _list path;
     iterator_value = option_of_yojson (value_for_key string__of_yojson "IteratorValue") _list path;
   }
    : parent_step_details)

let valid_next_step_of_yojson = string_of_yojson
let valid_next_step_list_of_yojson tree path = list_of_yojson valid_next_step_of_yojson tree path

let failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_stage = option_of_yojson (value_for_key string__of_yojson "FailureStage") _list path;
     failure_type = option_of_yojson (value_for_key string__of_yojson "FailureType") _list path;
     details =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Details") _list path;
   }
    : failure_details)

let normal_string_map_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let automation_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending" -> PENDING
    | `String "InProgress" -> INPROGRESS
    | `String "Waiting" -> WAITING
    | `String "Success" -> SUCCESS
    | `String "TimedOut" -> TIMEDOUT
    | `String "Cancelling" -> CANCELLING
    | `String "Cancelled" -> CANCELLED
    | `String "Failed" -> FAILED
    | `String "PendingApproval" -> PENDING_APPROVAL
    | `String "Approved" -> APPROVED
    | `String "Rejected" -> REJECTED
    | `String "Scheduled" -> SCHEDULED
    | `String "RunbookInProgress" -> RUNBOOK_INPROGRESS
    | `String "PendingChangeCalendarOverride" -> PENDING_CHANGE_CALENDAR_OVERRIDE
    | `String "ChangeCalendarOverrideApproved" -> CHANGE_CALENDAR_OVERRIDE_APPROVED
    | `String "ChangeCalendarOverrideRejected" -> CHANGE_CALENDAR_OVERRIDE_REJECTED
    | `String "CompletedWithSuccess" -> COMPLETED_WITH_SUCCESS
    | `String "CompletedWithFailure" -> COMPLETED_WITH_FAILURE
    | `String "Exited" -> EXITED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutomationExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationExecutionStatus")
     : automation_execution_status)
    : automation_execution_status)

let long_of_yojson = long_of_yojson

let step_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     step_name = option_of_yojson (value_for_key string__of_yojson "StepName") _list path;
     action = option_of_yojson (value_for_key automation_action_name_of_yojson "Action") _list path;
     timeout_seconds = option_of_yojson (value_for_key long_of_yojson "TimeoutSeconds") _list path;
     on_failure = option_of_yojson (value_for_key string__of_yojson "OnFailure") _list path;
     max_attempts = option_of_yojson (value_for_key integer_of_yojson "MaxAttempts") _list path;
     execution_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "ExecutionStartTime") _list path;
     execution_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "ExecutionEndTime") _list path;
     step_status =
       option_of_yojson
         (value_for_key automation_execution_status_of_yojson "StepStatus")
         _list path;
     response_code = option_of_yojson (value_for_key string__of_yojson "ResponseCode") _list path;
     inputs = option_of_yojson (value_for_key normal_string_map_of_yojson "Inputs") _list path;
     outputs =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Outputs") _list path;
     response = option_of_yojson (value_for_key string__of_yojson "Response") _list path;
     failure_message =
       option_of_yojson (value_for_key string__of_yojson "FailureMessage") _list path;
     failure_details =
       option_of_yojson (value_for_key failure_details_of_yojson "FailureDetails") _list path;
     step_execution_id =
       option_of_yojson (value_for_key string__of_yojson "StepExecutionId") _list path;
     overridden_parameters =
       option_of_yojson
         (value_for_key automation_parameter_map_of_yojson "OverriddenParameters")
         _list path;
     is_end = option_of_yojson (value_for_key boolean__of_yojson "IsEnd") _list path;
     next_step = option_of_yojson (value_for_key string__of_yojson "NextStep") _list path;
     is_critical = option_of_yojson (value_for_key boolean__of_yojson "IsCritical") _list path;
     valid_next_steps =
       option_of_yojson (value_for_key valid_next_step_list_of_yojson "ValidNextSteps") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     target_location =
       option_of_yojson (value_for_key target_location_of_yojson "TargetLocation") _list path;
     triggered_alarms =
       option_of_yojson
         (value_for_key alarm_state_information_list_of_yojson "TriggeredAlarms")
         _list path;
     parent_step_details =
       option_of_yojson (value_for_key parent_step_details_of_yojson "ParentStepDetails") _list path;
   }
    : step_execution)

let step_execution_list_of_yojson tree path = list_of_yojson step_execution_of_yojson tree path

let automation_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_execution_id =
       option_of_yojson
         (value_for_key automation_execution_id_of_yojson "AutomationExecutionId")
         _list path;
     document_name =
       option_of_yojson (value_for_key document_name_of_yojson "DocumentName") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     execution_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "ExecutionStartTime") _list path;
     execution_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "ExecutionEndTime") _list path;
     automation_execution_status =
       option_of_yojson
         (value_for_key automation_execution_status_of_yojson "AutomationExecutionStatus")
         _list path;
     step_executions =
       option_of_yojson (value_for_key step_execution_list_of_yojson "StepExecutions") _list path;
     step_executions_truncated =
       option_of_yojson (value_for_key boolean__of_yojson "StepExecutionsTruncated") _list path;
     parameters =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Parameters") _list path;
     outputs =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Outputs") _list path;
     failure_message =
       option_of_yojson (value_for_key string__of_yojson "FailureMessage") _list path;
     mode = option_of_yojson (value_for_key execution_mode_of_yojson "Mode") _list path;
     parent_automation_execution_id =
       option_of_yojson
         (value_for_key automation_execution_id_of_yojson "ParentAutomationExecutionId")
         _list path;
     executed_by = option_of_yojson (value_for_key string__of_yojson "ExecutedBy") _list path;
     current_step_name =
       option_of_yojson (value_for_key string__of_yojson "CurrentStepName") _list path;
     current_action = option_of_yojson (value_for_key string__of_yojson "CurrentAction") _list path;
     target_parameter_name =
       option_of_yojson
         (value_for_key automation_parameter_key_of_yojson "TargetParameterName")
         _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     target_maps = option_of_yojson (value_for_key target_maps_of_yojson "TargetMaps") _list path;
     resolved_targets =
       option_of_yojson (value_for_key resolved_targets_of_yojson "ResolvedTargets") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     target = option_of_yojson (value_for_key string__of_yojson "Target") _list path;
     target_locations =
       option_of_yojson (value_for_key target_locations_of_yojson "TargetLocations") _list path;
     progress_counters =
       option_of_yojson (value_for_key progress_counters_of_yojson "ProgressCounters") _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
     triggered_alarms =
       option_of_yojson
         (value_for_key alarm_state_information_list_of_yojson "TriggeredAlarms")
         _list path;
     target_locations_ur_l =
       option_of_yojson
         (value_for_key target_locations_ur_l_of_yojson "TargetLocationsURL")
         _list path;
     automation_subtype =
       option_of_yojson (value_for_key automation_subtype_of_yojson "AutomationSubtype") _list path;
     scheduled_time =
       option_of_yojson (value_for_key date_time_of_yojson "ScheduledTime") _list path;
     runbooks = option_of_yojson (value_for_key runbooks_of_yojson "Runbooks") _list path;
     ops_item_id = option_of_yojson (value_for_key string__of_yojson "OpsItemId") _list path;
     association_id = option_of_yojson (value_for_key string__of_yojson "AssociationId") _list path;
     change_request_name =
       option_of_yojson (value_for_key change_request_name_of_yojson "ChangeRequestName") _list path;
     variables =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Variables") _list path;
   }
    : automation_execution)

let get_automation_execution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_execution =
       option_of_yojson
         (value_for_key automation_execution_of_yojson "AutomationExecution")
         _list path;
   }
    : get_automation_execution_result)

let get_automation_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_execution_id =
       value_for_key automation_execution_id_of_yojson "AutomationExecutionId" _list path;
   }
    : get_automation_execution_request)

let session_token_type_of_yojson = string_of_yojson

let credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_key_id = value_for_key access_key_id_type_of_yojson "AccessKeyId" _list path;
     secret_access_key = value_for_key access_key_secret_type_of_yojson "SecretAccessKey" _list path;
     session_token = value_for_key session_token_type_of_yojson "SessionToken" _list path;
     expiration_time = value_for_key date_time_of_yojson "ExpirationTime" _list path;
   }
    : credentials)

let get_access_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credentials = option_of_yojson (value_for_key credentials_of_yojson "Credentials") _list path;
     access_request_status =
       option_of_yojson
         (value_for_key access_request_status_of_yojson "AccessRequestStatus")
         _list path;
   }
    : get_access_token_response)

let get_access_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ access_request_id = value_for_key access_request_id_of_yojson "AccessRequestId" _list path }
    : get_access_token_request)

let ops_item_related_item_association_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : ops_item_related_item_association_not_found_exception)

let disassociate_ops_item_related_item_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_ops_item_related_item_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_item_id = value_for_key ops_item_id_of_yojson "OpsItemId" _list path;
     association_id =
       value_for_key ops_item_related_item_association_id_of_yojson "AssociationId" _list path;
   }
    : disassociate_ops_item_related_item_request)

let max_session_duration_of_yojson = string_of_yojson
let session_manager_cloud_watch_output_url_of_yojson = string_of_yojson
let session_manager_s3_output_url_of_yojson = string_of_yojson

let session_manager_output_url_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_output_url =
       option_of_yojson
         (value_for_key session_manager_s3_output_url_of_yojson "S3OutputUrl")
         _list path;
     cloud_watch_output_url =
       option_of_yojson
         (value_for_key session_manager_cloud_watch_output_url_of_yojson "CloudWatchOutputUrl")
         _list path;
   }
    : session_manager_output_url)

let session_details_of_yojson = string_of_yojson
let session_owner_of_yojson = string_of_yojson

let session_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Connected" -> CONNECTED
    | `String "Connecting" -> CONNECTING
    | `String "Disconnected" -> DISCONNECTED
    | `String "Terminated" -> TERMINATED
    | `String "Terminating" -> TERMINATING
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionStatus")
     : session_status)
    : session_status)

let session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
     target = option_of_yojson (value_for_key session_target_of_yojson "Target") _list path;
     status = option_of_yojson (value_for_key session_status_of_yojson "Status") _list path;
     start_date = option_of_yojson (value_for_key date_time_of_yojson "StartDate") _list path;
     end_date = option_of_yojson (value_for_key date_time_of_yojson "EndDate") _list path;
     document_name =
       option_of_yojson (value_for_key document_name_of_yojson "DocumentName") _list path;
     owner = option_of_yojson (value_for_key session_owner_of_yojson "Owner") _list path;
     reason = option_of_yojson (value_for_key session_reason_of_yojson "Reason") _list path;
     details = option_of_yojson (value_for_key session_details_of_yojson "Details") _list path;
     output_url =
       option_of_yojson (value_for_key session_manager_output_url_of_yojson "OutputUrl") _list path;
     max_session_duration =
       option_of_yojson
         (value_for_key max_session_duration_of_yojson "MaxSessionDuration")
         _list path;
     access_type = option_of_yojson (value_for_key access_type_of_yojson "AccessType") _list path;
   }
    : session)

let session_list_of_yojson tree path = list_of_yojson session_of_yojson tree path

let describe_sessions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sessions = option_of_yojson (value_for_key session_list_of_yojson "Sessions") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_sessions_response)

let session_filter_value_of_yojson = string_of_yojson

let session_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "InvokedAfter" -> INVOKED_AFTER
    | `String "InvokedBefore" -> INVOKED_BEFORE
    | `String "Target" -> TARGET_ID
    | `String "Owner" -> OWNER
    | `String "Status" -> STATUS
    | `String "SessionId" -> SESSION_ID
    | `String "AccessType" -> ACCESS_TYPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionFilterKey")
     : session_filter_key)
    : session_filter_key)

let session_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key session_filter_key_of_yojson "key" _list path;
     value = value_for_key session_filter_value_of_yojson "value" _list path;
   }
    : session_filter)

let session_filter_list_of_yojson tree path = list_of_yojson session_filter_of_yojson tree path
let session_max_results_of_yojson = int_of_yojson

let session_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> ACTIVE
    | `String "History" -> HISTORY
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionState" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionState")
     : session_state)
    : session_state)

let describe_sessions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = value_for_key session_state_of_yojson "State" _list path;
     max_results =
       option_of_yojson (value_for_key session_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key session_filter_list_of_yojson "Filters") _list path;
   }
    : describe_sessions_request)

let patch_property_entry_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let patch_properties_list_of_yojson tree path =
  list_of_yojson patch_property_entry_of_yojson tree path

let describe_patch_properties_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties =
       option_of_yojson (value_for_key patch_properties_list_of_yojson "Properties") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_patch_properties_result)

let patch_set_of_yojson (tree : t) path =
  ((match tree with
    | `String "OS" -> Os
    | `String "APPLICATION" -> Application
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchSet" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchSet")
     : patch_set)
    : patch_set)

let patch_property_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRODUCT" -> Product
    | `String "PRODUCT_FAMILY" -> PatchProductFamily
    | `String "CLASSIFICATION" -> PatchClassification
    | `String "MSRC_SEVERITY" -> PatchMsrcSeverity
    | `String "PRIORITY" -> PatchPriority
    | `String "SEVERITY" -> PatchSeverity
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchProperty" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchProperty")
     : patch_property)
    : patch_property)

let describe_patch_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operating_system = value_for_key operating_system_of_yojson "OperatingSystem" _list path;
     property = value_for_key patch_property_of_yojson "Property" _list path;
     patch_set = option_of_yojson (value_for_key patch_set_of_yojson "PatchSet") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_patch_properties_request)

let instances_count_of_yojson = int_of_yojson

let describe_patch_group_state_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instances = option_of_yojson (value_for_key integer_of_yojson "Instances") _list path;
     instances_with_installed_patches =
       option_of_yojson (value_for_key integer_of_yojson "InstancesWithInstalledPatches") _list path;
     instances_with_installed_other_patches =
       option_of_yojson
         (value_for_key integer_of_yojson "InstancesWithInstalledOtherPatches")
         _list path;
     instances_with_installed_pending_reboot_patches =
       option_of_yojson
         (value_for_key instances_count_of_yojson "InstancesWithInstalledPendingRebootPatches")
         _list path;
     instances_with_installed_rejected_patches =
       option_of_yojson
         (value_for_key instances_count_of_yojson "InstancesWithInstalledRejectedPatches")
         _list path;
     instances_with_missing_patches =
       option_of_yojson (value_for_key integer_of_yojson "InstancesWithMissingPatches") _list path;
     instances_with_failed_patches =
       option_of_yojson (value_for_key integer_of_yojson "InstancesWithFailedPatches") _list path;
     instances_with_not_applicable_patches =
       option_of_yojson
         (value_for_key integer_of_yojson "InstancesWithNotApplicablePatches")
         _list path;
     instances_with_unreported_not_applicable_patches =
       option_of_yojson
         (value_for_key integer_of_yojson "InstancesWithUnreportedNotApplicablePatches")
         _list path;
     instances_with_critical_non_compliant_patches =
       option_of_yojson
         (value_for_key instances_count_of_yojson "InstancesWithCriticalNonCompliantPatches")
         _list path;
     instances_with_security_non_compliant_patches =
       option_of_yojson
         (value_for_key instances_count_of_yojson "InstancesWithSecurityNonCompliantPatches")
         _list path;
     instances_with_other_non_compliant_patches =
       option_of_yojson
         (value_for_key instances_count_of_yojson "InstancesWithOtherNonCompliantPatches")
         _list path;
     instances_with_available_security_updates =
       option_of_yojson
         (value_for_key integer_of_yojson "InstancesWithAvailableSecurityUpdates")
         _list path;
   }
    : describe_patch_group_state_result)

let describe_patch_group_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ patch_group = value_for_key patch_group_of_yojson "PatchGroup" _list path }
    : describe_patch_group_state_request)

let default_baseline_of_yojson = bool_of_yojson

let patch_baseline_identity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_id = option_of_yojson (value_for_key baseline_id_of_yojson "BaselineId") _list path;
     baseline_name =
       option_of_yojson (value_for_key baseline_name_of_yojson "BaselineName") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     baseline_description =
       option_of_yojson
         (value_for_key baseline_description_of_yojson "BaselineDescription")
         _list path;
     default_baseline =
       option_of_yojson (value_for_key default_baseline_of_yojson "DefaultBaseline") _list path;
   }
    : patch_baseline_identity)

let patch_group_patch_baseline_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     patch_group = option_of_yojson (value_for_key patch_group_of_yojson "PatchGroup") _list path;
     baseline_identity =
       option_of_yojson
         (value_for_key patch_baseline_identity_of_yojson "BaselineIdentity")
         _list path;
   }
    : patch_group_patch_baseline_mapping)

let patch_group_patch_baseline_mapping_list_of_yojson tree path =
  list_of_yojson patch_group_patch_baseline_mapping_of_yojson tree path

let describe_patch_groups_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mappings =
       option_of_yojson
         (value_for_key patch_group_patch_baseline_mapping_list_of_yojson "Mappings")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_patch_groups_result)

let patch_orchestrator_filter_value_of_yojson = string_of_yojson

let patch_orchestrator_filter_values_of_yojson tree path =
  list_of_yojson patch_orchestrator_filter_value_of_yojson tree path

let patch_orchestrator_filter_key_of_yojson = string_of_yojson

let patch_orchestrator_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key patch_orchestrator_filter_key_of_yojson "Key") _list path;
     values =
       option_of_yojson
         (value_for_key patch_orchestrator_filter_values_of_yojson "Values")
         _list path;
   }
    : patch_orchestrator_filter)

let patch_orchestrator_filter_list_of_yojson tree path =
  list_of_yojson patch_orchestrator_filter_of_yojson tree path

let patch_baseline_max_results_of_yojson = int_of_yojson

let describe_patch_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key patch_baseline_max_results_of_yojson "MaxResults") _list path;
     filters =
       option_of_yojson
         (value_for_key patch_orchestrator_filter_list_of_yojson "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_patch_groups_request)

let patch_baseline_identity_list_of_yojson tree path =
  list_of_yojson patch_baseline_identity_of_yojson tree path

let describe_patch_baselines_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_identities =
       option_of_yojson
         (value_for_key patch_baseline_identity_list_of_yojson "BaselineIdentities")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_patch_baselines_result)

let describe_patch_baselines_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson
         (value_for_key patch_orchestrator_filter_list_of_yojson "Filters")
         _list path;
     max_results =
       option_of_yojson (value_for_key patch_baseline_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_patch_baselines_request)

let parameter_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key ps_parameter_name_of_yojson "Name") _list path;
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     type_ = option_of_yojson (value_for_key parameter_type_of_yojson "Type") _list path;
     key_id = option_of_yojson (value_for_key parameter_key_id_of_yojson "KeyId") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedDate") _list path;
     last_modified_user =
       option_of_yojson (value_for_key string__of_yojson "LastModifiedUser") _list path;
     description =
       option_of_yojson (value_for_key parameter_description_of_yojson "Description") _list path;
     allowed_pattern =
       option_of_yojson (value_for_key allowed_pattern_of_yojson "AllowedPattern") _list path;
     version = option_of_yojson (value_for_key ps_parameter_version_of_yojson "Version") _list path;
     tier = option_of_yojson (value_for_key parameter_tier_of_yojson "Tier") _list path;
     policies =
       option_of_yojson (value_for_key parameter_policy_list_of_yojson "Policies") _list path;
     data_type =
       option_of_yojson (value_for_key parameter_data_type_of_yojson "DataType") _list path;
   }
    : parameter_metadata)

let parameter_metadata_list_of_yojson tree path =
  list_of_yojson parameter_metadata_of_yojson tree path

let describe_parameters_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters =
       option_of_yojson (value_for_key parameter_metadata_list_of_yojson "Parameters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_parameters_result)

let parameters_filter_value_of_yojson = string_of_yojson

let parameters_filter_value_list_of_yojson tree path =
  list_of_yojson parameters_filter_value_of_yojson tree path

let parameters_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "Name" -> NAME
    | `String "Type" -> TYPE
    | `String "KeyId" -> KEY_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParametersFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "ParametersFilterKey")
     : parameters_filter_key)
    : parameters_filter_key)

let parameters_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key parameters_filter_key_of_yojson "Key" _list path;
     values = value_for_key parameters_filter_value_list_of_yojson "Values" _list path;
   }
    : parameters_filter)

let parameters_filter_list_of_yojson tree path =
  list_of_yojson parameters_filter_of_yojson tree path

let describe_parameters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key parameters_filter_list_of_yojson "Filters") _list path;
     parameter_filters =
       option_of_yojson
         (value_for_key parameter_string_filter_list_of_yojson "ParameterFilters")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     shared = option_of_yojson (value_for_key boolean__of_yojson "Shared") _list path;
   }
    : describe_parameters_request)

let ops_item_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_by = option_of_yojson (value_for_key string__of_yojson "CreatedBy") _list path;
     created_time = option_of_yojson (value_for_key date_time_of_yojson "CreatedTime") _list path;
     last_modified_by =
       option_of_yojson (value_for_key string__of_yojson "LastModifiedBy") _list path;
     last_modified_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastModifiedTime") _list path;
     priority = option_of_yojson (value_for_key ops_item_priority_of_yojson "Priority") _list path;
     source = option_of_yojson (value_for_key ops_item_source_of_yojson "Source") _list path;
     status = option_of_yojson (value_for_key ops_item_status_of_yojson "Status") _list path;
     ops_item_id = option_of_yojson (value_for_key ops_item_id_of_yojson "OpsItemId") _list path;
     title = option_of_yojson (value_for_key ops_item_title_of_yojson "Title") _list path;
     operational_data =
       option_of_yojson
         (value_for_key ops_item_operational_data_of_yojson "OperationalData")
         _list path;
     category = option_of_yojson (value_for_key ops_item_category_of_yojson "Category") _list path;
     severity = option_of_yojson (value_for_key ops_item_severity_of_yojson "Severity") _list path;
     ops_item_type =
       option_of_yojson (value_for_key ops_item_type_of_yojson "OpsItemType") _list path;
     actual_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "ActualStartTime") _list path;
     actual_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "ActualEndTime") _list path;
     planned_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "PlannedStartTime") _list path;
     planned_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "PlannedEndTime") _list path;
   }
    : ops_item_summary)

let ops_item_summaries_of_yojson tree path = list_of_yojson ops_item_summary_of_yojson tree path

let describe_ops_items_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     ops_item_summaries =
       option_of_yojson (value_for_key ops_item_summaries_of_yojson "OpsItemSummaries") _list path;
   }
    : describe_ops_items_response)

let ops_item_max_results_of_yojson = int_of_yojson

let ops_item_filter_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "Equal" -> EQUAL
    | `String "Contains" -> CONTAINS
    | `String "GreaterThan" -> GREATER_THAN
    | `String "LessThan" -> LESS_THAN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OpsItemFilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemFilterOperator")
     : ops_item_filter_operator)
    : ops_item_filter_operator)

let ops_item_filter_value_of_yojson = string_of_yojson

let ops_item_filter_values_of_yojson tree path =
  list_of_yojson ops_item_filter_value_of_yojson tree path

let ops_item_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "Status" -> STATUS
    | `String "CreatedBy" -> CREATED_BY
    | `String "Source" -> SOURCE
    | `String "Priority" -> PRIORITY
    | `String "Title" -> TITLE
    | `String "OpsItemId" -> OPSITEM_ID
    | `String "CreatedTime" -> CREATED_TIME
    | `String "LastModifiedTime" -> LAST_MODIFIED_TIME
    | `String "ActualStartTime" -> ACTUAL_START_TIME
    | `String "ActualEndTime" -> ACTUAL_END_TIME
    | `String "PlannedStartTime" -> PLANNED_START_TIME
    | `String "PlannedEndTime" -> PLANNED_END_TIME
    | `String "OperationalData" -> OPERATIONAL_DATA
    | `String "OperationalDataKey" -> OPERATIONAL_DATA_KEY
    | `String "OperationalDataValue" -> OPERATIONAL_DATA_VALUE
    | `String "ResourceId" -> RESOURCE_ID
    | `String "AutomationId" -> AUTOMATION_ID
    | `String "Category" -> CATEGORY
    | `String "Severity" -> SEVERITY
    | `String "OpsItemType" -> OPSITEM_TYPE
    | `String "AccessRequestByRequesterArn" -> ACCESS_REQUEST_REQUESTER_ARN
    | `String "AccessRequestByRequesterId" -> ACCESS_REQUEST_REQUESTER_ID
    | `String "AccessRequestByApproverArn" -> ACCESS_REQUEST_APPROVER_ARN
    | `String "AccessRequestByApproverId" -> ACCESS_REQUEST_APPROVER_ID
    | `String "AccessRequestBySourceAccountId" -> ACCESS_REQUEST_SOURCE_ACCOUNT_ID
    | `String "AccessRequestBySourceOpsItemId" -> ACCESS_REQUEST_SOURCE_OPS_ITEM_ID
    | `String "AccessRequestBySourceRegion" -> ACCESS_REQUEST_SOURCE_REGION
    | `String "AccessRequestByIsReplica" -> ACCESS_REQUEST_IS_REPLICA
    | `String "AccessRequestByTargetResourceId" -> ACCESS_REQUEST_TARGET_RESOURCE_ID
    | `String "ChangeRequestByRequesterArn" -> CHANGE_REQUEST_REQUESTER_ARN
    | `String "ChangeRequestByRequesterName" -> CHANGE_REQUEST_REQUESTER_NAME
    | `String "ChangeRequestByApproverArn" -> CHANGE_REQUEST_APPROVER_ARN
    | `String "ChangeRequestByApproverName" -> CHANGE_REQUEST_APPROVER_NAME
    | `String "ChangeRequestByTemplate" -> CHANGE_REQUEST_TEMPLATE
    | `String "ChangeRequestByTargetsResourceGroup" -> CHANGE_REQUEST_TARGETS_RESOURCE_GROUP
    | `String "InsightByType" -> INSIGHT_TYPE
    | `String "AccountId" -> ACCOUNT_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsItemFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemFilterKey")
     : ops_item_filter_key)
    : ops_item_filter_key)

let ops_item_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key ops_item_filter_key_of_yojson "Key" _list path;
     values = value_for_key ops_item_filter_values_of_yojson "Values" _list path;
     operator = value_for_key ops_item_filter_operator_of_yojson "Operator" _list path;
   }
    : ops_item_filter)

let ops_item_filters_of_yojson tree path = list_of_yojson ops_item_filter_of_yojson tree path

let describe_ops_items_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_item_filters =
       option_of_yojson (value_for_key ops_item_filters_of_yojson "OpsItemFilters") _list path;
     max_results =
       option_of_yojson (value_for_key ops_item_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_ops_items_request)

let maintenance_window_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     window_task_id =
       option_of_yojson
         (value_for_key maintenance_window_task_id_of_yojson "WindowTaskId")
         _list path;
     task_arn =
       option_of_yojson (value_for_key maintenance_window_task_arn_of_yojson "TaskArn") _list path;
     type_ =
       option_of_yojson (value_for_key maintenance_window_task_type_of_yojson "Type") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     task_parameters =
       option_of_yojson
         (value_for_key maintenance_window_task_parameters_of_yojson "TaskParameters")
         _list path;
     priority =
       option_of_yojson
         (value_for_key maintenance_window_task_priority_of_yojson "Priority")
         _list path;
     logging_info = option_of_yojson (value_for_key logging_info_of_yojson "LoggingInfo") _list path;
     service_role_arn =
       option_of_yojson (value_for_key service_role_of_yojson "ServiceRoleArn") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     cutoff_behavior =
       option_of_yojson
         (value_for_key maintenance_window_task_cutoff_behavior_of_yojson "CutoffBehavior")
         _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
   }
    : maintenance_window_task)

let maintenance_window_task_list_of_yojson tree path =
  list_of_yojson maintenance_window_task_of_yojson tree path

let describe_maintenance_window_tasks_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tasks =
       option_of_yojson (value_for_key maintenance_window_task_list_of_yojson "Tasks") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_tasks_result)

let maintenance_window_max_results_of_yojson = int_of_yojson
let maintenance_window_filter_value_of_yojson = string_of_yojson

let maintenance_window_filter_values_of_yojson tree path =
  list_of_yojson maintenance_window_filter_value_of_yojson tree path

let maintenance_window_filter_key_of_yojson = string_of_yojson

let maintenance_window_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key maintenance_window_filter_key_of_yojson "Key") _list path;
     values =
       option_of_yojson
         (value_for_key maintenance_window_filter_values_of_yojson "Values")
         _list path;
   }
    : maintenance_window_filter)

let maintenance_window_filter_list_of_yojson tree path =
  list_of_yojson maintenance_window_filter_of_yojson tree path

let describe_maintenance_window_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path;
     filters =
       option_of_yojson
         (value_for_key maintenance_window_filter_list_of_yojson "Filters")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key maintenance_window_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_tasks_request)

let maintenance_window_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     window_target_id =
       option_of_yojson
         (value_for_key maintenance_window_target_id_of_yojson "WindowTargetId")
         _list path;
     resource_type =
       option_of_yojson
         (value_for_key maintenance_window_resource_type_of_yojson "ResourceType")
         _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     owner_information =
       option_of_yojson (value_for_key owner_information_of_yojson "OwnerInformation") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
   }
    : maintenance_window_target)

let maintenance_window_target_list_of_yojson tree path =
  list_of_yojson maintenance_window_target_of_yojson tree path

let describe_maintenance_window_targets_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     targets =
       option_of_yojson
         (value_for_key maintenance_window_target_list_of_yojson "Targets")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_targets_result)

let describe_maintenance_window_targets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path;
     filters =
       option_of_yojson
         (value_for_key maintenance_window_filter_list_of_yojson "Filters")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key maintenance_window_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_targets_request)

let maintenance_window_identity_for_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
   }
    : maintenance_window_identity_for_target)

let maintenance_windows_for_target_list_of_yojson tree path =
  list_of_yojson maintenance_window_identity_for_target_of_yojson tree path

let describe_maintenance_windows_for_target_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_identities =
       option_of_yojson
         (value_for_key maintenance_windows_for_target_list_of_yojson "WindowIdentities")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_windows_for_target_result)

let maintenance_window_search_max_results_of_yojson = int_of_yojson

let describe_maintenance_windows_for_target_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     targets = value_for_key targets_of_yojson "Targets" _list path;
     resource_type =
       value_for_key maintenance_window_resource_type_of_yojson "ResourceType" _list path;
     max_results =
       option_of_yojson
         (value_for_key maintenance_window_search_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_windows_for_target_request)

let scheduled_window_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     execution_time =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "ExecutionTime")
         _list path;
   }
    : scheduled_window_execution)

let scheduled_window_execution_list_of_yojson tree path =
  list_of_yojson scheduled_window_execution_of_yojson tree path

let describe_maintenance_window_schedule_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_window_executions =
       option_of_yojson
         (value_for_key scheduled_window_execution_list_of_yojson "ScheduledWindowExecutions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_schedule_result)

let describe_maintenance_window_schedule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     resource_type =
       option_of_yojson
         (value_for_key maintenance_window_resource_type_of_yojson "ResourceType")
         _list path;
     filters =
       option_of_yojson
         (value_for_key patch_orchestrator_filter_list_of_yojson "Filters")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key maintenance_window_search_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_schedule_request)

let maintenance_window_identity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     name = option_of_yojson (value_for_key maintenance_window_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     enabled =
       option_of_yojson (value_for_key maintenance_window_enabled_of_yojson "Enabled") _list path;
     duration =
       option_of_yojson
         (value_for_key maintenance_window_duration_hours_of_yojson "Duration")
         _list path;
     cutoff =
       option_of_yojson (value_for_key maintenance_window_cutoff_of_yojson "Cutoff") _list path;
     schedule =
       option_of_yojson (value_for_key maintenance_window_schedule_of_yojson "Schedule") _list path;
     schedule_timezone =
       option_of_yojson
         (value_for_key maintenance_window_timezone_of_yojson "ScheduleTimezone")
         _list path;
     schedule_offset =
       option_of_yojson
         (value_for_key maintenance_window_offset_of_yojson "ScheduleOffset")
         _list path;
     end_date =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "EndDate")
         _list path;
     start_date =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "StartDate")
         _list path;
     next_execution_time =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "NextExecutionTime")
         _list path;
   }
    : maintenance_window_identity)

let maintenance_window_identity_list_of_yojson tree path =
  list_of_yojson maintenance_window_identity_of_yojson tree path

let describe_maintenance_windows_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_identities =
       option_of_yojson
         (value_for_key maintenance_window_identity_list_of_yojson "WindowIdentities")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_windows_result)

let describe_maintenance_windows_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson
         (value_for_key maintenance_window_filter_list_of_yojson "Filters")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key maintenance_window_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_windows_request)

let maintenance_window_execution_task_identity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId")
         _list path;
     task_execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_id_of_yojson "TaskExecutionId")
         _list path;
     status =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_of_yojson "Status")
         _list path;
     status_details =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_details_of_yojson "StatusDetails")
         _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     task_arn =
       option_of_yojson (value_for_key maintenance_window_task_arn_of_yojson "TaskArn") _list path;
     task_type =
       option_of_yojson (value_for_key maintenance_window_task_type_of_yojson "TaskType") _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
     triggered_alarms =
       option_of_yojson
         (value_for_key alarm_state_information_list_of_yojson "TriggeredAlarms")
         _list path;
   }
    : maintenance_window_execution_task_identity)

let maintenance_window_execution_task_identity_list_of_yojson tree path =
  list_of_yojson maintenance_window_execution_task_identity_of_yojson tree path

let describe_maintenance_window_execution_tasks_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_task_identities =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_identity_list_of_yojson
            "WindowExecutionTaskIdentities")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_execution_tasks_result)

let describe_maintenance_window_execution_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId" _list path;
     filters =
       option_of_yojson
         (value_for_key maintenance_window_filter_list_of_yojson "Filters")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key maintenance_window_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_execution_tasks_request)

let maintenance_window_execution_task_invocation_identity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId")
         _list path;
     task_execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_id_of_yojson "TaskExecutionId")
         _list path;
     invocation_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_invocation_id_of_yojson "InvocationId")
         _list path;
     execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_execution_id_of_yojson "ExecutionId")
         _list path;
     task_type =
       option_of_yojson (value_for_key maintenance_window_task_type_of_yojson "TaskType") _list path;
     parameters =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_invocation_parameters_of_yojson
            "Parameters")
         _list path;
     status =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_of_yojson "Status")
         _list path;
     status_details =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_details_of_yojson "StatusDetails")
         _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     owner_information =
       option_of_yojson (value_for_key owner_information_of_yojson "OwnerInformation") _list path;
     window_target_id =
       option_of_yojson
         (value_for_key maintenance_window_task_target_id_of_yojson "WindowTargetId")
         _list path;
   }
    : maintenance_window_execution_task_invocation_identity)

let maintenance_window_execution_task_invocation_identity_list_of_yojson tree path =
  list_of_yojson maintenance_window_execution_task_invocation_identity_of_yojson tree path

let describe_maintenance_window_execution_task_invocations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_task_invocation_identities =
       option_of_yojson
         (value_for_key maintenance_window_execution_task_invocation_identity_list_of_yojson
            "WindowExecutionTaskInvocationIdentities")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_execution_task_invocations_result)

let describe_maintenance_window_execution_task_invocations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId" _list path;
     task_id = value_for_key maintenance_window_execution_task_id_of_yojson "TaskId" _list path;
     filters =
       option_of_yojson
         (value_for_key maintenance_window_filter_list_of_yojson "Filters")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key maintenance_window_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_execution_task_invocations_request)

let maintenance_window_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     window_execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId")
         _list path;
     status =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_of_yojson "Status")
         _list path;
     status_details =
       option_of_yojson
         (value_for_key maintenance_window_execution_status_details_of_yojson "StatusDetails")
         _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
   }
    : maintenance_window_execution)

let maintenance_window_execution_list_of_yojson tree path =
  list_of_yojson maintenance_window_execution_of_yojson tree path

let describe_maintenance_window_executions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_executions =
       option_of_yojson
         (value_for_key maintenance_window_execution_list_of_yojson "WindowExecutions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_executions_result)

let describe_maintenance_window_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path;
     filters =
       option_of_yojson
         (value_for_key maintenance_window_filter_list_of_yojson "Filters")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key maintenance_window_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_maintenance_window_executions_request)

let invalid_deletion_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_deletion_id_exception)

let inventory_deletion_last_status_update_time_of_yojson = timestamp_epoch_seconds_of_yojson
let remaining_count_of_yojson = int_of_yojson
let resource_count_of_yojson = int_of_yojson

let inventory_deletion_summary_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version =
       option_of_yojson (value_for_key inventory_item_schema_version_of_yojson "Version") _list path;
     count = option_of_yojson (value_for_key resource_count_of_yojson "Count") _list path;
     remaining_count =
       option_of_yojson (value_for_key remaining_count_of_yojson "RemainingCount") _list path;
   }
    : inventory_deletion_summary_item)

let inventory_deletion_summary_items_of_yojson tree path =
  list_of_yojson inventory_deletion_summary_item_of_yojson tree path

let total_count_of_yojson = int_of_yojson

let inventory_deletion_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_count = option_of_yojson (value_for_key total_count_of_yojson "TotalCount") _list path;
     remaining_count =
       option_of_yojson (value_for_key remaining_count_of_yojson "RemainingCount") _list path;
     summary_items =
       option_of_yojson
         (value_for_key inventory_deletion_summary_items_of_yojson "SummaryItems")
         _list path;
   }
    : inventory_deletion_summary)

let inventory_deletion_last_status_message_of_yojson = string_of_yojson

let inventory_deletion_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "InProgress" -> IN_PROGRESS
    | `String "Complete" -> COMPLETE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InventoryDeletionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InventoryDeletionStatus")
     : inventory_deletion_status)
    : inventory_deletion_status)

let inventory_deletion_start_time_of_yojson = timestamp_epoch_seconds_of_yojson
let uui_d_of_yojson = string_of_yojson

let inventory_deletion_status_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deletion_id = option_of_yojson (value_for_key uui_d_of_yojson "DeletionId") _list path;
     type_name =
       option_of_yojson (value_for_key inventory_item_type_name_of_yojson "TypeName") _list path;
     deletion_start_time =
       option_of_yojson
         (value_for_key inventory_deletion_start_time_of_yojson "DeletionStartTime")
         _list path;
     last_status =
       option_of_yojson (value_for_key inventory_deletion_status_of_yojson "LastStatus") _list path;
     last_status_message =
       option_of_yojson
         (value_for_key inventory_deletion_last_status_message_of_yojson "LastStatusMessage")
         _list path;
     deletion_summary =
       option_of_yojson
         (value_for_key inventory_deletion_summary_of_yojson "DeletionSummary")
         _list path;
     last_status_update_time =
       option_of_yojson
         (value_for_key inventory_deletion_last_status_update_time_of_yojson "LastStatusUpdateTime")
         _list path;
   }
    : inventory_deletion_status_item)

let inventory_deletions_list_of_yojson tree path =
  list_of_yojson inventory_deletion_status_item_of_yojson tree path

let describe_inventory_deletions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inventory_deletions =
       option_of_yojson
         (value_for_key inventory_deletions_list_of_yojson "InventoryDeletions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_inventory_deletions_result)

let describe_inventory_deletions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deletion_id = option_of_yojson (value_for_key uui_d_of_yojson "DeletionId") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_inventory_deletions_request)

let invalid_instance_property_filter_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_instance_property_filter_value)

let invalid_activation_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_activation_id)

let source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS::EC2::Instance" -> AWS_EC2_INSTANCE
    | `String "AWS::IoT::Thing" -> AWS_IOT_THING
    | `String "AWS::SSM::ManagedInstance" -> AWS_SSM_MANAGEDINSTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceType")
     : source_type)
    : source_type)

let source_id_of_yojson = string_of_yojson

let instance_association_status_aggregated_count_of_yojson tree path =
  map_of_yojson status_name_of_yojson instance_count_of_yojson tree path

let instance_aggregated_association_overview_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detailed_status =
       option_of_yojson (value_for_key status_name_of_yojson "DetailedStatus") _list path;
     instance_association_status_aggregated_count =
       option_of_yojson
         (value_for_key instance_association_status_aggregated_count_of_yojson
            "InstanceAssociationStatusAggregatedCount")
         _list path;
   }
    : instance_aggregated_association_overview)

let version_of_yojson = string_of_yojson

let ping_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Online" -> ONLINE
    | `String "ConnectionLost" -> CONNECTION_LOST
    | `String "Inactive" -> INACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PingStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PingStatus")
     : ping_status)
    : ping_status)

let architecture_of_yojson = string_of_yojson
let instance_state_of_yojson = string_of_yojson
let key_name_of_yojson = string_of_yojson
let instance_role_of_yojson = string_of_yojson
let instance_type_of_yojson = string_of_yojson
let instance_name_of_yojson = string_of_yojson

let instance_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key instance_name_of_yojson "Name") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "InstanceType") _list path;
     instance_role =
       option_of_yojson (value_for_key instance_role_of_yojson "InstanceRole") _list path;
     key_name = option_of_yojson (value_for_key key_name_of_yojson "KeyName") _list path;
     instance_state =
       option_of_yojson (value_for_key instance_state_of_yojson "InstanceState") _list path;
     architecture =
       option_of_yojson (value_for_key architecture_of_yojson "Architecture") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IPAddress") _list path;
     launch_time = option_of_yojson (value_for_key date_time_of_yojson "LaunchTime") _list path;
     ping_status = option_of_yojson (value_for_key ping_status_of_yojson "PingStatus") _list path;
     last_ping_date_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastPingDateTime") _list path;
     agent_version = option_of_yojson (value_for_key version_of_yojson "AgentVersion") _list path;
     platform_type =
       option_of_yojson (value_for_key platform_type_of_yojson "PlatformType") _list path;
     platform_name =
       option_of_yojson (value_for_key platform_name_of_yojson "PlatformName") _list path;
     platform_version =
       option_of_yojson (value_for_key platform_version_of_yojson "PlatformVersion") _list path;
     activation_id =
       option_of_yojson (value_for_key activation_id_of_yojson "ActivationId") _list path;
     iam_role = option_of_yojson (value_for_key iam_role_of_yojson "IamRole") _list path;
     registration_date =
       option_of_yojson (value_for_key date_time_of_yojson "RegistrationDate") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
     computer_name =
       option_of_yojson (value_for_key computer_name_of_yojson "ComputerName") _list path;
     association_status =
       option_of_yojson (value_for_key status_name_of_yojson "AssociationStatus") _list path;
     last_association_execution_date =
       option_of_yojson
         (value_for_key date_time_of_yojson "LastAssociationExecutionDate")
         _list path;
     last_successful_association_execution_date =
       option_of_yojson
         (value_for_key date_time_of_yojson "LastSuccessfulAssociationExecutionDate")
         _list path;
     association_overview =
       option_of_yojson
         (value_for_key instance_aggregated_association_overview_of_yojson "AssociationOverview")
         _list path;
     source_id = option_of_yojson (value_for_key source_id_of_yojson "SourceId") _list path;
     source_type = option_of_yojson (value_for_key source_type_of_yojson "SourceType") _list path;
   }
    : instance_property)

let instance_properties_of_yojson tree path = list_of_yojson instance_property_of_yojson tree path

let describe_instance_properties_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_properties =
       option_of_yojson
         (value_for_key instance_properties_of_yojson "InstanceProperties")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_instance_properties_result)

let describe_instance_properties_max_results_of_yojson = int_of_yojson

let instance_property_filter_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "Equal" -> EQUAL
    | `String "NotEqual" -> NOT_EQUAL
    | `String "BeginWith" -> BEGIN_WITH
    | `String "LessThan" -> LESS_THAN
    | `String "GreaterThan" -> GREATER_THAN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstancePropertyFilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "InstancePropertyFilterOperator")
     : instance_property_filter_operator)
    : instance_property_filter_operator)

let instance_property_filter_value_of_yojson = string_of_yojson

let instance_property_filter_value_set_of_yojson tree path =
  list_of_yojson instance_property_filter_value_of_yojson tree path

let instance_property_string_filter_key_of_yojson = string_of_yojson

let instance_property_string_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key instance_property_string_filter_key_of_yojson "Key" _list path;
     values = value_for_key instance_property_filter_value_set_of_yojson "Values" _list path;
     operator =
       option_of_yojson
         (value_for_key instance_property_filter_operator_of_yojson "Operator")
         _list path;
   }
    : instance_property_string_filter)

let instance_property_string_filter_list_of_yojson tree path =
  list_of_yojson instance_property_string_filter_of_yojson tree path

let instance_property_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "InstanceIds" -> INSTANCE_IDS
    | `String "AgentVersion" -> AGENT_VERSION
    | `String "PingStatus" -> PING_STATUS
    | `String "PlatformTypes" -> PLATFORM_TYPES
    | `String "DocumentName" -> DOCUMENT_NAME
    | `String "ActivationIds" -> ACTIVATION_IDS
    | `String "IamRole" -> IAM_ROLE
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "AssociationStatus" -> ASSOCIATION_STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstancePropertyFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "InstancePropertyFilterKey")
     : instance_property_filter_key)
    : instance_property_filter_key)

let instance_property_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key instance_property_filter_key_of_yojson "key" _list path;
     value_set = value_for_key instance_property_filter_value_set_of_yojson "valueSet" _list path;
   }
    : instance_property_filter)

let instance_property_filter_list_of_yojson tree path =
  list_of_yojson instance_property_filter_of_yojson tree path

let describe_instance_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_property_filter_list =
       option_of_yojson
         (value_for_key instance_property_filter_list_of_yojson "InstancePropertyFilterList")
         _list path;
     filters_with_operator =
       option_of_yojson
         (value_for_key instance_property_string_filter_list_of_yojson "FiltersWithOperator")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key describe_instance_properties_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_instance_properties_request)

let patch_other_non_compliant_count_of_yojson = int_of_yojson
let patch_security_non_compliant_count_of_yojson = int_of_yojson
let patch_critical_non_compliant_count_of_yojson = int_of_yojson

let reboot_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "RebootIfNeeded" -> REBOOT_IF_NEEDED
    | `String "NoReboot" -> NO_REBOOT
    | `String value -> raise (deserialize_unknown_enum_value_error path "RebootOption" value)
    | _ -> raise (deserialize_wrong_type_error path "RebootOption")
     : reboot_option)
    : reboot_option)

let patch_operation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Scan" -> SCAN
    | `String "Install" -> INSTALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchOperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchOperationType")
     : patch_operation_type)
    : patch_operation_type)

let patch_available_security_update_count_of_yojson = int_of_yojson
let patch_not_applicable_count_of_yojson = int_of_yojson
let patch_unreported_not_applicable_count_of_yojson = int_of_yojson
let patch_failed_count_of_yojson = int_of_yojson
let patch_missing_count_of_yojson = int_of_yojson
let patch_installed_rejected_count_of_yojson = int_of_yojson
let patch_installed_pending_reboot_count_of_yojson = int_of_yojson
let patch_installed_other_count_of_yojson = int_of_yojson
let patch_installed_count_of_yojson = int_of_yojson
let install_override_list_of_yojson = string_of_yojson

let instance_patch_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
     patch_group = value_for_key patch_group_of_yojson "PatchGroup" _list path;
     baseline_id = value_for_key baseline_id_of_yojson "BaselineId" _list path;
     snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path;
     install_override_list =
       option_of_yojson
         (value_for_key install_override_list_of_yojson "InstallOverrideList")
         _list path;
     owner_information =
       option_of_yojson (value_for_key owner_information_of_yojson "OwnerInformation") _list path;
     installed_count =
       option_of_yojson (value_for_key patch_installed_count_of_yojson "InstalledCount") _list path;
     installed_other_count =
       option_of_yojson
         (value_for_key patch_installed_other_count_of_yojson "InstalledOtherCount")
         _list path;
     installed_pending_reboot_count =
       option_of_yojson
         (value_for_key patch_installed_pending_reboot_count_of_yojson "InstalledPendingRebootCount")
         _list path;
     installed_rejected_count =
       option_of_yojson
         (value_for_key patch_installed_rejected_count_of_yojson "InstalledRejectedCount")
         _list path;
     missing_count =
       option_of_yojson (value_for_key patch_missing_count_of_yojson "MissingCount") _list path;
     failed_count =
       option_of_yojson (value_for_key patch_failed_count_of_yojson "FailedCount") _list path;
     unreported_not_applicable_count =
       option_of_yojson
         (value_for_key patch_unreported_not_applicable_count_of_yojson
            "UnreportedNotApplicableCount")
         _list path;
     not_applicable_count =
       option_of_yojson
         (value_for_key patch_not_applicable_count_of_yojson "NotApplicableCount")
         _list path;
     available_security_update_count =
       option_of_yojson
         (value_for_key patch_available_security_update_count_of_yojson
            "AvailableSecurityUpdateCount")
         _list path;
     operation_start_time = value_for_key date_time_of_yojson "OperationStartTime" _list path;
     operation_end_time = value_for_key date_time_of_yojson "OperationEndTime" _list path;
     operation = value_for_key patch_operation_type_of_yojson "Operation" _list path;
     last_no_reboot_install_operation_time =
       option_of_yojson
         (value_for_key date_time_of_yojson "LastNoRebootInstallOperationTime")
         _list path;
     reboot_option =
       option_of_yojson (value_for_key reboot_option_of_yojson "RebootOption") _list path;
     critical_non_compliant_count =
       option_of_yojson
         (value_for_key patch_critical_non_compliant_count_of_yojson "CriticalNonCompliantCount")
         _list path;
     security_non_compliant_count =
       option_of_yojson
         (value_for_key patch_security_non_compliant_count_of_yojson "SecurityNonCompliantCount")
         _list path;
     other_non_compliant_count =
       option_of_yojson
         (value_for_key patch_other_non_compliant_count_of_yojson "OtherNonCompliantCount")
         _list path;
   }
    : instance_patch_state)

let instance_patch_states_list_of_yojson tree path =
  list_of_yojson instance_patch_state_of_yojson tree path

let describe_instance_patch_states_for_patch_group_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_patch_states =
       option_of_yojson
         (value_for_key instance_patch_states_list_of_yojson "InstancePatchStates")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_instance_patch_states_for_patch_group_result)

let patch_compliance_max_results_of_yojson = int_of_yojson

let instance_patch_state_operator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Equal" -> EQUAL
    | `String "NotEqual" -> NOT_EQUAL
    | `String "LessThan" -> LESS_THAN
    | `String "GreaterThan" -> GREATER_THAN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstancePatchStateOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "InstancePatchStateOperatorType")
     : instance_patch_state_operator_type)
    : instance_patch_state_operator_type)

let instance_patch_state_filter_value_of_yojson = string_of_yojson

let instance_patch_state_filter_values_of_yojson tree path =
  list_of_yojson instance_patch_state_filter_value_of_yojson tree path

let instance_patch_state_filter_key_of_yojson = string_of_yojson

let instance_patch_state_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key instance_patch_state_filter_key_of_yojson "Key" _list path;
     values = value_for_key instance_patch_state_filter_values_of_yojson "Values" _list path;
     type_ = value_for_key instance_patch_state_operator_type_of_yojson "Type" _list path;
   }
    : instance_patch_state_filter)

let instance_patch_state_filter_list_of_yojson tree path =
  list_of_yojson instance_patch_state_filter_of_yojson tree path

let describe_instance_patch_states_for_patch_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     patch_group = value_for_key patch_group_of_yojson "PatchGroup" _list path;
     filters =
       option_of_yojson
         (value_for_key instance_patch_state_filter_list_of_yojson "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key patch_compliance_max_results_of_yojson "MaxResults")
         _list path;
   }
    : describe_instance_patch_states_for_patch_group_request)

let instance_patch_state_list_of_yojson tree path =
  list_of_yojson instance_patch_state_of_yojson tree path

let describe_instance_patch_states_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_patch_states =
       option_of_yojson
         (value_for_key instance_patch_state_list_of_yojson "InstancePatchStates")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_instance_patch_states_result)

let describe_instance_patch_states_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_ids = value_for_key instance_id_list_of_yojson "InstanceIds" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key patch_compliance_max_results_of_yojson "MaxResults")
         _list path;
   }
    : describe_instance_patch_states_request)

let patch_cve_ids_of_yojson = string_of_yojson

let patch_compliance_data_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSTALLED" -> Installed
    | `String "INSTALLED_OTHER" -> InstalledOther
    | `String "INSTALLED_PENDING_REBOOT" -> InstalledPendingReboot
    | `String "INSTALLED_REJECTED" -> InstalledRejected
    | `String "MISSING" -> Missing
    | `String "NOT_APPLICABLE" -> NotApplicable
    | `String "FAILED" -> Failed
    | `String "AVAILABLE_SECURITY_UPDATE" -> AvailableSecurityUpdate
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PatchComplianceDataState" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchComplianceDataState")
     : patch_compliance_data_state)
    : patch_compliance_data_state)

let patch_severity_of_yojson = string_of_yojson
let patch_classification_of_yojson = string_of_yojson
let patch_kb_number_of_yojson = string_of_yojson
let patch_title_of_yojson = string_of_yojson

let patch_compliance_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     title = value_for_key patch_title_of_yojson "Title" _list path;
     kb_id = value_for_key patch_kb_number_of_yojson "KBId" _list path;
     classification = value_for_key patch_classification_of_yojson "Classification" _list path;
     severity = value_for_key patch_severity_of_yojson "Severity" _list path;
     state = value_for_key patch_compliance_data_state_of_yojson "State" _list path;
     installed_time = value_for_key date_time_of_yojson "InstalledTime" _list path;
     cve_ids = option_of_yojson (value_for_key patch_cve_ids_of_yojson "CVEIds") _list path;
   }
    : patch_compliance_data)

let patch_compliance_data_list_of_yojson tree path =
  list_of_yojson patch_compliance_data_of_yojson tree path

let describe_instance_patches_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     patches =
       option_of_yojson (value_for_key patch_compliance_data_list_of_yojson "Patches") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_instance_patches_result)

let describe_instance_patches_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
     filters =
       option_of_yojson
         (value_for_key patch_orchestrator_filter_list_of_yojson "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key patch_compliance_max_results_of_yojson "MaxResults")
         _list path;
   }
    : describe_instance_patches_request)

let invalid_instance_information_filter_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_instance_information_filter_value)

let instance_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     ping_status = option_of_yojson (value_for_key ping_status_of_yojson "PingStatus") _list path;
     last_ping_date_time =
       option_of_yojson (value_for_key date_time_of_yojson "LastPingDateTime") _list path;
     agent_version = option_of_yojson (value_for_key version_of_yojson "AgentVersion") _list path;
     is_latest_version =
       option_of_yojson (value_for_key boolean__of_yojson "IsLatestVersion") _list path;
     platform_type =
       option_of_yojson (value_for_key platform_type_of_yojson "PlatformType") _list path;
     platform_name = option_of_yojson (value_for_key string__of_yojson "PlatformName") _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "PlatformVersion") _list path;
     activation_id =
       option_of_yojson (value_for_key activation_id_of_yojson "ActivationId") _list path;
     iam_role = option_of_yojson (value_for_key iam_role_of_yojson "IamRole") _list path;
     registration_date =
       option_of_yojson (value_for_key date_time_of_yojson "RegistrationDate") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IPAddress") _list path;
     computer_name =
       option_of_yojson (value_for_key computer_name_of_yojson "ComputerName") _list path;
     association_status =
       option_of_yojson (value_for_key status_name_of_yojson "AssociationStatus") _list path;
     last_association_execution_date =
       option_of_yojson
         (value_for_key date_time_of_yojson "LastAssociationExecutionDate")
         _list path;
     last_successful_association_execution_date =
       option_of_yojson
         (value_for_key date_time_of_yojson "LastSuccessfulAssociationExecutionDate")
         _list path;
     association_overview =
       option_of_yojson
         (value_for_key instance_aggregated_association_overview_of_yojson "AssociationOverview")
         _list path;
     source_id = option_of_yojson (value_for_key source_id_of_yojson "SourceId") _list path;
     source_type = option_of_yojson (value_for_key source_type_of_yojson "SourceType") _list path;
   }
    : instance_information)

let instance_information_list_of_yojson tree path =
  list_of_yojson instance_information_of_yojson tree path

let describe_instance_information_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_information_list =
       option_of_yojson
         (value_for_key instance_information_list_of_yojson "InstanceInformationList")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_instance_information_result)

let max_results_ec2_compatible_of_yojson = int_of_yojson
let instance_information_filter_value_of_yojson = string_of_yojson

let instance_information_filter_value_set_of_yojson tree path =
  list_of_yojson instance_information_filter_value_of_yojson tree path

let instance_information_string_filter_key_of_yojson = string_of_yojson

let instance_information_string_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key instance_information_string_filter_key_of_yojson "Key" _list path;
     values = value_for_key instance_information_filter_value_set_of_yojson "Values" _list path;
   }
    : instance_information_string_filter)

let instance_information_string_filter_list_of_yojson tree path =
  list_of_yojson instance_information_string_filter_of_yojson tree path

let instance_information_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "InstanceIds" -> INSTANCE_IDS
    | `String "AgentVersion" -> AGENT_VERSION
    | `String "PingStatus" -> PING_STATUS
    | `String "PlatformTypes" -> PLATFORM_TYPES
    | `String "ActivationIds" -> ACTIVATION_IDS
    | `String "IamRole" -> IAM_ROLE
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "AssociationStatus" -> ASSOCIATION_STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceInformationFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceInformationFilterKey")
     : instance_information_filter_key)
    : instance_information_filter_key)

let instance_information_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key instance_information_filter_key_of_yojson "key" _list path;
     value_set = value_for_key instance_information_filter_value_set_of_yojson "valueSet" _list path;
   }
    : instance_information_filter)

let instance_information_filter_list_of_yojson tree path =
  list_of_yojson instance_information_filter_of_yojson tree path

let describe_instance_information_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_information_filter_list =
       option_of_yojson
         (value_for_key instance_information_filter_list_of_yojson "InstanceInformationFilterList")
         _list path;
     filters =
       option_of_yojson
         (value_for_key instance_information_string_filter_list_of_yojson "Filters")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_results_ec2_compatible_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_instance_information_request)

let s3_output_url_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ output_url = option_of_yojson (value_for_key url_of_yojson "OutputUrl") _list path }
    : s3_output_url)

let instance_association_output_url_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_output_url =
       option_of_yojson (value_for_key s3_output_url_of_yojson "S3OutputUrl") _list path;
   }
    : instance_association_output_url)

let instance_association_execution_summary_of_yojson = string_of_yojson

let instance_association_status_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       option_of_yojson (value_for_key association_id_of_yojson "AssociationId") _list path;
     name = option_of_yojson (value_for_key document_ar_n_of_yojson "Name") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     association_version =
       option_of_yojson
         (value_for_key association_version_of_yojson "AssociationVersion")
         _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     execution_date =
       option_of_yojson (value_for_key date_time_of_yojson "ExecutionDate") _list path;
     status = option_of_yojson (value_for_key status_name_of_yojson "Status") _list path;
     detailed_status =
       option_of_yojson (value_for_key status_name_of_yojson "DetailedStatus") _list path;
     execution_summary =
       option_of_yojson
         (value_for_key instance_association_execution_summary_of_yojson "ExecutionSummary")
         _list path;
     error_code = option_of_yojson (value_for_key agent_error_code_of_yojson "ErrorCode") _list path;
     output_url =
       option_of_yojson
         (value_for_key instance_association_output_url_of_yojson "OutputUrl")
         _list path;
     association_name =
       option_of_yojson (value_for_key association_name_of_yojson "AssociationName") _list path;
   }
    : instance_association_status_info)

let instance_association_status_infos_of_yojson tree path =
  list_of_yojson instance_association_status_info_of_yojson tree path

let describe_instance_associations_status_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_association_status_infos =
       option_of_yojson
         (value_for_key instance_association_status_infos_of_yojson "InstanceAssociationStatusInfos")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_instance_associations_status_result)

let describe_instance_associations_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_instance_associations_status_request)

let patch_deployment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPROVED" -> Approved
    | `String "PENDING_APPROVAL" -> PendingApproval
    | `String "EXPLICIT_APPROVED" -> ExplicitApproved
    | `String "EXPLICIT_REJECTED" -> ExplicitRejected
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PatchDeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchDeploymentStatus")
     : patch_deployment_status)
    : patch_deployment_status)

let patch_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_status =
       option_of_yojson
         (value_for_key patch_deployment_status_of_yojson "DeploymentStatus")
         _list path;
     compliance_level =
       option_of_yojson
         (value_for_key patch_compliance_level_of_yojson "ComplianceLevel")
         _list path;
     approval_date = option_of_yojson (value_for_key date_time_of_yojson "ApprovalDate") _list path;
   }
    : patch_status)

let patch_repository_of_yojson = string_of_yojson
let patch_arch_of_yojson = string_of_yojson
let patch_release_of_yojson = string_of_yojson
let patch_version_of_yojson = string_of_yojson
let patch_epoch_of_yojson = int_of_yojson
let patch_name_of_yojson = string_of_yojson
let patch_cve_id_of_yojson = string_of_yojson
let patch_cve_id_list_of_yojson tree path = list_of_yojson patch_cve_id_of_yojson tree path
let patch_bugzilla_id_of_yojson = string_of_yojson

let patch_bugzilla_id_list_of_yojson tree path =
  list_of_yojson patch_bugzilla_id_of_yojson tree path

let patch_advisory_id_of_yojson = string_of_yojson

let patch_advisory_id_list_of_yojson tree path =
  list_of_yojson patch_advisory_id_of_yojson tree path

let patch_language_of_yojson = string_of_yojson
let patch_msrc_number_of_yojson = string_of_yojson
let patch_msrc_severity_of_yojson = string_of_yojson
let patch_product_of_yojson = string_of_yojson
let patch_product_family_of_yojson = string_of_yojson
let patch_vendor_of_yojson = string_of_yojson
let patch_content_url_of_yojson = string_of_yojson
let patch_description_of_yojson = string_of_yojson

let patch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key patch_id_of_yojson "Id") _list path;
     release_date = option_of_yojson (value_for_key date_time_of_yojson "ReleaseDate") _list path;
     title = option_of_yojson (value_for_key patch_title_of_yojson "Title") _list path;
     description =
       option_of_yojson (value_for_key patch_description_of_yojson "Description") _list path;
     content_url =
       option_of_yojson (value_for_key patch_content_url_of_yojson "ContentUrl") _list path;
     vendor = option_of_yojson (value_for_key patch_vendor_of_yojson "Vendor") _list path;
     product_family =
       option_of_yojson (value_for_key patch_product_family_of_yojson "ProductFamily") _list path;
     product = option_of_yojson (value_for_key patch_product_of_yojson "Product") _list path;
     classification =
       option_of_yojson (value_for_key patch_classification_of_yojson "Classification") _list path;
     msrc_severity =
       option_of_yojson (value_for_key patch_msrc_severity_of_yojson "MsrcSeverity") _list path;
     kb_number = option_of_yojson (value_for_key patch_kb_number_of_yojson "KbNumber") _list path;
     msrc_number =
       option_of_yojson (value_for_key patch_msrc_number_of_yojson "MsrcNumber") _list path;
     language = option_of_yojson (value_for_key patch_language_of_yojson "Language") _list path;
     advisory_ids =
       option_of_yojson (value_for_key patch_advisory_id_list_of_yojson "AdvisoryIds") _list path;
     bugzilla_ids =
       option_of_yojson (value_for_key patch_bugzilla_id_list_of_yojson "BugzillaIds") _list path;
     cve_ids = option_of_yojson (value_for_key patch_cve_id_list_of_yojson "CVEIds") _list path;
     name = option_of_yojson (value_for_key patch_name_of_yojson "Name") _list path;
     epoch = option_of_yojson (value_for_key patch_epoch_of_yojson "Epoch") _list path;
     version = option_of_yojson (value_for_key patch_version_of_yojson "Version") _list path;
     release = option_of_yojson (value_for_key patch_release_of_yojson "Release") _list path;
     arch = option_of_yojson (value_for_key patch_arch_of_yojson "Arch") _list path;
     severity = option_of_yojson (value_for_key patch_severity_of_yojson "Severity") _list path;
     repository =
       option_of_yojson (value_for_key patch_repository_of_yojson "Repository") _list path;
   }
    : patch)

let effective_patch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     patch = option_of_yojson (value_for_key patch_of_yojson "Patch") _list path;
     patch_status = option_of_yojson (value_for_key patch_status_of_yojson "PatchStatus") _list path;
   }
    : effective_patch)

let effective_patch_list_of_yojson tree path = list_of_yojson effective_patch_of_yojson tree path

let describe_effective_patches_for_patch_baseline_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     effective_patches =
       option_of_yojson (value_for_key effective_patch_list_of_yojson "EffectivePatches") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_effective_patches_for_patch_baseline_result)

let describe_effective_patches_for_patch_baseline_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_id = value_for_key baseline_id_of_yojson "BaselineId" _list path;
     max_results =
       option_of_yojson (value_for_key patch_baseline_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_effective_patches_for_patch_baseline_request)

let instance_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       option_of_yojson (value_for_key association_id_of_yojson "AssociationId") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     content = option_of_yojson (value_for_key document_content_of_yojson "Content") _list path;
     association_version =
       option_of_yojson
         (value_for_key association_version_of_yojson "AssociationVersion")
         _list path;
   }
    : instance_association)

let instance_association_list_of_yojson tree path =
  list_of_yojson instance_association_of_yojson tree path

let describe_effective_instance_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associations =
       option_of_yojson
         (value_for_key instance_association_list_of_yojson "Associations")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_effective_instance_associations_result)

let effective_instance_association_max_results_of_yojson = int_of_yojson

let describe_effective_instance_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = value_for_key instance_id_of_yojson "InstanceId" _list path;
     max_results =
       option_of_yojson
         (value_for_key effective_instance_association_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_effective_instance_associations_request)

let describe_document_permission_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids =
       option_of_yojson (value_for_key account_id_list_of_yojson "AccountIds") _list path;
     account_sharing_info_list =
       option_of_yojson
         (value_for_key account_sharing_info_list_of_yojson "AccountSharingInfoList")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_document_permission_response)

let document_permission_max_results_of_yojson = int_of_yojson

let describe_document_permission_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_name_of_yojson "Name" _list path;
     permission_type = value_for_key document_permission_type_of_yojson "PermissionType" _list path;
     max_results =
       option_of_yojson
         (value_for_key document_permission_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_document_permission_request)

let describe_document_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document =
       option_of_yojson (value_for_key document_description_of_yojson "Document") _list path;
   }
    : describe_document_result)

let describe_document_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_ar_n_of_yojson "Name" _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     version_name =
       option_of_yojson (value_for_key document_version_name_of_yojson "VersionName") _list path;
   }
    : describe_document_request)

let patch_list_of_yojson tree path = list_of_yojson patch_of_yojson tree path

let describe_available_patches_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     patches = option_of_yojson (value_for_key patch_list_of_yojson "Patches") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_available_patches_result)

let describe_available_patches_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson
         (value_for_key patch_orchestrator_filter_list_of_yojson "Filters")
         _list path;
     max_results =
       option_of_yojson (value_for_key patch_baseline_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_available_patches_request)

let describe_automation_step_executions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     step_executions =
       option_of_yojson (value_for_key step_execution_list_of_yojson "StepExecutions") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_automation_step_executions_result)

let step_execution_filter_value_of_yojson = string_of_yojson

let step_execution_filter_value_list_of_yojson tree path =
  list_of_yojson step_execution_filter_value_of_yojson tree path

let step_execution_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "StartTimeBefore" -> START_TIME_BEFORE
    | `String "StartTimeAfter" -> START_TIME_AFTER
    | `String "StepExecutionStatus" -> STEP_EXECUTION_STATUS
    | `String "StepExecutionId" -> STEP_EXECUTION_ID
    | `String "StepName" -> STEP_NAME
    | `String "Action" -> ACTION
    | `String "ParentStepExecutionId" -> PARENT_STEP_EXECUTION_ID
    | `String "ParentStepIteration" -> PARENT_STEP_ITERATION
    | `String "ParentStepIteratorValue" -> PARENT_STEP_ITERATOR_VALUE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StepExecutionFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "StepExecutionFilterKey")
     : step_execution_filter_key)
    : step_execution_filter_key)

let step_execution_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key step_execution_filter_key_of_yojson "Key" _list path;
     values = value_for_key step_execution_filter_value_list_of_yojson "Values" _list path;
   }
    : step_execution_filter)

let step_execution_filter_list_of_yojson tree path =
  list_of_yojson step_execution_filter_of_yojson tree path

let describe_automation_step_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_execution_id =
       value_for_key automation_execution_id_of_yojson "AutomationExecutionId" _list path;
     filters =
       option_of_yojson (value_for_key step_execution_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     reverse_order = option_of_yojson (value_for_key boolean__of_yojson "ReverseOrder") _list path;
   }
    : describe_automation_step_executions_request)

let automation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CrossAccount" -> CrossAccount
    | `String "Local" -> Local
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutomationType" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationType")
     : automation_type)
    : automation_type)

let automation_execution_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_execution_id =
       option_of_yojson
         (value_for_key automation_execution_id_of_yojson "AutomationExecutionId")
         _list path;
     document_name =
       option_of_yojson (value_for_key document_name_of_yojson "DocumentName") _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     automation_execution_status =
       option_of_yojson
         (value_for_key automation_execution_status_of_yojson "AutomationExecutionStatus")
         _list path;
     execution_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "ExecutionStartTime") _list path;
     execution_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "ExecutionEndTime") _list path;
     executed_by = option_of_yojson (value_for_key string__of_yojson "ExecutedBy") _list path;
     log_file = option_of_yojson (value_for_key string__of_yojson "LogFile") _list path;
     outputs =
       option_of_yojson (value_for_key automation_parameter_map_of_yojson "Outputs") _list path;
     mode = option_of_yojson (value_for_key execution_mode_of_yojson "Mode") _list path;
     parent_automation_execution_id =
       option_of_yojson
         (value_for_key automation_execution_id_of_yojson "ParentAutomationExecutionId")
         _list path;
     current_step_name =
       option_of_yojson (value_for_key string__of_yojson "CurrentStepName") _list path;
     current_action = option_of_yojson (value_for_key string__of_yojson "CurrentAction") _list path;
     failure_message =
       option_of_yojson (value_for_key string__of_yojson "FailureMessage") _list path;
     target_parameter_name =
       option_of_yojson
         (value_for_key automation_parameter_key_of_yojson "TargetParameterName")
         _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     target_maps = option_of_yojson (value_for_key target_maps_of_yojson "TargetMaps") _list path;
     resolved_targets =
       option_of_yojson (value_for_key resolved_targets_of_yojson "ResolvedTargets") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     target = option_of_yojson (value_for_key string__of_yojson "Target") _list path;
     automation_type =
       option_of_yojson (value_for_key automation_type_of_yojson "AutomationType") _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
     triggered_alarms =
       option_of_yojson
         (value_for_key alarm_state_information_list_of_yojson "TriggeredAlarms")
         _list path;
     target_locations_ur_l =
       option_of_yojson
         (value_for_key target_locations_ur_l_of_yojson "TargetLocationsURL")
         _list path;
     automation_subtype =
       option_of_yojson (value_for_key automation_subtype_of_yojson "AutomationSubtype") _list path;
     scheduled_time =
       option_of_yojson (value_for_key date_time_of_yojson "ScheduledTime") _list path;
     runbooks = option_of_yojson (value_for_key runbooks_of_yojson "Runbooks") _list path;
     ops_item_id = option_of_yojson (value_for_key string__of_yojson "OpsItemId") _list path;
     association_id = option_of_yojson (value_for_key string__of_yojson "AssociationId") _list path;
     change_request_name =
       option_of_yojson (value_for_key change_request_name_of_yojson "ChangeRequestName") _list path;
   }
    : automation_execution_metadata)

let automation_execution_metadata_list_of_yojson tree path =
  list_of_yojson automation_execution_metadata_of_yojson tree path

let describe_automation_executions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_execution_metadata_list =
       option_of_yojson
         (value_for_key automation_execution_metadata_list_of_yojson
            "AutomationExecutionMetadataList")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_automation_executions_result)

let automation_execution_filter_value_of_yojson = string_of_yojson

let automation_execution_filter_value_list_of_yojson tree path =
  list_of_yojson automation_execution_filter_value_of_yojson tree path

let automation_execution_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "DocumentNamePrefix" -> DOCUMENT_NAME_PREFIX
    | `String "ExecutionStatus" -> EXECUTION_STATUS
    | `String "ExecutionId" -> EXECUTION_ID
    | `String "ParentExecutionId" -> PARENT_EXECUTION_ID
    | `String "CurrentAction" -> CURRENT_ACTION
    | `String "StartTimeBefore" -> START_TIME_BEFORE
    | `String "StartTimeAfter" -> START_TIME_AFTER
    | `String "AutomationType" -> AUTOMATION_TYPE
    | `String "TagKey" -> TAG_KEY
    | `String "TargetResourceGroup" -> TARGET_RESOURCE_GROUP
    | `String "AutomationSubtype" -> AUTOMATION_SUBTYPE
    | `String "OpsItemId" -> OPS_ITEM_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutomationExecutionFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationExecutionFilterKey")
     : automation_execution_filter_key)
    : automation_execution_filter_key)

let automation_execution_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key automation_execution_filter_key_of_yojson "Key" _list path;
     values = value_for_key automation_execution_filter_value_list_of_yojson "Values" _list path;
   }
    : automation_execution_filter)

let automation_execution_filter_list_of_yojson tree path =
  list_of_yojson automation_execution_filter_of_yojson tree path

let describe_automation_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson
         (value_for_key automation_execution_filter_list_of_yojson "Filters")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_automation_executions_request)

let association_execution_does_not_exist_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : association_execution_does_not_exist)

let output_source_type_of_yojson = string_of_yojson
let output_source_id_of_yojson = string_of_yojson

let output_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_source_id =
       option_of_yojson (value_for_key output_source_id_of_yojson "OutputSourceId") _list path;
     output_source_type =
       option_of_yojson (value_for_key output_source_type_of_yojson "OutputSourceType") _list path;
   }
    : output_source)

let association_resource_type_of_yojson = string_of_yojson
let association_resource_id_of_yojson = string_of_yojson
let association_execution_id_of_yojson = string_of_yojson

let association_execution_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       option_of_yojson (value_for_key association_id_of_yojson "AssociationId") _list path;
     association_version =
       option_of_yojson
         (value_for_key association_version_of_yojson "AssociationVersion")
         _list path;
     execution_id =
       option_of_yojson (value_for_key association_execution_id_of_yojson "ExecutionId") _list path;
     resource_id =
       option_of_yojson (value_for_key association_resource_id_of_yojson "ResourceId") _list path;
     resource_type =
       option_of_yojson
         (value_for_key association_resource_type_of_yojson "ResourceType")
         _list path;
     status = option_of_yojson (value_for_key status_name_of_yojson "Status") _list path;
     detailed_status =
       option_of_yojson (value_for_key status_name_of_yojson "DetailedStatus") _list path;
     last_execution_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastExecutionDate") _list path;
     output_source =
       option_of_yojson (value_for_key output_source_of_yojson "OutputSource") _list path;
   }
    : association_execution_target)

let association_execution_targets_list_of_yojson tree path =
  list_of_yojson association_execution_target_of_yojson tree path

let describe_association_execution_targets_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_execution_targets =
       option_of_yojson
         (value_for_key association_execution_targets_list_of_yojson "AssociationExecutionTargets")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_association_execution_targets_result)

let association_execution_targets_filter_value_of_yojson = string_of_yojson

let association_execution_targets_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "Status" -> Status
    | `String "ResourceId" -> ResourceId
    | `String "ResourceType" -> ResourceType
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AssociationExecutionTargetsFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationExecutionTargetsFilterKey")
     : association_execution_targets_filter_key)
    : association_execution_targets_filter_key)

let association_execution_targets_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key association_execution_targets_filter_key_of_yojson "Key" _list path;
     value = value_for_key association_execution_targets_filter_value_of_yojson "Value" _list path;
   }
    : association_execution_targets_filter)

let association_execution_targets_filter_list_of_yojson tree path =
  list_of_yojson association_execution_targets_filter_of_yojson tree path

let describe_association_execution_targets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id = value_for_key association_id_of_yojson "AssociationId" _list path;
     execution_id = value_for_key association_execution_id_of_yojson "ExecutionId" _list path;
     filters =
       option_of_yojson
         (value_for_key association_execution_targets_filter_list_of_yojson "Filters")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_association_execution_targets_request)

let resource_count_by_status_of_yojson = string_of_yojson

let association_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       option_of_yojson (value_for_key association_id_of_yojson "AssociationId") _list path;
     association_version =
       option_of_yojson
         (value_for_key association_version_of_yojson "AssociationVersion")
         _list path;
     execution_id =
       option_of_yojson (value_for_key association_execution_id_of_yojson "ExecutionId") _list path;
     status = option_of_yojson (value_for_key status_name_of_yojson "Status") _list path;
     detailed_status =
       option_of_yojson (value_for_key status_name_of_yojson "DetailedStatus") _list path;
     created_time = option_of_yojson (value_for_key date_time_of_yojson "CreatedTime") _list path;
     last_execution_date =
       option_of_yojson (value_for_key date_time_of_yojson "LastExecutionDate") _list path;
     resource_count_by_status =
       option_of_yojson
         (value_for_key resource_count_by_status_of_yojson "ResourceCountByStatus")
         _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
     triggered_alarms =
       option_of_yojson
         (value_for_key alarm_state_information_list_of_yojson "TriggeredAlarms")
         _list path;
   }
    : association_execution)

let association_executions_list_of_yojson tree path =
  list_of_yojson association_execution_of_yojson tree path

let describe_association_executions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_executions =
       option_of_yojson
         (value_for_key association_executions_list_of_yojson "AssociationExecutions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_association_executions_result)

let association_filter_operator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUAL" -> Equal
    | `String "LESS_THAN" -> LessThan
    | `String "GREATER_THAN" -> GreaterThan
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AssociationFilterOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationFilterOperatorType")
     : association_filter_operator_type)
    : association_filter_operator_type)

let association_execution_filter_value_of_yojson = string_of_yojson

let association_execution_filter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "ExecutionId" -> ExecutionId
    | `String "Status" -> Status
    | `String "CreatedTime" -> CreatedTime
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AssociationExecutionFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationExecutionFilterKey")
     : association_execution_filter_key)
    : association_execution_filter_key)

let association_execution_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key association_execution_filter_key_of_yojson "Key" _list path;
     value = value_for_key association_execution_filter_value_of_yojson "Value" _list path;
     type_ = value_for_key association_filter_operator_type_of_yojson "Type" _list path;
   }
    : association_execution_filter)

let association_execution_filter_list_of_yojson tree path =
  list_of_yojson association_execution_filter_of_yojson tree path

let describe_association_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id = value_for_key association_id_of_yojson "AssociationId" _list path;
     filters =
       option_of_yojson
         (value_for_key association_execution_filter_list_of_yojson "Filters")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_association_executions_request)

let describe_association_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_description =
       option_of_yojson
         (value_for_key association_description_of_yojson "AssociationDescription")
         _list path;
   }
    : describe_association_result)

let describe_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key document_ar_n_of_yojson "Name") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     association_id =
       option_of_yojson (value_for_key association_id_of_yojson "AssociationId") _list path;
     association_version =
       option_of_yojson
         (value_for_key association_version_of_yojson "AssociationVersion")
         _list path;
   }
    : describe_association_request)

let describe_activations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activation_list =
       option_of_yojson (value_for_key activation_list_of_yojson "ActivationList") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_activations_result)

let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let describe_activations_filter_keys_of_yojson (tree : t) path =
  ((match tree with
    | `String "ActivationIds" -> ACTIVATION_IDS
    | `String "DefaultInstanceName" -> DEFAULT_INSTANCE_NAME
    | `String "IamRole" -> IAM_ROLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DescribeActivationsFilterKeys" value)
    | _ -> raise (deserialize_wrong_type_error path "DescribeActivationsFilterKeys")
     : describe_activations_filter_keys)
    : describe_activations_filter_keys)

let describe_activations_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_key =
       option_of_yojson
         (value_for_key describe_activations_filter_keys_of_yojson "FilterKey")
         _list path;
     filter_values =
       option_of_yojson (value_for_key string_list_of_yojson "FilterValues") _list path;
   }
    : describe_activations_filter)

let describe_activations_filter_list_of_yojson tree path =
  list_of_yojson describe_activations_filter_of_yojson tree path

let describe_activations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson
         (value_for_key describe_activations_filter_list_of_yojson "Filters")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_activations_request)

let deregister_task_from_maintenance_window_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     window_task_id =
       option_of_yojson
         (value_for_key maintenance_window_task_id_of_yojson "WindowTaskId")
         _list path;
   }
    : deregister_task_from_maintenance_window_result)

let deregister_task_from_maintenance_window_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path;
     window_task_id = value_for_key maintenance_window_task_id_of_yojson "WindowTaskId" _list path;
   }
    : deregister_task_from_maintenance_window_request)

let target_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : target_in_use_exception)

let deregister_target_from_maintenance_window_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
     window_target_id =
       option_of_yojson
         (value_for_key maintenance_window_target_id_of_yojson "WindowTargetId")
         _list path;
   }
    : deregister_target_from_maintenance_window_result)

let deregister_target_from_maintenance_window_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path;
     window_target_id =
       value_for_key maintenance_window_target_id_of_yojson "WindowTargetId" _list path;
     safe = option_of_yojson (value_for_key boolean__of_yojson "Safe") _list path;
   }
    : deregister_target_from_maintenance_window_request)

let deregister_patch_baseline_for_patch_group_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_id = option_of_yojson (value_for_key baseline_id_of_yojson "BaselineId") _list path;
     patch_group = option_of_yojson (value_for_key patch_group_of_yojson "PatchGroup") _list path;
   }
    : deregister_patch_baseline_for_patch_group_result)

let deregister_patch_baseline_for_patch_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_id = value_for_key baseline_id_of_yojson "BaselineId" _list path;
     patch_group = value_for_key patch_group_of_yojson "PatchGroup" _list path;
   }
    : deregister_patch_baseline_for_patch_group_request)

let deregister_managed_instance_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deregister_managed_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_id = value_for_key managed_instance_id_of_yojson "InstanceId" _list path }
    : deregister_managed_instance_request)

let delete_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_string_of_yojson "ResourceArn" _list path;
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
     policy_hash = value_for_key policy_hash_of_yojson "PolicyHash" _list path;
   }
    : delete_resource_policy_request)

let delete_resource_data_sync_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_resource_data_sync_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_name = value_for_key resource_data_sync_name_of_yojson "SyncName" _list path;
     sync_type =
       option_of_yojson (value_for_key resource_data_sync_type_of_yojson "SyncType") _list path;
   }
    : delete_resource_data_sync_request)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_in_use_exception)

let delete_patch_baseline_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ baseline_id = option_of_yojson (value_for_key baseline_id_of_yojson "BaselineId") _list path }
    : delete_patch_baseline_result)

let delete_patch_baseline_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ baseline_id = value_for_key baseline_id_of_yojson "BaselineId" _list path }
    : delete_patch_baseline_request)

let delete_parameters_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deleted_parameters =
       option_of_yojson (value_for_key parameter_name_list_of_yojson "DeletedParameters") _list path;
     invalid_parameters =
       option_of_yojson (value_for_key parameter_name_list_of_yojson "InvalidParameters") _list path;
   }
    : delete_parameters_result)

let delete_parameters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ names = value_for_key parameter_name_list_of_yojson "Names" _list path }
    : delete_parameters_request)

let delete_parameter_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_parameter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key ps_parameter_name_of_yojson "Name" _list path }
    : delete_parameter_request)

let delete_ops_metadata_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_ops_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ops_metadata_arn = value_for_key ops_metadata_arn_of_yojson "OpsMetadataArn" _list path }
    : delete_ops_metadata_request)

let delete_ops_item_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_ops_item_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ops_item_id = value_for_key ops_item_id_of_yojson "OpsItemId" _list path }
    : delete_ops_item_request)

let delete_maintenance_window_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
   }
    : delete_maintenance_window_result)

let delete_maintenance_window_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ window_id = value_for_key maintenance_window_id_of_yojson "WindowId" _list path }
    : delete_maintenance_window_request)

let invalid_option_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_option_exception)

let invalid_inventory_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_inventory_request_exception)

let invalid_delete_inventory_parameters_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_delete_inventory_parameters_exception)

let delete_inventory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deletion_id = option_of_yojson (value_for_key uui_d_of_yojson "DeletionId") _list path;
     type_name =
       option_of_yojson (value_for_key inventory_item_type_name_of_yojson "TypeName") _list path;
     deletion_summary =
       option_of_yojson
         (value_for_key inventory_deletion_summary_of_yojson "DeletionSummary")
         _list path;
   }
    : delete_inventory_result)

let dry_run_of_yojson = bool_of_yojson

let inventory_schema_delete_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "DisableSchema" -> DISABLE_SCHEMA
    | `String "DeleteSchema" -> DELETE_SCHEMA
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InventorySchemaDeleteOption" value)
    | _ -> raise (deserialize_wrong_type_error path "InventorySchemaDeleteOption")
     : inventory_schema_delete_option)
    : inventory_schema_delete_option)

let delete_inventory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_name = value_for_key inventory_item_type_name_of_yojson "TypeName" _list path;
     schema_delete_option =
       option_of_yojson
         (value_for_key inventory_schema_delete_option_of_yojson "SchemaDeleteOption")
         _list path;
     dry_run = option_of_yojson (value_for_key dry_run_of_yojson "DryRun") _list path;
     client_token = option_of_yojson (value_for_key uui_d_of_yojson "ClientToken") _list path;
   }
    : delete_inventory_request)

let associated_instances_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_document_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_document_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_name_of_yojson "Name" _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     version_name =
       option_of_yojson (value_for_key document_version_name_of_yojson "VersionName") _list path;
     force = option_of_yojson (value_for_key boolean__of_yojson "Force") _list path;
   }
    : delete_document_request)

let delete_association_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key document_ar_n_of_yojson "Name") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     association_id =
       option_of_yojson (value_for_key association_id_of_yojson "AssociationId") _list path;
   }
    : delete_association_request)

let invalid_activation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_activation)

let delete_activation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_activation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ activation_id = value_for_key activation_id_of_yojson "ActivationId" _list path }
    : delete_activation_request)

let resource_data_sync_count_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_data_sync_count_exceeded_exception)

let resource_data_sync_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_name =
       option_of_yojson (value_for_key resource_data_sync_name_of_yojson "SyncName") _list path;
   }
    : resource_data_sync_already_exists_exception)

let create_resource_data_sync_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_resource_data_sync_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_name = value_for_key resource_data_sync_name_of_yojson "SyncName" _list path;
     s3_destination =
       option_of_yojson
         (value_for_key resource_data_sync_s3_destination_of_yojson "S3Destination")
         _list path;
     sync_type =
       option_of_yojson (value_for_key resource_data_sync_type_of_yojson "SyncType") _list path;
     sync_source =
       option_of_yojson (value_for_key resource_data_sync_source_of_yojson "SyncSource") _list path;
   }
    : create_resource_data_sync_request)

let create_patch_baseline_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ baseline_id = option_of_yojson (value_for_key baseline_id_of_yojson "BaselineId") _list path }
    : create_patch_baseline_result)

let create_patch_baseline_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     name = value_for_key baseline_name_of_yojson "Name" _list path;
     global_filters =
       option_of_yojson (value_for_key patch_filter_group_of_yojson "GlobalFilters") _list path;
     approval_rules =
       option_of_yojson (value_for_key patch_rule_group_of_yojson "ApprovalRules") _list path;
     approved_patches =
       option_of_yojson (value_for_key patch_id_list_of_yojson "ApprovedPatches") _list path;
     approved_patches_compliance_level =
       option_of_yojson
         (value_for_key patch_compliance_level_of_yojson "ApprovedPatchesComplianceLevel")
         _list path;
     approved_patches_enable_non_security =
       option_of_yojson
         (value_for_key boolean__of_yojson "ApprovedPatchesEnableNonSecurity")
         _list path;
     rejected_patches =
       option_of_yojson (value_for_key patch_id_list_of_yojson "RejectedPatches") _list path;
     rejected_patches_action =
       option_of_yojson (value_for_key patch_action_of_yojson "RejectedPatchesAction") _list path;
     description =
       option_of_yojson (value_for_key baseline_description_of_yojson "Description") _list path;
     sources = option_of_yojson (value_for_key patch_source_list_of_yojson "Sources") _list path;
     available_security_updates_compliance_status =
       option_of_yojson
         (value_for_key patch_compliance_status_of_yojson "AvailableSecurityUpdatesComplianceStatus")
         _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_patch_baseline_request)

let ops_metadata_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : ops_metadata_limit_exceeded_exception)

let ops_metadata_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : ops_metadata_already_exists_exception)

let create_ops_metadata_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_metadata_arn =
       option_of_yojson (value_for_key ops_metadata_arn_of_yojson "OpsMetadataArn") _list path;
   }
    : create_ops_metadata_result)

let create_ops_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key ops_metadata_resource_id_of_yojson "ResourceId" _list path;
     metadata = option_of_yojson (value_for_key metadata_map_of_yojson "Metadata") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_ops_metadata_request)

let create_ops_item_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_item_id = option_of_yojson (value_for_key string__of_yojson "OpsItemId") _list path;
     ops_item_arn = option_of_yojson (value_for_key ops_item_arn_of_yojson "OpsItemArn") _list path;
   }
    : create_ops_item_response)

let ops_item_account_id_of_yojson = string_of_yojson

let create_ops_item_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = value_for_key ops_item_description_of_yojson "Description" _list path;
     ops_item_type =
       option_of_yojson (value_for_key ops_item_type_of_yojson "OpsItemType") _list path;
     operational_data =
       option_of_yojson
         (value_for_key ops_item_operational_data_of_yojson "OperationalData")
         _list path;
     notifications =
       option_of_yojson (value_for_key ops_item_notifications_of_yojson "Notifications") _list path;
     priority = option_of_yojson (value_for_key ops_item_priority_of_yojson "Priority") _list path;
     related_ops_items =
       option_of_yojson (value_for_key related_ops_items_of_yojson "RelatedOpsItems") _list path;
     source = value_for_key ops_item_source_of_yojson "Source" _list path;
     title = value_for_key ops_item_title_of_yojson "Title" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     category = option_of_yojson (value_for_key ops_item_category_of_yojson "Category") _list path;
     severity = option_of_yojson (value_for_key ops_item_severity_of_yojson "Severity") _list path;
     actual_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "ActualStartTime") _list path;
     actual_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "ActualEndTime") _list path;
     planned_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "PlannedStartTime") _list path;
     planned_end_time =
       option_of_yojson (value_for_key date_time_of_yojson "PlannedEndTime") _list path;
     account_id =
       option_of_yojson (value_for_key ops_item_account_id_of_yojson "AccountId") _list path;
   }
    : create_ops_item_request)

let create_maintenance_window_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_id =
       option_of_yojson (value_for_key maintenance_window_id_of_yojson "WindowId") _list path;
   }
    : create_maintenance_window_result)

let create_maintenance_window_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key maintenance_window_name_of_yojson "Name" _list path;
     description =
       option_of_yojson
         (value_for_key maintenance_window_description_of_yojson "Description")
         _list path;
     start_date =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "StartDate")
         _list path;
     end_date =
       option_of_yojson
         (value_for_key maintenance_window_string_date_time_of_yojson "EndDate")
         _list path;
     schedule = value_for_key maintenance_window_schedule_of_yojson "Schedule" _list path;
     schedule_timezone =
       option_of_yojson
         (value_for_key maintenance_window_timezone_of_yojson "ScheduleTimezone")
         _list path;
     schedule_offset =
       option_of_yojson
         (value_for_key maintenance_window_offset_of_yojson "ScheduleOffset")
         _list path;
     duration = value_for_key maintenance_window_duration_hours_of_yojson "Duration" _list path;
     cutoff = value_for_key maintenance_window_cutoff_of_yojson "Cutoff" _list path;
     allow_unassociated_targets =
       value_for_key maintenance_window_allow_unassociated_targets_of_yojson
         "AllowUnassociatedTargets" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_maintenance_window_request)

let document_already_exists_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : document_already_exists)

let create_document_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_description =
       option_of_yojson
         (value_for_key document_description_of_yojson "DocumentDescription")
         _list path;
   }
    : create_document_result)

let create_document_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content = value_for_key document_content_of_yojson "Content" _list path;
     requires =
       option_of_yojson (value_for_key document_requires_list_of_yojson "Requires") _list path;
     attachments =
       option_of_yojson (value_for_key attachments_source_list_of_yojson "Attachments") _list path;
     name = value_for_key document_name_of_yojson "Name" _list path;
     display_name =
       option_of_yojson (value_for_key document_display_name_of_yojson "DisplayName") _list path;
     version_name =
       option_of_yojson (value_for_key document_version_name_of_yojson "VersionName") _list path;
     document_type =
       option_of_yojson (value_for_key document_type_of_yojson "DocumentType") _list path;
     document_format =
       option_of_yojson (value_for_key document_format_of_yojson "DocumentFormat") _list path;
     target_type = option_of_yojson (value_for_key target_type_of_yojson "TargetType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_document_request)

let association_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let fault_of_yojson (tree : t) path =
  ((match tree with
    | `String "Client" -> Client
    | `String "Server" -> Server
    | `String "Unknown" -> Unknown
    | `String value -> raise (deserialize_unknown_enum_value_error path "Fault" value)
    | _ -> raise (deserialize_wrong_type_error path "Fault")
     : fault)
    : fault)

let batch_error_message_of_yojson = string_of_yojson

let create_association_batch_request_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_ar_n_of_yojson "Name" _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     parameters = option_of_yojson (value_for_key parameters_of_yojson "Parameters") _list path;
     automation_target_parameter_name =
       option_of_yojson
         (value_for_key automation_target_parameter_name_of_yojson "AutomationTargetParameterName")
         _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "ScheduleExpression")
         _list path;
     output_location =
       option_of_yojson
         (value_for_key instance_association_output_location_of_yojson "OutputLocation")
         _list path;
     association_name =
       option_of_yojson (value_for_key association_name_of_yojson "AssociationName") _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     compliance_severity =
       option_of_yojson
         (value_for_key association_compliance_severity_of_yojson "ComplianceSeverity")
         _list path;
     sync_compliance =
       option_of_yojson
         (value_for_key association_sync_compliance_of_yojson "SyncCompliance")
         _list path;
     apply_only_at_cron_interval =
       option_of_yojson
         (value_for_key apply_only_at_cron_interval_of_yojson "ApplyOnlyAtCronInterval")
         _list path;
     calendar_names =
       option_of_yojson
         (value_for_key calendar_name_or_arn_list_of_yojson "CalendarNames")
         _list path;
     target_locations =
       option_of_yojson (value_for_key target_locations_of_yojson "TargetLocations") _list path;
     schedule_offset =
       option_of_yojson (value_for_key schedule_offset_of_yojson "ScheduleOffset") _list path;
     duration = option_of_yojson (value_for_key duration_of_yojson "Duration") _list path;
     target_maps = option_of_yojson (value_for_key target_maps_of_yojson "TargetMaps") _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
   }
    : create_association_batch_request_entry)

let failed_create_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entry =
       option_of_yojson
         (value_for_key create_association_batch_request_entry_of_yojson "Entry")
         _list path;
     message = option_of_yojson (value_for_key batch_error_message_of_yojson "Message") _list path;
     fault = option_of_yojson (value_for_key fault_of_yojson "Fault") _list path;
   }
    : failed_create_association)

let failed_create_association_list_of_yojson tree path =
  list_of_yojson failed_create_association_of_yojson tree path

let association_description_list_of_yojson tree path =
  list_of_yojson association_description_of_yojson tree path

let create_association_batch_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     successful =
       option_of_yojson
         (value_for_key association_description_list_of_yojson "Successful")
         _list path;
     failed =
       option_of_yojson (value_for_key failed_create_association_list_of_yojson "Failed") _list path;
   }
    : create_association_batch_result)

let create_association_batch_request_entries_of_yojson tree path =
  list_of_yojson create_association_batch_request_entry_of_yojson tree path

let create_association_batch_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entries = value_for_key create_association_batch_request_entries_of_yojson "Entries" _list path;
     association_dispatch_assume_role =
       option_of_yojson
         (value_for_key association_dispatch_assume_role_arn_of_yojson
            "AssociationDispatchAssumeRole")
         _list path;
   }
    : create_association_batch_request)

let invalid_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_tag)

let association_already_exists_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_association_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_description =
       option_of_yojson
         (value_for_key association_description_of_yojson "AssociationDescription")
         _list path;
   }
    : create_association_result)

let create_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key document_ar_n_of_yojson "Name" _list path;
     document_version =
       option_of_yojson (value_for_key document_version_of_yojson "DocumentVersion") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "InstanceId") _list path;
     parameters = option_of_yojson (value_for_key parameters_of_yojson "Parameters") _list path;
     targets = option_of_yojson (value_for_key targets_of_yojson "Targets") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "ScheduleExpression")
         _list path;
     output_location =
       option_of_yojson
         (value_for_key instance_association_output_location_of_yojson "OutputLocation")
         _list path;
     association_name =
       option_of_yojson (value_for_key association_name_of_yojson "AssociationName") _list path;
     automation_target_parameter_name =
       option_of_yojson
         (value_for_key automation_target_parameter_name_of_yojson "AutomationTargetParameterName")
         _list path;
     max_errors = option_of_yojson (value_for_key max_errors_of_yojson "MaxErrors") _list path;
     max_concurrency =
       option_of_yojson (value_for_key max_concurrency_of_yojson "MaxConcurrency") _list path;
     compliance_severity =
       option_of_yojson
         (value_for_key association_compliance_severity_of_yojson "ComplianceSeverity")
         _list path;
     sync_compliance =
       option_of_yojson
         (value_for_key association_sync_compliance_of_yojson "SyncCompliance")
         _list path;
     apply_only_at_cron_interval =
       option_of_yojson
         (value_for_key apply_only_at_cron_interval_of_yojson "ApplyOnlyAtCronInterval")
         _list path;
     calendar_names =
       option_of_yojson
         (value_for_key calendar_name_or_arn_list_of_yojson "CalendarNames")
         _list path;
     target_locations =
       option_of_yojson (value_for_key target_locations_of_yojson "TargetLocations") _list path;
     schedule_offset =
       option_of_yojson (value_for_key schedule_offset_of_yojson "ScheduleOffset") _list path;
     duration = option_of_yojson (value_for_key duration_of_yojson "Duration") _list path;
     target_maps = option_of_yojson (value_for_key target_maps_of_yojson "TargetMaps") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "AlarmConfiguration")
         _list path;
     association_dispatch_assume_role =
       option_of_yojson
         (value_for_key association_dispatch_assume_role_arn_of_yojson
            "AssociationDispatchAssumeRole")
         _list path;
   }
    : create_association_request)

let create_activation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activation_id =
       option_of_yojson (value_for_key activation_id_of_yojson "ActivationId") _list path;
     activation_code =
       option_of_yojson (value_for_key activation_code_of_yojson "ActivationCode") _list path;
   }
    : create_activation_result)

let registration_metadata_value_of_yojson = string_of_yojson
let registration_metadata_key_of_yojson = string_of_yojson

let registration_metadata_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key registration_metadata_key_of_yojson "Key" _list path;
     value = value_for_key registration_metadata_value_of_yojson "Value" _list path;
   }
    : registration_metadata_item)

let registration_metadata_list_of_yojson tree path =
  list_of_yojson registration_metadata_item_of_yojson tree path

let create_activation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key activation_description_of_yojson "Description") _list path;
     default_instance_name =
       option_of_yojson
         (value_for_key default_instance_name_of_yojson "DefaultInstanceName")
         _list path;
     iam_role = value_for_key iam_role_of_yojson "IamRole" _list path;
     registration_limit =
       option_of_yojson (value_for_key registration_limit_of_yojson "RegistrationLimit") _list path;
     expiration_date =
       option_of_yojson (value_for_key expiration_date_of_yojson "ExpirationDate") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     registration_metadata =
       option_of_yojson
         (value_for_key registration_metadata_list_of_yojson "RegistrationMetadata")
         _list path;
   }
    : create_activation_request)

let cancel_maintenance_window_execution_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       option_of_yojson
         (value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId")
         _list path;
   }
    : cancel_maintenance_window_execution_result)

let cancel_maintenance_window_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     window_execution_id =
       value_for_key maintenance_window_execution_id_of_yojson "WindowExecutionId" _list path;
   }
    : cancel_maintenance_window_execution_request)

let cancel_command_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_command_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     command_id = value_for_key command_id_of_yojson "CommandId" _list path;
     instance_ids =
       option_of_yojson (value_for_key instance_id_list_of_yojson "InstanceIds") _list path;
   }
    : cancel_command_request)

let ops_item_related_item_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     resource_uri =
       option_of_yojson
         (value_for_key ops_item_related_item_association_resource_uri_of_yojson "ResourceUri")
         _list path;
     ops_item_id = option_of_yojson (value_for_key ops_item_id_of_yojson "OpsItemId") _list path;
   }
    : ops_item_related_item_already_exists_exception)

let associate_ops_item_related_item_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       option_of_yojson
         (value_for_key ops_item_related_item_association_id_of_yojson "AssociationId")
         _list path;
   }
    : associate_ops_item_related_item_response)

let associate_ops_item_related_item_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ops_item_id = value_for_key ops_item_id_of_yojson "OpsItemId" _list path;
     association_type =
       value_for_key ops_item_related_item_association_type_of_yojson "AssociationType" _list path;
     resource_type =
       value_for_key ops_item_related_item_association_resource_type_of_yojson "ResourceType" _list
         path;
     resource_uri =
       value_for_key ops_item_related_item_association_resource_uri_of_yojson "ResourceUri" _list
         path;
   }
    : associate_ops_item_related_item_request)
