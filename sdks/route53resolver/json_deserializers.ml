open Smaws_Lib.Json.DeserializeHelpers
open Types

let exception_message_of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : access_denied_exception)

let account_id_of_yojson = string_of_yojson

let action_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW" -> ALLOW
    | `String "BLOCK" -> BLOCK
    | `String "ALERT" -> ALERT
    | `String value -> raise (deserialize_unknown_enum_value_error path "Action" value)
    | _ -> raise (deserialize_wrong_type_error path "Action")
     : action)
    : action)

let arn_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : throttling_exception)

let string__of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
   }
    : resource_not_found_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
   }
    : limit_exceeded_exception)

let internal_service_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : internal_service_error_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : conflict_exception)

let rfc3339_time_string_of_yojson = string_of_yojson
let creator_request_id_of_yojson = string_of_yojson
let status_message_of_yojson = string_of_yojson

let firewall_rule_group_association_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETE" -> COMPLETE
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FirewallRuleGroupAssociationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FirewallRuleGroupAssociationStatus")
     : firewall_rule_group_association_status)
    : firewall_rule_group_association_status)

let service_principle_of_yojson = string_of_yojson

let mutation_protection_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MutationProtectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MutationProtectionStatus")
     : mutation_protection_status)
    : mutation_protection_status)

let priority_of_yojson = int_of_yojson
let name_of_yojson = string_of_yojson
let resource_id_of_yojson = string_of_yojson

let firewall_rule_group_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     firewall_rule_group_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallRuleGroupId") _list path;
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VpcId") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "Priority") _list path;
     mutation_protection =
       option_of_yojson
         (value_for_key mutation_protection_status_of_yojson "MutationProtection")
         _list path;
     managed_owner_name =
       option_of_yojson (value_for_key service_principle_of_yojson "ManagedOwnerName") _list path;
     status =
       option_of_yojson
         (value_for_key firewall_rule_group_association_status_of_yojson "Status")
         _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     creator_request_id =
       option_of_yojson (value_for_key creator_request_id_of_yojson "CreatorRequestId") _list path;
     creation_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "CreationTime") _list path;
     modification_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "ModificationTime") _list path;
   }
    : firewall_rule_group_association)

let associate_firewall_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_association =
       option_of_yojson
         (value_for_key firewall_rule_group_association_of_yojson "FirewallRuleGroupAssociation")
         _list path;
   }
    : associate_firewall_rule_group_response)

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

let associate_firewall_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creator_request_id = value_for_key creator_request_id_of_yojson "CreatorRequestId" _list path;
     firewall_rule_group_id = value_for_key resource_id_of_yojson "FirewallRuleGroupId" _list path;
     vpc_id = value_for_key resource_id_of_yojson "VpcId" _list path;
     priority = value_for_key priority_of_yojson "Priority" _list path;
     name = value_for_key name_of_yojson "Name" _list path;
     mutation_protection =
       option_of_yojson
         (value_for_key mutation_protection_status_of_yojson "MutationProtection")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : associate_firewall_rule_group_request)

let resource_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
   }
    : resource_exists_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : invalid_request_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key exception_message_of_yojson "Message" _list path;
     field_name = option_of_yojson (value_for_key string__of_yojson "FieldName") _list path;
   }
    : invalid_parameter_exception)

let ipv6_internet_access_enabled_of_yojson = bool_of_yojson
let dns64_enabled_of_yojson = bool_of_yojson
let target_name_server_metrics_enabled_of_yojson = bool_of_yojson
let rni_enhanced_metrics_enabled_of_yojson = bool_of_yojson

let protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "DoH" -> DOH
    | `String "Do53" -> DO53
    | `String "DoH-FIPS" -> DOHFIPS
    | `String value -> raise (deserialize_unknown_enum_value_error path "Protocol" value)
    | _ -> raise (deserialize_wrong_type_error path "Protocol")
     : protocol)
    : protocol)

let protocol_list_of_yojson tree path = list_of_yojson protocol_of_yojson tree path

let resolver_endpoint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPV6" -> IPV6
    | `String "IPV4" -> IPV4
    | `String "DUALSTACK" -> DUALSTACK
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResolverEndpointType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResolverEndpointType")
     : resolver_endpoint_type)
    : resolver_endpoint_type)

let outpost_instance_type_of_yojson = string_of_yojson
let outpost_arn_of_yojson = string_of_yojson

let resolver_endpoint_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> Creating
    | `String "OPERATIONAL" -> Operational
    | `String "UPDATING" -> Updating
    | `String "AUTO_RECOVERING" -> AutoRecovering
    | `String "ACTION_NEEDED" -> ActionNeeded
    | `String "DELETING" -> Deleting
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResolverEndpointStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResolverEndpointStatus")
     : resolver_endpoint_status)
    : resolver_endpoint_status)

let ip_address_count_of_yojson = int_of_yojson

let resolver_endpoint_direction_of_yojson (tree : t) path =
  ((match tree with
    | `String "INBOUND" -> Inbound
    | `String "OUTBOUND" -> Outbound
    | `String "INBOUND_DELEGATION" -> InboundDelegation
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResolverEndpointDirection" value)
    | _ -> raise (deserialize_wrong_type_error path "ResolverEndpointDirection")
     : resolver_endpoint_direction)
    : resolver_endpoint_direction)

let security_group_ids_of_yojson tree path = list_of_yojson resource_id_of_yojson tree path

let resolver_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     creator_request_id =
       option_of_yojson (value_for_key creator_request_id_of_yojson "CreatorRequestId") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "SecurityGroupIds") _list path;
     direction =
       option_of_yojson (value_for_key resolver_endpoint_direction_of_yojson "Direction") _list path;
     ip_address_count =
       option_of_yojson (value_for_key ip_address_count_of_yojson "IpAddressCount") _list path;
     host_vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "HostVPCId") _list path;
     status =
       option_of_yojson (value_for_key resolver_endpoint_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     creation_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "CreationTime") _list path;
     modification_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "ModificationTime") _list path;
     outpost_arn = option_of_yojson (value_for_key outpost_arn_of_yojson "OutpostArn") _list path;
     preferred_instance_type =
       option_of_yojson
         (value_for_key outpost_instance_type_of_yojson "PreferredInstanceType")
         _list path;
     resolver_endpoint_type =
       option_of_yojson
         (value_for_key resolver_endpoint_type_of_yojson "ResolverEndpointType")
         _list path;
     protocols = option_of_yojson (value_for_key protocol_list_of_yojson "Protocols") _list path;
     rni_enhanced_metrics_enabled =
       option_of_yojson
         (value_for_key rni_enhanced_metrics_enabled_of_yojson "RniEnhancedMetricsEnabled")
         _list path;
     target_name_server_metrics_enabled =
       option_of_yojson
         (value_for_key target_name_server_metrics_enabled_of_yojson
            "TargetNameServerMetricsEnabled")
         _list path;
     dns64_enabled =
       option_of_yojson (value_for_key dns64_enabled_of_yojson "Dns64Enabled") _list path;
     ipv6_internet_access_enabled =
       option_of_yojson
         (value_for_key ipv6_internet_access_enabled_of_yojson "Ipv6InternetAccessEnabled")
         _list path;
   }
    : resolver_endpoint)

let associate_resolver_endpoint_ip_address_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_endpoint =
       option_of_yojson (value_for_key resolver_endpoint_of_yojson "ResolverEndpoint") _list path;
   }
    : associate_resolver_endpoint_ip_address_response)

let ipv6_of_yojson = string_of_yojson
let ip_of_yojson = string_of_yojson
let subnet_id_of_yojson = string_of_yojson

let ip_address_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_id = option_of_yojson (value_for_key resource_id_of_yojson "IpId") _list path;
     subnet_id = option_of_yojson (value_for_key subnet_id_of_yojson "SubnetId") _list path;
     ip = option_of_yojson (value_for_key ip_of_yojson "Ip") _list path;
     ipv6 = option_of_yojson (value_for_key ipv6_of_yojson "Ipv6") _list path;
   }
    : ip_address_update)

let associate_resolver_endpoint_ip_address_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_endpoint_id = value_for_key resource_id_of_yojson "ResolverEndpointId" _list path;
     ip_address = value_for_key ip_address_update_of_yojson "IpAddress" _list path;
   }
    : associate_resolver_endpoint_ip_address_request)

let resolver_query_log_config_association_error_message_of_yojson = string_of_yojson

