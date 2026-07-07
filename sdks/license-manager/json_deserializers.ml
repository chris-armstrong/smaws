open Smaws_Lib.Json.DeserializeHelpers
open Types

let message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : validation_exception)

let usage_operation_of_yojson = string_of_yojson

let update_service_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let string__of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson

let organization_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ enable_integration = value_for_key boolean__of_yojson "EnableIntegration" _list path }
    : organization_configuration)

let box_boolean_of_yojson = bool_of_yojson
let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let update_service_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled_discovery_source_regions =
       option_of_yojson
         (value_for_key string_list_of_yojson "EnabledDiscoverySourceRegions")
         _list path;
     enable_cross_accounts_discovery =
       option_of_yojson
         (value_for_key box_boolean_of_yojson "EnableCrossAccountsDiscovery")
         _list path;
     organization_configuration =
       option_of_yojson
         (value_for_key organization_configuration_of_yojson "OrganizationConfiguration")
         _list path;
     sns_topic_arn = option_of_yojson (value_for_key string__of_yojson "SnsTopicArn") _list path;
     s3_bucket_arn = option_of_yojson (value_for_key string__of_yojson "S3BucketArn") _list path;
   }
    : update_service_settings_request)

let server_internal_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : server_internal_exception)

let rate_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : rate_limit_exceeded_exception)

let invalid_parameter_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : invalid_parameter_value_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : conflict_exception)

let authorization_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : authorization_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : access_denied_exception)

let update_license_specifications_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let license_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ami_association_scope =
       option_of_yojson (value_for_key string__of_yojson "AmiAssociationScope") _list path;
     license_configuration_arn =
       value_for_key string__of_yojson "LicenseConfigurationArn" _list path;
   }
    : license_specification)

let license_specifications_of_yojson tree path =
  list_of_yojson license_specification_of_yojson tree path

let update_license_specifications_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remove_license_specifications =
       option_of_yojson
         (value_for_key license_specifications_of_yojson "RemoveLicenseSpecifications")
         _list path;
     add_license_specifications =
       option_of_yojson
         (value_for_key license_specifications_of_yojson "AddLicenseSpecifications")
         _list path;
     resource_arn = value_for_key string__of_yojson "ResourceArn" _list path;
   }
    : update_license_specifications_for_resource_request)

let license_usage_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : license_usage_exception)

let invalid_resource_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : invalid_resource_state_exception)

let update_license_manager_report_generator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let report_generator_name_of_yojson = string_of_yojson

let report_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LicenseAssetGroupUsageReport" -> LICENSE_ASSET_GROUP_USAGE_REPORT
    | `String "LicenseConfigurationUsageReport" -> LICENSE_CONFIGURATION_USAGE_REPORT
    | `String "LicenseConfigurationSummaryReport" -> LICENSE_CONFIGURATION_SUMMARY_REPORT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportType")
     : report_type)
    : report_type)

let report_type_list_of_yojson tree path = list_of_yojson report_type_of_yojson tree path
let arn_of_yojson = string_of_yojson
let arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path
let date_time_of_yojson = timestamp_epoch_seconds_of_yojson

let report_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_end_date =
       option_of_yojson (value_for_key date_time_of_yojson "reportEndDate") _list path;
     report_start_date =
       option_of_yojson (value_for_key date_time_of_yojson "reportStartDate") _list path;
     license_asset_group_arns =
       option_of_yojson (value_for_key arn_list_of_yojson "licenseAssetGroupArns") _list path;
     license_configuration_arns =
       option_of_yojson (value_for_key arn_list_of_yojson "licenseConfigurationArns") _list path;
   }
    : report_context)

let integer_of_yojson = int_of_yojson

let report_frequency_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ONE_TIME" -> ONE_TIME
    | `String "MONTH" -> MONTH
    | `String "WEEK" -> WEEK
    | `String "DAY" -> DAY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportFrequencyType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportFrequencyType")
     : report_frequency_type)
    : report_frequency_type)

let report_frequency_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     period = option_of_yojson (value_for_key report_frequency_type_of_yojson "period") _list path;
     value = option_of_yojson (value_for_key integer_of_yojson "value") _list path;
   }
    : report_frequency)

let client_request_token_of_yojson = string_of_yojson

let update_license_manager_report_generator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     client_token = value_for_key client_request_token_of_yojson "ClientToken" _list path;
     report_frequency = value_for_key report_frequency_of_yojson "ReportFrequency" _list path;
     report_context = value_for_key report_context_of_yojson "ReportContext" _list path;
     type_ = value_for_key report_type_list_of_yojson "Type" _list path;
     report_generator_name =
       value_for_key report_generator_name_of_yojson "ReportGeneratorName" _list path;
     license_manager_report_generator_arn =
       value_for_key string__of_yojson "LicenseManagerReportGeneratorArn" _list path;
   }
    : update_license_manager_report_generator_request)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let resource_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : resource_limit_exceeded_exception)

let update_license_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let license_configuration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "AVAILABLE" -> AVAILABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LicenseConfigurationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseConfigurationStatus")
     : license_configuration_status)
    : license_configuration_status)

let box_long_of_yojson = long_of_yojson

let product_information_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     product_information_filter_comparator =
       value_for_key string__of_yojson "ProductInformationFilterComparator" _list path;
     product_information_filter_value =
       option_of_yojson
         (value_for_key string_list_of_yojson "ProductInformationFilterValue")
         _list path;
     product_information_filter_name =
       value_for_key string__of_yojson "ProductInformationFilterName" _list path;
   }
    : product_information_filter)

let product_information_filter_list_of_yojson tree path =
  list_of_yojson product_information_filter_of_yojson tree path

let product_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     product_information_filter_list =
       value_for_key product_information_filter_list_of_yojson "ProductInformationFilterList" _list
         path;
     resource_type = value_for_key string__of_yojson "ResourceType" _list path;
   }
    : product_information)

let product_information_list_of_yojson tree path =
  list_of_yojson product_information_of_yojson tree path

let update_license_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_expiry = option_of_yojson (value_for_key box_long_of_yojson "LicenseExpiry") _list path;
     disassociate_when_not_found =
       option_of_yojson (value_for_key box_boolean_of_yojson "DisassociateWhenNotFound") _list path;
     product_information_list =
       option_of_yojson
         (value_for_key product_information_list_of_yojson "ProductInformationList")
         _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     license_count_hard_limit =
       option_of_yojson (value_for_key box_boolean_of_yojson "LicenseCountHardLimit") _list path;
     license_count = option_of_yojson (value_for_key box_long_of_yojson "LicenseCount") _list path;
     license_rules =
       option_of_yojson (value_for_key string_list_of_yojson "LicenseRules") _list path;
     license_configuration_status =
       option_of_yojson
         (value_for_key license_configuration_status_of_yojson "LicenseConfigurationStatus")
         _list path;
     license_configuration_arn =
       value_for_key string__of_yojson "LicenseConfigurationArn" _list path;
   }
    : update_license_configuration_request)

let update_license_asset_ruleset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_asset_ruleset_arn = value_for_key string__of_yojson "LicenseAssetRulesetArn" _list path;
   }
    : update_license_asset_ruleset_response)

let license_asset_resource_name_of_yojson = string_of_yojson
let license_asset_resource_description_of_yojson = string_of_yojson

let matching_rule_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value_to_match = value_for_key string_list_of_yojson "ValueToMatch" _list path;
     constraint_ = value_for_key string__of_yojson "Constraint" _list path;
     key_to_match = value_for_key string__of_yojson "KeyToMatch" _list path;
   }
    : matching_rule_statement)

let matching_rule_statement_list_of_yojson tree path =
  list_of_yojson matching_rule_statement_of_yojson tree path

let script_rule_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     script = value_for_key string__of_yojson "Script" _list path;
     key_to_match = value_for_key string__of_yojson "KeyToMatch" _list path;
   }
    : script_rule_statement)

let script_rule_statement_list_of_yojson tree path =
  list_of_yojson script_rule_statement_of_yojson tree path

let and_rule_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     script_rule_statements =
       option_of_yojson
         (value_for_key script_rule_statement_list_of_yojson "ScriptRuleStatements")
         _list path;
     matching_rule_statements =
       option_of_yojson
         (value_for_key matching_rule_statement_list_of_yojson "MatchingRuleStatements")
         _list path;
   }
    : and_rule_statement)

let or_rule_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     script_rule_statements =
       option_of_yojson
         (value_for_key script_rule_statement_list_of_yojson "ScriptRuleStatements")
         _list path;
     matching_rule_statements =
       option_of_yojson
         (value_for_key matching_rule_statement_list_of_yojson "MatchingRuleStatements")
         _list path;
   }
    : or_rule_statement)

let license_configuration_rule_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     matching_rule_statement =
       option_of_yojson
         (value_for_key matching_rule_statement_of_yojson "MatchingRuleStatement")
         _list path;
     or_rule_statement =
       option_of_yojson (value_for_key or_rule_statement_of_yojson "OrRuleStatement") _list path;
     and_rule_statement =
       option_of_yojson (value_for_key and_rule_statement_of_yojson "AndRuleStatement") _list path;
   }
    : license_configuration_rule_statement)

let license_rule_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     matching_rule_statement =
       option_of_yojson
         (value_for_key matching_rule_statement_of_yojson "MatchingRuleStatement")
         _list path;
     or_rule_statement =
       option_of_yojson (value_for_key or_rule_statement_of_yojson "OrRuleStatement") _list path;
     and_rule_statement =
       option_of_yojson (value_for_key and_rule_statement_of_yojson "AndRuleStatement") _list path;
   }
    : license_rule_statement)

let instance_rule_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     script_rule_statement =
       option_of_yojson
         (value_for_key script_rule_statement_of_yojson "ScriptRuleStatement")
         _list path;
     matching_rule_statement =
       option_of_yojson
         (value_for_key matching_rule_statement_of_yojson "MatchingRuleStatement")
         _list path;
     or_rule_statement =
       option_of_yojson (value_for_key or_rule_statement_of_yojson "OrRuleStatement") _list path;
     and_rule_statement =
       option_of_yojson (value_for_key and_rule_statement_of_yojson "AndRuleStatement") _list path;
   }
    : instance_rule_statement)

let rule_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_rule_statement =
       option_of_yojson
         (value_for_key instance_rule_statement_of_yojson "InstanceRuleStatement")
         _list path;
     license_rule_statement =
       option_of_yojson
         (value_for_key license_rule_statement_of_yojson "LicenseRuleStatement")
         _list path;
     license_configuration_rule_statement =
       option_of_yojson
         (value_for_key license_configuration_rule_statement_of_yojson
            "LicenseConfigurationRuleStatement")
         _list path;
   }
    : rule_statement)

let license_asset_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_statement = value_for_key rule_statement_of_yojson "RuleStatement" _list path }
    : license_asset_rule)

let license_asset_rule_list_of_yojson tree path =
  list_of_yojson license_asset_rule_of_yojson tree path

let update_license_asset_ruleset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key string__of_yojson "ClientToken" _list path;
     license_asset_ruleset_arn = value_for_key arn_of_yojson "LicenseAssetRulesetArn" _list path;
     rules = value_for_key license_asset_rule_list_of_yojson "Rules" _list path;
     description =
       option_of_yojson
         (value_for_key license_asset_resource_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key license_asset_resource_name_of_yojson "Name") _list path;
   }
    : update_license_asset_ruleset_request)

let update_license_asset_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key string__of_yojson "Status" _list path;
     license_asset_group_arn = value_for_key string__of_yojson "LicenseAssetGroupArn" _list path;
   }
    : update_license_asset_group_response)

let license_asset_group_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage_dimension =
       option_of_yojson (value_for_key string__of_yojson "UsageDimension") _list path;
   }
    : license_asset_group_configuration)

let license_asset_group_configuration_list_of_yojson tree path =
  list_of_yojson license_asset_group_configuration_of_yojson tree path

let license_asset_ruleset_arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let license_asset_group_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key string__of_yojson "Value" _list path;
     key = value_for_key string__of_yojson "Key" _list path;
   }
    : license_asset_group_property)

let license_asset_group_property_list_of_yojson tree path =
  list_of_yojson license_asset_group_property_of_yojson tree path

let license_asset_group_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETED" -> DELETED
    | `String "DISABLED" -> DISABLED
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LicenseAssetGroupStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseAssetGroupStatus")
     : license_asset_group_status)
    : license_asset_group_status)

