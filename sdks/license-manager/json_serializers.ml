open Smaws_Lib.Json.SerializeHelpers
open Types

let message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let usage_operation_to_yojson = string_to_yojson
let update_service_settings_response_to_yojson = unit_to_yojson
let string__to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson

let organization_configuration_to_yojson (x : organization_configuration) =
  assoc_to_yojson [ ("EnableIntegration", Some (boolean__to_yojson x.enable_integration)) ]

let box_boolean_to_yojson = bool_to_yojson
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let update_service_settings_request_to_yojson (x : update_service_settings_request) =
  assoc_to_yojson
    [
      ( "EnabledDiscoverySourceRegions",
        option_to_yojson string_list_to_yojson x.enabled_discovery_source_regions );
      ( "EnableCrossAccountsDiscovery",
        option_to_yojson box_boolean_to_yojson x.enable_cross_accounts_discovery );
      ( "OrganizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("S3BucketArn", option_to_yojson string__to_yojson x.s3_bucket_arn);
    ]

let server_internal_exception_to_yojson (x : server_internal_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let rate_limit_exceeded_exception_to_yojson (x : rate_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let invalid_parameter_value_exception_to_yojson (x : invalid_parameter_value_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let authorization_exception_to_yojson (x : authorization_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let update_license_specifications_for_resource_response_to_yojson = unit_to_yojson

let license_specification_to_yojson (x : license_specification) =
  assoc_to_yojson
    [
      ("AmiAssociationScope", option_to_yojson string__to_yojson x.ami_association_scope);
      ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn));
    ]

let license_specifications_to_yojson tree = list_to_yojson license_specification_to_yojson tree

let update_license_specifications_for_resource_request_to_yojson
    (x : update_license_specifications_for_resource_request) =
  assoc_to_yojson
    [
      ( "RemoveLicenseSpecifications",
        option_to_yojson license_specifications_to_yojson x.remove_license_specifications );
      ( "AddLicenseSpecifications",
        option_to_yojson license_specifications_to_yojson x.add_license_specifications );
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
    ]

let license_usage_exception_to_yojson (x : license_usage_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let invalid_resource_state_exception_to_yojson (x : invalid_resource_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let update_license_manager_report_generator_response_to_yojson = unit_to_yojson
let report_generator_name_to_yojson = string_to_yojson

let report_type_to_yojson (x : report_type) =
  match x with
  | LICENSE_ASSET_GROUP_USAGE_REPORT -> `String "LicenseAssetGroupUsageReport"
  | LICENSE_CONFIGURATION_USAGE_REPORT -> `String "LicenseConfigurationUsageReport"
  | LICENSE_CONFIGURATION_SUMMARY_REPORT -> `String "LicenseConfigurationSummaryReport"

let report_type_list_to_yojson tree = list_to_yojson report_type_to_yojson tree
let arn_to_yojson = string_to_yojson
let arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree
let date_time_to_yojson = timestamp_epoch_seconds_to_yojson

let report_context_to_yojson (x : report_context) =
  assoc_to_yojson
    [
      ("reportEndDate", option_to_yojson date_time_to_yojson x.report_end_date);
      ("reportStartDate", option_to_yojson date_time_to_yojson x.report_start_date);
      ("licenseAssetGroupArns", option_to_yojson arn_list_to_yojson x.license_asset_group_arns);
      ("licenseConfigurationArns", option_to_yojson arn_list_to_yojson x.license_configuration_arns);
    ]

let integer_to_yojson = int_to_yojson

let report_frequency_type_to_yojson (x : report_frequency_type) =
  match x with
  | ONE_TIME -> `String "ONE_TIME"
  | MONTH -> `String "MONTH"
  | WEEK -> `String "WEEK"
  | DAY -> `String "DAY"

let report_frequency_to_yojson (x : report_frequency) =
  assoc_to_yojson
    [
      ("period", option_to_yojson report_frequency_type_to_yojson x.period);
      ("value", option_to_yojson integer_to_yojson x.value);
    ]

let client_request_token_to_yojson = string_to_yojson

let update_license_manager_report_generator_request_to_yojson
    (x : update_license_manager_report_generator_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ClientToken", Some (client_request_token_to_yojson x.client_token));
      ("ReportFrequency", Some (report_frequency_to_yojson x.report_frequency));
      ("ReportContext", Some (report_context_to_yojson x.report_context));
      ("Type", Some (report_type_list_to_yojson x.type_));
      ("ReportGeneratorName", Some (report_generator_name_to_yojson x.report_generator_name));
      ( "LicenseManagerReportGeneratorArn",
        Some (string__to_yojson x.license_manager_report_generator_arn) );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let resource_limit_exceeded_exception_to_yojson (x : resource_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let update_license_configuration_response_to_yojson = unit_to_yojson

let license_configuration_status_to_yojson (x : license_configuration_status) =
  match x with DISABLED -> `String "DISABLED" | AVAILABLE -> `String "AVAILABLE"

let box_long_to_yojson = long_to_yojson

let product_information_filter_to_yojson (x : product_information_filter) =
  assoc_to_yojson
    [
      ( "ProductInformationFilterComparator",
        Some (string__to_yojson x.product_information_filter_comparator) );
      ( "ProductInformationFilterValue",
        option_to_yojson string_list_to_yojson x.product_information_filter_value );
      ("ProductInformationFilterName", Some (string__to_yojson x.product_information_filter_name));
    ]

let product_information_filter_list_to_yojson tree =
  list_to_yojson product_information_filter_to_yojson tree

let product_information_to_yojson (x : product_information) =
  assoc_to_yojson
    [
      ( "ProductInformationFilterList",
        Some (product_information_filter_list_to_yojson x.product_information_filter_list) );
      ("ResourceType", Some (string__to_yojson x.resource_type));
    ]

let product_information_list_to_yojson tree = list_to_yojson product_information_to_yojson tree

let update_license_configuration_request_to_yojson (x : update_license_configuration_request) =
  assoc_to_yojson
    [
      ("LicenseExpiry", option_to_yojson box_long_to_yojson x.license_expiry);
      ( "DisassociateWhenNotFound",
        option_to_yojson box_boolean_to_yojson x.disassociate_when_not_found );
      ( "ProductInformationList",
        option_to_yojson product_information_list_to_yojson x.product_information_list );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("LicenseCountHardLimit", option_to_yojson box_boolean_to_yojson x.license_count_hard_limit);
      ("LicenseCount", option_to_yojson box_long_to_yojson x.license_count);
      ("LicenseRules", option_to_yojson string_list_to_yojson x.license_rules);
      ( "LicenseConfigurationStatus",
        option_to_yojson license_configuration_status_to_yojson x.license_configuration_status );
      ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn));
    ]

let update_license_asset_ruleset_response_to_yojson (x : update_license_asset_ruleset_response) =
  assoc_to_yojson
    [ ("LicenseAssetRulesetArn", Some (string__to_yojson x.license_asset_ruleset_arn)) ]

let license_asset_resource_name_to_yojson = string_to_yojson
let license_asset_resource_description_to_yojson = string_to_yojson

let matching_rule_statement_to_yojson (x : matching_rule_statement) =
  assoc_to_yojson
    [
      ("ValueToMatch", Some (string_list_to_yojson x.value_to_match));
      ("Constraint", Some (string__to_yojson x.constraint_));
      ("KeyToMatch", Some (string__to_yojson x.key_to_match));
    ]

let matching_rule_statement_list_to_yojson tree =
  list_to_yojson matching_rule_statement_to_yojson tree

let script_rule_statement_to_yojson (x : script_rule_statement) =
  assoc_to_yojson
    [
      ("Script", Some (string__to_yojson x.script));
      ("KeyToMatch", Some (string__to_yojson x.key_to_match));
    ]

let script_rule_statement_list_to_yojson tree = list_to_yojson script_rule_statement_to_yojson tree

let and_rule_statement_to_yojson (x : and_rule_statement) =
  assoc_to_yojson
    [
      ( "ScriptRuleStatements",
        option_to_yojson script_rule_statement_list_to_yojson x.script_rule_statements );
      ( "MatchingRuleStatements",
        option_to_yojson matching_rule_statement_list_to_yojson x.matching_rule_statements );
    ]

let or_rule_statement_to_yojson (x : or_rule_statement) =
  assoc_to_yojson
    [
      ( "ScriptRuleStatements",
        option_to_yojson script_rule_statement_list_to_yojson x.script_rule_statements );
      ( "MatchingRuleStatements",
        option_to_yojson matching_rule_statement_list_to_yojson x.matching_rule_statements );
    ]

let license_configuration_rule_statement_to_yojson (x : license_configuration_rule_statement) =
  assoc_to_yojson
    [
      ( "MatchingRuleStatement",
        option_to_yojson matching_rule_statement_to_yojson x.matching_rule_statement );
      ("OrRuleStatement", option_to_yojson or_rule_statement_to_yojson x.or_rule_statement);
      ("AndRuleStatement", option_to_yojson and_rule_statement_to_yojson x.and_rule_statement);
    ]

let license_rule_statement_to_yojson (x : license_rule_statement) =
  assoc_to_yojson
    [
      ( "MatchingRuleStatement",
        option_to_yojson matching_rule_statement_to_yojson x.matching_rule_statement );
      ("OrRuleStatement", option_to_yojson or_rule_statement_to_yojson x.or_rule_statement);
      ("AndRuleStatement", option_to_yojson and_rule_statement_to_yojson x.and_rule_statement);
    ]

let instance_rule_statement_to_yojson (x : instance_rule_statement) =
  assoc_to_yojson
    [
      ( "ScriptRuleStatement",
        option_to_yojson script_rule_statement_to_yojson x.script_rule_statement );
      ( "MatchingRuleStatement",
        option_to_yojson matching_rule_statement_to_yojson x.matching_rule_statement );
      ("OrRuleStatement", option_to_yojson or_rule_statement_to_yojson x.or_rule_statement);
      ("AndRuleStatement", option_to_yojson and_rule_statement_to_yojson x.and_rule_statement);
    ]

let rule_statement_to_yojson (x : rule_statement) =
  assoc_to_yojson
    [
      ( "InstanceRuleStatement",
        option_to_yojson instance_rule_statement_to_yojson x.instance_rule_statement );
      ( "LicenseRuleStatement",
        option_to_yojson license_rule_statement_to_yojson x.license_rule_statement );
      ( "LicenseConfigurationRuleStatement",
        option_to_yojson license_configuration_rule_statement_to_yojson
          x.license_configuration_rule_statement );
    ]

let license_asset_rule_to_yojson (x : license_asset_rule) =
  assoc_to_yojson [ ("RuleStatement", Some (rule_statement_to_yojson x.rule_statement)) ]

let license_asset_rule_list_to_yojson tree = list_to_yojson license_asset_rule_to_yojson tree

let update_license_asset_ruleset_request_to_yojson (x : update_license_asset_ruleset_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (string__to_yojson x.client_token));
      ("LicenseAssetRulesetArn", Some (arn_to_yojson x.license_asset_ruleset_arn));
      ("Rules", Some (license_asset_rule_list_to_yojson x.rules));
      ("Description", option_to_yojson license_asset_resource_description_to_yojson x.description);
      ("Name", option_to_yojson license_asset_resource_name_to_yojson x.name);
    ]

let update_license_asset_group_response_to_yojson (x : update_license_asset_group_response) =
  assoc_to_yojson
    [
      ("Status", Some (string__to_yojson x.status));
      ("LicenseAssetGroupArn", Some (string__to_yojson x.license_asset_group_arn));
    ]

let license_asset_group_configuration_to_yojson (x : license_asset_group_configuration) =
  assoc_to_yojson [ ("UsageDimension", option_to_yojson string__to_yojson x.usage_dimension) ]

let license_asset_group_configuration_list_to_yojson tree =
  list_to_yojson license_asset_group_configuration_to_yojson tree

let license_asset_ruleset_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let license_asset_group_property_to_yojson (x : license_asset_group_property) =
  assoc_to_yojson
    [ ("Value", Some (string__to_yojson x.value)); ("Key", Some (string__to_yojson x.key)) ]

let license_asset_group_property_list_to_yojson tree =
  list_to_yojson license_asset_group_property_to_yojson tree

let license_asset_group_status_to_yojson (x : license_asset_group_status) =
  match x with
  | DELETED -> `String "DELETED"
  | DISABLED -> `String "DISABLED"
  | ACTIVE -> `String "ACTIVE"

let update_license_asset_group_request_to_yojson (x : update_license_asset_group_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (string__to_yojson x.client_token));
      ("Status", option_to_yojson license_asset_group_status_to_yojson x.status);
      ("LicenseAssetGroupArn", Some (arn_to_yojson x.license_asset_group_arn));
      ("Properties", option_to_yojson license_asset_group_property_list_to_yojson x.properties);
      ( "AssociatedLicenseAssetRulesetARNs",
        Some (license_asset_ruleset_arn_list_to_yojson x.associated_license_asset_ruleset_ar_ns) );
      ( "LicenseAssetGroupConfigurations",
        option_to_yojson license_asset_group_configuration_list_to_yojson
          x.license_asset_group_configurations );
      ("Description", option_to_yojson license_asset_resource_description_to_yojson x.description);
      ("Name", option_to_yojson license_asset_resource_name_to_yojson x.name);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson string__to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
    ]

let unsupported_digital_signature_method_exception_to_yojson
    (x : unsupported_digital_signature_method_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let token_type_to_yojson (x : token_type) = match x with REFRESH_TOKEN -> `String "REFRESH_TOKEN"
let token_string_to_yojson = string_to_yojson
let iso8601_date_time_to_yojson = string_to_yojson
let max_size3_string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let token_data_to_yojson (x : token_data) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson string__to_yojson x.status);
      ("RoleArns", option_to_yojson arn_list_to_yojson x.role_arns);
      ("TokenProperties", option_to_yojson max_size3_string_list_to_yojson x.token_properties);
      ("ExpirationTime", option_to_yojson iso8601_date_time_to_yojson x.expiration_time);
      ("LicenseArn", option_to_yojson string__to_yojson x.license_arn);
      ("TokenType", option_to_yojson string__to_yojson x.token_type);
      ("TokenId", option_to_yojson string__to_yojson x.token_id);
    ]

let token_list_to_yojson tree = list_to_yojson token_data_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Key", option_to_yojson string__to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
    ]

let status_reason_message_to_yojson = string_to_yojson
let signed_token_to_yojson = string_to_yojson

let cross_account_discovery_service_status_to_yojson (x : cross_account_discovery_service_status) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let region_status_to_yojson (x : region_status) =
  assoc_to_yojson [ ("Status", option_to_yojson string__to_yojson x.status) ]

let region_status_map_to_yojson tree = map_to_yojson string__to_yojson region_status_to_yojson tree

let cross_region_discovery_status_to_yojson (x : cross_region_discovery_status) =
  assoc_to_yojson [ ("Message", option_to_yojson region_status_map_to_yojson x.message) ]

let service_status_to_yojson (x : service_status) =
  assoc_to_yojson
    [
      ( "CrossRegionDiscovery",
        option_to_yojson cross_region_discovery_status_to_yojson x.cross_region_discovery );
      ( "CrossAccountDiscovery",
        option_to_yojson cross_account_discovery_service_status_to_yojson x.cross_account_discovery
      );
    ]

let s3_location_to_yojson (x : s3_location) =
  assoc_to_yojson
    [
      ("keyPrefix", option_to_yojson string__to_yojson x.key_prefix);
      ("bucket", option_to_yojson string__to_yojson x.bucket);
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | SYSTEMS_MANAGER_MANAGED_INSTANCE -> `String "SYSTEMS_MANAGER_MANAGED_INSTANCE"
  | RDS -> `String "RDS"
  | EC2_AMI -> `String "EC2_AMI"
  | EC2_HOST -> `String "EC2_HOST"
  | EC2_INSTANCE -> `String "EC2_INSTANCE"

let resource_inventory_to_yojson (x : resource_inventory) =
  assoc_to_yojson
    [
      ("InstanceType", option_to_yojson string__to_yojson x.instance_type);
      ("Region", option_to_yojson string__to_yojson x.region);
      ("HostId", option_to_yojson string__to_yojson x.host_id);
      ("AmiId", option_to_yojson string__to_yojson x.ami_id);
      ("UsageOperation", option_to_yojson string__to_yojson x.usage_operation);
      ("MarketplaceProductCodes", option_to_yojson string_list_to_yojson x.marketplace_product_codes);
      ("ResourceOwningAccountId", option_to_yojson string__to_yojson x.resource_owning_account_id);
      ("PlatformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("Platform", option_to_yojson string__to_yojson x.platform);
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson string__to_yojson x.resource_id);
    ]

let resource_inventory_list_to_yojson tree = list_to_yojson resource_inventory_to_yojson tree

let report_generator_to_yojson (x : report_generator) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CreateTime", option_to_yojson string__to_yojson x.create_time);
      ("S3Location", option_to_yojson s3_location_to_yojson x.s3_location);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ReportCreatorAccount", option_to_yojson string__to_yojson x.report_creator_account);
      ("LastReportGenerationTime", option_to_yojson string__to_yojson x.last_report_generation_time);
      ("LastRunFailureReason", option_to_yojson string__to_yojson x.last_run_failure_reason);
      ("LastRunStatus", option_to_yojson string__to_yojson x.last_run_status);
      ( "LicenseManagerReportGeneratorArn",
        option_to_yojson string__to_yojson x.license_manager_report_generator_arn );
      ("ReportFrequency", option_to_yojson report_frequency_to_yojson x.report_frequency);
      ("ReportContext", option_to_yojson report_context_to_yojson x.report_context);
      ("ReportType", option_to_yojson report_type_list_to_yojson x.report_type);
      ("ReportGeneratorName", option_to_yojson string__to_yojson x.report_generator_name);
    ]

let report_generator_list_to_yojson tree = list_to_yojson report_generator_to_yojson tree

let renew_type_to_yojson (x : renew_type) =
  match x with MONTHLY -> `String "Monthly" | WEEKLY -> `String "Weekly" | NONE -> `String "None"

let grant_status_to_yojson (x : grant_status) =
  match x with
  | WORKFLOW_COMPLETED -> `String "WORKFLOW_COMPLETED"
  | DISABLED -> `String "DISABLED"
  | PENDING_DELETE -> `String "PENDING_DELETE"
  | DELETED -> `String "DELETED"
  | FAILED_WORKFLOW -> `String "FAILED_WORKFLOW"
  | ACTIVE -> `String "ACTIVE"
  | REJECTED -> `String "REJECTED"
  | PENDING_ACCEPT -> `String "PENDING_ACCEPT"
  | PENDING_WORKFLOW -> `String "PENDING_WORKFLOW"

let reject_grant_response_to_yojson (x : reject_grant_response) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("GrantArn", option_to_yojson arn_to_yojson x.grant_arn);
    ]

let reject_grant_request_to_yojson (x : reject_grant_request) =
  assoc_to_yojson [ ("GrantArn", Some (arn_to_yojson x.grant_arn)) ]

let location_to_yojson = string_to_yojson

let redirect_exception_to_yojson (x : redirect_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Location", option_to_yojson location_to_yojson x.location);
    ]

let received_status_to_yojson (x : received_status) =
  match x with
  | WORKFLOW_COMPLETED -> `String "WORKFLOW_COMPLETED"
  | DISABLED -> `String "DISABLED"
  | DELETED -> `String "DELETED"
  | FAILED_WORKFLOW -> `String "FAILED_WORKFLOW"
  | ACTIVE -> `String "ACTIVE"
  | REJECTED -> `String "REJECTED"
  | PENDING_ACCEPT -> `String "PENDING_ACCEPT"
  | PENDING_WORKFLOW -> `String "PENDING_WORKFLOW"

let allowed_operation_to_yojson (x : allowed_operation) =
  match x with
  | CREATE_TOKEN -> `String "CreateToken"
  | LIST_PURCHASED_LICENSES -> `String "ListPurchasedLicenses"
  | EXTEND_CONSUMPTION_LICENSE -> `String "ExtendConsumptionLicense"
  | CHECK_IN_LICENSE -> `String "CheckInLicense"
  | CHECKOUT_BORROW_LICENSE -> `String "CheckoutBorrowLicense"
  | CHECKOUT_LICENSE -> `String "CheckoutLicense"
  | CREATE_GRANT -> `String "CreateGrant"

let allowed_operation_list_to_yojson tree = list_to_yojson allowed_operation_to_yojson tree

let received_metadata_to_yojson (x : received_metadata) =
  assoc_to_yojson
    [
      ("AllowedOperations", option_to_yojson allowed_operation_list_to_yojson x.allowed_operations);
      ( "ReceivedStatusReason",
        option_to_yojson status_reason_message_to_yojson x.received_status_reason );
      ("ReceivedStatus", option_to_yojson received_status_to_yojson x.received_status);
    ]

let box_integer_to_yojson = int_to_yojson

let provisional_configuration_to_yojson (x : provisional_configuration) =
  assoc_to_yojson
    [ ("MaxTimeToLiveInMinutes", Some (box_integer_to_yojson x.max_time_to_live_in_minutes)) ]

let product_code_type_to_yojson (x : product_code_type) =
  match x with MARKETPLACE -> `String "marketplace"

let product_code_id_to_yojson = string_to_yojson

let product_code_list_item_to_yojson (x : product_code_list_item) =
  assoc_to_yojson
    [
      ("ProductCodeType", Some (product_code_type_to_yojson x.product_code_type));
      ("ProductCodeId", Some (product_code_id_to_yojson x.product_code_id));
    ]

let product_code_list_to_yojson tree = list_to_yojson product_code_list_item_to_yojson tree
let principal_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let activation_override_behavior_to_yojson (x : activation_override_behavior) =
  match x with
  | ALL_GRANTS_PERMITTED_BY_ISSUER -> `String "ALL_GRANTS_PERMITTED_BY_ISSUER"
  | DISTRIBUTED_GRANTS_ONLY -> `String "DISTRIBUTED_GRANTS_ONLY"

let options_to_yojson (x : options) =
  assoc_to_yojson
    [
      ( "ActivationOverrideBehavior",
        option_to_yojson activation_override_behavior_to_yojson x.activation_override_behavior );
    ]

let no_entitlements_allowed_exception_to_yojson (x : no_entitlements_allowed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let metadata_to_yojson (x : metadata) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let metadata_list_to_yojson tree = list_to_yojson metadata_to_yojson tree
let max_size100_to_yojson = int_to_yojson

let managed_resource_summary_to_yojson (x : managed_resource_summary) =
  assoc_to_yojson
    [
      ("AssociationCount", option_to_yojson box_long_to_yojson x.association_count);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
    ]

let managed_resource_summary_list_to_yojson tree =
  list_to_yojson managed_resource_summary_to_yojson tree

let long_to_yojson = long_to_yojson

let license_configuration_usage_to_yojson (x : license_configuration_usage) =
  assoc_to_yojson
    [
      ("ConsumedLicenses", option_to_yojson box_long_to_yojson x.consumed_licenses);
      ("AssociationTime", option_to_yojson date_time_to_yojson x.association_time);
      ("ResourceOwnerId", option_to_yojson string__to_yojson x.resource_owner_id);
      ("ResourceStatus", option_to_yojson string__to_yojson x.resource_status);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
    ]

let license_configuration_usage_list_to_yojson tree =
  list_to_yojson license_configuration_usage_to_yojson tree

let list_usage_for_license_configuration_response_to_yojson
    (x : list_usage_for_license_configuration_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "LicenseConfigurationUsageList",
        option_to_yojson license_configuration_usage_list_to_yojson
          x.license_configuration_usage_list );
    ]

let filter_name_to_yojson = string_to_yojson
let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson filter_values_to_yojson x.values);
      ("Name", option_to_yojson filter_name_to_yojson x.name);
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree

let list_usage_for_license_configuration_request_to_yojson
    (x : list_usage_for_license_configuration_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn));
    ]

