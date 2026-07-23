open Smaws_Lib.Json.SerializeHelpers
open Types

let exception_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let account_id_to_yojson = string_to_yojson

let action_to_yojson (x : action) =
  match x with ALLOW -> `String "ALLOW" | BLOCK -> `String "BLOCK" | ALERT -> `String "ALERT"

let arn_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let string__to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
    ]

let internal_service_error_exception_to_yojson (x : internal_service_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let rfc3339_time_string_to_yojson = string_to_yojson
let creator_request_id_to_yojson = string_to_yojson
let status_message_to_yojson = string_to_yojson

let firewall_rule_group_association_status_to_yojson (x : firewall_rule_group_association_status) =
  match x with
  | COMPLETE -> `String "COMPLETE"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"

let service_principle_to_yojson = string_to_yojson

let mutation_protection_status_to_yojson (x : mutation_protection_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let priority_to_yojson = int_to_yojson
let name_to_yojson = string_to_yojson
let resource_id_to_yojson = string_to_yojson

let firewall_rule_group_association_to_yojson (x : firewall_rule_group_association) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("FirewallRuleGroupId", option_to_yojson resource_id_to_yojson x.firewall_rule_group_id);
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ( "MutationProtection",
        option_to_yojson mutation_protection_status_to_yojson x.mutation_protection );
      ("ManagedOwnerName", option_to_yojson service_principle_to_yojson x.managed_owner_name);
      ("Status", option_to_yojson firewall_rule_group_association_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
    ]

let associate_firewall_rule_group_response_to_yojson (x : associate_firewall_rule_group_response) =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupAssociation",
        option_to_yojson firewall_rule_group_association_to_yojson x.firewall_rule_group_association
      );
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let associate_firewall_rule_group_request_to_yojson (x : associate_firewall_rule_group_request) =
  assoc_to_yojson
    [
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
      ("VpcId", Some (resource_id_to_yojson x.vpc_id));
      ("Priority", Some (priority_to_yojson x.priority));
      ("Name", Some (name_to_yojson x.name));
      ( "MutationProtection",
        option_to_yojson mutation_protection_status_to_yojson x.mutation_protection );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let resource_exists_exception_to_yojson (x : resource_exists_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
    ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson
    [
      ("Message", Some (exception_message_to_yojson x.message));
      ("FieldName", option_to_yojson string__to_yojson x.field_name);
    ]

let ipv6_internet_access_enabled_to_yojson = bool_to_yojson
let dns64_enabled_to_yojson = bool_to_yojson
let target_name_server_metrics_enabled_to_yojson = bool_to_yojson
let rni_enhanced_metrics_enabled_to_yojson = bool_to_yojson

let protocol_to_yojson (x : protocol) =
  match x with DOH -> `String "DoH" | DO53 -> `String "Do53" | DOHFIPS -> `String "DoH-FIPS"

let protocol_list_to_yojson tree = list_to_yojson protocol_to_yojson tree

let resolver_endpoint_type_to_yojson (x : resolver_endpoint_type) =
  match x with IPV6 -> `String "IPV6" | IPV4 -> `String "IPV4" | DUALSTACK -> `String "DUALSTACK"

let outpost_instance_type_to_yojson = string_to_yojson
let outpost_arn_to_yojson = string_to_yojson

let resolver_endpoint_status_to_yojson (x : resolver_endpoint_status) =
  match x with
  | Creating -> `String "CREATING"
  | Operational -> `String "OPERATIONAL"
  | Updating -> `String "UPDATING"
  | AutoRecovering -> `String "AUTO_RECOVERING"
  | ActionNeeded -> `String "ACTION_NEEDED"
  | Deleting -> `String "DELETING"

let ip_address_count_to_yojson = int_to_yojson

let resolver_endpoint_direction_to_yojson (x : resolver_endpoint_direction) =
  match x with
  | Inbound -> `String "INBOUND"
  | Outbound -> `String "OUTBOUND"
  | InboundDelegation -> `String "INBOUND_DELEGATION"

let security_group_ids_to_yojson tree = list_to_yojson resource_id_to_yojson tree

let resolver_endpoint_to_yojson (x : resolver_endpoint) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("Direction", option_to_yojson resolver_endpoint_direction_to_yojson x.direction);
      ("IpAddressCount", option_to_yojson ip_address_count_to_yojson x.ip_address_count);
      ("HostVPCId", option_to_yojson resource_id_to_yojson x.host_vpc_id);
      ("Status", option_to_yojson resolver_endpoint_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("OutpostArn", option_to_yojson outpost_arn_to_yojson x.outpost_arn);
      ( "PreferredInstanceType",
        option_to_yojson outpost_instance_type_to_yojson x.preferred_instance_type );
      ( "ResolverEndpointType",
        option_to_yojson resolver_endpoint_type_to_yojson x.resolver_endpoint_type );
      ("Protocols", option_to_yojson protocol_list_to_yojson x.protocols);
      ( "RniEnhancedMetricsEnabled",
        option_to_yojson rni_enhanced_metrics_enabled_to_yojson x.rni_enhanced_metrics_enabled );
      ( "TargetNameServerMetricsEnabled",
        option_to_yojson target_name_server_metrics_enabled_to_yojson
          x.target_name_server_metrics_enabled );
      ("Dns64Enabled", option_to_yojson dns64_enabled_to_yojson x.dns64_enabled);
      ( "Ipv6InternetAccessEnabled",
        option_to_yojson ipv6_internet_access_enabled_to_yojson x.ipv6_internet_access_enabled );
    ]

let associate_resolver_endpoint_ip_address_response_to_yojson
    (x : associate_resolver_endpoint_ip_address_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let ipv6_to_yojson = string_to_yojson
let ip_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson

let ip_address_update_to_yojson (x : ip_address_update) =
  assoc_to_yojson
    [
      ("IpId", option_to_yojson resource_id_to_yojson x.ip_id);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("Ip", option_to_yojson ip_to_yojson x.ip);
      ("Ipv6", option_to_yojson ipv6_to_yojson x.ipv6);
    ]

let associate_resolver_endpoint_ip_address_request_to_yojson
    (x : associate_resolver_endpoint_ip_address_request) =
  assoc_to_yojson
    [
      ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id));
      ("IpAddress", Some (ip_address_update_to_yojson x.ip_address));
    ]

let resolver_query_log_config_association_error_message_to_yojson = string_to_yojson

let resolver_query_log_config_association_error_to_yojson
    (x : resolver_query_log_config_association_error) =
  match x with
  | None_ -> `String "NONE"
  | DestinationNotFound -> `String "DESTINATION_NOT_FOUND"
  | AccessDenied -> `String "ACCESS_DENIED"
  | InternalServiceError -> `String "INTERNAL_SERVICE_ERROR"

let resolver_query_log_config_association_status_to_yojson
    (x : resolver_query_log_config_association_status) =
  match x with
  | Creating -> `String "CREATING"
  | Active -> `String "ACTIVE"
  | ActionNeeded -> `String "ACTION_NEEDED"
  | Deleting -> `String "DELETING"
  | Failed -> `String "FAILED"

let resolver_query_log_config_association_to_yojson (x : resolver_query_log_config_association) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ( "ResolverQueryLogConfigId",
        option_to_yojson resource_id_to_yojson x.resolver_query_log_config_id );
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("Status", option_to_yojson resolver_query_log_config_association_status_to_yojson x.status);
      ("Error", option_to_yojson resolver_query_log_config_association_error_to_yojson x.error);
      ( "ErrorMessage",
        option_to_yojson resolver_query_log_config_association_error_message_to_yojson
          x.error_message );
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
    ]

let associate_resolver_query_log_config_response_to_yojson
    (x : associate_resolver_query_log_config_response) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfigAssociation",
        option_to_yojson resolver_query_log_config_association_to_yojson
          x.resolver_query_log_config_association );
    ]

