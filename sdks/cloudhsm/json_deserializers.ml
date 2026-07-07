open Smaws_Lib.Json.DeserializeHelpers
open Types

let vpc_id_of_yojson = string_of_yojson
let timestamp_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let subscription_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRODUCTION" -> PRODUCTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "SubscriptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "SubscriptionType")
     : subscription_type)
    : subscription_type)

let subnet_id_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson
let ssh_key_of_yojson = string_of_yojson

let remove_tags_from_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = value_for_key string__of_yojson "Status" _list path }
    : remove_tags_from_resource_response)

let remove_tags_from_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_key_list = value_for_key tag_key_list_of_yojson "TagKeyList" _list path;
     resource_arn = value_for_key string__of_yojson "ResourceArn" _list path;
   }
    : remove_tags_from_resource_request)

let boolean__of_yojson = bool_of_yojson

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retryable = option_of_yojson (value_for_key boolean__of_yojson "retryable") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : invalid_request_exception)

let cloud_hsm_service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retryable = option_of_yojson (value_for_key boolean__of_yojson "retryable") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : cloud_hsm_service_exception)

let cloud_hsm_internal_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retryable = option_of_yojson (value_for_key boolean__of_yojson "retryable") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : cloud_hsm_internal_exception)

let partition_serial_of_yojson = string_of_yojson
let partition_serial_list_of_yojson tree path = list_of_yojson partition_serial_of_yojson tree path
let partition_arn_of_yojson = string_of_yojson
let partition_list_of_yojson tree path = list_of_yojson partition_arn_of_yojson tree path
let pagination_token_of_yojson = string_of_yojson
let client_arn_of_yojson = string_of_yojson

let modify_luna_client_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ client_arn = option_of_yojson (value_for_key client_arn_of_yojson "ClientArn") _list path }
    : modify_luna_client_response)

let certificate_of_yojson = string_of_yojson

let modify_luna_client_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate = value_for_key certificate_of_yojson "Certificate" _list path;
     client_arn = value_for_key client_arn_of_yojson "ClientArn" _list path;
   }
    : modify_luna_client_request)

let hsm_arn_of_yojson = string_of_yojson

let modify_hsm_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hsm_arn = option_of_yojson (value_for_key hsm_arn_of_yojson "HsmArn") _list path }
    : modify_hsm_response)

let ip_address_of_yojson = string_of_yojson
let iam_role_arn_of_yojson = string_of_yojson
let external_id_of_yojson = string_of_yojson

let modify_hsm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     syslog_ip = option_of_yojson (value_for_key ip_address_of_yojson "SyslogIp") _list path;
     external_id = option_of_yojson (value_for_key external_id_of_yojson "ExternalId") _list path;
     iam_role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "IamRoleArn") _list path;
     eni_ip = option_of_yojson (value_for_key ip_address_of_yojson "EniIp") _list path;
     subnet_id = option_of_yojson (value_for_key subnet_id_of_yojson "SubnetId") _list path;
     hsm_arn = value_for_key hsm_arn_of_yojson "HsmArn" _list path;
   }
    : modify_hsm_request)

let hapg_arn_of_yojson = string_of_yojson

let modify_hapg_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hapg_arn = option_of_yojson (value_for_key hapg_arn_of_yojson "HapgArn") _list path }
    : modify_hapg_response)

let label_of_yojson = string_of_yojson

let modify_hapg_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partition_serial_list =
       option_of_yojson
         (value_for_key partition_serial_list_of_yojson "PartitionSerialList")
         _list path;
     label = option_of_yojson (value_for_key label_of_yojson "Label") _list path;
     hapg_arn = value_for_key hapg_arn_of_yojson "HapgArn" _list path;
   }
    : modify_hapg_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag_list = value_for_key tag_list_of_yojson "TagList" _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key string__of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let client_list_of_yojson tree path = list_of_yojson client_arn_of_yojson tree path

let list_luna_clients_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     client_list = value_for_key client_list_of_yojson "ClientList" _list path;
   }
    : list_luna_clients_response)

let list_luna_clients_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_luna_clients_request)

let hsm_list_of_yojson tree path = list_of_yojson hsm_arn_of_yojson tree path

let list_hsms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     hsm_list = option_of_yojson (value_for_key hsm_list_of_yojson "HsmList") _list path;
   }
    : list_hsms_response)

let list_hsms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_hsms_request)

let hapg_list_of_yojson tree path = list_of_yojson hapg_arn_of_yojson tree path

let list_hapgs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     hapg_list = value_for_key hapg_list_of_yojson "HapgList" _list path;
   }
    : list_hapgs_response)

let list_hapgs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_hapgs_request)