let resolver_query_log_config_association_error_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> None_
    | `String "DESTINATION_NOT_FOUND" -> DestinationNotFound
    | `String "ACCESS_DENIED" -> AccessDenied
    | `String "INTERNAL_SERVICE_ERROR" -> InternalServiceError
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ResolverQueryLogConfigAssociationError" value)
    | _ -> raise (deserialize_wrong_type_error path "ResolverQueryLogConfigAssociationError")
     : resolver_query_log_config_association_error)
    : resolver_query_log_config_association_error)

let resolver_query_log_config_association_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> Creating
    | `String "ACTIVE" -> Active
    | `String "ACTION_NEEDED" -> ActionNeeded
    | `String "DELETING" -> Deleting
    | `String "FAILED" -> Failed
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ResolverQueryLogConfigAssociationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResolverQueryLogConfigAssociationStatus")
     : resolver_query_log_config_association_status)
    : resolver_query_log_config_association_status)

let resolver_query_log_config_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     resolver_query_log_config_id =
       option_of_yojson (value_for_key resource_id_of_yojson "ResolverQueryLogConfigId") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "ResourceId") _list path;
     status =
       option_of_yojson
         (value_for_key resolver_query_log_config_association_status_of_yojson "Status")
         _list path;
     error =
       option_of_yojson
         (value_for_key resolver_query_log_config_association_error_of_yojson "Error")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key resolver_query_log_config_association_error_message_of_yojson "ErrorMessage")
         _list path;
     creation_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "CreationTime") _list path;
   }
    : resolver_query_log_config_association)

let associate_resolver_query_log_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config_association =
       option_of_yojson
         (value_for_key resolver_query_log_config_association_of_yojson
            "ResolverQueryLogConfigAssociation")
         _list path;
   }
    : associate_resolver_query_log_config_response)

let associate_resolver_query_log_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config_id =
       value_for_key resource_id_of_yojson "ResolverQueryLogConfigId" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
   }
    : associate_resolver_query_log_config_request)

let resource_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
   }
    : resource_unavailable_exception)

let resolver_rule_association_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> Creating
    | `String "COMPLETE" -> Complete
    | `String "DELETING" -> Deleting
    | `String "FAILED" -> Failed
    | `String "OVERRIDDEN" -> Overridden
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResolverRuleAssociationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResolverRuleAssociationStatus")
     : resolver_rule_association_status)
    : resolver_rule_association_status)

let resolver_rule_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     resolver_rule_id =
       option_of_yojson (value_for_key resource_id_of_yojson "ResolverRuleId") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VPCId") _list path;
     status =
       option_of_yojson
         (value_for_key resolver_rule_association_status_of_yojson "Status")
         _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
   }
    : resolver_rule_association)

let associate_resolver_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_rule_association =
       option_of_yojson
         (value_for_key resolver_rule_association_of_yojson "ResolverRuleAssociation")
         _list path;
   }
    : associate_resolver_rule_response)

let associate_resolver_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_rule_id = value_for_key resource_id_of_yojson "ResolverRuleId" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     vpc_id = value_for_key resource_id_of_yojson "VPCId" _list path;
   }
    : associate_resolver_rule_request)

let autodefined_reverse_flag_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLE" -> ENABLE
    | `String "DISABLE" -> DISABLE
    | `String "USE_LOCAL_RESOURCE_SETTING" -> USE_LOCAL_RESOURCE_SETTING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutodefinedReverseFlag" value)
    | _ -> raise (deserialize_wrong_type_error path "AutodefinedReverseFlag")
     : autodefined_reverse_flag)
    : autodefined_reverse_flag)

let confidence_threshold_of_yojson (tree : t) path =
  ((match tree with
    | `String "LOW" -> LOW
    | `String "MEDIUM" -> MEDIUM
    | `String "HIGH" -> HIGH
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConfidenceThreshold" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfidenceThreshold")
     : confidence_threshold)
    : confidence_threshold)

let dns_threat_protection_rule_type_value_of_yojson = string_of_yojson

let dns_threat_protection_rule_type_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key dns_threat_protection_rule_type_value_of_yojson "Value" _list path;
     confidence_threshold =
       value_for_key confidence_threshold_of_yojson "ConfidenceThreshold" _list path;
   }
    : dns_threat_protection_rule_type_config)

let firewall_advanced_threat_category_value_of_yojson = string_of_yojson

let firewall_advanced_threat_category_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category =
       value_for_key firewall_advanced_threat_category_value_of_yojson "Category" _list path;
   }
    : firewall_advanced_threat_category_config)

let firewall_advanced_content_category_value_of_yojson = string_of_yojson

let firewall_advanced_content_category_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category =
       value_for_key firewall_advanced_content_category_value_of_yojson "Category" _list path;
   }
    : firewall_advanced_content_category_config)

let partner_value_of_yojson = string_of_yojson

let partner_threat_protection_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ partner = value_for_key partner_value_of_yojson "Partner" _list path }
    : partner_threat_protection_config)

let firewall_rule_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partner_threat_protection =
       option_of_yojson
         (value_for_key partner_threat_protection_config_of_yojson "PartnerThreatProtection")
         _list path;
     firewall_advanced_content_category =
       option_of_yojson
         (value_for_key firewall_advanced_content_category_config_of_yojson
            "FirewallAdvancedContentCategory")
         _list path;
     firewall_advanced_threat_category =
       option_of_yojson
         (value_for_key firewall_advanced_threat_category_config_of_yojson
            "FirewallAdvancedThreatCategory")
         _list path;
     dns_threat_protection =
       option_of_yojson
         (value_for_key dns_threat_protection_rule_type_config_of_yojson "DnsThreatProtection")
         _list path;
   }
    : firewall_rule_type)

let dns_threat_protection_of_yojson (tree : t) path =
  ((match tree with
    | `String "DGA" -> DGA
    | `String "DNS_TUNNELING" -> DNS_TUNNELING
    | `String "DICTIONARY_DGA" -> DICTIONARY_DGA
    | `String value -> raise (deserialize_unknown_enum_value_error path "DnsThreatProtection" value)
    | _ -> raise (deserialize_wrong_type_error path "DnsThreatProtection")
     : dns_threat_protection)
    : dns_threat_protection)

let qtype_of_yojson = string_of_yojson

let firewall_domain_redirection_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSPECT_REDIRECTION_DOMAIN" -> INSPECT_REDIRECTION_DOMAIN
    | `String "TRUST_REDIRECTION_DOMAIN" -> TRUST_REDIRECTION_DOMAIN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FirewallDomainRedirectionAction" value)
    | _ -> raise (deserialize_wrong_type_error path "FirewallDomainRedirectionAction")
     : firewall_domain_redirection_action)
    : firewall_domain_redirection_action)

let block_override_ttl_of_yojson = int_of_yojson

let block_override_dns_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CNAME" -> CNAME
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BlockOverrideDnsType" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockOverrideDnsType")
     : block_override_dns_type)
    : block_override_dns_type)

let block_override_domain_of_yojson = string_of_yojson

let block_response_of_yojson (tree : t) path =
  ((match tree with
    | `String "NODATA" -> NODATA
    | `String "NXDOMAIN" -> NXDOMAIN
    | `String "OVERRIDE" -> OVERRIDE
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockResponse" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockResponse")
     : block_response)
    : block_response)

let create_firewall_rule_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creator_request_id = value_for_key creator_request_id_of_yojson "CreatorRequestId" _list path;
     firewall_rule_group_id = value_for_key resource_id_of_yojson "FirewallRuleGroupId" _list path;
     firewall_domain_list_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallDomainListId") _list path;
     priority = value_for_key priority_of_yojson "Priority" _list path;
     action = value_for_key action_of_yojson "Action" _list path;
     block_response =
       option_of_yojson (value_for_key block_response_of_yojson "BlockResponse") _list path;
     block_override_domain =
       option_of_yojson
         (value_for_key block_override_domain_of_yojson "BlockOverrideDomain")
         _list path;
     block_override_dns_type =
       option_of_yojson
         (value_for_key block_override_dns_type_of_yojson "BlockOverrideDnsType")
         _list path;
     block_override_ttl =
       option_of_yojson (value_for_key block_override_ttl_of_yojson "BlockOverrideTtl") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
     firewall_domain_redirection_action =
       option_of_yojson
         (value_for_key firewall_domain_redirection_action_of_yojson
            "FirewallDomainRedirectionAction")
         _list path;
     qtype = option_of_yojson (value_for_key qtype_of_yojson "Qtype") _list path;
     dns_threat_protection =
       option_of_yojson
         (value_for_key dns_threat_protection_of_yojson "DnsThreatProtection")
         _list path;
     confidence_threshold =
       option_of_yojson
         (value_for_key confidence_threshold_of_yojson "ConfidenceThreshold")
         _list path;
     firewall_rule_type =
       option_of_yojson (value_for_key firewall_rule_type_of_yojson "FirewallRuleType") _list path;
   }
    : create_firewall_rule_entry)

let batch_create_firewall_rule_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule =
       option_of_yojson
         (value_for_key create_firewall_rule_entry_of_yojson "FirewallRule")
         _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : batch_create_firewall_rule_error)

let batch_create_firewall_rule_errors_of_yojson tree path =
  list_of_yojson batch_create_firewall_rule_error_of_yojson tree path

let firewall_rule_status_message_of_yojson = string_of_yojson
let firewall_rule_status_of_yojson = string_of_yojson
let unsigned_of_yojson = int_of_yojson

