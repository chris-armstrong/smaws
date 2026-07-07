open Smaws_Lib.Json.DeserializeHelpers
open Types

let workflow_step_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DECRYPT" -> DECRYPT
    | `String "DELETE" -> DELETE
    | `String "TAG" -> TAG
    | `String "CUSTOM" -> CUSTOM
    | `String "COPY" -> COPY
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkflowStepType" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkflowStepType")
     : workflow_step_type)
    : workflow_step_type)

let workflow_step_name_of_yojson = string_of_yojson
let s3_bucket_of_yojson = string_of_yojson
let s3_key_of_yojson = string_of_yojson

let s3_input_file_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key s3_key_of_yojson "Key") _list path;
     bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "Bucket") _list path;
   }
    : s3_input_file_location)

let efs_file_system_id_of_yojson = string_of_yojson
let efs_path_of_yojson = string_of_yojson

let efs_file_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     path = option_of_yojson (value_for_key efs_path_of_yojson "Path") _list path;
     file_system_id =
       option_of_yojson (value_for_key efs_file_system_id_of_yojson "FileSystemId") _list path;
   }
    : efs_file_location)

let input_file_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     efs_file_location =
       option_of_yojson (value_for_key efs_file_location_of_yojson "EfsFileLocation") _list path;
     s3_file_location =
       option_of_yojson (value_for_key s3_input_file_location_of_yojson "S3FileLocation") _list path;
   }
    : input_file_location)

let overwrite_existing_of_yojson (tree : t) path =
  ((match tree with
    | `String "FALSE" -> FALSE
    | `String "TRUE" -> TRUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OverwriteExisting" value)
    | _ -> raise (deserialize_wrong_type_error path "OverwriteExisting")
     : overwrite_existing)
    : overwrite_existing)

let source_file_location_of_yojson = string_of_yojson

let copy_step_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_file_location =
       option_of_yojson
         (value_for_key source_file_location_of_yojson "SourceFileLocation")
         _list path;
     overwrite_existing =
       option_of_yojson (value_for_key overwrite_existing_of_yojson "OverwriteExisting") _list path;
     destination_file_location =
       option_of_yojson
         (value_for_key input_file_location_of_yojson "DestinationFileLocation")
         _list path;
     name = option_of_yojson (value_for_key workflow_step_name_of_yojson "Name") _list path;
   }
    : copy_step_details)

let custom_step_target_of_yojson = string_of_yojson
let custom_step_timeout_seconds_of_yojson = int_of_yojson

let custom_step_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_file_location =
       option_of_yojson
         (value_for_key source_file_location_of_yojson "SourceFileLocation")
         _list path;
     timeout_seconds =
       option_of_yojson
         (value_for_key custom_step_timeout_seconds_of_yojson "TimeoutSeconds")
         _list path;
     target = option_of_yojson (value_for_key custom_step_target_of_yojson "Target") _list path;
     name = option_of_yojson (value_for_key workflow_step_name_of_yojson "Name") _list path;
   }
    : custom_step_details)

let delete_step_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_file_location =
       option_of_yojson
         (value_for_key source_file_location_of_yojson "SourceFileLocation")
         _list path;
     name = option_of_yojson (value_for_key workflow_step_name_of_yojson "Name") _list path;
   }
    : delete_step_details)

let s3_tag_key_of_yojson = string_of_yojson
let s3_tag_value_of_yojson = string_of_yojson

let s3_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key s3_tag_value_of_yojson "Value" _list path;
     key = value_for_key s3_tag_key_of_yojson "Key" _list path;
   }
    : s3_tag)

let s3_tags_of_yojson tree path = list_of_yojson s3_tag_of_yojson tree path

let tag_step_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_file_location =
       option_of_yojson
         (value_for_key source_file_location_of_yojson "SourceFileLocation")
         _list path;
     tags = option_of_yojson (value_for_key s3_tags_of_yojson "Tags") _list path;
     name = option_of_yojson (value_for_key workflow_step_name_of_yojson "Name") _list path;
   }
    : tag_step_details)

let encryption_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PGP" -> PGP
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionType")
     : encryption_type)
    : encryption_type)

let decrypt_step_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_file_location =
       value_for_key input_file_location_of_yojson "DestinationFileLocation" _list path;
     overwrite_existing =
       option_of_yojson (value_for_key overwrite_existing_of_yojson "OverwriteExisting") _list path;
     source_file_location =
       option_of_yojson
         (value_for_key source_file_location_of_yojson "SourceFileLocation")
         _list path;
     type_ = value_for_key encryption_type_of_yojson "Type" _list path;
     name = option_of_yojson (value_for_key workflow_step_name_of_yojson "Name") _list path;
   }
    : decrypt_step_details)

let workflow_step_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     decrypt_step_details =
       option_of_yojson
         (value_for_key decrypt_step_details_of_yojson "DecryptStepDetails")
         _list path;
     tag_step_details =
       option_of_yojson (value_for_key tag_step_details_of_yojson "TagStepDetails") _list path;
     delete_step_details =
       option_of_yojson (value_for_key delete_step_details_of_yojson "DeleteStepDetails") _list path;
     custom_step_details =
       option_of_yojson (value_for_key custom_step_details_of_yojson "CustomStepDetails") _list path;
     copy_step_details =
       option_of_yojson (value_for_key copy_step_details_of_yojson "CopyStepDetails") _list path;
     type_ = option_of_yojson (value_for_key workflow_step_type_of_yojson "Type") _list path;
   }
    : workflow_step)

let workflow_steps_of_yojson tree path = list_of_yojson workflow_step_of_yojson tree path
let workflow_id_of_yojson = string_of_yojson
let role_of_yojson = string_of_yojson

let workflow_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_role = value_for_key role_of_yojson "ExecutionRole" _list path;
     workflow_id = value_for_key workflow_id_of_yojson "WorkflowId" _list path;
   }
    : workflow_detail)

let on_upload_workflow_details_of_yojson tree path =
  list_of_yojson workflow_detail_of_yojson tree path

let on_partial_upload_workflow_details_of_yojson tree path =
  list_of_yojson workflow_detail_of_yojson tree path

let workflow_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_partial_upload =
       option_of_yojson
         (value_for_key on_partial_upload_workflow_details_of_yojson "OnPartialUpload")
         _list path;
     on_upload =
       option_of_yojson (value_for_key on_upload_workflow_details_of_yojson "OnUpload") _list path;
   }
    : workflow_details)

let workflow_description_of_yojson = string_of_yojson

let web_app_vpc_endpoint_ip_address_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DUALSTACK" -> DUALSTACK
    | `String "IPV4" -> IPV4
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WebAppVpcEndpointIpAddressType" value)
    | _ -> raise (deserialize_wrong_type_error path "WebAppVpcEndpointIpAddressType")
     : web_app_vpc_endpoint_ip_address_type)
    : web_app_vpc_endpoint_ip_address_type)

let subnet_id_of_yojson = string_of_yojson
let subnet_ids_of_yojson tree path = list_of_yojson subnet_id_of_yojson tree path
let vpc_id_of_yojson = string_of_yojson
let security_group_id_of_yojson = string_of_yojson
let security_group_ids_of_yojson tree path = list_of_yojson security_group_id_of_yojson tree path

let web_app_vpc_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address_type =
       option_of_yojson
         (value_for_key web_app_vpc_endpoint_ip_address_type_of_yojson "IpAddressType")
         _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "SecurityGroupIds") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
   }
    : web_app_vpc_config)

let web_app_unit_count_of_yojson = int_of_yojson

let web_app_units_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Provisioned" -> Provisioned (web_app_unit_count_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "WebAppUnits" unknown)
    : web_app_units)

let web_app_title_of_yojson = string_of_yojson
let web_app_logo_file_of_yojson = blob_of_yojson
let identity_center_instance_arn_of_yojson = string_of_yojson

let identity_center_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     instance_arn =
       option_of_yojson
         (value_for_key identity_center_instance_arn_of_yojson "InstanceArn")
         _list path;
   }
    : identity_center_config)

let web_app_identity_provider_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "IdentityCenterConfig" -> IdentityCenterConfig (identity_center_config_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "WebAppIdentityProviderDetails" unknown)
    : web_app_identity_provider_details)

let web_app_id_of_yojson = string_of_yojson
let web_app_favicon_file_of_yojson = blob_of_yojson

let web_app_endpoint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VPC" -> VPC
    | `String "PUBLIC" -> PUBLIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "WebAppEndpointType" value)
    | _ -> raise (deserialize_wrong_type_error path "WebAppEndpointType")
     : web_app_endpoint_type)
    : web_app_endpoint_type)

