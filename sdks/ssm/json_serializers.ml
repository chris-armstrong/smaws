open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", Some (string__to_yojson x.message)) ]

let access_key_id_type_to_yojson = string_to_yojson
let access_key_secret_type_to_yojson = string_to_yojson
let access_request_id_to_yojson = string_to_yojson

let access_request_status_to_yojson (x : access_request_status) =
  match x with
  | APPROVED -> `String "Approved"
  | REJECTED -> `String "Rejected"
  | REVOKED -> `String "Revoked"
  | EXPIRED -> `String "Expired"
  | PENDING -> `String "Pending"

let access_type_to_yojson (x : access_type) =
  match x with STANDARD -> `String "Standard" | JUSTINTIME -> `String "JustInTime"

let account_to_yojson = string_to_yojson
let account_id_to_yojson = string_to_yojson
let account_id_list_to_yojson tree = list_to_yojson account_id_to_yojson tree
let shared_document_version_to_yojson = string_to_yojson

let account_sharing_info_to_yojson (x : account_sharing_info) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "SharedDocumentVersion",
        option_to_yojson shared_document_version_to_yojson x.shared_document_version );
    ]

let account_sharing_info_list_to_yojson tree = list_to_yojson account_sharing_info_to_yojson tree
let accounts_to_yojson tree = list_to_yojson account_to_yojson tree
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let created_date_to_yojson = timestamp_epoch_seconds_to_yojson
let boolean__to_yojson = bool_to_yojson
let expiration_date_to_yojson = timestamp_epoch_seconds_to_yojson
let registrations_count_to_yojson = int_to_yojson
let registration_limit_to_yojson = int_to_yojson
let iam_role_to_yojson = string_to_yojson
let default_instance_name_to_yojson = string_to_yojson
let activation_description_to_yojson = string_to_yojson
let activation_id_to_yojson = string_to_yojson

let activation_to_yojson (x : activation) =
  assoc_to_yojson
    [
      ("ActivationId", option_to_yojson activation_id_to_yojson x.activation_id);
      ("Description", option_to_yojson activation_description_to_yojson x.description);
      ( "DefaultInstanceName",
        option_to_yojson default_instance_name_to_yojson x.default_instance_name );
      ("IamRole", option_to_yojson iam_role_to_yojson x.iam_role);
      ("RegistrationLimit", option_to_yojson registration_limit_to_yojson x.registration_limit);
      ("RegistrationsCount", option_to_yojson registrations_count_to_yojson x.registrations_count);
      ("ExpirationDate", option_to_yojson expiration_date_to_yojson x.expiration_date);
      ("Expired", option_to_yojson boolean__to_yojson x.expired);
      ("CreatedDate", option_to_yojson created_date_to_yojson x.created_date);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let activation_code_to_yojson = string_to_yojson
let activation_list_to_yojson tree = list_to_yojson activation_to_yojson tree

let too_many_updates_to_yojson (x : too_many_updates) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let too_many_tags_error_to_yojson = unit_to_yojson
let invalid_resource_type_to_yojson = unit_to_yojson
let invalid_resource_id_to_yojson = unit_to_yojson

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let add_tags_to_resource_result_to_yojson = unit_to_yojson
let resource_id_to_yojson = string_to_yojson

let resource_type_for_tagging_to_yojson (x : resource_type_for_tagging) =
  match x with
  | DOCUMENT -> `String "Document"
  | MANAGED_INSTANCE -> `String "ManagedInstance"
  | MAINTENANCE_WINDOW -> `String "MaintenanceWindow"
  | PARAMETER -> `String "Parameter"
  | PATCH_BASELINE -> `String "PatchBaseline"
  | OPS_ITEM -> `String "OpsItem"
  | OPSMETADATA -> `String "OpsMetadata"
  | AUTOMATION -> `String "Automation"
  | ASSOCIATION -> `String "Association"