let firewall_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallRuleGroupId") _list path;
     firewall_domain_list_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallDomainListId") _list path;
     firewall_threat_protection_id =
       option_of_yojson
         (value_for_key resource_id_of_yojson "FirewallThreatProtectionId")
         _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "Priority") _list path;
     action = option_of_yojson (value_for_key action_of_yojson "Action") _list path;
     block_response =
       option_of_yojson (value_for_key block_response_of_yojson "BlockResponse") _list path;
     block_override_domain =
       option_of_yojson
         (value_for_key block_override_domain_of_yojson "BlockOverrideDomain")
         _list path;
     block_override_dns_type =
       option_of_yojson
         (value_for_key block_override_dns_type_of_yojson "BlockOverrideDnsType")
         _list path;
     block_override_ttl =
       option_of_yojson (value_for_key unsigned_of_yojson "BlockOverrideTtl") _list path;
     creator_request_id =
       option_of_yojson (value_for_key creator_request_id_of_yojson "CreatorRequestId") _list path;
     creation_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "CreationTime") _list path;
     modification_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "ModificationTime") _list path;
     firewall_domain_redirection_action =
       option_of_yojson
         (value_for_key firewall_domain_redirection_action_of_yojson
            "FirewallDomainRedirectionAction")
         _list path;
     qtype = option_of_yojson (value_for_key qtype_of_yojson "Qtype") _list path;
     dns_threat_protection =
       option_of_yojson
         (value_for_key dns_threat_protection_of_yojson "DnsThreatProtection")
         _list path;
     confidence_threshold =
       option_of_yojson
         (value_for_key confidence_threshold_of_yojson "ConfidenceThreshold")
         _list path;
     firewall_rule_type =
       option_of_yojson (value_for_key firewall_rule_type_of_yojson "FirewallRuleType") _list path;
     status = option_of_yojson (value_for_key firewall_rule_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson
         (value_for_key firewall_rule_status_message_of_yojson "StatusMessage")
         _list path;
   }
    : firewall_rule)

let firewall_rules_of_yojson tree path = list_of_yojson firewall_rule_of_yojson tree path

let batch_create_firewall_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_firewall_rules =
       option_of_yojson (value_for_key firewall_rules_of_yojson "CreatedFirewallRules") _list path;
     create_errors =
       option_of_yojson
         (value_for_key batch_create_firewall_rule_errors_of_yojson "CreateErrors")
         _list path;
   }
    : batch_create_firewall_rule_response)

let create_firewall_rule_entries_of_yojson tree path =
  list_of_yojson create_firewall_rule_entry_of_yojson tree path

let batch_create_firewall_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_firewall_rule_entries =
       value_for_key create_firewall_rule_entries_of_yojson "CreateFirewallRuleEntries" _list path;
   }
    : batch_create_firewall_rule_request)

let delete_firewall_rule_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_id = value_for_key resource_id_of_yojson "FirewallRuleGroupId" _list path;
     firewall_domain_list_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallDomainListId") _list path;
     firewall_threat_protection_id =
       option_of_yojson
         (value_for_key resource_id_of_yojson "FirewallThreatProtectionId")
         _list path;
     qtype = option_of_yojson (value_for_key qtype_of_yojson "Qtype") _list path;
   }
    : delete_firewall_rule_entry)

let batch_delete_firewall_rule_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule =
       option_of_yojson
         (value_for_key delete_firewall_rule_entry_of_yojson "FirewallRule")
         _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : batch_delete_firewall_rule_error)

let batch_delete_firewall_rule_errors_of_yojson tree path =
  list_of_yojson batch_delete_firewall_rule_error_of_yojson tree path

let batch_delete_firewall_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deleted_firewall_rules =
       option_of_yojson (value_for_key firewall_rules_of_yojson "DeletedFirewallRules") _list path;
     delete_errors =
       option_of_yojson
         (value_for_key batch_delete_firewall_rule_errors_of_yojson "DeleteErrors")
         _list path;
   }
    : batch_delete_firewall_rule_response)

let delete_firewall_rule_entries_of_yojson tree path =
  list_of_yojson delete_firewall_rule_entry_of_yojson tree path

let batch_delete_firewall_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_firewall_rule_entries =
       value_for_key delete_firewall_rule_entries_of_yojson "DeleteFirewallRuleEntries" _list path;
   }
    : batch_delete_firewall_rule_request)

let update_firewall_rule_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_id = value_for_key resource_id_of_yojson "FirewallRuleGroupId" _list path;
     firewall_domain_list_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallDomainListId") _list path;
     firewall_threat_protection_id =
       option_of_yojson
         (value_for_key resource_id_of_yojson "FirewallThreatProtectionId")
         _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "Priority") _list path;
     action = option_of_yojson (value_for_key action_of_yojson "Action") _list path;
     block_response =
       option_of_yojson (value_for_key block_response_of_yojson "BlockResponse") _list path;
     block_override_domain =
       option_of_yojson
         (value_for_key block_override_domain_of_yojson "BlockOverrideDomain")
         _list path;
     block_override_dns_type =
       option_of_yojson
         (value_for_key block_override_dns_type_of_yojson "BlockOverrideDnsType")
         _list path;
     block_override_ttl =
       option_of_yojson (value_for_key block_override_ttl_of_yojson "BlockOverrideTtl") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     firewall_domain_redirection_action =
       option_of_yojson
         (value_for_key firewall_domain_redirection_action_of_yojson
            "FirewallDomainRedirectionAction")
         _list path;
     qtype = option_of_yojson (value_for_key qtype_of_yojson "Qtype") _list path;
     dns_threat_protection =
       option_of_yojson
         (value_for_key dns_threat_protection_of_yojson "DnsThreatProtection")
         _list path;
     confidence_threshold =
       option_of_yojson
         (value_for_key confidence_threshold_of_yojson "ConfidenceThreshold")
         _list path;
     firewall_rule_type =
       option_of_yojson (value_for_key firewall_rule_type_of_yojson "FirewallRuleType") _list path;
   }
    : update_firewall_rule_entry)

let batch_update_firewall_rule_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule =
       option_of_yojson
         (value_for_key update_firewall_rule_entry_of_yojson "FirewallRule")
         _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : batch_update_firewall_rule_error)

let batch_update_firewall_rule_errors_of_yojson tree path =
  list_of_yojson batch_update_firewall_rule_error_of_yojson tree path

let batch_update_firewall_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_firewall_rules =
       option_of_yojson (value_for_key firewall_rules_of_yojson "UpdatedFirewallRules") _list path;
     update_errors =
       option_of_yojson
         (value_for_key batch_update_firewall_rule_errors_of_yojson "UpdateErrors")
         _list path;
   }
    : batch_update_firewall_rule_response)

let update_firewall_rule_entries_of_yojson tree path =
  list_of_yojson update_firewall_rule_entry_of_yojson tree path

let batch_update_firewall_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_firewall_rule_entries =
       value_for_key update_firewall_rule_entries_of_yojson "UpdateFirewallRuleEntries" _list path;
   }
    : batch_update_firewall_rule_request)

let boolean__of_yojson = bool_of_yojson
let category_of_yojson = string_of_yojson
let count_of_yojson = int_of_yojson

