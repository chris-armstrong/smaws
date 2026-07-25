open Smaws_Lib.Json.SerializeHelpers
open Types

let allocation_id_to_yojson = string_to_yojson

let tag_policy_exception_to_yojson (x : tag_policy_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson
let request_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tags", Some (request_tag_map_to_yojson x.tags));
    ]

let response_tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson response_tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let esx_version_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let instance_type_to_yojson (x : instance_type) =
  match x with I4I_METAL -> `String "i4i.metal" | I7I_METAL_24XL -> `String "i7i.metal-24xl"

let instance_type_esx_versions_info_to_yojson (x : instance_type_esx_versions_info) =
  assoc_to_yojson
    [
      ("instanceType", Some (instance_type_to_yojson x.instance_type));
      ("esxVersions", Some (esx_version_list_to_yojson x.esx_versions));
    ]

let instance_type_esx_versions_list_to_yojson tree =
  list_to_yojson instance_type_esx_versions_info_to_yojson tree

let instance_type_list_to_yojson tree = list_to_yojson instance_type_to_yojson tree

let vcf_version_to_yojson (x : vcf_version) =
  match x with
  | VCF_5_2_1 -> `String "VCF-5.2.1"
  | VCF_5_2_2 -> `String "VCF-5.2.2"
  | SELF_DEPLOYED -> `String "SELF_DEPLOYED"

let vcf_version_info_to_yojson (x : vcf_version_info) =
  assoc_to_yojson
    [
      ("vcfVersion", Some (vcf_version_to_yojson x.vcf_version));
      ("status", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status));
      ( "defaultEsxVersion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.default_esx_version) );
      ("instanceTypes", Some (instance_type_list_to_yojson x.instance_types));
    ]

let vcf_version_list_to_yojson tree = list_to_yojson vcf_version_info_to_yojson tree

let get_versions_response_to_yojson (x : get_versions_response) =
  assoc_to_yojson
    [
      ("vcfVersions", Some (vcf_version_list_to_yojson x.vcf_versions));
      ( "instanceTypeEsxVersions",
        Some (instance_type_esx_versions_list_to_yojson x.instance_type_esx_versions) );
    ]

let get_versions_request_to_yojson = unit_to_yojson
let appliance_fqdn_to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | UNKNOWN_OPERATION -> `String "unknownOperation"
  | CANNOT_PARSE -> `String "cannotParse"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | OTHER -> `String "other"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
    ]

let network_acl_id_to_yojson = string_to_yojson
let ip_address_to_yojson = string_to_yojson
let association_id_to_yojson = string_to_yojson

let eip_association_to_yojson (x : eip_association) =
  assoc_to_yojson
    [
      ("associationId", option_to_yojson association_id_to_yojson x.association_id);
      ("allocationId", option_to_yojson allocation_id_to_yojson x.allocation_id);
      ("ipAddress", option_to_yojson ip_address_to_yojson x.ip_address);
    ]

let eip_association_list_to_yojson tree = list_to_yojson eip_association_to_yojson tree
let state_details_to_yojson = string_to_yojson

let vlan_state_to_yojson (x : vlan_state) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"
  | CREATE_FAILED -> `String "CREATE_FAILED"

let subnet_id_to_yojson = string_to_yojson
let cidr_to_yojson = string_to_yojson
let vlan_id_to_yojson = int_to_yojson

let vlan_to_yojson (x : vlan) =
  assoc_to_yojson
    [
      ("vlanId", option_to_yojson vlan_id_to_yojson x.vlan_id);
      ("cidr", option_to_yojson cidr_to_yojson x.cidr);
      ( "availabilityZone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.availability_zone
      );
      ( "functionName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.function_name );
      ("subnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "modifiedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.modified_at );
      ("vlanState", option_to_yojson vlan_state_to_yojson x.vlan_state);
      ("stateDetails", option_to_yojson state_details_to_yojson x.state_details);
      ("eipAssociations", option_to_yojson eip_association_list_to_yojson x.eip_associations);
      ( "isPublic",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_public );
      ("networkAclId", option_to_yojson network_acl_id_to_yojson x.network_acl_id);
    ]

let associate_eip_to_vlan_response_to_yojson (x : associate_eip_to_vlan_response) =
  assoc_to_yojson [ ("vlan", option_to_yojson vlan_to_yojson x.vlan) ]

let environment_id_to_yojson = string_to_yojson
let client_token_to_yojson = string_to_yojson

let associate_eip_to_vlan_request_to_yojson (x : associate_eip_to_vlan_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("vlanName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vlan_name));
      ("allocationId", Some (allocation_id_to_yojson x.allocation_id));
    ]

let check_result_to_yojson (x : check_result) =
  match x with
  | PASSED -> `String "PASSED"
  | FAILED -> `String "FAILED"
  | UNKNOWN -> `String "UNKNOWN"