let filter_limit_exceeded_exception_to_yojson (x : filter_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let list_tokens_response_to_yojson (x : list_tokens_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Tokens", option_to_yojson token_list_to_yojson x.tokens);
    ]

let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree

let list_tokens_request_to_yojson (x : list_tokens_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("TokenIds", option_to_yojson string_list_to_yojson x.token_ids);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (string__to_yojson x.resource_arn)) ]

let list_resource_inventory_response_to_yojson (x : list_resource_inventory_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "ResourceInventoryList",
        option_to_yojson resource_inventory_list_to_yojson x.resource_inventory_list );
    ]

let inventory_filter_condition_to_yojson (x : inventory_filter_condition) =
  match x with
  | CONTAINS -> `String "CONTAINS"
  | BEGINS_WITH -> `String "BEGINS_WITH"
  | NOT_EQUALS -> `String "NOT_EQUALS"
  | EQUALS -> `String "EQUALS"

let inventory_filter_to_yojson (x : inventory_filter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Condition", Some (inventory_filter_condition_to_yojson x.condition));
      ("Name", Some (string__to_yojson x.name));
    ]

let inventory_filter_list_to_yojson tree = list_to_yojson inventory_filter_to_yojson tree

let list_resource_inventory_request_to_yojson (x : list_resource_inventory_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson inventory_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
    ]