let add_tags_to_resource_request_to_yojson (x : add_tags_to_resource_request) =
  assoc_to_yojson
    [
      ("ResourceType", Some (resource_type_for_tagging_to_yojson x.resource_type));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let agent_error_code_to_yojson = string_to_yojson
let agent_type_to_yojson = string_to_yojson
let agent_version_to_yojson = string_to_yojson
let aggregator_schema_only_to_yojson = bool_to_yojson
let alarm_name_to_yojson = string_to_yojson
let alarm_to_yojson (x : alarm) = assoc_to_yojson [ ("Name", Some (alarm_name_to_yojson x.name)) ]
let alarm_list_to_yojson tree = list_to_yojson alarm_to_yojson tree

let alarm_configuration_to_yojson (x : alarm_configuration) =
  assoc_to_yojson
    [
      ("IgnorePollAlarmFailure", option_to_yojson boolean__to_yojson x.ignore_poll_alarm_failure);
      ("Alarms", Some (alarm_list_to_yojson x.alarms));
    ]

let external_alarm_state_to_yojson (x : external_alarm_state) =
  match x with UNKNOWN -> `String "UNKNOWN" | ALARM -> `String "ALARM"

let alarm_state_information_to_yojson (x : alarm_state_information) =
  assoc_to_yojson
    [
      ("Name", Some (alarm_name_to_yojson x.name));
      ("State", Some (external_alarm_state_to_yojson x.state));
    ]

let alarm_state_information_list_to_yojson tree =
  list_to_yojson alarm_state_information_to_yojson tree

let allowed_pattern_to_yojson = string_to_yojson

let already_exists_exception_to_yojson (x : already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let service_setting_not_found_to_yojson (x : service_setting_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let update_service_setting_result_to_yojson = unit_to_yojson
let service_setting_value_to_yojson = string_to_yojson
let service_setting_id_to_yojson = string_to_yojson

let update_service_setting_request_to_yojson (x : update_service_setting_request) =
  assoc_to_yojson
    [
      ("SettingId", Some (service_setting_id_to_yojson x.setting_id));
      ("SettingValue", Some (service_setting_value_to_yojson x.setting_value));
    ]

let resource_data_sync_type_to_yojson = string_to_yojson
let resource_data_sync_name_to_yojson = string_to_yojson

let resource_data_sync_not_found_exception_to_yojson (x : resource_data_sync_not_found_exception) =
  assoc_to_yojson
    [
      ("SyncName", option_to_yojson resource_data_sync_name_to_yojson x.sync_name);
      ("SyncType", option_to_yojson resource_data_sync_type_to_yojson x.sync_type);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let resource_data_sync_invalid_configuration_exception_to_yojson
    (x : resource_data_sync_invalid_configuration_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_data_sync_conflict_exception_to_yojson (x : resource_data_sync_conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let update_resource_data_sync_result_to_yojson = unit_to_yojson
let resource_data_sync_enable_all_ops_data_sources_to_yojson = bool_to_yojson
let resource_data_sync_include_future_regions_to_yojson = bool_to_yojson
let resource_data_sync_source_region_to_yojson = string_to_yojson

let resource_data_sync_source_region_list_to_yojson tree =
  list_to_yojson resource_data_sync_source_region_to_yojson tree

let resource_data_sync_organizational_unit_id_to_yojson = string_to_yojson

let resource_data_sync_organizational_unit_to_yojson (x : resource_data_sync_organizational_unit) =
  assoc_to_yojson
    [
      ( "OrganizationalUnitId",
        option_to_yojson resource_data_sync_organizational_unit_id_to_yojson
          x.organizational_unit_id );
    ]

let resource_data_sync_organizational_unit_list_to_yojson tree =
  list_to_yojson resource_data_sync_organizational_unit_to_yojson tree

let resource_data_sync_organization_source_type_to_yojson = string_to_yojson

let resource_data_sync_aws_organizations_source_to_yojson
    (x : resource_data_sync_aws_organizations_source) =
  assoc_to_yojson
    [
      ( "OrganizationSourceType",
        Some (resource_data_sync_organization_source_type_to_yojson x.organization_source_type) );
      ( "OrganizationalUnits",
        option_to_yojson resource_data_sync_organizational_unit_list_to_yojson
          x.organizational_units );
    ]

let resource_data_sync_source_type_to_yojson = string_to_yojson

let resource_data_sync_source_to_yojson (x : resource_data_sync_source) =
  assoc_to_yojson
    [
      ("SourceType", Some (resource_data_sync_source_type_to_yojson x.source_type));
      ( "AwsOrganizationsSource",
        option_to_yojson resource_data_sync_aws_organizations_source_to_yojson
          x.aws_organizations_source );
      ("SourceRegions", Some (resource_data_sync_source_region_list_to_yojson x.source_regions));
      ( "IncludeFutureRegions",
        option_to_yojson resource_data_sync_include_future_regions_to_yojson
          x.include_future_regions );
      ( "EnableAllOpsDataSources",
        option_to_yojson resource_data_sync_enable_all_ops_data_sources_to_yojson
          x.enable_all_ops_data_sources );
    ]

let update_resource_data_sync_request_to_yojson (x : update_resource_data_sync_request) =
  assoc_to_yojson
    [
      ("SyncName", Some (resource_data_sync_name_to_yojson x.sync_name));
      ("SyncType", Some (resource_data_sync_type_to_yojson x.sync_type));
      ("SyncSource", Some (resource_data_sync_source_to_yojson x.sync_source));
    ]

let does_not_exist_exception_to_yojson (x : does_not_exist_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let patch_compliance_status_to_yojson (x : patch_compliance_status) =
  match x with Compliant -> `String "COMPLIANT" | NonCompliant -> `String "NON_COMPLIANT"

let patch_source_configuration_to_yojson = string_to_yojson
let patch_source_product_to_yojson = string_to_yojson
let patch_source_product_list_to_yojson tree = list_to_yojson patch_source_product_to_yojson tree
let patch_source_name_to_yojson = string_to_yojson

let patch_source_to_yojson (x : patch_source) =
  assoc_to_yojson
    [
      ("Name", Some (patch_source_name_to_yojson x.name));
      ("Products", Some (patch_source_product_list_to_yojson x.products));
      ("Configuration", Some (patch_source_configuration_to_yojson x.configuration));
    ]

let patch_source_list_to_yojson tree = list_to_yojson patch_source_to_yojson tree
let baseline_description_to_yojson = string_to_yojson
let date_time_to_yojson = timestamp_epoch_seconds_to_yojson

let patch_action_to_yojson (x : patch_action) =
  match x with AllowAsDependency -> `String "ALLOW_AS_DEPENDENCY" | Block -> `String "BLOCK"

let patch_id_to_yojson = string_to_yojson
let patch_id_list_to_yojson tree = list_to_yojson patch_id_to_yojson tree

let patch_compliance_level_to_yojson (x : patch_compliance_level) =
  match x with
  | Critical -> `String "CRITICAL"
  | High -> `String "HIGH"
  | Medium -> `String "MEDIUM"
  | Low -> `String "LOW"
  | Informational -> `String "INFORMATIONAL"
  | Unspecified -> `String "UNSPECIFIED"

let patch_string_date_time_to_yojson = string_to_yojson
let approve_after_days_to_yojson = int_to_yojson
let patch_filter_value_to_yojson = string_to_yojson
let patch_filter_value_list_to_yojson tree = list_to_yojson patch_filter_value_to_yojson tree

let patch_filter_key_to_yojson (x : patch_filter_key) =
  match x with
  | Arch -> `String "ARCH"
  | AdvisoryId -> `String "ADVISORY_ID"
  | BugzillaId -> `String "BUGZILLA_ID"
  | PatchSet -> `String "PATCH_SET"
  | Product -> `String "PRODUCT"
  | ProductFamily -> `String "PRODUCT_FAMILY"
  | Classification -> `String "CLASSIFICATION"
  | CVEId -> `String "CVE_ID"
  | Epoch -> `String "EPOCH"
  | MsrcSeverity -> `String "MSRC_SEVERITY"
  | Name -> `String "NAME"
  | PatchId -> `String "PATCH_ID"
  | Section -> `String "SECTION"
  | Priority -> `String "PRIORITY"
  | Repository -> `String "REPOSITORY"
  | Release -> `String "RELEASE"
  | Severity -> `String "SEVERITY"
  | Security -> `String "SECURITY"
  | Version -> `String "VERSION"

let patch_filter_to_yojson (x : patch_filter) =
  assoc_to_yojson
    [
      ("Key", Some (patch_filter_key_to_yojson x.key));
      ("Values", Some (patch_filter_value_list_to_yojson x.values));
    ]

let patch_filter_list_to_yojson tree = list_to_yojson patch_filter_to_yojson tree

let patch_filter_group_to_yojson (x : patch_filter_group) =
  assoc_to_yojson [ ("PatchFilters", Some (patch_filter_list_to_yojson x.patch_filters)) ]

let patch_rule_to_yojson (x : patch_rule) =
  assoc_to_yojson
    [
      ("PatchFilterGroup", Some (patch_filter_group_to_yojson x.patch_filter_group));
      ("ComplianceLevel", option_to_yojson patch_compliance_level_to_yojson x.compliance_level);
      ("ApproveAfterDays", option_to_yojson approve_after_days_to_yojson x.approve_after_days);
      ("ApproveUntilDate", option_to_yojson patch_string_date_time_to_yojson x.approve_until_date);
      ("EnableNonSecurity", option_to_yojson boolean__to_yojson x.enable_non_security);
    ]

let patch_rule_list_to_yojson tree = list_to_yojson patch_rule_to_yojson tree

let patch_rule_group_to_yojson (x : patch_rule_group) =
  assoc_to_yojson [ ("PatchRules", Some (patch_rule_list_to_yojson x.patch_rules)) ]

let operating_system_to_yojson (x : operating_system) =
  match x with
  | Windows -> `String "WINDOWS"
  | AmazonLinux -> `String "AMAZON_LINUX"
  | AmazonLinux2 -> `String "AMAZON_LINUX_2"
  | AmazonLinux2022 -> `String "AMAZON_LINUX_2022"
  | Ubuntu -> `String "UBUNTU"
  | RedhatEnterpriseLinux -> `String "REDHAT_ENTERPRISE_LINUX"
  | Suse -> `String "SUSE"
  | CentOS -> `String "CENTOS"
  | OracleLinux -> `String "ORACLE_LINUX"
  | Debian -> `String "DEBIAN"
  | MacOS -> `String "MACOS"
  | Raspbian -> `String "RASPBIAN"
  | Rocky_Linux -> `String "ROCKY_LINUX"
  | AlmaLinux -> `String "ALMA_LINUX"
  | AmazonLinux2023 -> `String "AMAZON_LINUX_2023"

let baseline_name_to_yojson = string_to_yojson
let baseline_id_to_yojson = string_to_yojson

let update_patch_baseline_result_to_yojson (x : update_patch_baseline_result) =
  assoc_to_yojson
    [
      ("BaselineId", option_to_yojson baseline_id_to_yojson x.baseline_id);
      ("Name", option_to_yojson baseline_name_to_yojson x.name);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("GlobalFilters", option_to_yojson patch_filter_group_to_yojson x.global_filters);
      ("ApprovalRules", option_to_yojson patch_rule_group_to_yojson x.approval_rules);
      ("ApprovedPatches", option_to_yojson patch_id_list_to_yojson x.approved_patches);
      ( "ApprovedPatchesComplianceLevel",
        option_to_yojson patch_compliance_level_to_yojson x.approved_patches_compliance_level );
      ( "ApprovedPatchesEnableNonSecurity",
        option_to_yojson boolean__to_yojson x.approved_patches_enable_non_security );
      ("RejectedPatches", option_to_yojson patch_id_list_to_yojson x.rejected_patches);
      ("RejectedPatchesAction", option_to_yojson patch_action_to_yojson x.rejected_patches_action);
      ("CreatedDate", option_to_yojson date_time_to_yojson x.created_date);
      ("ModifiedDate", option_to_yojson date_time_to_yojson x.modified_date);
      ("Description", option_to_yojson baseline_description_to_yojson x.description);
      ("Sources", option_to_yojson patch_source_list_to_yojson x.sources);
      ( "AvailableSecurityUpdatesComplianceStatus",
        option_to_yojson patch_compliance_status_to_yojson
          x.available_security_updates_compliance_status );
    ]

let update_patch_baseline_request_to_yojson (x : update_patch_baseline_request) =
  assoc_to_yojson
    [
      ("BaselineId", Some (baseline_id_to_yojson x.baseline_id));
      ("Name", option_to_yojson baseline_name_to_yojson x.name);
      ("GlobalFilters", option_to_yojson patch_filter_group_to_yojson x.global_filters);
      ("ApprovalRules", option_to_yojson patch_rule_group_to_yojson x.approval_rules);
      ("ApprovedPatches", option_to_yojson patch_id_list_to_yojson x.approved_patches);
      ( "ApprovedPatchesComplianceLevel",
        option_to_yojson patch_compliance_level_to_yojson x.approved_patches_compliance_level );
      ( "ApprovedPatchesEnableNonSecurity",
        option_to_yojson boolean__to_yojson x.approved_patches_enable_non_security );
      ("RejectedPatches", option_to_yojson patch_id_list_to_yojson x.rejected_patches);
      ("RejectedPatchesAction", option_to_yojson patch_action_to_yojson x.rejected_patches_action);
      ("Description", option_to_yojson baseline_description_to_yojson x.description);
      ("Sources", option_to_yojson patch_source_list_to_yojson x.sources);
      ( "AvailableSecurityUpdatesComplianceStatus",
        option_to_yojson patch_compliance_status_to_yojson
          x.available_security_updates_compliance_status );
      ("Replace", option_to_yojson boolean__to_yojson x.replace);
    ]

let ops_metadata_too_many_updates_exception_to_yojson (x : ops_metadata_too_many_updates_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let ops_metadata_not_found_exception_to_yojson (x : ops_metadata_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let ops_metadata_key_limit_exceeded_exception_to_yojson
    (x : ops_metadata_key_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let ops_metadata_invalid_argument_exception_to_yojson (x : ops_metadata_invalid_argument_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let ops_metadata_arn_to_yojson = string_to_yojson

let update_ops_metadata_result_to_yojson (x : update_ops_metadata_result) =
  assoc_to_yojson
    [ ("OpsMetadataArn", option_to_yojson ops_metadata_arn_to_yojson x.ops_metadata_arn) ]

let metadata_key_to_yojson = string_to_yojson
let metadata_keys_to_delete_list_to_yojson tree = list_to_yojson metadata_key_to_yojson tree
let metadata_value_string_to_yojson = string_to_yojson

let metadata_value_to_yojson (x : metadata_value) =
  assoc_to_yojson [ ("Value", option_to_yojson metadata_value_string_to_yojson x.value) ]

let metadata_map_to_yojson tree = map_to_yojson metadata_key_to_yojson metadata_value_to_yojson tree

let update_ops_metadata_request_to_yojson (x : update_ops_metadata_request) =
  assoc_to_yojson
    [
      ("OpsMetadataArn", Some (ops_metadata_arn_to_yojson x.ops_metadata_arn));
      ("MetadataToUpdate", option_to_yojson metadata_map_to_yojson x.metadata_to_update);
      ("KeysToDelete", option_to_yojson metadata_keys_to_delete_list_to_yojson x.keys_to_delete);
    ]

let ops_item_not_found_exception_to_yojson (x : ops_item_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let integer_to_yojson = int_to_yojson
let ops_item_parameter_names_list_to_yojson tree = list_to_yojson string__to_yojson tree

let ops_item_limit_exceeded_exception_to_yojson (x : ops_item_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("ResourceTypes", option_to_yojson ops_item_parameter_names_list_to_yojson x.resource_types);
      ("Limit", option_to_yojson integer_to_yojson x.limit);
      ("LimitType", option_to_yojson string__to_yojson x.limit_type);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let ops_item_invalid_parameter_exception_to_yojson (x : ops_item_invalid_parameter_exception) =
  assoc_to_yojson
    [
      ("ParameterNames", option_to_yojson ops_item_parameter_names_list_to_yojson x.parameter_names);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let ops_item_conflict_exception_to_yojson (x : ops_item_conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let ops_item_already_exists_exception_to_yojson (x : ops_item_already_exists_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("OpsItemId", option_to_yojson string__to_yojson x.ops_item_id);
    ]

let ops_item_access_denied_exception_to_yojson (x : ops_item_access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let update_ops_item_response_to_yojson = unit_to_yojson
let ops_item_arn_to_yojson = string_to_yojson
let ops_item_severity_to_yojson = string_to_yojson
let ops_item_category_to_yojson = string_to_yojson
let ops_item_title_to_yojson = string_to_yojson
let ops_item_id_to_yojson = string_to_yojson

let ops_item_status_to_yojson (x : ops_item_status) =
  match x with
  | OPEN -> `String "Open"
  | IN_PROGRESS -> `String "InProgress"
  | RESOLVED -> `String "Resolved"
  | PENDING -> `String "Pending"
  | TIMED_OUT -> `String "TimedOut"
  | CANCELLING -> `String "Cancelling"
  | CANCELLED -> `String "Cancelled"
  | FAILED -> `String "Failed"
  | COMPLETED_WITH_SUCCESS -> `String "CompletedWithSuccess"
  | COMPLETED_WITH_FAILURE -> `String "CompletedWithFailure"
  | SCHEDULED -> `String "Scheduled"
  | RUNBOOK_IN_PROGRESS -> `String "RunbookInProgress"
  | PENDING_CHANGE_CALENDAR_OVERRIDE -> `String "PendingChangeCalendarOverride"
  | CHANGE_CALENDAR_OVERRIDE_APPROVED -> `String "ChangeCalendarOverrideApproved"
  | CHANGE_CALENDAR_OVERRIDE_REJECTED -> `String "ChangeCalendarOverrideRejected"
  | PENDING_APPROVAL -> `String "PendingApproval"
  | APPROVED -> `String "Approved"
  | REVOKED -> `String "Revoked"
  | REJECTED -> `String "Rejected"
  | CLOSED -> `String "Closed"

let related_ops_item_to_yojson (x : related_ops_item) =
  assoc_to_yojson [ ("OpsItemId", Some (string__to_yojson x.ops_item_id)) ]

let related_ops_items_to_yojson tree = list_to_yojson related_ops_item_to_yojson tree
let ops_item_priority_to_yojson = int_to_yojson

let ops_item_notification_to_yojson (x : ops_item_notification) =
  assoc_to_yojson [ ("Arn", option_to_yojson string__to_yojson x.arn) ]

let ops_item_notifications_to_yojson tree = list_to_yojson ops_item_notification_to_yojson tree
let ops_item_ops_data_keys_list_to_yojson tree = list_to_yojson string__to_yojson tree

let ops_item_data_type_to_yojson (x : ops_item_data_type) =
  match x with SEARCHABLE_STRING -> `String "SearchableString" | STRING -> `String "String"

let ops_item_data_value_string_to_yojson = string_to_yojson

let ops_item_data_value_to_yojson (x : ops_item_data_value) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson ops_item_data_value_string_to_yojson x.value);
      ("Type", option_to_yojson ops_item_data_type_to_yojson x.type_);
    ]

let ops_item_data_key_to_yojson = string_to_yojson

let ops_item_operational_data_to_yojson tree =
  map_to_yojson ops_item_data_key_to_yojson ops_item_data_value_to_yojson tree

let ops_item_description_to_yojson = string_to_yojson

let update_ops_item_request_to_yojson (x : update_ops_item_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson ops_item_description_to_yojson x.description);
      ("OperationalData", option_to_yojson ops_item_operational_data_to_yojson x.operational_data);
      ( "OperationalDataToDelete",
        option_to_yojson ops_item_ops_data_keys_list_to_yojson x.operational_data_to_delete );
      ("Notifications", option_to_yojson ops_item_notifications_to_yojson x.notifications);
      ("Priority", option_to_yojson ops_item_priority_to_yojson x.priority);
      ("RelatedOpsItems", option_to_yojson related_ops_items_to_yojson x.related_ops_items);
      ("Status", option_to_yojson ops_item_status_to_yojson x.status);
      ("OpsItemId", Some (ops_item_id_to_yojson x.ops_item_id));
      ("Title", option_to_yojson ops_item_title_to_yojson x.title);
      ("Category", option_to_yojson ops_item_category_to_yojson x.category);
      ("Severity", option_to_yojson ops_item_severity_to_yojson x.severity);
      ("ActualStartTime", option_to_yojson date_time_to_yojson x.actual_start_time);
      ("ActualEndTime", option_to_yojson date_time_to_yojson x.actual_end_time);
      ("PlannedStartTime", option_to_yojson date_time_to_yojson x.planned_start_time);
      ("PlannedEndTime", option_to_yojson date_time_to_yojson x.planned_end_time);
      ("OpsItemArn", option_to_yojson ops_item_arn_to_yojson x.ops_item_arn);
    ]

let invalid_instance_id_to_yojson (x : invalid_instance_id) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let update_managed_instance_role_result_to_yojson = unit_to_yojson
let managed_instance_id_to_yojson = string_to_yojson

let update_managed_instance_role_request_to_yojson (x : update_managed_instance_role_request) =
  assoc_to_yojson
    [
      ("InstanceId", Some (managed_instance_id_to_yojson x.instance_id));
      ("IamRole", Some (iam_role_to_yojson x.iam_role));
    ]

let maintenance_window_task_cutoff_behavior_to_yojson (x : maintenance_window_task_cutoff_behavior)
    =
  match x with ContinueTask -> `String "CONTINUE_TASK" | CancelTask -> `String "CANCEL_TASK"

let maintenance_window_description_to_yojson = string_to_yojson
let maintenance_window_name_to_yojson = string_to_yojson
let s3_region_to_yojson = string_to_yojson
let s3_key_prefix_to_yojson = string_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson

let logging_info_to_yojson (x : logging_info) =
  assoc_to_yojson
    [
      ("S3BucketName", Some (s3_bucket_name_to_yojson x.s3_bucket_name));
      ("S3KeyPrefix", option_to_yojson s3_key_prefix_to_yojson x.s3_key_prefix);
      ("S3Region", Some (s3_region_to_yojson x.s3_region));
    ]

let max_errors_to_yojson = string_to_yojson
let max_concurrency_to_yojson = string_to_yojson
let maintenance_window_task_priority_to_yojson = int_to_yojson
let maintenance_window_lambda_payload_to_yojson = blob_to_yojson
let maintenance_window_lambda_qualifier_to_yojson = string_to_yojson
let maintenance_window_lambda_client_context_to_yojson = string_to_yojson

let maintenance_window_lambda_parameters_to_yojson (x : maintenance_window_lambda_parameters) =
  assoc_to_yojson
    [
      ( "ClientContext",
        option_to_yojson maintenance_window_lambda_client_context_to_yojson x.client_context );
      ("Qualifier", option_to_yojson maintenance_window_lambda_qualifier_to_yojson x.qualifier);
      ("Payload", option_to_yojson maintenance_window_lambda_payload_to_yojson x.payload);
    ]

let maintenance_window_step_functions_name_to_yojson = string_to_yojson
let maintenance_window_step_functions_input_to_yojson = string_to_yojson

let maintenance_window_step_functions_parameters_to_yojson
    (x : maintenance_window_step_functions_parameters) =
  assoc_to_yojson
    [
      ("Input", option_to_yojson maintenance_window_step_functions_input_to_yojson x.input);
      ("Name", option_to_yojson maintenance_window_step_functions_name_to_yojson x.name);
    ]

let automation_parameter_value_to_yojson = string_to_yojson

let automation_parameter_value_list_to_yojson tree =
  list_to_yojson automation_parameter_value_to_yojson tree

let automation_parameter_key_to_yojson = string_to_yojson

let automation_parameter_map_to_yojson tree =
  map_to_yojson automation_parameter_key_to_yojson automation_parameter_value_list_to_yojson tree

let document_version_to_yojson = string_to_yojson

let maintenance_window_automation_parameters_to_yojson
    (x : maintenance_window_automation_parameters) =
  assoc_to_yojson
    [
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Parameters", option_to_yojson automation_parameter_map_to_yojson x.parameters);
    ]

let timeout_seconds_to_yojson = int_to_yojson
let service_role_to_yojson = string_to_yojson
let parameter_value_to_yojson = string_to_yojson
let parameter_value_list_to_yojson tree = list_to_yojson parameter_value_to_yojson tree
let parameter_name_to_yojson = string_to_yojson

let parameters_to_yojson tree =
  map_to_yojson parameter_name_to_yojson parameter_value_list_to_yojson tree

let notification_type_to_yojson (x : notification_type) =
  match x with Command -> `String "Command" | Invocation -> `String "Invocation"

let notification_event_to_yojson (x : notification_event) =
  match x with
  | ALL -> `String "All"
  | IN_PROGRESS -> `String "InProgress"
  | SUCCESS -> `String "Success"
  | TIMED_OUT -> `String "TimedOut"
  | CANCELLED -> `String "Cancelled"
  | FAILED -> `String "Failed"

let notification_event_list_to_yojson tree = list_to_yojson notification_event_to_yojson tree
let notification_arn_to_yojson = string_to_yojson

let notification_config_to_yojson (x : notification_config) =
  assoc_to_yojson
    [
      ("NotificationArn", option_to_yojson notification_arn_to_yojson x.notification_arn);
      ( "NotificationEvents",
        option_to_yojson notification_event_list_to_yojson x.notification_events );
      ("NotificationType", option_to_yojson notification_type_to_yojson x.notification_type);
    ]

let document_hash_type_to_yojson (x : document_hash_type) =
  match x with SHA256 -> `String "Sha256" | SHA1 -> `String "Sha1"

let document_hash_to_yojson = string_to_yojson
let cloud_watch_output_enabled_to_yojson = bool_to_yojson
let cloud_watch_log_group_name_to_yojson = string_to_yojson

let cloud_watch_output_config_to_yojson (x : cloud_watch_output_config) =
  assoc_to_yojson
    [
      ( "CloudWatchLogGroupName",
        option_to_yojson cloud_watch_log_group_name_to_yojson x.cloud_watch_log_group_name );
      ( "CloudWatchOutputEnabled",
        option_to_yojson cloud_watch_output_enabled_to_yojson x.cloud_watch_output_enabled );
    ]

let comment_to_yojson = string_to_yojson

let maintenance_window_run_command_parameters_to_yojson
    (x : maintenance_window_run_command_parameters) =
  assoc_to_yojson
    [
      ("Comment", option_to_yojson comment_to_yojson x.comment);
      ( "CloudWatchOutputConfig",
        option_to_yojson cloud_watch_output_config_to_yojson x.cloud_watch_output_config );
      ("DocumentHash", option_to_yojson document_hash_to_yojson x.document_hash);
      ("DocumentHashType", option_to_yojson document_hash_type_to_yojson x.document_hash_type);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("NotificationConfig", option_to_yojson notification_config_to_yojson x.notification_config);
      ("OutputS3BucketName", option_to_yojson s3_bucket_name_to_yojson x.output_s3_bucket_name);
      ("OutputS3KeyPrefix", option_to_yojson s3_key_prefix_to_yojson x.output_s3_key_prefix);
      ("Parameters", option_to_yojson parameters_to_yojson x.parameters);
      ("ServiceRoleArn", option_to_yojson service_role_to_yojson x.service_role_arn);
      ("TimeoutSeconds", option_to_yojson timeout_seconds_to_yojson x.timeout_seconds);
    ]

let maintenance_window_task_invocation_parameters_to_yojson
    (x : maintenance_window_task_invocation_parameters) =
  assoc_to_yojson
    [
      ( "RunCommand",
        option_to_yojson maintenance_window_run_command_parameters_to_yojson x.run_command );
      ( "Automation",
        option_to_yojson maintenance_window_automation_parameters_to_yojson x.automation );
      ( "StepFunctions",
        option_to_yojson maintenance_window_step_functions_parameters_to_yojson x.step_functions );
      ("Lambda", option_to_yojson maintenance_window_lambda_parameters_to_yojson x.lambda);
    ]

let maintenance_window_task_parameter_value_to_yojson = string_to_yojson

let maintenance_window_task_parameter_value_list_to_yojson tree =
  list_to_yojson maintenance_window_task_parameter_value_to_yojson tree

let maintenance_window_task_parameter_value_expression_to_yojson
    (x : maintenance_window_task_parameter_value_expression) =
  assoc_to_yojson
    [ ("Values", option_to_yojson maintenance_window_task_parameter_value_list_to_yojson x.values) ]

let maintenance_window_task_parameter_name_to_yojson = string_to_yojson

let maintenance_window_task_parameters_to_yojson tree =
  map_to_yojson maintenance_window_task_parameter_name_to_yojson
    maintenance_window_task_parameter_value_expression_to_yojson tree

let maintenance_window_task_arn_to_yojson = string_to_yojson
let target_value_to_yojson = string_to_yojson
let target_values_to_yojson tree = list_to_yojson target_value_to_yojson tree
let target_key_to_yojson = string_to_yojson

let target_to_yojson (x : target) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson target_key_to_yojson x.key);
      ("Values", option_to_yojson target_values_to_yojson x.values);
    ]

let targets_to_yojson tree = list_to_yojson target_to_yojson tree
let maintenance_window_task_id_to_yojson = string_to_yojson
let maintenance_window_id_to_yojson = string_to_yojson

let update_maintenance_window_task_result_to_yojson (x : update_maintenance_window_task_result) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("WindowTaskId", option_to_yojson maintenance_window_task_id_to_yojson x.window_task_id);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("TaskArn", option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn);
      ("ServiceRoleArn", option_to_yojson service_role_to_yojson x.service_role_arn);
      ( "TaskParameters",
        option_to_yojson maintenance_window_task_parameters_to_yojson x.task_parameters );
      ( "TaskInvocationParameters",
        option_to_yojson maintenance_window_task_invocation_parameters_to_yojson
          x.task_invocation_parameters );
      ("Priority", option_to_yojson maintenance_window_task_priority_to_yojson x.priority);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("LoggingInfo", option_to_yojson logging_info_to_yojson x.logging_info);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ( "CutoffBehavior",
        option_to_yojson maintenance_window_task_cutoff_behavior_to_yojson x.cutoff_behavior );
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
    ]

let update_maintenance_window_task_request_to_yojson (x : update_maintenance_window_task_request) =
  assoc_to_yojson
    [
      ("WindowId", Some (maintenance_window_id_to_yojson x.window_id));
      ("WindowTaskId", Some (maintenance_window_task_id_to_yojson x.window_task_id));
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("TaskArn", option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn);
      ("ServiceRoleArn", option_to_yojson service_role_to_yojson x.service_role_arn);
      ( "TaskParameters",
        option_to_yojson maintenance_window_task_parameters_to_yojson x.task_parameters );
      ( "TaskInvocationParameters",
        option_to_yojson maintenance_window_task_invocation_parameters_to_yojson
          x.task_invocation_parameters );
      ("Priority", option_to_yojson maintenance_window_task_priority_to_yojson x.priority);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("LoggingInfo", option_to_yojson logging_info_to_yojson x.logging_info);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ("Replace", option_to_yojson boolean__to_yojson x.replace);
      ( "CutoffBehavior",
        option_to_yojson maintenance_window_task_cutoff_behavior_to_yojson x.cutoff_behavior );
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
    ]

let owner_information_to_yojson = string_to_yojson
let maintenance_window_target_id_to_yojson = string_to_yojson

let update_maintenance_window_target_result_to_yojson (x : update_maintenance_window_target_result)
    =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("WindowTargetId", option_to_yojson maintenance_window_target_id_to_yojson x.window_target_id);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("OwnerInformation", option_to_yojson owner_information_to_yojson x.owner_information);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
    ]

let update_maintenance_window_target_request_to_yojson
    (x : update_maintenance_window_target_request) =
  assoc_to_yojson
    [
      ("WindowId", Some (maintenance_window_id_to_yojson x.window_id));
      ("WindowTargetId", Some (maintenance_window_target_id_to_yojson x.window_target_id));
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("OwnerInformation", option_to_yojson owner_information_to_yojson x.owner_information);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ("Replace", option_to_yojson boolean__to_yojson x.replace);
    ]

let maintenance_window_enabled_to_yojson = bool_to_yojson
let maintenance_window_allow_unassociated_targets_to_yojson = bool_to_yojson
let maintenance_window_cutoff_to_yojson = int_to_yojson
let maintenance_window_duration_hours_to_yojson = int_to_yojson
let maintenance_window_offset_to_yojson = int_to_yojson
let maintenance_window_timezone_to_yojson = string_to_yojson
let maintenance_window_schedule_to_yojson = string_to_yojson
let maintenance_window_string_date_time_to_yojson = string_to_yojson

let update_maintenance_window_result_to_yojson (x : update_maintenance_window_result) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ("StartDate", option_to_yojson maintenance_window_string_date_time_to_yojson x.start_date);
      ("EndDate", option_to_yojson maintenance_window_string_date_time_to_yojson x.end_date);
      ("Schedule", option_to_yojson maintenance_window_schedule_to_yojson x.schedule);
      ( "ScheduleTimezone",
        option_to_yojson maintenance_window_timezone_to_yojson x.schedule_timezone );
      ("ScheduleOffset", option_to_yojson maintenance_window_offset_to_yojson x.schedule_offset);
      ("Duration", option_to_yojson maintenance_window_duration_hours_to_yojson x.duration);
      ("Cutoff", option_to_yojson maintenance_window_cutoff_to_yojson x.cutoff);
      ( "AllowUnassociatedTargets",
        option_to_yojson maintenance_window_allow_unassociated_targets_to_yojson
          x.allow_unassociated_targets );
      ("Enabled", option_to_yojson maintenance_window_enabled_to_yojson x.enabled);
    ]

let update_maintenance_window_request_to_yojson (x : update_maintenance_window_request) =
  assoc_to_yojson
    [
      ("WindowId", Some (maintenance_window_id_to_yojson x.window_id));
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ("StartDate", option_to_yojson maintenance_window_string_date_time_to_yojson x.start_date);
      ("EndDate", option_to_yojson maintenance_window_string_date_time_to_yojson x.end_date);
      ("Schedule", option_to_yojson maintenance_window_schedule_to_yojson x.schedule);
      ( "ScheduleTimezone",
        option_to_yojson maintenance_window_timezone_to_yojson x.schedule_timezone );
      ("ScheduleOffset", option_to_yojson maintenance_window_offset_to_yojson x.schedule_offset);
      ("Duration", option_to_yojson maintenance_window_duration_hours_to_yojson x.duration);
      ("Cutoff", option_to_yojson maintenance_window_cutoff_to_yojson x.cutoff);
      ( "AllowUnassociatedTargets",
        option_to_yojson maintenance_window_allow_unassociated_targets_to_yojson
          x.allow_unassociated_targets );
      ("Enabled", option_to_yojson maintenance_window_enabled_to_yojson x.enabled);
      ("Replace", option_to_yojson boolean__to_yojson x.replace);
    ]

let invalid_document_version_to_yojson (x : invalid_document_version) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_document_operation_to_yojson (x : invalid_document_operation) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_document_to_yojson (x : invalid_document) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let update_document_metadata_response_to_yojson = unit_to_yojson
let document_review_comment_to_yojson = string_to_yojson

let document_review_comment_type_to_yojson (x : document_review_comment_type) =
  match x with Comment -> `String "Comment"

let document_review_comment_source_to_yojson (x : document_review_comment_source) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson document_review_comment_type_to_yojson x.type_);
      ("Content", option_to_yojson document_review_comment_to_yojson x.content);
    ]

let document_review_comment_list_to_yojson tree =
  list_to_yojson document_review_comment_source_to_yojson tree

let document_review_action_to_yojson (x : document_review_action) =
  match x with
  | SendForReview -> `String "SendForReview"
  | UpdateReview -> `String "UpdateReview"
  | Approve -> `String "Approve"
  | Reject -> `String "Reject"

let document_reviews_to_yojson (x : document_reviews) =
  assoc_to_yojson
    [
      ("Action", Some (document_review_action_to_yojson x.action));
      ("Comment", option_to_yojson document_review_comment_list_to_yojson x.comment);
    ]

let document_name_to_yojson = string_to_yojson

let update_document_metadata_request_to_yojson (x : update_document_metadata_request) =
  assoc_to_yojson
    [
      ("Name", Some (document_name_to_yojson x.name));
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("DocumentReviews", Some (document_reviews_to_yojson x.document_reviews));
    ]

let invalid_document_schema_version_to_yojson (x : invalid_document_schema_version) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let document_version_name_to_yojson = string_to_yojson

let document_default_version_description_to_yojson (x : document_default_version_description) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson document_name_to_yojson x.name);
      ("DefaultVersion", option_to_yojson document_version_to_yojson x.default_version);
      ("DefaultVersionName", option_to_yojson document_version_name_to_yojson x.default_version_name);
    ]

let update_document_default_version_result_to_yojson (x : update_document_default_version_result) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson document_default_version_description_to_yojson x.description);
    ]

let document_version_number_to_yojson = string_to_yojson

let update_document_default_version_request_to_yojson (x : update_document_default_version_request)
    =
  assoc_to_yojson
    [
      ("Name", Some (document_name_to_yojson x.name));
      ("DocumentVersion", Some (document_version_number_to_yojson x.document_version));
    ]

let max_document_size_exceeded_to_yojson (x : max_document_size_exceeded) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_document_content_to_yojson (x : invalid_document_content) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let duplicate_document_version_name_to_yojson (x : duplicate_document_version_name) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let duplicate_document_content_to_yojson (x : duplicate_document_content) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let document_version_limit_exceeded_to_yojson (x : document_version_limit_exceeded) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let category_to_yojson = string_to_yojson
let category_enum_list_to_yojson tree = list_to_yojson category_to_yojson tree
let category_list_to_yojson tree = list_to_yojson category_to_yojson tree

let review_status_to_yojson (x : review_status) =
  match x with
  | APPROVED -> `String "APPROVED"
  | NOT_REVIEWED -> `String "NOT_REVIEWED"
  | PENDING -> `String "PENDING"
  | REJECTED -> `String "REJECTED"

let reviewer_to_yojson = string_to_yojson

let review_information_to_yojson (x : review_information) =
  assoc_to_yojson
    [
      ("ReviewedTime", option_to_yojson date_time_to_yojson x.reviewed_time);
      ("Status", option_to_yojson review_status_to_yojson x.status);
      ("Reviewer", option_to_yojson reviewer_to_yojson x.reviewer);
    ]

let review_information_list_to_yojson tree = list_to_yojson review_information_to_yojson tree
let document_author_to_yojson = string_to_yojson
let require_type_to_yojson = string_to_yojson
let document_ar_n_to_yojson = string_to_yojson

let document_requires_to_yojson (x : document_requires) =
  assoc_to_yojson
    [
      ("Name", Some (document_ar_n_to_yojson x.name));
      ("Version", option_to_yojson document_version_to_yojson x.version);
      ("RequireType", option_to_yojson require_type_to_yojson x.require_type);
      ("VersionName", option_to_yojson document_version_name_to_yojson x.version_name);
    ]

let document_requires_list_to_yojson tree = list_to_yojson document_requires_to_yojson tree
let attachment_name_to_yojson = string_to_yojson

let attachment_information_to_yojson (x : attachment_information) =
  assoc_to_yojson [ ("Name", option_to_yojson attachment_name_to_yojson x.name) ]

let attachment_information_list_to_yojson tree =
  list_to_yojson attachment_information_to_yojson tree

let target_type_to_yojson = string_to_yojson

let document_format_to_yojson (x : document_format) =
  match x with YAML -> `String "YAML" | JSON -> `String "JSON" | TEXT -> `String "TEXT"

let document_schema_version_to_yojson = string_to_yojson

let document_type_to_yojson (x : document_type) =
  match x with
  | Command -> `String "Command"
  | Policy -> `String "Policy"
  | Automation -> `String "Automation"
  | Session -> `String "Session"
  | Package -> `String "Package"
  | ApplicationConfiguration -> `String "ApplicationConfiguration"
  | ApplicationConfigurationSchema -> `String "ApplicationConfigurationSchema"
  | DeploymentStrategy -> `String "DeploymentStrategy"
  | ChangeCalendar -> `String "ChangeCalendar"
  | ChangeTemplate -> `String "Automation.ChangeTemplate"
  | ProblemAnalysis -> `String "ProblemAnalysis"
  | ProblemAnalysisTemplate -> `String "ProblemAnalysisTemplate"
  | CloudFormation -> `String "CloudFormation"
  | ConformancePackTemplate -> `String "ConformancePackTemplate"
  | QuickSetup -> `String "QuickSetup"
  | ManualApprovalPolicy -> `String "ManualApprovalPolicy"
  | AutoApprovalPolicy -> `String "AutoApprovalPolicy"

let platform_type_to_yojson (x : platform_type) =
  match x with WINDOWS -> `String "Windows" | LINUX -> `String "Linux" | MACOS -> `String "MacOS"

let platform_type_list_to_yojson tree = list_to_yojson platform_type_to_yojson tree
let document_parameter_default_value_to_yojson = string_to_yojson
let document_parameter_descrption_to_yojson = string_to_yojson

let document_parameter_type_to_yojson (x : document_parameter_type) =
  match x with String -> `String "String" | StringList -> `String "StringList"

let document_parameter_name_to_yojson = string_to_yojson

let document_parameter_to_yojson (x : document_parameter) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson document_parameter_name_to_yojson x.name);
      ("Type", option_to_yojson document_parameter_type_to_yojson x.type_);
      ("Description", option_to_yojson document_parameter_descrption_to_yojson x.description);
      ("DefaultValue", option_to_yojson document_parameter_default_value_to_yojson x.default_value);
    ]

let document_parameter_list_to_yojson tree = list_to_yojson document_parameter_to_yojson tree
let description_in_document_to_yojson = string_to_yojson
let document_status_information_to_yojson = string_to_yojson

let document_status_to_yojson (x : document_status) =
  match x with
  | Creating -> `String "Creating"
  | Active -> `String "Active"
  | Updating -> `String "Updating"
  | Deleting -> `String "Deleting"
  | Failed -> `String "Failed"

let document_owner_to_yojson = string_to_yojson
let document_display_name_to_yojson = string_to_yojson
let document_sha1_to_yojson = string_to_yojson

let document_description_to_yojson (x : document_description) =
  assoc_to_yojson
    [
      ("Sha1", option_to_yojson document_sha1_to_yojson x.sha1);
      ("Hash", option_to_yojson document_hash_to_yojson x.hash);
      ("HashType", option_to_yojson document_hash_type_to_yojson x.hash_type);
      ("Name", option_to_yojson document_ar_n_to_yojson x.name);
      ("DisplayName", option_to_yojson document_display_name_to_yojson x.display_name);
      ("VersionName", option_to_yojson document_version_name_to_yojson x.version_name);
      ("Owner", option_to_yojson document_owner_to_yojson x.owner);
      ("CreatedDate", option_to_yojson date_time_to_yojson x.created_date);
      ("Status", option_to_yojson document_status_to_yojson x.status);
      ( "StatusInformation",
        option_to_yojson document_status_information_to_yojson x.status_information );
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Description", option_to_yojson description_in_document_to_yojson x.description);
      ("Parameters", option_to_yojson document_parameter_list_to_yojson x.parameters);
      ("PlatformTypes", option_to_yojson platform_type_list_to_yojson x.platform_types);
      ("DocumentType", option_to_yojson document_type_to_yojson x.document_type);
      ("SchemaVersion", option_to_yojson document_schema_version_to_yojson x.schema_version);
      ("LatestVersion", option_to_yojson document_version_to_yojson x.latest_version);
      ("DefaultVersion", option_to_yojson document_version_to_yojson x.default_version);
      ("DocumentFormat", option_to_yojson document_format_to_yojson x.document_format);
      ("TargetType", option_to_yojson target_type_to_yojson x.target_type);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "AttachmentsInformation",
        option_to_yojson attachment_information_list_to_yojson x.attachments_information );
      ("Requires", option_to_yojson document_requires_list_to_yojson x.requires);
      ("Author", option_to_yojson document_author_to_yojson x.author);
      ("ReviewInformation", option_to_yojson review_information_list_to_yojson x.review_information);
      ("ApprovedVersion", option_to_yojson document_version_to_yojson x.approved_version);
      ("PendingReviewVersion", option_to_yojson document_version_to_yojson x.pending_review_version);
      ("ReviewStatus", option_to_yojson review_status_to_yojson x.review_status);
      ("Category", option_to_yojson category_list_to_yojson x.category);
      ("CategoryEnum", option_to_yojson category_enum_list_to_yojson x.category_enum);
    ]

let update_document_result_to_yojson (x : update_document_result) =
  assoc_to_yojson
    [
      ("DocumentDescription", option_to_yojson document_description_to_yojson x.document_description);
    ]

let attachment_identifier_to_yojson = string_to_yojson
let attachments_source_value_to_yojson = string_to_yojson

let attachments_source_values_to_yojson tree =
  list_to_yojson attachments_source_value_to_yojson tree

let attachments_source_key_to_yojson (x : attachments_source_key) =
  match x with
  | SourceUrl -> `String "SourceUrl"
  | S3FileUrl -> `String "S3FileUrl"
  | AttachmentReference -> `String "AttachmentReference"

let attachments_source_to_yojson (x : attachments_source) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson attachments_source_key_to_yojson x.key);
      ("Values", option_to_yojson attachments_source_values_to_yojson x.values);
      ("Name", option_to_yojson attachment_identifier_to_yojson x.name);
    ]

let attachments_source_list_to_yojson tree = list_to_yojson attachments_source_to_yojson tree
let document_content_to_yojson = string_to_yojson

let update_document_request_to_yojson (x : update_document_request) =
  assoc_to_yojson
    [
      ("Content", Some (document_content_to_yojson x.content));
      ("Attachments", option_to_yojson attachments_source_list_to_yojson x.attachments);
      ("Name", Some (document_name_to_yojson x.name));
      ("DisplayName", option_to_yojson document_display_name_to_yojson x.display_name);
      ("VersionName", option_to_yojson document_version_name_to_yojson x.version_name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("DocumentFormat", option_to_yojson document_format_to_yojson x.document_format);
      ("TargetType", option_to_yojson target_type_to_yojson x.target_type);
    ]

let status_unchanged_to_yojson = unit_to_yojson

let association_does_not_exist_to_yojson (x : association_does_not_exist) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let association_dispatch_assume_role_arn_to_yojson = string_to_yojson
let target_map_value_to_yojson = string_to_yojson
let target_map_value_list_to_yojson tree = list_to_yojson target_map_value_to_yojson tree
let target_map_key_to_yojson = string_to_yojson

let target_map_to_yojson tree =
  map_to_yojson target_map_key_to_yojson target_map_value_list_to_yojson tree

let target_maps_to_yojson tree = list_to_yojson target_map_to_yojson tree
let duration_to_yojson = int_to_yojson
let schedule_offset_to_yojson = int_to_yojson
let exclude_account_to_yojson = string_to_yojson
let exclude_accounts_to_yojson tree = list_to_yojson exclude_account_to_yojson tree
let execution_role_name_to_yojson = string_to_yojson
let region_to_yojson = string_to_yojson
let regions_to_yojson tree = list_to_yojson region_to_yojson tree

let target_location_to_yojson (x : target_location) =
  assoc_to_yojson
    [
      ("Accounts", option_to_yojson accounts_to_yojson x.accounts);
      ("Regions", option_to_yojson regions_to_yojson x.regions);
      ( "TargetLocationMaxConcurrency",
        option_to_yojson max_concurrency_to_yojson x.target_location_max_concurrency );
      ("TargetLocationMaxErrors", option_to_yojson max_errors_to_yojson x.target_location_max_errors);
      ("ExecutionRoleName", option_to_yojson execution_role_name_to_yojson x.execution_role_name);
      ( "TargetLocationAlarmConfiguration",
        option_to_yojson alarm_configuration_to_yojson x.target_location_alarm_configuration );
      ( "IncludeChildOrganizationUnits",
        option_to_yojson boolean__to_yojson x.include_child_organization_units );
      ("ExcludeAccounts", option_to_yojson exclude_accounts_to_yojson x.exclude_accounts);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("TargetsMaxConcurrency", option_to_yojson max_concurrency_to_yojson x.targets_max_concurrency);
      ("TargetsMaxErrors", option_to_yojson max_errors_to_yojson x.targets_max_errors);
    ]

let target_locations_to_yojson tree = list_to_yojson target_location_to_yojson tree
let calendar_name_or_ar_n_to_yojson = string_to_yojson
let calendar_name_or_arn_list_to_yojson tree = list_to_yojson calendar_name_or_ar_n_to_yojson tree
let apply_only_at_cron_interval_to_yojson = bool_to_yojson

let association_sync_compliance_to_yojson (x : association_sync_compliance) =
  match x with Auto -> `String "AUTO" | Manual -> `String "MANUAL"

let association_compliance_severity_to_yojson (x : association_compliance_severity) =
  match x with
  | Critical -> `String "CRITICAL"
  | High -> `String "HIGH"
  | Medium -> `String "MEDIUM"
  | Low -> `String "LOW"
  | Unspecified -> `String "UNSPECIFIED"

let association_name_to_yojson = string_to_yojson

let s3_output_location_to_yojson (x : s3_output_location) =
  assoc_to_yojson
    [
      ("OutputS3Region", option_to_yojson s3_region_to_yojson x.output_s3_region);
      ("OutputS3BucketName", option_to_yojson s3_bucket_name_to_yojson x.output_s3_bucket_name);
      ("OutputS3KeyPrefix", option_to_yojson s3_key_prefix_to_yojson x.output_s3_key_prefix);
    ]

let instance_association_output_location_to_yojson (x : instance_association_output_location) =
  assoc_to_yojson [ ("S3Location", option_to_yojson s3_output_location_to_yojson x.s3_location) ]

let schedule_expression_to_yojson = string_to_yojson
let association_id_to_yojson = string_to_yojson
let automation_target_parameter_name_to_yojson = string_to_yojson
let instance_count_to_yojson = int_to_yojson
let status_name_to_yojson = string_to_yojson

let association_status_aggregated_count_to_yojson tree =
  map_to_yojson status_name_to_yojson instance_count_to_yojson tree

let association_overview_to_yojson (x : association_overview) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_name_to_yojson x.status);
      ("DetailedStatus", option_to_yojson status_name_to_yojson x.detailed_status);
      ( "AssociationStatusAggregatedCount",
        option_to_yojson association_status_aggregated_count_to_yojson
          x.association_status_aggregated_count );
    ]

let status_additional_info_to_yojson = string_to_yojson
let status_message_to_yojson = string_to_yojson

let association_status_name_to_yojson (x : association_status_name) =
  match x with
  | Pending -> `String "Pending"
  | Success -> `String "Success"
  | Failed -> `String "Failed"

let association_status_to_yojson (x : association_status) =
  assoc_to_yojson
    [
      ("Date", Some (date_time_to_yojson x.date));
      ("Name", Some (association_status_name_to_yojson x.name));
      ("Message", Some (status_message_to_yojson x.message));
      ("AdditionalInfo", option_to_yojson status_additional_info_to_yojson x.additional_info);
    ]

let association_version_to_yojson = string_to_yojson
let instance_id_to_yojson = string_to_yojson

let association_description_to_yojson (x : association_description) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson document_ar_n_to_yojson x.name);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("AssociationVersion", option_to_yojson association_version_to_yojson x.association_version);
      ("Date", option_to_yojson date_time_to_yojson x.date);
      ( "LastUpdateAssociationDate",
        option_to_yojson date_time_to_yojson x.last_update_association_date );
      ("Status", option_to_yojson association_status_to_yojson x.status);
      ("Overview", option_to_yojson association_overview_to_yojson x.overview);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ( "AutomationTargetParameterName",
        option_to_yojson automation_target_parameter_name_to_yojson
          x.automation_target_parameter_name );
      ("Parameters", option_to_yojson parameters_to_yojson x.parameters);
      ("AssociationId", option_to_yojson association_id_to_yojson x.association_id);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("ScheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ( "OutputLocation",
        option_to_yojson instance_association_output_location_to_yojson x.output_location );
      ("LastExecutionDate", option_to_yojson date_time_to_yojson x.last_execution_date);
      ( "LastSuccessfulExecutionDate",
        option_to_yojson date_time_to_yojson x.last_successful_execution_date );
      ("AssociationName", option_to_yojson association_name_to_yojson x.association_name);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ( "ComplianceSeverity",
        option_to_yojson association_compliance_severity_to_yojson x.compliance_severity );
      ("SyncCompliance", option_to_yojson association_sync_compliance_to_yojson x.sync_compliance);
      ( "ApplyOnlyAtCronInterval",
        option_to_yojson apply_only_at_cron_interval_to_yojson x.apply_only_at_cron_interval );
      ("CalendarNames", option_to_yojson calendar_name_or_arn_list_to_yojson x.calendar_names);
      ("TargetLocations", option_to_yojson target_locations_to_yojson x.target_locations);
      ("ScheduleOffset", option_to_yojson schedule_offset_to_yojson x.schedule_offset);
      ("Duration", option_to_yojson duration_to_yojson x.duration);
      ("TargetMaps", option_to_yojson target_maps_to_yojson x.target_maps);
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ("TriggeredAlarms", option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms);
      ( "AssociationDispatchAssumeRole",
        option_to_yojson association_dispatch_assume_role_arn_to_yojson
          x.association_dispatch_assume_role );
    ]

let update_association_status_result_to_yojson (x : update_association_status_result) =
  assoc_to_yojson
    [
      ( "AssociationDescription",
        option_to_yojson association_description_to_yojson x.association_description );
    ]

let update_association_status_request_to_yojson (x : update_association_status_request) =
  assoc_to_yojson
    [
      ("Name", Some (document_ar_n_to_yojson x.name));
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ("AssociationStatus", Some (association_status_to_yojson x.association_status));
    ]

let invalid_update_to_yojson (x : invalid_update) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_target_maps_to_yojson (x : invalid_target_maps) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_target_to_yojson (x : invalid_target) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_schedule_to_yojson (x : invalid_schedule) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_parameters_to_yojson (x : invalid_parameters) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_output_location_to_yojson = unit_to_yojson

let invalid_association_version_to_yojson (x : invalid_association_version) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let association_version_limit_exceeded_to_yojson (x : association_version_limit_exceeded) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let update_association_result_to_yojson (x : update_association_result) =
  assoc_to_yojson
    [
      ( "AssociationDescription",
        option_to_yojson association_description_to_yojson x.association_description );
    ]

let update_association_request_to_yojson (x : update_association_request) =
  assoc_to_yojson
    [
      ("AssociationId", Some (association_id_to_yojson x.association_id));
      ("Parameters", option_to_yojson parameters_to_yojson x.parameters);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("ScheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ( "OutputLocation",
        option_to_yojson instance_association_output_location_to_yojson x.output_location );
      ("Name", option_to_yojson document_ar_n_to_yojson x.name);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("AssociationName", option_to_yojson association_name_to_yojson x.association_name);
      ("AssociationVersion", option_to_yojson association_version_to_yojson x.association_version);
      ( "AutomationTargetParameterName",
        option_to_yojson automation_target_parameter_name_to_yojson
          x.automation_target_parameter_name );
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ( "ComplianceSeverity",
        option_to_yojson association_compliance_severity_to_yojson x.compliance_severity );
      ("SyncCompliance", option_to_yojson association_sync_compliance_to_yojson x.sync_compliance);
      ( "ApplyOnlyAtCronInterval",
        option_to_yojson apply_only_at_cron_interval_to_yojson x.apply_only_at_cron_interval );
      ("CalendarNames", option_to_yojson calendar_name_or_arn_list_to_yojson x.calendar_names);
      ("TargetLocations", option_to_yojson target_locations_to_yojson x.target_locations);
      ("ScheduleOffset", option_to_yojson schedule_offset_to_yojson x.schedule_offset);
      ("Duration", option_to_yojson duration_to_yojson x.duration);
      ("TargetMaps", option_to_yojson target_maps_to_yojson x.target_maps);
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ( "AssociationDispatchAssumeRole",
        option_to_yojson association_dispatch_assume_role_arn_to_yojson
          x.association_dispatch_assume_role );
    ]

let parameter_version_not_found_to_yojson (x : parameter_version_not_found) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let parameter_not_found_to_yojson (x : parameter_not_found) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let parameter_label_to_yojson = string_to_yojson
let parameter_label_list_to_yojson tree = list_to_yojson parameter_label_to_yojson tree

let unlabel_parameter_version_result_to_yojson (x : unlabel_parameter_version_result) =
  assoc_to_yojson
    [
      ("RemovedLabels", option_to_yojson parameter_label_list_to_yojson x.removed_labels);
      ("InvalidLabels", option_to_yojson parameter_label_list_to_yojson x.invalid_labels);
    ]

let ps_parameter_version_to_yojson = long_to_yojson
let ps_parameter_name_to_yojson = string_to_yojson

let unlabel_parameter_version_request_to_yojson (x : unlabel_parameter_version_request) =
  assoc_to_yojson
    [
      ("Name", Some (ps_parameter_name_to_yojson x.name));
      ("ParameterVersion", Some (ps_parameter_version_to_yojson x.parameter_version));
      ("Labels", Some (parameter_label_list_to_yojson x.labels));
    ]

let session_id_to_yojson = string_to_yojson

let terminate_session_response_to_yojson (x : terminate_session_response) =
  assoc_to_yojson [ ("SessionId", option_to_yojson session_id_to_yojson x.session_id) ]

let terminate_session_request_to_yojson (x : terminate_session_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let invalid_automation_status_update_exception_to_yojson
    (x : invalid_automation_status_update_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let automation_execution_not_found_exception_to_yojson
    (x : automation_execution_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let stop_automation_execution_result_to_yojson = unit_to_yojson

let stop_type_to_yojson (x : stop_type) =
  match x with COMPLETE -> `String "Complete" | CANCEL -> `String "Cancel"

let automation_execution_id_to_yojson = string_to_yojson

let stop_automation_execution_request_to_yojson (x : stop_automation_execution_request) =
  assoc_to_yojson
    [
      ("AutomationExecutionId", Some (automation_execution_id_to_yojson x.automation_execution_id));
      ("Type", option_to_yojson stop_type_to_yojson x.type_);
    ]

let target_not_connected_to_yojson (x : target_not_connected) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let stream_url_to_yojson = string_to_yojson
let token_value_to_yojson = string_to_yojson

let start_session_response_to_yojson (x : start_session_response) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("TokenValue", option_to_yojson token_value_to_yojson x.token_value);
      ("StreamUrl", option_to_yojson stream_url_to_yojson x.stream_url);
    ]

let session_manager_parameter_value_to_yojson = string_to_yojson

let session_manager_parameter_value_list_to_yojson tree =
  list_to_yojson session_manager_parameter_value_to_yojson tree

let session_manager_parameter_name_to_yojson = string_to_yojson

let session_manager_parameters_to_yojson tree =
  map_to_yojson session_manager_parameter_name_to_yojson
    session_manager_parameter_value_list_to_yojson tree

let session_reason_to_yojson = string_to_yojson
let session_target_to_yojson = string_to_yojson

let start_session_request_to_yojson (x : start_session_request) =
  assoc_to_yojson
    [
      ("Target", Some (session_target_to_yojson x.target));
      ("DocumentName", option_to_yojson document_ar_n_to_yojson x.document_name);
      ("Reason", option_to_yojson session_reason_to_yojson x.reason);
      ("Parameters", option_to_yojson session_manager_parameters_to_yojson x.parameters);
    ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ReasonCode", option_to_yojson string__to_yojson x.reason_code);
    ]

let execution_preview_id_to_yojson = string_to_yojson

let start_execution_preview_response_to_yojson (x : start_execution_preview_response) =
  assoc_to_yojson
    [
      ("ExecutionPreviewId", option_to_yojson execution_preview_id_to_yojson x.execution_preview_id);
    ]

let target_locations_ur_l_to_yojson = string_to_yojson

let automation_execution_inputs_to_yojson (x : automation_execution_inputs) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson automation_parameter_map_to_yojson x.parameters);
      ( "TargetParameterName",
        option_to_yojson automation_parameter_key_to_yojson x.target_parameter_name );
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("TargetMaps", option_to_yojson target_maps_to_yojson x.target_maps);
      ("TargetLocations", option_to_yojson target_locations_to_yojson x.target_locations);
      ( "TargetLocationsURL",
        option_to_yojson target_locations_ur_l_to_yojson x.target_locations_ur_l );
    ]

let execution_inputs_to_yojson (x : execution_inputs) =
  match x with
  | Automation arg ->
      assoc_to_yojson [ ("Automation", Some (automation_execution_inputs_to_yojson arg)) ]

let start_execution_preview_request_to_yojson (x : start_execution_preview_request) =
  assoc_to_yojson
    [
      ("DocumentName", Some (document_name_to_yojson x.document_name));
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("ExecutionInputs", option_to_yojson execution_inputs_to_yojson x.execution_inputs);
    ]

let no_longer_supported_exception_to_yojson (x : no_longer_supported_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_automation_execution_parameters_exception_to_yojson
    (x : invalid_automation_execution_parameters_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let idempotent_parameter_mismatch_to_yojson (x : idempotent_parameter_mismatch) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let automation_execution_limit_exceeded_exception_to_yojson
    (x : automation_execution_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let automation_definition_version_not_found_exception_to_yojson
    (x : automation_definition_version_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let automation_definition_not_found_exception_to_yojson
    (x : automation_definition_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let automation_definition_not_approved_exception_to_yojson
    (x : automation_definition_not_approved_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let start_change_request_execution_result_to_yojson (x : start_change_request_execution_result) =
  assoc_to_yojson
    [
      ( "AutomationExecutionId",
        option_to_yojson automation_execution_id_to_yojson x.automation_execution_id );
    ]

let change_details_value_to_yojson = string_to_yojson

let runbook_to_yojson (x : runbook) =
  assoc_to_yojson
    [
      ("DocumentName", Some (document_ar_n_to_yojson x.document_name));
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Parameters", option_to_yojson automation_parameter_map_to_yojson x.parameters);
      ( "TargetParameterName",
        option_to_yojson automation_parameter_key_to_yojson x.target_parameter_name );
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("TargetMaps", option_to_yojson target_maps_to_yojson x.target_maps);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("TargetLocations", option_to_yojson target_locations_to_yojson x.target_locations);
    ]

let runbooks_to_yojson tree = list_to_yojson runbook_to_yojson tree
let idempotency_token_to_yojson = string_to_yojson
let change_request_name_to_yojson = string_to_yojson

let start_change_request_execution_request_to_yojson (x : start_change_request_execution_request) =
  assoc_to_yojson
    [
      ("ScheduledTime", option_to_yojson date_time_to_yojson x.scheduled_time);
      ("DocumentName", Some (document_ar_n_to_yojson x.document_name));
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Parameters", option_to_yojson automation_parameter_map_to_yojson x.parameters);
      ("ChangeRequestName", option_to_yojson change_request_name_to_yojson x.change_request_name);
      ("ClientToken", option_to_yojson idempotency_token_to_yojson x.client_token);
      ("AutoApprove", option_to_yojson boolean__to_yojson x.auto_approve);
      ("Runbooks", Some (runbooks_to_yojson x.runbooks));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ScheduledEndTime", option_to_yojson date_time_to_yojson x.scheduled_end_time);
      ("ChangeDetails", option_to_yojson change_details_value_to_yojson x.change_details);
    ]

let start_automation_execution_result_to_yojson (x : start_automation_execution_result) =
  assoc_to_yojson
    [
      ( "AutomationExecutionId",
        option_to_yojson automation_execution_id_to_yojson x.automation_execution_id );
    ]

let execution_mode_to_yojson (x : execution_mode) =
  match x with Auto -> `String "Auto" | Interactive -> `String "Interactive"

let start_automation_execution_request_to_yojson (x : start_automation_execution_request) =
  assoc_to_yojson
    [
      ("DocumentName", Some (document_ar_n_to_yojson x.document_name));
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Parameters", option_to_yojson automation_parameter_map_to_yojson x.parameters);
      ("ClientToken", option_to_yojson idempotency_token_to_yojson x.client_token);
      ("Mode", option_to_yojson execution_mode_to_yojson x.mode);
      ( "TargetParameterName",
        option_to_yojson automation_parameter_key_to_yojson x.target_parameter_name );
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("TargetMaps", option_to_yojson target_maps_to_yojson x.target_maps);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("TargetLocations", option_to_yojson target_locations_to_yojson x.target_locations);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ( "TargetLocationsURL",
        option_to_yojson target_locations_ur_l_to_yojson x.target_locations_ur_l );
    ]

let invalid_association_to_yojson (x : invalid_association) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let start_associations_once_result_to_yojson = unit_to_yojson
let association_id_list_to_yojson tree = list_to_yojson association_id_to_yojson tree

let start_associations_once_request_to_yojson (x : start_associations_once_request) =
  assoc_to_yojson [ ("AssociationIds", Some (association_id_list_to_yojson x.association_ids)) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("QuotaCode", option_to_yojson string__to_yojson x.quota_code);
      ("ServiceCode", option_to_yojson string__to_yojson x.service_code);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("ResourceId", option_to_yojson string__to_yojson x.resource_id);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("QuotaCode", Some (string__to_yojson x.quota_code));
      ("ServiceCode", Some (string__to_yojson x.service_code));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let start_access_request_response_to_yojson (x : start_access_request_response) =
  assoc_to_yojson
    [ ("AccessRequestId", option_to_yojson access_request_id_to_yojson x.access_request_id) ]

let string1to256_to_yojson = string_to_yojson

let start_access_request_request_to_yojson (x : start_access_request_request) =
  assoc_to_yojson
    [
      ("Reason", Some (string1to256_to_yojson x.reason));
      ("Targets", Some (targets_to_yojson x.targets));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let unsupported_platform_type_to_yojson (x : unsupported_platform_type) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_role_to_yojson (x : invalid_role) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_output_folder_to_yojson = unit_to_yojson

let invalid_notification_config_to_yojson (x : invalid_notification_config) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let duplicate_instance_id_to_yojson = unit_to_yojson
let delivery_timed_out_count_to_yojson = int_to_yojson
let error_count_to_yojson = int_to_yojson
let completed_count_to_yojson = int_to_yojson
let target_count_to_yojson = int_to_yojson
let status_details_to_yojson = string_to_yojson

let command_status_to_yojson (x : command_status) =
  match x with
  | PENDING -> `String "Pending"
  | IN_PROGRESS -> `String "InProgress"
  | SUCCESS -> `String "Success"
  | CANCELLED -> `String "Cancelled"
  | FAILED -> `String "Failed"
  | TIMED_OUT -> `String "TimedOut"
  | CANCELLING -> `String "Cancelling"

let instance_id_list_to_yojson tree = list_to_yojson instance_id_to_yojson tree
let command_id_to_yojson = string_to_yojson

let command_to_yojson (x : command) =
  assoc_to_yojson
    [
      ("CommandId", option_to_yojson command_id_to_yojson x.command_id);
      ("DocumentName", option_to_yojson document_name_to_yojson x.document_name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Comment", option_to_yojson comment_to_yojson x.comment);
      ("ExpiresAfter", option_to_yojson date_time_to_yojson x.expires_after);
      ("Parameters", option_to_yojson parameters_to_yojson x.parameters);
      ("InstanceIds", option_to_yojson instance_id_list_to_yojson x.instance_ids);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("RequestedDateTime", option_to_yojson date_time_to_yojson x.requested_date_time);
      ("Status", option_to_yojson command_status_to_yojson x.status);
      ("StatusDetails", option_to_yojson status_details_to_yojson x.status_details);
      ("OutputS3Region", option_to_yojson s3_region_to_yojson x.output_s3_region);
      ("OutputS3BucketName", option_to_yojson s3_bucket_name_to_yojson x.output_s3_bucket_name);
      ("OutputS3KeyPrefix", option_to_yojson s3_key_prefix_to_yojson x.output_s3_key_prefix);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("TargetCount", option_to_yojson target_count_to_yojson x.target_count);
      ("CompletedCount", option_to_yojson completed_count_to_yojson x.completed_count);
      ("ErrorCount", option_to_yojson error_count_to_yojson x.error_count);
      ( "DeliveryTimedOutCount",
        option_to_yojson delivery_timed_out_count_to_yojson x.delivery_timed_out_count );
      ("ServiceRole", option_to_yojson service_role_to_yojson x.service_role);
      ("NotificationConfig", option_to_yojson notification_config_to_yojson x.notification_config);
      ( "CloudWatchOutputConfig",
        option_to_yojson cloud_watch_output_config_to_yojson x.cloud_watch_output_config );
      ("TimeoutSeconds", option_to_yojson timeout_seconds_to_yojson x.timeout_seconds);
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ("TriggeredAlarms", option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms);
    ]

let send_command_result_to_yojson (x : send_command_result) =
  assoc_to_yojson [ ("Command", option_to_yojson command_to_yojson x.command) ]

let send_command_request_to_yojson (x : send_command_request) =
  assoc_to_yojson
    [
      ("InstanceIds", option_to_yojson instance_id_list_to_yojson x.instance_ids);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("DocumentName", Some (document_ar_n_to_yojson x.document_name));
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("DocumentHash", option_to_yojson document_hash_to_yojson x.document_hash);
      ("DocumentHashType", option_to_yojson document_hash_type_to_yojson x.document_hash_type);
      ("TimeoutSeconds", option_to_yojson timeout_seconds_to_yojson x.timeout_seconds);
      ("Comment", option_to_yojson comment_to_yojson x.comment);
      ("Parameters", option_to_yojson parameters_to_yojson x.parameters);
      ("OutputS3Region", option_to_yojson s3_region_to_yojson x.output_s3_region);
      ("OutputS3BucketName", option_to_yojson s3_bucket_name_to_yojson x.output_s3_bucket_name);
      ("OutputS3KeyPrefix", option_to_yojson s3_key_prefix_to_yojson x.output_s3_key_prefix);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("ServiceRoleArn", option_to_yojson service_role_to_yojson x.service_role_arn);
      ("NotificationConfig", option_to_yojson notification_config_to_yojson x.notification_config);
      ( "CloudWatchOutputConfig",
        option_to_yojson cloud_watch_output_config_to_yojson x.cloud_watch_output_config );
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
    ]

let invalid_automation_signal_exception_to_yojson (x : invalid_automation_signal_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let automation_step_not_found_exception_to_yojson (x : automation_step_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let send_automation_signal_result_to_yojson = unit_to_yojson

let signal_type_to_yojson (x : signal_type) =
  match x with
  | APPROVE -> `String "Approve"
  | REJECT -> `String "Reject"
  | START_STEP -> `String "StartStep"
  | STOP_STEP -> `String "StopStep"
  | RESUME -> `String "Resume"
  | REVOKE -> `String "Revoke"

let send_automation_signal_request_to_yojson (x : send_automation_signal_request) =
  assoc_to_yojson
    [
      ("AutomationExecutionId", Some (automation_execution_id_to_yojson x.automation_execution_id));
      ("SignalType", Some (signal_type_to_yojson x.signal_type));
      ("Payload", option_to_yojson automation_parameter_map_to_yojson x.payload);
    ]

let resume_session_response_to_yojson (x : resume_session_response) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("TokenValue", option_to_yojson token_value_to_yojson x.token_value);
      ("StreamUrl", option_to_yojson stream_url_to_yojson x.stream_url);
    ]

let resume_session_request_to_yojson (x : resume_session_request) =
  assoc_to_yojson [ ("SessionId", Some (session_id_to_yojson x.session_id)) ]

let service_setting_to_yojson (x : service_setting) =
  assoc_to_yojson
    [
      ("SettingId", option_to_yojson service_setting_id_to_yojson x.setting_id);
      ("SettingValue", option_to_yojson service_setting_value_to_yojson x.setting_value);
      ("LastModifiedDate", option_to_yojson date_time_to_yojson x.last_modified_date);
      ("LastModifiedUser", option_to_yojson string__to_yojson x.last_modified_user);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("Status", option_to_yojson string__to_yojson x.status);
    ]

let reset_service_setting_result_to_yojson (x : reset_service_setting_result) =
  assoc_to_yojson
    [ ("ServiceSetting", option_to_yojson service_setting_to_yojson x.service_setting) ]

let reset_service_setting_request_to_yojson (x : reset_service_setting_request) =
  assoc_to_yojson [ ("SettingId", Some (service_setting_id_to_yojson x.setting_id)) ]

let remove_tags_from_resource_result_to_yojson = unit_to_yojson
let key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let remove_tags_from_resource_request_to_yojson (x : remove_tags_from_resource_request) =
  assoc_to_yojson
    [
      ("ResourceType", Some (resource_type_for_tagging_to_yojson x.resource_type));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("TagKeys", Some (key_list_to_yojson x.tag_keys));
    ]

let resource_limit_exceeded_exception_to_yojson (x : resource_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let feature_not_available_exception_to_yojson (x : feature_not_available_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let register_task_with_maintenance_window_result_to_yojson
    (x : register_task_with_maintenance_window_result) =
  assoc_to_yojson
    [ ("WindowTaskId", option_to_yojson maintenance_window_task_id_to_yojson x.window_task_id) ]

let client_token_to_yojson = string_to_yojson

let maintenance_window_task_type_to_yojson (x : maintenance_window_task_type) =
  match x with
  | RunCommand -> `String "RUN_COMMAND"
  | Automation -> `String "AUTOMATION"
  | StepFunctions -> `String "STEP_FUNCTIONS"
  | Lambda -> `String "LAMBDA"

let register_task_with_maintenance_window_request_to_yojson
    (x : register_task_with_maintenance_window_request) =
  assoc_to_yojson
    [
      ("WindowId", Some (maintenance_window_id_to_yojson x.window_id));
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("TaskArn", Some (maintenance_window_task_arn_to_yojson x.task_arn));
      ("ServiceRoleArn", option_to_yojson service_role_to_yojson x.service_role_arn);
      ("TaskType", Some (maintenance_window_task_type_to_yojson x.task_type));
      ( "TaskParameters",
        option_to_yojson maintenance_window_task_parameters_to_yojson x.task_parameters );
      ( "TaskInvocationParameters",
        option_to_yojson maintenance_window_task_invocation_parameters_to_yojson
          x.task_invocation_parameters );
      ("Priority", option_to_yojson maintenance_window_task_priority_to_yojson x.priority);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("LoggingInfo", option_to_yojson logging_info_to_yojson x.logging_info);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "CutoffBehavior",
        option_to_yojson maintenance_window_task_cutoff_behavior_to_yojson x.cutoff_behavior );
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
    ]

let register_target_with_maintenance_window_result_to_yojson
    (x : register_target_with_maintenance_window_result) =
  assoc_to_yojson
    [
      ("WindowTargetId", option_to_yojson maintenance_window_target_id_to_yojson x.window_target_id);
    ]

let maintenance_window_resource_type_to_yojson (x : maintenance_window_resource_type) =
  match x with Instance -> `String "INSTANCE" | ResourceGroup -> `String "RESOURCE_GROUP"

let register_target_with_maintenance_window_request_to_yojson
    (x : register_target_with_maintenance_window_request) =
  assoc_to_yojson
    [
      ("WindowId", Some (maintenance_window_id_to_yojson x.window_id));
      ("ResourceType", Some (maintenance_window_resource_type_to_yojson x.resource_type));
      ("Targets", Some (targets_to_yojson x.targets));
      ("OwnerInformation", option_to_yojson owner_information_to_yojson x.owner_information);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let patch_group_to_yojson = string_to_yojson

let register_patch_baseline_for_patch_group_result_to_yojson
    (x : register_patch_baseline_for_patch_group_result) =
  assoc_to_yojson
    [
      ("BaselineId", option_to_yojson baseline_id_to_yojson x.baseline_id);
      ("PatchGroup", option_to_yojson patch_group_to_yojson x.patch_group);
    ]

let register_patch_baseline_for_patch_group_request_to_yojson
    (x : register_patch_baseline_for_patch_group_request) =
  assoc_to_yojson
    [
      ("BaselineId", Some (baseline_id_to_yojson x.baseline_id));
      ("PatchGroup", Some (patch_group_to_yojson x.patch_group));
    ]

let register_default_patch_baseline_result_to_yojson (x : register_default_patch_baseline_result) =
  assoc_to_yojson [ ("BaselineId", option_to_yojson baseline_id_to_yojson x.baseline_id) ]

let register_default_patch_baseline_request_to_yojson (x : register_default_patch_baseline_request)
    =
  assoc_to_yojson [ ("BaselineId", Some (baseline_id_to_yojson x.baseline_id)) ]

let resource_policy_not_found_exception_to_yojson (x : resource_policy_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_policy_limit_exceeded_exception_to_yojson
    (x : resource_policy_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson integer_to_yojson x.limit);
      ("LimitType", option_to_yojson string__to_yojson x.limit_type);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let resource_policy_parameter_names_list_to_yojson tree = list_to_yojson string__to_yojson tree

let resource_policy_invalid_parameter_exception_to_yojson
    (x : resource_policy_invalid_parameter_exception) =
  assoc_to_yojson
    [
      ( "ParameterNames",
        option_to_yojson resource_policy_parameter_names_list_to_yojson x.parameter_names );
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let resource_policy_conflict_exception_to_yojson (x : resource_policy_conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let malformed_resource_policy_document_exception_to_yojson
    (x : malformed_resource_policy_document_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let policy_hash_to_yojson = string_to_yojson
let policy_id_to_yojson = string_to_yojson

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [
      ("PolicyId", option_to_yojson policy_id_to_yojson x.policy_id);
      ("PolicyHash", option_to_yojson policy_hash_to_yojson x.policy_hash);
    ]

let policy_to_yojson = string_to_yojson
let resource_arn_string_to_yojson = string_to_yojson

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_string_to_yojson x.resource_arn));
      ("Policy", Some (policy_to_yojson x.policy));
      ("PolicyId", option_to_yojson policy_id_to_yojson x.policy_id);
      ("PolicyHash", option_to_yojson policy_hash_to_yojson x.policy_hash);
    ]

let unsupported_parameter_type_to_yojson (x : unsupported_parameter_type) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let policies_limit_exceeded_exception_to_yojson (x : policies_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let parameter_pattern_mismatch_exception_to_yojson (x : parameter_pattern_mismatch_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let parameter_max_version_limit_exceeded_to_yojson (x : parameter_max_version_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let parameter_limit_exceeded_to_yojson (x : parameter_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let parameter_already_exists_to_yojson (x : parameter_already_exists) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_policy_type_exception_to_yojson (x : invalid_policy_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_policy_attribute_exception_to_yojson (x : invalid_policy_attribute_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_key_id_to_yojson (x : invalid_key_id) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_allowed_pattern_exception_to_yojson (x : invalid_allowed_pattern_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let incompatible_policy_exception_to_yojson (x : incompatible_policy_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let hierarchy_type_mismatch_exception_to_yojson (x : hierarchy_type_mismatch_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let hierarchy_level_limit_exceeded_exception_to_yojson
    (x : hierarchy_level_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let parameter_tier_to_yojson (x : parameter_tier) =
  match x with
  | STANDARD -> `String "Standard"
  | ADVANCED -> `String "Advanced"
  | INTELLIGENT_TIERING -> `String "Intelligent-Tiering"

let put_parameter_result_to_yojson (x : put_parameter_result) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson ps_parameter_version_to_yojson x.version);
      ("Tier", option_to_yojson parameter_tier_to_yojson x.tier);
    ]

let parameter_data_type_to_yojson = string_to_yojson
let parameter_policies_to_yojson = string_to_yojson
let parameter_key_id_to_yojson = string_to_yojson

let parameter_type_to_yojson (x : parameter_type) =
  match x with
  | STRING -> `String "String"
  | STRING_LIST -> `String "StringList"
  | SECURE_STRING -> `String "SecureString"

let ps_parameter_value_to_yojson = string_to_yojson
let parameter_description_to_yojson = string_to_yojson

let put_parameter_request_to_yojson (x : put_parameter_request) =
  assoc_to_yojson
    [
      ("Name", Some (ps_parameter_name_to_yojson x.name));
      ("Description", option_to_yojson parameter_description_to_yojson x.description);
      ("Value", Some (ps_parameter_value_to_yojson x.value));
      ("Type", option_to_yojson parameter_type_to_yojson x.type_);
      ("KeyId", option_to_yojson parameter_key_id_to_yojson x.key_id);
      ("Overwrite", option_to_yojson boolean__to_yojson x.overwrite);
      ("AllowedPattern", option_to_yojson allowed_pattern_to_yojson x.allowed_pattern);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Tier", option_to_yojson parameter_tier_to_yojson x.tier);
      ("Policies", option_to_yojson parameter_policies_to_yojson x.policies);
      ("DataType", option_to_yojson parameter_data_type_to_yojson x.data_type);
    ]

let unsupported_inventory_schema_version_exception_to_yojson
    (x : unsupported_inventory_schema_version_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let inventory_item_type_name_to_yojson = string_to_yojson

let unsupported_inventory_item_context_exception_to_yojson
    (x : unsupported_inventory_item_context_exception) =
  assoc_to_yojson
    [
      ("TypeName", option_to_yojson inventory_item_type_name_to_yojson x.type_name);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let total_size_limit_exceeded_exception_to_yojson (x : total_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let sub_type_count_limit_exceeded_exception_to_yojson (x : sub_type_count_limit_exceeded_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let item_size_limit_exceeded_exception_to_yojson (x : item_size_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("TypeName", option_to_yojson inventory_item_type_name_to_yojson x.type_name);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let item_content_mismatch_exception_to_yojson (x : item_content_mismatch_exception) =
  assoc_to_yojson
    [
      ("TypeName", option_to_yojson inventory_item_type_name_to_yojson x.type_name);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let invalid_type_name_exception_to_yojson (x : invalid_type_name_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_item_content_exception_to_yojson (x : invalid_item_content_exception) =
  assoc_to_yojson
    [
      ("TypeName", option_to_yojson inventory_item_type_name_to_yojson x.type_name);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let invalid_inventory_item_context_exception_to_yojson
    (x : invalid_inventory_item_context_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let custom_schema_count_limit_exceeded_exception_to_yojson
    (x : custom_schema_count_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let put_inventory_message_to_yojson = string_to_yojson

let put_inventory_result_to_yojson (x : put_inventory_result) =
  assoc_to_yojson [ ("Message", option_to_yojson put_inventory_message_to_yojson x.message) ]

let attribute_value_to_yojson = string_to_yojson
let attribute_name_to_yojson = string_to_yojson

let inventory_item_content_context_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let inventory_item_entry_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let inventory_item_entry_list_to_yojson tree = list_to_yojson inventory_item_entry_to_yojson tree
let inventory_item_content_hash_to_yojson = string_to_yojson
let inventory_item_capture_time_to_yojson = string_to_yojson
let inventory_item_schema_version_to_yojson = string_to_yojson

let inventory_item_to_yojson (x : inventory_item) =
  assoc_to_yojson
    [
      ("TypeName", Some (inventory_item_type_name_to_yojson x.type_name));
      ("SchemaVersion", Some (inventory_item_schema_version_to_yojson x.schema_version));
      ("CaptureTime", Some (inventory_item_capture_time_to_yojson x.capture_time));
      ("ContentHash", option_to_yojson inventory_item_content_hash_to_yojson x.content_hash);
      ("Content", option_to_yojson inventory_item_entry_list_to_yojson x.content);
      ("Context", option_to_yojson inventory_item_content_context_to_yojson x.context);
    ]

let inventory_item_list_to_yojson tree = list_to_yojson inventory_item_to_yojson tree

let put_inventory_request_to_yojson (x : put_inventory_request) =
  assoc_to_yojson
    [
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ("Items", Some (inventory_item_list_to_yojson x.items));
    ]

let compliance_type_count_limit_exceeded_exception_to_yojson
    (x : compliance_type_count_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let put_compliance_items_result_to_yojson = unit_to_yojson

let compliance_upload_type_to_yojson (x : compliance_upload_type) =
  match x with Complete -> `String "COMPLETE" | Partial -> `String "PARTIAL"

let compliance_item_content_hash_to_yojson = string_to_yojson

let compliance_item_details_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let compliance_status_to_yojson (x : compliance_status) =
  match x with Compliant -> `String "COMPLIANT" | NonCompliant -> `String "NON_COMPLIANT"

let compliance_severity_to_yojson (x : compliance_severity) =
  match x with
  | Critical -> `String "CRITICAL"
  | High -> `String "HIGH"
  | Medium -> `String "MEDIUM"
  | Low -> `String "LOW"
  | Informational -> `String "INFORMATIONAL"
  | Unspecified -> `String "UNSPECIFIED"

let compliance_item_title_to_yojson = string_to_yojson
let compliance_item_id_to_yojson = string_to_yojson

let compliance_item_entry_to_yojson (x : compliance_item_entry) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson compliance_item_id_to_yojson x.id);
      ("Title", option_to_yojson compliance_item_title_to_yojson x.title);
      ("Severity", Some (compliance_severity_to_yojson x.severity));
      ("Status", Some (compliance_status_to_yojson x.status));
      ("Details", option_to_yojson compliance_item_details_to_yojson x.details);
    ]

let compliance_item_entry_list_to_yojson tree = list_to_yojson compliance_item_entry_to_yojson tree
let compliance_execution_type_to_yojson = string_to_yojson
let compliance_execution_id_to_yojson = string_to_yojson

let compliance_execution_summary_to_yojson (x : compliance_execution_summary) =
  assoc_to_yojson
    [
      ("ExecutionTime", Some (date_time_to_yojson x.execution_time));
      ("ExecutionId", option_to_yojson compliance_execution_id_to_yojson x.execution_id);
      ("ExecutionType", option_to_yojson compliance_execution_type_to_yojson x.execution_type);
    ]

let compliance_type_name_to_yojson = string_to_yojson
let compliance_resource_type_to_yojson = string_to_yojson
let compliance_resource_id_to_yojson = string_to_yojson

let put_compliance_items_request_to_yojson (x : put_compliance_items_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (compliance_resource_id_to_yojson x.resource_id));
      ("ResourceType", Some (compliance_resource_type_to_yojson x.resource_type));
      ("ComplianceType", Some (compliance_type_name_to_yojson x.compliance_type));
      ("ExecutionSummary", Some (compliance_execution_summary_to_yojson x.execution_summary));
      ("Items", Some (compliance_item_entry_list_to_yojson x.items));
      ( "ItemContentHash",
        option_to_yojson compliance_item_content_hash_to_yojson x.item_content_hash );
      ("UploadType", option_to_yojson compliance_upload_type_to_yojson x.upload_type);
    ]

let invalid_permission_type_to_yojson (x : invalid_permission_type) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let document_permission_limit_to_yojson (x : document_permission_limit) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let document_limit_exceeded_to_yojson (x : document_limit_exceeded) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let modify_document_permission_response_to_yojson = unit_to_yojson

let document_permission_type_to_yojson (x : document_permission_type) =
  match x with SHARE -> `String "Share"

let modify_document_permission_request_to_yojson (x : modify_document_permission_request) =
  assoc_to_yojson
    [
      ("Name", Some (document_name_to_yojson x.name));
      ("PermissionType", Some (document_permission_type_to_yojson x.permission_type));
      ("AccountIdsToAdd", option_to_yojson account_id_list_to_yojson x.account_ids_to_add);
      ("AccountIdsToRemove", option_to_yojson account_id_list_to_yojson x.account_ids_to_remove);
      ( "SharedDocumentVersion",
        option_to_yojson shared_document_version_to_yojson x.shared_document_version );
    ]

let list_tags_for_resource_result_to_yojson (x : list_tags_for_resource_result) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("ResourceType", Some (resource_type_for_tagging_to_yojson x.resource_type));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let invalid_next_token_to_yojson (x : invalid_next_token) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson
let last_resource_data_sync_message_to_yojson = string_to_yojson
let resource_data_sync_created_time_to_yojson = timestamp_epoch_seconds_to_yojson

let last_resource_data_sync_status_to_yojson (x : last_resource_data_sync_status) =
  match x with
  | SUCCESSFUL -> `String "Successful"
  | FAILED -> `String "Failed"
  | INPROGRESS -> `String "InProgress"

let resource_data_sync_last_modified_time_to_yojson = timestamp_epoch_seconds_to_yojson
let last_successful_resource_data_sync_time_to_yojson = timestamp_epoch_seconds_to_yojson
let last_resource_data_sync_time_to_yojson = timestamp_epoch_seconds_to_yojson
let resource_data_sync_destination_data_sharing_type_to_yojson = string_to_yojson

let resource_data_sync_destination_data_sharing_to_yojson
    (x : resource_data_sync_destination_data_sharing) =
  assoc_to_yojson
    [
      ( "DestinationDataSharingType",
        option_to_yojson resource_data_sync_destination_data_sharing_type_to_yojson
          x.destination_data_sharing_type );
    ]

let resource_data_sync_awskms_key_ar_n_to_yojson = string_to_yojson
let resource_data_sync_s3_region_to_yojson = string_to_yojson

let resource_data_sync_s3_format_to_yojson (x : resource_data_sync_s3_format) =
  match x with JSON_SERDE -> `String "JsonSerDe"

let resource_data_sync_s3_prefix_to_yojson = string_to_yojson
let resource_data_sync_s3_bucket_name_to_yojson = string_to_yojson

let resource_data_sync_s3_destination_to_yojson (x : resource_data_sync_s3_destination) =
  assoc_to_yojson
    [
      ("BucketName", Some (resource_data_sync_s3_bucket_name_to_yojson x.bucket_name));
      ("Prefix", option_to_yojson resource_data_sync_s3_prefix_to_yojson x.prefix);
      ("SyncFormat", Some (resource_data_sync_s3_format_to_yojson x.sync_format));
      ("Region", Some (resource_data_sync_s3_region_to_yojson x.region));
      ( "AWSKMSKeyARN",
        option_to_yojson resource_data_sync_awskms_key_ar_n_to_yojson x.awskms_key_ar_n );
      ( "DestinationDataSharing",
        option_to_yojson resource_data_sync_destination_data_sharing_to_yojson
          x.destination_data_sharing );
    ]

let resource_data_sync_state_to_yojson = string_to_yojson

let resource_data_sync_source_with_state_to_yojson (x : resource_data_sync_source_with_state) =
  assoc_to_yojson
    [
      ("SourceType", option_to_yojson resource_data_sync_source_type_to_yojson x.source_type);
      ( "AwsOrganizationsSource",
        option_to_yojson resource_data_sync_aws_organizations_source_to_yojson
          x.aws_organizations_source );
      ( "SourceRegions",
        option_to_yojson resource_data_sync_source_region_list_to_yojson x.source_regions );
      ( "IncludeFutureRegions",
        option_to_yojson resource_data_sync_include_future_regions_to_yojson
          x.include_future_regions );
      ("State", option_to_yojson resource_data_sync_state_to_yojson x.state);
      ( "EnableAllOpsDataSources",
        option_to_yojson resource_data_sync_enable_all_ops_data_sources_to_yojson
          x.enable_all_ops_data_sources );
    ]

let resource_data_sync_item_to_yojson (x : resource_data_sync_item) =
  assoc_to_yojson
    [
      ("SyncName", option_to_yojson resource_data_sync_name_to_yojson x.sync_name);
      ("SyncType", option_to_yojson resource_data_sync_type_to_yojson x.sync_type);
      ("SyncSource", option_to_yojson resource_data_sync_source_with_state_to_yojson x.sync_source);
      ( "S3Destination",
        option_to_yojson resource_data_sync_s3_destination_to_yojson x.s3_destination );
      ("LastSyncTime", option_to_yojson last_resource_data_sync_time_to_yojson x.last_sync_time);
      ( "LastSuccessfulSyncTime",
        option_to_yojson last_successful_resource_data_sync_time_to_yojson
          x.last_successful_sync_time );
      ( "SyncLastModifiedTime",
        option_to_yojson resource_data_sync_last_modified_time_to_yojson x.sync_last_modified_time
      );
      ("LastStatus", option_to_yojson last_resource_data_sync_status_to_yojson x.last_status);
      ( "SyncCreatedTime",
        option_to_yojson resource_data_sync_created_time_to_yojson x.sync_created_time );
      ( "LastSyncStatusMessage",
        option_to_yojson last_resource_data_sync_message_to_yojson x.last_sync_status_message );
    ]

let resource_data_sync_item_list_to_yojson tree =
  list_to_yojson resource_data_sync_item_to_yojson tree

let list_resource_data_sync_result_to_yojson (x : list_resource_data_sync_result) =
  assoc_to_yojson
    [
      ( "ResourceDataSyncItems",
        option_to_yojson resource_data_sync_item_list_to_yojson x.resource_data_sync_items );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_resource_data_sync_request_to_yojson (x : list_resource_data_sync_request) =
  assoc_to_yojson
    [
      ("SyncType", option_to_yojson resource_data_sync_type_to_yojson x.sync_type);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let invalid_filter_to_yojson (x : invalid_filter) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let compliance_summary_count_to_yojson = int_to_yojson

let severity_summary_to_yojson (x : severity_summary) =
  assoc_to_yojson
    [
      ("CriticalCount", option_to_yojson compliance_summary_count_to_yojson x.critical_count);
      ("HighCount", option_to_yojson compliance_summary_count_to_yojson x.high_count);
      ("MediumCount", option_to_yojson compliance_summary_count_to_yojson x.medium_count);
      ("LowCount", option_to_yojson compliance_summary_count_to_yojson x.low_count);
      ( "InformationalCount",
        option_to_yojson compliance_summary_count_to_yojson x.informational_count );
      ("UnspecifiedCount", option_to_yojson compliance_summary_count_to_yojson x.unspecified_count);
    ]

let non_compliant_summary_to_yojson (x : non_compliant_summary) =
  assoc_to_yojson
    [
      ( "NonCompliantCount",
        option_to_yojson compliance_summary_count_to_yojson x.non_compliant_count );
      ("SeveritySummary", option_to_yojson severity_summary_to_yojson x.severity_summary);
    ]

let compliant_summary_to_yojson (x : compliant_summary) =
  assoc_to_yojson
    [
      ("CompliantCount", option_to_yojson compliance_summary_count_to_yojson x.compliant_count);
      ("SeveritySummary", option_to_yojson severity_summary_to_yojson x.severity_summary);
    ]

let resource_compliance_summary_item_to_yojson (x : resource_compliance_summary_item) =
  assoc_to_yojson
    [
      ("ComplianceType", option_to_yojson compliance_type_name_to_yojson x.compliance_type);
      ("ResourceType", option_to_yojson compliance_resource_type_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson compliance_resource_id_to_yojson x.resource_id);
      ("Status", option_to_yojson compliance_status_to_yojson x.status);
      ("OverallSeverity", option_to_yojson compliance_severity_to_yojson x.overall_severity);
      ( "ExecutionSummary",
        option_to_yojson compliance_execution_summary_to_yojson x.execution_summary );
      ("CompliantSummary", option_to_yojson compliant_summary_to_yojson x.compliant_summary);
      ( "NonCompliantSummary",
        option_to_yojson non_compliant_summary_to_yojson x.non_compliant_summary );
    ]

let resource_compliance_summary_item_list_to_yojson tree =
  list_to_yojson resource_compliance_summary_item_to_yojson tree

let list_resource_compliance_summaries_result_to_yojson
    (x : list_resource_compliance_summaries_result) =
  assoc_to_yojson
    [
      ( "ResourceComplianceSummaryItems",
        option_to_yojson resource_compliance_summary_item_list_to_yojson
          x.resource_compliance_summary_items );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let compliance_query_operator_type_to_yojson (x : compliance_query_operator_type) =
  match x with
  | Equal -> `String "EQUAL"
  | NotEqual -> `String "NOT_EQUAL"
  | BeginWith -> `String "BEGIN_WITH"
  | LessThan -> `String "LESS_THAN"
  | GreaterThan -> `String "GREATER_THAN"

let compliance_filter_value_to_yojson = string_to_yojson

let compliance_string_filter_value_list_to_yojson tree =
  list_to_yojson compliance_filter_value_to_yojson tree

let compliance_string_filter_key_to_yojson = string_to_yojson

let compliance_string_filter_to_yojson (x : compliance_string_filter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson compliance_string_filter_key_to_yojson x.key);
      ("Values", option_to_yojson compliance_string_filter_value_list_to_yojson x.values);
      ("Type", option_to_yojson compliance_query_operator_type_to_yojson x.type_);
    ]

let compliance_string_filter_list_to_yojson tree =
  list_to_yojson compliance_string_filter_to_yojson tree

let list_resource_compliance_summaries_request_to_yojson
    (x : list_resource_compliance_summaries_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson compliance_string_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let ops_metadata_resource_id_to_yojson = string_to_yojson

let ops_metadata_to_yojson (x : ops_metadata) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson ops_metadata_resource_id_to_yojson x.resource_id);
      ("OpsMetadataArn", option_to_yojson ops_metadata_arn_to_yojson x.ops_metadata_arn);
      ("LastModifiedDate", option_to_yojson date_time_to_yojson x.last_modified_date);
      ("LastModifiedUser", option_to_yojson string__to_yojson x.last_modified_user);
      ("CreationDate", option_to_yojson date_time_to_yojson x.creation_date);
    ]

let ops_metadata_list_to_yojson tree = list_to_yojson ops_metadata_to_yojson tree

let list_ops_metadata_result_to_yojson (x : list_ops_metadata_result) =
  assoc_to_yojson
    [
      ("OpsMetadataList", option_to_yojson ops_metadata_list_to_yojson x.ops_metadata_list);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_ops_metadata_max_results_to_yojson = int_to_yojson
let ops_metadata_filter_value_to_yojson = string_to_yojson

let ops_metadata_filter_value_list_to_yojson tree =
  list_to_yojson ops_metadata_filter_value_to_yojson tree

let ops_metadata_filter_key_to_yojson = string_to_yojson

let ops_metadata_filter_to_yojson (x : ops_metadata_filter) =
  assoc_to_yojson
    [
      ("Key", Some (ops_metadata_filter_key_to_yojson x.key));
      ("Values", Some (ops_metadata_filter_value_list_to_yojson x.values));
    ]

let ops_metadata_filter_list_to_yojson tree = list_to_yojson ops_metadata_filter_to_yojson tree

let list_ops_metadata_request_to_yojson (x : list_ops_metadata_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson ops_metadata_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson list_ops_metadata_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let ops_item_identity_to_yojson (x : ops_item_identity) =
  assoc_to_yojson [ ("Arn", option_to_yojson string__to_yojson x.arn) ]

let ops_item_related_item_association_resource_uri_to_yojson = string_to_yojson
let ops_item_related_item_association_type_to_yojson = string_to_yojson
let ops_item_related_item_association_resource_type_to_yojson = string_to_yojson
let ops_item_related_item_association_id_to_yojson = string_to_yojson

let ops_item_related_item_summary_to_yojson (x : ops_item_related_item_summary) =
  assoc_to_yojson
    [
      ("OpsItemId", option_to_yojson ops_item_id_to_yojson x.ops_item_id);
      ( "AssociationId",
        option_to_yojson ops_item_related_item_association_id_to_yojson x.association_id );
      ( "ResourceType",
        option_to_yojson ops_item_related_item_association_resource_type_to_yojson x.resource_type
      );
      ( "AssociationType",
        option_to_yojson ops_item_related_item_association_type_to_yojson x.association_type );
      ( "ResourceUri",
        option_to_yojson ops_item_related_item_association_resource_uri_to_yojson x.resource_uri );
      ("CreatedBy", option_to_yojson ops_item_identity_to_yojson x.created_by);
      ("CreatedTime", option_to_yojson date_time_to_yojson x.created_time);
      ("LastModifiedBy", option_to_yojson ops_item_identity_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
    ]

let ops_item_related_item_summaries_to_yojson tree =
  list_to_yojson ops_item_related_item_summary_to_yojson tree

let list_ops_item_related_items_response_to_yojson (x : list_ops_item_related_items_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Summaries", option_to_yojson ops_item_related_item_summaries_to_yojson x.summaries);
    ]

let ops_item_related_items_max_results_to_yojson = int_to_yojson

let ops_item_related_items_filter_operator_to_yojson (x : ops_item_related_items_filter_operator) =
  match x with EQUAL -> `String "Equal"

let ops_item_related_items_filter_value_to_yojson = string_to_yojson

let ops_item_related_items_filter_values_to_yojson tree =
  list_to_yojson ops_item_related_items_filter_value_to_yojson tree

let ops_item_related_items_filter_key_to_yojson (x : ops_item_related_items_filter_key) =
  match x with
  | RESOURCE_TYPE -> `String "ResourceType"
  | ASSOCIATION_ID -> `String "AssociationId"
  | RESOURCE_URI -> `String "ResourceUri"

let ops_item_related_items_filter_to_yojson (x : ops_item_related_items_filter) =
  assoc_to_yojson
    [
      ("Key", Some (ops_item_related_items_filter_key_to_yojson x.key));
      ("Values", Some (ops_item_related_items_filter_values_to_yojson x.values));
      ("Operator", Some (ops_item_related_items_filter_operator_to_yojson x.operator));
    ]

let ops_item_related_items_filters_to_yojson tree =
  list_to_yojson ops_item_related_items_filter_to_yojson tree

let list_ops_item_related_items_request_to_yojson (x : list_ops_item_related_items_request) =
  assoc_to_yojson
    [
      ("OpsItemId", option_to_yojson ops_item_id_to_yojson x.ops_item_id);
      ("Filters", option_to_yojson ops_item_related_items_filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson ops_item_related_items_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let ops_item_event_summary_to_yojson (x : ops_item_event_summary) =
  assoc_to_yojson
    [
      ("OpsItemId", option_to_yojson string__to_yojson x.ops_item_id);
      ("EventId", option_to_yojson string__to_yojson x.event_id);
      ("Source", option_to_yojson string__to_yojson x.source);
      ("DetailType", option_to_yojson string__to_yojson x.detail_type);
      ("Detail", option_to_yojson string__to_yojson x.detail);
      ("CreatedBy", option_to_yojson ops_item_identity_to_yojson x.created_by);
      ("CreatedTime", option_to_yojson date_time_to_yojson x.created_time);
    ]

let ops_item_event_summaries_to_yojson tree = list_to_yojson ops_item_event_summary_to_yojson tree

let list_ops_item_events_response_to_yojson (x : list_ops_item_events_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Summaries", option_to_yojson ops_item_event_summaries_to_yojson x.summaries);
    ]

let ops_item_event_max_results_to_yojson = int_to_yojson

let ops_item_event_filter_operator_to_yojson (x : ops_item_event_filter_operator) =
  match x with EQUAL -> `String "Equal"

let ops_item_event_filter_value_to_yojson = string_to_yojson

let ops_item_event_filter_values_to_yojson tree =
  list_to_yojson ops_item_event_filter_value_to_yojson tree

let ops_item_event_filter_key_to_yojson (x : ops_item_event_filter_key) =
  match x with OPSITEM_ID -> `String "OpsItemId"

let ops_item_event_filter_to_yojson (x : ops_item_event_filter) =
  assoc_to_yojson
    [
      ("Key", Some (ops_item_event_filter_key_to_yojson x.key));
      ("Values", Some (ops_item_event_filter_values_to_yojson x.values));
      ("Operator", Some (ops_item_event_filter_operator_to_yojson x.operator));
    ]

let ops_item_event_filters_to_yojson tree = list_to_yojson ops_item_event_filter_to_yojson tree

let list_ops_item_events_request_to_yojson (x : list_ops_item_events_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson ops_item_event_filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson ops_item_event_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_aggregator_exception_to_yojson (x : invalid_aggregator_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let node_summary_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let node_summary_list_to_yojson tree = list_to_yojson node_summary_to_yojson tree

let list_nodes_summary_result_to_yojson (x : list_nodes_summary_result) =
  assoc_to_yojson
    [
      ("Summary", option_to_yojson node_summary_list_to_yojson x.summary);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let node_attribute_name_to_yojson (x : node_attribute_name) =
  match x with
  | AGENT_VERSION -> `String "AgentVersion"
  | PLATFORM_NAME -> `String "PlatformName"
  | PLATFORM_TYPE -> `String "PlatformType"
  | PLATFORM_VERSION -> `String "PlatformVersion"
  | REGION -> `String "Region"
  | RESOURCE_TYPE -> `String "ResourceType"

let node_type_name_to_yojson (x : node_type_name) = match x with INSTANCE -> `String "Instance"

let node_aggregator_type_to_yojson (x : node_aggregator_type) =
  match x with COUNT -> `String "Count"

let rec node_aggregator_list_to_yojson tree = list_to_yojson node_aggregator_to_yojson tree

and node_aggregator_to_yojson (x : node_aggregator) =
  assoc_to_yojson
    [
      ("AggregatorType", Some (node_aggregator_type_to_yojson x.aggregator_type));
      ("TypeName", Some (node_type_name_to_yojson x.type_name));
      ("AttributeName", Some (node_attribute_name_to_yojson x.attribute_name));
      ("Aggregators", option_to_yojson node_aggregator_list_to_yojson x.aggregators);
    ]

let node_filter_operator_type_to_yojson (x : node_filter_operator_type) =
  match x with
  | EQUAL -> `String "Equal"
  | NOT_EQUAL -> `String "NotEqual"
  | BEGIN_WITH -> `String "BeginWith"

let node_filter_value_to_yojson = string_to_yojson
let node_filter_value_list_to_yojson tree = list_to_yojson node_filter_value_to_yojson tree

let node_filter_key_to_yojson (x : node_filter_key) =
  match x with
  | AGENT_TYPE -> `String "AgentType"
  | AGENT_VERSION -> `String "AgentVersion"
  | COMPUTER_NAME -> `String "ComputerName"
  | INSTANCE_ID -> `String "InstanceId"
  | INSTANCE_STATUS -> `String "InstanceStatus"
  | IP_ADDRESS -> `String "IpAddress"
  | MANAGED_STATUS -> `String "ManagedStatus"
  | PLATFORM_NAME -> `String "PlatformName"
  | PLATFORM_TYPE -> `String "PlatformType"
  | PLATFORM_VERSION -> `String "PlatformVersion"
  | RESOURCE_TYPE -> `String "ResourceType"
  | ORGANIZATIONAL_UNIT_ID -> `String "OrganizationalUnitId"
  | ORGANIZATIONAL_UNIT_PATH -> `String "OrganizationalUnitPath"
  | REGION -> `String "Region"
  | ACCOUNT_ID -> `String "AccountId"

let node_filter_to_yojson (x : node_filter) =
  assoc_to_yojson
    [
      ("Key", Some (node_filter_key_to_yojson x.key));
      ("Values", Some (node_filter_value_list_to_yojson x.values));
      ("Type", option_to_yojson node_filter_operator_type_to_yojson x.type_);
    ]

let node_filter_list_to_yojson tree = list_to_yojson node_filter_to_yojson tree

let list_nodes_summary_request_to_yojson (x : list_nodes_summary_request) =
  assoc_to_yojson
    [
      ("SyncName", option_to_yojson resource_data_sync_name_to_yojson x.sync_name);
      ("Filters", option_to_yojson node_filter_list_to_yojson x.filters);
      ("Aggregators", Some (node_aggregator_list_to_yojson x.aggregators));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | MANAGED_INSTANCE -> `String "ManagedInstance"
  | EC2_INSTANCE -> `String "EC2Instance"

let platform_version_to_yojson = string_to_yojson
let platform_name_to_yojson = string_to_yojson

let managed_status_to_yojson (x : managed_status) =
  match x with
  | ALL -> `String "All"
  | MANAGED -> `String "Managed"
  | UNMANAGED -> `String "Unmanaged"

let ip_address_to_yojson = string_to_yojson
let instance_status_to_yojson = string_to_yojson
let computer_name_to_yojson = string_to_yojson

let instance_info_to_yojson (x : instance_info) =
  assoc_to_yojson
    [
      ("AgentType", option_to_yojson agent_type_to_yojson x.agent_type);
      ("AgentVersion", option_to_yojson agent_version_to_yojson x.agent_version);
      ("ComputerName", option_to_yojson computer_name_to_yojson x.computer_name);
      ("InstanceStatus", option_to_yojson instance_status_to_yojson x.instance_status);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("ManagedStatus", option_to_yojson managed_status_to_yojson x.managed_status);
      ("PlatformType", option_to_yojson platform_type_to_yojson x.platform_type);
      ("PlatformName", option_to_yojson platform_name_to_yojson x.platform_name);
      ("PlatformVersion", option_to_yojson platform_version_to_yojson x.platform_version);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
    ]

let node_type_to_yojson (x : node_type) =
  match x with
  | Instance arg -> assoc_to_yojson [ ("Instance", Some (instance_info_to_yojson arg)) ]

let node_region_to_yojson = string_to_yojson
let node_organizational_unit_path_to_yojson = string_to_yojson
let node_organizational_unit_id_to_yojson = string_to_yojson
let node_account_id_to_yojson = string_to_yojson

let node_owner_info_to_yojson (x : node_owner_info) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson node_account_id_to_yojson x.account_id);
      ( "OrganizationalUnitId",
        option_to_yojson node_organizational_unit_id_to_yojson x.organizational_unit_id );
      ( "OrganizationalUnitPath",
        option_to_yojson node_organizational_unit_path_to_yojson x.organizational_unit_path );
    ]

let node_id_to_yojson = string_to_yojson
let node_capture_time_to_yojson = timestamp_epoch_seconds_to_yojson

let node_to_yojson (x : node) =
  assoc_to_yojson
    [
      ("CaptureTime", option_to_yojson node_capture_time_to_yojson x.capture_time);
      ("Id", option_to_yojson node_id_to_yojson x.id);
      ("Owner", option_to_yojson node_owner_info_to_yojson x.owner);
      ("Region", option_to_yojson node_region_to_yojson x.region);
      ("NodeType", option_to_yojson node_type_to_yojson x.node_type);
    ]

let node_list_to_yojson tree = list_to_yojson node_to_yojson tree

let list_nodes_result_to_yojson (x : list_nodes_result) =
  assoc_to_yojson
    [
      ("Nodes", option_to_yojson node_list_to_yojson x.nodes);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_nodes_request_to_yojson (x : list_nodes_request) =
  assoc_to_yojson
    [
      ("SyncName", option_to_yojson resource_data_sync_name_to_yojson x.sync_name);
      ("Filters", option_to_yojson node_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_inventory_entries_result_to_yojson (x : list_inventory_entries_result) =
  assoc_to_yojson
    [
      ("TypeName", option_to_yojson inventory_item_type_name_to_yojson x.type_name);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("SchemaVersion", option_to_yojson inventory_item_schema_version_to_yojson x.schema_version);
      ("CaptureTime", option_to_yojson inventory_item_capture_time_to_yojson x.capture_time);
      ("Entries", option_to_yojson inventory_item_entry_list_to_yojson x.entries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let inventory_query_operator_type_to_yojson (x : inventory_query_operator_type) =
  match x with
  | EQUAL -> `String "Equal"
  | NOT_EQUAL -> `String "NotEqual"
  | BEGIN_WITH -> `String "BeginWith"
  | LESS_THAN -> `String "LessThan"
  | GREATER_THAN -> `String "GreaterThan"
  | EXISTS -> `String "Exists"

let inventory_filter_value_to_yojson = string_to_yojson

let inventory_filter_value_list_to_yojson tree =
  list_to_yojson inventory_filter_value_to_yojson tree

let inventory_filter_key_to_yojson = string_to_yojson

let inventory_filter_to_yojson (x : inventory_filter) =
  assoc_to_yojson
    [
      ("Key", Some (inventory_filter_key_to_yojson x.key));
      ("Values", Some (inventory_filter_value_list_to_yojson x.values));
      ("Type", option_to_yojson inventory_query_operator_type_to_yojson x.type_);
    ]

let inventory_filter_list_to_yojson tree = list_to_yojson inventory_filter_to_yojson tree

let list_inventory_entries_request_to_yojson (x : list_inventory_entries_request) =
  assoc_to_yojson
    [
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ("TypeName", Some (inventory_item_type_name_to_yojson x.type_name));
      ("Filters", option_to_yojson inventory_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let document_version_info_to_yojson (x : document_version_info) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson document_name_to_yojson x.name);
      ("DisplayName", option_to_yojson document_display_name_to_yojson x.display_name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("VersionName", option_to_yojson document_version_name_to_yojson x.version_name);
      ("CreatedDate", option_to_yojson date_time_to_yojson x.created_date);
      ("IsDefaultVersion", option_to_yojson boolean__to_yojson x.is_default_version);
      ("DocumentFormat", option_to_yojson document_format_to_yojson x.document_format);
      ("Status", option_to_yojson document_status_to_yojson x.status);
      ( "StatusInformation",
        option_to_yojson document_status_information_to_yojson x.status_information );
      ("ReviewStatus", option_to_yojson review_status_to_yojson x.review_status);
    ]

let document_version_list_to_yojson tree = list_to_yojson document_version_info_to_yojson tree

let list_document_versions_result_to_yojson (x : list_document_versions_result) =
  assoc_to_yojson
    [
      ("DocumentVersions", option_to_yojson document_version_list_to_yojson x.document_versions);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_document_versions_request_to_yojson (x : list_document_versions_request) =
  assoc_to_yojson
    [
      ("Name", Some (document_ar_n_to_yojson x.name));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let invalid_filter_key_to_yojson = unit_to_yojson

let document_identifier_to_yojson (x : document_identifier) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson document_ar_n_to_yojson x.name);
      ("CreatedDate", option_to_yojson date_time_to_yojson x.created_date);
      ("DisplayName", option_to_yojson document_display_name_to_yojson x.display_name);
      ("Owner", option_to_yojson document_owner_to_yojson x.owner);
      ("VersionName", option_to_yojson document_version_name_to_yojson x.version_name);
      ("PlatformTypes", option_to_yojson platform_type_list_to_yojson x.platform_types);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("DocumentType", option_to_yojson document_type_to_yojson x.document_type);
      ("SchemaVersion", option_to_yojson document_schema_version_to_yojson x.schema_version);
      ("DocumentFormat", option_to_yojson document_format_to_yojson x.document_format);
      ("TargetType", option_to_yojson target_type_to_yojson x.target_type);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Requires", option_to_yojson document_requires_list_to_yojson x.requires);
      ("ReviewStatus", option_to_yojson review_status_to_yojson x.review_status);
      ("Author", option_to_yojson document_author_to_yojson x.author);
    ]

let document_identifier_list_to_yojson tree = list_to_yojson document_identifier_to_yojson tree

let list_documents_result_to_yojson (x : list_documents_result) =
  assoc_to_yojson
    [
      ( "DocumentIdentifiers",
        option_to_yojson document_identifier_list_to_yojson x.document_identifiers );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let document_key_values_filter_value_to_yojson = string_to_yojson

let document_key_values_filter_values_to_yojson tree =
  list_to_yojson document_key_values_filter_value_to_yojson tree

let document_key_values_filter_key_to_yojson = string_to_yojson

let document_key_values_filter_to_yojson (x : document_key_values_filter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson document_key_values_filter_key_to_yojson x.key);
      ("Values", option_to_yojson document_key_values_filter_values_to_yojson x.values);
    ]

let document_key_values_filter_list_to_yojson tree =
  list_to_yojson document_key_values_filter_to_yojson tree

let document_filter_value_to_yojson = string_to_yojson

let document_filter_key_to_yojson (x : document_filter_key) =
  match x with
  | Name -> `String "Name"
  | Owner -> `String "Owner"
  | PlatformTypes -> `String "PlatformTypes"
  | DocumentType -> `String "DocumentType"

let document_filter_to_yojson (x : document_filter) =
  assoc_to_yojson
    [
      ("key", Some (document_filter_key_to_yojson x.key));
      ("value", Some (document_filter_value_to_yojson x.value));
    ]

let document_filter_list_to_yojson tree = list_to_yojson document_filter_to_yojson tree

let list_documents_request_to_yojson (x : list_documents_request) =
  assoc_to_yojson
    [
      ("DocumentFilterList", option_to_yojson document_filter_list_to_yojson x.document_filter_list);
      ("Filters", option_to_yojson document_key_values_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let document_reviewer_response_source_to_yojson (x : document_reviewer_response_source) =
  assoc_to_yojson
    [
      ("CreateTime", option_to_yojson date_time_to_yojson x.create_time);
      ("UpdatedTime", option_to_yojson date_time_to_yojson x.updated_time);
      ("ReviewStatus", option_to_yojson review_status_to_yojson x.review_status);
      ("Comment", option_to_yojson document_review_comment_list_to_yojson x.comment);
      ("Reviewer", option_to_yojson reviewer_to_yojson x.reviewer);
    ]

let document_reviewer_response_list_to_yojson tree =
  list_to_yojson document_reviewer_response_source_to_yojson tree

let document_metadata_response_info_to_yojson (x : document_metadata_response_info) =
  assoc_to_yojson
    [
      ( "ReviewerResponse",
        option_to_yojson document_reviewer_response_list_to_yojson x.reviewer_response );
    ]

let list_document_metadata_history_response_to_yojson (x : list_document_metadata_history_response)
    =
  assoc_to_yojson
    [
      ("Name", option_to_yojson document_name_to_yojson x.name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Author", option_to_yojson document_author_to_yojson x.author);
      ("Metadata", option_to_yojson document_metadata_response_info_to_yojson x.metadata);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let document_metadata_enum_to_yojson (x : document_metadata_enum) =
  match x with DocumentReviews -> `String "DocumentReviews"

let list_document_metadata_history_request_to_yojson (x : list_document_metadata_history_request) =
  assoc_to_yojson
    [
      ("Name", Some (document_name_to_yojson x.name));
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Metadata", Some (document_metadata_enum_to_yojson x.metadata));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let compliance_summary_item_to_yojson (x : compliance_summary_item) =
  assoc_to_yojson
    [
      ("ComplianceType", option_to_yojson compliance_type_name_to_yojson x.compliance_type);
      ("CompliantSummary", option_to_yojson compliant_summary_to_yojson x.compliant_summary);
      ( "NonCompliantSummary",
        option_to_yojson non_compliant_summary_to_yojson x.non_compliant_summary );
    ]

let compliance_summary_item_list_to_yojson tree =
  list_to_yojson compliance_summary_item_to_yojson tree

let list_compliance_summaries_result_to_yojson (x : list_compliance_summaries_result) =
  assoc_to_yojson
    [
      ( "ComplianceSummaryItems",
        option_to_yojson compliance_summary_item_list_to_yojson x.compliance_summary_items );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_compliance_summaries_request_to_yojson (x : list_compliance_summaries_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson compliance_string_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let compliance_item_to_yojson (x : compliance_item) =
  assoc_to_yojson
    [
      ("ComplianceType", option_to_yojson compliance_type_name_to_yojson x.compliance_type);
      ("ResourceType", option_to_yojson compliance_resource_type_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson compliance_resource_id_to_yojson x.resource_id);
      ("Id", option_to_yojson compliance_item_id_to_yojson x.id);
      ("Title", option_to_yojson compliance_item_title_to_yojson x.title);
      ("Status", option_to_yojson compliance_status_to_yojson x.status);
      ("Severity", option_to_yojson compliance_severity_to_yojson x.severity);
      ( "ExecutionSummary",
        option_to_yojson compliance_execution_summary_to_yojson x.execution_summary );
      ("Details", option_to_yojson compliance_item_details_to_yojson x.details);
    ]

let compliance_item_list_to_yojson tree = list_to_yojson compliance_item_to_yojson tree

let list_compliance_items_result_to_yojson (x : list_compliance_items_result) =
  assoc_to_yojson
    [
      ("ComplianceItems", option_to_yojson compliance_item_list_to_yojson x.compliance_items);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let compliance_resource_type_list_to_yojson tree =
  list_to_yojson compliance_resource_type_to_yojson tree

let compliance_resource_id_list_to_yojson tree =
  list_to_yojson compliance_resource_id_to_yojson tree

let list_compliance_items_request_to_yojson (x : list_compliance_items_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson compliance_string_filter_list_to_yojson x.filters);
      ("ResourceIds", option_to_yojson compliance_resource_id_list_to_yojson x.resource_ids);
      ("ResourceTypes", option_to_yojson compliance_resource_type_list_to_yojson x.resource_types);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let invalid_command_id_to_yojson = unit_to_yojson
let command_list_to_yojson tree = list_to_yojson command_to_yojson tree

let list_commands_result_to_yojson (x : list_commands_result) =
  assoc_to_yojson
    [
      ("Commands", option_to_yojson command_list_to_yojson x.commands);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let command_filter_value_to_yojson = string_to_yojson

let command_filter_key_to_yojson (x : command_filter_key) =
  match x with
  | INVOKED_AFTER -> `String "InvokedAfter"
  | INVOKED_BEFORE -> `String "InvokedBefore"
  | STATUS -> `String "Status"
  | EXECUTION_STAGE -> `String "ExecutionStage"
  | DOCUMENT_NAME -> `String "DocumentName"

let command_filter_to_yojson (x : command_filter) =
  assoc_to_yojson
    [
      ("key", Some (command_filter_key_to_yojson x.key));
      ("value", Some (command_filter_value_to_yojson x.value));
    ]

let command_filter_list_to_yojson tree = list_to_yojson command_filter_to_yojson tree
let command_max_results_to_yojson = int_to_yojson

let list_commands_request_to_yojson (x : list_commands_request) =
  assoc_to_yojson
    [
      ("CommandId", option_to_yojson command_id_to_yojson x.command_id);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("MaxResults", option_to_yojson command_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson command_filter_list_to_yojson x.filters);
    ]

let url_to_yojson = string_to_yojson
let command_plugin_output_to_yojson = string_to_yojson
let response_code_to_yojson = int_to_yojson

let command_plugin_status_to_yojson (x : command_plugin_status) =
  match x with
  | PENDING -> `String "Pending"
  | IN_PROGRESS -> `String "InProgress"
  | SUCCESS -> `String "Success"
  | TIMED_OUT -> `String "TimedOut"
  | CANCELLED -> `String "Cancelled"
  | FAILED -> `String "Failed"

let command_plugin_name_to_yojson = string_to_yojson

let command_plugin_to_yojson (x : command_plugin) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson command_plugin_name_to_yojson x.name);
      ("Status", option_to_yojson command_plugin_status_to_yojson x.status);
      ("StatusDetails", option_to_yojson status_details_to_yojson x.status_details);
      ("ResponseCode", option_to_yojson response_code_to_yojson x.response_code);
      ("ResponseStartDateTime", option_to_yojson date_time_to_yojson x.response_start_date_time);
      ("ResponseFinishDateTime", option_to_yojson date_time_to_yojson x.response_finish_date_time);
      ("Output", option_to_yojson command_plugin_output_to_yojson x.output);
      ("StandardOutputUrl", option_to_yojson url_to_yojson x.standard_output_url);
      ("StandardErrorUrl", option_to_yojson url_to_yojson x.standard_error_url);
      ("OutputS3Region", option_to_yojson s3_region_to_yojson x.output_s3_region);
      ("OutputS3BucketName", option_to_yojson s3_bucket_name_to_yojson x.output_s3_bucket_name);
      ("OutputS3KeyPrefix", option_to_yojson s3_key_prefix_to_yojson x.output_s3_key_prefix);
    ]

let command_plugin_list_to_yojson tree = list_to_yojson command_plugin_to_yojson tree
let invocation_trace_output_to_yojson = string_to_yojson

let command_invocation_status_to_yojson (x : command_invocation_status) =
  match x with
  | PENDING -> `String "Pending"
  | IN_PROGRESS -> `String "InProgress"
  | DELAYED -> `String "Delayed"
  | SUCCESS -> `String "Success"
  | CANCELLED -> `String "Cancelled"
  | TIMED_OUT -> `String "TimedOut"
  | FAILED -> `String "Failed"
  | CANCELLING -> `String "Cancelling"

let instance_tag_name_to_yojson = string_to_yojson

let command_invocation_to_yojson (x : command_invocation) =
  assoc_to_yojson
    [
      ("CommandId", option_to_yojson command_id_to_yojson x.command_id);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("InstanceName", option_to_yojson instance_tag_name_to_yojson x.instance_name);
      ("Comment", option_to_yojson comment_to_yojson x.comment);
      ("DocumentName", option_to_yojson document_name_to_yojson x.document_name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("RequestedDateTime", option_to_yojson date_time_to_yojson x.requested_date_time);
      ("Status", option_to_yojson command_invocation_status_to_yojson x.status);
      ("StatusDetails", option_to_yojson status_details_to_yojson x.status_details);
      ("TraceOutput", option_to_yojson invocation_trace_output_to_yojson x.trace_output);
      ("StandardOutputUrl", option_to_yojson url_to_yojson x.standard_output_url);
      ("StandardErrorUrl", option_to_yojson url_to_yojson x.standard_error_url);
      ("CommandPlugins", option_to_yojson command_plugin_list_to_yojson x.command_plugins);
      ("ServiceRole", option_to_yojson service_role_to_yojson x.service_role);
      ("NotificationConfig", option_to_yojson notification_config_to_yojson x.notification_config);
      ( "CloudWatchOutputConfig",
        option_to_yojson cloud_watch_output_config_to_yojson x.cloud_watch_output_config );
    ]

let command_invocation_list_to_yojson tree = list_to_yojson command_invocation_to_yojson tree

let list_command_invocations_result_to_yojson (x : list_command_invocations_result) =
  assoc_to_yojson
    [
      ( "CommandInvocations",
        option_to_yojson command_invocation_list_to_yojson x.command_invocations );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_command_invocations_request_to_yojson (x : list_command_invocations_request) =
  assoc_to_yojson
    [
      ("CommandId", option_to_yojson command_id_to_yojson x.command_id);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("MaxResults", option_to_yojson command_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson command_filter_list_to_yojson x.filters);
      ("Details", option_to_yojson boolean__to_yojson x.details);
    ]

let association_version_info_to_yojson (x : association_version_info) =
  assoc_to_yojson
    [
      ("AssociationId", option_to_yojson association_id_to_yojson x.association_id);
      ("AssociationVersion", option_to_yojson association_version_to_yojson x.association_version);
      ("CreatedDate", option_to_yojson date_time_to_yojson x.created_date);
      ("Name", option_to_yojson document_ar_n_to_yojson x.name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Parameters", option_to_yojson parameters_to_yojson x.parameters);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("ScheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ( "OutputLocation",
        option_to_yojson instance_association_output_location_to_yojson x.output_location );
      ("AssociationName", option_to_yojson association_name_to_yojson x.association_name);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ( "ComplianceSeverity",
        option_to_yojson association_compliance_severity_to_yojson x.compliance_severity );
      ("SyncCompliance", option_to_yojson association_sync_compliance_to_yojson x.sync_compliance);
      ( "ApplyOnlyAtCronInterval",
        option_to_yojson apply_only_at_cron_interval_to_yojson x.apply_only_at_cron_interval );
      ("CalendarNames", option_to_yojson calendar_name_or_arn_list_to_yojson x.calendar_names);
      ("TargetLocations", option_to_yojson target_locations_to_yojson x.target_locations);
      ("ScheduleOffset", option_to_yojson schedule_offset_to_yojson x.schedule_offset);
      ("Duration", option_to_yojson duration_to_yojson x.duration);
      ("TargetMaps", option_to_yojson target_maps_to_yojson x.target_maps);
      ( "AssociationDispatchAssumeRole",
        option_to_yojson association_dispatch_assume_role_arn_to_yojson
          x.association_dispatch_assume_role );
    ]

let association_version_list_to_yojson tree = list_to_yojson association_version_info_to_yojson tree

let list_association_versions_result_to_yojson (x : list_association_versions_result) =
  assoc_to_yojson
    [
      ( "AssociationVersions",
        option_to_yojson association_version_list_to_yojson x.association_versions );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_association_versions_request_to_yojson (x : list_association_versions_request) =
  assoc_to_yojson
    [
      ("AssociationId", Some (association_id_to_yojson x.association_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let association_to_yojson (x : association) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson document_ar_n_to_yojson x.name);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("AssociationId", option_to_yojson association_id_to_yojson x.association_id);
      ("AssociationVersion", option_to_yojson association_version_to_yojson x.association_version);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("LastExecutionDate", option_to_yojson date_time_to_yojson x.last_execution_date);
      ("Overview", option_to_yojson association_overview_to_yojson x.overview);
      ("ScheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ("AssociationName", option_to_yojson association_name_to_yojson x.association_name);
      ("ScheduleOffset", option_to_yojson schedule_offset_to_yojson x.schedule_offset);
      ("Duration", option_to_yojson duration_to_yojson x.duration);
      ("TargetMaps", option_to_yojson target_maps_to_yojson x.target_maps);
    ]

let association_list_to_yojson tree = list_to_yojson association_to_yojson tree

let list_associations_result_to_yojson (x : list_associations_result) =
  assoc_to_yojson
    [
      ("Associations", option_to_yojson association_list_to_yojson x.associations);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let association_filter_value_to_yojson = string_to_yojson

let association_filter_key_to_yojson (x : association_filter_key) =
  match x with
  | InstanceId -> `String "InstanceId"
  | Name -> `String "Name"
  | AssociationId -> `String "AssociationId"
  | Status -> `String "AssociationStatusName"
  | LastExecutedBefore -> `String "LastExecutedBefore"
  | LastExecutedAfter -> `String "LastExecutedAfter"
  | AssociationName -> `String "AssociationName"
  | ResourceGroupName -> `String "ResourceGroupName"

let association_filter_to_yojson (x : association_filter) =
  assoc_to_yojson
    [
      ("key", Some (association_filter_key_to_yojson x.key));
      ("value", Some (association_filter_value_to_yojson x.value));
    ]

let association_filter_list_to_yojson tree = list_to_yojson association_filter_to_yojson tree

let list_associations_request_to_yojson (x : list_associations_request) =
  assoc_to_yojson
    [
      ( "AssociationFilterList",
        option_to_yojson association_filter_list_to_yojson x.association_filter_list );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let parameter_version_label_limit_exceeded_to_yojson (x : parameter_version_label_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let label_parameter_version_result_to_yojson (x : label_parameter_version_result) =
  assoc_to_yojson
    [
      ("InvalidLabels", option_to_yojson parameter_label_list_to_yojson x.invalid_labels);
      ("ParameterVersion", option_to_yojson ps_parameter_version_to_yojson x.parameter_version);
    ]

let label_parameter_version_request_to_yojson (x : label_parameter_version_request) =
  assoc_to_yojson
    [
      ("Name", Some (ps_parameter_name_to_yojson x.name));
      ("ParameterVersion", option_to_yojson ps_parameter_version_to_yojson x.parameter_version);
      ("Labels", Some (parameter_label_list_to_yojson x.labels));
    ]

let get_service_setting_result_to_yojson (x : get_service_setting_result) =
  assoc_to_yojson
    [ ("ServiceSetting", option_to_yojson service_setting_to_yojson x.service_setting) ]

let get_service_setting_request_to_yojson (x : get_service_setting_request) =
  assoc_to_yojson [ ("SettingId", Some (service_setting_id_to_yojson x.setting_id)) ]

let get_resource_policies_response_entry_to_yojson (x : get_resource_policies_response_entry) =
  assoc_to_yojson
    [
      ("PolicyId", option_to_yojson policy_id_to_yojson x.policy_id);
      ("PolicyHash", option_to_yojson policy_hash_to_yojson x.policy_hash);
      ("Policy", option_to_yojson policy_to_yojson x.policy);
    ]

let get_resource_policies_response_entries_to_yojson tree =
  list_to_yojson get_resource_policies_response_entry_to_yojson tree

let get_resource_policies_response_to_yojson (x : get_resource_policies_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Policies", option_to_yojson get_resource_policies_response_entries_to_yojson x.policies);
    ]

let resource_policy_max_results_to_yojson = int_to_yojson

let get_resource_policies_request_to_yojson (x : get_resource_policies_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_string_to_yojson x.resource_arn));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson resource_policy_max_results_to_yojson x.max_results);
    ]

let get_patch_baseline_for_patch_group_result_to_yojson
    (x : get_patch_baseline_for_patch_group_result) =
  assoc_to_yojson
    [
      ("BaselineId", option_to_yojson baseline_id_to_yojson x.baseline_id);
      ("PatchGroup", option_to_yojson patch_group_to_yojson x.patch_group);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
    ]

let get_patch_baseline_for_patch_group_request_to_yojson
    (x : get_patch_baseline_for_patch_group_request) =
  assoc_to_yojson
    [
      ("PatchGroup", Some (patch_group_to_yojson x.patch_group));
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
    ]

let patch_group_list_to_yojson tree = list_to_yojson patch_group_to_yojson tree

let get_patch_baseline_result_to_yojson (x : get_patch_baseline_result) =
  assoc_to_yojson
    [
      ("BaselineId", option_to_yojson baseline_id_to_yojson x.baseline_id);
      ("Name", option_to_yojson baseline_name_to_yojson x.name);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("GlobalFilters", option_to_yojson patch_filter_group_to_yojson x.global_filters);
      ("ApprovalRules", option_to_yojson patch_rule_group_to_yojson x.approval_rules);
      ("ApprovedPatches", option_to_yojson patch_id_list_to_yojson x.approved_patches);
      ( "ApprovedPatchesComplianceLevel",
        option_to_yojson patch_compliance_level_to_yojson x.approved_patches_compliance_level );
      ( "ApprovedPatchesEnableNonSecurity",
        option_to_yojson boolean__to_yojson x.approved_patches_enable_non_security );
      ("RejectedPatches", option_to_yojson patch_id_list_to_yojson x.rejected_patches);
      ("RejectedPatchesAction", option_to_yojson patch_action_to_yojson x.rejected_patches_action);
      ("PatchGroups", option_to_yojson patch_group_list_to_yojson x.patch_groups);
      ("CreatedDate", option_to_yojson date_time_to_yojson x.created_date);
      ("ModifiedDate", option_to_yojson date_time_to_yojson x.modified_date);
      ("Description", option_to_yojson baseline_description_to_yojson x.description);
      ("Sources", option_to_yojson patch_source_list_to_yojson x.sources);
      ( "AvailableSecurityUpdatesComplianceStatus",
        option_to_yojson patch_compliance_status_to_yojson
          x.available_security_updates_compliance_status );
    ]

let get_patch_baseline_request_to_yojson (x : get_patch_baseline_request) =
  assoc_to_yojson [ ("BaselineId", Some (baseline_id_to_yojson x.baseline_id)) ]

let invalid_filter_value_to_yojson (x : invalid_filter_value) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_filter_option_to_yojson (x : invalid_filter_option) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let ps_parameter_selector_to_yojson = string_to_yojson

let parameter_to_yojson (x : parameter) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson ps_parameter_name_to_yojson x.name);
      ("Type", option_to_yojson parameter_type_to_yojson x.type_);
      ("Value", option_to_yojson ps_parameter_value_to_yojson x.value);
      ("Version", option_to_yojson ps_parameter_version_to_yojson x.version);
      ("Selector", option_to_yojson ps_parameter_selector_to_yojson x.selector);
      ("SourceResult", option_to_yojson string__to_yojson x.source_result);
      ("LastModifiedDate", option_to_yojson date_time_to_yojson x.last_modified_date);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("DataType", option_to_yojson parameter_data_type_to_yojson x.data_type);
    ]

let parameter_list_to_yojson tree = list_to_yojson parameter_to_yojson tree

let get_parameters_by_path_result_to_yojson (x : get_parameters_by_path_result) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson parameter_list_to_yojson x.parameters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_parameters_by_path_max_results_to_yojson = int_to_yojson
let parameter_string_filter_value_to_yojson = string_to_yojson

let parameter_string_filter_value_list_to_yojson tree =
  list_to_yojson parameter_string_filter_value_to_yojson tree

let parameter_string_query_option_to_yojson = string_to_yojson
let parameter_string_filter_key_to_yojson = string_to_yojson

let parameter_string_filter_to_yojson (x : parameter_string_filter) =
  assoc_to_yojson
    [
      ("Key", Some (parameter_string_filter_key_to_yojson x.key));
      ("Option", option_to_yojson parameter_string_query_option_to_yojson x.option_);
      ("Values", option_to_yojson parameter_string_filter_value_list_to_yojson x.values);
    ]

let parameter_string_filter_list_to_yojson tree =
  list_to_yojson parameter_string_filter_to_yojson tree

let get_parameters_by_path_request_to_yojson (x : get_parameters_by_path_request) =
  assoc_to_yojson
    [
      ("Path", Some (ps_parameter_name_to_yojson x.path));
      ("Recursive", option_to_yojson boolean__to_yojson x.recursive);
      ( "ParameterFilters",
        option_to_yojson parameter_string_filter_list_to_yojson x.parameter_filters );
      ("WithDecryption", option_to_yojson boolean__to_yojson x.with_decryption);
      ("MaxResults", option_to_yojson get_parameters_by_path_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let parameter_name_list_to_yojson tree = list_to_yojson ps_parameter_name_to_yojson tree

let get_parameters_result_to_yojson (x : get_parameters_result) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson parameter_list_to_yojson x.parameters);
      ("InvalidParameters", option_to_yojson parameter_name_list_to_yojson x.invalid_parameters);
    ]

let get_parameters_request_to_yojson (x : get_parameters_request) =
  assoc_to_yojson
    [
      ("Names", Some (parameter_name_list_to_yojson x.names));
      ("WithDecryption", option_to_yojson boolean__to_yojson x.with_decryption);
    ]

let parameter_inline_policy_to_yojson (x : parameter_inline_policy) =
  assoc_to_yojson
    [
      ("PolicyText", option_to_yojson string__to_yojson x.policy_text);
      ("PolicyType", option_to_yojson string__to_yojson x.policy_type);
      ("PolicyStatus", option_to_yojson string__to_yojson x.policy_status);
    ]

let parameter_policy_list_to_yojson tree = list_to_yojson parameter_inline_policy_to_yojson tree

let parameter_history_to_yojson (x : parameter_history) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson ps_parameter_name_to_yojson x.name);
      ("Type", option_to_yojson parameter_type_to_yojson x.type_);
      ("KeyId", option_to_yojson parameter_key_id_to_yojson x.key_id);
      ("LastModifiedDate", option_to_yojson date_time_to_yojson x.last_modified_date);
      ("LastModifiedUser", option_to_yojson string__to_yojson x.last_modified_user);
      ("Description", option_to_yojson parameter_description_to_yojson x.description);
      ("Value", option_to_yojson ps_parameter_value_to_yojson x.value);
      ("AllowedPattern", option_to_yojson allowed_pattern_to_yojson x.allowed_pattern);
      ("Version", option_to_yojson ps_parameter_version_to_yojson x.version);
      ("Labels", option_to_yojson parameter_label_list_to_yojson x.labels);
      ("Tier", option_to_yojson parameter_tier_to_yojson x.tier);
      ("Policies", option_to_yojson parameter_policy_list_to_yojson x.policies);
      ("DataType", option_to_yojson parameter_data_type_to_yojson x.data_type);
    ]

let parameter_history_list_to_yojson tree = list_to_yojson parameter_history_to_yojson tree

let get_parameter_history_result_to_yojson (x : get_parameter_history_result) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson parameter_history_list_to_yojson x.parameters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_parameter_history_request_to_yojson (x : get_parameter_history_request) =
  assoc_to_yojson
    [
      ("Name", Some (ps_parameter_name_to_yojson x.name));
      ("WithDecryption", option_to_yojson boolean__to_yojson x.with_decryption);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_parameter_result_to_yojson (x : get_parameter_result) =
  assoc_to_yojson [ ("Parameter", option_to_yojson parameter_to_yojson x.parameter) ]

let get_parameter_request_to_yojson (x : get_parameter_request) =
  assoc_to_yojson
    [
      ("Name", Some (ps_parameter_name_to_yojson x.name));
      ("WithDecryption", option_to_yojson boolean__to_yojson x.with_decryption);
    ]

let ops_entity_item_entry_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let ops_entity_item_entry_list_to_yojson tree = list_to_yojson ops_entity_item_entry_to_yojson tree
let ops_entity_item_capture_time_to_yojson = string_to_yojson

let ops_entity_item_to_yojson (x : ops_entity_item) =
  assoc_to_yojson
    [
      ("CaptureTime", option_to_yojson ops_entity_item_capture_time_to_yojson x.capture_time);
      ("Content", option_to_yojson ops_entity_item_entry_list_to_yojson x.content);
    ]

let ops_entity_item_key_to_yojson = string_to_yojson

let ops_entity_item_map_to_yojson tree =
  map_to_yojson ops_entity_item_key_to_yojson ops_entity_item_to_yojson tree

let ops_entity_id_to_yojson = string_to_yojson

let ops_entity_to_yojson (x : ops_entity) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson ops_entity_id_to_yojson x.id);
      ("Data", option_to_yojson ops_entity_item_map_to_yojson x.data);
    ]

let ops_entity_list_to_yojson tree = list_to_yojson ops_entity_to_yojson tree

let get_ops_summary_result_to_yojson (x : get_ops_summary_result) =
  assoc_to_yojson
    [
      ("Entities", option_to_yojson ops_entity_list_to_yojson x.entities);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let ops_data_type_name_to_yojson = string_to_yojson

let ops_result_attribute_to_yojson (x : ops_result_attribute) =
  assoc_to_yojson [ ("TypeName", Some (ops_data_type_name_to_yojson x.type_name)) ]

let ops_result_attribute_list_to_yojson tree = list_to_yojson ops_result_attribute_to_yojson tree

let ops_filter_operator_type_to_yojson (x : ops_filter_operator_type) =
  match x with
  | EQUAL -> `String "Equal"
  | NOT_EQUAL -> `String "NotEqual"
  | BEGIN_WITH -> `String "BeginWith"
  | LESS_THAN -> `String "LessThan"
  | GREATER_THAN -> `String "GreaterThan"
  | EXISTS -> `String "Exists"

let ops_filter_value_to_yojson = string_to_yojson
let ops_filter_value_list_to_yojson tree = list_to_yojson ops_filter_value_to_yojson tree
let ops_filter_key_to_yojson = string_to_yojson

let ops_filter_to_yojson (x : ops_filter) =
  assoc_to_yojson
    [
      ("Key", Some (ops_filter_key_to_yojson x.key));
      ("Values", Some (ops_filter_value_list_to_yojson x.values));
      ("Type", option_to_yojson ops_filter_operator_type_to_yojson x.type_);
    ]

let ops_filter_list_to_yojson tree = list_to_yojson ops_filter_to_yojson tree
let ops_aggregator_value_to_yojson = string_to_yojson
let ops_aggregator_value_key_to_yojson = string_to_yojson

let ops_aggregator_value_map_to_yojson tree =
  map_to_yojson ops_aggregator_value_key_to_yojson ops_aggregator_value_to_yojson tree

let ops_data_attribute_name_to_yojson = string_to_yojson
let ops_aggregator_type_to_yojson = string_to_yojson

let rec ops_aggregator_list_to_yojson tree = list_to_yojson ops_aggregator_to_yojson tree

and ops_aggregator_to_yojson (x : ops_aggregator) =
  assoc_to_yojson
    [
      ("AggregatorType", option_to_yojson ops_aggregator_type_to_yojson x.aggregator_type);
      ("TypeName", option_to_yojson ops_data_type_name_to_yojson x.type_name);
      ("AttributeName", option_to_yojson ops_data_attribute_name_to_yojson x.attribute_name);
      ("Values", option_to_yojson ops_aggregator_value_map_to_yojson x.values);
      ("Filters", option_to_yojson ops_filter_list_to_yojson x.filters);
      ("Aggregators", option_to_yojson ops_aggregator_list_to_yojson x.aggregators);
    ]

let get_ops_summary_request_to_yojson (x : get_ops_summary_request) =
  assoc_to_yojson
    [
      ("SyncName", option_to_yojson resource_data_sync_name_to_yojson x.sync_name);
      ("Filters", option_to_yojson ops_filter_list_to_yojson x.filters);
      ("Aggregators", option_to_yojson ops_aggregator_list_to_yojson x.aggregators);
      ("ResultAttributes", option_to_yojson ops_result_attribute_list_to_yojson x.result_attributes);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let get_ops_metadata_result_to_yojson (x : get_ops_metadata_result) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson ops_metadata_resource_id_to_yojson x.resource_id);
      ("Metadata", option_to_yojson metadata_map_to_yojson x.metadata);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_ops_metadata_max_results_to_yojson = int_to_yojson

let get_ops_metadata_request_to_yojson (x : get_ops_metadata_request) =
  assoc_to_yojson
    [
      ("OpsMetadataArn", Some (ops_metadata_arn_to_yojson x.ops_metadata_arn));
      ("MaxResults", option_to_yojson get_ops_metadata_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let ops_item_source_to_yojson = string_to_yojson
let ops_item_type_to_yojson = string_to_yojson

let ops_item_to_yojson (x : ops_item) =
  assoc_to_yojson
    [
      ("CreatedBy", option_to_yojson string__to_yojson x.created_by);
      ("OpsItemType", option_to_yojson ops_item_type_to_yojson x.ops_item_type);
      ("CreatedTime", option_to_yojson date_time_to_yojson x.created_time);
      ("Description", option_to_yojson ops_item_description_to_yojson x.description);
      ("LastModifiedBy", option_to_yojson string__to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
      ("Notifications", option_to_yojson ops_item_notifications_to_yojson x.notifications);
      ("Priority", option_to_yojson ops_item_priority_to_yojson x.priority);
      ("RelatedOpsItems", option_to_yojson related_ops_items_to_yojson x.related_ops_items);
      ("Status", option_to_yojson ops_item_status_to_yojson x.status);
      ("OpsItemId", option_to_yojson ops_item_id_to_yojson x.ops_item_id);
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Title", option_to_yojson ops_item_title_to_yojson x.title);
      ("Source", option_to_yojson ops_item_source_to_yojson x.source);
      ("OperationalData", option_to_yojson ops_item_operational_data_to_yojson x.operational_data);
      ("Category", option_to_yojson ops_item_category_to_yojson x.category);
      ("Severity", option_to_yojson ops_item_severity_to_yojson x.severity);
      ("ActualStartTime", option_to_yojson date_time_to_yojson x.actual_start_time);
      ("ActualEndTime", option_to_yojson date_time_to_yojson x.actual_end_time);
      ("PlannedStartTime", option_to_yojson date_time_to_yojson x.planned_start_time);
      ("PlannedEndTime", option_to_yojson date_time_to_yojson x.planned_end_time);
      ("OpsItemArn", option_to_yojson ops_item_arn_to_yojson x.ops_item_arn);
    ]

let get_ops_item_response_to_yojson (x : get_ops_item_response) =
  assoc_to_yojson [ ("OpsItem", option_to_yojson ops_item_to_yojson x.ops_item) ]

let get_ops_item_request_to_yojson (x : get_ops_item_request) =
  assoc_to_yojson
    [
      ("OpsItemId", Some (ops_item_id_to_yojson x.ops_item_id));
      ("OpsItemArn", option_to_yojson ops_item_arn_to_yojson x.ops_item_arn);
    ]

let get_maintenance_window_task_result_to_yojson (x : get_maintenance_window_task_result) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("WindowTaskId", option_to_yojson maintenance_window_task_id_to_yojson x.window_task_id);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("TaskArn", option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn);
      ("ServiceRoleArn", option_to_yojson service_role_to_yojson x.service_role_arn);
      ("TaskType", option_to_yojson maintenance_window_task_type_to_yojson x.task_type);
      ( "TaskParameters",
        option_to_yojson maintenance_window_task_parameters_to_yojson x.task_parameters );
      ( "TaskInvocationParameters",
        option_to_yojson maintenance_window_task_invocation_parameters_to_yojson
          x.task_invocation_parameters );
      ("Priority", option_to_yojson maintenance_window_task_priority_to_yojson x.priority);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("LoggingInfo", option_to_yojson logging_info_to_yojson x.logging_info);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ( "CutoffBehavior",
        option_to_yojson maintenance_window_task_cutoff_behavior_to_yojson x.cutoff_behavior );
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
    ]

let get_maintenance_window_task_request_to_yojson (x : get_maintenance_window_task_request) =
  assoc_to_yojson
    [
      ("WindowId", Some (maintenance_window_id_to_yojson x.window_id));
      ("WindowTaskId", Some (maintenance_window_task_id_to_yojson x.window_task_id));
    ]

let maintenance_window_task_target_id_to_yojson = string_to_yojson
let maintenance_window_execution_status_details_to_yojson = string_to_yojson

let maintenance_window_execution_status_to_yojson (x : maintenance_window_execution_status) =
  match x with
  | Pending -> `String "PENDING"
  | InProgress -> `String "IN_PROGRESS"
  | Success -> `String "SUCCESS"
  | Failed -> `String "FAILED"
  | TimedOut -> `String "TIMED_OUT"
  | Cancelling -> `String "CANCELLING"
  | Cancelled -> `String "CANCELLED"
  | SkippedOverlapping -> `String "SKIPPED_OVERLAPPING"

let maintenance_window_execution_task_invocation_parameters_to_yojson = string_to_yojson
let maintenance_window_execution_task_execution_id_to_yojson = string_to_yojson
let maintenance_window_execution_task_invocation_id_to_yojson = string_to_yojson
let maintenance_window_execution_task_id_to_yojson = string_to_yojson
let maintenance_window_execution_id_to_yojson = string_to_yojson

let get_maintenance_window_execution_task_invocation_result_to_yojson
    (x : get_maintenance_window_execution_task_invocation_result) =
  assoc_to_yojson
    [
      ( "WindowExecutionId",
        option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id );
      ( "TaskExecutionId",
        option_to_yojson maintenance_window_execution_task_id_to_yojson x.task_execution_id );
      ( "InvocationId",
        option_to_yojson maintenance_window_execution_task_invocation_id_to_yojson x.invocation_id
      );
      ( "ExecutionId",
        option_to_yojson maintenance_window_execution_task_execution_id_to_yojson x.execution_id );
      ("TaskType", option_to_yojson maintenance_window_task_type_to_yojson x.task_type);
      ( "Parameters",
        option_to_yojson maintenance_window_execution_task_invocation_parameters_to_yojson
          x.parameters );
      ("Status", option_to_yojson maintenance_window_execution_status_to_yojson x.status);
      ( "StatusDetails",
        option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details );
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("OwnerInformation", option_to_yojson owner_information_to_yojson x.owner_information);
      ( "WindowTargetId",
        option_to_yojson maintenance_window_task_target_id_to_yojson x.window_target_id );
    ]

let get_maintenance_window_execution_task_invocation_request_to_yojson
    (x : get_maintenance_window_execution_task_invocation_request) =
  assoc_to_yojson
    [
      ("WindowExecutionId", Some (maintenance_window_execution_id_to_yojson x.window_execution_id));
      ("TaskId", Some (maintenance_window_execution_task_id_to_yojson x.task_id));
      ( "InvocationId",
        Some (maintenance_window_execution_task_invocation_id_to_yojson x.invocation_id) );
    ]

let maintenance_window_task_parameters_list_to_yojson tree =
  list_to_yojson maintenance_window_task_parameters_to_yojson tree

let get_maintenance_window_execution_task_result_to_yojson
    (x : get_maintenance_window_execution_task_result) =
  assoc_to_yojson
    [
      ( "WindowExecutionId",
        option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id );
      ( "TaskExecutionId",
        option_to_yojson maintenance_window_execution_task_id_to_yojson x.task_execution_id );
      ("TaskArn", option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn);
      ("ServiceRole", option_to_yojson service_role_to_yojson x.service_role);
      ("Type", option_to_yojson maintenance_window_task_type_to_yojson x.type_);
      ( "TaskParameters",
        option_to_yojson maintenance_window_task_parameters_list_to_yojson x.task_parameters );
      ("Priority", option_to_yojson maintenance_window_task_priority_to_yojson x.priority);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("Status", option_to_yojson maintenance_window_execution_status_to_yojson x.status);
      ( "StatusDetails",
        option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details );
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ("TriggeredAlarms", option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms);
    ]

let get_maintenance_window_execution_task_request_to_yojson
    (x : get_maintenance_window_execution_task_request) =
  assoc_to_yojson
    [
      ("WindowExecutionId", Some (maintenance_window_execution_id_to_yojson x.window_execution_id));
      ("TaskId", Some (maintenance_window_execution_task_id_to_yojson x.task_id));
    ]

let maintenance_window_execution_task_id_list_to_yojson tree =
  list_to_yojson maintenance_window_execution_task_id_to_yojson tree

let get_maintenance_window_execution_result_to_yojson (x : get_maintenance_window_execution_result)
    =
  assoc_to_yojson
    [
      ( "WindowExecutionId",
        option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id );
      ("TaskIds", option_to_yojson maintenance_window_execution_task_id_list_to_yojson x.task_ids);
      ("Status", option_to_yojson maintenance_window_execution_status_to_yojson x.status);
      ( "StatusDetails",
        option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details );
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
    ]

let get_maintenance_window_execution_request_to_yojson
    (x : get_maintenance_window_execution_request) =
  assoc_to_yojson
    [
      ("WindowExecutionId", Some (maintenance_window_execution_id_to_yojson x.window_execution_id));
    ]

let get_maintenance_window_result_to_yojson (x : get_maintenance_window_result) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ("StartDate", option_to_yojson maintenance_window_string_date_time_to_yojson x.start_date);
      ("EndDate", option_to_yojson maintenance_window_string_date_time_to_yojson x.end_date);
      ("Schedule", option_to_yojson maintenance_window_schedule_to_yojson x.schedule);
      ( "ScheduleTimezone",
        option_to_yojson maintenance_window_timezone_to_yojson x.schedule_timezone );
      ("ScheduleOffset", option_to_yojson maintenance_window_offset_to_yojson x.schedule_offset);
      ( "NextExecutionTime",
        option_to_yojson maintenance_window_string_date_time_to_yojson x.next_execution_time );
      ("Duration", option_to_yojson maintenance_window_duration_hours_to_yojson x.duration);
      ("Cutoff", option_to_yojson maintenance_window_cutoff_to_yojson x.cutoff);
      ( "AllowUnassociatedTargets",
        option_to_yojson maintenance_window_allow_unassociated_targets_to_yojson
          x.allow_unassociated_targets );
      ("Enabled", option_to_yojson maintenance_window_enabled_to_yojson x.enabled);
      ("CreatedDate", option_to_yojson date_time_to_yojson x.created_date);
      ("ModifiedDate", option_to_yojson date_time_to_yojson x.modified_date);
    ]

let get_maintenance_window_request_to_yojson (x : get_maintenance_window_request) =
  assoc_to_yojson [ ("WindowId", Some (maintenance_window_id_to_yojson x.window_id)) ]

let inventory_type_display_name_to_yojson = string_to_yojson

let inventory_attribute_data_type_to_yojson (x : inventory_attribute_data_type) =
  match x with STRING -> `String "string" | NUMBER -> `String "number"

let inventory_item_attribute_name_to_yojson = string_to_yojson

let inventory_item_attribute_to_yojson (x : inventory_item_attribute) =
  assoc_to_yojson
    [
      ("Name", Some (inventory_item_attribute_name_to_yojson x.name));
      ("DataType", Some (inventory_attribute_data_type_to_yojson x.data_type));
    ]

let inventory_item_attribute_list_to_yojson tree =
  list_to_yojson inventory_item_attribute_to_yojson tree

let inventory_item_schema_to_yojson (x : inventory_item_schema) =
  assoc_to_yojson
    [
      ("TypeName", Some (inventory_item_type_name_to_yojson x.type_name));
      ("Version", option_to_yojson inventory_item_schema_version_to_yojson x.version);
      ("Attributes", Some (inventory_item_attribute_list_to_yojson x.attributes));
      ("DisplayName", option_to_yojson inventory_type_display_name_to_yojson x.display_name);
    ]

let inventory_item_schema_result_list_to_yojson tree =
  list_to_yojson inventory_item_schema_to_yojson tree

let get_inventory_schema_result_to_yojson (x : get_inventory_schema_result) =
  assoc_to_yojson
    [
      ("Schemas", option_to_yojson inventory_item_schema_result_list_to_yojson x.schemas);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let is_sub_type_schema_to_yojson = bool_to_yojson
let get_inventory_schema_max_results_to_yojson = int_to_yojson
let inventory_item_type_name_filter_to_yojson = string_to_yojson

let get_inventory_schema_request_to_yojson (x : get_inventory_schema_request) =
  assoc_to_yojson
    [
      ("TypeName", option_to_yojson inventory_item_type_name_filter_to_yojson x.type_name);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson get_inventory_schema_max_results_to_yojson x.max_results);
      ("Aggregator", option_to_yojson aggregator_schema_only_to_yojson x.aggregator);
      ("SubType", option_to_yojson is_sub_type_schema_to_yojson x.sub_type);
    ]

let invalid_result_attribute_exception_to_yojson (x : invalid_result_attribute_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_inventory_group_exception_to_yojson (x : invalid_inventory_group_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let inventory_result_item_to_yojson (x : inventory_result_item) =
  assoc_to_yojson
    [
      ("TypeName", Some (inventory_item_type_name_to_yojson x.type_name));
      ("SchemaVersion", Some (inventory_item_schema_version_to_yojson x.schema_version));
      ("CaptureTime", option_to_yojson inventory_item_capture_time_to_yojson x.capture_time);
      ("ContentHash", option_to_yojson inventory_item_content_hash_to_yojson x.content_hash);
      ("Content", Some (inventory_item_entry_list_to_yojson x.content));
    ]

let inventory_result_item_key_to_yojson = string_to_yojson

let inventory_result_item_map_to_yojson tree =
  map_to_yojson inventory_result_item_key_to_yojson inventory_result_item_to_yojson tree

let inventory_result_entity_id_to_yojson = string_to_yojson

let inventory_result_entity_to_yojson (x : inventory_result_entity) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson inventory_result_entity_id_to_yojson x.id);
      ("Data", option_to_yojson inventory_result_item_map_to_yojson x.data);
    ]

let inventory_result_entity_list_to_yojson tree =
  list_to_yojson inventory_result_entity_to_yojson tree

let get_inventory_result_to_yojson (x : get_inventory_result) =
  assoc_to_yojson
    [
      ("Entities", option_to_yojson inventory_result_entity_list_to_yojson x.entities);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let result_attribute_to_yojson (x : result_attribute) =
  assoc_to_yojson [ ("TypeName", Some (inventory_item_type_name_to_yojson x.type_name)) ]

let result_attribute_list_to_yojson tree = list_to_yojson result_attribute_to_yojson tree
let inventory_group_name_to_yojson = string_to_yojson

let inventory_group_to_yojson (x : inventory_group) =
  assoc_to_yojson
    [
      ("Name", Some (inventory_group_name_to_yojson x.name));
      ("Filters", Some (inventory_filter_list_to_yojson x.filters));
    ]

let inventory_group_list_to_yojson tree = list_to_yojson inventory_group_to_yojson tree
let inventory_aggregator_expression_to_yojson = string_to_yojson

let rec inventory_aggregator_list_to_yojson tree =
  list_to_yojson inventory_aggregator_to_yojson tree

and inventory_aggregator_to_yojson (x : inventory_aggregator) =
  assoc_to_yojson
    [
      ("Expression", option_to_yojson inventory_aggregator_expression_to_yojson x.expression);
      ("Aggregators", option_to_yojson inventory_aggregator_list_to_yojson x.aggregators);
      ("Groups", option_to_yojson inventory_group_list_to_yojson x.groups);
    ]

let get_inventory_request_to_yojson (x : get_inventory_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson inventory_filter_list_to_yojson x.filters);
      ("Aggregators", option_to_yojson inventory_aggregator_list_to_yojson x.aggregators);
      ("ResultAttributes", option_to_yojson result_attribute_list_to_yojson x.result_attributes);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let target_preview_to_yojson (x : target_preview) =
  assoc_to_yojson
    [
      ("Count", option_to_yojson integer_to_yojson x.count);
      ("TargetType", option_to_yojson string__to_yojson x.target_type);
    ]

let target_preview_list_to_yojson tree = list_to_yojson target_preview_to_yojson tree
let region_list_to_yojson tree = list_to_yojson region_to_yojson tree

let impact_type_to_yojson (x : impact_type) =
  match x with
  | MUTATING -> `String "Mutating"
  | NON_MUTATING -> `String "NonMutating"
  | UNDETERMINED -> `String "Undetermined"

let step_preview_map_to_yojson tree = map_to_yojson impact_type_to_yojson integer_to_yojson tree

let automation_execution_preview_to_yojson (x : automation_execution_preview) =
  assoc_to_yojson
    [
      ("StepPreviews", option_to_yojson step_preview_map_to_yojson x.step_previews);
      ("Regions", option_to_yojson region_list_to_yojson x.regions);
      ("TargetPreviews", option_to_yojson target_preview_list_to_yojson x.target_previews);
      ("TotalAccounts", option_to_yojson integer_to_yojson x.total_accounts);
    ]

let execution_preview_to_yojson (x : execution_preview) =
  match x with
  | Automation arg ->
      assoc_to_yojson [ ("Automation", Some (automation_execution_preview_to_yojson arg)) ]

let execution_preview_status_to_yojson (x : execution_preview_status) =
  match x with
  | PENDING -> `String "Pending"
  | IN_PROGRESS -> `String "InProgress"
  | SUCCESS -> `String "Success"
  | FAILED -> `String "Failed"

let get_execution_preview_response_to_yojson (x : get_execution_preview_response) =
  assoc_to_yojson
    [
      ("ExecutionPreviewId", option_to_yojson execution_preview_id_to_yojson x.execution_preview_id);
      ("EndedAt", option_to_yojson date_time_to_yojson x.ended_at);
      ("Status", option_to_yojson execution_preview_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("ExecutionPreview", option_to_yojson execution_preview_to_yojson x.execution_preview);
    ]

let get_execution_preview_request_to_yojson (x : get_execution_preview_request) =
  assoc_to_yojson
    [ ("ExecutionPreviewId", Some (execution_preview_id_to_yojson x.execution_preview_id)) ]

let attachment_url_to_yojson = string_to_yojson

let attachment_hash_type_to_yojson (x : attachment_hash_type) =
  match x with SHA256 -> `String "Sha256"

let attachment_hash_to_yojson = string_to_yojson
let content_length_to_yojson = long_to_yojson

let attachment_content_to_yojson (x : attachment_content) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson attachment_name_to_yojson x.name);
      ("Size", option_to_yojson content_length_to_yojson x.size);
      ("Hash", option_to_yojson attachment_hash_to_yojson x.hash);
      ("HashType", option_to_yojson attachment_hash_type_to_yojson x.hash_type);
      ("Url", option_to_yojson attachment_url_to_yojson x.url);
    ]

let attachment_content_list_to_yojson tree = list_to_yojson attachment_content_to_yojson tree

let get_document_result_to_yojson (x : get_document_result) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson document_ar_n_to_yojson x.name);
      ("CreatedDate", option_to_yojson date_time_to_yojson x.created_date);
      ("DisplayName", option_to_yojson document_display_name_to_yojson x.display_name);
      ("VersionName", option_to_yojson document_version_name_to_yojson x.version_name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Status", option_to_yojson document_status_to_yojson x.status);
      ( "StatusInformation",
        option_to_yojson document_status_information_to_yojson x.status_information );
      ("Content", option_to_yojson document_content_to_yojson x.content);
      ("DocumentType", option_to_yojson document_type_to_yojson x.document_type);
      ("DocumentFormat", option_to_yojson document_format_to_yojson x.document_format);
      ("Requires", option_to_yojson document_requires_list_to_yojson x.requires);
      ( "AttachmentsContent",
        option_to_yojson attachment_content_list_to_yojson x.attachments_content );
      ("ReviewStatus", option_to_yojson review_status_to_yojson x.review_status);
    ]

let get_document_request_to_yojson (x : get_document_request) =
  assoc_to_yojson
    [
      ("Name", Some (document_ar_n_to_yojson x.name));
      ("VersionName", option_to_yojson document_version_name_to_yojson x.version_name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("DocumentFormat", option_to_yojson document_format_to_yojson x.document_format);
    ]

let unsupported_operating_system_to_yojson (x : unsupported_operating_system) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let unsupported_feature_required_exception_to_yojson (x : unsupported_feature_required_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let product_to_yojson = string_to_yojson
let snapshot_download_url_to_yojson = string_to_yojson
let snapshot_id_to_yojson = string_to_yojson

let get_deployable_patch_snapshot_for_instance_result_to_yojson
    (x : get_deployable_patch_snapshot_for_instance_result) =
  assoc_to_yojson
    [
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ( "SnapshotDownloadUrl",
        option_to_yojson snapshot_download_url_to_yojson x.snapshot_download_url );
      ("Product", option_to_yojson product_to_yojson x.product);
    ]

let baseline_override_to_yojson (x : baseline_override) =
  assoc_to_yojson
    [
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("GlobalFilters", option_to_yojson patch_filter_group_to_yojson x.global_filters);
      ("ApprovalRules", option_to_yojson patch_rule_group_to_yojson x.approval_rules);
      ("ApprovedPatches", option_to_yojson patch_id_list_to_yojson x.approved_patches);
      ( "ApprovedPatchesComplianceLevel",
        option_to_yojson patch_compliance_level_to_yojson x.approved_patches_compliance_level );
      ("RejectedPatches", option_to_yojson patch_id_list_to_yojson x.rejected_patches);
      ("RejectedPatchesAction", option_to_yojson patch_action_to_yojson x.rejected_patches_action);
      ( "ApprovedPatchesEnableNonSecurity",
        option_to_yojson boolean__to_yojson x.approved_patches_enable_non_security );
      ("Sources", option_to_yojson patch_source_list_to_yojson x.sources);
      ( "AvailableSecurityUpdatesComplianceStatus",
        option_to_yojson patch_compliance_status_to_yojson
          x.available_security_updates_compliance_status );
    ]

let get_deployable_patch_snapshot_for_instance_request_to_yojson
    (x : get_deployable_patch_snapshot_for_instance_request) =
  assoc_to_yojson
    [
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ("SnapshotId", Some (snapshot_id_to_yojson x.snapshot_id));
      ("BaselineOverride", option_to_yojson baseline_override_to_yojson x.baseline_override);
      ("UseS3DualStackEndpoint", option_to_yojson boolean__to_yojson x.use_s3_dual_stack_endpoint);
    ]

let get_default_patch_baseline_result_to_yojson (x : get_default_patch_baseline_result) =
  assoc_to_yojson
    [
      ("BaselineId", option_to_yojson baseline_id_to_yojson x.baseline_id);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
    ]

let get_default_patch_baseline_request_to_yojson (x : get_default_patch_baseline_request) =
  assoc_to_yojson
    [ ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system) ]

let connection_status_to_yojson (x : connection_status) =
  match x with CONNECTED -> `String "connected" | NOT_CONNECTED -> `String "notconnected"

let get_connection_status_response_to_yojson (x : get_connection_status_response) =
  assoc_to_yojson
    [
      ("Target", option_to_yojson session_target_to_yojson x.target);
      ("Status", option_to_yojson connection_status_to_yojson x.status);
    ]

let get_connection_status_request_to_yojson (x : get_connection_status_request) =
  assoc_to_yojson [ ("Target", Some (session_target_to_yojson x.target)) ]

let invocation_does_not_exist_to_yojson = unit_to_yojson
let invalid_plugin_name_to_yojson = unit_to_yojson
let standard_error_content_to_yojson = string_to_yojson
let standard_output_content_to_yojson = string_to_yojson
let string_date_time_to_yojson = string_to_yojson

let get_command_invocation_result_to_yojson (x : get_command_invocation_result) =
  assoc_to_yojson
    [
      ("CommandId", option_to_yojson command_id_to_yojson x.command_id);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("Comment", option_to_yojson comment_to_yojson x.comment);
      ("DocumentName", option_to_yojson document_name_to_yojson x.document_name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("PluginName", option_to_yojson command_plugin_name_to_yojson x.plugin_name);
      ("ResponseCode", option_to_yojson response_code_to_yojson x.response_code);
      ( "ExecutionStartDateTime",
        option_to_yojson string_date_time_to_yojson x.execution_start_date_time );
      ("ExecutionElapsedTime", option_to_yojson string_date_time_to_yojson x.execution_elapsed_time);
      ("ExecutionEndDateTime", option_to_yojson string_date_time_to_yojson x.execution_end_date_time);
      ("Status", option_to_yojson command_invocation_status_to_yojson x.status);
      ("StatusDetails", option_to_yojson status_details_to_yojson x.status_details);
      ( "StandardOutputContent",
        option_to_yojson standard_output_content_to_yojson x.standard_output_content );
      ("StandardOutputUrl", option_to_yojson url_to_yojson x.standard_output_url);
      ( "StandardErrorContent",
        option_to_yojson standard_error_content_to_yojson x.standard_error_content );
      ("StandardErrorUrl", option_to_yojson url_to_yojson x.standard_error_url);
      ( "CloudWatchOutputConfig",
        option_to_yojson cloud_watch_output_config_to_yojson x.cloud_watch_output_config );
    ]

let get_command_invocation_request_to_yojson (x : get_command_invocation_request) =
  assoc_to_yojson
    [
      ("CommandId", Some (command_id_to_yojson x.command_id));
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ("PluginName", option_to_yojson command_plugin_name_to_yojson x.plugin_name);
    ]

let unsupported_calendar_exception_to_yojson (x : unsupported_calendar_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_document_type_to_yojson (x : invalid_document_type) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let iso8601_string_to_yojson = string_to_yojson

let calendar_state_to_yojson (x : calendar_state) =
  match x with OPEN -> `String "OPEN" | CLOSED -> `String "CLOSED"

let get_calendar_state_response_to_yojson (x : get_calendar_state_response) =
  assoc_to_yojson
    [
      ("State", option_to_yojson calendar_state_to_yojson x.state);
      ("AtTime", option_to_yojson iso8601_string_to_yojson x.at_time);
      ("NextTransitionTime", option_to_yojson iso8601_string_to_yojson x.next_transition_time);
    ]

let get_calendar_state_request_to_yojson (x : get_calendar_state_request) =
  assoc_to_yojson
    [
      ("CalendarNames", Some (calendar_name_or_arn_list_to_yojson x.calendar_names));
      ("AtTime", option_to_yojson iso8601_string_to_yojson x.at_time);
    ]

let automation_subtype_to_yojson (x : automation_subtype) =
  match x with ChangeRequest -> `String "ChangeRequest" | AccessRequest -> `String "AccessRequest"

let progress_counters_to_yojson (x : progress_counters) =
  assoc_to_yojson
    [
      ("TotalSteps", option_to_yojson integer_to_yojson x.total_steps);
      ("SuccessSteps", option_to_yojson integer_to_yojson x.success_steps);
      ("FailedSteps", option_to_yojson integer_to_yojson x.failed_steps);
      ("CancelledSteps", option_to_yojson integer_to_yojson x.cancelled_steps);
      ("TimedOutSteps", option_to_yojson integer_to_yojson x.timed_out_steps);
    ]

let target_parameter_list_to_yojson tree = list_to_yojson parameter_value_to_yojson tree

let resolved_targets_to_yojson (x : resolved_targets) =
  assoc_to_yojson
    [
      ("ParameterValues", option_to_yojson target_parameter_list_to_yojson x.parameter_values);
      ("Truncated", option_to_yojson boolean__to_yojson x.truncated);
    ]

let automation_action_name_to_yojson = string_to_yojson

let parent_step_details_to_yojson (x : parent_step_details) =
  assoc_to_yojson
    [
      ("StepExecutionId", option_to_yojson string__to_yojson x.step_execution_id);
      ("StepName", option_to_yojson string__to_yojson x.step_name);
      ("Action", option_to_yojson automation_action_name_to_yojson x.action);
      ("Iteration", option_to_yojson integer_to_yojson x.iteration);
      ("IteratorValue", option_to_yojson string__to_yojson x.iterator_value);
    ]

let valid_next_step_to_yojson = string_to_yojson
let valid_next_step_list_to_yojson tree = list_to_yojson valid_next_step_to_yojson tree

let failure_details_to_yojson (x : failure_details) =
  assoc_to_yojson
    [
      ("FailureStage", option_to_yojson string__to_yojson x.failure_stage);
      ("FailureType", option_to_yojson string__to_yojson x.failure_type);
      ("Details", option_to_yojson automation_parameter_map_to_yojson x.details);
    ]

let normal_string_map_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let automation_execution_status_to_yojson (x : automation_execution_status) =
  match x with
  | PENDING -> `String "Pending"
  | INPROGRESS -> `String "InProgress"
  | WAITING -> `String "Waiting"
  | SUCCESS -> `String "Success"
  | TIMEDOUT -> `String "TimedOut"
  | CANCELLING -> `String "Cancelling"
  | CANCELLED -> `String "Cancelled"
  | FAILED -> `String "Failed"
  | PENDING_APPROVAL -> `String "PendingApproval"
  | APPROVED -> `String "Approved"
  | REJECTED -> `String "Rejected"
  | SCHEDULED -> `String "Scheduled"
  | RUNBOOK_INPROGRESS -> `String "RunbookInProgress"
  | PENDING_CHANGE_CALENDAR_OVERRIDE -> `String "PendingChangeCalendarOverride"
  | CHANGE_CALENDAR_OVERRIDE_APPROVED -> `String "ChangeCalendarOverrideApproved"
  | CHANGE_CALENDAR_OVERRIDE_REJECTED -> `String "ChangeCalendarOverrideRejected"
  | COMPLETED_WITH_SUCCESS -> `String "CompletedWithSuccess"
  | COMPLETED_WITH_FAILURE -> `String "CompletedWithFailure"
  | EXITED -> `String "Exited"

let long_to_yojson = long_to_yojson

let step_execution_to_yojson (x : step_execution) =
  assoc_to_yojson
    [
      ("StepName", option_to_yojson string__to_yojson x.step_name);
      ("Action", option_to_yojson automation_action_name_to_yojson x.action);
      ("TimeoutSeconds", option_to_yojson long_to_yojson x.timeout_seconds);
      ("OnFailure", option_to_yojson string__to_yojson x.on_failure);
      ("MaxAttempts", option_to_yojson integer_to_yojson x.max_attempts);
      ("ExecutionStartTime", option_to_yojson date_time_to_yojson x.execution_start_time);
      ("ExecutionEndTime", option_to_yojson date_time_to_yojson x.execution_end_time);
      ("StepStatus", option_to_yojson automation_execution_status_to_yojson x.step_status);
      ("ResponseCode", option_to_yojson string__to_yojson x.response_code);
      ("Inputs", option_to_yojson normal_string_map_to_yojson x.inputs);
      ("Outputs", option_to_yojson automation_parameter_map_to_yojson x.outputs);
      ("Response", option_to_yojson string__to_yojson x.response);
      ("FailureMessage", option_to_yojson string__to_yojson x.failure_message);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("StepExecutionId", option_to_yojson string__to_yojson x.step_execution_id);
      ( "OverriddenParameters",
        option_to_yojson automation_parameter_map_to_yojson x.overridden_parameters );
      ("IsEnd", option_to_yojson boolean__to_yojson x.is_end);
      ("NextStep", option_to_yojson string__to_yojson x.next_step);
      ("IsCritical", option_to_yojson boolean__to_yojson x.is_critical);
      ("ValidNextSteps", option_to_yojson valid_next_step_list_to_yojson x.valid_next_steps);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("TargetLocation", option_to_yojson target_location_to_yojson x.target_location);
      ("TriggeredAlarms", option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms);
      ("ParentStepDetails", option_to_yojson parent_step_details_to_yojson x.parent_step_details);
    ]

let step_execution_list_to_yojson tree = list_to_yojson step_execution_to_yojson tree

let automation_execution_to_yojson (x : automation_execution) =
  assoc_to_yojson
    [
      ( "AutomationExecutionId",
        option_to_yojson automation_execution_id_to_yojson x.automation_execution_id );
      ("DocumentName", option_to_yojson document_name_to_yojson x.document_name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("ExecutionStartTime", option_to_yojson date_time_to_yojson x.execution_start_time);
      ("ExecutionEndTime", option_to_yojson date_time_to_yojson x.execution_end_time);
      ( "AutomationExecutionStatus",
        option_to_yojson automation_execution_status_to_yojson x.automation_execution_status );
      ("StepExecutions", option_to_yojson step_execution_list_to_yojson x.step_executions);
      ("StepExecutionsTruncated", option_to_yojson boolean__to_yojson x.step_executions_truncated);
      ("Parameters", option_to_yojson automation_parameter_map_to_yojson x.parameters);
      ("Outputs", option_to_yojson automation_parameter_map_to_yojson x.outputs);
      ("FailureMessage", option_to_yojson string__to_yojson x.failure_message);
      ("Mode", option_to_yojson execution_mode_to_yojson x.mode);
      ( "ParentAutomationExecutionId",
        option_to_yojson automation_execution_id_to_yojson x.parent_automation_execution_id );
      ("ExecutedBy", option_to_yojson string__to_yojson x.executed_by);
      ("CurrentStepName", option_to_yojson string__to_yojson x.current_step_name);
      ("CurrentAction", option_to_yojson string__to_yojson x.current_action);
      ( "TargetParameterName",
        option_to_yojson automation_parameter_key_to_yojson x.target_parameter_name );
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("TargetMaps", option_to_yojson target_maps_to_yojson x.target_maps);
      ("ResolvedTargets", option_to_yojson resolved_targets_to_yojson x.resolved_targets);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("Target", option_to_yojson string__to_yojson x.target);
      ("TargetLocations", option_to_yojson target_locations_to_yojson x.target_locations);
      ("ProgressCounters", option_to_yojson progress_counters_to_yojson x.progress_counters);
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ("TriggeredAlarms", option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms);
      ( "TargetLocationsURL",
        option_to_yojson target_locations_ur_l_to_yojson x.target_locations_ur_l );
      ("AutomationSubtype", option_to_yojson automation_subtype_to_yojson x.automation_subtype);
      ("ScheduledTime", option_to_yojson date_time_to_yojson x.scheduled_time);
      ("Runbooks", option_to_yojson runbooks_to_yojson x.runbooks);
      ("OpsItemId", option_to_yojson string__to_yojson x.ops_item_id);
      ("AssociationId", option_to_yojson string__to_yojson x.association_id);
      ("ChangeRequestName", option_to_yojson change_request_name_to_yojson x.change_request_name);
      ("Variables", option_to_yojson automation_parameter_map_to_yojson x.variables);
    ]

let get_automation_execution_result_to_yojson (x : get_automation_execution_result) =
  assoc_to_yojson
    [
      ("AutomationExecution", option_to_yojson automation_execution_to_yojson x.automation_execution);
    ]

let get_automation_execution_request_to_yojson (x : get_automation_execution_request) =
  assoc_to_yojson
    [
      ("AutomationExecutionId", Some (automation_execution_id_to_yojson x.automation_execution_id));
    ]

let session_token_type_to_yojson = string_to_yojson

let credentials_to_yojson (x : credentials) =
  assoc_to_yojson
    [
      ("AccessKeyId", Some (access_key_id_type_to_yojson x.access_key_id));
      ("SecretAccessKey", Some (access_key_secret_type_to_yojson x.secret_access_key));
      ("SessionToken", Some (session_token_type_to_yojson x.session_token));
      ("ExpirationTime", Some (date_time_to_yojson x.expiration_time));
    ]

let get_access_token_response_to_yojson (x : get_access_token_response) =
  assoc_to_yojson
    [
      ("Credentials", option_to_yojson credentials_to_yojson x.credentials);
      ( "AccessRequestStatus",
        option_to_yojson access_request_status_to_yojson x.access_request_status );
    ]

let get_access_token_request_to_yojson (x : get_access_token_request) =
  assoc_to_yojson [ ("AccessRequestId", Some (access_request_id_to_yojson x.access_request_id)) ]

let ops_item_related_item_association_not_found_exception_to_yojson
    (x : ops_item_related_item_association_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let disassociate_ops_item_related_item_response_to_yojson = unit_to_yojson

let disassociate_ops_item_related_item_request_to_yojson
    (x : disassociate_ops_item_related_item_request) =
  assoc_to_yojson
    [
      ("OpsItemId", Some (ops_item_id_to_yojson x.ops_item_id));
      ("AssociationId", Some (ops_item_related_item_association_id_to_yojson x.association_id));
    ]

let max_session_duration_to_yojson = string_to_yojson
let session_manager_cloud_watch_output_url_to_yojson = string_to_yojson
let session_manager_s3_output_url_to_yojson = string_to_yojson

let session_manager_output_url_to_yojson (x : session_manager_output_url) =
  assoc_to_yojson
    [
      ("S3OutputUrl", option_to_yojson session_manager_s3_output_url_to_yojson x.s3_output_url);
      ( "CloudWatchOutputUrl",
        option_to_yojson session_manager_cloud_watch_output_url_to_yojson x.cloud_watch_output_url
      );
    ]

let session_details_to_yojson = string_to_yojson
let session_owner_to_yojson = string_to_yojson

let session_status_to_yojson (x : session_status) =
  match x with
  | CONNECTED -> `String "Connected"
  | CONNECTING -> `String "Connecting"
  | DISCONNECTED -> `String "Disconnected"
  | TERMINATED -> `String "Terminated"
  | TERMINATING -> `String "Terminating"
  | FAILED -> `String "Failed"

let session_to_yojson (x : session) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("Target", option_to_yojson session_target_to_yojson x.target);
      ("Status", option_to_yojson session_status_to_yojson x.status);
      ("StartDate", option_to_yojson date_time_to_yojson x.start_date);
      ("EndDate", option_to_yojson date_time_to_yojson x.end_date);
      ("DocumentName", option_to_yojson document_name_to_yojson x.document_name);
      ("Owner", option_to_yojson session_owner_to_yojson x.owner);
      ("Reason", option_to_yojson session_reason_to_yojson x.reason);
      ("Details", option_to_yojson session_details_to_yojson x.details);
      ("OutputUrl", option_to_yojson session_manager_output_url_to_yojson x.output_url);
      ("MaxSessionDuration", option_to_yojson max_session_duration_to_yojson x.max_session_duration);
      ("AccessType", option_to_yojson access_type_to_yojson x.access_type);
    ]

let session_list_to_yojson tree = list_to_yojson session_to_yojson tree

let describe_sessions_response_to_yojson (x : describe_sessions_response) =
  assoc_to_yojson
    [
      ("Sessions", option_to_yojson session_list_to_yojson x.sessions);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let session_filter_value_to_yojson = string_to_yojson

let session_filter_key_to_yojson (x : session_filter_key) =
  match x with
  | INVOKED_AFTER -> `String "InvokedAfter"
  | INVOKED_BEFORE -> `String "InvokedBefore"
  | TARGET_ID -> `String "Target"
  | OWNER -> `String "Owner"
  | STATUS -> `String "Status"
  | SESSION_ID -> `String "SessionId"
  | ACCESS_TYPE -> `String "AccessType"

let session_filter_to_yojson (x : session_filter) =
  assoc_to_yojson
    [
      ("key", Some (session_filter_key_to_yojson x.key));
      ("value", Some (session_filter_value_to_yojson x.value));
    ]

let session_filter_list_to_yojson tree = list_to_yojson session_filter_to_yojson tree
let session_max_results_to_yojson = int_to_yojson

let session_state_to_yojson (x : session_state) =
  match x with ACTIVE -> `String "Active" | HISTORY -> `String "History"

let describe_sessions_request_to_yojson (x : describe_sessions_request) =
  assoc_to_yojson
    [
      ("State", Some (session_state_to_yojson x.state));
      ("MaxResults", option_to_yojson session_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson session_filter_list_to_yojson x.filters);
    ]

let patch_property_entry_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let patch_properties_list_to_yojson tree = list_to_yojson patch_property_entry_to_yojson tree

let describe_patch_properties_result_to_yojson (x : describe_patch_properties_result) =
  assoc_to_yojson
    [
      ("Properties", option_to_yojson patch_properties_list_to_yojson x.properties);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let patch_set_to_yojson (x : patch_set) =
  match x with Os -> `String "OS" | Application -> `String "APPLICATION"

let patch_property_to_yojson (x : patch_property) =
  match x with
  | Product -> `String "PRODUCT"
  | PatchProductFamily -> `String "PRODUCT_FAMILY"
  | PatchClassification -> `String "CLASSIFICATION"
  | PatchMsrcSeverity -> `String "MSRC_SEVERITY"
  | PatchPriority -> `String "PRIORITY"
  | PatchSeverity -> `String "SEVERITY"

let describe_patch_properties_request_to_yojson (x : describe_patch_properties_request) =
  assoc_to_yojson
    [
      ("OperatingSystem", Some (operating_system_to_yojson x.operating_system));
      ("Property", Some (patch_property_to_yojson x.property));
      ("PatchSet", option_to_yojson patch_set_to_yojson x.patch_set);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let instances_count_to_yojson = int_to_yojson

let describe_patch_group_state_result_to_yojson (x : describe_patch_group_state_result) =
  assoc_to_yojson
    [
      ("Instances", option_to_yojson integer_to_yojson x.instances);
      ( "InstancesWithInstalledPatches",
        option_to_yojson integer_to_yojson x.instances_with_installed_patches );
      ( "InstancesWithInstalledOtherPatches",
        option_to_yojson integer_to_yojson x.instances_with_installed_other_patches );
      ( "InstancesWithInstalledPendingRebootPatches",
        option_to_yojson instances_count_to_yojson x.instances_with_installed_pending_reboot_patches
      );
      ( "InstancesWithInstalledRejectedPatches",
        option_to_yojson instances_count_to_yojson x.instances_with_installed_rejected_patches );
      ( "InstancesWithMissingPatches",
        option_to_yojson integer_to_yojson x.instances_with_missing_patches );
      ( "InstancesWithFailedPatches",
        option_to_yojson integer_to_yojson x.instances_with_failed_patches );
      ( "InstancesWithNotApplicablePatches",
        option_to_yojson integer_to_yojson x.instances_with_not_applicable_patches );
      ( "InstancesWithUnreportedNotApplicablePatches",
        option_to_yojson integer_to_yojson x.instances_with_unreported_not_applicable_patches );
      ( "InstancesWithCriticalNonCompliantPatches",
        option_to_yojson instances_count_to_yojson x.instances_with_critical_non_compliant_patches
      );
      ( "InstancesWithSecurityNonCompliantPatches",
        option_to_yojson instances_count_to_yojson x.instances_with_security_non_compliant_patches
      );
      ( "InstancesWithOtherNonCompliantPatches",
        option_to_yojson instances_count_to_yojson x.instances_with_other_non_compliant_patches );
      ( "InstancesWithAvailableSecurityUpdates",
        option_to_yojson integer_to_yojson x.instances_with_available_security_updates );
    ]

let describe_patch_group_state_request_to_yojson (x : describe_patch_group_state_request) =
  assoc_to_yojson [ ("PatchGroup", Some (patch_group_to_yojson x.patch_group)) ]

let default_baseline_to_yojson = bool_to_yojson

let patch_baseline_identity_to_yojson (x : patch_baseline_identity) =
  assoc_to_yojson
    [
      ("BaselineId", option_to_yojson baseline_id_to_yojson x.baseline_id);
      ("BaselineName", option_to_yojson baseline_name_to_yojson x.baseline_name);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("BaselineDescription", option_to_yojson baseline_description_to_yojson x.baseline_description);
      ("DefaultBaseline", option_to_yojson default_baseline_to_yojson x.default_baseline);
    ]

let patch_group_patch_baseline_mapping_to_yojson (x : patch_group_patch_baseline_mapping) =
  assoc_to_yojson
    [
      ("PatchGroup", option_to_yojson patch_group_to_yojson x.patch_group);
      ("BaselineIdentity", option_to_yojson patch_baseline_identity_to_yojson x.baseline_identity);
    ]

let patch_group_patch_baseline_mapping_list_to_yojson tree =
  list_to_yojson patch_group_patch_baseline_mapping_to_yojson tree

let describe_patch_groups_result_to_yojson (x : describe_patch_groups_result) =
  assoc_to_yojson
    [
      ("Mappings", option_to_yojson patch_group_patch_baseline_mapping_list_to_yojson x.mappings);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let patch_orchestrator_filter_value_to_yojson = string_to_yojson

let patch_orchestrator_filter_values_to_yojson tree =
  list_to_yojson patch_orchestrator_filter_value_to_yojson tree

let patch_orchestrator_filter_key_to_yojson = string_to_yojson

let patch_orchestrator_filter_to_yojson (x : patch_orchestrator_filter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson patch_orchestrator_filter_key_to_yojson x.key);
      ("Values", option_to_yojson patch_orchestrator_filter_values_to_yojson x.values);
    ]

let patch_orchestrator_filter_list_to_yojson tree =
  list_to_yojson patch_orchestrator_filter_to_yojson tree

let patch_baseline_max_results_to_yojson = int_to_yojson

let describe_patch_groups_request_to_yojson (x : describe_patch_groups_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson patch_baseline_max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson patch_orchestrator_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let patch_baseline_identity_list_to_yojson tree =
  list_to_yojson patch_baseline_identity_to_yojson tree

let describe_patch_baselines_result_to_yojson (x : describe_patch_baselines_result) =
  assoc_to_yojson
    [
      ( "BaselineIdentities",
        option_to_yojson patch_baseline_identity_list_to_yojson x.baseline_identities );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_patch_baselines_request_to_yojson (x : describe_patch_baselines_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson patch_orchestrator_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson patch_baseline_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let parameter_metadata_to_yojson (x : parameter_metadata) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson ps_parameter_name_to_yojson x.name);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("Type", option_to_yojson parameter_type_to_yojson x.type_);
      ("KeyId", option_to_yojson parameter_key_id_to_yojson x.key_id);
      ("LastModifiedDate", option_to_yojson date_time_to_yojson x.last_modified_date);
      ("LastModifiedUser", option_to_yojson string__to_yojson x.last_modified_user);
      ("Description", option_to_yojson parameter_description_to_yojson x.description);
      ("AllowedPattern", option_to_yojson allowed_pattern_to_yojson x.allowed_pattern);
      ("Version", option_to_yojson ps_parameter_version_to_yojson x.version);
      ("Tier", option_to_yojson parameter_tier_to_yojson x.tier);
      ("Policies", option_to_yojson parameter_policy_list_to_yojson x.policies);
      ("DataType", option_to_yojson parameter_data_type_to_yojson x.data_type);
    ]

let parameter_metadata_list_to_yojson tree = list_to_yojson parameter_metadata_to_yojson tree

let describe_parameters_result_to_yojson (x : describe_parameters_result) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson parameter_metadata_list_to_yojson x.parameters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let parameters_filter_value_to_yojson = string_to_yojson

let parameters_filter_value_list_to_yojson tree =
  list_to_yojson parameters_filter_value_to_yojson tree

let parameters_filter_key_to_yojson (x : parameters_filter_key) =
  match x with NAME -> `String "Name" | TYPE -> `String "Type" | KEY_ID -> `String "KeyId"

let parameters_filter_to_yojson (x : parameters_filter) =
  assoc_to_yojson
    [
      ("Key", Some (parameters_filter_key_to_yojson x.key));
      ("Values", Some (parameters_filter_value_list_to_yojson x.values));
    ]

let parameters_filter_list_to_yojson tree = list_to_yojson parameters_filter_to_yojson tree

let describe_parameters_request_to_yojson (x : describe_parameters_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson parameters_filter_list_to_yojson x.filters);
      ( "ParameterFilters",
        option_to_yojson parameter_string_filter_list_to_yojson x.parameter_filters );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Shared", option_to_yojson boolean__to_yojson x.shared);
    ]

let ops_item_summary_to_yojson (x : ops_item_summary) =
  assoc_to_yojson
    [
      ("CreatedBy", option_to_yojson string__to_yojson x.created_by);
      ("CreatedTime", option_to_yojson date_time_to_yojson x.created_time);
      ("LastModifiedBy", option_to_yojson string__to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson date_time_to_yojson x.last_modified_time);
      ("Priority", option_to_yojson ops_item_priority_to_yojson x.priority);
      ("Source", option_to_yojson ops_item_source_to_yojson x.source);
      ("Status", option_to_yojson ops_item_status_to_yojson x.status);
      ("OpsItemId", option_to_yojson ops_item_id_to_yojson x.ops_item_id);
      ("Title", option_to_yojson ops_item_title_to_yojson x.title);
      ("OperationalData", option_to_yojson ops_item_operational_data_to_yojson x.operational_data);
      ("Category", option_to_yojson ops_item_category_to_yojson x.category);
      ("Severity", option_to_yojson ops_item_severity_to_yojson x.severity);
      ("OpsItemType", option_to_yojson ops_item_type_to_yojson x.ops_item_type);
      ("ActualStartTime", option_to_yojson date_time_to_yojson x.actual_start_time);
      ("ActualEndTime", option_to_yojson date_time_to_yojson x.actual_end_time);
      ("PlannedStartTime", option_to_yojson date_time_to_yojson x.planned_start_time);
      ("PlannedEndTime", option_to_yojson date_time_to_yojson x.planned_end_time);
    ]

let ops_item_summaries_to_yojson tree = list_to_yojson ops_item_summary_to_yojson tree

let describe_ops_items_response_to_yojson (x : describe_ops_items_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("OpsItemSummaries", option_to_yojson ops_item_summaries_to_yojson x.ops_item_summaries);
    ]

let ops_item_max_results_to_yojson = int_to_yojson

let ops_item_filter_operator_to_yojson (x : ops_item_filter_operator) =
  match x with
  | EQUAL -> `String "Equal"
  | CONTAINS -> `String "Contains"
  | GREATER_THAN -> `String "GreaterThan"
  | LESS_THAN -> `String "LessThan"

let ops_item_filter_value_to_yojson = string_to_yojson
let ops_item_filter_values_to_yojson tree = list_to_yojson ops_item_filter_value_to_yojson tree

let ops_item_filter_key_to_yojson (x : ops_item_filter_key) =
  match x with
  | STATUS -> `String "Status"
  | CREATED_BY -> `String "CreatedBy"
  | SOURCE -> `String "Source"
  | PRIORITY -> `String "Priority"
  | TITLE -> `String "Title"
  | OPSITEM_ID -> `String "OpsItemId"
  | CREATED_TIME -> `String "CreatedTime"
  | LAST_MODIFIED_TIME -> `String "LastModifiedTime"
  | ACTUAL_START_TIME -> `String "ActualStartTime"
  | ACTUAL_END_TIME -> `String "ActualEndTime"
  | PLANNED_START_TIME -> `String "PlannedStartTime"
  | PLANNED_END_TIME -> `String "PlannedEndTime"
  | OPERATIONAL_DATA -> `String "OperationalData"
  | OPERATIONAL_DATA_KEY -> `String "OperationalDataKey"
  | OPERATIONAL_DATA_VALUE -> `String "OperationalDataValue"
  | RESOURCE_ID -> `String "ResourceId"
  | AUTOMATION_ID -> `String "AutomationId"
  | CATEGORY -> `String "Category"
  | SEVERITY -> `String "Severity"
  | OPSITEM_TYPE -> `String "OpsItemType"
  | ACCESS_REQUEST_REQUESTER_ARN -> `String "AccessRequestByRequesterArn"
  | ACCESS_REQUEST_REQUESTER_ID -> `String "AccessRequestByRequesterId"
  | ACCESS_REQUEST_APPROVER_ARN -> `String "AccessRequestByApproverArn"
  | ACCESS_REQUEST_APPROVER_ID -> `String "AccessRequestByApproverId"
  | ACCESS_REQUEST_SOURCE_ACCOUNT_ID -> `String "AccessRequestBySourceAccountId"
  | ACCESS_REQUEST_SOURCE_OPS_ITEM_ID -> `String "AccessRequestBySourceOpsItemId"
  | ACCESS_REQUEST_SOURCE_REGION -> `String "AccessRequestBySourceRegion"
  | ACCESS_REQUEST_IS_REPLICA -> `String "AccessRequestByIsReplica"
  | ACCESS_REQUEST_TARGET_RESOURCE_ID -> `String "AccessRequestByTargetResourceId"
  | CHANGE_REQUEST_REQUESTER_ARN -> `String "ChangeRequestByRequesterArn"
  | CHANGE_REQUEST_REQUESTER_NAME -> `String "ChangeRequestByRequesterName"
  | CHANGE_REQUEST_APPROVER_ARN -> `String "ChangeRequestByApproverArn"
  | CHANGE_REQUEST_APPROVER_NAME -> `String "ChangeRequestByApproverName"
  | CHANGE_REQUEST_TEMPLATE -> `String "ChangeRequestByTemplate"
  | CHANGE_REQUEST_TARGETS_RESOURCE_GROUP -> `String "ChangeRequestByTargetsResourceGroup"
  | INSIGHT_TYPE -> `String "InsightByType"
  | ACCOUNT_ID -> `String "AccountId"

let ops_item_filter_to_yojson (x : ops_item_filter) =
  assoc_to_yojson
    [
      ("Key", Some (ops_item_filter_key_to_yojson x.key));
      ("Values", Some (ops_item_filter_values_to_yojson x.values));
      ("Operator", Some (ops_item_filter_operator_to_yojson x.operator));
    ]

let ops_item_filters_to_yojson tree = list_to_yojson ops_item_filter_to_yojson tree

let describe_ops_items_request_to_yojson (x : describe_ops_items_request) =
  assoc_to_yojson
    [
      ("OpsItemFilters", option_to_yojson ops_item_filters_to_yojson x.ops_item_filters);
      ("MaxResults", option_to_yojson ops_item_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let maintenance_window_task_to_yojson (x : maintenance_window_task) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("WindowTaskId", option_to_yojson maintenance_window_task_id_to_yojson x.window_task_id);
      ("TaskArn", option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn);
      ("Type", option_to_yojson maintenance_window_task_type_to_yojson x.type_);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ( "TaskParameters",
        option_to_yojson maintenance_window_task_parameters_to_yojson x.task_parameters );
      ("Priority", option_to_yojson maintenance_window_task_priority_to_yojson x.priority);
      ("LoggingInfo", option_to_yojson logging_info_to_yojson x.logging_info);
      ("ServiceRoleArn", option_to_yojson service_role_to_yojson x.service_role_arn);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ( "CutoffBehavior",
        option_to_yojson maintenance_window_task_cutoff_behavior_to_yojson x.cutoff_behavior );
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
    ]

let maintenance_window_task_list_to_yojson tree =
  list_to_yojson maintenance_window_task_to_yojson tree

let describe_maintenance_window_tasks_result_to_yojson
    (x : describe_maintenance_window_tasks_result) =
  assoc_to_yojson
    [
      ("Tasks", option_to_yojson maintenance_window_task_list_to_yojson x.tasks);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let maintenance_window_max_results_to_yojson = int_to_yojson
let maintenance_window_filter_value_to_yojson = string_to_yojson

let maintenance_window_filter_values_to_yojson tree =
  list_to_yojson maintenance_window_filter_value_to_yojson tree

let maintenance_window_filter_key_to_yojson = string_to_yojson

let maintenance_window_filter_to_yojson (x : maintenance_window_filter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson maintenance_window_filter_key_to_yojson x.key);
      ("Values", option_to_yojson maintenance_window_filter_values_to_yojson x.values);
    ]

let maintenance_window_filter_list_to_yojson tree =
  list_to_yojson maintenance_window_filter_to_yojson tree

let describe_maintenance_window_tasks_request_to_yojson
    (x : describe_maintenance_window_tasks_request) =
  assoc_to_yojson
    [
      ("WindowId", Some (maintenance_window_id_to_yojson x.window_id));
      ("Filters", option_to_yojson maintenance_window_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson maintenance_window_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let maintenance_window_target_to_yojson (x : maintenance_window_target) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("WindowTargetId", option_to_yojson maintenance_window_target_id_to_yojson x.window_target_id);
      ("ResourceType", option_to_yojson maintenance_window_resource_type_to_yojson x.resource_type);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("OwnerInformation", option_to_yojson owner_information_to_yojson x.owner_information);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
    ]

let maintenance_window_target_list_to_yojson tree =
  list_to_yojson maintenance_window_target_to_yojson tree

let describe_maintenance_window_targets_result_to_yojson
    (x : describe_maintenance_window_targets_result) =
  assoc_to_yojson
    [
      ("Targets", option_to_yojson maintenance_window_target_list_to_yojson x.targets);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_maintenance_window_targets_request_to_yojson
    (x : describe_maintenance_window_targets_request) =
  assoc_to_yojson
    [
      ("WindowId", Some (maintenance_window_id_to_yojson x.window_id));
      ("Filters", option_to_yojson maintenance_window_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson maintenance_window_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let maintenance_window_identity_for_target_to_yojson (x : maintenance_window_identity_for_target) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
    ]

let maintenance_windows_for_target_list_to_yojson tree =
  list_to_yojson maintenance_window_identity_for_target_to_yojson tree

let describe_maintenance_windows_for_target_result_to_yojson
    (x : describe_maintenance_windows_for_target_result) =
  assoc_to_yojson
    [
      ( "WindowIdentities",
        option_to_yojson maintenance_windows_for_target_list_to_yojson x.window_identities );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let maintenance_window_search_max_results_to_yojson = int_to_yojson

let describe_maintenance_windows_for_target_request_to_yojson
    (x : describe_maintenance_windows_for_target_request) =
  assoc_to_yojson
    [
      ("Targets", Some (targets_to_yojson x.targets));
      ("ResourceType", Some (maintenance_window_resource_type_to_yojson x.resource_type));
      ("MaxResults", option_to_yojson maintenance_window_search_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let scheduled_window_execution_to_yojson (x : scheduled_window_execution) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ( "ExecutionTime",
        option_to_yojson maintenance_window_string_date_time_to_yojson x.execution_time );
    ]

let scheduled_window_execution_list_to_yojson tree =
  list_to_yojson scheduled_window_execution_to_yojson tree

let describe_maintenance_window_schedule_result_to_yojson
    (x : describe_maintenance_window_schedule_result) =
  assoc_to_yojson
    [
      ( "ScheduledWindowExecutions",
        option_to_yojson scheduled_window_execution_list_to_yojson x.scheduled_window_executions );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_maintenance_window_schedule_request_to_yojson
    (x : describe_maintenance_window_schedule_request) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("ResourceType", option_to_yojson maintenance_window_resource_type_to_yojson x.resource_type);
      ("Filters", option_to_yojson patch_orchestrator_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson maintenance_window_search_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let maintenance_window_identity_to_yojson (x : maintenance_window_identity) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("Name", option_to_yojson maintenance_window_name_to_yojson x.name);
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ("Enabled", option_to_yojson maintenance_window_enabled_to_yojson x.enabled);
      ("Duration", option_to_yojson maintenance_window_duration_hours_to_yojson x.duration);
      ("Cutoff", option_to_yojson maintenance_window_cutoff_to_yojson x.cutoff);
      ("Schedule", option_to_yojson maintenance_window_schedule_to_yojson x.schedule);
      ( "ScheduleTimezone",
        option_to_yojson maintenance_window_timezone_to_yojson x.schedule_timezone );
      ("ScheduleOffset", option_to_yojson maintenance_window_offset_to_yojson x.schedule_offset);
      ("EndDate", option_to_yojson maintenance_window_string_date_time_to_yojson x.end_date);
      ("StartDate", option_to_yojson maintenance_window_string_date_time_to_yojson x.start_date);
      ( "NextExecutionTime",
        option_to_yojson maintenance_window_string_date_time_to_yojson x.next_execution_time );
    ]

let maintenance_window_identity_list_to_yojson tree =
  list_to_yojson maintenance_window_identity_to_yojson tree

let describe_maintenance_windows_result_to_yojson (x : describe_maintenance_windows_result) =
  assoc_to_yojson
    [
      ( "WindowIdentities",
        option_to_yojson maintenance_window_identity_list_to_yojson x.window_identities );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_maintenance_windows_request_to_yojson (x : describe_maintenance_windows_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson maintenance_window_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson maintenance_window_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let maintenance_window_execution_task_identity_to_yojson
    (x : maintenance_window_execution_task_identity) =
  assoc_to_yojson
    [
      ( "WindowExecutionId",
        option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id );
      ( "TaskExecutionId",
        option_to_yojson maintenance_window_execution_task_id_to_yojson x.task_execution_id );
      ("Status", option_to_yojson maintenance_window_execution_status_to_yojson x.status);
      ( "StatusDetails",
        option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details );
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("TaskArn", option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn);
      ("TaskType", option_to_yojson maintenance_window_task_type_to_yojson x.task_type);
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ("TriggeredAlarms", option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms);
    ]

let maintenance_window_execution_task_identity_list_to_yojson tree =
  list_to_yojson maintenance_window_execution_task_identity_to_yojson tree

let describe_maintenance_window_execution_tasks_result_to_yojson
    (x : describe_maintenance_window_execution_tasks_result) =
  assoc_to_yojson
    [
      ( "WindowExecutionTaskIdentities",
        option_to_yojson maintenance_window_execution_task_identity_list_to_yojson
          x.window_execution_task_identities );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_maintenance_window_execution_tasks_request_to_yojson
    (x : describe_maintenance_window_execution_tasks_request) =
  assoc_to_yojson
    [
      ("WindowExecutionId", Some (maintenance_window_execution_id_to_yojson x.window_execution_id));
      ("Filters", option_to_yojson maintenance_window_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson maintenance_window_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let maintenance_window_execution_task_invocation_identity_to_yojson
    (x : maintenance_window_execution_task_invocation_identity) =
  assoc_to_yojson
    [
      ( "WindowExecutionId",
        option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id );
      ( "TaskExecutionId",
        option_to_yojson maintenance_window_execution_task_id_to_yojson x.task_execution_id );
      ( "InvocationId",
        option_to_yojson maintenance_window_execution_task_invocation_id_to_yojson x.invocation_id
      );
      ( "ExecutionId",
        option_to_yojson maintenance_window_execution_task_execution_id_to_yojson x.execution_id );
      ("TaskType", option_to_yojson maintenance_window_task_type_to_yojson x.task_type);
      ( "Parameters",
        option_to_yojson maintenance_window_execution_task_invocation_parameters_to_yojson
          x.parameters );
      ("Status", option_to_yojson maintenance_window_execution_status_to_yojson x.status);
      ( "StatusDetails",
        option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details );
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("OwnerInformation", option_to_yojson owner_information_to_yojson x.owner_information);
      ( "WindowTargetId",
        option_to_yojson maintenance_window_task_target_id_to_yojson x.window_target_id );
    ]

let maintenance_window_execution_task_invocation_identity_list_to_yojson tree =
  list_to_yojson maintenance_window_execution_task_invocation_identity_to_yojson tree

let describe_maintenance_window_execution_task_invocations_result_to_yojson
    (x : describe_maintenance_window_execution_task_invocations_result) =
  assoc_to_yojson
    [
      ( "WindowExecutionTaskInvocationIdentities",
        option_to_yojson maintenance_window_execution_task_invocation_identity_list_to_yojson
          x.window_execution_task_invocation_identities );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_maintenance_window_execution_task_invocations_request_to_yojson
    (x : describe_maintenance_window_execution_task_invocations_request) =
  assoc_to_yojson
    [
      ("WindowExecutionId", Some (maintenance_window_execution_id_to_yojson x.window_execution_id));
      ("TaskId", Some (maintenance_window_execution_task_id_to_yojson x.task_id));
      ("Filters", option_to_yojson maintenance_window_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson maintenance_window_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let maintenance_window_execution_to_yojson (x : maintenance_window_execution) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ( "WindowExecutionId",
        option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id );
      ("Status", option_to_yojson maintenance_window_execution_status_to_yojson x.status);
      ( "StatusDetails",
        option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details );
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
    ]

let maintenance_window_execution_list_to_yojson tree =
  list_to_yojson maintenance_window_execution_to_yojson tree

let describe_maintenance_window_executions_result_to_yojson
    (x : describe_maintenance_window_executions_result) =
  assoc_to_yojson
    [
      ( "WindowExecutions",
        option_to_yojson maintenance_window_execution_list_to_yojson x.window_executions );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_maintenance_window_executions_request_to_yojson
    (x : describe_maintenance_window_executions_request) =
  assoc_to_yojson
    [
      ("WindowId", Some (maintenance_window_id_to_yojson x.window_id));
      ("Filters", option_to_yojson maintenance_window_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson maintenance_window_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let invalid_deletion_id_exception_to_yojson (x : invalid_deletion_id_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let inventory_deletion_last_status_update_time_to_yojson = timestamp_epoch_seconds_to_yojson
let remaining_count_to_yojson = int_to_yojson
let resource_count_to_yojson = int_to_yojson

let inventory_deletion_summary_item_to_yojson (x : inventory_deletion_summary_item) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson inventory_item_schema_version_to_yojson x.version);
      ("Count", option_to_yojson resource_count_to_yojson x.count);
      ("RemainingCount", option_to_yojson remaining_count_to_yojson x.remaining_count);
    ]

let inventory_deletion_summary_items_to_yojson tree =
  list_to_yojson inventory_deletion_summary_item_to_yojson tree

let total_count_to_yojson = int_to_yojson

let inventory_deletion_summary_to_yojson (x : inventory_deletion_summary) =
  assoc_to_yojson
    [
      ("TotalCount", option_to_yojson total_count_to_yojson x.total_count);
      ("RemainingCount", option_to_yojson remaining_count_to_yojson x.remaining_count);
      ("SummaryItems", option_to_yojson inventory_deletion_summary_items_to_yojson x.summary_items);
    ]

let inventory_deletion_last_status_message_to_yojson = string_to_yojson

let inventory_deletion_status_to_yojson (x : inventory_deletion_status) =
  match x with IN_PROGRESS -> `String "InProgress" | COMPLETE -> `String "Complete"

let inventory_deletion_start_time_to_yojson = timestamp_epoch_seconds_to_yojson
let uui_d_to_yojson = string_to_yojson

let inventory_deletion_status_item_to_yojson (x : inventory_deletion_status_item) =
  assoc_to_yojson
    [
      ("DeletionId", option_to_yojson uui_d_to_yojson x.deletion_id);
      ("TypeName", option_to_yojson inventory_item_type_name_to_yojson x.type_name);
      ( "DeletionStartTime",
        option_to_yojson inventory_deletion_start_time_to_yojson x.deletion_start_time );
      ("LastStatus", option_to_yojson inventory_deletion_status_to_yojson x.last_status);
      ( "LastStatusMessage",
        option_to_yojson inventory_deletion_last_status_message_to_yojson x.last_status_message );
      ("DeletionSummary", option_to_yojson inventory_deletion_summary_to_yojson x.deletion_summary);
      ( "LastStatusUpdateTime",
        option_to_yojson inventory_deletion_last_status_update_time_to_yojson
          x.last_status_update_time );
    ]

let inventory_deletions_list_to_yojson tree =
  list_to_yojson inventory_deletion_status_item_to_yojson tree

let describe_inventory_deletions_result_to_yojson (x : describe_inventory_deletions_result) =
  assoc_to_yojson
    [
      ( "InventoryDeletions",
        option_to_yojson inventory_deletions_list_to_yojson x.inventory_deletions );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_inventory_deletions_request_to_yojson (x : describe_inventory_deletions_request) =
  assoc_to_yojson
    [
      ("DeletionId", option_to_yojson uui_d_to_yojson x.deletion_id);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let invalid_instance_property_filter_value_to_yojson (x : invalid_instance_property_filter_value) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_activation_id_to_yojson (x : invalid_activation_id) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let source_type_to_yojson (x : source_type) =
  match x with
  | AWS_EC2_INSTANCE -> `String "AWS::EC2::Instance"
  | AWS_IOT_THING -> `String "AWS::IoT::Thing"
  | AWS_SSM_MANAGEDINSTANCE -> `String "AWS::SSM::ManagedInstance"

let source_id_to_yojson = string_to_yojson

let instance_association_status_aggregated_count_to_yojson tree =
  map_to_yojson status_name_to_yojson instance_count_to_yojson tree

let instance_aggregated_association_overview_to_yojson
    (x : instance_aggregated_association_overview) =
  assoc_to_yojson
    [
      ("DetailedStatus", option_to_yojson status_name_to_yojson x.detailed_status);
      ( "InstanceAssociationStatusAggregatedCount",
        option_to_yojson instance_association_status_aggregated_count_to_yojson
          x.instance_association_status_aggregated_count );
    ]

let version_to_yojson = string_to_yojson

let ping_status_to_yojson (x : ping_status) =
  match x with
  | ONLINE -> `String "Online"
  | CONNECTION_LOST -> `String "ConnectionLost"
  | INACTIVE -> `String "Inactive"

let architecture_to_yojson = string_to_yojson
let instance_state_to_yojson = string_to_yojson
let key_name_to_yojson = string_to_yojson
let instance_role_to_yojson = string_to_yojson
let instance_type_to_yojson = string_to_yojson
let instance_name_to_yojson = string_to_yojson

let instance_property_to_yojson (x : instance_property) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson instance_name_to_yojson x.name);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("InstanceRole", option_to_yojson instance_role_to_yojson x.instance_role);
      ("KeyName", option_to_yojson key_name_to_yojson x.key_name);
      ("InstanceState", option_to_yojson instance_state_to_yojson x.instance_state);
      ("Architecture", option_to_yojson architecture_to_yojson x.architecture);
      ("IPAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("LaunchTime", option_to_yojson date_time_to_yojson x.launch_time);
      ("PingStatus", option_to_yojson ping_status_to_yojson x.ping_status);
      ("LastPingDateTime", option_to_yojson date_time_to_yojson x.last_ping_date_time);
      ("AgentVersion", option_to_yojson version_to_yojson x.agent_version);
      ("PlatformType", option_to_yojson platform_type_to_yojson x.platform_type);
      ("PlatformName", option_to_yojson platform_name_to_yojson x.platform_name);
      ("PlatformVersion", option_to_yojson platform_version_to_yojson x.platform_version);
      ("ActivationId", option_to_yojson activation_id_to_yojson x.activation_id);
      ("IamRole", option_to_yojson iam_role_to_yojson x.iam_role);
      ("RegistrationDate", option_to_yojson date_time_to_yojson x.registration_date);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("ComputerName", option_to_yojson computer_name_to_yojson x.computer_name);
      ("AssociationStatus", option_to_yojson status_name_to_yojson x.association_status);
      ( "LastAssociationExecutionDate",
        option_to_yojson date_time_to_yojson x.last_association_execution_date );
      ( "LastSuccessfulAssociationExecutionDate",
        option_to_yojson date_time_to_yojson x.last_successful_association_execution_date );
      ( "AssociationOverview",
        option_to_yojson instance_aggregated_association_overview_to_yojson x.association_overview
      );
      ("SourceId", option_to_yojson source_id_to_yojson x.source_id);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
    ]

let instance_properties_to_yojson tree = list_to_yojson instance_property_to_yojson tree

let describe_instance_properties_result_to_yojson (x : describe_instance_properties_result) =
  assoc_to_yojson
    [
      ("InstanceProperties", option_to_yojson instance_properties_to_yojson x.instance_properties);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_instance_properties_max_results_to_yojson = int_to_yojson

let instance_property_filter_operator_to_yojson (x : instance_property_filter_operator) =
  match x with
  | EQUAL -> `String "Equal"
  | NOT_EQUAL -> `String "NotEqual"
  | BEGIN_WITH -> `String "BeginWith"
  | LESS_THAN -> `String "LessThan"
  | GREATER_THAN -> `String "GreaterThan"

let instance_property_filter_value_to_yojson = string_to_yojson

let instance_property_filter_value_set_to_yojson tree =
  list_to_yojson instance_property_filter_value_to_yojson tree

let instance_property_string_filter_key_to_yojson = string_to_yojson

let instance_property_string_filter_to_yojson (x : instance_property_string_filter) =
  assoc_to_yojson
    [
      ("Key", Some (instance_property_string_filter_key_to_yojson x.key));
      ("Values", Some (instance_property_filter_value_set_to_yojson x.values));
      ("Operator", option_to_yojson instance_property_filter_operator_to_yojson x.operator);
    ]

let instance_property_string_filter_list_to_yojson tree =
  list_to_yojson instance_property_string_filter_to_yojson tree

let instance_property_filter_key_to_yojson (x : instance_property_filter_key) =
  match x with
  | INSTANCE_IDS -> `String "InstanceIds"
  | AGENT_VERSION -> `String "AgentVersion"
  | PING_STATUS -> `String "PingStatus"
  | PLATFORM_TYPES -> `String "PlatformTypes"
  | DOCUMENT_NAME -> `String "DocumentName"
  | ACTIVATION_IDS -> `String "ActivationIds"
  | IAM_ROLE -> `String "IamRole"
  | RESOURCE_TYPE -> `String "ResourceType"
  | ASSOCIATION_STATUS -> `String "AssociationStatus"

let instance_property_filter_to_yojson (x : instance_property_filter) =
  assoc_to_yojson
    [
      ("key", Some (instance_property_filter_key_to_yojson x.key));
      ("valueSet", Some (instance_property_filter_value_set_to_yojson x.value_set));
    ]

let instance_property_filter_list_to_yojson tree =
  list_to_yojson instance_property_filter_to_yojson tree

let describe_instance_properties_request_to_yojson (x : describe_instance_properties_request) =
  assoc_to_yojson
    [
      ( "InstancePropertyFilterList",
        option_to_yojson instance_property_filter_list_to_yojson x.instance_property_filter_list );
      ( "FiltersWithOperator",
        option_to_yojson instance_property_string_filter_list_to_yojson x.filters_with_operator );
      ( "MaxResults",
        option_to_yojson describe_instance_properties_max_results_to_yojson x.max_results );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let patch_other_non_compliant_count_to_yojson = int_to_yojson
let patch_security_non_compliant_count_to_yojson = int_to_yojson
let patch_critical_non_compliant_count_to_yojson = int_to_yojson

let reboot_option_to_yojson (x : reboot_option) =
  match x with REBOOT_IF_NEEDED -> `String "RebootIfNeeded" | NO_REBOOT -> `String "NoReboot"

let patch_operation_type_to_yojson (x : patch_operation_type) =
  match x with SCAN -> `String "Scan" | INSTALL -> `String "Install"

let patch_available_security_update_count_to_yojson = int_to_yojson
let patch_not_applicable_count_to_yojson = int_to_yojson
let patch_unreported_not_applicable_count_to_yojson = int_to_yojson
let patch_failed_count_to_yojson = int_to_yojson
let patch_missing_count_to_yojson = int_to_yojson
let patch_installed_rejected_count_to_yojson = int_to_yojson
let patch_installed_pending_reboot_count_to_yojson = int_to_yojson
let patch_installed_other_count_to_yojson = int_to_yojson
let patch_installed_count_to_yojson = int_to_yojson
let install_override_list_to_yojson = string_to_yojson

let instance_patch_state_to_yojson (x : instance_patch_state) =
  assoc_to_yojson
    [
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ("PatchGroup", Some (patch_group_to_yojson x.patch_group));
      ("BaselineId", Some (baseline_id_to_yojson x.baseline_id));
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ( "InstallOverrideList",
        option_to_yojson install_override_list_to_yojson x.install_override_list );
      ("OwnerInformation", option_to_yojson owner_information_to_yojson x.owner_information);
      ("InstalledCount", option_to_yojson patch_installed_count_to_yojson x.installed_count);
      ( "InstalledOtherCount",
        option_to_yojson patch_installed_other_count_to_yojson x.installed_other_count );
      ( "InstalledPendingRebootCount",
        option_to_yojson patch_installed_pending_reboot_count_to_yojson
          x.installed_pending_reboot_count );
      ( "InstalledRejectedCount",
        option_to_yojson patch_installed_rejected_count_to_yojson x.installed_rejected_count );
      ("MissingCount", option_to_yojson patch_missing_count_to_yojson x.missing_count);
      ("FailedCount", option_to_yojson patch_failed_count_to_yojson x.failed_count);
      ( "UnreportedNotApplicableCount",
        option_to_yojson patch_unreported_not_applicable_count_to_yojson
          x.unreported_not_applicable_count );
      ( "NotApplicableCount",
        option_to_yojson patch_not_applicable_count_to_yojson x.not_applicable_count );
      ( "AvailableSecurityUpdateCount",
        option_to_yojson patch_available_security_update_count_to_yojson
          x.available_security_update_count );
      ("OperationStartTime", Some (date_time_to_yojson x.operation_start_time));
      ("OperationEndTime", Some (date_time_to_yojson x.operation_end_time));
      ("Operation", Some (patch_operation_type_to_yojson x.operation));
      ( "LastNoRebootInstallOperationTime",
        option_to_yojson date_time_to_yojson x.last_no_reboot_install_operation_time );
      ("RebootOption", option_to_yojson reboot_option_to_yojson x.reboot_option);
      ( "CriticalNonCompliantCount",
        option_to_yojson patch_critical_non_compliant_count_to_yojson x.critical_non_compliant_count
      );
      ( "SecurityNonCompliantCount",
        option_to_yojson patch_security_non_compliant_count_to_yojson x.security_non_compliant_count
      );
      ( "OtherNonCompliantCount",
        option_to_yojson patch_other_non_compliant_count_to_yojson x.other_non_compliant_count );
    ]

let instance_patch_states_list_to_yojson tree = list_to_yojson instance_patch_state_to_yojson tree

let describe_instance_patch_states_for_patch_group_result_to_yojson
    (x : describe_instance_patch_states_for_patch_group_result) =
  assoc_to_yojson
    [
      ( "InstancePatchStates",
        option_to_yojson instance_patch_states_list_to_yojson x.instance_patch_states );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let patch_compliance_max_results_to_yojson = int_to_yojson

let instance_patch_state_operator_type_to_yojson (x : instance_patch_state_operator_type) =
  match x with
  | EQUAL -> `String "Equal"
  | NOT_EQUAL -> `String "NotEqual"
  | LESS_THAN -> `String "LessThan"
  | GREATER_THAN -> `String "GreaterThan"

let instance_patch_state_filter_value_to_yojson = string_to_yojson

let instance_patch_state_filter_values_to_yojson tree =
  list_to_yojson instance_patch_state_filter_value_to_yojson tree

let instance_patch_state_filter_key_to_yojson = string_to_yojson

let instance_patch_state_filter_to_yojson (x : instance_patch_state_filter) =
  assoc_to_yojson
    [
      ("Key", Some (instance_patch_state_filter_key_to_yojson x.key));
      ("Values", Some (instance_patch_state_filter_values_to_yojson x.values));
      ("Type", Some (instance_patch_state_operator_type_to_yojson x.type_));
    ]

let instance_patch_state_filter_list_to_yojson tree =
  list_to_yojson instance_patch_state_filter_to_yojson tree

let describe_instance_patch_states_for_patch_group_request_to_yojson
    (x : describe_instance_patch_states_for_patch_group_request) =
  assoc_to_yojson
    [
      ("PatchGroup", Some (patch_group_to_yojson x.patch_group));
      ("Filters", option_to_yojson instance_patch_state_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson patch_compliance_max_results_to_yojson x.max_results);
    ]

let instance_patch_state_list_to_yojson tree = list_to_yojson instance_patch_state_to_yojson tree

let describe_instance_patch_states_result_to_yojson (x : describe_instance_patch_states_result) =
  assoc_to_yojson
    [
      ( "InstancePatchStates",
        option_to_yojson instance_patch_state_list_to_yojson x.instance_patch_states );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_instance_patch_states_request_to_yojson (x : describe_instance_patch_states_request) =
  assoc_to_yojson
    [
      ("InstanceIds", Some (instance_id_list_to_yojson x.instance_ids));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson patch_compliance_max_results_to_yojson x.max_results);
    ]

let patch_cve_ids_to_yojson = string_to_yojson

let patch_compliance_data_state_to_yojson (x : patch_compliance_data_state) =
  match x with
  | Installed -> `String "INSTALLED"
  | InstalledOther -> `String "INSTALLED_OTHER"
  | InstalledPendingReboot -> `String "INSTALLED_PENDING_REBOOT"
  | InstalledRejected -> `String "INSTALLED_REJECTED"
  | Missing -> `String "MISSING"
  | NotApplicable -> `String "NOT_APPLICABLE"
  | Failed -> `String "FAILED"
  | AvailableSecurityUpdate -> `String "AVAILABLE_SECURITY_UPDATE"

let patch_severity_to_yojson = string_to_yojson
let patch_classification_to_yojson = string_to_yojson
let patch_kb_number_to_yojson = string_to_yojson
let patch_title_to_yojson = string_to_yojson

let patch_compliance_data_to_yojson (x : patch_compliance_data) =
  assoc_to_yojson
    [
      ("Title", Some (patch_title_to_yojson x.title));
      ("KBId", Some (patch_kb_number_to_yojson x.kb_id));
      ("Classification", Some (patch_classification_to_yojson x.classification));
      ("Severity", Some (patch_severity_to_yojson x.severity));
      ("State", Some (patch_compliance_data_state_to_yojson x.state));
      ("InstalledTime", Some (date_time_to_yojson x.installed_time));
      ("CVEIds", option_to_yojson patch_cve_ids_to_yojson x.cve_ids);
    ]

let patch_compliance_data_list_to_yojson tree = list_to_yojson patch_compliance_data_to_yojson tree

let describe_instance_patches_result_to_yojson (x : describe_instance_patches_result) =
  assoc_to_yojson
    [
      ("Patches", option_to_yojson patch_compliance_data_list_to_yojson x.patches);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_instance_patches_request_to_yojson (x : describe_instance_patches_request) =
  assoc_to_yojson
    [
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ("Filters", option_to_yojson patch_orchestrator_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson patch_compliance_max_results_to_yojson x.max_results);
    ]

let invalid_instance_information_filter_value_to_yojson
    (x : invalid_instance_information_filter_value) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let instance_information_to_yojson (x : instance_information) =
  assoc_to_yojson
    [
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("PingStatus", option_to_yojson ping_status_to_yojson x.ping_status);
      ("LastPingDateTime", option_to_yojson date_time_to_yojson x.last_ping_date_time);
      ("AgentVersion", option_to_yojson version_to_yojson x.agent_version);
      ("IsLatestVersion", option_to_yojson boolean__to_yojson x.is_latest_version);
      ("PlatformType", option_to_yojson platform_type_to_yojson x.platform_type);
      ("PlatformName", option_to_yojson string__to_yojson x.platform_name);
      ("PlatformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("ActivationId", option_to_yojson activation_id_to_yojson x.activation_id);
      ("IamRole", option_to_yojson iam_role_to_yojson x.iam_role);
      ("RegistrationDate", option_to_yojson date_time_to_yojson x.registration_date);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("IPAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("ComputerName", option_to_yojson computer_name_to_yojson x.computer_name);
      ("AssociationStatus", option_to_yojson status_name_to_yojson x.association_status);
      ( "LastAssociationExecutionDate",
        option_to_yojson date_time_to_yojson x.last_association_execution_date );
      ( "LastSuccessfulAssociationExecutionDate",
        option_to_yojson date_time_to_yojson x.last_successful_association_execution_date );
      ( "AssociationOverview",
        option_to_yojson instance_aggregated_association_overview_to_yojson x.association_overview
      );
      ("SourceId", option_to_yojson source_id_to_yojson x.source_id);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
    ]

let instance_information_list_to_yojson tree = list_to_yojson instance_information_to_yojson tree

let describe_instance_information_result_to_yojson (x : describe_instance_information_result) =
  assoc_to_yojson
    [
      ( "InstanceInformationList",
        option_to_yojson instance_information_list_to_yojson x.instance_information_list );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_ec2_compatible_to_yojson = int_to_yojson
let instance_information_filter_value_to_yojson = string_to_yojson

let instance_information_filter_value_set_to_yojson tree =
  list_to_yojson instance_information_filter_value_to_yojson tree

let instance_information_string_filter_key_to_yojson = string_to_yojson

let instance_information_string_filter_to_yojson (x : instance_information_string_filter) =
  assoc_to_yojson
    [
      ("Key", Some (instance_information_string_filter_key_to_yojson x.key));
      ("Values", Some (instance_information_filter_value_set_to_yojson x.values));
    ]

let instance_information_string_filter_list_to_yojson tree =
  list_to_yojson instance_information_string_filter_to_yojson tree

let instance_information_filter_key_to_yojson (x : instance_information_filter_key) =
  match x with
  | INSTANCE_IDS -> `String "InstanceIds"
  | AGENT_VERSION -> `String "AgentVersion"
  | PING_STATUS -> `String "PingStatus"
  | PLATFORM_TYPES -> `String "PlatformTypes"
  | ACTIVATION_IDS -> `String "ActivationIds"
  | IAM_ROLE -> `String "IamRole"
  | RESOURCE_TYPE -> `String "ResourceType"
  | ASSOCIATION_STATUS -> `String "AssociationStatus"

let instance_information_filter_to_yojson (x : instance_information_filter) =
  assoc_to_yojson
    [
      ("key", Some (instance_information_filter_key_to_yojson x.key));
      ("valueSet", Some (instance_information_filter_value_set_to_yojson x.value_set));
    ]

let instance_information_filter_list_to_yojson tree =
  list_to_yojson instance_information_filter_to_yojson tree

let describe_instance_information_request_to_yojson (x : describe_instance_information_request) =
  assoc_to_yojson
    [
      ( "InstanceInformationFilterList",
        option_to_yojson instance_information_filter_list_to_yojson
          x.instance_information_filter_list );
      ("Filters", option_to_yojson instance_information_string_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_ec2_compatible_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let s3_output_url_to_yojson (x : s3_output_url) =
  assoc_to_yojson [ ("OutputUrl", option_to_yojson url_to_yojson x.output_url) ]

let instance_association_output_url_to_yojson (x : instance_association_output_url) =
  assoc_to_yojson [ ("S3OutputUrl", option_to_yojson s3_output_url_to_yojson x.s3_output_url) ]

let instance_association_execution_summary_to_yojson = string_to_yojson

let instance_association_status_info_to_yojson (x : instance_association_status_info) =
  assoc_to_yojson
    [
      ("AssociationId", option_to_yojson association_id_to_yojson x.association_id);
      ("Name", option_to_yojson document_ar_n_to_yojson x.name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("AssociationVersion", option_to_yojson association_version_to_yojson x.association_version);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("ExecutionDate", option_to_yojson date_time_to_yojson x.execution_date);
      ("Status", option_to_yojson status_name_to_yojson x.status);
      ("DetailedStatus", option_to_yojson status_name_to_yojson x.detailed_status);
      ( "ExecutionSummary",
        option_to_yojson instance_association_execution_summary_to_yojson x.execution_summary );
      ("ErrorCode", option_to_yojson agent_error_code_to_yojson x.error_code);
      ("OutputUrl", option_to_yojson instance_association_output_url_to_yojson x.output_url);
      ("AssociationName", option_to_yojson association_name_to_yojson x.association_name);
    ]

let instance_association_status_infos_to_yojson tree =
  list_to_yojson instance_association_status_info_to_yojson tree

let describe_instance_associations_status_result_to_yojson
    (x : describe_instance_associations_status_result) =
  assoc_to_yojson
    [
      ( "InstanceAssociationStatusInfos",
        option_to_yojson instance_association_status_infos_to_yojson
          x.instance_association_status_infos );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_instance_associations_status_request_to_yojson
    (x : describe_instance_associations_status_request) =
  assoc_to_yojson
    [
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let patch_deployment_status_to_yojson (x : patch_deployment_status) =
  match x with
  | Approved -> `String "APPROVED"
  | PendingApproval -> `String "PENDING_APPROVAL"
  | ExplicitApproved -> `String "EXPLICIT_APPROVED"
  | ExplicitRejected -> `String "EXPLICIT_REJECTED"

let patch_status_to_yojson (x : patch_status) =
  assoc_to_yojson
    [
      ("DeploymentStatus", option_to_yojson patch_deployment_status_to_yojson x.deployment_status);
      ("ComplianceLevel", option_to_yojson patch_compliance_level_to_yojson x.compliance_level);
      ("ApprovalDate", option_to_yojson date_time_to_yojson x.approval_date);
    ]

let patch_repository_to_yojson = string_to_yojson
let patch_arch_to_yojson = string_to_yojson
let patch_release_to_yojson = string_to_yojson
let patch_version_to_yojson = string_to_yojson
let patch_epoch_to_yojson = int_to_yojson
let patch_name_to_yojson = string_to_yojson
let patch_cve_id_to_yojson = string_to_yojson
let patch_cve_id_list_to_yojson tree = list_to_yojson patch_cve_id_to_yojson tree
let patch_bugzilla_id_to_yojson = string_to_yojson
let patch_bugzilla_id_list_to_yojson tree = list_to_yojson patch_bugzilla_id_to_yojson tree
let patch_advisory_id_to_yojson = string_to_yojson
let patch_advisory_id_list_to_yojson tree = list_to_yojson patch_advisory_id_to_yojson tree
let patch_language_to_yojson = string_to_yojson
let patch_msrc_number_to_yojson = string_to_yojson
let patch_msrc_severity_to_yojson = string_to_yojson
let patch_product_to_yojson = string_to_yojson
let patch_product_family_to_yojson = string_to_yojson
let patch_vendor_to_yojson = string_to_yojson
let patch_content_url_to_yojson = string_to_yojson
let patch_description_to_yojson = string_to_yojson

let patch_to_yojson (x : patch) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson patch_id_to_yojson x.id);
      ("ReleaseDate", option_to_yojson date_time_to_yojson x.release_date);
      ("Title", option_to_yojson patch_title_to_yojson x.title);
      ("Description", option_to_yojson patch_description_to_yojson x.description);
      ("ContentUrl", option_to_yojson patch_content_url_to_yojson x.content_url);
      ("Vendor", option_to_yojson patch_vendor_to_yojson x.vendor);
      ("ProductFamily", option_to_yojson patch_product_family_to_yojson x.product_family);
      ("Product", option_to_yojson patch_product_to_yojson x.product);
      ("Classification", option_to_yojson patch_classification_to_yojson x.classification);
      ("MsrcSeverity", option_to_yojson patch_msrc_severity_to_yojson x.msrc_severity);
      ("KbNumber", option_to_yojson patch_kb_number_to_yojson x.kb_number);
      ("MsrcNumber", option_to_yojson patch_msrc_number_to_yojson x.msrc_number);
      ("Language", option_to_yojson patch_language_to_yojson x.language);
      ("AdvisoryIds", option_to_yojson patch_advisory_id_list_to_yojson x.advisory_ids);
      ("BugzillaIds", option_to_yojson patch_bugzilla_id_list_to_yojson x.bugzilla_ids);
      ("CVEIds", option_to_yojson patch_cve_id_list_to_yojson x.cve_ids);
      ("Name", option_to_yojson patch_name_to_yojson x.name);
      ("Epoch", option_to_yojson patch_epoch_to_yojson x.epoch);
      ("Version", option_to_yojson patch_version_to_yojson x.version);
      ("Release", option_to_yojson patch_release_to_yojson x.release);
      ("Arch", option_to_yojson patch_arch_to_yojson x.arch);
      ("Severity", option_to_yojson patch_severity_to_yojson x.severity);
      ("Repository", option_to_yojson patch_repository_to_yojson x.repository);
    ]

let effective_patch_to_yojson (x : effective_patch) =
  assoc_to_yojson
    [
      ("Patch", option_to_yojson patch_to_yojson x.patch);
      ("PatchStatus", option_to_yojson patch_status_to_yojson x.patch_status);
    ]

let effective_patch_list_to_yojson tree = list_to_yojson effective_patch_to_yojson tree

let describe_effective_patches_for_patch_baseline_result_to_yojson
    (x : describe_effective_patches_for_patch_baseline_result) =
  assoc_to_yojson
    [
      ("EffectivePatches", option_to_yojson effective_patch_list_to_yojson x.effective_patches);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_effective_patches_for_patch_baseline_request_to_yojson
    (x : describe_effective_patches_for_patch_baseline_request) =
  assoc_to_yojson
    [
      ("BaselineId", Some (baseline_id_to_yojson x.baseline_id));
      ("MaxResults", option_to_yojson patch_baseline_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let instance_association_to_yojson (x : instance_association) =
  assoc_to_yojson
    [
      ("AssociationId", option_to_yojson association_id_to_yojson x.association_id);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("Content", option_to_yojson document_content_to_yojson x.content);
      ("AssociationVersion", option_to_yojson association_version_to_yojson x.association_version);
    ]

let instance_association_list_to_yojson tree = list_to_yojson instance_association_to_yojson tree

let describe_effective_instance_associations_result_to_yojson
    (x : describe_effective_instance_associations_result) =
  assoc_to_yojson
    [
      ("Associations", option_to_yojson instance_association_list_to_yojson x.associations);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let effective_instance_association_max_results_to_yojson = int_to_yojson

let describe_effective_instance_associations_request_to_yojson
    (x : describe_effective_instance_associations_request) =
  assoc_to_yojson
    [
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ( "MaxResults",
        option_to_yojson effective_instance_association_max_results_to_yojson x.max_results );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_document_permission_response_to_yojson (x : describe_document_permission_response) =
  assoc_to_yojson
    [
      ("AccountIds", option_to_yojson account_id_list_to_yojson x.account_ids);
      ( "AccountSharingInfoList",
        option_to_yojson account_sharing_info_list_to_yojson x.account_sharing_info_list );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let document_permission_max_results_to_yojson = int_to_yojson

let describe_document_permission_request_to_yojson (x : describe_document_permission_request) =
  assoc_to_yojson
    [
      ("Name", Some (document_name_to_yojson x.name));
      ("PermissionType", Some (document_permission_type_to_yojson x.permission_type));
      ("MaxResults", option_to_yojson document_permission_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_document_result_to_yojson (x : describe_document_result) =
  assoc_to_yojson [ ("Document", option_to_yojson document_description_to_yojson x.document) ]

let describe_document_request_to_yojson (x : describe_document_request) =
  assoc_to_yojson
    [
      ("Name", Some (document_ar_n_to_yojson x.name));
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("VersionName", option_to_yojson document_version_name_to_yojson x.version_name);
    ]

let patch_list_to_yojson tree = list_to_yojson patch_to_yojson tree

let describe_available_patches_result_to_yojson (x : describe_available_patches_result) =
  assoc_to_yojson
    [
      ("Patches", option_to_yojson patch_list_to_yojson x.patches);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_available_patches_request_to_yojson (x : describe_available_patches_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson patch_orchestrator_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson patch_baseline_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_automation_step_executions_result_to_yojson
    (x : describe_automation_step_executions_result) =
  assoc_to_yojson
    [
      ("StepExecutions", option_to_yojson step_execution_list_to_yojson x.step_executions);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let step_execution_filter_value_to_yojson = string_to_yojson

let step_execution_filter_value_list_to_yojson tree =
  list_to_yojson step_execution_filter_value_to_yojson tree

let step_execution_filter_key_to_yojson (x : step_execution_filter_key) =
  match x with
  | START_TIME_BEFORE -> `String "StartTimeBefore"
  | START_TIME_AFTER -> `String "StartTimeAfter"
  | STEP_EXECUTION_STATUS -> `String "StepExecutionStatus"
  | STEP_EXECUTION_ID -> `String "StepExecutionId"
  | STEP_NAME -> `String "StepName"
  | ACTION -> `String "Action"
  | PARENT_STEP_EXECUTION_ID -> `String "ParentStepExecutionId"
  | PARENT_STEP_ITERATION -> `String "ParentStepIteration"
  | PARENT_STEP_ITERATOR_VALUE -> `String "ParentStepIteratorValue"

let step_execution_filter_to_yojson (x : step_execution_filter) =
  assoc_to_yojson
    [
      ("Key", Some (step_execution_filter_key_to_yojson x.key));
      ("Values", Some (step_execution_filter_value_list_to_yojson x.values));
    ]

let step_execution_filter_list_to_yojson tree = list_to_yojson step_execution_filter_to_yojson tree

let describe_automation_step_executions_request_to_yojson
    (x : describe_automation_step_executions_request) =
  assoc_to_yojson
    [
      ("AutomationExecutionId", Some (automation_execution_id_to_yojson x.automation_execution_id));
      ("Filters", option_to_yojson step_execution_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ReverseOrder", option_to_yojson boolean__to_yojson x.reverse_order);
    ]

let automation_type_to_yojson (x : automation_type) =
  match x with CrossAccount -> `String "CrossAccount" | Local -> `String "Local"

let automation_execution_metadata_to_yojson (x : automation_execution_metadata) =
  assoc_to_yojson
    [
      ( "AutomationExecutionId",
        option_to_yojson automation_execution_id_to_yojson x.automation_execution_id );
      ("DocumentName", option_to_yojson document_name_to_yojson x.document_name);
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ( "AutomationExecutionStatus",
        option_to_yojson automation_execution_status_to_yojson x.automation_execution_status );
      ("ExecutionStartTime", option_to_yojson date_time_to_yojson x.execution_start_time);
      ("ExecutionEndTime", option_to_yojson date_time_to_yojson x.execution_end_time);
      ("ExecutedBy", option_to_yojson string__to_yojson x.executed_by);
      ("LogFile", option_to_yojson string__to_yojson x.log_file);
      ("Outputs", option_to_yojson automation_parameter_map_to_yojson x.outputs);
      ("Mode", option_to_yojson execution_mode_to_yojson x.mode);
      ( "ParentAutomationExecutionId",
        option_to_yojson automation_execution_id_to_yojson x.parent_automation_execution_id );
      ("CurrentStepName", option_to_yojson string__to_yojson x.current_step_name);
      ("CurrentAction", option_to_yojson string__to_yojson x.current_action);
      ("FailureMessage", option_to_yojson string__to_yojson x.failure_message);
      ( "TargetParameterName",
        option_to_yojson automation_parameter_key_to_yojson x.target_parameter_name );
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("TargetMaps", option_to_yojson target_maps_to_yojson x.target_maps);
      ("ResolvedTargets", option_to_yojson resolved_targets_to_yojson x.resolved_targets);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("Target", option_to_yojson string__to_yojson x.target);
      ("AutomationType", option_to_yojson automation_type_to_yojson x.automation_type);
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ("TriggeredAlarms", option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms);
      ( "TargetLocationsURL",
        option_to_yojson target_locations_ur_l_to_yojson x.target_locations_ur_l );
      ("AutomationSubtype", option_to_yojson automation_subtype_to_yojson x.automation_subtype);
      ("ScheduledTime", option_to_yojson date_time_to_yojson x.scheduled_time);
      ("Runbooks", option_to_yojson runbooks_to_yojson x.runbooks);
      ("OpsItemId", option_to_yojson string__to_yojson x.ops_item_id);
      ("AssociationId", option_to_yojson string__to_yojson x.association_id);
      ("ChangeRequestName", option_to_yojson change_request_name_to_yojson x.change_request_name);
    ]

let automation_execution_metadata_list_to_yojson tree =
  list_to_yojson automation_execution_metadata_to_yojson tree

let describe_automation_executions_result_to_yojson (x : describe_automation_executions_result) =
  assoc_to_yojson
    [
      ( "AutomationExecutionMetadataList",
        option_to_yojson automation_execution_metadata_list_to_yojson
          x.automation_execution_metadata_list );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let automation_execution_filter_value_to_yojson = string_to_yojson

let automation_execution_filter_value_list_to_yojson tree =
  list_to_yojson automation_execution_filter_value_to_yojson tree

let automation_execution_filter_key_to_yojson (x : automation_execution_filter_key) =
  match x with
  | DOCUMENT_NAME_PREFIX -> `String "DocumentNamePrefix"
  | EXECUTION_STATUS -> `String "ExecutionStatus"
  | EXECUTION_ID -> `String "ExecutionId"
  | PARENT_EXECUTION_ID -> `String "ParentExecutionId"
  | CURRENT_ACTION -> `String "CurrentAction"
  | START_TIME_BEFORE -> `String "StartTimeBefore"
  | START_TIME_AFTER -> `String "StartTimeAfter"
  | AUTOMATION_TYPE -> `String "AutomationType"
  | TAG_KEY -> `String "TagKey"
  | TARGET_RESOURCE_GROUP -> `String "TargetResourceGroup"
  | AUTOMATION_SUBTYPE -> `String "AutomationSubtype"
  | OPS_ITEM_ID -> `String "OpsItemId"

let automation_execution_filter_to_yojson (x : automation_execution_filter) =
  assoc_to_yojson
    [
      ("Key", Some (automation_execution_filter_key_to_yojson x.key));
      ("Values", Some (automation_execution_filter_value_list_to_yojson x.values));
    ]

let automation_execution_filter_list_to_yojson tree =
  list_to_yojson automation_execution_filter_to_yojson tree

let describe_automation_executions_request_to_yojson (x : describe_automation_executions_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson automation_execution_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let association_execution_does_not_exist_to_yojson (x : association_execution_does_not_exist) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let output_source_type_to_yojson = string_to_yojson
let output_source_id_to_yojson = string_to_yojson

let output_source_to_yojson (x : output_source) =
  assoc_to_yojson
    [
      ("OutputSourceId", option_to_yojson output_source_id_to_yojson x.output_source_id);
      ("OutputSourceType", option_to_yojson output_source_type_to_yojson x.output_source_type);
    ]

let association_resource_type_to_yojson = string_to_yojson
let association_resource_id_to_yojson = string_to_yojson
let association_execution_id_to_yojson = string_to_yojson

let association_execution_target_to_yojson (x : association_execution_target) =
  assoc_to_yojson
    [
      ("AssociationId", option_to_yojson association_id_to_yojson x.association_id);
      ("AssociationVersion", option_to_yojson association_version_to_yojson x.association_version);
      ("ExecutionId", option_to_yojson association_execution_id_to_yojson x.execution_id);
      ("ResourceId", option_to_yojson association_resource_id_to_yojson x.resource_id);
      ("ResourceType", option_to_yojson association_resource_type_to_yojson x.resource_type);
      ("Status", option_to_yojson status_name_to_yojson x.status);
      ("DetailedStatus", option_to_yojson status_name_to_yojson x.detailed_status);
      ("LastExecutionDate", option_to_yojson date_time_to_yojson x.last_execution_date);
      ("OutputSource", option_to_yojson output_source_to_yojson x.output_source);
    ]

let association_execution_targets_list_to_yojson tree =
  list_to_yojson association_execution_target_to_yojson tree

let describe_association_execution_targets_result_to_yojson
    (x : describe_association_execution_targets_result) =
  assoc_to_yojson
    [
      ( "AssociationExecutionTargets",
        option_to_yojson association_execution_targets_list_to_yojson
          x.association_execution_targets );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let association_execution_targets_filter_value_to_yojson = string_to_yojson

let association_execution_targets_filter_key_to_yojson
    (x : association_execution_targets_filter_key) =
  match x with
  | Status -> `String "Status"
  | ResourceId -> `String "ResourceId"
  | ResourceType -> `String "ResourceType"

let association_execution_targets_filter_to_yojson (x : association_execution_targets_filter) =
  assoc_to_yojson
    [
      ("Key", Some (association_execution_targets_filter_key_to_yojson x.key));
      ("Value", Some (association_execution_targets_filter_value_to_yojson x.value));
    ]

let association_execution_targets_filter_list_to_yojson tree =
  list_to_yojson association_execution_targets_filter_to_yojson tree

let describe_association_execution_targets_request_to_yojson
    (x : describe_association_execution_targets_request) =
  assoc_to_yojson
    [
      ("AssociationId", Some (association_id_to_yojson x.association_id));
      ("ExecutionId", Some (association_execution_id_to_yojson x.execution_id));
      ("Filters", option_to_yojson association_execution_targets_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resource_count_by_status_to_yojson = string_to_yojson

let association_execution_to_yojson (x : association_execution) =
  assoc_to_yojson
    [
      ("AssociationId", option_to_yojson association_id_to_yojson x.association_id);
      ("AssociationVersion", option_to_yojson association_version_to_yojson x.association_version);
      ("ExecutionId", option_to_yojson association_execution_id_to_yojson x.execution_id);
      ("Status", option_to_yojson status_name_to_yojson x.status);
      ("DetailedStatus", option_to_yojson status_name_to_yojson x.detailed_status);
      ("CreatedTime", option_to_yojson date_time_to_yojson x.created_time);
      ("LastExecutionDate", option_to_yojson date_time_to_yojson x.last_execution_date);
      ( "ResourceCountByStatus",
        option_to_yojson resource_count_by_status_to_yojson x.resource_count_by_status );
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ("TriggeredAlarms", option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms);
    ]

let association_executions_list_to_yojson tree = list_to_yojson association_execution_to_yojson tree

let describe_association_executions_result_to_yojson (x : describe_association_executions_result) =
  assoc_to_yojson
    [
      ( "AssociationExecutions",
        option_to_yojson association_executions_list_to_yojson x.association_executions );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let association_filter_operator_type_to_yojson (x : association_filter_operator_type) =
  match x with
  | Equal -> `String "EQUAL"
  | LessThan -> `String "LESS_THAN"
  | GreaterThan -> `String "GREATER_THAN"

let association_execution_filter_value_to_yojson = string_to_yojson

let association_execution_filter_key_to_yojson (x : association_execution_filter_key) =
  match x with
  | ExecutionId -> `String "ExecutionId"
  | Status -> `String "Status"
  | CreatedTime -> `String "CreatedTime"

let association_execution_filter_to_yojson (x : association_execution_filter) =
  assoc_to_yojson
    [
      ("Key", Some (association_execution_filter_key_to_yojson x.key));
      ("Value", Some (association_execution_filter_value_to_yojson x.value));
      ("Type", Some (association_filter_operator_type_to_yojson x.type_));
    ]

let association_execution_filter_list_to_yojson tree =
  list_to_yojson association_execution_filter_to_yojson tree

let describe_association_executions_request_to_yojson (x : describe_association_executions_request)
    =
  assoc_to_yojson
    [
      ("AssociationId", Some (association_id_to_yojson x.association_id));
      ("Filters", option_to_yojson association_execution_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_association_result_to_yojson (x : describe_association_result) =
  assoc_to_yojson
    [
      ( "AssociationDescription",
        option_to_yojson association_description_to_yojson x.association_description );
    ]

let describe_association_request_to_yojson (x : describe_association_request) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson document_ar_n_to_yojson x.name);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("AssociationId", option_to_yojson association_id_to_yojson x.association_id);
      ("AssociationVersion", option_to_yojson association_version_to_yojson x.association_version);
    ]

let describe_activations_result_to_yojson (x : describe_activations_result) =
  assoc_to_yojson
    [
      ("ActivationList", option_to_yojson activation_list_to_yojson x.activation_list);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let describe_activations_filter_keys_to_yojson (x : describe_activations_filter_keys) =
  match x with
  | ACTIVATION_IDS -> `String "ActivationIds"
  | DEFAULT_INSTANCE_NAME -> `String "DefaultInstanceName"
  | IAM_ROLE -> `String "IamRole"

let describe_activations_filter_to_yojson (x : describe_activations_filter) =
  assoc_to_yojson
    [
      ("FilterKey", option_to_yojson describe_activations_filter_keys_to_yojson x.filter_key);
      ("FilterValues", option_to_yojson string_list_to_yojson x.filter_values);
    ]

let describe_activations_filter_list_to_yojson tree =
  list_to_yojson describe_activations_filter_to_yojson tree

let describe_activations_request_to_yojson (x : describe_activations_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson describe_activations_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let deregister_task_from_maintenance_window_result_to_yojson
    (x : deregister_task_from_maintenance_window_result) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("WindowTaskId", option_to_yojson maintenance_window_task_id_to_yojson x.window_task_id);
    ]

let deregister_task_from_maintenance_window_request_to_yojson
    (x : deregister_task_from_maintenance_window_request) =
  assoc_to_yojson
    [
      ("WindowId", Some (maintenance_window_id_to_yojson x.window_id));
      ("WindowTaskId", Some (maintenance_window_task_id_to_yojson x.window_task_id));
    ]

let target_in_use_exception_to_yojson (x : target_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let deregister_target_from_maintenance_window_result_to_yojson
    (x : deregister_target_from_maintenance_window_result) =
  assoc_to_yojson
    [
      ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id);
      ("WindowTargetId", option_to_yojson maintenance_window_target_id_to_yojson x.window_target_id);
    ]

let deregister_target_from_maintenance_window_request_to_yojson
    (x : deregister_target_from_maintenance_window_request) =
  assoc_to_yojson
    [
      ("WindowId", Some (maintenance_window_id_to_yojson x.window_id));
      ("WindowTargetId", Some (maintenance_window_target_id_to_yojson x.window_target_id));
      ("Safe", option_to_yojson boolean__to_yojson x.safe);
    ]

let deregister_patch_baseline_for_patch_group_result_to_yojson
    (x : deregister_patch_baseline_for_patch_group_result) =
  assoc_to_yojson
    [
      ("BaselineId", option_to_yojson baseline_id_to_yojson x.baseline_id);
      ("PatchGroup", option_to_yojson patch_group_to_yojson x.patch_group);
    ]

let deregister_patch_baseline_for_patch_group_request_to_yojson
    (x : deregister_patch_baseline_for_patch_group_request) =
  assoc_to_yojson
    [
      ("BaselineId", Some (baseline_id_to_yojson x.baseline_id));
      ("PatchGroup", Some (patch_group_to_yojson x.patch_group));
    ]

let deregister_managed_instance_result_to_yojson = unit_to_yojson

let deregister_managed_instance_request_to_yojson (x : deregister_managed_instance_request) =
  assoc_to_yojson [ ("InstanceId", Some (managed_instance_id_to_yojson x.instance_id)) ]

let delete_resource_policy_response_to_yojson = unit_to_yojson

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_string_to_yojson x.resource_arn));
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("PolicyHash", Some (policy_hash_to_yojson x.policy_hash));
    ]

let delete_resource_data_sync_result_to_yojson = unit_to_yojson

let delete_resource_data_sync_request_to_yojson (x : delete_resource_data_sync_request) =
  assoc_to_yojson
    [
      ("SyncName", Some (resource_data_sync_name_to_yojson x.sync_name));
      ("SyncType", option_to_yojson resource_data_sync_type_to_yojson x.sync_type);
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let delete_patch_baseline_result_to_yojson (x : delete_patch_baseline_result) =
  assoc_to_yojson [ ("BaselineId", option_to_yojson baseline_id_to_yojson x.baseline_id) ]

let delete_patch_baseline_request_to_yojson (x : delete_patch_baseline_request) =
  assoc_to_yojson [ ("BaselineId", Some (baseline_id_to_yojson x.baseline_id)) ]

let delete_parameters_result_to_yojson (x : delete_parameters_result) =
  assoc_to_yojson
    [
      ("DeletedParameters", option_to_yojson parameter_name_list_to_yojson x.deleted_parameters);
      ("InvalidParameters", option_to_yojson parameter_name_list_to_yojson x.invalid_parameters);
    ]

let delete_parameters_request_to_yojson (x : delete_parameters_request) =
  assoc_to_yojson [ ("Names", Some (parameter_name_list_to_yojson x.names)) ]

let delete_parameter_result_to_yojson = unit_to_yojson

let delete_parameter_request_to_yojson (x : delete_parameter_request) =
  assoc_to_yojson [ ("Name", Some (ps_parameter_name_to_yojson x.name)) ]

let delete_ops_metadata_result_to_yojson = unit_to_yojson

let delete_ops_metadata_request_to_yojson (x : delete_ops_metadata_request) =
  assoc_to_yojson [ ("OpsMetadataArn", Some (ops_metadata_arn_to_yojson x.ops_metadata_arn)) ]

let delete_ops_item_response_to_yojson = unit_to_yojson

let delete_ops_item_request_to_yojson (x : delete_ops_item_request) =
  assoc_to_yojson [ ("OpsItemId", Some (ops_item_id_to_yojson x.ops_item_id)) ]

let delete_maintenance_window_result_to_yojson (x : delete_maintenance_window_result) =
  assoc_to_yojson [ ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id) ]

let delete_maintenance_window_request_to_yojson (x : delete_maintenance_window_request) =
  assoc_to_yojson [ ("WindowId", Some (maintenance_window_id_to_yojson x.window_id)) ]

let invalid_option_exception_to_yojson (x : invalid_option_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_inventory_request_exception_to_yojson (x : invalid_inventory_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_delete_inventory_parameters_exception_to_yojson
    (x : invalid_delete_inventory_parameters_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let delete_inventory_result_to_yojson (x : delete_inventory_result) =
  assoc_to_yojson
    [
      ("DeletionId", option_to_yojson uui_d_to_yojson x.deletion_id);
      ("TypeName", option_to_yojson inventory_item_type_name_to_yojson x.type_name);
      ("DeletionSummary", option_to_yojson inventory_deletion_summary_to_yojson x.deletion_summary);
    ]

let dry_run_to_yojson = bool_to_yojson

let inventory_schema_delete_option_to_yojson (x : inventory_schema_delete_option) =
  match x with DISABLE_SCHEMA -> `String "DisableSchema" | DELETE_SCHEMA -> `String "DeleteSchema"

let delete_inventory_request_to_yojson (x : delete_inventory_request) =
  assoc_to_yojson
    [
      ("TypeName", Some (inventory_item_type_name_to_yojson x.type_name));
      ( "SchemaDeleteOption",
        option_to_yojson inventory_schema_delete_option_to_yojson x.schema_delete_option );
      ("DryRun", option_to_yojson dry_run_to_yojson x.dry_run);
      ( "ClientToken",
        Some (uui_d_to_yojson (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ())))
      );
    ]

let associated_instances_to_yojson = unit_to_yojson
let delete_document_result_to_yojson = unit_to_yojson

let delete_document_request_to_yojson (x : delete_document_request) =
  assoc_to_yojson
    [
      ("Name", Some (document_name_to_yojson x.name));
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("VersionName", option_to_yojson document_version_name_to_yojson x.version_name);
      ("Force", option_to_yojson boolean__to_yojson x.force);
    ]

let delete_association_result_to_yojson = unit_to_yojson

let delete_association_request_to_yojson (x : delete_association_request) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson document_ar_n_to_yojson x.name);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("AssociationId", option_to_yojson association_id_to_yojson x.association_id);
    ]

let invalid_activation_to_yojson (x : invalid_activation) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let delete_activation_result_to_yojson = unit_to_yojson

let delete_activation_request_to_yojson (x : delete_activation_request) =
  assoc_to_yojson [ ("ActivationId", Some (activation_id_to_yojson x.activation_id)) ]

let resource_data_sync_count_exceeded_exception_to_yojson
    (x : resource_data_sync_count_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_data_sync_already_exists_exception_to_yojson
    (x : resource_data_sync_already_exists_exception) =
  assoc_to_yojson [ ("SyncName", option_to_yojson resource_data_sync_name_to_yojson x.sync_name) ]

let create_resource_data_sync_result_to_yojson = unit_to_yojson

let create_resource_data_sync_request_to_yojson (x : create_resource_data_sync_request) =
  assoc_to_yojson
    [
      ("SyncName", Some (resource_data_sync_name_to_yojson x.sync_name));
      ( "S3Destination",
        option_to_yojson resource_data_sync_s3_destination_to_yojson x.s3_destination );
      ("SyncType", option_to_yojson resource_data_sync_type_to_yojson x.sync_type);
      ("SyncSource", option_to_yojson resource_data_sync_source_to_yojson x.sync_source);
    ]

let create_patch_baseline_result_to_yojson (x : create_patch_baseline_result) =
  assoc_to_yojson [ ("BaselineId", option_to_yojson baseline_id_to_yojson x.baseline_id) ]

let create_patch_baseline_request_to_yojson (x : create_patch_baseline_request) =
  assoc_to_yojson
    [
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("Name", Some (baseline_name_to_yojson x.name));
      ("GlobalFilters", option_to_yojson patch_filter_group_to_yojson x.global_filters);
      ("ApprovalRules", option_to_yojson patch_rule_group_to_yojson x.approval_rules);
      ("ApprovedPatches", option_to_yojson patch_id_list_to_yojson x.approved_patches);
      ( "ApprovedPatchesComplianceLevel",
        option_to_yojson patch_compliance_level_to_yojson x.approved_patches_compliance_level );
      ( "ApprovedPatchesEnableNonSecurity",
        option_to_yojson boolean__to_yojson x.approved_patches_enable_non_security );
      ("RejectedPatches", option_to_yojson patch_id_list_to_yojson x.rejected_patches);
      ("RejectedPatchesAction", option_to_yojson patch_action_to_yojson x.rejected_patches_action);
      ("Description", option_to_yojson baseline_description_to_yojson x.description);
      ("Sources", option_to_yojson patch_source_list_to_yojson x.sources);
      ( "AvailableSecurityUpdatesComplianceStatus",
        option_to_yojson patch_compliance_status_to_yojson
          x.available_security_updates_compliance_status );
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let ops_metadata_limit_exceeded_exception_to_yojson (x : ops_metadata_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let ops_metadata_already_exists_exception_to_yojson (x : ops_metadata_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let create_ops_metadata_result_to_yojson (x : create_ops_metadata_result) =
  assoc_to_yojson
    [ ("OpsMetadataArn", option_to_yojson ops_metadata_arn_to_yojson x.ops_metadata_arn) ]

let create_ops_metadata_request_to_yojson (x : create_ops_metadata_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (ops_metadata_resource_id_to_yojson x.resource_id));
      ("Metadata", option_to_yojson metadata_map_to_yojson x.metadata);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_ops_item_response_to_yojson (x : create_ops_item_response) =
  assoc_to_yojson
    [
      ("OpsItemId", option_to_yojson string__to_yojson x.ops_item_id);
      ("OpsItemArn", option_to_yojson ops_item_arn_to_yojson x.ops_item_arn);
    ]

let ops_item_account_id_to_yojson = string_to_yojson

let create_ops_item_request_to_yojson (x : create_ops_item_request) =
  assoc_to_yojson
    [
      ("Description", Some (ops_item_description_to_yojson x.description));
      ("OpsItemType", option_to_yojson ops_item_type_to_yojson x.ops_item_type);
      ("OperationalData", option_to_yojson ops_item_operational_data_to_yojson x.operational_data);
      ("Notifications", option_to_yojson ops_item_notifications_to_yojson x.notifications);
      ("Priority", option_to_yojson ops_item_priority_to_yojson x.priority);
      ("RelatedOpsItems", option_to_yojson related_ops_items_to_yojson x.related_ops_items);
      ("Source", Some (ops_item_source_to_yojson x.source));
      ("Title", Some (ops_item_title_to_yojson x.title));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Category", option_to_yojson ops_item_category_to_yojson x.category);
      ("Severity", option_to_yojson ops_item_severity_to_yojson x.severity);
      ("ActualStartTime", option_to_yojson date_time_to_yojson x.actual_start_time);
      ("ActualEndTime", option_to_yojson date_time_to_yojson x.actual_end_time);
      ("PlannedStartTime", option_to_yojson date_time_to_yojson x.planned_start_time);
      ("PlannedEndTime", option_to_yojson date_time_to_yojson x.planned_end_time);
      ("AccountId", option_to_yojson ops_item_account_id_to_yojson x.account_id);
    ]

let create_maintenance_window_result_to_yojson (x : create_maintenance_window_result) =
  assoc_to_yojson [ ("WindowId", option_to_yojson maintenance_window_id_to_yojson x.window_id) ]

let create_maintenance_window_request_to_yojson (x : create_maintenance_window_request) =
  assoc_to_yojson
    [
      ("Name", Some (maintenance_window_name_to_yojson x.name));
      ("Description", option_to_yojson maintenance_window_description_to_yojson x.description);
      ("StartDate", option_to_yojson maintenance_window_string_date_time_to_yojson x.start_date);
      ("EndDate", option_to_yojson maintenance_window_string_date_time_to_yojson x.end_date);
      ("Schedule", Some (maintenance_window_schedule_to_yojson x.schedule));
      ( "ScheduleTimezone",
        option_to_yojson maintenance_window_timezone_to_yojson x.schedule_timezone );
      ("ScheduleOffset", option_to_yojson maintenance_window_offset_to_yojson x.schedule_offset);
      ("Duration", Some (maintenance_window_duration_hours_to_yojson x.duration));
      ("Cutoff", Some (maintenance_window_cutoff_to_yojson x.cutoff));
      ( "AllowUnassociatedTargets",
        Some (maintenance_window_allow_unassociated_targets_to_yojson x.allow_unassociated_targets)
      );
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let document_already_exists_to_yojson (x : document_already_exists) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let create_document_result_to_yojson (x : create_document_result) =
  assoc_to_yojson
    [
      ("DocumentDescription", option_to_yojson document_description_to_yojson x.document_description);
    ]

let create_document_request_to_yojson (x : create_document_request) =
  assoc_to_yojson
    [
      ("Content", Some (document_content_to_yojson x.content));
      ("Requires", option_to_yojson document_requires_list_to_yojson x.requires);
      ("Attachments", option_to_yojson attachments_source_list_to_yojson x.attachments);
      ("Name", Some (document_name_to_yojson x.name));
      ("DisplayName", option_to_yojson document_display_name_to_yojson x.display_name);
      ("VersionName", option_to_yojson document_version_name_to_yojson x.version_name);
      ("DocumentType", option_to_yojson document_type_to_yojson x.document_type);
      ("DocumentFormat", option_to_yojson document_format_to_yojson x.document_format);
      ("TargetType", option_to_yojson target_type_to_yojson x.target_type);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let association_limit_exceeded_to_yojson = unit_to_yojson

let fault_to_yojson (x : fault) =
  match x with
  | Client -> `String "Client"
  | Server -> `String "Server"
  | Unknown -> `String "Unknown"

let batch_error_message_to_yojson = string_to_yojson

let create_association_batch_request_entry_to_yojson (x : create_association_batch_request_entry) =
  assoc_to_yojson
    [
      ("Name", Some (document_ar_n_to_yojson x.name));
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("Parameters", option_to_yojson parameters_to_yojson x.parameters);
      ( "AutomationTargetParameterName",
        option_to_yojson automation_target_parameter_name_to_yojson
          x.automation_target_parameter_name );
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("ScheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ( "OutputLocation",
        option_to_yojson instance_association_output_location_to_yojson x.output_location );
      ("AssociationName", option_to_yojson association_name_to_yojson x.association_name);
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ( "ComplianceSeverity",
        option_to_yojson association_compliance_severity_to_yojson x.compliance_severity );
      ("SyncCompliance", option_to_yojson association_sync_compliance_to_yojson x.sync_compliance);
      ( "ApplyOnlyAtCronInterval",
        option_to_yojson apply_only_at_cron_interval_to_yojson x.apply_only_at_cron_interval );
      ("CalendarNames", option_to_yojson calendar_name_or_arn_list_to_yojson x.calendar_names);
      ("TargetLocations", option_to_yojson target_locations_to_yojson x.target_locations);
      ("ScheduleOffset", option_to_yojson schedule_offset_to_yojson x.schedule_offset);
      ("Duration", option_to_yojson duration_to_yojson x.duration);
      ("TargetMaps", option_to_yojson target_maps_to_yojson x.target_maps);
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
    ]

let failed_create_association_to_yojson (x : failed_create_association) =
  assoc_to_yojson
    [
      ("Entry", option_to_yojson create_association_batch_request_entry_to_yojson x.entry);
      ("Message", option_to_yojson batch_error_message_to_yojson x.message);
      ("Fault", option_to_yojson fault_to_yojson x.fault);
    ]

let failed_create_association_list_to_yojson tree =
  list_to_yojson failed_create_association_to_yojson tree

let association_description_list_to_yojson tree =
  list_to_yojson association_description_to_yojson tree

let create_association_batch_result_to_yojson (x : create_association_batch_result) =
  assoc_to_yojson
    [
      ("Successful", option_to_yojson association_description_list_to_yojson x.successful);
      ("Failed", option_to_yojson failed_create_association_list_to_yojson x.failed);
    ]

let create_association_batch_request_entries_to_yojson tree =
  list_to_yojson create_association_batch_request_entry_to_yojson tree

let create_association_batch_request_to_yojson (x : create_association_batch_request) =
  assoc_to_yojson
    [
      ("Entries", Some (create_association_batch_request_entries_to_yojson x.entries));
      ( "AssociationDispatchAssumeRole",
        option_to_yojson association_dispatch_assume_role_arn_to_yojson
          x.association_dispatch_assume_role );
    ]

let invalid_tag_to_yojson (x : invalid_tag) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let association_already_exists_to_yojson = unit_to_yojson

let create_association_result_to_yojson (x : create_association_result) =
  assoc_to_yojson
    [
      ( "AssociationDescription",
        option_to_yojson association_description_to_yojson x.association_description );
    ]

let create_association_request_to_yojson (x : create_association_request) =
  assoc_to_yojson
    [
      ("Name", Some (document_ar_n_to_yojson x.name));
      ("DocumentVersion", option_to_yojson document_version_to_yojson x.document_version);
      ("InstanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("Parameters", option_to_yojson parameters_to_yojson x.parameters);
      ("Targets", option_to_yojson targets_to_yojson x.targets);
      ("ScheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ( "OutputLocation",
        option_to_yojson instance_association_output_location_to_yojson x.output_location );
      ("AssociationName", option_to_yojson association_name_to_yojson x.association_name);
      ( "AutomationTargetParameterName",
        option_to_yojson automation_target_parameter_name_to_yojson
          x.automation_target_parameter_name );
      ("MaxErrors", option_to_yojson max_errors_to_yojson x.max_errors);
      ("MaxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ( "ComplianceSeverity",
        option_to_yojson association_compliance_severity_to_yojson x.compliance_severity );
      ("SyncCompliance", option_to_yojson association_sync_compliance_to_yojson x.sync_compliance);
      ( "ApplyOnlyAtCronInterval",
        option_to_yojson apply_only_at_cron_interval_to_yojson x.apply_only_at_cron_interval );
      ("CalendarNames", option_to_yojson calendar_name_or_arn_list_to_yojson x.calendar_names);
      ("TargetLocations", option_to_yojson target_locations_to_yojson x.target_locations);
      ("ScheduleOffset", option_to_yojson schedule_offset_to_yojson x.schedule_offset);
      ("Duration", option_to_yojson duration_to_yojson x.duration);
      ("TargetMaps", option_to_yojson target_maps_to_yojson x.target_maps);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AlarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ( "AssociationDispatchAssumeRole",
        option_to_yojson association_dispatch_assume_role_arn_to_yojson
          x.association_dispatch_assume_role );
    ]

let create_activation_result_to_yojson (x : create_activation_result) =
  assoc_to_yojson
    [
      ("ActivationId", option_to_yojson activation_id_to_yojson x.activation_id);
      ("ActivationCode", option_to_yojson activation_code_to_yojson x.activation_code);
    ]

let registration_metadata_value_to_yojson = string_to_yojson
let registration_metadata_key_to_yojson = string_to_yojson

let registration_metadata_item_to_yojson (x : registration_metadata_item) =
  assoc_to_yojson
    [
      ("Key", Some (registration_metadata_key_to_yojson x.key));
      ("Value", Some (registration_metadata_value_to_yojson x.value));
    ]

let registration_metadata_list_to_yojson tree =
  list_to_yojson registration_metadata_item_to_yojson tree

let create_activation_request_to_yojson (x : create_activation_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson activation_description_to_yojson x.description);
      ( "DefaultInstanceName",
        option_to_yojson default_instance_name_to_yojson x.default_instance_name );
      ("IamRole", Some (iam_role_to_yojson x.iam_role));
      ("RegistrationLimit", option_to_yojson registration_limit_to_yojson x.registration_limit);
      ("ExpirationDate", option_to_yojson expiration_date_to_yojson x.expiration_date);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "RegistrationMetadata",
        option_to_yojson registration_metadata_list_to_yojson x.registration_metadata );
    ]

let cancel_maintenance_window_execution_result_to_yojson
    (x : cancel_maintenance_window_execution_result) =
  assoc_to_yojson
    [
      ( "WindowExecutionId",
        option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id );
    ]

let cancel_maintenance_window_execution_request_to_yojson
    (x : cancel_maintenance_window_execution_request) =
  assoc_to_yojson
    [
      ("WindowExecutionId", Some (maintenance_window_execution_id_to_yojson x.window_execution_id));
    ]

let cancel_command_result_to_yojson = unit_to_yojson

let cancel_command_request_to_yojson (x : cancel_command_request) =
  assoc_to_yojson
    [
      ("CommandId", Some (command_id_to_yojson x.command_id));
      ("InstanceIds", option_to_yojson instance_id_list_to_yojson x.instance_ids);
    ]

let ops_item_related_item_already_exists_exception_to_yojson
    (x : ops_item_related_item_already_exists_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ( "ResourceUri",
        option_to_yojson ops_item_related_item_association_resource_uri_to_yojson x.resource_uri );
      ("OpsItemId", option_to_yojson ops_item_id_to_yojson x.ops_item_id);
    ]

let associate_ops_item_related_item_response_to_yojson
    (x : associate_ops_item_related_item_response) =
  assoc_to_yojson
    [
      ( "AssociationId",
        option_to_yojson ops_item_related_item_association_id_to_yojson x.association_id );
    ]

let associate_ops_item_related_item_request_to_yojson (x : associate_ops_item_related_item_request)
    =
  assoc_to_yojson
    [
      ("OpsItemId", Some (ops_item_id_to_yojson x.ops_item_id));
      ("AssociationType", Some (ops_item_related_item_association_type_to_yojson x.association_type));
      ( "ResourceType",
        Some (ops_item_related_item_association_resource_type_to_yojson x.resource_type) );
      ("ResourceUri", Some (ops_item_related_item_association_resource_uri_to_yojson x.resource_uri));
    ]
