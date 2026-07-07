open Smaws_Lib.Json.SerializeHelpers
open Types

let vpc_id_to_yojson = string_to_yojson
let vpc_ids_to_yojson tree = list_to_yojson vpc_id_to_yojson tree
let vpc_endpoint_service_name_to_yojson = string_to_yojson
let vpc_endpoint_id_to_yojson = string_to_yojson
let resource_arn_to_yojson = string_to_yojson

let vpc_endpoint_association_metadata_to_yojson (x : vpc_endpoint_association_metadata) =
  assoc_to_yojson
    [
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
    ]

let vpc_endpoint_associations_to_yojson tree =
  list_to_yojson vpc_endpoint_association_metadata_to_yojson tree

let firewall_status_value_to_yojson (x : firewall_status_value) =
  match x with
  | READY -> `String "READY"
  | DELETING -> `String "DELETING"
  | PROVISIONING -> `String "PROVISIONING"

let az_subnet_to_yojson = string_to_yojson
let endpoint_id_to_yojson = string_to_yojson

let attachment_status_to_yojson (x : attachment_status) =
  match x with
  | READY -> `String "READY"
  | SCALING -> `String "SCALING"
  | ERROR -> `String "ERROR"
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"

let status_message_to_yojson = string_to_yojson

let attachment_to_yojson (x : attachment) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Status", option_to_yojson attachment_status_to_yojson x.status);
      ("EndpointId", option_to_yojson endpoint_id_to_yojson x.endpoint_id);
      ("SubnetId", option_to_yojson az_subnet_to_yojson x.subnet_id);
    ]

let az_sync_state_to_yojson (x : az_sync_state) =
  assoc_to_yojson [ ("Attachment", option_to_yojson attachment_to_yojson x.attachment) ]

let availability_zone_to_yojson = string_to_yojson

let association_sync_state_to_yojson tree =
  map_to_yojson availability_zone_to_yojson az_sync_state_to_yojson tree

let vpc_endpoint_association_status_to_yojson (x : vpc_endpoint_association_status) =
  assoc_to_yojson
    [
      ( "AssociationSyncState",
        option_to_yojson association_sync_state_to_yojson x.association_sync_state );
      ("Status", Some (firewall_status_value_to_yojson x.status));
    ]

let resource_id_to_yojson = string_to_yojson
let collection_member__string_to_yojson = string_to_yojson

let ip_address_type_to_yojson (x : ip_address_type) =
  match x with IPV6 -> `String "IPV6" | IPV4 -> `String "IPV4" | DUALSTACK -> `String "DUALSTACK"

let subnet_mapping_to_yojson (x : subnet_mapping) =
  assoc_to_yojson
    [
      ("IPAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("SubnetId", Some (collection_member__string_to_yojson x.subnet_id));
    ]

let description_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let vpc_endpoint_association_to_yojson (x : vpc_endpoint_association) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("SubnetMapping", Some (subnet_mapping_to_yojson x.subnet_mapping));
      ("VpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
      ("VpcEndpointAssociationArn", Some (resource_arn_to_yojson x.vpc_endpoint_association_arn));
      ( "VpcEndpointAssociationId",
        option_to_yojson resource_id_to_yojson x.vpc_endpoint_association_id );
    ]

let vendor_name_to_yojson = string_to_yojson
let variable_definition_to_yojson = string_to_yojson
let variable_definition_list_to_yojson tree = list_to_yojson variable_definition_to_yojson tree
let update_token_to_yojson = string_to_yojson
let update_time_to_yojson = timestamp_epoch_seconds_to_yojson
let resource_name_to_yojson = string_to_yojson

let resource_status_to_yojson (x : resource_status) =
  match x with
  | ERROR -> `String "ERROR"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"

let last_update_time_to_yojson = timestamp_epoch_seconds_to_yojson
let number_of_associations_to_yojson = int_to_yojson
let key_id_to_yojson = string_to_yojson

let encryption_type_to_yojson (x : encryption_type) =
  match x with
  | AWS_OWNED_KMS_KEY -> `String "AWS_OWNED_KMS_KEY"
  | CUSTOMER_KMS -> `String "CUSTOMER_KMS"

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("Type", Some (encryption_type_to_yojson x.type_));
      ("KeyId", option_to_yojson key_id_to_yojson x.key_id);
    ]

let status_reason_to_yojson = string_to_yojson

let tls_certificate_data_to_yojson (x : tls_certificate_data) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson status_reason_to_yojson x.status_message);
      ("Status", option_to_yojson collection_member__string_to_yojson x.status);
      ( "CertificateSerial",
        option_to_yojson collection_member__string_to_yojson x.certificate_serial );
      ("CertificateArn", option_to_yojson resource_arn_to_yojson x.certificate_arn);
    ]

let certificates_to_yojson tree = list_to_yojson tls_certificate_data_to_yojson tree

let tls_inspection_configuration_response_to_yojson (x : tls_inspection_configuration_response) =
  assoc_to_yojson
    [
      ( "CertificateAuthority",
        option_to_yojson tls_certificate_data_to_yojson x.certificate_authority );
      ("Certificates", option_to_yojson certificates_to_yojson x.certificates);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "NumberOfAssociations",
        option_to_yojson number_of_associations_to_yojson x.number_of_associations );
      ("LastModifiedTime", option_to_yojson last_update_time_to_yojson x.last_modified_time);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "TLSInspectionConfigurationStatus",
        option_to_yojson resource_status_to_yojson x.tls_inspection_configuration_status );
      ( "TLSInspectionConfigurationId",
        Some (resource_id_to_yojson x.tls_inspection_configuration_id) );
      ( "TLSInspectionConfigurationName",
        Some (resource_name_to_yojson x.tls_inspection_configuration_name) );
      ( "TLSInspectionConfigurationArn",
        Some (resource_arn_to_yojson x.tls_inspection_configuration_arn) );
    ]

let update_tls_inspection_configuration_response_to_yojson
    (x : update_tls_inspection_configuration_response) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationResponse",
        Some
          (tls_inspection_configuration_response_to_yojson x.tls_inspection_configuration_response)
      );
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let server_certificate_to_yojson (x : server_certificate) =
  assoc_to_yojson [ ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn) ]

let server_certificates_to_yojson tree = list_to_yojson server_certificate_to_yojson tree
let address_definition_to_yojson = string_to_yojson

let address_to_yojson (x : address) =
  assoc_to_yojson
    [ ("AddressDefinition", Some (address_definition_to_yojson x.address_definition)) ]

let addresses_to_yojson tree = list_to_yojson address_to_yojson tree
let port_range_bound_to_yojson = int_to_yojson

let port_range_to_yojson (x : port_range) =
  assoc_to_yojson
    [
      ("ToPort", Some (port_range_bound_to_yojson x.to_port));
      ("FromPort", Some (port_range_bound_to_yojson x.from_port));
    ]

let port_ranges_to_yojson tree = list_to_yojson port_range_to_yojson tree
let protocol_number_to_yojson = int_to_yojson
let protocol_numbers_to_yojson tree = list_to_yojson protocol_number_to_yojson tree

let server_certificate_scope_to_yojson (x : server_certificate_scope) =
  assoc_to_yojson
    [
      ("Protocols", option_to_yojson protocol_numbers_to_yojson x.protocols);
      ("DestinationPorts", option_to_yojson port_ranges_to_yojson x.destination_ports);
      ("SourcePorts", option_to_yojson port_ranges_to_yojson x.source_ports);
      ("Destinations", option_to_yojson addresses_to_yojson x.destinations);
      ("Sources", option_to_yojson addresses_to_yojson x.sources);
    ]

let server_certificate_scopes_to_yojson tree =
  list_to_yojson server_certificate_scope_to_yojson tree

let revocation_check_action_to_yojson (x : revocation_check_action) =
  match x with REJECT -> `String "REJECT" | DROP -> `String "DROP" | PASS -> `String "PASS"

let check_certificate_revocation_status_actions_to_yojson
    (x : check_certificate_revocation_status_actions) =
  assoc_to_yojson
    [
      ( "UnknownStatusAction",
        option_to_yojson revocation_check_action_to_yojson x.unknown_status_action );
      ( "RevokedStatusAction",
        option_to_yojson revocation_check_action_to_yojson x.revoked_status_action );
    ]

let server_certificate_configuration_to_yojson (x : server_certificate_configuration) =
  assoc_to_yojson
    [
      ( "CheckCertificateRevocationStatus",
        option_to_yojson check_certificate_revocation_status_actions_to_yojson
          x.check_certificate_revocation_status );
      ( "CertificateAuthorityArn",
        option_to_yojson resource_arn_to_yojson x.certificate_authority_arn );
      ("Scopes", option_to_yojson server_certificate_scopes_to_yojson x.scopes);
      ("ServerCertificates", option_to_yojson server_certificates_to_yojson x.server_certificates);
    ]

let server_certificate_configurations_to_yojson tree =
  list_to_yojson server_certificate_configuration_to_yojson tree

let tls_inspection_configuration_to_yojson (x : tls_inspection_configuration) =
  assoc_to_yojson
    [
      ( "ServerCertificateConfigurations",
        option_to_yojson server_certificate_configurations_to_yojson
          x.server_certificate_configurations );
    ]

let update_tls_inspection_configuration_request_to_yojson
    (x : update_tls_inspection_configuration_request) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "TLSInspectionConfiguration",
        Some (tls_inspection_configuration_to_yojson x.tls_inspection_configuration) );
      ( "TLSInspectionConfigurationName",
        option_to_yojson resource_name_to_yojson x.tls_inspection_configuration_name );
      ( "TLSInspectionConfigurationArn",
        option_to_yojson resource_arn_to_yojson x.tls_inspection_configuration_arn );
    ]

let error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_token_exception_to_yojson (x : invalid_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let boolean__to_yojson = bool_to_yojson

let update_subnet_change_protection_response_to_yojson
    (x : update_subnet_change_protection_response) =
  assoc_to_yojson
    [
      ("SubnetChangeProtection", option_to_yojson boolean__to_yojson x.subnet_change_protection);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_subnet_change_protection_request_to_yojson (x : update_subnet_change_protection_request)
    =
  assoc_to_yojson
    [
      ("SubnetChangeProtection", Some (boolean__to_yojson x.subnet_change_protection));
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let resource_owner_check_exception_to_yojson (x : resource_owner_check_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let rule_group_type_to_yojson (x : rule_group_type) =
  match x with
  | STATEFUL_DOMAIN -> `String "STATEFUL_DOMAIN"
  | STATEFUL -> `String "STATEFUL"
  | STATELESS -> `String "STATELESS"

let rule_capacity_to_yojson = int_to_yojson

let source_metadata_to_yojson (x : source_metadata) =
  assoc_to_yojson
    [
      ("SourceUpdateToken", option_to_yojson update_token_to_yojson x.source_update_token);
      ("SourceArn", option_to_yojson resource_arn_to_yojson x.source_arn);
    ]

let rule_id_list_to_yojson tree = list_to_yojson collection_member__string_to_yojson tree

let identified_type_to_yojson (x : identified_type) =
  match x with
  | STATELESS_RULE_CONTAINS_TCP_FLAGS -> `String "STATELESS_RULE_CONTAINS_TCP_FLAGS"
  | STATELESS_RULE_FORWARDING_ASYMMETRICALLY -> `String "STATELESS_RULE_FORWARDING_ASYMMETRICALLY"

let analysis_result_to_yojson (x : analysis_result) =
  assoc_to_yojson
    [
      ("AnalysisDetail", option_to_yojson collection_member__string_to_yojson x.analysis_detail);
      ("IdentifiedType", option_to_yojson identified_type_to_yojson x.identified_type);
      ("IdentifiedRuleIds", option_to_yojson rule_id_list_to_yojson x.identified_rule_ids);
    ]

let analysis_result_list_to_yojson tree = list_to_yojson analysis_result_to_yojson tree