let failed_dependency_exception_to_yojson (x : failed_dependency_exception) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("Message", option_to_yojson message_to_yojson x.message);
    ]

let issuer_details_to_yojson (x : issuer_details) =
  assoc_to_yojson
    [
      ("KeyFingerprint", option_to_yojson string__to_yojson x.key_fingerprint);
      ("SignKey", option_to_yojson string__to_yojson x.sign_key);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let license_status_to_yojson (x : license_status) =
  match x with
  | DELETED -> `String "DELETED"
  | PENDING_DELETE -> `String "PENDING_DELETE"
  | EXPIRED -> `String "EXPIRED"
  | SUSPENDED -> `String "SUSPENDED"
  | DEACTIVATED -> `String "DEACTIVATED"
  | PENDING_AVAILABLE -> `String "PENDING_AVAILABLE"
  | AVAILABLE -> `String "AVAILABLE"

let datetime_range_to_yojson (x : datetime_range) =
  assoc_to_yojson
    [
      ("End", option_to_yojson iso8601_date_time_to_yojson x.end_);
      ("Begin", Some (iso8601_date_time_to_yojson x.\#begin));
    ]

let entitlement_unit_to_yojson (x : entitlement_unit) =
  match x with
  | COUNT_PER_SECOND -> `String "Count/Second"
  | TERABITS_PER_SECOND -> `String "Terabits/Second"
  | GIGABITS_PER_SECOND -> `String "Gigabits/Second"
  | MEGABITS_PER_SECOND -> `String "Megabits/Second"
  | KILOBITS_PER_SECOND -> `String "Kilobits/Second"
  | BITS_PER_SECOND -> `String "Bits/Second"
  | TERABYTES_PER_SECOND -> `String "Terabytes/Second"
  | GIGABYTES_PER_SECOND -> `String "Gigabytes/Second"
  | MEGABYTES_PER_SECOND -> `String "Megabytes/Second"
  | KILOBYTES_PER_SECOND -> `String "Kilobytes/Second"
  | BYTES_PER_SECOND -> `String "Bytes/Second"
  | PERCENT -> `String "Percent"
  | TERABITS -> `String "Terabits"
  | GIGABITS -> `String "Gigabits"
  | MEGABITS -> `String "Megabits"
  | KILOBITS -> `String "Kilobits"
  | BITS -> `String "Bits"
  | TERABYTES -> `String "Terabytes"
  | GIGABYTES -> `String "Gigabytes"
  | MEGABYTES -> `String "Megabytes"
  | KILOBYTES -> `String "Kilobytes"
  | BYTES -> `String "Bytes"
  | MILLISECONDS -> `String "Milliseconds"
  | MICROSECONDS -> `String "Microseconds"
  | SECONDS -> `String "Seconds"
  | NONE -> `String "None"
  | COUNT -> `String "Count"

let entitlement_to_yojson (x : entitlement) =
  assoc_to_yojson
    [
      ("AllowCheckIn", option_to_yojson box_boolean_to_yojson x.allow_check_in);
      ("Unit", Some (entitlement_unit_to_yojson x.unit_));
      ("Overage", option_to_yojson box_boolean_to_yojson x.overage);
      ("MaxCount", option_to_yojson long_to_yojson x.max_count);
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Name", Some (string__to_yojson x.name));
    ]

let entitlement_list_to_yojson tree = list_to_yojson entitlement_to_yojson tree

let borrow_configuration_to_yojson (x : borrow_configuration) =
  assoc_to_yojson
    [
      ("MaxTimeToLiveInMinutes", Some (box_integer_to_yojson x.max_time_to_live_in_minutes));
      ("AllowEarlyCheckIn", Some (box_boolean_to_yojson x.allow_early_check_in));
    ]

let consumption_configuration_to_yojson (x : consumption_configuration) =
  assoc_to_yojson
    [
      ("BorrowConfiguration", option_to_yojson borrow_configuration_to_yojson x.borrow_configuration);
      ( "ProvisionalConfiguration",
        option_to_yojson provisional_configuration_to_yojson x.provisional_configuration );
      ("RenewType", option_to_yojson renew_type_to_yojson x.renew_type);
    ]

let granted_license_to_yojson (x : granted_license) =
  assoc_to_yojson
    [
      ("ReceivedMetadata", option_to_yojson received_metadata_to_yojson x.received_metadata);
      ("Version", option_to_yojson string__to_yojson x.version);
      ("CreateTime", option_to_yojson iso8601_date_time_to_yojson x.create_time);
      ("LicenseMetadata", option_to_yojson metadata_list_to_yojson x.license_metadata);
      ( "ConsumptionConfiguration",
        option_to_yojson consumption_configuration_to_yojson x.consumption_configuration );
      ("Entitlements", option_to_yojson entitlement_list_to_yojson x.entitlements);
      ("Beneficiary", option_to_yojson string__to_yojson x.beneficiary);
      ("Validity", option_to_yojson datetime_range_to_yojson x.validity);
      ("Status", option_to_yojson license_status_to_yojson x.status);
      ("HomeRegion", option_to_yojson string__to_yojson x.home_region);
      ("Issuer", option_to_yojson issuer_details_to_yojson x.issuer);
      ("ProductSKU", option_to_yojson string__to_yojson x.product_sk_u);
      ("ProductName", option_to_yojson string__to_yojson x.product_name);
      ("LicenseName", option_to_yojson string__to_yojson x.license_name);
      ("LicenseArn", option_to_yojson arn_to_yojson x.license_arn);
    ]

let granted_license_list_to_yojson tree = list_to_yojson granted_license_to_yojson tree

let list_received_licenses_response_to_yojson (x : list_received_licenses_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Licenses", option_to_yojson granted_license_list_to_yojson x.licenses);
    ]

let list_received_licenses_request_to_yojson (x : list_received_licenses_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("LicenseArns", option_to_yojson arn_list_to_yojson x.license_arns);
    ]

let list_received_licenses_for_organization_response_to_yojson
    (x : list_received_licenses_for_organization_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Licenses", option_to_yojson granted_license_list_to_yojson x.licenses);
    ]

let list_received_licenses_for_organization_request_to_yojson
    (x : list_received_licenses_for_organization_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let grant_to_yojson (x : grant) =
  assoc_to_yojson
    [
      ("Options", option_to_yojson options_to_yojson x.options);
      ("GrantedOperations", Some (allowed_operation_list_to_yojson x.granted_operations));
      ("Version", Some (string__to_yojson x.version));
      ("StatusReason", option_to_yojson status_reason_message_to_yojson x.status_reason);
      ("GrantStatus", Some (grant_status_to_yojson x.grant_status));
      ("HomeRegion", Some (string__to_yojson x.home_region));
      ("GranteePrincipalArn", Some (arn_to_yojson x.grantee_principal_arn));
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
      ("ParentArn", Some (arn_to_yojson x.parent_arn));
      ("GrantName", Some (string__to_yojson x.grant_name));
      ("GrantArn", Some (arn_to_yojson x.grant_arn));
    ]

let grant_list_to_yojson tree = list_to_yojson grant_to_yojson tree

let list_received_grants_response_to_yojson (x : list_received_grants_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Grants", option_to_yojson grant_list_to_yojson x.grants);
    ]

let list_received_grants_request_to_yojson (x : list_received_grants_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("GrantArns", option_to_yojson arn_list_to_yojson x.grant_arns);
    ]

let list_received_grants_for_organization_response_to_yojson
    (x : list_received_grants_for_organization_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Grants", option_to_yojson grant_list_to_yojson x.grants);
    ]

let list_received_grants_for_organization_request_to_yojson
    (x : list_received_grants_for_organization_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
    ]

let license_to_yojson (x : license) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson string__to_yojson x.version);
      ("CreateTime", option_to_yojson iso8601_date_time_to_yojson x.create_time);
      ("LicenseMetadata", option_to_yojson metadata_list_to_yojson x.license_metadata);
      ( "ConsumptionConfiguration",
        option_to_yojson consumption_configuration_to_yojson x.consumption_configuration );
      ("Entitlements", option_to_yojson entitlement_list_to_yojson x.entitlements);
      ("Beneficiary", option_to_yojson string__to_yojson x.beneficiary);
      ("Validity", option_to_yojson datetime_range_to_yojson x.validity);
      ("Status", option_to_yojson license_status_to_yojson x.status);
      ("HomeRegion", option_to_yojson string__to_yojson x.home_region);
      ("Issuer", option_to_yojson issuer_details_to_yojson x.issuer);
      ("ProductSKU", option_to_yojson string__to_yojson x.product_sk_u);
      ("ProductName", option_to_yojson string__to_yojson x.product_name);
      ("LicenseName", option_to_yojson string__to_yojson x.license_name);
      ("LicenseArn", option_to_yojson arn_to_yojson x.license_arn);
    ]

