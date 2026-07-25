open Smaws_Lib.Json.SerializeHelpers
open Types

let aws_account_id_to_yojson = string_to_yojson
let aws_account_id_list_to_yojson tree = list_to_yojson aws_account_id_to_yojson tree
let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_operation_exception_to_yojson (x : invalid_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_error_exception_to_yojson (x : internal_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("TagList", Some (tag_list_to_yojson x.tag_list));
    ]

let resource_set_status_to_yojson (x : resource_set_status) =
  match x with ACTIVE -> `String "ACTIVE" | OUT_OF_ADMIN_SCOPE -> `String "OUT_OF_ADMIN_SCOPE"

let time_stamp_to_yojson = timestamp_epoch_seconds_to_yojson
let resource_type_to_yojson = string_to_yojson
let resource_type_list_to_yojson tree = list_to_yojson resource_type_to_yojson tree
let update_token_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson
let name_to_yojson = string_to_yojson
let base62_id_to_yojson = string_to_yojson

let resource_set_to_yojson (x : resource_set) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson base62_id_to_yojson x.id);
      ("Name", Some (name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("ResourceTypeList", Some (resource_type_list_to_yojson x.resource_type_list));
      ("LastUpdateTime", option_to_yojson time_stamp_to_yojson x.last_update_time);
      ("ResourceSetStatus", option_to_yojson resource_set_status_to_yojson x.resource_set_status);
    ]

let put_resource_set_response_to_yojson (x : put_resource_set_response) =
  assoc_to_yojson
    [
      ("ResourceSet", Some (resource_set_to_yojson x.resource_set));
      ("ResourceSetArn", Some (resource_arn_to_yojson x.resource_set_arn));
    ]

let put_resource_set_request_to_yojson (x : put_resource_set_request) =
  assoc_to_yojson
    [
      ("ResourceSet", Some (resource_set_to_yojson x.resource_set));
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
    ]

let protocol_to_yojson = string_to_yojson
let protocols_list_to_yojson tree = list_to_yojson protocol_to_yojson tree
let previous_list_version_to_yojson = string_to_yojson

let previous_protocols_list_to_yojson tree =
  map_to_yojson previous_list_version_to_yojson protocols_list_to_yojson tree

let resource_name_to_yojson = string_to_yojson
let list_id_to_yojson = string_to_yojson

let protocols_list_data_to_yojson (x : protocols_list_data) =
  assoc_to_yojson
    [
      ("ListId", option_to_yojson list_id_to_yojson x.list_id);
      ("ListName", Some (resource_name_to_yojson x.list_name));
      ("ListUpdateToken", option_to_yojson update_token_to_yojson x.list_update_token);
      ("CreateTime", option_to_yojson time_stamp_to_yojson x.create_time);
      ("LastUpdateTime", option_to_yojson time_stamp_to_yojson x.last_update_time);
      ("ProtocolsList", Some (protocols_list_to_yojson x.protocols_list));
      ( "PreviousProtocolsList",
        option_to_yojson previous_protocols_list_to_yojson x.previous_protocols_list );
    ]

let put_protocols_list_response_to_yojson (x : put_protocols_list_response) =
  assoc_to_yojson
    [
      ("ProtocolsList", option_to_yojson protocols_list_data_to_yojson x.protocols_list);
      ("ProtocolsListArn", option_to_yojson resource_arn_to_yojson x.protocols_list_arn);
    ]

let put_protocols_list_request_to_yojson (x : put_protocols_list_request) =
  assoc_to_yojson
    [
      ("ProtocolsList", Some (protocols_list_data_to_yojson x.protocols_list));
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
    ]

let invalid_type_exception_to_yojson (x : invalid_type_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_tag_logical_operator_to_yojson (x : resource_tag_logical_operator) =
  match x with AND -> `String "AND" | OR -> `String "OR"

let customer_policy_status_to_yojson (x : customer_policy_status) =
  match x with ACTIVE -> `String "ACTIVE" | OUT_OF_ADMIN_SCOPE -> `String "OUT_OF_ADMIN_SCOPE"

let resource_description_to_yojson = string_to_yojson
let resource_set_ids_to_yojson tree = list_to_yojson base62_id_to_yojson tree
let customer_policy_scope_id_to_yojson = string_to_yojson

let customer_policy_scope_id_list_to_yojson tree =
  list_to_yojson customer_policy_scope_id_to_yojson tree

let customer_policy_scope_id_type_to_yojson (x : customer_policy_scope_id_type) =
  match x with ACCOUNT -> `String "ACCOUNT" | ORG_UNIT -> `String "ORG_UNIT"

let customer_policy_scope_map_to_yojson tree =
  map_to_yojson customer_policy_scope_id_type_to_yojson customer_policy_scope_id_list_to_yojson tree

let boolean__to_yojson = bool_to_yojson
let resource_tag_value_to_yojson = string_to_yojson
let resource_tag_key_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("Key", Some (resource_tag_key_to_yojson x.key));
      ("Value", option_to_yojson resource_tag_value_to_yojson x.value);
    ]

let resource_tags_to_yojson tree = list_to_yojson resource_tag_to_yojson tree
let boolean_object_to_yojson = bool_to_yojson

let network_acl_rule_action_to_yojson (x : network_acl_rule_action) =
  match x with ALLOW -> `String "allow" | DENY -> `String "deny"

let length_bounded_non_empty_string_to_yojson = string_to_yojson
let ip_port_number_integer_to_yojson = int_to_yojson

let network_acl_port_range_to_yojson (x : network_acl_port_range) =
  assoc_to_yojson
    [
      ("From", option_to_yojson ip_port_number_integer_to_yojson x.from_);
      ("To", option_to_yojson ip_port_number_integer_to_yojson x.to_);
    ]

let length_bounded_string_to_yojson = string_to_yojson
let integer_object_to_yojson = int_to_yojson

let network_acl_icmp_type_code_to_yojson (x : network_acl_icmp_type_code) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson integer_object_to_yojson x.code);
      ("Type", option_to_yojson integer_object_to_yojson x.type_);
    ]

let network_acl_entry_to_yojson (x : network_acl_entry) =
  assoc_to_yojson
    [
      ("IcmpTypeCode", option_to_yojson network_acl_icmp_type_code_to_yojson x.icmp_type_code);
      ("Protocol", Some (length_bounded_string_to_yojson x.protocol));
      ("PortRange", option_to_yojson network_acl_port_range_to_yojson x.port_range);
      ("CidrBlock", option_to_yojson length_bounded_non_empty_string_to_yojson x.cidr_block);
      ("Ipv6CidrBlock", option_to_yojson length_bounded_non_empty_string_to_yojson x.ipv6_cidr_block);
      ("RuleAction", Some (network_acl_rule_action_to_yojson x.rule_action));
      ("Egress", Some (boolean_object_to_yojson x.egress));
    ]

let network_acl_entries_to_yojson tree = list_to_yojson network_acl_entry_to_yojson tree

let network_acl_entry_set_to_yojson (x : network_acl_entry_set) =
  assoc_to_yojson
    [
      ("FirstEntries", option_to_yojson network_acl_entries_to_yojson x.first_entries);
      ( "ForceRemediateForFirstEntries",
        Some (boolean_object_to_yojson x.force_remediate_for_first_entries) );
      ("LastEntries", option_to_yojson network_acl_entries_to_yojson x.last_entries);
      ( "ForceRemediateForLastEntries",
        Some (boolean_object_to_yojson x.force_remediate_for_last_entries) );
    ]

let network_acl_common_policy_to_yojson (x : network_acl_common_policy) =
  assoc_to_yojson
    [ ("NetworkAclEntrySet", Some (network_acl_entry_set_to_yojson x.network_acl_entry_set)) ]

let firewall_deployment_model_to_yojson (x : firewall_deployment_model) =
  match x with CENTRALIZED -> `String "CENTRALIZED" | DISTRIBUTED -> `String "DISTRIBUTED"

let third_party_firewall_policy_to_yojson (x : third_party_firewall_policy) =
  assoc_to_yojson
    [
      ( "FirewallDeploymentModel",
        option_to_yojson firewall_deployment_model_to_yojson x.firewall_deployment_model );
    ]

let network_firewall_policy_to_yojson (x : network_firewall_policy) =
  assoc_to_yojson
    [
      ( "FirewallDeploymentModel",
        option_to_yojson firewall_deployment_model_to_yojson x.firewall_deployment_model );
    ]

let policy_option_to_yojson (x : policy_option) =
  assoc_to_yojson
    [
      ( "NetworkFirewallPolicy",
        option_to_yojson network_firewall_policy_to_yojson x.network_firewall_policy );
      ( "ThirdPartyFirewallPolicy",
        option_to_yojson third_party_firewall_policy_to_yojson x.third_party_firewall_policy );
      ( "NetworkAclCommonPolicy",
        option_to_yojson network_acl_common_policy_to_yojson x.network_acl_common_policy );
    ]

let managed_service_data_to_yojson = string_to_yojson

