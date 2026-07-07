open Smaws_Lib.Json.DeserializeHelpers
open Types

let vpc_id_of_yojson = string_of_yojson
let vm_name_of_yojson = string_of_yojson
let vm_id_of_yojson = string_of_yojson
let vm_id_list_of_yojson tree path = list_of_yojson vm_id_of_yojson tree path
let environment_id_of_yojson = string_of_yojson
let connector_id_of_yojson = string_of_yojson

let entitlement_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WINDOWS_SERVER" -> WINDOWS_SERVER
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntitlementType" value)
    | _ -> raise (deserialize_wrong_type_error path "EntitlementType")
     : entitlement_type)
    : entitlement_type)

let entitlement_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "ENTITLEMENT_REMOVED" -> ENTITLEMENT_REMOVED
    | `String "AT_RISK" -> AT_RISK
    | `String "DELETED" -> DELETED
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntitlementStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EntitlementStatus")
     : entitlement_status)
    : entitlement_status)

let error_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage" _list
         path;
     error_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorCode" _list
         path;
   }
    : error_detail)

let vm_entitlement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_detail = option_of_yojson (value_for_key error_detail_of_yojson "errorDetail") _list path;
     stopped_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "stoppedAt")
         _list path;
     started_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "startedAt")
         _list path;
     last_synced_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "lastSyncedAt")
         _list path;
     status = option_of_yojson (value_for_key entitlement_status_of_yojson "status") _list path;
     type_ = option_of_yojson (value_for_key entitlement_type_of_yojson "type") _list path;
     vm_name = option_of_yojson (value_for_key vm_name_of_yojson "vmName") _list path;
     connector_id = option_of_yojson (value_for_key connector_id_of_yojson "connectorId") _list path;
     environment_id =
       option_of_yojson (value_for_key environment_id_of_yojson "environmentId") _list path;
     vm_id = option_of_yojson (value_for_key vm_id_of_yojson "vmId") _list path;
   }
    : vm_entitlement)

let vm_entitlement_list_of_yojson tree path = list_of_yojson vm_entitlement_of_yojson tree path

let vlan_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETED" -> DELETED
    | `String "DELETING" -> DELETING
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "VlanState" value)
    | _ -> raise (deserialize_wrong_type_error path "VlanState")
     : vlan_state)
    : vlan_state)

let vlan_id_of_yojson = int_of_yojson
let cidr_of_yojson = string_of_yojson
let subnet_id_of_yojson = string_of_yojson
let state_details_of_yojson = string_of_yojson
let association_id_of_yojson = string_of_yojson
let allocation_id_of_yojson = string_of_yojson
let ip_address_of_yojson = string_of_yojson

let eip_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "ipAddress") _list path;
     allocation_id =
       option_of_yojson (value_for_key allocation_id_of_yojson "allocationId") _list path;
     association_id =
       option_of_yojson (value_for_key association_id_of_yojson "associationId") _list path;
   }
    : eip_association)

let eip_association_list_of_yojson tree path = list_of_yojson eip_association_of_yojson tree path
let network_acl_id_of_yojson = string_of_yojson

let vlan_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_acl_id =
       option_of_yojson (value_for_key network_acl_id_of_yojson "networkAclId") _list path;
     is_public =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "isPublic")
         _list path;
     eip_associations =
       option_of_yojson (value_for_key eip_association_list_of_yojson "eipAssociations") _list path;
     state_details =
       option_of_yojson (value_for_key state_details_of_yojson "stateDetails") _list path;
     vlan_state = option_of_yojson (value_for_key vlan_state_of_yojson "vlanState") _list path;
     modified_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "modifiedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     subnet_id = option_of_yojson (value_for_key subnet_id_of_yojson "subnetId") _list path;
     function_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "functionName")
         _list path;
     availability_zone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "availabilityZone")
         _list path;
     cidr = option_of_yojson (value_for_key cidr_of_yojson "cidr") _list path;
     vlan_id = option_of_yojson (value_for_key vlan_id_of_yojson "vlanId") _list path;
   }
    : vlan)

let vlan_list_of_yojson tree path = list_of_yojson vlan_of_yojson tree path

let vcf_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "SELF_DEPLOYED" -> SELF_DEPLOYED
    | `String "VCF-5.2.2" -> VCF_5_2_2
    | `String "VCF-5.2.1" -> VCF_5_2_1
    | `String value -> raise (deserialize_unknown_enum_value_error path "VcfVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "VcfVersion")
     : vcf_version)
    : vcf_version)