let license_list_to_yojson tree = list_to_yojson license_to_yojson tree

let list_licenses_response_to_yojson (x : list_licenses_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Licenses", option_to_yojson license_list_to_yojson x.licenses);
    ]

let list_licenses_request_to_yojson (x : list_licenses_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("LicenseArns", option_to_yojson arn_list_to_yojson x.license_arns);
    ]

let list_license_versions_response_to_yojson (x : list_license_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Licenses", option_to_yojson license_list_to_yojson x.licenses);
    ]

let list_license_versions_request_to_yojson (x : list_license_versions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
    ]

let list_license_specifications_for_resource_response_to_yojson
    (x : list_license_specifications_for_resource_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "LicenseSpecifications",
        option_to_yojson license_specifications_to_yojson x.license_specifications );
    ]

let list_license_specifications_for_resource_request_to_yojson
    (x : list_license_specifications_for_resource_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
    ]

let list_license_manager_report_generators_response_to_yojson
    (x : list_license_manager_report_generators_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ReportGenerators", option_to_yojson report_generator_list_to_yojson x.report_generators);
    ]

let list_license_manager_report_generators_request_to_yojson
    (x : list_license_manager_report_generators_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let license_conversion_task_id_to_yojson = string_to_yojson

let license_conversion_context_to_yojson (x : license_conversion_context) =
  assoc_to_yojson
    [
      ("ProductCodes", option_to_yojson product_code_list_to_yojson x.product_codes);
      ("UsageOperation", option_to_yojson usage_operation_to_yojson x.usage_operation);
    ]

let license_conversion_task_status_to_yojson (x : license_conversion_task_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let license_conversion_task_to_yojson (x : license_conversion_task) =
  assoc_to_yojson
    [
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("LicenseConversionTime", option_to_yojson date_time_to_yojson x.license_conversion_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("Status", option_to_yojson license_conversion_task_status_to_yojson x.status);
      ( "DestinationLicenseContext",
        option_to_yojson license_conversion_context_to_yojson x.destination_license_context );
      ( "SourceLicenseContext",
        option_to_yojson license_conversion_context_to_yojson x.source_license_context );
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ( "LicenseConversionTaskId",
        option_to_yojson license_conversion_task_id_to_yojson x.license_conversion_task_id );
    ]

let license_conversion_tasks_to_yojson tree = list_to_yojson license_conversion_task_to_yojson tree

let list_license_conversion_tasks_response_to_yojson (x : list_license_conversion_tasks_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "LicenseConversionTasks",
        option_to_yojson license_conversion_tasks_to_yojson x.license_conversion_tasks );
    ]

let list_license_conversion_tasks_request_to_yojson (x : list_license_conversion_tasks_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let license_counting_type_to_yojson (x : license_counting_type) =
  match x with
  | SOCKET -> `String "Socket"
  | CORE -> `String "Core"
  | INSTANCE -> `String "Instance"
  | VCPU -> `String "vCPU"

let consumed_license_summary_to_yojson (x : consumed_license_summary) =
  assoc_to_yojson
    [
      ("ConsumedLicenses", option_to_yojson box_long_to_yojson x.consumed_licenses);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
    ]

let consumed_license_summary_list_to_yojson tree =
  list_to_yojson consumed_license_summary_to_yojson tree

let automated_discovery_information_to_yojson (x : automated_discovery_information) =
  assoc_to_yojson [ ("LastRunTime", option_to_yojson date_time_to_yojson x.last_run_time) ]

let license_configuration_to_yojson (x : license_configuration) =
  assoc_to_yojson
    [
      ("LicenseExpiry", option_to_yojson box_long_to_yojson x.license_expiry);
      ( "AutomatedDiscoveryInformation",
        option_to_yojson automated_discovery_information_to_yojson x.automated_discovery_information
      );
      ( "ProductInformationList",
        option_to_yojson product_information_list_to_yojson x.product_information_list );
      ( "ManagedResourceSummaryList",
        option_to_yojson managed_resource_summary_list_to_yojson x.managed_resource_summary_list );
      ( "ConsumedLicenseSummaryList",
        option_to_yojson consumed_license_summary_list_to_yojson x.consumed_license_summary_list );
      ("OwnerAccountId", option_to_yojson string__to_yojson x.owner_account_id);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("ConsumedLicenses", option_to_yojson box_long_to_yojson x.consumed_licenses);
      ( "DisassociateWhenNotFound",
        option_to_yojson box_boolean_to_yojson x.disassociate_when_not_found );
      ("LicenseCountHardLimit", option_to_yojson box_boolean_to_yojson x.license_count_hard_limit);
      ("LicenseCount", option_to_yojson box_long_to_yojson x.license_count);
      ("LicenseRules", option_to_yojson string_list_to_yojson x.license_rules);
      ( "LicenseCountingType",
        option_to_yojson license_counting_type_to_yojson x.license_counting_type );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("LicenseConfigurationArn", option_to_yojson string__to_yojson x.license_configuration_arn);
      ("LicenseConfigurationId", option_to_yojson string__to_yojson x.license_configuration_id);
    ]

let license_configurations_to_yojson tree = list_to_yojson license_configuration_to_yojson tree

let list_license_configurations_response_to_yojson (x : list_license_configurations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "LicenseConfigurations",
        option_to_yojson license_configurations_to_yojson x.license_configurations );
    ]

let list_license_configurations_request_to_yojson (x : list_license_configurations_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ( "LicenseConfigurationArns",
        option_to_yojson string_list_to_yojson x.license_configuration_arns );
    ]

let list_license_configurations_for_organization_response_to_yojson
    (x : list_license_configurations_for_organization_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "LicenseConfigurations",
        option_to_yojson license_configurations_to_yojson x.license_configurations );
    ]

let list_license_configurations_for_organization_request_to_yojson
    (x : list_license_configurations_for_organization_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ( "LicenseConfigurationArns",
        option_to_yojson string_list_to_yojson x.license_configuration_arns );
    ]

let license_asset_ruleset_to_yojson (x : license_asset_ruleset) =
  assoc_to_yojson
    [
      ("LicenseAssetRulesetArn", Some (arn_to_yojson x.license_asset_ruleset_arn));
      ("Rules", Some (license_asset_rule_list_to_yojson x.rules));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", Some (string__to_yojson x.name));
    ]

let license_asset_ruleset_list_to_yojson tree = list_to_yojson license_asset_ruleset_to_yojson tree

let list_license_asset_rulesets_response_to_yojson (x : list_license_asset_rulesets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "LicenseAssetRulesets",
        option_to_yojson license_asset_ruleset_list_to_yojson x.license_asset_rulesets );
    ]