let security_service_type_to_yojson (x : security_service_type) =
  match x with
  | WAF -> `String "WAF"
  | WAFV2 -> `String "WAFV2"
  | SHIELD_ADVANCED -> `String "SHIELD_ADVANCED"
  | SECURITY_GROUPS_COMMON -> `String "SECURITY_GROUPS_COMMON"
  | SECURITY_GROUPS_CONTENT_AUDIT -> `String "SECURITY_GROUPS_CONTENT_AUDIT"
  | SECURITY_GROUPS_USAGE_AUDIT -> `String "SECURITY_GROUPS_USAGE_AUDIT"
  | NETWORK_FIREWALL -> `String "NETWORK_FIREWALL"
  | DNS_FIREWALL -> `String "DNS_FIREWALL"
  | THIRD_PARTY_FIREWALL -> `String "THIRD_PARTY_FIREWALL"
  | IMPORT_NETWORK_FIREWALL -> `String "IMPORT_NETWORK_FIREWALL"
  | NETWORK_ACL_COMMON -> `String "NETWORK_ACL_COMMON"

let security_service_policy_data_to_yojson (x : security_service_policy_data) =
  assoc_to_yojson
    [
      ("Type", Some (security_service_type_to_yojson x.type_));
      ("ManagedServiceData", option_to_yojson managed_service_data_to_yojson x.managed_service_data);
      ("PolicyOption", option_to_yojson policy_option_to_yojson x.policy_option);
    ]

let policy_update_token_to_yojson = string_to_yojson
let policy_id_to_yojson = string_to_yojson

let policy_to_yojson (x : policy) =
  assoc_to_yojson
    [
      ("PolicyId", option_to_yojson policy_id_to_yojson x.policy_id);
      ("PolicyName", Some (resource_name_to_yojson x.policy_name));
      ("PolicyUpdateToken", option_to_yojson policy_update_token_to_yojson x.policy_update_token);
      ( "SecurityServicePolicyData",
        Some (security_service_policy_data_to_yojson x.security_service_policy_data) );
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("ResourceTypeList", option_to_yojson resource_type_list_to_yojson x.resource_type_list);
      ("ResourceTags", option_to_yojson resource_tags_to_yojson x.resource_tags);
      ("ExcludeResourceTags", Some (boolean__to_yojson x.exclude_resource_tags));
      ("RemediationEnabled", Some (boolean__to_yojson x.remediation_enabled));
      ( "DeleteUnusedFMManagedResources",
        option_to_yojson boolean__to_yojson x.delete_unused_fm_managed_resources );
      ("IncludeMap", option_to_yojson customer_policy_scope_map_to_yojson x.include_map);
      ("ExcludeMap", option_to_yojson customer_policy_scope_map_to_yojson x.exclude_map);
      ("ResourceSetIds", option_to_yojson resource_set_ids_to_yojson x.resource_set_ids);
      ("PolicyDescription", option_to_yojson resource_description_to_yojson x.policy_description);
      ("PolicyStatus", option_to_yojson customer_policy_status_to_yojson x.policy_status);
      ( "ResourceTagLogicalOperator",
        option_to_yojson resource_tag_logical_operator_to_yojson x.resource_tag_logical_operator );
    ]

let put_policy_response_to_yojson (x : put_policy_response) =
  assoc_to_yojson
    [
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ("PolicyArn", option_to_yojson resource_arn_to_yojson x.policy_arn);
    ]

let put_policy_request_to_yojson (x : put_policy_request) =
  assoc_to_yojson
    [
      ("Policy", Some (policy_to_yojson x.policy));
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
    ]

let put_notification_channel_request_to_yojson (x : put_notification_channel_request) =
  assoc_to_yojson
    [
      ("SnsTopicArn", Some (resource_arn_to_yojson x.sns_topic_arn));
      ("SnsRoleName", Some (resource_arn_to_yojson x.sns_role_name));
    ]

let ip_port_number_to_yojson = long_to_yojson

let app_to_yojson (x : app) =
  assoc_to_yojson
    [
      ("AppName", Some (resource_name_to_yojson x.app_name));
      ("Protocol", Some (protocol_to_yojson x.protocol));
      ("Port", Some (ip_port_number_to_yojson x.port));
    ]

let apps_list_to_yojson tree = list_to_yojson app_to_yojson tree

let previous_apps_list_to_yojson tree =
  map_to_yojson previous_list_version_to_yojson apps_list_to_yojson tree

let apps_list_data_to_yojson (x : apps_list_data) =
  assoc_to_yojson
    [
      ("ListId", option_to_yojson list_id_to_yojson x.list_id);
      ("ListName", Some (resource_name_to_yojson x.list_name));
      ("ListUpdateToken", option_to_yojson update_token_to_yojson x.list_update_token);
      ("CreateTime", option_to_yojson time_stamp_to_yojson x.create_time);
      ("LastUpdateTime", option_to_yojson time_stamp_to_yojson x.last_update_time);
      ("AppsList", Some (apps_list_to_yojson x.apps_list));
      ("PreviousAppsList", option_to_yojson previous_apps_list_to_yojson x.previous_apps_list);
    ]

let put_apps_list_response_to_yojson (x : put_apps_list_response) =
  assoc_to_yojson
    [
      ("AppsList", option_to_yojson apps_list_data_to_yojson x.apps_list);
      ("AppsListArn", option_to_yojson resource_arn_to_yojson x.apps_list_arn);
    ]

let put_apps_list_request_to_yojson (x : put_apps_list_request) =
  assoc_to_yojson
    [
      ("AppsList", Some (apps_list_data_to_yojson x.apps_list));
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
    ]

let security_service_type_list_to_yojson tree = list_to_yojson security_service_type_to_yojson tree

let policy_type_scope_to_yojson (x : policy_type_scope) =
  assoc_to_yojson
    [
      ("PolicyTypes", option_to_yojson security_service_type_list_to_yojson x.policy_types);
      ("AllPolicyTypesEnabled", option_to_yojson boolean__to_yojson x.all_policy_types_enabled);
    ]

let aws_region_to_yojson = string_to_yojson
let aws_region_list_to_yojson tree = list_to_yojson aws_region_to_yojson tree

let region_scope_to_yojson (x : region_scope) =
  assoc_to_yojson
    [
      ("Regions", option_to_yojson aws_region_list_to_yojson x.regions);
      ("AllRegionsEnabled", option_to_yojson boolean__to_yojson x.all_regions_enabled);
    ]

let organizational_unit_id_to_yojson = string_to_yojson

let organizational_unit_id_list_to_yojson tree =
  list_to_yojson organizational_unit_id_to_yojson tree

let organizational_unit_scope_to_yojson (x : organizational_unit_scope) =
  assoc_to_yojson
    [
      ( "OrganizationalUnits",
        option_to_yojson organizational_unit_id_list_to_yojson x.organizational_units );
      ( "AllOrganizationalUnitsEnabled",
        option_to_yojson boolean__to_yojson x.all_organizational_units_enabled );
      ( "ExcludeSpecifiedOrganizationalUnits",
        option_to_yojson boolean__to_yojson x.exclude_specified_organizational_units );
    ]

let account_id_list_to_yojson tree = list_to_yojson aws_account_id_to_yojson tree

let account_scope_to_yojson (x : account_scope) =
  assoc_to_yojson
    [
      ("Accounts", option_to_yojson account_id_list_to_yojson x.accounts);
      ("AllAccountsEnabled", option_to_yojson boolean__to_yojson x.all_accounts_enabled);
      ("ExcludeSpecifiedAccounts", option_to_yojson boolean__to_yojson x.exclude_specified_accounts);
    ]

let admin_scope_to_yojson (x : admin_scope) =
  assoc_to_yojson
    [
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
      ( "OrganizationalUnitScope",
        option_to_yojson organizational_unit_scope_to_yojson x.organizational_unit_scope );
      ("RegionScope", option_to_yojson region_scope_to_yojson x.region_scope);
      ("PolicyTypeScope", option_to_yojson policy_type_scope_to_yojson x.policy_type_scope);
    ]

let put_admin_account_request_to_yojson (x : put_admin_account_request) =
  assoc_to_yojson
    [
      ("AdminAccount", Some (aws_account_id_to_yojson x.admin_account));
      ("AdminScope", option_to_yojson admin_scope_to_yojson x.admin_scope);
    ]

let pagination_token_to_yojson = string_to_yojson
let firewall_policy_name_to_yojson = string_to_yojson
let firewall_policy_id_to_yojson = string_to_yojson

let third_party_firewall_firewall_policy_to_yojson (x : third_party_firewall_firewall_policy) =
  assoc_to_yojson
    [
      ("FirewallPolicyId", option_to_yojson firewall_policy_id_to_yojson x.firewall_policy_id);
      ("FirewallPolicyName", option_to_yojson firewall_policy_name_to_yojson x.firewall_policy_name);
    ]

let third_party_firewall_firewall_policies_to_yojson tree =
  list_to_yojson third_party_firewall_firewall_policy_to_yojson tree

let list_third_party_firewall_firewall_policies_response_to_yojson
    (x : list_third_party_firewall_firewall_policies_response) =
  assoc_to_yojson
    [
      ( "ThirdPartyFirewallFirewallPolicies",
        option_to_yojson third_party_firewall_firewall_policies_to_yojson
          x.third_party_firewall_firewall_policies );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let pagination_max_results_to_yojson = int_to_yojson

let third_party_firewall_to_yojson (x : third_party_firewall) =
  match x with
  | PALO_ALTO_NETWORKS_CLOUD_NGFW -> `String "PALO_ALTO_NETWORKS_CLOUD_NGFW"
  | FORTIGATE_CLOUD_NATIVE_FIREWALL -> `String "FORTIGATE_CLOUD_NATIVE_FIREWALL"

let list_third_party_firewall_firewall_policies_request_to_yojson
    (x : list_third_party_firewall_firewall_policies_request) =
  assoc_to_yojson
    [
      ("ThirdPartyFirewall", Some (third_party_firewall_to_yojson x.third_party_firewall));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", Some (pagination_max_results_to_yojson x.max_results));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let resource_set_summary_to_yojson (x : resource_set_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson base62_id_to_yojson x.id);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("LastUpdateTime", option_to_yojson time_stamp_to_yojson x.last_update_time);
      ("ResourceSetStatus", option_to_yojson resource_set_status_to_yojson x.resource_set_status);
    ]

let resource_set_summary_list_to_yojson tree = list_to_yojson resource_set_summary_to_yojson tree

let list_resource_sets_response_to_yojson (x : list_resource_sets_response) =
  assoc_to_yojson
    [
      ("ResourceSets", option_to_yojson resource_set_summary_list_to_yojson x.resource_sets);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_resource_sets_request_to_yojson (x : list_resource_sets_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let identifier_to_yojson = string_to_yojson

let resource_to_yojson (x : resource) =
  assoc_to_yojson
    [
      ("URI", Some (identifier_to_yojson x.ur_i));
      ("AccountId", option_to_yojson aws_account_id_to_yojson x.account_id);
    ]

let resource_list_to_yojson tree = list_to_yojson resource_to_yojson tree

let list_resource_set_resources_response_to_yojson (x : list_resource_set_resources_response) =
  assoc_to_yojson
    [
      ("Items", Some (resource_list_to_yojson x.items));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let resource_id_to_yojson = string_to_yojson

let list_resource_set_resources_request_to_yojson (x : list_resource_set_resources_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (resource_id_to_yojson x.identifier));
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let protocols_list_data_summary_to_yojson (x : protocols_list_data_summary) =
  assoc_to_yojson
    [
      ("ListArn", option_to_yojson resource_arn_to_yojson x.list_arn);
      ("ListId", option_to_yojson list_id_to_yojson x.list_id);
      ("ListName", option_to_yojson resource_name_to_yojson x.list_name);
      ("ProtocolsList", option_to_yojson protocols_list_to_yojson x.protocols_list);
    ]

let protocols_lists_data_to_yojson tree = list_to_yojson protocols_list_data_summary_to_yojson tree

let list_protocols_lists_response_to_yojson (x : list_protocols_lists_response) =
  assoc_to_yojson
    [
      ("ProtocolsLists", option_to_yojson protocols_lists_data_to_yojson x.protocols_lists);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_protocols_lists_request_to_yojson (x : list_protocols_lists_request) =
  assoc_to_yojson
    [
      ("DefaultLists", option_to_yojson boolean__to_yojson x.default_lists);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", Some (pagination_max_results_to_yojson x.max_results));
    ]

let policy_summary_to_yojson (x : policy_summary) =
  assoc_to_yojson
    [
      ("PolicyArn", option_to_yojson resource_arn_to_yojson x.policy_arn);
      ("PolicyId", option_to_yojson policy_id_to_yojson x.policy_id);
      ("PolicyName", option_to_yojson resource_name_to_yojson x.policy_name);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "SecurityServiceType",
        option_to_yojson security_service_type_to_yojson x.security_service_type );
      ("RemediationEnabled", option_to_yojson boolean__to_yojson x.remediation_enabled);
      ( "DeleteUnusedFMManagedResources",
        option_to_yojson boolean__to_yojson x.delete_unused_fm_managed_resources );
      ("PolicyStatus", option_to_yojson customer_policy_status_to_yojson x.policy_status);
    ]

let policy_summary_list_to_yojson tree = list_to_yojson policy_summary_to_yojson tree

let list_policies_response_to_yojson (x : list_policies_response) =
  assoc_to_yojson
    [
      ("PolicyList", option_to_yojson policy_summary_list_to_yojson x.policy_list);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_policies_request_to_yojson (x : list_policies_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let member_accounts_to_yojson tree = list_to_yojson aws_account_id_to_yojson tree

let list_member_accounts_response_to_yojson (x : list_member_accounts_response) =
  assoc_to_yojson
    [
      ("MemberAccounts", option_to_yojson member_accounts_to_yojson x.member_accounts);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_member_accounts_request_to_yojson (x : list_member_accounts_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let discovered_resource_to_yojson (x : discovered_resource) =
  assoc_to_yojson
    [
      ("URI", option_to_yojson identifier_to_yojson x.ur_i);
      ("AccountId", option_to_yojson aws_account_id_to_yojson x.account_id);
      ("Type", option_to_yojson resource_type_to_yojson x.type_);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let discovered_resource_list_to_yojson tree = list_to_yojson discovered_resource_to_yojson tree

let list_discovered_resources_response_to_yojson (x : list_discovered_resources_response) =
  assoc_to_yojson
    [
      ("Items", option_to_yojson discovered_resource_list_to_yojson x.items);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_discovered_resources_request_to_yojson (x : list_discovered_resources_request) =
  assoc_to_yojson
    [
      ("MemberAccountIds", Some (aws_account_id_list_to_yojson x.member_account_ids));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let detailed_info_to_yojson = string_to_yojson

let dependent_service_name_to_yojson (x : dependent_service_name) =
  match x with
  | AWSConfig -> `String "AWSCONFIG"
  | AWSWAF -> `String "AWSWAF"
  | AWSShieldAdvanced -> `String "AWSSHIELD_ADVANCED"
  | AWSVirtualPrivateCloud -> `String "AWSVPC"

let issue_info_map_to_yojson tree =
  map_to_yojson dependent_service_name_to_yojson detailed_info_to_yojson tree

let resource_count_to_yojson = long_to_yojson

let policy_compliance_status_type_to_yojson (x : policy_compliance_status_type) =
  match x with Compliant -> `String "COMPLIANT" | NonCompliant -> `String "NON_COMPLIANT"

let evaluation_result_to_yojson (x : evaluation_result) =
  assoc_to_yojson
    [
      ( "ComplianceStatus",
        option_to_yojson policy_compliance_status_type_to_yojson x.compliance_status );
      ("ViolatorCount", option_to_yojson resource_count_to_yojson x.violator_count);
      ("EvaluationLimitExceeded", option_to_yojson boolean__to_yojson x.evaluation_limit_exceeded);
    ]

let evaluation_results_to_yojson tree = list_to_yojson evaluation_result_to_yojson tree

let policy_compliance_status_to_yojson (x : policy_compliance_status) =
  assoc_to_yojson
    [
      ("PolicyOwner", option_to_yojson aws_account_id_to_yojson x.policy_owner);
      ("PolicyId", option_to_yojson policy_id_to_yojson x.policy_id);
      ("PolicyName", option_to_yojson resource_name_to_yojson x.policy_name);
      ("MemberAccount", option_to_yojson aws_account_id_to_yojson x.member_account);
      ("EvaluationResults", option_to_yojson evaluation_results_to_yojson x.evaluation_results);
      ("LastUpdated", option_to_yojson time_stamp_to_yojson x.last_updated);
      ("IssueInfoMap", option_to_yojson issue_info_map_to_yojson x.issue_info_map);
    ]

let policy_compliance_status_list_to_yojson tree =
  list_to_yojson policy_compliance_status_to_yojson tree

let list_compliance_status_response_to_yojson (x : list_compliance_status_response) =
  assoc_to_yojson
    [
      ( "PolicyComplianceStatusList",
        option_to_yojson policy_compliance_status_list_to_yojson x.policy_compliance_status_list );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_compliance_status_request_to_yojson (x : list_compliance_status_request) =
  assoc_to_yojson
    [
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let apps_list_data_summary_to_yojson (x : apps_list_data_summary) =
  assoc_to_yojson
    [
      ("ListArn", option_to_yojson resource_arn_to_yojson x.list_arn);
      ("ListId", option_to_yojson list_id_to_yojson x.list_id);
      ("ListName", option_to_yojson resource_name_to_yojson x.list_name);
      ("AppsList", option_to_yojson apps_list_to_yojson x.apps_list);
    ]

let apps_lists_data_to_yojson tree = list_to_yojson apps_list_data_summary_to_yojson tree

let list_apps_lists_response_to_yojson (x : list_apps_lists_response) =
  assoc_to_yojson
    [
      ("AppsLists", option_to_yojson apps_lists_data_to_yojson x.apps_lists);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_apps_lists_request_to_yojson (x : list_apps_lists_request) =
  assoc_to_yojson
    [
      ("DefaultLists", option_to_yojson boolean__to_yojson x.default_lists);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", Some (pagination_max_results_to_yojson x.max_results));
    ]

let list_admins_managing_account_response_to_yojson (x : list_admins_managing_account_response) =
  assoc_to_yojson
    [
      ("AdminAccounts", option_to_yojson account_id_list_to_yojson x.admin_accounts);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_admins_managing_account_request_to_yojson (x : list_admins_managing_account_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let organization_status_to_yojson (x : organization_status) =
  match x with
  | Onboarding -> `String "ONBOARDING"
  | OnboardingComplete -> `String "ONBOARDING_COMPLETE"
  | Offboarding -> `String "OFFBOARDING"
  | OffboardingComplete -> `String "OFFBOARDING_COMPLETE"

let admin_account_summary_to_yojson (x : admin_account_summary) =
  assoc_to_yojson
    [
      ("AdminAccount", option_to_yojson aws_account_id_to_yojson x.admin_account);
      ("DefaultAdmin", option_to_yojson boolean__to_yojson x.default_admin);
      ("Status", option_to_yojson organization_status_to_yojson x.status);
    ]

let admin_account_summary_list_to_yojson tree = list_to_yojson admin_account_summary_to_yojson tree

let list_admin_accounts_for_organization_response_to_yojson
    (x : list_admin_accounts_for_organization_response) =
  assoc_to_yojson
    [
      ("AdminAccounts", option_to_yojson admin_account_summary_list_to_yojson x.admin_accounts);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_admin_accounts_for_organization_request_to_yojson
    (x : list_admin_accounts_for_organization_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let resource_arn_list_to_yojson tree = list_to_yojson resource_arn_to_yojson tree

let web_acl_has_out_of_scope_resources_violation_to_yojson
    (x : web_acl_has_out_of_scope_resources_violation) =
  assoc_to_yojson
    [
      ("WebACLArn", option_to_yojson resource_arn_to_yojson x.web_acl_arn);
      ( "OutOfScopeResourceList",
        option_to_yojson resource_arn_list_to_yojson x.out_of_scope_resource_list );
    ]

let web_acl_has_incompatible_configuration_violation_to_yojson
    (x : web_acl_has_incompatible_configuration_violation) =
  assoc_to_yojson
    [
      ("WebACLArn", option_to_yojson resource_arn_to_yojson x.web_acl_arn);
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
    ]

let basic_integer_to_yojson = int_to_yojson

let entry_type_to_yojson (x : entry_type) =
  match x with
  | FMSManagedFirstEntry -> `String "FMS_MANAGED_FIRST_ENTRY"
  | FMSManagedLastEntry -> `String "FMS_MANAGED_LAST_ENTRY"
  | CustomEntry -> `String "CUSTOM_ENTRY"

