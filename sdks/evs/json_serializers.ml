open Smaws_Lib.Json.SerializeHelpers
open Types

let vpc_id_to_yojson = string_to_yojson
let vm_name_to_yojson = string_to_yojson
let vm_id_to_yojson = string_to_yojson
let vm_id_list_to_yojson tree = list_to_yojson vm_id_to_yojson tree
let environment_id_to_yojson = string_to_yojson
let connector_id_to_yojson = string_to_yojson

let entitlement_type_to_yojson (x : entitlement_type) =
  match x with WINDOWS_SERVER -> `String "WINDOWS_SERVER"

let entitlement_status_to_yojson (x : entitlement_status) =
  match x with
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | ENTITLEMENT_REMOVED -> `String "ENTITLEMENT_REMOVED"
  | AT_RISK -> `String "AT_RISK"
  | DELETED -> `String "DELETED"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let error_detail_to_yojson (x : error_detail) =
  assoc_to_yojson
    [
      ( "errorMessage",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message) );
      ("errorCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_code));
    ]

let vm_entitlement_to_yojson (x : vm_entitlement) =
  assoc_to_yojson
    [
      ("errorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
      ( "stoppedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.stopped_at );
      ( "startedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.started_at );
      ( "lastSyncedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_synced_at );
      ("status", option_to_yojson entitlement_status_to_yojson x.status);
      ("type", option_to_yojson entitlement_type_to_yojson x.type_);
      ("vmName", option_to_yojson vm_name_to_yojson x.vm_name);
      ("connectorId", option_to_yojson connector_id_to_yojson x.connector_id);
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
      ("vmId", option_to_yojson vm_id_to_yojson x.vm_id);
    ]

let vm_entitlement_list_to_yojson tree = list_to_yojson vm_entitlement_to_yojson tree

let vlan_state_to_yojson (x : vlan_state) =
  match x with
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETED -> `String "DELETED"
  | DELETING -> `String "DELETING"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let vlan_id_to_yojson = int_to_yojson
let cidr_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson
let state_details_to_yojson = string_to_yojson
let association_id_to_yojson = string_to_yojson
let allocation_id_to_yojson = string_to_yojson
let ip_address_to_yojson = string_to_yojson

let eip_association_to_yojson (x : eip_association) =
  assoc_to_yojson
    [
      ("ipAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("allocationId", option_to_yojson allocation_id_to_yojson x.allocation_id);
      ("associationId", option_to_yojson association_id_to_yojson x.association_id);
    ]

let eip_association_list_to_yojson tree = list_to_yojson eip_association_to_yojson tree
let network_acl_id_to_yojson = string_to_yojson

let vlan_to_yojson (x : vlan) =
  assoc_to_yojson
    [
      ("networkAclId", option_to_yojson network_acl_id_to_yojson x.network_acl_id);
      ( "isPublic",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_public );
      ("eipAssociations", option_to_yojson eip_association_list_to_yojson x.eip_associations);
      ("stateDetails", option_to_yojson state_details_to_yojson x.state_details);
      ("vlanState", option_to_yojson vlan_state_to_yojson x.vlan_state);
      ( "modifiedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.modified_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("subnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ( "functionName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.function_name );
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ("cidr", option_to_yojson cidr_to_yojson x.cidr);
      ("vlanId", option_to_yojson vlan_id_to_yojson x.vlan_id);
    ]

let vlan_list_to_yojson tree = list_to_yojson vlan_to_yojson tree

let vcf_version_to_yojson (x : vcf_version) =
  match x with
  | SELF_DEPLOYED -> `String "SELF_DEPLOYED"
  | VCF_5_2_2 -> `String "VCF-5.2.2"
  | VCF_5_2_1 -> `String "VCF-5.2.1"

let instance_type_to_yojson (x : instance_type) =
  match x with I7I_METAL_24XL -> `String "i7i.metal-24xl" | I4I_METAL -> `String "i4i.metal"

let instance_type_list_to_yojson tree = list_to_yojson instance_type_to_yojson tree

let vcf_version_info_to_yojson (x : vcf_version_info) =
  assoc_to_yojson
    [
      ("instanceTypes", Some (instance_type_list_to_yojson x.instance_types));
      ( "defaultEsxVersion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.default_esx_version) );
      ("status", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status));
      ("vcfVersion", Some (vcf_version_to_yojson x.vcf_version));
    ]

let vcf_version_list_to_yojson tree = list_to_yojson vcf_version_info_to_yojson tree
let host_name_to_yojson = string_to_yojson

let vcf_hostnames_to_yojson (x : vcf_hostnames) =
  assoc_to_yojson
    [
      ("cloudBuilder", Some (host_name_to_yojson x.cloud_builder));
      ("sddcManager", Some (host_name_to_yojson x.sddc_manager));
      ("nsxEdge2", Some (host_name_to_yojson x.nsx_edge2));
      ("nsxEdge1", Some (host_name_to_yojson x.nsx_edge1));
      ("nsxManager3", Some (host_name_to_yojson x.nsx_manager3));
      ("nsxManager2", Some (host_name_to_yojson x.nsx_manager2));
      ("nsxManager1", Some (host_name_to_yojson x.nsx_manager1));
      ("nsx", Some (host_name_to_yojson x.nsx));
      ("vCenter", Some (host_name_to_yojson x.v_center));
    ]

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "other"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | CANNOT_PARSE -> `String "cannotParse"
  | UNKNOWN_OPERATION -> `String "unknownOperation"

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let v_san_license_key_to_yojson = string_to_yojson

let connector_type_to_yojson (x : connector_type) =
  match x with
  | VCENTER -> `String "VCENTER"
  | SDDC_MANAGER -> `String "SDDC_MANAGER"
  | OPERATIONS_MANAGER -> `String "OPERATIONS_MANAGER"

let appliance_fqdn_to_yojson = string_to_yojson
let secret_identifier_to_yojson = string_to_yojson

let connector_state_to_yojson (x : connector_state) =
  match x with
  | DELETED -> `String "DELETED"
  | DELETING -> `String "DELETING"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATING -> `String "CREATING"

let check_result_to_yojson (x : check_result) =
  match x with
  | UNKNOWN -> `String "UNKNOWN"
  | FAILED -> `String "FAILED"
  | PASSED -> `String "PASSED"

let check_type_to_yojson (x : check_type) =
  match x with
  | CONNECTOR_HEALTH -> `String "CONNECTOR_HEALTH"
  | SDDC_MANAGER_KEY_REUSE -> `String "SDDC_MANAGER_KEY_REUSE"
  | SDDC_MANAGER_KEY_COVERAGE -> `String "SDDC_MANAGER_KEY_COVERAGE"
  | SDDC_MANAGER_HOST_COUNT -> `String "SDDC_MANAGER_HOST_COUNT"
  | SDDC_MANAGER_REACHABILITY -> `String "SDDC_MANAGER_REACHABILITY"
  | OPERATIONS_MANAGER_REACHABILITY -> `String "OPERATIONS_MANAGER_REACHABILITY"
  | VCENTER_VM_EVENT -> `String "VCENTER_VM_EVENT"
  | VCENTER_VM_SYNC -> `String "VCENTER_VM_SYNC"
  | VCENTER_REACHABILITY -> `String "VCENTER_REACHABILITY"
  | HOST_COUNT -> `String "HOST_COUNT"
  | REACHABILITY -> `String "REACHABILITY"
  | KEY_COVERAGE -> `String "KEY_COVERAGE"
  | KEY_REUSE -> `String "KEY_REUSE"

let connector_check_to_yojson (x : connector_check) =
  assoc_to_yojson
    [
      ( "impairedSince",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.impaired_since );
      ( "lastCheckAttempt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_check_attempt );
      ("result", option_to_yojson check_result_to_yojson x.result_);
      ("type", option_to_yojson check_type_to_yojson x.type_);
    ]

let connectors_checks_list_to_yojson tree = list_to_yojson connector_check_to_yojson tree

let connector_to_yojson (x : connector) =
  assoc_to_yojson
    [
      ( "modifiedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.modified_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("checks", option_to_yojson connectors_checks_list_to_yojson x.checks);
      ("status", option_to_yojson check_result_to_yojson x.status);
      ("stateDetails", option_to_yojson state_details_to_yojson x.state_details);
      ("state", option_to_yojson connector_state_to_yojson x.state);
      ("secretArn", option_to_yojson secret_identifier_to_yojson x.secret_arn);
      ("applianceFqdn", option_to_yojson appliance_fqdn_to_yojson x.appliance_fqdn);
      ("type", option_to_yojson connector_type_to_yojson x.type_);
      ("connectorId", option_to_yojson connector_id_to_yojson x.connector_id);
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
    ]

let update_environment_connector_response_to_yojson (x : update_environment_connector_response) =
  assoc_to_yojson [ ("connector", option_to_yojson connector_to_yojson x.connector) ]

let client_token_to_yojson = string_to_yojson

let update_environment_connector_request_to_yojson (x : update_environment_connector_request) =
  assoc_to_yojson
    [
      ("secretIdentifier", option_to_yojson secret_identifier_to_yojson x.secret_identifier);
      ("applianceFqdn", option_to_yojson appliance_fqdn_to_yojson x.appliance_fqdn);
      ("connectorId", Some (connector_id_to_yojson x.connector_id));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let tag_policy_exception_to_yojson (x : tag_policy_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson
let request_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (request_tag_map_to_yojson x.tags));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let solution_key_to_yojson = string_to_yojson
let security_group_id_to_yojson = string_to_yojson
let security_groups_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let service_access_security_groups_to_yojson (x : service_access_security_groups) =
  assoc_to_yojson
    [ ("securityGroups", option_to_yojson security_groups_to_yojson x.security_groups) ]

let secret_to_yojson (x : secret) =
  assoc_to_yojson
    [
      ( "secretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.secret_arn );
    ]

let secret_list_to_yojson tree = list_to_yojson secret_to_yojson tree
let route_server_peering_to_yojson = string_to_yojson
let route_server_peering_list_to_yojson tree = list_to_yojson route_server_peering_to_yojson tree
let response_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let placement_group_id_to_yojson = string_to_yojson
let pagination_token_to_yojson = string_to_yojson
let network_interface_id_to_yojson = string_to_yojson

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ("networkInterfaceId", option_to_yojson network_interface_id_to_yojson x.network_interface_id);
    ]

let network_interface_list_to_yojson tree = list_to_yojson network_interface_to_yojson tree
let max_results_to_yojson = int_to_yojson

let list_vm_entitlements_response_to_yojson (x : list_vm_entitlements_response) =
  assoc_to_yojson
    [
      ("entitlements", option_to_yojson vm_entitlement_list_to_yojson x.entitlements);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_vm_entitlements_request_to_yojson (x : list_vm_entitlements_request) =
  assoc_to_yojson
    [
      ("entitlementType", Some (entitlement_type_to_yojson x.entitlement_type));
      ("connectorId", Some (connector_id_to_yojson x.connector_id));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson response_tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let environment_name_to_yojson = string_to_yojson

let environment_state_to_yojson (x : environment_state) =
  match x with
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETED -> `String "DELETED"
  | DELETING -> `String "DELETING"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let environment_summary_to_yojson (x : environment_summary) =
  assoc_to_yojson
    [
      ("environmentArn", option_to_yojson arn_to_yojson x.environment_arn);
      ( "modifiedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.modified_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("environmentState", option_to_yojson environment_state_to_yojson x.environment_state);
      ("environmentStatus", option_to_yojson check_result_to_yojson x.environment_status);
      ("vcfVersion", option_to_yojson vcf_version_to_yojson x.vcf_version);
      ("environmentName", option_to_yojson environment_name_to_yojson x.environment_name);
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
    ]

let environment_summary_list_to_yojson tree = list_to_yojson environment_summary_to_yojson tree

let list_environments_response_to_yojson (x : list_environments_response) =
  assoc_to_yojson
    [
      ( "environmentSummaries",
        option_to_yojson environment_summary_list_to_yojson x.environment_summaries );
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let environment_state_list_to_yojson tree = list_to_yojson environment_state_to_yojson tree

let list_environments_request_to_yojson (x : list_environments_request) =
  assoc_to_yojson
    [
      ("state", option_to_yojson environment_state_list_to_yojson x.state);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_environment_vlans_response_to_yojson (x : list_environment_vlans_response) =
  assoc_to_yojson
    [
      ("environmentVlans", option_to_yojson vlan_list_to_yojson x.environment_vlans);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_environment_vlans_request_to_yojson (x : list_environment_vlans_request) =
  assoc_to_yojson
    [
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let key_name_to_yojson = string_to_yojson
let dedicated_host_id_to_yojson = string_to_yojson

let host_state_to_yojson (x : host_state) =
  match x with
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETED -> `String "DELETED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let host_to_yojson (x : host) =
  assoc_to_yojson
    [
      ("networkInterfaces", option_to_yojson network_interface_list_to_yojson x.network_interfaces);
      ( "ec2InstanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ec2_instance_id
      );
      ("stateDetails", option_to_yojson state_details_to_yojson x.state_details);
      ("hostState", option_to_yojson host_state_to_yojson x.host_state);
      ( "modifiedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.modified_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("dedicatedHostId", option_to_yojson dedicated_host_id_to_yojson x.dedicated_host_id);
      ("placementGroupId", option_to_yojson placement_group_id_to_yojson x.placement_group_id);
      ("instanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("keyName", option_to_yojson key_name_to_yojson x.key_name);
      ("ipAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("hostName", option_to_yojson host_name_to_yojson x.host_name);
    ]

let host_list_to_yojson tree = list_to_yojson host_to_yojson tree

let list_environment_hosts_response_to_yojson (x : list_environment_hosts_response) =
  assoc_to_yojson
    [
      ("environmentHosts", option_to_yojson host_list_to_yojson x.environment_hosts);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_environment_hosts_request_to_yojson (x : list_environment_hosts_request) =
  assoc_to_yojson
    [
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let connector_list_to_yojson tree = list_to_yojson connector_to_yojson tree

let list_environment_connectors_response_to_yojson (x : list_environment_connectors_response) =
  assoc_to_yojson
    [
      ("connectors", option_to_yojson connector_list_to_yojson x.connectors);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_environment_connectors_request_to_yojson (x : list_environment_connectors_request) =
  assoc_to_yojson
    [
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let license_info_to_yojson (x : license_info) =
  assoc_to_yojson
    [
      ("vsanKey", Some (v_san_license_key_to_yojson x.vsan_key));
      ("solutionKey", Some (solution_key_to_yojson x.solution_key));
    ]

let license_info_list_to_yojson tree = list_to_yojson license_info_to_yojson tree

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let esx_version_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let instance_type_esx_versions_info_to_yojson (x : instance_type_esx_versions_info) =
  assoc_to_yojson
    [
      ("esxVersions", Some (esx_version_list_to_yojson x.esx_versions));
      ("instanceType", Some (instance_type_to_yojson x.instance_type));
    ]

let instance_type_esx_versions_list_to_yojson tree =
  list_to_yojson instance_type_esx_versions_info_to_yojson tree

let initial_vlan_info_to_yojson (x : initial_vlan_info) =
  assoc_to_yojson [ ("cidr", Some (cidr_to_yojson x.cidr)) ]

let initial_vlans_to_yojson (x : initial_vlans) =
  assoc_to_yojson
    [
      ("hcxNetworkAclId", option_to_yojson network_acl_id_to_yojson x.hcx_network_acl_id);
      ( "isHcxPublic",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_hcx_public );
      ("expansionVlan2", Some (initial_vlan_info_to_yojson x.expansion_vlan2));
      ("expansionVlan1", Some (initial_vlan_info_to_yojson x.expansion_vlan1));
      ("hcx", Some (initial_vlan_info_to_yojson x.hcx));
      ("nsxUplink", Some (initial_vlan_info_to_yojson x.nsx_uplink));
      ("edgeVTep", Some (initial_vlan_info_to_yojson x.edge_v_tep));
      ("vTep", Some (initial_vlan_info_to_yojson x.v_tep));
      ("vSan", Some (initial_vlan_info_to_yojson x.v_san));
      ("vMotion", Some (initial_vlan_info_to_yojson x.v_motion));
      ("vmManagement", Some (initial_vlan_info_to_yojson x.vm_management));
      ("vmkManagement", Some (initial_vlan_info_to_yojson x.vmk_management));
    ]

let host_info_for_create_to_yojson (x : host_info_for_create) =
  assoc_to_yojson
    [
      ("dedicatedHostId", option_to_yojson dedicated_host_id_to_yojson x.dedicated_host_id);
      ("placementGroupId", option_to_yojson placement_group_id_to_yojson x.placement_group_id);
      ("instanceType", Some (instance_type_to_yojson x.instance_type));
      ("keyName", Some (key_name_to_yojson x.key_name));
      ("hostName", Some (host_name_to_yojson x.host_name));
    ]

let host_info_for_create_list_to_yojson tree = list_to_yojson host_info_for_create_to_yojson tree

let get_versions_response_to_yojson (x : get_versions_response) =
  assoc_to_yojson
    [
      ( "instanceTypeEsxVersions",
        Some (instance_type_esx_versions_list_to_yojson x.instance_type_esx_versions) );
      ("vcfVersions", Some (vcf_version_list_to_yojson x.vcf_versions));
    ]

let get_versions_request_to_yojson = unit_to_yojson

let check_to_yojson (x : check) =
  assoc_to_yojson
    [
      ( "impairedSince",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.impaired_since );
      ("result", option_to_yojson check_result_to_yojson x.result_);
      ("id", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id);
      ("type", option_to_yojson check_type_to_yojson x.type_);
    ]

let checks_list_to_yojson tree = list_to_yojson check_to_yojson tree

let connectivity_info_to_yojson (x : connectivity_info) =
  assoc_to_yojson
    [
      ( "privateRouteServerPeerings",
        Some (route_server_peering_list_to_yojson x.private_route_server_peerings) );
    ]

let environment_to_yojson (x : environment) =
  assoc_to_yojson
    [
      ("credentials", option_to_yojson secret_list_to_yojson x.credentials);
      ( "serviceAccessSecurityGroups",
        option_to_yojson service_access_security_groups_to_yojson x.service_access_security_groups
      );
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ("vcfHostnames", option_to_yojson vcf_hostnames_to_yojson x.vcf_hostnames);
      ("connectivityInfo", option_to_yojson connectivity_info_to_yojson x.connectivity_info);
      ("checks", option_to_yojson checks_list_to_yojson x.checks);
      ("environmentStatus", option_to_yojson check_result_to_yojson x.environment_status);
      ("siteId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.site_id);
      ("licenseInfo", option_to_yojson license_info_list_to_yojson x.license_info);
      ( "termsAccepted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.terms_accepted
      );
      ("vcfVersion", option_to_yojson vcf_version_to_yojson x.vcf_version);
      ("serviceAccessSubnetId", option_to_yojson subnet_id_to_yojson x.service_access_subnet_id);
      ("vpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("environmentName", option_to_yojson environment_name_to_yojson x.environment_name);
      ("environmentArn", option_to_yojson arn_to_yojson x.environment_arn);
      ( "modifiedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.modified_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("stateDetails", option_to_yojson state_details_to_yojson x.state_details);
      ("environmentState", option_to_yojson environment_state_to_yojson x.environment_state);
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
    ]

let get_environment_response_to_yojson (x : get_environment_response) =
  assoc_to_yojson [ ("environment", option_to_yojson environment_to_yojson x.environment) ]

let get_environment_request_to_yojson (x : get_environment_request) =
  assoc_to_yojson [ ("environmentId", Some (environment_id_to_yojson x.environment_id)) ]

let get_depot_url_response_to_yojson (x : get_depot_url_response) =
  assoc_to_yojson
    [
      ("token", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.token));
      ("depotUrl", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.depot_url));
    ]

let get_depot_url_request_to_yojson (x : get_depot_url_request) =
  assoc_to_yojson
    [
      ("rotate", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.rotate);
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
    ]

let esx_version_to_yojson = string_to_yojson

let disassociate_eip_from_vlan_response_to_yojson (x : disassociate_eip_from_vlan_response) =
  assoc_to_yojson [ ("vlan", option_to_yojson vlan_to_yojson x.vlan) ]

let disassociate_eip_from_vlan_request_to_yojson (x : disassociate_eip_from_vlan_request) =
  assoc_to_yojson
    [
      ("associationId", Some (association_id_to_yojson x.association_id));
      ("vlanName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vlan_name));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_environment_response_to_yojson (x : delete_environment_response) =
  assoc_to_yojson [ ("environment", option_to_yojson environment_to_yojson x.environment) ]

let delete_environment_request_to_yojson (x : delete_environment_request) =
  assoc_to_yojson
    [
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_environment_host_response_to_yojson (x : delete_environment_host_response) =
  assoc_to_yojson
    [
      ("host", option_to_yojson host_to_yojson x.host);
      ("environmentSummary", option_to_yojson environment_summary_to_yojson x.environment_summary);
    ]

let delete_environment_host_request_to_yojson (x : delete_environment_host_request) =
  assoc_to_yojson
    [
      ("hostName", Some (host_name_to_yojson x.host_name));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_environment_connector_response_to_yojson (x : delete_environment_connector_response) =
  assoc_to_yojson
    [
      ("environmentSummary", option_to_yojson environment_summary_to_yojson x.environment_summary);
      ("connector", option_to_yojson connector_to_yojson x.connector);
    ]

let delete_environment_connector_request_to_yojson (x : delete_environment_connector_request) =
  assoc_to_yojson
    [
      ("connectorId", Some (connector_id_to_yojson x.connector_id));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_entitlement_response_to_yojson (x : delete_entitlement_response) =
  assoc_to_yojson
    [ ("entitlements", option_to_yojson vm_entitlement_list_to_yojson x.entitlements) ]

let delete_entitlement_request_to_yojson (x : delete_entitlement_request) =
  assoc_to_yojson
    [
      ("vmIds", Some (vm_id_list_to_yojson x.vm_ids));
      ("entitlementType", Some (entitlement_type_to_yojson x.entitlement_type));
      ("connectorId", Some (connector_id_to_yojson x.connector_id));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_environment_response_to_yojson (x : create_environment_response) =
  assoc_to_yojson [ ("environment", option_to_yojson environment_to_yojson x.environment) ]

let create_environment_request_to_yojson (x : create_environment_request) =
  assoc_to_yojson
    [
      ("siteId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.site_id);
      ("vcfHostnames", option_to_yojson vcf_hostnames_to_yojson x.vcf_hostnames);
      ("hosts", option_to_yojson host_info_for_create_list_to_yojson x.hosts);
      ("licenseInfo", option_to_yojson license_info_list_to_yojson x.license_info);
      ("connectivityInfo", option_to_yojson connectivity_info_to_yojson x.connectivity_info);
      ("initialVlans", Some (initial_vlans_to_yojson x.initial_vlans));
      ( "termsAccepted",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.terms_accepted) );
      ("vcfVersion", Some (vcf_version_to_yojson x.vcf_version));
      ("serviceAccessSubnetId", Some (subnet_id_to_yojson x.service_access_subnet_id));
      ("vpcId", Some (vpc_id_to_yojson x.vpc_id));
      ( "serviceAccessSecurityGroups",
        option_to_yojson service_access_security_groups_to_yojson x.service_access_security_groups
      );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ("environmentName", option_to_yojson environment_name_to_yojson x.environment_name);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_environment_host_response_to_yojson (x : create_environment_host_response) =
  assoc_to_yojson
    [
      ("host", option_to_yojson host_to_yojson x.host);
      ("environmentSummary", option_to_yojson environment_summary_to_yojson x.environment_summary);
    ]

let create_environment_host_request_to_yojson (x : create_environment_host_request) =
  assoc_to_yojson
    [
      ("esxVersion", option_to_yojson esx_version_to_yojson x.esx_version);
      ("host", Some (host_info_for_create_to_yojson x.host));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_environment_connector_response_to_yojson (x : create_environment_connector_response) =
  assoc_to_yojson [ ("connector", option_to_yojson connector_to_yojson x.connector) ]

let create_environment_connector_request_to_yojson (x : create_environment_connector_request) =
  assoc_to_yojson
    [
      ("secretIdentifier", Some (secret_identifier_to_yojson x.secret_identifier));
      ("applianceFqdn", Some (appliance_fqdn_to_yojson x.appliance_fqdn));
      ("type", Some (connector_type_to_yojson x.type_));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_entitlement_response_to_yojson (x : create_entitlement_response) =
  assoc_to_yojson
    [ ("entitlements", option_to_yojson vm_entitlement_list_to_yojson x.entitlements) ]

let create_entitlement_request_to_yojson (x : create_entitlement_request) =
  assoc_to_yojson
    [
      ("vmIds", Some (vm_id_list_to_yojson x.vm_ids));
      ("entitlementType", Some (entitlement_type_to_yojson x.entitlement_type));
      ("connectorId", Some (connector_id_to_yojson x.connector_id));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let associate_eip_to_vlan_response_to_yojson (x : associate_eip_to_vlan_response) =
  assoc_to_yojson [ ("vlan", option_to_yojson vlan_to_yojson x.vlan) ]

let associate_eip_to_vlan_request_to_yojson (x : associate_eip_to_vlan_request) =
  assoc_to_yojson
    [
      ("allocationId", Some (allocation_id_to_yojson x.allocation_id));
      ("vlanName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vlan_name));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]