let update_license_asset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key string__of_yojson "ClientToken" _list path;
     status =
       option_of_yojson (value_for_key license_asset_group_status_of_yojson "Status") _list path;
     license_asset_group_arn = value_for_key arn_of_yojson "LicenseAssetGroupArn" _list path;
     properties =
       option_of_yojson
         (value_for_key license_asset_group_property_list_of_yojson "Properties")
         _list path;
     associated_license_asset_ruleset_ar_ns =
       value_for_key license_asset_ruleset_arn_list_of_yojson "AssociatedLicenseAssetRulesetARNs"
         _list path;
     license_asset_group_configurations =
       option_of_yojson
         (value_for_key license_asset_group_configuration_list_of_yojson
            "LicenseAssetGroupConfigurations")
         _list path;
     description =
       option_of_yojson
         (value_for_key license_asset_resource_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key license_asset_resource_name_of_yojson "Name") _list path;
   }
    : update_license_asset_group_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key string__of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let unsupported_digital_signature_method_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : unsupported_digital_signature_method_exception)

let token_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "REFRESH_TOKEN" -> REFRESH_TOKEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "TokenType" value)
    | _ -> raise (deserialize_wrong_type_error path "TokenType")
     : token_type)
    : token_type)

let token_string_of_yojson = string_of_yojson
let iso8601_date_time_of_yojson = string_of_yojson
let max_size3_string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let token_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     role_arns = option_of_yojson (value_for_key arn_list_of_yojson "RoleArns") _list path;
     token_properties =
       option_of_yojson (value_for_key max_size3_string_list_of_yojson "TokenProperties") _list path;
     expiration_time =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "ExpirationTime") _list path;
     license_arn = option_of_yojson (value_for_key string__of_yojson "LicenseArn") _list path;
     token_type = option_of_yojson (value_for_key string__of_yojson "TokenType") _list path;
     token_id = option_of_yojson (value_for_key string__of_yojson "TokenId") _list path;
   }
    : token_data)

let token_list_of_yojson tree path = list_of_yojson token_data_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_arn = value_for_key string__of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let status_reason_message_of_yojson = string_of_yojson
let signed_token_of_yojson = string_of_yojson

let cross_account_discovery_service_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : cross_account_discovery_service_status)

let region_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key string__of_yojson "Status") _list path }
    : region_status)

let region_status_map_of_yojson tree path =
  map_of_yojson string__of_yojson region_status_of_yojson tree path

let cross_region_discovery_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key region_status_map_of_yojson "Message") _list path }
    : cross_region_discovery_status)

let service_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_region_discovery =
       option_of_yojson
         (value_for_key cross_region_discovery_status_of_yojson "CrossRegionDiscovery")
         _list path;
     cross_account_discovery =
       option_of_yojson
         (value_for_key cross_account_discovery_service_status_of_yojson "CrossAccountDiscovery")
         _list path;
   }
    : service_status)

let s3_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_prefix = option_of_yojson (value_for_key string__of_yojson "keyPrefix") _list path;
     bucket = option_of_yojson (value_for_key string__of_yojson "bucket") _list path;
   }
    : s3_location)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SYSTEMS_MANAGER_MANAGED_INSTANCE" -> SYSTEMS_MANAGER_MANAGED_INSTANCE
    | `String "RDS" -> RDS
    | `String "EC2_AMI" -> EC2_AMI
    | `String "EC2_HOST" -> EC2_HOST
    | `String "EC2_INSTANCE" -> EC2_INSTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_inventory_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_type = option_of_yojson (value_for_key string__of_yojson "InstanceType") _list path;
     region = option_of_yojson (value_for_key string__of_yojson "Region") _list path;
     host_id = option_of_yojson (value_for_key string__of_yojson "HostId") _list path;
     ami_id = option_of_yojson (value_for_key string__of_yojson "AmiId") _list path;
     usage_operation =
       option_of_yojson (value_for_key string__of_yojson "UsageOperation") _list path;
     marketplace_product_codes =
       option_of_yojson (value_for_key string_list_of_yojson "MarketplaceProductCodes") _list path;
     resource_owning_account_id =
       option_of_yojson (value_for_key string__of_yojson "ResourceOwningAccountId") _list path;
     platform_version =
       option_of_yojson (value_for_key string__of_yojson "PlatformVersion") _list path;
     platform = option_of_yojson (value_for_key string__of_yojson "Platform") _list path;
     resource_arn = option_of_yojson (value_for_key string__of_yojson "ResourceArn") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_id = option_of_yojson (value_for_key string__of_yojson "ResourceId") _list path;
   }
    : resource_inventory)

let resource_inventory_list_of_yojson tree path =
  list_of_yojson resource_inventory_of_yojson tree path

let report_generator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     create_time = option_of_yojson (value_for_key string__of_yojson "CreateTime") _list path;
     s3_location = option_of_yojson (value_for_key s3_location_of_yojson "S3Location") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     report_creator_account =
       option_of_yojson (value_for_key string__of_yojson "ReportCreatorAccount") _list path;
     last_report_generation_time =
       option_of_yojson (value_for_key string__of_yojson "LastReportGenerationTime") _list path;
     last_run_failure_reason =
       option_of_yojson (value_for_key string__of_yojson "LastRunFailureReason") _list path;
     last_run_status = option_of_yojson (value_for_key string__of_yojson "LastRunStatus") _list path;
     license_manager_report_generator_arn =
       option_of_yojson
         (value_for_key string__of_yojson "LicenseManagerReportGeneratorArn")
         _list path;
     report_frequency =
       option_of_yojson (value_for_key report_frequency_of_yojson "ReportFrequency") _list path;
     report_context =
       option_of_yojson (value_for_key report_context_of_yojson "ReportContext") _list path;
     report_type =
       option_of_yojson (value_for_key report_type_list_of_yojson "ReportType") _list path;
     report_generator_name =
       option_of_yojson (value_for_key string__of_yojson "ReportGeneratorName") _list path;
   }
    : report_generator)

