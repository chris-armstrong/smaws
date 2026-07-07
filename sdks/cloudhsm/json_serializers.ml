open Smaws_Lib.Json.SerializeHelpers
open Types

let vpc_id_to_yojson = string_to_yojson
let timestamp_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let subscription_type_to_yojson (x : subscription_type) =
  match x with PRODUCTION -> `String "PRODUCTION"

let subnet_id_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson
let ssh_key_to_yojson = string_to_yojson

let remove_tags_from_resource_response_to_yojson (x : remove_tags_from_resource_response) =
  assoc_to_yojson [ ("Status", Some (string__to_yojson x.status)) ]

let remove_tags_from_resource_request_to_yojson (x : remove_tags_from_resource_request) =
  assoc_to_yojson
    [
      ("TagKeyList", Some (tag_key_list_to_yojson x.tag_key_list));
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
    ]

let boolean__to_yojson = bool_to_yojson

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson
    [
      ("retryable", option_to_yojson boolean__to_yojson x.retryable);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let cloud_hsm_service_exception_to_yojson (x : cloud_hsm_service_exception) =
  assoc_to_yojson
    [
      ("retryable", option_to_yojson boolean__to_yojson x.retryable);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let cloud_hsm_internal_exception_to_yojson (x : cloud_hsm_internal_exception) =
  assoc_to_yojson
    [
      ("retryable", option_to_yojson boolean__to_yojson x.retryable);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let partition_serial_to_yojson = string_to_yojson
let partition_serial_list_to_yojson tree = list_to_yojson partition_serial_to_yojson tree
let partition_arn_to_yojson = string_to_yojson
let partition_list_to_yojson tree = list_to_yojson partition_arn_to_yojson tree
let pagination_token_to_yojson = string_to_yojson
let client_arn_to_yojson = string_to_yojson

let modify_luna_client_response_to_yojson (x : modify_luna_client_response) =
  assoc_to_yojson [ ("ClientArn", option_to_yojson client_arn_to_yojson x.client_arn) ]

let certificate_to_yojson = string_to_yojson

let modify_luna_client_request_to_yojson (x : modify_luna_client_request) =
  assoc_to_yojson
    [
      ("Certificate", Some (certificate_to_yojson x.certificate));
      ("ClientArn", Some (client_arn_to_yojson x.client_arn));
    ]

let hsm_arn_to_yojson = string_to_yojson

let modify_hsm_response_to_yojson (x : modify_hsm_response) =
  assoc_to_yojson [ ("HsmArn", option_to_yojson hsm_arn_to_yojson x.hsm_arn) ]

let ip_address_to_yojson = string_to_yojson
let iam_role_arn_to_yojson = string_to_yojson
let external_id_to_yojson = string_to_yojson

let modify_hsm_request_to_yojson (x : modify_hsm_request) =
  assoc_to_yojson
    [
      ("SyslogIp", option_to_yojson ip_address_to_yojson x.syslog_ip);
      ("ExternalId", option_to_yojson external_id_to_yojson x.external_id);
      ("IamRoleArn", option_to_yojson iam_role_arn_to_yojson x.iam_role_arn);
      ("EniIp", option_to_yojson ip_address_to_yojson x.eni_ip);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("HsmArn", Some (hsm_arn_to_yojson x.hsm_arn));
    ]

let hapg_arn_to_yojson = string_to_yojson

let modify_hapg_response_to_yojson (x : modify_hapg_response) =
  assoc_to_yojson [ ("HapgArn", option_to_yojson hapg_arn_to_yojson x.hapg_arn) ]

let label_to_yojson = string_to_yojson

let modify_hapg_request_to_yojson (x : modify_hapg_request) =
  assoc_to_yojson
    [
      ( "PartitionSerialList",
        option_to_yojson partition_serial_list_to_yojson x.partition_serial_list );
      ("Label", option_to_yojson label_to_yojson x.label);
      ("HapgArn", Some (hapg_arn_to_yojson x.hapg_arn));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("TagList", Some (tag_list_to_yojson x.tag_list)) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (string__to_yojson x.resource_arn)) ]

let client_list_to_yojson tree = list_to_yojson client_arn_to_yojson tree

let list_luna_clients_response_to_yojson (x : list_luna_clients_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ClientList", Some (client_list_to_yojson x.client_list));
    ]

let list_luna_clients_request_to_yojson (x : list_luna_clients_request) =
  assoc_to_yojson [ ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let hsm_list_to_yojson tree = list_to_yojson hsm_arn_to_yojson tree

let list_hsms_response_to_yojson (x : list_hsms_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("HsmList", option_to_yojson hsm_list_to_yojson x.hsm_list);
    ]

let list_hsms_request_to_yojson (x : list_hsms_request) =
  assoc_to_yojson [ ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let hapg_list_to_yojson tree = list_to_yojson hapg_arn_to_yojson tree

let list_hapgs_response_to_yojson (x : list_hapgs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("HapgList", Some (hapg_list_to_yojson x.hapg_list));
    ]

let list_hapgs_request_to_yojson (x : list_hapgs_request) =
  assoc_to_yojson [ ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let a_z_to_yojson = string_to_yojson
let az_list_to_yojson tree = list_to_yojson a_z_to_yojson tree

let list_available_zones_response_to_yojson (x : list_available_zones_response) =
  assoc_to_yojson [ ("AZList", option_to_yojson az_list_to_yojson x.az_list) ]

let list_available_zones_request_to_yojson = unit_to_yojson

let hsm_status_to_yojson (x : hsm_status) =
  match x with
  | DEGRADED -> `String "DEGRADED"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | SUSPENDED -> `String "SUSPENDED"
  | UPDATING -> `String "UPDATING"
  | RUNNING -> `String "RUNNING"
  | PENDING -> `String "PENDING"