let web_app_endpoint_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD" -> STANDARD
    | `String "FIPS" -> FIPS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WebAppEndpointPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "WebAppEndpointPolicy")
     : web_app_endpoint_policy)
    : web_app_endpoint_policy)

let web_app_endpoint_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Vpc" -> Vpc (web_app_vpc_config_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "WebAppEndpointDetails" unknown)
    : web_app_endpoint_details)

let web_app_endpoint_of_yojson = string_of_yojson
let web_app_access_endpoint_of_yojson = string_of_yojson
let vpc_lattice_resource_configuration_arn_of_yojson = string_of_yojson
let vpc_endpoint_id_of_yojson = string_of_yojson
let user_password_of_yojson = string_of_yojson
let user_name_of_yojson = string_of_yojson
let server_id_of_yojson = string_of_yojson
let session_id_of_yojson = string_of_yojson

let user_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
   }
    : user_details)

let user_count_of_yojson = int_of_yojson
let url_of_yojson = string_of_yojson

let update_web_app_vpc_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address_type =
       option_of_yojson
         (value_for_key web_app_vpc_endpoint_ip_address_type_of_yojson "IpAddressType")
         _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
   }
    : update_web_app_vpc_config)

let update_web_app_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path }
    : update_web_app_response)

let update_web_app_identity_center_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ role = option_of_yojson (value_for_key role_of_yojson "Role") _list path }
    : update_web_app_identity_center_config)

let update_web_app_identity_provider_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "IdentityCenterConfig" ->
       IdentityCenterConfig (update_web_app_identity_center_config_of_yojson value_ path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "UpdateWebAppIdentityProviderDetails" unknown)
    : update_web_app_identity_provider_details)

let update_web_app_endpoint_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Vpc" -> Vpc (update_web_app_vpc_config_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "UpdateWebAppEndpointDetails" unknown)
    : update_web_app_endpoint_details)

let update_web_app_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_details =
       option_of_yojson
         (value_for_key update_web_app_endpoint_details_of_yojson "EndpointDetails")
         _list path;
     web_app_units =
       option_of_yojson (value_for_key web_app_units_of_yojson "WebAppUnits") _list path;
     access_endpoint =
       option_of_yojson
         (value_for_key web_app_access_endpoint_of_yojson "AccessEndpoint")
         _list path;
     identity_provider_details =
       option_of_yojson
         (value_for_key update_web_app_identity_provider_details_of_yojson "IdentityProviderDetails")
         _list path;
     web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path;
   }
    : update_web_app_request)

let update_web_app_customization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path }
    : update_web_app_customization_response)

let update_web_app_customization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     favicon_file =
       option_of_yojson (value_for_key web_app_favicon_file_of_yojson "FaviconFile") _list path;
     logo_file = option_of_yojson (value_for_key web_app_logo_file_of_yojson "LogoFile") _list path;
     title = option_of_yojson (value_for_key web_app_title_of_yojson "Title") _list path;
     web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path;
   }
    : update_web_app_customization_request)

let retry_after_seconds_of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "RetryAfterSeconds") _list path;
   }
    : throttling_exception)

let message_of_yojson = string_of_yojson
let resource_of_yojson = string_of_yojson
let resource_type_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     resource = value_for_key resource_of_yojson "Resource" _list path;
     message = value_for_key message_of_yojson "Message" _list path;
   }
    : resource_not_found_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key message_of_yojson "Message" _list path } : invalid_request_exception)

let internal_service_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key message_of_yojson "Message" _list path } : internal_service_error)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key message_of_yojson "Message" _list path } : conflict_exception)

let service_error_message_of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key service_error_message_of_yojson "Message") _list path;
   }
    : access_denied_exception)

let update_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : update_user_response)

let home_directory_of_yojson = string_of_yojson

let home_directory_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LOGICAL" -> LOGICAL
    | `String "PATH" -> PATH
    | `String value -> raise (deserialize_unknown_enum_value_error path "HomeDirectoryType" value)
    | _ -> raise (deserialize_wrong_type_error path "HomeDirectoryType")
     : home_directory_type)
    : home_directory_type)

let map_entry_of_yojson = string_of_yojson
let map_target_of_yojson = string_of_yojson

let map_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DIRECTORY" -> DIRECTORY
    | `String "FILE" -> FILE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MapType" value)
    | _ -> raise (deserialize_wrong_type_error path "MapType")
     : map_type)
    : map_type)

let home_directory_map_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key map_type_of_yojson "Type") _list path;
     target = value_for_key map_target_of_yojson "Target" _list path;
     entry = value_for_key map_entry_of_yojson "Entry" _list path;
   }
    : home_directory_map_entry)

let home_directory_mappings_of_yojson tree path =
  list_of_yojson home_directory_map_entry_of_yojson tree path

let policy_of_yojson = string_of_yojson
let posix_id_of_yojson = long_of_yojson
let secondary_gids_of_yojson tree path = list_of_yojson posix_id_of_yojson tree path

let posix_profile_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secondary_gids =
       option_of_yojson (value_for_key secondary_gids_of_yojson "SecondaryGids") _list path;
     gid = value_for_key posix_id_of_yojson "Gid" _list path;
     uid = value_for_key posix_id_of_yojson "Uid" _list path;
   }
    : posix_profile)

let update_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     posix_profile =
       option_of_yojson (value_for_key posix_profile_of_yojson "PosixProfile") _list path;
     policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path;
     home_directory_mappings =
       option_of_yojson
         (value_for_key home_directory_mappings_of_yojson "HomeDirectoryMappings")
         _list path;
     home_directory_type =
       option_of_yojson (value_for_key home_directory_type_of_yojson "HomeDirectoryType") _list path;
     home_directory =
       option_of_yojson (value_for_key home_directory_of_yojson "HomeDirectory") _list path;
   }
    : update_user_request)

let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key service_error_message_of_yojson "Message") _list path;
   }
    : service_unavailable_exception)

let update_server_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ server_id = value_for_key server_id_of_yojson "ServerId" _list path } : update_server_response)

let certificate_of_yojson = string_of_yojson
let passive_ip_of_yojson = string_of_yojson

let tls_session_resumption_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENFORCED" -> ENFORCED
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TlsSessionResumptionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "TlsSessionResumptionMode")
     : tls_session_resumption_mode)
    : tls_session_resumption_mode)

let set_stat_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLE_NO_OP" -> ENABLE_NO_OP
    | `String "DEFAULT" -> DEFAULT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SetStatOption" value)
    | _ -> raise (deserialize_wrong_type_error path "SetStatOption")
     : set_stat_option)
    : set_stat_option)

let as2_transport_of_yojson (tree : t) path =
  ((match tree with
    | `String "HTTP" -> HTTP
    | `String value -> raise (deserialize_unknown_enum_value_error path "As2Transport" value)
    | _ -> raise (deserialize_wrong_type_error path "As2Transport")
     : as2_transport)
    : as2_transport)

let as2_transports_of_yojson tree path = list_of_yojson as2_transport_of_yojson tree path

let protocol_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     as2_transports =
       option_of_yojson (value_for_key as2_transports_of_yojson "As2Transports") _list path;
     set_stat_option =
       option_of_yojson (value_for_key set_stat_option_of_yojson "SetStatOption") _list path;
     tls_session_resumption_mode =
       option_of_yojson
         (value_for_key tls_session_resumption_mode_of_yojson "TlsSessionResumptionMode")
         _list path;
     passive_ip = option_of_yojson (value_for_key passive_ip_of_yojson "PassiveIp") _list path;
   }
    : protocol_details)

let address_allocation_id_of_yojson = string_of_yojson

let address_allocation_ids_of_yojson tree path =
  list_of_yojson address_allocation_id_of_yojson tree path

let endpoint_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "SecurityGroupIds") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
     address_allocation_ids =
       option_of_yojson
         (value_for_key address_allocation_ids_of_yojson "AddressAllocationIds")
         _list path;
   }
    : endpoint_details)

let endpoint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VPC_ENDPOINT" -> VPC_ENDPOINT
    | `String "VPC" -> VPC
    | `String "PUBLIC" -> PUBLIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "EndpointType" value)
    | _ -> raise (deserialize_wrong_type_error path "EndpointType")
     : endpoint_type)
    : endpoint_type)

let host_key_of_yojson = string_of_yojson
let directory_id_of_yojson = string_of_yojson
let function_of_yojson = string_of_yojson

let sftp_authentication_methods_of_yojson (tree : t) path =
  ((match tree with
    | `String "PUBLIC_KEY_AND_PASSWORD" -> PUBLIC_KEY_AND_PASSWORD
    | `String "PUBLIC_KEY_OR_PASSWORD" -> PUBLIC_KEY_OR_PASSWORD
    | `String "PUBLIC_KEY" -> PUBLIC_KEY
    | `String "PASSWORD" -> PASSWORD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SftpAuthenticationMethods" value)
    | _ -> raise (deserialize_wrong_type_error path "SftpAuthenticationMethods")
     : sftp_authentication_methods)
    : sftp_authentication_methods)

let identity_provider_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sftp_authentication_methods =
       option_of_yojson
         (value_for_key sftp_authentication_methods_of_yojson "SftpAuthenticationMethods")
         _list path;
     \#function = option_of_yojson (value_for_key function_of_yojson "Function") _list path;
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     invocation_role = option_of_yojson (value_for_key role_of_yojson "InvocationRole") _list path;
     url = option_of_yojson (value_for_key url_of_yojson "Url") _list path;
   }
    : identity_provider_details)

let nullable_role_of_yojson = string_of_yojson
let post_authentication_login_banner_of_yojson = string_of_yojson
let pre_authentication_login_banner_of_yojson = string_of_yojson

let protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "AS2" -> AS2
    | `String "FTPS" -> FTPS
    | `String "FTP" -> FTP
    | `String "SFTP" -> SFTP
    | `String value -> raise (deserialize_unknown_enum_value_error path "Protocol" value)
    | _ -> raise (deserialize_wrong_type_error path "Protocol")
     : protocol)
    : protocol)

let protocols_of_yojson tree path = list_of_yojson protocol_of_yojson tree path
let security_policy_name_of_yojson = string_of_yojson
let arn_of_yojson = string_of_yojson
let structured_log_destinations_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let directory_listing_optimization_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DirectoryListingOptimization" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryListingOptimization")
     : directory_listing_optimization)
    : directory_listing_optimization)

let s3_storage_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_listing_optimization =
       option_of_yojson
         (value_for_key directory_listing_optimization_of_yojson "DirectoryListingOptimization")
         _list path;
   }
    : s3_storage_options)

let ip_address_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DUALSTACK" -> DUALSTACK
    | `String "IPV4" -> IPV4
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpAddressType" value)
    | _ -> raise (deserialize_wrong_type_error path "IpAddressType")
     : ip_address_type)
    : ip_address_type)