let summary_rule_option_to_yojson (x : summary_rule_option) =
  match x with METADATA -> `String "METADATA" | MSG -> `String "MSG" | SID -> `String "SID"

let summary_rule_options_to_yojson tree = list_to_yojson summary_rule_option_to_yojson tree

let summary_configuration_to_yojson (x : summary_configuration) =
  assoc_to_yojson
    [ ("RuleOptions", option_to_yojson summary_rule_options_to_yojson x.rule_options) ]

let rule_group_response_to_yojson (x : rule_group_response) =
  assoc_to_yojson
    [
      ( "SummaryConfiguration",
        option_to_yojson summary_configuration_to_yojson x.summary_configuration );
      ("AnalysisResults", option_to_yojson analysis_result_list_to_yojson x.analysis_results);
      ("LastModifiedTime", option_to_yojson last_update_time_to_yojson x.last_modified_time);
      ("SnsTopic", option_to_yojson resource_arn_to_yojson x.sns_topic);
      ("SourceMetadata", option_to_yojson source_metadata_to_yojson x.source_metadata);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "NumberOfAssociations",
        option_to_yojson number_of_associations_to_yojson x.number_of_associations );
      ("ConsumedCapacity", option_to_yojson rule_capacity_to_yojson x.consumed_capacity);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RuleGroupStatus", option_to_yojson resource_status_to_yojson x.rule_group_status);
      ("Capacity", option_to_yojson rule_capacity_to_yojson x.capacity);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("RuleGroupId", Some (resource_id_to_yojson x.rule_group_id));
      ("RuleGroupName", Some (resource_name_to_yojson x.rule_group_name));
      ("RuleGroupArn", Some (resource_arn_to_yojson x.rule_group_arn));
    ]

let update_rule_group_response_to_yojson (x : update_rule_group_response) =
  assoc_to_yojson
    [
      ("RuleGroupResponse", Some (rule_group_response_to_yojson x.rule_group_response));
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let ip_set_to_yojson (x : ip_set) =
  assoc_to_yojson [ ("Definition", Some (variable_definition_list_to_yojson x.definition)) ]

let rule_variable_name_to_yojson = string_to_yojson
let ip_sets_to_yojson tree = map_to_yojson rule_variable_name_to_yojson ip_set_to_yojson tree

let port_set_to_yojson (x : port_set) =
  assoc_to_yojson
    [ ("Definition", option_to_yojson variable_definition_list_to_yojson x.definition) ]

let port_sets_to_yojson tree = map_to_yojson rule_variable_name_to_yojson port_set_to_yojson tree

let rule_variables_to_yojson (x : rule_variables) =
  assoc_to_yojson
    [
      ("PortSets", option_to_yojson port_sets_to_yojson x.port_sets);
      ("IPSets", option_to_yojson ip_sets_to_yojson x.ip_sets);
    ]

let ip_set_reference_to_yojson (x : ip_set_reference) =
  assoc_to_yojson [ ("ReferenceArn", option_to_yojson resource_arn_to_yojson x.reference_arn) ]

let ip_set_reference_name_to_yojson = string_to_yojson

let ip_set_reference_map_to_yojson tree =
  map_to_yojson ip_set_reference_name_to_yojson ip_set_reference_to_yojson tree

let reference_sets_to_yojson (x : reference_sets) =
  assoc_to_yojson
    [ ("IPSetReferences", option_to_yojson ip_set_reference_map_to_yojson x.ip_set_references) ]

let rules_string_to_yojson = string_to_yojson
let rule_targets_to_yojson tree = list_to_yojson collection_member__string_to_yojson tree

let target_type_to_yojson (x : target_type) =
  match x with HTTP_HOST -> `String "HTTP_HOST" | TLS_SNI -> `String "TLS_SNI"

let target_types_to_yojson tree = list_to_yojson target_type_to_yojson tree

let generated_rules_type_to_yojson (x : generated_rules_type) =
  match x with
  | ALERTLIST -> `String "ALERTLIST"
  | REJECTLIST -> `String "REJECTLIST"
  | DENYLIST -> `String "DENYLIST"
  | ALLOWLIST -> `String "ALLOWLIST"

let rules_source_list_to_yojson (x : rules_source_list) =
  assoc_to_yojson
    [
      ("GeneratedRulesType", Some (generated_rules_type_to_yojson x.generated_rules_type));
      ("TargetTypes", Some (target_types_to_yojson x.target_types));
      ("Targets", Some (rule_targets_to_yojson x.targets));
    ]

let stateful_action_to_yojson (x : stateful_action) =
  match x with
  | REJECT -> `String "REJECT"
  | ALERT -> `String "ALERT"
  | DROP -> `String "DROP"
  | PASS -> `String "PASS"

let stateful_rule_protocol_to_yojson (x : stateful_rule_protocol) =
  match x with
  | QUIC -> `String "QUIC"
  | HTTP2 -> `String "HTTP2"
  | DHCP -> `String "DHCP"
  | NTP -> `String "NTP"
  | TFTP -> `String "TFTP"
  | IKEV2 -> `String "IKEV2"
  | KRB5 -> `String "KRB5"
  | MSN -> `String "MSN"
  | IMAP -> `String "IMAP"
  | SMTP -> `String "SMTP"
  | SSH -> `String "SSH"
  | DCERPC -> `String "DCERPC"
  | DNS -> `String "DNS"
  | SMB -> `String "SMB"
  | TLS -> `String "TLS"
  | FTP -> `String "FTP"
  | HTTP -> `String "HTTP"
  | ICMP -> `String "ICMP"
  | UDP -> `String "UDP"
  | TCP -> `String "TCP"
  | ANY -> `String "IP"

let source_to_yojson = string_to_yojson
let port_to_yojson = string_to_yojson

let stateful_rule_direction_to_yojson (x : stateful_rule_direction) =
  match x with ANY -> `String "ANY" | FORWARD -> `String "FORWARD"

let destination_to_yojson = string_to_yojson

let header_to_yojson (x : header) =
  assoc_to_yojson
    [
      ("DestinationPort", Some (port_to_yojson x.destination_port));
      ("Destination", Some (destination_to_yojson x.destination));
      ("Direction", Some (stateful_rule_direction_to_yojson x.direction));
      ("SourcePort", Some (port_to_yojson x.source_port));
      ("Source", Some (source_to_yojson x.source));
      ("Protocol", Some (stateful_rule_protocol_to_yojson x.protocol));
    ]

let keyword_to_yojson = string_to_yojson
let setting_to_yojson = string_to_yojson
let settings_to_yojson tree = list_to_yojson setting_to_yojson tree

let rule_option_to_yojson (x : rule_option) =
  assoc_to_yojson
    [
      ("Settings", option_to_yojson settings_to_yojson x.settings);
      ("Keyword", Some (keyword_to_yojson x.keyword));
    ]

let rule_options_to_yojson tree = list_to_yojson rule_option_to_yojson tree

let stateful_rule_to_yojson (x : stateful_rule) =
  assoc_to_yojson
    [
      ("RuleOptions", Some (rule_options_to_yojson x.rule_options));
      ("Header", Some (header_to_yojson x.header));
      ("Action", Some (stateful_action_to_yojson x.action));
    ]

let stateful_rules_to_yojson tree = list_to_yojson stateful_rule_to_yojson tree

let tcp_flag_to_yojson (x : tcp_flag) =
  match x with
  | CWR -> `String "CWR"
  | ECE -> `String "ECE"
  | URG -> `String "URG"
  | ACK -> `String "ACK"
  | PSH -> `String "PSH"
  | RST -> `String "RST"
  | SYN -> `String "SYN"
  | FIN -> `String "FIN"

let flags_to_yojson tree = list_to_yojson tcp_flag_to_yojson tree

let tcp_flag_field_to_yojson (x : tcp_flag_field) =
  assoc_to_yojson
    [
      ("Masks", option_to_yojson flags_to_yojson x.masks); ("Flags", Some (flags_to_yojson x.flags));
    ]

let tcp_flags_to_yojson tree = list_to_yojson tcp_flag_field_to_yojson tree

let match_attributes_to_yojson (x : match_attributes) =
  assoc_to_yojson
    [
      ("TCPFlags", option_to_yojson tcp_flags_to_yojson x.tcp_flags);
      ("Protocols", option_to_yojson protocol_numbers_to_yojson x.protocols);
      ("DestinationPorts", option_to_yojson port_ranges_to_yojson x.destination_ports);
      ("SourcePorts", option_to_yojson port_ranges_to_yojson x.source_ports);
      ("Destinations", option_to_yojson addresses_to_yojson x.destinations);
      ("Sources", option_to_yojson addresses_to_yojson x.sources);
    ]

let stateless_actions_to_yojson tree = list_to_yojson collection_member__string_to_yojson tree

let rule_definition_to_yojson (x : rule_definition) =
  assoc_to_yojson
    [
      ("Actions", Some (stateless_actions_to_yojson x.actions));
      ("MatchAttributes", Some (match_attributes_to_yojson x.match_attributes));
    ]

let priority_to_yojson = int_to_yojson

let stateless_rule_to_yojson (x : stateless_rule) =
  assoc_to_yojson
    [
      ("Priority", Some (priority_to_yojson x.priority));
      ("RuleDefinition", Some (rule_definition_to_yojson x.rule_definition));
    ]

let stateless_rules_to_yojson tree = list_to_yojson stateless_rule_to_yojson tree
let action_name_to_yojson = string_to_yojson
let dimension_value_to_yojson = string_to_yojson

let dimension_to_yojson (x : dimension) =
  assoc_to_yojson [ ("Value", Some (dimension_value_to_yojson x.value)) ]

let dimensions_to_yojson tree = list_to_yojson dimension_to_yojson tree

let publish_metric_action_to_yojson (x : publish_metric_action) =
  assoc_to_yojson [ ("Dimensions", Some (dimensions_to_yojson x.dimensions)) ]

let action_definition_to_yojson (x : action_definition) =
  assoc_to_yojson
    [
      ( "PublishMetricAction",
        option_to_yojson publish_metric_action_to_yojson x.publish_metric_action );
    ]

let custom_action_to_yojson (x : custom_action) =
  assoc_to_yojson
    [
      ("ActionDefinition", Some (action_definition_to_yojson x.action_definition));
      ("ActionName", Some (action_name_to_yojson x.action_name));
    ]

let custom_actions_to_yojson tree = list_to_yojson custom_action_to_yojson tree

let stateless_rules_and_custom_actions_to_yojson (x : stateless_rules_and_custom_actions) =
  assoc_to_yojson
    [
      ("CustomActions", option_to_yojson custom_actions_to_yojson x.custom_actions);
      ("StatelessRules", Some (stateless_rules_to_yojson x.stateless_rules));
    ]

let rules_source_to_yojson (x : rules_source) =
  assoc_to_yojson
    [
      ( "StatelessRulesAndCustomActions",
        option_to_yojson stateless_rules_and_custom_actions_to_yojson
          x.stateless_rules_and_custom_actions );
      ("StatefulRules", option_to_yojson stateful_rules_to_yojson x.stateful_rules);
      ("RulesSourceList", option_to_yojson rules_source_list_to_yojson x.rules_source_list);
      ("RulesString", option_to_yojson rules_string_to_yojson x.rules_string);
    ]

let rule_order_to_yojson (x : rule_order) =
  match x with
  | STRICT_ORDER -> `String "STRICT_ORDER"
  | DEFAULT_ACTION_ORDER -> `String "DEFAULT_ACTION_ORDER"

let stateful_rule_options_to_yojson (x : stateful_rule_options) =
  assoc_to_yojson [ ("RuleOrder", option_to_yojson rule_order_to_yojson x.rule_order) ]

let rule_group_to_yojson (x : rule_group) =
  assoc_to_yojson
    [
      ( "StatefulRuleOptions",
        option_to_yojson stateful_rule_options_to_yojson x.stateful_rule_options );
      ("RulesSource", Some (rules_source_to_yojson x.rules_source));
      ("ReferenceSets", option_to_yojson reference_sets_to_yojson x.reference_sets);
      ("RuleVariables", option_to_yojson rule_variables_to_yojson x.rule_variables);
    ]