let integer_object_minimum0_to_yojson = int_to_yojson

let entry_description_to_yojson (x : entry_description) =
  assoc_to_yojson
    [
      ("EntryDetail", option_to_yojson network_acl_entry_to_yojson x.entry_detail);
      ("EntryRuleNumber", option_to_yojson integer_object_minimum0_to_yojson x.entry_rule_number);
      ("EntryType", option_to_yojson entry_type_to_yojson x.entry_type);
    ]

let entries_description_to_yojson tree = list_to_yojson entry_description_to_yojson tree

let action_target_to_yojson (x : action_target) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
    ]

let delete_network_acl_entries_action_to_yojson (x : delete_network_acl_entries_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("NetworkAclId", option_to_yojson action_target_to_yojson x.network_acl_id);
      ( "NetworkAclEntriesToBeDeleted",
        option_to_yojson entries_description_to_yojson x.network_acl_entries_to_be_deleted );
      ("FMSCanRemediate", option_to_yojson boolean__to_yojson x.fms_can_remediate);
    ]

let create_network_acl_entries_action_to_yojson (x : create_network_acl_entries_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("NetworkAclId", option_to_yojson action_target_to_yojson x.network_acl_id);
      ( "NetworkAclEntriesToBeCreated",
        option_to_yojson entries_description_to_yojson x.network_acl_entries_to_be_created );
      ("FMSCanRemediate", option_to_yojson boolean__to_yojson x.fms_can_remediate);
    ]

