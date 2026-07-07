open Smaws_Lib.Json.DeserializeHelpers
open Types

let exception_message_of_yojson = string_of_yojson

let user_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : user_quota_exceeded_fault)

let user_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : user_not_found_fault)

let user_name_of_yojson = string_of_yojson
let user_name_list_input_of_yojson tree path = list_of_yojson user_name_of_yojson tree path
let user_name_list_of_yojson tree path = list_of_yojson user_name_of_yojson tree path
let string__of_yojson = string_of_yojson
let acl_name_of_yojson = string_of_yojson
let acl_name_list_of_yojson tree path = list_of_yojson acl_name_of_yojson tree path

let authentication_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "iam" -> IAM
    | `String "no-password" -> NO_PASSWORD
    | `String "password" -> PASSWORD
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthenticationType")
     : authentication_type)
    : authentication_type)

let integer_optional_of_yojson = int_of_yojson

let authentication_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password_count =
       option_of_yojson (value_for_key integer_optional_of_yojson "PasswordCount") _list path;
     type_ = option_of_yojson (value_for_key authentication_type_of_yojson "Type") _list path;
   }
    : authentication)

let user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     authentication =
       option_of_yojson (value_for_key authentication_of_yojson "Authentication") _list path;
     minimum_engine_version =
       option_of_yojson (value_for_key string__of_yojson "MinimumEngineVersion") _list path;
     acl_names = option_of_yojson (value_for_key acl_name_list_of_yojson "ACLNames") _list path;
     access_string = option_of_yojson (value_for_key string__of_yojson "AccessString") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : user)

let user_list_of_yojson tree path = list_of_yojson user_of_yojson tree path

let user_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : user_already_exists_fault)

let update_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user = option_of_yojson (value_for_key user_of_yojson "User") _list path }
    : update_user_response)

let input_authentication_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "iam" -> IAM
    | `String "password" -> PASSWORD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InputAuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "InputAuthenticationType")
     : input_authentication_type)
    : input_authentication_type)

let password_list_input_of_yojson tree path = list_of_yojson string__of_yojson tree path

let authentication_mode_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     passwords =
       option_of_yojson (value_for_key password_list_input_of_yojson "Passwords") _list path;
     type_ = option_of_yojson (value_for_key input_authentication_type_of_yojson "Type") _list path;
   }
    : authentication_mode)

let access_string_of_yojson = string_of_yojson

let update_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_string =
       option_of_yojson (value_for_key access_string_of_yojson "AccessString") _list path;
     authentication_mode =
       option_of_yojson
         (value_for_key authentication_mode_of_yojson "AuthenticationMode")
         _list path;
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
   }
    : update_user_request)

let invalid_user_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_user_state_fault)

let aws_query_error_message_of_yojson = string_of_yojson

let invalid_parameter_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key aws_query_error_message_of_yojson "message") _list path;
   }
    : invalid_parameter_value_exception)

let invalid_parameter_combination_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key aws_query_error_message_of_yojson "message") _list path;
   }
    : invalid_parameter_combination_exception)

let availability_zone_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key string__of_yojson "Name") _list path }
    : availability_zone)

let network_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "dual_stack" -> DUAL_STACK
    | `String "ipv6" -> IPV6
    | `String "ipv4" -> IPV4
    | `String value -> raise (deserialize_unknown_enum_value_error path "NetworkType" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkType")
     : network_type)
    : network_type)

let network_type_list_of_yojson tree path = list_of_yojson network_type_of_yojson tree path

let subnet_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     supported_network_types =
       option_of_yojson
         (value_for_key network_type_list_of_yojson "SupportedNetworkTypes")
         _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "AvailabilityZone") _list path;
     identifier = option_of_yojson (value_for_key string__of_yojson "Identifier") _list path;
   }
    : subnet)

let subnet_list_of_yojson tree path = list_of_yojson subnet_of_yojson tree path

let subnet_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     supported_network_types =
       option_of_yojson
         (value_for_key network_type_list_of_yojson "SupportedNetworkTypes")
         _list path;
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     subnets = option_of_yojson (value_for_key subnet_list_of_yojson "Subnets") _list path;
     vpc_id = option_of_yojson (value_for_key string__of_yojson "VpcId") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : subnet_group)

let update_subnet_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_group = option_of_yojson (value_for_key subnet_group_of_yojson "SubnetGroup") _list path;
   }
    : update_subnet_group_response)

let subnet_identifier_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let update_subnet_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_ids =
       option_of_yojson (value_for_key subnet_identifier_list_of_yojson "SubnetIds") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     subnet_group_name = value_for_key string__of_yojson "SubnetGroupName" _list path;
   }
    : update_subnet_group_request)

let subnet_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : subnet_quota_exceeded_fault)

let subnet_not_allowed_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : subnet_not_allowed_fault)

let subnet_in_use_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : subnet_in_use)

let subnet_group_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : subnet_group_not_found_fault)

let service_linked_role_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : service_linked_role_not_found_fault)

let invalid_subnet_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_subnet)

