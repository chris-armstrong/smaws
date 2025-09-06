open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson

let subnet_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_availability_zone =
       option_of_yojson (value_for_key string__of_yojson "SubnetAvailabilityZone") _list path;
     subnet_identifier =
       option_of_yojson (value_for_key string__of_yojson "SubnetIdentifier") _list path;
   }
    : subnet)

let subnet_list_of_yojson tree path = list_of_yojson subnet_of_yojson tree path

let subnet_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnets = option_of_yojson (value_for_key subnet_list_of_yojson "Subnets") _list path;
     vpc_id = option_of_yojson (value_for_key string__of_yojson "VpcId") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     subnet_group_name =
       option_of_yojson (value_for_key string__of_yojson "SubnetGroupName") _list path;
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

let exception_message_of_yojson = string_of_yojson

let subnet_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : subnet_quota_exceeded_fault)

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

let parameter_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupName") _list path;
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

let aws_query_error_message_of_yojson = string_of_yojson

let invalid_parameter_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key aws_query_error_message_of_yojson "message") _list path;
   }
    : invalid_parameter_value_exception)

let invalid_parameter_group_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_parameter_group_state_fault)

let invalid_parameter_combination_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key aws_query_error_message_of_yojson "message") _list path;
   }
    : invalid_parameter_combination_exception)

let integer_optional_of_yojson = int_of_yojson
let integer__of_yojson = int_of_yojson

let endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ur_l = option_of_yojson (value_for_key string__of_yojson "URL") _list path;
     port = option_of_yojson (value_for_key integer__of_yojson "Port") _list path;
     address = option_of_yojson (value_for_key string__of_yojson "Address") _list path;
   }
    : endpoint)

let node_identifier_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
let t_stamp_of_yojson = timestamp_epoch_seconds_of_yojson

let node_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_group_status =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupStatus") _list path;
     node_status = option_of_yojson (value_for_key string__of_yojson "NodeStatus") _list path;
     availability_zone =
       option_of_yojson (value_for_key string__of_yojson "AvailabilityZone") _list path;
     node_create_time =
       option_of_yojson (value_for_key t_stamp_of_yojson "NodeCreateTime") _list path;
     endpoint = option_of_yojson (value_for_key endpoint_of_yojson "Endpoint") _list path;
     node_id = option_of_yojson (value_for_key string__of_yojson "NodeId") _list path;
   }
    : node)

let node_list_of_yojson tree path = list_of_yojson node_of_yojson tree path

let notification_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     topic_status = option_of_yojson (value_for_key string__of_yojson "TopicStatus") _list path;
     topic_arn = option_of_yojson (value_for_key string__of_yojson "TopicArn") _list path;
   }
    : notification_configuration)

let security_group_membership_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     security_group_identifier =
       option_of_yojson (value_for_key string__of_yojson "SecurityGroupIdentifier") _list path;
   }
    : security_group_membership)

let security_group_membership_list_of_yojson tree path =
  list_of_yojson security_group_membership_of_yojson tree path

let parameter_group_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     node_ids_to_reboot =
       option_of_yojson (value_for_key node_identifier_list_of_yojson "NodeIdsToReboot") _list path;
     parameter_apply_status =
       option_of_yojson (value_for_key string__of_yojson "ParameterApplyStatus") _list path;
     parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupName") _list path;
   }
    : parameter_group_status)

let base_unit_of_yojson = unit_of_yojson

let sse_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISABLED" -> DISABLED
    | `String "DISABLING" -> DISABLING
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SSEStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SSEStatus")
     : sse_status)
    : sse_status)

let sse_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key sse_status_of_yojson "Status") _list path }
    : sse_description)

let cluster_endpoint_encryption_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TLS" -> TLS
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ClusterEndpointEncryptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterEndpointEncryptionType")
     : cluster_endpoint_encryption_type)
    : cluster_endpoint_encryption_type)

let cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_endpoint_encryption_type =
       option_of_yojson
         (value_for_key cluster_endpoint_encryption_type_of_yojson "ClusterEndpointEncryptionType")
         _list path;
     sse_description =
       option_of_yojson (value_for_key sse_description_of_yojson "SSEDescription") _list path;
     parameter_group =
       option_of_yojson (value_for_key parameter_group_status_of_yojson "ParameterGroup") _list path;
     iam_role_arn = option_of_yojson (value_for_key string__of_yojson "IamRoleArn") _list path;
     security_groups =
       option_of_yojson
         (value_for_key security_group_membership_list_of_yojson "SecurityGroups")
         _list path;
     subnet_group = option_of_yojson (value_for_key string__of_yojson "SubnetGroup") _list path;
     notification_configuration =
       option_of_yojson
         (value_for_key notification_configuration_of_yojson "NotificationConfiguration")
         _list path;
     preferred_maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "PreferredMaintenanceWindow") _list path;
     nodes = option_of_yojson (value_for_key node_list_of_yojson "Nodes") _list path;
     node_ids_to_remove =
       option_of_yojson (value_for_key node_identifier_list_of_yojson "NodeIdsToRemove") _list path;
     cluster_discovery_endpoint =
       option_of_yojson (value_for_key endpoint_of_yojson "ClusterDiscoveryEndpoint") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     node_type = option_of_yojson (value_for_key string__of_yojson "NodeType") _list path;
     active_nodes =
       option_of_yojson (value_for_key integer_optional_of_yojson "ActiveNodes") _list path;
     total_nodes =
       option_of_yojson (value_for_key integer_optional_of_yojson "TotalNodes") _list path;
     cluster_arn = option_of_yojson (value_for_key string__of_yojson "ClusterArn") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     cluster_name = option_of_yojson (value_for_key string__of_yojson "ClusterName") _list path;
   }
    : cluster)

let update_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : update_cluster_response)

let security_group_identifier_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let update_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_group_ids =
       option_of_yojson
         (value_for_key security_group_identifier_list_of_yojson "SecurityGroupIds")
         _list path;
     parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupName") _list path;
     notification_topic_status =
       option_of_yojson (value_for_key string__of_yojson "NotificationTopicStatus") _list path;
     notification_topic_arn =
       option_of_yojson (value_for_key string__of_yojson "NotificationTopicArn") _list path;
     preferred_maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "PreferredMaintenanceWindow") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     cluster_name = value_for_key string__of_yojson "ClusterName" _list path;
   }
    : update_cluster_request)

let invalid_cluster_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_cluster_state_fault)

let cluster_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : cluster_not_found_fault)

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
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : untag_resource_response)

let key_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key key_list_of_yojson "TagKeys" _list path;
     resource_name = value_for_key string__of_yojson "ResourceName" _list path;
   }
    : untag_resource_request)

let tag_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : tag_not_found_fault)

let invalid_arn_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_arn_fault)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : tag_resource_response)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_name = value_for_key string__of_yojson "ResourceName" _list path;
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

let subnet_group_name_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
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
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "SUBNET_GROUP" -> SUBNET_GROUP
    | `String "PARAMETER_GROUP" -> PARAMETER_GROUP
    | `String "CLUSTER" -> CLUSTER
    | `String value -> raise (deserialize_unknown_enum_value_error path "SourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceType")
     : source_type)
    : source_type)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let sse_enabled_of_yojson = bool_of_yojson

let sse_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ enabled = value_for_key sse_enabled_of_yojson "Enabled" _list path } : sse_specification)

let reboot_node_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : reboot_node_response)

let reboot_node_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     node_id = value_for_key string__of_yojson "NodeId" _list path;
     cluster_name = value_for_key string__of_yojson "ClusterName" _list path;
   }
    : reboot_node_request)

let node_not_found_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : node_not_found_fault)

let parameter_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NODE_TYPE_SPECIFIC" -> NODE_TYPE_SPECIFIC
    | `String "DEFAULT" -> DEFAULT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParameterType" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterType")
     : parameter_type)
    : parameter_type)

let node_type_specific_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     node_type = option_of_yojson (value_for_key string__of_yojson "NodeType") _list path;
   }
    : node_type_specific_value)

let node_type_specific_value_list_of_yojson tree path =
  list_of_yojson node_type_specific_value_of_yojson tree path

let is_modifiable_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CONDITIONAL" -> CONDITIONAL
    | `String "FALSE" -> FALSE
    | `String "TRUE" -> TRUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "IsModifiable" value)
    | _ -> raise (deserialize_wrong_type_error path "IsModifiable")
     : is_modifiable)
    : is_modifiable)

let change_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "REQUIRES_REBOOT" -> REQUIRES_REBOOT
    | `String "IMMEDIATE" -> IMMEDIATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChangeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ChangeType")
     : change_type)
    : change_type)

let parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_type = option_of_yojson (value_for_key change_type_of_yojson "ChangeType") _list path;
     is_modifiable =
       option_of_yojson (value_for_key is_modifiable_of_yojson "IsModifiable") _list path;
     allowed_values = option_of_yojson (value_for_key string__of_yojson "AllowedValues") _list path;
     data_type = option_of_yojson (value_for_key string__of_yojson "DataType") _list path;
     source = option_of_yojson (value_for_key string__of_yojson "Source") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     node_type_specific_values =
       option_of_yojson
         (value_for_key node_type_specific_value_list_of_yojson "NodeTypeSpecificValues")
         _list path;
     parameter_value =
       option_of_yojson (value_for_key string__of_yojson "ParameterValue") _list path;
     parameter_type =
       option_of_yojson (value_for_key parameter_type_of_yojson "ParameterType") _list path;
     parameter_name = option_of_yojson (value_for_key string__of_yojson "ParameterName") _list path;
   }
    : parameter)

let parameter_list_of_yojson tree path = list_of_yojson parameter_of_yojson tree path

let parameter_group_quota_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : parameter_group_quota_exceeded_fault)

let parameter_group_name_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
let parameter_group_list_of_yojson tree path = list_of_yojson parameter_group_of_yojson tree path

let parameter_group_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : parameter_group_already_exists_fault)

let node_quota_for_customer_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : node_quota_for_customer_exceeded_fault)

let node_quota_for_cluster_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : node_quota_for_cluster_exceeded_fault)

let list_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : list_tags_response)

let list_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     resource_name = value_for_key string__of_yojson "ResourceName" _list path;
   }
    : list_tags_request)

let invalid_vpc_network_state_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_vpc_network_state_fault)

let insufficient_cluster_capacity_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : insufficient_cluster_capacity_fault)

let increase_replication_factor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : increase_replication_factor_response)

let availability_zone_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let increase_replication_factor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     availability_zones =
       option_of_yojson
         (value_for_key availability_zone_list_of_yojson "AvailabilityZones")
         _list path;
     new_replication_factor = value_for_key integer__of_yojson "NewReplicationFactor" _list path;
     cluster_name = value_for_key string__of_yojson "ClusterName" _list path;
   }
    : increase_replication_factor_request)

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
     subnet_group_names =
       option_of_yojson
         (value_for_key subnet_group_name_list_of_yojson "SubnetGroupNames")
         _list path;
   }
    : describe_subnet_groups_request)

let describe_parameters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameter_list_of_yojson "Parameters") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_parameters_response)

let describe_parameters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     source = option_of_yojson (value_for_key string__of_yojson "Source") _list path;
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
     parameter_group_names =
       option_of_yojson
         (value_for_key parameter_group_name_list_of_yojson "ParameterGroupNames")
         _list path;
   }
    : describe_parameter_groups_request)

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

let describe_default_parameters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters = option_of_yojson (value_for_key parameter_list_of_yojson "Parameters") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_default_parameters_response)

let describe_default_parameters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
   }
    : describe_default_parameters_request)

let cluster_list_of_yojson tree path = list_of_yojson cluster_of_yojson tree path

let describe_clusters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clusters = option_of_yojson (value_for_key cluster_list_of_yojson "Clusters") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_clusters_response)