let list_license_asset_rulesets_request_to_yojson (x : list_license_asset_rulesets_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ( "ShowAWSManagedLicenseAssetRulesets",
        option_to_yojson boolean__to_yojson x.show_aws_managed_license_asset_rulesets );
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let license_asset_group_to_yojson (x : license_asset_group) =
  assoc_to_yojson
    [
      ( "LatestResourceDiscoveryTime",
        option_to_yojson date_time_to_yojson x.latest_resource_discovery_time );
      ("LatestUsageAnalysisTime", option_to_yojson date_time_to_yojson x.latest_usage_analysis_time);
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("Status", Some (license_asset_group_status_to_yojson x.status));
      ("LicenseAssetGroupArn", Some (arn_to_yojson x.license_asset_group_arn));
      ("Properties", option_to_yojson license_asset_group_property_list_to_yojson x.properties);
      ( "AssociatedLicenseAssetRulesetARNs",
        Some (license_asset_ruleset_arn_list_to_yojson x.associated_license_asset_ruleset_ar_ns) );
      ( "LicenseAssetGroupConfigurations",
        option_to_yojson license_asset_group_configuration_list_to_yojson
          x.license_asset_group_configurations );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", Some (string__to_yojson x.name));
    ]

let license_asset_group_list_to_yojson tree = list_to_yojson license_asset_group_to_yojson tree

let list_license_asset_groups_response_to_yojson (x : list_license_asset_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "LicenseAssetGroups",
        option_to_yojson license_asset_group_list_to_yojson x.license_asset_groups );
    ]

let list_license_asset_groups_request_to_yojson (x : list_license_asset_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let license_operation_failure_to_yojson (x : license_operation_failure) =
  assoc_to_yojson
    [
      ("MetadataList", option_to_yojson metadata_list_to_yojson x.metadata_list);
      ("OperationRequestedBy", option_to_yojson string__to_yojson x.operation_requested_by);
      ("ResourceOwnerId", option_to_yojson string__to_yojson x.resource_owner_id);
      ("OperationName", option_to_yojson string__to_yojson x.operation_name);
      ("FailureTime", option_to_yojson date_time_to_yojson x.failure_time);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
    ]

let license_operation_failure_list_to_yojson tree =
  list_to_yojson license_operation_failure_to_yojson tree

let list_failures_for_license_configuration_operations_response_to_yojson
    (x : list_failures_for_license_configuration_operations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "LicenseOperationFailureList",
        option_to_yojson license_operation_failure_list_to_yojson x.license_operation_failure_list
      );
    ]

let list_failures_for_license_configuration_operations_request_to_yojson
    (x : list_failures_for_license_configuration_operations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn));
    ]

let list_distributed_grants_response_to_yojson (x : list_distributed_grants_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Grants", option_to_yojson grant_list_to_yojson x.grants);
    ]

