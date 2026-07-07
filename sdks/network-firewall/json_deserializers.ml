open Smaws_Lib.Json.DeserializeHelpers
open Types

let vpc_id_of_yojson = string_of_yojson
let vpc_ids_of_yojson tree path = list_of_yojson vpc_id_of_yojson tree path
let vpc_endpoint_service_name_of_yojson = string_of_yojson
let vpc_endpoint_id_of_yojson = string_of_yojson
let resource_arn_of_yojson = string_of_yojson

let vpc_endpoint_association_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_association_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "VpcEndpointAssociationArn")
         _list path;
   }
    : vpc_endpoint_association_metadata)

let vpc_endpoint_associations_of_yojson tree path =
  list_of_yojson vpc_endpoint_association_metadata_of_yojson tree path

let firewall_status_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "READY" -> READY
    | `String "DELETING" -> DELETING
    | `String "PROVISIONING" -> PROVISIONING
    | `String value -> raise (deserialize_unknown_enum_value_error path "FirewallStatusValue" value)
    | _ -> raise (deserialize_wrong_type_error path "FirewallStatusValue")
     : firewall_status_value)
    : firewall_status_value)

let az_subnet_of_yojson = string_of_yojson
let endpoint_id_of_yojson = string_of_yojson

let attachment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "READY" -> READY
    | `String "SCALING" -> SCALING
    | `String "ERROR" -> ERROR
    | `String "FAILED" -> FAILED
    | `String "DELETING" -> DELETING
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttachmentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AttachmentStatus")
     : attachment_status)
    : attachment_status)

let status_message_of_yojson = string_of_yojson

let attachment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     status = option_of_yojson (value_for_key attachment_status_of_yojson "Status") _list path;
     endpoint_id = option_of_yojson (value_for_key endpoint_id_of_yojson "EndpointId") _list path;
     subnet_id = option_of_yojson (value_for_key az_subnet_of_yojson "SubnetId") _list path;
   }
    : attachment)

let az_sync_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ attachment = option_of_yojson (value_for_key attachment_of_yojson "Attachment") _list path }
    : az_sync_state)

let availability_zone_of_yojson = string_of_yojson

let association_sync_state_of_yojson tree path =
  map_of_yojson availability_zone_of_yojson az_sync_state_of_yojson tree path

let vpc_endpoint_association_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_sync_state =
       option_of_yojson
         (value_for_key association_sync_state_of_yojson "AssociationSyncState")
         _list path;
     status = value_for_key firewall_status_value_of_yojson "Status" _list path;
   }
    : vpc_endpoint_association_status)

let resource_id_of_yojson = string_of_yojson
let collection_member__string_of_yojson = string_of_yojson

let ip_address_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPV6" -> IPV6
    | `String "IPV4" -> IPV4
    | `String "DUALSTACK" -> DUALSTACK
    | `String value -> raise (deserialize_unknown_enum_value_error path "IPAddressType" value)
    | _ -> raise (deserialize_wrong_type_error path "IPAddressType")
     : ip_address_type)
    : ip_address_type)

let subnet_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IPAddressType") _list path;
     subnet_id = value_for_key collection_member__string_of_yojson "SubnetId" _list path;
   }
    : subnet_mapping)

let description_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let vpc_endpoint_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     subnet_mapping = value_for_key subnet_mapping_of_yojson "SubnetMapping" _list path;
     vpc_id = value_for_key vpc_id_of_yojson "VpcId" _list path;
     firewall_arn = value_for_key resource_arn_of_yojson "FirewallArn" _list path;
     vpc_endpoint_association_arn =
       value_for_key resource_arn_of_yojson "VpcEndpointAssociationArn" _list path;
     vpc_endpoint_association_id =
       option_of_yojson (value_for_key resource_id_of_yojson "VpcEndpointAssociationId") _list path;
   }
    : vpc_endpoint_association)

let vendor_name_of_yojson = string_of_yojson
let variable_definition_of_yojson = string_of_yojson

let variable_definition_list_of_yojson tree path =
  list_of_yojson variable_definition_of_yojson tree path

let update_token_of_yojson = string_of_yojson
let update_time_of_yojson = timestamp_epoch_seconds_of_yojson
let resource_name_of_yojson = string_of_yojson

let resource_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceStatus")
     : resource_status)
    : resource_status)

let last_update_time_of_yojson = timestamp_epoch_seconds_of_yojson
let number_of_associations_of_yojson = int_of_yojson
let key_id_of_yojson = string_of_yojson

let encryption_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_OWNED_KMS_KEY" -> AWS_OWNED_KMS_KEY
    | `String "CUSTOMER_KMS" -> CUSTOMER_KMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionType")
     : encryption_type)
    : encryption_type)

let encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key encryption_type_of_yojson "Type" _list path;
     key_id = option_of_yojson (value_for_key key_id_of_yojson "KeyId") _list path;
   }
    : encryption_configuration)

let status_reason_of_yojson = string_of_yojson

let tls_certificate_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_message =
       option_of_yojson (value_for_key status_reason_of_yojson "StatusMessage") _list path;
     status =
       option_of_yojson (value_for_key collection_member__string_of_yojson "Status") _list path;
     certificate_serial =
       option_of_yojson
         (value_for_key collection_member__string_of_yojson "CertificateSerial")
         _list path;
     certificate_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "CertificateArn") _list path;
   }
    : tls_certificate_data)

let certificates_of_yojson tree path = list_of_yojson tls_certificate_data_of_yojson tree path

let tls_inspection_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_authority =
       option_of_yojson
         (value_for_key tls_certificate_data_of_yojson "CertificateAuthority")
         _list path;
     certificates =
       option_of_yojson (value_for_key certificates_of_yojson "Certificates") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     number_of_associations =
       option_of_yojson
         (value_for_key number_of_associations_of_yojson "NumberOfAssociations")
         _list path;
     last_modified_time =
       option_of_yojson (value_for_key last_update_time_of_yojson "LastModifiedTime") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     tls_inspection_configuration_status =
       option_of_yojson
         (value_for_key resource_status_of_yojson "TLSInspectionConfigurationStatus")
         _list path;
     tls_inspection_configuration_id =
       value_for_key resource_id_of_yojson "TLSInspectionConfigurationId" _list path;
     tls_inspection_configuration_name =
       value_for_key resource_name_of_yojson "TLSInspectionConfigurationName" _list path;
     tls_inspection_configuration_arn =
       value_for_key resource_arn_of_yojson "TLSInspectionConfigurationArn" _list path;
   }
    : tls_inspection_configuration_response)

let update_tls_inspection_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tls_inspection_configuration_response =
       value_for_key tls_inspection_configuration_response_of_yojson
         "TLSInspectionConfigurationResponse" _list path;
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
   }
    : update_tls_inspection_configuration_response)

let server_certificate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn") _list path;
   }
    : server_certificate)

let server_certificates_of_yojson tree path = list_of_yojson server_certificate_of_yojson tree path
let address_definition_of_yojson = string_of_yojson

let address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_definition = value_for_key address_definition_of_yojson "AddressDefinition" _list path;
   }
    : address)

let addresses_of_yojson tree path = list_of_yojson address_of_yojson tree path
let port_range_bound_of_yojson = int_of_yojson

let port_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     to_port = value_for_key port_range_bound_of_yojson "ToPort" _list path;
     from_port = value_for_key port_range_bound_of_yojson "FromPort" _list path;
   }
    : port_range)

let port_ranges_of_yojson tree path = list_of_yojson port_range_of_yojson tree path
let protocol_number_of_yojson = int_of_yojson
let protocol_numbers_of_yojson tree path = list_of_yojson protocol_number_of_yojson tree path

let server_certificate_scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protocols = option_of_yojson (value_for_key protocol_numbers_of_yojson "Protocols") _list path;
     destination_ports =
       option_of_yojson (value_for_key port_ranges_of_yojson "DestinationPorts") _list path;
     source_ports = option_of_yojson (value_for_key port_ranges_of_yojson "SourcePorts") _list path;
     destinations = option_of_yojson (value_for_key addresses_of_yojson "Destinations") _list path;
     sources = option_of_yojson (value_for_key addresses_of_yojson "Sources") _list path;
   }
    : server_certificate_scope)

let server_certificate_scopes_of_yojson tree path =
  list_of_yojson server_certificate_scope_of_yojson tree path

let revocation_check_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "REJECT" -> REJECT
    | `String "DROP" -> DROP
    | `String "PASS" -> PASS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RevocationCheckAction" value)
    | _ -> raise (deserialize_wrong_type_error path "RevocationCheckAction")
     : revocation_check_action)
    : revocation_check_action)

let check_certificate_revocation_status_actions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unknown_status_action =
       option_of_yojson
         (value_for_key revocation_check_action_of_yojson "UnknownStatusAction")
         _list path;
     revoked_status_action =
       option_of_yojson
         (value_for_key revocation_check_action_of_yojson "RevokedStatusAction")
         _list path;
   }
    : check_certificate_revocation_status_actions)

let server_certificate_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     check_certificate_revocation_status =
       option_of_yojson
         (value_for_key check_certificate_revocation_status_actions_of_yojson
            "CheckCertificateRevocationStatus")
         _list path;
     certificate_authority_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "CertificateAuthorityArn") _list path;
     scopes =
       option_of_yojson (value_for_key server_certificate_scopes_of_yojson "Scopes") _list path;
     server_certificates =
       option_of_yojson
         (value_for_key server_certificates_of_yojson "ServerCertificates")
         _list path;
   }
    : server_certificate_configuration)

let server_certificate_configurations_of_yojson tree path =
  list_of_yojson server_certificate_configuration_of_yojson tree path

let tls_inspection_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_certificate_configurations =
       option_of_yojson
         (value_for_key server_certificate_configurations_of_yojson
            "ServerCertificateConfigurations")
         _list path;
   }
    : tls_inspection_configuration)

let update_tls_inspection_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     tls_inspection_configuration =
       value_for_key tls_inspection_configuration_of_yojson "TLSInspectionConfiguration" _list path;
     tls_inspection_configuration_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "TLSInspectionConfigurationName")
         _list path;
     tls_inspection_configuration_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "TLSInspectionConfigurationArn")
         _list path;
   }
    : update_tls_inspection_configuration_request)

let error_message_of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let invalid_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_token_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_request_exception)

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_server_error)

let boolean__of_yojson = bool_of_yojson

let update_subnet_change_protection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_change_protection =
       option_of_yojson (value_for_key boolean__of_yojson "SubnetChangeProtection") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : update_subnet_change_protection_response)

let update_subnet_change_protection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_change_protection = value_for_key boolean__of_yojson "SubnetChangeProtection" _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : update_subnet_change_protection_request)

let resource_owner_check_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_owner_check_exception)

let rule_group_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STATEFUL_DOMAIN" -> STATEFUL_DOMAIN
    | `String "STATEFUL" -> STATEFUL
    | `String "STATELESS" -> STATELESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleGroupType" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleGroupType")
     : rule_group_type)
    : rule_group_type)

let rule_capacity_of_yojson = int_of_yojson

let source_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_update_token =
       option_of_yojson (value_for_key update_token_of_yojson "SourceUpdateToken") _list path;
     source_arn = option_of_yojson (value_for_key resource_arn_of_yojson "SourceArn") _list path;
   }
    : source_metadata)

let rule_id_list_of_yojson tree path = list_of_yojson collection_member__string_of_yojson tree path

let identified_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STATELESS_RULE_CONTAINS_TCP_FLAGS" -> STATELESS_RULE_CONTAINS_TCP_FLAGS
    | `String "STATELESS_RULE_FORWARDING_ASYMMETRICALLY" -> STATELESS_RULE_FORWARDING_ASYMMETRICALLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "IdentifiedType" value)
    | _ -> raise (deserialize_wrong_type_error path "IdentifiedType")
     : identified_type)
    : identified_type)

let analysis_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis_detail =
       option_of_yojson
         (value_for_key collection_member__string_of_yojson "AnalysisDetail")
         _list path;
     identified_type =
       option_of_yojson (value_for_key identified_type_of_yojson "IdentifiedType") _list path;
     identified_rule_ids =
       option_of_yojson (value_for_key rule_id_list_of_yojson "IdentifiedRuleIds") _list path;
   }
    : analysis_result)

let analysis_result_list_of_yojson tree path = list_of_yojson analysis_result_of_yojson tree path