let update_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "uncoordinated" -> UNCOORDINATED
    | `String "coordinated" -> COORDINATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UpdateStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateStrategy")
     : update_strategy)
    : update_strategy)

let parameter_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     family = option_of_yojson (value_for_key string__of_yojson "Family") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : parameter_group)

let update_parameter_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_group =
       option_of_yojson (value_for_key parameter_group_of_yojson "ParameterGroup") _list path;
   }
    : update_parameter_group_response)

let parameter_name_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_value =
       option_of_yojson (value_for_key string__of_yojson "ParameterValue") _list path;
     parameter_name = option_of_yojson (value_for_key string__of_yojson "ParameterName") _list path;
   }
    : parameter_name_value)

let parameter_name_value_list_of_yojson tree path =
  list_of_yojson parameter_name_value_of_yojson tree path

let update_parameter_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_name_values =
       value_for_key parameter_name_value_list_of_yojson "ParameterNameValues" _list path;
     parameter_group_name = value_for_key string__of_yojson "ParameterGroupName" _list path;
   }
    : update_parameter_group_request)

let parameter_group_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : parameter_group_not_found_fault)

let invalid_parameter_group_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_parameter_group_state_fault)

let regional_cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     region = option_of_yojson (value_for_key string__of_yojson "Region") _list path;
     cluster_name = option_of_yojson (value_for_key string__of_yojson "ClusterName") _list path;
   }
    : regional_cluster)

let regional_cluster_list_of_yojson tree path = list_of_yojson regional_cluster_of_yojson tree path
let boolean_optional_of_yojson = bool_of_yojson

let multi_region_cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     tls_enabled =
       option_of_yojson (value_for_key boolean_optional_of_yojson "TLSEnabled") _list path;
     multi_region_parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "MultiRegionParameterGroupName") _list path;
     clusters =
       option_of_yojson (value_for_key regional_cluster_list_of_yojson "Clusters") _list path;
     number_of_shards =
       option_of_yojson (value_for_key integer_optional_of_yojson "NumberOfShards") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
     node_type = option_of_yojson (value_for_key string__of_yojson "NodeType") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     multi_region_cluster_name =
       option_of_yojson (value_for_key string__of_yojson "MultiRegionClusterName") _list path;
   }
    : multi_region_cluster)

let update_multi_region_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_region_cluster =
       option_of_yojson
         (value_for_key multi_region_cluster_of_yojson "MultiRegionCluster")
         _list path;
   }
    : update_multi_region_cluster_response)

let integer_of_yojson = int_of_yojson

let shard_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ shard_count = option_of_yojson (value_for_key integer_of_yojson "ShardCount") _list path }
    : shard_configuration_request)

let update_multi_region_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_strategy =
       option_of_yojson (value_for_key update_strategy_of_yojson "UpdateStrategy") _list path;
     multi_region_parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "MultiRegionParameterGroupName") _list path;
     shard_configuration =
       option_of_yojson
         (value_for_key shard_configuration_request_of_yojson "ShardConfiguration")
         _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     node_type = option_of_yojson (value_for_key string__of_yojson "NodeType") _list path;
     multi_region_cluster_name = value_for_key string__of_yojson "MultiRegionClusterName" _list path;
   }
    : update_multi_region_cluster_request)

let multi_region_parameter_group_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : multi_region_parameter_group_not_found_fault)

let multi_region_cluster_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : multi_region_cluster_not_found_fault)

let invalid_multi_region_cluster_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_multi_region_cluster_state_fault)

let double_of_yojson = double_of_yojson

let slot_migration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     progress_percentage =
       option_of_yojson (value_for_key double_of_yojson "ProgressPercentage") _list path;
   }
    : slot_migration)

let resharding_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     slot_migration =
       option_of_yojson (value_for_key slot_migration_of_yojson "SlotMigration") _list path;
   }
    : resharding_status)

let ac_ls_update_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ acl_to_apply = option_of_yojson (value_for_key acl_name_of_yojson "ACLToApply") _list path }
    : ac_ls_update_status)

let service_update_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "scheduled" -> SCHEDULED
    | `String "complete" -> COMPLETE
    | `String "in-progress" -> IN_PROGRESS
    | `String "available" -> NOT_APPLIED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceUpdateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceUpdateStatus")
     : service_update_status)
    : service_update_status)

let pending_modified_service_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key service_update_status_of_yojson "Status") _list path;
     service_update_name =
       option_of_yojson (value_for_key string__of_yojson "ServiceUpdateName") _list path;
   }
    : pending_modified_service_update)

let pending_modified_service_update_list_of_yojson tree path =
  list_of_yojson pending_modified_service_update_of_yojson tree path

let cluster_pending_updates_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_updates =
       option_of_yojson
         (value_for_key pending_modified_service_update_list_of_yojson "ServiceUpdates")
         _list path;
     ac_ls = option_of_yojson (value_for_key ac_ls_update_status_of_yojson "ACLs") _list path;
     resharding =
       option_of_yojson (value_for_key resharding_status_of_yojson "Resharding") _list path;
   }
    : cluster_pending_updates)

let t_stamp_of_yojson = timestamp_epoch_seconds_of_yojson

let endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port = option_of_yojson (value_for_key integer_of_yojson "Port") _list path;
     address = option_of_yojson (value_for_key string__of_yojson "Address") _list path;
   }
    : endpoint)

let node_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint = option_of_yojson (value_for_key endpoint_of_yojson "Endpoint") _list path;
     create_time = option_of_yojson (value_for_key t_stamp_of_yojson "CreateTime") _list path;
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "AvailabilityZone") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : node)

let node_list_of_yojson tree path = list_of_yojson node_of_yojson tree path

let shard_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_nodes =
       option_of_yojson (value_for_key integer_optional_of_yojson "NumberOfNodes") _list path;
     nodes = option_of_yojson (value_for_key node_list_of_yojson "Nodes") _list path;
     slots = option_of_yojson (value_for_key string__of_yojson "Slots") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : shard)

let shard_list_of_yojson tree path = list_of_yojson shard_of_yojson tree path

let az_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "multiaz" -> MultiAZ
    | `String "singleaz" -> SingleAZ
    | `String value -> raise (deserialize_unknown_enum_value_error path "AZStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AZStatus")
     : az_status)
    : az_status)

let security_group_membership_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     security_group_id =
       option_of_yojson (value_for_key string__of_yojson "SecurityGroupId") _list path;
   }
    : security_group_membership)

let security_group_membership_list_of_yojson tree path =
  list_of_yojson security_group_membership_of_yojson tree path