let update_rule_group_request_to_yojson (x : update_rule_group_request) =
  assoc_to_yojson
    [
      ( "SummaryConfiguration",
        option_to_yojson summary_configuration_to_yojson x.summary_configuration );
      ("AnalyzeRuleGroup", option_to_yojson boolean__to_yojson x.analyze_rule_group);
      ("SourceMetadata", option_to_yojson source_metadata_to_yojson x.source_metadata);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("Rules", option_to_yojson rules_string_to_yojson x.rules);
      ("RuleGroup", option_to_yojson rule_group_to_yojson x.rule_group);
      ("RuleGroupName", option_to_yojson resource_name_to_yojson x.rule_group_name);
      ("RuleGroupArn", option_to_yojson resource_arn_to_yojson x.rule_group_arn);
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let proxy_rule_phase_action_to_yojson (x : proxy_rule_phase_action) =
  match x with ALERT -> `String "ALERT" | DENY -> `String "DENY" | ALLOW -> `String "ALLOW"

let condition_operator_to_yojson = string_to_yojson
let condition_key_to_yojson = string_to_yojson
let proxy_condition_value_to_yojson = string_to_yojson
let proxy_condition_value_list_to_yojson tree = list_to_yojson proxy_condition_value_to_yojson tree

let proxy_rule_condition_to_yojson (x : proxy_rule_condition) =
  assoc_to_yojson
    [
      ("ConditionValues", option_to_yojson proxy_condition_value_list_to_yojson x.condition_values);
      ("ConditionKey", option_to_yojson condition_key_to_yojson x.condition_key);
      ("ConditionOperator", option_to_yojson condition_operator_to_yojson x.condition_operator);
    ]

let proxy_rule_condition_list_to_yojson tree = list_to_yojson proxy_rule_condition_to_yojson tree

let proxy_rule_to_yojson (x : proxy_rule) =
  assoc_to_yojson
    [
      ("Conditions", option_to_yojson proxy_rule_condition_list_to_yojson x.conditions);
      ("Action", option_to_yojson proxy_rule_phase_action_to_yojson x.action);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ProxyRuleName", option_to_yojson resource_name_to_yojson x.proxy_rule_name);
    ]

let update_proxy_rule_response_to_yojson (x : update_proxy_rule_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ( "RemovedConditions",
        option_to_yojson proxy_rule_condition_list_to_yojson x.removed_conditions );
      ("ProxyRule", option_to_yojson proxy_rule_to_yojson x.proxy_rule);
    ]

let update_proxy_rule_request_to_yojson (x : update_proxy_rule_request) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ("RemoveConditions", option_to_yojson proxy_rule_condition_list_to_yojson x.remove_conditions);
      ("AddConditions", option_to_yojson proxy_rule_condition_list_to_yojson x.add_conditions);
      ("Action", option_to_yojson proxy_rule_phase_action_to_yojson x.action);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ProxyRuleName", Some (resource_name_to_yojson x.proxy_rule_name));
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
    ]

let rule_group_request_phase_to_yojson (x : rule_group_request_phase) =
  match x with
  | POST_RES -> `String "POST_RES"
  | PRE_REQ -> `String "PRE_REQ"
  | PRE_DNS -> `String "PRE_DNS"

let insert_position_to_yojson = int_to_yojson

let proxy_rule_priority_to_yojson (x : proxy_rule_priority) =
  assoc_to_yojson
    [
      ("NewPosition", option_to_yojson insert_position_to_yojson x.new_position);
      ("ProxyRuleName", option_to_yojson resource_name_to_yojson x.proxy_rule_name);
    ]

let proxy_rule_priority_list_to_yojson tree = list_to_yojson proxy_rule_priority_to_yojson tree

let update_proxy_rule_priorities_response_to_yojson (x : update_proxy_rule_priorities_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("Rules", option_to_yojson proxy_rule_priority_list_to_yojson x.rules);
      ( "RuleGroupRequestPhase",
        option_to_yojson rule_group_request_phase_to_yojson x.rule_group_request_phase );
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
    ]

let update_proxy_rule_priorities_request_to_yojson (x : update_proxy_rule_priorities_request) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ("Rules", Some (proxy_rule_priority_list_to_yojson x.rules));
      ("RuleGroupRequestPhase", Some (rule_group_request_phase_to_yojson x.rule_group_request_phase));
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
    ]

let proxy_rule_group_priority_result_priority_to_yojson = int_to_yojson

let proxy_rule_group_priority_result_to_yojson (x : proxy_rule_group_priority_result) =
  assoc_to_yojson
    [
      ("Priority", option_to_yojson proxy_rule_group_priority_result_priority_to_yojson x.priority);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
    ]

let proxy_rule_group_priority_result_list_to_yojson tree =
  list_to_yojson proxy_rule_group_priority_result_to_yojson tree

let update_proxy_rule_group_priorities_response_to_yojson
    (x : update_proxy_rule_group_priorities_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ( "ProxyRuleGroups",
        option_to_yojson proxy_rule_group_priority_result_list_to_yojson x.proxy_rule_groups );
    ]

let proxy_rule_group_priority_to_yojson (x : proxy_rule_group_priority) =
  assoc_to_yojson
    [
      ("NewPosition", option_to_yojson insert_position_to_yojson x.new_position);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
    ]

let proxy_rule_group_priority_list_to_yojson tree =
  list_to_yojson proxy_rule_group_priority_to_yojson tree

let update_proxy_rule_group_priorities_request_to_yojson
    (x : update_proxy_rule_group_priorities_request) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ("RuleGroups", Some (proxy_rule_group_priority_list_to_yojson x.rule_groups));
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
    ]

let create_time_to_yojson = timestamp_epoch_seconds_to_yojson
let delete_time_to_yojson = timestamp_epoch_seconds_to_yojson
let failure_code_to_yojson = string_to_yojson
let failure_message_to_yojson = string_to_yojson

let proxy_state_to_yojson (x : proxy_state) =
  match x with
  | DETACH_FAILED -> `String "DETACH_FAILED"
  | ATTACH_FAILED -> `String "ATTACH_FAILED"
  | DETACHED -> `String "DETACHED"
  | DETACHING -> `String "DETACHING"
  | ATTACHED -> `String "ATTACHED"
  | ATTACHING -> `String "ATTACHING"

let proxy_modify_state_to_yojson (x : proxy_modify_state) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | MODIFYING -> `String "MODIFYING"

let nat_gateway_id_to_yojson = string_to_yojson
let nat_gateway_port_to_yojson = int_to_yojson

let listener_property_type_to_yojson (x : listener_property_type) =
  match x with HTTPS -> `String "HTTPS" | HTTP -> `String "HTTP"

let listener_property_to_yojson (x : listener_property) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson listener_property_type_to_yojson x.type_);
      ("Port", option_to_yojson nat_gateway_port_to_yojson x.port);
    ]

let listener_properties_to_yojson tree = list_to_yojson listener_property_to_yojson tree

let tls_intercept_mode_to_yojson (x : tls_intercept_mode) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let tls_intercept_properties_to_yojson (x : tls_intercept_properties) =
  assoc_to_yojson
    [
      ("TlsInterceptMode", option_to_yojson tls_intercept_mode_to_yojson x.tls_intercept_mode);
      ("PcaArn", option_to_yojson resource_arn_to_yojson x.pca_arn);
    ]

let proxy_to_yojson (x : proxy) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "TlsInterceptProperties",
        option_to_yojson tls_intercept_properties_to_yojson x.tls_intercept_properties );
      ("ListenerProperties", option_to_yojson listener_properties_to_yojson x.listener_properties);
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("NatGatewayId", option_to_yojson nat_gateway_id_to_yojson x.nat_gateway_id);
      ("ProxyModifyState", option_to_yojson proxy_modify_state_to_yojson x.proxy_modify_state);
      ("ProxyState", option_to_yojson proxy_state_to_yojson x.proxy_state);
      ("FailureMessage", option_to_yojson failure_message_to_yojson x.failure_message);
      ("FailureCode", option_to_yojson failure_code_to_yojson x.failure_code);
      ("UpdateTime", option_to_yojson update_time_to_yojson x.update_time);
      ("DeleteTime", option_to_yojson delete_time_to_yojson x.delete_time);
      ("CreateTime", option_to_yojson create_time_to_yojson x.create_time);
    ]

let update_proxy_response_to_yojson (x : update_proxy_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("Proxy", option_to_yojson proxy_to_yojson x.proxy);
    ]

let listener_property_request_to_yojson (x : listener_property_request) =
  assoc_to_yojson
    [
      ("Type", Some (listener_property_type_to_yojson x.type_));
      ("Port", Some (nat_gateway_port_to_yojson x.port));
    ]

let listener_properties_request_to_yojson tree =
  list_to_yojson listener_property_request_to_yojson tree

let tls_intercept_properties_request_to_yojson (x : tls_intercept_properties_request) =
  assoc_to_yojson
    [
      ("TlsInterceptMode", option_to_yojson tls_intercept_mode_to_yojson x.tls_intercept_mode);
      ("PcaArn", option_to_yojson resource_arn_to_yojson x.pca_arn);
    ]

let update_proxy_request_to_yojson (x : update_proxy_request) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ( "TlsInterceptProperties",
        option_to_yojson tls_intercept_properties_request_to_yojson x.tls_intercept_properties );
      ( "ListenerPropertiesToRemove",
        option_to_yojson listener_properties_request_to_yojson x.listener_properties_to_remove );
      ( "ListenerPropertiesToAdd",
        option_to_yojson listener_properties_request_to_yojson x.listener_properties_to_add );
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
      ("NatGatewayId", Some (nat_gateway_id_to_yojson x.nat_gateway_id));
    ]

let proxy_config_rule_group_type_to_yojson = string_to_yojson
let proxy_config_rule_group_priority_to_yojson = int_to_yojson

let proxy_config_rule_group_to_yojson (x : proxy_config_rule_group) =
  assoc_to_yojson
    [
      ("Priority", option_to_yojson proxy_config_rule_group_priority_to_yojson x.priority);
      ("Type", option_to_yojson proxy_config_rule_group_type_to_yojson x.type_);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
    ]

let proxy_config_rule_group_set_to_yojson tree =
  list_to_yojson proxy_config_rule_group_to_yojson tree

let proxy_config_default_rule_phase_actions_request_to_yojson
    (x : proxy_config_default_rule_phase_actions_request) =
  assoc_to_yojson
    [
      ("PostRESPONSE", option_to_yojson proxy_rule_phase_action_to_yojson x.post_respons_e);
      ("PreREQUEST", option_to_yojson proxy_rule_phase_action_to_yojson x.pre_reques_t);
      ("PreDNS", option_to_yojson proxy_rule_phase_action_to_yojson x.pre_dn_s);
    ]

let proxy_configuration_to_yojson (x : proxy_configuration) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DefaultRulePhaseActions",
        option_to_yojson proxy_config_default_rule_phase_actions_request_to_yojson
          x.default_rule_phase_actions );
      ("RuleGroups", option_to_yojson proxy_config_rule_group_set_to_yojson x.rule_groups);
      ("DeleteTime", option_to_yojson delete_time_to_yojson x.delete_time);
      ("CreateTime", option_to_yojson create_time_to_yojson x.create_time);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
    ]

let update_proxy_configuration_response_to_yojson (x : update_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
    ]

let update_proxy_configuration_request_to_yojson (x : update_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ( "DefaultRulePhaseActions",
        Some
          (proxy_config_default_rule_phase_actions_request_to_yojson x.default_rule_phase_actions)
      );
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
    ]

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let log_type_to_yojson (x : log_type) =
  match x with TLS -> `String "TLS" | FLOW -> `String "FLOW" | ALERT -> `String "ALERT"

let log_destination_type_to_yojson (x : log_destination_type) =
  match x with
  | KINESIS_DATA_FIREHOSE -> `String "KinesisDataFirehose"
  | CLOUDWATCH_LOGS -> `String "CloudWatchLogs"
  | S3 -> `String "S3"

let hash_map_value_to_yojson = string_to_yojson
let hash_map_key_to_yojson = string_to_yojson

let log_destination_map_to_yojson tree =
  map_to_yojson hash_map_key_to_yojson hash_map_value_to_yojson tree

let log_destination_config_to_yojson (x : log_destination_config) =
  assoc_to_yojson
    [
      ("LogDestination", Some (log_destination_map_to_yojson x.log_destination));
      ("LogDestinationType", Some (log_destination_type_to_yojson x.log_destination_type));
      ("LogType", Some (log_type_to_yojson x.log_type));
    ]

let log_destination_configs_to_yojson tree = list_to_yojson log_destination_config_to_yojson tree

let logging_configuration_to_yojson (x : logging_configuration) =
  assoc_to_yojson
    [
      ("LogDestinationConfigs", Some (log_destination_configs_to_yojson x.log_destination_configs));
    ]

let enable_monitoring_dashboard_to_yojson = bool_to_yojson

let update_logging_configuration_response_to_yojson (x : update_logging_configuration_response) =
  assoc_to_yojson
    [
      ( "EnableMonitoringDashboard",
        option_to_yojson enable_monitoring_dashboard_to_yojson x.enable_monitoring_dashboard );
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let update_logging_configuration_request_to_yojson (x : update_logging_configuration_request) =
  assoc_to_yojson
    [
      ( "EnableMonitoringDashboard",
        option_to_yojson enable_monitoring_dashboard_to_yojson x.enable_monitoring_dashboard );
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let log_destination_permission_exception_to_yojson (x : log_destination_permission_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let firewall_policy_response_to_yojson (x : firewall_policy_response) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson last_update_time_to_yojson x.last_modified_time);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "NumberOfAssociations",
        option_to_yojson number_of_associations_to_yojson x.number_of_associations );
      ( "ConsumedStatefulDomainCapacity",
        option_to_yojson rule_capacity_to_yojson x.consumed_stateful_domain_capacity );
      ( "ConsumedStatefulRuleCapacity",
        option_to_yojson rule_capacity_to_yojson x.consumed_stateful_rule_capacity );
      ( "ConsumedStatelessRuleCapacity",
        option_to_yojson rule_capacity_to_yojson x.consumed_stateless_rule_capacity );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("FirewallPolicyStatus", option_to_yojson resource_status_to_yojson x.firewall_policy_status);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("FirewallPolicyId", Some (resource_id_to_yojson x.firewall_policy_id));
      ("FirewallPolicyArn", Some (resource_arn_to_yojson x.firewall_policy_arn));
      ("FirewallPolicyName", Some (resource_name_to_yojson x.firewall_policy_name));
    ]

let update_firewall_policy_response_to_yojson (x : update_firewall_policy_response) =
  assoc_to_yojson
    [
      ( "FirewallPolicyResponse",
        Some (firewall_policy_response_to_yojson x.firewall_policy_response) );
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let stateless_rule_group_reference_to_yojson (x : stateless_rule_group_reference) =
  assoc_to_yojson
    [
      ("Priority", Some (priority_to_yojson x.priority));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let stateless_rule_group_references_to_yojson tree =
  list_to_yojson stateless_rule_group_reference_to_yojson tree

let override_action_to_yojson (x : override_action) =
  match x with DROP_TO_ALERT -> `String "DROP_TO_ALERT"