let summary_rule_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "METADATA" -> METADATA
    | `String "MSG" -> MSG
    | `String "SID" -> SID
    | `String value -> raise (deserialize_unknown_enum_value_error path "SummaryRuleOption" value)
    | _ -> raise (deserialize_wrong_type_error path "SummaryRuleOption")
     : summary_rule_option)
    : summary_rule_option)

let summary_rule_options_of_yojson tree path =
  list_of_yojson summary_rule_option_of_yojson tree path

let summary_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_options =
       option_of_yojson (value_for_key summary_rule_options_of_yojson "RuleOptions") _list path;
   }
    : summary_configuration)

let rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary_configuration =
       option_of_yojson
         (value_for_key summary_configuration_of_yojson "SummaryConfiguration")
         _list path;
     analysis_results =
       option_of_yojson (value_for_key analysis_result_list_of_yojson "AnalysisResults") _list path;
     last_modified_time =
       option_of_yojson (value_for_key last_update_time_of_yojson "LastModifiedTime") _list path;
     sns_topic = option_of_yojson (value_for_key resource_arn_of_yojson "SnsTopic") _list path;
     source_metadata =
       option_of_yojson (value_for_key source_metadata_of_yojson "SourceMetadata") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     number_of_associations =
       option_of_yojson
         (value_for_key number_of_associations_of_yojson "NumberOfAssociations")
         _list path;
     consumed_capacity =
       option_of_yojson (value_for_key rule_capacity_of_yojson "ConsumedCapacity") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     rule_group_status =
       option_of_yojson (value_for_key resource_status_of_yojson "RuleGroupStatus") _list path;
     capacity = option_of_yojson (value_for_key rule_capacity_of_yojson "Capacity") _list path;
     type_ = option_of_yojson (value_for_key rule_group_type_of_yojson "Type") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     rule_group_id = value_for_key resource_id_of_yojson "RuleGroupId" _list path;
     rule_group_name = value_for_key resource_name_of_yojson "RuleGroupName" _list path;
     rule_group_arn = value_for_key resource_arn_of_yojson "RuleGroupArn" _list path;
   }
    : rule_group_response)

let update_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group_response =
       value_for_key rule_group_response_of_yojson "RuleGroupResponse" _list path;
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
   }
    : update_rule_group_response)

let ip_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ definition = value_for_key variable_definition_list_of_yojson "Definition" _list path }
    : ip_set)

let rule_variable_name_of_yojson = string_of_yojson

let ip_sets_of_yojson tree path =
  map_of_yojson rule_variable_name_of_yojson ip_set_of_yojson tree path

let port_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     definition =
       option_of_yojson (value_for_key variable_definition_list_of_yojson "Definition") _list path;
   }
    : port_set)

let port_sets_of_yojson tree path =
  map_of_yojson rule_variable_name_of_yojson port_set_of_yojson tree path

let rule_variables_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port_sets = option_of_yojson (value_for_key port_sets_of_yojson "PortSets") _list path;
     ip_sets = option_of_yojson (value_for_key ip_sets_of_yojson "IPSets") _list path;
   }
    : rule_variables)

let ip_set_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reference_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ReferenceArn") _list path;
   }
    : ip_set_reference)

let ip_set_reference_name_of_yojson = string_of_yojson

let ip_set_reference_map_of_yojson tree path =
  map_of_yojson ip_set_reference_name_of_yojson ip_set_reference_of_yojson tree path

let reference_sets_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_set_references =
       option_of_yojson (value_for_key ip_set_reference_map_of_yojson "IPSetReferences") _list path;
   }
    : reference_sets)

let rules_string_of_yojson = string_of_yojson
let rule_targets_of_yojson tree path = list_of_yojson collection_member__string_of_yojson tree path

let target_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "HTTP_HOST" -> HTTP_HOST
    | `String "TLS_SNI" -> TLS_SNI
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetType")
     : target_type)
    : target_type)

let target_types_of_yojson tree path = list_of_yojson target_type_of_yojson tree path

let generated_rules_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALERTLIST" -> ALERTLIST
    | `String "REJECTLIST" -> REJECTLIST
    | `String "DENYLIST" -> DENYLIST
    | `String "ALLOWLIST" -> ALLOWLIST
    | `String value -> raise (deserialize_unknown_enum_value_error path "GeneratedRulesType" value)
    | _ -> raise (deserialize_wrong_type_error path "GeneratedRulesType")
     : generated_rules_type)
    : generated_rules_type)

let rules_source_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     generated_rules_type =
       value_for_key generated_rules_type_of_yojson "GeneratedRulesType" _list path;
     target_types = value_for_key target_types_of_yojson "TargetTypes" _list path;
     targets = value_for_key rule_targets_of_yojson "Targets" _list path;
   }
    : rules_source_list)

let stateful_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "REJECT" -> REJECT
    | `String "ALERT" -> ALERT
    | `String "DROP" -> DROP
    | `String "PASS" -> PASS
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatefulAction" value)
    | _ -> raise (deserialize_wrong_type_error path "StatefulAction")
     : stateful_action)
    : stateful_action)

let stateful_rule_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "QUIC" -> QUIC
    | `String "HTTP2" -> HTTP2
    | `String "DHCP" -> DHCP
    | `String "NTP" -> NTP
    | `String "TFTP" -> TFTP
    | `String "IKEV2" -> IKEV2
    | `String "KRB5" -> KRB5
    | `String "MSN" -> MSN
    | `String "IMAP" -> IMAP
    | `String "SMTP" -> SMTP
    | `String "SSH" -> SSH
    | `String "DCERPC" -> DCERPC
    | `String "DNS" -> DNS
    | `String "SMB" -> SMB
    | `String "TLS" -> TLS
    | `String "FTP" -> FTP
    | `String "HTTP" -> HTTP
    | `String "ICMP" -> ICMP
    | `String "UDP" -> UDP
    | `String "TCP" -> TCP
    | `String "IP" -> ANY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StatefulRuleProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "StatefulRuleProtocol")
     : stateful_rule_protocol)
    : stateful_rule_protocol)

let source_of_yojson = string_of_yojson
let port_of_yojson = string_of_yojson

let stateful_rule_direction_of_yojson (tree : t) path =
  ((match tree with
    | `String "ANY" -> ANY
    | `String "FORWARD" -> FORWARD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StatefulRuleDirection" value)
    | _ -> raise (deserialize_wrong_type_error path "StatefulRuleDirection")
     : stateful_rule_direction)
    : stateful_rule_direction)

let destination_of_yojson = string_of_yojson

let header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_port = value_for_key port_of_yojson "DestinationPort" _list path;
     destination = value_for_key destination_of_yojson "Destination" _list path;
     direction = value_for_key stateful_rule_direction_of_yojson "Direction" _list path;
     source_port = value_for_key port_of_yojson "SourcePort" _list path;
     source = value_for_key source_of_yojson "Source" _list path;
     protocol = value_for_key stateful_rule_protocol_of_yojson "Protocol" _list path;
   }
    : header)

let keyword_of_yojson = string_of_yojson
let setting_of_yojson = string_of_yojson
let settings_of_yojson tree path = list_of_yojson setting_of_yojson tree path

let rule_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     settings = option_of_yojson (value_for_key settings_of_yojson "Settings") _list path;
     keyword = value_for_key keyword_of_yojson "Keyword" _list path;
   }
    : rule_option)

let rule_options_of_yojson tree path = list_of_yojson rule_option_of_yojson tree path

let stateful_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_options = value_for_key rule_options_of_yojson "RuleOptions" _list path;
     header = value_for_key header_of_yojson "Header" _list path;
     action = value_for_key stateful_action_of_yojson "Action" _list path;
   }
    : stateful_rule)

let stateful_rules_of_yojson tree path = list_of_yojson stateful_rule_of_yojson tree path

let tcp_flag_of_yojson (tree : t) path =
  ((match tree with
    | `String "CWR" -> CWR
    | `String "ECE" -> ECE
    | `String "URG" -> URG
    | `String "ACK" -> ACK
    | `String "PSH" -> PSH
    | `String "RST" -> RST
    | `String "SYN" -> SYN
    | `String "FIN" -> FIN
    | `String value -> raise (deserialize_unknown_enum_value_error path "TCPFlag" value)
    | _ -> raise (deserialize_wrong_type_error path "TCPFlag")
     : tcp_flag)
    : tcp_flag)

let flags_of_yojson tree path = list_of_yojson tcp_flag_of_yojson tree path

let tcp_flag_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     masks = option_of_yojson (value_for_key flags_of_yojson "Masks") _list path;
     flags = value_for_key flags_of_yojson "Flags" _list path;
   }
    : tcp_flag_field)

let tcp_flags_of_yojson tree path = list_of_yojson tcp_flag_field_of_yojson tree path

let match_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tcp_flags = option_of_yojson (value_for_key tcp_flags_of_yojson "TCPFlags") _list path;
     protocols = option_of_yojson (value_for_key protocol_numbers_of_yojson "Protocols") _list path;
     destination_ports =
       option_of_yojson (value_for_key port_ranges_of_yojson "DestinationPorts") _list path;
     source_ports = option_of_yojson (value_for_key port_ranges_of_yojson "SourcePorts") _list path;
     destinations = option_of_yojson (value_for_key addresses_of_yojson "Destinations") _list path;
     sources = option_of_yojson (value_for_key addresses_of_yojson "Sources") _list path;
   }
    : match_attributes)

let stateless_actions_of_yojson tree path =
  list_of_yojson collection_member__string_of_yojson tree path

let rule_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions = value_for_key stateless_actions_of_yojson "Actions" _list path;
     match_attributes = value_for_key match_attributes_of_yojson "MatchAttributes" _list path;
   }
    : rule_definition)

let priority_of_yojson = int_of_yojson

let stateless_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     priority = value_for_key priority_of_yojson "Priority" _list path;
     rule_definition = value_for_key rule_definition_of_yojson "RuleDefinition" _list path;
   }
    : stateless_rule)

let stateless_rules_of_yojson tree path = list_of_yojson stateless_rule_of_yojson tree path
let action_name_of_yojson = string_of_yojson
let dimension_value_of_yojson = string_of_yojson

let dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ value = value_for_key dimension_value_of_yojson "Value" _list path } : dimension)

let dimensions_of_yojson tree path = list_of_yojson dimension_of_yojson tree path

let publish_metric_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dimensions = value_for_key dimensions_of_yojson "Dimensions" _list path }
    : publish_metric_action)

let action_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     publish_metric_action =
       option_of_yojson
         (value_for_key publish_metric_action_of_yojson "PublishMetricAction")
         _list path;
   }
    : action_definition)

let custom_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_definition = value_for_key action_definition_of_yojson "ActionDefinition" _list path;
     action_name = value_for_key action_name_of_yojson "ActionName" _list path;
   }
    : custom_action)

let custom_actions_of_yojson tree path = list_of_yojson custom_action_of_yojson tree path

let stateless_rules_and_custom_actions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_actions =
       option_of_yojson (value_for_key custom_actions_of_yojson "CustomActions") _list path;
     stateless_rules = value_for_key stateless_rules_of_yojson "StatelessRules" _list path;
   }
    : stateless_rules_and_custom_actions)

let rules_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stateless_rules_and_custom_actions =
       option_of_yojson
         (value_for_key stateless_rules_and_custom_actions_of_yojson
            "StatelessRulesAndCustomActions")
         _list path;
     stateful_rules =
       option_of_yojson (value_for_key stateful_rules_of_yojson "StatefulRules") _list path;
     rules_source_list =
       option_of_yojson (value_for_key rules_source_list_of_yojson "RulesSourceList") _list path;
     rules_string = option_of_yojson (value_for_key rules_string_of_yojson "RulesString") _list path;
   }
    : rules_source)

let rule_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "STRICT_ORDER" -> STRICT_ORDER
    | `String "DEFAULT_ACTION_ORDER" -> DEFAULT_ACTION_ORDER
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleOrder")
     : rule_order)
    : rule_order)

let stateful_rule_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_order = option_of_yojson (value_for_key rule_order_of_yojson "RuleOrder") _list path }
    : stateful_rule_options)

let rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stateful_rule_options =
       option_of_yojson
         (value_for_key stateful_rule_options_of_yojson "StatefulRuleOptions")
         _list path;
     rules_source = value_for_key rules_source_of_yojson "RulesSource" _list path;
     reference_sets =
       option_of_yojson (value_for_key reference_sets_of_yojson "ReferenceSets") _list path;
     rule_variables =
       option_of_yojson (value_for_key rule_variables_of_yojson "RuleVariables") _list path;
   }
    : rule_group)

let update_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary_configuration =
       option_of_yojson
         (value_for_key summary_configuration_of_yojson "SummaryConfiguration")
         _list path;
     analyze_rule_group =
       option_of_yojson (value_for_key boolean__of_yojson "AnalyzeRuleGroup") _list path;
     source_metadata =
       option_of_yojson (value_for_key source_metadata_of_yojson "SourceMetadata") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     dry_run = option_of_yojson (value_for_key boolean__of_yojson "DryRun") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     type_ = option_of_yojson (value_for_key rule_group_type_of_yojson "Type") _list path;
     rules = option_of_yojson (value_for_key rules_string_of_yojson "Rules") _list path;
     rule_group = option_of_yojson (value_for_key rule_group_of_yojson "RuleGroup") _list path;
     rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "RuleGroupName") _list path;
     rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "RuleGroupArn") _list path;
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
   }
    : update_rule_group_request)

let proxy_rule_phase_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALERT" -> ALERT
    | `String "DENY" -> DENY
    | `String "ALLOW" -> ALLOW
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProxyRulePhaseAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ProxyRulePhaseAction")
     : proxy_rule_phase_action)
    : proxy_rule_phase_action)

let condition_operator_of_yojson = string_of_yojson
let condition_key_of_yojson = string_of_yojson
let proxy_condition_value_of_yojson = string_of_yojson

let proxy_condition_value_list_of_yojson tree path =
  list_of_yojson proxy_condition_value_of_yojson tree path

let proxy_rule_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     condition_values =
       option_of_yojson
         (value_for_key proxy_condition_value_list_of_yojson "ConditionValues")
         _list path;
     condition_key =
       option_of_yojson (value_for_key condition_key_of_yojson "ConditionKey") _list path;
     condition_operator =
       option_of_yojson (value_for_key condition_operator_of_yojson "ConditionOperator") _list path;
   }
    : proxy_rule_condition)

let proxy_rule_condition_list_of_yojson tree path =
  list_of_yojson proxy_rule_condition_of_yojson tree path

let proxy_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conditions =
       option_of_yojson (value_for_key proxy_rule_condition_list_of_yojson "Conditions") _list path;
     action = option_of_yojson (value_for_key proxy_rule_phase_action_of_yojson "Action") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     proxy_rule_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleName") _list path;
   }
    : proxy_rule)

let update_proxy_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     removed_conditions =
       option_of_yojson
         (value_for_key proxy_rule_condition_list_of_yojson "RemovedConditions")
         _list path;
     proxy_rule = option_of_yojson (value_for_key proxy_rule_of_yojson "ProxyRule") _list path;
   }
    : update_proxy_rule_response)

let update_proxy_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
     remove_conditions =
       option_of_yojson
         (value_for_key proxy_rule_condition_list_of_yojson "RemoveConditions")
         _list path;
     add_conditions =
       option_of_yojson
         (value_for_key proxy_rule_condition_list_of_yojson "AddConditions")
         _list path;
     action = option_of_yojson (value_for_key proxy_rule_phase_action_of_yojson "Action") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     proxy_rule_name = value_for_key resource_name_of_yojson "ProxyRuleName" _list path;
     proxy_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyRuleGroupArn") _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
   }
    : update_proxy_rule_request)

let rule_group_request_phase_of_yojson (tree : t) path =
  ((match tree with
    | `String "POST_RES" -> POST_RES
    | `String "PRE_REQ" -> PRE_REQ
    | `String "PRE_DNS" -> PRE_DNS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RuleGroupRequestPhase" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleGroupRequestPhase")
     : rule_group_request_phase)
    : rule_group_request_phase)

