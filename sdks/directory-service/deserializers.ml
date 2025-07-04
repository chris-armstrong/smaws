open Smaws_Lib.Json.DeserializeHelpers
open Types
let vpc_id_of_yojson = string_of_yojson
let trust_id_of_yojson = string_of_yojson
let verify_trust_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trust_id =
       (option_of_yojson (value_for_key trust_id_of_yojson "TrustId") _list
          path)
   } : verify_trust_result)
let verify_trust_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trust_id = (value_for_key trust_id_of_yojson "TrustId" _list path) } : 
    verify_trust_request)
let exception_message_of_yojson = string_of_yojson
let request_id_of_yojson = string_of_yojson
let unsupported_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : unsupported_operation_exception)
let service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : service_exception)
let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : invalid_parameter_exception)
let entity_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : entity_does_not_exist_exception)
let client_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : client_exception)
let user_password_of_yojson = string_of_yojson
let user_name_of_yojson = string_of_yojson
let user_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : user_does_not_exist_exception)
let use_same_username_of_yojson = bool_of_yojson
let base_unit_of_yojson = unit_of_yojson
let os_version_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "VERSION_2019" -> VERSION_2019
    | `String "VERSION_2012" -> VERSION_2012
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OSVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "OSVersion") : os_version) : 
  os_version)
let os_update_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     os_version =
       (option_of_yojson (value_for_key os_version_of_yojson "OSVersion")
          _list path)
   } : os_update_settings)
let update_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     os_update_settings =
       (option_of_yojson
          (value_for_key os_update_settings_of_yojson "OSUpdateSettings")
          _list path)
   } : update_value)
let update_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "OS" -> OS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UpdateType" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateType") : update_type) : 
  update_type)
let update_trust_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trust_id =
       (option_of_yojson (value_for_key trust_id_of_yojson "TrustId") _list
          path);
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path)
   } : update_trust_result)
let selective_auth_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "SelectiveAuth" value)
    | _ -> raise (deserialize_wrong_type_error path "SelectiveAuth") : 
     selective_auth) : selective_auth)
let update_trust_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selective_auth =
       (option_of_yojson
          (value_for_key selective_auth_of_yojson "SelectiveAuth") _list path);
     trust_id = (value_for_key trust_id_of_yojson "TrustId" _list path)
   } : update_trust_request)
let update_status_reason_of_yojson = string_of_yojson
let update_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "UPDATING" -> UPDATING
    | `String "UPDATED" -> UPDATED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "UpdateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateStatus") : 
     update_status) : update_status)
let directory_id_of_yojson = string_of_yojson
let update_settings_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : update_settings_result)
let directory_configuration_setting_name_of_yojson = string_of_yojson
let directory_configuration_setting_value_of_yojson = string_of_yojson
let setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (value_for_key directory_configuration_setting_value_of_yojson "Value"
          _list path);
     name =
       (value_for_key directory_configuration_setting_name_of_yojson "Name"
          _list path)
   } : setting)
let settings_of_yojson tree path = list_of_yojson setting_of_yojson tree path
let update_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     settings = (value_for_key settings_of_yojson "Settings" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : update_settings_request)
let unsupported_settings_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : unsupported_settings_exception)
let incompatible_settings_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : incompatible_settings_exception)
let directory_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : directory_unavailable_exception)
let directory_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : directory_does_not_exist_exception)
let update_security_group_for_directory_controllers_of_yojson =
  bool_of_yojson
let update_radius_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let server_of_yojson = string_of_yojson
let servers_of_yojson tree path = list_of_yojson server_of_yojson tree path
let port_number_of_yojson = int_of_yojson
let radius_timeout_of_yojson = int_of_yojson
let radius_retries_of_yojson = int_of_yojson
let radius_shared_secret_of_yojson = string_of_yojson
let radius_authentication_protocol_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "MSCHAPV2" -> MSCHAPV2
    | `String "MSCHAPV1" -> MSCHAPV1
    | `String "CHAP" -> CHAP
    | `String "PAP" -> PAP
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "RadiusAuthenticationProtocol" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "RadiusAuthenticationProtocol") : 
     radius_authentication_protocol) : radius_authentication_protocol)
let radius_display_label_of_yojson = string_of_yojson
let radius_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     use_same_username =
       (option_of_yojson
          (value_for_key use_same_username_of_yojson "UseSameUsername") _list
          path);
     display_label =
       (option_of_yojson
          (value_for_key radius_display_label_of_yojson "DisplayLabel") _list
          path);
     authentication_protocol =
       (option_of_yojson
          (value_for_key radius_authentication_protocol_of_yojson
             "AuthenticationProtocol") _list path);
     shared_secret =
       (option_of_yojson
          (value_for_key radius_shared_secret_of_yojson "SharedSecret") _list
          path);
     radius_retries =
       (option_of_yojson
          (value_for_key radius_retries_of_yojson "RadiusRetries") _list path);
     radius_timeout =
       (option_of_yojson
          (value_for_key radius_timeout_of_yojson "RadiusTimeout") _list path);
     radius_port =
       (option_of_yojson (value_for_key port_number_of_yojson "RadiusPort")
          _list path);
     radius_servers =
       (option_of_yojson (value_for_key servers_of_yojson "RadiusServers")
          _list path)
   } : radius_settings)
let update_radius_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     radius_settings =
       (value_for_key radius_settings_of_yojson "RadiusSettings" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : update_radius_request)
let update_number_of_domain_controllers_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let desired_number_of_domain_controllers_of_yojson = int_of_yojson
let update_number_of_domain_controllers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     desired_number =
       (value_for_key desired_number_of_domain_controllers_of_yojson
          "DesiredNumber" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : update_number_of_domain_controllers_request)
let domain_controller_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : domain_controller_limit_exceeded_exception)
let region_name_of_yojson = string_of_yojson
let initiated_by_of_yojson = string_of_yojson
let start_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let last_updated_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let update_info_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_date_time =
       (option_of_yojson
          (value_for_key last_updated_date_time_of_yojson
             "LastUpdatedDateTime") _list path);
     start_time =
       (option_of_yojson
          (value_for_key start_date_time_of_yojson "StartTime") _list path);
     previous_value =
       (option_of_yojson
          (value_for_key update_value_of_yojson "PreviousValue") _list path);
     new_value =
       (option_of_yojson (value_for_key update_value_of_yojson "NewValue")
          _list path);
     initiated_by =
       (option_of_yojson (value_for_key initiated_by_of_yojson "InitiatedBy")
          _list path);
     status_reason =
       (option_of_yojson
          (value_for_key update_status_reason_of_yojson "StatusReason") _list
          path);
     status =
       (option_of_yojson (value_for_key update_status_of_yojson "Status")
          _list path);
     region =
       (option_of_yojson (value_for_key region_name_of_yojson "Region") _list
          path)
   } : update_info_entry)
let update_directory_setup_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let create_snapshot_before_update_of_yojson = bool_of_yojson
let update_directory_setup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_snapshot_before_update =
       (option_of_yojson
          (value_for_key create_snapshot_before_update_of_yojson
             "CreateSnapshotBeforeUpdate") _list path);
     os_update_settings =
       (option_of_yojson
          (value_for_key os_update_settings_of_yojson "OSUpdateSettings")
          _list path);
     update_type =
       (value_for_key update_type_of_yojson "UpdateType" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : update_directory_setup_request)
let snapshot_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : snapshot_limit_exceeded_exception)
let directory_in_desired_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : directory_in_desired_state_exception)
let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : access_denied_exception)
let update_conditional_forwarder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let remote_domain_name_of_yojson = string_of_yojson
let ip_addr_of_yojson = string_of_yojson
let dns_ip_addrs_of_yojson tree path =
  list_of_yojson ip_addr_of_yojson tree path
let update_conditional_forwarder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dns_ip_addrs =
       (value_for_key dns_ip_addrs_of_yojson "DnsIpAddrs" _list path);
     remote_domain_name =
       (value_for_key remote_domain_name_of_yojson "RemoteDomainName" _list
          path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : update_conditional_forwarder_request)
let update_activities_of_yojson tree path =
  list_of_yojson update_info_entry_of_yojson tree path
let target_id_of_yojson = string_of_yojson
let target_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetType") : target_type) : 
  target_type)
let unshare_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = (value_for_key target_type_of_yojson "Type" _list path);
     id = (value_for_key target_id_of_yojson "Id" _list path)
   } : unshare_target)
let unshare_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_directory_id =
       (option_of_yojson
          (value_for_key directory_id_of_yojson "SharedDirectoryId") _list
          path)
   } : unshare_directory_result)
let unshare_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unshare_target =
       (value_for_key unshare_target_of_yojson "UnshareTarget" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : unshare_directory_request)
let invalid_target_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : invalid_target_exception)
let directory_not_shared_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : directory_not_shared_exception)
let trust_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "EXTERNAL" -> EXTERNAL
    | `String "FOREST" -> FOREST
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TrustType" value)
    | _ -> raise (deserialize_wrong_type_error path "TrustType") : trust_type) : 
  trust_type)