let report_generator_list_of_yojson tree path = list_of_yojson report_generator_of_yojson tree path

let renew_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Monthly" -> MONTHLY
    | `String "Weekly" -> WEEKLY
    | `String "None" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RenewType" value)
    | _ -> raise (deserialize_wrong_type_error path "RenewType")
     : renew_type)
    : renew_type)

let grant_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "WORKFLOW_COMPLETED" -> WORKFLOW_COMPLETED
    | `String "DISABLED" -> DISABLED
    | `String "PENDING_DELETE" -> PENDING_DELETE
    | `String "DELETED" -> DELETED
    | `String "FAILED_WORKFLOW" -> FAILED_WORKFLOW
    | `String "ACTIVE" -> ACTIVE
    | `String "REJECTED" -> REJECTED
    | `String "PENDING_ACCEPT" -> PENDING_ACCEPT
    | `String "PENDING_WORKFLOW" -> PENDING_WORKFLOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "GrantStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "GrantStatus")
     : grant_status)
    : grant_status)

let reject_grant_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     status = option_of_yojson (value_for_key grant_status_of_yojson "Status") _list path;
     grant_arn = option_of_yojson (value_for_key arn_of_yojson "GrantArn") _list path;
   }
    : reject_grant_response)

let reject_grant_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ grant_arn = value_for_key arn_of_yojson "GrantArn" _list path } : reject_grant_request)

let location_of_yojson = string_of_yojson

let redirect_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     location = option_of_yojson (value_for_key location_of_yojson "Location") _list path;
   }
    : redirect_exception)

let received_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "WORKFLOW_COMPLETED" -> WORKFLOW_COMPLETED
    | `String "DISABLED" -> DISABLED
    | `String "DELETED" -> DELETED
    | `String "FAILED_WORKFLOW" -> FAILED_WORKFLOW
    | `String "ACTIVE" -> ACTIVE
    | `String "REJECTED" -> REJECTED
    | `String "PENDING_ACCEPT" -> PENDING_ACCEPT
    | `String "PENDING_WORKFLOW" -> PENDING_WORKFLOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReceivedStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReceivedStatus")
     : received_status)
    : received_status)

let allowed_operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreateToken" -> CREATE_TOKEN
    | `String "ListPurchasedLicenses" -> LIST_PURCHASED_LICENSES
    | `String "ExtendConsumptionLicense" -> EXTEND_CONSUMPTION_LICENSE
    | `String "CheckInLicense" -> CHECK_IN_LICENSE
    | `String "CheckoutBorrowLicense" -> CHECKOUT_BORROW_LICENSE
    | `String "CheckoutLicense" -> CHECKOUT_LICENSE
    | `String "CreateGrant" -> CREATE_GRANT
    | `String value -> raise (deserialize_unknown_enum_value_error path "AllowedOperation" value)
    | _ -> raise (deserialize_wrong_type_error path "AllowedOperation")
     : allowed_operation)
    : allowed_operation)

let allowed_operation_list_of_yojson tree path =
  list_of_yojson allowed_operation_of_yojson tree path

let received_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allowed_operations =
       option_of_yojson
         (value_for_key allowed_operation_list_of_yojson "AllowedOperations")
         _list path;
     received_status_reason =
       option_of_yojson
         (value_for_key status_reason_message_of_yojson "ReceivedStatusReason")
         _list path;
     received_status =
       option_of_yojson (value_for_key received_status_of_yojson "ReceivedStatus") _list path;
   }
    : received_metadata)

let box_integer_of_yojson = int_of_yojson

let provisional_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_time_to_live_in_minutes =
       value_for_key box_integer_of_yojson "MaxTimeToLiveInMinutes" _list path;
   }
    : provisional_configuration)

let product_code_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "marketplace" -> MARKETPLACE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProductCodeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProductCodeType")
     : product_code_type)
    : product_code_type)

let product_code_id_of_yojson = string_of_yojson

let product_code_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     product_code_type = value_for_key product_code_type_of_yojson "ProductCodeType" _list path;
     product_code_id = value_for_key product_code_id_of_yojson "ProductCodeId" _list path;
   }
    : product_code_list_item)

let product_code_list_of_yojson tree path =
  list_of_yojson product_code_list_item_of_yojson tree path

let principal_arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let activation_override_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL_GRANTS_PERMITTED_BY_ISSUER" -> ALL_GRANTS_PERMITTED_BY_ISSUER
    | `String "DISTRIBUTED_GRANTS_ONLY" -> DISTRIBUTED_GRANTS_ONLY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ActivationOverrideBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "ActivationOverrideBehavior")
     : activation_override_behavior)
    : activation_override_behavior)

let options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activation_override_behavior =
       option_of_yojson
         (value_for_key activation_override_behavior_of_yojson "ActivationOverrideBehavior")
         _list path;
   }
    : options)

let no_entitlements_allowed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : no_entitlements_allowed_exception)

let metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : metadata)

let metadata_list_of_yojson tree path = list_of_yojson metadata_of_yojson tree path
let max_size100_of_yojson = int_of_yojson

let managed_resource_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_count =
       option_of_yojson (value_for_key box_long_of_yojson "AssociationCount") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
   }
    : managed_resource_summary)

let managed_resource_summary_list_of_yojson tree path =
  list_of_yojson managed_resource_summary_of_yojson tree path

let long_of_yojson = long_of_yojson

let license_configuration_usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_licenses =
       option_of_yojson (value_for_key box_long_of_yojson "ConsumedLicenses") _list path;
     association_time =
       option_of_yojson (value_for_key date_time_of_yojson "AssociationTime") _list path;
     resource_owner_id =
       option_of_yojson (value_for_key string__of_yojson "ResourceOwnerId") _list path;
     resource_status =
       option_of_yojson (value_for_key string__of_yojson "ResourceStatus") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_arn = option_of_yojson (value_for_key string__of_yojson "ResourceArn") _list path;
   }
    : license_configuration_usage)

let license_configuration_usage_list_of_yojson tree path =
  list_of_yojson license_configuration_usage_of_yojson tree path

let list_usage_for_license_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     license_configuration_usage_list =
       option_of_yojson
         (value_for_key license_configuration_usage_list_of_yojson "LicenseConfigurationUsageList")
         _list path;
   }
    : list_usage_for_license_configuration_response)

let filter_name_of_yojson = string_of_yojson
let filter_value_of_yojson = string_of_yojson
let filter_values_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = option_of_yojson (value_for_key filter_values_of_yojson "Values") _list path;
     name = option_of_yojson (value_for_key filter_name_of_yojson "Name") _list path;
   }
    : filter)

let filters_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let list_usage_for_license_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key box_integer_of_yojson "MaxResults") _list path;
     license_configuration_arn =
       value_for_key string__of_yojson "LicenseConfigurationArn" _list path;
   }
    : list_usage_for_license_configuration_request)

let filter_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : filter_limit_exceeded_exception)

let list_tokens_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     tokens = option_of_yojson (value_for_key token_list_of_yojson "Tokens") _list path;
   }
    : list_tokens_response)

let filter_list_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let list_tokens_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_size100_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     token_ids = option_of_yojson (value_for_key string_list_of_yojson "TokenIds") _list path;
   }
    : list_tokens_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key string__of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let list_resource_inventory_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     resource_inventory_list =
       option_of_yojson
         (value_for_key resource_inventory_list_of_yojson "ResourceInventoryList")
         _list path;
   }
    : list_resource_inventory_response)

let inventory_filter_condition_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTAINS" -> CONTAINS
    | `String "BEGINS_WITH" -> BEGINS_WITH
    | `String "NOT_EQUALS" -> NOT_EQUALS
    | `String "EQUALS" -> EQUALS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InventoryFilterCondition" value)
    | _ -> raise (deserialize_wrong_type_error path "InventoryFilterCondition")
     : inventory_filter_condition)
    : inventory_filter_condition)

let inventory_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     condition = value_for_key inventory_filter_condition_of_yojson "Condition" _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : inventory_filter)

let inventory_filter_list_of_yojson tree path = list_of_yojson inventory_filter_of_yojson tree path

let list_resource_inventory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key inventory_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key box_integer_of_yojson "MaxResults") _list path;
   }
    : list_resource_inventory_request)

let failed_dependency_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
   }
    : failed_dependency_exception)

let issuer_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_fingerprint =
       option_of_yojson (value_for_key string__of_yojson "KeyFingerprint") _list path;
     sign_key = option_of_yojson (value_for_key string__of_yojson "SignKey") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : issuer_details)