let insert_position_of_yojson = int_of_yojson

let proxy_rule_priority_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_position =
       option_of_yojson (value_for_key insert_position_of_yojson "NewPosition") _list path;
     proxy_rule_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleName") _list path;
   }
    : proxy_rule_priority)

let proxy_rule_priority_list_of_yojson tree path =
  list_of_yojson proxy_rule_priority_of_yojson tree path

let update_proxy_rule_priorities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     rules = option_of_yojson (value_for_key proxy_rule_priority_list_of_yojson "Rules") _list path;
     rule_group_request_phase =
       option_of_yojson
         (value_for_key rule_group_request_phase_of_yojson "RuleGroupRequestPhase")
         _list path;
     proxy_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyRuleGroupArn") _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
   }
    : update_proxy_rule_priorities_response)

let update_proxy_rule_priorities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
     rules = value_for_key proxy_rule_priority_list_of_yojson "Rules" _list path;
     rule_group_request_phase =
       value_for_key rule_group_request_phase_of_yojson "RuleGroupRequestPhase" _list path;
     proxy_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyRuleGroupArn") _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
   }
    : update_proxy_rule_priorities_request)

let proxy_rule_group_priority_result_priority_of_yojson = int_of_yojson

let proxy_rule_group_priority_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     priority =
       option_of_yojson
         (value_for_key proxy_rule_group_priority_result_priority_of_yojson "Priority")
         _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
   }
    : proxy_rule_group_priority_result)

let proxy_rule_group_priority_result_list_of_yojson tree path =
  list_of_yojson proxy_rule_group_priority_result_of_yojson tree path

let update_proxy_rule_group_priorities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy_rule_groups =
       option_of_yojson
         (value_for_key proxy_rule_group_priority_result_list_of_yojson "ProxyRuleGroups")
         _list path;
   }
    : update_proxy_rule_group_priorities_response)

let proxy_rule_group_priority_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_position =
       option_of_yojson (value_for_key insert_position_of_yojson "NewPosition") _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
   }
    : proxy_rule_group_priority)

let proxy_rule_group_priority_list_of_yojson tree path =
  list_of_yojson proxy_rule_group_priority_of_yojson tree path

let update_proxy_rule_group_priorities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
     rule_groups = value_for_key proxy_rule_group_priority_list_of_yojson "RuleGroups" _list path;
     proxy_configuration_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyConfigurationArn") _list path;
     proxy_configuration_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyConfigurationName") _list path;
   }
    : update_proxy_rule_group_priorities_request)

let create_time_of_yojson = timestamp_epoch_seconds_of_yojson
let delete_time_of_yojson = timestamp_epoch_seconds_of_yojson
let failure_code_of_yojson = string_of_yojson
let failure_message_of_yojson = string_of_yojson

let proxy_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "DETACH_FAILED" -> DETACH_FAILED
    | `String "ATTACH_FAILED" -> ATTACH_FAILED
    | `String "DETACHED" -> DETACHED
    | `String "DETACHING" -> DETACHING
    | `String "ATTACHED" -> ATTACHED
    | `String "ATTACHING" -> ATTACHING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProxyState" value)
    | _ -> raise (deserialize_wrong_type_error path "ProxyState")
     : proxy_state)
    : proxy_state)

let proxy_modify_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "MODIFYING" -> MODIFYING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProxyModifyState" value)
    | _ -> raise (deserialize_wrong_type_error path "ProxyModifyState")
     : proxy_modify_state)
    : proxy_modify_state)

let nat_gateway_id_of_yojson = string_of_yojson
let nat_gateway_port_of_yojson = int_of_yojson

let listener_property_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "HTTPS" -> HTTPS
    | `String "HTTP" -> HTTP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListenerPropertyType" value)
    | _ -> raise (deserialize_wrong_type_error path "ListenerPropertyType")
     : listener_property_type)
    : listener_property_type)

let listener_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key listener_property_type_of_yojson "Type") _list path;
     port = option_of_yojson (value_for_key nat_gateway_port_of_yojson "Port") _list path;
   }
    : listener_property)

let listener_properties_of_yojson tree path = list_of_yojson listener_property_of_yojson tree path

let tls_intercept_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TlsInterceptMode" value)
    | _ -> raise (deserialize_wrong_type_error path "TlsInterceptMode")
     : tls_intercept_mode)
    : tls_intercept_mode)

let tls_intercept_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tls_intercept_mode =
       option_of_yojson (value_for_key tls_intercept_mode_of_yojson "TlsInterceptMode") _list path;
     pca_arn = option_of_yojson (value_for_key resource_arn_of_yojson "PcaArn") _list path;
   }
    : tls_intercept_properties)

let proxy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     tls_intercept_properties =
       option_of_yojson
         (value_for_key tls_intercept_properties_of_yojson "TlsInterceptProperties")
         _list path;
     listener_properties =
       option_of_yojson
         (value_for_key listener_properties_of_yojson "ListenerProperties")
         _list path;
     proxy_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ProxyArn") _list path;
     proxy_name = option_of_yojson (value_for_key resource_name_of_yojson "ProxyName") _list path;
     proxy_configuration_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyConfigurationArn") _list path;
     proxy_configuration_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyConfigurationName") _list path;
     nat_gateway_id =
       option_of_yojson (value_for_key nat_gateway_id_of_yojson "NatGatewayId") _list path;
     proxy_modify_state =
       option_of_yojson (value_for_key proxy_modify_state_of_yojson "ProxyModifyState") _list path;
     proxy_state = option_of_yojson (value_for_key proxy_state_of_yojson "ProxyState") _list path;
     failure_message =
       option_of_yojson (value_for_key failure_message_of_yojson "FailureMessage") _list path;
     failure_code = option_of_yojson (value_for_key failure_code_of_yojson "FailureCode") _list path;
     update_time = option_of_yojson (value_for_key update_time_of_yojson "UpdateTime") _list path;
     delete_time = option_of_yojson (value_for_key delete_time_of_yojson "DeleteTime") _list path;
     create_time = option_of_yojson (value_for_key create_time_of_yojson "CreateTime") _list path;
   }
    : proxy)

let update_proxy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy = option_of_yojson (value_for_key proxy_of_yojson "Proxy") _list path;
   }
    : update_proxy_response)

let listener_property_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key listener_property_type_of_yojson "Type" _list path;
     port = value_for_key nat_gateway_port_of_yojson "Port" _list path;
   }
    : listener_property_request)

let listener_properties_request_of_yojson tree path =
  list_of_yojson listener_property_request_of_yojson tree path

let tls_intercept_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tls_intercept_mode =
       option_of_yojson (value_for_key tls_intercept_mode_of_yojson "TlsInterceptMode") _list path;
     pca_arn = option_of_yojson (value_for_key resource_arn_of_yojson "PcaArn") _list path;
   }
    : tls_intercept_properties_request)

let update_proxy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
     tls_intercept_properties =
       option_of_yojson
         (value_for_key tls_intercept_properties_request_of_yojson "TlsInterceptProperties")
         _list path;
     listener_properties_to_remove =
       option_of_yojson
         (value_for_key listener_properties_request_of_yojson "ListenerPropertiesToRemove")
         _list path;
     listener_properties_to_add =
       option_of_yojson
         (value_for_key listener_properties_request_of_yojson "ListenerPropertiesToAdd")
         _list path;
     proxy_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ProxyArn") _list path;
     proxy_name = option_of_yojson (value_for_key resource_name_of_yojson "ProxyName") _list path;
     nat_gateway_id = value_for_key nat_gateway_id_of_yojson "NatGatewayId" _list path;
   }
    : update_proxy_request)

let proxy_config_rule_group_type_of_yojson = string_of_yojson
let proxy_config_rule_group_priority_of_yojson = int_of_yojson

let proxy_config_rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     priority =
       option_of_yojson
         (value_for_key proxy_config_rule_group_priority_of_yojson "Priority")
         _list path;
     type_ =
       option_of_yojson (value_for_key proxy_config_rule_group_type_of_yojson "Type") _list path;
     proxy_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyRuleGroupArn") _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
   }
    : proxy_config_rule_group)

let proxy_config_rule_group_set_of_yojson tree path =
  list_of_yojson proxy_config_rule_group_of_yojson tree path

let proxy_config_default_rule_phase_actions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     post_respons_e =
       option_of_yojson (value_for_key proxy_rule_phase_action_of_yojson "PostRESPONSE") _list path;
     pre_reques_t =
       option_of_yojson (value_for_key proxy_rule_phase_action_of_yojson "PreREQUEST") _list path;
     pre_dn_s =
       option_of_yojson (value_for_key proxy_rule_phase_action_of_yojson "PreDNS") _list path;
   }
    : proxy_config_default_rule_phase_actions_request)

let proxy_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     default_rule_phase_actions =
       option_of_yojson
         (value_for_key proxy_config_default_rule_phase_actions_request_of_yojson
            "DefaultRulePhaseActions")
         _list path;
     rule_groups =
       option_of_yojson
         (value_for_key proxy_config_rule_group_set_of_yojson "RuleGroups")
         _list path;
     delete_time = option_of_yojson (value_for_key delete_time_of_yojson "DeleteTime") _list path;
     create_time = option_of_yojson (value_for_key create_time_of_yojson "CreateTime") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     proxy_configuration_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyConfigurationArn") _list path;
     proxy_configuration_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyConfigurationName") _list path;
   }
    : proxy_configuration)

let update_proxy_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy_configuration =
       option_of_yojson
         (value_for_key proxy_configuration_of_yojson "ProxyConfiguration")
         _list path;
   }
    : update_proxy_configuration_response)

let update_proxy_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
     default_rule_phase_actions =
       value_for_key proxy_config_default_rule_phase_actions_request_of_yojson
         "DefaultRulePhaseActions" _list path;
     proxy_configuration_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyConfigurationArn") _list path;
     proxy_configuration_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyConfigurationName") _list path;
   }
    : update_proxy_configuration_request)

let unsupported_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : unsupported_operation_exception)

let log_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TLS" -> TLS
    | `String "FLOW" -> FLOW
    | `String "ALERT" -> ALERT
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogType" value)
    | _ -> raise (deserialize_wrong_type_error path "LogType")
     : log_type)
    : log_type)

let log_destination_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KinesisDataFirehose" -> KINESIS_DATA_FIREHOSE
    | `String "CloudWatchLogs" -> CLOUDWATCH_LOGS
    | `String "S3" -> S3
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogDestinationType" value)
    | _ -> raise (deserialize_wrong_type_error path "LogDestinationType")
     : log_destination_type)
    : log_destination_type)

let hash_map_value_of_yojson = string_of_yojson
let hash_map_key_of_yojson = string_of_yojson

let log_destination_map_of_yojson tree path =
  map_of_yojson hash_map_key_of_yojson hash_map_value_of_yojson tree path

let log_destination_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_destination = value_for_key log_destination_map_of_yojson "LogDestination" _list path;
     log_destination_type =
       value_for_key log_destination_type_of_yojson "LogDestinationType" _list path;
     log_type = value_for_key log_type_of_yojson "LogType" _list path;
   }
    : log_destination_config)