let domain_list_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "THREAT" -> THREAT
    | `String "CONTENT" -> CONTENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "DomainListType" value)
    | _ -> raise (deserialize_wrong_type_error path "DomainListType")
     : domain_list_type)
    : domain_list_type)

let firewall_domain_list_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETE" -> COMPLETE
    | `String "COMPLETE_IMPORT_FAILED" -> COMPLETE_IMPORT_FAILED
    | `String "IMPORTING" -> IMPORTING
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FirewallDomainListStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FirewallDomainListStatus")
     : firewall_domain_list_status)
    : firewall_domain_list_status)

let firewall_domain_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     domain_count = option_of_yojson (value_for_key unsigned_of_yojson "DomainCount") _list path;
     status =
       option_of_yojson (value_for_key firewall_domain_list_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     managed_owner_name =
       option_of_yojson (value_for_key service_principle_of_yojson "ManagedOwnerName") _list path;
     creator_request_id =
       option_of_yojson (value_for_key creator_request_id_of_yojson "CreatorRequestId") _list path;
     creation_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "CreationTime") _list path;
     modification_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "ModificationTime") _list path;
     category = option_of_yojson (value_for_key category_of_yojson "Category") _list path;
     managed_list_type =
       option_of_yojson (value_for_key domain_list_type_of_yojson "ManagedListType") _list path;
   }
    : firewall_domain_list)

let create_firewall_domain_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_domain_list =
       option_of_yojson
         (value_for_key firewall_domain_list_of_yojson "FirewallDomainList")
         _list path;
   }
    : create_firewall_domain_list_response)

let create_firewall_domain_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creator_request_id = value_for_key creator_request_id_of_yojson "CreatorRequestId" _list path;
     name = value_for_key name_of_yojson "Name" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_firewall_domain_list_request)

let create_firewall_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule =
       option_of_yojson (value_for_key firewall_rule_of_yojson "FirewallRule") _list path;
   }
    : create_firewall_rule_response)

let create_firewall_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creator_request_id = value_for_key creator_request_id_of_yojson "CreatorRequestId" _list path;
     firewall_rule_group_id = value_for_key resource_id_of_yojson "FirewallRuleGroupId" _list path;
     firewall_domain_list_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallDomainListId") _list path;
     priority = value_for_key priority_of_yojson "Priority" _list path;
     action = value_for_key action_of_yojson "Action" _list path;
     block_response =
       option_of_yojson (value_for_key block_response_of_yojson "BlockResponse") _list path;
     block_override_domain =
       option_of_yojson
         (value_for_key block_override_domain_of_yojson "BlockOverrideDomain")
         _list path;
     block_override_dns_type =
       option_of_yojson
         (value_for_key block_override_dns_type_of_yojson "BlockOverrideDnsType")
         _list path;
     block_override_ttl =
       option_of_yojson (value_for_key block_override_ttl_of_yojson "BlockOverrideTtl") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
     firewall_domain_redirection_action =
       option_of_yojson
         (value_for_key firewall_domain_redirection_action_of_yojson
            "FirewallDomainRedirectionAction")
         _list path;
     qtype = option_of_yojson (value_for_key qtype_of_yojson "Qtype") _list path;
     dns_threat_protection =
       option_of_yojson
         (value_for_key dns_threat_protection_of_yojson "DnsThreatProtection")
         _list path;
     confidence_threshold =
       option_of_yojson
         (value_for_key confidence_threshold_of_yojson "ConfidenceThreshold")
         _list path;
     firewall_rule_type =
       option_of_yojson (value_for_key firewall_rule_type_of_yojson "FirewallRuleType") _list path;
   }
    : create_firewall_rule_request)

let share_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_SHARED" -> NotShared
    | `String "SHARED_WITH_ME" -> SharedWithMe
    | `String "SHARED_BY_ME" -> SharedByMe
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShareStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ShareStatus")
     : share_status)
    : share_status)

let firewall_rule_group_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETE" -> COMPLETE
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FirewallRuleGroupStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FirewallRuleGroupStatus")
     : firewall_rule_group_status)
    : firewall_rule_group_status)

let firewall_rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     rule_count = option_of_yojson (value_for_key unsigned_of_yojson "RuleCount") _list path;
     status =
       option_of_yojson (value_for_key firewall_rule_group_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     owner_id = option_of_yojson (value_for_key account_id_of_yojson "OwnerId") _list path;
     creator_request_id =
       option_of_yojson (value_for_key creator_request_id_of_yojson "CreatorRequestId") _list path;
     share_status = option_of_yojson (value_for_key share_status_of_yojson "ShareStatus") _list path;
     creation_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "CreationTime") _list path;
     modification_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "ModificationTime") _list path;
   }
    : firewall_rule_group)

let create_firewall_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group =
       option_of_yojson (value_for_key firewall_rule_group_of_yojson "FirewallRuleGroup") _list path;
   }
    : create_firewall_rule_group_response)

let create_firewall_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creator_request_id = value_for_key creator_request_id_of_yojson "CreatorRequestId" _list path;
     name = value_for_key name_of_yojson "Name" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_firewall_rule_group_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : service_quota_exceeded_exception)

let outpost_resolver_status_message_of_yojson = string_of_yojson

let outpost_resolver_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "OPERATIONAL" -> OPERATIONAL
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "ACTION_NEEDED" -> ACTION_NEEDED
    | `String "FAILED_CREATION" -> FAILED_CREATION
    | `String "FAILED_DELETION" -> FAILED_DELETION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OutpostResolverStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OutpostResolverStatus")
     : outpost_resolver_status)
    : outpost_resolver_status)

let outpost_resolver_name_of_yojson = string_of_yojson
let instance_count_of_yojson = int_of_yojson

let outpost_resolver_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     creation_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "CreationTime") _list path;
     modification_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "ModificationTime") _list path;
     creator_request_id =
       option_of_yojson (value_for_key creator_request_id_of_yojson "CreatorRequestId") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     instance_count =
       option_of_yojson (value_for_key instance_count_of_yojson "InstanceCount") _list path;
     preferred_instance_type =
       option_of_yojson
         (value_for_key outpost_instance_type_of_yojson "PreferredInstanceType")
         _list path;
     name = option_of_yojson (value_for_key outpost_resolver_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key outpost_resolver_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson
         (value_for_key outpost_resolver_status_message_of_yojson "StatusMessage")
         _list path;
     outpost_arn = option_of_yojson (value_for_key outpost_arn_of_yojson "OutpostArn") _list path;
   }
    : outpost_resolver)

let create_outpost_resolver_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outpost_resolver =
       option_of_yojson (value_for_key outpost_resolver_of_yojson "OutpostResolver") _list path;
   }
    : create_outpost_resolver_response)

let create_outpost_resolver_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creator_request_id = value_for_key creator_request_id_of_yojson "CreatorRequestId" _list path;
     name = value_for_key outpost_resolver_name_of_yojson "Name" _list path;
     instance_count =
       option_of_yojson (value_for_key instance_count_of_yojson "InstanceCount") _list path;
     preferred_instance_type =
       value_for_key outpost_instance_type_of_yojson "PreferredInstanceType" _list path;
     outpost_arn = value_for_key outpost_arn_of_yojson "OutpostArn" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_outpost_resolver_request)

let create_resolver_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_endpoint =
       option_of_yojson (value_for_key resolver_endpoint_of_yojson "ResolverEndpoint") _list path;
   }
    : create_resolver_endpoint_response)

let ip_address_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_id = value_for_key subnet_id_of_yojson "SubnetId" _list path;
     ip = option_of_yojson (value_for_key ip_of_yojson "Ip") _list path;
     ipv6 = option_of_yojson (value_for_key ipv6_of_yojson "Ipv6") _list path;
   }
    : ip_address_request)

let ip_addresses_request_of_yojson tree path = list_of_yojson ip_address_request_of_yojson tree path

let create_resolver_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creator_request_id = value_for_key creator_request_id_of_yojson "CreatorRequestId" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     security_group_ids = value_for_key security_group_ids_of_yojson "SecurityGroupIds" _list path;
     direction = value_for_key resolver_endpoint_direction_of_yojson "Direction" _list path;
     ip_addresses = value_for_key ip_addresses_request_of_yojson "IpAddresses" _list path;
     outpost_arn = option_of_yojson (value_for_key outpost_arn_of_yojson "OutpostArn") _list path;
     preferred_instance_type =
       option_of_yojson
         (value_for_key outpost_instance_type_of_yojson "PreferredInstanceType")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     resolver_endpoint_type =
       option_of_yojson
         (value_for_key resolver_endpoint_type_of_yojson "ResolverEndpointType")
         _list path;
     protocols = option_of_yojson (value_for_key protocol_list_of_yojson "Protocols") _list path;
     rni_enhanced_metrics_enabled =
       option_of_yojson
         (value_for_key rni_enhanced_metrics_enabled_of_yojson "RniEnhancedMetricsEnabled")
         _list path;
     target_name_server_metrics_enabled =
       option_of_yojson
         (value_for_key target_name_server_metrics_enabled_of_yojson
            "TargetNameServerMetricsEnabled")
         _list path;
     dns64_enabled =
       option_of_yojson (value_for_key dns64_enabled_of_yojson "Dns64Enabled") _list path;
     ipv6_internet_access_enabled =
       option_of_yojson
         (value_for_key ipv6_internet_access_enabled_of_yojson "Ipv6InternetAccessEnabled")
         _list path;
   }
    : create_resolver_endpoint_request)

let destination_arn_of_yojson = string_of_yojson
let resolver_query_log_config_name_of_yojson = string_of_yojson

let resolver_query_log_config_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> Creating
    | `String "CREATED" -> Created
    | `String "DELETING" -> Deleting
    | `String "FAILED" -> Failed
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResolverQueryLogConfigStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResolverQueryLogConfigStatus")
     : resolver_query_log_config_status)
    : resolver_query_log_config_status)

let resolver_query_log_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     owner_id = option_of_yojson (value_for_key account_id_of_yojson "OwnerId") _list path;
     status =
       option_of_yojson
         (value_for_key resolver_query_log_config_status_of_yojson "Status")
         _list path;
     share_status = option_of_yojson (value_for_key share_status_of_yojson "ShareStatus") _list path;
     association_count =
       option_of_yojson (value_for_key count_of_yojson "AssociationCount") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     name =
       option_of_yojson (value_for_key resolver_query_log_config_name_of_yojson "Name") _list path;
     destination_arn =
       option_of_yojson (value_for_key destination_arn_of_yojson "DestinationArn") _list path;
     creator_request_id =
       option_of_yojson (value_for_key creator_request_id_of_yojson "CreatorRequestId") _list path;
     creation_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "CreationTime") _list path;
   }
    : resolver_query_log_config)

let create_resolver_query_log_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config =
       option_of_yojson
         (value_for_key resolver_query_log_config_of_yojson "ResolverQueryLogConfig")
         _list path;
   }
    : create_resolver_query_log_config_response)

let create_resolver_query_log_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resolver_query_log_config_name_of_yojson "Name" _list path;
     destination_arn = value_for_key destination_arn_of_yojson "DestinationArn" _list path;
     creator_request_id = value_for_key creator_request_id_of_yojson "CreatorRequestId" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_resolver_query_log_config_request)

let delegation_record_of_yojson = string_of_yojson
let server_name_indication_of_yojson = string_of_yojson
let port_of_yojson = int_of_yojson

let target_address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip = option_of_yojson (value_for_key ip_of_yojson "Ip") _list path;
     port = option_of_yojson (value_for_key port_of_yojson "Port") _list path;
     ipv6 = option_of_yojson (value_for_key ipv6_of_yojson "Ipv6") _list path;
     protocol = option_of_yojson (value_for_key protocol_of_yojson "Protocol") _list path;
     server_name_indication =
       option_of_yojson
         (value_for_key server_name_indication_of_yojson "ServerNameIndication")
         _list path;
   }
    : target_address)

let target_list_of_yojson tree path = list_of_yojson target_address_of_yojson tree path