let list_distributed_grants_request_to_yojson (x : list_distributed_grants_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("GrantArns", option_to_yojson arn_list_to_yojson x.grant_arns);
    ]

let license_configuration_association_to_yojson (x : license_configuration_association) =
  assoc_to_yojson
    [
      ("AmiAssociationScope", option_to_yojson string__to_yojson x.ami_association_scope);
      ("AssociationTime", option_to_yojson date_time_to_yojson x.association_time);
      ("ResourceOwnerId", option_to_yojson string__to_yojson x.resource_owner_id);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
    ]

let license_configuration_associations_to_yojson tree =
  list_to_yojson license_configuration_association_to_yojson tree

let list_associations_for_license_configuration_response_to_yojson
    (x : list_associations_for_license_configuration_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "LicenseConfigurationAssociations",
        option_to_yojson license_configuration_associations_to_yojson
          x.license_configuration_associations );
    ]

let list_associations_for_license_configuration_request_to_yojson
    (x : list_associations_for_license_configuration_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn));
    ]

let asset_to_yojson (x : asset) =
  assoc_to_yojson
    [
      ( "LatestAssetDiscoveryTime",
        option_to_yojson date_time_to_yojson x.latest_asset_discovery_time );
      ("AssetArn", option_to_yojson string__to_yojson x.asset_arn);
    ]

let asset_list_to_yojson tree = list_to_yojson asset_to_yojson tree

let list_assets_for_license_asset_group_response_to_yojson
    (x : list_assets_for_license_asset_group_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Assets", option_to_yojson asset_list_to_yojson x.assets);
    ]

let list_assets_for_license_asset_group_request_to_yojson
    (x : list_assets_for_license_asset_group_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("AssetType", Some (string__to_yojson x.asset_type));
      ("LicenseAssetGroupArn", Some (string__to_yojson x.license_asset_group_arn));
    ]

let entitlement_data_unit_to_yojson (x : entitlement_data_unit) =
  match x with
  | COUNT_PER_SECOND -> `String "Count/Second"
  | TERABITS_PER_SECOND -> `String "Terabits/Second"
  | GIGABITS_PER_SECOND -> `String "Gigabits/Second"
  | MEGABITS_PER_SECOND -> `String "Megabits/Second"
  | KILOBITS_PER_SECOND -> `String "Kilobits/Second"
  | BITS_PER_SECOND -> `String "Bits/Second"
  | TERABYTES_PER_SECOND -> `String "Terabytes/Second"
  | GIGABYTES_PER_SECOND -> `String "Gigabytes/Second"
  | MEGABYTES_PER_SECOND -> `String "Megabytes/Second"
  | KILOBYTES_PER_SECOND -> `String "Kilobytes/Second"
  | BYTES_PER_SECOND -> `String "Bytes/Second"
  | PERCENT -> `String "Percent"
  | TERABITS -> `String "Terabits"
  | GIGABITS -> `String "Gigabits"
  | MEGABITS -> `String "Megabits"
  | KILOBITS -> `String "Kilobits"
  | BITS -> `String "Bits"
  | TERABYTES -> `String "Terabytes"
  | GIGABYTES -> `String "Gigabytes"
  | MEGABYTES -> `String "Megabytes"
  | KILOBYTES -> `String "Kilobytes"
  | BYTES -> `String "Bytes"
  | MILLISECONDS -> `String "Milliseconds"
  | MICROSECONDS -> `String "Microseconds"
  | SECONDS -> `String "Seconds"
  | NONE -> `String "None"
  | COUNT -> `String "Count"

let entitlement_usage_to_yojson (x : entitlement_usage) =
  assoc_to_yojson
    [
      ("Unit", Some (entitlement_data_unit_to_yojson x.unit_));
      ("MaxCount", option_to_yojson string__to_yojson x.max_count);
      ("ConsumedValue", Some (string__to_yojson x.consumed_value));
      ("Name", Some (string__to_yojson x.name));
    ]

let entitlement_usage_list_to_yojson tree = list_to_yojson entitlement_usage_to_yojson tree

let license_usage_to_yojson (x : license_usage) =
  assoc_to_yojson
    [
      ("EntitlementUsages", option_to_yojson entitlement_usage_list_to_yojson x.entitlement_usages);
    ]

let license_deletion_status_to_yojson (x : license_deletion_status) =
  match x with DELETED -> `String "DELETED" | PENDING_DELETE -> `String "PENDING_DELETE"

let issuer_to_yojson (x : issuer) =
  assoc_to_yojson
    [
      ("SignKey", option_to_yojson string__to_yojson x.sign_key);
      ("Name", Some (string__to_yojson x.name));
    ]

let get_service_settings_response_to_yojson (x : get_service_settings_response) =
  assoc_to_yojson
    [
      ("ServiceStatus", option_to_yojson service_status_to_yojson x.service_status);
      ( "CrossRegionDiscoverySourceRegions",
        option_to_yojson string_list_to_yojson x.cross_region_discovery_source_regions );
      ( "CrossRegionDiscoveryHomeRegion",
        option_to_yojson string__to_yojson x.cross_region_discovery_home_region );
      ( "LicenseManagerResourceShareArn",
        option_to_yojson string__to_yojson x.license_manager_resource_share_arn );
      ( "EnableCrossAccountsDiscovery",
        option_to_yojson box_boolean_to_yojson x.enable_cross_accounts_discovery );
      ( "OrganizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("S3BucketArn", option_to_yojson string__to_yojson x.s3_bucket_arn);
    ]

let get_service_settings_request_to_yojson = unit_to_yojson

let get_license_usage_response_to_yojson (x : get_license_usage_response) =
  assoc_to_yojson [ ("LicenseUsage", option_to_yojson license_usage_to_yojson x.license_usage) ]

let get_license_usage_request_to_yojson (x : get_license_usage_request) =
  assoc_to_yojson [ ("LicenseArn", Some (arn_to_yojson x.license_arn)) ]

let get_license_response_to_yojson (x : get_license_response) =
  assoc_to_yojson [ ("License", option_to_yojson license_to_yojson x.license) ]

let get_license_request_to_yojson (x : get_license_request) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson string__to_yojson x.version);
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
    ]

let get_license_manager_report_generator_response_to_yojson
    (x : get_license_manager_report_generator_response) =
  assoc_to_yojson
    [ ("ReportGenerator", option_to_yojson report_generator_to_yojson x.report_generator) ]

let get_license_manager_report_generator_request_to_yojson
    (x : get_license_manager_report_generator_request) =
  assoc_to_yojson
    [
      ( "LicenseManagerReportGeneratorArn",
        Some (string__to_yojson x.license_manager_report_generator_arn) );
    ]

let get_license_conversion_task_response_to_yojson (x : get_license_conversion_task_response) =
  assoc_to_yojson
    [
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("LicenseConversionTime", option_to_yojson date_time_to_yojson x.license_conversion_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("Status", option_to_yojson license_conversion_task_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ( "DestinationLicenseContext",
        option_to_yojson license_conversion_context_to_yojson x.destination_license_context );
      ( "SourceLicenseContext",
        option_to_yojson license_conversion_context_to_yojson x.source_license_context );
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ( "LicenseConversionTaskId",
        option_to_yojson license_conversion_task_id_to_yojson x.license_conversion_task_id );
    ]

let get_license_conversion_task_request_to_yojson (x : get_license_conversion_task_request) =
  assoc_to_yojson
    [
      ( "LicenseConversionTaskId",
        Some (license_conversion_task_id_to_yojson x.license_conversion_task_id) );
    ]

let get_license_configuration_response_to_yojson (x : get_license_configuration_response) =
  assoc_to_yojson
    [
      ("LicenseExpiry", option_to_yojson box_long_to_yojson x.license_expiry);
      ( "DisassociateWhenNotFound",
        option_to_yojson box_boolean_to_yojson x.disassociate_when_not_found );
      ( "AutomatedDiscoveryInformation",
        option_to_yojson automated_discovery_information_to_yojson x.automated_discovery_information
      );
      ( "ProductInformationList",
        option_to_yojson product_information_list_to_yojson x.product_information_list );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ManagedResourceSummaryList",
        option_to_yojson managed_resource_summary_list_to_yojson x.managed_resource_summary_list );
      ( "ConsumedLicenseSummaryList",
        option_to_yojson consumed_license_summary_list_to_yojson x.consumed_license_summary_list );
      ("OwnerAccountId", option_to_yojson string__to_yojson x.owner_account_id);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("ConsumedLicenses", option_to_yojson box_long_to_yojson x.consumed_licenses);
      ("LicenseCountHardLimit", option_to_yojson box_boolean_to_yojson x.license_count_hard_limit);
      ("LicenseCount", option_to_yojson box_long_to_yojson x.license_count);
      ("LicenseRules", option_to_yojson string_list_to_yojson x.license_rules);
      ( "LicenseCountingType",
        option_to_yojson license_counting_type_to_yojson x.license_counting_type );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("LicenseConfigurationArn", option_to_yojson string__to_yojson x.license_configuration_arn);
      ("LicenseConfigurationId", option_to_yojson string__to_yojson x.license_configuration_id);
    ]

let get_license_configuration_request_to_yojson (x : get_license_configuration_request) =
  assoc_to_yojson
    [ ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn)) ]

let get_license_asset_ruleset_response_to_yojson (x : get_license_asset_ruleset_response) =
  assoc_to_yojson
    [ ("LicenseAssetRuleset", Some (license_asset_ruleset_to_yojson x.license_asset_ruleset)) ]

let get_license_asset_ruleset_request_to_yojson (x : get_license_asset_ruleset_request) =
  assoc_to_yojson [ ("LicenseAssetRulesetArn", Some (arn_to_yojson x.license_asset_ruleset_arn)) ]

let get_license_asset_group_response_to_yojson (x : get_license_asset_group_response) =
  assoc_to_yojson
    [ ("LicenseAssetGroup", Some (license_asset_group_to_yojson x.license_asset_group)) ]

let get_license_asset_group_request_to_yojson (x : get_license_asset_group_request) =
  assoc_to_yojson [ ("LicenseAssetGroupArn", Some (arn_to_yojson x.license_asset_group_arn)) ]

let get_grant_response_to_yojson (x : get_grant_response) =
  assoc_to_yojson [ ("Grant", option_to_yojson grant_to_yojson x.grant) ]

let get_grant_request_to_yojson (x : get_grant_request) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson string__to_yojson x.version);
      ("GrantArn", Some (arn_to_yojson x.grant_arn));
    ]

let get_access_token_response_to_yojson (x : get_access_token_response) =
  assoc_to_yojson [ ("AccessToken", option_to_yojson token_string_to_yojson x.access_token) ]

let get_access_token_request_to_yojson (x : get_access_token_request) =
  assoc_to_yojson
    [
      ("TokenProperties", option_to_yojson max_size3_string_list_to_yojson x.token_properties);
      ("Token", Some (token_string_to_yojson x.token));
    ]

let extend_license_consumption_response_to_yojson (x : extend_license_consumption_response) =
  assoc_to_yojson
    [
      ("Expiration", option_to_yojson iso8601_date_time_to_yojson x.expiration);
      ("LicenseConsumptionToken", option_to_yojson string__to_yojson x.license_consumption_token);
    ]

let extend_license_consumption_request_to_yojson (x : extend_license_consumption_request) =
  assoc_to_yojson
    [
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ("LicenseConsumptionToken", Some (string__to_yojson x.license_consumption_token));
    ]

let entitlement_not_allowed_exception_to_yojson (x : entitlement_not_allowed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let entitlement_data_to_yojson (x : entitlement_data) =
  assoc_to_yojson
    [
      ("Unit", Some (entitlement_data_unit_to_yojson x.unit_));
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Name", Some (string__to_yojson x.name));
    ]

let entitlement_data_list_to_yojson tree = list_to_yojson entitlement_data_to_yojson tree

let digital_signature_method_to_yojson (x : digital_signature_method) =
  match x with JWT_PS384 -> `String "JWT_PS384"