let license_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETED" -> DELETED
    | `String "PENDING_DELETE" -> PENDING_DELETE
    | `String "EXPIRED" -> EXPIRED
    | `String "SUSPENDED" -> SUSPENDED
    | `String "DEACTIVATED" -> DEACTIVATED
    | `String "PENDING_AVAILABLE" -> PENDING_AVAILABLE
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "LicenseStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseStatus")
     : license_status)
    : license_status)

let datetime_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_ = option_of_yojson (value_for_key iso8601_date_time_of_yojson "End") _list path;
     \#begin = value_for_key iso8601_date_time_of_yojson "Begin" _list path;
   }
    : datetime_range)

let entitlement_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "Count/Second" -> COUNT_PER_SECOND
    | `String "Terabits/Second" -> TERABITS_PER_SECOND
    | `String "Gigabits/Second" -> GIGABITS_PER_SECOND
    | `String "Megabits/Second" -> MEGABITS_PER_SECOND
    | `String "Kilobits/Second" -> KILOBITS_PER_SECOND
    | `String "Bits/Second" -> BITS_PER_SECOND
    | `String "Terabytes/Second" -> TERABYTES_PER_SECOND
    | `String "Gigabytes/Second" -> GIGABYTES_PER_SECOND
    | `String "Megabytes/Second" -> MEGABYTES_PER_SECOND
    | `String "Kilobytes/Second" -> KILOBYTES_PER_SECOND
    | `String "Bytes/Second" -> BYTES_PER_SECOND
    | `String "Percent" -> PERCENT
    | `String "Terabits" -> TERABITS
    | `String "Gigabits" -> GIGABITS
    | `String "Megabits" -> MEGABITS
    | `String "Kilobits" -> KILOBITS
    | `String "Bits" -> BITS
    | `String "Terabytes" -> TERABYTES
    | `String "Gigabytes" -> GIGABYTES
    | `String "Megabytes" -> MEGABYTES
    | `String "Kilobytes" -> KILOBYTES
    | `String "Bytes" -> BYTES
    | `String "Milliseconds" -> MILLISECONDS
    | `String "Microseconds" -> MICROSECONDS
    | `String "Seconds" -> SECONDS
    | `String "None" -> NONE
    | `String "Count" -> COUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntitlementUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "EntitlementUnit")
     : entitlement_unit)
    : entitlement_unit)

let entitlement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allow_check_in =
       option_of_yojson (value_for_key box_boolean_of_yojson "AllowCheckIn") _list path;
     unit_ = value_for_key entitlement_unit_of_yojson "Unit" _list path;
     overage = option_of_yojson (value_for_key box_boolean_of_yojson "Overage") _list path;
     max_count = option_of_yojson (value_for_key long_of_yojson "MaxCount") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : entitlement)

let entitlement_list_of_yojson tree path = list_of_yojson entitlement_of_yojson tree path

let borrow_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_time_to_live_in_minutes =
       value_for_key box_integer_of_yojson "MaxTimeToLiveInMinutes" _list path;
     allow_early_check_in = value_for_key box_boolean_of_yojson "AllowEarlyCheckIn" _list path;
   }
    : borrow_configuration)

let consumption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     borrow_configuration =
       option_of_yojson
         (value_for_key borrow_configuration_of_yojson "BorrowConfiguration")
         _list path;
     provisional_configuration =
       option_of_yojson
         (value_for_key provisional_configuration_of_yojson "ProvisionalConfiguration")
         _list path;
     renew_type = option_of_yojson (value_for_key renew_type_of_yojson "RenewType") _list path;
   }
    : consumption_configuration)

let granted_license_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     received_metadata =
       option_of_yojson (value_for_key received_metadata_of_yojson "ReceivedMetadata") _list path;
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     create_time =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "CreateTime") _list path;
     license_metadata =
       option_of_yojson (value_for_key metadata_list_of_yojson "LicenseMetadata") _list path;
     consumption_configuration =
       option_of_yojson
         (value_for_key consumption_configuration_of_yojson "ConsumptionConfiguration")
         _list path;
     entitlements =
       option_of_yojson (value_for_key entitlement_list_of_yojson "Entitlements") _list path;
     beneficiary = option_of_yojson (value_for_key string__of_yojson "Beneficiary") _list path;
     validity = option_of_yojson (value_for_key datetime_range_of_yojson "Validity") _list path;
     status = option_of_yojson (value_for_key license_status_of_yojson "Status") _list path;
     home_region = option_of_yojson (value_for_key string__of_yojson "HomeRegion") _list path;
     issuer = option_of_yojson (value_for_key issuer_details_of_yojson "Issuer") _list path;
     product_sk_u = option_of_yojson (value_for_key string__of_yojson "ProductSKU") _list path;
     product_name = option_of_yojson (value_for_key string__of_yojson "ProductName") _list path;
     license_name = option_of_yojson (value_for_key string__of_yojson "LicenseName") _list path;
     license_arn = option_of_yojson (value_for_key arn_of_yojson "LicenseArn") _list path;
   }
    : granted_license)

let granted_license_list_of_yojson tree path = list_of_yojson granted_license_of_yojson tree path

let list_received_licenses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     licenses =
       option_of_yojson (value_for_key granted_license_list_of_yojson "Licenses") _list path;
   }
    : list_received_licenses_response)

let list_received_licenses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_size100_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     license_arns = option_of_yojson (value_for_key arn_list_of_yojson "LicenseArns") _list path;
   }
    : list_received_licenses_request)

let list_received_licenses_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     licenses =
       option_of_yojson (value_for_key granted_license_list_of_yojson "Licenses") _list path;
   }
    : list_received_licenses_for_organization_response)

let list_received_licenses_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_size100_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
   }
    : list_received_licenses_for_organization_request)

let grant_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     options = option_of_yojson (value_for_key options_of_yojson "Options") _list path;
     granted_operations =
       value_for_key allowed_operation_list_of_yojson "GrantedOperations" _list path;
     version = value_for_key string__of_yojson "Version" _list path;
     status_reason =
       option_of_yojson (value_for_key status_reason_message_of_yojson "StatusReason") _list path;
     grant_status = value_for_key grant_status_of_yojson "GrantStatus" _list path;
     home_region = value_for_key string__of_yojson "HomeRegion" _list path;
     grantee_principal_arn = value_for_key arn_of_yojson "GranteePrincipalArn" _list path;
     license_arn = value_for_key arn_of_yojson "LicenseArn" _list path;
     parent_arn = value_for_key arn_of_yojson "ParentArn" _list path;
     grant_name = value_for_key string__of_yojson "GrantName" _list path;
     grant_arn = value_for_key arn_of_yojson "GrantArn" _list path;
   }
    : grant)

let grant_list_of_yojson tree path = list_of_yojson grant_of_yojson tree path

let list_received_grants_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     grants = option_of_yojson (value_for_key grant_list_of_yojson "Grants") _list path;
   }
    : list_received_grants_response)

let list_received_grants_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_size100_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     grant_arns = option_of_yojson (value_for_key arn_list_of_yojson "GrantArns") _list path;
   }
    : list_received_grants_request)

let list_received_grants_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     grants = option_of_yojson (value_for_key grant_list_of_yojson "Grants") _list path;
   }
    : list_received_grants_for_organization_response)

let list_received_grants_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_size100_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     license_arn = value_for_key arn_of_yojson "LicenseArn" _list path;
   }
    : list_received_grants_for_organization_request)

let license_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     create_time =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "CreateTime") _list path;
     license_metadata =
       option_of_yojson (value_for_key metadata_list_of_yojson "LicenseMetadata") _list path;
     consumption_configuration =
       option_of_yojson
         (value_for_key consumption_configuration_of_yojson "ConsumptionConfiguration")
         _list path;
     entitlements =
       option_of_yojson (value_for_key entitlement_list_of_yojson "Entitlements") _list path;
     beneficiary = option_of_yojson (value_for_key string__of_yojson "Beneficiary") _list path;
     validity = option_of_yojson (value_for_key datetime_range_of_yojson "Validity") _list path;
     status = option_of_yojson (value_for_key license_status_of_yojson "Status") _list path;
     home_region = option_of_yojson (value_for_key string__of_yojson "HomeRegion") _list path;
     issuer = option_of_yojson (value_for_key issuer_details_of_yojson "Issuer") _list path;
     product_sk_u = option_of_yojson (value_for_key string__of_yojson "ProductSKU") _list path;
     product_name = option_of_yojson (value_for_key string__of_yojson "ProductName") _list path;
     license_name = option_of_yojson (value_for_key string__of_yojson "LicenseName") _list path;
     license_arn = option_of_yojson (value_for_key arn_of_yojson "LicenseArn") _list path;
   }
    : license)

let license_list_of_yojson tree path = list_of_yojson license_of_yojson tree path

let list_licenses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     licenses = option_of_yojson (value_for_key license_list_of_yojson "Licenses") _list path;
   }
    : list_licenses_response)

let list_licenses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_size100_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     license_arns = option_of_yojson (value_for_key arn_list_of_yojson "LicenseArns") _list path;
   }
    : list_licenses_request)

let list_license_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     licenses = option_of_yojson (value_for_key license_list_of_yojson "Licenses") _list path;
   }
    : list_license_versions_response)

let list_license_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_size100_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     license_arn = value_for_key arn_of_yojson "LicenseArn" _list path;
   }
    : list_license_versions_request)

let list_license_specifications_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     license_specifications =
       option_of_yojson
         (value_for_key license_specifications_of_yojson "LicenseSpecifications")
         _list path;
   }
    : list_license_specifications_for_resource_response)

let list_license_specifications_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key box_integer_of_yojson "MaxResults") _list path;
     resource_arn = value_for_key string__of_yojson "ResourceArn" _list path;
   }
    : list_license_specifications_for_resource_request)

let list_license_manager_report_generators_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     report_generators =
       option_of_yojson
         (value_for_key report_generator_list_of_yojson "ReportGenerators")
         _list path;
   }
    : list_license_manager_report_generators_response)

let list_license_manager_report_generators_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_size100_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
   }
    : list_license_manager_report_generators_request)

let license_conversion_task_id_of_yojson = string_of_yojson

let license_conversion_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     product_codes =
       option_of_yojson (value_for_key product_code_list_of_yojson "ProductCodes") _list path;
     usage_operation =
       option_of_yojson (value_for_key usage_operation_of_yojson "UsageOperation") _list path;
   }
    : license_conversion_context)

let license_conversion_task_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LicenseConversionTaskStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseConversionTaskStatus")
     : license_conversion_task_status)
    : license_conversion_task_status)

let license_conversion_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     license_conversion_time =
       option_of_yojson (value_for_key date_time_of_yojson "LicenseConversionTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     status_message = option_of_yojson (value_for_key string__of_yojson "StatusMessage") _list path;
     status =
       option_of_yojson (value_for_key license_conversion_task_status_of_yojson "Status") _list path;
     destination_license_context =
       option_of_yojson
         (value_for_key license_conversion_context_of_yojson "DestinationLicenseContext")
         _list path;
     source_license_context =
       option_of_yojson
         (value_for_key license_conversion_context_of_yojson "SourceLicenseContext")
         _list path;
     resource_arn = option_of_yojson (value_for_key string__of_yojson "ResourceArn") _list path;
     license_conversion_task_id =
       option_of_yojson
         (value_for_key license_conversion_task_id_of_yojson "LicenseConversionTaskId")
         _list path;
   }
    : license_conversion_task)

let license_conversion_tasks_of_yojson tree path =
  list_of_yojson license_conversion_task_of_yojson tree path

let list_license_conversion_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     license_conversion_tasks =
       option_of_yojson
         (value_for_key license_conversion_tasks_of_yojson "LicenseConversionTasks")
         _list path;
   }
    : list_license_conversion_tasks_response)

let list_license_conversion_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     max_results = option_of_yojson (value_for_key box_integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_license_conversion_tasks_request)

let license_counting_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Socket" -> SOCKET
    | `String "Core" -> CORE
    | `String "Instance" -> INSTANCE
    | `String "vCPU" -> VCPU
    | `String value -> raise (deserialize_unknown_enum_value_error path "LicenseCountingType" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseCountingType")
     : license_counting_type)
    : license_counting_type)

let consumed_license_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_licenses =
       option_of_yojson (value_for_key box_long_of_yojson "ConsumedLicenses") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
   }
    : consumed_license_summary)

let consumed_license_summary_list_of_yojson tree path =
  list_of_yojson consumed_license_summary_of_yojson tree path

let automated_discovery_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ last_run_time = option_of_yojson (value_for_key date_time_of_yojson "LastRunTime") _list path }
    : automated_discovery_information)

let license_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_expiry = option_of_yojson (value_for_key box_long_of_yojson "LicenseExpiry") _list path;
     automated_discovery_information =
       option_of_yojson
         (value_for_key automated_discovery_information_of_yojson "AutomatedDiscoveryInformation")
         _list path;
     product_information_list =
       option_of_yojson
         (value_for_key product_information_list_of_yojson "ProductInformationList")
         _list path;
     managed_resource_summary_list =
       option_of_yojson
         (value_for_key managed_resource_summary_list_of_yojson "ManagedResourceSummaryList")
         _list path;
     consumed_license_summary_list =
       option_of_yojson
         (value_for_key consumed_license_summary_list_of_yojson "ConsumedLicenseSummaryList")
         _list path;
     owner_account_id =
       option_of_yojson (value_for_key string__of_yojson "OwnerAccountId") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     consumed_licenses =
       option_of_yojson (value_for_key box_long_of_yojson "ConsumedLicenses") _list path;
     disassociate_when_not_found =
       option_of_yojson (value_for_key box_boolean_of_yojson "DisassociateWhenNotFound") _list path;
     license_count_hard_limit =
       option_of_yojson (value_for_key box_boolean_of_yojson "LicenseCountHardLimit") _list path;
     license_count = option_of_yojson (value_for_key box_long_of_yojson "LicenseCount") _list path;
     license_rules =
       option_of_yojson (value_for_key string_list_of_yojson "LicenseRules") _list path;
     license_counting_type =
       option_of_yojson
         (value_for_key license_counting_type_of_yojson "LicenseCountingType")
         _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     license_configuration_arn =
       option_of_yojson (value_for_key string__of_yojson "LicenseConfigurationArn") _list path;
     license_configuration_id =
       option_of_yojson (value_for_key string__of_yojson "LicenseConfigurationId") _list path;
   }
    : license_configuration)

let license_configurations_of_yojson tree path =
  list_of_yojson license_configuration_of_yojson tree path

let list_license_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     license_configurations =
       option_of_yojson
         (value_for_key license_configurations_of_yojson "LicenseConfigurations")
         _list path;
   }
    : list_license_configurations_response)

let list_license_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key box_integer_of_yojson "MaxResults") _list path;
     license_configuration_arns =
       option_of_yojson (value_for_key string_list_of_yojson "LicenseConfigurationArns") _list path;
   }
    : list_license_configurations_request)

let list_license_configurations_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     license_configurations =
       option_of_yojson
         (value_for_key license_configurations_of_yojson "LicenseConfigurations")
         _list path;
   }
    : list_license_configurations_for_organization_response)

let list_license_configurations_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key box_integer_of_yojson "MaxResults") _list path;
     license_configuration_arns =
       option_of_yojson (value_for_key string_list_of_yojson "LicenseConfigurationArns") _list path;
   }
    : list_license_configurations_for_organization_request)

let license_asset_ruleset_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_asset_ruleset_arn = value_for_key arn_of_yojson "LicenseAssetRulesetArn" _list path;
     rules = value_for_key license_asset_rule_list_of_yojson "Rules" _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : license_asset_ruleset)

let license_asset_ruleset_list_of_yojson tree path =
  list_of_yojson license_asset_ruleset_of_yojson tree path

let list_license_asset_rulesets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     license_asset_rulesets =
       option_of_yojson
         (value_for_key license_asset_ruleset_list_of_yojson "LicenseAssetRulesets")
         _list path;
   }
    : list_license_asset_rulesets_response)

let list_license_asset_rulesets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key box_integer_of_yojson "MaxResults") _list path;
     show_aws_managed_license_asset_rulesets =
       option_of_yojson
         (value_for_key boolean__of_yojson "ShowAWSManagedLicenseAssetRulesets")
         _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_license_asset_rulesets_request)

let license_asset_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_resource_discovery_time =
       option_of_yojson (value_for_key date_time_of_yojson "LatestResourceDiscoveryTime") _list path;
     latest_usage_analysis_time =
       option_of_yojson (value_for_key date_time_of_yojson "LatestUsageAnalysisTime") _list path;
     status_message = option_of_yojson (value_for_key string__of_yojson "StatusMessage") _list path;
     status = value_for_key license_asset_group_status_of_yojson "Status" _list path;
     license_asset_group_arn = value_for_key arn_of_yojson "LicenseAssetGroupArn" _list path;
     properties =
       option_of_yojson
         (value_for_key license_asset_group_property_list_of_yojson "Properties")
         _list path;
     associated_license_asset_ruleset_ar_ns =
       value_for_key license_asset_ruleset_arn_list_of_yojson "AssociatedLicenseAssetRulesetARNs"
         _list path;
     license_asset_group_configurations =
       option_of_yojson
         (value_for_key license_asset_group_configuration_list_of_yojson
            "LicenseAssetGroupConfigurations")
         _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : license_asset_group)

let license_asset_group_list_of_yojson tree path =
  list_of_yojson license_asset_group_of_yojson tree path

let list_license_asset_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     license_asset_groups =
       option_of_yojson
         (value_for_key license_asset_group_list_of_yojson "LicenseAssetGroups")
         _list path;
   }
    : list_license_asset_groups_response)

let list_license_asset_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key box_integer_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_license_asset_groups_request)

let license_operation_failure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata_list =
       option_of_yojson (value_for_key metadata_list_of_yojson "MetadataList") _list path;
     operation_requested_by =
       option_of_yojson (value_for_key string__of_yojson "OperationRequestedBy") _list path;
     resource_owner_id =
       option_of_yojson (value_for_key string__of_yojson "ResourceOwnerId") _list path;
     operation_name = option_of_yojson (value_for_key string__of_yojson "OperationName") _list path;
     failure_time = option_of_yojson (value_for_key date_time_of_yojson "FailureTime") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_arn = option_of_yojson (value_for_key string__of_yojson "ResourceArn") _list path;
   }
    : license_operation_failure)

let license_operation_failure_list_of_yojson tree path =
  list_of_yojson license_operation_failure_of_yojson tree path

let list_failures_for_license_configuration_operations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     license_operation_failure_list =
       option_of_yojson
         (value_for_key license_operation_failure_list_of_yojson "LicenseOperationFailureList")
         _list path;
   }
    : list_failures_for_license_configuration_operations_response)

let list_failures_for_license_configuration_operations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key box_integer_of_yojson "MaxResults") _list path;
     license_configuration_arn =
       value_for_key string__of_yojson "LicenseConfigurationArn" _list path;
   }
    : list_failures_for_license_configuration_operations_request)

let list_distributed_grants_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     grants = option_of_yojson (value_for_key grant_list_of_yojson "Grants") _list path;
   }
    : list_distributed_grants_response)

let list_distributed_grants_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_size100_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     grant_arns = option_of_yojson (value_for_key arn_list_of_yojson "GrantArns") _list path;
   }
    : list_distributed_grants_request)

let license_configuration_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ami_association_scope =
       option_of_yojson (value_for_key string__of_yojson "AmiAssociationScope") _list path;
     association_time =
       option_of_yojson (value_for_key date_time_of_yojson "AssociationTime") _list path;
     resource_owner_id =
       option_of_yojson (value_for_key string__of_yojson "ResourceOwnerId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_arn = option_of_yojson (value_for_key string__of_yojson "ResourceArn") _list path;
   }
    : license_configuration_association)

let license_configuration_associations_of_yojson tree path =
  list_of_yojson license_configuration_association_of_yojson tree path

let list_associations_for_license_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     license_configuration_associations =
       option_of_yojson
         (value_for_key license_configuration_associations_of_yojson
            "LicenseConfigurationAssociations")
         _list path;
   }
    : list_associations_for_license_configuration_response)

let list_associations_for_license_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key box_integer_of_yojson "MaxResults") _list path;
     license_configuration_arn =
       value_for_key string__of_yojson "LicenseConfigurationArn" _list path;
   }
    : list_associations_for_license_configuration_request)

let asset_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_asset_discovery_time =
       option_of_yojson (value_for_key date_time_of_yojson "LatestAssetDiscoveryTime") _list path;
     asset_arn = option_of_yojson (value_for_key string__of_yojson "AssetArn") _list path;
   }
    : asset)

let asset_list_of_yojson tree path = list_of_yojson asset_of_yojson tree path

let list_assets_for_license_asset_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     assets = option_of_yojson (value_for_key asset_list_of_yojson "Assets") _list path;
   }
    : list_assets_for_license_asset_group_response)

let list_assets_for_license_asset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key box_integer_of_yojson "MaxResults") _list path;
     asset_type = value_for_key string__of_yojson "AssetType" _list path;
     license_asset_group_arn = value_for_key string__of_yojson "LicenseAssetGroupArn" _list path;
   }
    : list_assets_for_license_asset_group_request)

let entitlement_data_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "Count/Second" -> COUNT_PER_SECOND
    | `String "Terabits/Second" -> TERABITS_PER_SECOND
    | `String "Gigabits/Second" -> GIGABITS_PER_SECOND
    | `String "Megabits/Second" -> MEGABITS_PER_SECOND
    | `String "Kilobits/Second" -> KILOBITS_PER_SECOND
    | `String "Bits/Second" -> BITS_PER_SECOND
    | `String "Terabytes/Second" -> TERABYTES_PER_SECOND
    | `String "Gigabytes/Second" -> GIGABYTES_PER_SECOND
    | `String "Megabytes/Second" -> MEGABYTES_PER_SECOND
    | `String "Kilobytes/Second" -> KILOBYTES_PER_SECOND
    | `String "Bytes/Second" -> BYTES_PER_SECOND
    | `String "Percent" -> PERCENT
    | `String "Terabits" -> TERABITS
    | `String "Gigabits" -> GIGABITS
    | `String "Megabits" -> MEGABITS
    | `String "Kilobits" -> KILOBITS
    | `String "Bits" -> BITS
    | `String "Terabytes" -> TERABYTES
    | `String "Gigabytes" -> GIGABYTES
    | `String "Megabytes" -> MEGABYTES
    | `String "Kilobytes" -> KILOBYTES
    | `String "Bytes" -> BYTES
    | `String "Milliseconds" -> MILLISECONDS
    | `String "Microseconds" -> MICROSECONDS
    | `String "Seconds" -> SECONDS
    | `String "None" -> NONE
    | `String "Count" -> COUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntitlementDataUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "EntitlementDataUnit")
     : entitlement_data_unit)
    : entitlement_data_unit)

let entitlement_usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unit_ = value_for_key entitlement_data_unit_of_yojson "Unit" _list path;
     max_count = option_of_yojson (value_for_key string__of_yojson "MaxCount") _list path;
     consumed_value = value_for_key string__of_yojson "ConsumedValue" _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : entitlement_usage)

let entitlement_usage_list_of_yojson tree path =
  list_of_yojson entitlement_usage_of_yojson tree path

let license_usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entitlement_usages =
       option_of_yojson
         (value_for_key entitlement_usage_list_of_yojson "EntitlementUsages")
         _list path;
   }
    : license_usage)

let license_deletion_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETED" -> DELETED
    | `String "PENDING_DELETE" -> PENDING_DELETE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LicenseDeletionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LicenseDeletionStatus")
     : license_deletion_status)
    : license_deletion_status)