let trust_direction_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TWO_WAY" -> TWO_WAY
    | `String "ONE_WAY_INCOMING" -> ONE_WAY_INCOMING
    | `String "ONE_WAY_OUTGOING" -> ONE_WAY_OUTGOING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "TrustDirection" value)
    | _ -> raise (deserialize_wrong_type_error path "TrustDirection") : 
     trust_direction) : trust_direction)
let trust_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAILED" -> FAILED
    | `String "DELETED" -> DELETED
    | `String "DELETING" -> DELETING
    | `String "UPDATED" -> UPDATED
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "UPDATING" -> UPDATING
    | `String "VERIFIED" -> VERIFIED
    | `String "VERIFY_FAILED" -> VERIFY_FAILED
    | `String "VERIFYING" -> VERIFYING
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TrustState" value)
    | _ -> raise (deserialize_wrong_type_error path "TrustState") : trust_state) : 
  trust_state)
let created_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let state_last_updated_date_time_of_yojson =
  timestamp_epoch_seconds_of_yojson
let trust_state_reason_of_yojson = string_of_yojson
let trust_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selective_auth =
       (option_of_yojson
          (value_for_key selective_auth_of_yojson "SelectiveAuth") _list path);
     trust_state_reason =
       (option_of_yojson
          (value_for_key trust_state_reason_of_yojson "TrustStateReason")
          _list path);
     state_last_updated_date_time =
       (option_of_yojson
          (value_for_key state_last_updated_date_time_of_yojson
             "StateLastUpdatedDateTime") _list path);
     last_updated_date_time =
       (option_of_yojson
          (value_for_key last_updated_date_time_of_yojson
             "LastUpdatedDateTime") _list path);
     created_date_time =
       (option_of_yojson
          (value_for_key created_date_time_of_yojson "CreatedDateTime") _list
          path);
     trust_state =
       (option_of_yojson (value_for_key trust_state_of_yojson "TrustState")
          _list path);
     trust_direction =
       (option_of_yojson
          (value_for_key trust_direction_of_yojson "TrustDirection") _list
          path);
     trust_type =
       (option_of_yojson (value_for_key trust_type_of_yojson "TrustType")
          _list path);
     remote_domain_name =
       (option_of_yojson
          (value_for_key remote_domain_name_of_yojson "RemoteDomainName")
          _list path);
     trust_id =
       (option_of_yojson (value_for_key trust_id_of_yojson "TrustId") _list
          path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : trust)
let trusts_of_yojson tree path = list_of_yojson trust_of_yojson tree path
let trust_password_of_yojson = string_of_yojson
let trust_ids_of_yojson tree path =
  list_of_yojson trust_id_of_yojson tree path
let topic_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DELETED" -> DELETED
    | `String "FAILED" -> FAILED
    | `String "TOPIC_NOT_FOUND" -> TOPIC_NOT_FOUND
    | `String "REGISTERED" -> REGISTERED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TopicStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TopicStatus") : 
     topic_status) : topic_status)
let topic_name_of_yojson = string_of_yojson
let topic_names_of_yojson tree path =
  list_of_yojson topic_name_of_yojson tree path
let topic_arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = (value_for_key tag_value_of_yojson "Value" _list path);
     key = (value_for_key tag_key_of_yojson "Key" _list path)
   } : tag)
let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : tag_limit_exceeded_exception)
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let subscription_created_date_time_of_yojson =
  timestamp_epoch_seconds_of_yojson
let subnet_id_of_yojson = string_of_yojson
let subnet_ids_of_yojson tree path =
  list_of_yojson subnet_id_of_yojson tree path
let start_time_of_yojson = timestamp_epoch_seconds_of_yojson
let schema_extension_id_of_yojson = string_of_yojson
let start_schema_extension_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_extension_id =
       (option_of_yojson
          (value_for_key schema_extension_id_of_yojson "SchemaExtensionId")
          _list path)
   } : start_schema_extension_result)
let create_snapshot_before_schema_extension_of_yojson = bool_of_yojson
let ldif_content_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson
let start_schema_extension_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       (value_for_key description_of_yojson "Description" _list path);
     ldif_content =
       (value_for_key ldif_content_of_yojson "LdifContent" _list path);
     create_snapshot_before_schema_extension =
       (value_for_key create_snapshot_before_schema_extension_of_yojson
          "CreateSnapshotBeforeSchemaExtension" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : start_schema_extension_request)
let stage_reason_of_yojson = string_of_yojson
let sso_enabled_of_yojson = bool_of_yojson
let snapshot_id_of_yojson = string_of_yojson
let snapshot_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "MANUAL" -> MANUAL
    | `String "AUTO" -> AUTO
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "SnapshotType" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotType") : 
     snapshot_type) : snapshot_type)
let snapshot_name_of_yojson = string_of_yojson
let snapshot_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "CREATING" -> CREATING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "SnapshotStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotStatus") : 
     snapshot_status) : snapshot_status)
let snapshot_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time =
       (option_of_yojson (value_for_key start_time_of_yojson "StartTime")
          _list path);
     status =
       (option_of_yojson (value_for_key snapshot_status_of_yojson "Status")
          _list path);
     name =
       (option_of_yojson (value_for_key snapshot_name_of_yojson "Name") _list
          path);
     type_ =
       (option_of_yojson (value_for_key snapshot_type_of_yojson "Type") _list
          path);
     snapshot_id =
       (option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId")
          _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : snapshot)
let snapshots_of_yojson tree path =
  list_of_yojson snapshot_of_yojson tree path
let limit_of_yojson = int_of_yojson
let manual_snapshots_limit_reached_of_yojson = bool_of_yojson
let snapshot_limits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     manual_snapshots_limit_reached =
       (option_of_yojson
          (value_for_key manual_snapshots_limit_reached_of_yojson
             "ManualSnapshotsLimitReached") _list path);
     manual_snapshots_current_count =
       (option_of_yojson
          (value_for_key limit_of_yojson "ManualSnapshotsCurrentCount") _list
          path);
     manual_snapshots_limit =
       (option_of_yojson
          (value_for_key limit_of_yojson "ManualSnapshotsLimit") _list path)
   } : snapshot_limits)
let snapshot_ids_of_yojson tree path =
  list_of_yojson snapshot_id_of_yojson tree path