let instance_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "i7i.metal-24xl" -> I7I_METAL_24XL
    | `String "i4i.metal" -> I4I_METAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceType" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceType")
     : instance_type)
    : instance_type)

let instance_type_list_of_yojson tree path = list_of_yojson instance_type_of_yojson tree path

let vcf_version_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_types = value_for_key instance_type_list_of_yojson "instanceTypes" _list path;
     default_esx_version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "defaultEsxVersion"
         _list path;
     status =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "status" _list path;
     vcf_version = value_for_key vcf_version_of_yojson "vcfVersion" _list path;
   }
    : vcf_version_info)

let vcf_version_list_of_yojson tree path = list_of_yojson vcf_version_info_of_yojson tree path
let host_name_of_yojson = string_of_yojson

let vcf_hostnames_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_builder = value_for_key host_name_of_yojson "cloudBuilder" _list path;
     sddc_manager = value_for_key host_name_of_yojson "sddcManager" _list path;
     nsx_edge2 = value_for_key host_name_of_yojson "nsxEdge2" _list path;
     nsx_edge1 = value_for_key host_name_of_yojson "nsxEdge1" _list path;
     nsx_manager3 = value_for_key host_name_of_yojson "nsxManager3" _list path;
     nsx_manager2 = value_for_key host_name_of_yojson "nsxManager2" _list path;
     nsx_manager1 = value_for_key host_name_of_yojson "nsxManager1" _list path;
     nsx = value_for_key host_name_of_yojson "nsx" _list path;
     v_center = value_for_key host_name_of_yojson "vCenter" _list path;
   }
    : vcf_hostnames)

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "other" -> OTHER
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_list =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fieldList")
         _list path;
     reason = value_for_key validation_exception_reason_of_yojson "reason" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception)

let v_san_license_key_of_yojson = string_of_yojson

let connector_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VCENTER" -> VCENTER
    | `String "SDDC_MANAGER" -> SDDC_MANAGER
    | `String "OPERATIONS_MANAGER" -> OPERATIONS_MANAGER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectorType")
     : connector_type)
    : connector_type)

let appliance_fqdn_of_yojson = string_of_yojson
let secret_identifier_of_yojson = string_of_yojson

let connector_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETED" -> DELETED
    | `String "DELETING" -> DELETING
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "UPDATING" -> UPDATING
    | `String "ACTIVE" -> ACTIVE
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectorState" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectorState")
     : connector_state)
    : connector_state)

let check_result_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNKNOWN" -> UNKNOWN
    | `String "FAILED" -> FAILED
    | `String "PASSED" -> PASSED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CheckResult" value)
    | _ -> raise (deserialize_wrong_type_error path "CheckResult")
     : check_result)
    : check_result)

let check_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONNECTOR_HEALTH" -> CONNECTOR_HEALTH
    | `String "SDDC_MANAGER_KEY_REUSE" -> SDDC_MANAGER_KEY_REUSE
    | `String "SDDC_MANAGER_KEY_COVERAGE" -> SDDC_MANAGER_KEY_COVERAGE
    | `String "SDDC_MANAGER_HOST_COUNT" -> SDDC_MANAGER_HOST_COUNT
    | `String "SDDC_MANAGER_REACHABILITY" -> SDDC_MANAGER_REACHABILITY
    | `String "OPERATIONS_MANAGER_REACHABILITY" -> OPERATIONS_MANAGER_REACHABILITY
    | `String "VCENTER_VM_EVENT" -> VCENTER_VM_EVENT
    | `String "VCENTER_VM_SYNC" -> VCENTER_VM_SYNC
    | `String "VCENTER_REACHABILITY" -> VCENTER_REACHABILITY
    | `String "HOST_COUNT" -> HOST_COUNT
    | `String "REACHABILITY" -> REACHABILITY
    | `String "KEY_COVERAGE" -> KEY_COVERAGE
    | `String "KEY_REUSE" -> KEY_REUSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "CheckType" value)
    | _ -> raise (deserialize_wrong_type_error path "CheckType")
     : check_type)
    : check_type)

let connector_check_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     impaired_since =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "impairedSince")
         _list path;
     last_check_attempt =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "lastCheckAttempt")
         _list path;
     result_ = option_of_yojson (value_for_key check_result_of_yojson "result") _list path;
     type_ = option_of_yojson (value_for_key check_type_of_yojson "type") _list path;
   }
    : connector_check)

let connectors_checks_list_of_yojson tree path = list_of_yojson connector_check_of_yojson tree path

let connector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     modified_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "modifiedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     checks = option_of_yojson (value_for_key connectors_checks_list_of_yojson "checks") _list path;
     status = option_of_yojson (value_for_key check_result_of_yojson "status") _list path;
     state_details =
       option_of_yojson (value_for_key state_details_of_yojson "stateDetails") _list path;
     state = option_of_yojson (value_for_key connector_state_of_yojson "state") _list path;
     secret_arn =
       option_of_yojson (value_for_key secret_identifier_of_yojson "secretArn") _list path;
     appliance_fqdn =
       option_of_yojson (value_for_key appliance_fqdn_of_yojson "applianceFqdn") _list path;
     type_ = option_of_yojson (value_for_key connector_type_of_yojson "type") _list path;
     connector_id = option_of_yojson (value_for_key connector_id_of_yojson "connectorId") _list path;
     environment_id =
       option_of_yojson (value_for_key environment_id_of_yojson "environmentId") _list path;
   }
    : connector)

let update_environment_connector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connector = option_of_yojson (value_for_key connector_of_yojson "connector") _list path }
    : update_environment_connector_response)

let client_token_of_yojson = string_of_yojson

let update_environment_connector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_identifier =
       option_of_yojson (value_for_key secret_identifier_of_yojson "secretIdentifier") _list path;
     appliance_fqdn =
       option_of_yojson (value_for_key appliance_fqdn_of_yojson "applianceFqdn") _list path;
     connector_id = value_for_key connector_id_of_yojson "connectorId" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : update_environment_connector_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retryAfterSeconds")
         _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : resource_not_found_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_keys_of_yojson "tagKeys" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : untag_resource_request)

let tag_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : tag_policy_exception)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : too_many_tags_exception)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let request_tag_map_of_yojson tree path =
  map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key request_tag_map_of_yojson "tags" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : tag_resource_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : service_quota_exceeded_exception)

let solution_key_of_yojson = string_of_yojson
let security_group_id_of_yojson = string_of_yojson
let security_groups_of_yojson tree path = list_of_yojson security_group_id_of_yojson tree path

let service_access_security_groups_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_groups =
       option_of_yojson (value_for_key security_groups_of_yojson "securityGroups") _list path;
   }
    : service_access_security_groups)

let secret_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "secretArn")
         _list path;
   }
    : secret)

let secret_list_of_yojson tree path = list_of_yojson secret_of_yojson tree path
let route_server_peering_of_yojson = string_of_yojson

let route_server_peering_list_of_yojson tree path =
  list_of_yojson route_server_peering_of_yojson tree path

let response_tag_map_of_yojson tree path =
  map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let placement_group_id_of_yojson = string_of_yojson
let pagination_token_of_yojson = string_of_yojson
let network_interface_id_of_yojson = string_of_yojson

let network_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_interface_id =
       option_of_yojson
         (value_for_key network_interface_id_of_yojson "networkInterfaceId")
         _list path;
   }
    : network_interface)

let network_interface_list_of_yojson tree path =
  list_of_yojson network_interface_of_yojson tree path

let max_results_of_yojson = int_of_yojson

let list_vm_entitlements_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entitlements =
       option_of_yojson (value_for_key vm_entitlement_list_of_yojson "entitlements") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_vm_entitlements_response)

let list_vm_entitlements_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entitlement_type = value_for_key entitlement_type_of_yojson "entitlementType" _list path;
     connector_id = value_for_key connector_id_of_yojson "connectorId" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_vm_entitlements_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key response_tag_map_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let environment_name_of_yojson = string_of_yojson

let environment_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETED" -> DELETED
    | `String "DELETING" -> DELETING
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnvironmentState" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentState")
     : environment_state)
    : environment_state)