let associate_resolver_query_log_config_request_to_yojson
    (x : associate_resolver_query_log_config_request) =
  assoc_to_yojson
    [
      ("ResolverQueryLogConfigId", Some (resource_id_to_yojson x.resolver_query_log_config_id));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let resource_unavailable_exception_to_yojson (x : resource_unavailable_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
    ]

let resolver_rule_association_status_to_yojson (x : resolver_rule_association_status) =
  match x with
  | Creating -> `String "CREATING"
  | Complete -> `String "COMPLETE"
  | Deleting -> `String "DELETING"
  | Failed -> `String "FAILED"
  | Overridden -> `String "OVERRIDDEN"

let resolver_rule_association_to_yojson (x : resolver_rule_association) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("ResolverRuleId", option_to_yojson resource_id_to_yojson x.resolver_rule_id);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("VPCId", option_to_yojson resource_id_to_yojson x.vpc_id);
      ("Status", option_to_yojson resolver_rule_association_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
    ]

let associate_resolver_rule_response_to_yojson (x : associate_resolver_rule_response) =
  assoc_to_yojson
    [
      ( "ResolverRuleAssociation",
        option_to_yojson resolver_rule_association_to_yojson x.resolver_rule_association );
    ]

let associate_resolver_rule_request_to_yojson (x : associate_resolver_rule_request) =
  assoc_to_yojson
    [
      ("ResolverRuleId", Some (resource_id_to_yojson x.resolver_rule_id));
      ("Name", option_to_yojson name_to_yojson x.name);
      ("VPCId", Some (resource_id_to_yojson x.vpc_id));
    ]

let autodefined_reverse_flag_to_yojson (x : autodefined_reverse_flag) =
  match x with
  | ENABLE -> `String "ENABLE"
  | DISABLE -> `String "DISABLE"
  | USE_LOCAL_RESOURCE_SETTING -> `String "USE_LOCAL_RESOURCE_SETTING"

let confidence_threshold_to_yojson (x : confidence_threshold) =
  match x with LOW -> `String "LOW" | MEDIUM -> `String "MEDIUM" | HIGH -> `String "HIGH"

let dns_threat_protection_rule_type_value_to_yojson = string_to_yojson

let dns_threat_protection_rule_type_config_to_yojson (x : dns_threat_protection_rule_type_config) =
  assoc_to_yojson
    [
      ("Value", Some (dns_threat_protection_rule_type_value_to_yojson x.value));
      ("ConfidenceThreshold", Some (confidence_threshold_to_yojson x.confidence_threshold));
    ]

let firewall_advanced_threat_category_value_to_yojson = string_to_yojson

let firewall_advanced_threat_category_config_to_yojson
    (x : firewall_advanced_threat_category_config) =
  assoc_to_yojson
    [ ("Category", Some (firewall_advanced_threat_category_value_to_yojson x.category)) ]

let firewall_advanced_content_category_value_to_yojson = string_to_yojson

let firewall_advanced_content_category_config_to_yojson
    (x : firewall_advanced_content_category_config) =
  assoc_to_yojson
    [ ("Category", Some (firewall_advanced_content_category_value_to_yojson x.category)) ]

let partner_value_to_yojson = string_to_yojson

let partner_threat_protection_config_to_yojson (x : partner_threat_protection_config) =
  assoc_to_yojson [ ("Partner", Some (partner_value_to_yojson x.partner)) ]

let firewall_rule_type_to_yojson (x : firewall_rule_type) =
  assoc_to_yojson
    [
      ( "PartnerThreatProtection",
        option_to_yojson partner_threat_protection_config_to_yojson x.partner_threat_protection );
      ( "FirewallAdvancedContentCategory",
        option_to_yojson firewall_advanced_content_category_config_to_yojson
          x.firewall_advanced_content_category );
      ( "FirewallAdvancedThreatCategory",
        option_to_yojson firewall_advanced_threat_category_config_to_yojson
          x.firewall_advanced_threat_category );
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_rule_type_config_to_yojson x.dns_threat_protection );
    ]

let dns_threat_protection_to_yojson (x : dns_threat_protection) =
  match x with
  | DGA -> `String "DGA"
  | DNS_TUNNELING -> `String "DNS_TUNNELING"
  | DICTIONARY_DGA -> `String "DICTIONARY_DGA"

let qtype_to_yojson = string_to_yojson

let firewall_domain_redirection_action_to_yojson (x : firewall_domain_redirection_action) =
  match x with
  | INSPECT_REDIRECTION_DOMAIN -> `String "INSPECT_REDIRECTION_DOMAIN"
  | TRUST_REDIRECTION_DOMAIN -> `String "TRUST_REDIRECTION_DOMAIN"

let block_override_ttl_to_yojson = int_to_yojson

let block_override_dns_type_to_yojson (x : block_override_dns_type) =
  match x with CNAME -> `String "CNAME"

let block_override_domain_to_yojson = string_to_yojson

let block_response_to_yojson (x : block_response) =
  match x with
  | NODATA -> `String "NODATA"
  | NXDOMAIN -> `String "NXDOMAIN"
  | OVERRIDE -> `String "OVERRIDE"

let create_firewall_rule_entry_to_yojson (x : create_firewall_rule_entry) =
  assoc_to_yojson
    [
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ("Priority", Some (priority_to_yojson x.priority));
      ("Action", Some (action_to_yojson x.action));
      ("BlockResponse", option_to_yojson block_response_to_yojson x.block_response);
      ( "BlockOverrideDomain",
        option_to_yojson block_override_domain_to_yojson x.block_override_domain );
      ( "BlockOverrideDnsType",
        option_to_yojson block_override_dns_type_to_yojson x.block_override_dns_type );
      ("BlockOverrideTtl", option_to_yojson block_override_ttl_to_yojson x.block_override_ttl);
      ("Name", Some (name_to_yojson x.name));
      ( "FirewallDomainRedirectionAction",
        option_to_yojson firewall_domain_redirection_action_to_yojson
          x.firewall_domain_redirection_action );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_to_yojson x.dns_threat_protection );
      ("ConfidenceThreshold", option_to_yojson confidence_threshold_to_yojson x.confidence_threshold);
      ("FirewallRuleType", option_to_yojson firewall_rule_type_to_yojson x.firewall_rule_type);
    ]

let batch_create_firewall_rule_error_to_yojson (x : batch_create_firewall_rule_error) =
  assoc_to_yojson
    [
      ("FirewallRule", option_to_yojson create_firewall_rule_entry_to_yojson x.firewall_rule);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let batch_create_firewall_rule_errors_to_yojson tree =
  list_to_yojson batch_create_firewall_rule_error_to_yojson tree

let firewall_rule_status_message_to_yojson = string_to_yojson
let firewall_rule_status_to_yojson = string_to_yojson
let unsigned_to_yojson = int_to_yojson

let firewall_rule_to_yojson (x : firewall_rule) =
  assoc_to_yojson
    [
      ("FirewallRuleGroupId", option_to_yojson resource_id_to_yojson x.firewall_rule_group_id);
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ( "FirewallThreatProtectionId",
        option_to_yojson resource_id_to_yojson x.firewall_threat_protection_id );
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ("Action", option_to_yojson action_to_yojson x.action);
      ("BlockResponse", option_to_yojson block_response_to_yojson x.block_response);
      ( "BlockOverrideDomain",
        option_to_yojson block_override_domain_to_yojson x.block_override_domain );
      ( "BlockOverrideDnsType",
        option_to_yojson block_override_dns_type_to_yojson x.block_override_dns_type );
      ("BlockOverrideTtl", option_to_yojson unsigned_to_yojson x.block_override_ttl);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ( "FirewallDomainRedirectionAction",
        option_to_yojson firewall_domain_redirection_action_to_yojson
          x.firewall_domain_redirection_action );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_to_yojson x.dns_threat_protection );
      ("ConfidenceThreshold", option_to_yojson confidence_threshold_to_yojson x.confidence_threshold);
      ("FirewallRuleType", option_to_yojson firewall_rule_type_to_yojson x.firewall_rule_type);
      ("Status", option_to_yojson firewall_rule_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson firewall_rule_status_message_to_yojson x.status_message);
    ]

let firewall_rules_to_yojson tree = list_to_yojson firewall_rule_to_yojson tree

let batch_create_firewall_rule_response_to_yojson (x : batch_create_firewall_rule_response) =
  assoc_to_yojson
    [
      ("CreatedFirewallRules", option_to_yojson firewall_rules_to_yojson x.created_firewall_rules);
      ("CreateErrors", option_to_yojson batch_create_firewall_rule_errors_to_yojson x.create_errors);
    ]

let create_firewall_rule_entries_to_yojson tree =
  list_to_yojson create_firewall_rule_entry_to_yojson tree

let batch_create_firewall_rule_request_to_yojson (x : batch_create_firewall_rule_request) =
  assoc_to_yojson
    [
      ( "CreateFirewallRuleEntries",
        Some (create_firewall_rule_entries_to_yojson x.create_firewall_rule_entries) );
    ]

