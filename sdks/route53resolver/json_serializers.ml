open Smaws_Lib.Json.SerializeHelpers
open Types

let vendor_name_to_yojson = string_to_yojson
let exception_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let validation_to_yojson (x : validation) =
  match x with
  | USE_LOCAL_RESOURCE_SETTING -> `String "USE_LOCAL_RESOURCE_SETTING"
  | DISABLE -> `String "DISABLE"
  | ENABLE -> `String "ENABLE"

let resource_id_to_yojson = string_to_yojson
let creator_request_id_to_yojson = string_to_yojson
let arn_to_yojson = string_to_yojson
let domain_name_to_yojson = string_to_yojson

let resolver_rule_status_to_yojson (x : resolver_rule_status) =
  match x with
  | Failed -> `String "FAILED"
  | Updating -> `String "UPDATING"
  | Deleting -> `String "DELETING"
  | Complete -> `String "COMPLETE"

let status_message_to_yojson = string_to_yojson

let rule_type_option_to_yojson (x : rule_type_option) =
  match x with
  | Delegate -> `String "DELEGATE"
  | Recursive -> `String "RECURSIVE"
  | System -> `String "SYSTEM"
  | Forward -> `String "FORWARD"

let name_to_yojson = string_to_yojson
let ip_to_yojson = string_to_yojson
let port_to_yojson = int_to_yojson
let ipv6_to_yojson = string_to_yojson

let protocol_to_yojson (x : protocol) =
  match x with DOHFIPS -> `String "DoH-FIPS" | DO53 -> `String "Do53" | DOH -> `String "DoH"

let server_name_indication_to_yojson = string_to_yojson

let target_address_to_yojson (x : target_address) =
  assoc_to_yojson
    [
      ( "ServerNameIndication",
        option_to_yojson server_name_indication_to_yojson x.server_name_indication );
      ("Protocol", option_to_yojson protocol_to_yojson x.protocol);
      ("Ipv6", option_to_yojson ipv6_to_yojson x.ipv6);
      ("Port", option_to_yojson port_to_yojson x.port);
      ("Ip", option_to_yojson ip_to_yojson x.ip);
    ]

let target_list_to_yojson tree = list_to_yojson target_address_to_yojson tree
let account_id_to_yojson = string_to_yojson

let share_status_to_yojson (x : share_status) =
  match x with
  | SharedByMe -> `String "SHARED_BY_ME"
  | SharedWithMe -> `String "SHARED_WITH_ME"
  | NotShared -> `String "NOT_SHARED"

let rfc3339_time_string_to_yojson = string_to_yojson
let delegation_record_to_yojson = string_to_yojson

let resolver_rule_to_yojson (x : resolver_rule) =
  assoc_to_yojson
    [
      ("DelegationRecord", option_to_yojson delegation_record_to_yojson x.delegation_record);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("ShareStatus", option_to_yojson share_status_to_yojson x.share_status);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("ResolverEndpointId", option_to_yojson resource_id_to_yojson x.resolver_endpoint_id);
      ("TargetIps", option_to_yojson target_list_to_yojson x.target_ips);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("RuleType", option_to_yojson rule_type_option_to_yojson x.rule_type);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson resolver_rule_status_to_yojson x.status);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let update_resolver_rule_response_to_yojson (x : update_resolver_rule_response) =
  assoc_to_yojson [ ("ResolverRule", option_to_yojson resolver_rule_to_yojson x.resolver_rule) ]

let resolver_rule_config_to_yojson (x : resolver_rule_config) =
  assoc_to_yojson
    [
      ("ResolverEndpointId", option_to_yojson resource_id_to_yojson x.resolver_endpoint_id);
      ("TargetIps", option_to_yojson target_list_to_yojson x.target_ips);
      ("Name", option_to_yojson name_to_yojson x.name);
    ]

let update_resolver_rule_request_to_yojson (x : update_resolver_rule_request) =
  assoc_to_yojson
    [
      ("Config", Some (resolver_rule_config_to_yojson x.config));
      ("ResolverRuleId", Some (resource_id_to_yojson x.resolver_rule_id));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let string__to_yojson = string_to_yojson

let resource_unavailable_exception_to_yojson (x : resource_unavailable_exception) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson
    [
      ("FieldName", option_to_yojson string__to_yojson x.field_name);
      ("Message", Some (exception_message_to_yojson x.message));
    ]

let internal_service_error_exception_to_yojson (x : internal_service_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let security_group_ids_to_yojson tree = list_to_yojson resource_id_to_yojson tree

let resolver_endpoint_direction_to_yojson (x : resolver_endpoint_direction) =
  match x with
  | InboundDelegation -> `String "INBOUND_DELEGATION"
  | Outbound -> `String "OUTBOUND"
  | Inbound -> `String "INBOUND"

let ip_address_count_to_yojson = int_to_yojson

let resolver_endpoint_status_to_yojson (x : resolver_endpoint_status) =
  match x with
  | Deleting -> `String "DELETING"
  | ActionNeeded -> `String "ACTION_NEEDED"
  | AutoRecovering -> `String "AUTO_RECOVERING"
  | Updating -> `String "UPDATING"
  | Operational -> `String "OPERATIONAL"
  | Creating -> `String "CREATING"

let outpost_arn_to_yojson = string_to_yojson
let outpost_instance_type_to_yojson = string_to_yojson