let identity_provider_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_LAMBDA" -> AWS_LAMBDA
    | `String "AWS_DIRECTORY_SERVICE" -> AWS_DIRECTORY_SERVICE
    | `String "API_GATEWAY" -> API_GATEWAY
    | `String "SERVICE_MANAGED" -> SERVICE_MANAGED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IdentityProviderType" value)
    | _ -> raise (deserialize_wrong_type_error path "IdentityProviderType")
     : identity_provider_type)
    : identity_provider_type)

let update_server_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider_type =
       option_of_yojson
         (value_for_key identity_provider_type_of_yojson "IdentityProviderType")
         _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IpAddressType") _list path;
     s3_storage_options =
       option_of_yojson (value_for_key s3_storage_options_of_yojson "S3StorageOptions") _list path;
     structured_log_destinations =
       option_of_yojson
         (value_for_key structured_log_destinations_of_yojson "StructuredLogDestinations")
         _list path;
     workflow_details =
       option_of_yojson (value_for_key workflow_details_of_yojson "WorkflowDetails") _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     security_policy_name =
       option_of_yojson
         (value_for_key security_policy_name_of_yojson "SecurityPolicyName")
         _list path;
     protocols = option_of_yojson (value_for_key protocols_of_yojson "Protocols") _list path;
     pre_authentication_login_banner =
       option_of_yojson
         (value_for_key pre_authentication_login_banner_of_yojson "PreAuthenticationLoginBanner")
         _list path;
     post_authentication_login_banner =
       option_of_yojson
         (value_for_key post_authentication_login_banner_of_yojson "PostAuthenticationLoginBanner")
         _list path;
     logging_role =
       option_of_yojson (value_for_key nullable_role_of_yojson "LoggingRole") _list path;
     identity_provider_details =
       option_of_yojson
         (value_for_key identity_provider_details_of_yojson "IdentityProviderDetails")
         _list path;
     host_key = option_of_yojson (value_for_key host_key_of_yojson "HostKey") _list path;
     endpoint_type =
       option_of_yojson (value_for_key endpoint_type_of_yojson "EndpointType") _list path;
     endpoint_details =
       option_of_yojson (value_for_key endpoint_details_of_yojson "EndpointDetails") _list path;
     protocol_details =
       option_of_yojson (value_for_key protocol_details_of_yojson "ProtocolDetails") _list path;
     certificate = option_of_yojson (value_for_key certificate_of_yojson "Certificate") _list path;
   }
    : update_server_request)

let resource_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "ResourceType" _list path;
     resource = value_for_key resource_of_yojson "Resource" _list path;
     message = value_for_key message_of_yojson "Message" _list path;
   }
    : resource_exists_exception)

let profile_id_of_yojson = string_of_yojson

let update_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ profile_id = value_for_key profile_id_of_yojson "ProfileId" _list path }
    : update_profile_response)

let certificate_id_of_yojson = string_of_yojson
let certificate_ids_of_yojson tree path = list_of_yojson certificate_id_of_yojson tree path

let update_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_ids =
       option_of_yojson (value_for_key certificate_ids_of_yojson "CertificateIds") _list path;
     profile_id = value_for_key profile_id_of_yojson "ProfileId" _list path;
   }
    : update_profile_request)

let host_key_id_of_yojson = string_of_yojson

let update_host_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_key_id = value_for_key host_key_id_of_yojson "HostKeyId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : update_host_key_response)

let host_key_description_of_yojson = string_of_yojson

let update_host_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = value_for_key host_key_description_of_yojson "Description" _list path;
     host_key_id = value_for_key host_key_id_of_yojson "HostKeyId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : update_host_key_request)

let sftp_port_of_yojson = int_of_yojson

let update_connector_vpc_lattice_egress_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port_number = option_of_yojson (value_for_key sftp_port_of_yojson "PortNumber") _list path;
     resource_configuration_arn =
       option_of_yojson
         (value_for_key vpc_lattice_resource_configuration_arn_of_yojson "ResourceConfigurationArn")
         _list path;
   }
    : update_connector_vpc_lattice_egress_config)

let connector_id_of_yojson = string_of_yojson

let update_connector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connector_id = value_for_key connector_id_of_yojson "ConnectorId" _list path }
    : update_connector_response)

let message_subject_of_yojson = string_of_yojson

let compression_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ZLIB" -> ZLIB
    | `String value -> raise (deserialize_unknown_enum_value_error path "CompressionEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "CompressionEnum")
     : compression_enum)
    : compression_enum)

let encryption_alg_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "DES_EDE3_CBC" -> DES_EDE3_CBC
    | `String "AES256_CBC" -> AES256_CBC
    | `String "AES192_CBC" -> AES192_CBC
    | `String "AES128_CBC" -> AES128_CBC
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionAlg" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionAlg")
     : encryption_alg)
    : encryption_alg)

let signing_alg_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "SHA1" -> SHA1
    | `String "SHA512" -> SHA512
    | `String "SHA384" -> SHA384
    | `String "SHA256" -> SHA256
    | `String value -> raise (deserialize_unknown_enum_value_error path "SigningAlg" value)
    | _ -> raise (deserialize_wrong_type_error path "SigningAlg")
     : signing_alg)
    : signing_alg)

let mdn_signing_alg_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEFAULT" -> DEFAULT
    | `String "NONE" -> NONE
    | `String "SHA1" -> SHA1
    | `String "SHA512" -> SHA512
    | `String "SHA384" -> SHA384
    | `String "SHA256" -> SHA256
    | `String value -> raise (deserialize_unknown_enum_value_error path "MdnSigningAlg" value)
    | _ -> raise (deserialize_wrong_type_error path "MdnSigningAlg")
     : mdn_signing_alg)
    : mdn_signing_alg)

let mdn_response_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASYNC" -> ASYNC
    | `String "NONE" -> NONE
    | `String "SYNC" -> SYNC
    | `String value -> raise (deserialize_unknown_enum_value_error path "MdnResponse" value)
    | _ -> raise (deserialize_wrong_type_error path "MdnResponse")
     : mdn_response)
    : mdn_response)

let as2_connector_secret_id_of_yojson = string_of_yojson

let preserve_content_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "PreserveContentType" value)
    | _ -> raise (deserialize_wrong_type_error path "PreserveContentType")
     : preserve_content_type)
    : preserve_content_type)

let as2_async_mdn_server_ids_of_yojson tree path = list_of_yojson server_id_of_yojson tree path

let as2_async_mdn_connector_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_ids =
       option_of_yojson (value_for_key as2_async_mdn_server_ids_of_yojson "ServerIds") _list path;
     url = option_of_yojson (value_for_key url_of_yojson "Url") _list path;
   }
    : as2_async_mdn_connector_config)

let as2_connector_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     async_mdn_config =
       option_of_yojson
         (value_for_key as2_async_mdn_connector_config_of_yojson "AsyncMdnConfig")
         _list path;
     preserve_content_type =
       option_of_yojson
         (value_for_key preserve_content_type_of_yojson "PreserveContentType")
         _list path;
     basic_auth_secret_id =
       option_of_yojson
         (value_for_key as2_connector_secret_id_of_yojson "BasicAuthSecretId")
         _list path;
     mdn_response = option_of_yojson (value_for_key mdn_response_of_yojson "MdnResponse") _list path;
     mdn_signing_algorithm =
       option_of_yojson (value_for_key mdn_signing_alg_of_yojson "MdnSigningAlgorithm") _list path;
     signing_algorithm =
       option_of_yojson (value_for_key signing_alg_of_yojson "SigningAlgorithm") _list path;
     encryption_algorithm =
       option_of_yojson (value_for_key encryption_alg_of_yojson "EncryptionAlgorithm") _list path;
     compression =
       option_of_yojson (value_for_key compression_enum_of_yojson "Compression") _list path;
     message_subject =
       option_of_yojson (value_for_key message_subject_of_yojson "MessageSubject") _list path;
     partner_profile_id =
       option_of_yojson (value_for_key profile_id_of_yojson "PartnerProfileId") _list path;
     local_profile_id =
       option_of_yojson (value_for_key profile_id_of_yojson "LocalProfileId") _list path;
   }
    : as2_connector_config)

let secret_id_of_yojson = string_of_yojson
let sftp_connector_trusted_host_key_of_yojson = string_of_yojson

let sftp_connector_trusted_host_key_list_of_yojson tree path =
  list_of_yojson sftp_connector_trusted_host_key_of_yojson tree path

let max_concurrent_connections_of_yojson = int_of_yojson

let sftp_connector_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_concurrent_connections =
       option_of_yojson
         (value_for_key max_concurrent_connections_of_yojson "MaxConcurrentConnections")
         _list path;
     trusted_host_keys =
       option_of_yojson
         (value_for_key sftp_connector_trusted_host_key_list_of_yojson "TrustedHostKeys")
         _list path;
     user_secret_id = option_of_yojson (value_for_key secret_id_of_yojson "UserSecretId") _list path;
   }
    : sftp_connector_config)

let connector_security_policy_name_of_yojson = string_of_yojson

let update_connector_egress_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "VpcLattice" -> VpcLattice (update_connector_vpc_lattice_egress_config_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "UpdateConnectorEgressConfig" unknown)
    : update_connector_egress_config)