let delete_firewall_rule_entry_to_yojson (x : delete_firewall_rule_entry) =
  assoc_to_yojson
    [
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ( "FirewallThreatProtectionId",
        option_to_yojson resource_id_to_yojson x.firewall_threat_protection_id );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
    ]

let batch_delete_firewall_rule_error_to_yojson (x : batch_delete_firewall_rule_error) =
  assoc_to_yojson
    [
      ("FirewallRule", option_to_yojson delete_firewall_rule_entry_to_yojson x.firewall_rule);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let batch_delete_firewall_rule_errors_to_yojson tree =
  list_to_yojson batch_delete_firewall_rule_error_to_yojson tree

let batch_delete_firewall_rule_response_to_yojson (x : batch_delete_firewall_rule_response) =
  assoc_to_yojson
    [
      ("DeletedFirewallRules", option_to_yojson firewall_rules_to_yojson x.deleted_firewall_rules);
      ("DeleteErrors", option_to_yojson batch_delete_firewall_rule_errors_to_yojson x.delete_errors);
    ]

let delete_firewall_rule_entries_to_yojson tree =
  list_to_yojson delete_firewall_rule_entry_to_yojson tree

let batch_delete_firewall_rule_request_to_yojson (x : batch_delete_firewall_rule_request) =
  assoc_to_yojson
    [
      ( "DeleteFirewallRuleEntries",
        Some (delete_firewall_rule_entries_to_yojson x.delete_firewall_rule_entries) );
    ]

let update_firewall_rule_entry_to_yojson (x : update_firewall_rule_entry) =
  assoc_to_yojson
    [
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ( "FirewallThreatProtectionId",
        option_to_yojson resource_id_to_yojson x.firewall_threat_protection_id );
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ("Action", option_to_yojson action_to_yojson x.action);
      ("BlockResponse", option_to_yojson block_response_to_yojson x.block_response);
      ( "BlockOverrideDomain",
        option_to_yojson block_override_domain_to_yojson x.block_override_domain );
      ( "BlockOverrideDnsType",
        option_to_yojson block_override_dns_type_to_yojson x.block_override_dns_type );
      ("BlockOverrideTtl", option_to_yojson block_override_ttl_to_yojson x.block_override_ttl);
      ("Name", option_to_yojson name_to_yojson x.name);
      ( "FirewallDomainRedirectionAction",
        option_to_yojson firewall_domain_redirection_action_to_yojson
          x.firewall_domain_redirection_action );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_to_yojson x.dns_threat_protection );
      ("ConfidenceThreshold", option_to_yojson confidence_threshold_to_yojson x.confidence_threshold);
      ("FirewallRuleType", option_to_yojson firewall_rule_type_to_yojson x.firewall_rule_type);
    ]

let batch_update_firewall_rule_error_to_yojson (x : batch_update_firewall_rule_error) =
  assoc_to_yojson
    [
      ("FirewallRule", option_to_yojson update_firewall_rule_entry_to_yojson x.firewall_rule);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let batch_update_firewall_rule_errors_to_yojson tree =
  list_to_yojson batch_update_firewall_rule_error_to_yojson tree

let batch_update_firewall_rule_response_to_yojson (x : batch_update_firewall_rule_response) =
  assoc_to_yojson
    [
      ("UpdatedFirewallRules", option_to_yojson firewall_rules_to_yojson x.updated_firewall_rules);
      ("UpdateErrors", option_to_yojson batch_update_firewall_rule_errors_to_yojson x.update_errors);
    ]

let update_firewall_rule_entries_to_yojson tree =
  list_to_yojson update_firewall_rule_entry_to_yojson tree

let batch_update_firewall_rule_request_to_yojson (x : batch_update_firewall_rule_request) =
  assoc_to_yojson
    [
      ( "UpdateFirewallRuleEntries",
        Some (update_firewall_rule_entries_to_yojson x.update_firewall_rule_entries) );
    ]

let boolean__to_yojson = bool_to_yojson
let category_to_yojson = string_to_yojson
let count_to_yojson = int_to_yojson

let domain_list_type_to_yojson (x : domain_list_type) =
  match x with THREAT -> `String "THREAT" | CONTENT -> `String "CONTENT"

let firewall_domain_list_status_to_yojson (x : firewall_domain_list_status) =
  match x with
  | COMPLETE -> `String "COMPLETE"
  | COMPLETE_IMPORT_FAILED -> `String "COMPLETE_IMPORT_FAILED"
  | IMPORTING -> `String "IMPORTING"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"

let firewall_domain_list_to_yojson (x : firewall_domain_list) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("DomainCount", option_to_yojson unsigned_to_yojson x.domain_count);
      ("Status", option_to_yojson firewall_domain_list_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("ManagedOwnerName", option_to_yojson service_principle_to_yojson x.managed_owner_name);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("Category", option_to_yojson category_to_yojson x.category);
      ("ManagedListType", option_to_yojson domain_list_type_to_yojson x.managed_list_type);
    ]

let create_firewall_domain_list_response_to_yojson (x : create_firewall_domain_list_response) =
  assoc_to_yojson
    [
      ("FirewallDomainList", option_to_yojson firewall_domain_list_to_yojson x.firewall_domain_list);
    ]

let create_firewall_domain_list_request_to_yojson (x : create_firewall_domain_list_request) =
  assoc_to_yojson
    [
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
      ("Name", Some (name_to_yojson x.name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_firewall_rule_response_to_yojson (x : create_firewall_rule_response) =
  assoc_to_yojson [ ("FirewallRule", option_to_yojson firewall_rule_to_yojson x.firewall_rule) ]

let create_firewall_rule_request_to_yojson (x : create_firewall_rule_request) =
  assoc_to_yojson
    [
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ("Priority", Some (priority_to_yojson x.priority));
      ("Action", Some (action_to_yojson x.action));
      ("BlockResponse", option_to_yojson block_response_to_yojson x.block_response);
      ( "BlockOverrideDomain",
        option_to_yojson block_override_domain_to_yojson x.block_override_domain );
      ( "BlockOverrideDnsType",
        option_to_yojson block_override_dns_type_to_yojson x.block_override_dns_type );
      ("BlockOverrideTtl", option_to_yojson block_override_ttl_to_yojson x.block_override_ttl);
      ("Name", Some (name_to_yojson x.name));
      ( "FirewallDomainRedirectionAction",
        option_to_yojson firewall_domain_redirection_action_to_yojson
          x.firewall_domain_redirection_action );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_to_yojson x.dns_threat_protection );
      ("ConfidenceThreshold", option_to_yojson confidence_threshold_to_yojson x.confidence_threshold);
      ("FirewallRuleType", option_to_yojson firewall_rule_type_to_yojson x.firewall_rule_type);
    ]

let share_status_to_yojson (x : share_status) =
  match x with
  | NotShared -> `String "NOT_SHARED"
  | SharedWithMe -> `String "SHARED_WITH_ME"
  | SharedByMe -> `String "SHARED_BY_ME"

let firewall_rule_group_status_to_yojson (x : firewall_rule_group_status) =
  match x with
  | COMPLETE -> `String "COMPLETE"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"

let firewall_rule_group_to_yojson (x : firewall_rule_group) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("RuleCount", option_to_yojson unsigned_to_yojson x.rule_count);
      ("Status", option_to_yojson firewall_rule_group_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("ShareStatus", option_to_yojson share_status_to_yojson x.share_status);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
    ]

let create_firewall_rule_group_response_to_yojson (x : create_firewall_rule_group_response) =
  assoc_to_yojson
    [ ("FirewallRuleGroup", option_to_yojson firewall_rule_group_to_yojson x.firewall_rule_group) ]

let create_firewall_rule_group_request_to_yojson (x : create_firewall_rule_group_request) =
  assoc_to_yojson
    [
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
      ("Name", Some (name_to_yojson x.name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let outpost_resolver_status_message_to_yojson = string_to_yojson

let outpost_resolver_status_to_yojson (x : outpost_resolver_status) =
  match x with
  | CREATING -> `String "CREATING"
  | OPERATIONAL -> `String "OPERATIONAL"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | ACTION_NEEDED -> `String "ACTION_NEEDED"
  | FAILED_CREATION -> `String "FAILED_CREATION"
  | FAILED_DELETION -> `String "FAILED_DELETION"

let outpost_resolver_name_to_yojson = string_to_yojson
let instance_count_to_yojson = int_to_yojson

let outpost_resolver_to_yojson (x : outpost_resolver) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("InstanceCount", option_to_yojson instance_count_to_yojson x.instance_count);
      ( "PreferredInstanceType",
        option_to_yojson outpost_instance_type_to_yojson x.preferred_instance_type );
      ("Name", option_to_yojson outpost_resolver_name_to_yojson x.name);
      ("Status", option_to_yojson outpost_resolver_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson outpost_resolver_status_message_to_yojson x.status_message);
      ("OutpostArn", option_to_yojson outpost_arn_to_yojson x.outpost_arn);
    ]