let customer_id_of_yojson = string_of_yojson
let share_method_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "HANDSHAKE" -> HANDSHAKE
    | `String "ORGANIZATIONS" -> ORGANIZATIONS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ShareMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "ShareMethod") : 
     share_method) : share_method)
let share_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DELETING" -> DELETING
    | `String "DELETED" -> DELETED
    | `String "SHARE_FAILED" -> SHARE_FAILED
    | `String "SHARING" -> SHARING
    | `String "REJECT_FAILED" -> REJECT_FAILED
    | `String "REJECTING" -> REJECTING
    | `String "REJECTED" -> REJECTED
    | `String "PENDING_ACCEPTANCE" -> PENDING_ACCEPTANCE
    | `String "SHARED" -> SHARED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ShareStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ShareStatus") : 
     share_status) : share_status)
let notes_of_yojson = string_of_yojson
let shared_directory_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_date_time =
       (option_of_yojson
          (value_for_key last_updated_date_time_of_yojson
             "LastUpdatedDateTime") _list path);
     created_date_time =
       (option_of_yojson
          (value_for_key created_date_time_of_yojson "CreatedDateTime") _list
          path);
     share_notes =
       (option_of_yojson (value_for_key notes_of_yojson "ShareNotes") _list
          path);
     share_status =
       (option_of_yojson (value_for_key share_status_of_yojson "ShareStatus")
          _list path);
     shared_directory_id =
       (option_of_yojson
          (value_for_key directory_id_of_yojson "SharedDirectoryId") _list
          path);
     shared_account_id =
       (option_of_yojson
          (value_for_key customer_id_of_yojson "SharedAccountId") _list path);
     share_method =
       (option_of_yojson (value_for_key share_method_of_yojson "ShareMethod")
          _list path);
     owner_directory_id =
       (option_of_yojson
          (value_for_key directory_id_of_yojson "OwnerDirectoryId") _list
          path);
     owner_account_id =
       (option_of_yojson
          (value_for_key customer_id_of_yojson "OwnerAccountId") _list path)
   } : shared_directory)
let shared_directories_of_yojson tree path =
  list_of_yojson shared_directory_of_yojson tree path
let share_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = (value_for_key target_type_of_yojson "Type" _list path);
     id = (value_for_key target_id_of_yojson "Id" _list path)
   } : share_target)
let share_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : share_limit_exceeded_exception)
let share_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_directory_id =
       (option_of_yojson
          (value_for_key directory_id_of_yojson "SharedDirectoryId") _list
          path)
   } : share_directory_result)
let share_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     share_method =
       (value_for_key share_method_of_yojson "ShareMethod" _list path);
     share_target =
       (value_for_key share_target_of_yojson "ShareTarget" _list path);
     share_notes =
       (option_of_yojson (value_for_key notes_of_yojson "ShareNotes") _list
          path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : share_directory_request)
let organizations_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : organizations_exception)
let directory_already_shared_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : directory_already_shared_exception)
let directory_configuration_setting_type_of_yojson = string_of_yojson
let directory_configuration_setting_allowed_values_of_yojson =
  string_of_yojson
let directory_configuration_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DEFAULT" -> DEFAULT
    | `String "FAILED" -> FAILED
    | `String "UPDATED" -> UPDATED
    | `String "UPDATING" -> UPDATING
    | `String "REQUESTED" -> REQUESTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "DirectoryConfigurationStatus" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "DirectoryConfigurationStatus") : 
     directory_configuration_status) : directory_configuration_status)
let directory_configuration_setting_request_detailed_status_of_yojson tree
  path =
  map_of_yojson region_name_of_yojson
    directory_configuration_status_of_yojson tree path
let directory_configuration_setting_request_status_message_of_yojson =
  string_of_yojson
let directory_configuration_setting_last_updated_date_time_of_yojson =
  timestamp_epoch_seconds_of_yojson
let directory_configuration_setting_last_requested_date_time_of_yojson =
  timestamp_epoch_seconds_of_yojson
let directory_configuration_setting_data_type_of_yojson = string_of_yojson
let setting_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_type =
       (option_of_yojson
          (value_for_key directory_configuration_setting_data_type_of_yojson
             "DataType") _list path);
     last_requested_date_time =
       (option_of_yojson
          (value_for_key
             directory_configuration_setting_last_requested_date_time_of_yojson
             "LastRequestedDateTime") _list path);
     last_updated_date_time =
       (option_of_yojson
          (value_for_key
             directory_configuration_setting_last_updated_date_time_of_yojson
             "LastUpdatedDateTime") _list path);
     request_status_message =
       (option_of_yojson
          (value_for_key
             directory_configuration_setting_request_status_message_of_yojson
             "RequestStatusMessage") _list path);
     request_detailed_status =
       (option_of_yojson
          (value_for_key
             directory_configuration_setting_request_detailed_status_of_yojson
             "RequestDetailedStatus") _list path);
     request_status =
       (option_of_yojson
          (value_for_key directory_configuration_status_of_yojson
             "RequestStatus") _list path);
     requested_value =
       (option_of_yojson
          (value_for_key directory_configuration_setting_value_of_yojson
             "RequestedValue") _list path);
     applied_value =
       (option_of_yojson
          (value_for_key directory_configuration_setting_value_of_yojson
             "AppliedValue") _list path);
     allowed_values =
       (option_of_yojson
          (value_for_key
             directory_configuration_setting_allowed_values_of_yojson
             "AllowedValues") _list path);
     name =
       (option_of_yojson
          (value_for_key directory_configuration_setting_name_of_yojson
             "Name") _list path);
     type_ =
       (option_of_yojson
          (value_for_key directory_configuration_setting_type_of_yojson
             "Type") _list path)
   } : setting_entry)
let setting_entries_of_yojson tree path =
  list_of_yojson setting_entry_of_yojson tree path
let security_group_id_of_yojson = string_of_yojson
let schema_extension_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "CANCELLED" -> CANCELLED
    | `String "ROLLBACK_IN_PROGRESS" -> ROLLBACK_IN_PROGRESS
    | `String "CANCEL_IN_PROGRESS" -> CANCEL_IN_PROGRESS
    | `String "REPLICATING" -> REPLICATING
    | `String "UPDATING_SCHEMA" -> UPDATING_SCHEMA
    | `String "CREATING_SNAPSHOT" -> CREATING_SNAPSHOT
    | `String "INITIALIZING" -> INITIALIZING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "SchemaExtensionStatus"
             value)
    | _ -> raise (deserialize_wrong_type_error path "SchemaExtensionStatus") : 
     schema_extension_status) : schema_extension_status)
let schema_extension_status_reason_of_yojson = string_of_yojson
let end_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let schema_extension_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_date_time =
       (option_of_yojson
          (value_for_key end_date_time_of_yojson "EndDateTime") _list path);
     start_date_time =
       (option_of_yojson
          (value_for_key start_date_time_of_yojson "StartDateTime") _list
          path);
     schema_extension_status_reason =
       (option_of_yojson
          (value_for_key schema_extension_status_reason_of_yojson
             "SchemaExtensionStatusReason") _list path);
     schema_extension_status =
       (option_of_yojson
          (value_for_key schema_extension_status_of_yojson
             "SchemaExtensionStatus") _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     schema_extension_id =
       (option_of_yojson
          (value_for_key schema_extension_id_of_yojson "SchemaExtensionId")
          _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : schema_extension_info)
let schema_extensions_info_of_yojson tree path =
  list_of_yojson schema_extension_info_of_yojson tree path
let si_d_of_yojson = string_of_yojson
let restore_from_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let restore_from_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_id =
       (value_for_key snapshot_id_of_yojson "SnapshotId" _list path)
   } : restore_from_snapshot_request)
let resource_id_of_yojson = string_of_yojson
let reset_user_password_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let customer_user_name_of_yojson = string_of_yojson
let reset_user_password_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_password =
       (value_for_key user_password_of_yojson "NewPassword" _list path);
     user_name =
       (value_for_key customer_user_name_of_yojson "UserName" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : reset_user_password_request)
let invalid_password_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : invalid_password_exception)
let replication_scope_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "Domain" -> Domain
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ReplicationScope" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplicationScope") : 
     replication_scope) : replication_scope)
let remove_tags_from_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let remove_tags_from_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = (value_for_key tag_keys_of_yojson "TagKeys" _list path);
     resource_id =
       (value_for_key resource_id_of_yojson "ResourceId" _list path)
   } : remove_tags_from_resource_request)
let remove_region_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let remove_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : remove_region_request)
let remove_ip_routes_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let cidr_ip_of_yojson = string_of_yojson
let cidr_ips_of_yojson tree path = list_of_yojson cidr_ip_of_yojson tree path
let remove_ip_routes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cidr_ips = (value_for_key cidr_ips_of_yojson "CidrIps" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : remove_ip_routes_request)
let remote_domain_names_of_yojson tree path =
  list_of_yojson remote_domain_name_of_yojson tree path
let reject_shared_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_directory_id =
       (option_of_yojson
          (value_for_key directory_id_of_yojson "SharedDirectoryId") _list
          path)
   } : reject_shared_directory_result)
let reject_shared_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_directory_id =
       (value_for_key directory_id_of_yojson "SharedDirectoryId" _list path)
   } : reject_shared_directory_request)
let register_event_topic_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let register_event_topic_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     topic_name = (value_for_key topic_name_of_yojson "TopicName" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : register_event_topic_request)
let certificate_id_of_yojson = string_of_yojson
let register_certificate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_id =
       (option_of_yojson
          (value_for_key certificate_id_of_yojson "CertificateId") _list path)
   } : register_certificate_result)
let certificate_data_of_yojson = string_of_yojson
let certificate_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CLIENT_LDAPS" -> CLIENT_LDAPS
    | `String "CLIENT_CERT_AUTH" -> CLIENT_CERT_AUTH
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "CertificateType" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateType") : 
     certificate_type) : certificate_type)