let connectors_ip_address_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DUALSTACK" -> DUALSTACK
    | `String "IPV4" -> IPV4
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConnectorsIpAddressType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectorsIpAddressType")
     : connectors_ip_address_type)
    : connectors_ip_address_type)

let update_connector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address_type =
       option_of_yojson
         (value_for_key connectors_ip_address_type_of_yojson "IpAddressType")
         _list path;
     egress_config =
       option_of_yojson
         (value_for_key update_connector_egress_config_of_yojson "EgressConfig")
         _list path;
     security_policy_name =
       option_of_yojson
         (value_for_key connector_security_policy_name_of_yojson "SecurityPolicyName")
         _list path;
     sftp_config =
       option_of_yojson (value_for_key sftp_connector_config_of_yojson "SftpConfig") _list path;
     logging_role = option_of_yojson (value_for_key role_of_yojson "LoggingRole") _list path;
     access_role = option_of_yojson (value_for_key role_of_yojson "AccessRole") _list path;
     as2_config =
       option_of_yojson (value_for_key as2_connector_config_of_yojson "As2Config") _list path;
     url = option_of_yojson (value_for_key url_of_yojson "Url") _list path;
     connector_id = value_for_key connector_id_of_yojson "ConnectorId" _list path;
   }
    : update_connector_request)

let update_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_id = value_for_key certificate_id_of_yojson "CertificateId" _list path }
    : update_certificate_response)

let cert_date_of_yojson = timestamp_epoch_seconds_of_yojson
let description_of_yojson = string_of_yojson

let update_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     inactive_date = option_of_yojson (value_for_key cert_date_of_yojson "InactiveDate") _list path;
     active_date = option_of_yojson (value_for_key cert_date_of_yojson "ActiveDate") _list path;
     certificate_id = value_for_key certificate_id_of_yojson "CertificateId" _list path;
   }
    : update_certificate_request)

let agreement_id_of_yojson = string_of_yojson

let update_agreement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agreement_id = value_for_key agreement_id_of_yojson "AgreementId" _list path }
    : update_agreement_response)

let agreement_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AgreementStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementStatusType")
     : agreement_status_type)
    : agreement_status_type)

let preserve_filename_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PreserveFilenameType" value)
    | _ -> raise (deserialize_wrong_type_error path "PreserveFilenameType")
     : preserve_filename_type)
    : preserve_filename_type)

let enforce_message_signing_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EnforceMessageSigningType" value)
    | _ -> raise (deserialize_wrong_type_error path "EnforceMessageSigningType")
     : enforce_message_signing_type)
    : enforce_message_signing_type)

let custom_directories_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     temporary_files_directory =
       value_for_key home_directory_of_yojson "TemporaryFilesDirectory" _list path;
     status_files_directory =
       value_for_key home_directory_of_yojson "StatusFilesDirectory" _list path;
     payload_files_directory =
       value_for_key home_directory_of_yojson "PayloadFilesDirectory" _list path;
     mdn_files_directory = value_for_key home_directory_of_yojson "MdnFilesDirectory" _list path;
     failed_files_directory =
       value_for_key home_directory_of_yojson "FailedFilesDirectory" _list path;
   }
    : custom_directories_type)

let update_agreement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_directories =
       option_of_yojson
         (value_for_key custom_directories_type_of_yojson "CustomDirectories")
         _list path;
     enforce_message_signing =
       option_of_yojson
         (value_for_key enforce_message_signing_type_of_yojson "EnforceMessageSigning")
         _list path;
     preserve_filename =
       option_of_yojson
         (value_for_key preserve_filename_type_of_yojson "PreserveFilename")
         _list path;
     access_role = option_of_yojson (value_for_key role_of_yojson "AccessRole") _list path;
     base_directory =
       option_of_yojson (value_for_key home_directory_of_yojson "BaseDirectory") _list path;
     partner_profile_id =
       option_of_yojson (value_for_key profile_id_of_yojson "PartnerProfileId") _list path;
     local_profile_id =
       option_of_yojson (value_for_key profile_id_of_yojson "LocalProfileId") _list path;
     status = option_of_yojson (value_for_key agreement_status_type_of_yojson "Status") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "AgreementId" _list path;
   }
    : update_agreement_request)

let external_id_of_yojson = string_of_yojson

let update_access_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_id = value_for_key external_id_of_yojson "ExternalId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : update_access_response)

let update_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_id = value_for_key external_id_of_yojson "ExternalId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     posix_profile =
       option_of_yojson (value_for_key posix_profile_of_yojson "PosixProfile") _list path;
     policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path;
     home_directory_mappings =
       option_of_yojson
         (value_for_key home_directory_mappings_of_yojson "HomeDirectoryMappings")
         _list path;
     home_directory_type =
       option_of_yojson (value_for_key home_directory_type_of_yojson "HomeDirectoryType") _list path;
     home_directory =
       option_of_yojson (value_for_key home_directory_of_yojson "HomeDirectory") _list path;
   }
    : update_access_request)

let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_keys_of_yojson "TagKeys" _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : untag_resource_request)

let transfer_table_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "QUEUED" -> QUEUED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TransferTableStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TransferTableStatus")
     : transfer_table_status)
    : transfer_table_status)

let response_of_yojson = string_of_yojson
let status_code_of_yojson = int_of_yojson

let test_identity_provider_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     url = value_for_key url_of_yojson "Url" _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     status_code = value_for_key status_code_of_yojson "StatusCode" _list path;
     response = option_of_yojson (value_for_key response_of_yojson "Response") _list path;
   }
    : test_identity_provider_response)

let source_ip_of_yojson = string_of_yojson

let test_identity_provider_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_password =
       option_of_yojson (value_for_key user_password_of_yojson "UserPassword") _list path;
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
     source_ip = option_of_yojson (value_for_key source_ip_of_yojson "SourceIp") _list path;
     server_protocol =
       option_of_yojson (value_for_key protocol_of_yojson "ServerProtocol") _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : test_identity_provider_request)

let status_of_yojson = string_of_yojson
let sftp_connector_host_key_of_yojson = string_of_yojson

let sftp_connector_connection_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_key =
       option_of_yojson (value_for_key sftp_connector_host_key_of_yojson "HostKey") _list path;
   }
    : sftp_connector_connection_details)

let test_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sftp_connection_details =
       option_of_yojson
         (value_for_key sftp_connector_connection_details_of_yojson "SftpConnectionDetails")
         _list path;
     status_message = option_of_yojson (value_for_key message_of_yojson "StatusMessage") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     connector_id = option_of_yojson (value_for_key connector_id_of_yojson "ConnectorId") _list path;
   }
    : test_connection_response)

let test_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connector_id = value_for_key connector_id_of_yojson "ConnectorId" _list path }
    : test_connection_request)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tags_of_yojson "Tags" _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : tag_resource_request)

let stop_server_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ server_id = value_for_key server_id_of_yojson "ServerId" _list path } : stop_server_request)

let start_server_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ server_id = value_for_key server_id_of_yojson "ServerId" _list path } : start_server_request)

let move_id_of_yojson = string_of_yojson

let start_remote_move_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ move_id = value_for_key move_id_of_yojson "MoveId" _list path } : start_remote_move_response)

let file_path_of_yojson = string_of_yojson

let start_remote_move_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_path = value_for_key file_path_of_yojson "TargetPath" _list path;
     source_path = value_for_key file_path_of_yojson "SourcePath" _list path;
     connector_id = value_for_key connector_id_of_yojson "ConnectorId" _list path;
   }
    : start_remote_move_request)

let delete_id_of_yojson = string_of_yojson

let start_remote_delete_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ delete_id = value_for_key delete_id_of_yojson "DeleteId" _list path }
    : start_remote_delete_response)

let start_remote_delete_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_path = value_for_key file_path_of_yojson "DeletePath" _list path;
     connector_id = value_for_key connector_id_of_yojson "ConnectorId" _list path;
   }
    : start_remote_delete_request)

let transfer_id_of_yojson = string_of_yojson

let start_file_transfer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ transfer_id = value_for_key transfer_id_of_yojson "TransferId" _list path }
    : start_file_transfer_response)

let file_paths_of_yojson tree path = list_of_yojson file_path_of_yojson tree path
let custom_http_header_key_type_of_yojson = string_of_yojson
let custom_http_header_value_type_of_yojson = string_of_yojson

let custom_http_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson (value_for_key custom_http_header_value_type_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key custom_http_header_key_type_of_yojson "Key") _list path;
   }
    : custom_http_header)

let custom_http_headers_of_yojson tree path = list_of_yojson custom_http_header_of_yojson tree path

let start_file_transfer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_http_headers =
       option_of_yojson (value_for_key custom_http_headers_of_yojson "CustomHttpHeaders") _list path;
     remote_directory_path =
       option_of_yojson (value_for_key file_path_of_yojson "RemoteDirectoryPath") _list path;
     local_directory_path =
       option_of_yojson (value_for_key file_path_of_yojson "LocalDirectoryPath") _list path;
     retrieve_file_paths =
       option_of_yojson (value_for_key file_paths_of_yojson "RetrieveFilePaths") _list path;
     send_file_paths =
       option_of_yojson (value_for_key file_paths_of_yojson "SendFilePaths") _list path;
     connector_id = value_for_key connector_id_of_yojson "ConnectorId" _list path;
   }
    : start_file_transfer_request)

let listing_id_of_yojson = string_of_yojson
let output_file_name_of_yojson = string_of_yojson

let start_directory_listing_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_file_name = value_for_key output_file_name_of_yojson "OutputFileName" _list path;
     listing_id = value_for_key listing_id_of_yojson "ListingId" _list path;
   }
    : start_directory_listing_response)

let max_items_of_yojson = int_of_yojson

let start_directory_listing_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_directory_path = value_for_key file_path_of_yojson "OutputDirectoryPath" _list path;
     max_items = option_of_yojson (value_for_key max_items_of_yojson "MaxItems") _list path;
     remote_directory_path = value_for_key file_path_of_yojson "RemoteDirectoryPath" _list path;
     connector_id = value_for_key connector_id_of_yojson "ConnectorId" _list path;
   }
    : start_directory_listing_request)

let send_workflow_step_state_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let execution_id_of_yojson = string_of_yojson
let callback_token_of_yojson = string_of_yojson

let custom_step_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILURE" -> FAILURE
    | `String "SUCCESS" -> SUCCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "CustomStepStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomStepStatus")
     : custom_step_status)
    : custom_step_status)

let send_workflow_step_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key custom_step_status_of_yojson "Status" _list path;
     token = value_for_key callback_token_of_yojson "Token" _list path;
     execution_id = value_for_key execution_id_of_yojson "ExecutionId" _list path;
     workflow_id = value_for_key workflow_id_of_yojson "WorkflowId" _list path;
   }
    : send_workflow_step_state_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key message_of_yojson "Message" _list path }
    : invalid_next_token_exception)

let next_token_of_yojson = string_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
   }
    : list_tags_for_resource_response)

let max_results_of_yojson = int_of_yojson

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : list_tags_for_resource_request)

let security_policy_names_of_yojson tree path =
  list_of_yojson security_policy_name_of_yojson tree path

let list_security_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_policy_names =
       value_for_key security_policy_names_of_yojson "SecurityPolicyNames" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_security_policies_response)

let list_security_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_security_policies_request)

let host_key_fingerprint_of_yojson = string_of_yojson
let host_key_type_of_yojson = string_of_yojson
let date_imported_of_yojson = timestamp_epoch_seconds_of_yojson

let listed_host_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date_imported =
       option_of_yojson (value_for_key date_imported_of_yojson "DateImported") _list path;
     type_ = option_of_yojson (value_for_key host_key_type_of_yojson "Type") _list path;
     description =
       option_of_yojson (value_for_key host_key_description_of_yojson "Description") _list path;
     fingerprint =
       option_of_yojson (value_for_key host_key_fingerprint_of_yojson "Fingerprint") _list path;
     host_key_id = option_of_yojson (value_for_key host_key_id_of_yojson "HostKeyId") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : listed_host_key)

let listed_host_keys_of_yojson tree path = list_of_yojson listed_host_key_of_yojson tree path

let list_host_keys_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_keys = value_for_key listed_host_keys_of_yojson "HostKeys" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_host_keys_response)

let list_host_keys_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_host_keys_request)

let failure_code_of_yojson = string_of_yojson

let connector_file_transfer_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson (value_for_key message_of_yojson "FailureMessage") _list path;
     failure_code = option_of_yojson (value_for_key failure_code_of_yojson "FailureCode") _list path;
     status_code = value_for_key transfer_table_status_of_yojson "StatusCode" _list path;
     file_path = value_for_key file_path_of_yojson "FilePath" _list path;
   }
    : connector_file_transfer_result)

let connector_file_transfer_results_of_yojson tree path =
  list_of_yojson connector_file_transfer_result_of_yojson tree path

let list_file_transfer_results_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     file_transfer_results =
       value_for_key connector_file_transfer_results_of_yojson "FileTransferResults" _list path;
   }
    : list_file_transfer_results_response)