let environment_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_arn = option_of_yojson (value_for_key arn_of_yojson "environmentArn") _list path;
     modified_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "modifiedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     environment_state =
       option_of_yojson (value_for_key environment_state_of_yojson "environmentState") _list path;
     environment_status =
       option_of_yojson (value_for_key check_result_of_yojson "environmentStatus") _list path;
     vcf_version = option_of_yojson (value_for_key vcf_version_of_yojson "vcfVersion") _list path;
     environment_name =
       option_of_yojson (value_for_key environment_name_of_yojson "environmentName") _list path;
     environment_id =
       option_of_yojson (value_for_key environment_id_of_yojson "environmentId") _list path;
   }
    : environment_summary)

let environment_summary_list_of_yojson tree path =
  list_of_yojson environment_summary_of_yojson tree path

let list_environments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_summaries =
       option_of_yojson
         (value_for_key environment_summary_list_of_yojson "environmentSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_environments_response)

let environment_state_list_of_yojson tree path =
  list_of_yojson environment_state_of_yojson tree path

let list_environments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key environment_state_list_of_yojson "state") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_environments_request)

let list_environment_vlans_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_vlans =
       option_of_yojson (value_for_key vlan_list_of_yojson "environmentVlans") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_environment_vlans_response)

let list_environment_vlans_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_environment_vlans_request)