let resolver_endpoint_type_to_yojson (x : resolver_endpoint_type) =
  match x with DUALSTACK -> `String "DUALSTACK" | IPV4 -> `String "IPV4" | IPV6 -> `String "IPV6"

let protocol_list_to_yojson tree = list_to_yojson protocol_to_yojson tree
let rni_enhanced_metrics_enabled_to_yojson = bool_to_yojson
let target_name_server_metrics_enabled_to_yojson = bool_to_yojson
let dns64_enabled_to_yojson = bool_to_yojson
let ipv6_internet_access_enabled_to_yojson = bool_to_yojson

let resolver_endpoint_to_yojson (x : resolver_endpoint) =
  assoc_to_yojson
    [
      ( "Ipv6InternetAccessEnabled",
        option_to_yojson ipv6_internet_access_enabled_to_yojson x.ipv6_internet_access_enabled );
      ("Dns64Enabled", option_to_yojson dns64_enabled_to_yojson x.dns64_enabled);
      ( "TargetNameServerMetricsEnabled",
        option_to_yojson target_name_server_metrics_enabled_to_yojson
          x.target_name_server_metrics_enabled );
      ( "RniEnhancedMetricsEnabled",
        option_to_yojson rni_enhanced_metrics_enabled_to_yojson x.rni_enhanced_metrics_enabled );
      ("Protocols", option_to_yojson protocol_list_to_yojson x.protocols);
      ( "ResolverEndpointType",
        option_to_yojson resolver_endpoint_type_to_yojson x.resolver_endpoint_type );
      ( "PreferredInstanceType",
        option_to_yojson outpost_instance_type_to_yojson x.preferred_instance_type );
      ("OutpostArn", option_to_yojson outpost_arn_to_yojson x.outpost_arn);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson resolver_endpoint_status_to_yojson x.status);
      ("HostVPCId", option_to_yojson resource_id_to_yojson x.host_vpc_id);
      ("IpAddressCount", option_to_yojson ip_address_count_to_yojson x.ip_address_count);
      ("Direction", option_to_yojson resolver_endpoint_direction_to_yojson x.direction);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let update_resolver_endpoint_response_to_yojson (x : update_resolver_endpoint_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let update_ip_address_to_yojson (x : update_ip_address) =
  assoc_to_yojson
    [ ("Ipv6", Some (ipv6_to_yojson x.ipv6)); ("IpId", Some (resource_id_to_yojson x.ip_id)) ]

let update_ip_addresses_to_yojson tree = list_to_yojson update_ip_address_to_yojson tree

let update_resolver_endpoint_request_to_yojson (x : update_resolver_endpoint_request) =
  assoc_to_yojson
    [
      ( "Ipv6InternetAccessEnabled",
        option_to_yojson ipv6_internet_access_enabled_to_yojson x.ipv6_internet_access_enabled );
      ("Dns64Enabled", option_to_yojson dns64_enabled_to_yojson x.dns64_enabled);
      ( "TargetNameServerMetricsEnabled",
        option_to_yojson target_name_server_metrics_enabled_to_yojson
          x.target_name_server_metrics_enabled );
      ( "RniEnhancedMetricsEnabled",
        option_to_yojson rni_enhanced_metrics_enabled_to_yojson x.rni_enhanced_metrics_enabled );
      ("Protocols", option_to_yojson protocol_list_to_yojson x.protocols);
      ("UpdateIpAddresses", option_to_yojson update_ip_addresses_to_yojson x.update_ip_addresses);
      ( "ResolverEndpointType",
        option_to_yojson resolver_endpoint_type_to_yojson x.resolver_endpoint_type );
      ("Name", option_to_yojson name_to_yojson x.name);
      ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id));
    ]

let resolver_dnssec_validation_status_to_yojson (x : resolver_dnssec_validation_status) =
  match x with
  | UseLocalResourceSetting -> `String "USE_LOCAL_RESOURCE_SETTING"
  | UpdateToUseLocalResourceSetting -> `String "UPDATING_TO_USE_LOCAL_RESOURCE_SETTING"
  | Disabled -> `String "DISABLED"
  | Disabling -> `String "DISABLING"
  | Enabled -> `String "ENABLED"
  | Enabling -> `String "ENABLING"

let resolver_dnssec_config_to_yojson (x : resolver_dnssec_config) =
  assoc_to_yojson
    [
      ( "ValidationStatus",
        option_to_yojson resolver_dnssec_validation_status_to_yojson x.validation_status );
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let update_resolver_dnssec_config_response_to_yojson (x : update_resolver_dnssec_config_response) =
  assoc_to_yojson
    [
      ( "ResolverDNSSECConfig",
        option_to_yojson resolver_dnssec_config_to_yojson x.resolver_dnssec_config );
    ]

let update_resolver_dnssec_config_request_to_yojson (x : update_resolver_dnssec_config_request) =
  assoc_to_yojson
    [
      ("Validation", Some (validation_to_yojson x.validation));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let resolver_autodefined_reverse_status_to_yojson (x : resolver_autodefined_reverse_status) =
  match x with
  | UseLocalResourceSetting -> `String "USE_LOCAL_RESOURCE_SETTING"
  | UpdatingToUseLocalResourceSetting -> `String "UPDATING_TO_USE_LOCAL_RESOURCE_SETTING"
  | Disabled -> `String "DISABLED"
  | Disabling -> `String "DISABLING"
  | Enabled -> `String "ENABLED"
  | Enabling -> `String "ENABLING"

let resolver_config_to_yojson (x : resolver_config) =
  assoc_to_yojson
    [
      ( "AutodefinedReverse",
        option_to_yojson resolver_autodefined_reverse_status_to_yojson x.autodefined_reverse );
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let update_resolver_config_response_to_yojson (x : update_resolver_config_response) =
  assoc_to_yojson
    [ ("ResolverConfig", option_to_yojson resolver_config_to_yojson x.resolver_config) ]

let autodefined_reverse_flag_to_yojson (x : autodefined_reverse_flag) =
  match x with
  | USE_LOCAL_RESOURCE_SETTING -> `String "USE_LOCAL_RESOURCE_SETTING"
  | DISABLE -> `String "DISABLE"
  | ENABLE -> `String "ENABLE"

let update_resolver_config_request_to_yojson (x : update_resolver_config_request) =
  assoc_to_yojson
    [
      ( "AutodefinedReverseFlag",
        Some (autodefined_reverse_flag_to_yojson x.autodefined_reverse_flag) );
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let instance_count_to_yojson = int_to_yojson
let outpost_resolver_name_to_yojson = string_to_yojson

let outpost_resolver_status_to_yojson (x : outpost_resolver_status) =
  match x with
  | FAILED_DELETION -> `String "FAILED_DELETION"
  | FAILED_CREATION -> `String "FAILED_CREATION"
  | ACTION_NEEDED -> `String "ACTION_NEEDED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | OPERATIONAL -> `String "OPERATIONAL"
  | CREATING -> `String "CREATING"

let outpost_resolver_status_message_to_yojson = string_to_yojson

let outpost_resolver_to_yojson (x : outpost_resolver) =
  assoc_to_yojson
    [
      ("OutpostArn", option_to_yojson outpost_arn_to_yojson x.outpost_arn);
      ("StatusMessage", option_to_yojson outpost_resolver_status_message_to_yojson x.status_message);
      ("Status", option_to_yojson outpost_resolver_status_to_yojson x.status);
      ("Name", option_to_yojson outpost_resolver_name_to_yojson x.name);
      ( "PreferredInstanceType",
        option_to_yojson outpost_instance_type_to_yojson x.preferred_instance_type );
      ("InstanceCount", option_to_yojson instance_count_to_yojson x.instance_count);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
    ]

let update_outpost_resolver_response_to_yojson (x : update_outpost_resolver_response) =
  assoc_to_yojson
    [ ("OutpostResolver", option_to_yojson outpost_resolver_to_yojson x.outpost_resolver) ]

let update_outpost_resolver_request_to_yojson (x : update_outpost_resolver_request) =
  assoc_to_yojson
    [
      ( "PreferredInstanceType",
        option_to_yojson outpost_instance_type_to_yojson x.preferred_instance_type );
      ("InstanceCount", option_to_yojson instance_count_to_yojson x.instance_count);
      ("Name", option_to_yojson outpost_resolver_name_to_yojson x.name);
      ("Id", Some (resource_id_to_yojson x.id));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let priority_to_yojson = int_to_yojson

let action_to_yojson (x : action) =
  match x with ALERT -> `String "ALERT" | BLOCK -> `String "BLOCK" | ALLOW -> `String "ALLOW"

let block_response_to_yojson (x : block_response) =
  match x with
  | OVERRIDE -> `String "OVERRIDE"
  | NXDOMAIN -> `String "NXDOMAIN"
  | NODATA -> `String "NODATA"

let block_override_domain_to_yojson = string_to_yojson

let block_override_dns_type_to_yojson (x : block_override_dns_type) =
  match x with CNAME -> `String "CNAME"

let unsigned_to_yojson = int_to_yojson

let firewall_domain_redirection_action_to_yojson (x : firewall_domain_redirection_action) =
  match x with
  | TRUST_REDIRECTION_DOMAIN -> `String "TRUST_REDIRECTION_DOMAIN"
  | INSPECT_REDIRECTION_DOMAIN -> `String "INSPECT_REDIRECTION_DOMAIN"

let qtype_to_yojson = string_to_yojson

let dns_threat_protection_to_yojson (x : dns_threat_protection) =
  match x with
  | DICTIONARY_DGA -> `String "DICTIONARY_DGA"
  | DNS_TUNNELING -> `String "DNS_TUNNELING"
  | DGA -> `String "DGA"

let confidence_threshold_to_yojson (x : confidence_threshold) =
  match x with HIGH -> `String "HIGH" | MEDIUM -> `String "MEDIUM" | LOW -> `String "LOW"

let partner_value_to_yojson = string_to_yojson

let partner_threat_protection_config_to_yojson (x : partner_threat_protection_config) =
  assoc_to_yojson [ ("Partner", Some (partner_value_to_yojson x.partner)) ]

let firewall_advanced_content_category_value_to_yojson = string_to_yojson

let firewall_advanced_content_category_config_to_yojson
    (x : firewall_advanced_content_category_config) =
  assoc_to_yojson
    [ ("Category", Some (firewall_advanced_content_category_value_to_yojson x.category)) ]

let firewall_advanced_threat_category_value_to_yojson = string_to_yojson

let firewall_advanced_threat_category_config_to_yojson
    (x : firewall_advanced_threat_category_config) =
  assoc_to_yojson
    [ ("Category", Some (firewall_advanced_threat_category_value_to_yojson x.category)) ]

let dns_threat_protection_rule_type_value_to_yojson = string_to_yojson

let dns_threat_protection_rule_type_config_to_yojson (x : dns_threat_protection_rule_type_config) =
  assoc_to_yojson
    [
      ("ConfidenceThreshold", Some (confidence_threshold_to_yojson x.confidence_threshold));
      ("Value", Some (dns_threat_protection_rule_type_value_to_yojson x.value));
    ]

let firewall_rule_type_to_yojson (x : firewall_rule_type) =
  assoc_to_yojson
    [
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_rule_type_config_to_yojson x.dns_threat_protection );
      ( "FirewallAdvancedThreatCategory",
        option_to_yojson firewall_advanced_threat_category_config_to_yojson
          x.firewall_advanced_threat_category );
      ( "FirewallAdvancedContentCategory",
        option_to_yojson firewall_advanced_content_category_config_to_yojson
          x.firewall_advanced_content_category );
      ( "PartnerThreatProtection",
        option_to_yojson partner_threat_protection_config_to_yojson x.partner_threat_protection );
    ]