let rule_type_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "FORWARD" -> Forward
    | `String "SYSTEM" -> System
    | `String "RECURSIVE" -> Recursive
    | `String "DELEGATE" -> Delegate
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleTypeOption" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleTypeOption")
     : rule_type_option)
    : rule_type_option)

let resolver_rule_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETE" -> Complete
    | `String "DELETING" -> Deleting
    | `String "UPDATING" -> Updating
    | `String "FAILED" -> Failed
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResolverRuleStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResolverRuleStatus")
     : resolver_rule_status)
    : resolver_rule_status)

let domain_name_of_yojson = string_of_yojson

let resolver_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     creator_request_id =
       option_of_yojson (value_for_key creator_request_id_of_yojson "CreatorRequestId") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     status = option_of_yojson (value_for_key resolver_rule_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     rule_type = option_of_yojson (value_for_key rule_type_option_of_yojson "RuleType") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     target_ips = option_of_yojson (value_for_key target_list_of_yojson "TargetIps") _list path;
     resolver_endpoint_id =
       option_of_yojson (value_for_key resource_id_of_yojson "ResolverEndpointId") _list path;
     owner_id = option_of_yojson (value_for_key account_id_of_yojson "OwnerId") _list path;
     share_status = option_of_yojson (value_for_key share_status_of_yojson "ShareStatus") _list path;
     creation_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "CreationTime") _list path;
     modification_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "ModificationTime") _list path;
     delegation_record =
       option_of_yojson (value_for_key delegation_record_of_yojson "DelegationRecord") _list path;
   }
    : resolver_rule)

let create_resolver_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_rule =
       option_of_yojson (value_for_key resolver_rule_of_yojson "ResolverRule") _list path;
   }
    : create_resolver_rule_response)

let create_resolver_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creator_request_id = value_for_key creator_request_id_of_yojson "CreatorRequestId" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     rule_type = value_for_key rule_type_option_of_yojson "RuleType" _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     target_ips = option_of_yojson (value_for_key target_list_of_yojson "TargetIps") _list path;
     resolver_endpoint_id =
       option_of_yojson (value_for_key resource_id_of_yojson "ResolverEndpointId") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     delegation_record =
       option_of_yojson (value_for_key delegation_record_of_yojson "DelegationRecord") _list path;
   }
    : create_resolver_rule_request)

let delete_firewall_domain_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_domain_list =
       option_of_yojson
         (value_for_key firewall_domain_list_of_yojson "FirewallDomainList")
         _list path;
   }
    : delete_firewall_domain_list_response)

let delete_firewall_domain_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_domain_list_id = value_for_key resource_id_of_yojson "FirewallDomainListId" _list path;
   }
    : delete_firewall_domain_list_request)

let delete_firewall_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule =
       option_of_yojson (value_for_key firewall_rule_of_yojson "FirewallRule") _list path;
   }
    : delete_firewall_rule_response)

let delete_firewall_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_id = value_for_key resource_id_of_yojson "FirewallRuleGroupId" _list path;
     firewall_domain_list_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallDomainListId") _list path;
     firewall_threat_protection_id =
       option_of_yojson
         (value_for_key resource_id_of_yojson "FirewallThreatProtectionId")
         _list path;
     qtype = option_of_yojson (value_for_key qtype_of_yojson "Qtype") _list path;
   }
    : delete_firewall_rule_request)

let delete_firewall_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group =
       option_of_yojson (value_for_key firewall_rule_group_of_yojson "FirewallRuleGroup") _list path;
   }
    : delete_firewall_rule_group_response)

let delete_firewall_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ firewall_rule_group_id = value_for_key resource_id_of_yojson "FirewallRuleGroupId" _list path }
    : delete_firewall_rule_group_request)

let delete_outpost_resolver_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outpost_resolver =
       option_of_yojson (value_for_key outpost_resolver_of_yojson "OutpostResolver") _list path;
   }
    : delete_outpost_resolver_response)

let delete_outpost_resolver_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key resource_id_of_yojson "Id" _list path } : delete_outpost_resolver_request)

let delete_resolver_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_endpoint =
       option_of_yojson (value_for_key resolver_endpoint_of_yojson "ResolverEndpoint") _list path;
   }
    : delete_resolver_endpoint_response)

let delete_resolver_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resolver_endpoint_id = value_for_key resource_id_of_yojson "ResolverEndpointId" _list path }
    : delete_resolver_endpoint_request)

let delete_resolver_query_log_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config =
       option_of_yojson
         (value_for_key resolver_query_log_config_of_yojson "ResolverQueryLogConfig")
         _list path;
   }
    : delete_resolver_query_log_config_response)

let delete_resolver_query_log_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config_id =
       value_for_key resource_id_of_yojson "ResolverQueryLogConfigId" _list path;
   }
    : delete_resolver_query_log_config_request)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
   }
    : resource_in_use_exception)

let delete_resolver_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_rule =
       option_of_yojson (value_for_key resolver_rule_of_yojson "ResolverRule") _list path;
   }
    : delete_resolver_rule_response)

let delete_resolver_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resolver_rule_id = value_for_key resource_id_of_yojson "ResolverRuleId" _list path }
    : delete_resolver_rule_request)

let disassociate_firewall_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_association =
       option_of_yojson
         (value_for_key firewall_rule_group_association_of_yojson "FirewallRuleGroupAssociation")
         _list path;
   }
    : disassociate_firewall_rule_group_response)

let disassociate_firewall_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_association_id =
       value_for_key resource_id_of_yojson "FirewallRuleGroupAssociationId" _list path;
   }
    : disassociate_firewall_rule_group_request)

let disassociate_resolver_endpoint_ip_address_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_endpoint =
       option_of_yojson (value_for_key resolver_endpoint_of_yojson "ResolverEndpoint") _list path;
   }
    : disassociate_resolver_endpoint_ip_address_response)

let disassociate_resolver_endpoint_ip_address_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_endpoint_id = value_for_key resource_id_of_yojson "ResolverEndpointId" _list path;
     ip_address = value_for_key ip_address_update_of_yojson "IpAddress" _list path;
   }
    : disassociate_resolver_endpoint_ip_address_request)

let disassociate_resolver_query_log_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config_association =
       option_of_yojson
         (value_for_key resolver_query_log_config_association_of_yojson
            "ResolverQueryLogConfigAssociation")
         _list path;
   }
    : disassociate_resolver_query_log_config_response)

let disassociate_resolver_query_log_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config_id =
       value_for_key resource_id_of_yojson "ResolverQueryLogConfigId" _list path;
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
   }
    : disassociate_resolver_query_log_config_request)

let disassociate_resolver_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_rule_association =
       option_of_yojson
         (value_for_key resolver_rule_association_of_yojson "ResolverRuleAssociation")
         _list path;
   }
    : disassociate_resolver_rule_response)

let disassociate_resolver_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = value_for_key resource_id_of_yojson "VPCId" _list path;
     resolver_rule_id = value_for_key resource_id_of_yojson "ResolverRuleId" _list path;
   }
    : disassociate_resolver_rule_request)

let display_name_of_yojson = string_of_yojson
let domain_list_file_url_of_yojson = string_of_yojson
let filter_value_of_yojson = string_of_yojson
let filter_values_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path
let filter_name_of_yojson = string_of_yojson

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key filter_name_of_yojson "Name") _list path;
     values = option_of_yojson (value_for_key filter_values_of_yojson "Values") _list path;
   }
    : filter)

let filters_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let firewall_fail_open_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String "USE_LOCAL_RESOURCE_SETTING" -> USE_LOCAL_RESOURCE_SETTING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FirewallFailOpenStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FirewallFailOpenStatus")
     : firewall_fail_open_status)
    : firewall_fail_open_status)

let firewall_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "ResourceId") _list path;
     owner_id = option_of_yojson (value_for_key account_id_of_yojson "OwnerId") _list path;
     firewall_fail_open =
       option_of_yojson
         (value_for_key firewall_fail_open_status_of_yojson "FirewallFailOpen")
         _list path;
   }
    : firewall_config)

let firewall_config_list_of_yojson tree path = list_of_yojson firewall_config_of_yojson tree path

let firewall_domain_import_operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "REPLACE" -> REPLACE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FirewallDomainImportOperation" value)
    | _ -> raise (deserialize_wrong_type_error path "FirewallDomainImportOperation")
     : firewall_domain_import_operation)
    : firewall_domain_import_operation)

let firewall_domain_list_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     creator_request_id =
       option_of_yojson (value_for_key creator_request_id_of_yojson "CreatorRequestId") _list path;
     managed_owner_name =
       option_of_yojson (value_for_key service_principle_of_yojson "ManagedOwnerName") _list path;
     managed_list_type =
       option_of_yojson (value_for_key domain_list_type_of_yojson "ManagedListType") _list path;
     category = option_of_yojson (value_for_key category_of_yojson "Category") _list path;
   }
    : firewall_domain_list_metadata)

let firewall_domain_list_metadata_list_of_yojson tree path =
  list_of_yojson firewall_domain_list_metadata_of_yojson tree path

let firewall_domain_name_of_yojson = string_of_yojson

let firewall_domain_update_operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "ADD" -> ADD
    | `String "REMOVE" -> REMOVE
    | `String "REPLACE" -> REPLACE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FirewallDomainUpdateOperation" value)
    | _ -> raise (deserialize_wrong_type_error path "FirewallDomainUpdateOperation")
     : firewall_domain_update_operation)
    : firewall_domain_update_operation)