let stateful_rule_group_override_to_yojson (x : stateful_rule_group_override) =
  assoc_to_yojson [ ("Action", option_to_yojson override_action_to_yojson x.action) ]

let deep_threat_inspection_to_yojson = bool_to_yojson

let stateful_rule_group_reference_to_yojson (x : stateful_rule_group_reference) =
  assoc_to_yojson
    [
      ( "DeepThreatInspection",
        option_to_yojson deep_threat_inspection_to_yojson x.deep_threat_inspection );
      ("Override", option_to_yojson stateful_rule_group_override_to_yojson x.override);
      ("Priority", option_to_yojson priority_to_yojson x.priority);
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let stateful_rule_group_references_to_yojson tree =
  list_to_yojson stateful_rule_group_reference_to_yojson tree

let stateful_actions_to_yojson tree = list_to_yojson collection_member__string_to_yojson tree

let stream_exception_policy_to_yojson (x : stream_exception_policy) =
  match x with
  | REJECT -> `String "REJECT"
  | CONTINUE -> `String "CONTINUE"
  | DROP -> `String "DROP"

let tcp_idle_timeout_range_bound_to_yojson = int_to_yojson

let flow_timeouts_to_yojson (x : flow_timeouts) =
  assoc_to_yojson
    [
      ( "TcpIdleTimeoutSeconds",
        option_to_yojson tcp_idle_timeout_range_bound_to_yojson x.tcp_idle_timeout_seconds );
    ]

let stateful_engine_options_to_yojson (x : stateful_engine_options) =
  assoc_to_yojson
    [
      ("FlowTimeouts", option_to_yojson flow_timeouts_to_yojson x.flow_timeouts);
      ( "StreamExceptionPolicy",
        option_to_yojson stream_exception_policy_to_yojson x.stream_exception_policy );
      ("RuleOrder", option_to_yojson rule_order_to_yojson x.rule_order);
    ]

let policy_variables_to_yojson (x : policy_variables) =
  assoc_to_yojson [ ("RuleVariables", option_to_yojson ip_sets_to_yojson x.rule_variables) ]

let enable_tls_session_holding_to_yojson = bool_to_yojson

let firewall_policy_to_yojson (x : firewall_policy) =
  assoc_to_yojson
    [
      ( "EnableTLSSessionHolding",
        option_to_yojson enable_tls_session_holding_to_yojson x.enable_tls_session_holding );
      ("PolicyVariables", option_to_yojson policy_variables_to_yojson x.policy_variables);
      ( "TLSInspectionConfigurationArn",
        option_to_yojson resource_arn_to_yojson x.tls_inspection_configuration_arn );
      ( "StatefulEngineOptions",
        option_to_yojson stateful_engine_options_to_yojson x.stateful_engine_options );
      ( "StatefulDefaultActions",
        option_to_yojson stateful_actions_to_yojson x.stateful_default_actions );
      ( "StatefulRuleGroupReferences",
        option_to_yojson stateful_rule_group_references_to_yojson x.stateful_rule_group_references
      );
      ( "StatelessCustomActions",
        option_to_yojson custom_actions_to_yojson x.stateless_custom_actions );
      ( "StatelessFragmentDefaultActions",
        Some (stateless_actions_to_yojson x.stateless_fragment_default_actions) );
      ("StatelessDefaultActions", Some (stateless_actions_to_yojson x.stateless_default_actions));
      ( "StatelessRuleGroupReferences",
        option_to_yojson stateless_rule_group_references_to_yojson x.stateless_rule_group_references
      );
    ]

let update_firewall_policy_request_to_yojson (x : update_firewall_policy_request) =
  assoc_to_yojson
    [
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("FirewallPolicy", Some (firewall_policy_to_yojson x.firewall_policy));
      ("FirewallPolicyName", option_to_yojson resource_name_to_yojson x.firewall_policy_name);
      ("FirewallPolicyArn", option_to_yojson resource_arn_to_yojson x.firewall_policy_arn);
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let update_firewall_policy_change_protection_response_to_yojson
    (x : update_firewall_policy_change_protection_response) =
  assoc_to_yojson
    [
      ( "FirewallPolicyChangeProtection",
        option_to_yojson boolean__to_yojson x.firewall_policy_change_protection );
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_firewall_policy_change_protection_request_to_yojson
    (x : update_firewall_policy_change_protection_request) =
  assoc_to_yojson
    [
      ( "FirewallPolicyChangeProtection",
        Some (boolean__to_yojson x.firewall_policy_change_protection) );
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_firewall_encryption_configuration_response_to_yojson
    (x : update_firewall_encryption_configuration_response) =
  assoc_to_yojson
    [
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let update_firewall_encryption_configuration_request_to_yojson
    (x : update_firewall_encryption_configuration_request) =
  assoc_to_yojson
    [
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_firewall_description_response_to_yojson (x : update_firewall_description_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let update_firewall_description_request_to_yojson (x : update_firewall_description_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson description_to_yojson x.description);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_firewall_delete_protection_response_to_yojson
    (x : update_firewall_delete_protection_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("DeleteProtection", option_to_yojson boolean__to_yojson x.delete_protection);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let update_firewall_delete_protection_request_to_yojson
    (x : update_firewall_delete_protection_request) =
  assoc_to_yojson
    [
      ("DeleteProtection", Some (boolean__to_yojson x.delete_protection));
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let enabled_analysis_type_to_yojson (x : enabled_analysis_type) =
  match x with HTTP_HOST -> `String "HTTP_HOST" | TLS_SNI -> `String "TLS_SNI"

let enabled_analysis_types_to_yojson tree = list_to_yojson enabled_analysis_type_to_yojson tree

let update_firewall_analysis_settings_response_to_yojson
    (x : update_firewall_analysis_settings_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ( "EnabledAnalysisTypes",
        option_to_yojson enabled_analysis_types_to_yojson x.enabled_analysis_types );
    ]

let update_firewall_analysis_settings_request_to_yojson
    (x : update_firewall_analysis_settings_request) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ( "EnabledAnalysisTypes",
        option_to_yojson enabled_analysis_types_to_yojson x.enabled_analysis_types );
    ]

let container_monitoring_type_to_yojson (x : container_monitoring_type) =
  match x with EKS -> `String "EKS" | ECS -> `String "ECS"

let container_attribute_key_to_yojson = string_to_yojson
let container_attribute_value_to_yojson = string_to_yojson

let container_attribute_to_yojson (x : container_attribute) =
  assoc_to_yojson
    [
      ("Value", Some (container_attribute_value_to_yojson x.value));
      ("Key", Some (container_attribute_key_to_yojson x.key));
    ]

let container_attributes_to_yojson tree = list_to_yojson container_attribute_to_yojson tree

let container_monitoring_configuration_to_yojson (x : container_monitoring_configuration) =
  assoc_to_yojson
    [
      ("AttributeFilters", option_to_yojson container_attributes_to_yojson x.attribute_filters);
      ("ClusterArn", Some (resource_arn_to_yojson x.cluster_arn));
    ]

let container_monitoring_configurations_to_yojson tree =
  list_to_yojson container_monitoring_configuration_to_yojson tree

let container_association_status_to_yojson (x : container_association_status) =
  match x with
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"

let update_container_association_response_to_yojson (x : update_container_association_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Status", option_to_yojson container_association_status_to_yojson x.status);
      ( "ContainerMonitoringConfigurations",
        option_to_yojson container_monitoring_configurations_to_yojson
          x.container_monitoring_configurations );
      ("Type", option_to_yojson container_monitoring_type_to_yojson x.type_);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
    ]

let update_container_association_request_to_yojson (x : update_container_association_request) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ContainerMonitoringConfigurations",
        Some (container_monitoring_configurations_to_yojson x.container_monitoring_configurations)
      );
      ("Type", Some (container_monitoring_type_to_yojson x.type_));
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
    ]

let update_availability_zone_change_protection_response_to_yojson
    (x : update_availability_zone_change_protection_response) =
  assoc_to_yojson
    [
      ( "AvailabilityZoneChangeProtection",
        option_to_yojson boolean__to_yojson x.availability_zone_change_protection );
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let update_availability_zone_change_protection_request_to_yojson
    (x : update_availability_zone_change_protection_request) =
  assoc_to_yojson
    [
      ( "AvailabilityZoneChangeProtection",
        Some (boolean__to_yojson x.availability_zone_change_protection) );
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let count_to_yojson = int_to_yojson

let unique_sources_to_yojson (x : unique_sources) =
  assoc_to_yojson [ ("Count", option_to_yojson count_to_yojson x.count) ]

let transit_gateway_id_to_yojson = string_to_yojson
let transit_gateway_attachment_sync_state_message_to_yojson = string_to_yojson
let attachment_id_to_yojson = string_to_yojson

let transit_gateway_attachment_status_to_yojson (x : transit_gateway_attachment_status) =
  match x with
  | REJECTED -> `String "REJECTED"
  | REJECTING -> `String "REJECTING"
  | PENDING_ACCEPTANCE -> `String "PENDING_ACCEPTANCE"
  | READY -> `String "READY"
  | ERROR -> `String "ERROR"
  | FAILED -> `String "FAILED"
  | DELETED -> `String "DELETED"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"

let transit_gateway_attachment_sync_state_to_yojson (x : transit_gateway_attachment_sync_state) =
  assoc_to_yojson
    [
      ( "StatusMessage",
        option_to_yojson transit_gateway_attachment_sync_state_message_to_yojson x.status_message );
      ( "TransitGatewayAttachmentStatus",
        option_to_yojson transit_gateway_attachment_status_to_yojson
          x.transit_gateway_attachment_status );
      ("AttachmentId", option_to_yojson attachment_id_to_yojson x.attachment_id);
    ]

let transit_gateway_attachment_id_to_yojson = string_to_yojson
let tags_pagination_max_results_to_yojson = int_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let tls_inspection_configuration_metadata_to_yojson (x : tls_inspection_configuration_metadata) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let tls_inspection_configurations_to_yojson tree =
  list_to_yojson tls_inspection_configuration_metadata_to_yojson tree

let per_object_sync_status_to_yojson (x : per_object_sync_status) =
  match x with
  | DEPRECATED -> `String "DEPRECATED"
  | NOT_SUBSCRIBED -> `String "NOT_SUBSCRIBED"
  | CAPACITY_CONSTRAINED -> `String "CAPACITY_CONSTRAINED"
  | IN_SYNC -> `String "IN_SYNC"
  | PENDING -> `String "PENDING"

let per_object_status_to_yojson (x : per_object_status) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("SyncStatus", option_to_yojson per_object_sync_status_to_yojson x.sync_status);
    ]

let sync_state_config_to_yojson tree =
  map_to_yojson resource_name_to_yojson per_object_status_to_yojson tree

let sync_state_to_yojson (x : sync_state) =
  assoc_to_yojson
    [
      ("Config", option_to_yojson sync_state_config_to_yojson x.config);
      ("Attachment", option_to_yojson attachment_to_yojson x.attachment);
    ]

let sync_states_to_yojson tree = map_to_yojson availability_zone_to_yojson sync_state_to_yojson tree

let availability_zone_metadata_to_yojson (x : availability_zone_metadata) =
  assoc_to_yojson
    [ ("IPAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type) ]

let supported_availability_zones_to_yojson tree =
  map_to_yojson availability_zone_to_yojson availability_zone_metadata_to_yojson tree

let rule_summary_to_yojson (x : rule_summary) =
  assoc_to_yojson
    [
      ("Metadata", option_to_yojson collection_member__string_to_yojson x.metadata);
      ("Msg", option_to_yojson collection_member__string_to_yojson x.msg);
      ("SID", option_to_yojson collection_member__string_to_yojson x.si_d);
    ]

let rule_summaries_to_yojson tree = list_to_yojson rule_summary_to_yojson tree

let summary_to_yojson (x : summary) =
  assoc_to_yojson [ ("RuleSummaries", option_to_yojson rule_summaries_to_yojson x.rule_summaries) ]

let subscription_status_to_yojson (x : subscription_status) =
  match x with SUBSCRIBED -> `String "SUBSCRIBED" | NOT_SUBSCRIBED -> `String "NOT_SUBSCRIBED"

let subnet_mappings_to_yojson tree = list_to_yojson subnet_mapping_to_yojson tree
let status_to_yojson = string_to_yojson
let start_time_to_yojson = timestamp_epoch_seconds_to_yojson
let flow_operation_id_to_yojson = string_to_yojson

let flow_operation_status_to_yojson (x : flow_operation_status) =
  match x with
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"

let start_flow_flush_response_to_yojson (x : start_flow_flush_response) =
  assoc_to_yojson
    [
      ( "FlowOperationStatus",
        option_to_yojson flow_operation_status_to_yojson x.flow_operation_status );
      ("FlowOperationId", option_to_yojson flow_operation_id_to_yojson x.flow_operation_id);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let age_to_yojson = int_to_yojson
let protocol_string_to_yojson = string_to_yojson
let protocol_strings_to_yojson tree = list_to_yojson protocol_string_to_yojson tree

let flow_filter_to_yojson (x : flow_filter) =
  assoc_to_yojson
    [
      ("Protocols", option_to_yojson protocol_strings_to_yojson x.protocols);
      ("DestinationPort", option_to_yojson port_to_yojson x.destination_port);
      ("SourcePort", option_to_yojson port_to_yojson x.source_port);
      ("DestinationAddress", option_to_yojson address_to_yojson x.destination_address);
      ("SourceAddress", option_to_yojson address_to_yojson x.source_address);
    ]

let flow_filters_to_yojson tree = list_to_yojson flow_filter_to_yojson tree

let start_flow_flush_request_to_yojson (x : start_flow_flush_request) =
  assoc_to_yojson
    [
      ("FlowFilters", Some (flow_filters_to_yojson x.flow_filters));
      ("MinimumFlowAgeInSeconds", option_to_yojson age_to_yojson x.minimum_flow_age_in_seconds);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
    ]

let start_flow_capture_response_to_yojson (x : start_flow_capture_response) =
  assoc_to_yojson
    [
      ( "FlowOperationStatus",
        option_to_yojson flow_operation_status_to_yojson x.flow_operation_status );
      ("FlowOperationId", option_to_yojson flow_operation_id_to_yojson x.flow_operation_id);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let start_flow_capture_request_to_yojson (x : start_flow_capture_request) =
  assoc_to_yojson
    [
      ("FlowFilters", Some (flow_filters_to_yojson x.flow_filters));
      ("MinimumFlowAgeInSeconds", option_to_yojson age_to_yojson x.minimum_flow_age_in_seconds);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
    ]

let analysis_report_id_to_yojson = string_to_yojson

let start_analysis_report_response_to_yojson (x : start_analysis_report_response) =
  assoc_to_yojson [ ("AnalysisReportId", Some (analysis_report_id_to_yojson x.analysis_report_id)) ]

let start_analysis_report_request_to_yojson (x : start_analysis_report_request) =
  assoc_to_yojson
    [
      ("AnalysisType", Some (enabled_analysis_type_to_yojson x.analysis_type));
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
    ]

let rule_group_metadata_to_yojson (x : rule_group_metadata) =
  assoc_to_yojson
    [
      ("VendorName", option_to_yojson vendor_name_to_yojson x.vendor_name);
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let rule_groups_to_yojson tree = list_to_yojson rule_group_metadata_to_yojson tree
let resource_name_list_to_yojson tree = list_to_yojson resource_name_to_yojson tree

let resource_managed_type_to_yojson (x : resource_managed_type) =
  match x with
  | PARTNER_MANAGED -> `String "PARTNER_MANAGED"
  | ACTIVE_THREAT_DEFENSE -> `String "ACTIVE_THREAT_DEFENSE"
  | AWS_MANAGED_DOMAIN_LISTS -> `String "AWS_MANAGED_DOMAIN_LISTS"
  | AWS_MANAGED_THREAT_SIGNATURES -> `String "AWS_MANAGED_THREAT_SIGNATURES"

let resource_managed_status_to_yojson (x : resource_managed_status) =
  match x with ACCOUNT -> `String "ACCOUNT" | MANAGED -> `String "MANAGED"

let resource_arn_list_to_yojson tree = list_to_yojson resource_arn_to_yojson tree
let report_time_to_yojson = timestamp_epoch_seconds_to_yojson

let reject_network_firewall_transit_gateway_attachment_response_to_yojson
    (x : reject_network_firewall_transit_gateway_attachment_response) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentStatus",
        Some (transit_gateway_attachment_status_to_yojson x.transit_gateway_attachment_status) );
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
    ]

let reject_network_firewall_transit_gateway_attachment_request_to_yojson
    (x : reject_network_firewall_transit_gateway_attachment_request) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
    ]

let put_resource_policy_response_to_yojson = unit_to_yojson
let policy_string_to_yojson = string_to_yojson

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("Policy", Some (policy_string_to_yojson x.policy));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let invalid_resource_policy_exception_to_yojson (x : invalid_resource_policy_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let proxy_rule_list_to_yojson tree = list_to_yojson proxy_rule_to_yojson tree

let proxy_rules_by_request_phase_to_yojson (x : proxy_rules_by_request_phase) =
  assoc_to_yojson
    [
      ("PostRESPONSE", option_to_yojson proxy_rule_list_to_yojson x.post_respons_e);
      ("PreREQUEST", option_to_yojson proxy_rule_list_to_yojson x.pre_reques_t);
      ("PreDNS", option_to_yojson proxy_rule_list_to_yojson x.pre_dn_s);
    ]

let proxy_rule_group_metadata_to_yojson (x : proxy_rule_group_metadata) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let proxy_rule_groups_to_yojson tree = list_to_yojson proxy_rule_group_metadata_to_yojson tree

let proxy_rule_group_attachment_to_yojson (x : proxy_rule_group_attachment) =
  assoc_to_yojson
    [
      ("InsertPosition", option_to_yojson insert_position_to_yojson x.insert_position);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
    ]

let proxy_rule_group_attachment_list_to_yojson tree =
  list_to_yojson proxy_rule_group_attachment_to_yojson tree

let proxy_rule_group_to_yojson (x : proxy_rule_group) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Rules", option_to_yojson proxy_rules_by_request_phase_to_yojson x.rules);
      ("DeleteTime", option_to_yojson delete_time_to_yojson x.delete_time);
      ("CreateTime", option_to_yojson create_time_to_yojson x.create_time);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
    ]

let proxy_metadata_to_yojson (x : proxy_metadata) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let proxy_configuration_metadata_to_yojson (x : proxy_configuration_metadata) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let proxy_configurations_to_yojson tree = list_to_yojson proxy_configuration_metadata_to_yojson tree
let proxies_to_yojson tree = list_to_yojson proxy_metadata_to_yojson tree
let product_id_to_yojson = string_to_yojson
let private_dns_name_to_yojson = string_to_yojson
let pagination_token_to_yojson = string_to_yojson
let pagination_max_results_to_yojson = int_to_yojson
let packet_count_to_yojson = int_to_yojson

let list_vpc_endpoint_associations_response_to_yojson (x : list_vpc_endpoint_associations_response)
    =
  assoc_to_yojson
    [
      ( "VpcEndpointAssociations",
        option_to_yojson vpc_endpoint_associations_to_yojson x.vpc_endpoint_associations );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_vpc_endpoint_associations_request_to_yojson (x : list_vpc_endpoint_associations_request) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_tls_inspection_configurations_response_to_yojson
    (x : list_tls_inspection_configurations_response) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurations",
        option_to_yojson tls_inspection_configurations_to_yojson x.tls_inspection_configurations );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_tls_inspection_configurations_request_to_yojson
    (x : list_tls_inspection_configurations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("MaxResults", option_to_yojson tags_pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_rule_groups_response_to_yojson (x : list_rule_groups_response) =
  assoc_to_yojson
    [
      ("RuleGroups", option_to_yojson rule_groups_to_yojson x.rule_groups);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_rule_groups_request_to_yojson (x : list_rule_groups_request) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("SubscriptionStatus", option_to_yojson subscription_status_to_yojson x.subscription_status);
      ("ManagedType", option_to_yojson resource_managed_type_to_yojson x.managed_type);
      ("Scope", option_to_yojson resource_managed_status_to_yojson x.scope);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_proxy_rule_groups_response_to_yojson (x : list_proxy_rule_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ProxyRuleGroups", option_to_yojson proxy_rule_groups_to_yojson x.proxy_rule_groups);
    ]

let list_proxy_rule_groups_request_to_yojson (x : list_proxy_rule_groups_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_proxy_configurations_response_to_yojson (x : list_proxy_configurations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ProxyConfigurations", option_to_yojson proxy_configurations_to_yojson x.proxy_configurations);
    ]

let list_proxy_configurations_request_to_yojson (x : list_proxy_configurations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_proxies_response_to_yojson (x : list_proxies_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Proxies", option_to_yojson proxies_to_yojson x.proxies);
    ]

let list_proxies_request_to_yojson (x : list_proxies_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let flow_operation_type_to_yojson (x : flow_operation_type) =
  match x with FLOW_CAPTURE -> `String "FLOW_CAPTURE" | FLOW_FLUSH -> `String "FLOW_FLUSH"

let flow_request_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let flow_operation_metadata_to_yojson (x : flow_operation_metadata) =
  assoc_to_yojson
    [
      ( "FlowOperationStatus",
        option_to_yojson flow_operation_status_to_yojson x.flow_operation_status );
      ( "FlowRequestTimestamp",
        option_to_yojson flow_request_timestamp_to_yojson x.flow_request_timestamp );
      ("FlowOperationType", option_to_yojson flow_operation_type_to_yojson x.flow_operation_type);
      ("FlowOperationId", option_to_yojson flow_operation_id_to_yojson x.flow_operation_id);
    ]

let flow_operations_to_yojson tree = list_to_yojson flow_operation_metadata_to_yojson tree

let list_flow_operations_response_to_yojson (x : list_flow_operations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("FlowOperations", option_to_yojson flow_operations_to_yojson x.flow_operations);
    ]

let list_flow_operations_request_to_yojson (x : list_flow_operations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("FlowOperationType", option_to_yojson flow_operation_type_to_yojson x.flow_operation_type);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
    ]

let byte_count_to_yojson = long_to_yojson

let flow_to_yojson (x : flow) =
  assoc_to_yojson
    [
      ("ByteCount", option_to_yojson byte_count_to_yojson x.byte_count);
      ("PacketCount", option_to_yojson packet_count_to_yojson x.packet_count);
      ("Age", option_to_yojson age_to_yojson x.age);
      ("Protocol", option_to_yojson protocol_string_to_yojson x.protocol);
      ("DestinationPort", option_to_yojson port_to_yojson x.destination_port);
      ("SourcePort", option_to_yojson port_to_yojson x.source_port);
      ("DestinationAddress", option_to_yojson address_to_yojson x.destination_address);
      ("SourceAddress", option_to_yojson address_to_yojson x.source_address);
    ]

let flows_to_yojson tree = list_to_yojson flow_to_yojson tree

let list_flow_operation_results_response_to_yojson (x : list_flow_operation_results_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Flows", option_to_yojson flows_to_yojson x.flows);
      ( "FlowRequestTimestamp",
        option_to_yojson flow_request_timestamp_to_yojson x.flow_request_timestamp );
      ("StatusMessage", option_to_yojson status_reason_to_yojson x.status_message);
      ( "FlowOperationStatus",
        option_to_yojson flow_operation_status_to_yojson x.flow_operation_status );
      ("FlowOperationId", option_to_yojson flow_operation_id_to_yojson x.flow_operation_id);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let list_flow_operation_results_request_to_yojson (x : list_flow_operation_results_request) =
  assoc_to_yojson
    [
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("FlowOperationId", Some (flow_operation_id_to_yojson x.flow_operation_id));
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
    ]

let firewall_metadata_to_yojson (x : firewall_metadata) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentId",
        option_to_yojson transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id );
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
    ]

let firewalls_to_yojson tree = list_to_yojson firewall_metadata_to_yojson tree

let list_firewalls_response_to_yojson (x : list_firewalls_response) =
  assoc_to_yojson
    [
      ("Firewalls", option_to_yojson firewalls_to_yojson x.firewalls);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_firewalls_request_to_yojson (x : list_firewalls_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("VpcIds", option_to_yojson vpc_ids_to_yojson x.vpc_ids);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let firewall_policy_metadata_to_yojson (x : firewall_policy_metadata) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
    ]

let firewall_policies_to_yojson tree = list_to_yojson firewall_policy_metadata_to_yojson tree

let list_firewall_policies_response_to_yojson (x : list_firewall_policies_response) =
  assoc_to_yojson
    [
      ("FirewallPolicies", option_to_yojson firewall_policies_to_yojson x.firewall_policies);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_firewall_policies_request_to_yojson (x : list_firewall_policies_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let container_association_summary_to_yojson (x : container_association_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("Arn", option_to_yojson resource_arn_to_yojson x.arn);
    ]

let container_associations_to_yojson tree =
  list_to_yojson container_association_summary_to_yojson tree

let list_container_associations_response_to_yojson (x : list_container_associations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "ContainerAssociations",
        option_to_yojson container_associations_to_yojson x.container_associations );
    ]

let list_container_associations_request_to_yojson (x : list_container_associations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
    ]

let analysis_report_to_yojson (x : analysis_report) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_to_yojson x.status);
      ("ReportTime", option_to_yojson report_time_to_yojson x.report_time);
      ("AnalysisType", option_to_yojson enabled_analysis_type_to_yojson x.analysis_type);
      ("AnalysisReportId", option_to_yojson analysis_report_id_to_yojson x.analysis_report_id);
    ]

let analysis_reports_to_yojson tree = list_to_yojson analysis_report_to_yojson tree

let list_analysis_reports_response_to_yojson (x : list_analysis_reports_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AnalysisReports", option_to_yojson analysis_reports_to_yojson x.analysis_reports);
    ]

let list_analysis_reports_request_to_yojson (x : list_analysis_reports_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
    ]

let end_time_to_yojson = timestamp_epoch_seconds_to_yojson
let analysis_report_next_token_to_yojson = string_to_yojson
let first_accessed_to_yojson = timestamp_epoch_seconds_to_yojson
let last_accessed_to_yojson = timestamp_epoch_seconds_to_yojson
let domain_to_yojson = string_to_yojson

let hits_to_yojson (x : hits) =
  assoc_to_yojson [ ("Count", option_to_yojson count_to_yojson x.count) ]

let analysis_type_report_result_to_yojson (x : analysis_type_report_result) =
  assoc_to_yojson
    [
      ("UniqueSources", option_to_yojson unique_sources_to_yojson x.unique_sources);
      ("Hits", option_to_yojson hits_to_yojson x.hits);
      ("Domain", option_to_yojson domain_to_yojson x.domain);
      ("LastAccessed", option_to_yojson last_accessed_to_yojson x.last_accessed);
      ("FirstAccessed", option_to_yojson first_accessed_to_yojson x.first_accessed);
      ("Protocol", option_to_yojson collection_member__string_to_yojson x.protocol);
    ]

let analysis_report_results_to_yojson tree =
  list_to_yojson analysis_type_report_result_to_yojson tree

let get_analysis_report_results_response_to_yojson (x : get_analysis_report_results_response) =
  assoc_to_yojson
    [
      ( "AnalysisReportResults",
        option_to_yojson analysis_report_results_to_yojson x.analysis_report_results );
      ("NextToken", option_to_yojson analysis_report_next_token_to_yojson x.next_token);
      ("AnalysisType", option_to_yojson enabled_analysis_type_to_yojson x.analysis_type);
      ("ReportTime", option_to_yojson report_time_to_yojson x.report_time);
      ("EndTime", option_to_yojson end_time_to_yojson x.end_time);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
      ("Status", option_to_yojson status_to_yojson x.status);
    ]

let get_analysis_report_results_request_to_yojson (x : get_analysis_report_results_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson analysis_report_next_token_to_yojson x.next_token);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("AnalysisReportId", Some (analysis_report_id_to_yojson x.analysis_report_id));
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
    ]

let invalid_operation_exception_to_yojson (x : invalid_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let disassociate_subnets_response_to_yojson (x : disassociate_subnets_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("SubnetMappings", option_to_yojson subnet_mappings_to_yojson x.subnet_mappings);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let az_subnets_to_yojson tree = list_to_yojson az_subnet_to_yojson tree

let disassociate_subnets_request_to_yojson (x : disassociate_subnets_request) =
  assoc_to_yojson
    [
      ("SubnetIds", Some (az_subnets_to_yojson x.subnet_ids));
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let availability_zone_mapping_string_to_yojson = string_to_yojson

let availability_zone_mapping_to_yojson (x : availability_zone_mapping) =
  assoc_to_yojson
    [ ("AvailabilityZone", Some (availability_zone_mapping_string_to_yojson x.availability_zone)) ]

let availability_zone_mappings_to_yojson tree =
  list_to_yojson availability_zone_mapping_to_yojson tree

let disassociate_availability_zones_response_to_yojson
    (x : disassociate_availability_zones_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ( "AvailabilityZoneMappings",
        option_to_yojson availability_zone_mappings_to_yojson x.availability_zone_mappings );
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let disassociate_availability_zones_request_to_yojson (x : disassociate_availability_zones_request)
    =
  assoc_to_yojson
    [
      ( "AvailabilityZoneMappings",
        Some (availability_zone_mappings_to_yojson x.availability_zone_mappings) );
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let detach_rule_groups_from_proxy_configuration_response_to_yojson
    (x : detach_rule_groups_from_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
    ]

let detach_rule_groups_from_proxy_configuration_request_to_yojson
    (x : detach_rule_groups_from_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ("RuleGroupArns", option_to_yojson resource_arn_list_to_yojson x.rule_group_arns);
      ("RuleGroupNames", option_to_yojson resource_name_list_to_yojson x.rule_group_names);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
    ]

let describe_vpc_endpoint_association_response_to_yojson
    (x : describe_vpc_endpoint_association_response) =
  assoc_to_yojson
    [
      ( "VpcEndpointAssociationStatus",
        option_to_yojson vpc_endpoint_association_status_to_yojson x.vpc_endpoint_association_status
      );
      ( "VpcEndpointAssociation",
        option_to_yojson vpc_endpoint_association_to_yojson x.vpc_endpoint_association );
    ]

let describe_vpc_endpoint_association_request_to_yojson
    (x : describe_vpc_endpoint_association_request) =
  assoc_to_yojson
    [ ("VpcEndpointAssociationArn", Some (resource_arn_to_yojson x.vpc_endpoint_association_arn)) ]

let describe_tls_inspection_configuration_response_to_yojson
    (x : describe_tls_inspection_configuration_response) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationResponse",
        Some
          (tls_inspection_configuration_response_to_yojson x.tls_inspection_configuration_response)
      );
      ( "TLSInspectionConfiguration",
        option_to_yojson tls_inspection_configuration_to_yojson x.tls_inspection_configuration );
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let describe_tls_inspection_configuration_request_to_yojson
    (x : describe_tls_inspection_configuration_request) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationName",
        option_to_yojson resource_name_to_yojson x.tls_inspection_configuration_name );
      ( "TLSInspectionConfigurationArn",
        option_to_yojson resource_arn_to_yojson x.tls_inspection_configuration_arn );
    ]

let describe_rule_group_summary_response_to_yojson (x : describe_rule_group_summary_response) =
  assoc_to_yojson
    [
      ("Summary", option_to_yojson summary_to_yojson x.summary);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("RuleGroupName", Some (resource_name_to_yojson x.rule_group_name));
    ]

let describe_rule_group_summary_request_to_yojson (x : describe_rule_group_summary_request) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("RuleGroupArn", option_to_yojson resource_arn_to_yojson x.rule_group_arn);
      ("RuleGroupName", option_to_yojson resource_name_to_yojson x.rule_group_name);
    ]

let listing_name_to_yojson = string_to_yojson

let describe_rule_group_metadata_response_to_yojson (x : describe_rule_group_metadata_response) =
  assoc_to_yojson
    [
      ("ListingName", option_to_yojson listing_name_to_yojson x.listing_name);
      ("ProductId", option_to_yojson product_id_to_yojson x.product_id);
      ("VendorName", option_to_yojson vendor_name_to_yojson x.vendor_name);
      ("LastModifiedTime", option_to_yojson last_update_time_to_yojson x.last_modified_time);
      ( "StatefulRuleOptions",
        option_to_yojson stateful_rule_options_to_yojson x.stateful_rule_options );
      ("Capacity", option_to_yojson rule_capacity_to_yojson x.capacity);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("RuleGroupName", Some (resource_name_to_yojson x.rule_group_name));
      ("RuleGroupArn", Some (resource_arn_to_yojson x.rule_group_arn));
    ]

let describe_rule_group_metadata_request_to_yojson (x : describe_rule_group_metadata_request) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("RuleGroupArn", option_to_yojson resource_arn_to_yojson x.rule_group_arn);
      ("RuleGroupName", option_to_yojson resource_name_to_yojson x.rule_group_name);
    ]

let describe_rule_group_response_to_yojson (x : describe_rule_group_response) =
  assoc_to_yojson
    [
      ("RuleGroupResponse", Some (rule_group_response_to_yojson x.rule_group_response));
      ("RuleGroup", option_to_yojson rule_group_to_yojson x.rule_group);
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let describe_rule_group_request_to_yojson (x : describe_rule_group_request) =
  assoc_to_yojson
    [
      ("AnalyzeRuleGroup", option_to_yojson boolean__to_yojson x.analyze_rule_group);
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("RuleGroupArn", option_to_yojson resource_arn_to_yojson x.rule_group_arn);
      ("RuleGroupName", option_to_yojson resource_name_to_yojson x.rule_group_name);
    ]

let describe_resource_policy_response_to_yojson (x : describe_resource_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson policy_string_to_yojson x.policy) ]

let describe_resource_policy_request_to_yojson (x : describe_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let describe_proxy_rule_group_response_to_yojson (x : describe_proxy_rule_group_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("ProxyRuleGroup", option_to_yojson proxy_rule_group_to_yojson x.proxy_rule_group);
    ]

let describe_proxy_rule_group_request_to_yojson (x : describe_proxy_rule_group_request) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
    ]

let describe_proxy_rule_response_to_yojson (x : describe_proxy_rule_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("ProxyRule", option_to_yojson proxy_rule_to_yojson x.proxy_rule);
    ]

let describe_proxy_rule_request_to_yojson (x : describe_proxy_rule_request) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleName", Some (resource_name_to_yojson x.proxy_rule_name));
    ]

let describe_proxy_configuration_response_to_yojson (x : describe_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
    ]

let describe_proxy_configuration_request_to_yojson (x : describe_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
    ]

let describe_proxy_resource_to_yojson (x : describe_proxy_resource) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("FailureMessage", option_to_yojson failure_message_to_yojson x.failure_message);
      ("FailureCode", option_to_yojson failure_code_to_yojson x.failure_code);
      ("UpdateTime", option_to_yojson update_time_to_yojson x.update_time);
      ("DeleteTime", option_to_yojson delete_time_to_yojson x.delete_time);
      ("CreateTime", option_to_yojson create_time_to_yojson x.create_time);
      ("PrivateDNSName", option_to_yojson private_dns_name_to_yojson x.private_dns_name);
      ( "VpcEndpointServiceName",
        option_to_yojson vpc_endpoint_service_name_to_yojson x.vpc_endpoint_service_name );
      ( "TlsInterceptProperties",
        option_to_yojson tls_intercept_properties_to_yojson x.tls_intercept_properties );
      ("ListenerProperties", option_to_yojson listener_properties_to_yojson x.listener_properties);
      ("ProxyModifyState", option_to_yojson proxy_modify_state_to_yojson x.proxy_modify_state);
      ("ProxyState", option_to_yojson proxy_state_to_yojson x.proxy_state);
      ("NatGatewayId", option_to_yojson nat_gateway_id_to_yojson x.nat_gateway_id);
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
    ]

let describe_proxy_response_to_yojson (x : describe_proxy_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("Proxy", option_to_yojson describe_proxy_resource_to_yojson x.proxy);
    ]

let describe_proxy_request_to_yojson (x : describe_proxy_request) =
  assoc_to_yojson
    [
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
    ]

let describe_logging_configuration_response_to_yojson (x : describe_logging_configuration_response)
    =
  assoc_to_yojson
    [
      ( "EnableMonitoringDashboard",
        option_to_yojson enable_monitoring_dashboard_to_yojson x.enable_monitoring_dashboard );
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let describe_logging_configuration_request_to_yojson (x : describe_logging_configuration_request) =
  assoc_to_yojson
    [
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let flow_operation_to_yojson (x : flow_operation) =
  assoc_to_yojson
    [
      ("FlowFilters", option_to_yojson flow_filters_to_yojson x.flow_filters);
      ("MinimumFlowAgeInSeconds", option_to_yojson age_to_yojson x.minimum_flow_age_in_seconds);
    ]

let describe_flow_operation_response_to_yojson (x : describe_flow_operation_response) =
  assoc_to_yojson
    [
      ("FlowOperation", option_to_yojson flow_operation_to_yojson x.flow_operation);
      ( "FlowRequestTimestamp",
        option_to_yojson flow_request_timestamp_to_yojson x.flow_request_timestamp );
      ("StatusMessage", option_to_yojson status_reason_to_yojson x.status_message);
      ( "FlowOperationStatus",
        option_to_yojson flow_operation_status_to_yojson x.flow_operation_status );
      ("FlowOperationType", option_to_yojson flow_operation_type_to_yojson x.flow_operation_type);
      ("FlowOperationId", option_to_yojson flow_operation_id_to_yojson x.flow_operation_id);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let describe_flow_operation_request_to_yojson (x : describe_flow_operation_request) =
  assoc_to_yojson
    [
      ("FlowOperationId", Some (flow_operation_id_to_yojson x.flow_operation_id));
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ( "VpcEndpointAssociationArn",
        option_to_yojson resource_arn_to_yojson x.vpc_endpoint_association_arn );
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
    ]

let describe_firewall_policy_response_to_yojson (x : describe_firewall_policy_response) =
  assoc_to_yojson
    [
      ("FirewallPolicy", option_to_yojson firewall_policy_to_yojson x.firewall_policy);
      ( "FirewallPolicyResponse",
        Some (firewall_policy_response_to_yojson x.firewall_policy_response) );
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let describe_firewall_policy_request_to_yojson (x : describe_firewall_policy_request) =
  assoc_to_yojson
    [
      ("FirewallPolicyArn", option_to_yojson resource_arn_to_yojson x.firewall_policy_arn);
      ("FirewallPolicyName", option_to_yojson resource_name_to_yojson x.firewall_policy_name);
    ]

let describe_firewall_metadata_response_to_yojson (x : describe_firewall_metadata_response) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentId",
        option_to_yojson transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id );
      ( "SupportedAvailabilityZones",
        option_to_yojson supported_availability_zones_to_yojson x.supported_availability_zones );
      ("Status", option_to_yojson firewall_status_value_to_yojson x.status);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("FirewallPolicyArn", option_to_yojson resource_arn_to_yojson x.firewall_policy_arn);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let describe_firewall_metadata_request_to_yojson (x : describe_firewall_metadata_request) =
  assoc_to_yojson [ ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn) ]

let aws_account_id_to_yojson = string_to_yojson

let firewall_to_yojson (x : firewall) =
  assoc_to_yojson
    [
      ( "AvailabilityZoneChangeProtection",
        option_to_yojson boolean__to_yojson x.availability_zone_change_protection );
      ( "AvailabilityZoneMappings",
        option_to_yojson availability_zone_mappings_to_yojson x.availability_zone_mappings );
      ( "TransitGatewayOwnerAccountId",
        option_to_yojson aws_account_id_to_yojson x.transit_gateway_owner_account_id );
      ("TransitGatewayId", option_to_yojson transit_gateway_id_to_yojson x.transit_gateway_id);
      ( "EnabledAnalysisTypes",
        option_to_yojson enabled_analysis_types_to_yojson x.enabled_analysis_types );
      ( "NumberOfAssociations",
        option_to_yojson number_of_associations_to_yojson x.number_of_associations );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("FirewallId", Some (resource_id_to_yojson x.firewall_id));
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "FirewallPolicyChangeProtection",
        option_to_yojson boolean__to_yojson x.firewall_policy_change_protection );
      ("SubnetChangeProtection", option_to_yojson boolean__to_yojson x.subnet_change_protection);
      ("DeleteProtection", option_to_yojson boolean__to_yojson x.delete_protection);
      ("SubnetMappings", Some (subnet_mappings_to_yojson x.subnet_mappings));
      ("VpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("FirewallPolicyArn", Some (resource_arn_to_yojson x.firewall_policy_arn));
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
    ]

let configuration_sync_state_to_yojson (x : configuration_sync_state) =
  match x with
  | CAPACITY_CONSTRAINED -> `String "CAPACITY_CONSTRAINED"
  | IN_SYNC -> `String "IN_SYNC"
  | PENDING -> `String "PENDING"

let cidr_count_to_yojson = int_to_yojson

let ip_set_metadata_to_yojson (x : ip_set_metadata) =
  assoc_to_yojson
    [ ("ResolvedCIDRCount", option_to_yojson cidr_count_to_yojson x.resolved_cidr_count) ]

let ip_set_arn_to_yojson = string_to_yojson

let ip_set_metadata_map_to_yojson tree =
  map_to_yojson ip_set_arn_to_yojson ip_set_metadata_to_yojson tree

let cidr_summary_to_yojson (x : cidr_summary) =
  assoc_to_yojson
    [
      ("IPSetReferences", option_to_yojson ip_set_metadata_map_to_yojson x.ip_set_references);
      ("UtilizedCIDRCount", option_to_yojson cidr_count_to_yojson x.utilized_cidr_count);
      ("AvailableCIDRCount", option_to_yojson cidr_count_to_yojson x.available_cidr_count);
    ]

let capacity_usage_summary_to_yojson (x : capacity_usage_summary) =
  assoc_to_yojson [ ("CIDRs", option_to_yojson cidr_summary_to_yojson x.cid_rs) ]

let firewall_status_to_yojson (x : firewall_status) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentSyncState",
        option_to_yojson transit_gateway_attachment_sync_state_to_yojson
          x.transit_gateway_attachment_sync_state );
      ( "CapacityUsageSummary",
        option_to_yojson capacity_usage_summary_to_yojson x.capacity_usage_summary );
      ("SyncStates", option_to_yojson sync_states_to_yojson x.sync_states);
      ( "ConfigurationSyncStateSummary",
        Some (configuration_sync_state_to_yojson x.configuration_sync_state_summary) );
      ("Status", Some (firewall_status_value_to_yojson x.status));
    ]