let delete_token_response_to_yojson = unit_to_yojson

let delete_token_request_to_yojson (x : delete_token_request) =
  assoc_to_yojson [ ("TokenId", Some (string__to_yojson x.token_id)) ]

let delete_license_response_to_yojson (x : delete_license_response) =
  assoc_to_yojson
    [
      ("DeletionDate", option_to_yojson iso8601_date_time_to_yojson x.deletion_date);
      ("Status", option_to_yojson license_deletion_status_to_yojson x.status);
    ]

let delete_license_request_to_yojson (x : delete_license_request) =
  assoc_to_yojson
    [
      ("SourceVersion", Some (string__to_yojson x.source_version));
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
    ]

let delete_license_manager_report_generator_response_to_yojson = unit_to_yojson

let delete_license_manager_report_generator_request_to_yojson
    (x : delete_license_manager_report_generator_request) =
  assoc_to_yojson
    [
      ( "LicenseManagerReportGeneratorArn",
        Some (string__to_yojson x.license_manager_report_generator_arn) );
    ]

let delete_license_configuration_response_to_yojson = unit_to_yojson

let delete_license_configuration_request_to_yojson (x : delete_license_configuration_request) =
  assoc_to_yojson
    [ ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn)) ]

let delete_license_asset_ruleset_response_to_yojson = unit_to_yojson

let delete_license_asset_ruleset_request_to_yojson (x : delete_license_asset_ruleset_request) =
  assoc_to_yojson [ ("LicenseAssetRulesetArn", Some (arn_to_yojson x.license_asset_ruleset_arn)) ]

let delete_license_asset_group_response_to_yojson (x : delete_license_asset_group_response) =
  assoc_to_yojson [ ("Status", Some (license_asset_group_status_to_yojson x.status)) ]

let delete_license_asset_group_request_to_yojson (x : delete_license_asset_group_request) =
  assoc_to_yojson [ ("LicenseAssetGroupArn", Some (arn_to_yojson x.license_asset_group_arn)) ]

let delete_grant_response_to_yojson (x : delete_grant_response) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("GrantArn", option_to_yojson arn_to_yojson x.grant_arn);
    ]

let delete_grant_request_to_yojson (x : delete_grant_request) =
  assoc_to_yojson
    [
      ("Version", Some (string__to_yojson x.version));
      ("StatusReason", option_to_yojson status_reason_message_to_yojson x.status_reason);
      ("GrantArn", Some (arn_to_yojson x.grant_arn));
    ]

let create_token_response_to_yojson (x : create_token_response) =
  assoc_to_yojson
    [
      ("Token", option_to_yojson token_string_to_yojson x.token);
      ("TokenType", option_to_yojson token_type_to_yojson x.token_type);
      ("TokenId", option_to_yojson string__to_yojson x.token_id);
    ]

let client_token_to_yojson = string_to_yojson

let create_token_request_to_yojson (x : create_token_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("TokenProperties", option_to_yojson max_size3_string_list_to_yojson x.token_properties);
      ("ExpirationInDays", option_to_yojson integer_to_yojson x.expiration_in_days);
      ("RoleArns", option_to_yojson arn_list_to_yojson x.role_arns);
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
    ]

let create_license_version_response_to_yojson (x : create_license_version_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson license_status_to_yojson x.status);
      ("Version", option_to_yojson string__to_yojson x.version);
      ("LicenseArn", option_to_yojson arn_to_yojson x.license_arn);
    ]

let create_license_version_request_to_yojson (x : create_license_version_request) =
  assoc_to_yojson
    [
      ("SourceVersion", option_to_yojson string__to_yojson x.source_version);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Status", Some (license_status_to_yojson x.status));
      ( "ConsumptionConfiguration",
        Some (consumption_configuration_to_yojson x.consumption_configuration) );
      ("Entitlements", Some (entitlement_list_to_yojson x.entitlements));
      ("LicenseMetadata", option_to_yojson metadata_list_to_yojson x.license_metadata);
      ("Validity", Some (datetime_range_to_yojson x.validity));
      ("HomeRegion", Some (string__to_yojson x.home_region));
      ("Issuer", Some (issuer_to_yojson x.issuer));
      ("ProductName", Some (string__to_yojson x.product_name));
      ("LicenseName", Some (string__to_yojson x.license_name));
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
    ]

let create_license_response_to_yojson (x : create_license_response) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Status", option_to_yojson license_status_to_yojson x.status);
      ("LicenseArn", option_to_yojson arn_to_yojson x.license_arn);
    ]

let create_license_request_to_yojson (x : create_license_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("LicenseMetadata", option_to_yojson metadata_list_to_yojson x.license_metadata);
      ( "ConsumptionConfiguration",
        Some (consumption_configuration_to_yojson x.consumption_configuration) );
      ("Beneficiary", Some (string__to_yojson x.beneficiary));
      ("Entitlements", Some (entitlement_list_to_yojson x.entitlements));
      ("Validity", Some (datetime_range_to_yojson x.validity));
      ("HomeRegion", Some (string__to_yojson x.home_region));
      ("Issuer", Some (issuer_to_yojson x.issuer));
      ("ProductSKU", Some (string__to_yojson x.product_sk_u));
      ("ProductName", Some (string__to_yojson x.product_name));
      ("LicenseName", Some (string__to_yojson x.license_name));
    ]

let create_license_manager_report_generator_response_to_yojson
    (x : create_license_manager_report_generator_response) =
  assoc_to_yojson
    [
      ( "LicenseManagerReportGeneratorArn",
        option_to_yojson string__to_yojson x.license_manager_report_generator_arn );
    ]