let firewall_domains_of_yojson tree path = list_of_yojson firewall_domain_name_of_yojson tree path

let firewall_rule_group_associations_of_yojson tree path =
  list_of_yojson firewall_rule_group_association_of_yojson tree path

let firewall_rule_group_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     owner_id = option_of_yojson (value_for_key account_id_of_yojson "OwnerId") _list path;
     creator_request_id =
       option_of_yojson (value_for_key creator_request_id_of_yojson "CreatorRequestId") _list path;
     share_status = option_of_yojson (value_for_key share_status_of_yojson "ShareStatus") _list path;
   }
    : firewall_rule_group_metadata)

let firewall_rule_group_metadata_list_of_yojson tree path =
  list_of_yojson firewall_rule_group_metadata_of_yojson tree path

let firewall_rule_group_policy_of_yojson = string_of_yojson
let product_id_of_yojson = string_of_yojson
let vendor_name_of_yojson = string_of_yojson

let subscription_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vendor_name = option_of_yojson (value_for_key vendor_name_of_yojson "VendorName") _list path;
     product_id = option_of_yojson (value_for_key product_id_of_yojson "ProductId") _list path;
   }
    : subscription_info)

let rule_type_description_of_yojson = string_of_yojson
let rule_type_value_of_yojson = string_of_yojson
let rule_type_name_of_yojson = string_of_yojson

let firewall_rule_type_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_type = option_of_yojson (value_for_key rule_type_name_of_yojson "RuleType") _list path;
     value = option_of_yojson (value_for_key rule_type_value_of_yojson "Value") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     description =
       option_of_yojson (value_for_key rule_type_description_of_yojson "Description") _list path;
     subscription_info =
       option_of_yojson (value_for_key subscription_info_of_yojson "SubscriptionInfo") _list path;
   }
    : firewall_rule_type_definition)

let firewall_rule_type_definitions_of_yojson tree path =
  list_of_yojson firewall_rule_type_definition_of_yojson tree path

let get_firewall_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_config =
       option_of_yojson (value_for_key firewall_config_of_yojson "FirewallConfig") _list path;
   }
    : get_firewall_config_response)

let get_firewall_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path }
    : get_firewall_config_request)

let get_firewall_domain_list_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_domain_list =
       option_of_yojson
         (value_for_key firewall_domain_list_of_yojson "FirewallDomainList")
         _list path;
   }
    : get_firewall_domain_list_response)

let get_firewall_domain_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_domain_list_id = value_for_key resource_id_of_yojson "FirewallDomainListId" _list path;
   }
    : get_firewall_domain_list_request)

let get_firewall_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group =
       option_of_yojson (value_for_key firewall_rule_group_of_yojson "FirewallRuleGroup") _list path;
   }
    : get_firewall_rule_group_response)

let get_firewall_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ firewall_rule_group_id = value_for_key resource_id_of_yojson "FirewallRuleGroupId" _list path }
    : get_firewall_rule_group_request)

let get_firewall_rule_group_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_association =
       option_of_yojson
         (value_for_key firewall_rule_group_association_of_yojson "FirewallRuleGroupAssociation")
         _list path;
   }
    : get_firewall_rule_group_association_response)

let get_firewall_rule_group_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_association_id =
       value_for_key resource_id_of_yojson "FirewallRuleGroupAssociationId" _list path;
   }
    : get_firewall_rule_group_association_request)

let get_firewall_rule_group_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_policy =
       option_of_yojson
         (value_for_key firewall_rule_group_policy_of_yojson "FirewallRuleGroupPolicy")
         _list path;
   }
    : get_firewall_rule_group_policy_response)

let get_firewall_rule_group_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key arn_of_yojson "Arn" _list path } : get_firewall_rule_group_policy_request)

let get_outpost_resolver_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outpost_resolver =
       option_of_yojson (value_for_key outpost_resolver_of_yojson "OutpostResolver") _list path;
   }
    : get_outpost_resolver_response)

let get_outpost_resolver_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key resource_id_of_yojson "Id" _list path } : get_outpost_resolver_request)

let resolver_autodefined_reverse_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLING" -> Enabling
    | `String "ENABLED" -> Enabled
    | `String "DISABLING" -> Disabling
    | `String "DISABLED" -> Disabled
    | `String "UPDATING_TO_USE_LOCAL_RESOURCE_SETTING" -> UpdatingToUseLocalResourceSetting
    | `String "USE_LOCAL_RESOURCE_SETTING" -> UseLocalResourceSetting
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResolverAutodefinedReverseStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResolverAutodefinedReverseStatus")
     : resolver_autodefined_reverse_status)
    : resolver_autodefined_reverse_status)

let resolver_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "ResourceId") _list path;
     owner_id = option_of_yojson (value_for_key account_id_of_yojson "OwnerId") _list path;
     autodefined_reverse =
       option_of_yojson
         (value_for_key resolver_autodefined_reverse_status_of_yojson "AutodefinedReverse")
         _list path;
   }
    : resolver_config)

let get_resolver_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_config =
       option_of_yojson (value_for_key resolver_config_of_yojson "ResolverConfig") _list path;
   }
    : get_resolver_config_response)

let get_resolver_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path }
    : get_resolver_config_request)

let resolver_dnssec_validation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLING" -> Enabling
    | `String "ENABLED" -> Enabled
    | `String "DISABLING" -> Disabling
    | `String "DISABLED" -> Disabled
    | `String "UPDATING_TO_USE_LOCAL_RESOURCE_SETTING" -> UpdateToUseLocalResourceSetting
    | `String "USE_LOCAL_RESOURCE_SETTING" -> UseLocalResourceSetting
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResolverDNSSECValidationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResolverDNSSECValidationStatus")
     : resolver_dnssec_validation_status)
    : resolver_dnssec_validation_status)

let resolver_dnssec_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     owner_id = option_of_yojson (value_for_key account_id_of_yojson "OwnerId") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "ResourceId") _list path;
     validation_status =
       option_of_yojson
         (value_for_key resolver_dnssec_validation_status_of_yojson "ValidationStatus")
         _list path;
   }
    : resolver_dnssec_config)

let get_resolver_dnssec_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_dnssec_config =
       option_of_yojson
         (value_for_key resolver_dnssec_config_of_yojson "ResolverDNSSECConfig")
         _list path;
   }
    : get_resolver_dnssec_config_response)

let get_resolver_dnssec_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path }
    : get_resolver_dnssec_config_request)

let get_resolver_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_endpoint =
       option_of_yojson (value_for_key resolver_endpoint_of_yojson "ResolverEndpoint") _list path;
   }
    : get_resolver_endpoint_response)

let get_resolver_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resolver_endpoint_id = value_for_key resource_id_of_yojson "ResolverEndpointId" _list path }
    : get_resolver_endpoint_request)

let get_resolver_query_log_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config =
       option_of_yojson
         (value_for_key resolver_query_log_config_of_yojson "ResolverQueryLogConfig")
         _list path;
   }
    : get_resolver_query_log_config_response)

let get_resolver_query_log_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config_id =
       value_for_key resource_id_of_yojson "ResolverQueryLogConfigId" _list path;
   }
    : get_resolver_query_log_config_request)

let get_resolver_query_log_config_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config_association =
       option_of_yojson
         (value_for_key resolver_query_log_config_association_of_yojson
            "ResolverQueryLogConfigAssociation")
         _list path;
   }
    : get_resolver_query_log_config_association_response)

let get_resolver_query_log_config_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config_association_id =
       value_for_key resource_id_of_yojson "ResolverQueryLogConfigAssociationId" _list path;
   }
    : get_resolver_query_log_config_association_request)

let unknown_resource_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : unknown_resource_exception)

let resolver_query_log_config_policy_of_yojson = string_of_yojson

let get_resolver_query_log_config_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_query_log_config_policy =
       option_of_yojson
         (value_for_key resolver_query_log_config_policy_of_yojson "ResolverQueryLogConfigPolicy")
         _list path;
   }
    : get_resolver_query_log_config_policy_response)

let get_resolver_query_log_config_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key arn_of_yojson "Arn" _list path }
    : get_resolver_query_log_config_policy_request)

let get_resolver_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_rule =
       option_of_yojson (value_for_key resolver_rule_of_yojson "ResolverRule") _list path;
   }
    : get_resolver_rule_response)

let get_resolver_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resolver_rule_id = value_for_key resource_id_of_yojson "ResolverRuleId" _list path }
    : get_resolver_rule_request)

let get_resolver_rule_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_rule_association =
       option_of_yojson
         (value_for_key resolver_rule_association_of_yojson "ResolverRuleAssociation")
         _list path;
   }
    : get_resolver_rule_association_response)

let get_resolver_rule_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_rule_association_id =
       value_for_key resource_id_of_yojson "ResolverRuleAssociationId" _list path;
   }
    : get_resolver_rule_association_request)

let resolver_rule_policy_of_yojson = string_of_yojson

let get_resolver_rule_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_rule_policy =
       option_of_yojson
         (value_for_key resolver_rule_policy_of_yojson "ResolverRulePolicy")
         _list path;
   }
    : get_resolver_rule_policy_response)

let get_resolver_rule_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key arn_of_yojson "Arn" _list path } : get_resolver_rule_policy_request)

let import_firewall_domains_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     status =
       option_of_yojson (value_for_key firewall_domain_list_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
   }
    : import_firewall_domains_response)