let key_name_of_yojson = string_of_yojson
let dedicated_host_id_of_yojson = string_of_yojson

let host_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETED" -> DELETED
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "HostState" value)
    | _ -> raise (deserialize_wrong_type_error path "HostState")
     : host_state)
    : host_state)

let host_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_interfaces =
       option_of_yojson
         (value_for_key network_interface_list_of_yojson "networkInterfaces")
         _list path;
     ec2_instance_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ec2InstanceId")
         _list path;
     state_details =
       option_of_yojson (value_for_key state_details_of_yojson "stateDetails") _list path;
     host_state = option_of_yojson (value_for_key host_state_of_yojson "hostState") _list path;
     modified_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "modifiedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     dedicated_host_id =
       option_of_yojson (value_for_key dedicated_host_id_of_yojson "dedicatedHostId") _list path;
     placement_group_id =
       option_of_yojson (value_for_key placement_group_id_of_yojson "placementGroupId") _list path;
     instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "instanceType") _list path;
     key_name = option_of_yojson (value_for_key key_name_of_yojson "keyName") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "ipAddress") _list path;
     host_name = option_of_yojson (value_for_key host_name_of_yojson "hostName") _list path;
   }
    : host)

let host_list_of_yojson tree path = list_of_yojson host_of_yojson tree path

let list_environment_hosts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_hosts =
       option_of_yojson (value_for_key host_list_of_yojson "environmentHosts") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_environment_hosts_response)

let list_environment_hosts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_environment_hosts_request)

let connector_list_of_yojson tree path = list_of_yojson connector_of_yojson tree path

let list_environment_connectors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connectors = option_of_yojson (value_for_key connector_list_of_yojson "connectors") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_environment_connectors_response)

let list_environment_connectors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_environment_connectors_request)

let license_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vsan_key = value_for_key v_san_license_key_of_yojson "vsanKey" _list path;
     solution_key = value_for_key solution_key_of_yojson "solutionKey" _list path;
   }
    : license_info)

let license_info_list_of_yojson tree path = list_of_yojson license_info_of_yojson tree path

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let esx_version_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let instance_type_esx_versions_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     esx_versions = value_for_key esx_version_list_of_yojson "esxVersions" _list path;
     instance_type = value_for_key instance_type_of_yojson "instanceType" _list path;
   }
    : instance_type_esx_versions_info)

let instance_type_esx_versions_list_of_yojson tree path =
  list_of_yojson instance_type_esx_versions_info_of_yojson tree path

let initial_vlan_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cidr = value_for_key cidr_of_yojson "cidr" _list path } : initial_vlan_info)

let initial_vlans_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hcx_network_acl_id =
       option_of_yojson (value_for_key network_acl_id_of_yojson "hcxNetworkAclId") _list path;
     is_hcx_public =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "isHcxPublic")
         _list path;
     expansion_vlan2 = value_for_key initial_vlan_info_of_yojson "expansionVlan2" _list path;
     expansion_vlan1 = value_for_key initial_vlan_info_of_yojson "expansionVlan1" _list path;
     hcx = value_for_key initial_vlan_info_of_yojson "hcx" _list path;
     nsx_uplink = value_for_key initial_vlan_info_of_yojson "nsxUplink" _list path;
     edge_v_tep = value_for_key initial_vlan_info_of_yojson "edgeVTep" _list path;
     v_tep = value_for_key initial_vlan_info_of_yojson "vTep" _list path;
     v_san = value_for_key initial_vlan_info_of_yojson "vSan" _list path;
     v_motion = value_for_key initial_vlan_info_of_yojson "vMotion" _list path;
     vm_management = value_for_key initial_vlan_info_of_yojson "vmManagement" _list path;
     vmk_management = value_for_key initial_vlan_info_of_yojson "vmkManagement" _list path;
   }
    : initial_vlans)