let list_file_transfer_results_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     transfer_id = value_for_key transfer_id_of_yojson "TransferId" _list path;
     connector_id = value_for_key connector_id_of_yojson "ConnectorId" _list path;
   }
    : list_file_transfer_results_request)

let s3_version_id_of_yojson = string_of_yojson
let s3_etag_of_yojson = string_of_yojson

let s3_file_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     etag = option_of_yojson (value_for_key s3_etag_of_yojson "Etag") _list path;
     version_id = option_of_yojson (value_for_key s3_version_id_of_yojson "VersionId") _list path;
     key = option_of_yojson (value_for_key s3_key_of_yojson "Key") _list path;
     bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "Bucket") _list path;
   }
    : s3_file_location)

let file_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     efs_file_location =
       option_of_yojson (value_for_key efs_file_location_of_yojson "EfsFileLocation") _list path;
     s3_file_location =
       option_of_yojson (value_for_key s3_file_location_of_yojson "S3FileLocation") _list path;
   }
    : file_location)

let service_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_details = value_for_key user_details_of_yojson "UserDetails" _list path }
    : service_metadata)

let execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "HANDLING_EXCEPTION" -> HANDLING_EXCEPTION
    | `String "EXCEPTION" -> EXCEPTION
    | `String "COMPLETED" -> COMPLETED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionStatus")
     : execution_status)
    : execution_status)

let listed_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key execution_status_of_yojson "Status") _list path;
     service_metadata =
       option_of_yojson (value_for_key service_metadata_of_yojson "ServiceMetadata") _list path;
     initial_file_location =
       option_of_yojson (value_for_key file_location_of_yojson "InitialFileLocation") _list path;
     execution_id = option_of_yojson (value_for_key execution_id_of_yojson "ExecutionId") _list path;
   }
    : listed_execution)

let listed_executions_of_yojson tree path = list_of_yojson listed_execution_of_yojson tree path

let list_executions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     executions = value_for_key listed_executions_of_yojson "Executions" _list path;
     workflow_id = value_for_key workflow_id_of_yojson "WorkflowId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_executions_response)

let list_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_id = value_for_key workflow_id_of_yojson "WorkflowId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_executions_request)

let listed_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_id = option_of_yojson (value_for_key external_id_of_yojson "ExternalId") _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     home_directory_type =
       option_of_yojson (value_for_key home_directory_type_of_yojson "HomeDirectoryType") _list path;
     home_directory =
       option_of_yojson (value_for_key home_directory_of_yojson "HomeDirectory") _list path;
   }
    : listed_access)

let listed_accesses_of_yojson tree path = list_of_yojson listed_access_of_yojson tree path

let list_accesses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accesses = value_for_key listed_accesses_of_yojson "Accesses" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_accesses_response)

let list_accesses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_accesses_request)

let ssh_public_key_id_of_yojson = string_of_yojson

let import_ssh_public_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
     ssh_public_key_id = value_for_key ssh_public_key_id_of_yojson "SshPublicKeyId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : import_ssh_public_key_response)

let ssh_public_key_body_of_yojson = string_of_yojson

let import_ssh_public_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
     ssh_public_key_body = value_for_key ssh_public_key_body_of_yojson "SshPublicKeyBody" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : import_ssh_public_key_request)

let import_host_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_key_id = value_for_key host_key_id_of_yojson "HostKeyId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : import_host_key_response)

let import_host_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     description =
       option_of_yojson (value_for_key host_key_description_of_yojson "Description") _list path;
     host_key_body = value_for_key host_key_of_yojson "HostKeyBody" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : import_host_key_request)

let fips_of_yojson = bool_of_yojson
let security_policy_option_of_yojson = string_of_yojson

let security_policy_options_of_yojson tree path =
  list_of_yojson security_policy_option_of_yojson tree path

let security_policy_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONNECTOR" -> CONNECTOR
    | `String "SERVER" -> SERVER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SecurityPolicyResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SecurityPolicyResourceType")
     : security_policy_resource_type)
    : security_policy_resource_type)

let security_policy_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "FTPS" -> FTPS
    | `String "SFTP" -> SFTP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SecurityPolicyProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "SecurityPolicyProtocol")
     : security_policy_protocol)
    : security_policy_protocol)

let security_policy_protocols_of_yojson tree path =
  list_of_yojson security_policy_protocol_of_yojson tree path

let described_security_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protocols =
       option_of_yojson (value_for_key security_policy_protocols_of_yojson "Protocols") _list path;
     type_ =
       option_of_yojson (value_for_key security_policy_resource_type_of_yojson "Type") _list path;
     ssh_host_key_algorithms =
       option_of_yojson
         (value_for_key security_policy_options_of_yojson "SshHostKeyAlgorithms")
         _list path;
     tls_ciphers =
       option_of_yojson (value_for_key security_policy_options_of_yojson "TlsCiphers") _list path;
     ssh_macs =
       option_of_yojson (value_for_key security_policy_options_of_yojson "SshMacs") _list path;
     ssh_kexs =
       option_of_yojson (value_for_key security_policy_options_of_yojson "SshKexs") _list path;
     ssh_ciphers =
       option_of_yojson (value_for_key security_policy_options_of_yojson "SshCiphers") _list path;
     security_policy_name =
       value_for_key security_policy_name_of_yojson "SecurityPolicyName" _list path;
     fips = option_of_yojson (value_for_key fips_of_yojson "Fips") _list path;
   }
    : described_security_policy)

let describe_security_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_policy = value_for_key described_security_policy_of_yojson "SecurityPolicy" _list path;
   }
    : describe_security_policy_response)

let describe_security_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_policy_name =
       value_for_key security_policy_name_of_yojson "SecurityPolicyName" _list path;
   }
    : describe_security_policy_request)

let described_host_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     date_imported =
       option_of_yojson (value_for_key date_imported_of_yojson "DateImported") _list path;
     type_ = option_of_yojson (value_for_key host_key_type_of_yojson "Type") _list path;
     description =
       option_of_yojson (value_for_key host_key_description_of_yojson "Description") _list path;
     host_key_fingerprint =
       option_of_yojson
         (value_for_key host_key_fingerprint_of_yojson "HostKeyFingerprint")
         _list path;
     host_key_id = option_of_yojson (value_for_key host_key_id_of_yojson "HostKeyId") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : described_host_key)

let describe_host_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ host_key = value_for_key described_host_key_of_yojson "HostKey" _list path }
    : describe_host_key_response)

let describe_host_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_key_id = value_for_key host_key_id_of_yojson "HostKeyId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : describe_host_key_request)

let log_group_name_of_yojson = string_of_yojson

let logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "LogGroupName") _list path;
     logging_role = option_of_yojson (value_for_key role_of_yojson "LoggingRole") _list path;
   }
    : logging_configuration)

let step_result_outputs_json_of_yojson = string_of_yojson

let execution_error_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String "TIMEOUT" -> TIMEOUT
    | `String "BAD_REQUEST" -> BAD_REQUEST
    | `String "NOT_FOUND" -> NOT_FOUND
    | `String "ALREADY_EXISTS" -> ALREADY_EXISTS
    | `String "THROTTLED" -> THROTTLED
    | `String "CUSTOM_STEP_FAILED" -> CUSTOM_STEP_FAILED
    | `String "PERMISSION_DENIED" -> PERMISSION_DENIED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionErrorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionErrorType")
     : execution_error_type)
    : execution_error_type)

let execution_error_message_of_yojson = string_of_yojson

let execution_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key execution_error_message_of_yojson "Message" _list path;
     type_ = value_for_key execution_error_type_of_yojson "Type" _list path;
   }
    : execution_error)

let execution_step_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key execution_error_of_yojson "Error") _list path;
     outputs =
       option_of_yojson (value_for_key step_result_outputs_json_of_yojson "Outputs") _list path;
     step_type = option_of_yojson (value_for_key workflow_step_type_of_yojson "StepType") _list path;
   }
    : execution_step_result)

let execution_step_results_of_yojson tree path =
  list_of_yojson execution_step_result_of_yojson tree path

let execution_results_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_exception_steps =
       option_of_yojson
         (value_for_key execution_step_results_of_yojson "OnExceptionSteps")
         _list path;
     steps = option_of_yojson (value_for_key execution_step_results_of_yojson "Steps") _list path;
   }
    : execution_results)

let described_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results = option_of_yojson (value_for_key execution_results_of_yojson "Results") _list path;
     status = option_of_yojson (value_for_key execution_status_of_yojson "Status") _list path;
     posix_profile =
       option_of_yojson (value_for_key posix_profile_of_yojson "PosixProfile") _list path;
     logging_configuration =
       option_of_yojson
         (value_for_key logging_configuration_of_yojson "LoggingConfiguration")
         _list path;
     execution_role = option_of_yojson (value_for_key role_of_yojson "ExecutionRole") _list path;
     service_metadata =
       option_of_yojson (value_for_key service_metadata_of_yojson "ServiceMetadata") _list path;
     initial_file_location =
       option_of_yojson (value_for_key file_location_of_yojson "InitialFileLocation") _list path;
     execution_id = option_of_yojson (value_for_key execution_id_of_yojson "ExecutionId") _list path;
   }
    : described_execution)

let describe_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution = value_for_key described_execution_of_yojson "Execution" _list path;
     workflow_id = value_for_key workflow_id_of_yojson "WorkflowId" _list path;
   }
    : describe_execution_response)

let describe_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow_id = value_for_key workflow_id_of_yojson "WorkflowId" _list path;
     execution_id = value_for_key execution_id_of_yojson "ExecutionId" _list path;
   }
    : describe_execution_request)

let described_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_id = option_of_yojson (value_for_key external_id_of_yojson "ExternalId") _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     posix_profile =
       option_of_yojson (value_for_key posix_profile_of_yojson "PosixProfile") _list path;
     policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path;
     home_directory_type =
       option_of_yojson (value_for_key home_directory_type_of_yojson "HomeDirectoryType") _list path;
     home_directory_mappings =
       option_of_yojson
         (value_for_key home_directory_mappings_of_yojson "HomeDirectoryMappings")
         _list path;
     home_directory =
       option_of_yojson (value_for_key home_directory_of_yojson "HomeDirectory") _list path;
   }
    : described_access)

let describe_access_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access = value_for_key described_access_of_yojson "Access" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : describe_access_response)

let describe_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_id = value_for_key external_id_of_yojson "ExternalId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : describe_access_request)

let delete_ssh_public_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
     ssh_public_key_id = value_for_key ssh_public_key_id_of_yojson "SshPublicKeyId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : delete_ssh_public_key_request)

