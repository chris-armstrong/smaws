open Smaws_Lib.Json.SerializeHelpers
open Types

let cluster_mode_to_yojson (x : cluster_mode) =
  match x with FIPS -> `String "FIPS" | NON_FIPS -> `String "NON_FIPS"

let hsm_type_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let cluster_id_to_yojson = string_to_yojson
let backup_id_to_yojson = string_to_yojson
let region_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson

let backup_state_to_yojson (x : backup_state) =
  match x with
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | READY -> `String "READY"
  | DELETED -> `String "DELETED"
  | PENDING_DELETION -> `String "PENDING_DELETION"

let backup_arn_to_yojson = string_to_yojson

let backup_to_yojson (x : backup) =
  assoc_to_yojson
    [
      ("BackupId", Some (backup_id_to_yojson x.backup_id));
      ("BackupArn", option_to_yojson backup_arn_to_yojson x.backup_arn);
      ("BackupState", option_to_yojson backup_state_to_yojson x.backup_state);
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("CreateTimestamp", option_to_yojson timestamp_to_yojson x.create_timestamp);
      ("CopyTimestamp", option_to_yojson timestamp_to_yojson x.copy_timestamp);
      ("NeverExpires", option_to_yojson boolean__to_yojson x.never_expires);
      ("SourceRegion", option_to_yojson region_to_yojson x.source_region);
      ("SourceBackup", option_to_yojson backup_id_to_yojson x.source_backup);
      ("SourceCluster", option_to_yojson cluster_id_to_yojson x.source_cluster);
      ("DeleteTimestamp", option_to_yojson timestamp_to_yojson x.delete_timestamp);
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("HsmType", option_to_yojson hsm_type_to_yojson x.hsm_type);
      ("Mode", option_to_yojson cluster_mode_to_yojson x.mode);
    ]

let backup_policy_to_yojson (x : backup_policy) = match x with DEFAULT -> `String "DEFAULT"
let backup_retention_value_to_yojson = string_to_yojson

let backup_retention_type_to_yojson (x : backup_retention_type) =
  match x with DAYS -> `String "DAYS"

let backup_retention_policy_to_yojson (x : backup_retention_policy) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson backup_retention_type_to_yojson x.type_);
      ("Value", option_to_yojson backup_retention_value_to_yojson x.value);
    ]

let backups_to_yojson tree = list_to_yojson backup_to_yojson tree
let backups_max_size_to_yojson = int_to_yojson
let error_message_to_yojson = string_to_yojson

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

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let resource_id_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("TagKeyList", Some (tag_key_list_to_yojson x.tag_key_list));
    ]

let cloud_hsm_resource_limit_exceeded_exception_to_yojson
    (x : cloud_hsm_resource_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("TagList", Some (tag_list_to_yojson x.tag_list));
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
      ("ResourceArn", option_to_yojson cloud_hsm_arn_to_yojson x.resource_arn);
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
    ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson cloud_hsm_arn_to_yojson x.resource_arn);
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
    ]

let cert_to_yojson = string_to_yojson

let certificates_to_yojson (x : certificates) =
  assoc_to_yojson
    [
      ("ClusterCsr", option_to_yojson cert_to_yojson x.cluster_csr);
      ("HsmCertificate", option_to_yojson cert_to_yojson x.hsm_certificate);
      ("AwsHardwareCertificate", option_to_yojson cert_to_yojson x.aws_hardware_certificate);
      ( "ManufacturerHardwareCertificate",
        option_to_yojson cert_to_yojson x.manufacturer_hardware_certificate );
      ("ClusterCertificate", option_to_yojson cert_to_yojson x.cluster_certificate);
    ]

let network_type_to_yojson (x : network_type) =
  match x with IPV4 -> `String "IPV4" | DUALSTACK -> `String "DUALSTACK"

let vpc_id_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson
let external_az_to_yojson = string_to_yojson

let external_subnet_mapping_to_yojson tree =
  map_to_yojson external_az_to_yojson subnet_id_to_yojson tree

let state_message_to_yojson = string_to_yojson

let cluster_state_to_yojson (x : cluster_state) =
  match x with
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | UNINITIALIZED -> `String "UNINITIALIZED"
  | INITIALIZE_IN_PROGRESS -> `String "INITIALIZE_IN_PROGRESS"
  | INITIALIZED -> `String "INITIALIZED"
  | ACTIVE -> `String "ACTIVE"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | MODIFY_IN_PROGRESS -> `String "MODIFY_IN_PROGRESS"
  | ROLLBACK_IN_PROGRESS -> `String "ROLLBACK_IN_PROGRESS"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETED -> `String "DELETED"
  | DEGRADED -> `String "DEGRADED"

let security_group_to_yojson = string_to_yojson
let pre_co_password_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson

let hsm_state_to_yojson (x : hsm_state) =
  match x with
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | ACTIVE -> `String "ACTIVE"
  | DEGRADED -> `String "DEGRADED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETED -> `String "DELETED"