let host_info_for_create_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dedicated_host_id =
       option_of_yojson (value_for_key dedicated_host_id_of_yojson "dedicatedHostId") _list path;
     placement_group_id =
       option_of_yojson (value_for_key placement_group_id_of_yojson "placementGroupId") _list path;
     instance_type = value_for_key instance_type_of_yojson "instanceType" _list path;
     key_name = value_for_key key_name_of_yojson "keyName" _list path;
     host_name = value_for_key host_name_of_yojson "hostName" _list path;
   }
    : host_info_for_create)

let host_info_for_create_list_of_yojson tree path =
  list_of_yojson host_info_for_create_of_yojson tree path

let get_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_type_esx_versions =
       value_for_key instance_type_esx_versions_list_of_yojson "instanceTypeEsxVersions" _list path;
     vcf_versions = value_for_key vcf_version_list_of_yojson "vcfVersions" _list path;
   }
    : get_versions_response)

let get_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let check_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     impaired_since =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "impairedSince")
         _list path;
     result_ = option_of_yojson (value_for_key check_result_of_yojson "result") _list path;
     id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "id")
         _list path;
     type_ = option_of_yojson (value_for_key check_type_of_yojson "type") _list path;
   }
    : check)

let checks_list_of_yojson tree path = list_of_yojson check_of_yojson tree path

let connectivity_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     private_route_server_peerings =
       value_for_key route_server_peering_list_of_yojson "privateRouteServerPeerings" _list path;
   }
    : connectivity_info)

let environment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credentials = option_of_yojson (value_for_key secret_list_of_yojson "credentials") _list path;
     service_access_security_groups =
       option_of_yojson
         (value_for_key service_access_security_groups_of_yojson "serviceAccessSecurityGroups")
         _list path;
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId")
         _list path;
     vcf_hostnames =
       option_of_yojson (value_for_key vcf_hostnames_of_yojson "vcfHostnames") _list path;
     connectivity_info =
       option_of_yojson (value_for_key connectivity_info_of_yojson "connectivityInfo") _list path;
     checks = option_of_yojson (value_for_key checks_list_of_yojson "checks") _list path;
     environment_status =
       option_of_yojson (value_for_key check_result_of_yojson "environmentStatus") _list path;
     site_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "siteId")
         _list path;
     license_info =
       option_of_yojson (value_for_key license_info_list_of_yojson "licenseInfo") _list path;
     terms_accepted =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "termsAccepted")
         _list path;
     vcf_version = option_of_yojson (value_for_key vcf_version_of_yojson "vcfVersion") _list path;
     service_access_subnet_id =
       option_of_yojson (value_for_key subnet_id_of_yojson "serviceAccessSubnetId") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "vpcId") _list path;
     environment_name =
       option_of_yojson (value_for_key environment_name_of_yojson "environmentName") _list path;
     environment_arn = option_of_yojson (value_for_key arn_of_yojson "environmentArn") _list path;
     modified_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "modifiedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     state_details =
       option_of_yojson (value_for_key state_details_of_yojson "stateDetails") _list path;
     environment_state =
       option_of_yojson (value_for_key environment_state_of_yojson "environmentState") _list path;
     environment_id =
       option_of_yojson (value_for_key environment_id_of_yojson "environmentId") _list path;
   }
    : environment)

let get_environment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment = option_of_yojson (value_for_key environment_of_yojson "environment") _list path }
    : get_environment_response)

let get_environment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment_id = value_for_key environment_id_of_yojson "environmentId" _list path }
    : get_environment_request)

let get_depot_url_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "token" _list path;
     depot_url =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "depotUrl" _list path;
   }
    : get_depot_url_response)

let get_depot_url_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rotate =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "rotate")
         _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
   }
    : get_depot_url_request)

let esx_version_of_yojson = string_of_yojson

let disassociate_eip_from_vlan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vlan = option_of_yojson (value_for_key vlan_of_yojson "vlan") _list path }
    : disassociate_eip_from_vlan_response)

let disassociate_eip_from_vlan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id = value_for_key association_id_of_yojson "associationId" _list path;
     vlan_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vlanName" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : disassociate_eip_from_vlan_request)

let delete_environment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment = option_of_yojson (value_for_key environment_of_yojson "environment") _list path }
    : delete_environment_response)

let delete_environment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : delete_environment_request)