let issuer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sign_key = option_of_yojson (value_for_key string__of_yojson "SignKey") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : issuer)

let get_service_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_status =
       option_of_yojson (value_for_key service_status_of_yojson "ServiceStatus") _list path;
     cross_region_discovery_source_regions =
       option_of_yojson
         (value_for_key string_list_of_yojson "CrossRegionDiscoverySourceRegions")
         _list path;
     cross_region_discovery_home_region =
       option_of_yojson
         (value_for_key string__of_yojson "CrossRegionDiscoveryHomeRegion")
         _list path;
     license_manager_resource_share_arn =
       option_of_yojson
         (value_for_key string__of_yojson "LicenseManagerResourceShareArn")
         _list path;
     enable_cross_accounts_discovery =
       option_of_yojson
         (value_for_key box_boolean_of_yojson "EnableCrossAccountsDiscovery")
         _list path;
     organization_configuration =
       option_of_yojson
         (value_for_key organization_configuration_of_yojson "OrganizationConfiguration")
         _list path;
     sns_topic_arn = option_of_yojson (value_for_key string__of_yojson "SnsTopicArn") _list path;
     s3_bucket_arn = option_of_yojson (value_for_key string__of_yojson "S3BucketArn") _list path;
   }
    : get_service_settings_response)

let get_service_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_license_usage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_usage =
       option_of_yojson (value_for_key license_usage_of_yojson "LicenseUsage") _list path;
   }
    : get_license_usage_response)