let import_firewall_domains_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_domain_list_id = value_for_key resource_id_of_yojson "FirewallDomainListId" _list path;
     operation = value_for_key firewall_domain_import_operation_of_yojson "Operation" _list path;
     domain_file_url = value_for_key domain_list_file_url_of_yojson "DomainFileUrl" _list path;
   }
    : import_firewall_domains_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_next_token_exception)

let invalid_policy_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : invalid_policy_document)

let invalid_tag_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : invalid_tag_exception)

let ip_address_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> Creating
    | `String "FAILED_CREATION" -> FailedCreation
    | `String "FAILED_CREATION_INSUFFICIENT_EC2_CAPACITY_IN_OUTPOST" ->
        FailedCreationInsufficientEC2CapacityInOutpost
    | `String "ATTACHING" -> Attaching
    | `String "ATTACHED" -> Attached
    | `String "REMAP_DETACHING" -> RemapDetaching
    | `String "REMAP_ATTACHING" -> RemapAttaching
    | `String "DETACHING" -> Detaching
    | `String "FAILED_RESOURCE_GONE" -> FailedResourceGone
    | `String "DELETING" -> Deleting
    | `String "DELETE_FAILED_FAS_EXPIRED" -> DeleteFailedFasExpired
    | `String "UPDATING" -> Updating
    | `String "UPDATE_FAILED" -> UpdateFailed
    | `String "ISOLATED" -> Isolated
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpAddressStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "IpAddressStatus")
     : ip_address_status)
    : ip_address_status)

let ip_address_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_id = option_of_yojson (value_for_key resource_id_of_yojson "IpId") _list path;
     subnet_id = option_of_yojson (value_for_key subnet_id_of_yojson "SubnetId") _list path;
     ip = option_of_yojson (value_for_key ip_of_yojson "Ip") _list path;
     ipv6 = option_of_yojson (value_for_key ipv6_of_yojson "Ipv6") _list path;
     status = option_of_yojson (value_for_key ip_address_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     creation_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "CreationTime") _list path;
     modification_time =
       option_of_yojson (value_for_key rfc3339_time_string_of_yojson "ModificationTime") _list path;
   }
    : ip_address_response)

let ip_addresses_response_of_yojson tree path =
  list_of_yojson ip_address_response_of_yojson tree path

let list_domain_max_results_of_yojson = int_of_yojson
let next_token_of_yojson = string_of_yojson

let list_firewall_configs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     firewall_configs =
       option_of_yojson (value_for_key firewall_config_list_of_yojson "FirewallConfigs") _list path;
   }
    : list_firewall_configs_response)

let list_firewall_configs_max_result_of_yojson = int_of_yojson

let list_firewall_configs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key list_firewall_configs_max_result_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_firewall_configs_request)

let list_firewall_domain_lists_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     firewall_domain_lists =
       option_of_yojson
         (value_for_key firewall_domain_list_metadata_list_of_yojson "FirewallDomainLists")
         _list path;
   }
    : list_firewall_domain_lists_response)

let max_results_of_yojson = int_of_yojson

let list_firewall_domain_lists_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_firewall_domain_lists_request)

let list_firewall_domains_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     domains = option_of_yojson (value_for_key firewall_domains_of_yojson "Domains") _list path;
   }
    : list_firewall_domains_response)

let list_firewall_domains_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_domain_list_id = value_for_key resource_id_of_yojson "FirewallDomainListId" _list path;
     max_results =
       option_of_yojson (value_for_key list_domain_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_firewall_domains_request)

let list_firewall_rule_group_associations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     firewall_rule_group_associations =
       option_of_yojson
         (value_for_key firewall_rule_group_associations_of_yojson "FirewallRuleGroupAssociations")
         _list path;
   }
    : list_firewall_rule_group_associations_response)

let list_firewall_rule_group_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallRuleGroupId") _list path;
     vpc_id = option_of_yojson (value_for_key resource_id_of_yojson "VpcId") _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "Priority") _list path;
     status =
       option_of_yojson
         (value_for_key firewall_rule_group_association_status_of_yojson "Status")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_firewall_rule_group_associations_request)

let list_firewall_rule_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     firewall_rule_groups =
       option_of_yojson
         (value_for_key firewall_rule_group_metadata_list_of_yojson "FirewallRuleGroups")
         _list path;
   }
    : list_firewall_rule_groups_response)

let list_firewall_rule_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_firewall_rule_groups_request)

let list_firewall_rule_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_types =
       option_of_yojson
         (value_for_key firewall_rule_type_definitions_of_yojson "FirewallRuleTypes")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_firewall_rule_types_response)

let list_firewall_rule_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_type = option_of_yojson (value_for_key rule_type_name_of_yojson "RuleType") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_firewall_rule_types_request)

let list_firewall_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     firewall_rules =
       option_of_yojson (value_for_key firewall_rules_of_yojson "FirewallRules") _list path;
   }
    : list_firewall_rules_response)

let list_firewall_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_id = value_for_key resource_id_of_yojson "FirewallRuleGroupId" _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "Priority") _list path;
     action = option_of_yojson (value_for_key action_of_yojson "Action") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_firewall_rules_request)

let outpost_resolver_list_of_yojson tree path = list_of_yojson outpost_resolver_of_yojson tree path

let list_outpost_resolvers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outpost_resolvers =
       option_of_yojson
         (value_for_key outpost_resolver_list_of_yojson "OutpostResolvers")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_outpost_resolvers_response)

let list_outpost_resolvers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outpost_arn = option_of_yojson (value_for_key outpost_arn_of_yojson "OutpostArn") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_outpost_resolvers_request)

let resolver_config_list_of_yojson tree path = list_of_yojson resolver_config_of_yojson tree path

let list_resolver_configs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     resolver_configs =
       option_of_yojson (value_for_key resolver_config_list_of_yojson "ResolverConfigs") _list path;
   }
    : list_resolver_configs_response)

let list_resolver_configs_max_result_of_yojson = int_of_yojson

let list_resolver_configs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key list_resolver_configs_max_result_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_resolver_configs_request)

let resolver_dnssec_config_list_of_yojson tree path =
  list_of_yojson resolver_dnssec_config_of_yojson tree path

let list_resolver_dnssec_configs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     resolver_dnssec_configs =
       option_of_yojson
         (value_for_key resolver_dnssec_config_list_of_yojson "ResolverDnssecConfigs")
         _list path;
   }
    : list_resolver_dnssec_configs_response)

let list_resolver_dnssec_configs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_resolver_dnssec_configs_request)

let list_resolver_endpoint_ip_addresses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     ip_addresses =
       option_of_yojson (value_for_key ip_addresses_response_of_yojson "IpAddresses") _list path;
   }
    : list_resolver_endpoint_ip_addresses_response)

let list_resolver_endpoint_ip_addresses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_endpoint_id = value_for_key resource_id_of_yojson "ResolverEndpointId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_resolver_endpoint_ip_addresses_request)

let resolver_endpoints_of_yojson tree path = list_of_yojson resolver_endpoint_of_yojson tree path

let list_resolver_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     resolver_endpoints =
       option_of_yojson (value_for_key resolver_endpoints_of_yojson "ResolverEndpoints") _list path;
   }
    : list_resolver_endpoints_response)

let list_resolver_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_resolver_endpoints_request)

let resolver_query_log_config_association_list_of_yojson tree path =
  list_of_yojson resolver_query_log_config_association_of_yojson tree path

let list_resolver_query_log_config_associations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     total_count = option_of_yojson (value_for_key count_of_yojson "TotalCount") _list path;
     total_filtered_count =
       option_of_yojson (value_for_key count_of_yojson "TotalFilteredCount") _list path;
     resolver_query_log_config_associations =
       option_of_yojson
         (value_for_key resolver_query_log_config_association_list_of_yojson
            "ResolverQueryLogConfigAssociations")
         _list path;
   }
    : list_resolver_query_log_config_associations_response)

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASCENDING" -> Ascending
    | `String "DESCENDING" -> Descending
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let sort_by_key_of_yojson = string_of_yojson

let list_resolver_query_log_config_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     sort_by = option_of_yojson (value_for_key sort_by_key_of_yojson "SortBy") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
   }
    : list_resolver_query_log_config_associations_request)

let resolver_query_log_config_list_of_yojson tree path =
  list_of_yojson resolver_query_log_config_of_yojson tree path

let list_resolver_query_log_configs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     total_count = option_of_yojson (value_for_key count_of_yojson "TotalCount") _list path;
     total_filtered_count =
       option_of_yojson (value_for_key count_of_yojson "TotalFilteredCount") _list path;
     resolver_query_log_configs =
       option_of_yojson
         (value_for_key resolver_query_log_config_list_of_yojson "ResolverQueryLogConfigs")
         _list path;
   }
    : list_resolver_query_log_configs_response)

let list_resolver_query_log_configs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     sort_by = option_of_yojson (value_for_key sort_by_key_of_yojson "SortBy") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
   }
    : list_resolver_query_log_configs_request)

let resolver_rule_associations_of_yojson tree path =
  list_of_yojson resolver_rule_association_of_yojson tree path

let list_resolver_rule_associations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     resolver_rule_associations =
       option_of_yojson
         (value_for_key resolver_rule_associations_of_yojson "ResolverRuleAssociations")
         _list path;
   }
    : list_resolver_rule_associations_response)