let delete_host_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_key_id = value_for_key host_key_id_of_yojson "HostKeyId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : delete_host_key_request)

let delete_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_id = value_for_key external_id_of_yojson "ExternalId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : delete_access_request)

let create_access_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_id = value_for_key external_id_of_yojson "ExternalId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : create_access_response)

let create_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_id = value_for_key external_id_of_yojson "ExternalId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     role = value_for_key role_of_yojson "Role" _list path;
     posix_profile =
       option_of_yojson (value_for_key posix_profile_of_yojson "PosixProfile") _list path;
     policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path;
     home_directory_mappings =
       option_of_yojson
         (value_for_key home_directory_mappings_of_yojson "HomeDirectoryMappings")
         _list path;
     home_directory_type =
       option_of_yojson (value_for_key home_directory_type_of_yojson "HomeDirectoryType") _list path;
     home_directory =
       option_of_yojson (value_for_key home_directory_of_yojson "HomeDirectory") _list path;
   }
    : create_access_request)

let state_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOP_FAILED" -> STOP_FAILED
    | `String "START_FAILED" -> START_FAILED
    | `String "STOPPING" -> STOPPING
    | `String "STARTING" -> STARTING
    | `String "ONLINE" -> ONLINE
    | `String "OFFLINE" -> OFFLINE
    | `String value -> raise (deserialize_unknown_enum_value_error path "State" value)
    | _ -> raise (deserialize_wrong_type_error path "State")
     : state)
    : state)

let ssh_public_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ssh_public_key_id = value_for_key ssh_public_key_id_of_yojson "SshPublicKeyId" _list path;
     ssh_public_key_body = value_for_key ssh_public_key_body_of_yojson "SshPublicKeyBody" _list path;
     date_imported = value_for_key date_imported_of_yojson "DateImported" _list path;
   }
    : ssh_public_key)

let ssh_public_keys_of_yojson tree path = list_of_yojson ssh_public_key_of_yojson tree path
let ssh_public_key_count_of_yojson = int_of_yojson
let service_managed_egress_ip_address_of_yojson = string_of_yojson

let service_managed_egress_ip_addresses_of_yojson tree path =
  list_of_yojson service_managed_egress_ip_address_of_yojson tree path

let profile_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PARTNER" -> PARTNER
    | `String "LOCAL" -> LOCAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProfileType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProfileType")
     : profile_type)
    : profile_type)

let private_key_type_of_yojson = string_of_yojson

let listed_workflow_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     description =
       option_of_yojson (value_for_key workflow_description_of_yojson "Description") _list path;
     workflow_id = option_of_yojson (value_for_key workflow_id_of_yojson "WorkflowId") _list path;
   }
    : listed_workflow)

let listed_workflows_of_yojson tree path = list_of_yojson listed_workflow_of_yojson tree path

let listed_web_app_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_type =
       option_of_yojson (value_for_key web_app_endpoint_type_of_yojson "EndpointType") _list path;
     web_app_endpoint =
       option_of_yojson (value_for_key web_app_endpoint_of_yojson "WebAppEndpoint") _list path;
     access_endpoint =
       option_of_yojson
         (value_for_key web_app_access_endpoint_of_yojson "AccessEndpoint")
         _list path;
     web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : listed_web_app)

let listed_web_apps_of_yojson tree path = list_of_yojson listed_web_app_of_yojson tree path

let listed_user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = option_of_yojson (value_for_key user_name_of_yojson "UserName") _list path;
     ssh_public_key_count =
       option_of_yojson
         (value_for_key ssh_public_key_count_of_yojson "SshPublicKeyCount")
         _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     home_directory_type =
       option_of_yojson (value_for_key home_directory_type_of_yojson "HomeDirectoryType") _list path;
     home_directory =
       option_of_yojson (value_for_key home_directory_of_yojson "HomeDirectory") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : listed_user)

let listed_users_of_yojson tree path = list_of_yojson listed_user_of_yojson tree path

let domain_of_yojson (tree : t) path =
  ((match tree with
    | `String "EFS" -> EFS
    | `String "S3" -> S3
    | `String value -> raise (deserialize_unknown_enum_value_error path "Domain" value)
    | _ -> raise (deserialize_wrong_type_error path "Domain")
     : domain)
    : domain)

let listed_server_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_count = option_of_yojson (value_for_key user_count_of_yojson "UserCount") _list path;
     state = option_of_yojson (value_for_key state_of_yojson "State") _list path;
     server_id = option_of_yojson (value_for_key server_id_of_yojson "ServerId") _list path;
     logging_role = option_of_yojson (value_for_key role_of_yojson "LoggingRole") _list path;
     endpoint_type =
       option_of_yojson (value_for_key endpoint_type_of_yojson "EndpointType") _list path;
     identity_provider_type =
       option_of_yojson
         (value_for_key identity_provider_type_of_yojson "IdentityProviderType")
         _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "Domain") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : listed_server)

let listed_servers_of_yojson tree path = list_of_yojson listed_server_of_yojson tree path
let as2_id_of_yojson = string_of_yojson

let listed_profile_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_type = option_of_yojson (value_for_key profile_type_of_yojson "ProfileType") _list path;
     as2_id = option_of_yojson (value_for_key as2_id_of_yojson "As2Id") _list path;
     profile_id = option_of_yojson (value_for_key profile_id_of_yojson "ProfileId") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
   }
    : listed_profile)

let listed_profiles_of_yojson tree path = list_of_yojson listed_profile_of_yojson tree path

let listed_connector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     url = option_of_yojson (value_for_key url_of_yojson "Url") _list path;
     connector_id = option_of_yojson (value_for_key connector_id_of_yojson "ConnectorId") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
   }
    : listed_connector)

let listed_connectors_of_yojson tree path = list_of_yojson listed_connector_of_yojson tree path

let certificate_usage_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TLS" -> TLS
    | `String "ENCRYPTION" -> ENCRYPTION
    | `String "SIGNING" -> SIGNING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateUsageType" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateUsageType")
     : certificate_usage_type)
    : certificate_usage_type)

let certificate_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INACTIVE" -> INACTIVE
    | `String "PENDING_ROTATION" -> PENDING_ROTATION
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateStatusType")
     : certificate_status_type)
    : certificate_status_type)

let certificate_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CERTIFICATE_WITH_PRIVATE_KEY" -> CERTIFICATE_WITH_PRIVATE_KEY
    | `String "CERTIFICATE" -> CERTIFICATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateType" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateType")
     : certificate_type)
    : certificate_type)

let listed_certificate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     type_ = option_of_yojson (value_for_key certificate_type_of_yojson "Type") _list path;
     inactive_date = option_of_yojson (value_for_key cert_date_of_yojson "InactiveDate") _list path;
     active_date = option_of_yojson (value_for_key cert_date_of_yojson "ActiveDate") _list path;
     status = option_of_yojson (value_for_key certificate_status_type_of_yojson "Status") _list path;
     usage = option_of_yojson (value_for_key certificate_usage_type_of_yojson "Usage") _list path;
     certificate_id =
       option_of_yojson (value_for_key certificate_id_of_yojson "CertificateId") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
   }
    : listed_certificate)

let listed_certificates_of_yojson tree path = list_of_yojson listed_certificate_of_yojson tree path

let listed_agreement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partner_profile_id =
       option_of_yojson (value_for_key profile_id_of_yojson "PartnerProfileId") _list path;
     local_profile_id =
       option_of_yojson (value_for_key profile_id_of_yojson "LocalProfileId") _list path;
     server_id = option_of_yojson (value_for_key server_id_of_yojson "ServerId") _list path;
     status = option_of_yojson (value_for_key agreement_status_type_of_yojson "Status") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "AgreementId") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
   }
    : listed_agreement)

let listed_agreements_of_yojson tree path = list_of_yojson listed_agreement_of_yojson tree path

let list_workflows_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflows = value_for_key listed_workflows_of_yojson "Workflows" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_workflows_response)

let list_workflows_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_workflows_request)

let list_web_apps_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_apps = value_for_key listed_web_apps_of_yojson "WebApps" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_web_apps_response)

let list_web_apps_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_web_apps_request)

let list_users_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     users = value_for_key listed_users_of_yojson "Users" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_users_response)

let list_users_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_users_request)

let list_servers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     servers = value_for_key listed_servers_of_yojson "Servers" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_servers_response)

let list_servers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_servers_request)

let list_profiles_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profiles = value_for_key listed_profiles_of_yojson "Profiles" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_profiles_response)

let list_profiles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     profile_type = option_of_yojson (value_for_key profile_type_of_yojson "ProfileType") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_profiles_request)

let list_connectors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connectors = value_for_key listed_connectors_of_yojson "Connectors" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_connectors_response)

let list_connectors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_connectors_request)

let list_certificates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificates = value_for_key listed_certificates_of_yojson "Certificates" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_certificates_response)

let list_certificates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_certificates_request)

let list_agreements_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreements = value_for_key listed_agreements_of_yojson "Agreements" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_agreements_response)

let list_agreements_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_agreements_request)

let import_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_id = value_for_key certificate_id_of_yojson "CertificateId" _list path }
    : import_certificate_response)

let certificate_body_type_of_yojson = string_of_yojson
let certificate_chain_type_of_yojson = string_of_yojson

let import_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     inactive_date = option_of_yojson (value_for_key cert_date_of_yojson "InactiveDate") _list path;
     active_date = option_of_yojson (value_for_key cert_date_of_yojson "ActiveDate") _list path;
     private_key =
       option_of_yojson (value_for_key private_key_type_of_yojson "PrivateKey") _list path;
     certificate_chain =
       option_of_yojson
         (value_for_key certificate_chain_type_of_yojson "CertificateChain")
         _list path;
     certificate = value_for_key certificate_body_type_of_yojson "Certificate" _list path;
     usage = value_for_key certificate_usage_type_of_yojson "Usage" _list path;
   }
    : import_certificate_request)

let identity_center_application_arn_of_yojson = string_of_yojson

let described_workflow_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     workflow_id = option_of_yojson (value_for_key workflow_id_of_yojson "WorkflowId") _list path;
     on_exception_steps =
       option_of_yojson (value_for_key workflow_steps_of_yojson "OnExceptionSteps") _list path;
     steps = option_of_yojson (value_for_key workflow_steps_of_yojson "Steps") _list path;
     description =
       option_of_yojson (value_for_key workflow_description_of_yojson "Description") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : described_workflow)