let describe_firewall_response_to_yojson (x : describe_firewall_response) =
  assoc_to_yojson
    [
      ("FirewallStatus", option_to_yojson firewall_status_to_yojson x.firewall_status);
      ("Firewall", option_to_yojson firewall_to_yojson x.firewall);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let describe_firewall_request_to_yojson (x : describe_firewall_request) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
    ]

let container_association_last_updated_time_to_yojson = timestamp_epoch_seconds_to_yojson

let describe_container_association_response_to_yojson (x : describe_container_association_response)
    =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "LastUpdatedTime",
        option_to_yojson container_association_last_updated_time_to_yojson x.last_updated_time );
      ("ResolvedCidrCount", option_to_yojson cidr_count_to_yojson x.resolved_cidr_count);
      ("Status", option_to_yojson container_association_status_to_yojson x.status);
      ( "ContainerMonitoringConfigurations",
        option_to_yojson container_monitoring_configurations_to_yojson
          x.container_monitoring_configurations );
      ("Type", option_to_yojson container_monitoring_type_to_yojson x.type_);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
    ]

let describe_container_association_request_to_yojson (x : describe_container_association_request) =
  assoc_to_yojson
    [
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
    ]

let delete_vpc_endpoint_association_response_to_yojson
    (x : delete_vpc_endpoint_association_response) =
  assoc_to_yojson
    [
      ( "VpcEndpointAssociationStatus",
        option_to_yojson vpc_endpoint_association_status_to_yojson x.vpc_endpoint_association_status
      );
      ( "VpcEndpointAssociation",
        option_to_yojson vpc_endpoint_association_to_yojson x.vpc_endpoint_association );
    ]