let log_destination_configs_of_yojson tree path =
  list_of_yojson log_destination_config_of_yojson tree path

let logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_destination_configs =
       value_for_key log_destination_configs_of_yojson "LogDestinationConfigs" _list path;
   }
    : logging_configuration)

let enable_monitoring_dashboard_of_yojson = bool_of_yojson

let update_logging_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_monitoring_dashboard =
       option_of_yojson
         (value_for_key enable_monitoring_dashboard_of_yojson "EnableMonitoringDashboard")
         _list path;
     logging_configuration =
       option_of_yojson
         (value_for_key logging_configuration_of_yojson "LoggingConfiguration")
         _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : update_logging_configuration_response)

let update_logging_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_monitoring_dashboard =
       option_of_yojson
         (value_for_key enable_monitoring_dashboard_of_yojson "EnableMonitoringDashboard")
         _list path;
     logging_configuration =
       option_of_yojson
         (value_for_key logging_configuration_of_yojson "LoggingConfiguration")
         _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : update_logging_configuration_request)

let log_destination_permission_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : log_destination_permission_exception)

let firewall_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key last_update_time_of_yojson "LastModifiedTime") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     number_of_associations =
       option_of_yojson
         (value_for_key number_of_associations_of_yojson "NumberOfAssociations")
         _list path;
     consumed_stateful_domain_capacity =
       option_of_yojson
         (value_for_key rule_capacity_of_yojson "ConsumedStatefulDomainCapacity")
         _list path;
     consumed_stateful_rule_capacity =
       option_of_yojson
         (value_for_key rule_capacity_of_yojson "ConsumedStatefulRuleCapacity")
         _list path;
     consumed_stateless_rule_capacity =
       option_of_yojson
         (value_for_key rule_capacity_of_yojson "ConsumedStatelessRuleCapacity")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     firewall_policy_status =
       option_of_yojson (value_for_key resource_status_of_yojson "FirewallPolicyStatus") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     firewall_policy_id = value_for_key resource_id_of_yojson "FirewallPolicyId" _list path;
     firewall_policy_arn = value_for_key resource_arn_of_yojson "FirewallPolicyArn" _list path;
     firewall_policy_name = value_for_key resource_name_of_yojson "FirewallPolicyName" _list path;
   }
    : firewall_policy_response)

let update_firewall_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_policy_response =
       value_for_key firewall_policy_response_of_yojson "FirewallPolicyResponse" _list path;
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
   }
    : update_firewall_policy_response)

let stateless_rule_group_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     priority = value_for_key priority_of_yojson "Priority" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : stateless_rule_group_reference)

let stateless_rule_group_references_of_yojson tree path =
  list_of_yojson stateless_rule_group_reference_of_yojson tree path

let override_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "DROP_TO_ALERT" -> DROP_TO_ALERT
    | `String value -> raise (deserialize_unknown_enum_value_error path "OverrideAction" value)
    | _ -> raise (deserialize_wrong_type_error path "OverrideAction")
     : override_action)
    : override_action)

let stateful_rule_group_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ action = option_of_yojson (value_for_key override_action_of_yojson "Action") _list path }
    : stateful_rule_group_override)

let deep_threat_inspection_of_yojson = bool_of_yojson

let stateful_rule_group_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deep_threat_inspection =
       option_of_yojson
         (value_for_key deep_threat_inspection_of_yojson "DeepThreatInspection")
         _list path;
     override =
       option_of_yojson (value_for_key stateful_rule_group_override_of_yojson "Override") _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "Priority") _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : stateful_rule_group_reference)

let stateful_rule_group_references_of_yojson tree path =
  list_of_yojson stateful_rule_group_reference_of_yojson tree path

let stateful_actions_of_yojson tree path =
  list_of_yojson collection_member__string_of_yojson tree path

let stream_exception_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "REJECT" -> REJECT
    | `String "CONTINUE" -> CONTINUE
    | `String "DROP" -> DROP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StreamExceptionPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamExceptionPolicy")
     : stream_exception_policy)
    : stream_exception_policy)

let tcp_idle_timeout_range_bound_of_yojson = int_of_yojson

let flow_timeouts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tcp_idle_timeout_seconds =
       option_of_yojson
         (value_for_key tcp_idle_timeout_range_bound_of_yojson "TcpIdleTimeoutSeconds")
         _list path;
   }
    : flow_timeouts)

let stateful_engine_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_timeouts =
       option_of_yojson (value_for_key flow_timeouts_of_yojson "FlowTimeouts") _list path;
     stream_exception_policy =
       option_of_yojson
         (value_for_key stream_exception_policy_of_yojson "StreamExceptionPolicy")
         _list path;
     rule_order = option_of_yojson (value_for_key rule_order_of_yojson "RuleOrder") _list path;
   }
    : stateful_engine_options)

let policy_variables_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_variables = option_of_yojson (value_for_key ip_sets_of_yojson "RuleVariables") _list path;
   }
    : policy_variables)

let enable_tls_session_holding_of_yojson = bool_of_yojson

let firewall_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_tls_session_holding =
       option_of_yojson
         (value_for_key enable_tls_session_holding_of_yojson "EnableTLSSessionHolding")
         _list path;
     policy_variables =
       option_of_yojson (value_for_key policy_variables_of_yojson "PolicyVariables") _list path;
     tls_inspection_configuration_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "TLSInspectionConfigurationArn")
         _list path;
     stateful_engine_options =
       option_of_yojson
         (value_for_key stateful_engine_options_of_yojson "StatefulEngineOptions")
         _list path;
     stateful_default_actions =
       option_of_yojson
         (value_for_key stateful_actions_of_yojson "StatefulDefaultActions")
         _list path;
     stateful_rule_group_references =
       option_of_yojson
         (value_for_key stateful_rule_group_references_of_yojson "StatefulRuleGroupReferences")
         _list path;
     stateless_custom_actions =
       option_of_yojson (value_for_key custom_actions_of_yojson "StatelessCustomActions") _list path;
     stateless_fragment_default_actions =
       value_for_key stateless_actions_of_yojson "StatelessFragmentDefaultActions" _list path;
     stateless_default_actions =
       value_for_key stateless_actions_of_yojson "StatelessDefaultActions" _list path;
     stateless_rule_group_references =
       option_of_yojson
         (value_for_key stateless_rule_group_references_of_yojson "StatelessRuleGroupReferences")
         _list path;
   }
    : firewall_policy)

let update_firewall_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     dry_run = option_of_yojson (value_for_key boolean__of_yojson "DryRun") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     firewall_policy = value_for_key firewall_policy_of_yojson "FirewallPolicy" _list path;
     firewall_policy_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallPolicyName") _list path;
     firewall_policy_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "FirewallPolicyArn") _list path;
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
   }
    : update_firewall_policy_request)

let update_firewall_policy_change_protection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_policy_change_protection =
       option_of_yojson
         (value_for_key boolean__of_yojson "FirewallPolicyChangeProtection")
         _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : update_firewall_policy_change_protection_response)

let update_firewall_policy_change_protection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_policy_change_protection =
       value_for_key boolean__of_yojson "FirewallPolicyChangeProtection" _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : update_firewall_policy_change_protection_request)

let update_firewall_encryption_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : update_firewall_encryption_configuration_response)

let update_firewall_encryption_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : update_firewall_encryption_configuration_request)

let update_firewall_description_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : update_firewall_description_response)

let update_firewall_description_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : update_firewall_description_request)

let update_firewall_delete_protection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     delete_protection =
       option_of_yojson (value_for_key boolean__of_yojson "DeleteProtection") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : update_firewall_delete_protection_response)

let update_firewall_delete_protection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_protection = value_for_key boolean__of_yojson "DeleteProtection" _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : update_firewall_delete_protection_request)

let enabled_analysis_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "HTTP_HOST" -> HTTP_HOST
    | `String "TLS_SNI" -> TLS_SNI
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnabledAnalysisType" value)
    | _ -> raise (deserialize_wrong_type_error path "EnabledAnalysisType")
     : enabled_analysis_type)
    : enabled_analysis_type)

let enabled_analysis_types_of_yojson tree path =
  list_of_yojson enabled_analysis_type_of_yojson tree path

let update_firewall_analysis_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     enabled_analysis_types =
       option_of_yojson
         (value_for_key enabled_analysis_types_of_yojson "EnabledAnalysisTypes")
         _list path;
   }
    : update_firewall_analysis_settings_response)

let update_firewall_analysis_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     enabled_analysis_types =
       option_of_yojson
         (value_for_key enabled_analysis_types_of_yojson "EnabledAnalysisTypes")
         _list path;
   }
    : update_firewall_analysis_settings_request)

let container_monitoring_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EKS" -> EKS
    | `String "ECS" -> ECS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerMonitoringType" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerMonitoringType")
     : container_monitoring_type)
    : container_monitoring_type)

let container_attribute_key_of_yojson = string_of_yojson
let container_attribute_value_of_yojson = string_of_yojson

let container_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key container_attribute_value_of_yojson "Value" _list path;
     key = value_for_key container_attribute_key_of_yojson "Key" _list path;
   }
    : container_attribute)

let container_attributes_of_yojson tree path =
  list_of_yojson container_attribute_of_yojson tree path

let container_monitoring_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_filters =
       option_of_yojson (value_for_key container_attributes_of_yojson "AttributeFilters") _list path;
     cluster_arn = value_for_key resource_arn_of_yojson "ClusterArn" _list path;
   }
    : container_monitoring_configuration)

let container_monitoring_configurations_of_yojson tree path =
  list_of_yojson container_monitoring_configuration_of_yojson tree path

let container_association_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETING" -> DELETING
    | `String "CREATING" -> CREATING
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ContainerAssociationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerAssociationStatus")
     : container_association_status)
    : container_association_status)

let update_container_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     status =
       option_of_yojson (value_for_key container_association_status_of_yojson "Status") _list path;
     container_monitoring_configurations =
       option_of_yojson
         (value_for_key container_monitoring_configurations_of_yojson
            "ContainerMonitoringConfigurations")
         _list path;
     type_ = option_of_yojson (value_for_key container_monitoring_type_of_yojson "Type") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     container_association_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ContainerAssociationArn") _list path;
     container_association_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "ContainerAssociationName")
         _list path;
   }
    : update_container_association_response)

let update_container_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     container_monitoring_configurations =
       value_for_key container_monitoring_configurations_of_yojson
         "ContainerMonitoringConfigurations" _list path;
     type_ = value_for_key container_monitoring_type_of_yojson "Type" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     container_association_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ContainerAssociationArn") _list path;
     container_association_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "ContainerAssociationName")
         _list path;
   }
    : update_container_association_request)

let update_availability_zone_change_protection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone_change_protection =
       option_of_yojson
         (value_for_key boolean__of_yojson "AvailabilityZoneChangeProtection")
         _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : update_availability_zone_change_protection_response)

let update_availability_zone_change_protection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone_change_protection =
       value_for_key boolean__of_yojson "AvailabilityZoneChangeProtection" _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : update_availability_zone_change_protection_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let count_of_yojson = int_of_yojson

let unique_sources_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ count = option_of_yojson (value_for_key count_of_yojson "Count") _list path } : unique_sources)

let transit_gateway_id_of_yojson = string_of_yojson
let transit_gateway_attachment_sync_state_message_of_yojson = string_of_yojson
let attachment_id_of_yojson = string_of_yojson

let transit_gateway_attachment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "REJECTED" -> REJECTED
    | `String "REJECTING" -> REJECTING
    | `String "PENDING_ACCEPTANCE" -> PENDING_ACCEPTANCE
    | `String "READY" -> READY
    | `String "ERROR" -> ERROR
    | `String "FAILED" -> FAILED
    | `String "DELETED" -> DELETED
    | `String "DELETING" -> DELETING
    | `String "CREATING" -> CREATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TransitGatewayAttachmentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TransitGatewayAttachmentStatus")
     : transit_gateway_attachment_status)
    : transit_gateway_attachment_status)

let transit_gateway_attachment_sync_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_message =
       option_of_yojson
         (value_for_key transit_gateway_attachment_sync_state_message_of_yojson "StatusMessage")
         _list path;
     transit_gateway_attachment_status =
       option_of_yojson
         (value_for_key transit_gateway_attachment_status_of_yojson "TransitGatewayAttachmentStatus")
         _list path;
     attachment_id =
       option_of_yojson (value_for_key attachment_id_of_yojson "AttachmentId") _list path;
   }
    : transit_gateway_attachment_sync_state)

let transit_gateway_attachment_id_of_yojson = string_of_yojson
let tags_pagination_max_results_of_yojson = int_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let tls_inspection_configuration_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : tls_inspection_configuration_metadata)

let tls_inspection_configurations_of_yojson tree path =
  list_of_yojson tls_inspection_configuration_metadata_of_yojson tree path