let replace_network_acl_association_action_to_yojson (x : replace_network_acl_association_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("AssociationId", option_to_yojson action_target_to_yojson x.association_id);
      ("NetworkAclId", option_to_yojson action_target_to_yojson x.network_acl_id);
      ("FMSCanRemediate", option_to_yojson boolean__to_yojson x.fms_can_remediate);
    ]

let create_network_acl_action_to_yojson (x : create_network_acl_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("Vpc", option_to_yojson action_target_to_yojson x.vpc);
      ("FMSCanRemediate", option_to_yojson boolean__to_yojson x.fms_can_remediate);
    ]

let fms_policy_update_firewall_creation_config_action_to_yojson
    (x : fms_policy_update_firewall_creation_config_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ( "FirewallCreationConfig",
        option_to_yojson managed_service_data_to_yojson x.firewall_creation_config );
    ]

let ec2_create_route_table_action_to_yojson (x : ec2_create_route_table_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("VpcId", Some (action_target_to_yojson x.vpc_id));
    ]

let ec2_associate_route_table_action_to_yojson (x : ec2_associate_route_table_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("RouteTableId", Some (action_target_to_yojson x.route_table_id));
      ("SubnetId", option_to_yojson action_target_to_yojson x.subnet_id);
      ("GatewayId", option_to_yojson action_target_to_yojson x.gateway_id);
    ]

let ec2_replace_route_table_association_action_to_yojson
    (x : ec2_replace_route_table_association_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("AssociationId", Some (action_target_to_yojson x.association_id));
      ("RouteTableId", Some (action_target_to_yojson x.route_table_id));
    ]

let ec2_copy_route_table_action_to_yojson (x : ec2_copy_route_table_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("VpcId", Some (action_target_to_yojson x.vpc_id));
      ("RouteTableId", Some (action_target_to_yojson x.route_table_id));
    ]

let cid_r_to_yojson = string_to_yojson

let ec2_delete_route_action_to_yojson (x : ec2_delete_route_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("DestinationCidrBlock", option_to_yojson cid_r_to_yojson x.destination_cidr_block);
      ( "DestinationPrefixListId",
        option_to_yojson resource_id_to_yojson x.destination_prefix_list_id );
      ("DestinationIpv6CidrBlock", option_to_yojson cid_r_to_yojson x.destination_ipv6_cidr_block);
      ("RouteTableId", Some (action_target_to_yojson x.route_table_id));
    ]

let ec2_replace_route_action_to_yojson (x : ec2_replace_route_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("DestinationCidrBlock", option_to_yojson cid_r_to_yojson x.destination_cidr_block);
      ( "DestinationPrefixListId",
        option_to_yojson resource_id_to_yojson x.destination_prefix_list_id );
      ("DestinationIpv6CidrBlock", option_to_yojson cid_r_to_yojson x.destination_ipv6_cidr_block);
      ("GatewayId", option_to_yojson action_target_to_yojson x.gateway_id);
      ("RouteTableId", Some (action_target_to_yojson x.route_table_id));
    ]

let ec2_create_route_action_to_yojson (x : ec2_create_route_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("DestinationCidrBlock", option_to_yojson cid_r_to_yojson x.destination_cidr_block);
      ( "DestinationPrefixListId",
        option_to_yojson resource_id_to_yojson x.destination_prefix_list_id );
      ("DestinationIpv6CidrBlock", option_to_yojson cid_r_to_yojson x.destination_ipv6_cidr_block);
      ("VpcEndpointId", option_to_yojson action_target_to_yojson x.vpc_endpoint_id);
      ("GatewayId", option_to_yojson action_target_to_yojson x.gateway_id);
      ("RouteTableId", Some (action_target_to_yojson x.route_table_id));
    ]

let remediation_action_to_yojson (x : remediation_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ( "EC2CreateRouteAction",
        option_to_yojson ec2_create_route_action_to_yojson x.ec2_create_route_action );
      ( "EC2ReplaceRouteAction",
        option_to_yojson ec2_replace_route_action_to_yojson x.ec2_replace_route_action );
      ( "EC2DeleteRouteAction",
        option_to_yojson ec2_delete_route_action_to_yojson x.ec2_delete_route_action );
      ( "EC2CopyRouteTableAction",
        option_to_yojson ec2_copy_route_table_action_to_yojson x.ec2_copy_route_table_action );
      ( "EC2ReplaceRouteTableAssociationAction",
        option_to_yojson ec2_replace_route_table_association_action_to_yojson
          x.ec2_replace_route_table_association_action );
      ( "EC2AssociateRouteTableAction",
        option_to_yojson ec2_associate_route_table_action_to_yojson
          x.ec2_associate_route_table_action );
      ( "EC2CreateRouteTableAction",
        option_to_yojson ec2_create_route_table_action_to_yojson x.ec2_create_route_table_action );
      ( "FMSPolicyUpdateFirewallCreationConfigAction",
        option_to_yojson fms_policy_update_firewall_creation_config_action_to_yojson
          x.fms_policy_update_firewall_creation_config_action );
      ( "CreateNetworkAclAction",
        option_to_yojson create_network_acl_action_to_yojson x.create_network_acl_action );
      ( "ReplaceNetworkAclAssociationAction",
        option_to_yojson replace_network_acl_association_action_to_yojson
          x.replace_network_acl_association_action );
      ( "CreateNetworkAclEntriesAction",
        option_to_yojson create_network_acl_entries_action_to_yojson
          x.create_network_acl_entries_action );
      ( "DeleteNetworkAclEntriesAction",
        option_to_yojson delete_network_acl_entries_action_to_yojson
          x.delete_network_acl_entries_action );
    ]

let remediation_action_with_order_to_yojson (x : remediation_action_with_order) =
  assoc_to_yojson
    [
      ("RemediationAction", option_to_yojson remediation_action_to_yojson x.remediation_action);
      ("Order", option_to_yojson basic_integer_to_yojson x.order);
    ]

let ordered_remediation_actions_to_yojson tree =
  list_to_yojson remediation_action_with_order_to_yojson tree

let possible_remediation_action_to_yojson (x : possible_remediation_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ( "OrderedRemediationActions",
        Some (ordered_remediation_actions_to_yojson x.ordered_remediation_actions) );
      ("IsDefaultAction", option_to_yojson boolean__to_yojson x.is_default_action);
    ]

let possible_remediation_action_list_to_yojson tree =
  list_to_yojson possible_remediation_action_to_yojson tree

let possible_remediation_actions_to_yojson (x : possible_remediation_actions) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson length_bounded_string_to_yojson x.description);
      ("Actions", option_to_yojson possible_remediation_action_list_to_yojson x.actions);
    ]

let entry_violation_reason_to_yojson (x : entry_violation_reason) =
  match x with
  | MissingExpectedEntry -> `String "MISSING_EXPECTED_ENTRY"
  | IncorrectEntryOrder -> `String "INCORRECT_ENTRY_ORDER"
  | EntryConflict -> `String "ENTRY_CONFLICT"

let entry_violation_reasons_to_yojson tree = list_to_yojson entry_violation_reason_to_yojson tree
let entries_with_conflicts_to_yojson tree = list_to_yojson entry_description_to_yojson tree

let entry_violation_to_yojson (x : entry_violation) =
  assoc_to_yojson
    [
      ("ExpectedEntry", option_to_yojson entry_description_to_yojson x.expected_entry);
      ( "ExpectedEvaluationOrder",
        option_to_yojson length_bounded_string_to_yojson x.expected_evaluation_order );
      ( "ActualEvaluationOrder",
        option_to_yojson length_bounded_string_to_yojson x.actual_evaluation_order );
      ( "EntryAtExpectedEvaluationOrder",
        option_to_yojson entry_description_to_yojson x.entry_at_expected_evaluation_order );
      ( "EntriesWithConflicts",
        option_to_yojson entries_with_conflicts_to_yojson x.entries_with_conflicts );
      ( "EntryViolationReasons",
        option_to_yojson entry_violation_reasons_to_yojson x.entry_violation_reasons );
    ]

let entry_violations_to_yojson tree = list_to_yojson entry_violation_to_yojson tree

let invalid_network_acl_entries_violation_to_yojson (x : invalid_network_acl_entries_violation) =
  assoc_to_yojson
    [
      ("Vpc", option_to_yojson resource_id_to_yojson x.vpc);
      ("Subnet", option_to_yojson resource_id_to_yojson x.subnet);
      ( "SubnetAvailabilityZone",
        option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone );
      ( "CurrentAssociatedNetworkAcl",
        option_to_yojson resource_id_to_yojson x.current_associated_network_acl );
      ("EntryViolations", option_to_yojson entry_violations_to_yojson x.entry_violations);
    ]

let firewall_subnet_missing_vpc_endpoint_violation_to_yojson
    (x : firewall_subnet_missing_vpc_endpoint_violation) =
  assoc_to_yojson
    [
      ("FirewallSubnetId", option_to_yojson resource_id_to_yojson x.firewall_subnet_id);
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
      ( "SubnetAvailabilityZone",
        option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone );
      ( "SubnetAvailabilityZoneId",
        option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone_id );
    ]

let violation_target_to_yojson = string_to_yojson

let third_party_firewall_missing_expected_route_table_violation_to_yojson
    (x : third_party_firewall_missing_expected_route_table_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ("VPC", option_to_yojson resource_id_to_yojson x.vp_c);
      ("AvailabilityZone", option_to_yojson length_bounded_string_to_yojson x.availability_zone);
      ("CurrentRouteTable", option_to_yojson resource_id_to_yojson x.current_route_table);
      ("ExpectedRouteTable", option_to_yojson resource_id_to_yojson x.expected_route_table);
    ]

let target_violation_reason_to_yojson = string_to_yojson

let third_party_firewall_missing_subnet_violation_to_yojson
    (x : third_party_firewall_missing_subnet_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ("VPC", option_to_yojson resource_id_to_yojson x.vp_c);
      ("AvailabilityZone", option_to_yojson length_bounded_string_to_yojson x.availability_zone);
      ( "TargetViolationReason",
        option_to_yojson target_violation_reason_to_yojson x.target_violation_reason );
    ]

let third_party_firewall_missing_firewall_violation_to_yojson
    (x : third_party_firewall_missing_firewall_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ("VPC", option_to_yojson resource_id_to_yojson x.vp_c);
      ("AvailabilityZone", option_to_yojson length_bounded_string_to_yojson x.availability_zone);
      ( "TargetViolationReason",
        option_to_yojson target_violation_reason_to_yojson x.target_violation_reason );
    ]

let target_type_to_yojson (x : target_type) =
  match x with
  | Gateway -> `String "GATEWAY"
  | CarrierGateway -> `String "CARRIER_GATEWAY"
  | Instance -> `String "INSTANCE"
  | LocalGateway -> `String "LOCAL_GATEWAY"
  | NatGateway -> `String "NAT_GATEWAY"
  | NetworkInterface -> `String "NETWORK_INTERFACE"
  | VPCEndpoint -> `String "VPC_ENDPOINT"
  | VPCPeeringConnection -> `String "VPC_PEERING_CONNECTION"
  | EgressOnlyInternetGateway -> `String "EGRESS_ONLY_INTERNET_GATEWAY"
  | TransitGateway -> `String "TRANSIT_GATEWAY"

let destination_type_to_yojson (x : destination_type) =
  match x with
  | IPV4 -> `String "IPV4"
  | IPV6 -> `String "IPV6"
  | PrefixList -> `String "PREFIX_LIST"