let described_web_app_vpc_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
   }
    : described_web_app_vpc_config)

let described_identity_center_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     instance_arn =
       option_of_yojson
         (value_for_key identity_center_instance_arn_of_yojson "InstanceArn")
         _list path;
     application_arn =
       option_of_yojson
         (value_for_key identity_center_application_arn_of_yojson "ApplicationArn")
         _list path;
   }
    : described_identity_center_config)

let described_web_app_identity_provider_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "IdentityCenterConfig" ->
       IdentityCenterConfig (described_identity_center_config_of_yojson value_ path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "DescribedWebAppIdentityProviderDetails" unknown)
    : described_web_app_identity_provider_details)

let described_web_app_endpoint_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Vpc" -> Vpc (described_web_app_vpc_config_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "DescribedWebAppEndpointDetails" unknown)
    : described_web_app_endpoint_details)

let described_web_app_customization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     favicon_file =
       option_of_yojson (value_for_key web_app_favicon_file_of_yojson "FaviconFile") _list path;
     logo_file = option_of_yojson (value_for_key web_app_logo_file_of_yojson "LogoFile") _list path;
     title = option_of_yojson (value_for_key web_app_title_of_yojson "Title") _list path;
     web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : described_web_app_customization)

let described_web_app_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     described_endpoint_details =
       option_of_yojson
         (value_for_key described_web_app_endpoint_details_of_yojson "DescribedEndpointDetails")
         _list path;
     endpoint_type =
       option_of_yojson (value_for_key web_app_endpoint_type_of_yojson "EndpointType") _list path;
     web_app_endpoint_policy =
       option_of_yojson
         (value_for_key web_app_endpoint_policy_of_yojson "WebAppEndpointPolicy")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     web_app_units =
       option_of_yojson (value_for_key web_app_units_of_yojson "WebAppUnits") _list path;
     web_app_endpoint =
       option_of_yojson (value_for_key web_app_endpoint_of_yojson "WebAppEndpoint") _list path;
     access_endpoint =
       option_of_yojson
         (value_for_key web_app_access_endpoint_of_yojson "AccessEndpoint")
         _list path;
     described_identity_provider_details =
       option_of_yojson
         (value_for_key described_web_app_identity_provider_details_of_yojson
            "DescribedIdentityProviderDetails")
         _list path;
     web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : described_web_app)

let described_user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = option_of_yojson (value_for_key user_name_of_yojson "UserName") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     ssh_public_keys =
       option_of_yojson (value_for_key ssh_public_keys_of_yojson "SshPublicKeys") _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     posix_profile =
       option_of_yojson (value_for_key posix_profile_of_yojson "PosixProfile") _list path;
     policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path;
     home_directory_type =
       option_of_yojson (value_for_key home_directory_type_of_yojson "HomeDirectoryType") _list path;
     home_directory_mappings =
       option_of_yojson
         (value_for_key home_directory_mappings_of_yojson "HomeDirectoryMappings")
         _list path;
     home_directory =
       option_of_yojson (value_for_key home_directory_of_yojson "HomeDirectory") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : described_user)

let described_server_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IpAddressType") _list path;
     as2_service_managed_egress_ip_addresses =
       option_of_yojson
         (value_for_key service_managed_egress_ip_addresses_of_yojson
            "As2ServiceManagedEgressIpAddresses")
         _list path;
     s3_storage_options =
       option_of_yojson (value_for_key s3_storage_options_of_yojson "S3StorageOptions") _list path;
     structured_log_destinations =
       option_of_yojson
         (value_for_key structured_log_destinations_of_yojson "StructuredLogDestinations")
         _list path;
     workflow_details =
       option_of_yojson (value_for_key workflow_details_of_yojson "WorkflowDetails") _list path;
     user_count = option_of_yojson (value_for_key user_count_of_yojson "UserCount") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     state = option_of_yojson (value_for_key state_of_yojson "State") _list path;
     server_id = option_of_yojson (value_for_key server_id_of_yojson "ServerId") _list path;
     security_policy_name =
       option_of_yojson
         (value_for_key security_policy_name_of_yojson "SecurityPolicyName")
         _list path;
     protocols = option_of_yojson (value_for_key protocols_of_yojson "Protocols") _list path;
     pre_authentication_login_banner =
       option_of_yojson
         (value_for_key pre_authentication_login_banner_of_yojson "PreAuthenticationLoginBanner")
         _list path;
     post_authentication_login_banner =
       option_of_yojson
         (value_for_key post_authentication_login_banner_of_yojson "PostAuthenticationLoginBanner")
         _list path;
     logging_role =
       option_of_yojson (value_for_key nullable_role_of_yojson "LoggingRole") _list path;
     identity_provider_type =
       option_of_yojson
         (value_for_key identity_provider_type_of_yojson "IdentityProviderType")
         _list path;
     identity_provider_details =
       option_of_yojson
         (value_for_key identity_provider_details_of_yojson "IdentityProviderDetails")
         _list path;
     host_key_fingerprint =
       option_of_yojson
         (value_for_key host_key_fingerprint_of_yojson "HostKeyFingerprint")
         _list path;
     endpoint_type =
       option_of_yojson (value_for_key endpoint_type_of_yojson "EndpointType") _list path;
     endpoint_details =
       option_of_yojson (value_for_key endpoint_details_of_yojson "EndpointDetails") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "Domain") _list path;
     protocol_details =
       option_of_yojson (value_for_key protocol_details_of_yojson "ProtocolDetails") _list path;
     certificate = option_of_yojson (value_for_key certificate_of_yojson "Certificate") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : described_server)

let described_profile_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     certificate_ids =
       option_of_yojson (value_for_key certificate_ids_of_yojson "CertificateIds") _list path;
     as2_id = option_of_yojson (value_for_key as2_id_of_yojson "As2Id") _list path;
     profile_type = option_of_yojson (value_for_key profile_type_of_yojson "ProfileType") _list path;
     profile_id = option_of_yojson (value_for_key profile_id_of_yojson "ProfileId") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : described_profile)

let described_connector_vpc_lattice_egress_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port_number = option_of_yojson (value_for_key sftp_port_of_yojson "PortNumber") _list path;
     resource_configuration_arn =
       value_for_key vpc_lattice_resource_configuration_arn_of_yojson "ResourceConfigurationArn"
         _list path;
   }
    : described_connector_vpc_lattice_egress_config)

let described_connector_egress_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "VpcLattice" ->
       VpcLattice (described_connector_vpc_lattice_egress_config_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "DescribedConnectorEgressConfig" unknown)
    : described_connector_egress_config)