let hsm_serial_number_to_yojson = string_to_yojson

let get_config_response_to_yojson (x : get_config_response) =
  assoc_to_yojson
    [
      ("ConfigCred", option_to_yojson string__to_yojson x.config_cred);
      ("ConfigFile", option_to_yojson string__to_yojson x.config_file);
      ("ConfigType", option_to_yojson string__to_yojson x.config_type);
    ]

let client_version_to_yojson (x : client_version) =
  match x with FIVE_THREE -> `String "5.3" | FIVE_ONE -> `String "5.1"

let get_config_request_to_yojson (x : get_config_request) =
  assoc_to_yojson
    [
      ("HapgList", Some (hapg_list_to_yojson x.hapg_list));
      ("ClientVersion", Some (client_version_to_yojson x.client_version));
      ("ClientArn", Some (client_arn_to_yojson x.client_arn));
    ]

let eni_id_to_yojson = string_to_yojson
let certificate_fingerprint_to_yojson = string_to_yojson

let describe_luna_client_response_to_yojson (x : describe_luna_client_response) =
  assoc_to_yojson
    [
      ("Label", option_to_yojson label_to_yojson x.label);
      ("LastModifiedTimestamp", option_to_yojson timestamp_to_yojson x.last_modified_timestamp);
      ( "CertificateFingerprint",
        option_to_yojson certificate_fingerprint_to_yojson x.certificate_fingerprint );
      ("Certificate", option_to_yojson certificate_to_yojson x.certificate);
      ("ClientArn", option_to_yojson client_arn_to_yojson x.client_arn);
    ]

let describe_luna_client_request_to_yojson (x : describe_luna_client_request) =
  assoc_to_yojson
    [
      ( "CertificateFingerprint",
        option_to_yojson certificate_fingerprint_to_yojson x.certificate_fingerprint );
      ("ClientArn", option_to_yojson client_arn_to_yojson x.client_arn);
    ]

let describe_hsm_response_to_yojson (x : describe_hsm_response) =
  assoc_to_yojson
    [
      ("Partitions", option_to_yojson partition_list_to_yojson x.partitions);
      ("ServerCertLastUpdated", option_to_yojson timestamp_to_yojson x.server_cert_last_updated);
      ("ServerCertUri", option_to_yojson string__to_yojson x.server_cert_uri);
      ("SshKeyLastUpdated", option_to_yojson timestamp_to_yojson x.ssh_key_last_updated);
      ("SshPublicKey", option_to_yojson ssh_key_to_yojson x.ssh_public_key);
      ("SoftwareVersion", option_to_yojson string__to_yojson x.software_version);
      ("HsmType", option_to_yojson string__to_yojson x.hsm_type);
      ("VendorName", option_to_yojson string__to_yojson x.vendor_name);
      ("SerialNumber", option_to_yojson hsm_serial_number_to_yojson x.serial_number);
      ("IamRoleArn", option_to_yojson iam_role_arn_to_yojson x.iam_role_arn);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SubscriptionEndDate", option_to_yojson timestamp_to_yojson x.subscription_end_date);
      ("SubscriptionStartDate", option_to_yojson timestamp_to_yojson x.subscription_start_date);
      ("SubscriptionType", option_to_yojson subscription_type_to_yojson x.subscription_type);
      ("EniIp", option_to_yojson ip_address_to_yojson x.eni_ip);
      ("EniId", option_to_yojson eni_id_to_yojson x.eni_id);
      ("AvailabilityZone", option_to_yojson a_z_to_yojson x.availability_zone);
      ("StatusDetails", option_to_yojson string__to_yojson x.status_details);
      ("Status", option_to_yojson hsm_status_to_yojson x.status);
      ("HsmArn", option_to_yojson hsm_arn_to_yojson x.hsm_arn);
    ]