let delete_vpc_endpoint_association_request_to_yojson (x : delete_vpc_endpoint_association_request)
    =
  assoc_to_yojson
    [ ("VpcEndpointAssociationArn", Some (resource_arn_to_yojson x.vpc_endpoint_association_arn)) ]

let delete_tls_inspection_configuration_response_to_yojson
    (x : delete_tls_inspection_configuration_response) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationResponse",
        Some
          (tls_inspection_configuration_response_to_yojson x.tls_inspection_configuration_response)
      );
    ]

let delete_tls_inspection_configuration_request_to_yojson
    (x : delete_tls_inspection_configuration_request) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationName",
        option_to_yojson resource_name_to_yojson x.tls_inspection_configuration_name );
      ( "TLSInspectionConfigurationArn",
        option_to_yojson resource_arn_to_yojson x.tls_inspection_configuration_arn );
    ]

let delete_rule_group_response_to_yojson (x : delete_rule_group_response) =
  assoc_to_yojson
    [ ("RuleGroupResponse", Some (rule_group_response_to_yojson x.rule_group_response)) ]

let delete_rule_group_request_to_yojson (x : delete_rule_group_request) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson rule_group_type_to_yojson x.type_);
      ("RuleGroupArn", option_to_yojson resource_arn_to_yojson x.rule_group_arn);
      ("RuleGroupName", option_to_yojson resource_name_to_yojson x.rule_group_name);
    ]