let data_tiering_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "false" -> FALSE
    | `String "true" -> TRUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataTieringStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DataTieringStatus")
     : data_tiering_status)
    : data_tiering_status)

let ip_discovery_of_yojson (tree : t) path =
  ((match tree with
    | `String "ipv6" -> IPV6
    | `String "ipv4" -> IPV4
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpDiscovery" value)
    | _ -> raise (deserialize_wrong_type_error path "IpDiscovery")
     : ip_discovery)
    : ip_discovery)

let cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_discovery = option_of_yojson (value_for_key ip_discovery_of_yojson "IpDiscovery") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
     data_tiering =
       option_of_yojson (value_for_key data_tiering_status_of_yojson "DataTiering") _list path;
     auto_minor_version_upgrade =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "AutoMinorVersionUpgrade")
         _list path;
     acl_name = option_of_yojson (value_for_key acl_name_of_yojson "ACLName") _list path;
     snapshot_window =
       option_of_yojson (value_for_key string__of_yojson "SnapshotWindow") _list path;
     maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "MaintenanceWindow") _list path;
     snapshot_retention_limit =
       option_of_yojson
         (value_for_key integer_optional_of_yojson "SnapshotRetentionLimit")
         _list path;
     sns_topic_status =
       option_of_yojson (value_for_key string__of_yojson "SnsTopicStatus") _list path;
     sns_topic_arn = option_of_yojson (value_for_key string__of_yojson "SnsTopicArn") _list path;
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     tls_enabled =
       option_of_yojson (value_for_key boolean_optional_of_yojson "TLSEnabled") _list path;
     subnet_group_name =
       option_of_yojson (value_for_key string__of_yojson "SubnetGroupName") _list path;
     security_groups =
       option_of_yojson
         (value_for_key security_group_membership_list_of_yojson "SecurityGroups")
         _list path;
     parameter_group_status =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupStatus") _list path;
     parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupName") _list path;
     engine_patch_version =
       option_of_yojson (value_for_key string__of_yojson "EnginePatchVersion") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
     node_type = option_of_yojson (value_for_key string__of_yojson "NodeType") _list path;
     cluster_endpoint =
       option_of_yojson (value_for_key endpoint_of_yojson "ClusterEndpoint") _list path;
     availability_mode =
       option_of_yojson (value_for_key az_status_of_yojson "AvailabilityMode") _list path;
     shards = option_of_yojson (value_for_key shard_list_of_yojson "Shards") _list path;
     number_of_shards =
       option_of_yojson (value_for_key integer_optional_of_yojson "NumberOfShards") _list path;
     multi_region_cluster_name =
       option_of_yojson (value_for_key string__of_yojson "MultiRegionClusterName") _list path;
     pending_updates =
       option_of_yojson
         (value_for_key cluster_pending_updates_of_yojson "PendingUpdates")
         _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : cluster)

let update_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : update_cluster_response)

let security_group_ids_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let replica_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replica_count = option_of_yojson (value_for_key integer_of_yojson "ReplicaCount") _list path }
    : replica_configuration_request)

let update_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_discovery = option_of_yojson (value_for_key ip_discovery_of_yojson "IpDiscovery") _list path;
     acl_name = option_of_yojson (value_for_key acl_name_of_yojson "ACLName") _list path;
     shard_configuration =
       option_of_yojson
         (value_for_key shard_configuration_request_of_yojson "ShardConfiguration")
         _list path;
     replica_configuration =
       option_of_yojson
         (value_for_key replica_configuration_request_of_yojson "ReplicaConfiguration")
         _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
     node_type = option_of_yojson (value_for_key string__of_yojson "NodeType") _list path;
     snapshot_retention_limit =
       option_of_yojson
         (value_for_key integer_optional_of_yojson "SnapshotRetentionLimit")
         _list path;
     snapshot_window =
       option_of_yojson (value_for_key string__of_yojson "SnapshotWindow") _list path;
     parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupName") _list path;
     sns_topic_status =
       option_of_yojson (value_for_key string__of_yojson "SnsTopicStatus") _list path;
     sns_topic_arn = option_of_yojson (value_for_key string__of_yojson "SnsTopicArn") _list path;
     maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "MaintenanceWindow") _list path;
     security_group_ids =
       option_of_yojson
         (value_for_key security_group_ids_list_of_yojson "SecurityGroupIds")
         _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     cluster_name = value_for_key string__of_yojson "ClusterName" _list path;
   }
    : update_cluster_request)

let shards_per_cluster_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : shards_per_cluster_quota_exceeded_fault)

let no_operation_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : no_operation_fault)

let node_quota_for_customer_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : node_quota_for_customer_exceeded_fault)

let node_quota_for_cluster_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : node_quota_for_cluster_exceeded_fault)

let invalid_vpc_network_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_vpc_network_state_fault)

let invalid_node_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_node_state_fault)

let invalid_kms_key_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_kms_key_fault)

let invalid_cluster_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_cluster_state_fault)

let invalid_acl_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_acl_state_fault)

let cluster_quota_for_customer_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : cluster_quota_for_customer_exceeded_fault)

let cluster_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : cluster_not_found_fault)

let acl_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : acl_not_found_fault)

let acl_pending_changes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_names_to_add =
       option_of_yojson (value_for_key user_name_list_of_yojson "UserNamesToAdd") _list path;
     user_names_to_remove =
       option_of_yojson (value_for_key user_name_list_of_yojson "UserNamesToRemove") _list path;
   }
    : acl_pending_changes)

let acl_cluster_name_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let ac_l_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     clusters =
       option_of_yojson (value_for_key acl_cluster_name_list_of_yojson "Clusters") _list path;
     pending_changes =
       option_of_yojson (value_for_key acl_pending_changes_of_yojson "PendingChanges") _list path;
     minimum_engine_version =
       option_of_yojson (value_for_key string__of_yojson "MinimumEngineVersion") _list path;
     user_names = option_of_yojson (value_for_key user_name_list_of_yojson "UserNames") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : ac_l)

let update_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ac_l = option_of_yojson (value_for_key ac_l_of_yojson "ACL") _list path }
    : update_acl_response)

let update_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_names_to_remove =
       option_of_yojson
         (value_for_key user_name_list_input_of_yojson "UserNamesToRemove")
         _list path;
     user_names_to_add =
       option_of_yojson (value_for_key user_name_list_input_of_yojson "UserNamesToAdd") _list path;
     acl_name = value_for_key string__of_yojson "ACLName" _list path;
   }
    : update_acl_request)

let duplicate_user_name_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : duplicate_user_name_fault)

let default_user_required_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : default_user_required)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key string__of_yojson "Key") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path }
    : untag_resource_response)

let key_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key key_list_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key string__of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let tag_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : tag_not_found_fault)

let snapshot_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : snapshot_not_found_fault)

let invalid_arn_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_arn_fault)

let unprocessed_cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     error_type = option_of_yojson (value_for_key string__of_yojson "ErrorType") _list path;
     cluster_name = option_of_yojson (value_for_key string__of_yojson "ClusterName") _list path;
   }
    : unprocessed_cluster)

let unprocessed_cluster_list_of_yojson tree path =
  list_of_yojson unprocessed_cluster_of_yojson tree path

let test_failover_not_available_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : test_failover_not_available_fault)

let target_bucket_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path }
    : tag_resource_response)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_arn = value_for_key string__of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let tag_quota_per_resource_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : tag_quota_per_resource_exceeded)

let subnet_group_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : subnet_group_quota_exceeded_fault)

let subnet_group_list_of_yojson tree path = list_of_yojson subnet_group_of_yojson tree path

let subnet_group_in_use_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : subnet_group_in_use_fault)

let subnet_group_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : subnet_group_already_exists_fault)

let source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "acl" -> Acl
    | `String "user" -> User
    | `String "cluster" -> Cluster
    | `String "subnet-group" -> Subnet_group
    | `String "parameter-group" -> Parameter_group
    | `String "node" -> Node
    | `String value -> raise (deserialize_unknown_enum_value_error path "SourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceType")
     : source_type)
    : source_type)

let snapshot_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : snapshot_quota_exceeded_fault)

let shard_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_count =
       option_of_yojson (value_for_key integer_optional_of_yojson "ReplicaCount") _list path;
     slots = option_of_yojson (value_for_key string__of_yojson "Slots") _list path;
   }
    : shard_configuration)

let shard_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_creation_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "SnapshotCreationTime") _list path;
     size = option_of_yojson (value_for_key string__of_yojson "Size") _list path;
     configuration =
       option_of_yojson (value_for_key shard_configuration_of_yojson "Configuration") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : shard_detail)

let shard_details_of_yojson tree path = list_of_yojson shard_detail_of_yojson tree path

let cluster_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_region_cluster_name =
       option_of_yojson (value_for_key string__of_yojson "MultiRegionClusterName") _list path;
     multi_region_parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "MultiRegionParameterGroupName") _list path;
     shards = option_of_yojson (value_for_key shard_details_of_yojson "Shards") _list path;
     num_shards = option_of_yojson (value_for_key integer_optional_of_yojson "NumShards") _list path;
     snapshot_window =
       option_of_yojson (value_for_key string__of_yojson "SnapshotWindow") _list path;
     snapshot_retention_limit =
       option_of_yojson
         (value_for_key integer_optional_of_yojson "SnapshotRetentionLimit")
         _list path;
     vpc_id = option_of_yojson (value_for_key string__of_yojson "VpcId") _list path;
     subnet_group_name =
       option_of_yojson (value_for_key string__of_yojson "SubnetGroupName") _list path;
     parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupName") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     topic_arn = option_of_yojson (value_for_key string__of_yojson "TopicArn") _list path;
     maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "MaintenanceWindow") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
     node_type = option_of_yojson (value_for_key string__of_yojson "NodeType") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : cluster_configuration)

let snapshot_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_tiering =
       option_of_yojson (value_for_key data_tiering_status_of_yojson "DataTiering") _list path;
     cluster_configuration =
       option_of_yojson
         (value_for_key cluster_configuration_of_yojson "ClusterConfiguration")
         _list path;
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     source = option_of_yojson (value_for_key string__of_yojson "Source") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : snapshot)

let snapshot_list_of_yojson tree path = list_of_yojson snapshot_of_yojson tree path
let snapshot_arns_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let snapshot_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : snapshot_already_exists_fault)

let shard_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : shard_not_found_fault)

let service_update_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "security-update" -> SECURITY_UPDATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceUpdateType" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceUpdateType")
     : service_update_type)
    : service_update_type)

let service_update_status_list_of_yojson tree path =
  list_of_yojson service_update_status_of_yojson tree path

let service_update_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_update_name_to_apply =
       option_of_yojson (value_for_key string__of_yojson "ServiceUpdateNameToApply") _list path;
   }
    : service_update_request)

let service_update_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : service_update_not_found_fault)

let service_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_update_start_date =
       option_of_yojson (value_for_key t_stamp_of_yojson "AutoUpdateStartDate") _list path;
     nodes_updated = option_of_yojson (value_for_key string__of_yojson "NodesUpdated") _list path;
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
     type_ = option_of_yojson (value_for_key service_update_type_of_yojson "Type") _list path;
     status = option_of_yojson (value_for_key service_update_status_of_yojson "Status") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     release_date = option_of_yojson (value_for_key t_stamp_of_yojson "ReleaseDate") _list path;
     service_update_name =
       option_of_yojson (value_for_key string__of_yojson "ServiceUpdateName") _list path;
     cluster_name = option_of_yojson (value_for_key string__of_yojson "ClusterName") _list path;
   }
    : service_update)

let service_update_list_of_yojson tree path = list_of_yojson service_update_of_yojson tree path

let reset_parameter_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_group =
       option_of_yojson (value_for_key parameter_group_of_yojson "ParameterGroup") _list path;
   }
    : reset_parameter_group_response)

let boolean__of_yojson = bool_of_yojson
let parameter_name_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let reset_parameter_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_names =
       option_of_yojson (value_for_key parameter_name_list_of_yojson "ParameterNames") _list path;
     all_parameters = option_of_yojson (value_for_key boolean__of_yojson "AllParameters") _list path;
     parameter_group_name = value_for_key string__of_yojson "ParameterGroupName" _list path;
   }
    : reset_parameter_group_request)

let reserved_nodes_offering_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : reserved_nodes_offering_not_found_fault)

let recurring_charge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recurring_charge_frequency =
       option_of_yojson (value_for_key string__of_yojson "RecurringChargeFrequency") _list path;
     recurring_charge_amount =
       option_of_yojson (value_for_key double_of_yojson "RecurringChargeAmount") _list path;
   }
    : recurring_charge)

let recurring_charge_list_of_yojson tree path = list_of_yojson recurring_charge_of_yojson tree path

let reserved_nodes_offering_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recurring_charges =
       option_of_yojson
         (value_for_key recurring_charge_list_of_yojson "RecurringCharges")
         _list path;
     offering_type = option_of_yojson (value_for_key string__of_yojson "OfferingType") _list path;
     fixed_price = option_of_yojson (value_for_key double_of_yojson "FixedPrice") _list path;
     duration = option_of_yojson (value_for_key integer_of_yojson "Duration") _list path;
     node_type = option_of_yojson (value_for_key string__of_yojson "NodeType") _list path;
     reserved_nodes_offering_id =
       option_of_yojson (value_for_key string__of_yojson "ReservedNodesOfferingId") _list path;
   }
    : reserved_nodes_offering)

let reserved_nodes_offering_list_of_yojson tree path =
  list_of_yojson reserved_nodes_offering_of_yojson tree path

let reserved_node_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : reserved_node_quota_exceeded_fault)

let reserved_node_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : reserved_node_not_found_fault)

let reserved_node_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     recurring_charges =
       option_of_yojson
         (value_for_key recurring_charge_list_of_yojson "RecurringCharges")
         _list path;
     state = option_of_yojson (value_for_key string__of_yojson "State") _list path;
     offering_type = option_of_yojson (value_for_key string__of_yojson "OfferingType") _list path;
     node_count = option_of_yojson (value_for_key integer_of_yojson "NodeCount") _list path;
     fixed_price = option_of_yojson (value_for_key double_of_yojson "FixedPrice") _list path;
     duration = option_of_yojson (value_for_key integer_of_yojson "Duration") _list path;
     start_time = option_of_yojson (value_for_key t_stamp_of_yojson "StartTime") _list path;
     node_type = option_of_yojson (value_for_key string__of_yojson "NodeType") _list path;
     reserved_nodes_offering_id =
       option_of_yojson (value_for_key string__of_yojson "ReservedNodesOfferingId") _list path;
     reservation_id = option_of_yojson (value_for_key string__of_yojson "ReservationId") _list path;
   }
    : reserved_node)

let reserved_node_list_of_yojson tree path = list_of_yojson reserved_node_of_yojson tree path

let reserved_node_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : reserved_node_already_exists_fault)

let purchase_reserved_nodes_offering_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reserved_node =
       option_of_yojson (value_for_key reserved_node_of_yojson "ReservedNode") _list path;
   }
    : purchase_reserved_nodes_offering_response)

let purchase_reserved_nodes_offering_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     node_count = option_of_yojson (value_for_key integer_optional_of_yojson "NodeCount") _list path;
     reservation_id = option_of_yojson (value_for_key string__of_yojson "ReservationId") _list path;
     reserved_nodes_offering_id =
       value_for_key string__of_yojson "ReservedNodesOfferingId" _list path;
   }
    : purchase_reserved_nodes_offering_request)

let parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minimum_engine_version =
       option_of_yojson (value_for_key string__of_yojson "MinimumEngineVersion") _list path;
     allowed_values = option_of_yojson (value_for_key string__of_yojson "AllowedValues") _list path;
     data_type = option_of_yojson (value_for_key string__of_yojson "DataType") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : parameter)

let parameters_list_of_yojson tree path = list_of_yojson parameter_of_yojson tree path

let parameter_group_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : parameter_group_quota_exceeded_fault)

let parameter_group_list_of_yojson tree path = list_of_yojson parameter_group_of_yojson tree path

let parameter_group_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : parameter_group_already_exists_fault)

let node_type_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let multi_region_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minimum_engine_version =
       option_of_yojson (value_for_key string__of_yojson "MinimumEngineVersion") _list path;
     allowed_values = option_of_yojson (value_for_key string__of_yojson "AllowedValues") _list path;
     data_type = option_of_yojson (value_for_key string__of_yojson "DataType") _list path;
     source = option_of_yojson (value_for_key string__of_yojson "Source") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : multi_region_parameter)

let multi_region_parameters_list_of_yojson tree path =
  list_of_yojson multi_region_parameter_of_yojson tree path

let multi_region_parameter_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key string__of_yojson "ARN") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     family = option_of_yojson (value_for_key string__of_yojson "Family") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : multi_region_parameter_group)

let multi_region_parameter_group_list_of_yojson tree path =
  list_of_yojson multi_region_parameter_group_of_yojson tree path

let multi_region_cluster_list_of_yojson tree path =
  list_of_yojson multi_region_cluster_of_yojson tree path

let multi_region_cluster_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : multi_region_cluster_already_exists_fault)

let list_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path }
    : list_tags_response)

let list_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key string__of_yojson "ResourceArn" _list path } : list_tags_request)

let list_allowed_node_type_updates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scale_down_node_types =
       option_of_yojson (value_for_key node_type_list_of_yojson "ScaleDownNodeTypes") _list path;
     scale_up_node_types =
       option_of_yojson (value_for_key node_type_list_of_yojson "ScaleUpNodeTypes") _list path;
   }
    : list_allowed_node_type_updates_response)

let list_allowed_node_type_updates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster_name = value_for_key string__of_yojson "ClusterName" _list path }
    : list_allowed_node_type_updates_request)

let list_allowed_multi_region_cluster_updates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scale_down_node_types =
       option_of_yojson (value_for_key node_type_list_of_yojson "ScaleDownNodeTypes") _list path;
     scale_up_node_types =
       option_of_yojson (value_for_key node_type_list_of_yojson "ScaleUpNodeTypes") _list path;
   }
    : list_allowed_multi_region_cluster_updates_response)

let list_allowed_multi_region_cluster_updates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_region_cluster_name = value_for_key string__of_yojson "MultiRegionClusterName" _list path;
   }
    : list_allowed_multi_region_cluster_updates_request)

let kms_key_id_of_yojson = string_of_yojson

let invalid_snapshot_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_snapshot_state_fault)

let invalid_credentials_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_credentials_exception)

let insufficient_cluster_capacity_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : insufficient_cluster_capacity_fault)

let filter_value_of_yojson = string_of_yojson
let filter_value_list_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path
let filter_name_of_yojson = string_of_yojson

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
     name = value_for_key filter_name_of_yojson "Name" _list path;
   }
    : filter)

let filter_list_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let failover_shard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : failover_shard_response)

let failover_shard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shard_name = value_for_key string__of_yojson "ShardName" _list path;
     cluster_name = value_for_key string__of_yojson "ClusterName" _list path;
   }
    : failover_shard_request)

let api_call_rate_for_customer_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : api_call_rate_for_customer_exceeded_fault)

let event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date = option_of_yojson (value_for_key t_stamp_of_yojson "Date") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     source_type = option_of_yojson (value_for_key source_type_of_yojson "SourceType") _list path;
     source_name = option_of_yojson (value_for_key string__of_yojson "SourceName") _list path;
   }
    : event)

let event_list_of_yojson tree path = list_of_yojson event_of_yojson tree path

let engine_version_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_group_family =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupFamily") _list path;
     engine_patch_version =
       option_of_yojson (value_for_key string__of_yojson "EnginePatchVersion") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
   }
    : engine_version_info)

let engine_version_info_list_of_yojson tree path =
  list_of_yojson engine_version_info_of_yojson tree path

let describe_users_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     users = option_of_yojson (value_for_key user_list_of_yojson "Users") _list path;
   }
    : describe_users_response)

let describe_users_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "Filters") _list path;
     user_name = option_of_yojson (value_for_key user_name_of_yojson "UserName") _list path;
   }
    : describe_users_request)

let describe_subnet_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_groups =
       option_of_yojson (value_for_key subnet_group_list_of_yojson "SubnetGroups") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_subnet_groups_response)

let describe_subnet_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     subnet_group_name =
       option_of_yojson (value_for_key string__of_yojson "SubnetGroupName") _list path;
   }
    : describe_subnet_groups_request)

let describe_snapshots_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshots = option_of_yojson (value_for_key snapshot_list_of_yojson "Snapshots") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_snapshots_response)

let describe_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     show_detail =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ShowDetail") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     source = option_of_yojson (value_for_key string__of_yojson "Source") _list path;
     snapshot_name = option_of_yojson (value_for_key string__of_yojson "SnapshotName") _list path;
     cluster_name = option_of_yojson (value_for_key string__of_yojson "ClusterName") _list path;
   }
    : describe_snapshots_request)

let describe_service_updates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_updates =
       option_of_yojson (value_for_key service_update_list_of_yojson "ServiceUpdates") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_service_updates_response)

let cluster_name_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let describe_service_updates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     status =
       option_of_yojson (value_for_key service_update_status_list_of_yojson "Status") _list path;
     cluster_names =
       option_of_yojson (value_for_key cluster_name_list_of_yojson "ClusterNames") _list path;
     service_update_name =
       option_of_yojson (value_for_key string__of_yojson "ServiceUpdateName") _list path;
   }
    : describe_service_updates_request)

let describe_reserved_nodes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reserved_nodes =
       option_of_yojson (value_for_key reserved_node_list_of_yojson "ReservedNodes") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_reserved_nodes_response)

let describe_reserved_nodes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     offering_type = option_of_yojson (value_for_key string__of_yojson "OfferingType") _list path;
     duration = option_of_yojson (value_for_key string__of_yojson "Duration") _list path;
     node_type = option_of_yojson (value_for_key string__of_yojson "NodeType") _list path;
     reserved_nodes_offering_id =
       option_of_yojson (value_for_key string__of_yojson "ReservedNodesOfferingId") _list path;
     reservation_id = option_of_yojson (value_for_key string__of_yojson "ReservationId") _list path;
   }
    : describe_reserved_nodes_request)

let describe_reserved_nodes_offerings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reserved_nodes_offerings =
       option_of_yojson
         (value_for_key reserved_nodes_offering_list_of_yojson "ReservedNodesOfferings")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_reserved_nodes_offerings_response)

let describe_reserved_nodes_offerings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     offering_type = option_of_yojson (value_for_key string__of_yojson "OfferingType") _list path;
     duration = option_of_yojson (value_for_key string__of_yojson "Duration") _list path;
     node_type = option_of_yojson (value_for_key string__of_yojson "NodeType") _list path;
     reserved_nodes_offering_id =
       option_of_yojson (value_for_key string__of_yojson "ReservedNodesOfferingId") _list path;
   }
    : describe_reserved_nodes_offerings_request)

let describe_parameters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameters_list_of_yojson "Parameters") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_parameters_response)

let describe_parameters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     parameter_group_name = value_for_key string__of_yojson "ParameterGroupName" _list path;
   }
    : describe_parameters_request)

let describe_parameter_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_groups =
       option_of_yojson (value_for_key parameter_group_list_of_yojson "ParameterGroups") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_parameter_groups_response)

let describe_parameter_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupName") _list path;
   }
    : describe_parameter_groups_request)

let describe_multi_region_parameters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_region_parameters =
       option_of_yojson
         (value_for_key multi_region_parameters_list_of_yojson "MultiRegionParameters")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_multi_region_parameters_response)

let describe_multi_region_parameters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     source = option_of_yojson (value_for_key string__of_yojson "Source") _list path;
     multi_region_parameter_group_name =
       value_for_key string__of_yojson "MultiRegionParameterGroupName" _list path;
   }
    : describe_multi_region_parameters_request)

let describe_multi_region_parameter_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_region_parameter_groups =
       option_of_yojson
         (value_for_key multi_region_parameter_group_list_of_yojson "MultiRegionParameterGroups")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_multi_region_parameter_groups_response)

let describe_multi_region_parameter_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     multi_region_parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "MultiRegionParameterGroupName") _list path;
   }
    : describe_multi_region_parameter_groups_request)

let describe_multi_region_clusters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_region_clusters =
       option_of_yojson
         (value_for_key multi_region_cluster_list_of_yojson "MultiRegionClusters")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_multi_region_clusters_response)

let describe_multi_region_clusters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     show_cluster_details =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ShowClusterDetails") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     multi_region_cluster_name =
       option_of_yojson (value_for_key string__of_yojson "MultiRegionClusterName") _list path;
   }
    : describe_multi_region_clusters_request)

let describe_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events = option_of_yojson (value_for_key event_list_of_yojson "Events") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_events_response)

let describe_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     duration = option_of_yojson (value_for_key integer_optional_of_yojson "Duration") _list path;
     end_time = option_of_yojson (value_for_key t_stamp_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key t_stamp_of_yojson "StartTime") _list path;
     source_type = option_of_yojson (value_for_key source_type_of_yojson "SourceType") _list path;
     source_name = option_of_yojson (value_for_key string__of_yojson "SourceName") _list path;
   }
    : describe_events_request)

let describe_engine_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engine_versions =
       option_of_yojson
         (value_for_key engine_version_info_list_of_yojson "EngineVersions")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_engine_versions_response)

let describe_engine_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_only = option_of_yojson (value_for_key boolean__of_yojson "DefaultOnly") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     parameter_group_family =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupFamily") _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
   }
    : describe_engine_versions_request)

let cluster_list_of_yojson tree path = list_of_yojson cluster_of_yojson tree path

let describe_clusters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clusters = option_of_yojson (value_for_key cluster_list_of_yojson "Clusters") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_clusters_response)

let describe_clusters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     show_shard_details =
       option_of_yojson (value_for_key boolean_optional_of_yojson "ShowShardDetails") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     cluster_name = option_of_yojson (value_for_key string__of_yojson "ClusterName") _list path;
   }
    : describe_clusters_request)

let acl_list_of_yojson tree path = list_of_yojson ac_l_of_yojson tree path

let describe_ac_ls_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     ac_ls = option_of_yojson (value_for_key acl_list_of_yojson "ACLs") _list path;
   }
    : describe_ac_ls_response)

let describe_ac_ls_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     acl_name = option_of_yojson (value_for_key string__of_yojson "ACLName") _list path;
   }
    : describe_ac_ls_request)

let delete_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user = option_of_yojson (value_for_key user_of_yojson "User") _list path }
    : delete_user_response)

let delete_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_name = value_for_key user_name_of_yojson "UserName" _list path } : delete_user_request)

let delete_subnet_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_group = option_of_yojson (value_for_key subnet_group_of_yojson "SubnetGroup") _list path;
   }
    : delete_subnet_group_response)

let delete_subnet_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ subnet_group_name = value_for_key string__of_yojson "SubnetGroupName" _list path }
    : delete_subnet_group_request)

let delete_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot = option_of_yojson (value_for_key snapshot_of_yojson "Snapshot") _list path }
    : delete_snapshot_response)

let delete_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot_name = value_for_key string__of_yojson "SnapshotName" _list path }
    : delete_snapshot_request)

let delete_parameter_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_group =
       option_of_yojson (value_for_key parameter_group_of_yojson "ParameterGroup") _list path;
   }
    : delete_parameter_group_response)

let delete_parameter_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ parameter_group_name = value_for_key string__of_yojson "ParameterGroupName" _list path }
    : delete_parameter_group_request)

let delete_multi_region_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_region_cluster =
       option_of_yojson
         (value_for_key multi_region_cluster_of_yojson "MultiRegionCluster")
         _list path;
   }
    : delete_multi_region_cluster_response)

let delete_multi_region_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_region_cluster_name = value_for_key string__of_yojson "MultiRegionClusterName" _list path;
   }
    : delete_multi_region_cluster_request)

let delete_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : delete_cluster_response)

let delete_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     final_snapshot_name =
       option_of_yojson (value_for_key string__of_yojson "FinalSnapshotName") _list path;
     multi_region_cluster_name =
       option_of_yojson (value_for_key string__of_yojson "MultiRegionClusterName") _list path;
     cluster_name = value_for_key string__of_yojson "ClusterName" _list path;
   }
    : delete_cluster_request)

let delete_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ac_l = option_of_yojson (value_for_key ac_l_of_yojson "ACL") _list path }
    : delete_acl_response)

let delete_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ acl_name = value_for_key string__of_yojson "ACLName" _list path } : delete_acl_request)

let create_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user = option_of_yojson (value_for_key user_of_yojson "User") _list path }
    : create_user_response)

let create_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     access_string = value_for_key access_string_of_yojson "AccessString" _list path;
     authentication_mode =
       value_for_key authentication_mode_of_yojson "AuthenticationMode" _list path;
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
   }
    : create_user_request)

let create_subnet_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_group = option_of_yojson (value_for_key subnet_group_of_yojson "SubnetGroup") _list path;
   }
    : create_subnet_group_response)

let create_subnet_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     subnet_ids = value_for_key subnet_identifier_list_of_yojson "SubnetIds" _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     subnet_group_name = value_for_key string__of_yojson "SubnetGroupName" _list path;
   }
    : create_subnet_group_request)

let create_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot = option_of_yojson (value_for_key snapshot_of_yojson "Snapshot") _list path }
    : create_snapshot_response)

let create_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     snapshot_name = value_for_key string__of_yojson "SnapshotName" _list path;
     cluster_name = value_for_key string__of_yojson "ClusterName" _list path;
   }
    : create_snapshot_request)

let create_parameter_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_group =
       option_of_yojson (value_for_key parameter_group_of_yojson "ParameterGroup") _list path;
   }
    : create_parameter_group_response)

let create_parameter_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     family = value_for_key string__of_yojson "Family" _list path;
     parameter_group_name = value_for_key string__of_yojson "ParameterGroupName" _list path;
   }
    : create_parameter_group_request)

let create_multi_region_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_region_cluster =
       option_of_yojson
         (value_for_key multi_region_cluster_of_yojson "MultiRegionCluster")
         _list path;
   }
    : create_multi_region_cluster_response)

let create_multi_region_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     tls_enabled =
       option_of_yojson (value_for_key boolean_optional_of_yojson "TLSEnabled") _list path;
     num_shards = option_of_yojson (value_for_key integer_optional_of_yojson "NumShards") _list path;
     multi_region_parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "MultiRegionParameterGroupName") _list path;
     node_type = value_for_key string__of_yojson "NodeType" _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     multi_region_cluster_name_suffix =
       value_for_key string__of_yojson "MultiRegionClusterNameSuffix" _list path;
   }
    : create_multi_region_cluster_request)

let create_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : create_cluster_response)

let create_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_discovery = option_of_yojson (value_for_key ip_discovery_of_yojson "IpDiscovery") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
     data_tiering =
       option_of_yojson (value_for_key boolean_optional_of_yojson "DataTiering") _list path;
     auto_minor_version_upgrade =
       option_of_yojson
         (value_for_key boolean_optional_of_yojson "AutoMinorVersionUpgrade")
         _list path;
     engine_version = option_of_yojson (value_for_key string__of_yojson "EngineVersion") _list path;
     engine = option_of_yojson (value_for_key string__of_yojson "Engine") _list path;
     acl_name = value_for_key acl_name_of_yojson "ACLName" _list path;
     snapshot_window =
       option_of_yojson (value_for_key string__of_yojson "SnapshotWindow") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     snapshot_retention_limit =
       option_of_yojson
         (value_for_key integer_optional_of_yojson "SnapshotRetentionLimit")
         _list path;
     snapshot_name = option_of_yojson (value_for_key string__of_yojson "SnapshotName") _list path;
     snapshot_arns =
       option_of_yojson (value_for_key snapshot_arns_list_of_yojson "SnapshotArns") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     tls_enabled =
       option_of_yojson (value_for_key boolean_optional_of_yojson "TLSEnabled") _list path;
     sns_topic_arn = option_of_yojson (value_for_key string__of_yojson "SnsTopicArn") _list path;
     port = option_of_yojson (value_for_key integer_optional_of_yojson "Port") _list path;
     maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "MaintenanceWindow") _list path;
     security_group_ids =
       option_of_yojson
         (value_for_key security_group_ids_list_of_yojson "SecurityGroupIds")
         _list path;
     subnet_group_name =
       option_of_yojson (value_for_key string__of_yojson "SubnetGroupName") _list path;
     num_replicas_per_shard =
       option_of_yojson (value_for_key integer_optional_of_yojson "NumReplicasPerShard") _list path;
     num_shards = option_of_yojson (value_for_key integer_optional_of_yojson "NumShards") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupName") _list path;
     multi_region_cluster_name =
       option_of_yojson (value_for_key string__of_yojson "MultiRegionClusterName") _list path;
     node_type = value_for_key string__of_yojson "NodeType" _list path;
     cluster_name = value_for_key string__of_yojson "ClusterName" _list path;
   }
    : create_cluster_request)

let cluster_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : cluster_already_exists_fault)

let create_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ac_l = option_of_yojson (value_for_key ac_l_of_yojson "ACL") _list path }
    : create_acl_response)

let create_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     user_names =
       option_of_yojson (value_for_key user_name_list_input_of_yojson "UserNames") _list path;
     acl_name = value_for_key string__of_yojson "ACLName" _list path;
   }
    : create_acl_request)

let acl_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : acl_quota_exceeded_fault)

let acl_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : acl_already_exists_fault)

let copy_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot = option_of_yojson (value_for_key snapshot_of_yojson "Snapshot") _list path }
    : copy_snapshot_response)

let copy_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     target_bucket =
       option_of_yojson (value_for_key target_bucket_of_yojson "TargetBucket") _list path;
     target_snapshot_name = value_for_key string__of_yojson "TargetSnapshotName" _list path;
     source_snapshot_name = value_for_key string__of_yojson "SourceSnapshotName" _list path;
   }
    : copy_snapshot_request)

let batch_update_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unprocessed_clusters =
       option_of_yojson
         (value_for_key unprocessed_cluster_list_of_yojson "UnprocessedClusters")
         _list path;
     processed_clusters =
       option_of_yojson (value_for_key cluster_list_of_yojson "ProcessedClusters") _list path;
   }
    : batch_update_cluster_response)

let batch_update_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_update =
       option_of_yojson (value_for_key service_update_request_of_yojson "ServiceUpdate") _list path;
     cluster_names = value_for_key cluster_name_list_of_yojson "ClusterNames" _list path;
   }
    : batch_update_cluster_request)
