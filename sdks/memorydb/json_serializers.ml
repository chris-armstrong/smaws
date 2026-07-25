open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson
let acl_cluster_name_list_to_yojson tree = list_to_yojson string__to_yojson tree
let user_name_to_yojson = string_to_yojson
let user_name_list_to_yojson tree = list_to_yojson user_name_to_yojson tree

let acl_pending_changes_to_yojson (x : acl_pending_changes) =
  assoc_to_yojson
    [
      ("UserNamesToRemove", option_to_yojson user_name_list_to_yojson x.user_names_to_remove);
      ("UserNamesToAdd", option_to_yojson user_name_list_to_yojson x.user_names_to_add);
    ]

let ac_l_to_yojson (x : ac_l) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("UserNames", option_to_yojson user_name_list_to_yojson x.user_names);
      ("MinimumEngineVersion", option_to_yojson string__to_yojson x.minimum_engine_version);
      ("PendingChanges", option_to_yojson acl_pending_changes_to_yojson x.pending_changes);
      ("Clusters", option_to_yojson acl_cluster_name_list_to_yojson x.clusters);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
    ]

let exception_message_to_yojson = string_to_yojson

let acl_already_exists_fault_to_yojson (x : acl_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let acl_list_to_yojson tree = list_to_yojson ac_l_to_yojson tree
let acl_name_to_yojson = string_to_yojson
let acl_name_list_to_yojson tree = list_to_yojson acl_name_to_yojson tree

let acl_not_found_fault_to_yojson (x : acl_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let acl_quota_exceeded_fault_to_yojson (x : acl_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let ac_ls_update_status_to_yojson (x : ac_ls_update_status) =
  assoc_to_yojson [ ("ACLToApply", option_to_yojson acl_name_to_yojson x.acl_to_apply) ]

let api_call_rate_for_customer_exceeded_fault_to_yojson
    (x : api_call_rate_for_customer_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let az_status_to_yojson (x : az_status) =
  match x with SingleAZ -> `String "singleaz" | MultiAZ -> `String "multiaz"

let access_string_to_yojson = string_to_yojson

let user_not_found_fault_to_yojson (x : user_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_user_state_fault_to_yojson (x : invalid_user_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let aws_query_error_message_to_yojson = string_to_yojson

let invalid_parameter_value_exception_to_yojson (x : invalid_parameter_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson aws_query_error_message_to_yojson x.message) ]

let invalid_parameter_combination_exception_to_yojson (x : invalid_parameter_combination_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson aws_query_error_message_to_yojson x.message) ]

let integer_optional_to_yojson = int_to_yojson

let authentication_type_to_yojson (x : authentication_type) =
  match x with
  | PASSWORD -> `String "password"
  | NO_PASSWORD -> `String "no-password"
  | IAM -> `String "iam"

let authentication_to_yojson (x : authentication) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson authentication_type_to_yojson x.type_);
      ("PasswordCount", option_to_yojson integer_optional_to_yojson x.password_count);
    ]

let user_to_yojson (x : user) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("AccessString", option_to_yojson string__to_yojson x.access_string);
      ("ACLNames", option_to_yojson acl_name_list_to_yojson x.acl_names);
      ("MinimumEngineVersion", option_to_yojson string__to_yojson x.minimum_engine_version);
      ("Authentication", option_to_yojson authentication_to_yojson x.authentication);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
    ]

let update_user_response_to_yojson (x : update_user_response) =
  assoc_to_yojson [ ("User", option_to_yojson user_to_yojson x.user) ]

let password_list_input_to_yojson tree = list_to_yojson string__to_yojson tree

let input_authentication_type_to_yojson (x : input_authentication_type) =
  match x with PASSWORD -> `String "password" | IAM -> `String "iam"

let authentication_mode_to_yojson (x : authentication_mode) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson input_authentication_type_to_yojson x.type_);
      ("Passwords", option_to_yojson password_list_input_to_yojson x.passwords);
    ]

let update_user_request_to_yojson (x : update_user_request) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("AuthenticationMode", option_to_yojson authentication_mode_to_yojson x.authentication_mode);
      ("AccessString", option_to_yojson access_string_to_yojson x.access_string);
    ]

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

let availability_zone_to_yojson (x : availability_zone) =
  assoc_to_yojson [ ("Name", option_to_yojson string__to_yojson x.name) ]

let subnet_to_yojson (x : subnet) =
  assoc_to_yojson
    [
      ("Identifier", option_to_yojson string__to_yojson x.identifier);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "SupportedNetworkTypes",
        option_to_yojson network_type_list_to_yojson x.supported_network_types );
    ]

let subnet_list_to_yojson tree = list_to_yojson subnet_to_yojson tree

let subnet_group_to_yojson (x : subnet_group) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("VpcId", option_to_yojson string__to_yojson x.vpc_id);
      ("Subnets", option_to_yojson subnet_list_to_yojson x.subnets);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
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

let invalid_parameter_group_state_fault_to_yojson (x : invalid_parameter_group_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let parameter_group_to_yojson (x : parameter_group) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Family", option_to_yojson string__to_yojson x.family);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
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

let multi_region_parameter_group_not_found_fault_to_yojson
    (x : multi_region_parameter_group_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let multi_region_cluster_not_found_fault_to_yojson (x : multi_region_cluster_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_multi_region_cluster_state_fault_to_yojson
    (x : invalid_multi_region_cluster_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let boolean_optional_to_yojson = bool_to_yojson

let regional_cluster_to_yojson (x : regional_cluster) =
  assoc_to_yojson
    [
      ("ClusterName", option_to_yojson string__to_yojson x.cluster_name);
      ("Region", option_to_yojson string__to_yojson x.region);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
    ]

let regional_cluster_list_to_yojson tree = list_to_yojson regional_cluster_to_yojson tree

let multi_region_cluster_to_yojson (x : multi_region_cluster) =
  assoc_to_yojson
    [
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("NumberOfShards", option_to_yojson integer_optional_to_yojson x.number_of_shards);
      ("Clusters", option_to_yojson regional_cluster_list_to_yojson x.clusters);
      ( "MultiRegionParameterGroupName",
        option_to_yojson string__to_yojson x.multi_region_parameter_group_name );
      ("TLSEnabled", option_to_yojson boolean_optional_to_yojson x.tls_enabled);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
    ]

let update_multi_region_cluster_response_to_yojson (x : update_multi_region_cluster_response) =
  assoc_to_yojson
    [
      ("MultiRegionCluster", option_to_yojson multi_region_cluster_to_yojson x.multi_region_cluster);
    ]

let update_strategy_to_yojson (x : update_strategy) =
  match x with COORDINATED -> `String "coordinated" | UNCOORDINATED -> `String "uncoordinated"

let integer_to_yojson = int_to_yojson

let shard_configuration_request_to_yojson (x : shard_configuration_request) =
  assoc_to_yojson [ ("ShardCount", option_to_yojson integer_to_yojson x.shard_count) ]

let update_multi_region_cluster_request_to_yojson (x : update_multi_region_cluster_request) =
  assoc_to_yojson
    [
      ("MultiRegionClusterName", Some (string__to_yojson x.multi_region_cluster_name));
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ( "ShardConfiguration",
        option_to_yojson shard_configuration_request_to_yojson x.shard_configuration );
      ( "MultiRegionParameterGroupName",
        option_to_yojson string__to_yojson x.multi_region_parameter_group_name );
      ("UpdateStrategy", option_to_yojson update_strategy_to_yojson x.update_strategy);
    ]

let shards_per_cluster_quota_exceeded_fault_to_yojson (x : shards_per_cluster_quota_exceeded_fault)
    =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let no_operation_fault_to_yojson (x : no_operation_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let node_quota_for_customer_exceeded_fault_to_yojson (x : node_quota_for_customer_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let node_quota_for_cluster_exceeded_fault_to_yojson (x : node_quota_for_cluster_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_vpc_network_state_fault_to_yojson (x : invalid_vpc_network_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_node_state_fault_to_yojson (x : invalid_node_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_kms_key_fault_to_yojson (x : invalid_kms_key_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_cluster_state_fault_to_yojson (x : invalid_cluster_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_acl_state_fault_to_yojson (x : invalid_acl_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let cluster_quota_for_customer_exceeded_fault_to_yojson
    (x : cluster_quota_for_customer_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let cluster_not_found_fault_to_yojson (x : cluster_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let ip_discovery_to_yojson (x : ip_discovery) =
  match x with IPV4 -> `String "ipv4" | IPV6 -> `String "ipv6"

let data_tiering_status_to_yojson (x : data_tiering_status) =
  match x with TRUE -> `String "true" | FALSE -> `String "false"

let security_group_membership_to_yojson (x : security_group_membership) =
  assoc_to_yojson
    [
      ("SecurityGroupId", option_to_yojson string__to_yojson x.security_group_id);
      ("Status", option_to_yojson string__to_yojson x.status);
    ]

let security_group_membership_list_to_yojson tree =
  list_to_yojson security_group_membership_to_yojson tree

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("Address", option_to_yojson string__to_yojson x.address);
      ("Port", option_to_yojson integer_to_yojson x.port);
    ]

let t_stamp_to_yojson = timestamp_epoch_seconds_to_yojson

let node_to_yojson (x : node) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("CreateTime", option_to_yojson t_stamp_to_yojson x.create_time);
      ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint);
    ]

let node_list_to_yojson tree = list_to_yojson node_to_yojson tree

let shard_to_yojson (x : shard) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Slots", option_to_yojson string__to_yojson x.slots);
      ("Nodes", option_to_yojson node_list_to_yojson x.nodes);
      ("NumberOfNodes", option_to_yojson integer_optional_to_yojson x.number_of_nodes);
    ]

let shard_list_to_yojson tree = list_to_yojson shard_to_yojson tree

let service_update_status_to_yojson (x : service_update_status) =
  match x with
  | NOT_APPLIED -> `String "available"
  | IN_PROGRESS -> `String "in-progress"
  | COMPLETE -> `String "complete"
  | SCHEDULED -> `String "scheduled"

let pending_modified_service_update_to_yojson (x : pending_modified_service_update) =
  assoc_to_yojson
    [
      ("ServiceUpdateName", option_to_yojson string__to_yojson x.service_update_name);
      ("Status", option_to_yojson service_update_status_to_yojson x.status);
    ]

let pending_modified_service_update_list_to_yojson tree =
  list_to_yojson pending_modified_service_update_to_yojson tree

let double_to_yojson = double_to_yojson

let slot_migration_to_yojson (x : slot_migration) =
  assoc_to_yojson
    [ ("ProgressPercentage", option_to_yojson double_to_yojson x.progress_percentage) ]

let resharding_status_to_yojson (x : resharding_status) =
  assoc_to_yojson [ ("SlotMigration", option_to_yojson slot_migration_to_yojson x.slot_migration) ]

let cluster_pending_updates_to_yojson (x : cluster_pending_updates) =
  assoc_to_yojson
    [
      ("Resharding", option_to_yojson resharding_status_to_yojson x.resharding);
      ("ACLs", option_to_yojson ac_ls_update_status_to_yojson x.ac_ls);
      ( "ServiceUpdates",
        option_to_yojson pending_modified_service_update_list_to_yojson x.service_updates );
    ]

let cluster_to_yojson (x : cluster) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("PendingUpdates", option_to_yojson cluster_pending_updates_to_yojson x.pending_updates);
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
      ("NumberOfShards", option_to_yojson integer_optional_to_yojson x.number_of_shards);
      ("Shards", option_to_yojson shard_list_to_yojson x.shards);
      ("AvailabilityMode", option_to_yojson az_status_to_yojson x.availability_mode);
      ("ClusterEndpoint", option_to_yojson endpoint_to_yojson x.cluster_endpoint);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("EnginePatchVersion", option_to_yojson string__to_yojson x.engine_patch_version);
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("ParameterGroupStatus", option_to_yojson string__to_yojson x.parameter_group_status);
      ("SecurityGroups", option_to_yojson security_group_membership_list_to_yojson x.security_groups);
      ("SubnetGroupName", option_to_yojson string__to_yojson x.subnet_group_name);
      ("TLSEnabled", option_to_yojson boolean_optional_to_yojson x.tls_enabled);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("SnsTopicStatus", option_to_yojson string__to_yojson x.sns_topic_status);
      ( "SnapshotRetentionLimit",
        option_to_yojson integer_optional_to_yojson x.snapshot_retention_limit );
      ("MaintenanceWindow", option_to_yojson string__to_yojson x.maintenance_window);
      ("SnapshotWindow", option_to_yojson string__to_yojson x.snapshot_window);
      ("ACLName", option_to_yojson acl_name_to_yojson x.acl_name);
      ( "AutoMinorVersionUpgrade",
        option_to_yojson boolean_optional_to_yojson x.auto_minor_version_upgrade );
      ("DataTiering", option_to_yojson data_tiering_status_to_yojson x.data_tiering);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ("IpDiscovery", option_to_yojson ip_discovery_to_yojson x.ip_discovery);
    ]

let update_cluster_response_to_yojson (x : update_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let replica_configuration_request_to_yojson (x : replica_configuration_request) =
  assoc_to_yojson [ ("ReplicaCount", option_to_yojson integer_to_yojson x.replica_count) ]

let security_group_ids_list_to_yojson tree = list_to_yojson string__to_yojson tree

let update_cluster_request_to_yojson (x : update_cluster_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (string__to_yojson x.cluster_name));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("SecurityGroupIds", option_to_yojson security_group_ids_list_to_yojson x.security_group_ids);
      ("MaintenanceWindow", option_to_yojson string__to_yojson x.maintenance_window);
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("SnsTopicStatus", option_to_yojson string__to_yojson x.sns_topic_status);
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("SnapshotWindow", option_to_yojson string__to_yojson x.snapshot_window);
      ( "SnapshotRetentionLimit",
        option_to_yojson integer_optional_to_yojson x.snapshot_retention_limit );
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ( "ReplicaConfiguration",
        option_to_yojson replica_configuration_request_to_yojson x.replica_configuration );
      ( "ShardConfiguration",
        option_to_yojson shard_configuration_request_to_yojson x.shard_configuration );
      ("ACLName", option_to_yojson acl_name_to_yojson x.acl_name);
      ("IpDiscovery", option_to_yojson ip_discovery_to_yojson x.ip_discovery);
    ]

let duplicate_user_name_fault_to_yojson (x : duplicate_user_name_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let default_user_required_to_yojson (x : default_user_required) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let update_acl_response_to_yojson (x : update_acl_response) =
  assoc_to_yojson [ ("ACL", option_to_yojson ac_l_to_yojson x.ac_l) ]

let user_name_list_input_to_yojson tree = list_to_yojson user_name_to_yojson tree

let update_acl_request_to_yojson (x : update_acl_request) =
  assoc_to_yojson
    [
      ("ACLName", Some (string__to_yojson x.acl_name));
      ("UserNamesToAdd", option_to_yojson user_name_list_input_to_yojson x.user_names_to_add);
      ("UserNamesToRemove", option_to_yojson user_name_list_input_to_yojson x.user_names_to_remove);
    ]

let tag_not_found_fault_to_yojson (x : tag_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let snapshot_not_found_fault_to_yojson (x : snapshot_not_found_fault) =
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
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let key_list_to_yojson tree = list_to_yojson string__to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
      ("TagKeys", Some (key_list_to_yojson x.tag_keys));
    ]

let tag_quota_per_resource_exceeded_to_yojson (x : tag_quota_per_resource_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let tag_resource_response_to_yojson (x : tag_resource_response) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let reset_parameter_group_response_to_yojson (x : reset_parameter_group_response) =
  assoc_to_yojson
    [ ("ParameterGroup", option_to_yojson parameter_group_to_yojson x.parameter_group) ]

let parameter_name_list_to_yojson tree = list_to_yojson string__to_yojson tree
let boolean__to_yojson = bool_to_yojson

let reset_parameter_group_request_to_yojson (x : reset_parameter_group_request) =
  assoc_to_yojson
    [
      ("ParameterGroupName", Some (string__to_yojson x.parameter_group_name));
      ("AllParameters", option_to_yojson boolean__to_yojson x.all_parameters);
      ("ParameterNames", option_to_yojson parameter_name_list_to_yojson x.parameter_names);
    ]

let reserved_nodes_offering_not_found_fault_to_yojson (x : reserved_nodes_offering_not_found_fault)
    =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let reserved_node_quota_exceeded_fault_to_yojson (x : reserved_node_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let reserved_node_already_exists_fault_to_yojson (x : reserved_node_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let recurring_charge_to_yojson (x : recurring_charge) =
  assoc_to_yojson
    [
      ("RecurringChargeAmount", option_to_yojson double_to_yojson x.recurring_charge_amount);
      ("RecurringChargeFrequency", option_to_yojson string__to_yojson x.recurring_charge_frequency);
    ]

let recurring_charge_list_to_yojson tree = list_to_yojson recurring_charge_to_yojson tree

let reserved_node_to_yojson (x : reserved_node) =
  assoc_to_yojson
    [
      ("ReservationId", option_to_yojson string__to_yojson x.reservation_id);
      ("ReservedNodesOfferingId", option_to_yojson string__to_yojson x.reserved_nodes_offering_id);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("StartTime", option_to_yojson t_stamp_to_yojson x.start_time);
      ("Duration", option_to_yojson integer_to_yojson x.duration);
      ("FixedPrice", option_to_yojson double_to_yojson x.fixed_price);
      ("NodeCount", option_to_yojson integer_to_yojson x.node_count);
      ("OfferingType", option_to_yojson string__to_yojson x.offering_type);
      ("State", option_to_yojson string__to_yojson x.state);
      ("RecurringCharges", option_to_yojson recurring_charge_list_to_yojson x.recurring_charges);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
    ]

let purchase_reserved_nodes_offering_response_to_yojson
    (x : purchase_reserved_nodes_offering_response) =
  assoc_to_yojson [ ("ReservedNode", option_to_yojson reserved_node_to_yojson x.reserved_node) ]

let purchase_reserved_nodes_offering_request_to_yojson
    (x : purchase_reserved_nodes_offering_request) =
  assoc_to_yojson
    [
      ("ReservedNodesOfferingId", Some (string__to_yojson x.reserved_nodes_offering_id));
      ("ReservationId", option_to_yojson string__to_yojson x.reservation_id);
      ("NodeCount", option_to_yojson integer_optional_to_yojson x.node_count);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_response_to_yojson (x : list_tags_response) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let list_tags_request_to_yojson (x : list_tags_request) =
  assoc_to_yojson [ ("ResourceArn", Some (string__to_yojson x.resource_arn)) ]

let node_type_list_to_yojson tree = list_to_yojson string__to_yojson tree

let list_allowed_node_type_updates_response_to_yojson (x : list_allowed_node_type_updates_response)
    =
  assoc_to_yojson
    [
      ("ScaleUpNodeTypes", option_to_yojson node_type_list_to_yojson x.scale_up_node_types);
      ("ScaleDownNodeTypes", option_to_yojson node_type_list_to_yojson x.scale_down_node_types);
    ]

let list_allowed_node_type_updates_request_to_yojson (x : list_allowed_node_type_updates_request) =
  assoc_to_yojson [ ("ClusterName", Some (string__to_yojson x.cluster_name)) ]

let list_allowed_multi_region_cluster_updates_response_to_yojson
    (x : list_allowed_multi_region_cluster_updates_response) =
  assoc_to_yojson
    [
      ("ScaleUpNodeTypes", option_to_yojson node_type_list_to_yojson x.scale_up_node_types);
      ("ScaleDownNodeTypes", option_to_yojson node_type_list_to_yojson x.scale_down_node_types);
    ]

let list_allowed_multi_region_cluster_updates_request_to_yojson
    (x : list_allowed_multi_region_cluster_updates_request) =
  assoc_to_yojson
    [ ("MultiRegionClusterName", Some (string__to_yojson x.multi_region_cluster_name)) ]

let test_failover_not_available_fault_to_yojson (x : test_failover_not_available_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let shard_not_found_fault_to_yojson (x : shard_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let failover_shard_response_to_yojson (x : failover_shard_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let failover_shard_request_to_yojson (x : failover_shard_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (string__to_yojson x.cluster_name));
      ("ShardName", Some (string__to_yojson x.shard_name));
    ]

let user_list_to_yojson tree = list_to_yojson user_to_yojson tree

let describe_users_response_to_yojson (x : describe_users_response) =
  assoc_to_yojson
    [
      ("Users", option_to_yojson user_list_to_yojson x.users);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let filter_value_to_yojson = string_to_yojson
let filter_value_list_to_yojson tree = list_to_yojson filter_value_to_yojson tree
let filter_name_to_yojson = string_to_yojson

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Name", Some (filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree

let describe_users_request_to_yojson (x : describe_users_request) =
  assoc_to_yojson
    [
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let subnet_group_list_to_yojson tree = list_to_yojson subnet_group_to_yojson tree

let describe_subnet_groups_response_to_yojson (x : describe_subnet_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("SubnetGroups", option_to_yojson subnet_group_list_to_yojson x.subnet_groups);
    ]

let describe_subnet_groups_request_to_yojson (x : describe_subnet_groups_request) =
  assoc_to_yojson
    [
      ("SubnetGroupName", option_to_yojson string__to_yojson x.subnet_group_name);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let shard_configuration_to_yojson (x : shard_configuration) =
  assoc_to_yojson
    [
      ("Slots", option_to_yojson string__to_yojson x.slots);
      ("ReplicaCount", option_to_yojson integer_optional_to_yojson x.replica_count);
    ]

let shard_detail_to_yojson (x : shard_detail) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Configuration", option_to_yojson shard_configuration_to_yojson x.configuration);
      ("Size", option_to_yojson string__to_yojson x.size);
      ("SnapshotCreationTime", option_to_yojson t_stamp_to_yojson x.snapshot_creation_time);
    ]

let shard_details_to_yojson tree = list_to_yojson shard_detail_to_yojson tree

let cluster_configuration_to_yojson (x : cluster_configuration) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("MaintenanceWindow", option_to_yojson string__to_yojson x.maintenance_window);
      ("TopicArn", option_to_yojson string__to_yojson x.topic_arn);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("SubnetGroupName", option_to_yojson string__to_yojson x.subnet_group_name);
      ("VpcId", option_to_yojson string__to_yojson x.vpc_id);
      ( "SnapshotRetentionLimit",
        option_to_yojson integer_optional_to_yojson x.snapshot_retention_limit );
      ("SnapshotWindow", option_to_yojson string__to_yojson x.snapshot_window);
      ("NumShards", option_to_yojson integer_optional_to_yojson x.num_shards);
      ("Shards", option_to_yojson shard_details_to_yojson x.shards);
      ( "MultiRegionParameterGroupName",
        option_to_yojson string__to_yojson x.multi_region_parameter_group_name );
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
    ]

let snapshot_to_yojson (x : snapshot) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Source", option_to_yojson string__to_yojson x.source);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ( "ClusterConfiguration",
        option_to_yojson cluster_configuration_to_yojson x.cluster_configuration );
      ("DataTiering", option_to_yojson data_tiering_status_to_yojson x.data_tiering);
    ]

let snapshot_list_to_yojson tree = list_to_yojson snapshot_to_yojson tree

let describe_snapshots_response_to_yojson (x : describe_snapshots_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Snapshots", option_to_yojson snapshot_list_to_yojson x.snapshots);
    ]

let describe_snapshots_request_to_yojson (x : describe_snapshots_request) =
  assoc_to_yojson
    [
      ("ClusterName", option_to_yojson string__to_yojson x.cluster_name);
      ("SnapshotName", option_to_yojson string__to_yojson x.snapshot_name);
      ("Source", option_to_yojson string__to_yojson x.source);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("ShowDetail", option_to_yojson boolean_optional_to_yojson x.show_detail);
    ]

let service_update_type_to_yojson (x : service_update_type) =
  match x with SECURITY_UPDATE -> `String "security-update"

let service_update_to_yojson (x : service_update) =
  assoc_to_yojson
    [
      ("ClusterName", option_to_yojson string__to_yojson x.cluster_name);
      ("ServiceUpdateName", option_to_yojson string__to_yojson x.service_update_name);
      ("ReleaseDate", option_to_yojson t_stamp_to_yojson x.release_date);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Status", option_to_yojson service_update_status_to_yojson x.status);
      ("Type", option_to_yojson service_update_type_to_yojson x.type_);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("NodesUpdated", option_to_yojson string__to_yojson x.nodes_updated);
      ("AutoUpdateStartDate", option_to_yojson t_stamp_to_yojson x.auto_update_start_date);
    ]

let service_update_list_to_yojson tree = list_to_yojson service_update_to_yojson tree

let describe_service_updates_response_to_yojson (x : describe_service_updates_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ServiceUpdates", option_to_yojson service_update_list_to_yojson x.service_updates);
    ]

let service_update_status_list_to_yojson tree = list_to_yojson service_update_status_to_yojson tree
let cluster_name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let describe_service_updates_request_to_yojson (x : describe_service_updates_request) =
  assoc_to_yojson
    [
      ("ServiceUpdateName", option_to_yojson string__to_yojson x.service_update_name);
      ("ClusterNames", option_to_yojson cluster_name_list_to_yojson x.cluster_names);
      ("Status", option_to_yojson service_update_status_list_to_yojson x.status);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let reserved_nodes_offering_to_yojson (x : reserved_nodes_offering) =
  assoc_to_yojson
    [
      ("ReservedNodesOfferingId", option_to_yojson string__to_yojson x.reserved_nodes_offering_id);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Duration", option_to_yojson integer_to_yojson x.duration);
      ("FixedPrice", option_to_yojson double_to_yojson x.fixed_price);
      ("OfferingType", option_to_yojson string__to_yojson x.offering_type);
      ("RecurringCharges", option_to_yojson recurring_charge_list_to_yojson x.recurring_charges);
    ]

let reserved_nodes_offering_list_to_yojson tree =
  list_to_yojson reserved_nodes_offering_to_yojson tree

let describe_reserved_nodes_offerings_response_to_yojson
    (x : describe_reserved_nodes_offerings_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "ReservedNodesOfferings",
        option_to_yojson reserved_nodes_offering_list_to_yojson x.reserved_nodes_offerings );
    ]

let describe_reserved_nodes_offerings_request_to_yojson
    (x : describe_reserved_nodes_offerings_request) =
  assoc_to_yojson
    [
      ("ReservedNodesOfferingId", option_to_yojson string__to_yojson x.reserved_nodes_offering_id);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Duration", option_to_yojson string__to_yojson x.duration);
      ("OfferingType", option_to_yojson string__to_yojson x.offering_type);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let reserved_node_not_found_fault_to_yojson (x : reserved_node_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let reserved_node_list_to_yojson tree = list_to_yojson reserved_node_to_yojson tree

let describe_reserved_nodes_response_to_yojson (x : describe_reserved_nodes_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ReservedNodes", option_to_yojson reserved_node_list_to_yojson x.reserved_nodes);
    ]

let describe_reserved_nodes_request_to_yojson (x : describe_reserved_nodes_request) =
  assoc_to_yojson
    [
      ("ReservationId", option_to_yojson string__to_yojson x.reservation_id);
      ("ReservedNodesOfferingId", option_to_yojson string__to_yojson x.reserved_nodes_offering_id);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Duration", option_to_yojson string__to_yojson x.duration);
      ("OfferingType", option_to_yojson string__to_yojson x.offering_type);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let parameter_to_yojson (x : parameter) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("DataType", option_to_yojson string__to_yojson x.data_type);
      ("AllowedValues", option_to_yojson string__to_yojson x.allowed_values);
      ("MinimumEngineVersion", option_to_yojson string__to_yojson x.minimum_engine_version);
    ]

let parameters_list_to_yojson tree = list_to_yojson parameter_to_yojson tree

let describe_parameters_response_to_yojson (x : describe_parameters_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Parameters", option_to_yojson parameters_list_to_yojson x.parameters);
    ]

let describe_parameters_request_to_yojson (x : describe_parameters_request) =
  assoc_to_yojson
    [
      ("ParameterGroupName", Some (string__to_yojson x.parameter_group_name));
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

let describe_parameter_groups_request_to_yojson (x : describe_parameter_groups_request) =
  assoc_to_yojson
    [
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let multi_region_parameter_to_yojson (x : multi_region_parameter) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Source", option_to_yojson string__to_yojson x.source);
      ("DataType", option_to_yojson string__to_yojson x.data_type);
      ("AllowedValues", option_to_yojson string__to_yojson x.allowed_values);
      ("MinimumEngineVersion", option_to_yojson string__to_yojson x.minimum_engine_version);
    ]

let multi_region_parameters_list_to_yojson tree =
  list_to_yojson multi_region_parameter_to_yojson tree

let describe_multi_region_parameters_response_to_yojson
    (x : describe_multi_region_parameters_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "MultiRegionParameters",
        option_to_yojson multi_region_parameters_list_to_yojson x.multi_region_parameters );
    ]

let describe_multi_region_parameters_request_to_yojson
    (x : describe_multi_region_parameters_request) =
  assoc_to_yojson
    [
      ("MultiRegionParameterGroupName", Some (string__to_yojson x.multi_region_parameter_group_name));
      ("Source", option_to_yojson string__to_yojson x.source);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let multi_region_parameter_group_to_yojson (x : multi_region_parameter_group) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Family", option_to_yojson string__to_yojson x.family);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
    ]

let multi_region_parameter_group_list_to_yojson tree =
  list_to_yojson multi_region_parameter_group_to_yojson tree

let describe_multi_region_parameter_groups_response_to_yojson
    (x : describe_multi_region_parameter_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "MultiRegionParameterGroups",
        option_to_yojson multi_region_parameter_group_list_to_yojson x.multi_region_parameter_groups
      );
    ]

let describe_multi_region_parameter_groups_request_to_yojson
    (x : describe_multi_region_parameter_groups_request) =
  assoc_to_yojson
    [
      ( "MultiRegionParameterGroupName",
        option_to_yojson string__to_yojson x.multi_region_parameter_group_name );
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let multi_region_cluster_list_to_yojson tree = list_to_yojson multi_region_cluster_to_yojson tree

let describe_multi_region_clusters_response_to_yojson (x : describe_multi_region_clusters_response)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "MultiRegionClusters",
        option_to_yojson multi_region_cluster_list_to_yojson x.multi_region_clusters );
    ]

let describe_multi_region_clusters_request_to_yojson (x : describe_multi_region_clusters_request) =
  assoc_to_yojson
    [
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ShowClusterDetails", option_to_yojson boolean_optional_to_yojson x.show_cluster_details);
    ]

let source_type_to_yojson (x : source_type) =
  match x with
  | Node -> `String "node"
  | Parameter_group -> `String "parameter-group"
  | Subnet_group -> `String "subnet-group"
  | Cluster -> `String "cluster"
  | User -> `String "user"
  | Acl -> `String "acl"

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

let engine_version_info_to_yojson (x : engine_version_info) =
  assoc_to_yojson
    [
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("EnginePatchVersion", option_to_yojson string__to_yojson x.engine_patch_version);
      ("ParameterGroupFamily", option_to_yojson string__to_yojson x.parameter_group_family);
    ]

let engine_version_info_list_to_yojson tree = list_to_yojson engine_version_info_to_yojson tree

let describe_engine_versions_response_to_yojson (x : describe_engine_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("EngineVersions", option_to_yojson engine_version_info_list_to_yojson x.engine_versions);
    ]

let describe_engine_versions_request_to_yojson (x : describe_engine_versions_request) =
  assoc_to_yojson
    [
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("ParameterGroupFamily", option_to_yojson string__to_yojson x.parameter_group_family);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("DefaultOnly", option_to_yojson boolean__to_yojson x.default_only);
    ]

let cluster_list_to_yojson tree = list_to_yojson cluster_to_yojson tree

let describe_clusters_response_to_yojson (x : describe_clusters_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Clusters", option_to_yojson cluster_list_to_yojson x.clusters);
    ]

let describe_clusters_request_to_yojson (x : describe_clusters_request) =
  assoc_to_yojson
    [
      ("ClusterName", option_to_yojson string__to_yojson x.cluster_name);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ShowShardDetails", option_to_yojson boolean_optional_to_yojson x.show_shard_details);
    ]

let describe_ac_ls_response_to_yojson (x : describe_ac_ls_response) =
  assoc_to_yojson
    [
      ("ACLs", option_to_yojson acl_list_to_yojson x.ac_ls);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_ac_ls_request_to_yojson (x : describe_ac_ls_request) =
  assoc_to_yojson
    [
      ("ACLName", option_to_yojson string__to_yojson x.acl_name);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let delete_user_response_to_yojson (x : delete_user_response) =
  assoc_to_yojson [ ("User", option_to_yojson user_to_yojson x.user) ]

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson [ ("UserName", Some (user_name_to_yojson x.user_name)) ]

let subnet_group_in_use_fault_to_yojson (x : subnet_group_in_use_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let delete_subnet_group_response_to_yojson (x : delete_subnet_group_response) =
  assoc_to_yojson [ ("SubnetGroup", option_to_yojson subnet_group_to_yojson x.subnet_group) ]

let delete_subnet_group_request_to_yojson (x : delete_subnet_group_request) =
  assoc_to_yojson [ ("SubnetGroupName", Some (string__to_yojson x.subnet_group_name)) ]

let invalid_snapshot_state_fault_to_yojson (x : invalid_snapshot_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let delete_snapshot_response_to_yojson (x : delete_snapshot_response) =
  assoc_to_yojson [ ("Snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let delete_snapshot_request_to_yojson (x : delete_snapshot_request) =
  assoc_to_yojson [ ("SnapshotName", Some (string__to_yojson x.snapshot_name)) ]

let delete_parameter_group_response_to_yojson (x : delete_parameter_group_response) =
  assoc_to_yojson
    [ ("ParameterGroup", option_to_yojson parameter_group_to_yojson x.parameter_group) ]

let delete_parameter_group_request_to_yojson (x : delete_parameter_group_request) =
  assoc_to_yojson [ ("ParameterGroupName", Some (string__to_yojson x.parameter_group_name)) ]

let delete_multi_region_cluster_response_to_yojson (x : delete_multi_region_cluster_response) =
  assoc_to_yojson
    [
      ("MultiRegionCluster", option_to_yojson multi_region_cluster_to_yojson x.multi_region_cluster);
    ]

let delete_multi_region_cluster_request_to_yojson (x : delete_multi_region_cluster_request) =
  assoc_to_yojson
    [ ("MultiRegionClusterName", Some (string__to_yojson x.multi_region_cluster_name)) ]

let snapshot_already_exists_fault_to_yojson (x : snapshot_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let delete_cluster_response_to_yojson (x : delete_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let delete_cluster_request_to_yojson (x : delete_cluster_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (string__to_yojson x.cluster_name));
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
      ("FinalSnapshotName", option_to_yojson string__to_yojson x.final_snapshot_name);
    ]

let delete_acl_response_to_yojson (x : delete_acl_response) =
  assoc_to_yojson [ ("ACL", option_to_yojson ac_l_to_yojson x.ac_l) ]

let delete_acl_request_to_yojson (x : delete_acl_request) =
  assoc_to_yojson [ ("ACLName", Some (string__to_yojson x.acl_name)) ]

let user_quota_exceeded_fault_to_yojson (x : user_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let user_already_exists_fault_to_yojson (x : user_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_user_response_to_yojson (x : create_user_response) =
  assoc_to_yojson [ ("User", option_to_yojson user_to_yojson x.user) ]

let create_user_request_to_yojson (x : create_user_request) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("AuthenticationMode", Some (authentication_mode_to_yojson x.authentication_mode));
      ("AccessString", Some (access_string_to_yojson x.access_string));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
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
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let snapshot_quota_exceeded_fault_to_yojson (x : snapshot_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_snapshot_response_to_yojson (x : create_snapshot_response) =
  assoc_to_yojson [ ("Snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let create_snapshot_request_to_yojson (x : create_snapshot_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (string__to_yojson x.cluster_name));
      ("SnapshotName", Some (string__to_yojson x.snapshot_name));
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
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
      ("Family", Some (string__to_yojson x.family));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let multi_region_cluster_already_exists_fault_to_yojson
    (x : multi_region_cluster_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_multi_region_cluster_response_to_yojson (x : create_multi_region_cluster_response) =
  assoc_to_yojson
    [
      ("MultiRegionCluster", option_to_yojson multi_region_cluster_to_yojson x.multi_region_cluster);
    ]

let create_multi_region_cluster_request_to_yojson (x : create_multi_region_cluster_request) =
  assoc_to_yojson
    [
      ("MultiRegionClusterNameSuffix", Some (string__to_yojson x.multi_region_cluster_name_suffix));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("NodeType", Some (string__to_yojson x.node_type));
      ( "MultiRegionParameterGroupName",
        option_to_yojson string__to_yojson x.multi_region_parameter_group_name );
      ("NumShards", option_to_yojson integer_optional_to_yojson x.num_shards);
      ("TLSEnabled", option_to_yojson boolean_optional_to_yojson x.tls_enabled);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let invalid_credentials_exception_to_yojson (x : invalid_credentials_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let insufficient_cluster_capacity_fault_to_yojson (x : insufficient_cluster_capacity_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let cluster_already_exists_fault_to_yojson (x : cluster_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_cluster_response_to_yojson (x : create_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let snapshot_arns_list_to_yojson tree = list_to_yojson string__to_yojson tree

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (string__to_yojson x.cluster_name));
      ("NodeType", Some (string__to_yojson x.node_type));
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("NumShards", option_to_yojson integer_optional_to_yojson x.num_shards);
      ("NumReplicasPerShard", option_to_yojson integer_optional_to_yojson x.num_replicas_per_shard);
      ("SubnetGroupName", option_to_yojson string__to_yojson x.subnet_group_name);
      ("SecurityGroupIds", option_to_yojson security_group_ids_list_to_yojson x.security_group_ids);
      ("MaintenanceWindow", option_to_yojson string__to_yojson x.maintenance_window);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("TLSEnabled", option_to_yojson boolean_optional_to_yojson x.tls_enabled);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("SnapshotArns", option_to_yojson snapshot_arns_list_to_yojson x.snapshot_arns);
      ("SnapshotName", option_to_yojson string__to_yojson x.snapshot_name);
      ( "SnapshotRetentionLimit",
        option_to_yojson integer_optional_to_yojson x.snapshot_retention_limit );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SnapshotWindow", option_to_yojson string__to_yojson x.snapshot_window);
      ("ACLName", Some (acl_name_to_yojson x.acl_name));
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ( "AutoMinorVersionUpgrade",
        option_to_yojson boolean_optional_to_yojson x.auto_minor_version_upgrade );
      ("DataTiering", option_to_yojson boolean_optional_to_yojson x.data_tiering);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ("IpDiscovery", option_to_yojson ip_discovery_to_yojson x.ip_discovery);
    ]

let create_acl_response_to_yojson (x : create_acl_response) =
  assoc_to_yojson [ ("ACL", option_to_yojson ac_l_to_yojson x.ac_l) ]

let create_acl_request_to_yojson (x : create_acl_request) =
  assoc_to_yojson
    [
      ("ACLName", Some (string__to_yojson x.acl_name));
      ("UserNames", option_to_yojson user_name_list_input_to_yojson x.user_names);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let copy_snapshot_response_to_yojson (x : copy_snapshot_response) =
  assoc_to_yojson [ ("Snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let kms_key_id_to_yojson = string_to_yojson
let target_bucket_to_yojson = string_to_yojson

let copy_snapshot_request_to_yojson (x : copy_snapshot_request) =
  assoc_to_yojson
    [
      ("SourceSnapshotName", Some (string__to_yojson x.source_snapshot_name));
      ("TargetSnapshotName", Some (string__to_yojson x.target_snapshot_name));
      ("TargetBucket", option_to_yojson target_bucket_to_yojson x.target_bucket);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let service_update_not_found_fault_to_yojson (x : service_update_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let unprocessed_cluster_to_yojson (x : unprocessed_cluster) =
  assoc_to_yojson
    [
      ("ClusterName", option_to_yojson string__to_yojson x.cluster_name);
      ("ErrorType", option_to_yojson string__to_yojson x.error_type);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let unprocessed_cluster_list_to_yojson tree = list_to_yojson unprocessed_cluster_to_yojson tree

let batch_update_cluster_response_to_yojson (x : batch_update_cluster_response) =
  assoc_to_yojson
    [
      ("ProcessedClusters", option_to_yojson cluster_list_to_yojson x.processed_clusters);
      ( "UnprocessedClusters",
        option_to_yojson unprocessed_cluster_list_to_yojson x.unprocessed_clusters );
    ]

let service_update_request_to_yojson (x : service_update_request) =
  assoc_to_yojson
    [
      ("ServiceUpdateNameToApply", option_to_yojson string__to_yojson x.service_update_name_to_apply);
    ]

let batch_update_cluster_request_to_yojson (x : batch_update_cluster_request) =
  assoc_to_yojson
    [
      ("ClusterNames", Some (cluster_name_list_to_yojson x.cluster_names));
      ("ServiceUpdate", option_to_yojson service_update_request_to_yojson x.service_update);
    ]