let delete_resource_policy_response_to_yojson = unit_to_yojson

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let delete_proxy_rules_response_to_yojson (x : delete_proxy_rules_response) =
  assoc_to_yojson
    [ ("ProxyRuleGroup", option_to_yojson proxy_rule_group_to_yojson x.proxy_rule_group) ]

let delete_proxy_rules_request_to_yojson (x : delete_proxy_rules_request) =
  assoc_to_yojson
    [
      ("Rules", Some (resource_name_list_to_yojson x.rules));
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
    ]

let delete_proxy_rule_group_response_to_yojson (x : delete_proxy_rule_group_response) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
    ]

let delete_proxy_rule_group_request_to_yojson (x : delete_proxy_rule_group_request) =
  assoc_to_yojson
    [
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
    ]

let delete_proxy_configuration_response_to_yojson (x : delete_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
    ]

let delete_proxy_configuration_request_to_yojson (x : delete_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
    ]

let delete_proxy_response_to_yojson (x : delete_proxy_response) =
  assoc_to_yojson
    [
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
      ("NatGatewayId", option_to_yojson nat_gateway_id_to_yojson x.nat_gateway_id);
    ]

let delete_proxy_request_to_yojson (x : delete_proxy_request) =
  assoc_to_yojson
    [
      ("ProxyArn", option_to_yojson resource_arn_to_yojson x.proxy_arn);
      ("ProxyName", option_to_yojson resource_name_to_yojson x.proxy_name);
      ("NatGatewayId", Some (nat_gateway_id_to_yojson x.nat_gateway_id));
    ]

let delete_network_firewall_transit_gateway_attachment_response_to_yojson
    (x : delete_network_firewall_transit_gateway_attachment_response) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentStatus",
        Some (transit_gateway_attachment_status_to_yojson x.transit_gateway_attachment_status) );
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
    ]

let delete_network_firewall_transit_gateway_attachment_request_to_yojson
    (x : delete_network_firewall_transit_gateway_attachment_request) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
    ]

let delete_firewall_policy_response_to_yojson (x : delete_firewall_policy_response) =
  assoc_to_yojson
    [
      ( "FirewallPolicyResponse",
        Some (firewall_policy_response_to_yojson x.firewall_policy_response) );
    ]

let delete_firewall_policy_request_to_yojson (x : delete_firewall_policy_request) =
  assoc_to_yojson
    [
      ("FirewallPolicyArn", option_to_yojson resource_arn_to_yojson x.firewall_policy_arn);
      ("FirewallPolicyName", option_to_yojson resource_name_to_yojson x.firewall_policy_name);
    ]