let create_outpost_resolver_response_to_yojson (x : create_outpost_resolver_response) =
  assoc_to_yojson
    [ ("OutpostResolver", option_to_yojson outpost_resolver_to_yojson x.outpost_resolver) ]

let create_outpost_resolver_request_to_yojson (x : create_outpost_resolver_request) =
  assoc_to_yojson
    [
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
      ("Name", Some (outpost_resolver_name_to_yojson x.name));
      ("InstanceCount", option_to_yojson instance_count_to_yojson x.instance_count);
      ("PreferredInstanceType", Some (outpost_instance_type_to_yojson x.preferred_instance_type));
      ("OutpostArn", Some (outpost_arn_to_yojson x.outpost_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_resolver_endpoint_response_to_yojson (x : create_resolver_endpoint_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let ip_address_request_to_yojson (x : ip_address_request) =
  assoc_to_yojson
    [
      ("SubnetId", Some (subnet_id_to_yojson x.subnet_id));
      ("Ip", option_to_yojson ip_to_yojson x.ip);
      ("Ipv6", option_to_yojson ipv6_to_yojson x.ipv6);
    ]

let ip_addresses_request_to_yojson tree = list_to_yojson ip_address_request_to_yojson tree

let create_resolver_endpoint_request_to_yojson (x : create_resolver_endpoint_request) =
  assoc_to_yojson
    [
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
      ("Name", option_to_yojson name_to_yojson x.name);
      ("SecurityGroupIds", Some (security_group_ids_to_yojson x.security_group_ids));
      ("Direction", Some (resolver_endpoint_direction_to_yojson x.direction));
      ("IpAddresses", Some (ip_addresses_request_to_yojson x.ip_addresses));
      ("OutpostArn", option_to_yojson outpost_arn_to_yojson x.outpost_arn);
      ( "PreferredInstanceType",
        option_to_yojson outpost_instance_type_to_yojson x.preferred_instance_type );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ResolverEndpointType",
        option_to_yojson resolver_endpoint_type_to_yojson x.resolver_endpoint_type );
      ("Protocols", option_to_yojson protocol_list_to_yojson x.protocols);
      ( "RniEnhancedMetricsEnabled",
        option_to_yojson rni_enhanced_metrics_enabled_to_yojson x.rni_enhanced_metrics_enabled );
      ( "TargetNameServerMetricsEnabled",
        option_to_yojson target_name_server_metrics_enabled_to_yojson
          x.target_name_server_metrics_enabled );
      ("Dns64Enabled", option_to_yojson dns64_enabled_to_yojson x.dns64_enabled);
      ( "Ipv6InternetAccessEnabled",
        option_to_yojson ipv6_internet_access_enabled_to_yojson x.ipv6_internet_access_enabled );
    ]

let destination_arn_to_yojson = string_to_yojson
let resolver_query_log_config_name_to_yojson = string_to_yojson

let resolver_query_log_config_status_to_yojson (x : resolver_query_log_config_status) =
  match x with
  | Creating -> `String "CREATING"
  | Created -> `String "CREATED"
  | Deleting -> `String "DELETING"
  | Failed -> `String "FAILED"

let resolver_query_log_config_to_yojson (x : resolver_query_log_config) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("Status", option_to_yojson resolver_query_log_config_status_to_yojson x.status);
      ("ShareStatus", option_to_yojson share_status_to_yojson x.share_status);
      ("AssociationCount", option_to_yojson count_to_yojson x.association_count);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Name", option_to_yojson resolver_query_log_config_name_to_yojson x.name);
      ("DestinationArn", option_to_yojson destination_arn_to_yojson x.destination_arn);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
    ]

let create_resolver_query_log_config_response_to_yojson
    (x : create_resolver_query_log_config_response) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfig",
        option_to_yojson resolver_query_log_config_to_yojson x.resolver_query_log_config );
    ]

let create_resolver_query_log_config_request_to_yojson
    (x : create_resolver_query_log_config_request) =
  assoc_to_yojson
    [
      ("Name", Some (resolver_query_log_config_name_to_yojson x.name));
      ("DestinationArn", Some (destination_arn_to_yojson x.destination_arn));
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let delegation_record_to_yojson = string_to_yojson
let server_name_indication_to_yojson = string_to_yojson
let port_to_yojson = int_to_yojson

let target_address_to_yojson (x : target_address) =
  assoc_to_yojson
    [
      ("Ip", option_to_yojson ip_to_yojson x.ip);
      ("Port", option_to_yojson port_to_yojson x.port);
      ("Ipv6", option_to_yojson ipv6_to_yojson x.ipv6);
      ("Protocol", option_to_yojson protocol_to_yojson x.protocol);
      ( "ServerNameIndication",
        option_to_yojson server_name_indication_to_yojson x.server_name_indication );
    ]

let target_list_to_yojson tree = list_to_yojson target_address_to_yojson tree

let rule_type_option_to_yojson (x : rule_type_option) =
  match x with
  | Forward -> `String "FORWARD"
  | System -> `String "SYSTEM"
  | Recursive -> `String "RECURSIVE"
  | Delegate -> `String "DELEGATE"

let resolver_rule_status_to_yojson (x : resolver_rule_status) =
  match x with
  | Complete -> `String "COMPLETE"
  | Deleting -> `String "DELETING"
  | Updating -> `String "UPDATING"
  | Failed -> `String "FAILED"

let domain_name_to_yojson = string_to_yojson

let resolver_rule_to_yojson (x : resolver_rule) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("Status", option_to_yojson resolver_rule_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("RuleType", option_to_yojson rule_type_option_to_yojson x.rule_type);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("TargetIps", option_to_yojson target_list_to_yojson x.target_ips);
      ("ResolverEndpointId", option_to_yojson resource_id_to_yojson x.resolver_endpoint_id);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("ShareStatus", option_to_yojson share_status_to_yojson x.share_status);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("DelegationRecord", option_to_yojson delegation_record_to_yojson x.delegation_record);
    ]

let create_resolver_rule_response_to_yojson (x : create_resolver_rule_response) =
  assoc_to_yojson [ ("ResolverRule", option_to_yojson resolver_rule_to_yojson x.resolver_rule) ]

let create_resolver_rule_request_to_yojson (x : create_resolver_rule_request) =
  assoc_to_yojson
    [
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
      ("Name", option_to_yojson name_to_yojson x.name);
      ("RuleType", Some (rule_type_option_to_yojson x.rule_type));
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("TargetIps", option_to_yojson target_list_to_yojson x.target_ips);
      ("ResolverEndpointId", option_to_yojson resource_id_to_yojson x.resolver_endpoint_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DelegationRecord", option_to_yojson delegation_record_to_yojson x.delegation_record);
    ]

let delete_firewall_domain_list_response_to_yojson (x : delete_firewall_domain_list_response) =
  assoc_to_yojson
    [
      ("FirewallDomainList", option_to_yojson firewall_domain_list_to_yojson x.firewall_domain_list);
    ]

let delete_firewall_domain_list_request_to_yojson (x : delete_firewall_domain_list_request) =
  assoc_to_yojson
    [ ("FirewallDomainListId", Some (resource_id_to_yojson x.firewall_domain_list_id)) ]

let delete_firewall_rule_response_to_yojson (x : delete_firewall_rule_response) =
  assoc_to_yojson [ ("FirewallRule", option_to_yojson firewall_rule_to_yojson x.firewall_rule) ]

let delete_firewall_rule_request_to_yojson (x : delete_firewall_rule_request) =
  assoc_to_yojson
    [
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ( "FirewallThreatProtectionId",
        option_to_yojson resource_id_to_yojson x.firewall_threat_protection_id );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
    ]

let delete_firewall_rule_group_response_to_yojson (x : delete_firewall_rule_group_response) =
  assoc_to_yojson
    [ ("FirewallRuleGroup", option_to_yojson firewall_rule_group_to_yojson x.firewall_rule_group) ]

let delete_firewall_rule_group_request_to_yojson (x : delete_firewall_rule_group_request) =
  assoc_to_yojson [ ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id)) ]

