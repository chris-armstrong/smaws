open Smaws_Lib.Json.DeserializeHelpers
open Types

let cluster_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIPS" -> FIPS
    | `String "NON_FIPS" -> NON_FIPS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClusterMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterMode")
     : cluster_mode)
    : cluster_mode)

let hsm_type_of_yojson = string_of_yojson
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
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let cluster_id_of_yojson = string_of_yojson
let backup_id_of_yojson = string_of_yojson
let region_of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson

let backup_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "READY" -> READY
    | `String "DELETED" -> DELETED
    | `String "PENDING_DELETION" -> PENDING_DELETION
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackupState" value)
    | _ -> raise (deserialize_wrong_type_error path "BackupState")
     : backup_state)
    : backup_state)

let backup_arn_of_yojson = string_of_yojson

let backup_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_id = value_for_key backup_id_of_yojson "BackupId" _list path;
     backup_arn = option_of_yojson (value_for_key backup_arn_of_yojson "BackupArn") _list path;
     backup_state = option_of_yojson (value_for_key backup_state_of_yojson "BackupState") _list path;
     cluster_id = option_of_yojson (value_for_key cluster_id_of_yojson "ClusterId") _list path;
     create_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "CreateTimestamp") _list path;
     copy_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "CopyTimestamp") _list path;
     never_expires = option_of_yojson (value_for_key boolean__of_yojson "NeverExpires") _list path;
     source_region = option_of_yojson (value_for_key region_of_yojson "SourceRegion") _list path;
     source_backup = option_of_yojson (value_for_key backup_id_of_yojson "SourceBackup") _list path;
     source_cluster =
       option_of_yojson (value_for_key cluster_id_of_yojson "SourceCluster") _list path;
     delete_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "DeleteTimestamp") _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path;
     hsm_type = option_of_yojson (value_for_key hsm_type_of_yojson "HsmType") _list path;
     mode = option_of_yojson (value_for_key cluster_mode_of_yojson "Mode") _list path;
   }
    : backup)

let backup_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEFAULT" -> DEFAULT
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackupPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "BackupPolicy")
     : backup_policy)
    : backup_policy)

let backup_retention_value_of_yojson = string_of_yojson

let backup_retention_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DAYS" -> DAYS
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackupRetentionType" value)
    | _ -> raise (deserialize_wrong_type_error path "BackupRetentionType")
     : backup_retention_type)
    : backup_retention_type)

let backup_retention_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key backup_retention_type_of_yojson "Type") _list path;
     value = option_of_yojson (value_for_key backup_retention_value_of_yojson "Value") _list path;
   }
    : backup_retention_policy)

let backups_of_yojson tree path = list_of_yojson backup_of_yojson tree path
let backups_max_size_of_yojson = int_of_yojson
let error_message_of_yojson = string_of_yojson

let cloud_hsm_tag_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cloud_hsm_tag_exception)

let cloud_hsm_service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cloud_hsm_service_exception)

let cloud_hsm_resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cloud_hsm_resource_not_found_exception)

let cloud_hsm_invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cloud_hsm_invalid_request_exception)

let cloud_hsm_internal_failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cloud_hsm_internal_failure_exception)

let cloud_hsm_access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cloud_hsm_access_denied_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let resource_id_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     tag_key_list = value_for_key tag_key_list_of_yojson "TagKeyList" _list path;
   }
    : untag_resource_request)

let cloud_hsm_resource_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cloud_hsm_resource_limit_exceeded_exception)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     tag_list = value_for_key tag_list_of_yojson "TagList" _list path;
   }
    : tag_resource_request)

let restore_backup_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ backup = option_of_yojson (value_for_key backup_of_yojson "Backup") _list path }
    : restore_backup_response)

let restore_backup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ backup_id = value_for_key backup_id_of_yojson "BackupId" _list path } : restore_backup_request)

let resource_policy_of_yojson = string_of_yojson
let cloud_hsm_arn_of_yojson = string_of_yojson

let put_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key cloud_hsm_arn_of_yojson "ResourceArn") _list path;
     policy = option_of_yojson (value_for_key resource_policy_of_yojson "Policy") _list path;
   }
    : put_resource_policy_response)

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key cloud_hsm_arn_of_yojson "ResourceArn") _list path;
     policy = option_of_yojson (value_for_key resource_policy_of_yojson "Policy") _list path;
   }
    : put_resource_policy_request)

let cert_of_yojson = string_of_yojson

let certificates_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_csr = option_of_yojson (value_for_key cert_of_yojson "ClusterCsr") _list path;
     hsm_certificate = option_of_yojson (value_for_key cert_of_yojson "HsmCertificate") _list path;
     aws_hardware_certificate =
       option_of_yojson (value_for_key cert_of_yojson "AwsHardwareCertificate") _list path;
     manufacturer_hardware_certificate =
       option_of_yojson (value_for_key cert_of_yojson "ManufacturerHardwareCertificate") _list path;
     cluster_certificate =
       option_of_yojson (value_for_key cert_of_yojson "ClusterCertificate") _list path;
   }
    : certificates)

let network_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPV4" -> IPV4
    | `String "DUALSTACK" -> DUALSTACK
    | `String value -> raise (deserialize_unknown_enum_value_error path "NetworkType" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkType")
     : network_type)
    : network_type)

let vpc_id_of_yojson = string_of_yojson
let subnet_id_of_yojson = string_of_yojson
let external_az_of_yojson = string_of_yojson

let external_subnet_mapping_of_yojson tree path =
  map_of_yojson external_az_of_yojson subnet_id_of_yojson tree path

let state_message_of_yojson = string_of_yojson

let cluster_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "UNINITIALIZED" -> UNINITIALIZED
    | `String "INITIALIZE_IN_PROGRESS" -> INITIALIZE_IN_PROGRESS
    | `String "INITIALIZED" -> INITIALIZED
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "MODIFY_IN_PROGRESS" -> MODIFY_IN_PROGRESS
    | `String "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETED" -> DELETED
    | `String "DEGRADED" -> DEGRADED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClusterState" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterState")
     : cluster_state)
    : cluster_state)

let security_group_of_yojson = string_of_yojson
let pre_co_password_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson

let hsm_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "ACTIVE" -> ACTIVE
    | `String "DEGRADED" -> DEGRADED
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETED" -> DELETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "HsmState" value)
    | _ -> raise (deserialize_wrong_type_error path "HsmState")
     : hsm_state)
    : hsm_state)