let firewall_rule_status_to_yojson = string_to_yojson
let firewall_rule_status_message_to_yojson = string_to_yojson

let firewall_rule_to_yojson (x : firewall_rule) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson firewall_rule_status_message_to_yojson x.status_message);
      ("Status", option_to_yojson firewall_rule_status_to_yojson x.status);
      ("FirewallRuleType", option_to_yojson firewall_rule_type_to_yojson x.firewall_rule_type);
      ("ConfidenceThreshold", option_to_yojson confidence_threshold_to_yojson x.confidence_threshold);
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_to_yojson x.dns_threat_protection );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "FirewallDomainRedirectionAction",
        option_to_yojson firewall_domain_redirection_action_to_yojson
          x.firewall_domain_redirection_action );
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("BlockOverrideTtl", option_to_yojson unsigned_to_yojson x.block_override_ttl);
      ( "BlockOverrideDnsType",
        option_to_yojson block_override_dns_type_to_yojson x.block_override_dns_type );
      ( "BlockOverrideDomain",
        option_to_yojson block_override_domain_to_yojson x.block_override_domain );
      ("BlockResponse", option_to_yojson block_response_to_yojson x.block_response);
      ("Action", option_to_yojson action_to_yojson x.action);
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ("Name", option_to_yojson name_to_yojson x.name);
      ( "FirewallThreatProtectionId",
        option_to_yojson resource_id_to_yojson x.firewall_threat_protection_id );
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ("FirewallRuleGroupId", option_to_yojson resource_id_to_yojson x.firewall_rule_group_id);
    ]

let update_firewall_rule_response_to_yojson (x : update_firewall_rule_response) =
  assoc_to_yojson [ ("FirewallRule", option_to_yojson firewall_rule_to_yojson x.firewall_rule) ]

let block_override_ttl_to_yojson = int_to_yojson

let update_firewall_rule_request_to_yojson (x : update_firewall_rule_request) =
  assoc_to_yojson
    [
      ("FirewallRuleType", option_to_yojson firewall_rule_type_to_yojson x.firewall_rule_type);
      ("ConfidenceThreshold", option_to_yojson confidence_threshold_to_yojson x.confidence_threshold);
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_to_yojson x.dns_threat_protection );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "FirewallDomainRedirectionAction",
        option_to_yojson firewall_domain_redirection_action_to_yojson
          x.firewall_domain_redirection_action );
      ("Name", option_to_yojson name_to_yojson x.name);
      ("BlockOverrideTtl", option_to_yojson block_override_ttl_to_yojson x.block_override_ttl);
      ( "BlockOverrideDnsType",
        option_to_yojson block_override_dns_type_to_yojson x.block_override_dns_type );
      ( "BlockOverrideDomain",
        option_to_yojson block_override_domain_to_yojson x.block_override_domain );
      ("BlockResponse", option_to_yojson block_response_to_yojson x.block_response);
      ("Action", option_to_yojson action_to_yojson x.action);
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ( "FirewallThreatProtectionId",
        option_to_yojson resource_id_to_yojson x.firewall_threat_protection_id );
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
    ]

let mutation_protection_status_to_yojson (x : mutation_protection_status) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let service_principle_to_yojson = string_to_yojson

let firewall_rule_group_association_status_to_yojson (x : firewall_rule_group_association_status) =
  match x with
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | COMPLETE -> `String "COMPLETE"

let firewall_rule_group_association_to_yojson (x : firewall_rule_group_association) =
  assoc_to_yojson
    [
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson firewall_rule_group_association_status_to_yojson x.status);
      ("ManagedOwnerName", option_to_yojson service_principle_to_yojson x.managed_owner_name);
      ( "MutationProtection",
        option_to_yojson mutation_protection_status_to_yojson x.mutation_protection );
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
      ("FirewallRuleGroupId", option_to_yojson resource_id_to_yojson x.firewall_rule_group_id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
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
      ("Name", option_to_yojson name_to_yojson x.name);
      ( "MutationProtection",
        option_to_yojson mutation_protection_status_to_yojson x.mutation_protection );
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ( "FirewallRuleGroupAssociationId",
        Some (resource_id_to_yojson x.firewall_rule_group_association_id) );
    ]

let update_firewall_rule_entry_to_yojson (x : update_firewall_rule_entry) =
  assoc_to_yojson
    [
      ("FirewallRuleType", option_to_yojson firewall_rule_type_to_yojson x.firewall_rule_type);
      ("ConfidenceThreshold", option_to_yojson confidence_threshold_to_yojson x.confidence_threshold);
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_to_yojson x.dns_threat_protection );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "FirewallDomainRedirectionAction",
        option_to_yojson firewall_domain_redirection_action_to_yojson
          x.firewall_domain_redirection_action );
      ("Name", option_to_yojson name_to_yojson x.name);
      ("BlockOverrideTtl", option_to_yojson block_override_ttl_to_yojson x.block_override_ttl);
      ( "BlockOverrideDnsType",
        option_to_yojson block_override_dns_type_to_yojson x.block_override_dns_type );
      ( "BlockOverrideDomain",
        option_to_yojson block_override_domain_to_yojson x.block_override_domain );
      ("BlockResponse", option_to_yojson block_response_to_yojson x.block_response);
      ("Action", option_to_yojson action_to_yojson x.action);
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ( "FirewallThreatProtectionId",
        option_to_yojson resource_id_to_yojson x.firewall_threat_protection_id );
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
    ]

let update_firewall_rule_entries_to_yojson tree =
  list_to_yojson update_firewall_rule_entry_to_yojson tree

let firewall_domain_list_status_to_yojson (x : firewall_domain_list_status) =
  match x with
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | IMPORTING -> `String "IMPORTING"
  | COMPLETE_IMPORT_FAILED -> `String "COMPLETE_IMPORT_FAILED"
  | COMPLETE -> `String "COMPLETE"

let update_firewall_domains_response_to_yojson (x : update_firewall_domains_response) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson firewall_domain_list_status_to_yojson x.status);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let firewall_domain_update_operation_to_yojson (x : firewall_domain_update_operation) =
  match x with REPLACE -> `String "REPLACE" | REMOVE -> `String "REMOVE" | ADD -> `String "ADD"

let firewall_domain_name_to_yojson = string_to_yojson
let firewall_domains_to_yojson tree = list_to_yojson firewall_domain_name_to_yojson tree

let update_firewall_domains_request_to_yojson (x : update_firewall_domains_request) =
  assoc_to_yojson
    [
      ("Domains", Some (firewall_domains_to_yojson x.domains));
      ("Operation", Some (firewall_domain_update_operation_to_yojson x.operation));
      ("FirewallDomainListId", Some (resource_id_to_yojson x.firewall_domain_list_id));
    ]

let firewall_fail_open_status_to_yojson (x : firewall_fail_open_status) =
  match x with
  | USE_LOCAL_RESOURCE_SETTING -> `String "USE_LOCAL_RESOURCE_SETTING"
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"