let describe_hsm_request_to_yojson (x : describe_hsm_request) =
  assoc_to_yojson
    [
      ("HsmSerialNumber", option_to_yojson hsm_serial_number_to_yojson x.hsm_serial_number);
      ("HsmArn", option_to_yojson hsm_arn_to_yojson x.hsm_arn);
    ]

let cloud_hsm_object_state_to_yojson (x : cloud_hsm_object_state) =
  match x with
  | DEGRADED -> `String "DEGRADED"
  | UPDATING -> `String "UPDATING"
  | READY -> `String "READY"

let describe_hapg_response_to_yojson (x : describe_hapg_response) =
  assoc_to_yojson
    [
      ("State", option_to_yojson cloud_hsm_object_state_to_yojson x.state);
      ( "PartitionSerialList",
        option_to_yojson partition_serial_list_to_yojson x.partition_serial_list );
      ("LastModifiedTimestamp", option_to_yojson timestamp_to_yojson x.last_modified_timestamp);
      ("Label", option_to_yojson label_to_yojson x.label);
      ("HsmsPendingRegistration", option_to_yojson hsm_list_to_yojson x.hsms_pending_registration);
      ("HsmsPendingDeletion", option_to_yojson hsm_list_to_yojson x.hsms_pending_deletion);
      ("HsmsLastActionFailed", option_to_yojson hsm_list_to_yojson x.hsms_last_action_failed);
      ("HapgSerial", option_to_yojson string__to_yojson x.hapg_serial);
      ("HapgArn", option_to_yojson hapg_arn_to_yojson x.hapg_arn);
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

let client_label_to_yojson = string_to_yojson

let create_luna_client_request_to_yojson (x : create_luna_client_request) =
  assoc_to_yojson
    [
      ("Certificate", Some (certificate_to_yojson x.certificate));
      ("Label", option_to_yojson client_label_to_yojson x.label);
    ]

let create_hsm_response_to_yojson (x : create_hsm_response) =
  assoc_to_yojson [ ("HsmArn", option_to_yojson hsm_arn_to_yojson x.hsm_arn) ]

let client_token_to_yojson = string_to_yojson

let create_hsm_request_to_yojson (x : create_hsm_request) =
  assoc_to_yojson
    [
      ("SyslogIp", option_to_yojson ip_address_to_yojson x.syslog_ip);
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
      ("SubscriptionType", Some (subscription_type_to_yojson x.subscription_type));
      ("ExternalId", option_to_yojson external_id_to_yojson x.external_id);
      ("IamRoleArn", Some (iam_role_arn_to_yojson x.iam_role_arn));
      ("EniIp", option_to_yojson ip_address_to_yojson x.eni_ip);
      ("SshKey", Some (ssh_key_to_yojson x.ssh_key));
      ("SubnetId", Some (subnet_id_to_yojson x.subnet_id));
    ]

let create_hapg_response_to_yojson (x : create_hapg_response) =
  assoc_to_yojson [ ("HapgArn", option_to_yojson hapg_arn_to_yojson x.hapg_arn) ]

let create_hapg_request_to_yojson (x : create_hapg_request) =
  assoc_to_yojson [ ("Label", Some (label_to_yojson x.label)) ]

let add_tags_to_resource_response_to_yojson (x : add_tags_to_resource_response) =
  assoc_to_yojson [ ("Status", Some (string__to_yojson x.status)) ]

let add_tags_to_resource_request_to_yojson (x : add_tags_to_resource_request) =
  assoc_to_yojson
    [
      ("TagList", Some (tag_list_to_yojson x.tag_list));
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
    ]