let list_resolver_rule_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_resolver_rule_associations_request)

let resolver_rules_of_yojson tree path = list_of_yojson resolver_rule_of_yojson tree path

let list_resolver_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     resolver_rules =
       option_of_yojson (value_for_key resolver_rules_of_yojson "ResolverRules") _list path;
   }
    : list_resolver_rules_response)

let list_resolver_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_resolver_rules_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_request)

let put_firewall_rule_group_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ return_value = option_of_yojson (value_for_key boolean__of_yojson "ReturnValue") _list path }
    : put_firewall_rule_group_policy_response)

let put_firewall_rule_group_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "Arn" _list path;
     firewall_rule_group_policy =
       value_for_key firewall_rule_group_policy_of_yojson "FirewallRuleGroupPolicy" _list path;
   }
    : put_firewall_rule_group_policy_request)

let put_resolver_query_log_config_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ return_value = option_of_yojson (value_for_key boolean__of_yojson "ReturnValue") _list path }
    : put_resolver_query_log_config_policy_response)

let put_resolver_query_log_config_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "Arn" _list path;
     resolver_query_log_config_policy =
       value_for_key resolver_query_log_config_policy_of_yojson "ResolverQueryLogConfigPolicy" _list
         path;
   }
    : put_resolver_query_log_config_policy_request)

let put_resolver_rule_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ return_value = option_of_yojson (value_for_key boolean__of_yojson "ReturnValue") _list path }
    : put_resolver_rule_policy_response)

let put_resolver_rule_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key arn_of_yojson "Arn" _list path;
     resolver_rule_policy =
       value_for_key resolver_rule_policy_of_yojson "ResolverRulePolicy" _list path;
   }
    : put_resolver_rule_policy_request)

let resolver_rule_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     target_ips = option_of_yojson (value_for_key target_list_of_yojson "TargetIps") _list path;
     resolver_endpoint_id =
       option_of_yojson (value_for_key resource_id_of_yojson "ResolverEndpointId") _list path;
   }
    : resolver_rule_config)

let update_resolver_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_rule =
       option_of_yojson (value_for_key resolver_rule_of_yojson "ResolverRule") _list path;
   }
    : update_resolver_rule_response)

let update_resolver_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_rule_id = value_for_key resource_id_of_yojson "ResolverRuleId" _list path;
     config = value_for_key resolver_rule_config_of_yojson "Config" _list path;
   }
    : update_resolver_rule_request)

let update_resolver_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_endpoint =
       option_of_yojson (value_for_key resolver_endpoint_of_yojson "ResolverEndpoint") _list path;
   }
    : update_resolver_endpoint_response)

let update_ip_address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_id = value_for_key resource_id_of_yojson "IpId" _list path;
     ipv6 = value_for_key ipv6_of_yojson "Ipv6" _list path;
   }
    : update_ip_address)

let update_ip_addresses_of_yojson tree path = list_of_yojson update_ip_address_of_yojson tree path

let update_resolver_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_endpoint_id = value_for_key resource_id_of_yojson "ResolverEndpointId" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     resolver_endpoint_type =
       option_of_yojson
         (value_for_key resolver_endpoint_type_of_yojson "ResolverEndpointType")
         _list path;
     update_ip_addresses =
       option_of_yojson (value_for_key update_ip_addresses_of_yojson "UpdateIpAddresses") _list path;
     protocols = option_of_yojson (value_for_key protocol_list_of_yojson "Protocols") _list path;
     rni_enhanced_metrics_enabled =
       option_of_yojson
         (value_for_key rni_enhanced_metrics_enabled_of_yojson "RniEnhancedMetricsEnabled")
         _list path;
     target_name_server_metrics_enabled =
       option_of_yojson
         (value_for_key target_name_server_metrics_enabled_of_yojson
            "TargetNameServerMetricsEnabled")
         _list path;
     dns64_enabled =
       option_of_yojson (value_for_key dns64_enabled_of_yojson "Dns64Enabled") _list path;
     ipv6_internet_access_enabled =
       option_of_yojson
         (value_for_key ipv6_internet_access_enabled_of_yojson "Ipv6InternetAccessEnabled")
         _list path;
   }
    : update_resolver_endpoint_request)

let update_resolver_dnssec_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_dnssec_config =
       option_of_yojson
         (value_for_key resolver_dnssec_config_of_yojson "ResolverDNSSECConfig")
         _list path;
   }
    : update_resolver_dnssec_config_response)

let validation_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLE" -> ENABLE
    | `String "DISABLE" -> DISABLE
    | `String "USE_LOCAL_RESOURCE_SETTING" -> USE_LOCAL_RESOURCE_SETTING
    | `String value -> raise (deserialize_unknown_enum_value_error path "Validation" value)
    | _ -> raise (deserialize_wrong_type_error path "Validation")
     : validation)
    : validation)

let update_resolver_dnssec_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     validation = value_for_key validation_of_yojson "Validation" _list path;
   }
    : update_resolver_dnssec_config_request)

let update_resolver_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolver_config =
       option_of_yojson (value_for_key resolver_config_of_yojson "ResolverConfig") _list path;
   }
    : update_resolver_config_response)

let update_resolver_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     autodefined_reverse_flag =
       value_for_key autodefined_reverse_flag_of_yojson "AutodefinedReverseFlag" _list path;
   }
    : update_resolver_config_request)

let update_outpost_resolver_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outpost_resolver =
       option_of_yojson (value_for_key outpost_resolver_of_yojson "OutpostResolver") _list path;
   }
    : update_outpost_resolver_response)

let update_outpost_resolver_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key resource_id_of_yojson "Id" _list path;
     name = option_of_yojson (value_for_key outpost_resolver_name_of_yojson "Name") _list path;
     instance_count =
       option_of_yojson (value_for_key instance_count_of_yojson "InstanceCount") _list path;
     preferred_instance_type =
       option_of_yojson
         (value_for_key outpost_instance_type_of_yojson "PreferredInstanceType")
         _list path;
   }
    : update_outpost_resolver_request)

let update_firewall_rule_group_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_association =
       option_of_yojson
         (value_for_key firewall_rule_group_association_of_yojson "FirewallRuleGroupAssociation")
         _list path;
   }
    : update_firewall_rule_group_association_response)

let update_firewall_rule_group_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_association_id =
       value_for_key resource_id_of_yojson "FirewallRuleGroupAssociationId" _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "Priority") _list path;
     mutation_protection =
       option_of_yojson
         (value_for_key mutation_protection_status_of_yojson "MutationProtection")
         _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
   }
    : update_firewall_rule_group_association_request)

let update_firewall_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule =
       option_of_yojson (value_for_key firewall_rule_of_yojson "FirewallRule") _list path;
   }
    : update_firewall_rule_response)

let update_firewall_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_rule_group_id = value_for_key resource_id_of_yojson "FirewallRuleGroupId" _list path;
     firewall_domain_list_id =
       option_of_yojson (value_for_key resource_id_of_yojson "FirewallDomainListId") _list path;
     firewall_threat_protection_id =
       option_of_yojson
         (value_for_key resource_id_of_yojson "FirewallThreatProtectionId")
         _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "Priority") _list path;
     action = option_of_yojson (value_for_key action_of_yojson "Action") _list path;
     block_response =
       option_of_yojson (value_for_key block_response_of_yojson "BlockResponse") _list path;
     block_override_domain =
       option_of_yojson
         (value_for_key block_override_domain_of_yojson "BlockOverrideDomain")
         _list path;
     block_override_dns_type =
       option_of_yojson
         (value_for_key block_override_dns_type_of_yojson "BlockOverrideDnsType")
         _list path;
     block_override_ttl =
       option_of_yojson (value_for_key block_override_ttl_of_yojson "BlockOverrideTtl") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     firewall_domain_redirection_action =
       option_of_yojson
         (value_for_key firewall_domain_redirection_action_of_yojson
            "FirewallDomainRedirectionAction")
         _list path;
     qtype = option_of_yojson (value_for_key qtype_of_yojson "Qtype") _list path;
     dns_threat_protection =
       option_of_yojson
         (value_for_key dns_threat_protection_of_yojson "DnsThreatProtection")
         _list path;
     confidence_threshold =
       option_of_yojson
         (value_for_key confidence_threshold_of_yojson "ConfidenceThreshold")
         _list path;
     firewall_rule_type =
       option_of_yojson (value_for_key firewall_rule_type_of_yojson "FirewallRuleType") _list path;
   }
    : update_firewall_rule_request)

let update_firewall_domains_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "Id") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     status =
       option_of_yojson (value_for_key firewall_domain_list_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
   }
    : update_firewall_domains_response)

let update_firewall_domains_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_domain_list_id = value_for_key resource_id_of_yojson "FirewallDomainListId" _list path;
     operation = value_for_key firewall_domain_update_operation_of_yojson "Operation" _list path;
     domains = value_for_key firewall_domains_of_yojson "Domains" _list path;
   }
    : update_firewall_domains_request)

let update_firewall_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_config =
       option_of_yojson (value_for_key firewall_config_of_yojson "FirewallConfig") _list path;
   }
    : update_firewall_config_response)

let update_firewall_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     firewall_fail_open =
       value_for_key firewall_fail_open_status_of_yojson "FirewallFailOpen" _list path;
   }
    : update_firewall_config_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)