let hsm_id_of_yojson = string_of_yojson
let ip_v6_address_of_yojson = string_of_yojson
let ip_address_of_yojson = string_of_yojson
let eni_id_of_yojson = string_of_yojson

let hsm_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zone =
       option_of_yojson (value_for_key external_az_of_yojson "AvailabilityZone") _list path;
     cluster_id = option_of_yojson (value_for_key cluster_id_of_yojson "ClusterId") _list path;
     subnet_id = option_of_yojson (value_for_key subnet_id_of_yojson "SubnetId") _list path;
     eni_id = option_of_yojson (value_for_key eni_id_of_yojson "EniId") _list path;
     eni_ip = option_of_yojson (value_for_key ip_address_of_yojson "EniIp") _list path;
     eni_ip_v6 = option_of_yojson (value_for_key ip_v6_address_of_yojson "EniIpV6") _list path;
     hsm_id = value_for_key hsm_id_of_yojson "HsmId" _list path;
     hsm_type = option_of_yojson (value_for_key hsm_type_of_yojson "HsmType") _list path;
     state = option_of_yojson (value_for_key hsm_state_of_yojson "State") _list path;
     state_message = option_of_yojson (value_for_key string__of_yojson "StateMessage") _list path;
   }
    : hsm)

let hsms_of_yojson tree path = list_of_yojson hsm_of_yojson tree path

let cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_policy =
       option_of_yojson (value_for_key backup_policy_of_yojson "BackupPolicy") _list path;
     backup_retention_policy =
       option_of_yojson
         (value_for_key backup_retention_policy_of_yojson "BackupRetentionPolicy")
         _list path;
     cluster_id = option_of_yojson (value_for_key cluster_id_of_yojson "ClusterId") _list path;
     create_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "CreateTimestamp") _list path;
     hsms = option_of_yojson (value_for_key hsms_of_yojson "Hsms") _list path;
     hsm_type = option_of_yojson (value_for_key hsm_type_of_yojson "HsmType") _list path;
     hsm_type_rollback_expiration =
       option_of_yojson (value_for_key timestamp_of_yojson "HsmTypeRollbackExpiration") _list path;
     pre_co_password =
       option_of_yojson (value_for_key pre_co_password_of_yojson "PreCoPassword") _list path;
     security_group =
       option_of_yojson (value_for_key security_group_of_yojson "SecurityGroup") _list path;
     source_backup_id =
       option_of_yojson (value_for_key backup_id_of_yojson "SourceBackupId") _list path;
     state = option_of_yojson (value_for_key cluster_state_of_yojson "State") _list path;
     state_message =
       option_of_yojson (value_for_key state_message_of_yojson "StateMessage") _list path;
     subnet_mapping =
       option_of_yojson (value_for_key external_subnet_mapping_of_yojson "SubnetMapping") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
     certificates =
       option_of_yojson (value_for_key certificates_of_yojson "Certificates") _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path;
     mode = option_of_yojson (value_for_key cluster_mode_of_yojson "Mode") _list path;
   }
    : cluster)

let modify_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : modify_cluster_response)

let modify_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hsm_type = option_of_yojson (value_for_key hsm_type_of_yojson "HsmType") _list path;
     backup_retention_policy =
       option_of_yojson
         (value_for_key backup_retention_policy_of_yojson "BackupRetentionPolicy")
         _list path;
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
   }
    : modify_cluster_request)

let modify_backup_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ backup = option_of_yojson (value_for_key backup_of_yojson "Backup") _list path }
    : modify_backup_attributes_response)

let modify_backup_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_id = value_for_key backup_id_of_yojson "BackupId" _list path;
     never_expires = value_for_key boolean__of_yojson "NeverExpires" _list path;
   }
    : modify_backup_attributes_request)