let per_object_sync_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEPRECATED" -> DEPRECATED
    | `String "NOT_SUBSCRIBED" -> NOT_SUBSCRIBED
    | `String "CAPACITY_CONSTRAINED" -> CAPACITY_CONSTRAINED
    | `String "IN_SYNC" -> IN_SYNC
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "PerObjectSyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PerObjectSyncStatus")
     : per_object_sync_status)
    : per_object_sync_status)

let per_object_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     sync_status =
       option_of_yojson (value_for_key per_object_sync_status_of_yojson "SyncStatus") _list path;
   }
    : per_object_status)

let sync_state_config_of_yojson tree path =
  map_of_yojson resource_name_of_yojson per_object_status_of_yojson tree path

let sync_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config = option_of_yojson (value_for_key sync_state_config_of_yojson "Config") _list path;
     attachment = option_of_yojson (value_for_key attachment_of_yojson "Attachment") _list path;
   }
    : sync_state)

let sync_states_of_yojson tree path =
  map_of_yojson availability_zone_of_yojson sync_state_of_yojson tree path

let availability_zone_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IPAddressType") _list path;
   }
    : availability_zone_metadata)

let supported_availability_zones_of_yojson tree path =
  map_of_yojson availability_zone_of_yojson availability_zone_metadata_of_yojson tree path

let rule_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata =
       option_of_yojson (value_for_key collection_member__string_of_yojson "Metadata") _list path;
     msg = option_of_yojson (value_for_key collection_member__string_of_yojson "Msg") _list path;
     si_d = option_of_yojson (value_for_key collection_member__string_of_yojson "SID") _list path;
   }
    : rule_summary)

let rule_summaries_of_yojson tree path = list_of_yojson rule_summary_of_yojson tree path

let summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_summaries =
       option_of_yojson (value_for_key rule_summaries_of_yojson "RuleSummaries") _list path;
   }
    : summary)

let subscription_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBSCRIBED" -> SUBSCRIBED
    | `String "NOT_SUBSCRIBED" -> NOT_SUBSCRIBED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SubscriptionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SubscriptionStatus")
     : subscription_status)
    : subscription_status)

let subnet_mappings_of_yojson tree path = list_of_yojson subnet_mapping_of_yojson tree path
let status_of_yojson = string_of_yojson
let start_time_of_yojson = timestamp_epoch_seconds_of_yojson
let flow_operation_id_of_yojson = string_of_yojson

let flow_operation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETED_WITH_ERRORS" -> COMPLETED_WITH_ERRORS
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETED" -> COMPLETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FlowOperationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FlowOperationStatus")
     : flow_operation_status)
    : flow_operation_status)

let start_flow_flush_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_operation_status =
       option_of_yojson
         (value_for_key flow_operation_status_of_yojson "FlowOperationStatus")
         _list path;
     flow_operation_id =
       option_of_yojson (value_for_key flow_operation_id_of_yojson "FlowOperationId") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : start_flow_flush_response)

let age_of_yojson = int_of_yojson
let protocol_string_of_yojson = string_of_yojson
let protocol_strings_of_yojson tree path = list_of_yojson protocol_string_of_yojson tree path

let flow_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protocols = option_of_yojson (value_for_key protocol_strings_of_yojson "Protocols") _list path;
     destination_port = option_of_yojson (value_for_key port_of_yojson "DestinationPort") _list path;
     source_port = option_of_yojson (value_for_key port_of_yojson "SourcePort") _list path;
     destination_address =
       option_of_yojson (value_for_key address_of_yojson "DestinationAddress") _list path;
     source_address = option_of_yojson (value_for_key address_of_yojson "SourceAddress") _list path;
   }
    : flow_filter)

let flow_filters_of_yojson tree path = list_of_yojson flow_filter_of_yojson tree path

let start_flow_flush_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_filters = value_for_key flow_filters_of_yojson "FlowFilters" _list path;
     minimum_flow_age_in_seconds =
       option_of_yojson (value_for_key age_of_yojson "MinimumFlowAgeInSeconds") _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId") _list path;
     vpc_endpoint_association_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "VpcEndpointAssociationArn")
         _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "AvailabilityZone") _list path;
     firewall_arn = value_for_key resource_arn_of_yojson "FirewallArn" _list path;
   }
    : start_flow_flush_request)

let start_flow_capture_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_operation_status =
       option_of_yojson
         (value_for_key flow_operation_status_of_yojson "FlowOperationStatus")
         _list path;
     flow_operation_id =
       option_of_yojson (value_for_key flow_operation_id_of_yojson "FlowOperationId") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : start_flow_capture_response)

let start_flow_capture_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_filters = value_for_key flow_filters_of_yojson "FlowFilters" _list path;
     minimum_flow_age_in_seconds =
       option_of_yojson (value_for_key age_of_yojson "MinimumFlowAgeInSeconds") _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId") _list path;
     vpc_endpoint_association_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "VpcEndpointAssociationArn")
         _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "AvailabilityZone") _list path;
     firewall_arn = value_for_key resource_arn_of_yojson "FirewallArn" _list path;
   }
    : start_flow_capture_request)

let analysis_report_id_of_yojson = string_of_yojson

let start_analysis_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ analysis_report_id = value_for_key analysis_report_id_of_yojson "AnalysisReportId" _list path }
    : start_analysis_report_response)

let start_analysis_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis_type = value_for_key enabled_analysis_type_of_yojson "AnalysisType" _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
   }
    : start_analysis_report_request)

let rule_group_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vendor_name = option_of_yojson (value_for_key vendor_name_of_yojson "VendorName") _list path;
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : rule_group_metadata)

let rule_groups_of_yojson tree path = list_of_yojson rule_group_metadata_of_yojson tree path
let resource_name_list_of_yojson tree path = list_of_yojson resource_name_of_yojson tree path