let get_license_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ license_arn = value_for_key arn_of_yojson "LicenseArn" _list path }
    : get_license_usage_request)

let get_license_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ license = option_of_yojson (value_for_key license_of_yojson "License") _list path }
    : get_license_response)

let get_license_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     license_arn = value_for_key arn_of_yojson "LicenseArn" _list path;
   }
    : get_license_request)

let get_license_manager_report_generator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_generator =
       option_of_yojson (value_for_key report_generator_of_yojson "ReportGenerator") _list path;
   }
    : get_license_manager_report_generator_response)

let get_license_manager_report_generator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_manager_report_generator_arn =
       value_for_key string__of_yojson "LicenseManagerReportGeneratorArn" _list path;
   }
    : get_license_manager_report_generator_request)

let get_license_conversion_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     license_conversion_time =
       option_of_yojson (value_for_key date_time_of_yojson "LicenseConversionTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     status =
       option_of_yojson (value_for_key license_conversion_task_status_of_yojson "Status") _list path;
     status_message = option_of_yojson (value_for_key string__of_yojson "StatusMessage") _list path;
     destination_license_context =
       option_of_yojson
         (value_for_key license_conversion_context_of_yojson "DestinationLicenseContext")
         _list path;
     source_license_context =
       option_of_yojson
         (value_for_key license_conversion_context_of_yojson "SourceLicenseContext")
         _list path;
     resource_arn = option_of_yojson (value_for_key string__of_yojson "ResourceArn") _list path;
     license_conversion_task_id =
       option_of_yojson
         (value_for_key license_conversion_task_id_of_yojson "LicenseConversionTaskId")
         _list path;
   }
    : get_license_conversion_task_response)

let get_license_conversion_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_conversion_task_id =
       value_for_key license_conversion_task_id_of_yojson "LicenseConversionTaskId" _list path;
   }
    : get_license_conversion_task_request)