let check_type_to_yojson (x : check_type) =
  match x with
  | KEY_REUSE -> `String "KEY_REUSE"
  | KEY_COVERAGE -> `String "KEY_COVERAGE"
  | REACHABILITY -> `String "REACHABILITY"
  | HOST_COUNT -> `String "HOST_COUNT"
  | VCENTER_REACHABILITY -> `String "VCENTER_REACHABILITY"
  | VCENTER_VM_SYNC -> `String "VCENTER_VM_SYNC"
  | VCENTER_VM_EVENT -> `String "VCENTER_VM_EVENT"
  | OPERATIONS_MANAGER_REACHABILITY -> `String "OPERATIONS_MANAGER_REACHABILITY"
  | SDDC_MANAGER_REACHABILITY -> `String "SDDC_MANAGER_REACHABILITY"
  | SDDC_MANAGER_HOST_COUNT -> `String "SDDC_MANAGER_HOST_COUNT"
  | SDDC_MANAGER_KEY_COVERAGE -> `String "SDDC_MANAGER_KEY_COVERAGE"
  | SDDC_MANAGER_KEY_REUSE -> `String "SDDC_MANAGER_KEY_REUSE"
  | CONNECTOR_HEALTH -> `String "CONNECTOR_HEALTH"

let check_to_yojson (x : check) =
  assoc_to_yojson
    [
      ("type", option_to_yojson check_type_to_yojson x.type_);
      ("id", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id);
      ("result", option_to_yojson check_result_to_yojson x.result_);
      ( "impairedSince",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.impaired_since );
    ]

let checks_list_to_yojson tree = list_to_yojson check_to_yojson tree
let route_server_peering_to_yojson = string_to_yojson
let route_server_peering_list_to_yojson tree = list_to_yojson route_server_peering_to_yojson tree

let connectivity_info_to_yojson (x : connectivity_info) =
  assoc_to_yojson
    [
      ( "privateRouteServerPeerings",
        Some (route_server_peering_list_to_yojson x.private_route_server_peerings) );
    ]

let connector_check_to_yojson (x : connector_check) =
  assoc_to_yojson
    [
      ("type", option_to_yojson check_type_to_yojson x.type_);
      ("result", option_to_yojson check_result_to_yojson x.result_);
      ( "lastCheckAttempt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_check_attempt );
      ( "impairedSince",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.impaired_since );
    ]

let connectors_checks_list_to_yojson tree = list_to_yojson connector_check_to_yojson tree

let connector_state_to_yojson (x : connector_state) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"

let secret_identifier_to_yojson = string_to_yojson

let connector_type_to_yojson (x : connector_type) =
  match x with
  | OPERATIONS_MANAGER -> `String "OPERATIONS_MANAGER"
  | SDDC_MANAGER -> `String "SDDC_MANAGER"
  | VCENTER -> `String "VCENTER"

let connector_id_to_yojson = string_to_yojson

let connector_to_yojson (x : connector) =
  assoc_to_yojson
    [
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
      ("connectorId", option_to_yojson connector_id_to_yojson x.connector_id);
      ("type", option_to_yojson connector_type_to_yojson x.type_);
      ("applianceFqdn", option_to_yojson appliance_fqdn_to_yojson x.appliance_fqdn);
      ("secretArn", option_to_yojson secret_identifier_to_yojson x.secret_arn);
      ("state", option_to_yojson connector_state_to_yojson x.state);
      ("stateDetails", option_to_yojson state_details_to_yojson x.state_details);
      ("status", option_to_yojson check_result_to_yojson x.status);
      ("checks", option_to_yojson connectors_checks_list_to_yojson x.checks);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "modifiedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.modified_at );
    ]