let a_z_of_yojson = string_of_yojson
let az_list_of_yojson tree path = list_of_yojson a_z_of_yojson tree path

let list_available_zones_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ az_list = option_of_yojson (value_for_key az_list_of_yojson "AZList") _list path }
    : list_available_zones_response)

let list_available_zones_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let hsm_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEGRADED" -> DEGRADED
    | `String "TERMINATED" -> TERMINATED
    | `String "TERMINATING" -> TERMINATING
    | `String "SUSPENDED" -> SUSPENDED
    | `String "UPDATING" -> UPDATING
    | `String "RUNNING" -> RUNNING
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "HsmStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "HsmStatus")
     : hsm_status)
    : hsm_status)

let hsm_serial_number_of_yojson = string_of_yojson

let get_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     config_cred = option_of_yojson (value_for_key string__of_yojson "ConfigCred") _list path;
     config_file = option_of_yojson (value_for_key string__of_yojson "ConfigFile") _list path;
     config_type = option_of_yojson (value_for_key string__of_yojson "ConfigType") _list path;
   }
    : get_config_response)

let client_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "5.3" -> FIVE_THREE
    | `String "5.1" -> FIVE_ONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClientVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "ClientVersion")
     : client_version)
    : client_version)

let get_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hapg_list = value_for_key hapg_list_of_yojson "HapgList" _list path;
     client_version = value_for_key client_version_of_yojson "ClientVersion" _list path;
     client_arn = value_for_key client_arn_of_yojson "ClientArn" _list path;
   }
    : get_config_request)

let eni_id_of_yojson = string_of_yojson
let certificate_fingerprint_of_yojson = string_of_yojson

let describe_luna_client_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label = option_of_yojson (value_for_key label_of_yojson "Label") _list path;
     last_modified_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTimestamp") _list path;
     certificate_fingerprint =
       option_of_yojson
         (value_for_key certificate_fingerprint_of_yojson "CertificateFingerprint")
         _list path;
     certificate = option_of_yojson (value_for_key certificate_of_yojson "Certificate") _list path;
     client_arn = option_of_yojson (value_for_key client_arn_of_yojson "ClientArn") _list path;
   }
    : describe_luna_client_response)

let describe_luna_client_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_fingerprint =
       option_of_yojson
         (value_for_key certificate_fingerprint_of_yojson "CertificateFingerprint")
         _list path;
     client_arn = option_of_yojson (value_for_key client_arn_of_yojson "ClientArn") _list path;
   }
    : describe_luna_client_request)

let describe_hsm_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partitions = option_of_yojson (value_for_key partition_list_of_yojson "Partitions") _list path;
     server_cert_last_updated =
       option_of_yojson (value_for_key timestamp_of_yojson "ServerCertLastUpdated") _list path;
     server_cert_uri = option_of_yojson (value_for_key string__of_yojson "ServerCertUri") _list path;
     ssh_key_last_updated =
       option_of_yojson (value_for_key timestamp_of_yojson "SshKeyLastUpdated") _list path;
     ssh_public_key = option_of_yojson (value_for_key ssh_key_of_yojson "SshPublicKey") _list path;
     software_version =
       option_of_yojson (value_for_key string__of_yojson "SoftwareVersion") _list path;
     hsm_type = option_of_yojson (value_for_key string__of_yojson "HsmType") _list path;
     vendor_name = option_of_yojson (value_for_key string__of_yojson "VendorName") _list path;
     serial_number =
       option_of_yojson (value_for_key hsm_serial_number_of_yojson "SerialNumber") _list path;
     iam_role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "IamRoleArn") _list path;
     subnet_id = option_of_yojson (value_for_key subnet_id_of_yojson "SubnetId") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     subscription_end_date =
       option_of_yojson (value_for_key timestamp_of_yojson "SubscriptionEndDate") _list path;
     subscription_start_date =
       option_of_yojson (value_for_key timestamp_of_yojson "SubscriptionStartDate") _list path;
     subscription_type =
       option_of_yojson (value_for_key subscription_type_of_yojson "SubscriptionType") _list path;
     eni_ip = option_of_yojson (value_for_key ip_address_of_yojson "EniIp") _list path;
     eni_id = option_of_yojson (value_for_key eni_id_of_yojson "EniId") _list path;
     availability_zone =
       option_of_yojson (value_for_key a_z_of_yojson "AvailabilityZone") _list path;
     status_details = option_of_yojson (value_for_key string__of_yojson "StatusDetails") _list path;
     status = option_of_yojson (value_for_key hsm_status_of_yojson "Status") _list path;
     hsm_arn = option_of_yojson (value_for_key hsm_arn_of_yojson "HsmArn") _list path;
   }
    : describe_hsm_response)