let create_license_manager_report_generator_request_to_yojson
    (x : create_license_manager_report_generator_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ClientToken", Some (client_request_token_to_yojson x.client_token));
      ("ReportFrequency", Some (report_frequency_to_yojson x.report_frequency));
      ("ReportContext", Some (report_context_to_yojson x.report_context));
      ("Type", Some (report_type_list_to_yojson x.type_));
      ("ReportGeneratorName", Some (report_generator_name_to_yojson x.report_generator_name));
    ]

let create_license_conversion_task_for_resource_response_to_yojson
    (x : create_license_conversion_task_for_resource_response) =
  assoc_to_yojson
    [
      ( "LicenseConversionTaskId",
        option_to_yojson license_conversion_task_id_to_yojson x.license_conversion_task_id );
    ]

let create_license_conversion_task_for_resource_request_to_yojson
    (x : create_license_conversion_task_for_resource_request) =
  assoc_to_yojson
    [
      ( "DestinationLicenseContext",
        Some (license_conversion_context_to_yojson x.destination_license_context) );
      ("SourceLicenseContext", Some (license_conversion_context_to_yojson x.source_license_context));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let create_license_configuration_response_to_yojson (x : create_license_configuration_response) =
  assoc_to_yojson
    [ ("LicenseConfigurationArn", option_to_yojson string__to_yojson x.license_configuration_arn) ]

let create_license_configuration_request_to_yojson (x : create_license_configuration_request) =
  assoc_to_yojson
    [
      ("LicenseExpiry", option_to_yojson box_long_to_yojson x.license_expiry);
      ( "ProductInformationList",
        option_to_yojson product_information_list_to_yojson x.product_information_list );
      ( "DisassociateWhenNotFound",
        option_to_yojson box_boolean_to_yojson x.disassociate_when_not_found );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("LicenseRules", option_to_yojson string_list_to_yojson x.license_rules);
      ("LicenseCountHardLimit", option_to_yojson box_boolean_to_yojson x.license_count_hard_limit);
      ("LicenseCount", option_to_yojson box_long_to_yojson x.license_count);
      ("LicenseCountingType", Some (license_counting_type_to_yojson x.license_counting_type));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", Some (string__to_yojson x.name));
    ]

let create_license_asset_ruleset_response_to_yojson (x : create_license_asset_ruleset_response) =
  assoc_to_yojson
    [ ("LicenseAssetRulesetArn", Some (string__to_yojson x.license_asset_ruleset_arn)) ]

let create_license_asset_ruleset_request_to_yojson (x : create_license_asset_ruleset_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (string__to_yojson x.client_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Rules", Some (license_asset_rule_list_to_yojson x.rules));
      ("Description", option_to_yojson license_asset_resource_description_to_yojson x.description);
      ("Name", Some (license_asset_resource_name_to_yojson x.name));
    ]

let create_license_asset_group_response_to_yojson (x : create_license_asset_group_response) =
  assoc_to_yojson
    [
      ("Status", Some (string__to_yojson x.status));
      ("LicenseAssetGroupArn", Some (string__to_yojson x.license_asset_group_arn));
    ]

let create_license_asset_group_request_to_yojson (x : create_license_asset_group_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (string__to_yojson x.client_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Properties", option_to_yojson license_asset_group_property_list_to_yojson x.properties);
      ( "AssociatedLicenseAssetRulesetARNs",
        Some (license_asset_ruleset_arn_list_to_yojson x.associated_license_asset_ruleset_ar_ns) );
      ( "LicenseAssetGroupConfigurations",
        Some (license_asset_group_configuration_list_to_yojson x.license_asset_group_configurations)
      );
      ("Description", option_to_yojson license_asset_resource_description_to_yojson x.description);
      ("Name", Some (license_asset_resource_name_to_yojson x.name));
    ]

let create_grant_version_response_to_yojson (x : create_grant_version_response) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("GrantArn", option_to_yojson arn_to_yojson x.grant_arn);
    ]

let create_grant_version_request_to_yojson (x : create_grant_version_request) =
  assoc_to_yojson
    [
      ("Options", option_to_yojson options_to_yojson x.options);
      ("SourceVersion", option_to_yojson string__to_yojson x.source_version);
      ("StatusReason", option_to_yojson status_reason_message_to_yojson x.status_reason);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("AllowedOperations", option_to_yojson allowed_operation_list_to_yojson x.allowed_operations);
      ("GrantName", option_to_yojson string__to_yojson x.grant_name);
      ("GrantArn", Some (arn_to_yojson x.grant_arn));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
    ]

let create_grant_response_to_yojson (x : create_grant_response) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("GrantArn", option_to_yojson arn_to_yojson x.grant_arn);
    ]

let create_grant_request_to_yojson (x : create_grant_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AllowedOperations", Some (allowed_operation_list_to_yojson x.allowed_operations));
      ("HomeRegion", Some (string__to_yojson x.home_region));
      ("Principals", Some (principal_arn_list_to_yojson x.principals));
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
      ("GrantName", Some (string__to_yojson x.grant_name));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
    ]

let checkout_type_to_yojson (x : checkout_type) =
  match x with PERPETUAL -> `String "PERPETUAL" | PROVISIONAL -> `String "PROVISIONAL"

let checkout_license_response_to_yojson (x : checkout_license_response) =
  assoc_to_yojson
    [
      ("LicenseArn", option_to_yojson string__to_yojson x.license_arn);
      ("Expiration", option_to_yojson iso8601_date_time_to_yojson x.expiration);
      ("IssuedAt", option_to_yojson iso8601_date_time_to_yojson x.issued_at);
      ("NodeId", option_to_yojson string__to_yojson x.node_id);
      ("SignedToken", option_to_yojson signed_token_to_yojson x.signed_token);
      ( "EntitlementsAllowed",
        option_to_yojson entitlement_data_list_to_yojson x.entitlements_allowed );
      ("LicenseConsumptionToken", option_to_yojson string__to_yojson x.license_consumption_token);
      ("CheckoutType", option_to_yojson checkout_type_to_yojson x.checkout_type);
    ]

let checkout_license_request_to_yojson (x : checkout_license_request) =
  assoc_to_yojson
    [
      ("NodeId", option_to_yojson string__to_yojson x.node_id);
      ("Beneficiary", option_to_yojson string__to_yojson x.beneficiary);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Entitlements", Some (entitlement_data_list_to_yojson x.entitlements));
      ("KeyFingerprint", Some (string__to_yojson x.key_fingerprint));
      ("CheckoutType", Some (checkout_type_to_yojson x.checkout_type));
      ("ProductSKU", Some (string__to_yojson x.product_sk_u));
    ]

let checkout_borrow_license_response_to_yojson (x : checkout_borrow_license_response) =
  assoc_to_yojson
    [
      ("CheckoutMetadata", option_to_yojson metadata_list_to_yojson x.checkout_metadata);
      ("Expiration", option_to_yojson iso8601_date_time_to_yojson x.expiration);
      ("IssuedAt", option_to_yojson iso8601_date_time_to_yojson x.issued_at);
      ("SignedToken", option_to_yojson signed_token_to_yojson x.signed_token);
      ("NodeId", option_to_yojson string__to_yojson x.node_id);
      ( "EntitlementsAllowed",
        option_to_yojson entitlement_data_list_to_yojson x.entitlements_allowed );
      ("LicenseConsumptionToken", option_to_yojson string__to_yojson x.license_consumption_token);
      ("LicenseArn", option_to_yojson arn_to_yojson x.license_arn);
    ]

let checkout_borrow_license_request_to_yojson (x : checkout_borrow_license_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("CheckoutMetadata", option_to_yojson metadata_list_to_yojson x.checkout_metadata);
      ("NodeId", option_to_yojson string__to_yojson x.node_id);
      ( "DigitalSignatureMethod",
        Some (digital_signature_method_to_yojson x.digital_signature_method) );
      ("Entitlements", Some (entitlement_data_list_to_yojson x.entitlements));
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
    ]

let check_in_license_response_to_yojson = unit_to_yojson

let check_in_license_request_to_yojson (x : check_in_license_request) =
  assoc_to_yojson
    [
      ("Beneficiary", option_to_yojson string__to_yojson x.beneficiary);
      ("LicenseConsumptionToken", Some (string__to_yojson x.license_consumption_token));
    ]

let accept_grant_response_to_yojson (x : accept_grant_response) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("GrantArn", option_to_yojson arn_to_yojson x.grant_arn);
    ]

let accept_grant_request_to_yojson (x : accept_grant_request) =
  assoc_to_yojson [ ("GrantArn", Some (arn_to_yojson x.grant_arn)) ]