let connector_list_to_yojson tree = list_to_yojson connector_to_yojson tree

let error_detail_to_yojson (x : error_detail) =
  assoc_to_yojson
    [
      ("errorCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_code));
      ( "errorMessage",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message) );
    ]

let entitlement_status_to_yojson (x : entitlement_status) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | DELETED -> `String "DELETED"
  | AT_RISK -> `String "AT_RISK"
  | ENTITLEMENT_REMOVED -> `String "ENTITLEMENT_REMOVED"
  | CREATE_FAILED -> `String "CREATE_FAILED"

let entitlement_type_to_yojson (x : entitlement_type) =
  match x with WINDOWS_SERVER -> `String "WINDOWS_SERVER"

let vm_name_to_yojson = string_to_yojson
let vm_id_to_yojson = string_to_yojson

let vm_entitlement_to_yojson (x : vm_entitlement) =
  assoc_to_yojson
    [
      ("vmId", option_to_yojson vm_id_to_yojson x.vm_id);
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
      ("connectorId", option_to_yojson connector_id_to_yojson x.connector_id);
      ("vmName", option_to_yojson vm_name_to_yojson x.vm_name);
      ("type", option_to_yojson entitlement_type_to_yojson x.type_);
      ("status", option_to_yojson entitlement_status_to_yojson x.status);
      ( "lastSyncedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_synced_at );
      ( "startedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.started_at );
      ( "stoppedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.stopped_at );
      ("errorDetail", option_to_yojson error_detail_to_yojson x.error_detail);
    ]

let vm_entitlement_list_to_yojson tree = list_to_yojson vm_entitlement_to_yojson tree

let create_entitlement_response_to_yojson (x : create_entitlement_response) =
  assoc_to_yojson
    [ ("entitlements", option_to_yojson vm_entitlement_list_to_yojson x.entitlements) ]

let vm_id_list_to_yojson tree = list_to_yojson vm_id_to_yojson tree

let create_entitlement_request_to_yojson (x : create_entitlement_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("connectorId", Some (connector_id_to_yojson x.connector_id));
      ("entitlementType", Some (entitlement_type_to_yojson x.entitlement_type));
      ("vmIds", Some (vm_id_list_to_yojson x.vm_ids));
    ]

let secret_to_yojson (x : secret) =
  assoc_to_yojson
    [
      ( "secretArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.secret_arn );
    ]

let secret_list_to_yojson tree = list_to_yojson secret_to_yojson tree
let security_group_id_to_yojson = string_to_yojson
let security_groups_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let service_access_security_groups_to_yojson (x : service_access_security_groups) =
  assoc_to_yojson
    [ ("securityGroups", option_to_yojson security_groups_to_yojson x.security_groups) ]

let host_name_to_yojson = string_to_yojson

let vcf_hostnames_to_yojson (x : vcf_hostnames) =
  assoc_to_yojson
    [
      ("vCenter", Some (host_name_to_yojson x.v_center));
      ("nsx", Some (host_name_to_yojson x.nsx));
      ("nsxManager1", Some (host_name_to_yojson x.nsx_manager1));
      ("nsxManager2", Some (host_name_to_yojson x.nsx_manager2));
      ("nsxManager3", Some (host_name_to_yojson x.nsx_manager3));
      ("nsxEdge1", Some (host_name_to_yojson x.nsx_edge1));
      ("nsxEdge2", Some (host_name_to_yojson x.nsx_edge2));
      ("sddcManager", Some (host_name_to_yojson x.sddc_manager));
      ("cloudBuilder", Some (host_name_to_yojson x.cloud_builder));
    ]

let v_san_license_key_to_yojson = string_to_yojson
let solution_key_to_yojson = string_to_yojson

let license_info_to_yojson (x : license_info) =
  assoc_to_yojson
    [
      ("solutionKey", Some (solution_key_to_yojson x.solution_key));
      ("vsanKey", Some (v_san_license_key_to_yojson x.vsan_key));
    ]

let license_info_list_to_yojson tree = list_to_yojson license_info_to_yojson tree
let vpc_id_to_yojson = string_to_yojson
let environment_name_to_yojson = string_to_yojson

let environment_state_to_yojson (x : environment_state) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"
  | CREATE_FAILED -> `String "CREATE_FAILED"