let delete_outpost_resolver_response_to_yojson (x : delete_outpost_resolver_response) =
  assoc_to_yojson
    [ ("OutpostResolver", option_to_yojson outpost_resolver_to_yojson x.outpost_resolver) ]

let delete_outpost_resolver_request_to_yojson (x : delete_outpost_resolver_request) =
  assoc_to_yojson [ ("Id", Some (resource_id_to_yojson x.id)) ]

let delete_resolver_endpoint_response_to_yojson (x : delete_resolver_endpoint_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let delete_resolver_endpoint_request_to_yojson (x : delete_resolver_endpoint_request) =
  assoc_to_yojson [ ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id)) ]

let delete_resolver_query_log_config_response_to_yojson
    (x : delete_resolver_query_log_config_response) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfig",
        option_to_yojson resolver_query_log_config_to_yojson x.resolver_query_log_config );
    ]

let delete_resolver_query_log_config_request_to_yojson
    (x : delete_resolver_query_log_config_request) =
  assoc_to_yojson
    [ ("ResolverQueryLogConfigId", Some (resource_id_to_yojson x.resolver_query_log_config_id)) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
    ]

let delete_resolver_rule_response_to_yojson (x : delete_resolver_rule_response) =
  assoc_to_yojson [ ("ResolverRule", option_to_yojson resolver_rule_to_yojson x.resolver_rule) ]

let delete_resolver_rule_request_to_yojson (x : delete_resolver_rule_request) =
  assoc_to_yojson [ ("ResolverRuleId", Some (resource_id_to_yojson x.resolver_rule_id)) ]

let disassociate_firewall_rule_group_response_to_yojson
    (x : disassociate_firewall_rule_group_response) =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupAssociation",
        option_to_yojson firewall_rule_group_association_to_yojson x.firewall_rule_group_association
      );
    ]

let disassociate_firewall_rule_group_request_to_yojson
    (x : disassociate_firewall_rule_group_request) =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupAssociationId",
        Some (resource_id_to_yojson x.firewall_rule_group_association_id) );
    ]

let disassociate_resolver_endpoint_ip_address_response_to_yojson
    (x : disassociate_resolver_endpoint_ip_address_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let disassociate_resolver_endpoint_ip_address_request_to_yojson
    (x : disassociate_resolver_endpoint_ip_address_request) =
  assoc_to_yojson
    [
      ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id));
      ("IpAddress", Some (ip_address_update_to_yojson x.ip_address));
    ]

let disassociate_resolver_query_log_config_response_to_yojson
    (x : disassociate_resolver_query_log_config_response) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfigAssociation",
        option_to_yojson resolver_query_log_config_association_to_yojson
          x.resolver_query_log_config_association );
    ]

