open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson
let vpc_id_to_yojson = string_to_yojson
let untag_resource_response_to_yojson = unit_to_yojson
let resource_id_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeyList", Some (tag_key_list_to_yojson x.tag_key_list));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let cloud_hsm_tag_exception_to_yojson (x : cloud_hsm_tag_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let cloud_hsm_service_exception_to_yojson (x : cloud_hsm_service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let cloud_hsm_resource_not_found_exception_to_yojson (x : cloud_hsm_resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let cloud_hsm_invalid_request_exception_to_yojson (x : cloud_hsm_invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let cloud_hsm_internal_failure_exception_to_yojson (x : cloud_hsm_internal_failure_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let cloud_hsm_access_denied_exception_to_yojson (x : cloud_hsm_access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("TagList", Some (tag_list_to_yojson x.tag_list));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let cloud_hsm_resource_limit_exceeded_exception_to_yojson
    (x : cloud_hsm_resource_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let subnet_id_to_yojson = string_to_yojson
let subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let string__to_yojson = string_to_yojson
let strings_to_yojson tree = list_to_yojson string__to_yojson tree
let state_message_to_yojson = string_to_yojson
let security_group_to_yojson = string_to_yojson
let backup_id_to_yojson = string_to_yojson
let backup_arn_to_yojson = string_to_yojson

let backup_state_to_yojson (x : backup_state) =
  match x with
  | PENDING_DELETION -> `String "PENDING_DELETION"
  | DELETED -> `String "DELETED"
  | READY -> `String "READY"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"

let cluster_id_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson
let region_to_yojson = string_to_yojson
let hsm_type_to_yojson = string_to_yojson

let cluster_mode_to_yojson (x : cluster_mode) =
  match x with NON_FIPS -> `String "NON_FIPS" | FIPS -> `String "FIPS"

let backup_to_yojson (x : backup) =
  assoc_to_yojson
    [
      ("Mode", option_to_yojson cluster_mode_to_yojson x.mode);
      ("HsmType", option_to_yojson hsm_type_to_yojson x.hsm_type);
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("DeleteTimestamp", option_to_yojson timestamp_to_yojson x.delete_timestamp);
      ("SourceCluster", option_to_yojson cluster_id_to_yojson x.source_cluster);
      ("SourceBackup", option_to_yojson backup_id_to_yojson x.source_backup);
      ("SourceRegion", option_to_yojson region_to_yojson x.source_region);
      ("NeverExpires", option_to_yojson boolean__to_yojson x.never_expires);
      ("CopyTimestamp", option_to_yojson timestamp_to_yojson x.copy_timestamp);
      ("CreateTimestamp", option_to_yojson timestamp_to_yojson x.create_timestamp);
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("BackupState", option_to_yojson backup_state_to_yojson x.backup_state);
      ("BackupArn", option_to_yojson backup_arn_to_yojson x.backup_arn);
      ("BackupId", Some (backup_id_to_yojson x.backup_id));
    ]

let restore_backup_response_to_yojson (x : restore_backup_response) =
  assoc_to_yojson [ ("Backup", option_to_yojson backup_to_yojson x.backup) ]

let restore_backup_request_to_yojson (x : restore_backup_request) =
  assoc_to_yojson [ ("BackupId", Some (backup_id_to_yojson x.backup_id)) ]

let resource_policy_to_yojson = string_to_yojson
let cloud_hsm_arn_to_yojson = string_to_yojson

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
      ("ResourceArn", option_to_yojson cloud_hsm_arn_to_yojson x.resource_arn);
    ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
      ("ResourceArn", option_to_yojson cloud_hsm_arn_to_yojson x.resource_arn);
    ]

let pre_co_password_to_yojson = string_to_yojson
let next_token_to_yojson = string_to_yojson

let network_type_to_yojson (x : network_type) =
  match x with DUALSTACK -> `String "DUALSTACK" | IPV4 -> `String "IPV4"

let backup_policy_to_yojson (x : backup_policy) = match x with DEFAULT -> `String "DEFAULT"

let backup_retention_type_to_yojson (x : backup_retention_type) =
  match x with DAYS -> `String "DAYS"

let backup_retention_value_to_yojson = string_to_yojson

let backup_retention_policy_to_yojson (x : backup_retention_policy) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson backup_retention_value_to_yojson x.value);
      ("Type", option_to_yojson backup_retention_type_to_yojson x.type_);
    ]

let external_az_to_yojson = string_to_yojson
let eni_id_to_yojson = string_to_yojson
let ip_address_to_yojson = string_to_yojson
let ip_v6_address_to_yojson = string_to_yojson
let hsm_id_to_yojson = string_to_yojson

let hsm_state_to_yojson (x : hsm_state) =
  match x with
  | DELETED -> `String "DELETED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DEGRADED -> `String "DEGRADED"
  | ACTIVE -> `String "ACTIVE"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"

let hsm_to_yojson (x : hsm) =
  assoc_to_yojson
    [
      ("StateMessage", option_to_yojson string__to_yojson x.state_message);
      ("State", option_to_yojson hsm_state_to_yojson x.state);
      ("HsmType", option_to_yojson hsm_type_to_yojson x.hsm_type);
      ("HsmId", Some (hsm_id_to_yojson x.hsm_id));
      ("EniIpV6", option_to_yojson ip_v6_address_to_yojson x.eni_ip_v6);
      ("EniIp", option_to_yojson ip_address_to_yojson x.eni_ip);
      ("EniId", option_to_yojson eni_id_to_yojson x.eni_id);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("AvailabilityZone", option_to_yojson external_az_to_yojson x.availability_zone);
    ]

let hsms_to_yojson tree = list_to_yojson hsm_to_yojson tree

let cluster_state_to_yojson (x : cluster_state) =
  match x with
  | DEGRADED -> `String "DEGRADED"
  | DELETED -> `String "DELETED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | ROLLBACK_IN_PROGRESS -> `String "ROLLBACK_IN_PROGRESS"
  | MODIFY_IN_PROGRESS -> `String "MODIFY_IN_PROGRESS"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | ACTIVE -> `String "ACTIVE"
  | INITIALIZED -> `String "INITIALIZED"
  | INITIALIZE_IN_PROGRESS -> `String "INITIALIZE_IN_PROGRESS"
  | UNINITIALIZED -> `String "UNINITIALIZED"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"

let external_subnet_mapping_to_yojson tree =
  map_to_yojson external_az_to_yojson subnet_id_to_yojson tree

let cert_to_yojson = string_to_yojson

let certificates_to_yojson (x : certificates) =
  assoc_to_yojson
    [
      ("ClusterCertificate", option_to_yojson cert_to_yojson x.cluster_certificate);
      ( "ManufacturerHardwareCertificate",
        option_to_yojson cert_to_yojson x.manufacturer_hardware_certificate );
      ("AwsHardwareCertificate", option_to_yojson cert_to_yojson x.aws_hardware_certificate);
      ("HsmCertificate", option_to_yojson cert_to_yojson x.hsm_certificate);
      ("ClusterCsr", option_to_yojson cert_to_yojson x.cluster_csr);
    ]

let cluster_to_yojson (x : cluster) =
  assoc_to_yojson
    [
      ("Mode", option_to_yojson cluster_mode_to_yojson x.mode);
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("Certificates", option_to_yojson certificates_to_yojson x.certificates);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SubnetMapping", option_to_yojson external_subnet_mapping_to_yojson x.subnet_mapping);
      ("StateMessage", option_to_yojson state_message_to_yojson x.state_message);
      ("State", option_to_yojson cluster_state_to_yojson x.state);
      ("SourceBackupId", option_to_yojson backup_id_to_yojson x.source_backup_id);
      ("SecurityGroup", option_to_yojson security_group_to_yojson x.security_group);
      ("PreCoPassword", option_to_yojson pre_co_password_to_yojson x.pre_co_password);
      ( "HsmTypeRollbackExpiration",
        option_to_yojson timestamp_to_yojson x.hsm_type_rollback_expiration );
      ("HsmType", option_to_yojson hsm_type_to_yojson x.hsm_type);
      ("Hsms", option_to_yojson hsms_to_yojson x.hsms);
      ("CreateTimestamp", option_to_yojson timestamp_to_yojson x.create_timestamp);
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ( "BackupRetentionPolicy",
        option_to_yojson backup_retention_policy_to_yojson x.backup_retention_policy );
      ("BackupPolicy", option_to_yojson backup_policy_to_yojson x.backup_policy);
    ]

let modify_cluster_response_to_yojson (x : modify_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let modify_cluster_request_to_yojson (x : modify_cluster_request) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ( "BackupRetentionPolicy",
        option_to_yojson backup_retention_policy_to_yojson x.backup_retention_policy );
      ("HsmType", option_to_yojson hsm_type_to_yojson x.hsm_type);
    ]

let modify_backup_attributes_response_to_yojson (x : modify_backup_attributes_response) =
  assoc_to_yojson [ ("Backup", option_to_yojson backup_to_yojson x.backup) ]

let modify_backup_attributes_request_to_yojson (x : modify_backup_attributes_request) =
  assoc_to_yojson
    [
      ("NeverExpires", Some (boolean__to_yojson x.never_expires));
      ("BackupId", Some (backup_id_to_yojson x.backup_id));
    ]

let max_size_to_yojson = int_to_yojson

let list_tags_response_to_yojson (x : list_tags_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("TagList", Some (tag_list_to_yojson x.tag_list));
    ]

let list_tags_request_to_yojson (x : list_tags_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let initialize_cluster_response_to_yojson (x : initialize_cluster_response) =
  assoc_to_yojson
    [
      ("StateMessage", option_to_yojson state_message_to_yojson x.state_message);
      ("State", option_to_yojson cluster_state_to_yojson x.state);
    ]

let initialize_cluster_request_to_yojson (x : initialize_cluster_request) =
  assoc_to_yojson
    [
      ("TrustAnchor", Some (cert_to_yojson x.trust_anchor));
      ("SignedCert", Some (cert_to_yojson x.signed_cert));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson resource_policy_to_yojson x.policy) ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", option_to_yojson cloud_hsm_arn_to_yojson x.resource_arn) ]

let field_to_yojson = string_to_yojson
let filters_to_yojson tree = map_to_yojson field_to_yojson strings_to_yojson tree

let destination_backup_to_yojson (x : destination_backup) =
  assoc_to_yojson
    [
      ("SourceCluster", option_to_yojson cluster_id_to_yojson x.source_cluster);
      ("SourceBackup", option_to_yojson backup_id_to_yojson x.source_backup);
      ("SourceRegion", option_to_yojson region_to_yojson x.source_region);
      ("CreateTimestamp", option_to_yojson timestamp_to_yojson x.create_timestamp);
    ]

let clusters_to_yojson tree = list_to_yojson cluster_to_yojson tree

let describe_clusters_response_to_yojson (x : describe_clusters_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Clusters", option_to_yojson clusters_to_yojson x.clusters);
    ]

let clusters_max_size_to_yojson = int_to_yojson

let describe_clusters_request_to_yojson (x : describe_clusters_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson clusters_max_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let backups_to_yojson tree = list_to_yojson backup_to_yojson tree

let describe_backups_response_to_yojson (x : describe_backups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Backups", option_to_yojson backups_to_yojson x.backups);
    ]

let backups_max_size_to_yojson = int_to_yojson

let describe_backups_request_to_yojson (x : describe_backups_request) =
  assoc_to_yojson
    [
      ("SortAscending", option_to_yojson boolean__to_yojson x.sort_ascending);
      ("Shared", option_to_yojson boolean__to_yojson x.shared);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson backups_max_size_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let delete_resource_policy_response_to_yojson (x : delete_resource_policy_response) =
  assoc_to_yojson
    [
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
      ("ResourceArn", option_to_yojson cloud_hsm_arn_to_yojson x.resource_arn);
    ]

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", option_to_yojson cloud_hsm_arn_to_yojson x.resource_arn) ]

let delete_hsm_response_to_yojson (x : delete_hsm_response) =
  assoc_to_yojson [ ("HsmId", option_to_yojson hsm_id_to_yojson x.hsm_id) ]

let delete_hsm_request_to_yojson (x : delete_hsm_request) =
  assoc_to_yojson
    [
      ("EniIp", option_to_yojson ip_address_to_yojson x.eni_ip);
      ("EniId", option_to_yojson eni_id_to_yojson x.eni_id);
      ("HsmId", option_to_yojson hsm_id_to_yojson x.hsm_id);
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let delete_cluster_response_to_yojson (x : delete_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let delete_cluster_request_to_yojson (x : delete_cluster_request) =
  assoc_to_yojson [ ("ClusterId", Some (cluster_id_to_yojson x.cluster_id)) ]

let delete_backup_response_to_yojson (x : delete_backup_response) =
  assoc_to_yojson [ ("Backup", option_to_yojson backup_to_yojson x.backup) ]

let delete_backup_request_to_yojson (x : delete_backup_request) =
  assoc_to_yojson [ ("BackupId", Some (backup_id_to_yojson x.backup_id)) ]

let create_hsm_response_to_yojson (x : create_hsm_response) =
  assoc_to_yojson [ ("Hsm", option_to_yojson hsm_to_yojson x.hsm) ]

let create_hsm_request_to_yojson (x : create_hsm_request) =
  assoc_to_yojson
    [
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("AvailabilityZone", Some (external_az_to_yojson x.availability_zone));
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let create_cluster_response_to_yojson (x : create_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ("Mode", option_to_yojson cluster_mode_to_yojson x.mode);
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ("SubnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ("SourceBackupId", option_to_yojson backup_arn_to_yojson x.source_backup_id);
      ("HsmType", Some (hsm_type_to_yojson x.hsm_type));
      ( "BackupRetentionPolicy",
        option_to_yojson backup_retention_policy_to_yojson x.backup_retention_policy );
    ]

let copy_backup_to_region_response_to_yojson (x : copy_backup_to_region_response) =
  assoc_to_yojson
    [ ("DestinationBackup", option_to_yojson destination_backup_to_yojson x.destination_backup) ]

let copy_backup_to_region_request_to_yojson (x : copy_backup_to_region_request) =
  assoc_to_yojson
    [
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("BackupId", Some (backup_id_to_yojson x.backup_id));
      ("DestinationRegion", Some (region_to_yojson x.destination_region));
    ]