let firewall_config_to_yojson (x : firewall_config) =
  assoc_to_yojson
    [
      ("FirewallFailOpen", option_to_yojson firewall_fail_open_status_to_yojson x.firewall_fail_open);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let update_firewall_config_response_to_yojson (x : update_firewall_config_response) =
  assoc_to_yojson
    [ ("FirewallConfig", option_to_yojson firewall_config_to_yojson x.firewall_config) ]

let update_firewall_config_request_to_yojson (x : update_firewall_config_request) =
  assoc_to_yojson
    [
      ("FirewallFailOpen", Some (firewall_fail_open_status_to_yojson x.firewall_fail_open));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let unknown_resource_exception_to_yojson (x : unknown_resource_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let invalid_tag_exception_to_yojson (x : invalid_tag_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let product_id_to_yojson = string_to_yojson

let subscription_info_to_yojson (x : subscription_info) =
  assoc_to_yojson
    [
      ("ProductId", option_to_yojson product_id_to_yojson x.product_id);
      ("VendorName", option_to_yojson vendor_name_to_yojson x.vendor_name);
    ]

let subnet_id_to_yojson = string_to_yojson

let sort_order_to_yojson (x : sort_order) =
  match x with Descending -> `String "DESCENDING" | Ascending -> `String "ASCENDING"

let sort_by_key_to_yojson = string_to_yojson
let rule_type_value_to_yojson = string_to_yojson
let rule_type_name_to_yojson = string_to_yojson
let rule_type_description_to_yojson = string_to_yojson

let invalid_policy_document_to_yojson (x : invalid_policy_document) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let boolean__to_yojson = bool_to_yojson

let put_resolver_rule_policy_response_to_yojson (x : put_resolver_rule_policy_response) =
  assoc_to_yojson [ ("ReturnValue", option_to_yojson boolean__to_yojson x.return_value) ]

let resolver_rule_policy_to_yojson = string_to_yojson

let put_resolver_rule_policy_request_to_yojson (x : put_resolver_rule_policy_request) =
  assoc_to_yojson
    [
      ("ResolverRulePolicy", Some (resolver_rule_policy_to_yojson x.resolver_rule_policy));
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let put_resolver_query_log_config_policy_response_to_yojson
    (x : put_resolver_query_log_config_policy_response) =
  assoc_to_yojson [ ("ReturnValue", option_to_yojson boolean__to_yojson x.return_value) ]

let resolver_query_log_config_policy_to_yojson = string_to_yojson

let put_resolver_query_log_config_policy_request_to_yojson
    (x : put_resolver_query_log_config_policy_request) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfigPolicy",
        Some (resolver_query_log_config_policy_to_yojson x.resolver_query_log_config_policy) );
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let put_firewall_rule_group_policy_response_to_yojson (x : put_firewall_rule_group_policy_response)
    =
  assoc_to_yojson [ ("ReturnValue", option_to_yojson boolean__to_yojson x.return_value) ]

let firewall_rule_group_policy_to_yojson = string_to_yojson

let put_firewall_rule_group_policy_request_to_yojson (x : put_firewall_rule_group_policy_request) =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupPolicy",
        Some (firewall_rule_group_policy_to_yojson x.firewall_rule_group_policy) );
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let resolver_rules_to_yojson tree = list_to_yojson resolver_rule_to_yojson tree

let list_resolver_rules_response_to_yojson (x : list_resolver_rules_response) =
  assoc_to_yojson
    [
      ("ResolverRules", option_to_yojson resolver_rules_to_yojson x.resolver_rules);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
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

let list_resolver_rules_request_to_yojson (x : list_resolver_rules_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let resolver_rule_association_status_to_yojson (x : resolver_rule_association_status) =
  match x with
  | Overridden -> `String "OVERRIDDEN"
  | Failed -> `String "FAILED"
  | Deleting -> `String "DELETING"
  | Complete -> `String "COMPLETE"
  | Creating -> `String "CREATING"

let resolver_rule_association_to_yojson (x : resolver_rule_association) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson resolver_rule_association_status_to_yojson x.status);
      ("VPCId", option_to_yojson resource_id_to_yojson x.vpc_id);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("ResolverRuleId", option_to_yojson resource_id_to_yojson x.resolver_rule_id);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let resolver_rule_associations_to_yojson tree =
  list_to_yojson resolver_rule_association_to_yojson tree

let list_resolver_rule_associations_response_to_yojson
    (x : list_resolver_rule_associations_response) =
  assoc_to_yojson
    [
      ( "ResolverRuleAssociations",
        option_to_yojson resolver_rule_associations_to_yojson x.resolver_rule_associations );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_resolver_rule_associations_request_to_yojson (x : list_resolver_rule_associations_request)
    =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let count_to_yojson = int_to_yojson

let resolver_query_log_config_status_to_yojson (x : resolver_query_log_config_status) =
  match x with
  | Failed -> `String "FAILED"
  | Deleting -> `String "DELETING"
  | Created -> `String "CREATED"
  | Creating -> `String "CREATING"

let resolver_query_log_config_name_to_yojson = string_to_yojson
let destination_arn_to_yojson = string_to_yojson

let resolver_query_log_config_to_yojson (x : resolver_query_log_config) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("DestinationArn", option_to_yojson destination_arn_to_yojson x.destination_arn);
      ("Name", option_to_yojson resolver_query_log_config_name_to_yojson x.name);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("AssociationCount", option_to_yojson count_to_yojson x.association_count);
      ("ShareStatus", option_to_yojson share_status_to_yojson x.share_status);
      ("Status", option_to_yojson resolver_query_log_config_status_to_yojson x.status);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let resolver_query_log_config_list_to_yojson tree =
  list_to_yojson resolver_query_log_config_to_yojson tree

let list_resolver_query_log_configs_response_to_yojson
    (x : list_resolver_query_log_configs_response) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfigs",
        option_to_yojson resolver_query_log_config_list_to_yojson x.resolver_query_log_configs );
      ("TotalFilteredCount", option_to_yojson count_to_yojson x.total_filtered_count);
      ("TotalCount", option_to_yojson count_to_yojson x.total_count);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_resolver_query_log_configs_request_to_yojson (x : list_resolver_query_log_configs_request)
    =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_by_key_to_yojson x.sort_by);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let resolver_query_log_config_association_status_to_yojson
    (x : resolver_query_log_config_association_status) =
  match x with
  | Failed -> `String "FAILED"
  | Deleting -> `String "DELETING"
  | ActionNeeded -> `String "ACTION_NEEDED"
  | Active -> `String "ACTIVE"
  | Creating -> `String "CREATING"

let resolver_query_log_config_association_error_to_yojson
    (x : resolver_query_log_config_association_error) =
  match x with
  | InternalServiceError -> `String "INTERNAL_SERVICE_ERROR"
  | AccessDenied -> `String "ACCESS_DENIED"
  | DestinationNotFound -> `String "DESTINATION_NOT_FOUND"
  | None_ -> `String "NONE"

let resolver_query_log_config_association_error_message_to_yojson = string_to_yojson

let resolver_query_log_config_association_to_yojson (x : resolver_query_log_config_association) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ( "ErrorMessage",
        option_to_yojson resolver_query_log_config_association_error_message_to_yojson
          x.error_message );
      ("Error", option_to_yojson resolver_query_log_config_association_error_to_yojson x.error);
      ("Status", option_to_yojson resolver_query_log_config_association_status_to_yojson x.status);
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ( "ResolverQueryLogConfigId",
        option_to_yojson resource_id_to_yojson x.resolver_query_log_config_id );
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let resolver_query_log_config_association_list_to_yojson tree =
  list_to_yojson resolver_query_log_config_association_to_yojson tree

let list_resolver_query_log_config_associations_response_to_yojson
    (x : list_resolver_query_log_config_associations_response) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfigAssociations",
        option_to_yojson resolver_query_log_config_association_list_to_yojson
          x.resolver_query_log_config_associations );
      ("TotalFilteredCount", option_to_yojson count_to_yojson x.total_filtered_count);
      ("TotalCount", option_to_yojson count_to_yojson x.total_count);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_resolver_query_log_config_associations_request_to_yojson
    (x : list_resolver_query_log_config_associations_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_by_key_to_yojson x.sort_by);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let resolver_endpoints_to_yojson tree = list_to_yojson resolver_endpoint_to_yojson tree

let list_resolver_endpoints_response_to_yojson (x : list_resolver_endpoints_response) =
  assoc_to_yojson
    [
      ("ResolverEndpoints", option_to_yojson resolver_endpoints_to_yojson x.resolver_endpoints);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_resolver_endpoints_request_to_yojson (x : list_resolver_endpoints_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let ip_address_status_to_yojson (x : ip_address_status) =
  match x with
  | Isolated -> `String "ISOLATED"
  | UpdateFailed -> `String "UPDATE_FAILED"
  | Updating -> `String "UPDATING"
  | DeleteFailedFasExpired -> `String "DELETE_FAILED_FAS_EXPIRED"
  | Deleting -> `String "DELETING"
  | FailedResourceGone -> `String "FAILED_RESOURCE_GONE"
  | Detaching -> `String "DETACHING"
  | RemapAttaching -> `String "REMAP_ATTACHING"
  | RemapDetaching -> `String "REMAP_DETACHING"
  | Attached -> `String "ATTACHED"
  | Attaching -> `String "ATTACHING"
  | FailedCreationInsufficientEC2CapacityInOutpost ->
      `String "FAILED_CREATION_INSUFFICIENT_EC2_CAPACITY_IN_OUTPOST"
  | FailedCreation -> `String "FAILED_CREATION"
  | Creating -> `String "CREATING"

let ip_address_response_to_yojson (x : ip_address_response) =
  assoc_to_yojson
    [
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson ip_address_status_to_yojson x.status);
      ("Ipv6", option_to_yojson ipv6_to_yojson x.ipv6);
      ("Ip", option_to_yojson ip_to_yojson x.ip);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("IpId", option_to_yojson resource_id_to_yojson x.ip_id);
    ]

let ip_addresses_response_to_yojson tree = list_to_yojson ip_address_response_to_yojson tree

let list_resolver_endpoint_ip_addresses_response_to_yojson
    (x : list_resolver_endpoint_ip_addresses_response) =
  assoc_to_yojson
    [
      ("IpAddresses", option_to_yojson ip_addresses_response_to_yojson x.ip_addresses);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_resolver_endpoint_ip_addresses_request_to_yojson
    (x : list_resolver_endpoint_ip_addresses_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id));
    ]

let resolver_dnssec_config_list_to_yojson tree =
  list_to_yojson resolver_dnssec_config_to_yojson tree

let list_resolver_dnssec_configs_response_to_yojson (x : list_resolver_dnssec_configs_response) =
  assoc_to_yojson
    [
      ( "ResolverDnssecConfigs",
        option_to_yojson resolver_dnssec_config_list_to_yojson x.resolver_dnssec_configs );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_resolver_dnssec_configs_request_to_yojson (x : list_resolver_dnssec_configs_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let resolver_config_list_to_yojson tree = list_to_yojson resolver_config_to_yojson tree

let list_resolver_configs_response_to_yojson (x : list_resolver_configs_response) =
  assoc_to_yojson
    [
      ("ResolverConfigs", option_to_yojson resolver_config_list_to_yojson x.resolver_configs);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_resolver_configs_max_result_to_yojson = int_to_yojson

let list_resolver_configs_request_to_yojson (x : list_resolver_configs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_resolver_configs_max_result_to_yojson x.max_results);
    ]

let outpost_resolver_list_to_yojson tree = list_to_yojson outpost_resolver_to_yojson tree

let list_outpost_resolvers_response_to_yojson (x : list_outpost_resolvers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("OutpostResolvers", option_to_yojson outpost_resolver_list_to_yojson x.outpost_resolvers);
    ]

let list_outpost_resolvers_request_to_yojson (x : list_outpost_resolvers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("OutpostArn", option_to_yojson outpost_arn_to_yojson x.outpost_arn);
    ]

let display_name_to_yojson = string_to_yojson

let firewall_rule_type_definition_to_yojson (x : firewall_rule_type_definition) =
  assoc_to_yojson
    [
      ("SubscriptionInfo", option_to_yojson subscription_info_to_yojson x.subscription_info);
      ("Description", option_to_yojson rule_type_description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Value", option_to_yojson rule_type_value_to_yojson x.value);
      ("RuleType", option_to_yojson rule_type_name_to_yojson x.rule_type);
    ]

let firewall_rule_type_definitions_to_yojson tree =
  list_to_yojson firewall_rule_type_definition_to_yojson tree

let list_firewall_rule_types_response_to_yojson (x : list_firewall_rule_types_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "FirewallRuleTypes",
        option_to_yojson firewall_rule_type_definitions_to_yojson x.firewall_rule_types );
    ]

let list_firewall_rule_types_request_to_yojson (x : list_firewall_rule_types_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("RuleType", option_to_yojson rule_type_name_to_yojson x.rule_type);
    ]

let firewall_rules_to_yojson tree = list_to_yojson firewall_rule_to_yojson tree

let list_firewall_rules_response_to_yojson (x : list_firewall_rules_response) =
  assoc_to_yojson
    [
      ("FirewallRules", option_to_yojson firewall_rules_to_yojson x.firewall_rules);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_rules_request_to_yojson (x : list_firewall_rules_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Action", option_to_yojson action_to_yojson x.action);
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
    ]

let firewall_rule_group_metadata_to_yojson (x : firewall_rule_group_metadata) =
  assoc_to_yojson
    [
      ("ShareStatus", option_to_yojson share_status_to_yojson x.share_status);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let firewall_rule_group_metadata_list_to_yojson tree =
  list_to_yojson firewall_rule_group_metadata_to_yojson tree

let list_firewall_rule_groups_response_to_yojson (x : list_firewall_rule_groups_response) =
  assoc_to_yojson
    [
      ( "FirewallRuleGroups",
        option_to_yojson firewall_rule_group_metadata_list_to_yojson x.firewall_rule_groups );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_rule_groups_request_to_yojson (x : list_firewall_rule_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let firewall_rule_group_associations_to_yojson tree =
  list_to_yojson firewall_rule_group_association_to_yojson tree

let list_firewall_rule_group_associations_response_to_yojson
    (x : list_firewall_rule_group_associations_response) =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupAssociations",
        option_to_yojson firewall_rule_group_associations_to_yojson
          x.firewall_rule_group_associations );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_rule_group_associations_request_to_yojson
    (x : list_firewall_rule_group_associations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Status", option_to_yojson firewall_rule_group_association_status_to_yojson x.status);
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ("VpcId", option_to_yojson resource_id_to_yojson x.vpc_id);
      ("FirewallRuleGroupId", option_to_yojson resource_id_to_yojson x.firewall_rule_group_id);
    ]

let list_firewall_domains_response_to_yojson (x : list_firewall_domains_response) =
  assoc_to_yojson
    [
      ("Domains", option_to_yojson firewall_domains_to_yojson x.domains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_domain_max_results_to_yojson = int_to_yojson

let list_firewall_domains_request_to_yojson (x : list_firewall_domains_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_domain_max_results_to_yojson x.max_results);
      ("FirewallDomainListId", Some (resource_id_to_yojson x.firewall_domain_list_id));
    ]

let domain_list_type_to_yojson (x : domain_list_type) =
  match x with CONTENT -> `String "CONTENT" | THREAT -> `String "THREAT"

let category_to_yojson = string_to_yojson

let firewall_domain_list_metadata_to_yojson (x : firewall_domain_list_metadata) =
  assoc_to_yojson
    [
      ("Category", option_to_yojson category_to_yojson x.category);
      ("ManagedListType", option_to_yojson domain_list_type_to_yojson x.managed_list_type);
      ("ManagedOwnerName", option_to_yojson service_principle_to_yojson x.managed_owner_name);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let firewall_domain_list_metadata_list_to_yojson tree =
  list_to_yojson firewall_domain_list_metadata_to_yojson tree

let list_firewall_domain_lists_response_to_yojson (x : list_firewall_domain_lists_response) =
  assoc_to_yojson
    [
      ( "FirewallDomainLists",
        option_to_yojson firewall_domain_list_metadata_list_to_yojson x.firewall_domain_lists );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_domain_lists_request_to_yojson (x : list_firewall_domain_lists_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let firewall_config_list_to_yojson tree = list_to_yojson firewall_config_to_yojson tree

let list_firewall_configs_response_to_yojson (x : list_firewall_configs_response) =
  assoc_to_yojson
    [
      ("FirewallConfigs", option_to_yojson firewall_config_list_to_yojson x.firewall_configs);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_firewall_configs_max_result_to_yojson = int_to_yojson

let list_firewall_configs_request_to_yojson (x : list_firewall_configs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_firewall_configs_max_result_to_yojson x.max_results);
    ]

let import_firewall_domains_response_to_yojson (x : import_firewall_domains_response) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson firewall_domain_list_status_to_yojson x.status);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let firewall_domain_import_operation_to_yojson (x : firewall_domain_import_operation) =
  match x with REPLACE -> `String "REPLACE"

let domain_list_file_url_to_yojson = string_to_yojson

let import_firewall_domains_request_to_yojson (x : import_firewall_domains_request) =
  assoc_to_yojson
    [
      ("DomainFileUrl", Some (domain_list_file_url_to_yojson x.domain_file_url));
      ("Operation", Some (firewall_domain_import_operation_to_yojson x.operation));
      ("FirewallDomainListId", Some (resource_id_to_yojson x.firewall_domain_list_id));
    ]

let get_resolver_rule_policy_response_to_yojson (x : get_resolver_rule_policy_response) =
  assoc_to_yojson
    [
      ("ResolverRulePolicy", option_to_yojson resolver_rule_policy_to_yojson x.resolver_rule_policy);
    ]

let get_resolver_rule_policy_request_to_yojson (x : get_resolver_rule_policy_request) =
  assoc_to_yojson [ ("Arn", Some (arn_to_yojson x.arn)) ]

let get_resolver_rule_association_response_to_yojson (x : get_resolver_rule_association_response) =
  assoc_to_yojson
    [
      ( "ResolverRuleAssociation",
        option_to_yojson resolver_rule_association_to_yojson x.resolver_rule_association );
    ]

let get_resolver_rule_association_request_to_yojson (x : get_resolver_rule_association_request) =
  assoc_to_yojson
    [ ("ResolverRuleAssociationId", Some (resource_id_to_yojson x.resolver_rule_association_id)) ]

let get_resolver_rule_response_to_yojson (x : get_resolver_rule_response) =
  assoc_to_yojson [ ("ResolverRule", option_to_yojson resolver_rule_to_yojson x.resolver_rule) ]

let get_resolver_rule_request_to_yojson (x : get_resolver_rule_request) =
  assoc_to_yojson [ ("ResolverRuleId", Some (resource_id_to_yojson x.resolver_rule_id)) ]

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

let get_resolver_query_log_config_response_to_yojson (x : get_resolver_query_log_config_response) =
  assoc_to_yojson
    [
      ( "ResolverQueryLogConfig",
        option_to_yojson resolver_query_log_config_to_yojson x.resolver_query_log_config );
    ]

let get_resolver_query_log_config_request_to_yojson (x : get_resolver_query_log_config_request) =
  assoc_to_yojson
    [ ("ResolverQueryLogConfigId", Some (resource_id_to_yojson x.resolver_query_log_config_id)) ]

let get_resolver_endpoint_response_to_yojson (x : get_resolver_endpoint_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let get_resolver_endpoint_request_to_yojson (x : get_resolver_endpoint_request) =
  assoc_to_yojson [ ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id)) ]

let get_resolver_dnssec_config_response_to_yojson (x : get_resolver_dnssec_config_response) =
  assoc_to_yojson
    [
      ( "ResolverDNSSECConfig",
        option_to_yojson resolver_dnssec_config_to_yojson x.resolver_dnssec_config );
    ]

let get_resolver_dnssec_config_request_to_yojson (x : get_resolver_dnssec_config_request) =
  assoc_to_yojson [ ("ResourceId", Some (resource_id_to_yojson x.resource_id)) ]

let get_resolver_config_response_to_yojson (x : get_resolver_config_response) =
  assoc_to_yojson
    [ ("ResolverConfig", option_to_yojson resolver_config_to_yojson x.resolver_config) ]

let get_resolver_config_request_to_yojson (x : get_resolver_config_request) =
  assoc_to_yojson [ ("ResourceId", Some (resource_id_to_yojson x.resource_id)) ]

let get_outpost_resolver_response_to_yojson (x : get_outpost_resolver_response) =
  assoc_to_yojson
    [ ("OutpostResolver", option_to_yojson outpost_resolver_to_yojson x.outpost_resolver) ]

let get_outpost_resolver_request_to_yojson (x : get_outpost_resolver_request) =
  assoc_to_yojson [ ("Id", Some (resource_id_to_yojson x.id)) ]

let get_firewall_rule_group_policy_response_to_yojson (x : get_firewall_rule_group_policy_response)
    =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupPolicy",
        option_to_yojson firewall_rule_group_policy_to_yojson x.firewall_rule_group_policy );
    ]

let get_firewall_rule_group_policy_request_to_yojson (x : get_firewall_rule_group_policy_request) =
  assoc_to_yojson [ ("Arn", Some (arn_to_yojson x.arn)) ]

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

let firewall_rule_group_status_to_yojson (x : firewall_rule_group_status) =
  match x with
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | COMPLETE -> `String "COMPLETE"

let firewall_rule_group_to_yojson (x : firewall_rule_group) =
  assoc_to_yojson
    [
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("ShareStatus", option_to_yojson share_status_to_yojson x.share_status);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("OwnerId", option_to_yojson account_id_to_yojson x.owner_id);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson firewall_rule_group_status_to_yojson x.status);
      ("RuleCount", option_to_yojson unsigned_to_yojson x.rule_count);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let get_firewall_rule_group_response_to_yojson (x : get_firewall_rule_group_response) =
  assoc_to_yojson
    [ ("FirewallRuleGroup", option_to_yojson firewall_rule_group_to_yojson x.firewall_rule_group) ]

let get_firewall_rule_group_request_to_yojson (x : get_firewall_rule_group_request) =
  assoc_to_yojson [ ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id)) ]

let firewall_domain_list_to_yojson (x : firewall_domain_list) =
  assoc_to_yojson
    [
      ("ManagedListType", option_to_yojson domain_list_type_to_yojson x.managed_list_type);
      ("Category", option_to_yojson category_to_yojson x.category);
      ("ModificationTime", option_to_yojson rfc3339_time_string_to_yojson x.modification_time);
      ("CreationTime", option_to_yojson rfc3339_time_string_to_yojson x.creation_time);
      ("CreatorRequestId", option_to_yojson creator_request_id_to_yojson x.creator_request_id);
      ("ManagedOwnerName", option_to_yojson service_principle_to_yojson x.managed_owner_name);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson firewall_domain_list_status_to_yojson x.status);
      ("DomainCount", option_to_yojson unsigned_to_yojson x.domain_count);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Id", option_to_yojson resource_id_to_yojson x.id);
    ]

let get_firewall_domain_list_response_to_yojson (x : get_firewall_domain_list_response) =
  assoc_to_yojson
    [
      ("FirewallDomainList", option_to_yojson firewall_domain_list_to_yojson x.firewall_domain_list);
    ]

let get_firewall_domain_list_request_to_yojson (x : get_firewall_domain_list_request) =
  assoc_to_yojson
    [ ("FirewallDomainListId", Some (resource_id_to_yojson x.firewall_domain_list_id)) ]

let get_firewall_config_response_to_yojson (x : get_firewall_config_response) =
  assoc_to_yojson
    [ ("FirewallConfig", option_to_yojson firewall_config_to_yojson x.firewall_config) ]

let get_firewall_config_request_to_yojson (x : get_firewall_config_request) =
  assoc_to_yojson [ ("ResourceId", Some (resource_id_to_yojson x.resource_id)) ]

let disassociate_resolver_rule_response_to_yojson (x : disassociate_resolver_rule_response) =
  assoc_to_yojson
    [
      ( "ResolverRuleAssociation",
        option_to_yojson resolver_rule_association_to_yojson x.resolver_rule_association );
    ]

let disassociate_resolver_rule_request_to_yojson (x : disassociate_resolver_rule_request) =
  assoc_to_yojson
    [
      ("ResolverRuleId", Some (resource_id_to_yojson x.resolver_rule_id));
      ("VPCId", Some (resource_id_to_yojson x.vpc_id));
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
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("ResolverQueryLogConfigId", Some (resource_id_to_yojson x.resolver_query_log_config_id));
    ]

let resource_exists_exception_to_yojson (x : resource_exists_exception) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let disassociate_resolver_endpoint_ip_address_response_to_yojson
    (x : disassociate_resolver_endpoint_ip_address_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let ip_address_update_to_yojson (x : ip_address_update) =
  assoc_to_yojson
    [
      ("Ipv6", option_to_yojson ipv6_to_yojson x.ipv6);
      ("Ip", option_to_yojson ip_to_yojson x.ip);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("IpId", option_to_yojson resource_id_to_yojson x.ip_id);
    ]

let disassociate_resolver_endpoint_ip_address_request_to_yojson
    (x : disassociate_resolver_endpoint_ip_address_request) =
  assoc_to_yojson
    [
      ("IpAddress", Some (ip_address_update_to_yojson x.ip_address));
      ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id));
    ]

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

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let delete_resolver_rule_response_to_yojson (x : delete_resolver_rule_response) =
  assoc_to_yojson [ ("ResolverRule", option_to_yojson resolver_rule_to_yojson x.resolver_rule) ]

let delete_resolver_rule_request_to_yojson (x : delete_resolver_rule_request) =
  assoc_to_yojson [ ("ResolverRuleId", Some (resource_id_to_yojson x.resolver_rule_id)) ]

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

let delete_resolver_endpoint_response_to_yojson (x : delete_resolver_endpoint_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let delete_resolver_endpoint_request_to_yojson (x : delete_resolver_endpoint_request) =
  assoc_to_yojson [ ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id)) ]

let delete_outpost_resolver_response_to_yojson (x : delete_outpost_resolver_response) =
  assoc_to_yojson
    [ ("OutpostResolver", option_to_yojson outpost_resolver_to_yojson x.outpost_resolver) ]

let delete_outpost_resolver_request_to_yojson (x : delete_outpost_resolver_request) =
  assoc_to_yojson [ ("Id", Some (resource_id_to_yojson x.id)) ]

let delete_firewall_rule_group_response_to_yojson (x : delete_firewall_rule_group_response) =
  assoc_to_yojson
    [ ("FirewallRuleGroup", option_to_yojson firewall_rule_group_to_yojson x.firewall_rule_group) ]

let delete_firewall_rule_group_request_to_yojson (x : delete_firewall_rule_group_request) =
  assoc_to_yojson [ ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id)) ]

let delete_firewall_rule_response_to_yojson (x : delete_firewall_rule_response) =
  assoc_to_yojson [ ("FirewallRule", option_to_yojson firewall_rule_to_yojson x.firewall_rule) ]

let delete_firewall_rule_request_to_yojson (x : delete_firewall_rule_request) =
  assoc_to_yojson
    [
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "FirewallThreatProtectionId",
        option_to_yojson resource_id_to_yojson x.firewall_threat_protection_id );
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
    ]

let delete_firewall_domain_list_response_to_yojson (x : delete_firewall_domain_list_response) =
  assoc_to_yojson
    [
      ("FirewallDomainList", option_to_yojson firewall_domain_list_to_yojson x.firewall_domain_list);
    ]

let delete_firewall_domain_list_request_to_yojson (x : delete_firewall_domain_list_request) =
  assoc_to_yojson
    [ ("FirewallDomainListId", Some (resource_id_to_yojson x.firewall_domain_list_id)) ]

let create_resolver_rule_response_to_yojson (x : create_resolver_rule_response) =
  assoc_to_yojson [ ("ResolverRule", option_to_yojson resolver_rule_to_yojson x.resolver_rule) ]

let create_resolver_rule_request_to_yojson (x : create_resolver_rule_request) =
  assoc_to_yojson
    [
      ("DelegationRecord", option_to_yojson delegation_record_to_yojson x.delegation_record);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ResolverEndpointId", option_to_yojson resource_id_to_yojson x.resolver_endpoint_id);
      ("TargetIps", option_to_yojson target_list_to_yojson x.target_ips);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("RuleType", Some (rule_type_option_to_yojson x.rule_type));
      ("Name", option_to_yojson name_to_yojson x.name);
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
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
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
      ("DestinationArn", Some (destination_arn_to_yojson x.destination_arn));
      ("Name", Some (resolver_query_log_config_name_to_yojson x.name));
    ]

let create_resolver_endpoint_response_to_yojson (x : create_resolver_endpoint_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let ip_address_request_to_yojson (x : ip_address_request) =
  assoc_to_yojson
    [
      ("Ipv6", option_to_yojson ipv6_to_yojson x.ipv6);
      ("Ip", option_to_yojson ip_to_yojson x.ip);
      ("SubnetId", Some (subnet_id_to_yojson x.subnet_id));
    ]

let ip_addresses_request_to_yojson tree = list_to_yojson ip_address_request_to_yojson tree

let create_resolver_endpoint_request_to_yojson (x : create_resolver_endpoint_request) =
  assoc_to_yojson
    [
      ( "Ipv6InternetAccessEnabled",
        option_to_yojson ipv6_internet_access_enabled_to_yojson x.ipv6_internet_access_enabled );
      ("Dns64Enabled", option_to_yojson dns64_enabled_to_yojson x.dns64_enabled);
      ( "TargetNameServerMetricsEnabled",
        option_to_yojson target_name_server_metrics_enabled_to_yojson
          x.target_name_server_metrics_enabled );
      ( "RniEnhancedMetricsEnabled",
        option_to_yojson rni_enhanced_metrics_enabled_to_yojson x.rni_enhanced_metrics_enabled );
      ("Protocols", option_to_yojson protocol_list_to_yojson x.protocols);
      ( "ResolverEndpointType",
        option_to_yojson resolver_endpoint_type_to_yojson x.resolver_endpoint_type );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "PreferredInstanceType",
        option_to_yojson outpost_instance_type_to_yojson x.preferred_instance_type );
      ("OutpostArn", option_to_yojson outpost_arn_to_yojson x.outpost_arn);
      ("IpAddresses", Some (ip_addresses_request_to_yojson x.ip_addresses));
      ("Direction", Some (resolver_endpoint_direction_to_yojson x.direction));
      ("SecurityGroupIds", Some (security_group_ids_to_yojson x.security_group_ids));
      ("Name", option_to_yojson name_to_yojson x.name);
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
    ]

let create_outpost_resolver_response_to_yojson (x : create_outpost_resolver_response) =
  assoc_to_yojson
    [ ("OutpostResolver", option_to_yojson outpost_resolver_to_yojson x.outpost_resolver) ]

let create_outpost_resolver_request_to_yojson (x : create_outpost_resolver_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("OutpostArn", Some (outpost_arn_to_yojson x.outpost_arn));
      ("PreferredInstanceType", Some (outpost_instance_type_to_yojson x.preferred_instance_type));
      ("InstanceCount", option_to_yojson instance_count_to_yojson x.instance_count);
      ("Name", Some (outpost_resolver_name_to_yojson x.name));
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
    ]

let create_firewall_rule_group_response_to_yojson (x : create_firewall_rule_group_response) =
  assoc_to_yojson
    [ ("FirewallRuleGroup", option_to_yojson firewall_rule_group_to_yojson x.firewall_rule_group) ]

let create_firewall_rule_group_request_to_yojson (x : create_firewall_rule_group_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Name", Some (name_to_yojson x.name));
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
    ]

let create_firewall_rule_response_to_yojson (x : create_firewall_rule_response) =
  assoc_to_yojson [ ("FirewallRule", option_to_yojson firewall_rule_to_yojson x.firewall_rule) ]

let create_firewall_rule_request_to_yojson (x : create_firewall_rule_request) =
  assoc_to_yojson
    [
      ("FirewallRuleType", option_to_yojson firewall_rule_type_to_yojson x.firewall_rule_type);
      ("ConfidenceThreshold", option_to_yojson confidence_threshold_to_yojson x.confidence_threshold);
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_to_yojson x.dns_threat_protection );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "FirewallDomainRedirectionAction",
        option_to_yojson firewall_domain_redirection_action_to_yojson
          x.firewall_domain_redirection_action );
      ("Name", Some (name_to_yojson x.name));
      ("BlockOverrideTtl", option_to_yojson block_override_ttl_to_yojson x.block_override_ttl);
      ( "BlockOverrideDnsType",
        option_to_yojson block_override_dns_type_to_yojson x.block_override_dns_type );
      ( "BlockOverrideDomain",
        option_to_yojson block_override_domain_to_yojson x.block_override_domain );
      ("BlockResponse", option_to_yojson block_response_to_yojson x.block_response);
      ("Action", Some (action_to_yojson x.action));
      ("Priority", Some (priority_to_yojson x.priority));
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
    ]

let create_firewall_domain_list_response_to_yojson (x : create_firewall_domain_list_response) =
  assoc_to_yojson
    [
      ("FirewallDomainList", option_to_yojson firewall_domain_list_to_yojson x.firewall_domain_list);
    ]

let create_firewall_domain_list_request_to_yojson (x : create_firewall_domain_list_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Name", Some (name_to_yojson x.name));
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
    ]

let batch_update_firewall_rule_error_to_yojson (x : batch_update_firewall_rule_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("FirewallRule", option_to_yojson update_firewall_rule_entry_to_yojson x.firewall_rule);
    ]

let batch_update_firewall_rule_errors_to_yojson tree =
  list_to_yojson batch_update_firewall_rule_error_to_yojson tree

let batch_update_firewall_rule_response_to_yojson (x : batch_update_firewall_rule_response) =
  assoc_to_yojson
    [
      ("UpdateErrors", option_to_yojson batch_update_firewall_rule_errors_to_yojson x.update_errors);
      ("UpdatedFirewallRules", option_to_yojson firewall_rules_to_yojson x.updated_firewall_rules);
    ]

let batch_update_firewall_rule_request_to_yojson (x : batch_update_firewall_rule_request) =
  assoc_to_yojson
    [
      ( "UpdateFirewallRuleEntries",
        Some (update_firewall_rule_entries_to_yojson x.update_firewall_rule_entries) );
    ]

let delete_firewall_rule_entry_to_yojson (x : delete_firewall_rule_entry) =
  assoc_to_yojson
    [
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "FirewallThreatProtectionId",
        option_to_yojson resource_id_to_yojson x.firewall_threat_protection_id );
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
    ]

let batch_delete_firewall_rule_error_to_yojson (x : batch_delete_firewall_rule_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("FirewallRule", option_to_yojson delete_firewall_rule_entry_to_yojson x.firewall_rule);
    ]

let batch_delete_firewall_rule_errors_to_yojson tree =
  list_to_yojson batch_delete_firewall_rule_error_to_yojson tree

let batch_delete_firewall_rule_response_to_yojson (x : batch_delete_firewall_rule_response) =
  assoc_to_yojson
    [
      ("DeleteErrors", option_to_yojson batch_delete_firewall_rule_errors_to_yojson x.delete_errors);
      ("DeletedFirewallRules", option_to_yojson firewall_rules_to_yojson x.deleted_firewall_rules);
    ]

let delete_firewall_rule_entries_to_yojson tree =
  list_to_yojson delete_firewall_rule_entry_to_yojson tree

let batch_delete_firewall_rule_request_to_yojson (x : batch_delete_firewall_rule_request) =
  assoc_to_yojson
    [
      ( "DeleteFirewallRuleEntries",
        Some (delete_firewall_rule_entries_to_yojson x.delete_firewall_rule_entries) );
    ]

let create_firewall_rule_entry_to_yojson (x : create_firewall_rule_entry) =
  assoc_to_yojson
    [
      ("FirewallRuleType", option_to_yojson firewall_rule_type_to_yojson x.firewall_rule_type);
      ("ConfidenceThreshold", option_to_yojson confidence_threshold_to_yojson x.confidence_threshold);
      ( "DnsThreatProtection",
        option_to_yojson dns_threat_protection_to_yojson x.dns_threat_protection );
      ("Qtype", option_to_yojson qtype_to_yojson x.qtype);
      ( "FirewallDomainRedirectionAction",
        option_to_yojson firewall_domain_redirection_action_to_yojson
          x.firewall_domain_redirection_action );
      ("Name", Some (name_to_yojson x.name));
      ("BlockOverrideTtl", option_to_yojson block_override_ttl_to_yojson x.block_override_ttl);
      ( "BlockOverrideDnsType",
        option_to_yojson block_override_dns_type_to_yojson x.block_override_dns_type );
      ( "BlockOverrideDomain",
        option_to_yojson block_override_domain_to_yojson x.block_override_domain );
      ("BlockResponse", option_to_yojson block_response_to_yojson x.block_response);
      ("Action", Some (action_to_yojson x.action));
      ("Priority", Some (priority_to_yojson x.priority));
      ("FirewallDomainListId", option_to_yojson resource_id_to_yojson x.firewall_domain_list_id);
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
    ]

let batch_create_firewall_rule_error_to_yojson (x : batch_create_firewall_rule_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("FirewallRule", option_to_yojson create_firewall_rule_entry_to_yojson x.firewall_rule);
    ]

let batch_create_firewall_rule_errors_to_yojson tree =
  list_to_yojson batch_create_firewall_rule_error_to_yojson tree

let batch_create_firewall_rule_response_to_yojson (x : batch_create_firewall_rule_response) =
  assoc_to_yojson
    [
      ("CreateErrors", option_to_yojson batch_create_firewall_rule_errors_to_yojson x.create_errors);
      ("CreatedFirewallRules", option_to_yojson firewall_rules_to_yojson x.created_firewall_rules);
    ]

let create_firewall_rule_entries_to_yojson tree =
  list_to_yojson create_firewall_rule_entry_to_yojson tree

let batch_create_firewall_rule_request_to_yojson (x : batch_create_firewall_rule_request) =
  assoc_to_yojson
    [
      ( "CreateFirewallRuleEntries",
        Some (create_firewall_rule_entries_to_yojson x.create_firewall_rule_entries) );
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
      ("VPCId", Some (resource_id_to_yojson x.vpc_id));
      ("Name", option_to_yojson name_to_yojson x.name);
      ("ResolverRuleId", Some (resource_id_to_yojson x.resolver_rule_id));
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
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("ResolverQueryLogConfigId", Some (resource_id_to_yojson x.resolver_query_log_config_id));
    ]

let associate_resolver_endpoint_ip_address_response_to_yojson
    (x : associate_resolver_endpoint_ip_address_response) =
  assoc_to_yojson
    [ ("ResolverEndpoint", option_to_yojson resolver_endpoint_to_yojson x.resolver_endpoint) ]

let associate_resolver_endpoint_ip_address_request_to_yojson
    (x : associate_resolver_endpoint_ip_address_request) =
  assoc_to_yojson
    [
      ("IpAddress", Some (ip_address_update_to_yojson x.ip_address));
      ("ResolverEndpointId", Some (resource_id_to_yojson x.resolver_endpoint_id));
    ]

let associate_firewall_rule_group_response_to_yojson (x : associate_firewall_rule_group_response) =
  assoc_to_yojson
    [
      ( "FirewallRuleGroupAssociation",
        option_to_yojson firewall_rule_group_association_to_yojson x.firewall_rule_group_association
      );
    ]

let associate_firewall_rule_group_request_to_yojson (x : associate_firewall_rule_group_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "MutationProtection",
        option_to_yojson mutation_protection_status_to_yojson x.mutation_protection );
      ("Name", Some (name_to_yojson x.name));
      ("Priority", Some (priority_to_yojson x.priority));
      ("VpcId", Some (resource_id_to_yojson x.vpc_id));
      ("FirewallRuleGroupId", Some (resource_id_to_yojson x.firewall_rule_group_id));
      ("CreatorRequestId", Some (creator_request_id_to_yojson x.creator_request_id));
    ]
