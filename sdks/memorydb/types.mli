type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec user_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of users allowed.\n"]

type nonrec user_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified user does not exist.\n"]

type nonrec user_name = string [@@ocaml.doc ""]

type nonrec user_name_list_input = user_name list [@@ocaml.doc ""]

type nonrec user_name_list = user_name list [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec acl_name = string [@@ocaml.doc ""]

type nonrec acl_name_list = acl_name list [@@ocaml.doc ""]

type nonrec authentication_type =
  | IAM [@ocaml.doc ""]
  | NO_PASSWORD [@ocaml.doc ""]
  | PASSWORD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integer_optional = int [@@ocaml.doc ""]

type nonrec authentication = {
  password_count : integer_optional option;
      [@ocaml.doc "The number of passwords belonging to the user. The maximum is two.\n"]
  type_ : authentication_type option;
      [@ocaml.doc "Indicates whether the user requires a password to authenticate.\n"]
}
[@@ocaml.doc
  "Denotes the user's authentication properties, such as whether it requires a password to \
   authenticate. Used in output responses.\n"]

type nonrec user = {
  ar_n : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the user. \n"]
  authentication : authentication option;
      [@ocaml.doc "Denotes whether the user requires a password to authenticate.\n"]
  minimum_engine_version : string_ option;
      [@ocaml.doc "The minimum engine version supported for the user\n"]
  acl_names : acl_name_list option;
      [@ocaml.doc "The names of the Access Control Lists to which the user belongs\n"]
  access_string : string_ option; [@ocaml.doc "Access permissions string used for this user.\n"]
  status : string_ option;
      [@ocaml.doc "Indicates the user status. Can be \"active\", \"modifying\" or \"deleting\".\n"]
  name : string_ option; [@ocaml.doc "The name of the user\n"]
}
[@@ocaml.doc
  "You create users and assign them specific permissions by using an access string. You assign the \
   users to Access Control Lists aligned with a specific role (administrators, human resources) \
   that are then deployed to one or more MemoryDB clusters.\n"]

type nonrec user_list = user list [@@ocaml.doc ""]

type nonrec user_already_exists_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A user with the specified name already exists.\n"]

type nonrec update_user_response = { user : user option [@ocaml.doc "The updated user\n"] }
[@@ocaml.doc ""]

type nonrec input_authentication_type = IAM [@ocaml.doc ""] | PASSWORD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec password_list_input = string_ list [@@ocaml.doc ""]

type nonrec authentication_mode = {
  passwords : password_list_input option; [@ocaml.doc "The password(s) used for authentication\n"]
  type_ : input_authentication_type option;
      [@ocaml.doc
        "Indicates whether the user requires a password to authenticate. All newly-created users \
         require a password.\n"]
}
[@@ocaml.doc
  "Denotes the user's authentication properties, such as whether it requires a password to \
   authenticate. Used in output responses.\n"]

type nonrec access_string = string [@@ocaml.doc ""]

type nonrec update_user_request = {
  access_string : access_string option;
      [@ocaml.doc "Access permissions string used for this user.\n"]
  authentication_mode : authentication_mode option;
      [@ocaml.doc
        "Denotes the user's authentication properties, such as whether it requires a password to \
         authenticate.\n"]
  user_name : user_name; [@ocaml.doc "The name of the user\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_user_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The user is not in a valid state for the requested operation.\n"]

type nonrec aws_query_error_message = string [@@ocaml.doc ""]

type nonrec invalid_parameter_value_exception = {
  message : aws_query_error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified parameter value is not valid.\n"]

type nonrec invalid_parameter_combination_exception = {
  message : aws_query_error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified parameter combination is not valid.\n"]

type nonrec availability_zone = {
  name : string_ option; [@ocaml.doc "The name of the Availability Zone.\n"]
}
[@@ocaml.doc "Indicates if the cluster has a Multi-AZ configuration (multiaz) or not (singleaz).\n"]

type nonrec network_type =
  | DUAL_STACK [@ocaml.doc ""]
  | IPV6 [@ocaml.doc ""]
  | IPV4 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec network_type_list = network_type list [@@ocaml.doc ""]

type nonrec subnet = {
  supported_network_types : network_type_list option;
      [@ocaml.doc
        "The network types supported by this subnet. Returns an array of strings that can include \
         'ipv4', 'ipv6', or both, indicating whether the subnet supports IPv4 only, IPv6 only, or \
         dual-stack deployments.\n"]
  availability_zone : availability_zone option;
      [@ocaml.doc "The Availability Zone where the subnet resides\n"]
  identifier : string_ option; [@ocaml.doc "The unique identifier for the subnet.\n"]
}
[@@ocaml.doc
  "Represents the subnet associated with a cluster. This parameter refers to subnets defined in \
   Amazon Virtual Private Cloud (Amazon VPC) and used with MemoryDB.\n"]

type nonrec subnet_list = subnet list [@@ocaml.doc ""]

type nonrec subnet_group = {
  supported_network_types : network_type_list option;
      [@ocaml.doc
        "The network types supported by this subnet group. Returns an array of strings that can \
         include 'ipv4', 'ipv6', or both, indicating the IP address types that can be used for \
         clusters deployed in this subnet group.\n"]
  ar_n : string_ option; [@ocaml.doc "The ARN (Amazon Resource Name) of the subnet group.\n"]
  subnets : subnet_list option; [@ocaml.doc "A list of subnets associated with the subnet group.\n"]
  vpc_id : string_ option;
      [@ocaml.doc "The Amazon Virtual Private Cloud identifier (VPC ID) of the subnet group.\n"]
  description : string_ option; [@ocaml.doc "A description of the subnet group\n"]
  name : string_ option; [@ocaml.doc "The name of the subnet group\n"]
}
[@@ocaml.doc
  "Represents the output of one of the following operations:\n\n\
  \ {ul\n\
  \       {-  CreateSubnetGroup\n\
  \           \n\
  \            }\n\
  \       {-  UpdateSubnetGroup\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   A subnet group is a collection of subnets (typically private) that you can designate for \
   your clusters running in an Amazon Virtual Private Cloud (VPC) environment.\n\
  \   "]

type nonrec update_subnet_group_response = {
  subnet_group : subnet_group option; [@ocaml.doc "The updated subnet group\n"]
}
[@@ocaml.doc ""]

type nonrec subnet_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec update_subnet_group_request = {
  subnet_ids : subnet_identifier_list option;
      [@ocaml.doc "The EC2 subnet IDs for the subnet group.\n"]
  description : string_ option; [@ocaml.doc "A description of the subnet group\n"]
  subnet_group_name : string_; [@ocaml.doc "The name of the subnet group\n"]
}
[@@ocaml.doc ""]

type nonrec subnet_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of subnets allowed.\n"]

type nonrec subnet_not_allowed_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified subnet is not allowed for this operation.\n"]

type nonrec subnet_in_use = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The subnet is currently in use and cannot be deleted.\n"]

type nonrec subnet_group_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified subnet group does not exist.\n"]

type nonrec service_linked_role_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The required service-linked role was not found.\n"]

type nonrec invalid_subnet = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified subnet is not valid.\n"]

type nonrec update_strategy = UNCOORDINATED [@ocaml.doc ""] | COORDINATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec parameter_group = {
  ar_n : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the parameter group\n"]
  description : string_ option; [@ocaml.doc "A description of the parameter group\n"]
  family : string_ option;
      [@ocaml.doc
        "The name of the parameter group family that this parameter group is compatible with.\n"]
  name : string_ option; [@ocaml.doc "The name of the parameter group\n"]
}
[@@ocaml.doc
  "Represents the output of a CreateParameterGroup operation. A parameter group represents a \
   combination of specific values for the parameters that are passed to the engine software during \
   startup.\n"]

type nonrec update_parameter_group_response = {
  parameter_group : parameter_group option; [@ocaml.doc "The updated parameter group\n"]
}
[@@ocaml.doc ""]

type nonrec parameter_name_value = {
  parameter_value : string_ option; [@ocaml.doc "The value of the parameter\n"]
  parameter_name : string_ option; [@ocaml.doc "The name of the parameter\n"]
}
[@@ocaml.doc "Describes a name-value pair that is used to update the value of a parameter.\n"]

type nonrec parameter_name_value_list = parameter_name_value list [@@ocaml.doc ""]

type nonrec update_parameter_group_request = {
  parameter_name_values : parameter_name_value_list;
      [@ocaml.doc
        "An array of parameter names and values for the parameter update. You must supply at least \
         one parameter name and value; subsequent arguments are optional. A maximum of 20 \
         parameters may be updated per request.\n"]
  parameter_group_name : string_; [@ocaml.doc "The name of the parameter group to update.\n"]
}
[@@ocaml.doc ""]

type nonrec parameter_group_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified parameter group does not exist.\n"]

type nonrec invalid_parameter_group_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The parameter group is not in a valid state for the requested operation.\n"]

type nonrec regional_cluster = {
  ar_n : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) the Regional cluster\n"]
  status : string_ option; [@ocaml.doc "The status of the Regional cluster.\n"]
  region : string_ option; [@ocaml.doc "The Region the current Regional cluster is assigned to.\n"]
  cluster_name : string_ option; [@ocaml.doc "The name of the Regional cluster\n"]
}
[@@ocaml.doc "Represents a Regional cluster\n"]

type nonrec regional_cluster_list = regional_cluster list [@@ocaml.doc ""]

type nonrec boolean_optional = bool [@@ocaml.doc ""]

type nonrec multi_region_cluster = {
  ar_n : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the multi-Region cluster.\n"]
  tls_enabled : boolean_optional option;
      [@ocaml.doc "Indiciates if the multi-Region cluster is TLS enabled.\n"]
  multi_region_parameter_group_name : string_ option;
      [@ocaml.doc "The name of the multi-Region parameter group associated with the cluster.\n"]
  clusters : regional_cluster_list option;
      [@ocaml.doc "The clusters in this multi-Region cluster.\n"]
  number_of_shards : integer_optional option;
      [@ocaml.doc "The number of shards in the multi-Region cluster.\n"]
  engine_version : string_ option;
      [@ocaml.doc "The version of the engine used by the multi-Region cluster.\n"]
  engine : string_ option; [@ocaml.doc "The name of the engine used by the multi-Region cluster.\n"]
  node_type : string_ option; [@ocaml.doc "The node type used by the multi-Region cluster.\n"]
  status : string_ option; [@ocaml.doc "The current status of the multi-Region cluster.\n"]
  description : string_ option; [@ocaml.doc "The description of the multi-Region cluster.\n"]
  multi_region_cluster_name : string_ option; [@ocaml.doc "The name of the multi-Region cluster.\n"]
}
[@@ocaml.doc "Represents a multi-Region cluster.\n"]

type nonrec update_multi_region_cluster_response = {
  multi_region_cluster : multi_region_cluster option;
      [@ocaml.doc "The status of updating the multi-Region cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec shard_configuration_request = {
  shard_count : integer option; [@ocaml.doc "The number of shards in the cluster\n"]
}
[@@ocaml.doc "A request to configure the sharding properties of a cluster\n"]

type nonrec update_multi_region_cluster_request = {
  update_strategy : update_strategy option;
      [@ocaml.doc
        "The strategy to use for the update operation. Supported values are \"coordinated\" or \
         \"uncoordinated\".\n"]
  multi_region_parameter_group_name : string_ option;
      [@ocaml.doc "The new multi-Region parameter group to be associated with the cluster.\n"]
  shard_configuration : shard_configuration_request option; [@ocaml.doc ""]
  engine_version : string_ option;
      [@ocaml.doc "The new engine version to be used for the multi-Region cluster.\n"]
  description : string_ option; [@ocaml.doc "A new description for the multi-Region cluster.\n"]
  node_type : string_ option;
      [@ocaml.doc "The new node type to be used for the multi-Region cluster.\n"]
  multi_region_cluster_name : string_;
      [@ocaml.doc "The name of the multi-Region cluster to be updated.\n"]
}
[@@ocaml.doc ""]

type nonrec multi_region_parameter_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified multi-Region parameter group does not exist.\n"]

type nonrec multi_region_cluster_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified multi-Region cluster does not exist.\n"]

type nonrec invalid_multi_region_cluster_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested operation cannot be performed on the multi-Region cluster in its current state.\n"]

type nonrec double = float [@@ocaml.doc ""]

type nonrec slot_migration = {
  progress_percentage : double option;
      [@ocaml.doc "The percentage of the slot migration that is complete.\n"]
}
[@@ocaml.doc "Represents the progress of an online resharding operation.\n"]

type nonrec resharding_status = {
  slot_migration : slot_migration option;
      [@ocaml.doc "The status of the online resharding slot migration\n"]
}
[@@ocaml.doc "The status of the online resharding\n"]

type nonrec ac_ls_update_status = {
  acl_to_apply : acl_name option; [@ocaml.doc "A list of ACLs pending to be applied.\n"]
}
[@@ocaml.doc "The status of the ACL update\n"]

type nonrec service_update_status =
  | SCHEDULED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | NOT_APPLIED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pending_modified_service_update = {
  status : service_update_status option; [@ocaml.doc "The status of the service update\n"]
  service_update_name : string_ option; [@ocaml.doc "The unique ID of the service update\n"]
}
[@@ocaml.doc
  "Update action that has yet to be processed for the corresponding apply/stop request\n"]

type nonrec pending_modified_service_update_list = pending_modified_service_update list
[@@ocaml.doc ""]

type nonrec cluster_pending_updates = {
  service_updates : pending_modified_service_update_list option;
      [@ocaml.doc "A list of service updates being applied to the cluster\n"]
  ac_ls : ac_ls_update_status option;
      [@ocaml.doc "A list of ACLs associated with the cluster that are being updated\n"]
  resharding : resharding_status option;
      [@ocaml.doc "The status of an online resharding operation.\n"]
}
[@@ocaml.doc "A list of updates being applied to the cluster\n"]

type nonrec t_stamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec endpoint = {
  port : integer option; [@ocaml.doc "The port number that the engine is listening on.\n"]
  address : string_ option; [@ocaml.doc "The DNS hostname of the node.\n"]
}
[@@ocaml.doc
  "Represents the information required for client programs to connect to the cluster and its nodes.\n"]

type nonrec node = {
  endpoint : endpoint option; [@ocaml.doc "The hostname for connecting to this node.\n"]
  create_time : t_stamp option; [@ocaml.doc "The date and time when the node was created.\n"]
  availability_zone : string_ option;
      [@ocaml.doc "The Availability Zone in which the node resides\n"]
  status : string_ option; [@ocaml.doc "The status of the service update on the node\n"]
  name : string_ option;
      [@ocaml.doc
        "The node identifier. A node name is a numeric identifier (0001, 0002, etc.). The \
         combination of cluster name, shard name and node name uniquely identifies every node used \
         in a customer's Amazon account.\n"]
}
[@@ocaml.doc
  "Represents an individual node within a cluster. Each node runs its own instance of the \
   cluster's protocol-compliant caching software.\n"]

type nonrec node_list = node list [@@ocaml.doc ""]

type nonrec shard = {
  number_of_nodes : integer_optional option; [@ocaml.doc "The number of nodes in the shard\n"]
  nodes : node_list option;
      [@ocaml.doc "A list containing information about individual nodes within the shard\n"]
  slots : string_ option; [@ocaml.doc "The keyspace for this shard.\n"]
  status : string_ option;
      [@ocaml.doc
        "The current state of this replication group - creating, available, modifying, deleting.\n"]
  name : string_ option; [@ocaml.doc "The name of the shard\n"]
}
[@@ocaml.doc
  "Represents a collection of nodes in a cluster. One node in the node group is the read/write \
   primary node. All the other nodes are read-only Replica nodes.\n"]

type nonrec shard_list = shard list [@@ocaml.doc ""]

type nonrec az_status = MultiAZ [@ocaml.doc ""] | SingleAZ [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec security_group_membership = {
  status : string_ option;
      [@ocaml.doc
        "The status of the security group membership. The status changes whenever a security group \
         is modified, or when the security groups assigned to a cluster are modified.\n"]
  security_group_id : string_ option; [@ocaml.doc "The identifier of the security group.\n"]
}
[@@ocaml.doc "Represents a single security group and its status.\n"]

type nonrec security_group_membership_list = security_group_membership list [@@ocaml.doc ""]

type nonrec data_tiering_status = FALSE [@ocaml.doc ""] | TRUE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ip_discovery = IPV6 [@ocaml.doc ""] | IPV4 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec cluster = {
  ip_discovery : ip_discovery option;
      [@ocaml.doc
        "The mechanism that the cluster uses to discover IP addresses. Returns 'ipv4' when DNS \
         endpoints resolve to IPv4 addresses, or 'ipv6' when DNS endpoints resolve to IPv6 \
         addresses.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "The IP address type for the cluster. Returns 'ipv4' for IPv4 only, 'ipv6' for IPv6 only, \
         or 'dual-stack' if the cluster supports both IPv4 and IPv6 addressing.\n"]
  data_tiering : data_tiering_status option;
      [@ocaml.doc
        "Enables data tiering. Data tiering is only supported for clusters using the r6gd node \
         type. This parameter must be set when using r6gd nodes. For more information, see \
         {{:https://docs.aws.amazon.com/memorydb/latest/devguide/data-tiering.html}Data tiering}.\n"]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "When set to true, the cluster will automatically receive minor engine version upgrades \
         after launch.\n"]
  acl_name : acl_name option;
      [@ocaml.doc "The name of the Access Control List associated with this cluster.\n"]
  snapshot_window : string_ option;
      [@ocaml.doc
        "The daily time range (in UTC) during which MemoryDB begins taking a daily snapshot of \
         your shard. Example: 05:00-09:00 If you do not specify this parameter, MemoryDB \
         automatically chooses an appropriate time range.\n"]
  maintenance_window : string_ option;
      [@ocaml.doc
        "Specifies the weekly time range during which maintenance on the cluster is performed. It \
         is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The \
         minimum maintenance window is a 60 minute period. \n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which MemoryDB retains automatic snapshots before deleting them. \
         For example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is \
         retained for 5 days before being deleted.\n"]
  sns_topic_status : string_ option;
      [@ocaml.doc "The SNS topic must be in Active status to receive notifications\n"]
  sns_topic_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the SNS notification topic\n"]
  ar_n : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the cluster.\n"]
  kms_key_id : string_ option; [@ocaml.doc "The ID of the KMS key used to encrypt the cluster\n"]
  tls_enabled : boolean_optional option;
      [@ocaml.doc "A flag to indicate if In-transit encryption is enabled\n"]
  subnet_group_name : string_ option;
      [@ocaml.doc "The name of the subnet group used by the cluster\n"]
  security_groups : security_group_membership_list option;
      [@ocaml.doc "A list of security groups used by the cluster\n"]
  parameter_group_status : string_ option;
      [@ocaml.doc
        "The status of the parameter group used by the cluster, for example 'active' or 'applying'.\n"]
  parameter_group_name : string_ option;
      [@ocaml.doc "The name of the parameter group used by the cluster\n"]
  engine_patch_version : string_ option;
      [@ocaml.doc "The Redis OSS engine patch version used by the cluster\n"]
  engine_version : string_ option; [@ocaml.doc "The Redis OSS engine version used by the cluster\n"]
  engine : string_ option; [@ocaml.doc "The name of the engine used by the cluster.\n"]
  node_type : string_ option; [@ocaml.doc "The cluster's node type\n"]
  cluster_endpoint : endpoint option; [@ocaml.doc "The cluster's configuration endpoint\n"]
  availability_mode : az_status option;
      [@ocaml.doc
        "Indicates if the cluster has a Multi-AZ configuration (multiaz) or not (singleaz).\n"]
  shards : shard_list option; [@ocaml.doc "A list of shards that are members of the cluster.\n"]
  number_of_shards : integer_optional option; [@ocaml.doc "The number of shards in the cluster\n"]
  multi_region_cluster_name : string_ option;
      [@ocaml.doc "The name of the multi-Region cluster that this cluster belongs to.\n"]
  pending_updates : cluster_pending_updates option;
      [@ocaml.doc "A group of settings that are currently being applied.\n"]
  status : string_ option;
      [@ocaml.doc "The status of the cluster. For example, Available, Updating, Creating.\n"]
  description : string_ option; [@ocaml.doc "A description of the cluster\n"]
  name : string_ option;
      [@ocaml.doc
        "The user-supplied name of the cluster. This identifier is a unique key that identifies a \
         cluster.\n"]
}
[@@ocaml.doc "Contains all of the attributes of a specific cluster.\n"]

type nonrec update_cluster_response = {
  cluster : cluster option; [@ocaml.doc "The updated cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec security_group_ids_list = string_ list [@@ocaml.doc ""]

type nonrec replica_configuration_request = {
  replica_count : integer option; [@ocaml.doc "The number of replicas to scale up or down to\n"]
}
[@@ocaml.doc "A request to configure the number of replicas in a shard\n"]

type nonrec update_cluster_request = {
  ip_discovery : ip_discovery option;
      [@ocaml.doc
        "The mechanism for discovering IP addresses for the cluster discovery protocol. Valid \
         values are 'ipv4' or 'ipv6'. When set to 'ipv4', cluster discovery functions such as \
         cluster slots, cluster shards, and cluster nodes will return IPv4 addresses for cluster \
         nodes. When set to 'ipv6', the cluster discovery functions return IPv6 addresses for \
         cluster nodes. The value must be compatible with the NetworkType parameter. If not \
         specified, the default is 'ipv4'.\n"]
  acl_name : acl_name option;
      [@ocaml.doc "The Access Control List that is associated with the cluster.\n"]
  shard_configuration : shard_configuration_request option;
      [@ocaml.doc "The number of shards in the cluster.\n"]
  replica_configuration : replica_configuration_request option;
      [@ocaml.doc "The number of replicas that will reside in each shard.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The upgraded version of the engine to be run on the nodes. You can upgrade to a newer \
         engine version, but you cannot downgrade to an earlier engine version. If you want to use \
         an earlier engine version, you must delete the existing cluster and create it anew with \
         the earlier engine version.\n"]
  engine : string_ option; [@ocaml.doc "The name of the engine to be used for the cluster.\n"]
  node_type : string_ option;
      [@ocaml.doc "A valid node type that you want to scale this cluster up or down to.\n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which MemoryDB retains automatic cluster snapshots before deleting \
         them. For example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken \
         today is retained for 5 days before being deleted.\n"]
  snapshot_window : string_ option;
      [@ocaml.doc
        "The daily time range (in UTC) during which MemoryDB begins taking a daily snapshot of \
         your cluster.\n"]
  parameter_group_name : string_ option; [@ocaml.doc "The name of the parameter group to update.\n"]
  sns_topic_status : string_ option;
      [@ocaml.doc
        "The status of the Amazon SNS notification topic. Notifications are sent only if the \
         status is active.\n"]
  sns_topic_arn : string_ option; [@ocaml.doc "The SNS topic ARN to update.\n"]
  maintenance_window : string_ option;
      [@ocaml.doc
        "Specifies the weekly time range during which maintenance on the cluster is performed. It \
         is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The \
         minimum maintenance window is a 60 minute period.\n\n\
        \ Valid values for [ddd] are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [sun] \n\
        \            \n\
        \             }\n\
        \        {-   [mon] \n\
        \            \n\
        \             }\n\
        \        {-   [tue] \n\
        \            \n\
        \             }\n\
        \        {-   [wed] \n\
        \            \n\
        \             }\n\
        \        {-   [thu] \n\
        \            \n\
        \             }\n\
        \        {-   [fri] \n\
        \            \n\
        \             }\n\
        \        {-   [sat] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [sun:23:00-mon:01:30] \n\
        \   "]
  security_group_ids : security_group_ids_list option;
      [@ocaml.doc "The SecurityGroupIds to update.\n"]
  description : string_ option; [@ocaml.doc "The description of the cluster to update.\n"]
  cluster_name : string_; [@ocaml.doc "The name of the cluster to update.\n"]
}
[@@ocaml.doc ""]

type nonrec shards_per_cluster_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of shards allowed \
   per cluster.\n"]

type nonrec no_operation_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested operation would result in no changes.\n"]

type nonrec node_quota_for_customer_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of nodes allowed for \
   this customer.\n"]

type nonrec node_quota_for_cluster_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of nodes allowed for \
   this cluster.\n"]

type nonrec invalid_vpc_network_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The VPC network is not in a valid state for the requested operation.\n"]

type nonrec invalid_node_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The node is not in a valid state for the requested operation.\n"]

type nonrec invalid_kms_key_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified KMS key is not valid or accessible.\n"]

type nonrec invalid_cluster_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The cluster is not in a valid state for the requested operation.\n"]

type nonrec invalid_acl_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The ACL is not in a valid state for the requested operation.\n"]

type nonrec cluster_quota_for_customer_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of clusters allowed \
   for this customer.\n"]

type nonrec cluster_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified cluster does not exist.\n"]

type nonrec acl_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified ACL does not exist.\n"]

type nonrec acl_pending_changes = {
  user_names_to_add : user_name_list option; [@ocaml.doc "A list of users being added to the ACL\n"]
  user_names_to_remove : user_name_list option;
      [@ocaml.doc "A list of user names being removed from the ACL\n"]
}
[@@ocaml.doc "Returns the updates being applied to the ACL.\n"]

type nonrec acl_cluster_name_list = string_ list [@@ocaml.doc ""]

type nonrec ac_l = {
  ar_n : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the ACL\n"]
  clusters : acl_cluster_name_list option;
      [@ocaml.doc "A list of clusters associated with the ACL.\n"]
  pending_changes : acl_pending_changes option;
      [@ocaml.doc "A list of updates being applied to the ACL.\n"]
  minimum_engine_version : string_ option;
      [@ocaml.doc "The minimum engine version supported for the ACL\n"]
  user_names : user_name_list option;
      [@ocaml.doc "The list of user names that belong to the ACL.\n"]
  status : string_ option;
      [@ocaml.doc
        "Indicates ACL status. Can be \"creating\", \"active\", \"modifying\", \"deleting\".\n"]
  name : string_ option; [@ocaml.doc "The name of the Access Control List\n"]
}
[@@ocaml.doc
  "An Access Control List. You can authenticate users with Access Contol Lists. ACLs enable you to \
   control cluster access by grouping users. These Access control lists are designed as a way to \
   organize access to clusters.\n"]

type nonrec update_acl_response = {
  ac_l : ac_l option; [@ocaml.doc "The updated Access Control List.\n"]
}
[@@ocaml.doc ""]

type nonrec update_acl_request = {
  user_names_to_remove : user_name_list_input option;
      [@ocaml.doc "The list of users to remove from the Access Control List.\n"]
  user_names_to_add : user_name_list_input option;
      [@ocaml.doc "The list of users to add to the Access Control List.\n"]
  acl_name : string_; [@ocaml.doc "The name of the Access Control List.\n"]
}
[@@ocaml.doc ""]

type nonrec duplicate_user_name_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A user with the specified name already exists.\n"]

type nonrec default_user_required = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A default user is required and must be specified.\n"]

type nonrec tag = {
  value : string_ option; [@ocaml.doc "The tag's value. May be null.\n"]
  key : string_ option; [@ocaml.doc "The key for the tag. May not be null.\n"]
}
[@@ocaml.doc
  "A tag that can be added to an MemoryDB resource. Tags are composed of a Key/Value pair. You can \
   use tags to categorize and track all your MemoryDB resources. When you add or remove tags on \
   clusters, those actions will be replicated to all nodes in the cluster. A tag with a null Value \
   is permitted. For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/tagging-resources.html}Tagging your \
   MemoryDB resources} \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec untag_resource_response = {
  tag_list : tag_list option; [@ocaml.doc "The list of tags removed.\n"]
}
[@@ocaml.doc ""]

type nonrec key_list = string_ list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : key_list; [@ocaml.doc "The list of keys of the tags that are to be removed.\n"]
  resource_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource to which the tags are to be removed.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified tag does not exist.\n"]

type nonrec snapshot_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified snapshot does not exist.\n"]

type nonrec invalid_arn_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified Amazon Resource Name (ARN) is not valid.\n"]

type nonrec unprocessed_cluster = {
  error_message : string_ option;
      [@ocaml.doc "The error message associated with the update failure\n"]
  error_type : string_ option; [@ocaml.doc "The error type associated with the update failure\n"]
  cluster_name : string_ option; [@ocaml.doc "The name of the cluster\n"]
}
[@@ocaml.doc "A cluster whose updates have failed\n"]

type nonrec unprocessed_cluster_list = unprocessed_cluster list [@@ocaml.doc ""]

type nonrec test_failover_not_available_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Test failover is not available for this cluster configuration.\n"]

type nonrec target_bucket = string [@@ocaml.doc ""]

type nonrec tag_resource_response = {
  tag_list : tag_list option; [@ocaml.doc "A list of tags as key-value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
  resource_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource to which the tags are to be added.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_quota_per_resource_exceeded = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of tags allowed per \
   resource.\n"]

type nonrec subnet_group_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of subnet groups \
   allowed.\n"]

type nonrec subnet_group_list = subnet_group list [@@ocaml.doc ""]

type nonrec subnet_group_in_use_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The subnet group is currently in use and cannot be deleted.\n"]

type nonrec subnet_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A subnet group with the specified name already exists.\n"]

type nonrec source_type =
  | Acl [@ocaml.doc ""]
  | User [@ocaml.doc ""]
  | Cluster [@ocaml.doc ""]
  | Subnet_group [@ocaml.doc ""]
  | Parameter_group [@ocaml.doc ""]
  | Node [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snapshot_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of snapshots allowed.\n"]

type nonrec shard_configuration = {
  replica_count : integer_optional option;
      [@ocaml.doc "The number of read replica nodes in this shard.\n"]
  slots : string_ option;
      [@ocaml.doc
        "A string that specifies the keyspace for a particular node group. Keyspaces range from 0 \
         to 16,383. The string is in the format startkey-endkey.\n"]
}
[@@ocaml.doc
  "Shard configuration options. Each shard configuration has the following: Slots and ReplicaCount.\n"]

type nonrec shard_detail = {
  snapshot_creation_time : t_stamp option;
      [@ocaml.doc "The date and time that the shard's snapshot was created\n"]
  size : string_ option; [@ocaml.doc "The size of the shard's snapshot\n"]
  configuration : shard_configuration option;
      [@ocaml.doc "The configuration details of the shard\n"]
  name : string_ option; [@ocaml.doc "The name of the shard\n"]
}
[@@ocaml.doc "Provides details of a shard in a snapshot\n"]

type nonrec shard_details = shard_detail list [@@ocaml.doc ""]

type nonrec cluster_configuration = {
  multi_region_cluster_name : string_ option;
      [@ocaml.doc
        "The name for the multi-Region cluster associated with the cluster configuration.\n"]
  multi_region_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the multi-Region parameter group associated with the cluster configuration.\n"]
  shards : shard_details option; [@ocaml.doc "The list of shards in the cluster\n"]
  num_shards : integer_optional option; [@ocaml.doc "The number of shards in the cluster\n"]
  snapshot_window : string_ option; [@ocaml.doc "The snapshot window set by the cluster\n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc "The snapshot retention limit set by the cluster\n"]
  vpc_id : string_ option; [@ocaml.doc "The ID of the VPC the cluster belongs to\n"]
  subnet_group_name : string_ option;
      [@ocaml.doc "The name of the subnet group used by the cluster\n"]
  parameter_group_name : string_ option;
      [@ocaml.doc "The name of parameter group used by the cluster\n"]
  port : integer_optional option; [@ocaml.doc "The port used by the cluster\n"]
  topic_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the SNS notification topic for the cluster\n"]
  maintenance_window : string_ option;
      [@ocaml.doc "The specified maintenance window for the cluster\n"]
  engine_version : string_ option; [@ocaml.doc "The Redis OSS engine version used by the cluster\n"]
  engine : string_ option;
      [@ocaml.doc "The name of the engine used by the cluster configuration.\n"]
  node_type : string_ option; [@ocaml.doc "The node type used for the cluster\n"]
  description : string_ option; [@ocaml.doc "The description of the cluster configuration\n"]
  name : string_ option; [@ocaml.doc "The name of the cluster\n"]
}
[@@ocaml.doc "A list of cluster configuration options. \n"]

type nonrec snapshot = {
  data_tiering : data_tiering_status option;
      [@ocaml.doc
        "Enables data tiering. Data tiering is only supported for clusters using the r6gd node \
         type. This parameter must be set when using r6gd nodes. For more information, see \
         {{:https://docs.aws.amazon.com/memorydb/latest/devguide/data-tiering.html}Data tiering}.\n"]
  cluster_configuration : cluster_configuration option;
      [@ocaml.doc "The configuration of the cluster from which the snapshot was taken\n"]
  ar_n : string_ option; [@ocaml.doc "The ARN (Amazon Resource Name) of the snapshot.\n"]
  kms_key_id : string_ option; [@ocaml.doc "The ID of the KMS key used to encrypt the snapshot.\n"]
  source : string_ option;
      [@ocaml.doc
        "Indicates whether the snapshot is from an automatic backup (automated) or was created \
         manually (manual).\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the snapshot. Valid values: creating | available | restoring | copying | \
         deleting.\n"]
  name : string_ option; [@ocaml.doc "The name of the snapshot\n"]
}
[@@ocaml.doc "Represents a copy of an entire cluster as of the time when the snapshot was taken.\n"]

type nonrec snapshot_list = snapshot list [@@ocaml.doc ""]

type nonrec snapshot_arns_list = string_ list [@@ocaml.doc ""]

type nonrec snapshot_already_exists_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A snapshot with the specified name already exists.\n"]

type nonrec shard_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified shard does not exist.\n"]

type nonrec service_update_type = SECURITY_UPDATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec service_update_status_list = service_update_status list [@@ocaml.doc ""]

type nonrec service_update_request = {
  service_update_name_to_apply : string_ option; [@ocaml.doc "The unique ID of the service update\n"]
}
[@@ocaml.doc "A request to apply a service update\n"]

type nonrec service_update_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified service update does not exist.\n"]

type nonrec service_update = {
  auto_update_start_date : t_stamp option;
      [@ocaml.doc "The date at which the service update will be automatically applied\n"]
  nodes_updated : string_ option; [@ocaml.doc "A list of nodes updated by the service update\n"]
  engine : string_ option;
      [@ocaml.doc "The name of the engine for which a service update is available.\n"]
  type_ : service_update_type option; [@ocaml.doc "Reflects the nature of the service update\n"]
  status : service_update_status option; [@ocaml.doc "The status of the service update\n"]
  description : string_ option; [@ocaml.doc "Provides details of the service update\n"]
  release_date : t_stamp option;
      [@ocaml.doc "The date when the service update is initially available\n"]
  service_update_name : string_ option; [@ocaml.doc "The unique ID of the service update\n"]
  cluster_name : string_ option;
      [@ocaml.doc "The name of the cluster to which the service update applies\n"]
}
[@@ocaml.doc "An update that you can apply to your MemoryDB clusters.\n"]

type nonrec service_update_list = service_update list [@@ocaml.doc ""]

type nonrec reset_parameter_group_response = {
  parameter_group : parameter_group option; [@ocaml.doc "The parameter group being reset.\n"]
}
[@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec parameter_name_list = string_ list [@@ocaml.doc ""]

type nonrec reset_parameter_group_request = {
  parameter_names : parameter_name_list option;
      [@ocaml.doc
        "An array of parameter names to reset to their default values. If AllParameters is true, \
         do not use ParameterNames. If AllParameters is false, you must specify the name of at \
         least one parameter to reset.\n"]
  all_parameters : boolean_ option;
      [@ocaml.doc
        "If true, all parameters in the parameter group are reset to their default values. If \
         false, only the parameters listed by ParameterNames are reset to their default values.\n"]
  parameter_group_name : string_; [@ocaml.doc "The name of the parameter group to reset.\n"]
}
[@@ocaml.doc ""]

type nonrec reserved_nodes_offering_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The requested node offering does not exist. \n"]

type nonrec recurring_charge = {
  recurring_charge_frequency : string_ option;
      [@ocaml.doc "The frequency of the recurring price charged to run this reserved node.\n"]
  recurring_charge_amount : double option;
      [@ocaml.doc "The amount of the recurring charge to run this reserved node.\n"]
}
[@@ocaml.doc "The recurring charge to run this reserved node.\n"]

type nonrec recurring_charge_list = recurring_charge list [@@ocaml.doc ""]

type nonrec reserved_nodes_offering = {
  recurring_charges : recurring_charge_list option;
      [@ocaml.doc "The recurring price charged to run this reserved node.\n"]
  offering_type : string_ option; [@ocaml.doc "The offering type of this reserved node.\n"]
  fixed_price : double option; [@ocaml.doc "The fixed price charged for this reserved node.\n"]
  duration : integer option; [@ocaml.doc "The duration of the reservation in seconds.\n"]
  node_type : string_ option;
      [@ocaml.doc
        "The node type for the reserved nodes. For more information, see \
         {{:https://docs.aws.amazon.com/memorydb/latest/devguide/nodes.reserved.html#reserved-nodes-supported}Supported \
         node types}.\n"]
  reserved_nodes_offering_id : string_ option; [@ocaml.doc "The offering identifier.\n"]
}
[@@ocaml.doc "The offering type of this node.\n"]

type nonrec reserved_nodes_offering_list = reserved_nodes_offering list [@@ocaml.doc ""]

type nonrec reserved_node_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request cannot be processed because it would exceed the user's node quota.\n"]

type nonrec reserved_node_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested node does not exist.\n"]

type nonrec reserved_node = {
  ar_n : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the reserved node.\n"]
  recurring_charges : recurring_charge_list option;
      [@ocaml.doc "The recurring price charged to run this reserved node.\n"]
  state : string_ option; [@ocaml.doc "The state of the reserved node.\n"]
  offering_type : string_ option; [@ocaml.doc "The offering type of this reserved node.\n"]
  node_count : integer option; [@ocaml.doc "The number of nodes that have been reserved.\n"]
  fixed_price : double option; [@ocaml.doc "The fixed price charged for this reserved node.\n"]
  duration : integer option; [@ocaml.doc "The duration of the reservation in seconds.\n"]
  start_time : t_stamp option; [@ocaml.doc "The time the reservation started.\n"]
  node_type : string_ option; [@ocaml.doc "The node type for the reserved nodes.\n"]
  reserved_nodes_offering_id : string_ option;
      [@ocaml.doc "The ID of the reserved node offering to purchase.\n"]
  reservation_id : string_ option;
      [@ocaml.doc "A customer-specified identifier to track this reservation.\n"]
}
[@@ocaml.doc "Represents the output of a [PurchaseReservedNodesOffering] operation.\n"]

type nonrec reserved_node_list = reserved_node list [@@ocaml.doc ""]

type nonrec reserved_node_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You already have a reservation with the given identifier.\n"]

type nonrec purchase_reserved_nodes_offering_response = {
  reserved_node : reserved_node option;
      [@ocaml.doc "Represents the output of a [PurchaseReservedNodesOffering] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec purchase_reserved_nodes_offering_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
  node_count : integer_optional option; [@ocaml.doc "The number of node instances to reserve.\n"]
  reservation_id : string_ option;
      [@ocaml.doc "A customer-specified identifier to track this reservation.\n"]
  reserved_nodes_offering_id : string_;
      [@ocaml.doc "The ID of the reserved node offering to purchase.\n"]
}
[@@ocaml.doc ""]

type nonrec parameter = {
  minimum_engine_version : string_ option;
      [@ocaml.doc "The earliest engine version to which the parameter can apply.\n"]
  allowed_values : string_ option; [@ocaml.doc "The valid range of values for the parameter.\n"]
  data_type : string_ option; [@ocaml.doc "The parameter's data type\n"]
  description : string_ option; [@ocaml.doc "A description of the parameter\n"]
  value : string_ option; [@ocaml.doc "The value of the parameter\n"]
  name : string_ option; [@ocaml.doc "The name of the parameter\n"]
}
[@@ocaml.doc "Describes an individual setting that controls some aspect of MemoryDB behavior.\n"]

type nonrec parameters_list = parameter list [@@ocaml.doc ""]

type nonrec parameter_group_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of parameter groups \
   allowed.\n"]

type nonrec parameter_group_list = parameter_group list [@@ocaml.doc ""]

type nonrec parameter_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A parameter group with the specified name already exists.\n"]

type nonrec node_type_list = string_ list [@@ocaml.doc ""]

type nonrec multi_region_parameter = {
  minimum_engine_version : string_ option;
      [@ocaml.doc "The earliest engine version to which the parameter can apply.\n"]
  allowed_values : string_ option; [@ocaml.doc "The valid range of values for the parameter.\n"]
  data_type : string_ option; [@ocaml.doc "The valid data type for the parameter.\n"]
  source : string_ option;
      [@ocaml.doc
        "Indicates the source of the parameter value. Valid values: user | system | engine-default\n"]
  description : string_ option; [@ocaml.doc "A description of the parameter.\n"]
  value : string_ option; [@ocaml.doc "The value of the parameter.\n"]
  name : string_ option; [@ocaml.doc "The name of the parameter.\n"]
}
[@@ocaml.doc
  "Describes an individual setting that controls some aspect of MemoryDB behavior across multiple \
   regions.\n"]

type nonrec multi_region_parameters_list = multi_region_parameter list [@@ocaml.doc ""]

type nonrec multi_region_parameter_group = {
  ar_n : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the multi-region parameter group.\n"]
  description : string_ option; [@ocaml.doc "A description of the multi-region parameter group.\n"]
  family : string_ option;
      [@ocaml.doc
        "The name of the parameter group family that this multi-region parameter group is \
         compatible with.\n"]
  name : string_ option; [@ocaml.doc "The name of the multi-region parameter group.\n"]
}
[@@ocaml.doc
  "Represents the output of a CreateMultiRegionParameterGroup operation. A multi-region parameter \
   group represents a collection of parameters that can be applied to clusters across multiple \
   regions.\n"]

type nonrec multi_region_parameter_group_list = multi_region_parameter_group list [@@ocaml.doc ""]

type nonrec multi_region_cluster_list = multi_region_cluster list [@@ocaml.doc ""]

type nonrec multi_region_cluster_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A multi-Region cluster with the specified name already exists.\n"]

type nonrec list_tags_response = {
  tag_list : tag_list option; [@ocaml.doc "A list of tags as key-value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_request = {
  resource_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource for which you want the list of tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_allowed_node_type_updates_response = {
  scale_down_node_types : node_type_list option;
      [@ocaml.doc "A list node types which you can use to scale down your cluster.\n"]
  scale_up_node_types : node_type_list option;
      [@ocaml.doc "A list node types which you can use to scale up your cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec list_allowed_node_type_updates_request = {
  cluster_name : string_;
      [@ocaml.doc
        "The name of the cluster you want to scale. MemoryDB uses the cluster name to identify the \
         current node type being used by this cluster, and from that to create a list of node \
         types you can scale up to.\n"]
}
[@@ocaml.doc ""]

type nonrec list_allowed_multi_region_cluster_updates_response = {
  scale_down_node_types : node_type_list option;
      [@ocaml.doc "The node types that the cluster can be scaled down to.\n"]
  scale_up_node_types : node_type_list option;
      [@ocaml.doc "The node types that the cluster can be scaled up to.\n"]
}
[@@ocaml.doc ""]

type nonrec list_allowed_multi_region_cluster_updates_request = {
  multi_region_cluster_name : string_; [@ocaml.doc "The name of the multi-Region cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec invalid_snapshot_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The snapshot is not in a valid state for the requested operation.\n"]

type nonrec invalid_credentials_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The provided credentials are not valid.\n"]

type nonrec insufficient_cluster_capacity_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The cluster does not have sufficient capacity to perform the requested operation.\n"]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_value_list = filter_value list [@@ocaml.doc ""]

type nonrec filter_name = string [@@ocaml.doc ""]

type nonrec filter = {
  values : filter_value_list;
      [@ocaml.doc "The property values to filter on. For example, \"user-123\".\n"]
  name : filter_name; [@ocaml.doc "The property being filtered. For example, UserName.\n"]
}
[@@ocaml.doc "Used to streamline results of a search based on the property being filtered.\n"]

type nonrec filter_list = filter list [@@ocaml.doc ""]

type nonrec failover_shard_response = {
  cluster : cluster option; [@ocaml.doc "The cluster being failed over.\n"]
}
[@@ocaml.doc ""]

type nonrec failover_shard_request = {
  shard_name : string_; [@ocaml.doc "The name of the shard.\n"]
  cluster_name : string_; [@ocaml.doc "The cluster being failed over.\n"]
}
[@@ocaml.doc ""]

type nonrec api_call_rate_for_customer_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The customer has exceeded the maximum number of API requests allowed per time period.\n"]

type nonrec event = {
  date : t_stamp option; [@ocaml.doc "The date and time when the event occurred.\n"]
  message : string_ option; [@ocaml.doc "The text of the event.\n"]
  source_type : source_type option;
      [@ocaml.doc
        "Specifies the origin of this event - a cluster, a parameter group, a security group, etc.\n"]
  source_name : string_ option;
      [@ocaml.doc
        "The name for the source of the event. For example, if the event occurred at the cluster \
         level, the identifier would be the name of the cluster.\n"]
}
[@@ocaml.doc
  "Represents a single occurrence of something interesting within the system. Some examples of \
   events are creating a cluster or adding or removing a node.\n"]

type nonrec event_list = event list [@@ocaml.doc ""]

type nonrec engine_version_info = {
  parameter_group_family : string_ option;
      [@ocaml.doc
        "Specifies the name of the parameter group family to which the engine default parameters \
         apply.\n"]
  engine_patch_version : string_ option; [@ocaml.doc "The patched engine version\n"]
  engine_version : string_ option; [@ocaml.doc "The engine version\n"]
  engine : string_ option;
      [@ocaml.doc "The name of the engine for which version information is provided.\n"]
}
[@@ocaml.doc "Provides details of the Redis OSS engine version\n"]

type nonrec engine_version_info_list = engine_version_info list [@@ocaml.doc ""]

type nonrec describe_users_response = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  users : user_list option; [@ocaml.doc "A list of users.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_users_request = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  filters : filter_list option; [@ocaml.doc "Filter to determine the list of users to return.\n"]
  user_name : user_name option; [@ocaml.doc "The name of the user.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_subnet_groups_response = {
  subnet_groups : subnet_group_list option;
      [@ocaml.doc
        "A list of subnet groups. Each element in the list contains detailed information about one \
         group.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_subnet_groups_request = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  subnet_group_name : string_ option;
      [@ocaml.doc "The name of the subnet group to return details for.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_snapshots_response = {
  snapshots : snapshot_list option;
      [@ocaml.doc
        "A list of snapshots. Each item in the list contains detailed information about one \
         snapshot.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_snapshots_request = {
  show_detail : boolean_optional option;
      [@ocaml.doc
        "A Boolean value which if true, the shard configuration is included in the snapshot \
         description.\n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  source : string_ option;
      [@ocaml.doc
        "If set to system, the output shows snapshots that were automatically created by MemoryDB. \
         If set to user the output shows snapshots that were manually created. If omitted, the \
         output shows both automatically and manually created snapshots.\n"]
  snapshot_name : string_ option;
      [@ocaml.doc
        "A user-supplied name of the snapshot. If this parameter is specified, only this named \
         snapshot is described.\n"]
  cluster_name : string_ option;
      [@ocaml.doc
        "A user-supplied cluster identifier. If this parameter is specified, only snapshots \
         associated with that specific cluster are described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_service_updates_response = {
  service_updates : service_update_list option; [@ocaml.doc "A list of service updates\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
}
[@@ocaml.doc ""]

type nonrec cluster_name_list = string_ list [@@ocaml.doc ""]

type nonrec describe_service_updates_request = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  status : service_update_status_list option;
      [@ocaml.doc "The status(es) of the service updates to filter on.\n"]
  cluster_names : cluster_name_list option;
      [@ocaml.doc "The list of cluster names to identify service updates to apply.\n"]
  service_update_name : string_ option;
      [@ocaml.doc "The unique ID of the service update to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_reserved_nodes_response = {
  reserved_nodes : reserved_node_list option;
      [@ocaml.doc
        "Returns information about reserved nodes for this account, or about a specified reserved \
         node.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by MaxRecords.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_reserved_nodes_request = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by MaxRecords.\n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxRecords value, a marker is included in the response so that the remaining \
         results can be retrieved.\n"]
  offering_type : string_ option;
      [@ocaml.doc
        "The offering type filter value. Use this parameter to show only the available offerings \
         matching the specified offering type. Valid values: \"All Upfront\"|\"Partial Upfront\"| \
         \"No Upfront\"\n"]
  duration : string_ option;
      [@ocaml.doc
        "The duration filter value, specified in years or seconds. Use this parameter to show only \
         reservations for this duration.\n"]
  node_type : string_ option;
      [@ocaml.doc
        "The node type filter value. Use this parameter to show only those reservations matching \
         the specified node type. For more information, see \
         {{:https://docs.aws.amazon.com/memorydb/latest/devguide/nodes.reserved.html#reserved-nodes-supported}Supported \
         node types}.\n"]
  reserved_nodes_offering_id : string_ option;
      [@ocaml.doc
        "The offering identifier filter value. Use this parameter to show only purchased \
         reservations matching the specified offering identifier.\n"]
  reservation_id : string_ option;
      [@ocaml.doc
        "The reserved node identifier filter value. Use this parameter to show only the \
         reservation that matches the specified reservation ID.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_reserved_nodes_offerings_response = {
  reserved_nodes_offerings : reserved_nodes_offering_list option;
      [@ocaml.doc "Lists available reserved node offerings.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by MaxRecords.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_reserved_nodes_offerings_request = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by MaxRecords.\n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxRecords value, a marker is included in the response so that the remaining \
         results can be retrieved.\n"]
  offering_type : string_ option;
      [@ocaml.doc
        "The offering type filter value. Use this parameter to show only the available offerings \
         matching the specified offering type. Valid values: \"All Upfront\"|\"Partial Upfront\"| \
         \"No Upfront\"\n"]
  duration : string_ option;
      [@ocaml.doc
        "Duration filter value, specified in years or seconds. Use this parameter to show only \
         reservations for a given duration.\n"]
  node_type : string_ option;
      [@ocaml.doc
        "The node type for the reserved nodes. For more information, see \
         {{:https://docs.aws.amazon.com/memorydb/latest/devguide/nodes.reserved.html#reserved-nodes-supported}Supported \
         node types}.\n"]
  reserved_nodes_offering_id : string_ option;
      [@ocaml.doc
        "The offering identifier filter value. Use this parameter to show only the available \
         offering that matches the specified reservation identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_parameters_response = {
  parameters : parameters_list option;
      [@ocaml.doc
        "A list of parameters specific to a particular parameter group. Each element in the list \
         contains detailed information about one parameter.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_parameters_request = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  parameter_group_name : string_;
      [@ocaml.doc "he name of a specific parameter group to return details for.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_parameter_groups_response = {
  parameter_groups : parameter_group_list option;
      [@ocaml.doc
        "A list of parameter groups. Each element in the list contains detailed information about \
         one parameter group.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_parameter_groups_request = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  parameter_group_name : string_ option;
      [@ocaml.doc "The name of a specific parameter group to return details for.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_multi_region_parameters_response = {
  multi_region_parameters : multi_region_parameters_list option;
      [@ocaml.doc
        "A list of parameters specific to a particular multi-region parameter group. Each element \
         in the list contains detailed information about one parameter.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional token to include in the response. If this token is provided, the response \
         includes only results beyond the token, up to the value specified by MaxResults.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_multi_region_parameters_request = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional token returned from a prior request. Use this token for pagination of results \
         from this action. If this parameter is specified, the response includes only results \
         beyond the token, up to the value specified by MaxResults.\n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  source : string_ option;
      [@ocaml.doc "The parameter types to return. Valid values: user | system | engine-default\n"]
  multi_region_parameter_group_name : string_;
      [@ocaml.doc "The name of the multi-region parameter group to return details for.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_multi_region_parameter_groups_response = {
  multi_region_parameter_groups : multi_region_parameter_group_list option;
      [@ocaml.doc
        "A list of multi-region parameter groups. Each element in the list contains detailed \
         information about one parameter group.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional token to include in the response. If this token is provided, the response \
         includes only results beyond the token, up to the value specified by MaxResults.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_multi_region_parameter_groups_request = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional token returned from a prior request. Use this token for pagination of results \
         from this action. If this parameter is specified, the response includes only results \
         beyond the token, up to the value specified by MaxResults.\n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  multi_region_parameter_group_name : string_ option;
      [@ocaml.doc "The request for information on a specific multi-region parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_multi_region_clusters_response = {
  multi_region_clusters : multi_region_cluster_list option;
      [@ocaml.doc "A list of multi-Region clusters.\n"]
  next_token : string_ option; [@ocaml.doc "A token to use to retrieve the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_multi_region_clusters_request = {
  show_cluster_details : boolean_optional option;
      [@ocaml.doc "Details about the multi-Region cluster.\n"]
  next_token : string_ option; [@ocaml.doc "A token to specify where to start paginating.\n"]
  max_results : integer_optional option; [@ocaml.doc "The maximum number of results to return.\n"]
  multi_region_cluster_name : string_ option;
      [@ocaml.doc "The name of a specific multi-Region cluster to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_events_response = {
  events : event_list option;
      [@ocaml.doc
        "A list of events. Each element in the list contains detailed information about one event.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_events_request = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  duration : integer_optional option;
      [@ocaml.doc "The number of minutes worth of events to retrieve.\n"]
  end_time : t_stamp option;
      [@ocaml.doc
        "The end of the time interval for which to retrieve events, specified in ISO 8601 format. \
         Example: 2017-03-30T07:03:49.555Z\n"]
  start_time : t_stamp option;
      [@ocaml.doc
        "The beginning of the time interval to retrieve events for, specified in ISO 8601 format. \
         Example: 2017-03-30T07:03:49.555Z\n"]
  source_type : source_type option;
      [@ocaml.doc
        "The event source to retrieve events for. If no value is specified, all events are returned.\n"]
  source_name : string_ option;
      [@ocaml.doc
        "The identifier of the event source for which events are returned. If not specified, all \
         sources are included in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_engine_versions_response = {
  engine_versions : engine_version_info_list option;
      [@ocaml.doc
        "A list of engine version details. Each element in the list contains detailed information \
         about one engine version.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_engine_versions_request = {
  default_only : boolean_ option;
      [@ocaml.doc
        "If true, specifies that only the default version of the specified engine or engine and \
         major version combination is to be returned.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  parameter_group_family : string_ option;
      [@ocaml.doc "The name of a specific parameter group family to return details for.\n"]
  engine_version : string_ option; [@ocaml.doc "The Redis OSS engine version\n"]
  engine : string_ option;
      [@ocaml.doc "The name of the engine for which to list available versions.\n"]
}
[@@ocaml.doc ""]

type nonrec cluster_list = cluster list [@@ocaml.doc ""]

type nonrec describe_clusters_response = {
  clusters : cluster_list option; [@ocaml.doc "A list of clusters\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_clusters_request = {
  show_shard_details : boolean_optional option;
      [@ocaml.doc
        "An optional flag that can be included in the request to retrieve information about the \
         individual shard(s).\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  cluster_name : string_ option; [@ocaml.doc "The name of the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec acl_list = ac_l list [@@ocaml.doc ""]

type nonrec describe_ac_ls_response = {
  next_token : string_ option;
      [@ocaml.doc
        "If nextToken is returned, there are more results available. The value of nextToken is a \
         unique pagination token for each page. Make the call again using the returned token to \
         retrieve the next page. Keep all other arguments unchanged. \n"]
  ac_ls : acl_list option; [@ocaml.doc "The list of ACLs.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_ac_ls_request = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional argument to pass in case the total number of records exceeds the value of \
         MaxResults. If nextToken is returned, there are more results available. The value of \
         nextToken is a unique pagination token for each page. Make the call again using the \
         returned token to retrieve the next page. Keep all other arguments unchanged. \n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxResults value, a token is included in the response so that the remaining \
         results can be retrieved.\n"]
  acl_name : string_ option; [@ocaml.doc "The name of the ACL.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_user_response = {
  user : user option; [@ocaml.doc "The user object that has been deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_user_request = {
  user_name : user_name; [@ocaml.doc "The name of the user to delete\n"]
}
[@@ocaml.doc ""]

type nonrec delete_subnet_group_response = {
  subnet_group : subnet_group option; [@ocaml.doc "The subnet group object that has been deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_subnet_group_request = {
  subnet_group_name : string_; [@ocaml.doc "The name of the subnet group to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_snapshot_response = {
  snapshot : snapshot option; [@ocaml.doc "The snapshot object that has been deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_snapshot_request = {
  snapshot_name : string_; [@ocaml.doc "The name of the snapshot to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_parameter_group_response = {
  parameter_group : parameter_group option;
      [@ocaml.doc "The parameter group that has been deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_parameter_group_request = {
  parameter_group_name : string_; [@ocaml.doc "The name of the parameter group to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_multi_region_cluster_response = {
  multi_region_cluster : multi_region_cluster option;
      [@ocaml.doc "Details about the deleted multi-Region cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_multi_region_cluster_request = {
  multi_region_cluster_name : string_;
      [@ocaml.doc "The name of the multi-Region cluster to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cluster_response = {
  cluster : cluster option; [@ocaml.doc "The cluster object that has been deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cluster_request = {
  final_snapshot_name : string_ option;
      [@ocaml.doc
        "The user-supplied name of a final cluster snapshot. This is the unique name that \
         identifies the snapshot. MemoryDB creates the snapshot, and then deletes the cluster \
         immediately afterward.\n"]
  multi_region_cluster_name : string_ option;
      [@ocaml.doc "The name of the multi-Region cluster to be deleted.\n"]
  cluster_name : string_; [@ocaml.doc "The name of the cluster to be deleted\n"]
}
[@@ocaml.doc ""]

type nonrec delete_acl_response = {
  ac_l : ac_l option; [@ocaml.doc "The Access Control List object that has been deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_acl_request = {
  acl_name : string_; [@ocaml.doc "The name of the Access Control List to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_user_response = { user : user option [@ocaml.doc "The newly-created user.\n"] }
[@@ocaml.doc ""]

type nonrec create_user_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
  access_string : access_string; [@ocaml.doc "Access permissions string used for this user.\n"]
  authentication_mode : authentication_mode;
      [@ocaml.doc
        "Denotes the user's authentication properties, such as whether it requires a password to \
         authenticate.\n"]
  user_name : user_name;
      [@ocaml.doc
        "The name of the user. This value must be unique as it also serves as the user identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec create_subnet_group_response = {
  subnet_group : subnet_group option; [@ocaml.doc "The newly-created subnet group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_subnet_group_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
  subnet_ids : subnet_identifier_list;
      [@ocaml.doc "A list of VPC subnet IDs for the subnet group.\n"]
  description : string_ option; [@ocaml.doc "A description for the subnet group.\n"]
  subnet_group_name : string_; [@ocaml.doc "The name of the subnet group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_snapshot_response = {
  snapshot : snapshot option; [@ocaml.doc "The newly-created snapshot.\n"]
}
[@@ocaml.doc ""]

type nonrec create_snapshot_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
  kms_key_id : string_ option; [@ocaml.doc "The ID of the KMS key used to encrypt the snapshot.\n"]
  snapshot_name : string_; [@ocaml.doc "A name for the snapshot being created.\n"]
  cluster_name : string_; [@ocaml.doc "The snapshot is created from this cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec create_parameter_group_response = {
  parameter_group : parameter_group option; [@ocaml.doc "The newly-created parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_parameter_group_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
  description : string_ option; [@ocaml.doc "An optional description of the parameter group.\n"]
  family : string_;
      [@ocaml.doc
        "The name of the parameter group family that the parameter group can be used with.\n"]
  parameter_group_name : string_; [@ocaml.doc "The name of the parameter group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_multi_region_cluster_response = {
  multi_region_cluster : multi_region_cluster option;
      [@ocaml.doc "Details about the newly created multi-Region cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec create_multi_region_cluster_request = {
  tags : tag_list option; [@ocaml.doc "A list of tags to be applied to the multi-Region cluster.\n"]
  tls_enabled : boolean_optional option;
      [@ocaml.doc "Whether to enable TLS encryption for the multi-Region cluster.\n"]
  num_shards : integer_optional option;
      [@ocaml.doc "The number of shards for the multi-Region cluster.\n"]
  multi_region_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the multi-Region parameter group to be associated with the cluster.\n"]
  node_type : string_; [@ocaml.doc "The node type to be used for the multi-Region cluster.\n"]
  engine_version : string_ option;
      [@ocaml.doc "The version of the engine to be used for the multi-Region cluster.\n"]
  engine : string_ option;
      [@ocaml.doc "The name of the engine to be used for the multi-Region cluster.\n"]
  description : string_ option; [@ocaml.doc "A description for the multi-Region cluster.\n"]
  multi_region_cluster_name_suffix : string_;
      [@ocaml.doc
        "A suffix to be added to the Multi-Region cluster name. Amazon MemoryDB automatically \
         applies a prefix to the Multi-Region cluster Name when it is created. Each Amazon Region \
         has its own prefix. For instance, a Multi-Region cluster Name created in the US-West-1 \
         region will begin with \"virxk\", along with the suffix name you provide. The suffix \
         guarantees uniqueness of the Multi-Region cluster name across multiple regions.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cluster_response = {
  cluster : cluster option; [@ocaml.doc "The newly-created cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cluster_request = {
  ip_discovery : ip_discovery option;
      [@ocaml.doc
        "The mechanism for discovering IP addresses for the cluster discovery protocol. Valid \
         values are 'ipv4' or 'ipv6'. When set to 'ipv4', cluster discovery functions such as \
         cluster slots, cluster shards, and cluster nodes return IPv4 addresses for cluster nodes. \
         When set to 'ipv6', the cluster discovery functions return IPv6 addresses for cluster \
         nodes. The value must be compatible with the NetworkType parameter. If not specified, the \
         default is 'ipv4'.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Specifies the IP address type for the cluster. Valid values are 'ipv4', 'ipv6', or \
         'dual_stack'. When set to 'ipv4', the cluster will only be accessible via IPv4 addresses. \
         When set to 'ipv6', the cluster will only be accessible via IPv6 addresses. When set to \
         'dual_stack', the cluster will be accessible via both IPv4 and IPv6 addresses. If not \
         specified, the default is 'ipv4'.\n"]
  data_tiering : boolean_optional option;
      [@ocaml.doc
        "Enables data tiering. Data tiering is only supported for clusters using the r6gd node \
         type. This parameter must be set when using r6gd nodes. For more information, see \
         {{:https://docs.aws.amazon.com/memorydb/latest/devguide/data-tiering.html}Data tiering}.\n"]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "When set to true, the cluster will automatically receive minor engine version upgrades \
         after launch.\n"]
  engine_version : string_ option;
      [@ocaml.doc "The version number of the Redis OSS engine to be used for the cluster.\n"]
  engine : string_ option; [@ocaml.doc "The name of the engine to be used for the cluster.\n"]
  acl_name : acl_name;
      [@ocaml.doc "The name of the Access Control List to associate with the cluster.\n"]
  snapshot_window : string_ option;
      [@ocaml.doc
        "The daily time range (in UTC) during which MemoryDB begins taking a daily snapshot of \
         your shard.\n\n\
        \  Example: 05:00-09:00\n\
        \ \n\
        \   If you do not specify this parameter, MemoryDB automatically chooses an appropriate \
         time range.\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. Tags are comma-separated key,value pairs \
         (e.g. Key=myKey, Value=myKeyValue. You can include multiple tags as shown following: \
         Key=myKey, Value=myKeyValue Key=mySecondKey, Value=mySecondKeyValue.\n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which MemoryDB retains automatic snapshots before deleting them. \
         For example, if you set SnapshotRetentionLimit to 5, a snapshot that was taken today is \
         retained for 5 days before being deleted.\n"]
  snapshot_name : string_ option;
      [@ocaml.doc
        "The name of a snapshot from which to restore data into the new cluster. The snapshot \
         status changes to restoring while the new cluster is being created.\n"]
  snapshot_arns : snapshot_arns_list option;
      [@ocaml.doc
        "A list of Amazon Resource Names (ARN) that uniquely identify the RDB snapshot files \
         stored in Amazon S3. The snapshot files are used to populate the new cluster. The Amazon \
         S3 object name in the ARN cannot contain any commas.\n"]
  kms_key_id : string_ option; [@ocaml.doc "The ID of the KMS key used to encrypt the cluster.\n"]
  tls_enabled : boolean_optional option;
      [@ocaml.doc "A flag to enable in-transit encryption on the cluster.\n"]
  sns_topic_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to \
         which notifications are sent.\n"]
  port : integer_optional option;
      [@ocaml.doc "The port number on which each of the nodes accepts connections.\n"]
  maintenance_window : string_ option;
      [@ocaml.doc
        "Specifies the weekly time range during which maintenance on the cluster is performed. It \
         is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The \
         minimum maintenance window is a 60 minute period.\n\n\
        \ Valid values for [ddd] are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [sun] \n\
        \            \n\
        \             }\n\
        \        {-   [mon] \n\
        \            \n\
        \             }\n\
        \        {-   [tue] \n\
        \            \n\
        \             }\n\
        \        {-   [wed] \n\
        \            \n\
        \             }\n\
        \        {-   [thu] \n\
        \            \n\
        \             }\n\
        \        {-   [fri] \n\
        \            \n\
        \             }\n\
        \        {-   [sat] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [sun:23:00-mon:01:30] \n\
        \   "]
  security_group_ids : security_group_ids_list option;
      [@ocaml.doc "A list of security group names to associate with this cluster.\n"]
  subnet_group_name : string_ option;
      [@ocaml.doc "The name of the subnet group to be used for the cluster.\n"]
  num_replicas_per_shard : integer_optional option;
      [@ocaml.doc
        "The number of replicas to apply to each shard. The default value is 1. The maximum is 5. \n"]
  num_shards : integer_optional option;
      [@ocaml.doc "The number of shards the cluster will contain. The default value is 1. \n"]
  description : string_ option; [@ocaml.doc "An optional description of the cluster.\n"]
  parameter_group_name : string_ option;
      [@ocaml.doc "The name of the parameter group associated with the cluster.\n"]
  multi_region_cluster_name : string_ option;
      [@ocaml.doc "The name of the multi-Region cluster to be created.\n"]
  node_type : string_; [@ocaml.doc "The compute and memory capacity of the nodes in the cluster.\n"]
  cluster_name : string_;
      [@ocaml.doc
        "The name of the cluster. This value must be unique as it also serves as the cluster \
         identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec cluster_already_exists_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A cluster with the specified name already exists.\n"]

type nonrec create_acl_response = {
  ac_l : ac_l option; [@ocaml.doc "The newly-created Access Control List.\n"]
}
[@@ocaml.doc ""]

type nonrec create_acl_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
  user_names : user_name_list_input option;
      [@ocaml.doc "The list of users that belong to the Access Control List.\n"]
  acl_name : string_; [@ocaml.doc "The name of the Access Control List.\n"]
}
[@@ocaml.doc ""]

type nonrec acl_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of ACLs allowed.\n"]

type nonrec acl_already_exists_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "An ACL with the specified name already exists.\n"]

type nonrec copy_snapshot_response = {
  snapshot : snapshot option;
      [@ocaml.doc
        "Represents a copy of an entire cluster as of the time when the snapshot was taken.\n"]
}
[@@ocaml.doc ""]

type nonrec copy_snapshot_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc "The ID of the KMS key used to encrypt the target snapshot.\n"]
  target_bucket : target_bucket option;
      [@ocaml.doc
        "The Amazon S3 bucket to which the snapshot is exported. This parameter is used only when \
         exporting a snapshot for external access. When using this parameter to export a snapshot, \
         be sure MemoryDB has the needed permissions to this S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/snapshots-exporting.html}Step 2: \
         Grant MemoryDB Access to Your Amazon S3 Bucket}. \n"]
  target_snapshot_name : string_;
      [@ocaml.doc
        "A name for the snapshot copy. MemoryDB does not permit overwriting a snapshot, therefore \
         this name must be unique within its context - MemoryDB or an Amazon S3 bucket if \
         exporting.\n"]
  source_snapshot_name : string_;
      [@ocaml.doc "The name of an existing snapshot from which to make a copy.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_update_cluster_response = {
  unprocessed_clusters : unprocessed_cluster_list option;
      [@ocaml.doc "The list of clusters where updates have not been applied.\n"]
  processed_clusters : cluster_list option;
      [@ocaml.doc "The list of clusters that have been updated.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_update_cluster_request = {
  service_update : service_update_request option;
      [@ocaml.doc "The unique ID of the service update\n"]
  cluster_names : cluster_name_list; [@ocaml.doc "The cluster names to apply the updates.\n"]
}
[@@ocaml.doc ""]