let delete_environment_host_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host = option_of_yojson (value_for_key host_of_yojson "host") _list path;
     environment_summary =
       option_of_yojson
         (value_for_key environment_summary_of_yojson "environmentSummary")
         _list path;
   }
    : delete_environment_host_response)

let delete_environment_host_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_name = value_for_key host_name_of_yojson "hostName" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : delete_environment_host_request)

let delete_environment_connector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_summary =
       option_of_yojson
         (value_for_key environment_summary_of_yojson "environmentSummary")
         _list path;
     connector = option_of_yojson (value_for_key connector_of_yojson "connector") _list path;
   }
    : delete_environment_connector_response)

let delete_environment_connector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connector_id = value_for_key connector_id_of_yojson "connectorId" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : delete_environment_connector_request)

let delete_entitlement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entitlements =
       option_of_yojson (value_for_key vm_entitlement_list_of_yojson "entitlements") _list path;
   }
    : delete_entitlement_response)

let delete_entitlement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vm_ids = value_for_key vm_id_list_of_yojson "vmIds" _list path;
     entitlement_type = value_for_key entitlement_type_of_yojson "entitlementType" _list path;
     connector_id = value_for_key connector_id_of_yojson "connectorId" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : delete_entitlement_request)

let create_environment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment = option_of_yojson (value_for_key environment_of_yojson "environment") _list path }
    : create_environment_response)

let create_environment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     site_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "siteId")
         _list path;
     vcf_hostnames =
       option_of_yojson (value_for_key vcf_hostnames_of_yojson "vcfHostnames") _list path;
     hosts = option_of_yojson (value_for_key host_info_for_create_list_of_yojson "hosts") _list path;
     license_info =
       option_of_yojson (value_for_key license_info_list_of_yojson "licenseInfo") _list path;
     connectivity_info =
       option_of_yojson (value_for_key connectivity_info_of_yojson "connectivityInfo") _list path;
     initial_vlans = value_for_key initial_vlans_of_yojson "initialVlans" _list path;
     terms_accepted =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "termsAccepted"
         _list path;
     vcf_version = value_for_key vcf_version_of_yojson "vcfVersion" _list path;
     service_access_subnet_id = value_for_key subnet_id_of_yojson "serviceAccessSubnetId" _list path;
     vpc_id = value_for_key vpc_id_of_yojson "vpcId" _list path;
     service_access_security_groups =
       option_of_yojson
         (value_for_key service_access_security_groups_of_yojson "serviceAccessSecurityGroups")
         _list path;
     tags = option_of_yojson (value_for_key request_tag_map_of_yojson "tags") _list path;
     kms_key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyId")
         _list path;
     environment_name =
       option_of_yojson (value_for_key environment_name_of_yojson "environmentName") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : create_environment_request)

let create_environment_host_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host = option_of_yojson (value_for_key host_of_yojson "host") _list path;
     environment_summary =
       option_of_yojson
         (value_for_key environment_summary_of_yojson "environmentSummary")
         _list path;
   }
    : create_environment_host_response)

let create_environment_host_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     esx_version = option_of_yojson (value_for_key esx_version_of_yojson "esxVersion") _list path;
     host = value_for_key host_info_for_create_of_yojson "host" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : create_environment_host_request)

let create_environment_connector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connector = option_of_yojson (value_for_key connector_of_yojson "connector") _list path }
    : create_environment_connector_response)

let create_environment_connector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_identifier = value_for_key secret_identifier_of_yojson "secretIdentifier" _list path;
     appliance_fqdn = value_for_key appliance_fqdn_of_yojson "applianceFqdn" _list path;
     type_ = value_for_key connector_type_of_yojson "type" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : create_environment_connector_request)

let create_entitlement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entitlements =
       option_of_yojson (value_for_key vm_entitlement_list_of_yojson "entitlements") _list path;
   }
    : create_entitlement_response)

let create_entitlement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vm_ids = value_for_key vm_id_list_of_yojson "vmIds" _list path;
     entitlement_type = value_for_key entitlement_type_of_yojson "entitlementType" _list path;
     connector_id = value_for_key connector_id_of_yojson "connectorId" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : create_entitlement_request)

let associate_eip_to_vlan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vlan = option_of_yojson (value_for_key vlan_of_yojson "vlan") _list path }
    : associate_eip_to_vlan_response)

let associate_eip_to_vlan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allocation_id = value_for_key allocation_id_of_yojson "allocationId" _list path;
     vlan_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "vlanName" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : associate_eip_to_vlan_request)
