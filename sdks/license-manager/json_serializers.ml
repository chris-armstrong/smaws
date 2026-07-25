open Smaws_Lib.Json.SerializeHelpers
open Types

let message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

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

let update_service_settings_response_to_yojson = unit_to_yojson
let string__to_yojson = string_to_yojson
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree
let box_boolean_to_yojson = bool_to_yojson
let boolean__to_yojson = bool_to_yojson

let organization_configuration_to_yojson (x : organization_configuration) =
  assoc_to_yojson [ ("EnableIntegration", Some (boolean__to_yojson x.enable_integration)) ]

let update_service_settings_request_to_yojson (x : update_service_settings_request) =
  assoc_to_yojson
    [
      ("S3BucketArn", option_to_yojson string__to_yojson x.s3_bucket_arn);
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ( "OrganizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ( "EnableCrossAccountsDiscovery",
        option_to_yojson box_boolean_to_yojson x.enable_cross_accounts_discovery );
      ( "EnabledDiscoverySourceRegions",
        option_to_yojson string_list_to_yojson x.enabled_discovery_source_regions );
    ]

let license_usage_exception_to_yojson (x : license_usage_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let invalid_resource_state_exception_to_yojson (x : invalid_resource_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let update_license_specifications_for_resource_response_to_yojson = unit_to_yojson

let license_specification_to_yojson (x : license_specification) =
  assoc_to_yojson
    [
      ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn));
      ("AmiAssociationScope", option_to_yojson string__to_yojson x.ami_association_scope);
    ]

let license_specifications_to_yojson tree = list_to_yojson license_specification_to_yojson tree