let ocsp_url_of_yojson = string_of_yojson
let client_cert_auth_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ocsp_url =
       (option_of_yojson (value_for_key ocsp_url_of_yojson "OCSPUrl") _list
          path)
   } : client_cert_auth_settings)
let register_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_cert_auth_settings =
       (option_of_yojson
          (value_for_key client_cert_auth_settings_of_yojson
             "ClientCertAuthSettings") _list path);
     type_ =
       (option_of_yojson (value_for_key certificate_type_of_yojson "Type")
          _list path);
     certificate_data =
       (value_for_key certificate_data_of_yojson "CertificateData" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : register_certificate_request)
let invalid_certificate_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : invalid_certificate_exception)
let certificate_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : certificate_limit_exceeded_exception)
let certificate_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : certificate_already_exists_exception)
let additional_regions_of_yojson tree path =
  list_of_yojson region_name_of_yojson tree path
let regions_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     additional_regions =
       (option_of_yojson
          (value_for_key additional_regions_of_yojson "AdditionalRegions")
          _list path);
     primary_region =
       (option_of_yojson
          (value_for_key region_name_of_yojson "PrimaryRegion") _list path)
   } : regions_info)
let region_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ADDITIONAL" -> ADDITIONAL
    | `String "PRIMARY" -> PRIMARY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RegionType" value)
    | _ -> raise (deserialize_wrong_type_error path "RegionType") : region_type) : 
  region_type)
let directory_stage_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "UPDATING" -> UPDATING
    | `String "FAILED" -> FAILED
    | `String "DELETED" -> DELETED
    | `String "DELETING" -> DELETING
    | `String "RESTOREFAILED" -> RESTOREFAILED
    | `String "RESTORING" -> RESTORING
    | `String "IMPAIRED" -> IMPAIRED
    | `String "INOPERABLE" -> INOPERABLE
    | `String "ACTIVE" -> ACTIVE
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String "REQUESTED" -> REQUESTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DirectoryStage" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryStage") : 
     directory_stage) : directory_stage)
let directory_vpc_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_ids = (value_for_key subnet_ids_of_yojson "SubnetIds" _list path);
     vpc_id = (value_for_key vpc_id_of_yojson "VpcId" _list path)
   } : directory_vpc_settings)
let launch_time_of_yojson = timestamp_epoch_seconds_of_yojson
let region_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_date_time =
       (option_of_yojson
          (value_for_key last_updated_date_time_of_yojson
             "LastUpdatedDateTime") _list path);
     status_last_updated_date_time =
       (option_of_yojson
          (value_for_key state_last_updated_date_time_of_yojson
             "StatusLastUpdatedDateTime") _list path);
     launch_time =
       (option_of_yojson (value_for_key launch_time_of_yojson "LaunchTime")
          _list path);
     desired_number_of_domain_controllers =
       (option_of_yojson
          (value_for_key desired_number_of_domain_controllers_of_yojson
             "DesiredNumberOfDomainControllers") _list path);
     vpc_settings =
       (option_of_yojson
          (value_for_key directory_vpc_settings_of_yojson "VpcSettings")
          _list path);
     status =
       (option_of_yojson (value_for_key directory_stage_of_yojson "Status")
          _list path);
     region_type =
       (option_of_yojson (value_for_key region_type_of_yojson "RegionType")
          _list path);
     region_name =
       (option_of_yojson (value_for_key region_name_of_yojson "RegionName")
          _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : region_description)
let regions_description_of_yojson tree path =
  list_of_yojson region_description_of_yojson tree path
let region_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : region_limit_exceeded_exception)
let radius_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "CREATING" -> CREATING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "RadiusStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RadiusStatus") : 
     radius_status) : radius_status)
let password_of_yojson = string_of_yojson
let page_limit_of_yojson = int_of_yojson
let availability_zone_of_yojson = string_of_yojson
let availability_zones_of_yojson tree path =
  list_of_yojson availability_zone_of_yojson tree path
let directory_vpc_settings_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zones =
       (option_of_yojson
          (value_for_key availability_zones_of_yojson "AvailabilityZones")
          _list path);
     security_group_id =
       (option_of_yojson
          (value_for_key security_group_id_of_yojson "SecurityGroupId") _list
          path);
     subnet_ids =
       (option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds")
          _list path);
     vpc_id =
       (option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path)
   } : directory_vpc_settings_description)
let owner_directory_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     radius_status =
       (option_of_yojson
          (value_for_key radius_status_of_yojson "RadiusStatus") _list path);
     radius_settings =
       (option_of_yojson
          (value_for_key radius_settings_of_yojson "RadiusSettings") _list
          path);
     vpc_settings =
       (option_of_yojson
          (value_for_key directory_vpc_settings_description_of_yojson
             "VpcSettings") _list path);
     dns_ip_addrs =
       (option_of_yojson (value_for_key dns_ip_addrs_of_yojson "DnsIpAddrs")
          _list path);
     account_id =
       (option_of_yojson (value_for_key customer_id_of_yojson "AccountId")
          _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : owner_directory_description)
let organizational_unit_d_n_of_yojson = string_of_yojson
let no_available_certificate_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : no_available_certificate_exception)
let next_token_of_yojson = string_of_yojson
let log_group_name_of_yojson = string_of_yojson
let log_subscription_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription_created_date_time =
       (option_of_yojson
          (value_for_key subscription_created_date_time_of_yojson
             "SubscriptionCreatedDateTime") _list path);
     log_group_name =
       (option_of_yojson
          (value_for_key log_group_name_of_yojson "LogGroupName") _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : log_subscription)
let log_subscriptions_of_yojson tree path =
  list_of_yojson log_subscription_of_yojson tree path
let list_tags_for_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     tags =
       (option_of_yojson (value_for_key tags_of_yojson "Tags") _list path)
   } : list_tags_for_resource_result)
let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     resource_id =
       (value_for_key resource_id_of_yojson "ResourceId" _list path)
   } : list_tags_for_resource_request)
let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : invalid_next_token_exception)
let list_schema_extensions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     schema_extensions_info =
       (option_of_yojson
          (value_for_key schema_extensions_info_of_yojson
             "SchemaExtensionsInfo") _list path)
   } : list_schema_extensions_result)
let list_schema_extensions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : list_schema_extensions_request)
let list_log_subscriptions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     log_subscriptions =
       (option_of_yojson
          (value_for_key log_subscriptions_of_yojson "LogSubscriptions")
          _list path)
   } : list_log_subscriptions_result)
let list_log_subscriptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : list_log_subscriptions_request)
let ip_route_status_msg_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "REMOVE_FAILED" -> REMOVE_FAILED
    | `String "ADD_FAILED" -> ADD_FAILED
    | `String "REMOVED" -> REMOVED
    | `String "REMOVING" -> REMOVING
    | `String "ADDED" -> ADDED
    | `String "ADDING" -> ADDING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "IpRouteStatusMsg" value)
    | _ -> raise (deserialize_wrong_type_error path "IpRouteStatusMsg") : 
     ip_route_status_msg) : ip_route_status_msg)