let disassociate_resolver_query_log_config_request_to_yojson
    (x : disassociate_resolver_query_log_config_request) =
  assoc_to_yojson
    [
      ("ResolverQueryLogConfigId", Some (resource_id_to_yojson x.resolver_query_log_config_id));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let disassociate_resolver_rule_response_to_yojson (x : disassociate_resolver_rule_response) =
  assoc_to_yojson
    [
      ( "ResolverRuleAssociation",
        option_to_yojson resolver_rule_association_to_yojson x.resolver_rule_association );
    ]

let disassociate_resolver_rule_request_to_yojson (x : disassociate_resolver_rule_request) =
  assoc_to_yojson
    [
      ("VPCId", Some (resource_id_to_yojson x.vpc_id));
      ("ResolverRuleId", Some (resource_id_to_yojson x.resolver_rule_id));
    ]

let display_name_to_yojson = string_to_yojson
let domain_list_file_url_to_yojson = string_to_yojson
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

let firewall_fail_open_status_to_yojson (x : firewall_fail_open_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"
  | USE_LOCAL_RESOURCE_SETTING -> `String "USE_LOCAL_RESOURCE_SETTING"

let firewall_config_to_yojson (x : firewall_config) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("FirewallFailOpen", option_to_yojson firewall_fail_open_status_to_yojson x.firewall_fail_open);
    ]

let firewall_config_list_to_yojson tree = list_to_yojson firewall_config_to_yojson tree

let firewall_domain_import_operation_to_yojson (x : firewall_domain_import_operation) =
  match x with REPLACE -> `String "REPLACE"

let firewall_domain_list_metadata_to_yojson (x : firewall_domain_list_metadata) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("ManagedOwnerName", option_to_yojson service_principle_to_yojson x.managed_owner_name);
      ("ManagedListType", option_to_yojson domain_list_type_to_yojson x.managed_list_type);
      ("Category", option_to_yojson category_to_yojson x.category);
    ]

let firewall_domain_list_metadata_list_to_yojson tree =
  list_to_yojson firewall_domain_list_metadata_to_yojson tree

let firewall_domain_name_to_yojson = string_to_yojson

let firewall_domain_update_operation_to_yojson (x : firewall_domain_update_operation) =
  match x with ADD -> `String "ADD" | REMOVE -> `String "REMOVE" | REPLACE -> `String "REPLACE"

let firewall_domains_to_yojson tree = list_to_yojson firewall_domain_name_to_yojson tree

let firewall_rule_group_associations_to_yojson tree =
  list_to_yojson firewall_rule_group_association_to_yojson tree

let firewall_rule_group_metadata_to_yojson (x : firewall_rule_group_metadata) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("ShareStatus", option_to_yojson share_status_to_yojson x.share_status);
    ]

let firewall_rule_group_metadata_list_to_yojson tree =
  list_to_yojson firewall_rule_group_metadata_to_yojson tree

let firewall_rule_group_policy_to_yojson = string_to_yojson
let product_id_to_yojson = string_to_yojson
let vendor_name_to_yojson = string_to_yojson

let subscription_info_to_yojson (x : subscription_info) =
  assoc_to_yojson
    [
      ("VendorName", option_to_yojson vendor_name_to_yojson x.vendor_name);
      ("ProductId", option_to_yojson product_id_to_yojson x.product_id);
    ]

let rule_type_description_to_yojson = string_to_yojson
let rule_type_value_to_yojson = string_to_yojson
let rule_type_name_to_yojson = string_to_yojson

let firewall_rule_type_definition_to_yojson (x : firewall_rule_type_definition) =
  assoc_to_yojson
    [
      ("RuleType", option_to_yojson rule_type_name_to_yojson x.rule_type);
      ("Value", option_to_yojson rule_type_value_to_yojson x.value);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson rule_type_description_to_yojson x.description);
      ("SubscriptionInfo", option_to_yojson subscription_info_to_yojson x.subscription_info);
    ]

let firewall_rule_type_definitions_to_yojson tree =
  list_to_yojson firewall_rule_type_definition_to_yojson tree

let get_firewall_config_response_to_yojson (x : get_firewall_config_response) =
  assoc_to_yojson
    [ ("FirewallConfig", option_to_yojson firewall_config_to_yojson x.firewall_config) ]

let get_firewall_config_request_to_yojson (x : get_firewall_config_request) =
  assoc_to_yojson [ ("ResourceId", Some (resource_id_to_yojson x.resource_id)) ]

let get_firewall_domain_list_response_to_yojson (x : get_firewall_domain_list_response) =
  assoc_to_yojson
    [
      ("FirewallDomainList", option_to_yojson firewall_domain_list_to_yojson x.firewall_domain_list);
    ]

let get_firewall_domain_list_request_to_yojson (x : get_firewall_domain_list_request) =
  assoc_to_yojson
    [ ("FirewallDomainListId", Some (resource_id_to_yojson x.firewall_domain_list_id)) ]

let get_firewall_rule_group_response_to_yojson (x : get_firewall_rule_group_response) =
  assoc_to_yojson
    [ ("FirewallRuleGroup", option_to_yojson firewall_rule_group_to_yojson x.firewall_rule_group) ]

let get_firewall_rule_group_request_to_yojson (x : get_firewall_rule_group_request) =
  assoc_to_yojson [ ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id)) ]

let get_firewall_rule_group_association_response_to_yojson
    (x : get_firewall_rule_group_association_response) =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupAssociation",
        option_to_yojson firewall_rule_group_association_to_yojson x.firewall_rule_group_association
      );
    ]

let get_firewall_rule_group_association_request_to_yojson
    (x : get_firewall_rule_group_association_request) =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupAssociationId",
        Some (resource_id_to_yojson x.firewall_rule_group_association_id) );
    ]

let get_firewall_rule_group_policy_response_to_yojson (x : get_firewall_rule_group_policy_response)
    =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupPolicy",
        option_to_yojson firewall_rule_group_policy_to_yojson x.firewall_rule_group_policy );
    ]

let get_firewall_rule_group_policy_request_to_yojson (x : get_firewall_rule_group_policy_request) =
  assoc_to_yojson [ ("Arn", Some (arn_to_yojson x.arn)) ]

let get_outpost_resolver_response_to_yojson (x : get_outpost_resolver_response) =
  assoc_to_yojson
    [ ("OutpostResolver", option_to_yojson outpost_resolver_to_yojson x.outpost_resolver) ]

let get_outpost_resolver_request_to_yojson (x : get_outpost_resolver_request) =
  assoc_to_yojson [ ("Id", Some (resource_id_to_yojson x.id)) ]

let resolver_autodefined_reverse_status_to_yojson (x : resolver_autodefined_reverse_status) =
  match x with
  | Enabling -> `String "ENABLING"
  | Enabled -> `String "ENABLED"
  | Disabling -> `String "DISABLING"
  | Disabled -> `String "DISABLED"
  | UpdatingToUseLocalResourceSetting -> `String "UPDATING_TO_USE_LOCAL_RESOURCE_SETTING"
  | UseLocalResourceSetting -> `String "USE_LOCAL_RESOURCE_SETTING"

let resolver_config_to_yojson (x : resolver_config) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ( "AutodefinedReverse",
        option_to_yojson resolver_autodefined_reverse_status_to_yojson x.autodefined_reverse );
    ]

let get_resolver_config_response_to_yojson (x : get_resolver_config_response) =
  assoc_to_yojson
    [ ("ResolverConfig", option_to_yojson resolver_config_to_yojson x.resolver_config) ]

let get_resolver_config_request_to_yojson (x : get_resolver_config_request) =
  assoc_to_yojson [ ("ResourceId", Some (resource_id_to_yojson x.resource_id)) ]

let resolver_dnssec_validation_status_to_yojson (x : resolver_dnssec_validation_status) =
  match x with
  | Enabling -> `String "ENABLING"
  | Enabled -> `String "ENABLED"
  | Disabling -> `String "DISABLING"
  | Disabled -> `String "DISABLED"
  | UpdateToUseLocalResourceSetting -> `String "UPDATING_TO_USE_LOCAL_RESOURCE_SETTING"
  | UseLocalResourceSetting -> `String "USE_LOCAL_RESOURCE_SETTING"

let resolver_dnssec_config_to_yojson (x : resolver_dnssec_config) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ( "ValidationStatus",
        option_to_yojson resolver_dnssec_validation_status_to_yojson x.validation_status );
    ]

let get_resolver_dnssec_config_response_to_yojson (x : get_resolver_dnssec_config_response) =
  assoc_to_yojson
    [
      ( "ResolverDNSSECConfig",
        option_to_yojson resolver_dnssec_config_to_yojson x.resolver_dnssec_config );
    ]

let get_resolver_dnssec_config_request_to_yojson (x : get_resolver_dnssec_config_request) =
  assoc_to_yojson [ ("ResourceId", Some (resource_id_to_yojson x.resource_id)) ]

let get_resolver_endpoint_response_to_yojson (x : get_resolver_endpoint_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let get_resolver_endpoint_request_to_yojson (x : get_resolver_endpoint_request) =
  assoc_to_yojson [ ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id)) ]

let get_resolver_query_log_config_response_to_yojson (x : get_resolver_query_log_config_response) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfig",
        option_to_yojson resolver_query_log_config_to_yojson x.resolver_query_log_config );
    ]

let get_resolver_query_log_config_request_to_yojson (x : get_resolver_query_log_config_request) =
  assoc_to_yojson
    [ ("ResolverQueryLogConfigId", Some (resource_id_to_yojson x.resolver_query_log_config_id)) ]

let get_resolver_query_log_config_association_response_to_yojson
    (x : get_resolver_query_log_config_association_response) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfigAssociation",
        option_to_yojson resolver_query_log_config_association_to_yojson
          x.resolver_query_log_config_association );
    ]

let get_resolver_query_log_config_association_request_to_yojson
    (x : get_resolver_query_log_config_association_request) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfigAssociationId",
        Some (resource_id_to_yojson x.resolver_query_log_config_association_id) );
    ]

let unknown_resource_exception_to_yojson (x : unknown_resource_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let resolver_query_log_config_policy_to_yojson = string_to_yojson

let get_resolver_query_log_config_policy_response_to_yojson
    (x : get_resolver_query_log_config_policy_response) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfigPolicy",
        option_to_yojson resolver_query_log_config_policy_to_yojson
          x.resolver_query_log_config_policy );
    ]

let get_resolver_query_log_config_policy_request_to_yojson
    (x : get_resolver_query_log_config_policy_request) =
  assoc_to_yojson [ ("Arn", Some (arn_to_yojson x.arn)) ]

let get_resolver_rule_response_to_yojson (x : get_resolver_rule_response) =
  assoc_to_yojson [ ("ResolverRule", option_to_yojson resolver_rule_to_yojson x.resolver_rule) ]

let get_resolver_rule_request_to_yojson (x : get_resolver_rule_request) =
  assoc_to_yojson [ ("ResolverRuleId", Some (resource_id_to_yojson x.resolver_rule_id)) ]

let get_resolver_rule_association_response_to_yojson (x : get_resolver_rule_association_response) =
  assoc_to_yojson
    [
      ( "ResolverRuleAssociation",
        option_to_yojson resolver_rule_association_to_yojson x.resolver_rule_association );
    ]

let get_resolver_rule_association_request_to_yojson (x : get_resolver_rule_association_request) =
  assoc_to_yojson
    [ ("ResolverRuleAssociationId", Some (resource_id_to_yojson x.resolver_rule_association_id)) ]

let resolver_rule_policy_to_yojson = string_to_yojson

let get_resolver_rule_policy_response_to_yojson (x : get_resolver_rule_policy_response) =
  assoc_to_yojson
    [
      ("ResolverRulePolicy", option_to_yojson resolver_rule_policy_to_yojson x.resolver_rule_policy);
    ]

let get_resolver_rule_policy_request_to_yojson (x : get_resolver_rule_policy_request) =
  assoc_to_yojson [ ("Arn", Some (arn_to_yojson x.arn)) ]

let import_firewall_domains_response_to_yojson (x : import_firewall_domains_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Status", option_to_yojson firewall_domain_list_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
    ]

let import_firewall_domains_request_to_yojson (x : import_firewall_domains_request) =
  assoc_to_yojson
    [
      ("FirewallDomainListId", Some (resource_id_to_yojson x.firewall_domain_list_id));
      ("Operation", Some (firewall_domain_import_operation_to_yojson x.operation));
      ("DomainFileUrl", Some (domain_list_file_url_to_yojson x.domain_file_url));
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_policy_document_to_yojson (x : invalid_policy_document) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_tag_exception_to_yojson (x : invalid_tag_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let ip_address_status_to_yojson (x : ip_address_status) =
  match x with
  | Creating -> `String "CREATING"
  | FailedCreation -> `String "FAILED_CREATION"
  | FailedCreationInsufficientEC2CapacityInOutpost ->
      `String "FAILED_CREATION_INSUFFICIENT_EC2_CAPACITY_IN_OUTPOST"
  | Attaching -> `String "ATTACHING"
  | Attached -> `String "ATTACHED"
  | RemapDetaching -> `String "REMAP_DETACHING"
  | RemapAttaching -> `String "REMAP_ATTACHING"
  | Detaching -> `String "DETACHING"
  | FailedResourceGone -> `String "FAILED_RESOURCE_GONE"
  | Deleting -> `String "DELETING"
  | DeleteFailedFasExpired -> `String "DELETE_FAILED_FAS_EXPIRED"
  | Updating -> `String "UPDATING"
  | UpdateFailed -> `String "UPDATE_FAILED"
  | Isolated -> `String "ISOLATED"

let ip_address_response_to_yojson (x : ip_address_response) =
  assoc_to_yojson
    [
      ("IpId", option_to_yojson resource_id_to_yojson x.ip_id);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("Ip", option_to_yojson ip_to_yojson x.ip);
      ("Ipv6", option_to_yojson ipv6_to_yojson x.ipv6);
      ("Status", option_to_yojson ip_address_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
    ]

let ip_addresses_response_to_yojson tree = list_to_yojson ip_address_response_to_yojson tree
let list_domain_max_results_to_yojson = int_to_yojson
let next_token_to_yojson = string_to_yojson

let list_firewall_configs_response_to_yojson (x : list_firewall_configs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("FirewallConfigs", option_to_yojson firewall_config_list_to_yojson x.firewall_configs);
    ]

let list_firewall_configs_max_result_to_yojson = int_to_yojson

let list_firewall_configs_request_to_yojson (x : list_firewall_configs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_firewall_configs_max_result_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_domain_lists_response_to_yojson (x : list_firewall_domain_lists_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "FirewallDomainLists",
        option_to_yojson firewall_domain_list_metadata_list_to_yojson x.firewall_domain_lists );
    ]

let max_results_to_yojson = int_to_yojson

let list_firewall_domain_lists_request_to_yojson (x : list_firewall_domain_lists_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_domains_response_to_yojson (x : list_firewall_domains_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Domains", option_to_yojson firewall_domains_to_yojson x.domains);
    ]

let list_firewall_domains_request_to_yojson (x : list_firewall_domains_request) =
  assoc_to_yojson
    [
      ("FirewallDomainListId", Some (resource_id_to_yojson x.firewall_domain_list_id));
      ("MaxResults", option_to_yojson list_domain_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_rule_group_associations_response_to_yojson
    (x : list_firewall_rule_group_associations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "FirewallRuleGroupAssociations",
        option_to_yojson firewall_rule_group_associations_to_yojson
          x.firewall_rule_group_associations );
    ]

let list_firewall_rule_group_associations_request_to_yojson
    (x : list_firewall_rule_group_associations_request) =
  assoc_to_yojson
    [
      ("FirewallRuleGroupId", option_to_yojson resource_id_to_yojson x.firewall_rule_group_id);
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ("Status", option_to_yojson firewall_rule_group_association_status_to_yojson x.status);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_rule_groups_response_to_yojson (x : list_firewall_rule_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "FirewallRuleGroups",
        option_to_yojson firewall_rule_group_metadata_list_to_yojson x.firewall_rule_groups );
    ]

let list_firewall_rule_groups_request_to_yojson (x : list_firewall_rule_groups_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_rule_types_response_to_yojson (x : list_firewall_rule_types_response) =
  assoc_to_yojson
    [
      ( "FirewallRuleTypes",
        option_to_yojson firewall_rule_type_definitions_to_yojson x.firewall_rule_types );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_rule_types_request_to_yojson (x : list_firewall_rule_types_request) =
  assoc_to_yojson
    [
      ("RuleType", option_to_yojson rule_type_name_to_yojson x.rule_type);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_rules_response_to_yojson (x : list_firewall_rules_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("FirewallRules", option_to_yojson firewall_rules_to_yojson x.firewall_rules);
    ]

let list_firewall_rules_request_to_yojson (x : list_firewall_rules_request) =
  assoc_to_yojson
    [
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ("Action", option_to_yojson action_to_yojson x.action);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let outpost_resolver_list_to_yojson tree = list_to_yojson outpost_resolver_to_yojson tree

let list_outpost_resolvers_response_to_yojson (x : list_outpost_resolvers_response) =
  assoc_to_yojson
    [
      ("OutpostResolvers", option_to_yojson outpost_resolver_list_to_yojson x.outpost_resolvers);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_outpost_resolvers_request_to_yojson (x : list_outpost_resolvers_request) =
  assoc_to_yojson
    [
      ("OutpostArn", option_to_yojson outpost_arn_to_yojson x.outpost_arn);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resolver_config_list_to_yojson tree = list_to_yojson resolver_config_to_yojson tree

let list_resolver_configs_response_to_yojson (x : list_resolver_configs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ResolverConfigs", option_to_yojson resolver_config_list_to_yojson x.resolver_configs);
    ]

let list_resolver_configs_max_result_to_yojson = int_to_yojson

let list_resolver_configs_request_to_yojson (x : list_resolver_configs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_resolver_configs_max_result_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resolver_dnssec_config_list_to_yojson tree =
  list_to_yojson resolver_dnssec_config_to_yojson tree

let list_resolver_dnssec_configs_response_to_yojson (x : list_resolver_dnssec_configs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ResolverDnssecConfigs",
        option_to_yojson resolver_dnssec_config_list_to_yojson x.resolver_dnssec_configs );
    ]

let list_resolver_dnssec_configs_request_to_yojson (x : list_resolver_dnssec_configs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let list_resolver_endpoint_ip_addresses_response_to_yojson
    (x : list_resolver_endpoint_ip_addresses_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("IpAddresses", option_to_yojson ip_addresses_response_to_yojson x.ip_addresses);
    ]

let list_resolver_endpoint_ip_addresses_request_to_yojson
    (x : list_resolver_endpoint_ip_addresses_request) =
  assoc_to_yojson
    [
      ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resolver_endpoints_to_yojson tree = list_to_yojson resolver_endpoint_to_yojson tree

let list_resolver_endpoints_response_to_yojson (x : list_resolver_endpoints_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ResolverEndpoints", option_to_yojson resolver_endpoints_to_yojson x.resolver_endpoints);
    ]

let list_resolver_endpoints_request_to_yojson (x : list_resolver_endpoints_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let resolver_query_log_config_association_list_to_yojson tree =
  list_to_yojson resolver_query_log_config_association_to_yojson tree

let list_resolver_query_log_config_associations_response_to_yojson
    (x : list_resolver_query_log_config_associations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("TotalCount", option_to_yojson count_to_yojson x.total_count);
      ("TotalFilteredCount", option_to_yojson count_to_yojson x.total_filtered_count);
      ( "ResolverQueryLogConfigAssociations",
        option_to_yojson resolver_query_log_config_association_list_to_yojson
          x.resolver_query_log_config_associations );
    ]

let sort_order_to_yojson (x : sort_order) =
  match x with Ascending -> `String "ASCENDING" | Descending -> `String "DESCENDING"

let sort_by_key_to_yojson = string_to_yojson

let list_resolver_query_log_config_associations_request_to_yojson
    (x : list_resolver_query_log_config_associations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("SortBy", option_to_yojson sort_by_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let resolver_query_log_config_list_to_yojson tree =
  list_to_yojson resolver_query_log_config_to_yojson tree

let list_resolver_query_log_configs_response_to_yojson
    (x : list_resolver_query_log_configs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("TotalCount", option_to_yojson count_to_yojson x.total_count);
      ("TotalFilteredCount", option_to_yojson count_to_yojson x.total_filtered_count);
      ( "ResolverQueryLogConfigs",
        option_to_yojson resolver_query_log_config_list_to_yojson x.resolver_query_log_configs );
    ]

let list_resolver_query_log_configs_request_to_yojson (x : list_resolver_query_log_configs_request)
    =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("SortBy", option_to_yojson sort_by_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let resolver_rule_associations_to_yojson tree =
  list_to_yojson resolver_rule_association_to_yojson tree

let list_resolver_rule_associations_response_to_yojson
    (x : list_resolver_rule_associations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "ResolverRuleAssociations",
        option_to_yojson resolver_rule_associations_to_yojson x.resolver_rule_associations );
    ]

let list_resolver_rule_associations_request_to_yojson (x : list_resolver_rule_associations_request)
    =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let resolver_rules_to_yojson tree = list_to_yojson resolver_rule_to_yojson tree

let list_resolver_rules_response_to_yojson (x : list_resolver_rules_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ResolverRules", option_to_yojson resolver_rules_to_yojson x.resolver_rules);
    ]

let list_resolver_rules_request_to_yojson (x : list_resolver_rules_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let put_firewall_rule_group_policy_response_to_yojson (x : put_firewall_rule_group_policy_response)
    =
  assoc_to_yojson [ ("ReturnValue", option_to_yojson boolean__to_yojson x.return_value) ]

let put_firewall_rule_group_policy_request_to_yojson (x : put_firewall_rule_group_policy_request) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ( "FirewallRuleGroupPolicy",
        Some (firewall_rule_group_policy_to_yojson x.firewall_rule_group_policy) );
    ]

let put_resolver_query_log_config_policy_response_to_yojson
    (x : put_resolver_query_log_config_policy_response) =
  assoc_to_yojson [ ("ReturnValue", option_to_yojson boolean__to_yojson x.return_value) ]

let put_resolver_query_log_config_policy_request_to_yojson
    (x : put_resolver_query_log_config_policy_request) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ( "ResolverQueryLogConfigPolicy",
        Some (resolver_query_log_config_policy_to_yojson x.resolver_query_log_config_policy) );
    ]

let put_resolver_rule_policy_response_to_yojson (x : put_resolver_rule_policy_response) =
  assoc_to_yojson [ ("ReturnValue", option_to_yojson boolean__to_yojson x.return_value) ]

let put_resolver_rule_policy_request_to_yojson (x : put_resolver_rule_policy_request) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("ResolverRulePolicy", Some (resolver_rule_policy_to_yojson x.resolver_rule_policy));
    ]

let resolver_rule_config_to_yojson (x : resolver_rule_config) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_to_yojson x.name);
      ("TargetIps", option_to_yojson target_list_to_yojson x.target_ips);
      ("ResolverEndpointId", option_to_yojson resource_id_to_yojson x.resolver_endpoint_id);
    ]

let update_resolver_rule_response_to_yojson (x : update_resolver_rule_response) =
  assoc_to_yojson [ ("ResolverRule", option_to_yojson resolver_rule_to_yojson x.resolver_rule) ]

let update_resolver_rule_request_to_yojson (x : update_resolver_rule_request) =
  assoc_to_yojson
    [
      ("ResolverRuleId", Some (resource_id_to_yojson x.resolver_rule_id));
      ("Config", Some (resolver_rule_config_to_yojson x.config));
    ]

let update_resolver_endpoint_response_to_yojson (x : update_resolver_endpoint_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let update_ip_address_to_yojson (x : update_ip_address) =
  assoc_to_yojson
    [ ("IpId", Some (resource_id_to_yojson x.ip_id)); ("Ipv6", Some (ipv6_to_yojson x.ipv6)) ]

let update_ip_addresses_to_yojson tree = list_to_yojson update_ip_address_to_yojson tree

let update_resolver_endpoint_request_to_yojson (x : update_resolver_endpoint_request) =
  assoc_to_yojson
    [
      ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id));
      ("Name", option_to_yojson name_to_yojson x.name);
      ( "ResolverEndpointType",
        option_to_yojson resolver_endpoint_type_to_yojson x.resolver_endpoint_type );
      ("UpdateIpAddresses", option_to_yojson update_ip_addresses_to_yojson x.update_ip_addresses);
      ("Protocols", option_to_yojson protocol_list_to_yojson x.protocols);
      ( "RniEnhancedMetricsEnabled",
        option_to_yojson rni_enhanced_metrics_enabled_to_yojson x.rni_enhanced_metrics_enabled );
      ( "TargetNameServerMetricsEnabled",
        option_to_yojson target_name_server_metrics_enabled_to_yojson
          x.target_name_server_metrics_enabled );
      ("Dns64Enabled", option_to_yojson dns64_enabled_to_yojson x.dns64_enabled);
      ( "Ipv6InternetAccessEnabled",
        option_to_yojson ipv6_internet_access_enabled_to_yojson x.ipv6_internet_access_enabled );
    ]

let update_resolver_dnssec_config_response_to_yojson (x : update_resolver_dnssec_config_response) =
  assoc_to_yojson
    [
      ( "ResolverDNSSECConfig",
        option_to_yojson resolver_dnssec_config_to_yojson x.resolver_dnssec_config );
    ]

let validation_to_yojson (x : validation) =
  match x with
  | ENABLE -> `String "ENABLE"
  | DISABLE -> `String "DISABLE"
  | USE_LOCAL_RESOURCE_SETTING -> `String "USE_LOCAL_RESOURCE_SETTING"

let update_resolver_dnssec_config_request_to_yojson (x : update_resolver_dnssec_config_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("Validation", Some (validation_to_yojson x.validation));
    ]

let update_resolver_config_response_to_yojson (x : update_resolver_config_response) =
  assoc_to_yojson
    [ ("ResolverConfig", option_to_yojson resolver_config_to_yojson x.resolver_config) ]

let update_resolver_config_request_to_yojson (x : update_resolver_config_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ( "AutodefinedReverseFlag",
        Some (autodefined_reverse_flag_to_yojson x.autodefined_reverse_flag) );
    ]

let update_outpost_resolver_response_to_yojson (x : update_outpost_resolver_response) =
  assoc_to_yojson
    [ ("OutpostResolver", option_to_yojson outpost_resolver_to_yojson x.outpost_resolver) ]

let update_outpost_resolver_request_to_yojson (x : update_outpost_resolver_request) =
  assoc_to_yojson
    [
      ("Id", Some (resource_id_to_yojson x.id));
      ("Name", option_to_yojson outpost_resolver_name_to_yojson x.name);
      ("InstanceCount", option_to_yojson instance_count_to_yojson x.instance_count);
      ( "PreferredInstanceType",
        option_to_yojson outpost_instance_type_to_yojson x.preferred_instance_type );
    ]

let update_firewall_rule_group_association_response_to_yojson
    (x : update_firewall_rule_group_association_response) =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupAssociation",
        option_to_yojson firewall_rule_group_association_to_yojson x.firewall_rule_group_association
      );
    ]

