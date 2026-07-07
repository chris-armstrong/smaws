open Smaws_Lib.Json.SerializeHelpers
open Types

let exception_message_to_yojson = string_to_yojson

let user_quota_exceeded_fault_to_yojson (x : user_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let user_not_found_fault_to_yojson (x : user_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let user_name_to_yojson = string_to_yojson
let user_name_list_input_to_yojson tree = list_to_yojson user_name_to_yojson tree
let user_name_list_to_yojson tree = list_to_yojson user_name_to_yojson tree
let string__to_yojson = string_to_yojson
let acl_name_to_yojson = string_to_yojson
let acl_name_list_to_yojson tree = list_to_yojson acl_name_to_yojson tree

let authentication_type_to_yojson (x : authentication_type) =
  match x with
  | IAM -> `String "iam"
  | NO_PASSWORD -> `String "no-password"
  | PASSWORD -> `String "password"

let integer_optional_to_yojson = int_to_yojson

let authentication_to_yojson (x : authentication) =
  assoc_to_yojson
    [
      ("PasswordCount", option_to_yojson integer_optional_to_yojson x.password_count);
      ("Type", option_to_yojson authentication_type_to_yojson x.type_);
    ]

let user_to_yojson (x : user) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("Authentication", option_to_yojson authentication_to_yojson x.authentication);
      ("MinimumEngineVersion", option_to_yojson string__to_yojson x.minimum_engine_version);
      ("ACLNames", option_to_yojson acl_name_list_to_yojson x.acl_names);
      ("AccessString", option_to_yojson string__to_yojson x.access_string);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let user_list_to_yojson tree = list_to_yojson user_to_yojson tree

let user_already_exists_fault_to_yojson (x : user_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let update_user_response_to_yojson (x : update_user_response) =
  assoc_to_yojson [ ("User", option_to_yojson user_to_yojson x.user) ]

let input_authentication_type_to_yojson (x : input_authentication_type) =
  match x with IAM -> `String "iam" | PASSWORD -> `String "password"

let password_list_input_to_yojson tree = list_to_yojson string__to_yojson tree

let authentication_mode_to_yojson (x : authentication_mode) =
  assoc_to_yojson
    [
      ("Passwords", option_to_yojson password_list_input_to_yojson x.passwords);
      ("Type", option_to_yojson input_authentication_type_to_yojson x.type_);
    ]

let access_string_to_yojson = string_to_yojson

let update_user_request_to_yojson (x : update_user_request) =
  assoc_to_yojson
    [
      ("AccessString", option_to_yojson access_string_to_yojson x.access_string);
      ("AuthenticationMode", option_to_yojson authentication_mode_to_yojson x.authentication_mode);
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let invalid_user_state_fault_to_yojson (x : invalid_user_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let aws_query_error_message_to_yojson = string_to_yojson

let invalid_parameter_value_exception_to_yojson (x : invalid_parameter_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson aws_query_error_message_to_yojson x.message) ]

let invalid_parameter_combination_exception_to_yojson (x : invalid_parameter_combination_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson aws_query_error_message_to_yojson x.message) ]

let availability_zone_to_yojson (x : availability_zone) =
  assoc_to_yojson [ ("Name", option_to_yojson string__to_yojson x.name) ]

let network_type_to_yojson (x : network_type) =
  match x with
  | DUAL_STACK -> `String "dual_stack"
  | IPV6 -> `String "ipv6"
  | IPV4 -> `String "ipv4"

let network_type_list_to_yojson tree = list_to_yojson network_type_to_yojson tree

let subnet_to_yojson (x : subnet) =
  assoc_to_yojson
    [
      ( "SupportedNetworkTypes",
        option_to_yojson network_type_list_to_yojson x.supported_network_types );
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("Identifier", option_to_yojson string__to_yojson x.identifier);
    ]

let subnet_list_to_yojson tree = list_to_yojson subnet_to_yojson tree

let subnet_group_to_yojson (x : subnet_group) =
  assoc_to_yojson
    [
      ( "SupportedNetworkTypes",
        option_to_yojson network_type_list_to_yojson x.supported_network_types );
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("Subnets", option_to_yojson subnet_list_to_yojson x.subnets);
      ("VpcId", option_to_yojson string__to_yojson x.vpc_id);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let update_subnet_group_response_to_yojson (x : update_subnet_group_response) =
  assoc_to_yojson [ ("SubnetGroup", option_to_yojson subnet_group_to_yojson x.subnet_group) ]

let subnet_identifier_list_to_yojson tree = list_to_yojson string__to_yojson tree

let update_subnet_group_request_to_yojson (x : update_subnet_group_request) =
  assoc_to_yojson
    [
      ("SubnetIds", option_to_yojson subnet_identifier_list_to_yojson x.subnet_ids);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("SubnetGroupName", Some (string__to_yojson x.subnet_group_name));
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

let update_strategy_to_yojson (x : update_strategy) =
  match x with UNCOORDINATED -> `String "uncoordinated" | COORDINATED -> `String "coordinated"

let parameter_group_to_yojson (x : parameter_group) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Family", option_to_yojson string__to_yojson x.family);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let update_parameter_group_response_to_yojson (x : update_parameter_group_response) =
  assoc_to_yojson
    [ ("ParameterGroup", option_to_yojson parameter_group_to_yojson x.parameter_group) ]

let parameter_name_value_to_yojson (x : parameter_name_value) =
  assoc_to_yojson
    [
      ("ParameterValue", option_to_yojson string__to_yojson x.parameter_value);
      ("ParameterName", option_to_yojson string__to_yojson x.parameter_name);
    ]

let parameter_name_value_list_to_yojson tree = list_to_yojson parameter_name_value_to_yojson tree

let update_parameter_group_request_to_yojson (x : update_parameter_group_request) =
  assoc_to_yojson
    [
      ("ParameterNameValues", Some (parameter_name_value_list_to_yojson x.parameter_name_values));
      ("ParameterGroupName", Some (string__to_yojson x.parameter_group_name));
    ]

let parameter_group_not_found_fault_to_yojson (x : parameter_group_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_parameter_group_state_fault_to_yojson (x : invalid_parameter_group_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let regional_cluster_to_yojson (x : regional_cluster) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Region", option_to_yojson string__to_yojson x.region);
      ("ClusterName", option_to_yojson string__to_yojson x.cluster_name);
    ]

let regional_cluster_list_to_yojson tree = list_to_yojson regional_cluster_to_yojson tree
let boolean_optional_to_yojson = bool_to_yojson

let multi_region_cluster_to_yojson (x : multi_region_cluster) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("TLSEnabled", option_to_yojson boolean_optional_to_yojson x.tls_enabled);
      ( "MultiRegionParameterGroupName",
        option_to_yojson string__to_yojson x.multi_region_parameter_group_name );
      ("Clusters", option_to_yojson regional_cluster_list_to_yojson x.clusters);
      ("NumberOfShards", option_to_yojson integer_optional_to_yojson x.number_of_shards);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
    ]

let update_multi_region_cluster_response_to_yojson (x : update_multi_region_cluster_response) =
  assoc_to_yojson
    [
      ("MultiRegionCluster", option_to_yojson multi_region_cluster_to_yojson x.multi_region_cluster);
    ]

let integer_to_yojson = int_to_yojson

let shard_configuration_request_to_yojson (x : shard_configuration_request) =
  assoc_to_yojson [ ("ShardCount", option_to_yojson integer_to_yojson x.shard_count) ]

let update_multi_region_cluster_request_to_yojson (x : update_multi_region_cluster_request) =
  assoc_to_yojson
    [
      ("UpdateStrategy", option_to_yojson update_strategy_to_yojson x.update_strategy);
      ( "MultiRegionParameterGroupName",
        option_to_yojson string__to_yojson x.multi_region_parameter_group_name );
      ( "ShardConfiguration",
        option_to_yojson shard_configuration_request_to_yojson x.shard_configuration );
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("MultiRegionClusterName", Some (string__to_yojson x.multi_region_cluster_name));
    ]

let multi_region_parameter_group_not_found_fault_to_yojson
    (x : multi_region_parameter_group_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let multi_region_cluster_not_found_fault_to_yojson (x : multi_region_cluster_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_multi_region_cluster_state_fault_to_yojson
    (x : invalid_multi_region_cluster_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let double_to_yojson = double_to_yojson

let slot_migration_to_yojson (x : slot_migration) =
  assoc_to_yojson
    [ ("ProgressPercentage", option_to_yojson double_to_yojson x.progress_percentage) ]

let resharding_status_to_yojson (x : resharding_status) =
  assoc_to_yojson [ ("SlotMigration", option_to_yojson slot_migration_to_yojson x.slot_migration) ]

let ac_ls_update_status_to_yojson (x : ac_ls_update_status) =
  assoc_to_yojson [ ("ACLToApply", option_to_yojson acl_name_to_yojson x.acl_to_apply) ]

let service_update_status_to_yojson (x : service_update_status) =
  match x with
  | SCHEDULED -> `String "scheduled"
  | COMPLETE -> `String "complete"
  | IN_PROGRESS -> `String "in-progress"
  | NOT_APPLIED -> `String "available"

let pending_modified_service_update_to_yojson (x : pending_modified_service_update) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson service_update_status_to_yojson x.status);
      ("ServiceUpdateName", option_to_yojson string__to_yojson x.service_update_name);
    ]

let pending_modified_service_update_list_to_yojson tree =
  list_to_yojson pending_modified_service_update_to_yojson tree

let cluster_pending_updates_to_yojson (x : cluster_pending_updates) =
  assoc_to_yojson
    [
      ( "ServiceUpdates",
        option_to_yojson pending_modified_service_update_list_to_yojson x.service_updates );
      ("ACLs", option_to_yojson ac_ls_update_status_to_yojson x.ac_ls);
      ("Resharding", option_to_yojson resharding_status_to_yojson x.resharding);
    ]

let t_stamp_to_yojson = timestamp_epoch_seconds_to_yojson

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("Port", option_to_yojson integer_to_yojson x.port);
      ("Address", option_to_yojson string__to_yojson x.address);
    ]

let node_to_yojson (x : node) =
  assoc_to_yojson
    [
      ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint);
      ("CreateTime", option_to_yojson t_stamp_to_yojson x.create_time);
      ("AvailabilityZone", option_to_yojson string__to_yojson x.availability_zone);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let node_list_to_yojson tree = list_to_yojson node_to_yojson tree

let shard_to_yojson (x : shard) =
  assoc_to_yojson
    [
      ("NumberOfNodes", option_to_yojson integer_optional_to_yojson x.number_of_nodes);
      ("Nodes", option_to_yojson node_list_to_yojson x.nodes);
      ("Slots", option_to_yojson string__to_yojson x.slots);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let shard_list_to_yojson tree = list_to_yojson shard_to_yojson tree

let az_status_to_yojson (x : az_status) =
  match x with MultiAZ -> `String "multiaz" | SingleAZ -> `String "singleaz"

let security_group_membership_to_yojson (x : security_group_membership) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson string__to_yojson x.status);
      ("SecurityGroupId", option_to_yojson string__to_yojson x.security_group_id);
    ]

let security_group_membership_list_to_yojson tree =
  list_to_yojson security_group_membership_to_yojson tree

let data_tiering_status_to_yojson (x : data_tiering_status) =
  match x with FALSE -> `String "false" | TRUE -> `String "true"

let ip_discovery_to_yojson (x : ip_discovery) =
  match x with IPV6 -> `String "ipv6" | IPV4 -> `String "ipv4"

let cluster_to_yojson (x : cluster) =
  assoc_to_yojson
    [
      ("IpDiscovery", option_to_yojson ip_discovery_to_yojson x.ip_discovery);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ("DataTiering", option_to_yojson data_tiering_status_to_yojson x.data_tiering);
      ( "AutoMinorVersionUpgrade",
        option_to_yojson boolean_optional_to_yojson x.auto_minor_version_upgrade );
      ("ACLName", option_to_yojson acl_name_to_yojson x.acl_name);
      ("SnapshotWindow", option_to_yojson string__to_yojson x.snapshot_window);
      ("MaintenanceWindow", option_to_yojson string__to_yojson x.maintenance_window);
      ( "SnapshotRetentionLimit",
        option_to_yojson integer_optional_to_yojson x.snapshot_retention_limit );
      ("SnsTopicStatus", option_to_yojson string__to_yojson x.sns_topic_status);
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("TLSEnabled", option_to_yojson boolean_optional_to_yojson x.tls_enabled);
      ("SubnetGroupName", option_to_yojson string__to_yojson x.subnet_group_name);
      ("SecurityGroups", option_to_yojson security_group_membership_list_to_yojson x.security_groups);
      ("ParameterGroupStatus", option_to_yojson string__to_yojson x.parameter_group_status);
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("EnginePatchVersion", option_to_yojson string__to_yojson x.engine_patch_version);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("ClusterEndpoint", option_to_yojson endpoint_to_yojson x.cluster_endpoint);
      ("AvailabilityMode", option_to_yojson az_status_to_yojson x.availability_mode);
      ("Shards", option_to_yojson shard_list_to_yojson x.shards);
      ("NumberOfShards", option_to_yojson integer_optional_to_yojson x.number_of_shards);
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
      ("PendingUpdates", option_to_yojson cluster_pending_updates_to_yojson x.pending_updates);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let update_cluster_response_to_yojson (x : update_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let security_group_ids_list_to_yojson tree = list_to_yojson string__to_yojson tree

let replica_configuration_request_to_yojson (x : replica_configuration_request) =
  assoc_to_yojson [ ("ReplicaCount", option_to_yojson integer_to_yojson x.replica_count) ]

let update_cluster_request_to_yojson (x : update_cluster_request) =
  assoc_to_yojson
    [
      ("IpDiscovery", option_to_yojson ip_discovery_to_yojson x.ip_discovery);
      ("ACLName", option_to_yojson acl_name_to_yojson x.acl_name);
      ( "ShardConfiguration",
        option_to_yojson shard_configuration_request_to_yojson x.shard_configuration );
      ( "ReplicaConfiguration",
        option_to_yojson replica_configuration_request_to_yojson x.replica_configuration );
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ( "SnapshotRetentionLimit",
        option_to_yojson integer_optional_to_yojson x.snapshot_retention_limit );
      ("SnapshotWindow", option_to_yojson string__to_yojson x.snapshot_window);
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("SnsTopicStatus", option_to_yojson string__to_yojson x.sns_topic_status);
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("MaintenanceWindow", option_to_yojson string__to_yojson x.maintenance_window);
      ("SecurityGroupIds", option_to_yojson security_group_ids_list_to_yojson x.security_group_ids);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ClusterName", Some (string__to_yojson x.cluster_name));
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

let acl_not_found_fault_to_yojson (x : acl_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let acl_pending_changes_to_yojson (x : acl_pending_changes) =
  assoc_to_yojson
    [
      ("UserNamesToAdd", option_to_yojson user_name_list_to_yojson x.user_names_to_add);
      ("UserNamesToRemove", option_to_yojson user_name_list_to_yojson x.user_names_to_remove);
    ]

let acl_cluster_name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let ac_l_to_yojson (x : ac_l) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("Clusters", option_to_yojson acl_cluster_name_list_to_yojson x.clusters);
      ("PendingChanges", option_to_yojson acl_pending_changes_to_yojson x.pending_changes);
      ("MinimumEngineVersion", option_to_yojson string__to_yojson x.minimum_engine_version);
      ("UserNames", option_to_yojson user_name_list_to_yojson x.user_names);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let update_acl_response_to_yojson (x : update_acl_response) =
  assoc_to_yojson [ ("ACL", option_to_yojson ac_l_to_yojson x.ac_l) ]

let update_acl_request_to_yojson (x : update_acl_request) =
  assoc_to_yojson
    [
      ("UserNamesToRemove", option_to_yojson user_name_list_input_to_yojson x.user_names_to_remove);
      ("UserNamesToAdd", option_to_yojson user_name_list_input_to_yojson x.user_names_to_add);
      ("ACLName", Some (string__to_yojson x.acl_name));
    ]

let duplicate_user_name_fault_to_yojson (x : duplicate_user_name_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let default_user_required_to_yojson (x : default_user_required) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Key", option_to_yojson string__to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let untag_resource_response_to_yojson (x : untag_resource_response) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let key_list_to_yojson tree = list_to_yojson string__to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
    ]

let tag_not_found_fault_to_yojson (x : tag_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let snapshot_not_found_fault_to_yojson (x : snapshot_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_arn_fault_to_yojson (x : invalid_arn_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let unprocessed_cluster_to_yojson (x : unprocessed_cluster) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ErrorType", option_to_yojson string__to_yojson x.error_type);
      ("ClusterName", option_to_yojson string__to_yojson x.cluster_name);
    ]

let unprocessed_cluster_list_to_yojson tree = list_to_yojson unprocessed_cluster_to_yojson tree

let test_failover_not_available_fault_to_yojson (x : test_failover_not_available_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let target_bucket_to_yojson = string_to_yojson

let tag_resource_response_to_yojson (x : tag_resource_response) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (string__to_yojson x.resource_arn));
    ]

let tag_quota_per_resource_exceeded_to_yojson (x : tag_quota_per_resource_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let subnet_group_quota_exceeded_fault_to_yojson (x : subnet_group_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let subnet_group_list_to_yojson tree = list_to_yojson subnet_group_to_yojson tree

let subnet_group_in_use_fault_to_yojson (x : subnet_group_in_use_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let subnet_group_already_exists_fault_to_yojson (x : subnet_group_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let source_type_to_yojson (x : source_type) =
  match x with
  | Acl -> `String "acl"
  | User -> `String "user"
  | Cluster -> `String "cluster"
  | Subnet_group -> `String "subnet-group"
  | Parameter_group -> `String "parameter-group"
  | Node -> `String "node"

let snapshot_quota_exceeded_fault_to_yojson (x : snapshot_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let shard_configuration_to_yojson (x : shard_configuration) =
  assoc_to_yojson
    [
      ("ReplicaCount", option_to_yojson integer_optional_to_yojson x.replica_count);
      ("Slots", option_to_yojson string__to_yojson x.slots);
    ]

let shard_detail_to_yojson (x : shard_detail) =
  assoc_to_yojson
    [
      ("SnapshotCreationTime", option_to_yojson t_stamp_to_yojson x.snapshot_creation_time);
      ("Size", option_to_yojson string__to_yojson x.size);
      ("Configuration", option_to_yojson shard_configuration_to_yojson x.configuration);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let shard_details_to_yojson tree = list_to_yojson shard_detail_to_yojson tree

let cluster_configuration_to_yojson (x : cluster_configuration) =
  assoc_to_yojson
    [
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
      ( "MultiRegionParameterGroupName",
        option_to_yojson string__to_yojson x.multi_region_parameter_group_name );
      ("Shards", option_to_yojson shard_details_to_yojson x.shards);
      ("NumShards", option_to_yojson integer_optional_to_yojson x.num_shards);
      ("SnapshotWindow", option_to_yojson string__to_yojson x.snapshot_window);
      ( "SnapshotRetentionLimit",
        option_to_yojson integer_optional_to_yojson x.snapshot_retention_limit );
      ("VpcId", option_to_yojson string__to_yojson x.vpc_id);
      ("SubnetGroupName", option_to_yojson string__to_yojson x.subnet_group_name);
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("TopicArn", option_to_yojson string__to_yojson x.topic_arn);
      ("MaintenanceWindow", option_to_yojson string__to_yojson x.maintenance_window);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let snapshot_to_yojson (x : snapshot) =
  assoc_to_yojson
    [
      ("DataTiering", option_to_yojson data_tiering_status_to_yojson x.data_tiering);
      ( "ClusterConfiguration",
        option_to_yojson cluster_configuration_to_yojson x.cluster_configuration );
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("Source", option_to_yojson string__to_yojson x.source);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let snapshot_list_to_yojson tree = list_to_yojson snapshot_to_yojson tree
let snapshot_arns_list_to_yojson tree = list_to_yojson string__to_yojson tree

let snapshot_already_exists_fault_to_yojson (x : snapshot_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let shard_not_found_fault_to_yojson (x : shard_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let service_update_type_to_yojson (x : service_update_type) =
  match x with SECURITY_UPDATE -> `String "security-update"

let service_update_status_list_to_yojson tree = list_to_yojson service_update_status_to_yojson tree

let service_update_request_to_yojson (x : service_update_request) =
  assoc_to_yojson
    [
      ("ServiceUpdateNameToApply", option_to_yojson string__to_yojson x.service_update_name_to_apply);
    ]

let service_update_not_found_fault_to_yojson (x : service_update_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let service_update_to_yojson (x : service_update) =
  assoc_to_yojson
    [
      ("AutoUpdateStartDate", option_to_yojson t_stamp_to_yojson x.auto_update_start_date);
      ("NodesUpdated", option_to_yojson string__to_yojson x.nodes_updated);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("Type", option_to_yojson service_update_type_to_yojson x.type_);
      ("Status", option_to_yojson service_update_status_to_yojson x.status);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ReleaseDate", option_to_yojson t_stamp_to_yojson x.release_date);
      ("ServiceUpdateName", option_to_yojson string__to_yojson x.service_update_name);
      ("ClusterName", option_to_yojson string__to_yojson x.cluster_name);
    ]

let service_update_list_to_yojson tree = list_to_yojson service_update_to_yojson tree

let reset_parameter_group_response_to_yojson (x : reset_parameter_group_response) =
  assoc_to_yojson
    [ ("ParameterGroup", option_to_yojson parameter_group_to_yojson x.parameter_group) ]

let boolean__to_yojson = bool_to_yojson
let parameter_name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let reset_parameter_group_request_to_yojson (x : reset_parameter_group_request) =
  assoc_to_yojson
    [
      ("ParameterNames", option_to_yojson parameter_name_list_to_yojson x.parameter_names);
      ("AllParameters", option_to_yojson boolean__to_yojson x.all_parameters);
      ("ParameterGroupName", Some (string__to_yojson x.parameter_group_name));
    ]

let reserved_nodes_offering_not_found_fault_to_yojson (x : reserved_nodes_offering_not_found_fault)
    =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let recurring_charge_to_yojson (x : recurring_charge) =
  assoc_to_yojson
    [
      ("RecurringChargeFrequency", option_to_yojson string__to_yojson x.recurring_charge_frequency);
      ("RecurringChargeAmount", option_to_yojson double_to_yojson x.recurring_charge_amount);
    ]

let recurring_charge_list_to_yojson tree = list_to_yojson recurring_charge_to_yojson tree

let reserved_nodes_offering_to_yojson (x : reserved_nodes_offering) =
  assoc_to_yojson
    [
      ("RecurringCharges", option_to_yojson recurring_charge_list_to_yojson x.recurring_charges);
      ("OfferingType", option_to_yojson string__to_yojson x.offering_type);
      ("FixedPrice", option_to_yojson double_to_yojson x.fixed_price);
      ("Duration", option_to_yojson integer_to_yojson x.duration);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("ReservedNodesOfferingId", option_to_yojson string__to_yojson x.reserved_nodes_offering_id);
    ]

let reserved_nodes_offering_list_to_yojson tree =
  list_to_yojson reserved_nodes_offering_to_yojson tree

let reserved_node_quota_exceeded_fault_to_yojson (x : reserved_node_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let reserved_node_not_found_fault_to_yojson (x : reserved_node_not_found_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let reserved_node_to_yojson (x : reserved_node) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("RecurringCharges", option_to_yojson recurring_charge_list_to_yojson x.recurring_charges);
      ("State", option_to_yojson string__to_yojson x.state);
      ("OfferingType", option_to_yojson string__to_yojson x.offering_type);
      ("NodeCount", option_to_yojson integer_to_yojson x.node_count);
      ("FixedPrice", option_to_yojson double_to_yojson x.fixed_price);
      ("Duration", option_to_yojson integer_to_yojson x.duration);
      ("StartTime", option_to_yojson t_stamp_to_yojson x.start_time);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("ReservedNodesOfferingId", option_to_yojson string__to_yojson x.reserved_nodes_offering_id);
      ("ReservationId", option_to_yojson string__to_yojson x.reservation_id);
    ]

let reserved_node_list_to_yojson tree = list_to_yojson reserved_node_to_yojson tree

let reserved_node_already_exists_fault_to_yojson (x : reserved_node_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let purchase_reserved_nodes_offering_response_to_yojson
    (x : purchase_reserved_nodes_offering_response) =
  assoc_to_yojson [ ("ReservedNode", option_to_yojson reserved_node_to_yojson x.reserved_node) ]

let purchase_reserved_nodes_offering_request_to_yojson
    (x : purchase_reserved_nodes_offering_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NodeCount", option_to_yojson integer_optional_to_yojson x.node_count);
      ("ReservationId", option_to_yojson string__to_yojson x.reservation_id);
      ("ReservedNodesOfferingId", Some (string__to_yojson x.reserved_nodes_offering_id));
    ]

let parameter_to_yojson (x : parameter) =
  assoc_to_yojson
    [
      ("MinimumEngineVersion", option_to_yojson string__to_yojson x.minimum_engine_version);
      ("AllowedValues", option_to_yojson string__to_yojson x.allowed_values);
      ("DataType", option_to_yojson string__to_yojson x.data_type);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let parameters_list_to_yojson tree = list_to_yojson parameter_to_yojson tree

let parameter_group_quota_exceeded_fault_to_yojson (x : parameter_group_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let parameter_group_list_to_yojson tree = list_to_yojson parameter_group_to_yojson tree

let parameter_group_already_exists_fault_to_yojson (x : parameter_group_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let node_type_list_to_yojson tree = list_to_yojson string__to_yojson tree

let multi_region_parameter_to_yojson (x : multi_region_parameter) =
  assoc_to_yojson
    [
      ("MinimumEngineVersion", option_to_yojson string__to_yojson x.minimum_engine_version);
      ("AllowedValues", option_to_yojson string__to_yojson x.allowed_values);
      ("DataType", option_to_yojson string__to_yojson x.data_type);
      ("Source", option_to_yojson string__to_yojson x.source);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let multi_region_parameters_list_to_yojson tree =
  list_to_yojson multi_region_parameter_to_yojson tree

let multi_region_parameter_group_to_yojson (x : multi_region_parameter_group) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson string__to_yojson x.ar_n);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Family", option_to_yojson string__to_yojson x.family);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let multi_region_parameter_group_list_to_yojson tree =
  list_to_yojson multi_region_parameter_group_to_yojson tree

let multi_region_cluster_list_to_yojson tree = list_to_yojson multi_region_cluster_to_yojson tree

let multi_region_cluster_already_exists_fault_to_yojson
    (x : multi_region_cluster_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let list_tags_response_to_yojson (x : list_tags_response) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let list_tags_request_to_yojson (x : list_tags_request) =
  assoc_to_yojson [ ("ResourceArn", Some (string__to_yojson x.resource_arn)) ]

let list_allowed_node_type_updates_response_to_yojson (x : list_allowed_node_type_updates_response)
    =
  assoc_to_yojson
    [
      ("ScaleDownNodeTypes", option_to_yojson node_type_list_to_yojson x.scale_down_node_types);
      ("ScaleUpNodeTypes", option_to_yojson node_type_list_to_yojson x.scale_up_node_types);
    ]

let list_allowed_node_type_updates_request_to_yojson (x : list_allowed_node_type_updates_request) =
  assoc_to_yojson [ ("ClusterName", Some (string__to_yojson x.cluster_name)) ]

let list_allowed_multi_region_cluster_updates_response_to_yojson
    (x : list_allowed_multi_region_cluster_updates_response) =
  assoc_to_yojson
    [
      ("ScaleDownNodeTypes", option_to_yojson node_type_list_to_yojson x.scale_down_node_types);
      ("ScaleUpNodeTypes", option_to_yojson node_type_list_to_yojson x.scale_up_node_types);
    ]

let list_allowed_multi_region_cluster_updates_request_to_yojson
    (x : list_allowed_multi_region_cluster_updates_request) =
  assoc_to_yojson
    [ ("MultiRegionClusterName", Some (string__to_yojson x.multi_region_cluster_name)) ]

let kms_key_id_to_yojson = string_to_yojson

let invalid_snapshot_state_fault_to_yojson (x : invalid_snapshot_state_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_credentials_exception_to_yojson (x : invalid_credentials_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let insufficient_cluster_capacity_fault_to_yojson (x : insufficient_cluster_capacity_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let filter_value_to_yojson = string_to_yojson
let filter_value_list_to_yojson tree = list_to_yojson filter_value_to_yojson tree
let filter_name_to_yojson = string_to_yojson

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (filter_name_to_yojson x.name));
    ]

let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree

let failover_shard_response_to_yojson (x : failover_shard_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let failover_shard_request_to_yojson (x : failover_shard_request) =
  assoc_to_yojson
    [
      ("ShardName", Some (string__to_yojson x.shard_name));
      ("ClusterName", Some (string__to_yojson x.cluster_name));
    ]

let api_call_rate_for_customer_exceeded_fault_to_yojson
    (x : api_call_rate_for_customer_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let event_to_yojson (x : event) =
  assoc_to_yojson
    [
      ("Date", option_to_yojson t_stamp_to_yojson x.date);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("SourceName", option_to_yojson string__to_yojson x.source_name);
    ]

let event_list_to_yojson tree = list_to_yojson event_to_yojson tree

let engine_version_info_to_yojson (x : engine_version_info) =
  assoc_to_yojson
    [
      ("ParameterGroupFamily", option_to_yojson string__to_yojson x.parameter_group_family);
      ("EnginePatchVersion", option_to_yojson string__to_yojson x.engine_patch_version);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("Engine", option_to_yojson string__to_yojson x.engine);
    ]

let engine_version_info_list_to_yojson tree = list_to_yojson engine_version_info_to_yojson tree

let describe_users_response_to_yojson (x : describe_users_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Users", option_to_yojson user_list_to_yojson x.users);
    ]

let describe_users_request_to_yojson (x : describe_users_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
    ]

let describe_subnet_groups_response_to_yojson (x : describe_subnet_groups_response) =
  assoc_to_yojson
    [
      ("SubnetGroups", option_to_yojson subnet_group_list_to_yojson x.subnet_groups);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_subnet_groups_request_to_yojson (x : describe_subnet_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("SubnetGroupName", option_to_yojson string__to_yojson x.subnet_group_name);
    ]

let describe_snapshots_response_to_yojson (x : describe_snapshots_response) =
  assoc_to_yojson
    [
      ("Snapshots", option_to_yojson snapshot_list_to_yojson x.snapshots);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_snapshots_request_to_yojson (x : describe_snapshots_request) =
  assoc_to_yojson
    [
      ("ShowDetail", option_to_yojson boolean_optional_to_yojson x.show_detail);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Source", option_to_yojson string__to_yojson x.source);
      ("SnapshotName", option_to_yojson string__to_yojson x.snapshot_name);
      ("ClusterName", option_to_yojson string__to_yojson x.cluster_name);
    ]

let describe_service_updates_response_to_yojson (x : describe_service_updates_response) =
  assoc_to_yojson
    [
      ("ServiceUpdates", option_to_yojson service_update_list_to_yojson x.service_updates);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let cluster_name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let describe_service_updates_request_to_yojson (x : describe_service_updates_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("Status", option_to_yojson service_update_status_list_to_yojson x.status);
      ("ClusterNames", option_to_yojson cluster_name_list_to_yojson x.cluster_names);
      ("ServiceUpdateName", option_to_yojson string__to_yojson x.service_update_name);
    ]

let describe_reserved_nodes_response_to_yojson (x : describe_reserved_nodes_response) =
  assoc_to_yojson
    [
      ("ReservedNodes", option_to_yojson reserved_node_list_to_yojson x.reserved_nodes);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_reserved_nodes_request_to_yojson (x : describe_reserved_nodes_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("OfferingType", option_to_yojson string__to_yojson x.offering_type);
      ("Duration", option_to_yojson string__to_yojson x.duration);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("ReservedNodesOfferingId", option_to_yojson string__to_yojson x.reserved_nodes_offering_id);
      ("ReservationId", option_to_yojson string__to_yojson x.reservation_id);
    ]

let describe_reserved_nodes_offerings_response_to_yojson
    (x : describe_reserved_nodes_offerings_response) =
  assoc_to_yojson
    [
      ( "ReservedNodesOfferings",
        option_to_yojson reserved_nodes_offering_list_to_yojson x.reserved_nodes_offerings );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_reserved_nodes_offerings_request_to_yojson
    (x : describe_reserved_nodes_offerings_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("OfferingType", option_to_yojson string__to_yojson x.offering_type);
      ("Duration", option_to_yojson string__to_yojson x.duration);
      ("NodeType", option_to_yojson string__to_yojson x.node_type);
      ("ReservedNodesOfferingId", option_to_yojson string__to_yojson x.reserved_nodes_offering_id);
    ]

let describe_parameters_response_to_yojson (x : describe_parameters_response) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson parameters_list_to_yojson x.parameters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_parameters_request_to_yojson (x : describe_parameters_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("ParameterGroupName", Some (string__to_yojson x.parameter_group_name));
    ]

let describe_parameter_groups_response_to_yojson (x : describe_parameter_groups_response) =
  assoc_to_yojson
    [
      ("ParameterGroups", option_to_yojson parameter_group_list_to_yojson x.parameter_groups);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_parameter_groups_request_to_yojson (x : describe_parameter_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
    ]

let describe_multi_region_parameters_response_to_yojson
    (x : describe_multi_region_parameters_response) =
  assoc_to_yojson
    [
      ( "MultiRegionParameters",
        option_to_yojson multi_region_parameters_list_to_yojson x.multi_region_parameters );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_multi_region_parameters_request_to_yojson
    (x : describe_multi_region_parameters_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("Source", option_to_yojson string__to_yojson x.source);
      ("MultiRegionParameterGroupName", Some (string__to_yojson x.multi_region_parameter_group_name));
    ]

let describe_multi_region_parameter_groups_response_to_yojson
    (x : describe_multi_region_parameter_groups_response) =
  assoc_to_yojson
    [
      ( "MultiRegionParameterGroups",
        option_to_yojson multi_region_parameter_group_list_to_yojson x.multi_region_parameter_groups
      );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_multi_region_parameter_groups_request_to_yojson
    (x : describe_multi_region_parameter_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ( "MultiRegionParameterGroupName",
        option_to_yojson string__to_yojson x.multi_region_parameter_group_name );
    ]

let describe_multi_region_clusters_response_to_yojson (x : describe_multi_region_clusters_response)
    =
  assoc_to_yojson
    [
      ( "MultiRegionClusters",
        option_to_yojson multi_region_cluster_list_to_yojson x.multi_region_clusters );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_multi_region_clusters_request_to_yojson (x : describe_multi_region_clusters_request) =
  assoc_to_yojson
    [
      ("ShowClusterDetails", option_to_yojson boolean_optional_to_yojson x.show_cluster_details);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
    ]

let describe_events_response_to_yojson (x : describe_events_response) =
  assoc_to_yojson
    [
      ("Events", option_to_yojson event_list_to_yojson x.events);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_events_request_to_yojson (x : describe_events_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("Duration", option_to_yojson integer_optional_to_yojson x.duration);
      ("EndTime", option_to_yojson t_stamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson t_stamp_to_yojson x.start_time);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("SourceName", option_to_yojson string__to_yojson x.source_name);
    ]

let describe_engine_versions_response_to_yojson (x : describe_engine_versions_response) =
  assoc_to_yojson
    [
      ("EngineVersions", option_to_yojson engine_version_info_list_to_yojson x.engine_versions);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_engine_versions_request_to_yojson (x : describe_engine_versions_request) =
  assoc_to_yojson
    [
      ("DefaultOnly", option_to_yojson boolean__to_yojson x.default_only);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("ParameterGroupFamily", option_to_yojson string__to_yojson x.parameter_group_family);
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("Engine", option_to_yojson string__to_yojson x.engine);
    ]

let cluster_list_to_yojson tree = list_to_yojson cluster_to_yojson tree

let describe_clusters_response_to_yojson (x : describe_clusters_response) =
  assoc_to_yojson
    [
      ("Clusters", option_to_yojson cluster_list_to_yojson x.clusters);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_clusters_request_to_yojson (x : describe_clusters_request) =
  assoc_to_yojson
    [
      ("ShowShardDetails", option_to_yojson boolean_optional_to_yojson x.show_shard_details);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("ClusterName", option_to_yojson string__to_yojson x.cluster_name);
    ]

let acl_list_to_yojson tree = list_to_yojson ac_l_to_yojson tree

let describe_ac_ls_response_to_yojson (x : describe_ac_ls_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ACLs", option_to_yojson acl_list_to_yojson x.ac_ls);
    ]

let describe_ac_ls_request_to_yojson (x : describe_ac_ls_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_optional_to_yojson x.max_results);
      ("ACLName", option_to_yojson string__to_yojson x.acl_name);
    ]

let delete_user_response_to_yojson (x : delete_user_response) =
  assoc_to_yojson [ ("User", option_to_yojson user_to_yojson x.user) ]

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson [ ("UserName", Some (user_name_to_yojson x.user_name)) ]

let delete_subnet_group_response_to_yojson (x : delete_subnet_group_response) =
  assoc_to_yojson [ ("SubnetGroup", option_to_yojson subnet_group_to_yojson x.subnet_group) ]

let delete_subnet_group_request_to_yojson (x : delete_subnet_group_request) =
  assoc_to_yojson [ ("SubnetGroupName", Some (string__to_yojson x.subnet_group_name)) ]

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

let delete_cluster_response_to_yojson (x : delete_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let delete_cluster_request_to_yojson (x : delete_cluster_request) =
  assoc_to_yojson
    [
      ("FinalSnapshotName", option_to_yojson string__to_yojson x.final_snapshot_name);
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
      ("ClusterName", Some (string__to_yojson x.cluster_name));
    ]

let delete_acl_response_to_yojson (x : delete_acl_response) =
  assoc_to_yojson [ ("ACL", option_to_yojson ac_l_to_yojson x.ac_l) ]

let delete_acl_request_to_yojson (x : delete_acl_request) =
  assoc_to_yojson [ ("ACLName", Some (string__to_yojson x.acl_name)) ]

let create_user_response_to_yojson (x : create_user_response) =
  assoc_to_yojson [ ("User", option_to_yojson user_to_yojson x.user) ]

let create_user_request_to_yojson (x : create_user_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AccessString", Some (access_string_to_yojson x.access_string));
      ("AuthenticationMode", Some (authentication_mode_to_yojson x.authentication_mode));
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let create_subnet_group_response_to_yojson (x : create_subnet_group_response) =
  assoc_to_yojson [ ("SubnetGroup", option_to_yojson subnet_group_to_yojson x.subnet_group) ]

let create_subnet_group_request_to_yojson (x : create_subnet_group_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SubnetIds", Some (subnet_identifier_list_to_yojson x.subnet_ids));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("SubnetGroupName", Some (string__to_yojson x.subnet_group_name));
    ]

let create_snapshot_response_to_yojson (x : create_snapshot_response) =
  assoc_to_yojson [ ("Snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let create_snapshot_request_to_yojson (x : create_snapshot_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("SnapshotName", Some (string__to_yojson x.snapshot_name));
      ("ClusterName", Some (string__to_yojson x.cluster_name));
    ]

let create_parameter_group_response_to_yojson (x : create_parameter_group_response) =
  assoc_to_yojson
    [ ("ParameterGroup", option_to_yojson parameter_group_to_yojson x.parameter_group) ]

let create_parameter_group_request_to_yojson (x : create_parameter_group_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Family", Some (string__to_yojson x.family));
      ("ParameterGroupName", Some (string__to_yojson x.parameter_group_name));
    ]

let create_multi_region_cluster_response_to_yojson (x : create_multi_region_cluster_response) =
  assoc_to_yojson
    [
      ("MultiRegionCluster", option_to_yojson multi_region_cluster_to_yojson x.multi_region_cluster);
    ]

let create_multi_region_cluster_request_to_yojson (x : create_multi_region_cluster_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("TLSEnabled", option_to_yojson boolean_optional_to_yojson x.tls_enabled);
      ("NumShards", option_to_yojson integer_optional_to_yojson x.num_shards);
      ( "MultiRegionParameterGroupName",
        option_to_yojson string__to_yojson x.multi_region_parameter_group_name );
      ("NodeType", Some (string__to_yojson x.node_type));
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("MultiRegionClusterNameSuffix", Some (string__to_yojson x.multi_region_cluster_name_suffix));
    ]

let create_cluster_response_to_yojson (x : create_cluster_response) =
  assoc_to_yojson [ ("Cluster", option_to_yojson cluster_to_yojson x.cluster) ]

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ("IpDiscovery", option_to_yojson ip_discovery_to_yojson x.ip_discovery);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ("DataTiering", option_to_yojson boolean_optional_to_yojson x.data_tiering);
      ( "AutoMinorVersionUpgrade",
        option_to_yojson boolean_optional_to_yojson x.auto_minor_version_upgrade );
      ("EngineVersion", option_to_yojson string__to_yojson x.engine_version);
      ("Engine", option_to_yojson string__to_yojson x.engine);
      ("ACLName", Some (acl_name_to_yojson x.acl_name));
      ("SnapshotWindow", option_to_yojson string__to_yojson x.snapshot_window);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "SnapshotRetentionLimit",
        option_to_yojson integer_optional_to_yojson x.snapshot_retention_limit );
      ("SnapshotName", option_to_yojson string__to_yojson x.snapshot_name);
      ("SnapshotArns", option_to_yojson snapshot_arns_list_to_yojson x.snapshot_arns);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("TLSEnabled", option_to_yojson boolean_optional_to_yojson x.tls_enabled);
      ("SnsTopicArn", option_to_yojson string__to_yojson x.sns_topic_arn);
      ("Port", option_to_yojson integer_optional_to_yojson x.port);
      ("MaintenanceWindow", option_to_yojson string__to_yojson x.maintenance_window);
      ("SecurityGroupIds", option_to_yojson security_group_ids_list_to_yojson x.security_group_ids);
      ("SubnetGroupName", option_to_yojson string__to_yojson x.subnet_group_name);
      ("NumReplicasPerShard", option_to_yojson integer_optional_to_yojson x.num_replicas_per_shard);
      ("NumShards", option_to_yojson integer_optional_to_yojson x.num_shards);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ParameterGroupName", option_to_yojson string__to_yojson x.parameter_group_name);
      ("MultiRegionClusterName", option_to_yojson string__to_yojson x.multi_region_cluster_name);
      ("NodeType", Some (string__to_yojson x.node_type));
      ("ClusterName", Some (string__to_yojson x.cluster_name));
    ]

let cluster_already_exists_fault_to_yojson (x : cluster_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_acl_response_to_yojson (x : create_acl_response) =
  assoc_to_yojson [ ("ACL", option_to_yojson ac_l_to_yojson x.ac_l) ]

let create_acl_request_to_yojson (x : create_acl_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("UserNames", option_to_yojson user_name_list_input_to_yojson x.user_names);
      ("ACLName", Some (string__to_yojson x.acl_name));
    ]

let acl_quota_exceeded_fault_to_yojson (x : acl_quota_exceeded_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let acl_already_exists_fault_to_yojson (x : acl_already_exists_fault) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let copy_snapshot_response_to_yojson (x : copy_snapshot_response) =
  assoc_to_yojson [ ("Snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let copy_snapshot_request_to_yojson (x : copy_snapshot_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("TargetBucket", option_to_yojson target_bucket_to_yojson x.target_bucket);
      ("TargetSnapshotName", Some (string__to_yojson x.target_snapshot_name));
      ("SourceSnapshotName", Some (string__to_yojson x.source_snapshot_name));
    ]

let batch_update_cluster_response_to_yojson (x : batch_update_cluster_response) =
  assoc_to_yojson
    [
      ( "UnprocessedClusters",
        option_to_yojson unprocessed_cluster_list_to_yojson x.unprocessed_clusters );
      ("ProcessedClusters", option_to_yojson cluster_list_to_yojson x.processed_clusters);
    ]

let batch_update_cluster_request_to_yojson (x : batch_update_cluster_request) =
  assoc_to_yojson
    [
      ("ServiceUpdate", option_to_yojson service_update_request_to_yojson x.service_update);
      ("ClusterNames", Some (cluster_name_list_to_yojson x.cluster_names));
    ]