let added_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let ip_route_status_reason_of_yojson = string_of_yojson
let ip_route_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     ip_route_status_reason =
       (option_of_yojson
          (value_for_key ip_route_status_reason_of_yojson
             "IpRouteStatusReason") _list path);
     added_date_time =
       (option_of_yojson
          (value_for_key added_date_time_of_yojson "AddedDateTime") _list
          path);
     ip_route_status_msg =
       (option_of_yojson
          (value_for_key ip_route_status_msg_of_yojson "IpRouteStatusMsg")
          _list path);
     cidr_ip =
       (option_of_yojson (value_for_key cidr_ip_of_yojson "CidrIp") _list
          path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : ip_route_info)
let ip_routes_info_of_yojson tree path =
  list_of_yojson ip_route_info_of_yojson tree path
let list_ip_routes_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     ip_routes_info =
       (option_of_yojson
          (value_for_key ip_routes_info_of_yojson "IpRoutesInfo") _list path)
   } : list_ip_routes_result)
let list_ip_routes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : list_ip_routes_request)
let certificate_c_n_of_yojson = string_of_yojson
let certificate_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DEREGISTER_FAILED" -> DEREGISTER_FAILED
    | `String "DEREGISTERED" -> DEREGISTERED
    | `String "DEREGISTERING" -> DEREGISTERING
    | `String "REGISTER_FAILED" -> REGISTER_FAILED
    | `String "REGISTERED" -> REGISTERED
    | `String "REGISTERING" -> REGISTERING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "CertificateState" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateState") : 
     certificate_state) : certificate_state)
let certificate_expiry_date_time_of_yojson =
  timestamp_epoch_seconds_of_yojson
let certificate_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       (option_of_yojson (value_for_key certificate_type_of_yojson "Type")
          _list path);
     expiry_date_time =
       (option_of_yojson
          (value_for_key certificate_expiry_date_time_of_yojson
             "ExpiryDateTime") _list path);
     state =
       (option_of_yojson (value_for_key certificate_state_of_yojson "State")
          _list path);
     common_name =
       (option_of_yojson
          (value_for_key certificate_c_n_of_yojson "CommonName") _list path);
     certificate_id =
       (option_of_yojson
          (value_for_key certificate_id_of_yojson "CertificateId") _list path)
   } : certificate_info)
let certificates_info_of_yojson tree path =
  list_of_yojson certificate_info_of_yojson tree path
let list_certificates_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificates_info =
       (option_of_yojson
          (value_for_key certificates_info_of_yojson "CertificatesInfo")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path)
   } : list_certificates_result)
let list_certificates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key page_limit_of_yojson "Limit") _list
          path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : list_certificates_request)
let ldaps_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CLIENT" -> CLIENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LDAPSType" value)
    | _ -> raise (deserialize_wrong_type_error path "LDAPSType") : ldaps_type) : 
  ldaps_type)
let ldaps_status_reason_of_yojson = string_of_yojson
let ldaps_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLE_FAILED" -> ENABLE_FAILED
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LDAPSStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LDAPSStatus") : 
     ldaps_status) : ldaps_status)
let ldaps_setting_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_date_time =
       (option_of_yojson
          (value_for_key last_updated_date_time_of_yojson
             "LastUpdatedDateTime") _list path);
     ldaps_status_reason =
       (option_of_yojson
          (value_for_key ldaps_status_reason_of_yojson "LDAPSStatusReason")
          _list path);
     ldaps_status =
       (option_of_yojson (value_for_key ldaps_status_of_yojson "LDAPSStatus")
          _list path)
   } : ldaps_setting_info)
let ldaps_settings_info_of_yojson tree path =
  list_of_yojson ldaps_setting_info_of_yojson tree path
let ip_route_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     cidr_ip =
       (option_of_yojson (value_for_key cidr_ip_of_yojson "CidrIp") _list
          path)
   } : ip_route)
let ip_routes_of_yojson tree path =
  list_of_yojson ip_route_of_yojson tree path
let ip_route_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : ip_route_limit_exceeded_exception)
let ip_addrs_of_yojson tree path = list_of_yojson ip_addr_of_yojson tree path
let invalid_ldaps_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : invalid_ldaps_status_exception)
let invalid_client_auth_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : invalid_client_auth_status_exception)
let insufficient_permissions_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : insufficient_permissions_exception)
let get_snapshot_limits_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_limits =
       (option_of_yojson
          (value_for_key snapshot_limits_of_yojson "SnapshotLimits") _list
          path)
   } : get_snapshot_limits_result)
let get_snapshot_limits_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : get_snapshot_limits_request)
let cloud_only_directories_limit_reached_of_yojson = bool_of_yojson
let connected_directories_limit_reached_of_yojson = bool_of_yojson
let directory_limits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connected_directories_limit_reached =
       (option_of_yojson
          (value_for_key connected_directories_limit_reached_of_yojson
             "ConnectedDirectoriesLimitReached") _list path);
     connected_directories_current_count =
       (option_of_yojson
          (value_for_key limit_of_yojson "ConnectedDirectoriesCurrentCount")
          _list path);
     connected_directories_limit =
       (option_of_yojson
          (value_for_key limit_of_yojson "ConnectedDirectoriesLimit") _list
          path);
     cloud_only_microsoft_ad_limit_reached =
       (option_of_yojson
          (value_for_key cloud_only_directories_limit_reached_of_yojson
             "CloudOnlyMicrosoftADLimitReached") _list path);
     cloud_only_microsoft_ad_current_count =
       (option_of_yojson
          (value_for_key limit_of_yojson "CloudOnlyMicrosoftADCurrentCount")
          _list path);
     cloud_only_microsoft_ad_limit =
       (option_of_yojson
          (value_for_key limit_of_yojson "CloudOnlyMicrosoftADLimit") _list
          path);
     cloud_only_directories_limit_reached =
       (option_of_yojson
          (value_for_key cloud_only_directories_limit_reached_of_yojson
             "CloudOnlyDirectoriesLimitReached") _list path);
     cloud_only_directories_current_count =
       (option_of_yojson
          (value_for_key limit_of_yojson "CloudOnlyDirectoriesCurrentCount")
          _list path);
     cloud_only_directories_limit =
       (option_of_yojson
          (value_for_key limit_of_yojson "CloudOnlyDirectoriesLimit") _list
          path)
   } : directory_limits)
let get_directory_limits_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_limits =
       (option_of_yojson
          (value_for_key directory_limits_of_yojson "DirectoryLimits") _list
          path)
   } : get_directory_limits_result)
let get_directory_limits_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let event_topic_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       (option_of_yojson (value_for_key topic_status_of_yojson "Status")
          _list path);
     created_date_time =
       (option_of_yojson
          (value_for_key created_date_time_of_yojson "CreatedDateTime") _list
          path);
     topic_arn =
       (option_of_yojson (value_for_key topic_arn_of_yojson "TopicArn") _list
          path);
     topic_name =
       (option_of_yojson (value_for_key topic_name_of_yojson "TopicName")
          _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : event_topic)
let event_topics_of_yojson tree path =
  list_of_yojson event_topic_of_yojson tree path
let entity_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : entity_already_exists_exception)
let enable_sso_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let connect_password_of_yojson = string_of_yojson
let enable_sso_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password =
       (option_of_yojson
          (value_for_key connect_password_of_yojson "Password") _list path);
     user_name =
       (option_of_yojson (value_for_key user_name_of_yojson "UserName") _list
          path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : enable_sso_request)
let authentication_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : authentication_failed_exception)
let enable_radius_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let enable_radius_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     radius_settings =
       (value_for_key radius_settings_of_yojson "RadiusSettings" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : enable_radius_request)
let enable_ldaps_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let enable_ldaps_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = (value_for_key ldaps_type_of_yojson "Type" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : enable_ldaps_request)
let enable_directory_data_access_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let enable_directory_data_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : enable_directory_data_access_request)
let enable_client_authentication_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let client_authentication_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "SMART_CARD_OR_PASSWORD" -> SMART_CARD_OR_PASSWORD
    | `String "SMART_CARD" -> SMART_CARD
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "ClientAuthenticationType" value)
    | _ ->
        raise (deserialize_wrong_type_error path "ClientAuthenticationType") : 
     client_authentication_type) : client_authentication_type)