let route_to_yojson (x : route) =
  assoc_to_yojson
    [
      ("DestinationType", option_to_yojson destination_type_to_yojson x.destination_type);
      ("TargetType", option_to_yojson target_type_to_yojson x.target_type);
      ("Destination", option_to_yojson length_bounded_string_to_yojson x.destination);
      ("Target", option_to_yojson length_bounded_string_to_yojson x.target);
    ]

let routes_to_yojson tree = list_to_yojson route_to_yojson tree

let route_has_out_of_scope_endpoint_violation_to_yojson
    (x : route_has_out_of_scope_endpoint_violation) =
  assoc_to_yojson
    [
      ("SubnetId", option_to_yojson resource_id_to_yojson x.subnet_id);
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
      ("RouteTableId", option_to_yojson resource_id_to_yojson x.route_table_id);
      ("ViolatingRoutes", option_to_yojson routes_to_yojson x.violating_routes);
      ( "SubnetAvailabilityZone",
        option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone );
      ( "SubnetAvailabilityZoneId",
        option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone_id );
      ( "CurrentFirewallSubnetRouteTable",
        option_to_yojson resource_id_to_yojson x.current_firewall_subnet_route_table );
      ("FirewallSubnetId", option_to_yojson resource_id_to_yojson x.firewall_subnet_id);
      ("FirewallSubnetRoutes", option_to_yojson routes_to_yojson x.firewall_subnet_routes);
      ("InternetGatewayId", option_to_yojson resource_id_to_yojson x.internet_gateway_id);
      ( "CurrentInternetGatewayRouteTable",
        option_to_yojson resource_id_to_yojson x.current_internet_gateway_route_table );
      ("InternetGatewayRoutes", option_to_yojson routes_to_yojson x.internet_gateway_routes);
    ]

let firewall_subnet_is_out_of_scope_violation_to_yojson
    (x : firewall_subnet_is_out_of_scope_violation) =
  assoc_to_yojson
    [
      ("FirewallSubnetId", option_to_yojson resource_id_to_yojson x.firewall_subnet_id);
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
      ( "SubnetAvailabilityZone",
        option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone );
      ( "SubnetAvailabilityZoneId",
        option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone_id );
      ("VpcEndpointId", option_to_yojson resource_id_to_yojson x.vpc_endpoint_id);
    ]

let dns_rule_group_limit_exceeded_violation_to_yojson (x : dns_rule_group_limit_exceeded_violation)
    =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ( "ViolationTargetDescription",
        option_to_yojson length_bounded_string_to_yojson x.violation_target_description );
      ( "NumberOfRuleGroupsAlreadyAssociated",
        option_to_yojson basic_integer_to_yojson x.number_of_rule_groups_already_associated );
    ]

let dns_duplicate_rule_group_violation_to_yojson (x : dns_duplicate_rule_group_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ( "ViolationTargetDescription",
        option_to_yojson length_bounded_string_to_yojson x.violation_target_description );
    ]

let dns_rule_group_priority_to_yojson = int_to_yojson
let dns_rule_group_priorities_to_yojson tree = list_to_yojson dns_rule_group_priority_to_yojson tree

let dns_rule_group_priority_conflict_violation_to_yojson
    (x : dns_rule_group_priority_conflict_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ( "ViolationTargetDescription",
        option_to_yojson length_bounded_string_to_yojson x.violation_target_description );
      ( "ConflictingPriority",
        option_to_yojson dns_rule_group_priority_to_yojson x.conflicting_priority );
      ("ConflictingPolicyId", option_to_yojson policy_id_to_yojson x.conflicting_policy_id);
      ( "UnavailablePriorities",
        option_to_yojson dns_rule_group_priorities_to_yojson x.unavailable_priorities );
    ]

let length_bounded_string_list_to_yojson tree = list_to_yojson length_bounded_string_to_yojson tree
let resource_id_list_to_yojson tree = list_to_yojson resource_id_to_yojson tree

let expected_route_to_yojson (x : expected_route) =
  assoc_to_yojson
    [
      ("IpV4Cidr", option_to_yojson cid_r_to_yojson x.ip_v4_cidr);
      ("PrefixListId", option_to_yojson cid_r_to_yojson x.prefix_list_id);
      ("IpV6Cidr", option_to_yojson cid_r_to_yojson x.ip_v6_cidr);
      ("ContributingSubnets", option_to_yojson resource_id_list_to_yojson x.contributing_subnets);
      ("AllowedTargets", option_to_yojson length_bounded_string_list_to_yojson x.allowed_targets);
      ("RouteTableId", option_to_yojson resource_id_to_yojson x.route_table_id);
    ]

let expected_routes_to_yojson tree = list_to_yojson expected_route_to_yojson tree

let network_firewall_missing_expected_routes_violation_to_yojson
    (x : network_firewall_missing_expected_routes_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ("ExpectedRoutes", option_to_yojson expected_routes_to_yojson x.expected_routes);
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
    ]

let network_firewall_unexpected_gateway_routes_violation_to_yojson
    (x : network_firewall_unexpected_gateway_routes_violation) =
  assoc_to_yojson
    [
      ("GatewayId", option_to_yojson resource_id_to_yojson x.gateway_id);
      ("ViolatingRoutes", option_to_yojson routes_to_yojson x.violating_routes);
      ("RouteTableId", option_to_yojson resource_id_to_yojson x.route_table_id);
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
    ]

let network_firewall_unexpected_firewall_routes_violation_to_yojson
    (x : network_firewall_unexpected_firewall_routes_violation) =
  assoc_to_yojson
    [
      ("FirewallSubnetId", option_to_yojson resource_id_to_yojson x.firewall_subnet_id);
      ("ViolatingRoutes", option_to_yojson routes_to_yojson x.violating_routes);
      ("RouteTableId", option_to_yojson resource_id_to_yojson x.route_table_id);
      ("FirewallEndpoint", option_to_yojson resource_id_to_yojson x.firewall_endpoint);
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
    ]

let network_firewall_black_hole_route_detected_violation_to_yojson
    (x : network_firewall_black_hole_route_detected_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ("RouteTableId", option_to_yojson resource_id_to_yojson x.route_table_id);
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
      ("ViolatingRoutes", option_to_yojson routes_to_yojson x.violating_routes);
    ]

let network_firewall_invalid_route_configuration_violation_to_yojson
    (x : network_firewall_invalid_route_configuration_violation) =
  assoc_to_yojson
    [
      ("AffectedSubnets", option_to_yojson resource_id_list_to_yojson x.affected_subnets);
      ("RouteTableId", option_to_yojson resource_id_to_yojson x.route_table_id);
      ( "IsRouteTableUsedInDifferentAZ",
        option_to_yojson boolean__to_yojson x.is_route_table_used_in_different_a_z );
      ("ViolatingRoute", option_to_yojson route_to_yojson x.violating_route);
      ( "CurrentFirewallSubnetRouteTable",
        option_to_yojson resource_id_to_yojson x.current_firewall_subnet_route_table );
      ( "ExpectedFirewallEndpoint",
        option_to_yojson resource_id_to_yojson x.expected_firewall_endpoint );
      ("ActualFirewallEndpoint", option_to_yojson resource_id_to_yojson x.actual_firewall_endpoint);
      ( "ExpectedFirewallSubnetId",
        option_to_yojson resource_id_to_yojson x.expected_firewall_subnet_id );
      ("ActualFirewallSubnetId", option_to_yojson resource_id_to_yojson x.actual_firewall_subnet_id);
      ( "ExpectedFirewallSubnetRoutes",
        option_to_yojson expected_routes_to_yojson x.expected_firewall_subnet_routes );
      ( "ActualFirewallSubnetRoutes",
        option_to_yojson routes_to_yojson x.actual_firewall_subnet_routes );
      ("InternetGatewayId", option_to_yojson resource_id_to_yojson x.internet_gateway_id);
      ( "CurrentInternetGatewayRouteTable",
        option_to_yojson resource_id_to_yojson x.current_internet_gateway_route_table );
      ( "ExpectedInternetGatewayRoutes",
        option_to_yojson expected_routes_to_yojson x.expected_internet_gateway_routes );
      ( "ActualInternetGatewayRoutes",
        option_to_yojson routes_to_yojson x.actual_internet_gateway_routes );
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
    ]