let delete_firewall_response_to_yojson (x : delete_firewall_response) =
  assoc_to_yojson
    [
      ("FirewallStatus", option_to_yojson firewall_status_to_yojson x.firewall_status);
      ("Firewall", option_to_yojson firewall_to_yojson x.firewall);
    ]

let delete_firewall_request_to_yojson (x : delete_firewall_request) =
  assoc_to_yojson
    [
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
    ]

let delete_container_association_response_to_yojson (x : delete_container_association_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson container_association_status_to_yojson x.status);
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
    ]

let delete_container_association_request_to_yojson (x : delete_container_association_request) =
  assoc_to_yojson
    [
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let insufficient_capacity_exception_to_yojson (x : insufficient_capacity_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_vpc_endpoint_association_response_to_yojson
    (x : create_vpc_endpoint_association_response) =
  assoc_to_yojson
    [
      ( "VpcEndpointAssociationStatus",
        option_to_yojson vpc_endpoint_association_status_to_yojson x.vpc_endpoint_association_status
      );
      ( "VpcEndpointAssociation",
        option_to_yojson vpc_endpoint_association_to_yojson x.vpc_endpoint_association );
    ]

let create_vpc_endpoint_association_request_to_yojson (x : create_vpc_endpoint_association_request)
    =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("SubnetMapping", Some (subnet_mapping_to_yojson x.subnet_mapping));
      ("VpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("FirewallArn", Some (resource_arn_to_yojson x.firewall_arn));
    ]

let create_tls_inspection_configuration_response_to_yojson
    (x : create_tls_inspection_configuration_response) =
  assoc_to_yojson
    [
      ( "TLSInspectionConfigurationResponse",
        Some
          (tls_inspection_configuration_response_to_yojson x.tls_inspection_configuration_response)
      );
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let create_tls_inspection_configuration_request_to_yojson
    (x : create_tls_inspection_configuration_request) =
  assoc_to_yojson
    [
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "TLSInspectionConfiguration",
        Some (tls_inspection_configuration_to_yojson x.tls_inspection_configuration) );
      ( "TLSInspectionConfigurationName",
        Some (resource_name_to_yojson x.tls_inspection_configuration_name) );
    ]

let create_rule_group_response_to_yojson (x : create_rule_group_response) =
  assoc_to_yojson
    [
      ("RuleGroupResponse", Some (rule_group_response_to_yojson x.rule_group_response));
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let create_rule_group_request_to_yojson (x : create_rule_group_request) =
  assoc_to_yojson
    [
      ( "SummaryConfiguration",
        option_to_yojson summary_configuration_to_yojson x.summary_configuration );
      ("AnalyzeRuleGroup", option_to_yojson boolean__to_yojson x.analyze_rule_group);
      ("SourceMetadata", option_to_yojson source_metadata_to_yojson x.source_metadata);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Capacity", Some (rule_capacity_to_yojson x.capacity));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Type", Some (rule_group_type_to_yojson x.type_));
      ("Rules", option_to_yojson rules_string_to_yojson x.rules);
      ("RuleGroup", option_to_yojson rule_group_to_yojson x.rule_group);
      ("RuleGroupName", Some (resource_name_to_yojson x.rule_group_name));
    ]

let create_proxy_rules_response_to_yojson (x : create_proxy_rules_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("ProxyRuleGroup", option_to_yojson proxy_rule_group_to_yojson x.proxy_rule_group);
    ]

let create_proxy_rule_to_yojson (x : create_proxy_rule) =
  assoc_to_yojson
    [
      ("InsertPosition", option_to_yojson insert_position_to_yojson x.insert_position);
      ("Conditions", option_to_yojson proxy_rule_condition_list_to_yojson x.conditions);
      ("Action", option_to_yojson proxy_rule_phase_action_to_yojson x.action);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ProxyRuleName", option_to_yojson resource_name_to_yojson x.proxy_rule_name);
    ]

let create_proxy_rule_list_to_yojson tree = list_to_yojson create_proxy_rule_to_yojson tree

let create_proxy_rules_by_request_phase_to_yojson (x : create_proxy_rules_by_request_phase) =
  assoc_to_yojson
    [
      ("PostRESPONSE", option_to_yojson create_proxy_rule_list_to_yojson x.post_respons_e);
      ("PreREQUEST", option_to_yojson create_proxy_rule_list_to_yojson x.pre_reques_t);
      ("PreDNS", option_to_yojson create_proxy_rule_list_to_yojson x.pre_dn_s);
    ]

let create_proxy_rules_request_to_yojson (x : create_proxy_rules_request) =
  assoc_to_yojson
    [
      ("Rules", Some (create_proxy_rules_by_request_phase_to_yojson x.rules));
      ("ProxyRuleGroupName", option_to_yojson resource_name_to_yojson x.proxy_rule_group_name);
      ("ProxyRuleGroupArn", option_to_yojson resource_arn_to_yojson x.proxy_rule_group_arn);
    ]

let create_proxy_rule_group_response_to_yojson (x : create_proxy_rule_group_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("ProxyRuleGroup", option_to_yojson proxy_rule_group_to_yojson x.proxy_rule_group);
    ]

let create_proxy_rule_group_request_to_yojson (x : create_proxy_rule_group_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Rules", option_to_yojson proxy_rules_by_request_phase_to_yojson x.rules);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ProxyRuleGroupName", Some (resource_name_to_yojson x.proxy_rule_group_name));
    ]

let create_proxy_configuration_response_to_yojson (x : create_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
    ]

let create_proxy_configuration_request_to_yojson (x : create_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DefaultRulePhaseActions",
        Some
          (proxy_config_default_rule_phase_actions_request_to_yojson x.default_rule_phase_actions)
      );
      ("RuleGroupArns", option_to_yojson resource_arn_list_to_yojson x.rule_group_arns);
      ("RuleGroupNames", option_to_yojson resource_name_list_to_yojson x.rule_group_names);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ProxyConfigurationName", Some (resource_name_to_yojson x.proxy_configuration_name));
    ]

let create_proxy_response_to_yojson (x : create_proxy_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("Proxy", option_to_yojson proxy_to_yojson x.proxy);
    ]

let create_proxy_request_to_yojson (x : create_proxy_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "TlsInterceptProperties",
        Some (tls_intercept_properties_request_to_yojson x.tls_intercept_properties) );
      ( "ListenerProperties",
        option_to_yojson listener_properties_request_to_yojson x.listener_properties );
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
      ("NatGatewayId", Some (nat_gateway_id_to_yojson x.nat_gateway_id));
      ("ProxyName", Some (resource_name_to_yojson x.proxy_name));
    ]

let create_firewall_policy_response_to_yojson (x : create_firewall_policy_response) =
  assoc_to_yojson
    [
      ( "FirewallPolicyResponse",
        Some (firewall_policy_response_to_yojson x.firewall_policy_response) );
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
    ]

let create_firewall_policy_request_to_yojson (x : create_firewall_policy_request) =
  assoc_to_yojson
    [
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("FirewallPolicy", Some (firewall_policy_to_yojson x.firewall_policy));
      ("FirewallPolicyName", Some (resource_name_to_yojson x.firewall_policy_name));
    ]

let create_firewall_response_to_yojson (x : create_firewall_response) =
  assoc_to_yojson
    [
      ("FirewallStatus", option_to_yojson firewall_status_to_yojson x.firewall_status);
      ("Firewall", option_to_yojson firewall_to_yojson x.firewall);
    ]

let create_firewall_request_to_yojson (x : create_firewall_request) =
  assoc_to_yojson
    [
      ( "AvailabilityZoneChangeProtection",
        option_to_yojson boolean__to_yojson x.availability_zone_change_protection );
      ( "AvailabilityZoneMappings",
        option_to_yojson availability_zone_mappings_to_yojson x.availability_zone_mappings );
      ("TransitGatewayId", option_to_yojson transit_gateway_id_to_yojson x.transit_gateway_id);
      ( "EnabledAnalysisTypes",
        option_to_yojson enabled_analysis_types_to_yojson x.enabled_analysis_types );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "FirewallPolicyChangeProtection",
        option_to_yojson boolean__to_yojson x.firewall_policy_change_protection );
      ("SubnetChangeProtection", option_to_yojson boolean__to_yojson x.subnet_change_protection);
      ("DeleteProtection", option_to_yojson boolean__to_yojson x.delete_protection);
      ("SubnetMappings", option_to_yojson subnet_mappings_to_yojson x.subnet_mappings);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("FirewallPolicyArn", Some (resource_arn_to_yojson x.firewall_policy_arn));
      ("FirewallName", Some (resource_name_to_yojson x.firewall_name));
    ]

let create_container_association_response_to_yojson (x : create_container_association_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Status", option_to_yojson container_association_status_to_yojson x.status);
      ( "ContainerMonitoringConfigurations",
        option_to_yojson container_monitoring_configurations_to_yojson
          x.container_monitoring_configurations );
      ("Type", option_to_yojson container_monitoring_type_to_yojson x.type_);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "ContainerAssociationArn",
        option_to_yojson resource_arn_to_yojson x.container_association_arn );
      ( "ContainerAssociationName",
        option_to_yojson resource_name_to_yojson x.container_association_name );
    ]

let create_container_association_request_to_yojson (x : create_container_association_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ContainerMonitoringConfigurations",
        Some (container_monitoring_configurations_to_yojson x.container_monitoring_configurations)
      );
      ("Type", Some (container_monitoring_type_to_yojson x.type_));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ContainerAssociationName", Some (resource_name_to_yojson x.container_association_name));
    ]

let attach_rule_groups_to_proxy_configuration_response_to_yojson
    (x : attach_rule_groups_to_proxy_configuration_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("ProxyConfiguration", option_to_yojson proxy_configuration_to_yojson x.proxy_configuration);
    ]

let attach_rule_groups_to_proxy_configuration_request_to_yojson
    (x : attach_rule_groups_to_proxy_configuration_request) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (update_token_to_yojson x.update_token));
      ("RuleGroups", Some (proxy_rule_group_attachment_list_to_yojson x.rule_groups));
      ("ProxyConfigurationArn", option_to_yojson resource_arn_to_yojson x.proxy_configuration_arn);
      ("ProxyConfigurationName", option_to_yojson resource_name_to_yojson x.proxy_configuration_name);
    ]

let associate_subnets_response_to_yojson (x : associate_subnets_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("SubnetMappings", option_to_yojson subnet_mappings_to_yojson x.subnet_mappings);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let associate_subnets_request_to_yojson (x : associate_subnets_request) =
  assoc_to_yojson
    [
      ("SubnetMappings", Some (subnet_mappings_to_yojson x.subnet_mappings));
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let associate_firewall_policy_response_to_yojson (x : associate_firewall_policy_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ("FirewallPolicyArn", option_to_yojson resource_arn_to_yojson x.firewall_policy_arn);
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let associate_firewall_policy_request_to_yojson (x : associate_firewall_policy_request) =
  assoc_to_yojson
    [
      ("FirewallPolicyArn", Some (resource_arn_to_yojson x.firewall_policy_arn));
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let associate_availability_zones_response_to_yojson (x : associate_availability_zones_response) =
  assoc_to_yojson
    [
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
      ( "AvailabilityZoneMappings",
        option_to_yojson availability_zone_mappings_to_yojson x.availability_zone_mappings );
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
    ]

let associate_availability_zones_request_to_yojson (x : associate_availability_zones_request) =
  assoc_to_yojson
    [
      ( "AvailabilityZoneMappings",
        Some (availability_zone_mappings_to_yojson x.availability_zone_mappings) );
      ("FirewallName", option_to_yojson resource_name_to_yojson x.firewall_name);
      ("FirewallArn", option_to_yojson resource_arn_to_yojson x.firewall_arn);
      ("UpdateToken", option_to_yojson update_token_to_yojson x.update_token);
    ]

let accept_network_firewall_transit_gateway_attachment_response_to_yojson
    (x : accept_network_firewall_transit_gateway_attachment_response) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentStatus",
        Some (transit_gateway_attachment_status_to_yojson x.transit_gateway_attachment_status) );
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
    ]

let accept_network_firewall_transit_gateway_attachment_request_to_yojson
    (x : accept_network_firewall_transit_gateway_attachment_request) =
  assoc_to_yojson
    [
      ( "TransitGatewayAttachmentId",
        Some (transit_gateway_attachment_id_to_yojson x.transit_gateway_attachment_id) );
    ]