let resource_managed_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PARTNER_MANAGED" -> PARTNER_MANAGED
    | `String "ACTIVE_THREAT_DEFENSE" -> ACTIVE_THREAT_DEFENSE
    | `String "AWS_MANAGED_DOMAIN_LISTS" -> AWS_MANAGED_DOMAIN_LISTS
    | `String "AWS_MANAGED_THREAT_SIGNATURES" -> AWS_MANAGED_THREAT_SIGNATURES
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceManagedType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceManagedType")
     : resource_managed_type)
    : resource_managed_type)

let resource_managed_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String "MANAGED" -> MANAGED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceManagedStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceManagedStatus")
     : resource_managed_status)
    : resource_managed_status)

let resource_arn_list_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path
let report_time_of_yojson = timestamp_epoch_seconds_of_yojson

let reject_network_firewall_transit_gateway_attachment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transit_gateway_attachment_status =
       value_for_key transit_gateway_attachment_status_of_yojson "TransitGatewayAttachmentStatus"
         _list path;
     transit_gateway_attachment_id =
       value_for_key transit_gateway_attachment_id_of_yojson "TransitGatewayAttachmentId" _list path;
   }
    : reject_network_firewall_transit_gateway_attachment_response)

let reject_network_firewall_transit_gateway_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transit_gateway_attachment_id =
       value_for_key transit_gateway_attachment_id_of_yojson "TransitGatewayAttachmentId" _list path;
   }
    : reject_network_firewall_transit_gateway_attachment_request)

let put_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let policy_string_of_yojson = string_of_yojson

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = value_for_key policy_string_of_yojson "Policy" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : put_resource_policy_request)

let invalid_resource_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_resource_policy_exception)

let proxy_rule_list_of_yojson tree path = list_of_yojson proxy_rule_of_yojson tree path

let proxy_rules_by_request_phase_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     post_respons_e =
       option_of_yojson (value_for_key proxy_rule_list_of_yojson "PostRESPONSE") _list path;
     pre_reques_t =
       option_of_yojson (value_for_key proxy_rule_list_of_yojson "PreREQUEST") _list path;
     pre_dn_s = option_of_yojson (value_for_key proxy_rule_list_of_yojson "PreDNS") _list path;
   }
    : proxy_rules_by_request_phase)

let proxy_rule_group_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : proxy_rule_group_metadata)

let proxy_rule_groups_of_yojson tree path =
  list_of_yojson proxy_rule_group_metadata_of_yojson tree path

let proxy_rule_group_attachment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     insert_position =
       option_of_yojson (value_for_key insert_position_of_yojson "InsertPosition") _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
   }
    : proxy_rule_group_attachment)

let proxy_rule_group_attachment_list_of_yojson tree path =
  list_of_yojson proxy_rule_group_attachment_of_yojson tree path

let proxy_rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     rules =
       option_of_yojson (value_for_key proxy_rules_by_request_phase_of_yojson "Rules") _list path;
     delete_time = option_of_yojson (value_for_key delete_time_of_yojson "DeleteTime") _list path;
     create_time = option_of_yojson (value_for_key create_time_of_yojson "CreateTime") _list path;
     proxy_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyRuleGroupArn") _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
   }
    : proxy_rule_group)

let proxy_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : proxy_metadata)

let proxy_configuration_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : proxy_configuration_metadata)

let proxy_configurations_of_yojson tree path =
  list_of_yojson proxy_configuration_metadata_of_yojson tree path

let proxies_of_yojson tree path = list_of_yojson proxy_metadata_of_yojson tree path
let product_id_of_yojson = string_of_yojson
let private_dns_name_of_yojson = string_of_yojson
let pagination_token_of_yojson = string_of_yojson
let pagination_max_results_of_yojson = int_of_yojson
let packet_count_of_yojson = int_of_yojson

let list_vpc_endpoint_associations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_associations =
       option_of_yojson
         (value_for_key vpc_endpoint_associations_of_yojson "VpcEndpointAssociations")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_vpc_endpoint_associations_response)

let list_vpc_endpoint_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_vpc_endpoint_associations_request)

let list_tls_inspection_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tls_inspection_configurations =
       option_of_yojson
         (value_for_key tls_inspection_configurations_of_yojson "TLSInspectionConfigurations")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_tls_inspection_configurations_response)

let list_tls_inspection_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_tls_inspection_configurations_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     max_results =
       option_of_yojson
         (value_for_key tags_pagination_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_request)

let list_rule_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_groups = option_of_yojson (value_for_key rule_groups_of_yojson "RuleGroups") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_rule_groups_response)

let list_rule_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key rule_group_type_of_yojson "Type") _list path;
     subscription_status =
       option_of_yojson
         (value_for_key subscription_status_of_yojson "SubscriptionStatus")
         _list path;
     managed_type =
       option_of_yojson (value_for_key resource_managed_type_of_yojson "ManagedType") _list path;
     scope = option_of_yojson (value_for_key resource_managed_status_of_yojson "Scope") _list path;
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_rule_groups_request)

let list_proxy_rule_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     proxy_rule_groups =
       option_of_yojson (value_for_key proxy_rule_groups_of_yojson "ProxyRuleGroups") _list path;
   }
    : list_proxy_rule_groups_response)

let list_proxy_rule_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_proxy_rule_groups_request)

let list_proxy_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     proxy_configurations =
       option_of_yojson
         (value_for_key proxy_configurations_of_yojson "ProxyConfigurations")
         _list path;
   }
    : list_proxy_configurations_response)

let list_proxy_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_proxy_configurations_request)

let list_proxies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     proxies = option_of_yojson (value_for_key proxies_of_yojson "Proxies") _list path;
   }
    : list_proxies_response)

let list_proxies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_proxies_request)

let flow_operation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FLOW_CAPTURE" -> FLOW_CAPTURE
    | `String "FLOW_FLUSH" -> FLOW_FLUSH
    | `String value -> raise (deserialize_unknown_enum_value_error path "FlowOperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "FlowOperationType")
     : flow_operation_type)
    : flow_operation_type)

let flow_request_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let flow_operation_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_operation_status =
       option_of_yojson
         (value_for_key flow_operation_status_of_yojson "FlowOperationStatus")
         _list path;
     flow_request_timestamp =
       option_of_yojson
         (value_for_key flow_request_timestamp_of_yojson "FlowRequestTimestamp")
         _list path;
     flow_operation_type =
       option_of_yojson (value_for_key flow_operation_type_of_yojson "FlowOperationType") _list path;
     flow_operation_id =
       option_of_yojson (value_for_key flow_operation_id_of_yojson "FlowOperationId") _list path;
   }
    : flow_operation_metadata)

let flow_operations_of_yojson tree path = list_of_yojson flow_operation_metadata_of_yojson tree path

let list_flow_operations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     flow_operations =
       option_of_yojson (value_for_key flow_operations_of_yojson "FlowOperations") _list path;
   }
    : list_flow_operations_response)

let list_flow_operations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     flow_operation_type =
       option_of_yojson (value_for_key flow_operation_type_of_yojson "FlowOperationType") _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId") _list path;
     vpc_endpoint_association_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "VpcEndpointAssociationArn")
         _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "AvailabilityZone") _list path;
     firewall_arn = value_for_key resource_arn_of_yojson "FirewallArn" _list path;
   }
    : list_flow_operations_request)

let byte_count_of_yojson = long_of_yojson

let flow_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     byte_count = option_of_yojson (value_for_key byte_count_of_yojson "ByteCount") _list path;
     packet_count = option_of_yojson (value_for_key packet_count_of_yojson "PacketCount") _list path;
     age = option_of_yojson (value_for_key age_of_yojson "Age") _list path;
     protocol = option_of_yojson (value_for_key protocol_string_of_yojson "Protocol") _list path;
     destination_port = option_of_yojson (value_for_key port_of_yojson "DestinationPort") _list path;
     source_port = option_of_yojson (value_for_key port_of_yojson "SourcePort") _list path;
     destination_address =
       option_of_yojson (value_for_key address_of_yojson "DestinationAddress") _list path;
     source_address = option_of_yojson (value_for_key address_of_yojson "SourceAddress") _list path;
   }
    : flow)

let flows_of_yojson tree path = list_of_yojson flow_of_yojson tree path

let list_flow_operation_results_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     flows = option_of_yojson (value_for_key flows_of_yojson "Flows") _list path;
     flow_request_timestamp =
       option_of_yojson
         (value_for_key flow_request_timestamp_of_yojson "FlowRequestTimestamp")
         _list path;
     status_message =
       option_of_yojson (value_for_key status_reason_of_yojson "StatusMessage") _list path;
     flow_operation_status =
       option_of_yojson
         (value_for_key flow_operation_status_of_yojson "FlowOperationStatus")
         _list path;
     flow_operation_id =
       option_of_yojson (value_for_key flow_operation_id_of_yojson "FlowOperationId") _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId") _list path;
     vpc_endpoint_association_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "VpcEndpointAssociationArn")
         _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "AvailabilityZone") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : list_flow_operation_results_response)

let list_flow_operation_results_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_association_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "VpcEndpointAssociationArn")
         _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId") _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "AvailabilityZone") _list path;
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     flow_operation_id = value_for_key flow_operation_id_of_yojson "FlowOperationId" _list path;
     firewall_arn = value_for_key resource_arn_of_yojson "FirewallArn" _list path;
   }
    : list_flow_operation_results_request)

let firewall_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transit_gateway_attachment_id =
       option_of_yojson
         (value_for_key transit_gateway_attachment_id_of_yojson "TransitGatewayAttachmentId")
         _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
   }
    : firewall_metadata)

let firewalls_of_yojson tree path = list_of_yojson firewall_metadata_of_yojson tree path

let list_firewalls_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewalls = option_of_yojson (value_for_key firewalls_of_yojson "Firewalls") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_firewalls_response)

let list_firewalls_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     vpc_ids = option_of_yojson (value_for_key vpc_ids_of_yojson "VpcIds") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_firewalls_request)

let firewall_policy_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
   }
    : firewall_policy_metadata)

let firewall_policies_of_yojson tree path =
  list_of_yojson firewall_policy_metadata_of_yojson tree path

let list_firewall_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_policies =
       option_of_yojson (value_for_key firewall_policies_of_yojson "FirewallPolicies") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_firewall_policies_response)

let list_firewall_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_firewall_policies_request)

let container_association_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     arn = option_of_yojson (value_for_key resource_arn_of_yojson "Arn") _list path;
   }
    : container_association_summary)

let container_associations_of_yojson tree path =
  list_of_yojson container_association_summary_of_yojson tree path

let list_container_associations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     container_associations =
       option_of_yojson
         (value_for_key container_associations_of_yojson "ContainerAssociations")
         _list path;
   }
    : list_container_associations_response)

let list_container_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
   }
    : list_container_associations_request)

let analysis_report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     report_time = option_of_yojson (value_for_key report_time_of_yojson "ReportTime") _list path;
     analysis_type =
       option_of_yojson (value_for_key enabled_analysis_type_of_yojson "AnalysisType") _list path;
     analysis_report_id =
       option_of_yojson (value_for_key analysis_report_id_of_yojson "AnalysisReportId") _list path;
   }
    : analysis_report)

let analysis_reports_of_yojson tree path = list_of_yojson analysis_report_of_yojson tree path

let list_analysis_reports_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     analysis_reports =
       option_of_yojson (value_for_key analysis_reports_of_yojson "AnalysisReports") _list path;
   }
    : list_analysis_reports_response)

let list_analysis_reports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
   }
    : list_analysis_reports_request)

let end_time_of_yojson = timestamp_epoch_seconds_of_yojson
let analysis_report_next_token_of_yojson = string_of_yojson
let first_accessed_of_yojson = timestamp_epoch_seconds_of_yojson
let last_accessed_of_yojson = timestamp_epoch_seconds_of_yojson
let domain_of_yojson = string_of_yojson

let hits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ count = option_of_yojson (value_for_key count_of_yojson "Count") _list path } : hits)

let analysis_type_report_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unique_sources =
       option_of_yojson (value_for_key unique_sources_of_yojson "UniqueSources") _list path;
     hits = option_of_yojson (value_for_key hits_of_yojson "Hits") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "Domain") _list path;
     last_accessed =
       option_of_yojson (value_for_key last_accessed_of_yojson "LastAccessed") _list path;
     first_accessed =
       option_of_yojson (value_for_key first_accessed_of_yojson "FirstAccessed") _list path;
     protocol =
       option_of_yojson (value_for_key collection_member__string_of_yojson "Protocol") _list path;
   }
    : analysis_type_report_result)

let analysis_report_results_of_yojson tree path =
  list_of_yojson analysis_type_report_result_of_yojson tree path

let get_analysis_report_results_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis_report_results =
       option_of_yojson
         (value_for_key analysis_report_results_of_yojson "AnalysisReportResults")
         _list path;
     next_token =
       option_of_yojson (value_for_key analysis_report_next_token_of_yojson "NextToken") _list path;
     analysis_type =
       option_of_yojson (value_for_key enabled_analysis_type_of_yojson "AnalysisType") _list path;
     report_time = option_of_yojson (value_for_key report_time_of_yojson "ReportTime") _list path;
     end_time = option_of_yojson (value_for_key end_time_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key start_time_of_yojson "StartTime") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
   }
    : get_analysis_report_results_response)

let get_analysis_report_results_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_max_results_of_yojson "MaxResults") _list path;
     next_token =
       option_of_yojson (value_for_key analysis_report_next_token_of_yojson "NextToken") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     analysis_report_id = value_for_key analysis_report_id_of_yojson "AnalysisReportId" _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
   }
    : get_analysis_report_results_request)

let invalid_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_operation_exception)

let disassociate_subnets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     subnet_mappings =
       option_of_yojson (value_for_key subnet_mappings_of_yojson "SubnetMappings") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : disassociate_subnets_response)

let az_subnets_of_yojson tree path = list_of_yojson az_subnet_of_yojson tree path

let disassociate_subnets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_ids = value_for_key az_subnets_of_yojson "SubnetIds" _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : disassociate_subnets_request)

let availability_zone_mapping_string_of_yojson = string_of_yojson

let availability_zone_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone =
       value_for_key availability_zone_mapping_string_of_yojson "AvailabilityZone" _list path;
   }
    : availability_zone_mapping)

let availability_zone_mappings_of_yojson tree path =
  list_of_yojson availability_zone_mapping_of_yojson tree path

let disassociate_availability_zones_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     availability_zone_mappings =
       option_of_yojson
         (value_for_key availability_zone_mappings_of_yojson "AvailabilityZoneMappings")
         _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : disassociate_availability_zones_response)

let disassociate_availability_zones_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone_mappings =
       value_for_key availability_zone_mappings_of_yojson "AvailabilityZoneMappings" _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : disassociate_availability_zones_request)

let detach_rule_groups_from_proxy_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy_configuration =
       option_of_yojson
         (value_for_key proxy_configuration_of_yojson "ProxyConfiguration")
         _list path;
   }
    : detach_rule_groups_from_proxy_configuration_response)

let detach_rule_groups_from_proxy_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
     rule_group_arns =
       option_of_yojson (value_for_key resource_arn_list_of_yojson "RuleGroupArns") _list path;
     rule_group_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "RuleGroupNames") _list path;
     proxy_configuration_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyConfigurationArn") _list path;
     proxy_configuration_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyConfigurationName") _list path;
   }
    : detach_rule_groups_from_proxy_configuration_request)

let describe_vpc_endpoint_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_association_status =
       option_of_yojson
         (value_for_key vpc_endpoint_association_status_of_yojson "VpcEndpointAssociationStatus")
         _list path;
     vpc_endpoint_association =
       option_of_yojson
         (value_for_key vpc_endpoint_association_of_yojson "VpcEndpointAssociation")
         _list path;
   }
    : describe_vpc_endpoint_association_response)

let describe_vpc_endpoint_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_association_arn =
       value_for_key resource_arn_of_yojson "VpcEndpointAssociationArn" _list path;
   }
    : describe_vpc_endpoint_association_request)

let describe_tls_inspection_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tls_inspection_configuration_response =
       value_for_key tls_inspection_configuration_response_of_yojson
         "TLSInspectionConfigurationResponse" _list path;
     tls_inspection_configuration =
       option_of_yojson
         (value_for_key tls_inspection_configuration_of_yojson "TLSInspectionConfiguration")
         _list path;
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
   }
    : describe_tls_inspection_configuration_response)

let describe_tls_inspection_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tls_inspection_configuration_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "TLSInspectionConfigurationName")
         _list path;
     tls_inspection_configuration_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "TLSInspectionConfigurationArn")
         _list path;
   }
    : describe_tls_inspection_configuration_request)

let describe_rule_group_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary = option_of_yojson (value_for_key summary_of_yojson "Summary") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     rule_group_name = value_for_key resource_name_of_yojson "RuleGroupName" _list path;
   }
    : describe_rule_group_summary_response)

let describe_rule_group_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key rule_group_type_of_yojson "Type") _list path;
     rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "RuleGroupArn") _list path;
     rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "RuleGroupName") _list path;
   }
    : describe_rule_group_summary_request)

let listing_name_of_yojson = string_of_yojson

let describe_rule_group_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listing_name = option_of_yojson (value_for_key listing_name_of_yojson "ListingName") _list path;
     product_id = option_of_yojson (value_for_key product_id_of_yojson "ProductId") _list path;
     vendor_name = option_of_yojson (value_for_key vendor_name_of_yojson "VendorName") _list path;
     last_modified_time =
       option_of_yojson (value_for_key last_update_time_of_yojson "LastModifiedTime") _list path;
     stateful_rule_options =
       option_of_yojson
         (value_for_key stateful_rule_options_of_yojson "StatefulRuleOptions")
         _list path;
     capacity = option_of_yojson (value_for_key rule_capacity_of_yojson "Capacity") _list path;
     type_ = option_of_yojson (value_for_key rule_group_type_of_yojson "Type") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     rule_group_name = value_for_key resource_name_of_yojson "RuleGroupName" _list path;
     rule_group_arn = value_for_key resource_arn_of_yojson "RuleGroupArn" _list path;
   }
    : describe_rule_group_metadata_response)

let describe_rule_group_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key rule_group_type_of_yojson "Type") _list path;
     rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "RuleGroupArn") _list path;
     rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "RuleGroupName") _list path;
   }
    : describe_rule_group_metadata_request)

let describe_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group_response =
       value_for_key rule_group_response_of_yojson "RuleGroupResponse" _list path;
     rule_group = option_of_yojson (value_for_key rule_group_of_yojson "RuleGroup") _list path;
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
   }
    : describe_rule_group_response)

let describe_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analyze_rule_group =
       option_of_yojson (value_for_key boolean__of_yojson "AnalyzeRuleGroup") _list path;
     type_ = option_of_yojson (value_for_key rule_group_type_of_yojson "Type") _list path;
     rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "RuleGroupArn") _list path;
     rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "RuleGroupName") _list path;
   }
    : describe_rule_group_request)

let describe_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = option_of_yojson (value_for_key policy_string_of_yojson "Policy") _list path }
    : describe_resource_policy_response)

let describe_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : describe_resource_policy_request)

let describe_proxy_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy_rule_group =
       option_of_yojson (value_for_key proxy_rule_group_of_yojson "ProxyRuleGroup") _list path;
   }
    : describe_proxy_rule_group_response)

let describe_proxy_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyRuleGroupArn") _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
   }
    : describe_proxy_rule_group_request)

let describe_proxy_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy_rule = option_of_yojson (value_for_key proxy_rule_of_yojson "ProxyRule") _list path;
   }
    : describe_proxy_rule_response)

let describe_proxy_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyRuleGroupArn") _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
     proxy_rule_name = value_for_key resource_name_of_yojson "ProxyRuleName" _list path;
   }
    : describe_proxy_rule_request)

let describe_proxy_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy_configuration =
       option_of_yojson
         (value_for_key proxy_configuration_of_yojson "ProxyConfiguration")
         _list path;
   }
    : describe_proxy_configuration_response)

let describe_proxy_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_configuration_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyConfigurationArn") _list path;
     proxy_configuration_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyConfigurationName") _list path;
   }
    : describe_proxy_configuration_request)

let describe_proxy_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     failure_message =
       option_of_yojson (value_for_key failure_message_of_yojson "FailureMessage") _list path;
     failure_code = option_of_yojson (value_for_key failure_code_of_yojson "FailureCode") _list path;
     update_time = option_of_yojson (value_for_key update_time_of_yojson "UpdateTime") _list path;
     delete_time = option_of_yojson (value_for_key delete_time_of_yojson "DeleteTime") _list path;
     create_time = option_of_yojson (value_for_key create_time_of_yojson "CreateTime") _list path;
     private_dns_name =
       option_of_yojson (value_for_key private_dns_name_of_yojson "PrivateDNSName") _list path;
     vpc_endpoint_service_name =
       option_of_yojson
         (value_for_key vpc_endpoint_service_name_of_yojson "VpcEndpointServiceName")
         _list path;
     tls_intercept_properties =
       option_of_yojson
         (value_for_key tls_intercept_properties_of_yojson "TlsInterceptProperties")
         _list path;
     listener_properties =
       option_of_yojson
         (value_for_key listener_properties_of_yojson "ListenerProperties")
         _list path;
     proxy_modify_state =
       option_of_yojson (value_for_key proxy_modify_state_of_yojson "ProxyModifyState") _list path;
     proxy_state = option_of_yojson (value_for_key proxy_state_of_yojson "ProxyState") _list path;
     nat_gateway_id =
       option_of_yojson (value_for_key nat_gateway_id_of_yojson "NatGatewayId") _list path;
     proxy_configuration_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyConfigurationArn") _list path;
     proxy_configuration_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyConfigurationName") _list path;
     proxy_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ProxyArn") _list path;
     proxy_name = option_of_yojson (value_for_key resource_name_of_yojson "ProxyName") _list path;
   }
    : describe_proxy_resource)

let describe_proxy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy = option_of_yojson (value_for_key describe_proxy_resource_of_yojson "Proxy") _list path;
   }
    : describe_proxy_response)

let describe_proxy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ProxyArn") _list path;
     proxy_name = option_of_yojson (value_for_key resource_name_of_yojson "ProxyName") _list path;
   }
    : describe_proxy_request)

let describe_logging_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_monitoring_dashboard =
       option_of_yojson
         (value_for_key enable_monitoring_dashboard_of_yojson "EnableMonitoringDashboard")
         _list path;
     logging_configuration =
       option_of_yojson
         (value_for_key logging_configuration_of_yojson "LoggingConfiguration")
         _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : describe_logging_configuration_response)

let describe_logging_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : describe_logging_configuration_request)

let flow_operation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_filters = option_of_yojson (value_for_key flow_filters_of_yojson "FlowFilters") _list path;
     minimum_flow_age_in_seconds =
       option_of_yojson (value_for_key age_of_yojson "MinimumFlowAgeInSeconds") _list path;
   }
    : flow_operation)

let describe_flow_operation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_operation =
       option_of_yojson (value_for_key flow_operation_of_yojson "FlowOperation") _list path;
     flow_request_timestamp =
       option_of_yojson
         (value_for_key flow_request_timestamp_of_yojson "FlowRequestTimestamp")
         _list path;
     status_message =
       option_of_yojson (value_for_key status_reason_of_yojson "StatusMessage") _list path;
     flow_operation_status =
       option_of_yojson
         (value_for_key flow_operation_status_of_yojson "FlowOperationStatus")
         _list path;
     flow_operation_type =
       option_of_yojson (value_for_key flow_operation_type_of_yojson "FlowOperationType") _list path;
     flow_operation_id =
       option_of_yojson (value_for_key flow_operation_id_of_yojson "FlowOperationId") _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId") _list path;
     vpc_endpoint_association_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "VpcEndpointAssociationArn")
         _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "AvailabilityZone") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : describe_flow_operation_response)

let describe_flow_operation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_operation_id = value_for_key flow_operation_id_of_yojson "FlowOperationId" _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId") _list path;
     vpc_endpoint_association_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "VpcEndpointAssociationArn")
         _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "AvailabilityZone") _list path;
     firewall_arn = value_for_key resource_arn_of_yojson "FirewallArn" _list path;
   }
    : describe_flow_operation_request)

let describe_firewall_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_policy =
       option_of_yojson (value_for_key firewall_policy_of_yojson "FirewallPolicy") _list path;
     firewall_policy_response =
       value_for_key firewall_policy_response_of_yojson "FirewallPolicyResponse" _list path;
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
   }
    : describe_firewall_policy_response)

let describe_firewall_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_policy_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "FirewallPolicyArn") _list path;
     firewall_policy_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallPolicyName") _list path;
   }
    : describe_firewall_policy_request)

let describe_firewall_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transit_gateway_attachment_id =
       option_of_yojson
         (value_for_key transit_gateway_attachment_id_of_yojson "TransitGatewayAttachmentId")
         _list path;
     supported_availability_zones =
       option_of_yojson
         (value_for_key supported_availability_zones_of_yojson "SupportedAvailabilityZones")
         _list path;
     status = option_of_yojson (value_for_key firewall_status_value_of_yojson "Status") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     firewall_policy_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "FirewallPolicyArn") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : describe_firewall_metadata_response)

let describe_firewall_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : describe_firewall_metadata_request)

let aws_account_id_of_yojson = string_of_yojson

let firewall_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone_change_protection =
       option_of_yojson
         (value_for_key boolean__of_yojson "AvailabilityZoneChangeProtection")
         _list path;
     availability_zone_mappings =
       option_of_yojson
         (value_for_key availability_zone_mappings_of_yojson "AvailabilityZoneMappings")
         _list path;
     transit_gateway_owner_account_id =
       option_of_yojson
         (value_for_key aws_account_id_of_yojson "TransitGatewayOwnerAccountId")
         _list path;
     transit_gateway_id =
       option_of_yojson (value_for_key transit_gateway_id_of_yojson "TransitGatewayId") _list path;
     enabled_analysis_types =
       option_of_yojson
         (value_for_key enabled_analysis_types_of_yojson "EnabledAnalysisTypes")
         _list path;
     number_of_associations =
       option_of_yojson
         (value_for_key number_of_associations_of_yojson "NumberOfAssociations")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     firewall_id = value_for_key resource_id_of_yojson "FirewallId" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     firewall_policy_change_protection =
       option_of_yojson
         (value_for_key boolean__of_yojson "FirewallPolicyChangeProtection")
         _list path;
     subnet_change_protection =
       option_of_yojson (value_for_key boolean__of_yojson "SubnetChangeProtection") _list path;
     delete_protection =
       option_of_yojson (value_for_key boolean__of_yojson "DeleteProtection") _list path;
     subnet_mappings = value_for_key subnet_mappings_of_yojson "SubnetMappings" _list path;
     vpc_id = value_for_key vpc_id_of_yojson "VpcId" _list path;
     firewall_policy_arn = value_for_key resource_arn_of_yojson "FirewallPolicyArn" _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
   }
    : firewall)

let configuration_sync_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "CAPACITY_CONSTRAINED" -> CAPACITY_CONSTRAINED
    | `String "IN_SYNC" -> IN_SYNC
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConfigurationSyncState" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigurationSyncState")
     : configuration_sync_state)
    : configuration_sync_state)