let environment_to_yojson (x : environment) =
  assoc_to_yojson
    [
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
      ("environmentState", option_to_yojson environment_state_to_yojson x.environment_state);
      ("stateDetails", option_to_yojson state_details_to_yojson x.state_details);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "modifiedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.modified_at );
      ("environmentArn", option_to_yojson arn_to_yojson x.environment_arn);
      ("environmentName", option_to_yojson environment_name_to_yojson x.environment_name);
      ("vpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("serviceAccessSubnetId", option_to_yojson subnet_id_to_yojson x.service_access_subnet_id);
      ("vcfVersion", option_to_yojson vcf_version_to_yojson x.vcf_version);
      ( "termsAccepted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.terms_accepted
      );
      ("licenseInfo", option_to_yojson license_info_list_to_yojson x.license_info);
      ("siteId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.site_id);
      ("environmentStatus", option_to_yojson check_result_to_yojson x.environment_status);
      ("checks", option_to_yojson checks_list_to_yojson x.checks);
      ("connectivityInfo", option_to_yojson connectivity_info_to_yojson x.connectivity_info);
      ("vcfHostnames", option_to_yojson vcf_hostnames_to_yojson x.vcf_hostnames);
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ( "serviceAccessSecurityGroups",
        option_to_yojson service_access_security_groups_to_yojson x.service_access_security_groups
      );
      ("credentials", option_to_yojson secret_list_to_yojson x.credentials);
    ]

let create_environment_response_to_yojson (x : create_environment_response) =
  assoc_to_yojson [ ("environment", option_to_yojson environment_to_yojson x.environment) ]

let dedicated_host_id_to_yojson = string_to_yojson
let placement_group_id_to_yojson = string_to_yojson
let key_name_to_yojson = string_to_yojson

let host_info_for_create_to_yojson (x : host_info_for_create) =
  assoc_to_yojson
    [
      ("hostName", Some (host_name_to_yojson x.host_name));
      ("keyName", Some (key_name_to_yojson x.key_name));
      ("instanceType", Some (instance_type_to_yojson x.instance_type));
      ("placementGroupId", option_to_yojson placement_group_id_to_yojson x.placement_group_id);
      ("dedicatedHostId", option_to_yojson dedicated_host_id_to_yojson x.dedicated_host_id);
    ]

let host_info_for_create_list_to_yojson tree = list_to_yojson host_info_for_create_to_yojson tree

let initial_vlan_info_to_yojson (x : initial_vlan_info) =
  assoc_to_yojson [ ("cidr", Some (cidr_to_yojson x.cidr)) ]

let initial_vlans_to_yojson (x : initial_vlans) =
  assoc_to_yojson
    [
      ("vmkManagement", Some (initial_vlan_info_to_yojson x.vmk_management));
      ("vmManagement", Some (initial_vlan_info_to_yojson x.vm_management));
      ("vMotion", Some (initial_vlan_info_to_yojson x.v_motion));
      ("vSan", Some (initial_vlan_info_to_yojson x.v_san));
      ("vTep", Some (initial_vlan_info_to_yojson x.v_tep));
      ("edgeVTep", Some (initial_vlan_info_to_yojson x.edge_v_tep));
      ("nsxUplink", Some (initial_vlan_info_to_yojson x.nsx_uplink));
      ("hcx", Some (initial_vlan_info_to_yojson x.hcx));
      ("expansionVlan1", Some (initial_vlan_info_to_yojson x.expansion_vlan1));
      ("expansionVlan2", Some (initial_vlan_info_to_yojson x.expansion_vlan2));
      ( "isHcxPublic",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_hcx_public );
      ("hcxNetworkAclId", option_to_yojson network_acl_id_to_yojson x.hcx_network_acl_id);
    ]

let create_environment_request_to_yojson (x : create_environment_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("environmentName", option_to_yojson environment_name_to_yojson x.environment_name);
      ( "kmsKeyId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_id );
      ("tags", option_to_yojson request_tag_map_to_yojson x.tags);
      ( "serviceAccessSecurityGroups",
        option_to_yojson service_access_security_groups_to_yojson x.service_access_security_groups
      );
      ("vpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("serviceAccessSubnetId", Some (subnet_id_to_yojson x.service_access_subnet_id));
      ("vcfVersion", Some (vcf_version_to_yojson x.vcf_version));
      ( "termsAccepted",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.terms_accepted) );
      ("initialVlans", Some (initial_vlans_to_yojson x.initial_vlans));
      ("connectivityInfo", option_to_yojson connectivity_info_to_yojson x.connectivity_info);
      ("licenseInfo", option_to_yojson license_info_list_to_yojson x.license_info);
      ("hosts", option_to_yojson host_info_for_create_list_to_yojson x.hosts);
      ("vcfHostnames", option_to_yojson vcf_hostnames_to_yojson x.vcf_hostnames);
      ("siteId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.site_id);
    ]

let create_environment_connector_response_to_yojson (x : create_environment_connector_response) =
  assoc_to_yojson [ ("connector", option_to_yojson connector_to_yojson x.connector) ]

let create_environment_connector_request_to_yojson (x : create_environment_connector_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("type", Some (connector_type_to_yojson x.type_));
      ("applianceFqdn", Some (appliance_fqdn_to_yojson x.appliance_fqdn));
      ("secretIdentifier", Some (secret_identifier_to_yojson x.secret_identifier));
    ]

let network_interface_id_to_yojson = string_to_yojson

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ("networkInterfaceId", option_to_yojson network_interface_id_to_yojson x.network_interface_id);
    ]

let network_interface_list_to_yojson tree = list_to_yojson network_interface_to_yojson tree

let host_state_to_yojson (x : host_state) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let host_to_yojson (x : host) =
  assoc_to_yojson
    [
      ("hostName", option_to_yojson host_name_to_yojson x.host_name);
      ("ipAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("keyName", option_to_yojson key_name_to_yojson x.key_name);
      ("instanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("placementGroupId", option_to_yojson placement_group_id_to_yojson x.placement_group_id);
      ("dedicatedHostId", option_to_yojson dedicated_host_id_to_yojson x.dedicated_host_id);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "modifiedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.modified_at );
      ("hostState", option_to_yojson host_state_to_yojson x.host_state);
      ("stateDetails", option_to_yojson state_details_to_yojson x.state_details);
      ( "ec2InstanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ec2_instance_id
      );
      ("networkInterfaces", option_to_yojson network_interface_list_to_yojson x.network_interfaces);
    ]

let environment_summary_to_yojson (x : environment_summary) =
  assoc_to_yojson
    [
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
      ("environmentName", option_to_yojson environment_name_to_yojson x.environment_name);
      ("vcfVersion", option_to_yojson vcf_version_to_yojson x.vcf_version);
      ("environmentStatus", option_to_yojson check_result_to_yojson x.environment_status);
      ("environmentState", option_to_yojson environment_state_to_yojson x.environment_state);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "modifiedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.modified_at );
      ("environmentArn", option_to_yojson arn_to_yojson x.environment_arn);
    ]

let create_environment_host_response_to_yojson (x : create_environment_host_response) =
  assoc_to_yojson
    [
      ("environmentSummary", option_to_yojson environment_summary_to_yojson x.environment_summary);
      ("host", option_to_yojson host_to_yojson x.host);
    ]

let esx_version_to_yojson = string_to_yojson

let create_environment_host_request_to_yojson (x : create_environment_host_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("host", Some (host_info_for_create_to_yojson x.host));
      ("esxVersion", option_to_yojson esx_version_to_yojson x.esx_version);
    ]

let delete_entitlement_response_to_yojson (x : delete_entitlement_response) =
  assoc_to_yojson
    [ ("entitlements", option_to_yojson vm_entitlement_list_to_yojson x.entitlements) ]

let delete_entitlement_request_to_yojson (x : delete_entitlement_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("connectorId", Some (connector_id_to_yojson x.connector_id));
      ("entitlementType", Some (entitlement_type_to_yojson x.entitlement_type));
      ("vmIds", Some (vm_id_list_to_yojson x.vm_ids));
    ]

let delete_environment_response_to_yojson (x : delete_environment_response) =
  assoc_to_yojson [ ("environment", option_to_yojson environment_to_yojson x.environment) ]

let delete_environment_request_to_yojson (x : delete_environment_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
    ]

let delete_environment_connector_response_to_yojson (x : delete_environment_connector_response) =
  assoc_to_yojson
    [
      ("connector", option_to_yojson connector_to_yojson x.connector);
      ("environmentSummary", option_to_yojson environment_summary_to_yojson x.environment_summary);
    ]

let delete_environment_connector_request_to_yojson (x : delete_environment_connector_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("connectorId", Some (connector_id_to_yojson x.connector_id));
    ]

let delete_environment_host_response_to_yojson (x : delete_environment_host_response) =
  assoc_to_yojson
    [
      ("environmentSummary", option_to_yojson environment_summary_to_yojson x.environment_summary);
      ("host", option_to_yojson host_to_yojson x.host);
    ]

let delete_environment_host_request_to_yojson (x : delete_environment_host_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("hostName", Some (host_name_to_yojson x.host_name));
    ]

let disassociate_eip_from_vlan_response_to_yojson (x : disassociate_eip_from_vlan_response) =
  assoc_to_yojson [ ("vlan", option_to_yojson vlan_to_yojson x.vlan) ]

let disassociate_eip_from_vlan_request_to_yojson (x : disassociate_eip_from_vlan_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("vlanName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.vlan_name));
      ("associationId", Some (association_id_to_yojson x.association_id));
    ]

let environment_state_list_to_yojson tree = list_to_yojson environment_state_to_yojson tree
let environment_summary_list_to_yojson tree = list_to_yojson environment_summary_to_yojson tree

let get_depot_url_response_to_yojson (x : get_depot_url_response) =
  assoc_to_yojson
    [
      ("depotUrl", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.depot_url));
      ("token", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.token));
    ]

let get_depot_url_request_to_yojson (x : get_depot_url_request) =
  assoc_to_yojson
    [
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("rotate", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.rotate);
    ]

let get_environment_response_to_yojson (x : get_environment_response) =
  assoc_to_yojson [ ("environment", option_to_yojson environment_to_yojson x.environment) ]

let get_environment_request_to_yojson (x : get_environment_request) =
  assoc_to_yojson [ ("environmentId", Some (environment_id_to_yojson x.environment_id)) ]

let host_list_to_yojson tree = list_to_yojson host_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let list_environment_connectors_response_to_yojson (x : list_environment_connectors_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("connectors", option_to_yojson connector_list_to_yojson x.connectors);
    ]

let max_results_to_yojson = int_to_yojson

let list_environment_connectors_request_to_yojson (x : list_environment_connectors_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
    ]

let list_environment_hosts_response_to_yojson (x : list_environment_hosts_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("environmentHosts", option_to_yojson host_list_to_yojson x.environment_hosts);
    ]

let list_environment_hosts_request_to_yojson (x : list_environment_hosts_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
    ]

let vlan_list_to_yojson tree = list_to_yojson vlan_to_yojson tree

let list_environment_vlans_response_to_yojson (x : list_environment_vlans_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("environmentVlans", option_to_yojson vlan_list_to_yojson x.environment_vlans);
    ]

let list_environment_vlans_request_to_yojson (x : list_environment_vlans_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
    ]

let list_environments_response_to_yojson (x : list_environments_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "environmentSummaries",
        option_to_yojson environment_summary_list_to_yojson x.environment_summaries );
    ]

let list_environments_request_to_yojson (x : list_environments_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("state", option_to_yojson environment_state_list_to_yojson x.state);
    ]

let list_vm_entitlements_response_to_yojson (x : list_vm_entitlements_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("entitlements", option_to_yojson vm_entitlement_list_to_yojson x.entitlements);
    ]

let list_vm_entitlements_request_to_yojson (x : list_vm_entitlements_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("connectorId", Some (connector_id_to_yojson x.connector_id));
      ("entitlementType", Some (entitlement_type_to_yojson x.entitlement_type));
    ]

let update_environment_connector_response_to_yojson (x : update_environment_connector_response) =
  assoc_to_yojson [ ("connector", option_to_yojson connector_to_yojson x.connector) ]

let update_environment_connector_request_to_yojson (x : update_environment_connector_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("connectorId", Some (connector_id_to_yojson x.connector_id));
      ("applianceFqdn", option_to_yojson appliance_fqdn_to_yojson x.appliance_fqdn);
      ("secretIdentifier", option_to_yojson secret_identifier_to_yojson x.secret_identifier);
    ]