let next_token_of_yojson = string_of_yojson

let list_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_list = value_for_key tag_list_of_yojson "TagList" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_response)

let max_size_of_yojson = int_of_yojson

let list_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_size_of_yojson "MaxResults") _list path;
   }
    : list_tags_request)

let initialize_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key cluster_state_of_yojson "State") _list path;
     state_message =
       option_of_yojson (value_for_key state_message_of_yojson "StateMessage") _list path;
   }
    : initialize_cluster_response)

let initialize_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
     signed_cert = value_for_key cert_of_yojson "SignedCert" _list path;
     trust_anchor = value_for_key cert_of_yojson "TrustAnchor" _list path;
   }
    : initialize_cluster_request)

let get_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = option_of_yojson (value_for_key resource_policy_of_yojson "Policy") _list path }
    : get_resource_policy_response)

let get_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key cloud_hsm_arn_of_yojson "ResourceArn") _list path;
   }
    : get_resource_policy_request)

let clusters_of_yojson tree path = list_of_yojson cluster_of_yojson tree path

let describe_clusters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clusters = option_of_yojson (value_for_key clusters_of_yojson "Clusters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_clusters_response)

let clusters_max_size_of_yojson = int_of_yojson
let strings_of_yojson tree path = list_of_yojson string__of_yojson tree path
let field_of_yojson = string_of_yojson
let filters_of_yojson tree path = map_of_yojson field_of_yojson strings_of_yojson tree path

let describe_clusters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key clusters_max_size_of_yojson "MaxResults") _list path;
   }
    : describe_clusters_request)

let describe_backups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backups = option_of_yojson (value_for_key backups_of_yojson "Backups") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_backups_response)

let describe_backups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key backups_max_size_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     shared = option_of_yojson (value_for_key boolean__of_yojson "Shared") _list path;
     sort_ascending = option_of_yojson (value_for_key boolean__of_yojson "SortAscending") _list path;
   }
    : describe_backups_request)

let delete_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key cloud_hsm_arn_of_yojson "ResourceArn") _list path;
     policy = option_of_yojson (value_for_key resource_policy_of_yojson "Policy") _list path;
   }
    : delete_resource_policy_response)

let delete_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key cloud_hsm_arn_of_yojson "ResourceArn") _list path;
   }
    : delete_resource_policy_request)

let delete_hsm_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hsm_id = option_of_yojson (value_for_key hsm_id_of_yojson "HsmId") _list path }
    : delete_hsm_response)

let delete_hsm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
     hsm_id = option_of_yojson (value_for_key hsm_id_of_yojson "HsmId") _list path;
     eni_id = option_of_yojson (value_for_key eni_id_of_yojson "EniId") _list path;
     eni_ip = option_of_yojson (value_for_key ip_address_of_yojson "EniIp") _list path;
   }
    : delete_hsm_request)

let delete_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : delete_cluster_response)

let delete_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path }
    : delete_cluster_request)

let delete_backup_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ backup = option_of_yojson (value_for_key backup_of_yojson "Backup") _list path }
    : delete_backup_response)

let delete_backup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ backup_id = value_for_key backup_id_of_yojson "BackupId" _list path } : delete_backup_request)

let create_hsm_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hsm = option_of_yojson (value_for_key hsm_of_yojson "Hsm") _list path } : create_hsm_response)

let create_hsm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_id = value_for_key cluster_id_of_yojson "ClusterId" _list path;
     availability_zone = value_for_key external_az_of_yojson "AvailabilityZone" _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
   }
    : create_hsm_request)

let create_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : create_cluster_response)

let subnet_ids_of_yojson tree path = list_of_yojson subnet_id_of_yojson tree path

let create_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_retention_policy =
       option_of_yojson
         (value_for_key backup_retention_policy_of_yojson "BackupRetentionPolicy")
         _list path;
     hsm_type = value_for_key hsm_type_of_yojson "HsmType" _list path;
     source_backup_id =
       option_of_yojson (value_for_key backup_arn_of_yojson "SourceBackupId") _list path;
     subnet_ids = value_for_key subnet_ids_of_yojson "SubnetIds" _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path;
     mode = option_of_yojson (value_for_key cluster_mode_of_yojson "Mode") _list path;
   }
    : create_cluster_request)

let destination_backup_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "CreateTimestamp") _list path;
     source_region = option_of_yojson (value_for_key region_of_yojson "SourceRegion") _list path;
     source_backup = option_of_yojson (value_for_key backup_id_of_yojson "SourceBackup") _list path;
     source_cluster =
       option_of_yojson (value_for_key cluster_id_of_yojson "SourceCluster") _list path;
   }
    : destination_backup)

let copy_backup_to_region_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_backup =
       option_of_yojson (value_for_key destination_backup_of_yojson "DestinationBackup") _list path;
   }
    : copy_backup_to_region_response)

let copy_backup_to_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_region = value_for_key region_of_yojson "DestinationRegion" _list path;
     backup_id = value_for_key backup_id_of_yojson "BackupId" _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path;
   }
    : copy_backup_to_region_request)