let update_firewall_rule_group_association_request_to_yojson
    (x : update_firewall_rule_group_association_request) =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupAssociationId",
        Some (resource_id_to_yojson x.firewall_rule_group_association_id) );
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ( "MutationProtection",
        option_to_yojson mutation_protection_status_to_yojson x.mutation_protection );
      ("Name", option_to_yojson name_to_yojson x.name);
    ]

let update_firewall_rule_response_to_yojson (x : update_firewall_rule_response) =
  assoc_to_yojson [ ("FirewallRule", option_to_yojson firewall_rule_to_yojson x.firewall_rule) ]

let update_firewall_rule_request_to_yojson (x : update_firewall_rule_request) =
  assoc_to_yojson
    [
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ( "FirewallThreatProtectionId",
        option_to_yojson resource_id_to_yojson x.firewall_threat_protection_id );
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ("Action", option_to_yojson action_to_yojson x.action);
      ("BlockResponse", option_to_yojson block_response_to_yojson x.block_response);
      ( "BlockOverrideDomain",
        option_to_yojson block_override_domain_to_yojson x.block_override_domain );
      ( "BlockOverrideDnsType",
        option_to_yojson block_override_dns_type_to_yojson x.block_override_dns_type );
      ("BlockOverrideTtl", option_to_yojson block_override_ttl_to_yojson x.block_override_ttl);
      ("Name", option_to_yojson name_to_yojson x.name);
      ( "FirewallDomainRedirectionAction",
        option_to_yojson firewall_domain_redirection_action_to_yojson
          x.firewall_domain_redirection_action );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_to_yojson x.dns_threat_protection );
      ("ConfidenceThreshold", option_to_yojson confidence_threshold_to_yojson x.confidence_threshold);
      ("FirewallRuleType", option_to_yojson firewall_rule_type_to_yojson x.firewall_rule_type);
    ]

let update_firewall_domains_response_to_yojson (x : update_firewall_domains_response) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Status", option_to_yojson firewall_domain_list_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
    ]

let update_firewall_domains_request_to_yojson (x : update_firewall_domains_request) =
  assoc_to_yojson
    [
      ("FirewallDomainListId", Some (resource_id_to_yojson x.firewall_domain_list_id));
      ("Operation", Some (firewall_domain_update_operation_to_yojson x.operation));
      ("Domains", Some (firewall_domains_to_yojson x.domains));
    ]

let update_firewall_config_response_to_yojson (x : update_firewall_config_response) =
  assoc_to_yojson
    [ ("FirewallConfig", option_to_yojson firewall_config_to_yojson x.firewall_config) ]

let update_firewall_config_request_to_yojson (x : update_firewall_config_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("FirewallFailOpen", Some (firewall_fail_open_status_to_yojson x.firewall_fail_open));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]