let cidr_count_of_yojson = int_of_yojson

let ip_set_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resolved_cidr_count =
       option_of_yojson (value_for_key cidr_count_of_yojson "ResolvedCIDRCount") _list path;
   }
    : ip_set_metadata)

let ip_set_arn_of_yojson = string_of_yojson

let ip_set_metadata_map_of_yojson tree path =
  map_of_yojson ip_set_arn_of_yojson ip_set_metadata_of_yojson tree path

let cidr_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_set_references =
       option_of_yojson (value_for_key ip_set_metadata_map_of_yojson "IPSetReferences") _list path;
     utilized_cidr_count =
       option_of_yojson (value_for_key cidr_count_of_yojson "UtilizedCIDRCount") _list path;
     available_cidr_count =
       option_of_yojson (value_for_key cidr_count_of_yojson "AvailableCIDRCount") _list path;
   }
    : cidr_summary)

let capacity_usage_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cid_rs = option_of_yojson (value_for_key cidr_summary_of_yojson "CIDRs") _list path }
    : capacity_usage_summary)

let firewall_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transit_gateway_attachment_sync_state =
       option_of_yojson
         (value_for_key transit_gateway_attachment_sync_state_of_yojson
            "TransitGatewayAttachmentSyncState")
         _list path;
     capacity_usage_summary =
       option_of_yojson
         (value_for_key capacity_usage_summary_of_yojson "CapacityUsageSummary")
         _list path;
     sync_states = option_of_yojson (value_for_key sync_states_of_yojson "SyncStates") _list path;
     configuration_sync_state_summary =
       value_for_key configuration_sync_state_of_yojson "ConfigurationSyncStateSummary" _list path;
     status = value_for_key firewall_status_value_of_yojson "Status" _list path;
   }
    : firewall_status)

let describe_firewall_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_status =
       option_of_yojson (value_for_key firewall_status_of_yojson "FirewallStatus") _list path;
     firewall = option_of_yojson (value_for_key firewall_of_yojson "Firewall") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : describe_firewall_response)

let describe_firewall_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
   }
    : describe_firewall_request)

let container_association_last_updated_time_of_yojson = timestamp_epoch_seconds_of_yojson

let describe_container_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     last_updated_time =
       option_of_yojson
         (value_for_key container_association_last_updated_time_of_yojson "LastUpdatedTime")
         _list path;
     resolved_cidr_count =
       option_of_yojson (value_for_key cidr_count_of_yojson "ResolvedCidrCount") _list path;
     status =
       option_of_yojson (value_for_key container_association_status_of_yojson "Status") _list path;
     container_monitoring_configurations =
       option_of_yojson
         (value_for_key container_monitoring_configurations_of_yojson
            "ContainerMonitoringConfigurations")
         _list path;
     type_ = option_of_yojson (value_for_key container_monitoring_type_of_yojson "Type") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     container_association_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ContainerAssociationArn") _list path;
     container_association_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "ContainerAssociationName")
         _list path;
   }
    : describe_container_association_response)

let describe_container_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_association_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ContainerAssociationArn") _list path;
     container_association_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "ContainerAssociationName")
         _list path;
   }
    : describe_container_association_request)

let delete_vpc_endpoint_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_association_status =
       option_of_yojson
         (value_for_key vpc_endpoint_association_status_of_yojson "VpcEndpointAssociationStatus")
         _list path;
     vpc_endpoint_association =
       option_of_yojson
         (value_for_key vpc_endpoint_association_of_yojson "VpcEndpointAssociation")
         _list path;
   }
    : delete_vpc_endpoint_association_response)

let delete_vpc_endpoint_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_association_arn =
       value_for_key resource_arn_of_yojson "VpcEndpointAssociationArn" _list path;
   }
    : delete_vpc_endpoint_association_request)

let delete_tls_inspection_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tls_inspection_configuration_response =
       value_for_key tls_inspection_configuration_response_of_yojson
         "TLSInspectionConfigurationResponse" _list path;
   }
    : delete_tls_inspection_configuration_response)

let delete_tls_inspection_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tls_inspection_configuration_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "TLSInspectionConfigurationName")
         _list path;
     tls_inspection_configuration_arn =
       option_of_yojson
         (value_for_key resource_arn_of_yojson "TLSInspectionConfigurationArn")
         _list path;
   }
    : delete_tls_inspection_configuration_request)

let delete_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group_response =
       value_for_key rule_group_response_of_yojson "RuleGroupResponse" _list path;
   }
    : delete_rule_group_response)

let delete_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key rule_group_type_of_yojson "Type") _list path;
     rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "RuleGroupArn") _list path;
     rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "RuleGroupName") _list path;
   }
    : delete_rule_group_request)

let delete_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : delete_resource_policy_request)

let delete_proxy_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_rule_group =
       option_of_yojson (value_for_key proxy_rule_group_of_yojson "ProxyRuleGroup") _list path;
   }
    : delete_proxy_rules_response)

let delete_proxy_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules = value_for_key resource_name_list_of_yojson "Rules" _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
     proxy_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyRuleGroupArn") _list path;
   }
    : delete_proxy_rules_request)

let delete_proxy_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyRuleGroupArn") _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
   }
    : delete_proxy_rule_group_response)

let delete_proxy_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyRuleGroupArn") _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
   }
    : delete_proxy_rule_group_request)

let delete_proxy_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_configuration_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyConfigurationArn") _list path;
     proxy_configuration_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyConfigurationName") _list path;
   }
    : delete_proxy_configuration_response)

let delete_proxy_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_configuration_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyConfigurationArn") _list path;
     proxy_configuration_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyConfigurationName") _list path;
   }
    : delete_proxy_configuration_request)

let delete_proxy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ProxyArn") _list path;
     proxy_name = option_of_yojson (value_for_key resource_name_of_yojson "ProxyName") _list path;
     nat_gateway_id =
       option_of_yojson (value_for_key nat_gateway_id_of_yojson "NatGatewayId") _list path;
   }
    : delete_proxy_response)

let delete_proxy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     proxy_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ProxyArn") _list path;
     proxy_name = option_of_yojson (value_for_key resource_name_of_yojson "ProxyName") _list path;
     nat_gateway_id = value_for_key nat_gateway_id_of_yojson "NatGatewayId" _list path;
   }
    : delete_proxy_request)

let delete_network_firewall_transit_gateway_attachment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transit_gateway_attachment_status =
       value_for_key transit_gateway_attachment_status_of_yojson "TransitGatewayAttachmentStatus"
         _list path;
     transit_gateway_attachment_id =
       value_for_key transit_gateway_attachment_id_of_yojson "TransitGatewayAttachmentId" _list path;
   }
    : delete_network_firewall_transit_gateway_attachment_response)