let update_license_specifications_for_resource_request_to_yojson
    (x : update_license_specifications_for_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
      ( "AddLicenseSpecifications",
        option_to_yojson license_specifications_to_yojson x.add_license_specifications );
      ( "RemoveLicenseSpecifications",
        option_to_yojson license_specifications_to_yojson x.remove_license_specifications );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let resource_limit_exceeded_exception_to_yojson (x : resource_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let update_license_manager_report_generator_response_to_yojson = unit_to_yojson
let client_request_token_to_yojson = string_to_yojson

let report_frequency_type_to_yojson (x : report_frequency_type) =
  match x with
  | DAY -> `String "DAY"
  | WEEK -> `String "WEEK"
  | MONTH -> `String "MONTH"
  | ONE_TIME -> `String "ONE_TIME"

let integer_to_yojson = int_to_yojson

let report_frequency_to_yojson (x : report_frequency) =
  assoc_to_yojson
    [
      ("value", option_to_yojson integer_to_yojson x.value);
      ("period", option_to_yojson report_frequency_type_to_yojson x.period);
    ]

let date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let arn_to_yojson = string_to_yojson
let arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let report_context_to_yojson (x : report_context) =
  assoc_to_yojson
    [
      ("licenseConfigurationArns", option_to_yojson arn_list_to_yojson x.license_configuration_arns);
      ("licenseAssetGroupArns", option_to_yojson arn_list_to_yojson x.license_asset_group_arns);
      ("reportStartDate", option_to_yojson date_time_to_yojson x.report_start_date);
      ("reportEndDate", option_to_yojson date_time_to_yojson x.report_end_date);
    ]

let report_type_to_yojson (x : report_type) =
  match x with
  | LICENSE_CONFIGURATION_SUMMARY_REPORT -> `String "LicenseConfigurationSummaryReport"
  | LICENSE_CONFIGURATION_USAGE_REPORT -> `String "LicenseConfigurationUsageReport"
  | LICENSE_ASSET_GROUP_USAGE_REPORT -> `String "LicenseAssetGroupUsageReport"

let report_type_list_to_yojson tree = list_to_yojson report_type_to_yojson tree
let report_generator_name_to_yojson = string_to_yojson

let update_license_manager_report_generator_request_to_yojson
    (x : update_license_manager_report_generator_request) =
  assoc_to_yojson
    [
      ( "LicenseManagerReportGeneratorArn",
        Some (string__to_yojson x.license_manager_report_generator_arn) );
      ("ReportGeneratorName", Some (report_generator_name_to_yojson x.report_generator_name));
      ("Type", Some (report_type_list_to_yojson x.type_));
      ("ReportContext", Some (report_context_to_yojson x.report_context));
      ("ReportFrequency", Some (report_frequency_to_yojson x.report_frequency));
      ("ClientToken", Some (client_request_token_to_yojson x.client_token));
      ("Description", option_to_yojson string__to_yojson x.description);
    ]

let update_license_configuration_response_to_yojson = unit_to_yojson
let box_long_to_yojson = long_to_yojson

let product_information_filter_to_yojson (x : product_information_filter) =
  assoc_to_yojson
    [
      ("ProductInformationFilterName", Some (string__to_yojson x.product_information_filter_name));
      ( "ProductInformationFilterValue",
        option_to_yojson string_list_to_yojson x.product_information_filter_value );
      ( "ProductInformationFilterComparator",
        Some (string__to_yojson x.product_information_filter_comparator) );
    ]

let product_information_filter_list_to_yojson tree =
  list_to_yojson product_information_filter_to_yojson tree

let product_information_to_yojson (x : product_information) =
  assoc_to_yojson
    [
      ("ResourceType", Some (string__to_yojson x.resource_type));
      ( "ProductInformationFilterList",
        Some (product_information_filter_list_to_yojson x.product_information_filter_list) );
    ]

let product_information_list_to_yojson tree = list_to_yojson product_information_to_yojson tree

let license_configuration_status_to_yojson (x : license_configuration_status) =
  match x with AVAILABLE -> `String "AVAILABLE" | DISABLED -> `String "DISABLED"

let update_license_configuration_request_to_yojson (x : update_license_configuration_request) =
  assoc_to_yojson
    [
      ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn));
      ( "LicenseConfigurationStatus",
        option_to_yojson license_configuration_status_to_yojson x.license_configuration_status );
      ("LicenseRules", option_to_yojson string_list_to_yojson x.license_rules);
      ("LicenseCount", option_to_yojson box_long_to_yojson x.license_count);
      ("LicenseCountHardLimit", option_to_yojson box_boolean_to_yojson x.license_count_hard_limit);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "ProductInformationList",
        option_to_yojson product_information_list_to_yojson x.product_information_list );
      ( "DisassociateWhenNotFound",
        option_to_yojson box_boolean_to_yojson x.disassociate_when_not_found );
      ("LicenseExpiry", option_to_yojson box_long_to_yojson x.license_expiry);
    ]

let update_license_asset_ruleset_response_to_yojson (x : update_license_asset_ruleset_response) =
  assoc_to_yojson
    [ ("LicenseAssetRulesetArn", Some (string__to_yojson x.license_asset_ruleset_arn)) ]

let script_rule_statement_to_yojson (x : script_rule_statement) =
  assoc_to_yojson
    [
      ("KeyToMatch", Some (string__to_yojson x.key_to_match));
      ("Script", Some (string__to_yojson x.script));
    ]

let matching_rule_statement_to_yojson (x : matching_rule_statement) =
  assoc_to_yojson
    [
      ("KeyToMatch", Some (string__to_yojson x.key_to_match));
      ("Constraint", Some (string__to_yojson x.constraint_));
      ("ValueToMatch", Some (string_list_to_yojson x.value_to_match));
    ]

let script_rule_statement_list_to_yojson tree = list_to_yojson script_rule_statement_to_yojson tree

let matching_rule_statement_list_to_yojson tree =
  list_to_yojson matching_rule_statement_to_yojson tree

let or_rule_statement_to_yojson (x : or_rule_statement) =
  assoc_to_yojson
    [
      ( "MatchingRuleStatements",
        option_to_yojson matching_rule_statement_list_to_yojson x.matching_rule_statements );
      ( "ScriptRuleStatements",
        option_to_yojson script_rule_statement_list_to_yojson x.script_rule_statements );
    ]

let and_rule_statement_to_yojson (x : and_rule_statement) =
  assoc_to_yojson
    [
      ( "MatchingRuleStatements",
        option_to_yojson matching_rule_statement_list_to_yojson x.matching_rule_statements );
      ( "ScriptRuleStatements",
        option_to_yojson script_rule_statement_list_to_yojson x.script_rule_statements );
    ]

let instance_rule_statement_to_yojson (x : instance_rule_statement) =
  assoc_to_yojson
    [
      ("AndRuleStatement", option_to_yojson and_rule_statement_to_yojson x.and_rule_statement);
      ("OrRuleStatement", option_to_yojson or_rule_statement_to_yojson x.or_rule_statement);
      ( "MatchingRuleStatement",
        option_to_yojson matching_rule_statement_to_yojson x.matching_rule_statement );
      ( "ScriptRuleStatement",
        option_to_yojson script_rule_statement_to_yojson x.script_rule_statement );
    ]

let license_rule_statement_to_yojson (x : license_rule_statement) =
  assoc_to_yojson
    [
      ("AndRuleStatement", option_to_yojson and_rule_statement_to_yojson x.and_rule_statement);
      ("OrRuleStatement", option_to_yojson or_rule_statement_to_yojson x.or_rule_statement);
      ( "MatchingRuleStatement",
        option_to_yojson matching_rule_statement_to_yojson x.matching_rule_statement );
    ]

let license_configuration_rule_statement_to_yojson (x : license_configuration_rule_statement) =
  assoc_to_yojson
    [
      ("AndRuleStatement", option_to_yojson and_rule_statement_to_yojson x.and_rule_statement);
      ("OrRuleStatement", option_to_yojson or_rule_statement_to_yojson x.or_rule_statement);
      ( "MatchingRuleStatement",
        option_to_yojson matching_rule_statement_to_yojson x.matching_rule_statement );
    ]

let rule_statement_to_yojson (x : rule_statement) =
  assoc_to_yojson
    [
      ( "LicenseConfigurationRuleStatement",
        option_to_yojson license_configuration_rule_statement_to_yojson
          x.license_configuration_rule_statement );
      ( "LicenseRuleStatement",
        option_to_yojson license_rule_statement_to_yojson x.license_rule_statement );
      ( "InstanceRuleStatement",
        option_to_yojson instance_rule_statement_to_yojson x.instance_rule_statement );
    ]

let license_asset_rule_to_yojson (x : license_asset_rule) =
  assoc_to_yojson [ ("RuleStatement", Some (rule_statement_to_yojson x.rule_statement)) ]

let license_asset_rule_list_to_yojson tree = list_to_yojson license_asset_rule_to_yojson tree
let license_asset_resource_description_to_yojson = string_to_yojson
let license_asset_resource_name_to_yojson = string_to_yojson

let update_license_asset_ruleset_request_to_yojson (x : update_license_asset_ruleset_request) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson license_asset_resource_name_to_yojson x.name);
      ("Description", option_to_yojson license_asset_resource_description_to_yojson x.description);
      ("Rules", Some (license_asset_rule_list_to_yojson x.rules));
      ("LicenseAssetRulesetArn", Some (arn_to_yojson x.license_asset_ruleset_arn));
      ("ClientToken", Some (string__to_yojson x.client_token));
    ]

let update_license_asset_group_response_to_yojson (x : update_license_asset_group_response) =
  assoc_to_yojson
    [
      ("LicenseAssetGroupArn", Some (string__to_yojson x.license_asset_group_arn));
      ("Status", Some (string__to_yojson x.status));
    ]

let license_asset_group_status_to_yojson (x : license_asset_group_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DISABLED -> `String "DISABLED"
  | DELETED -> `String "DELETED"

let license_asset_group_property_to_yojson (x : license_asset_group_property) =
  assoc_to_yojson
    [ ("Key", Some (string__to_yojson x.key)); ("Value", Some (string__to_yojson x.value)) ]

let license_asset_group_property_list_to_yojson tree =
  list_to_yojson license_asset_group_property_to_yojson tree

let license_asset_ruleset_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let license_asset_group_configuration_to_yojson (x : license_asset_group_configuration) =
  assoc_to_yojson [ ("UsageDimension", option_to_yojson string__to_yojson x.usage_dimension) ]

let license_asset_group_configuration_list_to_yojson tree =
  list_to_yojson license_asset_group_configuration_to_yojson tree

let update_license_asset_group_request_to_yojson (x : update_license_asset_group_request) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson license_asset_resource_name_to_yojson x.name);
      ("Description", option_to_yojson license_asset_resource_description_to_yojson x.description);
      ( "LicenseAssetGroupConfigurations",
        option_to_yojson license_asset_group_configuration_list_to_yojson
          x.license_asset_group_configurations );
      ( "AssociatedLicenseAssetRulesetARNs",
        Some (license_asset_ruleset_arn_list_to_yojson x.associated_license_asset_ruleset_ar_ns) );
      ("Properties", option_to_yojson license_asset_group_property_list_to_yojson x.properties);
      ("LicenseAssetGroupArn", Some (arn_to_yojson x.license_asset_group_arn));
      ("Status", option_to_yojson license_asset_group_status_to_yojson x.status);
      ("ClientToken", Some (string__to_yojson x.client_token));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson string__to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson string__to_yojson x.key);
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let grant_status_to_yojson (x : grant_status) =
  match x with
  | PENDING_WORKFLOW -> `String "PENDING_WORKFLOW"
  | PENDING_ACCEPT -> `String "PENDING_ACCEPT"
  | REJECTED -> `String "REJECTED"
  | ACTIVE -> `String "ACTIVE"
  | FAILED_WORKFLOW -> `String "FAILED_WORKFLOW"
  | DELETED -> `String "DELETED"
  | PENDING_DELETE -> `String "PENDING_DELETE"
  | DISABLED -> `String "DISABLED"
  | WORKFLOW_COMPLETED -> `String "WORKFLOW_COMPLETED"

let reject_grant_response_to_yojson (x : reject_grant_response) =
  assoc_to_yojson
    [
      ("GrantArn", option_to_yojson arn_to_yojson x.grant_arn);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("Version", option_to_yojson string__to_yojson x.version);
    ]

let reject_grant_request_to_yojson (x : reject_grant_request) =
  assoc_to_yojson [ ("GrantArn", Some (arn_to_yojson x.grant_arn)) ]

let filter_limit_exceeded_exception_to_yojson (x : filter_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | EC2_INSTANCE -> `String "EC2_INSTANCE"
  | EC2_HOST -> `String "EC2_HOST"
  | EC2_AMI -> `String "EC2_AMI"
  | RDS -> `String "RDS"
  | SYSTEMS_MANAGER_MANAGED_INSTANCE -> `String "SYSTEMS_MANAGER_MANAGED_INSTANCE"

let license_configuration_usage_to_yojson (x : license_configuration_usage) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceStatus", option_to_yojson string__to_yojson x.resource_status);
      ("ResourceOwnerId", option_to_yojson string__to_yojson x.resource_owner_id);
      ("AssociationTime", option_to_yojson date_time_to_yojson x.association_time);
      ("ConsumedLicenses", option_to_yojson box_long_to_yojson x.consumed_licenses);
    ]

let license_configuration_usage_list_to_yojson tree =
  list_to_yojson license_configuration_usage_to_yojson tree

let list_usage_for_license_configuration_response_to_yojson
    (x : list_usage_for_license_configuration_response) =
  assoc_to_yojson
    [
      ( "LicenseConfigurationUsageList",
        option_to_yojson license_configuration_usage_list_to_yojson
          x.license_configuration_usage_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree
let filter_name_to_yojson = string_to_yojson

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson filter_name_to_yojson x.name);
      ("Values", option_to_yojson filter_values_to_yojson x.values);
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree
let box_integer_to_yojson = int_to_yojson

let list_usage_for_license_configuration_request_to_yojson
    (x : list_usage_for_license_configuration_request) =
  assoc_to_yojson
    [
      ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn));
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let max_size3_string_list_to_yojson tree = list_to_yojson string__to_yojson tree
let iso8601_date_time_to_yojson = string_to_yojson

let token_data_to_yojson (x : token_data) =
  assoc_to_yojson
    [
      ("TokenId", option_to_yojson string__to_yojson x.token_id);
      ("TokenType", option_to_yojson string__to_yojson x.token_type);
      ("LicenseArn", option_to_yojson string__to_yojson x.license_arn);
      ("ExpirationTime", option_to_yojson iso8601_date_time_to_yojson x.expiration_time);
      ("TokenProperties", option_to_yojson max_size3_string_list_to_yojson x.token_properties);
      ("RoleArns", option_to_yojson arn_list_to_yojson x.role_arns);
      ("Status", option_to_yojson string__to_yojson x.status);
    ]

let token_list_to_yojson tree = list_to_yojson token_data_to_yojson tree

let list_tokens_response_to_yojson (x : list_tokens_response) =
  assoc_to_yojson
    [
      ("Tokens", option_to_yojson token_list_to_yojson x.tokens);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let max_size100_to_yojson = int_to_yojson
let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree

let list_tokens_request_to_yojson (x : list_tokens_request) =
  assoc_to_yojson
    [
      ("TokenIds", option_to_yojson string_list_to_yojson x.token_ids);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (string__to_yojson x.resource_arn)) ]

let failed_dependency_exception_to_yojson (x : failed_dependency_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson message_to_yojson x.message);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
    ]

let resource_inventory_to_yojson (x : resource_inventory) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson string__to_yojson x.resource_id);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ("Platform", option_to_yojson string__to_yojson x.platform);
      ("PlatformVersion", option_to_yojson string__to_yojson x.platform_version);
      ("ResourceOwningAccountId", option_to_yojson string__to_yojson x.resource_owning_account_id);
      ("MarketplaceProductCodes", option_to_yojson string_list_to_yojson x.marketplace_product_codes);
      ("UsageOperation", option_to_yojson string__to_yojson x.usage_operation);
      ("AmiId", option_to_yojson string__to_yojson x.ami_id);
      ("HostId", option_to_yojson string__to_yojson x.host_id);
      ("Region", option_to_yojson string__to_yojson x.region);
      ("InstanceType", option_to_yojson string__to_yojson x.instance_type);
    ]

let resource_inventory_list_to_yojson tree = list_to_yojson resource_inventory_to_yojson tree

let list_resource_inventory_response_to_yojson (x : list_resource_inventory_response) =
  assoc_to_yojson
    [
      ( "ResourceInventoryList",
        option_to_yojson resource_inventory_list_to_yojson x.resource_inventory_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let inventory_filter_condition_to_yojson (x : inventory_filter_condition) =
  match x with
  | EQUALS -> `String "EQUALS"
  | NOT_EQUALS -> `String "NOT_EQUALS"
  | BEGINS_WITH -> `String "BEGINS_WITH"
  | CONTAINS -> `String "CONTAINS"

let inventory_filter_to_yojson (x : inventory_filter) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Condition", Some (inventory_filter_condition_to_yojson x.condition));
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let inventory_filter_list_to_yojson tree = list_to_yojson inventory_filter_to_yojson tree

let list_resource_inventory_request_to_yojson (x : list_resource_inventory_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson inventory_filter_list_to_yojson x.filters);
    ]

let allowed_operation_to_yojson (x : allowed_operation) =
  match x with
  | CREATE_GRANT -> `String "CreateGrant"
  | CHECKOUT_LICENSE -> `String "CheckoutLicense"
  | CHECKOUT_BORROW_LICENSE -> `String "CheckoutBorrowLicense"
  | CHECK_IN_LICENSE -> `String "CheckInLicense"
  | EXTEND_CONSUMPTION_LICENSE -> `String "ExtendConsumptionLicense"
  | LIST_PURCHASED_LICENSES -> `String "ListPurchasedLicenses"
  | CREATE_TOKEN -> `String "CreateToken"

let allowed_operation_list_to_yojson tree = list_to_yojson allowed_operation_to_yojson tree
let status_reason_message_to_yojson = string_to_yojson

let received_status_to_yojson (x : received_status) =
  match x with
  | PENDING_WORKFLOW -> `String "PENDING_WORKFLOW"
  | PENDING_ACCEPT -> `String "PENDING_ACCEPT"
  | REJECTED -> `String "REJECTED"
  | ACTIVE -> `String "ACTIVE"
  | FAILED_WORKFLOW -> `String "FAILED_WORKFLOW"
  | DELETED -> `String "DELETED"
  | DISABLED -> `String "DISABLED"
  | WORKFLOW_COMPLETED -> `String "WORKFLOW_COMPLETED"

let received_metadata_to_yojson (x : received_metadata) =
  assoc_to_yojson
    [
      ("ReceivedStatus", option_to_yojson received_status_to_yojson x.received_status);
      ( "ReceivedStatusReason",
        option_to_yojson status_reason_message_to_yojson x.received_status_reason );
      ("AllowedOperations", option_to_yojson allowed_operation_list_to_yojson x.allowed_operations);
    ]

let metadata_to_yojson (x : metadata) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let metadata_list_to_yojson tree = list_to_yojson metadata_to_yojson tree

let borrow_configuration_to_yojson (x : borrow_configuration) =
  assoc_to_yojson
    [
      ("AllowEarlyCheckIn", Some (box_boolean_to_yojson x.allow_early_check_in));
      ("MaxTimeToLiveInMinutes", Some (box_integer_to_yojson x.max_time_to_live_in_minutes));
    ]

let provisional_configuration_to_yojson (x : provisional_configuration) =
  assoc_to_yojson
    [ ("MaxTimeToLiveInMinutes", Some (box_integer_to_yojson x.max_time_to_live_in_minutes)) ]

let renew_type_to_yojson (x : renew_type) =
  match x with NONE -> `String "None" | WEEKLY -> `String "Weekly" | MONTHLY -> `String "Monthly"

let consumption_configuration_to_yojson (x : consumption_configuration) =
  assoc_to_yojson
    [
      ("RenewType", option_to_yojson renew_type_to_yojson x.renew_type);
      ( "ProvisionalConfiguration",
        option_to_yojson provisional_configuration_to_yojson x.provisional_configuration );
      ("BorrowConfiguration", option_to_yojson borrow_configuration_to_yojson x.borrow_configuration);
    ]

let entitlement_unit_to_yojson (x : entitlement_unit) =
  match x with
  | COUNT -> `String "Count"
  | NONE -> `String "None"
  | SECONDS -> `String "Seconds"
  | MICROSECONDS -> `String "Microseconds"
  | MILLISECONDS -> `String "Milliseconds"
  | BYTES -> `String "Bytes"
  | KILOBYTES -> `String "Kilobytes"
  | MEGABYTES -> `String "Megabytes"
  | GIGABYTES -> `String "Gigabytes"
  | TERABYTES -> `String "Terabytes"
  | BITS -> `String "Bits"
  | KILOBITS -> `String "Kilobits"
  | MEGABITS -> `String "Megabits"
  | GIGABITS -> `String "Gigabits"
  | TERABITS -> `String "Terabits"
  | PERCENT -> `String "Percent"
  | BYTES_PER_SECOND -> `String "Bytes/Second"
  | KILOBYTES_PER_SECOND -> `String "Kilobytes/Second"
  | MEGABYTES_PER_SECOND -> `String "Megabytes/Second"
  | GIGABYTES_PER_SECOND -> `String "Gigabytes/Second"
  | TERABYTES_PER_SECOND -> `String "Terabytes/Second"
  | BITS_PER_SECOND -> `String "Bits/Second"
  | KILOBITS_PER_SECOND -> `String "Kilobits/Second"
  | MEGABITS_PER_SECOND -> `String "Megabits/Second"
  | GIGABITS_PER_SECOND -> `String "Gigabits/Second"
  | TERABITS_PER_SECOND -> `String "Terabits/Second"
  | COUNT_PER_SECOND -> `String "Count/Second"

let long_to_yojson = long_to_yojson

let entitlement_to_yojson (x : entitlement) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Value", option_to_yojson string__to_yojson x.value);
      ("MaxCount", option_to_yojson long_to_yojson x.max_count);
      ("Overage", option_to_yojson box_boolean_to_yojson x.overage);
      ("Unit", Some (entitlement_unit_to_yojson x.unit_));
      ("AllowCheckIn", option_to_yojson box_boolean_to_yojson x.allow_check_in);
    ]

let entitlement_list_to_yojson tree = list_to_yojson entitlement_to_yojson tree

let datetime_range_to_yojson (x : datetime_range) =
  assoc_to_yojson
    [
      ("Begin", Some (iso8601_date_time_to_yojson x.\#begin));
      ("End", option_to_yojson iso8601_date_time_to_yojson x.end_);
    ]

let license_status_to_yojson (x : license_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | PENDING_AVAILABLE -> `String "PENDING_AVAILABLE"
  | DEACTIVATED -> `String "DEACTIVATED"
  | SUSPENDED -> `String "SUSPENDED"
  | EXPIRED -> `String "EXPIRED"
  | PENDING_DELETE -> `String "PENDING_DELETE"
  | DELETED -> `String "DELETED"

let issuer_details_to_yojson (x : issuer_details) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("SignKey", option_to_yojson string__to_yojson x.sign_key);
      ("KeyFingerprint", option_to_yojson string__to_yojson x.key_fingerprint);
    ]

let granted_license_to_yojson (x : granted_license) =
  assoc_to_yojson
    [
      ("LicenseArn", option_to_yojson arn_to_yojson x.license_arn);
      ("LicenseName", option_to_yojson string__to_yojson x.license_name);
      ("ProductName", option_to_yojson string__to_yojson x.product_name);
      ("ProductSKU", option_to_yojson string__to_yojson x.product_sk_u);
      ("Issuer", option_to_yojson issuer_details_to_yojson x.issuer);
      ("HomeRegion", option_to_yojson string__to_yojson x.home_region);
      ("Status", option_to_yojson license_status_to_yojson x.status);
      ("Validity", option_to_yojson datetime_range_to_yojson x.validity);
      ("Beneficiary", option_to_yojson string__to_yojson x.beneficiary);
      ("Entitlements", option_to_yojson entitlement_list_to_yojson x.entitlements);
      ( "ConsumptionConfiguration",
        option_to_yojson consumption_configuration_to_yojson x.consumption_configuration );
      ("LicenseMetadata", option_to_yojson metadata_list_to_yojson x.license_metadata);
      ("CreateTime", option_to_yojson iso8601_date_time_to_yojson x.create_time);
      ("Version", option_to_yojson string__to_yojson x.version);
      ("ReceivedMetadata", option_to_yojson received_metadata_to_yojson x.received_metadata);
    ]

let granted_license_list_to_yojson tree = list_to_yojson granted_license_to_yojson tree

let list_received_licenses_for_organization_response_to_yojson
    (x : list_received_licenses_for_organization_response) =
  assoc_to_yojson
    [
      ("Licenses", option_to_yojson granted_license_list_to_yojson x.licenses);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_received_licenses_for_organization_request_to_yojson
    (x : list_received_licenses_for_organization_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
    ]

let list_received_licenses_response_to_yojson (x : list_received_licenses_response) =
  assoc_to_yojson
    [
      ("Licenses", option_to_yojson granted_license_list_to_yojson x.licenses);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_received_licenses_request_to_yojson (x : list_received_licenses_request) =
  assoc_to_yojson
    [
      ("LicenseArns", option_to_yojson arn_list_to_yojson x.license_arns);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
    ]

let activation_override_behavior_to_yojson (x : activation_override_behavior) =
  match x with
  | DISTRIBUTED_GRANTS_ONLY -> `String "DISTRIBUTED_GRANTS_ONLY"
  | ALL_GRANTS_PERMITTED_BY_ISSUER -> `String "ALL_GRANTS_PERMITTED_BY_ISSUER"

let options_to_yojson (x : options) =
  assoc_to_yojson
    [
      ( "ActivationOverrideBehavior",
        option_to_yojson activation_override_behavior_to_yojson x.activation_override_behavior );
    ]

let grant_to_yojson (x : grant) =
  assoc_to_yojson
    [
      ("GrantArn", Some (arn_to_yojson x.grant_arn));
      ("GrantName", Some (string__to_yojson x.grant_name));
      ("ParentArn", Some (arn_to_yojson x.parent_arn));
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
      ("GranteePrincipalArn", Some (arn_to_yojson x.grantee_principal_arn));
      ("HomeRegion", Some (string__to_yojson x.home_region));
      ("GrantStatus", Some (grant_status_to_yojson x.grant_status));
      ("StatusReason", option_to_yojson status_reason_message_to_yojson x.status_reason);
      ("Version", Some (string__to_yojson x.version));
      ("GrantedOperations", Some (allowed_operation_list_to_yojson x.granted_operations));
      ("Options", option_to_yojson options_to_yojson x.options);
    ]

let grant_list_to_yojson tree = list_to_yojson grant_to_yojson tree

let list_received_grants_for_organization_response_to_yojson
    (x : list_received_grants_for_organization_response) =
  assoc_to_yojson
    [
      ("Grants", option_to_yojson grant_list_to_yojson x.grants);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_received_grants_for_organization_request_to_yojson
    (x : list_received_grants_for_organization_request) =
  assoc_to_yojson
    [
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
    ]

let list_received_grants_response_to_yojson (x : list_received_grants_response) =
  assoc_to_yojson
    [
      ("Grants", option_to_yojson grant_list_to_yojson x.grants);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_received_grants_request_to_yojson (x : list_received_grants_request) =
  assoc_to_yojson
    [
      ("GrantArns", option_to_yojson arn_list_to_yojson x.grant_arns);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
    ]

let license_to_yojson (x : license) =
  assoc_to_yojson
    [
      ("LicenseArn", option_to_yojson arn_to_yojson x.license_arn);
      ("LicenseName", option_to_yojson string__to_yojson x.license_name);
      ("ProductName", option_to_yojson string__to_yojson x.product_name);
      ("ProductSKU", option_to_yojson string__to_yojson x.product_sk_u);
      ("Issuer", option_to_yojson issuer_details_to_yojson x.issuer);
      ("HomeRegion", option_to_yojson string__to_yojson x.home_region);
      ("Status", option_to_yojson license_status_to_yojson x.status);
      ("Validity", option_to_yojson datetime_range_to_yojson x.validity);
      ("Beneficiary", option_to_yojson string__to_yojson x.beneficiary);
      ("Entitlements", option_to_yojson entitlement_list_to_yojson x.entitlements);
      ( "ConsumptionConfiguration",
        option_to_yojson consumption_configuration_to_yojson x.consumption_configuration );
      ("LicenseMetadata", option_to_yojson metadata_list_to_yojson x.license_metadata);
      ("CreateTime", option_to_yojson iso8601_date_time_to_yojson x.create_time);
      ("Version", option_to_yojson string__to_yojson x.version);
    ]

let license_list_to_yojson tree = list_to_yojson license_to_yojson tree

let list_license_versions_response_to_yojson (x : list_license_versions_response) =
  assoc_to_yojson
    [
      ("Licenses", option_to_yojson license_list_to_yojson x.licenses);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_license_versions_request_to_yojson (x : list_license_versions_request) =
  assoc_to_yojson
    [
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
    ]

let list_license_specifications_for_resource_response_to_yojson
    (x : list_license_specifications_for_resource_response) =
  assoc_to_yojson
    [
      ( "LicenseSpecifications",
        option_to_yojson license_specifications_to_yojson x.license_specifications );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_license_specifications_for_resource_request_to_yojson
    (x : list_license_specifications_for_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_licenses_response_to_yojson (x : list_licenses_response) =
  assoc_to_yojson
    [
      ("Licenses", option_to_yojson license_list_to_yojson x.licenses);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_licenses_request_to_yojson (x : list_licenses_request) =
  assoc_to_yojson
    [
      ("LicenseArns", option_to_yojson arn_list_to_yojson x.license_arns);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
    ]

let s3_location_to_yojson (x : s3_location) =
  assoc_to_yojson
    [
      ("bucket", option_to_yojson string__to_yojson x.bucket);
      ("keyPrefix", option_to_yojson string__to_yojson x.key_prefix);
    ]

let report_generator_to_yojson (x : report_generator) =
  assoc_to_yojson
    [
      ("ReportGeneratorName", option_to_yojson string__to_yojson x.report_generator_name);
      ("ReportType", option_to_yojson report_type_list_to_yojson x.report_type);
      ("ReportContext", option_to_yojson report_context_to_yojson x.report_context);
      ("ReportFrequency", option_to_yojson report_frequency_to_yojson x.report_frequency);
      ( "LicenseManagerReportGeneratorArn",
        option_to_yojson string__to_yojson x.license_manager_report_generator_arn );
      ("LastRunStatus", option_to_yojson string__to_yojson x.last_run_status);
      ("LastRunFailureReason", option_to_yojson string__to_yojson x.last_run_failure_reason);
      ("LastReportGenerationTime", option_to_yojson string__to_yojson x.last_report_generation_time);
      ("ReportCreatorAccount", option_to_yojson string__to_yojson x.report_creator_account);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("S3Location", option_to_yojson s3_location_to_yojson x.s3_location);
      ("CreateTime", option_to_yojson string__to_yojson x.create_time);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let report_generator_list_to_yojson tree = list_to_yojson report_generator_to_yojson tree

let list_license_manager_report_generators_response_to_yojson
    (x : list_license_manager_report_generators_response) =
  assoc_to_yojson
    [
      ("ReportGenerators", option_to_yojson report_generator_list_to_yojson x.report_generators);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_license_manager_report_generators_request_to_yojson
    (x : list_license_manager_report_generators_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
    ]

let license_conversion_task_status_to_yojson (x : license_conversion_task_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let product_code_type_to_yojson (x : product_code_type) =
  match x with MARKETPLACE -> `String "marketplace"

let product_code_id_to_yojson = string_to_yojson

let product_code_list_item_to_yojson (x : product_code_list_item) =
  assoc_to_yojson
    [
      ("ProductCodeId", Some (product_code_id_to_yojson x.product_code_id));
      ("ProductCodeType", Some (product_code_type_to_yojson x.product_code_type));
    ]

let product_code_list_to_yojson tree = list_to_yojson product_code_list_item_to_yojson tree
let usage_operation_to_yojson = string_to_yojson

let license_conversion_context_to_yojson (x : license_conversion_context) =
  assoc_to_yojson
    [
      ("UsageOperation", option_to_yojson usage_operation_to_yojson x.usage_operation);
      ("ProductCodes", option_to_yojson product_code_list_to_yojson x.product_codes);
    ]

let license_conversion_task_id_to_yojson = string_to_yojson

let license_conversion_task_to_yojson (x : license_conversion_task) =
  assoc_to_yojson
    [
      ( "LicenseConversionTaskId",
        option_to_yojson license_conversion_task_id_to_yojson x.license_conversion_task_id );
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ( "SourceLicenseContext",
        option_to_yojson license_conversion_context_to_yojson x.source_license_context );
      ( "DestinationLicenseContext",
        option_to_yojson license_conversion_context_to_yojson x.destination_license_context );
      ("Status", option_to_yojson license_conversion_task_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("LicenseConversionTime", option_to_yojson date_time_to_yojson x.license_conversion_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
    ]

let license_conversion_tasks_to_yojson tree = list_to_yojson license_conversion_task_to_yojson tree

let list_license_conversion_tasks_response_to_yojson (x : list_license_conversion_tasks_response) =
  assoc_to_yojson
    [
      ( "LicenseConversionTasks",
        option_to_yojson license_conversion_tasks_to_yojson x.license_conversion_tasks );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_license_conversion_tasks_request_to_yojson (x : list_license_conversion_tasks_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let automated_discovery_information_to_yojson (x : automated_discovery_information) =
  assoc_to_yojson [ ("LastRunTime", option_to_yojson date_time_to_yojson x.last_run_time) ]

let managed_resource_summary_to_yojson (x : managed_resource_summary) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("AssociationCount", option_to_yojson box_long_to_yojson x.association_count);
    ]

let managed_resource_summary_list_to_yojson tree =
  list_to_yojson managed_resource_summary_to_yojson tree

let consumed_license_summary_to_yojson (x : consumed_license_summary) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ConsumedLicenses", option_to_yojson box_long_to_yojson x.consumed_licenses);
    ]

let consumed_license_summary_list_to_yojson tree =
  list_to_yojson consumed_license_summary_to_yojson tree

let license_counting_type_to_yojson (x : license_counting_type) =
  match x with
  | VCPU -> `String "vCPU"
  | INSTANCE -> `String "Instance"
  | CORE -> `String "Core"
  | SOCKET -> `String "Socket"

let license_configuration_to_yojson (x : license_configuration) =
  assoc_to_yojson
    [
      ("LicenseConfigurationId", option_to_yojson string__to_yojson x.license_configuration_id);
      ("LicenseConfigurationArn", option_to_yojson string__to_yojson x.license_configuration_arn);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "LicenseCountingType",
        option_to_yojson license_counting_type_to_yojson x.license_counting_type );
      ("LicenseRules", option_to_yojson string_list_to_yojson x.license_rules);
      ("LicenseCount", option_to_yojson box_long_to_yojson x.license_count);
      ("LicenseCountHardLimit", option_to_yojson box_boolean_to_yojson x.license_count_hard_limit);
      ( "DisassociateWhenNotFound",
        option_to_yojson box_boolean_to_yojson x.disassociate_when_not_found );
      ("ConsumedLicenses", option_to_yojson box_long_to_yojson x.consumed_licenses);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("OwnerAccountId", option_to_yojson string__to_yojson x.owner_account_id);
      ( "ConsumedLicenseSummaryList",
        option_to_yojson consumed_license_summary_list_to_yojson x.consumed_license_summary_list );
      ( "ManagedResourceSummaryList",
        option_to_yojson managed_resource_summary_list_to_yojson x.managed_resource_summary_list );
      ( "ProductInformationList",
        option_to_yojson product_information_list_to_yojson x.product_information_list );
      ( "AutomatedDiscoveryInformation",
        option_to_yojson automated_discovery_information_to_yojson x.automated_discovery_information
      );
      ("LicenseExpiry", option_to_yojson box_long_to_yojson x.license_expiry);
    ]

let license_configurations_to_yojson tree = list_to_yojson license_configuration_to_yojson tree

let list_license_configurations_for_organization_response_to_yojson
    (x : list_license_configurations_for_organization_response) =
  assoc_to_yojson
    [
      ( "LicenseConfigurations",
        option_to_yojson license_configurations_to_yojson x.license_configurations );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_license_configurations_for_organization_request_to_yojson
    (x : list_license_configurations_for_organization_request) =
  assoc_to_yojson
    [
      ( "LicenseConfigurationArns",
        option_to_yojson string_list_to_yojson x.license_configuration_arns );
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let list_license_configurations_response_to_yojson (x : list_license_configurations_response) =
  assoc_to_yojson
    [
      ( "LicenseConfigurations",
        option_to_yojson license_configurations_to_yojson x.license_configurations );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_license_configurations_request_to_yojson (x : list_license_configurations_request) =
  assoc_to_yojson
    [
      ( "LicenseConfigurationArns",
        option_to_yojson string_list_to_yojson x.license_configuration_arns );
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let license_asset_ruleset_to_yojson (x : license_asset_ruleset) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Rules", Some (license_asset_rule_list_to_yojson x.rules));
      ("LicenseAssetRulesetArn", Some (arn_to_yojson x.license_asset_ruleset_arn));
    ]

let license_asset_ruleset_list_to_yojson tree = list_to_yojson license_asset_ruleset_to_yojson tree

let list_license_asset_rulesets_response_to_yojson (x : list_license_asset_rulesets_response) =
  assoc_to_yojson
    [
      ( "LicenseAssetRulesets",
        option_to_yojson license_asset_ruleset_list_to_yojson x.license_asset_rulesets );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_license_asset_rulesets_request_to_yojson (x : list_license_asset_rulesets_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ( "ShowAWSManagedLicenseAssetRulesets",
        option_to_yojson boolean__to_yojson x.show_aws_managed_license_asset_rulesets );
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let license_asset_group_to_yojson (x : license_asset_group) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "LicenseAssetGroupConfigurations",
        option_to_yojson license_asset_group_configuration_list_to_yojson
          x.license_asset_group_configurations );
      ( "AssociatedLicenseAssetRulesetARNs",
        Some (license_asset_ruleset_arn_list_to_yojson x.associated_license_asset_ruleset_ar_ns) );
      ("Properties", option_to_yojson license_asset_group_property_list_to_yojson x.properties);
      ("LicenseAssetGroupArn", Some (arn_to_yojson x.license_asset_group_arn));
      ("Status", Some (license_asset_group_status_to_yojson x.status));
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("LatestUsageAnalysisTime", option_to_yojson date_time_to_yojson x.latest_usage_analysis_time);
      ( "LatestResourceDiscoveryTime",
        option_to_yojson date_time_to_yojson x.latest_resource_discovery_time );
    ]

let license_asset_group_list_to_yojson tree = list_to_yojson license_asset_group_to_yojson tree

let list_license_asset_groups_response_to_yojson (x : list_license_asset_groups_response) =
  assoc_to_yojson
    [
      ( "LicenseAssetGroups",
        option_to_yojson license_asset_group_list_to_yojson x.license_asset_groups );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_license_asset_groups_request_to_yojson (x : list_license_asset_groups_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let license_operation_failure_to_yojson (x : license_operation_failure) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("FailureTime", option_to_yojson date_time_to_yojson x.failure_time);
      ("OperationName", option_to_yojson string__to_yojson x.operation_name);
      ("ResourceOwnerId", option_to_yojson string__to_yojson x.resource_owner_id);
      ("OperationRequestedBy", option_to_yojson string__to_yojson x.operation_requested_by);
      ("MetadataList", option_to_yojson metadata_list_to_yojson x.metadata_list);
    ]

let license_operation_failure_list_to_yojson tree =
  list_to_yojson license_operation_failure_to_yojson tree

let list_failures_for_license_configuration_operations_response_to_yojson
    (x : list_failures_for_license_configuration_operations_response) =
  assoc_to_yojson
    [
      ( "LicenseOperationFailureList",
        option_to_yojson license_operation_failure_list_to_yojson x.license_operation_failure_list
      );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_failures_for_license_configuration_operations_request_to_yojson
    (x : list_failures_for_license_configuration_operations_request) =
  assoc_to_yojson
    [
      ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn));
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_distributed_grants_response_to_yojson (x : list_distributed_grants_response) =
  assoc_to_yojson
    [
      ("Grants", option_to_yojson grant_list_to_yojson x.grants);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_distributed_grants_request_to_yojson (x : list_distributed_grants_request) =
  assoc_to_yojson
    [
      ("GrantArns", option_to_yojson arn_list_to_yojson x.grant_arns);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_size100_to_yojson x.max_results);
    ]

let license_configuration_association_to_yojson (x : license_configuration_association) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceOwnerId", option_to_yojson string__to_yojson x.resource_owner_id);
      ("AssociationTime", option_to_yojson date_time_to_yojson x.association_time);
      ("AmiAssociationScope", option_to_yojson string__to_yojson x.ami_association_scope);
    ]

let license_configuration_associations_to_yojson tree =
  list_to_yojson license_configuration_association_to_yojson tree

let list_associations_for_license_configuration_response_to_yojson
    (x : list_associations_for_license_configuration_response) =
  assoc_to_yojson
    [
      ( "LicenseConfigurationAssociations",
        option_to_yojson license_configuration_associations_to_yojson
          x.license_configuration_associations );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_associations_for_license_configuration_request_to_yojson
    (x : list_associations_for_license_configuration_request) =
  assoc_to_yojson
    [
      ("LicenseConfigurationArn", Some (string__to_yojson x.license_configuration_arn));
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let asset_to_yojson (x : asset) =
  assoc_to_yojson
    [
      ("AssetArn", option_to_yojson string__to_yojson x.asset_arn);
      ( "LatestAssetDiscoveryTime",
        option_to_yojson date_time_to_yojson x.latest_asset_discovery_time );
    ]

let asset_list_to_yojson tree = list_to_yojson asset_to_yojson tree

let list_assets_for_license_asset_group_response_to_yojson
    (x : list_assets_for_license_asset_group_response) =
  assoc_to_yojson
    [
      ("Assets", option_to_yojson asset_list_to_yojson x.assets);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_assets_for_license_asset_group_request_to_yojson
    (x : list_assets_for_license_asset_group_request) =
  assoc_to_yojson
    [
      ("LicenseAssetGroupArn", Some (string__to_yojson x.license_asset_group_arn));
      ("AssetType", Some (string__to_yojson x.asset_type));
      ("MaxResults", option_to_yojson box_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let region_status_to_yojson (x : region_status) =
  assoc_to_yojson [ ("Status", option_to_yojson string__to_yojson x.status) ]

let region_status_map_to_yojson tree = map_to_yojson string__to_yojson region_status_to_yojson tree

let cross_region_discovery_status_to_yojson (x : cross_region_discovery_status) =
  assoc_to_yojson [ ("Message", option_to_yojson region_status_map_to_yojson x.message) ]

let cross_account_discovery_service_status_to_yojson (x : cross_account_discovery_service_status) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let service_status_to_yojson (x : service_status) =
  assoc_to_yojson
    [
      ( "CrossAccountDiscovery",
        option_to_yojson cross_account_discovery_service_status_to_yojson x.cross_account_discovery
      );
      ( "CrossRegionDiscovery",
        option_to_yojson cross_region_discovery_status_to_yojson x.cross_region_discovery );
    ]

let get_service_settings_response_to_yojson (x : get_service_settings_response) =
  assoc_to_yojson
    [
      ("S3BucketArn", option_to_yojson string__to_yojson x.s3_bucket_arn);
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ( "OrganizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ( "EnableCrossAccountsDiscovery",
        option_to_yojson box_boolean_to_yojson x.enable_cross_accounts_discovery );
      ( "LicenseManagerResourceShareArn",
        option_to_yojson string__to_yojson x.license_manager_resource_share_arn );
      ( "CrossRegionDiscoveryHomeRegion",
        option_to_yojson string__to_yojson x.cross_region_discovery_home_region );
      ( "CrossRegionDiscoverySourceRegions",
        option_to_yojson string_list_to_yojson x.cross_region_discovery_source_regions );
      ("ServiceStatus", option_to_yojson service_status_to_yojson x.service_status);
    ]

let get_service_settings_request_to_yojson = unit_to_yojson

let entitlement_data_unit_to_yojson (x : entitlement_data_unit) =
  match x with
  | COUNT -> `String "Count"
  | NONE -> `String "None"
  | SECONDS -> `String "Seconds"
  | MICROSECONDS -> `String "Microseconds"
  | MILLISECONDS -> `String "Milliseconds"
  | BYTES -> `String "Bytes"
  | KILOBYTES -> `String "Kilobytes"
  | MEGABYTES -> `String "Megabytes"
  | GIGABYTES -> `String "Gigabytes"
  | TERABYTES -> `String "Terabytes"
  | BITS -> `String "Bits"
  | KILOBITS -> `String "Kilobits"
  | MEGABITS -> `String "Megabits"
  | GIGABITS -> `String "Gigabits"
  | TERABITS -> `String "Terabits"
  | PERCENT -> `String "Percent"
  | BYTES_PER_SECOND -> `String "Bytes/Second"
  | KILOBYTES_PER_SECOND -> `String "Kilobytes/Second"
  | MEGABYTES_PER_SECOND -> `String "Megabytes/Second"
  | GIGABYTES_PER_SECOND -> `String "Gigabytes/Second"
  | TERABYTES_PER_SECOND -> `String "Terabytes/Second"
  | BITS_PER_SECOND -> `String "Bits/Second"
  | KILOBITS_PER_SECOND -> `String "Kilobits/Second"
  | MEGABITS_PER_SECOND -> `String "Megabits/Second"
  | GIGABITS_PER_SECOND -> `String "Gigabits/Second"
  | TERABITS_PER_SECOND -> `String "Terabits/Second"
  | COUNT_PER_SECOND -> `String "Count/Second"

let entitlement_usage_to_yojson (x : entitlement_usage) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("ConsumedValue", Some (string__to_yojson x.consumed_value));
      ("MaxCount", option_to_yojson string__to_yojson x.max_count);
      ("Unit", Some (entitlement_data_unit_to_yojson x.unit_));
    ]

let entitlement_usage_list_to_yojson tree = list_to_yojson entitlement_usage_to_yojson tree

let license_usage_to_yojson (x : license_usage) =
  assoc_to_yojson
    [
      ("EntitlementUsages", option_to_yojson entitlement_usage_list_to_yojson x.entitlement_usages);
    ]

let get_license_usage_response_to_yojson (x : get_license_usage_response) =
  assoc_to_yojson [ ("LicenseUsage", option_to_yojson license_usage_to_yojson x.license_usage) ]

let get_license_usage_request_to_yojson (x : get_license_usage_request) =
  assoc_to_yojson [ ("LicenseArn", Some (arn_to_yojson x.license_arn)) ]

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
      ( "LicenseConversionTaskId",
        option_to_yojson license_conversion_task_id_to_yojson x.license_conversion_task_id );
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ( "SourceLicenseContext",
        option_to_yojson license_conversion_context_to_yojson x.source_license_context );
      ( "DestinationLicenseContext",
        option_to_yojson license_conversion_context_to_yojson x.destination_license_context );
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("Status", option_to_yojson license_conversion_task_status_to_yojson x.status);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("LicenseConversionTime", option_to_yojson date_time_to_yojson x.license_conversion_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
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
      ("LicenseConfigurationId", option_to_yojson string__to_yojson x.license_configuration_id);
      ("LicenseConfigurationArn", option_to_yojson string__to_yojson x.license_configuration_arn);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "LicenseCountingType",
        option_to_yojson license_counting_type_to_yojson x.license_counting_type );
      ("LicenseRules", option_to_yojson string_list_to_yojson x.license_rules);
      ("LicenseCount", option_to_yojson box_long_to_yojson x.license_count);
      ("LicenseCountHardLimit", option_to_yojson box_boolean_to_yojson x.license_count_hard_limit);
      ("ConsumedLicenses", option_to_yojson box_long_to_yojson x.consumed_licenses);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("OwnerAccountId", option_to_yojson string__to_yojson x.owner_account_id);
      ( "ConsumedLicenseSummaryList",
        option_to_yojson consumed_license_summary_list_to_yojson x.consumed_license_summary_list );
      ( "ManagedResourceSummaryList",
        option_to_yojson managed_resource_summary_list_to_yojson x.managed_resource_summary_list );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ProductInformationList",
        option_to_yojson product_information_list_to_yojson x.product_information_list );
      ( "AutomatedDiscoveryInformation",
        option_to_yojson automated_discovery_information_to_yojson x.automated_discovery_information
      );
      ( "DisassociateWhenNotFound",
        option_to_yojson box_boolean_to_yojson x.disassociate_when_not_found );
      ("LicenseExpiry", option_to_yojson box_long_to_yojson x.license_expiry);
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

let get_license_response_to_yojson (x : get_license_response) =
  assoc_to_yojson [ ("License", option_to_yojson license_to_yojson x.license) ]

let get_license_request_to_yojson (x : get_license_request) =
  assoc_to_yojson
    [
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
      ("Version", option_to_yojson string__to_yojson x.version);
    ]

let get_grant_response_to_yojson (x : get_grant_response) =
  assoc_to_yojson [ ("Grant", option_to_yojson grant_to_yojson x.grant) ]

let get_grant_request_to_yojson (x : get_grant_request) =
  assoc_to_yojson
    [
      ("GrantArn", Some (arn_to_yojson x.grant_arn));
      ("Version", option_to_yojson string__to_yojson x.version);
    ]

let token_string_to_yojson = string_to_yojson

let get_access_token_response_to_yojson (x : get_access_token_response) =
  assoc_to_yojson [ ("AccessToken", option_to_yojson token_string_to_yojson x.access_token) ]

let get_access_token_request_to_yojson (x : get_access_token_request) =
  assoc_to_yojson
    [
      ("Token", Some (token_string_to_yojson x.token));
      ("TokenProperties", option_to_yojson max_size3_string_list_to_yojson x.token_properties);
    ]

let extend_license_consumption_response_to_yojson (x : extend_license_consumption_response) =
  assoc_to_yojson
    [
      ("LicenseConsumptionToken", option_to_yojson string__to_yojson x.license_consumption_token);
      ("Expiration", option_to_yojson iso8601_date_time_to_yojson x.expiration);
    ]

let extend_license_consumption_request_to_yojson (x : extend_license_consumption_request) =
  assoc_to_yojson
    [
      ("LicenseConsumptionToken", Some (string__to_yojson x.license_consumption_token));
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
    ]

let location_to_yojson = string_to_yojson

let redirect_exception_to_yojson (x : redirect_exception) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson location_to_yojson x.location);
      ("Message", option_to_yojson message_to_yojson x.message);
    ]

let delete_token_response_to_yojson = unit_to_yojson

let delete_token_request_to_yojson (x : delete_token_request) =
  assoc_to_yojson [ ("TokenId", Some (string__to_yojson x.token_id)) ]

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

let license_deletion_status_to_yojson (x : license_deletion_status) =
  match x with PENDING_DELETE -> `String "PENDING_DELETE" | DELETED -> `String "DELETED"

let delete_license_response_to_yojson (x : delete_license_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson license_deletion_status_to_yojson x.status);
      ("DeletionDate", option_to_yojson iso8601_date_time_to_yojson x.deletion_date);
    ]

let delete_license_request_to_yojson (x : delete_license_request) =
  assoc_to_yojson
    [
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
      ("SourceVersion", Some (string__to_yojson x.source_version));
    ]

let delete_grant_response_to_yojson (x : delete_grant_response) =
  assoc_to_yojson
    [
      ("GrantArn", option_to_yojson arn_to_yojson x.grant_arn);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("Version", option_to_yojson string__to_yojson x.version);
    ]

let delete_grant_request_to_yojson (x : delete_grant_request) =
  assoc_to_yojson
    [
      ("GrantArn", Some (arn_to_yojson x.grant_arn));
      ("StatusReason", option_to_yojson status_reason_message_to_yojson x.status_reason);
      ("Version", Some (string__to_yojson x.version));
    ]

let token_type_to_yojson (x : token_type) = match x with REFRESH_TOKEN -> `String "REFRESH_TOKEN"

let create_token_response_to_yojson (x : create_token_response) =
  assoc_to_yojson
    [
      ("TokenId", option_to_yojson string__to_yojson x.token_id);
      ("TokenType", option_to_yojson token_type_to_yojson x.token_type);
      ("Token", option_to_yojson token_string_to_yojson x.token);
    ]

let client_token_to_yojson = string_to_yojson

let create_token_request_to_yojson (x : create_token_request) =
  assoc_to_yojson
    [
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
      ("RoleArns", option_to_yojson arn_list_to_yojson x.role_arns);
      ("ExpirationInDays", option_to_yojson integer_to_yojson x.expiration_in_days);
      ("TokenProperties", option_to_yojson max_size3_string_list_to_yojson x.token_properties);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
    ]

let create_license_version_response_to_yojson (x : create_license_version_response) =
  assoc_to_yojson
    [
      ("LicenseArn", option_to_yojson arn_to_yojson x.license_arn);
      ("Version", option_to_yojson string__to_yojson x.version);
      ("Status", option_to_yojson license_status_to_yojson x.status);
    ]

let issuer_to_yojson (x : issuer) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("SignKey", option_to_yojson string__to_yojson x.sign_key);
    ]

let create_license_version_request_to_yojson (x : create_license_version_request) =
  assoc_to_yojson
    [
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
      ("LicenseName", Some (string__to_yojson x.license_name));
      ("ProductName", Some (string__to_yojson x.product_name));
      ("Issuer", Some (issuer_to_yojson x.issuer));
      ("HomeRegion", Some (string__to_yojson x.home_region));
      ("Validity", Some (datetime_range_to_yojson x.validity));
      ("LicenseMetadata", option_to_yojson metadata_list_to_yojson x.license_metadata);
      ("Entitlements", Some (entitlement_list_to_yojson x.entitlements));
      ( "ConsumptionConfiguration",
        Some (consumption_configuration_to_yojson x.consumption_configuration) );
      ("Status", Some (license_status_to_yojson x.status));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("SourceVersion", option_to_yojson string__to_yojson x.source_version);
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
      ("ReportGeneratorName", Some (report_generator_name_to_yojson x.report_generator_name));
      ("Type", Some (report_type_list_to_yojson x.type_));
      ("ReportContext", Some (report_context_to_yojson x.report_context));
      ("ReportFrequency", Some (report_frequency_to_yojson x.report_frequency));
      ("ClientToken", Some (client_request_token_to_yojson x.client_token));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
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
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("SourceLicenseContext", Some (license_conversion_context_to_yojson x.source_license_context));
      ( "DestinationLicenseContext",
        Some (license_conversion_context_to_yojson x.destination_license_context) );
    ]

let create_license_configuration_response_to_yojson (x : create_license_configuration_response) =
  assoc_to_yojson
    [ ("LicenseConfigurationArn", option_to_yojson string__to_yojson x.license_configuration_arn) ]

let create_license_configuration_request_to_yojson (x : create_license_configuration_request) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("LicenseCountingType", Some (license_counting_type_to_yojson x.license_counting_type));
      ("LicenseCount", option_to_yojson box_long_to_yojson x.license_count);
      ("LicenseCountHardLimit", option_to_yojson box_boolean_to_yojson x.license_count_hard_limit);
      ("LicenseRules", option_to_yojson string_list_to_yojson x.license_rules);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DisassociateWhenNotFound",
        option_to_yojson box_boolean_to_yojson x.disassociate_when_not_found );
      ( "ProductInformationList",
        option_to_yojson product_information_list_to_yojson x.product_information_list );
      ("LicenseExpiry", option_to_yojson box_long_to_yojson x.license_expiry);
    ]

let create_license_asset_ruleset_response_to_yojson (x : create_license_asset_ruleset_response) =
  assoc_to_yojson
    [ ("LicenseAssetRulesetArn", Some (string__to_yojson x.license_asset_ruleset_arn)) ]

let create_license_asset_ruleset_request_to_yojson (x : create_license_asset_ruleset_request) =
  assoc_to_yojson
    [
      ("Name", Some (license_asset_resource_name_to_yojson x.name));
      ("Description", option_to_yojson license_asset_resource_description_to_yojson x.description);
      ("Rules", Some (license_asset_rule_list_to_yojson x.rules));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ClientToken", Some (string__to_yojson x.client_token));
    ]

let create_license_asset_group_response_to_yojson (x : create_license_asset_group_response) =
  assoc_to_yojson
    [
      ("LicenseAssetGroupArn", Some (string__to_yojson x.license_asset_group_arn));
      ("Status", Some (string__to_yojson x.status));
    ]

let create_license_asset_group_request_to_yojson (x : create_license_asset_group_request) =
  assoc_to_yojson
    [
      ("Name", Some (license_asset_resource_name_to_yojson x.name));
      ("Description", option_to_yojson license_asset_resource_description_to_yojson x.description);
      ( "LicenseAssetGroupConfigurations",
        Some (license_asset_group_configuration_list_to_yojson x.license_asset_group_configurations)
      );
      ( "AssociatedLicenseAssetRulesetARNs",
        Some (license_asset_ruleset_arn_list_to_yojson x.associated_license_asset_ruleset_ar_ns) );
      ("Properties", option_to_yojson license_asset_group_property_list_to_yojson x.properties);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ClientToken", Some (string__to_yojson x.client_token));
    ]

let create_license_response_to_yojson (x : create_license_response) =
  assoc_to_yojson
    [
      ("LicenseArn", option_to_yojson arn_to_yojson x.license_arn);
      ("Status", option_to_yojson license_status_to_yojson x.status);
      ("Version", option_to_yojson string__to_yojson x.version);
    ]

let create_license_request_to_yojson (x : create_license_request) =
  assoc_to_yojson
    [
      ("LicenseName", Some (string__to_yojson x.license_name));
      ("ProductName", Some (string__to_yojson x.product_name));
      ("ProductSKU", Some (string__to_yojson x.product_sk_u));
      ("Issuer", Some (issuer_to_yojson x.issuer));
      ("HomeRegion", Some (string__to_yojson x.home_region));
      ("Validity", Some (datetime_range_to_yojson x.validity));
      ("Entitlements", Some (entitlement_list_to_yojson x.entitlements));
      ("Beneficiary", Some (string__to_yojson x.beneficiary));
      ( "ConsumptionConfiguration",
        Some (consumption_configuration_to_yojson x.consumption_configuration) );
      ("LicenseMetadata", option_to_yojson metadata_list_to_yojson x.license_metadata);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_grant_version_response_to_yojson (x : create_grant_version_response) =
  assoc_to_yojson
    [
      ("GrantArn", option_to_yojson arn_to_yojson x.grant_arn);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("Version", option_to_yojson string__to_yojson x.version);
    ]

let create_grant_version_request_to_yojson (x : create_grant_version_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("GrantArn", Some (arn_to_yojson x.grant_arn));
      ("GrantName", option_to_yojson string__to_yojson x.grant_name);
      ("AllowedOperations", option_to_yojson allowed_operation_list_to_yojson x.allowed_operations);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("StatusReason", option_to_yojson status_reason_message_to_yojson x.status_reason);
      ("SourceVersion", option_to_yojson string__to_yojson x.source_version);
      ("Options", option_to_yojson options_to_yojson x.options);
    ]

let create_grant_response_to_yojson (x : create_grant_response) =
  assoc_to_yojson
    [
      ("GrantArn", option_to_yojson arn_to_yojson x.grant_arn);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("Version", option_to_yojson string__to_yojson x.version);
    ]

let principal_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let create_grant_request_to_yojson (x : create_grant_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("GrantName", Some (string__to_yojson x.grant_name));
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
      ("Principals", Some (principal_arn_list_to_yojson x.principals));
      ("HomeRegion", Some (string__to_yojson x.home_region));
      ("AllowedOperations", Some (allowed_operation_list_to_yojson x.allowed_operations));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let unsupported_digital_signature_method_exception_to_yojson
    (x : unsupported_digital_signature_method_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let no_entitlements_allowed_exception_to_yojson (x : no_entitlements_allowed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let signed_token_to_yojson = string_to_yojson

let entitlement_data_to_yojson (x : entitlement_data) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Unit", Some (entitlement_data_unit_to_yojson x.unit_));
    ]

let entitlement_data_list_to_yojson tree = list_to_yojson entitlement_data_to_yojson tree

let checkout_type_to_yojson (x : checkout_type) =
  match x with PROVISIONAL -> `String "PROVISIONAL" | PERPETUAL -> `String "PERPETUAL"

let checkout_license_response_to_yojson (x : checkout_license_response) =
  assoc_to_yojson
    [
      ("CheckoutType", option_to_yojson checkout_type_to_yojson x.checkout_type);
      ("LicenseConsumptionToken", option_to_yojson string__to_yojson x.license_consumption_token);
      ( "EntitlementsAllowed",
        option_to_yojson entitlement_data_list_to_yojson x.entitlements_allowed );
      ("SignedToken", option_to_yojson signed_token_to_yojson x.signed_token);
      ("NodeId", option_to_yojson string__to_yojson x.node_id);
      ("IssuedAt", option_to_yojson iso8601_date_time_to_yojson x.issued_at);
      ("Expiration", option_to_yojson iso8601_date_time_to_yojson x.expiration);
      ("LicenseArn", option_to_yojson string__to_yojson x.license_arn);
    ]

let checkout_license_request_to_yojson (x : checkout_license_request) =
  assoc_to_yojson
    [
      ("ProductSKU", Some (string__to_yojson x.product_sk_u));
      ("CheckoutType", Some (checkout_type_to_yojson x.checkout_type));
      ("KeyFingerprint", Some (string__to_yojson x.key_fingerprint));
      ("Entitlements", Some (entitlement_data_list_to_yojson x.entitlements));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Beneficiary", option_to_yojson string__to_yojson x.beneficiary);
      ("NodeId", option_to_yojson string__to_yojson x.node_id);
    ]

let entitlement_not_allowed_exception_to_yojson (x : entitlement_not_allowed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let checkout_borrow_license_response_to_yojson (x : checkout_borrow_license_response) =
  assoc_to_yojson
    [
      ("LicenseArn", option_to_yojson arn_to_yojson x.license_arn);
      ("LicenseConsumptionToken", option_to_yojson string__to_yojson x.license_consumption_token);
      ( "EntitlementsAllowed",
        option_to_yojson entitlement_data_list_to_yojson x.entitlements_allowed );
      ("NodeId", option_to_yojson string__to_yojson x.node_id);
      ("SignedToken", option_to_yojson signed_token_to_yojson x.signed_token);
      ("IssuedAt", option_to_yojson iso8601_date_time_to_yojson x.issued_at);
      ("Expiration", option_to_yojson iso8601_date_time_to_yojson x.expiration);
      ("CheckoutMetadata", option_to_yojson metadata_list_to_yojson x.checkout_metadata);
    ]

let digital_signature_method_to_yojson (x : digital_signature_method) =
  match x with JWT_PS384 -> `String "JWT_PS384"

let checkout_borrow_license_request_to_yojson (x : checkout_borrow_license_request) =
  assoc_to_yojson
    [
      ("LicenseArn", Some (arn_to_yojson x.license_arn));
      ("Entitlements", Some (entitlement_data_list_to_yojson x.entitlements));
      ( "DigitalSignatureMethod",
        Some (digital_signature_method_to_yojson x.digital_signature_method) );
      ("NodeId", option_to_yojson string__to_yojson x.node_id);
      ("CheckoutMetadata", option_to_yojson metadata_list_to_yojson x.checkout_metadata);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
    ]

let check_in_license_response_to_yojson = unit_to_yojson

let check_in_license_request_to_yojson (x : check_in_license_request) =
  assoc_to_yojson
    [
      ("LicenseConsumptionToken", Some (string__to_yojson x.license_consumption_token));
      ("Beneficiary", option_to_yojson string__to_yojson x.beneficiary);
    ]

let accept_grant_response_to_yojson (x : accept_grant_response) =
  assoc_to_yojson
    [
      ("GrantArn", option_to_yojson arn_to_yojson x.grant_arn);
      ("Status", option_to_yojson grant_status_to_yojson x.status);
      ("Version", option_to_yojson string__to_yojson x.version);
    ]

let accept_grant_request_to_yojson (x : accept_grant_request) =
  assoc_to_yojson [ ("GrantArn", Some (arn_to_yojson x.grant_arn)) ]