let enable_client_authentication_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       (value_for_key client_authentication_type_of_yojson "Type" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : enable_client_authentication_request)
let domain_controller_id_of_yojson = string_of_yojson
let domain_controller_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "UPDATING" -> UPDATING
    | `String "FAILED" -> FAILED
    | `String "DELETED" -> DELETED
    | `String "DELETING" -> DELETING
    | `String "RESTORING" -> RESTORING
    | `String "IMPAIRED" -> IMPAIRED
    | `String "ACTIVE" -> ACTIVE
    | `String "CREATING" -> CREATING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DomainControllerStatus"
             value)
    | _ -> raise (deserialize_wrong_type_error path "DomainControllerStatus") : 
     domain_controller_status) : domain_controller_status)
let domain_controller_status_reason_of_yojson = string_of_yojson
let domain_controller_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_last_updated_date_time =
       (option_of_yojson
          (value_for_key last_updated_date_time_of_yojson
             "StatusLastUpdatedDateTime") _list path);
     launch_time =
       (option_of_yojson (value_for_key launch_time_of_yojson "LaunchTime")
          _list path);
     status_reason =
       (option_of_yojson
          (value_for_key domain_controller_status_reason_of_yojson
             "StatusReason") _list path);
     status =
       (option_of_yojson
          (value_for_key domain_controller_status_of_yojson "Status") _list
          path);
     availability_zone =
       (option_of_yojson
          (value_for_key availability_zone_of_yojson "AvailabilityZone")
          _list path);
     subnet_id =
       (option_of_yojson (value_for_key subnet_id_of_yojson "SubnetId") _list
          path);
     vpc_id =
       (option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path);
     dns_ip_addr =
       (option_of_yojson (value_for_key ip_addr_of_yojson "DnsIpAddr") _list
          path);
     domain_controller_id =
       (option_of_yojson
          (value_for_key domain_controller_id_of_yojson "DomainControllerId")
          _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : domain_controller)
let domain_controllers_of_yojson tree path =
  list_of_yojson domain_controller_of_yojson tree path
let domain_controller_ids_of_yojson tree path =
  list_of_yojson domain_controller_id_of_yojson tree path
let disable_sso_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let disable_sso_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password =
       (option_of_yojson
          (value_for_key connect_password_of_yojson "Password") _list path);
     user_name =
       (option_of_yojson (value_for_key user_name_of_yojson "UserName") _list
          path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : disable_sso_request)
let disable_radius_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let disable_radius_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : disable_radius_request)
let disable_ldaps_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let disable_ldaps_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = (value_for_key ldaps_type_of_yojson "Type" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : disable_ldaps_request)
let disable_directory_data_access_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let disable_directory_data_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : disable_directory_data_access_request)
let disable_client_authentication_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let disable_client_authentication_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       (value_for_key client_authentication_type_of_yojson "Type" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : disable_client_authentication_request)
let directory_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "SHARED_MICROSOFT_AD" -> SHARED_MICROSOFT_AD
    | `String "MICROSOFT_AD" -> MICROSOFT_AD
    | `String "AD_CONNECTOR" -> AD_CONNECTOR
    | `String "SIMPLE_AD" -> SIMPLE_AD
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DirectoryType" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryType") : 
     directory_type) : directory_type)
let directory_size_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "LARGE" -> LARGE
    | `String "SMALL" -> SMALL
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DirectorySize" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectorySize") : 
     directory_size) : directory_size)
let directory_short_name_of_yojson = string_of_yojson
let describe_update_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     update_activities =
       (option_of_yojson
          (value_for_key update_activities_of_yojson "UpdateActivities")
          _list path)
   } : describe_update_directory_result)
let describe_update_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     region_name =
       (option_of_yojson (value_for_key region_name_of_yojson "RegionName")
          _list path);
     update_type =
       (value_for_key update_type_of_yojson "UpdateType" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : describe_update_directory_request)
let describe_trusts_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     trusts =
       (option_of_yojson (value_for_key trusts_of_yojson "Trusts") _list path)
   } : describe_trusts_result)
let describe_trusts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     trust_ids =
       (option_of_yojson (value_for_key trust_ids_of_yojson "TrustIds") _list
          path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : describe_trusts_request)
let describe_snapshots_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     snapshots =
       (option_of_yojson (value_for_key snapshots_of_yojson "Snapshots")
          _list path)
   } : describe_snapshots_result)
let describe_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     snapshot_ids =
       (option_of_yojson (value_for_key snapshot_ids_of_yojson "SnapshotIds")
          _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : describe_snapshots_request)
let describe_shared_directories_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     shared_directories =
       (option_of_yojson
          (value_for_key shared_directories_of_yojson "SharedDirectories")
          _list path)
   } : describe_shared_directories_result)
let directory_ids_of_yojson tree path =
  list_of_yojson directory_id_of_yojson tree path
let describe_shared_directories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     shared_directory_ids =
       (option_of_yojson
          (value_for_key directory_ids_of_yojson "SharedDirectoryIds") _list
          path);
     owner_directory_id =
       (value_for_key directory_id_of_yojson "OwnerDirectoryId" _list path)
   } : describe_shared_directories_request)
let describe_settings_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     setting_entries =
       (option_of_yojson
          (value_for_key setting_entries_of_yojson "SettingEntries") _list
          path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : describe_settings_result)
let describe_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     status =
       (option_of_yojson
          (value_for_key directory_configuration_status_of_yojson "Status")
          _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : describe_settings_request)
let describe_regions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     regions_description =
       (option_of_yojson
          (value_for_key regions_description_of_yojson "RegionsDescription")
          _list path)
   } : describe_regions_result)
let describe_regions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     region_name =
       (option_of_yojson (value_for_key region_name_of_yojson "RegionName")
          _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : describe_regions_request)
let describe_ldaps_settings_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     ldaps_settings_info =
       (option_of_yojson
          (value_for_key ldaps_settings_info_of_yojson "LDAPSSettingsInfo")
          _list path)
   } : describe_ldaps_settings_result)
let describe_ldaps_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key page_limit_of_yojson "Limit") _list
          path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     type_ =
       (option_of_yojson (value_for_key ldaps_type_of_yojson "Type") _list
          path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : describe_ldaps_settings_request)
let describe_event_topics_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_topics =
       (option_of_yojson (value_for_key event_topics_of_yojson "EventTopics")
          _list path)
   } : describe_event_topics_result)
let describe_event_topics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     topic_names =
       (option_of_yojson (value_for_key topic_names_of_yojson "TopicNames")
          _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : describe_event_topics_request)
let describe_domain_controllers_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     domain_controllers =
       (option_of_yojson
          (value_for_key domain_controllers_of_yojson "DomainControllers")
          _list path)
   } : describe_domain_controllers_result)
let describe_domain_controllers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     domain_controller_ids =
       (option_of_yojson
          (value_for_key domain_controller_ids_of_yojson
             "DomainControllerIds") _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : describe_domain_controllers_request)
let data_access_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAILED" -> FAILED
    | `String "ENABLING" -> ENABLING
    | `String "ENABLED" -> ENABLED
    | `String "DISABLING" -> DISABLING
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DataAccessStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DataAccessStatus") : 
     data_access_status) : data_access_status)
let describe_directory_data_access_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_access_status =
       (option_of_yojson
          (value_for_key data_access_status_of_yojson "DataAccessStatus")
          _list path)
   } : describe_directory_data_access_result)