let describe_hsm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hsm_serial_number =
       option_of_yojson (value_for_key hsm_serial_number_of_yojson "HsmSerialNumber") _list path;
     hsm_arn = option_of_yojson (value_for_key hsm_arn_of_yojson "HsmArn") _list path;
   }
    : describe_hsm_request)

let cloud_hsm_object_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEGRADED" -> DEGRADED
    | `String "UPDATING" -> UPDATING
    | `String "READY" -> READY
    | `String value -> raise (deserialize_unknown_enum_value_error path "CloudHsmObjectState" value)
    | _ -> raise (deserialize_wrong_type_error path "CloudHsmObjectState")
     : cloud_hsm_object_state)
    : cloud_hsm_object_state)

let describe_hapg_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key cloud_hsm_object_state_of_yojson "State") _list path;
     partition_serial_list =
       option_of_yojson
         (value_for_key partition_serial_list_of_yojson "PartitionSerialList")
         _list path;
     last_modified_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTimestamp") _list path;
     label = option_of_yojson (value_for_key label_of_yojson "Label") _list path;
     hsms_pending_registration =
       option_of_yojson (value_for_key hsm_list_of_yojson "HsmsPendingRegistration") _list path;
     hsms_pending_deletion =
       option_of_yojson (value_for_key hsm_list_of_yojson "HsmsPendingDeletion") _list path;
     hsms_last_action_failed =
       option_of_yojson (value_for_key hsm_list_of_yojson "HsmsLastActionFailed") _list path;
     hapg_serial = option_of_yojson (value_for_key string__of_yojson "HapgSerial") _list path;
     hapg_arn = option_of_yojson (value_for_key hapg_arn_of_yojson "HapgArn") _list path;
   }
    : describe_hapg_response)

let describe_hapg_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hapg_arn = value_for_key hapg_arn_of_yojson "HapgArn" _list path } : describe_hapg_request)

let delete_luna_client_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = value_for_key string__of_yojson "Status" _list path } : delete_luna_client_response)

let delete_luna_client_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ client_arn = value_for_key client_arn_of_yojson "ClientArn" _list path }
    : delete_luna_client_request)

let delete_hsm_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = value_for_key string__of_yojson "Status" _list path } : delete_hsm_response)

let delete_hsm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hsm_arn = value_for_key hsm_arn_of_yojson "HsmArn" _list path } : delete_hsm_request)

let delete_hapg_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = value_for_key string__of_yojson "Status" _list path } : delete_hapg_response)

let delete_hapg_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hapg_arn = value_for_key hapg_arn_of_yojson "HapgArn" _list path } : delete_hapg_request)

let create_luna_client_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ client_arn = option_of_yojson (value_for_key client_arn_of_yojson "ClientArn") _list path }
    : create_luna_client_response)

let client_label_of_yojson = string_of_yojson

let create_luna_client_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate = value_for_key certificate_of_yojson "Certificate" _list path;
     label = option_of_yojson (value_for_key client_label_of_yojson "Label") _list path;
   }
    : create_luna_client_request)

let create_hsm_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hsm_arn = option_of_yojson (value_for_key hsm_arn_of_yojson "HsmArn") _list path }
    : create_hsm_response)

let client_token_of_yojson = string_of_yojson

let create_hsm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     syslog_ip = option_of_yojson (value_for_key ip_address_of_yojson "SyslogIp") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     subscription_type = value_for_key subscription_type_of_yojson "SubscriptionType" _list path;
     external_id = option_of_yojson (value_for_key external_id_of_yojson "ExternalId") _list path;
     iam_role_arn = value_for_key iam_role_arn_of_yojson "IamRoleArn" _list path;
     eni_ip = option_of_yojson (value_for_key ip_address_of_yojson "EniIp") _list path;
     ssh_key = value_for_key ssh_key_of_yojson "SshKey" _list path;
     subnet_id = value_for_key subnet_id_of_yojson "SubnetId" _list path;
   }
    : create_hsm_request)

let create_hapg_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hapg_arn = option_of_yojson (value_for_key hapg_arn_of_yojson "HapgArn") _list path }
    : create_hapg_response)

let create_hapg_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ label = value_for_key label_of_yojson "Label" _list path } : create_hapg_request)

let add_tags_to_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = value_for_key string__of_yojson "Status" _list path } : add_tags_to_resource_response)

let add_tags_to_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_list = value_for_key tag_list_of_yojson "TagList" _list path;
     resource_arn = value_for_key string__of_yojson "ResourceArn" _list path;
   }
    : add_tags_to_resource_request)