let network_firewall_internet_traffic_not_inspected_violation_to_yojson
    (x : network_firewall_internet_traffic_not_inspected_violation) =
  assoc_to_yojson
    [
      ("SubnetId", option_to_yojson resource_id_to_yojson x.subnet_id);
      ( "SubnetAvailabilityZone",
        option_to_yojson length_bounded_string_to_yojson x.subnet_availability_zone );
      ("RouteTableId", option_to_yojson resource_id_to_yojson x.route_table_id);
      ("ViolatingRoutes", option_to_yojson routes_to_yojson x.violating_routes);
      ( "IsRouteTableUsedInDifferentAZ",
        option_to_yojson boolean__to_yojson x.is_route_table_used_in_different_a_z );
      ( "CurrentFirewallSubnetRouteTable",
        option_to_yojson resource_id_to_yojson x.current_firewall_subnet_route_table );
      ( "ExpectedFirewallEndpoint",
        option_to_yojson resource_id_to_yojson x.expected_firewall_endpoint );
      ("FirewallSubnetId", option_to_yojson resource_id_to_yojson x.firewall_subnet_id);
      ( "ExpectedFirewallSubnetRoutes",
        option_to_yojson expected_routes_to_yojson x.expected_firewall_subnet_routes );
      ( "ActualFirewallSubnetRoutes",
        option_to_yojson routes_to_yojson x.actual_firewall_subnet_routes );
      ("InternetGatewayId", option_to_yojson resource_id_to_yojson x.internet_gateway_id);
      ( "CurrentInternetGatewayRouteTable",
        option_to_yojson resource_id_to_yojson x.current_internet_gateway_route_table );
      ( "ExpectedInternetGatewayRoutes",
        option_to_yojson expected_routes_to_yojson x.expected_internet_gateway_routes );
      ( "ActualInternetGatewayRoutes",
        option_to_yojson routes_to_yojson x.actual_internet_gateway_routes );
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
    ]

let stream_exception_policy_to_yojson (x : stream_exception_policy) =
  match x with
  | DROP -> `String "DROP"
  | CONTINUE -> `String "CONTINUE"
  | REJECT -> `String "REJECT"
  | FMS_IGNORE -> `String "FMS_IGNORE"

let rule_order_to_yojson (x : rule_order) =
  match x with
  | STRICT_ORDER -> `String "STRICT_ORDER"
  | DEFAULT_ACTION_ORDER -> `String "DEFAULT_ACTION_ORDER"

let stateful_engine_options_to_yojson (x : stateful_engine_options) =
  assoc_to_yojson
    [
      ("RuleOrder", option_to_yojson rule_order_to_yojson x.rule_order);
      ( "StreamExceptionPolicy",
        option_to_yojson stream_exception_policy_to_yojson x.stream_exception_policy );
    ]

let network_firewall_action_to_yojson = string_to_yojson

let network_firewall_action_list_to_yojson tree =
  list_to_yojson network_firewall_action_to_yojson tree

let network_firewall_override_action_to_yojson (x : network_firewall_override_action) =
  match x with DROP_TO_ALERT -> `String "DROP_TO_ALERT"

let network_firewall_stateful_rule_group_override_to_yojson
    (x : network_firewall_stateful_rule_group_override) =
  assoc_to_yojson
    [ ("Action", option_to_yojson network_firewall_override_action_to_yojson x.action) ]

let priority_number_to_yojson = int_to_yojson
let network_firewall_resource_name_to_yojson = string_to_yojson

let stateful_rule_group_to_yojson (x : stateful_rule_group) =
  assoc_to_yojson
    [
      ("RuleGroupName", option_to_yojson network_firewall_resource_name_to_yojson x.rule_group_name);
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("Priority", option_to_yojson priority_number_to_yojson x.priority);
      ( "Override",
        option_to_yojson network_firewall_stateful_rule_group_override_to_yojson x.override );
    ]

let stateful_rule_group_list_to_yojson tree = list_to_yojson stateful_rule_group_to_yojson tree
let stateless_rule_group_priority_to_yojson = int_to_yojson

let stateless_rule_group_to_yojson (x : stateless_rule_group) =
  assoc_to_yojson
    [
      ("RuleGroupName", option_to_yojson network_firewall_resource_name_to_yojson x.rule_group_name);
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("Priority", option_to_yojson stateless_rule_group_priority_to_yojson x.priority);
    ]

let stateless_rule_group_list_to_yojson tree = list_to_yojson stateless_rule_group_to_yojson tree

let network_firewall_policy_description_to_yojson (x : network_firewall_policy_description) =
  assoc_to_yojson
    [
      ( "StatelessRuleGroups",
        option_to_yojson stateless_rule_group_list_to_yojson x.stateless_rule_groups );
      ( "StatelessDefaultActions",
        option_to_yojson network_firewall_action_list_to_yojson x.stateless_default_actions );
      ( "StatelessFragmentDefaultActions",
        option_to_yojson network_firewall_action_list_to_yojson x.stateless_fragment_default_actions
      );
      ( "StatelessCustomActions",
        option_to_yojson network_firewall_action_list_to_yojson x.stateless_custom_actions );
      ( "StatefulRuleGroups",
        option_to_yojson stateful_rule_group_list_to_yojson x.stateful_rule_groups );
      ( "StatefulDefaultActions",
        option_to_yojson network_firewall_action_list_to_yojson x.stateful_default_actions );
      ( "StatefulEngineOptions",
        option_to_yojson stateful_engine_options_to_yojson x.stateful_engine_options );
    ]

let network_firewall_policy_modified_violation_to_yojson
    (x : network_firewall_policy_modified_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ( "CurrentPolicyDescription",
        option_to_yojson network_firewall_policy_description_to_yojson x.current_policy_description
      );
      ( "ExpectedPolicyDescription",
        option_to_yojson network_firewall_policy_description_to_yojson x.expected_policy_description
      );
    ]

let network_firewall_missing_expected_rt_violation_to_yojson
    (x : network_firewall_missing_expected_rt_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ("VPC", option_to_yojson resource_id_to_yojson x.vp_c);
      ("AvailabilityZone", option_to_yojson length_bounded_string_to_yojson x.availability_zone);
      ("CurrentRouteTable", option_to_yojson resource_id_to_yojson x.current_route_table);
      ("ExpectedRouteTable", option_to_yojson resource_id_to_yojson x.expected_route_table);
    ]

let network_firewall_missing_subnet_violation_to_yojson
    (x : network_firewall_missing_subnet_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ("VPC", option_to_yojson resource_id_to_yojson x.vp_c);
      ("AvailabilityZone", option_to_yojson length_bounded_string_to_yojson x.availability_zone);
      ( "TargetViolationReason",
        option_to_yojson target_violation_reason_to_yojson x.target_violation_reason );
    ]

let network_firewall_missing_firewall_violation_to_yojson
    (x : network_firewall_missing_firewall_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ("VPC", option_to_yojson resource_id_to_yojson x.vp_c);
      ("AvailabilityZone", option_to_yojson length_bounded_string_to_yojson x.availability_zone);
      ( "TargetViolationReason",
        option_to_yojson target_violation_reason_to_yojson x.target_violation_reason );
    ]

let aws_ec2_network_interface_violation_to_yojson (x : aws_ec2_network_interface_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ( "ViolatingSecurityGroups",
        option_to_yojson resource_id_list_to_yojson x.violating_security_groups );
    ]

let aws_ec2_network_interface_violations_to_yojson tree =
  list_to_yojson aws_ec2_network_interface_violation_to_yojson tree

let aws_ec2_instance_violation_to_yojson (x : aws_ec2_instance_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ( "AwsEc2NetworkInterfaceViolations",
        option_to_yojson aws_ec2_network_interface_violations_to_yojson
          x.aws_ec2_network_interface_violations );
    ]

let security_group_rule_description_to_yojson (x : security_group_rule_description) =
  assoc_to_yojson
    [
      ("IPV4Range", option_to_yojson cid_r_to_yojson x.ipv4_range);
      ("IPV6Range", option_to_yojson cid_r_to_yojson x.ipv6_range);
      ("PrefixListId", option_to_yojson resource_id_to_yojson x.prefix_list_id);
      ("Protocol", option_to_yojson length_bounded_string_to_yojson x.protocol);
      ("FromPort", option_to_yojson ip_port_number_to_yojson x.from_port);
      ("ToPort", option_to_yojson ip_port_number_to_yojson x.to_port);
    ]

let remediation_action_description_to_yojson = string_to_yojson

let remediation_action_type_to_yojson (x : remediation_action_type) =
  match x with Remove -> `String "REMOVE" | Modify -> `String "MODIFY"

let security_group_remediation_action_to_yojson (x : security_group_remediation_action) =
  assoc_to_yojson
    [
      ( "RemediationActionType",
        option_to_yojson remediation_action_type_to_yojson x.remediation_action_type );
      ("Description", option_to_yojson remediation_action_description_to_yojson x.description);
      ( "RemediationResult",
        option_to_yojson security_group_rule_description_to_yojson x.remediation_result );
      ("IsDefaultAction", option_to_yojson boolean__to_yojson x.is_default_action);
    ]

let security_group_remediation_actions_to_yojson tree =
  list_to_yojson security_group_remediation_action_to_yojson tree

let target_violation_reasons_to_yojson tree = list_to_yojson target_violation_reason_to_yojson tree
let reference_rule_to_yojson = string_to_yojson

let partial_match_to_yojson (x : partial_match) =
  assoc_to_yojson
    [
      ("Reference", option_to_yojson reference_rule_to_yojson x.reference);
      ( "TargetViolationReasons",
        option_to_yojson target_violation_reasons_to_yojson x.target_violation_reasons );
    ]

let partial_matches_to_yojson tree = list_to_yojson partial_match_to_yojson tree

let aws_vpc_security_group_violation_to_yojson (x : aws_vpc_security_group_violation) =
  assoc_to_yojson
    [
      ("ViolationTarget", option_to_yojson violation_target_to_yojson x.violation_target);
      ( "ViolationTargetDescription",
        option_to_yojson length_bounded_string_to_yojson x.violation_target_description );
      ("PartialMatches", option_to_yojson partial_matches_to_yojson x.partial_matches);
      ( "PossibleSecurityGroupRemediationActions",
        option_to_yojson security_group_remediation_actions_to_yojson
          x.possible_security_group_remediation_actions );
    ]

let resource_violation_to_yojson (x : resource_violation) =
  assoc_to_yojson
    [
      ( "AwsVPCSecurityGroupViolation",
        option_to_yojson aws_vpc_security_group_violation_to_yojson
          x.aws_vpc_security_group_violation );
      ( "AwsEc2NetworkInterfaceViolation",
        option_to_yojson aws_ec2_network_interface_violation_to_yojson
          x.aws_ec2_network_interface_violation );
      ( "AwsEc2InstanceViolation",
        option_to_yojson aws_ec2_instance_violation_to_yojson x.aws_ec2_instance_violation );
      ( "NetworkFirewallMissingFirewallViolation",
        option_to_yojson network_firewall_missing_firewall_violation_to_yojson
          x.network_firewall_missing_firewall_violation );
      ( "NetworkFirewallMissingSubnetViolation",
        option_to_yojson network_firewall_missing_subnet_violation_to_yojson
          x.network_firewall_missing_subnet_violation );
      ( "NetworkFirewallMissingExpectedRTViolation",
        option_to_yojson network_firewall_missing_expected_rt_violation_to_yojson
          x.network_firewall_missing_expected_rt_violation );
      ( "NetworkFirewallPolicyModifiedViolation",
        option_to_yojson network_firewall_policy_modified_violation_to_yojson
          x.network_firewall_policy_modified_violation );
      ( "NetworkFirewallInternetTrafficNotInspectedViolation",
        option_to_yojson network_firewall_internet_traffic_not_inspected_violation_to_yojson
          x.network_firewall_internet_traffic_not_inspected_violation );
      ( "NetworkFirewallInvalidRouteConfigurationViolation",
        option_to_yojson network_firewall_invalid_route_configuration_violation_to_yojson
          x.network_firewall_invalid_route_configuration_violation );
      ( "NetworkFirewallBlackHoleRouteDetectedViolation",
        option_to_yojson network_firewall_black_hole_route_detected_violation_to_yojson
          x.network_firewall_black_hole_route_detected_violation );
      ( "NetworkFirewallUnexpectedFirewallRoutesViolation",
        option_to_yojson network_firewall_unexpected_firewall_routes_violation_to_yojson
          x.network_firewall_unexpected_firewall_routes_violation );
      ( "NetworkFirewallUnexpectedGatewayRoutesViolation",
        option_to_yojson network_firewall_unexpected_gateway_routes_violation_to_yojson
          x.network_firewall_unexpected_gateway_routes_violation );
      ( "NetworkFirewallMissingExpectedRoutesViolation",
        option_to_yojson network_firewall_missing_expected_routes_violation_to_yojson
          x.network_firewall_missing_expected_routes_violation );
      ( "DnsRuleGroupPriorityConflictViolation",
        option_to_yojson dns_rule_group_priority_conflict_violation_to_yojson
          x.dns_rule_group_priority_conflict_violation );
      ( "DnsDuplicateRuleGroupViolation",
        option_to_yojson dns_duplicate_rule_group_violation_to_yojson
          x.dns_duplicate_rule_group_violation );
      ( "DnsRuleGroupLimitExceededViolation",
        option_to_yojson dns_rule_group_limit_exceeded_violation_to_yojson
          x.dns_rule_group_limit_exceeded_violation );
      ( "FirewallSubnetIsOutOfScopeViolation",
        option_to_yojson firewall_subnet_is_out_of_scope_violation_to_yojson
          x.firewall_subnet_is_out_of_scope_violation );
      ( "RouteHasOutOfScopeEndpointViolation",
        option_to_yojson route_has_out_of_scope_endpoint_violation_to_yojson
          x.route_has_out_of_scope_endpoint_violation );
      ( "ThirdPartyFirewallMissingFirewallViolation",
        option_to_yojson third_party_firewall_missing_firewall_violation_to_yojson
          x.third_party_firewall_missing_firewall_violation );
      ( "ThirdPartyFirewallMissingSubnetViolation",
        option_to_yojson third_party_firewall_missing_subnet_violation_to_yojson
          x.third_party_firewall_missing_subnet_violation );
      ( "ThirdPartyFirewallMissingExpectedRouteTableViolation",
        option_to_yojson third_party_firewall_missing_expected_route_table_violation_to_yojson
          x.third_party_firewall_missing_expected_route_table_violation );
      ( "FirewallSubnetMissingVPCEndpointViolation",
        option_to_yojson firewall_subnet_missing_vpc_endpoint_violation_to_yojson
          x.firewall_subnet_missing_vpc_endpoint_violation );
      ( "InvalidNetworkAclEntriesViolation",
        option_to_yojson invalid_network_acl_entries_violation_to_yojson
          x.invalid_network_acl_entries_violation );
      ( "PossibleRemediationActions",
        option_to_yojson possible_remediation_actions_to_yojson x.possible_remediation_actions );
      ( "WebACLHasIncompatibleConfigurationViolation",
        option_to_yojson web_acl_has_incompatible_configuration_violation_to_yojson
          x.web_acl_has_incompatible_configuration_violation );
      ( "WebACLHasOutOfScopeResourcesViolation",
        option_to_yojson web_acl_has_out_of_scope_resources_violation_to_yojson
          x.web_acl_has_out_of_scope_resources_violation );
    ]

let resource_violations_to_yojson tree = list_to_yojson resource_violation_to_yojson tree

let violation_detail_to_yojson (x : violation_detail) =
  assoc_to_yojson
    [
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("MemberAccount", Some (aws_account_id_to_yojson x.member_account));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("ResourceViolations", Some (resource_violations_to_yojson x.resource_violations));
      ("ResourceTags", option_to_yojson tag_list_to_yojson x.resource_tags);
      ( "ResourceDescription",
        option_to_yojson length_bounded_string_to_yojson x.resource_description );
    ]

let get_violation_details_response_to_yojson (x : get_violation_details_response) =
  assoc_to_yojson
    [ ("ViolationDetail", option_to_yojson violation_detail_to_yojson x.violation_detail) ]

let get_violation_details_request_to_yojson (x : get_violation_details_request) =
  assoc_to_yojson
    [
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("MemberAccount", Some (aws_account_id_to_yojson x.member_account));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
    ]

let marketplace_subscription_onboarding_status_to_yojson
    (x : marketplace_subscription_onboarding_status) =
  match x with
  | NO_SUBSCRIPTION -> `String "NO_SUBSCRIPTION"
  | NOT_COMPLETE -> `String "NOT_COMPLETE"
  | COMPLETE -> `String "COMPLETE"