let describe_directory_data_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : describe_directory_data_access_request)
let directory_name_of_yojson = string_of_yojson
let directory_edition_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "STANDARD" -> STANDARD
    | `String "ENTERPRISE" -> ENTERPRISE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DirectoryEdition" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryEdition") : 
     directory_edition) : directory_edition)
let alias_name_of_yojson = string_of_yojson
let access_url_of_yojson = string_of_yojson
let directory_connect_settings_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connect_ips =
       (option_of_yojson (value_for_key ip_addrs_of_yojson "ConnectIps")
          _list path);
     availability_zones =
       (option_of_yojson
          (value_for_key availability_zones_of_yojson "AvailabilityZones")
          _list path);
     security_group_id =
       (option_of_yojson
          (value_for_key security_group_id_of_yojson "SecurityGroupId") _list
          path);
     customer_user_name =
       (option_of_yojson
          (value_for_key user_name_of_yojson "CustomerUserName") _list path);
     subnet_ids =
       (option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds")
          _list path);
     vpc_id =
       (option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path)
   } : directory_connect_settings_description)
let directory_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     os_version =
       (option_of_yojson (value_for_key os_version_of_yojson "OsVersion")
          _list path);
     regions_info =
       (option_of_yojson (value_for_key regions_info_of_yojson "RegionsInfo")
          _list path);
     owner_directory_description =
       (option_of_yojson
          (value_for_key owner_directory_description_of_yojson
             "OwnerDirectoryDescription") _list path);
     desired_number_of_domain_controllers =
       (option_of_yojson
          (value_for_key desired_number_of_domain_controllers_of_yojson
             "DesiredNumberOfDomainControllers") _list path);
     sso_enabled =
       (option_of_yojson (value_for_key sso_enabled_of_yojson "SsoEnabled")
          _list path);
     stage_reason =
       (option_of_yojson (value_for_key stage_reason_of_yojson "StageReason")
          _list path);
     radius_status =
       (option_of_yojson
          (value_for_key radius_status_of_yojson "RadiusStatus") _list path);
     radius_settings =
       (option_of_yojson
          (value_for_key radius_settings_of_yojson "RadiusSettings") _list
          path);
     connect_settings =
       (option_of_yojson
          (value_for_key directory_connect_settings_description_of_yojson
             "ConnectSettings") _list path);
     vpc_settings =
       (option_of_yojson
          (value_for_key directory_vpc_settings_description_of_yojson
             "VpcSettings") _list path);
     type_ =
       (option_of_yojson (value_for_key directory_type_of_yojson "Type")
          _list path);
     stage_last_updated_date_time =
       (option_of_yojson
          (value_for_key last_updated_date_time_of_yojson
             "StageLastUpdatedDateTime") _list path);
     launch_time =
       (option_of_yojson (value_for_key launch_time_of_yojson "LaunchTime")
          _list path);
     share_notes =
       (option_of_yojson (value_for_key notes_of_yojson "ShareNotes") _list
          path);
     share_method =
       (option_of_yojson (value_for_key share_method_of_yojson "ShareMethod")
          _list path);
     share_status =
       (option_of_yojson (value_for_key share_status_of_yojson "ShareStatus")
          _list path);
     stage =
       (option_of_yojson (value_for_key directory_stage_of_yojson "Stage")
          _list path);
     dns_ip_addrs =
       (option_of_yojson (value_for_key dns_ip_addrs_of_yojson "DnsIpAddrs")
          _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     access_url =
       (option_of_yojson (value_for_key access_url_of_yojson "AccessUrl")
          _list path);
     alias =
       (option_of_yojson (value_for_key alias_name_of_yojson "Alias") _list
          path);
     edition =
       (option_of_yojson
          (value_for_key directory_edition_of_yojson "Edition") _list path);
     size =
       (option_of_yojson (value_for_key directory_size_of_yojson "Size")
          _list path);
     short_name =
       (option_of_yojson
          (value_for_key directory_short_name_of_yojson "ShortName") _list
          path);
     name =
       (option_of_yojson (value_for_key directory_name_of_yojson "Name")
          _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : directory_description)
let directory_descriptions_of_yojson tree path =
  list_of_yojson directory_description_of_yojson tree path
let describe_directories_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     directory_descriptions =
       (option_of_yojson
          (value_for_key directory_descriptions_of_yojson
             "DirectoryDescriptions") _list path)
   } : describe_directories_result)
let describe_directories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key limit_of_yojson "Limit") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     directory_ids =
       (option_of_yojson
          (value_for_key directory_ids_of_yojson "DirectoryIds") _list path)
   } : describe_directories_request)
let conditional_forwarder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_scope =
       (option_of_yojson
          (value_for_key replication_scope_of_yojson "ReplicationScope")
          _list path);
     dns_ip_addrs =
       (option_of_yojson (value_for_key dns_ip_addrs_of_yojson "DnsIpAddrs")
          _list path);
     remote_domain_name =
       (option_of_yojson
          (value_for_key remote_domain_name_of_yojson "RemoteDomainName")
          _list path)
   } : conditional_forwarder)
let conditional_forwarders_of_yojson tree path =
  list_of_yojson conditional_forwarder_of_yojson tree path
let describe_conditional_forwarders_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conditional_forwarders =
       (option_of_yojson
          (value_for_key conditional_forwarders_of_yojson
             "ConditionalForwarders") _list path)
   } : describe_conditional_forwarders_result)
let describe_conditional_forwarders_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remote_domain_names =
       (option_of_yojson
          (value_for_key remote_domain_names_of_yojson "RemoteDomainNames")
          _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : describe_conditional_forwarders_request)
let client_authentication_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "ClientAuthenticationStatus" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "ClientAuthenticationStatus") : 
     client_authentication_status) : client_authentication_status)
let client_authentication_setting_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_date_time =
       (option_of_yojson
          (value_for_key last_updated_date_time_of_yojson
             "LastUpdatedDateTime") _list path);
     status =
       (option_of_yojson
          (value_for_key client_authentication_status_of_yojson "Status")
          _list path);
     type_ =
       (option_of_yojson
          (value_for_key client_authentication_type_of_yojson "Type") _list
          path)
   } : client_authentication_setting_info)
let client_authentication_settings_info_of_yojson tree path =
  list_of_yojson client_authentication_setting_info_of_yojson tree path
let describe_client_authentication_settings_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     client_authentication_settings_info =
       (option_of_yojson
          (value_for_key client_authentication_settings_info_of_yojson
             "ClientAuthenticationSettingsInfo") _list path)
   } : describe_client_authentication_settings_result)
let describe_client_authentication_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       (option_of_yojson (value_for_key page_limit_of_yojson "Limit") _list
          path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     type_ =
       (option_of_yojson
          (value_for_key client_authentication_type_of_yojson "Type") _list
          path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : describe_client_authentication_settings_request)
let certificate_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : certificate_does_not_exist_exception)
let certificate_state_reason_of_yojson = string_of_yojson
let certificate_registered_date_time_of_yojson =
  timestamp_epoch_seconds_of_yojson
let certificate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_cert_auth_settings =
       (option_of_yojson
          (value_for_key client_cert_auth_settings_of_yojson
             "ClientCertAuthSettings") _list path);
     type_ =
       (option_of_yojson (value_for_key certificate_type_of_yojson "Type")
          _list path);
     expiry_date_time =
       (option_of_yojson
          (value_for_key certificate_expiry_date_time_of_yojson
             "ExpiryDateTime") _list path);
     registered_date_time =
       (option_of_yojson
          (value_for_key certificate_registered_date_time_of_yojson
             "RegisteredDateTime") _list path);
     common_name =
       (option_of_yojson
          (value_for_key certificate_c_n_of_yojson "CommonName") _list path);
     state_reason =
       (option_of_yojson
          (value_for_key certificate_state_reason_of_yojson "StateReason")
          _list path);
     state =
       (option_of_yojson (value_for_key certificate_state_of_yojson "State")
          _list path);
     certificate_id =
       (option_of_yojson
          (value_for_key certificate_id_of_yojson "CertificateId") _list path)
   } : certificate)
let describe_certificate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate =
       (option_of_yojson (value_for_key certificate_of_yojson "Certificate")
          _list path)
   } : describe_certificate_result)
let describe_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_id =
       (value_for_key certificate_id_of_yojson "CertificateId" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : describe_certificate_request)
let deregister_event_topic_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let deregister_event_topic_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     topic_name = (value_for_key topic_name_of_yojson "TopicName" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : deregister_event_topic_request)
let certificate_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : certificate_in_use_exception)
let deregister_certificate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let deregister_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_id =
       (value_for_key certificate_id_of_yojson "CertificateId" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : deregister_certificate_request)
let delete_trust_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trust_id =
       (option_of_yojson (value_for_key trust_id_of_yojson "TrustId") _list
          path)
   } : delete_trust_result)
let delete_associated_conditional_forwarder_of_yojson = bool_of_yojson
let delete_trust_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_associated_conditional_forwarder =
       (option_of_yojson
          (value_for_key delete_associated_conditional_forwarder_of_yojson
             "DeleteAssociatedConditionalForwarder") _list path);
     trust_id = (value_for_key trust_id_of_yojson "TrustId" _list path)
   } : delete_trust_request)
let delete_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_id =
       (option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId")
          _list path)
   } : delete_snapshot_result)
let delete_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_id =
       (value_for_key snapshot_id_of_yojson "SnapshotId" _list path)
   } : delete_snapshot_request)
let delete_log_subscription_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_log_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : delete_log_subscription_request)
let delete_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : delete_directory_result)
let delete_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : delete_directory_request)
let delete_conditional_forwarder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_conditional_forwarder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remote_domain_name =
       (value_for_key remote_domain_name_of_yojson "RemoteDomainName" _list
          path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : delete_conditional_forwarder_request)
let create_trust_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trust_id =
       (option_of_yojson (value_for_key trust_id_of_yojson "TrustId") _list
          path)
   } : create_trust_result)
let create_trust_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selective_auth =
       (option_of_yojson
          (value_for_key selective_auth_of_yojson "SelectiveAuth") _list path);
     conditional_forwarder_ip_addrs =
       (option_of_yojson
          (value_for_key dns_ip_addrs_of_yojson "ConditionalForwarderIpAddrs")
          _list path);
     trust_type =
       (option_of_yojson (value_for_key trust_type_of_yojson "TrustType")
          _list path);
     trust_direction =
       (value_for_key trust_direction_of_yojson "TrustDirection" _list path);
     trust_password =
       (value_for_key trust_password_of_yojson "TrustPassword" _list path);
     remote_domain_name =
       (value_for_key remote_domain_name_of_yojson "RemoteDomainName" _list
          path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : create_trust_request)
let create_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_id =
       (option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId")
          _list path)
   } : create_snapshot_result)
let create_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       (option_of_yojson (value_for_key snapshot_name_of_yojson "Name") _list
          path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : create_snapshot_request)
let directory_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : directory_limit_exceeded_exception)
let create_microsoft_ad_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : create_microsoft_ad_result)
let create_microsoft_ad_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_of_yojson "Tags") _list path);
     edition =
       (option_of_yojson
          (value_for_key directory_edition_of_yojson "Edition") _list path);
     vpc_settings =
       (value_for_key directory_vpc_settings_of_yojson "VpcSettings" _list
          path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     password = (value_for_key password_of_yojson "Password" _list path);
     short_name =
       (option_of_yojson
          (value_for_key directory_short_name_of_yojson "ShortName") _list
          path);
     name = (value_for_key directory_name_of_yojson "Name" _list path)
   } : create_microsoft_ad_request)
let create_log_subscription_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let create_log_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_name =
       (value_for_key log_group_name_of_yojson "LogGroupName" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : create_log_subscription_request)
let create_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : create_directory_result)
let create_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_of_yojson "Tags") _list path);
     vpc_settings =
       (option_of_yojson
          (value_for_key directory_vpc_settings_of_yojson "VpcSettings")
          _list path);
     size = (value_for_key directory_size_of_yojson "Size" _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     password = (value_for_key password_of_yojson "Password" _list path);
     short_name =
       (option_of_yojson
          (value_for_key directory_short_name_of_yojson "ShortName") _list
          path);
     name = (value_for_key directory_name_of_yojson "Name" _list path)
   } : create_directory_request)
let create_conditional_forwarder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let create_conditional_forwarder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dns_ip_addrs =
       (value_for_key dns_ip_addrs_of_yojson "DnsIpAddrs" _list path);
     remote_domain_name =
       (value_for_key remote_domain_name_of_yojson "RemoteDomainName" _list
          path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : create_conditional_forwarder_request)
let computer_name_of_yojson = string_of_yojson
let attribute_name_of_yojson = string_of_yojson
let attribute_value_of_yojson = string_of_yojson
let attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (option_of_yojson (value_for_key attribute_value_of_yojson "Value")
          _list path);
     name =
       (option_of_yojson (value_for_key attribute_name_of_yojson "Name")
          _list path)
   } : attribute)
let attributes_of_yojson tree path =
  list_of_yojson attribute_of_yojson tree path
let computer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     computer_attributes =
       (option_of_yojson
          (value_for_key attributes_of_yojson "ComputerAttributes") _list
          path);
     computer_name =
       (option_of_yojson
          (value_for_key computer_name_of_yojson "ComputerName") _list path);
     computer_id =
       (option_of_yojson (value_for_key si_d_of_yojson "ComputerId") _list
          path)
   } : computer)
let create_computer_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     computer =
       (option_of_yojson (value_for_key computer_of_yojson "Computer") _list
          path)
   } : create_computer_result)
let computer_password_of_yojson = string_of_yojson
let create_computer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     computer_attributes =
       (option_of_yojson
          (value_for_key attributes_of_yojson "ComputerAttributes") _list
          path);
     organizational_unit_distinguished_name =
       (option_of_yojson
          (value_for_key organizational_unit_d_n_of_yojson
             "OrganizationalUnitDistinguishedName") _list path);
     password =
       (value_for_key computer_password_of_yojson "Password" _list path);
     computer_name =
       (value_for_key computer_name_of_yojson "ComputerName" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : create_computer_request)
let create_alias_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias =
       (option_of_yojson (value_for_key alias_name_of_yojson "Alias") _list
          path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : create_alias_result)
let create_alias_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias = (value_for_key alias_name_of_yojson "Alias" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : create_alias_request)
let connect_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : connect_directory_result)
let directory_connect_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     customer_user_name =
       (value_for_key user_name_of_yojson "CustomerUserName" _list path);
     customer_dns_ips =
       (value_for_key dns_ip_addrs_of_yojson "CustomerDnsIps" _list path);
     subnet_ids = (value_for_key subnet_ids_of_yojson "SubnetIds" _list path);
     vpc_id = (value_for_key vpc_id_of_yojson "VpcId" _list path)
   } : directory_connect_settings)
let connect_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_of_yojson "Tags") _list path);
     connect_settings =
       (value_for_key directory_connect_settings_of_yojson "ConnectSettings"
          _list path);
     size = (value_for_key directory_size_of_yojson "Size" _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     password =
       (value_for_key connect_password_of_yojson "Password" _list path);
     short_name =
       (option_of_yojson
          (value_for_key directory_short_name_of_yojson "ShortName") _list
          path);
     name = (value_for_key directory_name_of_yojson "Name" _list path)
   } : connect_directory_request)
let cancel_schema_extension_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let cancel_schema_extension_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_extension_id =
       (value_for_key schema_extension_id_of_yojson "SchemaExtensionId" _list
          path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : cancel_schema_extension_request)
let add_tags_to_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let add_tags_to_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = (value_for_key tags_of_yojson "Tags" _list path);
     resource_id =
       (value_for_key resource_id_of_yojson "ResourceId" _list path)
   } : add_tags_to_resource_request)
let directory_already_in_region_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "RequestId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "Message") _list path)
   } : directory_already_in_region_exception)
let add_region_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let add_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_settings =
       (value_for_key directory_vpc_settings_of_yojson "VPCSettings" _list
          path);
     region_name =
       (value_for_key region_name_of_yojson "RegionName" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : add_region_request)
let add_ip_routes_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let add_ip_routes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_security_group_for_directory_controllers =
       (option_of_yojson
          (value_for_key
             update_security_group_for_directory_controllers_of_yojson
             "UpdateSecurityGroupForDirectoryControllers") _list path);
     ip_routes = (value_for_key ip_routes_of_yojson "IpRoutes" _list path);
     directory_id =
       (value_for_key directory_id_of_yojson "DirectoryId" _list path)
   } : add_ip_routes_request)
let accept_shared_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_directory =
       (option_of_yojson
          (value_for_key shared_directory_of_yojson "SharedDirectory") _list
          path)
   } : accept_shared_directory_result)
let accept_shared_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_directory_id =
       (value_for_key directory_id_of_yojson "SharedDirectoryId" _list path)
   } : accept_shared_directory_request)
let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson