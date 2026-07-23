open Smaws_Lib.Json.SerializeHelpers
open Types

let exception_message_to_yojson = string_to_yojson

let subnet_quota_exceeded_fault_to_yojson (x : subnet_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let subnet_not_allowed_fault_to_yojson (x : subnet_not_allowed_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let subnet_in_use_to_yojson (x : subnet_in_use) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let subnet_group_not_found_fault_to_yojson (x : subnet_group_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let service_linked_role_not_found_fault_to_yojson (x : service_linked_role_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_subnet_to_yojson (x : invalid_subnet) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let network_type_to_yojson (x : network_type) =
  match x with
  | IPV4 -> `String "ipv4"
  | IPV6 -> `String "ipv6"
  | DUAL_STACK -> `String "dual_stack"

let network_type_list_to_yojson tree = list_to_yojson network_type_to_yojson tree
let string__to_yojson = string_to_yojson

let subnet_to_yojson (x : subnet) =
  assoc_to_yojson
    [
      ("SubnetIdentifier", option_to_yojson string__to_yojson x.subnet_identifier);
      ("SubnetAvailabilityZone", option_to_yojson string__to_yojson x.subnet_availability_zone);
      ( "SupportedNetworkTypes",
        option_to_yojson network_type_list_to_yojson x.supported_network_types );
    ]

let subnet_list_to_yojson tree = list_to_yojson subnet_to_yojson tree

let subnet_group_to_yojson (x : subnet_group) =
  assoc_to_yojson
    [
      ("SubnetGroupName", option_to_yojson string__to_yojson x.subnet_group_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("VpcId", option_to_yojson string__to_yojson x.vpc_id);
      ("Subnets", option_to_yojson subnet_list_to_yojson x.subnets);
      ( "SupportedNetworkTypes",
        option_to_yojson network_type_list_to_yojson x.supported_network_types );
    ]

let update_subnet_group_response_to_yojson (x : update_subnet_group_response) =
  assoc_to_yojson [ ("SubnetGroup", option_to_yojson subnet_group_to_yojson x.subnet_group) ]

let subnet_identifier_list_to_yojson tree = list_to_yojson string__to_yojson tree

let update_subnet_group_request_to_yojson (x : update_subnet_group_request) =
  assoc_to_yojson
    [
      ("SubnetGroupName", Some (string__to_yojson x.subnet_group_name));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("SubnetIds", option_to_yojson subnet_identifier_list_to_yojson x.subnet_ids);
    ]

let parameter_group_not_found_fault_to_yojson (x : parameter_group_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let aws_query_error_message_to_yojson = string_to_yojson

let invalid_parameter_value_exception_to_yojson (x : invalid_parameter_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson aws_query_error_message_to_yojson x.message) ]

let invalid_parameter_group_state_fault_to_yojson (x : invalid_parameter_group_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_parameter_combination_exception_to_yojson (x : invalid_parameter_combination_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson aws_query_error_message_to_yojson x.message) ]

let parameter_group_to_yojson (x : parameter_group) =
  assoc_to_yojson
    [
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("Description", option_to_yojson string__to_yojson x.description);
    ]

let update_parameter_group_response_to_yojson (x : update_parameter_group_response) =
  assoc_to_yojson
    [ ("ParameterGroup", option_to_yojson parameter_group_to_yojson x.parameter_group) ]

let parameter_name_value_to_yojson (x : parameter_name_value) =
  assoc_to_yojson
    [
      ("ParameterName", option_to_yojson string__to_yojson x.parameter_name);
      ("ParameterValue", option_to_yojson string__to_yojson x.parameter_value);
    ]

let parameter_name_value_list_to_yojson tree = list_to_yojson parameter_name_value_to_yojson tree

let update_parameter_group_request_to_yojson (x : update_parameter_group_request) =
  assoc_to_yojson
    [
      ("ParameterGroupName", Some (string__to_yojson x.parameter_group_name));
      ("ParameterNameValues", Some (parameter_name_value_list_to_yojson x.parameter_name_values));
    ]

let invalid_cluster_state_fault_to_yojson (x : invalid_cluster_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let cluster_not_found_fault_to_yojson (x : cluster_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let cluster_endpoint_encryption_type_to_yojson (x : cluster_endpoint_encryption_type) =
  match x with NONE -> `String "NONE" | TLS -> `String "TLS"

let sse_status_to_yojson (x : sse_status) =
  match x with
  | ENABLING -> `String "ENABLING"
  | ENABLED -> `String "ENABLED"
  | DISABLING -> `String "DISABLING"
  | DISABLED -> `String "DISABLED"

let sse_description_to_yojson (x : sse_description) =
  assoc_to_yojson [ ("Status", option_to_yojson sse_status_to_yojson x.status) ]

let node_identifier_list_to_yojson tree = list_to_yojson string__to_yojson tree

let parameter_group_status_to_yojson (x : parameter_group_status) =
  assoc_to_yojson
    [
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("ParameterApplyStatus", option_to_yojson string__to_yojson x.parameter_apply_status);
      ("NodeIdsToReboot", option_to_yojson node_identifier_list_to_yojson x.node_ids_to_reboot);
    ]

let security_group_membership_to_yojson (x : security_group_membership) =
  assoc_to_yojson
    [
      ("SecurityGroupIdentifier", option_to_yojson string__to_yojson x.security_group_identifier);
      ("Status", option_to_yojson string__to_yojson x.status);
    ]

let security_group_membership_list_to_yojson tree =
  list_to_yojson security_group_membership_to_yojson tree

let notification_configuration_to_yojson (x : notification_configuration) =
  assoc_to_yojson
    [
      ("TopicArn", option_to_yojson string__to_yojson x.topic_arn);
      ("TopicStatus", option_to_yojson string__to_yojson x.topic_status);
    ]

let t_stamp_to_yojson = timestamp_epoch_seconds_to_yojson
let integer_to_yojson = int_to_yojson

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("Address", option_to_yojson string__to_yojson x.address);
      ("Port", option_to_yojson integer_to_yojson x.port);
      ("URL", option_to_yojson string__to_yojson x.ur_l);
    ]

let node_to_yojson (x : node) =
  assoc_to_yojson
    [
      ("NodeId", option_to_yojson string__to_yojson x.node_id);
      ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint);
      ("NodeCreateTime", option_to_yojson t_stamp_to_yojson x.node_create_time);
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("NodeStatus", option_to_yojson string__to_yojson x.node_status);
      ("ParameterGroupStatus", option_to_yojson string__to_yojson x.parameter_group_status);
    ]

let node_list_to_yojson tree = list_to_yojson node_to_yojson tree
let integer_optional_to_yojson = int_to_yojson

let cluster_to_yojson (x : cluster) =
  assoc_to_yojson
    [
      ("ClusterName", option_to_yojson string__to_yojson x.cluster_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ClusterArn", option_to_yojson string__to_yojson x.cluster_arn);
      ("TotalNodes", option_to_yojson integer_optional_to_yojson x.total_nodes);
      ("ActiveNodes", option_to_yojson integer_optional_to_yojson x.active_nodes);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("ClusterDiscoveryEndpoint", option_to_yojson endpoint_to_yojson x.cluster_discovery_endpoint);
      ("NodeIdsToRemove", option_to_yojson node_identifier_list_to_yojson x.node_ids_to_remove);
      ("Nodes", option_to_yojson node_list_to_yojson x.nodes);
      ( "PreferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ( "NotificationConfiguration",
        option_to_yojson notification_configuration_to_yojson x.notification_configuration );
      ("SubnetGroup", option_to_yojson string__to_yojson x.subnet_group);
      ("SecurityGroups", option_to_yojson security_group_membership_list_to_yojson x.security_groups);
      ("IamRoleArn", option_to_yojson string__to_yojson x.iam_role_arn);
      ("ParameterGroup", option_to_yojson parameter_group_status_to_yojson x.parameter_group);
      ("SSEDescription", option_to_yojson sse_description_to_yojson x.sse_description);
      ( "ClusterEndpointEncryptionType",
        option_to_yojson cluster_endpoint_encryption_type_to_yojson
          x.cluster_endpoint_encryption_type );
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
    ]

let update_cluster_response_to_yojson (x : update_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let security_group_identifier_list_to_yojson tree = list_to_yojson string__to_yojson tree

let update_cluster_request_to_yojson (x : update_cluster_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (string__to_yojson x.cluster_name));
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "PreferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ("NotificationTopicArn", option_to_yojson string__to_yojson x.notification_topic_arn);
      ("NotificationTopicStatus", option_to_yojson string__to_yojson x.notification_topic_status);
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ( "SecurityGroupIds",
        option_to_yojson security_group_identifier_list_to_yojson x.security_group_ids );
    ]

let tag_not_found_fault_to_yojson (x : tag_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_arn_fault_to_yojson (x : invalid_arn_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson string__to_yojson x.key);
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let untag_resource_response_to_yojson (x : untag_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let key_list_to_yojson tree = list_to_yojson string__to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceName", Some (string__to_yojson x.resource_name));
      ("TagKeys", Some (key_list_to_yojson x.tag_keys));
    ]

let tag_quota_per_resource_exceeded_to_yojson (x : tag_quota_per_resource_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let tag_resource_response_to_yojson (x : tag_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceName", Some (string__to_yojson x.resource_name));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let node_not_found_fault_to_yojson (x : node_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let reboot_node_response_to_yojson (x : reboot_node_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let reboot_node_request_to_yojson (x : reboot_node_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (string__to_yojson x.cluster_name));
      ("NodeId", Some (string__to_yojson x.node_id));
    ]

let list_tags_response_to_yojson (x : list_tags_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_tags_request_to_yojson (x : list_tags_request) =
  assoc_to_yojson
    [
      ("ResourceName", Some (string__to_yojson x.resource_name));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let node_quota_for_customer_exceeded_fault_to_yojson (x : node_quota_for_customer_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let node_quota_for_cluster_exceeded_fault_to_yojson (x : node_quota_for_cluster_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_vpc_network_state_fault_to_yojson (x : invalid_vpc_network_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let insufficient_cluster_capacity_fault_to_yojson (x : insufficient_cluster_capacity_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let increase_replication_factor_response_to_yojson (x : increase_replication_factor_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let availability_zone_list_to_yojson tree = list_to_yojson string__to_yojson tree

let increase_replication_factor_request_to_yojson (x : increase_replication_factor_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (string__to_yojson x.cluster_name));
      ("NewReplicationFactor", Some (integer_to_yojson x.new_replication_factor));
      ("AvailabilityZones", option_to_yojson availability_zone_list_to_yojson x.availability_zones);
    ]

let subnet_group_list_to_yojson tree = list_to_yojson subnet_group_to_yojson tree

let describe_subnet_groups_response_to_yojson (x : describe_subnet_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("SubnetGroups", option_to_yojson subnet_group_list_to_yojson x.subnet_groups);
    ]

let subnet_group_name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let describe_subnet_groups_request_to_yojson (x : describe_subnet_groups_request) =
  assoc_to_yojson
    [
      ("SubnetGroupNames", option_to_yojson subnet_group_name_list_to_yojson x.subnet_group_names);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let change_type_to_yojson (x : change_type) =
  match x with IMMEDIATE -> `String "IMMEDIATE" | REQUIRES_REBOOT -> `String "REQUIRES_REBOOT"

let is_modifiable_to_yojson (x : is_modifiable) =
  match x with
  | TRUE -> `String "TRUE"
  | FALSE -> `String "FALSE"
  | CONDITIONAL -> `String "CONDITIONAL"

let node_type_specific_value_to_yojson (x : node_type_specific_value) =
  assoc_to_yojson
    [
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let node_type_specific_value_list_to_yojson tree =
  list_to_yojson node_type_specific_value_to_yojson tree

let parameter_type_to_yojson (x : parameter_type) =
  match x with DEFAULT -> `String "DEFAULT" | NODE_TYPE_SPECIFIC -> `String "NODE_TYPE_SPECIFIC"

let parameter_to_yojson (x : parameter) =
  assoc_to_yojson
    [
      ("ParameterName", option_to_yojson string__to_yojson x.parameter_name);
      ("ParameterType", option_to_yojson parameter_type_to_yojson x.parameter_type);
      ("ParameterValue", option_to_yojson string__to_yojson x.parameter_value);
      ( "NodeTypeSpecificValues",
        option_to_yojson node_type_specific_value_list_to_yojson x.node_type_specific_values );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Source", option_to_yojson string__to_yojson x.source);
      ("DataType", option_to_yojson string__to_yojson x.data_type);
      ("AllowedValues", option_to_yojson string__to_yojson x.allowed_values);
      ("IsModifiable", option_to_yojson is_modifiable_to_yojson x.is_modifiable);
      ("ChangeType", option_to_yojson change_type_to_yojson x.change_type);
    ]

let parameter_list_to_yojson tree = list_to_yojson parameter_to_yojson tree

let describe_parameters_response_to_yojson (x : describe_parameters_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Parameters", option_to_yojson parameter_list_to_yojson x.parameters);
    ]

let describe_parameters_request_to_yojson (x : describe_parameters_request) =
  assoc_to_yojson
    [
      ("ParameterGroupName", Some (string__to_yojson x.parameter_group_name));
      ("Source", option_to_yojson string__to_yojson x.source);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let parameter_group_list_to_yojson tree = list_to_yojson parameter_group_to_yojson tree

let describe_parameter_groups_response_to_yojson (x : describe_parameter_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ParameterGroups", option_to_yojson parameter_group_list_to_yojson x.parameter_groups);
    ]

let parameter_group_name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let describe_parameter_groups_request_to_yojson (x : describe_parameter_groups_request) =
  assoc_to_yojson
    [
      ( "ParameterGroupNames",
        option_to_yojson parameter_group_name_list_to_yojson x.parameter_group_names );
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let source_type_to_yojson (x : source_type) =
  match x with
  | CLUSTER -> `String "CLUSTER"
  | PARAMETER_GROUP -> `String "PARAMETER_GROUP"
  | SUBNET_GROUP -> `String "SUBNET_GROUP"

let event_to_yojson (x : event) =
  assoc_to_yojson
    [
      ("SourceName", option_to_yojson string__to_yojson x.source_name);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Date", option_to_yojson t_stamp_to_yojson x.date);
    ]

let event_list_to_yojson tree = list_to_yojson event_to_yojson tree

let describe_events_response_to_yojson (x : describe_events_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Events", option_to_yojson event_list_to_yojson x.events);
    ]

let describe_events_request_to_yojson (x : describe_events_request) =
  assoc_to_yojson
    [
      ("SourceName", option_to_yojson string__to_yojson x.source_name);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("StartTime", option_to_yojson t_stamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson t_stamp_to_yojson x.end_time);
      ("Duration", option_to_yojson integer_optional_to_yojson x.duration);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_default_parameters_response_to_yojson (x : describe_default_parameters_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Parameters", option_to_yojson parameter_list_to_yojson x.parameters);
    ]

let describe_default_parameters_request_to_yojson (x : describe_default_parameters_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let cluster_list_to_yojson tree = list_to_yojson cluster_to_yojson tree

let describe_clusters_response_to_yojson (x : describe_clusters_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Clusters", option_to_yojson cluster_list_to_yojson x.clusters);
    ]

let cluster_name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let describe_clusters_request_to_yojson (x : describe_clusters_request) =
  assoc_to_yojson
    [
      ("ClusterNames", option_to_yojson cluster_name_list_to_yojson x.cluster_names);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let subnet_group_in_use_fault_to_yojson (x : subnet_group_in_use_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let delete_subnet_group_response_to_yojson (x : delete_subnet_group_response) =
  assoc_to_yojson [ ("DeletionMessage", option_to_yojson string__to_yojson x.deletion_message) ]

let delete_subnet_group_request_to_yojson (x : delete_subnet_group_request) =
  assoc_to_yojson [ ("SubnetGroupName", Some (string__to_yojson x.subnet_group_name)) ]

let delete_parameter_group_response_to_yojson (x : delete_parameter_group_response) =
  assoc_to_yojson [ ("DeletionMessage", option_to_yojson string__to_yojson x.deletion_message) ]

let delete_parameter_group_request_to_yojson (x : delete_parameter_group_request) =
  assoc_to_yojson [ ("ParameterGroupName", Some (string__to_yojson x.parameter_group_name)) ]

let delete_cluster_response_to_yojson (x : delete_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let delete_cluster_request_to_yojson (x : delete_cluster_request) =
  assoc_to_yojson [ ("ClusterName", Some (string__to_yojson x.cluster_name)) ]

let decrease_replication_factor_response_to_yojson (x : decrease_replication_factor_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let decrease_replication_factor_request_to_yojson (x : decrease_replication_factor_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (string__to_yojson x.cluster_name));
      ("NewReplicationFactor", Some (integer_to_yojson x.new_replication_factor));
      ("AvailabilityZones", option_to_yojson availability_zone_list_to_yojson x.availability_zones);
      ("NodeIdsToRemove", option_to_yojson node_identifier_list_to_yojson x.node_ids_to_remove);
    ]

let subnet_group_quota_exceeded_fault_to_yojson (x : subnet_group_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let subnet_group_already_exists_fault_to_yojson (x : subnet_group_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_subnet_group_response_to_yojson (x : create_subnet_group_response) =
  assoc_to_yojson [ ("SubnetGroup", option_to_yojson subnet_group_to_yojson x.subnet_group) ]

let create_subnet_group_request_to_yojson (x : create_subnet_group_request) =
  assoc_to_yojson
    [
      ("SubnetGroupName", Some (string__to_yojson x.subnet_group_name));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("SubnetIds", Some (subnet_identifier_list_to_yojson x.subnet_ids));
    ]

let parameter_group_quota_exceeded_fault_to_yojson (x : parameter_group_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let parameter_group_already_exists_fault_to_yojson (x : parameter_group_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_parameter_group_response_to_yojson (x : create_parameter_group_response) =
  assoc_to_yojson
    [ ("ParameterGroup", option_to_yojson parameter_group_to_yojson x.parameter_group) ]

let create_parameter_group_request_to_yojson (x : create_parameter_group_request) =
  assoc_to_yojson
    [
      ("ParameterGroupName", Some (string__to_yojson x.parameter_group_name));
      ("Description", option_to_yojson string__to_yojson x.description);
    ]

let service_quota_exceeded_exception_to_yojson = unit_to_yojson

let cluster_quota_for_customer_exceeded_fault_to_yojson
    (x : cluster_quota_for_customer_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let cluster_already_exists_fault_to_yojson (x : cluster_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_cluster_response_to_yojson (x : create_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let sse_enabled_to_yojson = bool_to_yojson

let sse_specification_to_yojson (x : sse_specification) =
  assoc_to_yojson [ ("Enabled", Some (sse_enabled_to_yojson x.enabled)) ]

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (string__to_yojson x.cluster_name));
      ("NodeType", Some (string__to_yojson x.node_type));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ReplicationFactor", Some (integer_to_yojson x.replication_factor));
      ("AvailabilityZones", option_to_yojson availability_zone_list_to_yojson x.availability_zones);
      ("SubnetGroupName", option_to_yojson string__to_yojson x.subnet_group_name);
      ( "SecurityGroupIds",
        option_to_yojson security_group_identifier_list_to_yojson x.security_group_ids );
      ( "PreferredMaintenanceWindow",
        option_to_yojson string__to_yojson x.preferred_maintenance_window );
      ("NotificationTopicArn", option_to_yojson string__to_yojson x.notification_topic_arn);
      ("IamRoleArn", Some (string__to_yojson x.iam_role_arn));
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SSESpecification", option_to_yojson sse_specification_to_yojson x.sse_specification);
      ( "ClusterEndpointEncryptionType",
        option_to_yojson cluster_endpoint_encryption_type_to_yojson
          x.cluster_endpoint_encryption_type );
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
    ]