let third_party_firewall_association_status_to_yojson (x : third_party_firewall_association_status)
    =
  match x with
  | ONBOARDING -> `String "ONBOARDING"
  | ONBOARD_COMPLETE -> `String "ONBOARD_COMPLETE"
  | OFFBOARDING -> `String "OFFBOARDING"
  | OFFBOARD_COMPLETE -> `String "OFFBOARD_COMPLETE"
  | NOT_EXIST -> `String "NOT_EXIST"

let get_third_party_firewall_association_status_response_to_yojson
    (x : get_third_party_firewall_association_status_response) =
  assoc_to_yojson
    [
      ( "ThirdPartyFirewallStatus",
        option_to_yojson third_party_firewall_association_status_to_yojson
          x.third_party_firewall_status );
      ( "MarketplaceOnboardingStatus",
        option_to_yojson marketplace_subscription_onboarding_status_to_yojson
          x.marketplace_onboarding_status );
    ]

let get_third_party_firewall_association_status_request_to_yojson
    (x : get_third_party_firewall_association_status_request) =
  assoc_to_yojson
    [ ("ThirdPartyFirewall", Some (third_party_firewall_to_yojson x.third_party_firewall)) ]

let get_resource_set_response_to_yojson (x : get_resource_set_response) =
  assoc_to_yojson
    [
      ("ResourceSet", Some (resource_set_to_yojson x.resource_set));
      ("ResourceSetArn", Some (resource_arn_to_yojson x.resource_set_arn));
    ]

let get_resource_set_request_to_yojson (x : get_resource_set_request) =
  assoc_to_yojson [ ("Identifier", Some (base62_id_to_yojson x.identifier)) ]

let get_protocols_list_response_to_yojson (x : get_protocols_list_response) =
  assoc_to_yojson
    [
      ("ProtocolsList", option_to_yojson protocols_list_data_to_yojson x.protocols_list);
      ("ProtocolsListArn", option_to_yojson resource_arn_to_yojson x.protocols_list_arn);
    ]

let get_protocols_list_request_to_yojson (x : get_protocols_list_request) =
  assoc_to_yojson
    [
      ("ListId", Some (list_id_to_yojson x.list_id));
      ("DefaultList", option_to_yojson boolean__to_yojson x.default_list);
    ]

let protection_data_to_yojson = string_to_yojson

let get_protection_status_response_to_yojson (x : get_protection_status_response) =
  assoc_to_yojson
    [
      ("AdminAccountId", option_to_yojson aws_account_id_to_yojson x.admin_account_id);
      ("ServiceType", option_to_yojson security_service_type_to_yojson x.service_type);
      ("Data", option_to_yojson protection_data_to_yojson x.data);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let get_protection_status_request_to_yojson (x : get_protection_status_request) =
  assoc_to_yojson
    [
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("MemberAccountId", option_to_yojson aws_account_id_to_yojson x.member_account_id);
      ("StartTime", option_to_yojson time_stamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson time_stamp_to_yojson x.end_time);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let get_policy_response_to_yojson (x : get_policy_response) =
  assoc_to_yojson
    [
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ("PolicyArn", option_to_yojson resource_arn_to_yojson x.policy_arn);
    ]

let get_policy_request_to_yojson (x : get_policy_request) =
  assoc_to_yojson [ ("PolicyId", Some (policy_id_to_yojson x.policy_id)) ]

let get_notification_channel_response_to_yojson (x : get_notification_channel_response) =
  assoc_to_yojson
    [
      ("SnsTopicArn", option_to_yojson resource_arn_to_yojson x.sns_topic_arn);
      ("SnsRoleName", option_to_yojson resource_arn_to_yojson x.sns_role_name);
    ]

let get_notification_channel_request_to_yojson = unit_to_yojson

let compliance_violator_metadata_to_yojson tree =
  map_to_yojson length_bounded_string_to_yojson length_bounded_string_to_yojson tree

let violation_reason_to_yojson (x : violation_reason) =
  match x with
  | WebAclMissingRuleGroup -> `String "WEB_ACL_MISSING_RULE_GROUP"
  | ResourceMissingWebAcl -> `String "RESOURCE_MISSING_WEB_ACL"
  | ResourceIncorrectWebAcl -> `String "RESOURCE_INCORRECT_WEB_ACL"
  | ResourceMissingShieldProtection -> `String "RESOURCE_MISSING_SHIELD_PROTECTION"
  | ResourceMissingWebaclOrShieldProtection ->
      `String "RESOURCE_MISSING_WEB_ACL_OR_SHIELD_PROTECTION"
  | ResourceMissingSecurityGroup -> `String "RESOURCE_MISSING_SECURITY_GROUP"
  | ResourceViolatesAuditSecurityGroup -> `String "RESOURCE_VIOLATES_AUDIT_SECURITY_GROUP"
  | SecurityGroupUnused -> `String "SECURITY_GROUP_UNUSED"
  | SecurityGroupRedundant -> `String "SECURITY_GROUP_REDUNDANT"
  | FMSCreatedSecurityGroupEdited -> `String "FMS_CREATED_SECURITY_GROUP_EDITED"
  | MissingFirewall -> `String "MISSING_FIREWALL"
  | MissingFirewallSubnetInAZ -> `String "MISSING_FIREWALL_SUBNET_IN_AZ"
  | MissingExpectedRouteTable -> `String "MISSING_EXPECTED_ROUTE_TABLE"
  | NetworkFirewallPolicyModified -> `String "NETWORK_FIREWALL_POLICY_MODIFIED"
  | FirewallSubnetIsOutOfScope -> `String "FIREWALL_SUBNET_IS_OUT_OF_SCOPE"
  | InternetGatewayMissingExpectedRoute -> `String "INTERNET_GATEWAY_MISSING_EXPECTED_ROUTE"
  | FirewallSubnetMissingExpectedRoute -> `String "FIREWALL_SUBNET_MISSING_EXPECTED_ROUTE"
  | UnexpectedFirewallRoutes -> `String "UNEXPECTED_FIREWALL_ROUTES"
  | UnexpectedTargetGatewayRoutes -> `String "UNEXPECTED_TARGET_GATEWAY_ROUTES"
  | TrafficInspectionCrossesAZBoundary -> `String "TRAFFIC_INSPECTION_CROSSES_AZ_BOUNDARY"
  | InvalidRouteConfiguration -> `String "INVALID_ROUTE_CONFIGURATION"
  | MissingTargetGateway -> `String "MISSING_TARGET_GATEWAY"
  | InternetTrafficNotInspected -> `String "INTERNET_TRAFFIC_NOT_INSPECTED"
  | BlackHoleRouteDetected -> `String "BLACK_HOLE_ROUTE_DETECTED"
  | BlackHoleRouteDetectedInFirewallSubnet -> `String "BLACK_HOLE_ROUTE_DETECTED_IN_FIREWALL_SUBNET"
  | ResourceMissingDnsFirewall -> `String "RESOURCE_MISSING_DNS_FIREWALL"
  | RouteHasOutOfScopeEndpoint -> `String "ROUTE_HAS_OUT_OF_SCOPE_ENDPOINT"
  | FirewallSubnetMissingVPCEndpoint -> `String "FIREWALL_SUBNET_MISSING_VPCE_ENDPOINT"
  | InvalidNetworkAclEntry -> `String "INVALID_NETWORK_ACL_ENTRY"
  | WebACLConfigurationOrScopeOfUse -> `String "WEB_ACL_CONFIGURATION_OR_SCOPE_OF_USE"

let compliance_violator_to_yojson (x : compliance_violator) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("ViolationReason", option_to_yojson violation_reason_to_yojson x.violation_reason);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("Metadata", option_to_yojson compliance_violator_metadata_to_yojson x.metadata);
    ]

let compliance_violators_to_yojson tree = list_to_yojson compliance_violator_to_yojson tree

let policy_compliance_detail_to_yojson (x : policy_compliance_detail) =
  assoc_to_yojson
    [
      ("PolicyOwner", option_to_yojson aws_account_id_to_yojson x.policy_owner);
      ("PolicyId", option_to_yojson policy_id_to_yojson x.policy_id);
      ("MemberAccount", option_to_yojson aws_account_id_to_yojson x.member_account);
      ("Violators", option_to_yojson compliance_violators_to_yojson x.violators);
      ("EvaluationLimitExceeded", option_to_yojson boolean__to_yojson x.evaluation_limit_exceeded);
      ("ExpiredAt", option_to_yojson time_stamp_to_yojson x.expired_at);
      ("IssueInfoMap", option_to_yojson issue_info_map_to_yojson x.issue_info_map);
    ]

let get_compliance_detail_response_to_yojson (x : get_compliance_detail_response) =
  assoc_to_yojson
    [
      ( "PolicyComplianceDetail",
        option_to_yojson policy_compliance_detail_to_yojson x.policy_compliance_detail );
    ]

let get_compliance_detail_request_to_yojson (x : get_compliance_detail_request) =
  assoc_to_yojson
    [
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("MemberAccount", Some (aws_account_id_to_yojson x.member_account));
    ]

let get_apps_list_response_to_yojson (x : get_apps_list_response) =
  assoc_to_yojson
    [
      ("AppsList", option_to_yojson apps_list_data_to_yojson x.apps_list);
      ("AppsListArn", option_to_yojson resource_arn_to_yojson x.apps_list_arn);
    ]

let get_apps_list_request_to_yojson (x : get_apps_list_request) =
  assoc_to_yojson
    [
      ("ListId", Some (list_id_to_yojson x.list_id));
      ("DefaultList", option_to_yojson boolean__to_yojson x.default_list);
    ]

let get_admin_scope_response_to_yojson (x : get_admin_scope_response) =
  assoc_to_yojson
    [
      ("AdminScope", option_to_yojson admin_scope_to_yojson x.admin_scope);
      ("Status", option_to_yojson organization_status_to_yojson x.status);
    ]

let get_admin_scope_request_to_yojson (x : get_admin_scope_request) =
  assoc_to_yojson [ ("AdminAccount", Some (aws_account_id_to_yojson x.admin_account)) ]

let account_role_status_to_yojson (x : account_role_status) =
  match x with
  | Ready -> `String "READY"
  | Creating -> `String "CREATING"
  | PendingDeletion -> `String "PENDING_DELETION"
  | Deleting -> `String "DELETING"
  | Deleted -> `String "DELETED"

