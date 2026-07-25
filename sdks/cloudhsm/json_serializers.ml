open Smaws_Lib.Json.SerializeHelpers
open Types

let a_z_to_yojson = string_to_yojson
let az_list_to_yojson tree = list_to_yojson a_z_to_yojson tree
let boolean__to_yojson = bool_to_yojson
let string__to_yojson = string_to_yojson

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("retryable", option_to_yojson boolean__to_yojson x.retryable);
    ]

let cloud_hsm_service_exception_to_yojson (x : cloud_hsm_service_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("retryable", option_to_yojson boolean__to_yojson x.retryable);
    ]

let cloud_hsm_internal_exception_to_yojson (x : cloud_hsm_internal_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("retryable", option_to_yojson boolean__to_yojson x.retryable);
    ]

let add_tags_to_resource_response_to_yojson (x : add_tags_to_resource_response) =
  assoc_to_yojson [ ("Status", Some (string__to_yojson x.status)) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let add_tags_to_resource_request_to_yojson (x : add_tags_to_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
      ("TagList", Some (tag_list_to_yojson x.tag_list));
    ]

let certificate_to_yojson = string_to_yojson
let certificate_fingerprint_to_yojson = string_to_yojson
let client_arn_to_yojson = string_to_yojson
let client_label_to_yojson = string_to_yojson
let client_list_to_yojson tree = list_to_yojson client_arn_to_yojson tree
let client_token_to_yojson = string_to_yojson

let client_version_to_yojson (x : client_version) =
  match x with FIVE_ONE -> `String "5.1" | FIVE_THREE -> `String "5.3"

let remove_tags_from_resource_response_to_yojson (x : remove_tags_from_resource_response) =
  assoc_to_yojson [ ("Status", Some (string__to_yojson x.status)) ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let remove_tags_from_resource_request_to_yojson (x : remove_tags_from_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
      ("TagKeyList", Some (tag_key_list_to_yojson x.tag_key_list));
    ]

let modify_luna_client_response_to_yojson (x : modify_luna_client_response) =
  assoc_to_yojson [ ("ClientArn", option_to_yojson client_arn_to_yojson x.client_arn) ]

let modify_luna_client_request_to_yojson (x : modify_luna_client_request) =
  assoc_to_yojson
    [
      ("ClientArn", Some (client_arn_to_yojson x.client_arn));
      ("Certificate", Some (certificate_to_yojson x.certificate));
    ]

let hsm_arn_to_yojson = string_to_yojson

let modify_hsm_response_to_yojson (x : modify_hsm_response) =
  assoc_to_yojson [ ("HsmArn", option_to_yojson hsm_arn_to_yojson x.hsm_arn) ]

let ip_address_to_yojson = string_to_yojson
let external_id_to_yojson = string_to_yojson
let iam_role_arn_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson

let modify_hsm_request_to_yojson (x : modify_hsm_request) =
  assoc_to_yojson
    [
      ("HsmArn", Some (hsm_arn_to_yojson x.hsm_arn));
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("EniIp", option_to_yojson ip_address_to_yojson x.eni_ip);
      ("IamRoleArn", option_to_yojson iam_role_arn_to_yojson x.iam_role_arn);
      ("ExternalId", option_to_yojson external_id_to_yojson x.external_id);
      ("SyslogIp", option_to_yojson ip_address_to_yojson x.syslog_ip);
    ]

let hapg_arn_to_yojson = string_to_yojson

let modify_hapg_response_to_yojson (x : modify_hapg_response) =
  assoc_to_yojson [ ("HapgArn", option_to_yojson hapg_arn_to_yojson x.hapg_arn) ]

let partition_serial_to_yojson = string_to_yojson
let partition_serial_list_to_yojson tree = list_to_yojson partition_serial_to_yojson tree
let label_to_yojson = string_to_yojson

let modify_hapg_request_to_yojson (x : modify_hapg_request) =
  assoc_to_yojson
    [
      ("HapgArn", Some (hapg_arn_to_yojson x.hapg_arn));
      ("Label", option_to_yojson label_to_yojson x.label);
      ( "PartitionSerialList",
        option_to_yojson partition_serial_list_to_yojson x.partition_serial_list );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("TagList", Some (tag_list_to_yojson x.tag_list)) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (string__to_yojson x.resource_arn)) ]

let pagination_token_to_yojson = string_to_yojson

let list_luna_clients_response_to_yojson (x : list_luna_clients_response) =
  assoc_to_yojson
    [
      ("ClientList", Some (client_list_to_yojson x.client_list));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_luna_clients_request_to_yojson (x : list_luna_clients_request) =
  assoc_to_yojson [ ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let hsm_list_to_yojson tree = list_to_yojson hsm_arn_to_yojson tree

let list_hsms_response_to_yojson (x : list_hsms_response) =
  assoc_to_yojson
    [
      ("HsmList", option_to_yojson hsm_list_to_yojson x.hsm_list);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_hsms_request_to_yojson (x : list_hsms_request) =
  assoc_to_yojson [ ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let hapg_list_to_yojson tree = list_to_yojson hapg_arn_to_yojson tree

let list_hapgs_response_to_yojson (x : list_hapgs_response) =
  assoc_to_yojson
    [
      ("HapgList", Some (hapg_list_to_yojson x.hapg_list));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_hapgs_request_to_yojson (x : list_hapgs_request) =
  assoc_to_yojson [ ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let list_available_zones_response_to_yojson (x : list_available_zones_response) =
  assoc_to_yojson [ ("AZList", option_to_yojson az_list_to_yojson x.az_list) ]

let list_available_zones_request_to_yojson = unit_to_yojson

let get_config_response_to_yojson (x : get_config_response) =
  assoc_to_yojson
    [
      ("ConfigType", option_to_yojson string__to_yojson x.config_type);
      ("ConfigFile", option_to_yojson string__to_yojson x.config_file);
      ("ConfigCred", option_to_yojson string__to_yojson x.config_cred);
    ]

let get_config_request_to_yojson (x : get_config_request) =
  assoc_to_yojson
    [
      ("ClientArn", Some (client_arn_to_yojson x.client_arn));
      ("ClientVersion", Some (client_version_to_yojson x.client_version));
      ("HapgList", Some (hapg_list_to_yojson x.hapg_list));
    ]

let timestamp_to_yojson = string_to_yojson

let describe_luna_client_response_to_yojson (x : describe_luna_client_response) =
  assoc_to_yojson
    [
      ("ClientArn", option_to_yojson client_arn_to_yojson x.client_arn);
      ("Certificate", option_to_yojson certificate_to_yojson x.certificate);
      ( "CertificateFingerprint",
        option_to_yojson certificate_fingerprint_to_yojson x.certificate_fingerprint );
      ("LastModifiedTimestamp", option_to_yojson timestamp_to_yojson x.last_modified_timestamp);
      ("Label", option_to_yojson label_to_yojson x.label);
    ]

let describe_luna_client_request_to_yojson (x : describe_luna_client_request) =
  assoc_to_yojson
    [
      ("ClientArn", option_to_yojson client_arn_to_yojson x.client_arn);
      ( "CertificateFingerprint",
        option_to_yojson certificate_fingerprint_to_yojson x.certificate_fingerprint );
    ]

let partition_arn_to_yojson = string_to_yojson
let partition_list_to_yojson tree = list_to_yojson partition_arn_to_yojson tree
let ssh_key_to_yojson = string_to_yojson
let hsm_serial_number_to_yojson = string_to_yojson
let vpc_id_to_yojson = string_to_yojson

let subscription_type_to_yojson (x : subscription_type) =
  match x with PRODUCTION -> `String "PRODUCTION"

let eni_id_to_yojson = string_to_yojson

let hsm_status_to_yojson (x : hsm_status) =
  match x with
  | PENDING -> `String "PENDING"
  | RUNNING -> `String "RUNNING"
  | UPDATING -> `String "UPDATING"
  | SUSPENDED -> `String "SUSPENDED"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"
  | DEGRADED -> `String "DEGRADED"

let describe_hsm_response_to_yojson (x : describe_hsm_response) =
  assoc_to_yojson
    [
      ("HsmArn", option_to_yojson hsm_arn_to_yojson x.hsm_arn);
      ("Status", option_to_yojson hsm_status_to_yojson x.status);
      ("StatusDetails", option_to_yojson string__to_yojson x.status_details);
      ("AvailabilityZone", option_to_yojson a_z_to_yojson x.availability_zone);
      ("EniId", option_to_yojson eni_id_to_yojson x.eni_id);
      ("EniIp", option_to_yojson ip_address_to_yojson x.eni_ip);
      ("SubscriptionType", option_to_yojson subscription_type_to_yojson x.subscription_type);
      ("SubscriptionStartDate", option_to_yojson timestamp_to_yojson x.subscription_start_date);
      ("SubscriptionEndDate", option_to_yojson timestamp_to_yojson x.subscription_end_date);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("IamRoleArn", option_to_yojson iam_role_arn_to_yojson x.iam_role_arn);
      ("SerialNumber", option_to_yojson hsm_serial_number_to_yojson x.serial_number);
      ("VendorName", option_to_yojson string__to_yojson x.vendor_name);
      ("HsmType", option_to_yojson string__to_yojson x.hsm_type);
      ("SoftwareVersion", option_to_yojson string__to_yojson x.software_version);
      ("SshPublicKey", option_to_yojson ssh_key_to_yojson x.ssh_public_key);
      ("SshKeyLastUpdated", option_to_yojson timestamp_to_yojson x.ssh_key_last_updated);
      ("ServerCertUri", option_to_yojson string__to_yojson x.server_cert_uri);
      ("ServerCertLastUpdated", option_to_yojson timestamp_to_yojson x.server_cert_last_updated);
      ("Partitions", option_to_yojson partition_list_to_yojson x.partitions);
    ]

let describe_hsm_request_to_yojson (x : describe_hsm_request) =
  assoc_to_yojson
    [
      ("HsmArn", option_to_yojson hsm_arn_to_yojson x.hsm_arn);
      ("HsmSerialNumber", option_to_yojson hsm_serial_number_to_yojson x.hsm_serial_number);
    ]

let cloud_hsm_object_state_to_yojson (x : cloud_hsm_object_state) =
  match x with
  | READY -> `String "READY"
  | UPDATING -> `String "UPDATING"
  | DEGRADED -> `String "DEGRADED"

let describe_hapg_response_to_yojson (x : describe_hapg_response) =
  assoc_to_yojson
    [
      ("HapgArn", option_to_yojson hapg_arn_to_yojson x.hapg_arn);
      ("HapgSerial", option_to_yojson string__to_yojson x.hapg_serial);
      ("HsmsLastActionFailed", option_to_yojson hsm_list_to_yojson x.hsms_last_action_failed);
      ("HsmsPendingDeletion", option_to_yojson hsm_list_to_yojson x.hsms_pending_deletion);
      ("HsmsPendingRegistration", option_to_yojson hsm_list_to_yojson x.hsms_pending_registration);
      ("Label", option_to_yojson label_to_yojson x.label);
      ("LastModifiedTimestamp", option_to_yojson timestamp_to_yojson x.last_modified_timestamp);
      ( "PartitionSerialList",
        option_to_yojson partition_serial_list_to_yojson x.partition_serial_list );
      ("State", option_to_yojson cloud_hsm_object_state_to_yojson x.state);
    ]

let describe_hapg_request_to_yojson (x : describe_hapg_request) =
  assoc_to_yojson [ ("HapgArn", Some (hapg_arn_to_yojson x.hapg_arn)) ]

let delete_luna_client_response_to_yojson (x : delete_luna_client_response) =
  assoc_to_yojson [ ("Status", Some (string__to_yojson x.status)) ]

let delete_luna_client_request_to_yojson (x : delete_luna_client_request) =
  assoc_to_yojson [ ("ClientArn", Some (client_arn_to_yojson x.client_arn)) ]

let delete_hsm_response_to_yojson (x : delete_hsm_response) =
  assoc_to_yojson [ ("Status", Some (string__to_yojson x.status)) ]

let delete_hsm_request_to_yojson (x : delete_hsm_request) =
  assoc_to_yojson [ ("HsmArn", Some (hsm_arn_to_yojson x.hsm_arn)) ]

let delete_hapg_response_to_yojson (x : delete_hapg_response) =
  assoc_to_yojson [ ("Status", Some (string__to_yojson x.status)) ]

let delete_hapg_request_to_yojson (x : delete_hapg_request) =
  assoc_to_yojson [ ("HapgArn", Some (hapg_arn_to_yojson x.hapg_arn)) ]

let create_luna_client_response_to_yojson (x : create_luna_client_response) =
  assoc_to_yojson [ ("ClientArn", option_to_yojson client_arn_to_yojson x.client_arn) ]

let create_luna_client_request_to_yojson (x : create_luna_client_request) =
  assoc_to_yojson
    [
      ("Label", option_to_yojson client_label_to_yojson x.label);
      ("Certificate", Some (certificate_to_yojson x.certificate));
    ]

let create_hsm_response_to_yojson (x : create_hsm_response) =
  assoc_to_yojson [ ("HsmArn", option_to_yojson hsm_arn_to_yojson x.hsm_arn) ]

let create_hsm_request_to_yojson (x : create_hsm_request) =
  assoc_to_yojson
    [
      ("SubnetId", Some (subnet_id_to_yojson x.subnet_id));
      ("SshKey", Some (ssh_key_to_yojson x.ssh_key));
      ("EniIp", option_to_yojson ip_address_to_yojson x.eni_ip);
      ("IamRoleArn", Some (iam_role_arn_to_yojson x.iam_role_arn));
      ("ExternalId", option_to_yojson external_id_to_yojson x.external_id);
      ("SubscriptionType", Some (subscription_type_to_yojson x.subscription_type));
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
      ("SyslogIp", option_to_yojson ip_address_to_yojson x.syslog_ip);
    ]

let create_hapg_response_to_yojson (x : create_hapg_response) =
  assoc_to_yojson [ ("HapgArn", option_to_yojson hapg_arn_to_yojson x.hapg_arn) ]

let create_hapg_request_to_yojson (x : create_hapg_request) =
  assoc_to_yojson [ ("Label", Some (label_to_yojson x.label)) ]