let connector_egress_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VPC_LATTICE" -> VPC_LATTICE
    | `String "SERVICE_MANAGED" -> SERVICE_MANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectorEgressType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectorEgressType")
     : connector_egress_type)
    : connector_egress_type)

let connector_error_message_of_yojson = string_of_yojson

let connector_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "ERRORED" -> ERRORED
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectorStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectorStatus")
     : connector_status)
    : connector_status)

let described_connector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address_type =
       option_of_yojson
         (value_for_key connectors_ip_address_type_of_yojson "IpAddressType")
         _list path;
     status = value_for_key connector_status_of_yojson "Status" _list path;
     error_message =
       option_of_yojson (value_for_key connector_error_message_of_yojson "ErrorMessage") _list path;
     egress_type = value_for_key connector_egress_type_of_yojson "EgressType" _list path;
     egress_config =
       option_of_yojson
         (value_for_key described_connector_egress_config_of_yojson "EgressConfig")
         _list path;
     security_policy_name =
       option_of_yojson
         (value_for_key connector_security_policy_name_of_yojson "SecurityPolicyName")
         _list path;
     service_managed_egress_ip_addresses =
       option_of_yojson
         (value_for_key service_managed_egress_ip_addresses_of_yojson
            "ServiceManagedEgressIpAddresses")
         _list path;
     sftp_config =
       option_of_yojson (value_for_key sftp_connector_config_of_yojson "SftpConfig") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     logging_role = option_of_yojson (value_for_key role_of_yojson "LoggingRole") _list path;
     access_role = option_of_yojson (value_for_key role_of_yojson "AccessRole") _list path;
     as2_config =
       option_of_yojson (value_for_key as2_connector_config_of_yojson "As2Config") _list path;
     url = option_of_yojson (value_for_key url_of_yojson "Url") _list path;
     connector_id = option_of_yojson (value_for_key connector_id_of_yojson "ConnectorId") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : described_connector)

let cert_serial_of_yojson = string_of_yojson

let described_certificate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     type_ = option_of_yojson (value_for_key certificate_type_of_yojson "Type") _list path;
     not_after_date = option_of_yojson (value_for_key cert_date_of_yojson "NotAfterDate") _list path;
     not_before_date =
       option_of_yojson (value_for_key cert_date_of_yojson "NotBeforeDate") _list path;
     serial = option_of_yojson (value_for_key cert_serial_of_yojson "Serial") _list path;
     inactive_date = option_of_yojson (value_for_key cert_date_of_yojson "InactiveDate") _list path;
     active_date = option_of_yojson (value_for_key cert_date_of_yojson "ActiveDate") _list path;
     certificate_chain =
       option_of_yojson
         (value_for_key certificate_chain_type_of_yojson "CertificateChain")
         _list path;
     certificate =
       option_of_yojson (value_for_key certificate_body_type_of_yojson "Certificate") _list path;
     status = option_of_yojson (value_for_key certificate_status_type_of_yojson "Status") _list path;
     usage = option_of_yojson (value_for_key certificate_usage_type_of_yojson "Usage") _list path;
     certificate_id =
       option_of_yojson (value_for_key certificate_id_of_yojson "CertificateId") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : described_certificate)

let described_agreement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_directories =
       option_of_yojson
         (value_for_key custom_directories_type_of_yojson "CustomDirectories")
         _list path;
     enforce_message_signing =
       option_of_yojson
         (value_for_key enforce_message_signing_type_of_yojson "EnforceMessageSigning")
         _list path;
     preserve_filename =
       option_of_yojson
         (value_for_key preserve_filename_type_of_yojson "PreserveFilename")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     access_role = option_of_yojson (value_for_key role_of_yojson "AccessRole") _list path;
     base_directory =
       option_of_yojson (value_for_key home_directory_of_yojson "BaseDirectory") _list path;
     partner_profile_id =
       option_of_yojson (value_for_key profile_id_of_yojson "PartnerProfileId") _list path;
     local_profile_id =
       option_of_yojson (value_for_key profile_id_of_yojson "LocalProfileId") _list path;
     server_id = option_of_yojson (value_for_key server_id_of_yojson "ServerId") _list path;
     status = option_of_yojson (value_for_key agreement_status_type_of_yojson "Status") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "AgreementId") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : described_agreement)

let describe_workflow_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workflow = value_for_key described_workflow_of_yojson "Workflow" _list path }
    : describe_workflow_response)

let describe_workflow_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workflow_id = value_for_key workflow_id_of_yojson "WorkflowId" _list path }
    : describe_workflow_request)

let describe_web_app_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_app = value_for_key described_web_app_of_yojson "WebApp" _list path }
    : describe_web_app_response)

let describe_web_app_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path }
    : describe_web_app_request)

let describe_web_app_customization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_app_customization =
       value_for_key described_web_app_customization_of_yojson "WebAppCustomization" _list path;
   }
    : describe_web_app_customization_response)

let describe_web_app_customization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path }
    : describe_web_app_customization_request)

let describe_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user = value_for_key described_user_of_yojson "User" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : describe_user_response)

let describe_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : describe_user_request)

let describe_server_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ server = value_for_key described_server_of_yojson "Server" _list path }
    : describe_server_response)

let describe_server_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ server_id = value_for_key server_id_of_yojson "ServerId" _list path }
    : describe_server_request)

let describe_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ profile = value_for_key described_profile_of_yojson "Profile" _list path }
    : describe_profile_response)

let describe_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ profile_id = value_for_key profile_id_of_yojson "ProfileId" _list path }
    : describe_profile_request)

let describe_connector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connector = value_for_key described_connector_of_yojson "Connector" _list path }
    : describe_connector_response)

let describe_connector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connector_id = value_for_key connector_id_of_yojson "ConnectorId" _list path }
    : describe_connector_request)

let describe_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate = value_for_key described_certificate_of_yojson "Certificate" _list path }
    : describe_certificate_response)

let describe_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_id = value_for_key certificate_id_of_yojson "CertificateId" _list path }
    : describe_certificate_request)

let describe_agreement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agreement = value_for_key described_agreement_of_yojson "Agreement" _list path }
    : describe_agreement_response)

let describe_agreement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "AgreementId" _list path;
   }
    : describe_agreement_request)

let delete_workflow_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workflow_id = value_for_key workflow_id_of_yojson "WorkflowId" _list path }
    : delete_workflow_request)

let delete_web_app_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path }
    : delete_web_app_request)

let delete_web_app_customization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path }
    : delete_web_app_customization_request)

let delete_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : delete_user_request)

let delete_server_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ server_id = value_for_key server_id_of_yojson "ServerId" _list path } : delete_server_request)

let delete_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ profile_id = value_for_key profile_id_of_yojson "ProfileId" _list path }
    : delete_profile_request)

let delete_connector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connector_id = value_for_key connector_id_of_yojson "ConnectorId" _list path }
    : delete_connector_request)

let delete_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_id = value_for_key certificate_id_of_yojson "CertificateId" _list path }
    : delete_certificate_request)

let delete_agreement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "AgreementId" _list path;
   }
    : delete_agreement_request)

let create_workflow_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workflow_id = value_for_key workflow_id_of_yojson "WorkflowId" _list path }
    : create_workflow_response)

let create_workflow_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     on_exception_steps =
       option_of_yojson (value_for_key workflow_steps_of_yojson "OnExceptionSteps") _list path;
     steps = value_for_key workflow_steps_of_yojson "Steps" _list path;
     description =
       option_of_yojson (value_for_key workflow_description_of_yojson "Description") _list path;
   }
    : create_workflow_request)

let create_web_app_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_app_id = value_for_key web_app_id_of_yojson "WebAppId" _list path }
    : create_web_app_response)

let create_web_app_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_details =
       option_of_yojson
         (value_for_key web_app_endpoint_details_of_yojson "EndpointDetails")
         _list path;
     web_app_endpoint_policy =
       option_of_yojson
         (value_for_key web_app_endpoint_policy_of_yojson "WebAppEndpointPolicy")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     web_app_units =
       option_of_yojson (value_for_key web_app_units_of_yojson "WebAppUnits") _list path;
     access_endpoint =
       option_of_yojson
         (value_for_key web_app_access_endpoint_of_yojson "AccessEndpoint")
         _list path;
     identity_provider_details =
       value_for_key web_app_identity_provider_details_of_yojson "IdentityProviderDetails" _list
         path;
   }
    : create_web_app_request)

let create_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
   }
    : create_user_response)

let create_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     ssh_public_key_body =
       option_of_yojson (value_for_key ssh_public_key_body_of_yojson "SshPublicKeyBody") _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     role = value_for_key role_of_yojson "Role" _list path;
     posix_profile =
       option_of_yojson (value_for_key posix_profile_of_yojson "PosixProfile") _list path;
     policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path;
     home_directory_mappings =
       option_of_yojson
         (value_for_key home_directory_mappings_of_yojson "HomeDirectoryMappings")
         _list path;
     home_directory_type =
       option_of_yojson (value_for_key home_directory_type_of_yojson "HomeDirectoryType") _list path;
     home_directory =
       option_of_yojson (value_for_key home_directory_of_yojson "HomeDirectory") _list path;
   }
    : create_user_request)

let create_server_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ server_id = value_for_key server_id_of_yojson "ServerId" _list path } : create_server_response)

let create_server_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IpAddressType") _list path;
     s3_storage_options =
       option_of_yojson (value_for_key s3_storage_options_of_yojson "S3StorageOptions") _list path;
     structured_log_destinations =
       option_of_yojson
         (value_for_key structured_log_destinations_of_yojson "StructuredLogDestinations")
         _list path;
     workflow_details =
       option_of_yojson (value_for_key workflow_details_of_yojson "WorkflowDetails") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     security_policy_name =
       option_of_yojson
         (value_for_key security_policy_name_of_yojson "SecurityPolicyName")
         _list path;
     protocol_details =
       option_of_yojson (value_for_key protocol_details_of_yojson "ProtocolDetails") _list path;
     protocols = option_of_yojson (value_for_key protocols_of_yojson "Protocols") _list path;
     pre_authentication_login_banner =
       option_of_yojson
         (value_for_key pre_authentication_login_banner_of_yojson "PreAuthenticationLoginBanner")
         _list path;
     post_authentication_login_banner =
       option_of_yojson
         (value_for_key post_authentication_login_banner_of_yojson "PostAuthenticationLoginBanner")
         _list path;
     logging_role =
       option_of_yojson (value_for_key nullable_role_of_yojson "LoggingRole") _list path;
     identity_provider_type =
       option_of_yojson
         (value_for_key identity_provider_type_of_yojson "IdentityProviderType")
         _list path;
     identity_provider_details =
       option_of_yojson
         (value_for_key identity_provider_details_of_yojson "IdentityProviderDetails")
         _list path;
     host_key = option_of_yojson (value_for_key host_key_of_yojson "HostKey") _list path;
     endpoint_type =
       option_of_yojson (value_for_key endpoint_type_of_yojson "EndpointType") _list path;
     endpoint_details =
       option_of_yojson (value_for_key endpoint_details_of_yojson "EndpointDetails") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "Domain") _list path;
     certificate = option_of_yojson (value_for_key certificate_of_yojson "Certificate") _list path;
   }
    : create_server_request)

let create_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ profile_id = value_for_key profile_id_of_yojson "ProfileId" _list path }
    : create_profile_response)

let create_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     certificate_ids =
       option_of_yojson (value_for_key certificate_ids_of_yojson "CertificateIds") _list path;
     profile_type = value_for_key profile_type_of_yojson "ProfileType" _list path;
     as2_id = value_for_key as2_id_of_yojson "As2Id" _list path;
   }
    : create_profile_request)

let create_connector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connector_id = value_for_key connector_id_of_yojson "ConnectorId" _list path }
    : create_connector_response)

let connector_vpc_lattice_egress_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port_number = option_of_yojson (value_for_key sftp_port_of_yojson "PortNumber") _list path;
     resource_configuration_arn =
       value_for_key vpc_lattice_resource_configuration_arn_of_yojson "ResourceConfigurationArn"
         _list path;
   }
    : connector_vpc_lattice_egress_config)

let connector_egress_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "VpcLattice" -> VpcLattice (connector_vpc_lattice_egress_config_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ConnectorEgressConfig" unknown)
    : connector_egress_config)

let create_connector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address_type =
       option_of_yojson
         (value_for_key connectors_ip_address_type_of_yojson "IpAddressType")
         _list path;
     egress_config =
       option_of_yojson (value_for_key connector_egress_config_of_yojson "EgressConfig") _list path;
     security_policy_name =
       option_of_yojson
         (value_for_key connector_security_policy_name_of_yojson "SecurityPolicyName")
         _list path;
     sftp_config =
       option_of_yojson (value_for_key sftp_connector_config_of_yojson "SftpConfig") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     logging_role = option_of_yojson (value_for_key role_of_yojson "LoggingRole") _list path;
     access_role = value_for_key role_of_yojson "AccessRole" _list path;
     as2_config =
       option_of_yojson (value_for_key as2_connector_config_of_yojson "As2Config") _list path;
     url = option_of_yojson (value_for_key url_of_yojson "Url") _list path;
   }
    : create_connector_request)

let create_agreement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agreement_id = value_for_key agreement_id_of_yojson "AgreementId" _list path }
    : create_agreement_response)

let create_agreement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_directories =
       option_of_yojson
         (value_for_key custom_directories_type_of_yojson "CustomDirectories")
         _list path;
     enforce_message_signing =
       option_of_yojson
         (value_for_key enforce_message_signing_type_of_yojson "EnforceMessageSigning")
         _list path;
     preserve_filename =
       option_of_yojson
         (value_for_key preserve_filename_type_of_yojson "PreserveFilename")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     status = option_of_yojson (value_for_key agreement_status_type_of_yojson "Status") _list path;
     access_role = value_for_key role_of_yojson "AccessRole" _list path;
     base_directory =
       option_of_yojson (value_for_key home_directory_of_yojson "BaseDirectory") _list path;
     partner_profile_id = value_for_key profile_id_of_yojson "PartnerProfileId" _list path;
     local_profile_id = value_for_key profile_id_of_yojson "LocalProfileId" _list path;
     server_id = value_for_key server_id_of_yojson "ServerId" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
   }
    : create_agreement_request)