let delete_network_firewall_transit_gateway_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transit_gateway_attachment_id =
       value_for_key transit_gateway_attachment_id_of_yojson "TransitGatewayAttachmentId" _list path;
   }
    : delete_network_firewall_transit_gateway_attachment_request)

let delete_firewall_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_policy_response =
       value_for_key firewall_policy_response_of_yojson "FirewallPolicyResponse" _list path;
   }
    : delete_firewall_policy_response)

let delete_firewall_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_policy_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "FirewallPolicyArn") _list path;
     firewall_policy_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallPolicyName") _list path;
   }
    : delete_firewall_policy_request)

let delete_firewall_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_status =
       option_of_yojson (value_for_key firewall_status_of_yojson "FirewallStatus") _list path;
     firewall = option_of_yojson (value_for_key firewall_of_yojson "Firewall") _list path;
   }
    : delete_firewall_response)

let delete_firewall_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
   }
    : delete_firewall_request)

let delete_container_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key container_association_status_of_yojson "Status") _list path;
     container_association_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ContainerAssociationArn") _list path;
     container_association_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "ContainerAssociationName")
         _list path;
   }
    : delete_container_association_response)

let delete_container_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     container_association_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ContainerAssociationArn") _list path;
     container_association_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "ContainerAssociationName")
         _list path;
   }
    : delete_container_association_request)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let insufficient_capacity_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : insufficient_capacity_exception)

let create_vpc_endpoint_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_association_status =
       option_of_yojson
         (value_for_key vpc_endpoint_association_status_of_yojson "VpcEndpointAssociationStatus")
         _list path;
     vpc_endpoint_association =
       option_of_yojson
         (value_for_key vpc_endpoint_association_of_yojson "VpcEndpointAssociation")
         _list path;
   }
    : create_vpc_endpoint_association_response)

let create_vpc_endpoint_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     subnet_mapping = value_for_key subnet_mapping_of_yojson "SubnetMapping" _list path;
     vpc_id = value_for_key vpc_id_of_yojson "VpcId" _list path;
     firewall_arn = value_for_key resource_arn_of_yojson "FirewallArn" _list path;
   }
    : create_vpc_endpoint_association_request)

let create_tls_inspection_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tls_inspection_configuration_response =
       value_for_key tls_inspection_configuration_response_of_yojson
         "TLSInspectionConfigurationResponse" _list path;
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
   }
    : create_tls_inspection_configuration_response)

let create_tls_inspection_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     tls_inspection_configuration =
       value_for_key tls_inspection_configuration_of_yojson "TLSInspectionConfiguration" _list path;
     tls_inspection_configuration_name =
       value_for_key resource_name_of_yojson "TLSInspectionConfigurationName" _list path;
   }
    : create_tls_inspection_configuration_request)

let create_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group_response =
       value_for_key rule_group_response_of_yojson "RuleGroupResponse" _list path;
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
   }
    : create_rule_group_response)

let create_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary_configuration =
       option_of_yojson
         (value_for_key summary_configuration_of_yojson "SummaryConfiguration")
         _list path;
     analyze_rule_group =
       option_of_yojson (value_for_key boolean__of_yojson "AnalyzeRuleGroup") _list path;
     source_metadata =
       option_of_yojson (value_for_key source_metadata_of_yojson "SourceMetadata") _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     dry_run = option_of_yojson (value_for_key boolean__of_yojson "DryRun") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     capacity = value_for_key rule_capacity_of_yojson "Capacity" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     type_ = value_for_key rule_group_type_of_yojson "Type" _list path;
     rules = option_of_yojson (value_for_key rules_string_of_yojson "Rules") _list path;
     rule_group = option_of_yojson (value_for_key rule_group_of_yojson "RuleGroup") _list path;
     rule_group_name = value_for_key resource_name_of_yojson "RuleGroupName" _list path;
   }
    : create_rule_group_request)

let create_proxy_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy_rule_group =
       option_of_yojson (value_for_key proxy_rule_group_of_yojson "ProxyRuleGroup") _list path;
   }
    : create_proxy_rules_response)

let create_proxy_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     insert_position =
       option_of_yojson (value_for_key insert_position_of_yojson "InsertPosition") _list path;
     conditions =
       option_of_yojson (value_for_key proxy_rule_condition_list_of_yojson "Conditions") _list path;
     action = option_of_yojson (value_for_key proxy_rule_phase_action_of_yojson "Action") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     proxy_rule_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleName") _list path;
   }
    : create_proxy_rule)

let create_proxy_rule_list_of_yojson tree path =
  list_of_yojson create_proxy_rule_of_yojson tree path

let create_proxy_rules_by_request_phase_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     post_respons_e =
       option_of_yojson (value_for_key create_proxy_rule_list_of_yojson "PostRESPONSE") _list path;
     pre_reques_t =
       option_of_yojson (value_for_key create_proxy_rule_list_of_yojson "PreREQUEST") _list path;
     pre_dn_s =
       option_of_yojson (value_for_key create_proxy_rule_list_of_yojson "PreDNS") _list path;
   }
    : create_proxy_rules_by_request_phase)

let create_proxy_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules = value_for_key create_proxy_rules_by_request_phase_of_yojson "Rules" _list path;
     proxy_rule_group_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyRuleGroupName") _list path;
     proxy_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyRuleGroupArn") _list path;
   }
    : create_proxy_rules_request)

let create_proxy_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy_rule_group =
       option_of_yojson (value_for_key proxy_rule_group_of_yojson "ProxyRuleGroup") _list path;
   }
    : create_proxy_rule_group_response)

let create_proxy_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     rules =
       option_of_yojson (value_for_key proxy_rules_by_request_phase_of_yojson "Rules") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     proxy_rule_group_name = value_for_key resource_name_of_yojson "ProxyRuleGroupName" _list path;
   }
    : create_proxy_rule_group_request)

let create_proxy_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy_configuration =
       option_of_yojson
         (value_for_key proxy_configuration_of_yojson "ProxyConfiguration")
         _list path;
   }
    : create_proxy_configuration_response)

let create_proxy_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     default_rule_phase_actions =
       value_for_key proxy_config_default_rule_phase_actions_request_of_yojson
         "DefaultRulePhaseActions" _list path;
     rule_group_arns =
       option_of_yojson (value_for_key resource_arn_list_of_yojson "RuleGroupArns") _list path;
     rule_group_names =
       option_of_yojson (value_for_key resource_name_list_of_yojson "RuleGroupNames") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     proxy_configuration_name =
       value_for_key resource_name_of_yojson "ProxyConfigurationName" _list path;
   }
    : create_proxy_configuration_request)

let create_proxy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy = option_of_yojson (value_for_key proxy_of_yojson "Proxy") _list path;
   }
    : create_proxy_response)

let create_proxy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     tls_intercept_properties =
       value_for_key tls_intercept_properties_request_of_yojson "TlsInterceptProperties" _list path;
     listener_properties =
       option_of_yojson
         (value_for_key listener_properties_request_of_yojson "ListenerProperties")
         _list path;
     proxy_configuration_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyConfigurationArn") _list path;
     proxy_configuration_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyConfigurationName") _list path;
     nat_gateway_id = value_for_key nat_gateway_id_of_yojson "NatGatewayId" _list path;
     proxy_name = value_for_key resource_name_of_yojson "ProxyName" _list path;
   }
    : create_proxy_request)

let create_firewall_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_policy_response =
       value_for_key firewall_policy_response_of_yojson "FirewallPolicyResponse" _list path;
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
   }
    : create_firewall_policy_response)

let create_firewall_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     dry_run = option_of_yojson (value_for_key boolean__of_yojson "DryRun") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     firewall_policy = value_for_key firewall_policy_of_yojson "FirewallPolicy" _list path;
     firewall_policy_name = value_for_key resource_name_of_yojson "FirewallPolicyName" _list path;
   }
    : create_firewall_policy_request)

let create_firewall_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_status =
       option_of_yojson (value_for_key firewall_status_of_yojson "FirewallStatus") _list path;
     firewall = option_of_yojson (value_for_key firewall_of_yojson "Firewall") _list path;
   }
    : create_firewall_response)

let create_firewall_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone_change_protection =
       option_of_yojson
         (value_for_key boolean__of_yojson "AvailabilityZoneChangeProtection")
         _list path;
     availability_zone_mappings =
       option_of_yojson
         (value_for_key availability_zone_mappings_of_yojson "AvailabilityZoneMappings")
         _list path;
     transit_gateway_id =
       option_of_yojson (value_for_key transit_gateway_id_of_yojson "TransitGatewayId") _list path;
     enabled_analysis_types =
       option_of_yojson
         (value_for_key enabled_analysis_types_of_yojson "EnabledAnalysisTypes")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     firewall_policy_change_protection =
       option_of_yojson
         (value_for_key boolean__of_yojson "FirewallPolicyChangeProtection")
         _list path;
     subnet_change_protection =
       option_of_yojson (value_for_key boolean__of_yojson "SubnetChangeProtection") _list path;
     delete_protection =
       option_of_yojson (value_for_key boolean__of_yojson "DeleteProtection") _list path;
     subnet_mappings =
       option_of_yojson (value_for_key subnet_mappings_of_yojson "SubnetMappings") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     firewall_policy_arn = value_for_key resource_arn_of_yojson "FirewallPolicyArn" _list path;
     firewall_name = value_for_key resource_name_of_yojson "FirewallName" _list path;
   }
    : create_firewall_request)

let create_container_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     status =
       option_of_yojson (value_for_key container_association_status_of_yojson "Status") _list path;
     container_monitoring_configurations =
       option_of_yojson
         (value_for_key container_monitoring_configurations_of_yojson
            "ContainerMonitoringConfigurations")
         _list path;
     type_ = option_of_yojson (value_for_key container_monitoring_type_of_yojson "Type") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     container_association_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ContainerAssociationArn") _list path;
     container_association_name =
       option_of_yojson
         (value_for_key resource_name_of_yojson "ContainerAssociationName")
         _list path;
   }
    : create_container_association_response)

let create_container_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     container_monitoring_configurations =
       value_for_key container_monitoring_configurations_of_yojson
         "ContainerMonitoringConfigurations" _list path;
     type_ = value_for_key container_monitoring_type_of_yojson "Type" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     container_association_name =
       value_for_key resource_name_of_yojson "ContainerAssociationName" _list path;
   }
    : create_container_association_request)

let attach_rule_groups_to_proxy_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     proxy_configuration =
       option_of_yojson
         (value_for_key proxy_configuration_of_yojson "ProxyConfiguration")
         _list path;
   }
    : attach_rule_groups_to_proxy_configuration_response)

let attach_rule_groups_to_proxy_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = value_for_key update_token_of_yojson "UpdateToken" _list path;
     rule_groups = value_for_key proxy_rule_group_attachment_list_of_yojson "RuleGroups" _list path;
     proxy_configuration_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProxyConfigurationArn") _list path;
     proxy_configuration_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ProxyConfigurationName") _list path;
   }
    : attach_rule_groups_to_proxy_configuration_request)

let associate_subnets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     subnet_mappings =
       option_of_yojson (value_for_key subnet_mappings_of_yojson "SubnetMappings") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : associate_subnets_response)

let associate_subnets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_mappings = value_for_key subnet_mappings_of_yojson "SubnetMappings" _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : associate_subnets_request)

let associate_firewall_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     firewall_policy_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "FirewallPolicyArn") _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : associate_firewall_policy_response)

let associate_firewall_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firewall_policy_arn = value_for_key resource_arn_of_yojson "FirewallPolicyArn" _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : associate_firewall_policy_request)

let associate_availability_zones_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
     availability_zone_mappings =
       option_of_yojson
         (value_for_key availability_zone_mappings_of_yojson "AvailabilityZoneMappings")
         _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
   }
    : associate_availability_zones_response)

let associate_availability_zones_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone_mappings =
       value_for_key availability_zone_mappings_of_yojson "AvailabilityZoneMappings" _list path;
     firewall_name =
       option_of_yojson (value_for_key resource_name_of_yojson "FirewallName") _list path;
     firewall_arn = option_of_yojson (value_for_key resource_arn_of_yojson "FirewallArn") _list path;
     update_token = option_of_yojson (value_for_key update_token_of_yojson "UpdateToken") _list path;
   }
    : associate_availability_zones_request)

let accept_network_firewall_transit_gateway_attachment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transit_gateway_attachment_status =
       value_for_key transit_gateway_attachment_status_of_yojson "TransitGatewayAttachmentStatus"
         _list path;
     transit_gateway_attachment_id =
       value_for_key transit_gateway_attachment_id_of_yojson "TransitGatewayAttachmentId" _list path;
   }
    : accept_network_firewall_transit_gateway_attachment_response)

let accept_network_firewall_transit_gateway_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transit_gateway_attachment_id =
       value_for_key transit_gateway_attachment_id_of_yojson "TransitGatewayAttachmentId" _list path;
   }
    : accept_network_firewall_transit_gateway_attachment_request)