let get_license_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_expiry = option_of_yojson (value_for_key box_long_of_yojson "LicenseExpiry") _list path;
     disassociate_when_not_found =
       option_of_yojson (value_for_key box_boolean_of_yojson "DisassociateWhenNotFound") _list path;
     automated_discovery_information =
       option_of_yojson
         (value_for_key automated_discovery_information_of_yojson "AutomatedDiscoveryInformation")
         _list path;
     product_information_list =
       option_of_yojson
         (value_for_key product_information_list_of_yojson "ProductInformationList")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     managed_resource_summary_list =
       option_of_yojson
         (value_for_key managed_resource_summary_list_of_yojson "ManagedResourceSummaryList")
         _list path;
     consumed_license_summary_list =
       option_of_yojson
         (value_for_key consumed_license_summary_list_of_yojson "ConsumedLicenseSummaryList")
         _list path;
     owner_account_id =
       option_of_yojson (value_for_key string__of_yojson "OwnerAccountId") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     consumed_licenses =
       option_of_yojson (value_for_key box_long_of_yojson "ConsumedLicenses") _list path;
     license_count_hard_limit =
       option_of_yojson (value_for_key box_boolean_of_yojson "LicenseCountHardLimit") _list path;
     license_count = option_of_yojson (value_for_key box_long_of_yojson "LicenseCount") _list path;
     license_rules =
       option_of_yojson (value_for_key string_list_of_yojson "LicenseRules") _list path;
     license_counting_type =
       option_of_yojson
         (value_for_key license_counting_type_of_yojson "LicenseCountingType")
         _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     license_configuration_arn =
       option_of_yojson (value_for_key string__of_yojson "LicenseConfigurationArn") _list path;
     license_configuration_id =
       option_of_yojson (value_for_key string__of_yojson "LicenseConfigurationId") _list path;
   }
    : get_license_configuration_response)

let get_license_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_configuration_arn =
       value_for_key string__of_yojson "LicenseConfigurationArn" _list path;
   }
    : get_license_configuration_request)

let get_license_asset_ruleset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_asset_ruleset =
       value_for_key license_asset_ruleset_of_yojson "LicenseAssetRuleset" _list path;
   }
    : get_license_asset_ruleset_response)

let get_license_asset_ruleset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ license_asset_ruleset_arn = value_for_key arn_of_yojson "LicenseAssetRulesetArn" _list path }
    : get_license_asset_ruleset_request)

let get_license_asset_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_asset_group =
       value_for_key license_asset_group_of_yojson "LicenseAssetGroup" _list path;
   }
    : get_license_asset_group_response)

let get_license_asset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ license_asset_group_arn = value_for_key arn_of_yojson "LicenseAssetGroupArn" _list path }
    : get_license_asset_group_request)

let get_grant_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ grant = option_of_yojson (value_for_key grant_of_yojson "Grant") _list path }
    : get_grant_response)

let get_grant_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     grant_arn = value_for_key arn_of_yojson "GrantArn" _list path;
   }
    : get_grant_request)

let get_access_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_token = option_of_yojson (value_for_key token_string_of_yojson "AccessToken") _list path;
   }
    : get_access_token_response)

let get_access_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_properties =
       option_of_yojson (value_for_key max_size3_string_list_of_yojson "TokenProperties") _list path;
     token = value_for_key token_string_of_yojson "Token" _list path;
   }
    : get_access_token_request)

let extend_license_consumption_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiration =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "Expiration") _list path;
     license_consumption_token =
       option_of_yojson (value_for_key string__of_yojson "LicenseConsumptionToken") _list path;
   }
    : extend_license_consumption_response)

let extend_license_consumption_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run = option_of_yojson (value_for_key boolean__of_yojson "DryRun") _list path;
     license_consumption_token =
       value_for_key string__of_yojson "LicenseConsumptionToken" _list path;
   }
    : extend_license_consumption_request)

let entitlement_not_allowed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : entitlement_not_allowed_exception)

let entitlement_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unit_ = value_for_key entitlement_data_unit_of_yojson "Unit" _list path;
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : entitlement_data)

let entitlement_data_list_of_yojson tree path = list_of_yojson entitlement_data_of_yojson tree path

let digital_signature_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "JWT_PS384" -> JWT_PS384
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DigitalSignatureMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "DigitalSignatureMethod")
     : digital_signature_method)
    : digital_signature_method)

let delete_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ token_id = value_for_key string__of_yojson "TokenId" _list path } : delete_token_request)

let delete_license_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deletion_date =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "DeletionDate") _list path;
     status = option_of_yojson (value_for_key license_deletion_status_of_yojson "Status") _list path;
   }
    : delete_license_response)

let delete_license_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_version = value_for_key string__of_yojson "SourceVersion" _list path;
     license_arn = value_for_key arn_of_yojson "LicenseArn" _list path;
   }
    : delete_license_request)

let delete_license_manager_report_generator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_license_manager_report_generator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_manager_report_generator_arn =
       value_for_key string__of_yojson "LicenseManagerReportGeneratorArn" _list path;
   }
    : delete_license_manager_report_generator_request)

let delete_license_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_license_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_configuration_arn =
       value_for_key string__of_yojson "LicenseConfigurationArn" _list path;
   }
    : delete_license_configuration_request)

let delete_license_asset_ruleset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_license_asset_ruleset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ license_asset_ruleset_arn = value_for_key arn_of_yojson "LicenseAssetRulesetArn" _list path }
    : delete_license_asset_ruleset_request)

let delete_license_asset_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = value_for_key license_asset_group_status_of_yojson "Status" _list path }
    : delete_license_asset_group_response)

let delete_license_asset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ license_asset_group_arn = value_for_key arn_of_yojson "LicenseAssetGroupArn" _list path }
    : delete_license_asset_group_request)

let delete_grant_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     status = option_of_yojson (value_for_key grant_status_of_yojson "Status") _list path;
     grant_arn = option_of_yojson (value_for_key arn_of_yojson "GrantArn") _list path;
   }
    : delete_grant_response)

let delete_grant_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = value_for_key string__of_yojson "Version" _list path;
     status_reason =
       option_of_yojson (value_for_key status_reason_message_of_yojson "StatusReason") _list path;
     grant_arn = value_for_key arn_of_yojson "GrantArn" _list path;
   }
    : delete_grant_request)

let create_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token = option_of_yojson (value_for_key token_string_of_yojson "Token") _list path;
     token_type = option_of_yojson (value_for_key token_type_of_yojson "TokenType") _list path;
     token_id = option_of_yojson (value_for_key string__of_yojson "TokenId") _list path;
   }
    : create_token_response)

let client_token_of_yojson = string_of_yojson

let create_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     token_properties =
       option_of_yojson (value_for_key max_size3_string_list_of_yojson "TokenProperties") _list path;
     expiration_in_days =
       option_of_yojson (value_for_key integer_of_yojson "ExpirationInDays") _list path;
     role_arns = option_of_yojson (value_for_key arn_list_of_yojson "RoleArns") _list path;
     license_arn = value_for_key arn_of_yojson "LicenseArn" _list path;
   }
    : create_token_request)

let create_license_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key license_status_of_yojson "Status") _list path;
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     license_arn = option_of_yojson (value_for_key arn_of_yojson "LicenseArn") _list path;
   }
    : create_license_version_response)

let create_license_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_version = option_of_yojson (value_for_key string__of_yojson "SourceVersion") _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     status = value_for_key license_status_of_yojson "Status" _list path;
     consumption_configuration =
       value_for_key consumption_configuration_of_yojson "ConsumptionConfiguration" _list path;
     entitlements = value_for_key entitlement_list_of_yojson "Entitlements" _list path;
     license_metadata =
       option_of_yojson (value_for_key metadata_list_of_yojson "LicenseMetadata") _list path;
     validity = value_for_key datetime_range_of_yojson "Validity" _list path;
     home_region = value_for_key string__of_yojson "HomeRegion" _list path;
     issuer = value_for_key issuer_of_yojson "Issuer" _list path;
     product_name = value_for_key string__of_yojson "ProductName" _list path;
     license_name = value_for_key string__of_yojson "LicenseName" _list path;
     license_arn = value_for_key arn_of_yojson "LicenseArn" _list path;
   }
    : create_license_version_request)

let create_license_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     status = option_of_yojson (value_for_key license_status_of_yojson "Status") _list path;
     license_arn = option_of_yojson (value_for_key arn_of_yojson "LicenseArn") _list path;
   }
    : create_license_response)

let create_license_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     license_metadata =
       option_of_yojson (value_for_key metadata_list_of_yojson "LicenseMetadata") _list path;
     consumption_configuration =
       value_for_key consumption_configuration_of_yojson "ConsumptionConfiguration" _list path;
     beneficiary = value_for_key string__of_yojson "Beneficiary" _list path;
     entitlements = value_for_key entitlement_list_of_yojson "Entitlements" _list path;
     validity = value_for_key datetime_range_of_yojson "Validity" _list path;
     home_region = value_for_key string__of_yojson "HomeRegion" _list path;
     issuer = value_for_key issuer_of_yojson "Issuer" _list path;
     product_sk_u = value_for_key string__of_yojson "ProductSKU" _list path;
     product_name = value_for_key string__of_yojson "ProductName" _list path;
     license_name = value_for_key string__of_yojson "LicenseName" _list path;
   }
    : create_license_request)

let create_license_manager_report_generator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_manager_report_generator_arn =
       option_of_yojson
         (value_for_key string__of_yojson "LicenseManagerReportGeneratorArn")
         _list path;
   }
    : create_license_manager_report_generator_response)