let get_admin_account_response_to_yojson (x : get_admin_account_response) =
  assoc_to_yojson
    [
      ("AdminAccount", option_to_yojson aws_account_id_to_yojson x.admin_account);
      ("RoleStatus", option_to_yojson account_role_status_to_yojson x.role_status);
    ]

let get_admin_account_request_to_yojson = unit_to_yojson

let disassociate_third_party_firewall_response_to_yojson
    (x : disassociate_third_party_firewall_response) =
  assoc_to_yojson
    [
      ( "ThirdPartyFirewallStatus",
        option_to_yojson third_party_firewall_association_status_to_yojson
          x.third_party_firewall_status );
    ]

let disassociate_third_party_firewall_request_to_yojson
    (x : disassociate_third_party_firewall_request) =
  assoc_to_yojson
    [ ("ThirdPartyFirewall", Some (third_party_firewall_to_yojson x.third_party_firewall)) ]

let disassociate_admin_account_request_to_yojson = unit_to_yojson

let delete_resource_set_request_to_yojson (x : delete_resource_set_request) =
  assoc_to_yojson [ ("Identifier", Some (base62_id_to_yojson x.identifier)) ]

let delete_protocols_list_request_to_yojson (x : delete_protocols_list_request) =
  assoc_to_yojson [ ("ListId", Some (list_id_to_yojson x.list_id)) ]

let delete_policy_request_to_yojson (x : delete_policy_request) =
  assoc_to_yojson
    [
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("DeleteAllPolicyResources", option_to_yojson boolean__to_yojson x.delete_all_policy_resources);
    ]

let delete_notification_channel_request_to_yojson = unit_to_yojson

let delete_apps_list_request_to_yojson (x : delete_apps_list_request) =
  assoc_to_yojson [ ("ListId", Some (list_id_to_yojson x.list_id)) ]

let failed_item_reason_to_yojson (x : failed_item_reason) =
  match x with
  | NotValidArn -> `String "NOT_VALID_ARN"
  | NotValidPartition -> `String "NOT_VALID_PARTITION"
  | NotValidRegion -> `String "NOT_VALID_REGION"
  | NotValidService -> `String "NOT_VALID_SERVICE"
  | NotValidResourceType -> `String "NOT_VALID_RESOURCE_TYPE"
  | NotValidAccountId -> `String "NOT_VALID_ACCOUNT_ID"

let failed_item_to_yojson (x : failed_item) =
  assoc_to_yojson
    [
      ("URI", option_to_yojson identifier_to_yojson x.ur_i);
      ("Reason", option_to_yojson failed_item_reason_to_yojson x.reason);
    ]

let failed_item_list_to_yojson tree = list_to_yojson failed_item_to_yojson tree

let batch_disassociate_resource_response_to_yojson (x : batch_disassociate_resource_response) =
  assoc_to_yojson
    [
      ("ResourceSetIdentifier", Some (identifier_to_yojson x.resource_set_identifier));
      ("FailedItems", Some (failed_item_list_to_yojson x.failed_items));
    ]

let identifier_list_to_yojson tree = list_to_yojson identifier_to_yojson tree

let batch_disassociate_resource_request_to_yojson (x : batch_disassociate_resource_request) =
  assoc_to_yojson
    [
      ("ResourceSetIdentifier", Some (identifier_to_yojson x.resource_set_identifier));
      ("Items", Some (identifier_list_to_yojson x.items));
    ]

let batch_associate_resource_response_to_yojson (x : batch_associate_resource_response) =
  assoc_to_yojson
    [
      ("ResourceSetIdentifier", Some (identifier_to_yojson x.resource_set_identifier));
      ("FailedItems", Some (failed_item_list_to_yojson x.failed_items));
    ]

let batch_associate_resource_request_to_yojson (x : batch_associate_resource_request) =
  assoc_to_yojson
    [
      ("ResourceSetIdentifier", Some (identifier_to_yojson x.resource_set_identifier));
      ("Items", Some (identifier_list_to_yojson x.items));
    ]

let associate_third_party_firewall_response_to_yojson (x : associate_third_party_firewall_response)
    =
  assoc_to_yojson
    [
      ( "ThirdPartyFirewallStatus",
        option_to_yojson third_party_firewall_association_status_to_yojson
          x.third_party_firewall_status );
    ]

let associate_third_party_firewall_request_to_yojson (x : associate_third_party_firewall_request) =
  assoc_to_yojson
    [ ("ThirdPartyFirewall", Some (third_party_firewall_to_yojson x.third_party_firewall)) ]

let associate_admin_account_request_to_yojson (x : associate_admin_account_request) =
  assoc_to_yojson [ ("AdminAccount", Some (aws_account_id_to_yojson x.admin_account)) ]