let cluster_name_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let describe_clusters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key integer_optional_of_yojson "MaxResults") _list path;
     cluster_names =
       option_of_yojson (value_for_key cluster_name_list_of_yojson "ClusterNames") _list path;
   }
    : describe_clusters_request)

let delete_subnet_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deletion_message =
       option_of_yojson (value_for_key string__of_yojson "DeletionMessage") _list path;
   }
    : delete_subnet_group_response)

let delete_subnet_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ subnet_group_name = value_for_key string__of_yojson "SubnetGroupName" _list path }
    : delete_subnet_group_request)

let delete_parameter_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deletion_message =
       option_of_yojson (value_for_key string__of_yojson "DeletionMessage") _list path;
   }
    : delete_parameter_group_response)

let delete_parameter_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ parameter_group_name = value_for_key string__of_yojson "ParameterGroupName" _list path }
    : delete_parameter_group_request)

let delete_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : delete_cluster_response)

let delete_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster_name = value_for_key string__of_yojson "ClusterName" _list path }
    : delete_cluster_request)

let decrease_replication_factor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : decrease_replication_factor_response)

let decrease_replication_factor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     node_ids_to_remove =
       option_of_yojson (value_for_key node_identifier_list_of_yojson "NodeIdsToRemove") _list path;
     availability_zones =
       option_of_yojson
         (value_for_key availability_zone_list_of_yojson "AvailabilityZones")
         _list path;
     new_replication_factor = value_for_key integer__of_yojson "NewReplicationFactor" _list path;
     cluster_name = value_for_key string__of_yojson "ClusterName" _list path;
   }
    : decrease_replication_factor_request)

let create_subnet_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_group = option_of_yojson (value_for_key subnet_group_of_yojson "SubnetGroup") _list path;
   }
    : create_subnet_group_response)

let create_subnet_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_ids = value_for_key subnet_identifier_list_of_yojson "SubnetIds" _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     subnet_group_name = value_for_key string__of_yojson "SubnetGroupName" _list path;
   }
    : create_subnet_group_request)

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
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     parameter_group_name = value_for_key string__of_yojson "ParameterGroupName" _list path;
   }
    : create_parameter_group_request)

let create_cluster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cluster = option_of_yojson (value_for_key cluster_of_yojson "Cluster") _list path }
    : create_cluster_response)

let create_cluster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cluster_endpoint_encryption_type =
       option_of_yojson
         (value_for_key cluster_endpoint_encryption_type_of_yojson "ClusterEndpointEncryptionType")
         _list path;
     sse_specification =
       option_of_yojson (value_for_key sse_specification_of_yojson "SSESpecification") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     parameter_group_name =
       option_of_yojson (value_for_key string__of_yojson "ParameterGroupName") _list path;
     iam_role_arn = value_for_key string__of_yojson "IamRoleArn" _list path;
     notification_topic_arn =
       option_of_yojson (value_for_key string__of_yojson "NotificationTopicArn") _list path;
     preferred_maintenance_window =
       option_of_yojson (value_for_key string__of_yojson "PreferredMaintenanceWindow") _list path;
     security_group_ids =
       option_of_yojson
         (value_for_key security_group_identifier_list_of_yojson "SecurityGroupIds")
         _list path;
     subnet_group_name =
       option_of_yojson (value_for_key string__of_yojson "SubnetGroupName") _list path;
     availability_zones =
       option_of_yojson
         (value_for_key availability_zone_list_of_yojson "AvailabilityZones")
         _list path;
     replication_factor = value_for_key integer__of_yojson "ReplicationFactor" _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     node_type = value_for_key string__of_yojson "NodeType" _list path;
     cluster_name = value_for_key string__of_yojson "ClusterName" _list path;
   }
    : create_cluster_request)

let cluster_quota_for_customer_exceeded_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : cluster_quota_for_customer_exceeded_fault)

let cluster_already_exists_fault_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : cluster_already_exists_fault)

let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson
let base_float_of_yojson = float_of_yojson
let base_double_of_yojson = double_of_yojson
let base_short_of_yojson = short_of_yojson
let base_blob_of_yojson = blob_of_yojson
let base_byte_of_yojson = byte_of_yojson