let hsm_id_to_yojson = string_to_yojson
let ip_v6_address_to_yojson = string_to_yojson
let ip_address_to_yojson = string_to_yojson
let eni_id_to_yojson = string_to_yojson

let hsm_to_yojson (x : hsm) =
  assoc_to_yojson
    [
      ("AvailabilityZone", option_to_yojson external_az_to_yojson x.availability_zone);
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("EniId", option_to_yojson eni_id_to_yojson x.eni_id);
      ("EniIp", option_to_yojson ip_address_to_yojson x.eni_ip);
      ("EniIpV6", option_to_yojson ip_v6_address_to_yojson x.eni_ip_v6);
      ("HsmId", Some (hsm_id_to_yojson x.hsm_id));
      ("HsmType", option_to_yojson hsm_type_to_yojson x.hsm_type);
      ("State", option_to_yojson hsm_state_to_yojson x.state);
      ("StateMessage", option_to_yojson string__to_yojson x.state_message);
    ]

let hsms_to_yojson tree = list_to_yojson hsm_to_yojson tree

let cluster_to_yojson (x : cluster) =
  assoc_to_yojson
    [
      ("BackupPolicy", option_to_yojson backup_policy_to_yojson x.backup_policy);
      ( "BackupRetentionPolicy",
        option_to_yojson backup_retention_policy_to_yojson x.backup_retention_policy );
      ("ClusterId", option_to_yojson cluster_id_to_yojson x.cluster_id);
      ("CreateTimestamp", option_to_yojson timestamp_to_yojson x.create_timestamp);
      ("Hsms", option_to_yojson hsms_to_yojson x.hsms);
      ("HsmType", option_to_yojson hsm_type_to_yojson x.hsm_type);
      ( "HsmTypeRollbackExpiration",
        option_to_yojson timestamp_to_yojson x.hsm_type_rollback_expiration );
      ("PreCoPassword", option_to_yojson pre_co_password_to_yojson x.pre_co_password);
      ("SecurityGroup", option_to_yojson security_group_to_yojson x.security_group);
      ("SourceBackupId", option_to_yojson backup_id_to_yojson x.source_backup_id);
      ("State", option_to_yojson cluster_state_to_yojson x.state);
      ("StateMessage", option_to_yojson state_message_to_yojson x.state_message);
      ("SubnetMapping", option_to_yojson external_subnet_mapping_to_yojson x.subnet_mapping);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ("Certificates", option_to_yojson certificates_to_yojson x.certificates);
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("Mode", option_to_yojson cluster_mode_to_yojson x.mode);
    ]

let modify_cluster_response_to_yojson (x : modify_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let modify_cluster_request_to_yojson (x : modify_cluster_request) =
  assoc_to_yojson
    [
      ("HsmType", option_to_yojson hsm_type_to_yojson x.hsm_type);
      ( "BackupRetentionPolicy",
        option_to_yojson backup_retention_policy_to_yojson x.backup_retention_policy );
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
    ]

let modify_backup_attributes_response_to_yojson (x : modify_backup_attributes_response) =
  assoc_to_yojson [ ("Backup", option_to_yojson backup_to_yojson x.backup) ]

let modify_backup_attributes_request_to_yojson (x : modify_backup_attributes_request) =
  assoc_to_yojson
    [
      ("BackupId", Some (backup_id_to_yojson x.backup_id));
      ("NeverExpires", Some (boolean__to_yojson x.never_expires));
    ]

let next_token_to_yojson = string_to_yojson

let list_tags_response_to_yojson (x : list_tags_response) =
  assoc_to_yojson
    [
      ("TagList", Some (tag_list_to_yojson x.tag_list));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_size_to_yojson = int_to_yojson

let list_tags_request_to_yojson (x : list_tags_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_size_to_yojson x.max_results);
    ]

let initialize_cluster_response_to_yojson (x : initialize_cluster_response) =
  assoc_to_yojson
    [
      ("State", option_to_yojson cluster_state_to_yojson x.state);
      ("StateMessage", option_to_yojson state_message_to_yojson x.state_message);
    ]

let initialize_cluster_request_to_yojson (x : initialize_cluster_request) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("SignedCert", Some (cert_to_yojson x.signed_cert));
      ("TrustAnchor", Some (cert_to_yojson x.trust_anchor));
    ]

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson resource_policy_to_yojson x.policy) ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", option_to_yojson cloud_hsm_arn_to_yojson x.resource_arn) ]