let create_license_manager_report_generator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     client_token = value_for_key client_request_token_of_yojson "ClientToken" _list path;
     report_frequency = value_for_key report_frequency_of_yojson "ReportFrequency" _list path;
     report_context = value_for_key report_context_of_yojson "ReportContext" _list path;
     type_ = value_for_key report_type_list_of_yojson "Type" _list path;
     report_generator_name =
       value_for_key report_generator_name_of_yojson "ReportGeneratorName" _list path;
   }
    : create_license_manager_report_generator_request)

let create_license_conversion_task_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_conversion_task_id =
       option_of_yojson
         (value_for_key license_conversion_task_id_of_yojson "LicenseConversionTaskId")
         _list path;
   }
    : create_license_conversion_task_for_resource_response)

let create_license_conversion_task_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_license_context =
       value_for_key license_conversion_context_of_yojson "DestinationLicenseContext" _list path;
     source_license_context =
       value_for_key license_conversion_context_of_yojson "SourceLicenseContext" _list path;
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
   }
    : create_license_conversion_task_for_resource_request)

let create_license_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_configuration_arn =
       option_of_yojson (value_for_key string__of_yojson "LicenseConfigurationArn") _list path;
   }
    : create_license_configuration_response)

let create_license_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_expiry = option_of_yojson (value_for_key box_long_of_yojson "LicenseExpiry") _list path;
     product_information_list =
       option_of_yojson
         (value_for_key product_information_list_of_yojson "ProductInformationList")
         _list path;
     disassociate_when_not_found =
       option_of_yojson (value_for_key box_boolean_of_yojson "DisassociateWhenNotFound") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     license_rules =
       option_of_yojson (value_for_key string_list_of_yojson "LicenseRules") _list path;
     license_count_hard_limit =
       option_of_yojson (value_for_key box_boolean_of_yojson "LicenseCountHardLimit") _list path;
     license_count = option_of_yojson (value_for_key box_long_of_yojson "LicenseCount") _list path;
     license_counting_type =
       value_for_key license_counting_type_of_yojson "LicenseCountingType" _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : create_license_configuration_request)

let create_license_asset_ruleset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_asset_ruleset_arn = value_for_key string__of_yojson "LicenseAssetRulesetArn" _list path;
   }
    : create_license_asset_ruleset_response)

let create_license_asset_ruleset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key string__of_yojson "ClientToken" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     rules = value_for_key license_asset_rule_list_of_yojson "Rules" _list path;
     description =
       option_of_yojson
         (value_for_key license_asset_resource_description_of_yojson "Description")
         _list path;
     name = value_for_key license_asset_resource_name_of_yojson "Name" _list path;
   }
    : create_license_asset_ruleset_request)

let create_license_asset_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key string__of_yojson "Status" _list path;
     license_asset_group_arn = value_for_key string__of_yojson "LicenseAssetGroupArn" _list path;
   }
    : create_license_asset_group_response)

let create_license_asset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key string__of_yojson "ClientToken" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     properties =
       option_of_yojson
         (value_for_key license_asset_group_property_list_of_yojson "Properties")
         _list path;
     associated_license_asset_ruleset_ar_ns =
       value_for_key license_asset_ruleset_arn_list_of_yojson "AssociatedLicenseAssetRulesetARNs"
         _list path;
     license_asset_group_configurations =
       value_for_key license_asset_group_configuration_list_of_yojson
         "LicenseAssetGroupConfigurations" _list path;
     description =
       option_of_yojson
         (value_for_key license_asset_resource_description_of_yojson "Description")
         _list path;
     name = value_for_key license_asset_resource_name_of_yojson "Name" _list path;
   }
    : create_license_asset_group_request)

let create_grant_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     status = option_of_yojson (value_for_key grant_status_of_yojson "Status") _list path;
     grant_arn = option_of_yojson (value_for_key arn_of_yojson "GrantArn") _list path;
   }
    : create_grant_version_response)

let create_grant_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     options = option_of_yojson (value_for_key options_of_yojson "Options") _list path;
     source_version = option_of_yojson (value_for_key string__of_yojson "SourceVersion") _list path;
     status_reason =
       option_of_yojson (value_for_key status_reason_message_of_yojson "StatusReason") _list path;
     status = option_of_yojson (value_for_key grant_status_of_yojson "Status") _list path;
     allowed_operations =
       option_of_yojson
         (value_for_key allowed_operation_list_of_yojson "AllowedOperations")
         _list path;
     grant_name = option_of_yojson (value_for_key string__of_yojson "GrantName") _list path;
     grant_arn = value_for_key arn_of_yojson "GrantArn" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
   }
    : create_grant_version_request)

let create_grant_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     status = option_of_yojson (value_for_key grant_status_of_yojson "Status") _list path;
     grant_arn = option_of_yojson (value_for_key arn_of_yojson "GrantArn") _list path;
   }
    : create_grant_response)

let create_grant_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     allowed_operations =
       value_for_key allowed_operation_list_of_yojson "AllowedOperations" _list path;
     home_region = value_for_key string__of_yojson "HomeRegion" _list path;
     principals = value_for_key principal_arn_list_of_yojson "Principals" _list path;
     license_arn = value_for_key arn_of_yojson "LicenseArn" _list path;
     grant_name = value_for_key string__of_yojson "GrantName" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
   }
    : create_grant_request)

let checkout_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PERPETUAL" -> PERPETUAL
    | `String "PROVISIONAL" -> PROVISIONAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "CheckoutType" value)
    | _ -> raise (deserialize_wrong_type_error path "CheckoutType")
     : checkout_type)
    : checkout_type)

let checkout_license_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_arn = option_of_yojson (value_for_key string__of_yojson "LicenseArn") _list path;
     expiration =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "Expiration") _list path;
     issued_at = option_of_yojson (value_for_key iso8601_date_time_of_yojson "IssuedAt") _list path;
     node_id = option_of_yojson (value_for_key string__of_yojson "NodeId") _list path;
     signed_token = option_of_yojson (value_for_key signed_token_of_yojson "SignedToken") _list path;
     entitlements_allowed =
       option_of_yojson
         (value_for_key entitlement_data_list_of_yojson "EntitlementsAllowed")
         _list path;
     license_consumption_token =
       option_of_yojson (value_for_key string__of_yojson "LicenseConsumptionToken") _list path;
     checkout_type =
       option_of_yojson (value_for_key checkout_type_of_yojson "CheckoutType") _list path;
   }
    : checkout_license_response)

let checkout_license_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     node_id = option_of_yojson (value_for_key string__of_yojson "NodeId") _list path;
     beneficiary = option_of_yojson (value_for_key string__of_yojson "Beneficiary") _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     entitlements = value_for_key entitlement_data_list_of_yojson "Entitlements" _list path;
     key_fingerprint = value_for_key string__of_yojson "KeyFingerprint" _list path;
     checkout_type = value_for_key checkout_type_of_yojson "CheckoutType" _list path;
     product_sk_u = value_for_key string__of_yojson "ProductSKU" _list path;
   }
    : checkout_license_request)

let checkout_borrow_license_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     checkout_metadata =
       option_of_yojson (value_for_key metadata_list_of_yojson "CheckoutMetadata") _list path;
     expiration =
       option_of_yojson (value_for_key iso8601_date_time_of_yojson "Expiration") _list path;
     issued_at = option_of_yojson (value_for_key iso8601_date_time_of_yojson "IssuedAt") _list path;
     signed_token = option_of_yojson (value_for_key signed_token_of_yojson "SignedToken") _list path;
     node_id = option_of_yojson (value_for_key string__of_yojson "NodeId") _list path;
     entitlements_allowed =
       option_of_yojson
         (value_for_key entitlement_data_list_of_yojson "EntitlementsAllowed")
         _list path;
     license_consumption_token =
       option_of_yojson (value_for_key string__of_yojson "LicenseConsumptionToken") _list path;
     license_arn = option_of_yojson (value_for_key arn_of_yojson "LicenseArn") _list path;
   }
    : checkout_borrow_license_response)

let checkout_borrow_license_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     checkout_metadata =
       option_of_yojson (value_for_key metadata_list_of_yojson "CheckoutMetadata") _list path;
     node_id = option_of_yojson (value_for_key string__of_yojson "NodeId") _list path;
     digital_signature_method =
       value_for_key digital_signature_method_of_yojson "DigitalSignatureMethod" _list path;
     entitlements = value_for_key entitlement_data_list_of_yojson "Entitlements" _list path;
     license_arn = value_for_key arn_of_yojson "LicenseArn" _list path;
   }
    : checkout_borrow_license_request)

let check_in_license_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let check_in_license_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     beneficiary = option_of_yojson (value_for_key string__of_yojson "Beneficiary") _list path;
     license_consumption_token =
       value_for_key string__of_yojson "LicenseConsumptionToken" _list path;
   }
    : check_in_license_request)

let accept_grant_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key string__of_yojson "Version") _list path;
     status = option_of_yojson (value_for_key grant_status_of_yojson "Status") _list path;
     grant_arn = option_of_yojson (value_for_key arn_of_yojson "GrantArn") _list path;
   }
    : accept_grant_response)

let accept_grant_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ grant_arn = value_for_key arn_of_yojson "GrantArn" _list path } : accept_grant_request)