let clusters_to_yojson tree = list_to_yojson cluster_to_yojson tree

let describe_clusters_response_to_yojson (x : describe_clusters_response) =
  assoc_to_yojson
    [
      ("Clusters", option_to_yojson clusters_to_yojson x.clusters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let clusters_max_size_to_yojson = int_to_yojson
let strings_to_yojson tree = list_to_yojson string__to_yojson tree
let field_to_yojson = string_to_yojson
let filters_to_yojson tree = map_to_yojson field_to_yojson strings_to_yojson tree

let describe_clusters_request_to_yojson (x : describe_clusters_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson clusters_max_size_to_yojson x.max_results);
    ]

let describe_backups_response_to_yojson (x : describe_backups_response) =
  assoc_to_yojson
    [
      ("Backups", option_to_yojson backups_to_yojson x.backups);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_backups_request_to_yojson (x : describe_backups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson backups_max_size_to_yojson x.max_results);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("Shared", option_to_yojson boolean__to_yojson x.shared);
      ("SortAscending", option_to_yojson boolean__to_yojson x.sort_ascending);
    ]

let delete_resource_policy_response_to_yojson (x : delete_resource_policy_response) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson cloud_hsm_arn_to_yojson x.resource_arn);
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
    ]

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", option_to_yojson cloud_hsm_arn_to_yojson x.resource_arn) ]

let delete_hsm_response_to_yojson (x : delete_hsm_response) =
  assoc_to_yojson [ ("HsmId", option_to_yojson hsm_id_to_yojson x.hsm_id) ]

let delete_hsm_request_to_yojson (x : delete_hsm_request) =
  assoc_to_yojson
    [
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("HsmId", option_to_yojson hsm_id_to_yojson x.hsm_id);
      ("EniId", option_to_yojson eni_id_to_yojson x.eni_id);
      ("EniIp", option_to_yojson ip_address_to_yojson x.eni_ip);
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
      ("ClusterId", Some (cluster_id_to_yojson x.cluster_id));
      ("AvailabilityZone", Some (external_az_to_yojson x.availability_zone));
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
    ]

let create_cluster_response_to_yojson (x : create_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ( "BackupRetentionPolicy",
        option_to_yojson backup_retention_policy_to_yojson x.backup_retention_policy );
      ("HsmType", Some (hsm_type_to_yojson x.hsm_type));
      ("SourceBackupId", option_to_yojson backup_arn_to_yojson x.source_backup_id);
      ("SubnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
      ("Mode", option_to_yojson cluster_mode_to_yojson x.mode);
    ]

let destination_backup_to_yojson (x : destination_backup) =
  assoc_to_yojson
    [
      ("CreateTimestamp", option_to_yojson timestamp_to_yojson x.create_timestamp);
      ("SourceRegion", option_to_yojson region_to_yojson x.source_region);
      ("SourceBackup", option_to_yojson backup_id_to_yojson x.source_backup);
      ("SourceCluster", option_to_yojson cluster_id_to_yojson x.source_cluster);
    ]

let copy_backup_to_region_response_to_yojson (x : copy_backup_to_region_response) =
  assoc_to_yojson
    [ ("DestinationBackup", option_to_yojson destination_backup_to_yojson x.destination_backup) ]

let copy_backup_to_region_request_to_yojson (x : copy_backup_to_region_request) =
  assoc_to_yojson
    [
      ("DestinationRegion", Some (region_to_yojson x.destination_region));
      ("BackupId", Some (backup_id_to_yojson x.backup_id));
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
    ]
