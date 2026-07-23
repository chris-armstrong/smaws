type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec api_call_rate_for_customer_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The customer has exceeded the allowed rate of API calls.\n"]

type nonrec az_mode = SINGLE_AZ [@ocaml.doc ""] | CROSS_AZ [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec access_string = string [@@ocaml.doc ""]

type nonrec user_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The user does not exist or could not be found.\n"]

type nonrec user_group_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The user group was not found or does not exist\n"]

type nonrec tag_quota_per_resource_exceeded = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request cannot be processed because it would cause the resource to have more than the \
   allowed number of tags. The maximum number of tags permitted on a resource is 50.\n"]

type nonrec snapshot_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested snapshot name does not refer to an existing snapshot.\n"]

type nonrec serverless_cache_snapshot_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This serverless cache snapshot could not be found or does not exist. Available for Valkey, \
   Redis OSS and Serverless Memcached only.\n"]

type nonrec serverless_cache_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The serverless cache was not found or does not exist.\n"]

type nonrec reserved_cache_node_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The requested reserved cache node was not found.\n"]

type nonrec replication_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified replication group does not exist.\n"]

type nonrec invalid_serverless_cache_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The account for these credentials is not currently active.\n"]

type nonrec invalid_serverless_cache_snapshot_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The state of the serverless cache snapshot was not received. Available for Valkey, Redis OSS \
   and Serverless Memcached only.\n"]

type nonrec invalid_replication_group_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The requested replication group is not in the [available] state.\n"]

type nonrec invalid_arn_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested Amazon Resource Name (ARN) does not refer to an existing resource.\n"]

type nonrec cache_subnet_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested cache subnet group name does not refer to an existing cache subnet group.\n"]

type nonrec cache_security_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested cache security group name does not refer to an existing cache security group.\n"]

type nonrec cache_parameter_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested cache parameter group name does not refer to an existing cache parameter group.\n"]

type nonrec cache_cluster_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested cluster ID does not refer to an existing cluster.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec tag = {
  key : string_ option; [@ocaml.doc "The key for the tag. May not be null.\n"]
  value : string_ option; [@ocaml.doc "The tag's value. May be null.\n"]
}
[@@ocaml.doc
  "A tag that can be added to an ElastiCache cluster or replication group. Tags are composed of a \
   Key/Value pair. You can use tags to categorize and track all your ElastiCache resources, with \
   the exception of global replication group. When you add or remove tags on replication groups, \
   those actions will be replicated to all nodes in the replication group. A tag with a null Value \
   is permitted.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_list_message = {
  tag_list : tag_list option; [@ocaml.doc "A list of tags as key-value pairs.\n"]
}
[@@ocaml.doc
  "Represents the output from the [AddTagsToResource], [ListTagsForResource], and \
   [RemoveTagsFromResource] operations.\n"]

type nonrec add_tags_to_resource_message = {
  resource_name : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource to which the tags are to be added, for \
         example [arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster] or \
         [arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot]. ElastiCache resources are \
         {i cluster} and {i snapshot}.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Service Namespaces}.\n\
        \ "]
  tags : tag_list;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
}
[@@ocaml.doc "Represents the input of an AddTagsToResource operation.\n"]

type nonrec allowed_node_group_id = string [@@ocaml.doc ""]

type nonrec node_type_list = string_ list [@@ocaml.doc ""]

type nonrec allowed_node_type_modifications_message = {
  scale_up_modifications : node_type_list option;
      [@ocaml.doc
        "A string list, each element of which specifies a cache node type which you can use to \
         scale your cluster or replication group.\n\n\
        \ When scaling up a Valkey or Redis OSS cluster or replication group using \
         [ModifyCacheCluster] or [ModifyReplicationGroup], use a value from this list for the \
         [CacheNodeType] parameter.\n\
        \ "]
  scale_down_modifications : node_type_list option;
      [@ocaml.doc
        "A string list, each element of which specifies a cache node type which you can use to \
         scale your cluster or replication group. When scaling down a Valkey or Redis OSS cluster \
         or replication group using ModifyCacheCluster or ModifyReplicationGroup, use a value from \
         this list for the CacheNodeType parameter. \n"]
}
[@@ocaml.doc
  "Represents the allowed node types you can use to modify your cluster or replication group.\n"]

type nonrec replication_group_already_under_migration_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The targeted replication group is not available. \n"]

type nonrec aws_query_error_message = string [@@ocaml.doc ""]

type nonrec invalid_parameter_value_exception = {
  message : aws_query_error_message option; [@ocaml.doc "A parameter value is invalid.\n"]
}
[@@ocaml.doc "The value for a parameter is invalid.\n"]

type nonrec effective_durability =
  | ASYNC [@ocaml.doc ""]
  | SYNC [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec durability =
  | DEFAULT [@ocaml.doc ""]
  | ASYNC [@ocaml.doc ""]
  | SYNC [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cluster_mode =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | COMPATIBLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec transit_encryption_mode = PREFERRED [@ocaml.doc ""] | REQUIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ip_discovery = IPV4 [@ocaml.doc ""] | IPV6 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec network_type =
  | IPV4 [@ocaml.doc ""]
  | IPV6 [@ocaml.doc ""]
  | DUAL_STACK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec data_tiering_status = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec t_stamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec log_delivery_configuration_status =
  | ACTIVE [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""]
  | MODIFYING [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_format = TEXT [@ocaml.doc ""] | JSON [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec kinesis_firehose_destination_details = {
  delivery_stream : string_ option;
      [@ocaml.doc "The name of the Kinesis Data Firehose delivery stream.\n"]
}
[@@ocaml.doc "The configuration details of the Kinesis Data Firehose destination.\n"]

type nonrec cloud_watch_logs_destination_details = {
  log_group : string_ option; [@ocaml.doc "The name of the CloudWatch Logs log group.\n"]
}
[@@ocaml.doc "The configuration details of the CloudWatch Logs destination.\n"]

type nonrec destination_details = {
  cloud_watch_logs_details : cloud_watch_logs_destination_details option;
      [@ocaml.doc "The configuration details of the CloudWatch Logs destination.\n"]
  kinesis_firehose_details : kinesis_firehose_destination_details option;
      [@ocaml.doc "The configuration details of the Kinesis Data Firehose destination.\n"]
}
[@@ocaml.doc
  "Configuration details of either a CloudWatch Logs destination or Kinesis Data Firehose \
   destination.\n"]

type nonrec destination_type = CloudWatchLogs [@ocaml.doc ""] | KinesisFirehose [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_type = SLOW_LOG [@ocaml.doc ""] | ENGINE_LOG [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec log_delivery_configuration = {
  log_type : log_type option;
      [@ocaml.doc "Refers to {{:https://redis.io/commands/slowlog}slow-log} or engine-log.\n"]
  destination_type : destination_type option;
      [@ocaml.doc "Returns the destination type, either [cloudwatch-logs] or [kinesis-firehose].\n"]
  destination_details : destination_details option;
      [@ocaml.doc
        "Configuration details of either a CloudWatch Logs destination or Kinesis Data Firehose \
         destination.\n"]
  log_format : log_format option; [@ocaml.doc "Returns the log format, either JSON or TEXT.\n"]
  status : log_delivery_configuration_status option;
      [@ocaml.doc
        "Returns the log delivery configuration status. Values are one of [enabling] | [disabling] \
         | [modifying] | [active] | [error] \n"]
  message : string_ option;
      [@ocaml.doc "Returns an error message for the log delivery configuration.\n"]
}
[@@ocaml.doc "Returns the destination, format and type of the logs. \n"]

type nonrec log_delivery_configuration_list = log_delivery_configuration list [@@ocaml.doc ""]

type nonrec user_group_id = string [@@ocaml.doc ""]

type nonrec user_group_id_list = user_group_id list [@@ocaml.doc ""]

type nonrec storage_encryption_type =
  | NONE [@ocaml.doc ""]
  | SSE_ELASTICACHE [@ocaml.doc ""]
  | SSE_KMS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec replication_group_outpost_arn_list = string_ list [@@ocaml.doc ""]

type nonrec boolean_optional = bool [@@ocaml.doc ""]

type nonrec integer_optional = int [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec endpoint = {
  address : string_ option; [@ocaml.doc "The DNS hostname of the cache node.\n"]
  port : integer option; [@ocaml.doc "The port number that the cache engine is listening on.\n"]
}
[@@ocaml.doc
  "Represents the information required for client programs to connect to a cache node. This value \
   is read-only.\n"]

type nonrec multi_az_status = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec automatic_failover_status =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec node_group_member = {
  cache_cluster_id : string_ option;
      [@ocaml.doc "The ID of the cluster to which the node belongs.\n"]
  cache_node_id : string_ option;
      [@ocaml.doc
        "The ID of the node within its cluster. A node ID is a numeric identifier (0001, 0002, \
         etc.).\n"]
  read_endpoint : endpoint option;
      [@ocaml.doc
        "The information required for client programs to connect to a node for read operations. \
         The read endpoint is only applicable on Valkey or Redis OSS (cluster mode disabled) \
         clusters.\n"]
  preferred_availability_zone : string_ option;
      [@ocaml.doc "The name of the Availability Zone in which the node is located.\n"]
  preferred_outpost_arn : string_ option; [@ocaml.doc "The outpost ARN of the node group member.\n"]
  current_role : string_ option;
      [@ocaml.doc
        "The role that is currently assigned to the node - [primary] or [replica]. This member is \
         only applicable for Valkey or Redis OSS (cluster mode disabled) replication groups.\n"]
}
[@@ocaml.doc "Represents a single node within a node group (shard).\n"]

type nonrec node_group_member_list = node_group_member list [@@ocaml.doc ""]

type nonrec node_group = {
  node_group_id : string_ option;
      [@ocaml.doc
        "The identifier for the node group (shard). A Valkey or Redis OSS (cluster mode disabled) \
         replication group contains only 1 node group; therefore, the node group ID is 0001. A \
         Valkey or Redis OSS (cluster mode enabled) replication group contains 1 to 90 node groups \
         numbered 0001 to 0090. Optionally, the user can provide the id for a node group. \n"]
  status : string_ option;
      [@ocaml.doc
        "The current state of this replication group - [creating], [available], [modifying], \
         [deleting].\n"]
  primary_endpoint : endpoint option;
      [@ocaml.doc "The endpoint of the primary node in this node group (shard).\n"]
  reader_endpoint : endpoint option;
      [@ocaml.doc
        "The endpoint of the replica nodes in this node group (shard). This value is read-only.\n"]
  slots : string_ option; [@ocaml.doc "The keyspace for this node group (shard).\n"]
  node_group_members : node_group_member_list option;
      [@ocaml.doc
        "A list containing information about individual nodes within the node group (shard).\n"]
}
[@@ocaml.doc
  "Represents a collection of cache nodes in a replication group. One node in the node group is \
   the read/write primary node. All the other nodes are read-only Replica nodes.\n"]

type nonrec node_group_list = node_group list [@@ocaml.doc ""]

type nonrec cluster_id_list = string_ list [@@ocaml.doc ""]

type nonrec pending_log_delivery_configuration = {
  log_type : log_type option;
      [@ocaml.doc "Refers to {{:https://redis.io/commands/slowlog}slow-log} or engine-log..\n"]
  destination_type : destination_type option;
      [@ocaml.doc
        "Returns the destination type, either CloudWatch Logs or Kinesis Data Firehose.\n"]
  destination_details : destination_details option;
      [@ocaml.doc
        "Configuration details of either a CloudWatch Logs destination or Kinesis Data Firehose \
         destination.\n"]
  log_format : log_format option; [@ocaml.doc "Returns the log format, either JSON or TEXT\n"]
}
[@@ocaml.doc "The log delivery configurations being modified \n"]

type nonrec pending_log_delivery_configuration_list = pending_log_delivery_configuration list
[@@ocaml.doc ""]

type nonrec user_groups_update_status = {
  user_group_ids_to_add : user_group_id_list option;
      [@ocaml.doc "The ID of the user group to add.\n"]
  user_group_ids_to_remove : user_group_id_list option;
      [@ocaml.doc "The ID of the user group to remove.\n"]
}
[@@ocaml.doc "The status of the user group update.\n"]

type nonrec auth_token_update_status = SETTING [@ocaml.doc ""] | ROTATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec slot_migration = {
  progress_percentage : double option;
      [@ocaml.doc "The percentage of the slot migration that is complete.\n"]
}
[@@ocaml.doc "Represents the progress of an online resharding operation.\n"]

type nonrec resharding_status = {
  slot_migration : slot_migration option;
      [@ocaml.doc "Represents the progress of an online resharding operation.\n"]
}
[@@ocaml.doc "The status of an online resharding operation.\n"]

type nonrec pending_automatic_failover_status = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec replication_group_pending_modified_values = {
  primary_cluster_id : string_ option;
      [@ocaml.doc
        "The primary cluster ID that is applied immediately (if [--apply-immediately] was \
         specified), or during the next maintenance window.\n"]
  automatic_failover_status : pending_automatic_failover_status option;
      [@ocaml.doc
        "Indicates the status of automatic failover for this Valkey or Redis OSS replication group.\n"]
  resharding : resharding_status option;
      [@ocaml.doc "The status of an online resharding operation.\n"]
  auth_token_status : auth_token_update_status option; [@ocaml.doc "The auth token status\n"]
  user_groups : user_groups_update_status option; [@ocaml.doc "The user group being modified.\n"]
  log_delivery_configurations : pending_log_delivery_configuration_list option;
      [@ocaml.doc "The log delivery configurations being modified \n"]
  transit_encryption_enabled : boolean_optional option;
      [@ocaml.doc "A flag that enables in-transit encryption when set to true.\n"]
  transit_encryption_mode : transit_encryption_mode option;
      [@ocaml.doc
        "A setting that allows you to migrate your clients to use in-transit encryption, with no \
         downtime.\n"]
  cluster_mode : cluster_mode option;
      [@ocaml.doc
        "Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you must first set \
         the cluster mode to Compatible. Compatible mode allows your Valkey or Redis OSS clients \
         to connect using both cluster mode enabled and cluster mode disabled. After you migrate \
         all Valkey or Redis OSS clients to use cluster mode enabled, you can then complete \
         cluster mode configuration and set the cluster mode to Enabled.\n"]
}
[@@ocaml.doc
  "The settings to be applied to the Valkey or Redis OSS replication group, either immediately or \
   during the next maintenance window.\n"]

type nonrec global_replication_group_info = {
  global_replication_group_id : string_ option; [@ocaml.doc "The name of the Global datastore\n"]
  global_replication_group_member_role : string_ option;
      [@ocaml.doc
        "The role of the replication group in a Global datastore. Can be primary or secondary.\n"]
}
[@@ocaml.doc
  "The name of the Global datastore and role of this replication group in the Global datastore.\n"]

type nonrec replication_group = {
  replication_group_id : string_ option; [@ocaml.doc "The identifier for the replication group.\n"]
  description : string_ option;
      [@ocaml.doc "The user supplied description of the replication group.\n"]
  global_replication_group_info : global_replication_group_info option;
      [@ocaml.doc
        "The name of the Global datastore and role of this replication group in the Global \
         datastore.\n"]
  status : string_ option;
      [@ocaml.doc
        "The current state of this replication group - [creating], [available], [modifying], \
         [deleting], [create-failed], [snapshotting].\n"]
  pending_modified_values : replication_group_pending_modified_values option;
      [@ocaml.doc
        "A group of settings to be applied to the replication group, either immediately or during \
         the next maintenance window.\n"]
  member_clusters : cluster_id_list option;
      [@ocaml.doc "The names of all the cache clusters that are part of this replication group.\n"]
  node_groups : node_group_list option;
      [@ocaml.doc
        "A list of node groups in this replication group. For Valkey or Redis OSS (cluster mode \
         disabled) replication groups, this is a single-element list. For Valkey or Redis OSS \
         (cluster mode enabled) replication groups, the list contains an entry for each node group \
         (shard).\n"]
  snapshotting_cluster_id : string_ option;
      [@ocaml.doc
        "The cluster ID that is used as the daily snapshot source for the replication group.\n"]
  automatic_failover : automatic_failover_status option;
      [@ocaml.doc
        "Indicates the status of automatic failover for this Valkey or Redis OSS replication group.\n"]
  multi_a_z : multi_az_status option;
      [@ocaml.doc
        "A flag indicating if you have Multi-AZ enabled to enhance fault tolerance. For more \
         information, see \
         {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/AutoFailover.html}Minimizing \
         Downtime: Multi-AZ} \n"]
  configuration_endpoint : endpoint option;
      [@ocaml.doc
        "The configuration endpoint for this replication group. Use the configuration endpoint to \
         connect to this replication group.\n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which ElastiCache retains automatic cluster snapshots before \
         deleting them. For example, if you set [SnapshotRetentionLimit] to 5, a snapshot that was \
         taken today is retained for 5 days before being deleted.\n\n\
        \   If the value of [SnapshotRetentionLimit] is set to zero (0), backups are turned off.\n\
        \  \n\
        \   "]
  snapshot_window : string_ option;
      [@ocaml.doc
        "The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of \
         your node group (shard).\n\n\
        \ Example: [05:00-09:00] \n\
        \ \n\
        \  If you do not specify this parameter, ElastiCache automatically chooses an appropriate \
         time range.\n\
        \  \n\
        \    This parameter is only valid if the [Engine] parameter is [redis].\n\
        \    \n\
        \     "]
  cluster_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag indicating whether or not this replication group is cluster enabled; i.e., whether \
         its data can be partitioned across multiple shards (API/CLI: node groups).\n\n\
        \ Valid values: [true] | [false] \n\
        \ "]
  cache_node_type : string_ option;
      [@ocaml.doc
        "The name of the compute and memory capacity node type for each node in the replication \
         group.\n"]
  auth_token_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables using an [AuthToken] (password) when issuing Valkey or Redis OSS \
         commands.\n\n\
        \ Default: [false] \n\
        \ "]
  auth_token_last_modified_date : t_stamp option;
      [@ocaml.doc "The date the auth token was last modified\n"]
  transit_encryption_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables in-transit encryption when set to [true].\n\n\
        \  {b Required:} Only available when creating a replication group in an Amazon VPC using \
         Redis OSS version [3.2.6], [4.x] or later.\n\
        \ \n\
        \  Default: [false] \n\
        \  "]
  at_rest_encryption_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables encryption at-rest on the cluster when set to [true]. In some cases, \
         encryption at-rest may be enabled even when this value is false. Use \
         [StorageEncryptionType] to view the effective encryption state of a cluster.\n\n\
        \ You cannot modify the value of [AtRestEncryptionEnabled] after the cluster is created.\n\
        \ \n\
        \  Default: [true] when using Valkey, [false] when using Redis OSS\n\
        \  "]
  member_clusters_outpost_arns : replication_group_outpost_arn_list option;
      [@ocaml.doc "The outpost ARNs of the replication group's member clusters.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc "The ID of the KMS key used to encrypt the disk in the cluster.\n"]
  storage_encryption_type : storage_encryption_type option;
      [@ocaml.doc
        "Indicates the type of encryption for data stored at rest in the replication group. The \
         value is [none] if at-rest encryption is not enabled, [sse-elasticache] if an ElastiCache \
         service-managed key is used, or [sse-kms] if a customer-managed KMS key is used.\n"]
  ar_n : string_ option; [@ocaml.doc "The ARN (Amazon Resource Name) of the replication group.\n"]
  user_group_ids : user_group_id_list option;
      [@ocaml.doc "The ID of the user group associated to the replication group.\n"]
  log_delivery_configurations : log_delivery_configuration_list option;
      [@ocaml.doc "Returns the destination, format and type of the logs. \n"]
  replication_group_create_time : t_stamp option;
      [@ocaml.doc "The date and time when the cluster was created.\n"]
  data_tiering : data_tiering_status option;
      [@ocaml.doc
        "Enables data tiering. Data tiering is only supported for replication groups using the \
         r6gd node type. This parameter must be set to true when using r6gd nodes. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/data-tiering.html}Data \
         tiering}.\n"]
  auto_minor_version_upgrade : boolean_ option;
      [@ocaml.doc
        "If you are running Valkey 7.2 and above, or Redis OSS engine version 6.0 and above, set \
         this parameter to yes if you want to opt-in to the next auto minor version upgrade \
         campaign. This parameter is disabled for previous versions. \n"]
  network_type : network_type option;
      [@ocaml.doc
        "Must be either [ipv4] | [ipv6] | [dual_stack]. IPv6 is supported for workloads using \
         Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 or Memcached engine version \
         1.6.6 and above on all instances built on the {{:http://aws.amazon.com/ec2/nitro/}Nitro \
         system}.\n"]
  ip_discovery : ip_discovery option;
      [@ocaml.doc
        "The network type you choose when modifying a cluster, either [ipv4] | [ipv6]. IPv6 is \
         supported for workloads using Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 \
         or Memcached engine version 1.6.6 and above on all instances built on the \
         {{:http://aws.amazon.com/ec2/nitro/}Nitro system}.\n"]
  transit_encryption_mode : transit_encryption_mode option;
      [@ocaml.doc
        "A setting that allows you to migrate your clients to use in-transit encryption, with no \
         downtime.\n"]
  cluster_mode : cluster_mode option;
      [@ocaml.doc
        "Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you must first set \
         the cluster mode to Compatible. Compatible mode allows your Valkey or Redis OSS clients \
         to connect using both cluster mode enabled and cluster mode disabled. After you migrate \
         all Valkey or Redis OSS clients to use cluster mode enabled, you can then complete \
         cluster mode configuration and set the cluster mode to Enabled.\n"]
  engine : string_ option;
      [@ocaml.doc
        "The engine used in a replication group. The options are valkey, memcached or redis.\n"]
  durability : durability option;
      [@ocaml.doc
        "The durability setting of the replication group. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/durability.html}Durability}.\n"]
  effective_durability : effective_durability option;
      [@ocaml.doc
        "The effective durability of the replication group. When [Durability] is set to [default], \
         the service resolves the actual durability based on the engine version, cluster mode, and \
         other parameters. This field reflects the resolved value. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Durability.Configuring.html}Configuring \
         Durability}.\n"]
}
[@@ocaml.doc
  "Contains all of the attributes of a specific Valkey or Redis OSS replication group.\n"]

type nonrec test_migration_response = {
  replication_group : replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec customer_node_endpoint = {
  address : string_ option; [@ocaml.doc "The address of the node endpoint\n"]
  port : integer_optional option; [@ocaml.doc "The port of the node endpoint\n"]
}
[@@ocaml.doc "The endpoint from which data should be migrated.\n"]

type nonrec customer_node_endpoint_list = customer_node_endpoint list [@@ocaml.doc ""]

type nonrec test_migration_message = {
  replication_group_id : string_;
      [@ocaml.doc " The ID of the replication group to which data is to be migrated. \n"]
  customer_node_endpoint_list : customer_node_endpoint_list;
      [@ocaml.doc
        " List of endpoints from which data should be migrated. List should have only one element. \n"]
}
[@@ocaml.doc ""]

type nonrec test_failover_not_available_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The [TestFailover] action is not available.\n"]

type nonrec node_group_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The node group specified by the [NodeGroupId] parameter could not be found. Please verify that \
   the node group exists and that you spelled the [NodeGroupId] value correctly.\n"]

type nonrec invalid_parameter_combination_exception = {
  message : aws_query_error_message option;
      [@ocaml.doc "Two or more parameters that must not be used together were used together.\n"]
}
[@@ocaml.doc "Two or more incompatible parameters were specified.\n"]

type nonrec invalid_kms_key_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The KMS key supplied is not valid.\n"]

type nonrec invalid_cache_cluster_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The requested cluster is not in the [available] state.\n"]

type nonrec test_failover_result = { replication_group : replication_group option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec test_failover_message = {
  replication_group_id : string_;
      [@ocaml.doc
        "The name of the replication group (console: cluster) whose automatic failover is being \
         tested by this operation.\n"]
  node_group_id : allowed_node_group_id;
      [@ocaml.doc
        "The name of the node group (called shard in the console) in this replication group on \
         which automatic failover is to be tested. You may test automatic failover on up to 15 \
         node groups in any rolling 24-hour period.\n"]
}
[@@ocaml.doc ""]

type nonrec start_migration_response = {
  replication_group : replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec start_migration_message = {
  replication_group_id : string_;
      [@ocaml.doc "The ID of the replication group to which data should be migrated.\n"]
  customer_node_endpoint_list : customer_node_endpoint_list;
      [@ocaml.doc
        "List of endpoints from which data should be migrated. For Valkey or Redis OSS (cluster \
         mode disabled), the list should have only one element.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_cache_security_group_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The current state of the cache security group does not allow deletion.\n"]

type nonrec authorization_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified Amazon EC2 security group is not authorized for the specified cache security group.\n"]

type nonrec ec2_security_group = {
  status : string_ option; [@ocaml.doc "The status of the Amazon EC2 security group.\n"]
  ec2_security_group_name : string_ option;
      [@ocaml.doc "The name of the Amazon EC2 security group.\n"]
  ec2_security_group_owner_id : string_ option;
      [@ocaml.doc "The Amazon account ID of the Amazon EC2 security group owner.\n"]
}
[@@ocaml.doc "Provides ownership and status information for an Amazon EC2 security group.\n"]

type nonrec ec2_security_group_list = ec2_security_group list [@@ocaml.doc ""]

type nonrec cache_security_group = {
  owner_id : string_ option;
      [@ocaml.doc "The Amazon account ID of the cache security group owner.\n"]
  cache_security_group_name : string_ option; [@ocaml.doc "The name of the cache security group.\n"]
  description : string_ option; [@ocaml.doc "The description of the cache security group.\n"]
  ec2_security_groups : ec2_security_group_list option;
      [@ocaml.doc
        "A list of Amazon EC2 security groups that are associated with this cache security group.\n"]
  ar_n : string_ option; [@ocaml.doc "The ARN of the cache security group,\n"]
}
[@@ocaml.doc
  "Represents the output of one of the following operations:\n\n\
  \ {ul\n\
  \       {-   [AuthorizeCacheSecurityGroupIngress] \n\
  \           \n\
  \            }\n\
  \       {-   [CreateCacheSecurityGroup] \n\
  \           \n\
  \            }\n\
  \       {-   [RevokeCacheSecurityGroupIngress] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec revoke_cache_security_group_ingress_result = {
  cache_security_group : cache_security_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec revoke_cache_security_group_ingress_message = {
  cache_security_group_name : string_;
      [@ocaml.doc "The name of the cache security group to revoke ingress from.\n"]
  ec2_security_group_name : string_;
      [@ocaml.doc "The name of the Amazon EC2 security group to revoke access from.\n"]
  ec2_security_group_owner_id : string_;
      [@ocaml.doc
        "The Amazon account number of the Amazon EC2 security group owner. Note that this is not \
         the same thing as an Amazon access key ID - you must provide a valid Amazon account \
         number for this parameter.\n"]
}
[@@ocaml.doc "Represents the input of a [RevokeCacheSecurityGroupIngress] operation.\n"]

type nonrec invalid_global_replication_group_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The Global datastore is not available or in primary-only state.\n"]

type nonrec invalid_cache_parameter_group_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The current state of the cache parameter group does not allow the requested operation to occur.\n"]

type nonrec cache_parameter_group_name_message = {
  cache_parameter_group_name : string_ option;
      [@ocaml.doc "The name of the cache parameter group.\n"]
}
[@@ocaml.doc
  "Represents the output of one of the following operations:\n\n\
  \ {ul\n\
  \       {-   [ModifyCacheParameterGroup] \n\
  \           \n\
  \            }\n\
  \       {-   [ResetCacheParameterGroup] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec parameter_name_value = {
  parameter_name : string_ option; [@ocaml.doc "The name of the parameter.\n"]
  parameter_value : string_ option; [@ocaml.doc "The value of the parameter.\n"]
}
[@@ocaml.doc "Describes a name-value pair that is used to update the value of a parameter.\n"]

type nonrec parameter_name_value_list = parameter_name_value list [@@ocaml.doc ""]

type nonrec reset_cache_parameter_group_message = {
  cache_parameter_group_name : string_;
      [@ocaml.doc "The name of the cache parameter group to reset.\n"]
  reset_all_parameters : boolean_ option;
      [@ocaml.doc
        "If [true], all parameters in the cache parameter group are reset to their default values. \
         If [false], only the parameters listed by [ParameterNameValues] are reset to their \
         default values.\n\n\
        \ Valid values: [true] | [false] \n\
        \ "]
  parameter_name_values : parameter_name_value_list option;
      [@ocaml.doc
        "An array of parameter names to reset to their default values. If [ResetAllParameters] is \
         [true], do not use [ParameterNameValues]. If [ResetAllParameters] is [false], you must \
         specify the name of at least one parameter to reset.\n"]
}
[@@ocaml.doc "Represents the input of a [ResetCacheParameterGroup] operation.\n"]

type nonrec tag_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested tag was not found on this resource.\n"]

type nonrec key_list = string_ list [@@ocaml.doc ""]

type nonrec remove_tags_from_resource_message = {
  resource_name : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource from which you want the tags removed, for \
         example [arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster] or \
         [arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot].\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Service Namespaces}.\n\
        \ "]
  tag_keys : key_list;
      [@ocaml.doc
        "A list of [TagKeys] identifying the tags you want removed from the named resource.\n"]
}
[@@ocaml.doc "Represents the input of a [RemoveTagsFromResource] operation.\n"]

type nonrec security_group_membership = {
  security_group_id : string_ option; [@ocaml.doc "The identifier of the cache security group.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the cache security group membership. The status changes whenever a cache \
         security group is modified, or when the cache security groups assigned to a cluster are \
         modified.\n"]
}
[@@ocaml.doc "Represents a single cache security group and its status.\n"]

type nonrec security_group_membership_list = security_group_membership list [@@ocaml.doc ""]

type nonrec cache_node = {
  cache_node_id : string_ option;
      [@ocaml.doc
        "The cache node identifier. A node ID is a numeric identifier (0001, 0002, etc.). The \
         combination of cluster ID and node ID uniquely identifies every cache node used in a \
         customer's Amazon account.\n"]
  cache_node_status : string_ option;
      [@ocaml.doc
        "The current state of this cache node, one of the following values: [available], \
         [creating], [rebooting], or [deleting].\n"]
  cache_node_create_time : t_stamp option;
      [@ocaml.doc "The date and time when the cache node was created.\n"]
  endpoint : endpoint option; [@ocaml.doc "The hostname for connecting to this cache node.\n"]
  parameter_group_status : string_ option;
      [@ocaml.doc "The status of the parameter group applied to this cache node.\n"]
  source_cache_node_id : string_ option;
      [@ocaml.doc
        "The ID of the primary node to which this read replica node is synchronized. If this field \
         is empty, this node is not associated with a primary cluster.\n"]
  customer_availability_zone : string_ option;
      [@ocaml.doc "The Availability Zone where this node was created and now resides.\n"]
  customer_outpost_arn : string_ option; [@ocaml.doc "The customer outpost ARN of the cache node.\n"]
}
[@@ocaml.doc
  "Represents an individual cache node within a cluster. Each cache node runs its own instance of \
   the cluster's protocol-compliant caching software - either Memcached, Valkey or Redis OSS.\n\n\
  \ The following node types are supported by ElastiCache. Generally speaking, the current \
   generation types provide more memory and computational power at lower cost when compared to \
   their equivalent previous generation counterparts.\n\
  \ \n\
  \  {ul\n\
  \        {-  General purpose:\n\
  \            \n\
  \             {ul\n\
  \                   {-  Current generation: \n\
  \                       \n\
  \                         {b M7g node types}: [cache.m7g.large], [cache.m7g.xlarge], \
   [cache.m7g.2xlarge], [cache.m7g.4xlarge], [cache.m7g.8xlarge], [cache.m7g.12xlarge], \
   [cache.m7g.16xlarge] \n\
  \                        \n\
  \                          For region availability, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
   Node Types} \n\
  \                          \n\
  \                             {b M6g node types} (available only for Redis OSS engine version \
   5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.m6g.large], \
   [cache.m6g.xlarge], [cache.m6g.2xlarge], [cache.m6g.4xlarge], [cache.m6g.8xlarge], \
   [cache.m6g.12xlarge], [cache.m6g.16xlarge] \n\
  \                            \n\
  \                              {b M5 node types:} [cache.m5.large], [cache.m5.xlarge], \
   [cache.m5.2xlarge], [cache.m5.4xlarge], [cache.m5.12xlarge], [cache.m5.24xlarge] \n\
  \                             \n\
  \                               {b M4 node types:} [cache.m4.large], [cache.m4.xlarge], \
   [cache.m4.2xlarge], [cache.m4.4xlarge], [cache.m4.10xlarge] \n\
  \                              \n\
  \                                {b T4g node types} (available only for Redis OSS engine version \
   5.0.6 onward and Memcached engine version 1.5.16 onward): [cache.t4g.micro], [cache.t4g.small], \
   [cache.t4g.medium] \n\
  \                               \n\
  \                                 {b T3 node types:} [cache.t3.micro], [cache.t3.small], \
   [cache.t3.medium] \n\
  \                                \n\
  \                                  {b T2 node types:} [cache.t2.micro], [cache.t2.small], \
   [cache.t2.medium] \n\
  \                                 \n\
  \                                  }\n\
  \                   {-  Previous generation: (not recommended. Existing clusters are still \
   supported but creation of new clusters is not supported for these types.)\n\
  \                       \n\
  \                         {b T1 node types:} [cache.t1.micro] \n\
  \                        \n\
  \                          {b M1 node types:} [cache.m1.small], [cache.m1.medium], \
   [cache.m1.large], [cache.m1.xlarge] \n\
  \                         \n\
  \                           {b M3 node types:} [cache.m3.medium], [cache.m3.large], \
   [cache.m3.xlarge], [cache.m3.2xlarge] \n\
  \                          \n\
  \                           }\n\
  \                   \n\
  \         }\n\
  \          }\n\
  \        {-  Compute optimized:\n\
  \            \n\
  \             {ul\n\
  \                   {-  Previous generation: (not recommended. Existing clusters are still \
   supported but creation of new clusters is not supported for these types.)\n\
  \                       \n\
  \                         {b C1 node types:} [cache.c1.xlarge] \n\
  \                        \n\
  \                         }\n\
  \                   \n\
  \         }\n\
  \          }\n\
  \        {-  Memory optimized:\n\
  \            \n\
  \             {ul\n\
  \                   {-  Current generation: \n\
  \                       \n\
  \                         {b R7g node types}: [cache.r7g.large], [cache.r7g.xlarge], \
   [cache.r7g.2xlarge], [cache.r7g.4xlarge], [cache.r7g.8xlarge], [cache.r7g.12xlarge], \
   [cache.r7g.16xlarge] \n\
  \                        \n\
  \                          For region availability, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
   Node Types} \n\
  \                          \n\
  \                             {b R6g node types} (available only for Redis OSS engine version \
   5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.r6g.large], \
   [cache.r6g.xlarge], [cache.r6g.2xlarge], [cache.r6g.4xlarge], [cache.r6g.8xlarge], \
   [cache.r6g.12xlarge], [cache.r6g.16xlarge] \n\
  \                            \n\
  \                              {b R5 node types:} [cache.r5.large], [cache.r5.xlarge], \
   [cache.r5.2xlarge], [cache.r5.4xlarge], [cache.r5.12xlarge], [cache.r5.24xlarge] \n\
  \                             \n\
  \                               {b R4 node types:} [cache.r4.large], [cache.r4.xlarge], \
   [cache.r4.2xlarge], [cache.r4.4xlarge], [cache.r4.8xlarge], [cache.r4.16xlarge] \n\
  \                              \n\
  \                               }\n\
  \                   {-  Previous generation: (not recommended. Existing clusters are still \
   supported but creation of new clusters is not supported for these types.)\n\
  \                       \n\
  \                         {b M2 node types:} [cache.m2.xlarge], [cache.m2.2xlarge], \
   [cache.m2.4xlarge] \n\
  \                        \n\
  \                          {b R3 node types:} [cache.r3.large], [cache.r3.xlarge], \
   [cache.r3.2xlarge], [cache.r3.4xlarge], [cache.r3.8xlarge] \n\
  \                         \n\
  \                          }\n\
  \                   \n\
  \         }\n\
  \          }\n\
  \        }\n\
  \    {b Additional node type info} \n\
  \   \n\
  \    {ul\n\
  \          {-  All current generation instance types are created in Amazon VPC by default.\n\
  \              \n\
  \               }\n\
  \          {-  Valkey or Redis OSS append-only files (AOF) are not supported for T1 or T2 \
   instances.\n\
  \              \n\
  \               }\n\
  \          {-  Valkey or Redis OSS Multi-AZ with automatic failover is not supported on T1 \
   instances.\n\
  \              \n\
  \               }\n\
  \          {-  The configuration variables [appendonly] and [appendfsync] are not supported on \
   Valkey, or on Redis OSS version 2.8.22 and later.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

type nonrec cache_node_list = cache_node list [@@ocaml.doc ""]

type nonrec cache_node_ids_list = string_ list [@@ocaml.doc ""]

type nonrec cache_parameter_group_status = {
  cache_parameter_group_name : string_ option;
      [@ocaml.doc "The name of the cache parameter group.\n"]
  parameter_apply_status : string_ option; [@ocaml.doc "The status of parameter updates.\n"]
  cache_node_ids_to_reboot : cache_node_ids_list option;
      [@ocaml.doc
        "A list of the cache node IDs which need to be rebooted for parameter changes to be \
         applied. A node ID is a numeric identifier (0001, 0002, etc.).\n"]
}
[@@ocaml.doc "Status of the cache parameter group.\n"]

type nonrec cache_security_group_membership = {
  cache_security_group_name : string_ option; [@ocaml.doc "The name of the cache security group.\n"]
  status : string_ option;
      [@ocaml.doc
        "The membership status in the cache security group. The status changes when a cache \
         security group is modified, or when the cache security groups assigned to a cluster are \
         modified.\n"]
}
[@@ocaml.doc "Represents a cluster's status within a particular cache security group.\n"]

type nonrec cache_security_group_membership_list = cache_security_group_membership list
[@@ocaml.doc ""]

type nonrec notification_configuration = {
  topic_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the topic.\n"]
  topic_status : string_ option; [@ocaml.doc "The current state of the topic.\n"]
}
[@@ocaml.doc
  "Describes a notification topic and its status. Notification topics are used for publishing \
   ElastiCache events to subscribers using Amazon Simple Notification Service (SNS).\n"]

type nonrec scale_config = {
  scale_percentage : integer_optional option;
      [@ocaml.doc
        "The percentage by which to scale the Memcached cluster, either horizontally by adding \
         nodes or vertically by increasing resources.\n"]
  scale_interval_minutes : integer_optional option;
      [@ocaml.doc
        "The time interval in seconds between scaling operations when performing gradual scaling \
         for a Memcached cluster.\n"]
}
[@@ocaml.doc
  "Configuration settings for horizontal or vertical scaling operations on Memcached clusters.\n"]

type nonrec pending_modified_values = {
  num_cache_nodes : integer_optional option;
      [@ocaml.doc
        "The new number of cache nodes for the cluster.\n\n\
        \ For clusters running Valkey or Redis OSS, this value must be 1. For clusters running \
         Memcached, this value must be between 1 and 40.\n\
        \ "]
  cache_node_ids_to_remove : cache_node_ids_list option;
      [@ocaml.doc
        "A list of cache node IDs that are being removed (or will be removed) from the cluster. A \
         node ID is a 4-digit numeric identifier (0001, 0002, etc.).\n"]
  engine_version : string_ option;
      [@ocaml.doc "The new cache engine version that the cluster runs.\n"]
  cache_node_type : string_ option;
      [@ocaml.doc "The cache node type that this cluster or replication group is scaled to.\n"]
  auth_token_status : auth_token_update_status option; [@ocaml.doc "The auth token status\n"]
  log_delivery_configurations : pending_log_delivery_configuration_list option;
      [@ocaml.doc "The log delivery configurations being modified \n"]
  transit_encryption_enabled : boolean_optional option;
      [@ocaml.doc "A flag that enables in-transit encryption when set to true.\n"]
  transit_encryption_mode : transit_encryption_mode option;
      [@ocaml.doc
        "A setting that allows you to migrate your clients to use in-transit encryption, with no \
         downtime.\n"]
  scale_config : scale_config option;
      [@ocaml.doc "The scaling configuration changes that are pending for the Memcached cluster.\n"]
}
[@@ocaml.doc
  "A group of settings that are applied to the cluster in the future, or that are currently being \
   applied.\n"]

type nonrec cache_cluster = {
  cache_cluster_id : string_ option;
      [@ocaml.doc
        "The user-supplied identifier of the cluster. This identifier is a unique key that \
         identifies a cluster.\n"]
  configuration_endpoint : endpoint option;
      [@ocaml.doc
        "Represents a Memcached cluster endpoint which can be used by an application to connect to \
         any node in the cluster. The configuration endpoint will always have [.cfg] in it.\n\n\
        \ Example: \n\
        \ {[\n\
        \ mem-3.9dvc4r.cfg.usw2.cache.amazonaws.com:11211\n\
        \ ]}\n\
        \  \n\
        \ "]
  client_download_landing_page : string_ option;
      [@ocaml.doc
        "The URL of the web page where you can download the latest ElastiCache client library.\n"]
  cache_node_type : string_ option;
      [@ocaml.doc
        "The name of the compute and memory capacity node type for the cluster.\n\n\
        \ The following node types are supported by ElastiCache. Generally speaking, the current \
         generation types provide more memory and computational power at lower cost when compared \
         to their equivalent previous generation counterparts.\n\
        \ \n\
        \  {ul\n\
        \        {-  General purpose:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b M7g node types}: [cache.m7g.large], [cache.m7g.xlarge], \
         [cache.m7g.2xlarge], [cache.m7g.4xlarge], [cache.m7g.8xlarge], [cache.m7g.12xlarge], \
         [cache.m7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b M6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.m6g.large], \
         [cache.m6g.xlarge], [cache.m6g.2xlarge], [cache.m6g.4xlarge], [cache.m6g.8xlarge], \
         [cache.m6g.12xlarge], [cache.m6g.16xlarge] \n\
        \                            \n\
        \                              {b M5 node types:} [cache.m5.large], [cache.m5.xlarge], \
         [cache.m5.2xlarge], [cache.m5.4xlarge], [cache.m5.12xlarge], [cache.m5.24xlarge] \n\
        \                             \n\
        \                               {b M4 node types:} [cache.m4.large], [cache.m4.xlarge], \
         [cache.m4.2xlarge], [cache.m4.4xlarge], [cache.m4.10xlarge] \n\
        \                              \n\
        \                                {b T4g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and Memcached engine version 1.5.16 onward): [cache.t4g.micro], \
         [cache.t4g.small], [cache.t4g.medium] \n\
        \                               \n\
        \                                 {b T3 node types:} [cache.t3.micro], [cache.t3.small], \
         [cache.t3.medium] \n\
        \                                \n\
        \                                  {b T2 node types:} [cache.t2.micro], [cache.t2.small], \
         [cache.t2.medium] \n\
        \                                 \n\
        \                                  }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b T1 node types:} [cache.t1.micro] \n\
        \                        \n\
        \                          {b M1 node types:} [cache.m1.small], [cache.m1.medium], \
         [cache.m1.large], [cache.m1.xlarge] \n\
        \                         \n\
        \                           {b M3 node types:} [cache.m3.medium], [cache.m3.large], \
         [cache.m3.xlarge], [cache.m3.2xlarge] \n\
        \                          \n\
        \                           }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Compute optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b C1 node types:} [cache.c1.xlarge] \n\
        \                        \n\
        \                         }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Memory optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b R7g node types}: [cache.r7g.large], [cache.r7g.xlarge], \
         [cache.r7g.2xlarge], [cache.r7g.4xlarge], [cache.r7g.8xlarge], [cache.r7g.12xlarge], \
         [cache.r7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b R6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.r6g.large], \
         [cache.r6g.xlarge], [cache.r6g.2xlarge], [cache.r6g.4xlarge], [cache.r6g.8xlarge], \
         [cache.r6g.12xlarge], [cache.r6g.16xlarge] \n\
        \                            \n\
        \                              {b R5 node types:} [cache.r5.large], [cache.r5.xlarge], \
         [cache.r5.2xlarge], [cache.r5.4xlarge], [cache.r5.12xlarge], [cache.r5.24xlarge] \n\
        \                             \n\
        \                               {b R4 node types:} [cache.r4.large], [cache.r4.xlarge], \
         [cache.r4.2xlarge], [cache.r4.4xlarge], [cache.r4.8xlarge], [cache.r4.16xlarge] \n\
        \                              \n\
        \                               }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b M2 node types:} [cache.m2.xlarge], [cache.m2.2xlarge], \
         [cache.m2.4xlarge] \n\
        \                        \n\
        \                          {b R3 node types:} [cache.r3.large], [cache.r3.xlarge], \
         [cache.r3.2xlarge], [cache.r3.4xlarge], [cache.r3.8xlarge] \n\
        \                         \n\
        \                          }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \    {b Additional node type info} \n\
        \   \n\
        \    {ul\n\
        \          {-  All current generation instance types are created in Amazon VPC by default.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS append-only files (AOF) are not supported for T1 or T2 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS Multi-AZ with automatic failover is not supported on T1 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  The configuration variables [appendonly] and [appendfsync] are not \
         supported on Valkey, or on Redis OSS version 2.8.22 and later.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  engine : string_ option;
      [@ocaml.doc
        "The name of the cache engine ([memcached] or [redis]) to be used for this cluster.\n"]
  engine_version : string_ option;
      [@ocaml.doc "The version of the cache engine that is used in this cluster.\n"]
  cache_cluster_status : string_ option;
      [@ocaml.doc
        "The current state of this cluster, one of the following values: [available], [creating], \
         [deleted], [deleting], [incompatible-network], [modifying], [rebooting cluster nodes], \
         [restore-failed], or [snapshotting].\n"]
  num_cache_nodes : integer_optional option;
      [@ocaml.doc
        "The number of cache nodes in the cluster.\n\n\
        \ For clusters running Valkey or Redis OSS, this value must be 1. For clusters running \
         Memcached, this value must be between 1 and 40.\n\
        \ "]
  preferred_availability_zone : string_ option;
      [@ocaml.doc
        "The name of the Availability Zone in which the cluster is located or \"Multiple\" if the \
         cache nodes are located in different Availability Zones.\n"]
  preferred_outpost_arn : string_ option;
      [@ocaml.doc "The outpost ARN in which the cache cluster is created.\n"]
  cache_cluster_create_time : t_stamp option;
      [@ocaml.doc "The date and time when the cluster was created.\n"]
  preferred_maintenance_window : string_ option;
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
  pending_modified_values : pending_modified_values option; [@ocaml.doc ""]
  notification_configuration : notification_configuration option;
      [@ocaml.doc
        "Describes a notification topic and its status. Notification topics are used for \
         publishing ElastiCache events to subscribers using Amazon Simple Notification Service \
         (SNS). \n"]
  cache_security_groups : cache_security_group_membership_list option;
      [@ocaml.doc
        "A list of cache security group elements, composed of name and status sub-elements.\n"]
  cache_parameter_group : cache_parameter_group_status option;
      [@ocaml.doc "Status of the cache parameter group.\n"]
  cache_subnet_group_name : string_ option;
      [@ocaml.doc "The name of the cache subnet group associated with the cluster.\n"]
  cache_nodes : cache_node_list option;
      [@ocaml.doc "A list of cache nodes that are members of the cluster.\n"]
  auto_minor_version_upgrade : boolean_ option;
      [@ocaml.doc
        "\194\160If you are running Valkey or Redis OSS engine version 6.0 or later, set this \
         parameter to yes if you want to opt-in to the next auto minor version upgrade campaign. \
         This parameter is disabled for previous versions.\194\160 \n"]
  security_groups : security_group_membership_list option;
      [@ocaml.doc "A list of VPC Security Groups associated with the cluster.\n"]
  replication_group_id : string_ option;
      [@ocaml.doc
        "The replication group to which this cluster belongs. If this field is empty, the cluster \
         is not associated with any replication group.\n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which ElastiCache retains automatic cluster snapshots before \
         deleting them. For example, if you set [SnapshotRetentionLimit] to 5, a snapshot that was \
         taken today is retained for 5 days before being deleted.\n\n\
        \   If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off.\n\
        \  \n\
        \   "]
  snapshot_window : string_ option;
      [@ocaml.doc
        "The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of \
         your cluster.\n\n\
        \ Example: [05:00-09:00] \n\
        \ "]
  auth_token_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables using an [AuthToken] (password) when issuing Valkey or Redis OSS \
         commands.\n\n\
        \ Default: [false] \n\
        \ "]
  auth_token_last_modified_date : t_stamp option;
      [@ocaml.doc "The date the auth token was last modified\n"]
  transit_encryption_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables in-transit encryption when set to [true].\n\n\
        \  {b Required:} Only available when creating a replication group in an Amazon VPC using \
         Redis OSS version [3.2.6], [4.x] or later.\n\
        \ \n\
        \  Default: [false] \n\
        \  "]
  at_rest_encryption_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables encryption at-rest when set to [true].\n\n\
        \ You cannot modify the value of [AtRestEncryptionEnabled] after the cluster is created. \
         To enable at-rest encryption on a cluster you must set [AtRestEncryptionEnabled] to \
         [true] when you create a cluster.\n\
        \ \n\
        \   {b Required:} Only available when creating a replication group in an Amazon VPC using \
         Redis OSS version [3.2.6], [4.x] or later.\n\
        \  \n\
        \   Default: [false] \n\
        \   "]
  ar_n : string_ option; [@ocaml.doc "The ARN (Amazon Resource Name) of the cache cluster.\n"]
  replication_group_log_delivery_enabled : boolean_ option;
      [@ocaml.doc
        "A boolean value indicating whether log delivery is enabled for the replication group.\n"]
  log_delivery_configurations : log_delivery_configuration_list option;
      [@ocaml.doc "Returns the destination, format and type of the logs.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Must be either [ipv4] | [ipv6] | [dual_stack]. IPv6 is supported for workloads using \
         Valkey 7.2 and above, Redis OSS engine version 6.2 7.1 or Memcached engine version 1.6.6 \
         and above on all instances built on the {{:http://aws.amazon.com/ec2/nitro/}Nitro system}.\n"]
  ip_discovery : ip_discovery option;
      [@ocaml.doc
        "The network type associated with the cluster, either [ipv4] | [ipv6]. IPv6 is supported \
         for workloads using Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 or \
         Memcached engine version 1.6.6 and above on all instances built on the \
         {{:http://aws.amazon.com/ec2/nitro/}Nitro system}.\n"]
  transit_encryption_mode : transit_encryption_mode option;
      [@ocaml.doc
        "A setting that allows you to migrate your clients to use in-transit encryption, with no \
         downtime.\n"]
}
[@@ocaml.doc "Contains all of the attributes of a specific cluster.\n"]

type nonrec reboot_cache_cluster_result = { cache_cluster : cache_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec reboot_cache_cluster_message = {
  cache_cluster_id : string_;
      [@ocaml.doc "The cluster identifier. This parameter is stored as a lowercase string.\n"]
  cache_node_ids_to_reboot : cache_node_ids_list;
      [@ocaml.doc
        "A list of cache node IDs to reboot. A node ID is a numeric identifier (0001, 0002, etc.). \
         To reboot an entire cluster, specify all of the cache node IDs.\n"]
}
[@@ocaml.doc "Represents the input of a [RebootCacheCluster] operation.\n"]

type nonrec global_replication_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The Global datastore does not exist\n"]

type nonrec global_node_group = {
  global_node_group_id : string_ option; [@ocaml.doc "The name of the global node group\n"]
  slots : string_ option; [@ocaml.doc "The keyspace for this node group\n"]
}
[@@ocaml.doc "Indicates the slot configuration and global identifier for a slice group.\n"]

type nonrec global_node_group_list = global_node_group list [@@ocaml.doc ""]

type nonrec global_replication_group_member = {
  replication_group_id : string_ option;
      [@ocaml.doc "The replication group id of the Global datastore member.\n"]
  replication_group_region : string_ option;
      [@ocaml.doc "The Amazon region of the Global datastore member.\n"]
  role : string_ option;
      [@ocaml.doc "Indicates the role of the replication group, primary or secondary.\n"]
  automatic_failover : automatic_failover_status option;
      [@ocaml.doc "Indicates whether automatic failover is enabled for the replication group.\n"]
  status : string_ option; [@ocaml.doc "The status of the membership of the replication group.\n"]
}
[@@ocaml.doc
  "A member of a Global datastore. It contains the Replication Group Id, the Amazon region and the \
   role of the replication group. \n"]

type nonrec global_replication_group_member_list = global_replication_group_member list
[@@ocaml.doc ""]

type nonrec global_replication_group = {
  global_replication_group_id : string_ option; [@ocaml.doc "The name of the Global datastore\n"]
  global_replication_group_description : string_ option;
      [@ocaml.doc "The optional description of the Global datastore\n"]
  status : string_ option; [@ocaml.doc "The status of the Global datastore\n"]
  cache_node_type : string_ option; [@ocaml.doc "The cache node type of the Global datastore\n"]
  engine : string_ option; [@ocaml.doc "The ElastiCache engine. For Valkey or Redis OSS only.\n"]
  engine_version : string_ option; [@ocaml.doc "The ElastiCache engine version.\n"]
  members : global_replication_group_member_list option;
      [@ocaml.doc "The replication groups that comprise the Global datastore.\n"]
  cluster_enabled : boolean_optional option;
      [@ocaml.doc "A flag that indicates whether the Global datastore is cluster enabled.\n"]
  global_node_groups : global_node_group_list option;
      [@ocaml.doc "Indicates the slot configuration and global identifier for each slice group.\n"]
  auth_token_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables using an [AuthToken] (password) when issuing Valkey or Redis OSS \
         commands.\n\n\
        \ Default: [false] \n\
        \ "]
  transit_encryption_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables in-transit encryption when set to true.\n\n\
        \  {b Required:} Only available when creating a replication group in an Amazon VPC using \
         Redis OSS version [3.2.6], [4.x] or later.\n\
        \ "]
  at_rest_encryption_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables encryption at rest when set to [true].\n\n\
        \ You cannot modify the value of [AtRestEncryptionEnabled] after the replication group is \
         created. To enable encryption at rest on a replication group you must set \
         [AtRestEncryptionEnabled] to [true] when you create the replication group. \n\
        \ \n\
        \   {b Required:} Only available when creating a replication group in an Amazon VPC using \
         Redis OSS version [3.2.6], [4.x] or later.\n\
        \  "]
  ar_n : string_ option;
      [@ocaml.doc "The ARN (Amazon Resource Name) of the global replication group.\n"]
}
[@@ocaml.doc
  "Consists of a primary cluster that accepts writes and an associated secondary cluster that \
   resides in a different Amazon region. The secondary cluster accepts only reads. The primary \
   cluster automatically replicates updates to the secondary cluster.\n\n\
  \ {ul\n\
  \       {-  The {b GlobalReplicationGroupIdSuffix} represents the name of the Global datastore, \
   which is what you use to associate a secondary cluster.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec rebalance_slots_in_global_replication_group_result = {
  global_replication_group : global_replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec rebalance_slots_in_global_replication_group_message = {
  global_replication_group_id : string_; [@ocaml.doc "The name of the Global datastore\n"]
  apply_immediately : boolean_; [@ocaml.doc "If [True], redistribution is applied immediately.\n"]
}
[@@ocaml.doc ""]

type nonrec reserved_cache_nodes_offering_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The requested cache node offering does not exist.\n"]

type nonrec reserved_cache_node_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the user's cache node quota.\n"]

type nonrec reserved_cache_node_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You already have a reservation with the given identifier.\n"]

type nonrec recurring_charge = {
  recurring_charge_amount : double option;
      [@ocaml.doc "The monetary amount of the recurring charge.\n"]
  recurring_charge_frequency : string_ option;
      [@ocaml.doc "The frequency of the recurring charge.\n"]
}
[@@ocaml.doc
  "Contains the specific price and frequency of a recurring charges for a reserved cache node, or \
   for a reserved cache node offering.\n"]

type nonrec recurring_charge_list = recurring_charge list [@@ocaml.doc ""]

type nonrec reserved_cache_node = {
  reserved_cache_node_id : string_ option;
      [@ocaml.doc "The unique identifier for the reservation.\n"]
  reserved_cache_nodes_offering_id : string_ option; [@ocaml.doc "The offering identifier.\n"]
  cache_node_type : string_ option;
      [@ocaml.doc
        "The cache node type for the reserved cache nodes.\n\n\
        \ The following node types are supported by ElastiCache. Generally speaking, the current \
         generation types provide more memory and computational power at lower cost when compared \
         to their equivalent previous generation counterparts.\n\
        \ \n\
        \  {ul\n\
        \        {-  General purpose:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b M7g node types}: [cache.m7g.large], [cache.m7g.xlarge], \
         [cache.m7g.2xlarge], [cache.m7g.4xlarge], [cache.m7g.8xlarge], [cache.m7g.12xlarge], \
         [cache.m7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b M6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.m6g.large], \
         [cache.m6g.xlarge], [cache.m6g.2xlarge], [cache.m6g.4xlarge], [cache.m6g.8xlarge], \
         [cache.m6g.12xlarge], [cache.m6g.16xlarge] \n\
        \                            \n\
        \                              {b M5 node types:} [cache.m5.large], [cache.m5.xlarge], \
         [cache.m5.2xlarge], [cache.m5.4xlarge], [cache.m5.12xlarge], [cache.m5.24xlarge] \n\
        \                             \n\
        \                               {b M4 node types:} [cache.m4.large], [cache.m4.xlarge], \
         [cache.m4.2xlarge], [cache.m4.4xlarge], [cache.m4.10xlarge] \n\
        \                              \n\
        \                                {b T4g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and Memcached engine version 1.5.16 onward): [cache.t4g.micro], \
         [cache.t4g.small], [cache.t4g.medium] \n\
        \                               \n\
        \                                 {b T3 node types:} [cache.t3.micro], [cache.t3.small], \
         [cache.t3.medium] \n\
        \                                \n\
        \                                  {b T2 node types:} [cache.t2.micro], [cache.t2.small], \
         [cache.t2.medium] \n\
        \                                 \n\
        \                                  }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b T1 node types:} [cache.t1.micro] \n\
        \                        \n\
        \                          {b M1 node types:} [cache.m1.small], [cache.m1.medium], \
         [cache.m1.large], [cache.m1.xlarge] \n\
        \                         \n\
        \                           {b M3 node types:} [cache.m3.medium], [cache.m3.large], \
         [cache.m3.xlarge], [cache.m3.2xlarge] \n\
        \                          \n\
        \                           }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Compute optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b C1 node types:} [cache.c1.xlarge] \n\
        \                        \n\
        \                         }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Memory optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b R7g node types}: [cache.r7g.large], [cache.r7g.xlarge], \
         [cache.r7g.2xlarge], [cache.r7g.4xlarge], [cache.r7g.8xlarge], [cache.r7g.12xlarge], \
         [cache.r7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b R6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.r6g.large], \
         [cache.r6g.xlarge], [cache.r6g.2xlarge], [cache.r6g.4xlarge], [cache.r6g.8xlarge], \
         [cache.r6g.12xlarge], [cache.r6g.16xlarge] \n\
        \                            \n\
        \                              {b R5 node types:} [cache.r5.large], [cache.r5.xlarge], \
         [cache.r5.2xlarge], [cache.r5.4xlarge], [cache.r5.12xlarge], [cache.r5.24xlarge] \n\
        \                             \n\
        \                               {b R4 node types:} [cache.r4.large], [cache.r4.xlarge], \
         [cache.r4.2xlarge], [cache.r4.4xlarge], [cache.r4.8xlarge], [cache.r4.16xlarge] \n\
        \                              \n\
        \                               }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b M2 node types:} [cache.m2.xlarge], [cache.m2.2xlarge], \
         [cache.m2.4xlarge] \n\
        \                        \n\
        \                          {b R3 node types:} [cache.r3.large], [cache.r3.xlarge], \
         [cache.r3.2xlarge], [cache.r3.4xlarge], [cache.r3.8xlarge] \n\
        \                         \n\
        \                          }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \    {b Additional node type info} \n\
        \   \n\
        \    {ul\n\
        \          {-  All current generation instance types are created in Amazon VPC by default.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS append-only files (AOF) are not supported for T1 or T2 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS Multi-AZ with automatic failover is not supported on T1 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  The configuration variables [appendonly] and [appendfsync] are not \
         supported on Valkey, or on Redis OSS version 2.8.22 and later.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  start_time : t_stamp option; [@ocaml.doc "The time the reservation started.\n"]
  duration : integer option; [@ocaml.doc "The duration of the reservation in seconds.\n"]
  fixed_price : double option;
      [@ocaml.doc "The fixed price charged for this reserved cache node.\n"]
  usage_price : double option;
      [@ocaml.doc "The hourly price charged for this reserved cache node.\n"]
  cache_node_count : integer option;
      [@ocaml.doc "The number of cache nodes that have been reserved.\n"]
  product_description : string_ option; [@ocaml.doc "The description of the reserved cache node.\n"]
  offering_type : string_ option; [@ocaml.doc "The offering type of this reserved cache node.\n"]
  state : string_ option; [@ocaml.doc "The state of the reserved cache node.\n"]
  recurring_charges : recurring_charge_list option;
      [@ocaml.doc "The recurring price charged to run this reserved cache node.\n"]
  reservation_ar_n : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the reserved cache node.\n\n\
        \ Example: \
         [arn:aws:elasticache:us-east-1:123456789012:reserved-instance:ri-2017-03-27-08-33-25-582] \n\
        \ "]
}
[@@ocaml.doc "Represents the output of a [PurchaseReservedCacheNodesOffering] operation.\n"]

type nonrec purchase_reserved_cache_nodes_offering_result = {
  reserved_cache_node : reserved_cache_node option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec purchase_reserved_cache_nodes_offering_message = {
  reserved_cache_nodes_offering_id : string_;
      [@ocaml.doc
        "The ID of the reserved cache node offering to purchase.\n\n\
        \ Example: [438012d3-4052-4cc7-b2e3-8d3372e0e706] \n\
        \ "]
  reserved_cache_node_id : string_ option;
      [@ocaml.doc
        "A customer-specified identifier to track this reservation.\n\n\
        \  The Reserved Cache Node ID is an unique customer-specified identifier to track this \
         reservation. If this parameter is not specified, ElastiCache automatically generates an \
         identifier for the reservation.\n\
        \  \n\
        \    Example: myreservationID\n\
        \    "]
  cache_node_count : integer_optional option;
      [@ocaml.doc "The number of cache node instances to reserve.\n\n Default: [1] \n "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
}
[@@ocaml.doc "Represents the input of a [PurchaseReservedCacheNodesOffering] operation.\n"]

type nonrec service_linked_role_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified service linked role (SLR) was not found.\n"]

type nonrec invalid_user_group_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The user group is not in an active state.\n"]

type nonrec duplicate_user_name_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A user with this username already exists.\n"]

type nonrec default_user_required = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "You must add default user to a user group.\n"]

type nonrec ug_serverless_cache_id_list = string_ list [@@ocaml.doc ""]

type nonrec ug_replication_group_id_list = string_ list [@@ocaml.doc ""]

type nonrec user_id = string [@@ocaml.doc ""]

type nonrec user_id_list = user_id list [@@ocaml.doc ""]

type nonrec user_group_pending_changes = {
  user_ids_to_remove : user_id_list option; [@ocaml.doc "The list of user IDs to remove.\n"]
  user_ids_to_add : user_id_list option; [@ocaml.doc "The list of user IDs to add.\n"]
}
[@@ocaml.doc "Returns the updates being applied to the user group.\n"]

type nonrec engine_type = string [@@ocaml.doc ""]

type nonrec user_group = {
  user_group_id : string_ option; [@ocaml.doc "The ID of the user group.\n"]
  status : string_ option;
      [@ocaml.doc
        "Indicates user group status. Can be \"creating\", \"active\", \"modifying\", \"deleting\".\n"]
  engine : engine_type option; [@ocaml.doc "The options are valkey or redis.\n"]
  user_ids : user_id_list option;
      [@ocaml.doc "The list of user IDs that belong to the user group.\n"]
  minimum_engine_version : string_ option;
      [@ocaml.doc "The minimum engine version required, which is Redis OSS 6.0\n"]
  pending_changes : user_group_pending_changes option;
      [@ocaml.doc "A list of updates being applied to the user group.\n"]
  replication_groups : ug_replication_group_id_list option;
      [@ocaml.doc "A list of replication groups that the user group can access.\n"]
  serverless_caches : ug_serverless_cache_id_list option;
      [@ocaml.doc
        "Indicates which serverless caches the specified user group is associated with. Available \
         for Valkey, Redis OSS and Serverless Memcached only.\n"]
  ar_n : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the user group.\n"]
}
[@@ocaml.doc ""]

type nonrec user_id_list_input = user_id list [@@ocaml.doc ""]

type nonrec modify_user_group_message = {
  user_group_id : string_; [@ocaml.doc "The ID of the user group.\n"]
  user_ids_to_add : user_id_list_input option;
      [@ocaml.doc "The list of user IDs to add to the user group.\n"]
  user_ids_to_remove : user_id_list_input option;
      [@ocaml.doc "The list of user IDs to remove from the user group.\n"]
  engine : engine_type option;
      [@ocaml.doc "Modifies the engine listed in a user group. The options are valkey or redis.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_user_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The user is not in active state.\n"]

type nonrec authentication_type =
  | PASSWORD [@ocaml.doc ""]
  | NO_PASSWORD [@ocaml.doc ""]
  | IAM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec authentication = {
  type_ : authentication_type option;
      [@ocaml.doc "Indicates whether the user requires a password to authenticate.\n"]
  password_count : integer_optional option;
      [@ocaml.doc "The number of passwords belonging to the user. The maximum is two.\n"]
}
[@@ocaml.doc "Indicates whether the user requires a password to authenticate.\n"]

type nonrec user = {
  user_id : string_ option; [@ocaml.doc "The ID of the user.\n"]
  user_name : string_ option; [@ocaml.doc "The username of the user.\n"]
  status : string_ option;
      [@ocaml.doc "Indicates the user status. Can be \"active\", \"modifying\" or \"deleting\".\n"]
  engine : engine_type option; [@ocaml.doc "The options are valkey or redis.\n"]
  minimum_engine_version : string_ option;
      [@ocaml.doc "The minimum engine version required, which is Redis OSS 6.0\n"]
  access_string : string_ option; [@ocaml.doc "Access permissions string used for this user.\n"]
  user_group_ids : user_group_id_list option;
      [@ocaml.doc "Returns a list of the user group IDs the user belongs to.\n"]
  authentication : authentication option;
      [@ocaml.doc "Denotes whether the user requires a password to authenticate.\n"]
  ar_n : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the user.\n"]
}
[@@ocaml.doc ""]

type nonrec password_list_input = string_ list [@@ocaml.doc ""]

type nonrec input_authentication_type =
  | PASSWORD [@ocaml.doc ""]
  | NO_PASSWORD [@ocaml.doc ""]
  | IAM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec authentication_mode = {
  type_ : input_authentication_type option;
      [@ocaml.doc
        "Specifies the authentication type. Possible options are IAM authentication, password and \
         no password.\n"]
  passwords : password_list_input option;
      [@ocaml.doc
        "Specifies the passwords to use for authentication if [Type] is set to [password].\n"]
}
[@@ocaml.doc "Specifies the authentication mode to use.\n"]

type nonrec modify_user_message = {
  user_id : user_id; [@ocaml.doc "The ID of the user.\n"]
  access_string : access_string option;
      [@ocaml.doc "Access permissions string used for this user.\n"]
  append_access_string : access_string option;
      [@ocaml.doc "Adds additional user permissions to the access string.\n"]
  passwords : password_list_input option;
      [@ocaml.doc "The passwords belonging to the user. You are allowed up to two.\n"]
  no_password_required : boolean_optional option;
      [@ocaml.doc "Indicates no password is required for the user.\n"]
  authentication_mode : authentication_mode option;
      [@ocaml.doc "Specifies how to authenticate the user.\n"]
  engine : engine_type option;
      [@ocaml.doc "Modifies the engine listed for a user. The options are valkey or redis.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_credentials_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "You must enter valid credentials.\n"]

type nonrec subnet_ids_list = string_ list [@@ocaml.doc ""]

type nonrec security_group_ids_list = string_ list [@@ocaml.doc ""]

type nonrec ecpu_per_second = {
  maximum : integer_optional option;
      [@ocaml.doc
        "The configuration for the maximum number of ECPUs the cache can consume per second.\n"]
  minimum : integer_optional option;
      [@ocaml.doc
        "The configuration for the minimum number of ECPUs the cache should be able consume per \
         second.\n"]
}
[@@ocaml.doc
  "The configuration for the number of ElastiCache Processing Units (ECPU) the cache can consume \
   per second.\n"]

type nonrec data_storage_unit = GB [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec data_storage = {
  maximum : integer_optional option;
      [@ocaml.doc "The upper limit for data storage the cache is set to use.\n"]
  minimum : integer_optional option;
      [@ocaml.doc "The lower limit for data storage the cache is set to use.\n"]
  unit_ : data_storage_unit; [@ocaml.doc "The unit that the storage is measured in, in GB.\n"]
}
[@@ocaml.doc "The data storage limit.\n"]

type nonrec cache_usage_limits = {
  data_storage : data_storage option;
      [@ocaml.doc " The maximum data storage limit in the cache, expressed in Gigabytes. \n"]
  ecpu_per_second : ecpu_per_second option; [@ocaml.doc ""]
}
[@@ocaml.doc "The usage limits for storage and ElastiCache Processing Units for the cache.\n"]

type nonrec serverless_cache = {
  serverless_cache_name : string_ option;
      [@ocaml.doc "The unique identifier of the serverless cache.\n"]
  description : string_ option; [@ocaml.doc "A description of the serverless cache.\n"]
  create_time : t_stamp option; [@ocaml.doc "When the serverless cache was created. \n"]
  status : string_ option;
      [@ocaml.doc
        "The current status of the serverless cache. The allowed values are CREATING, AVAILABLE, \
         DELETING, CREATE-FAILED and MODIFYING.\n"]
  engine : string_ option; [@ocaml.doc "The engine the serverless cache is compatible with.\n"]
  major_engine_version : string_ option;
      [@ocaml.doc "The version number of the engine the serverless cache is compatible with.\n"]
  full_engine_version : string_ option;
      [@ocaml.doc
        "The name and version number of the engine the serverless cache is compatible with.\n"]
  cache_usage_limits : cache_usage_limits option;
      [@ocaml.doc "The cache usage limit for the serverless cache.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The ID of the Amazon Web Services Key Management Service (KMS) key that is used to \
         encrypt data at rest in the serverless cache.\n"]
  storage_encryption_type : storage_encryption_type option;
      [@ocaml.doc
        "Indicates the type of encryption for data stored at rest in the serverless cache. \
         Serverless caches are always encrypted at rest. The value is [sse-elasticache] if an \
         ElastiCache service-managed key is used, or [sse-kms] if a customer-managed KMS key is \
         used.\n"]
  security_group_ids : security_group_ids_list option;
      [@ocaml.doc "The IDs of the EC2 security groups associated with the serverless cache.\n"]
  endpoint : endpoint option; [@ocaml.doc ""]
  reader_endpoint : endpoint option; [@ocaml.doc ""]
  ar_n : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the serverless cache.\n"]
  user_group_id : string_ option;
      [@ocaml.doc
        "The identifier of the user group associated with the serverless cache. Available for \
         Valkey and Redis OSS only. Default is NULL.\n"]
  subnet_ids : subnet_ids_list option;
      [@ocaml.doc
        "If no subnet IDs are given and your VPC is in us-west-1, then ElastiCache will select 2 \
         default subnets across AZs in your VPC. For all other Regions, if no subnet IDs are given \
         then ElastiCache will select 3 default subnets across AZs in your default VPC.\n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which ElastiCache retains automatic snapshots before deleting \
         them. Available for Valkey, Redis OSS and Serverless Memcached only. The maximum value \
         allowed is 35 days.\n"]
  daily_snapshot_time : string_ option;
      [@ocaml.doc
        "The daily time that a cache snapshot will be created. Default is NULL, i.e. snapshots \
         will not be created at a specific time on a daily basis. Available for Valkey, Redis OSS \
         and Serverless Memcached only.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "The type of IP address protocol used by the serverless cache. Must be either [ipv4] | \
         [ipv6] | [dual_stack]. [ipv6] is only supported with IPv6-only subnets. If not specified, \
         defaults to [ipv4], unless all provided subnets are IPv6-only, in which case it defaults \
         to [ipv6].\n"]
}
[@@ocaml.doc "The resource representing a serverless cache.\n"]

type nonrec modify_serverless_cache_response = {
  serverless_cache : serverless_cache option;
      [@ocaml.doc "The response for the attempt to modify the serverless cache.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_serverless_cache_request = {
  serverless_cache_name : string_;
      [@ocaml.doc "User-provided identifier for the serverless cache to be modified.\n"]
  description : string_ option;
      [@ocaml.doc
        "User provided description for the serverless cache. Default = NULL, i.e. the existing \
         description is not removed/modified. The description has a maximum length of 255 \
         characters.\n"]
  cache_usage_limits : cache_usage_limits option;
      [@ocaml.doc "Modify the cache usage limit for the serverless cache.\n"]
  remove_user_group : boolean_optional option;
      [@ocaml.doc
        "The identifier of the UserGroup to be removed from association with the Valkey and Redis \
         OSS serverless cache. Available for Valkey and Redis OSS only. Default is NULL.\n"]
  user_group_id : string_ option;
      [@ocaml.doc
        "The identifier of the UserGroup to be associated with the serverless cache. Available for \
         Valkey and Redis OSS only. Default is NULL - the existing UserGroup is not removed.\n"]
  security_group_ids : security_group_ids_list option;
      [@ocaml.doc
        "The new list of VPC security groups to be associated with the serverless cache. \
         Populating this list means the current VPC security groups will be removed. This security \
         group is used to authorize traffic access for the VPC end-point (private-link). Default = \
         NULL - the existing list of VPC security groups is not removed.\n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which Elasticache retains automatic snapshots before deleting \
         them. Available for Valkey, Redis OSS and Serverless Memcached only. Default = NULL, i.e. \
         the existing snapshot-retention-limit will not be removed or modified. The maximum value \
         allowed is 35 days.\n"]
  daily_snapshot_time : string_ option;
      [@ocaml.doc
        "The daily time during which Elasticache begins taking a daily snapshot of the serverless \
         cache. Available for Valkey, Redis OSS and Serverless Memcached only. The default is \
         NULL, i.e. the existing snapshot time configured for the cluster is not removed.\n"]
  engine : string_ option;
      [@ocaml.doc
        "Modifies the engine listed in a serverless cache request. The options are valkey, \
         memcached or redis.\n"]
  major_engine_version : string_ option;
      [@ocaml.doc "Modifies the engine vesion listed in a serverless cache request. \n"]
}
[@@ocaml.doc ""]

type nonrec node_quota_for_customer_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the allowed number of cache nodes per \
   customer.\n"]

type nonrec node_groups_per_replication_group_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum allowed number of node \
   groups (shards) in a single replication group. The default maximum is 90\n"]

type nonrec invalid_vpc_network_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The VPC network is in an invalid state.\n"]

type nonrec insufficient_cache_cluster_capacity_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested cache node type is not available in the specified Availability Zone. For more \
   information, see \
   {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/ErrorMessages.html#ErrorMessages.INSUFFICIENT_CACHE_CLUSTER_CAPACITY}InsufficientCacheClusterCapacity} \
   in the ElastiCache User Guide.\n"]

type nonrec modify_replication_group_shard_configuration_result = {
  replication_group : replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec node_groups_to_retain_list = allowed_node_group_id list [@@ocaml.doc ""]

type nonrec node_groups_to_remove_list = allowed_node_group_id list [@@ocaml.doc ""]

type nonrec availability_zones_list = string_ list [@@ocaml.doc ""]

type nonrec resharding_configuration = {
  node_group_id : allowed_node_group_id option;
      [@ocaml.doc
        "Either the ElastiCache supplied 4-digit id or a user supplied id for the node group these \
         configuration values apply to.\n"]
  preferred_availability_zones : availability_zones_list option;
      [@ocaml.doc "A list of preferred availability zones for the nodes in this cluster.\n"]
}
[@@ocaml.doc
  "A list of [PreferredAvailabilityZones] objects that specifies the configuration of a node group \
   in the resharded cluster.\n"]

type nonrec resharding_configuration_list = resharding_configuration list [@@ocaml.doc ""]

type nonrec modify_replication_group_shard_configuration_message = {
  replication_group_id : string_;
      [@ocaml.doc
        "The name of the Valkey or Redis OSS (cluster mode enabled) cluster (replication group) on \
         which the shards are to be configured.\n"]
  node_group_count : integer;
      [@ocaml.doc
        "The number of node groups (shards) that results from the modification of the shard \
         configuration.\n"]
  apply_immediately : boolean_;
      [@ocaml.doc
        "Indicates that the shard reconfiguration process begins immediately. At present, the only \
         permitted value for this parameter is [true].\n\n\
        \ Value: true\n\
        \ "]
  resharding_configuration : resharding_configuration_list option;
      [@ocaml.doc
        "Specifies the preferred availability zones for each node group in the cluster. If the \
         value of [NodeGroupCount] is greater than the current number of node groups (shards), you \
         can use this parameter to specify the preferred availability zones of the cluster's \
         shards. If you omit this parameter ElastiCache selects availability zones for you.\n\n\
        \ You can specify this parameter only if the value of [NodeGroupCount] is greater than the \
         current number of node groups (shards).\n\
        \ "]
  node_groups_to_remove : node_groups_to_remove_list option;
      [@ocaml.doc
        "If the value of [NodeGroupCount] is less than the current number of node groups (shards), \
         then either [NodeGroupsToRemove] or [NodeGroupsToRetain] is required. \
         [NodeGroupsToRemove] is a list of [NodeGroupId]s to remove from the cluster.\n\n\
        \ ElastiCache will attempt to remove all node groups listed by [NodeGroupsToRemove] from \
         the cluster.\n\
        \ "]
  node_groups_to_retain : node_groups_to_retain_list option;
      [@ocaml.doc
        "If the value of [NodeGroupCount] is less than the current number of node groups (shards), \
         then either [NodeGroupsToRemove] or [NodeGroupsToRetain] is required. \
         [NodeGroupsToRetain] is a list of [NodeGroupId]s to retain in the cluster.\n\n\
        \ ElastiCache will attempt to remove all node groups except those listed by \
         [NodeGroupsToRetain] from the cluster.\n\
        \ "]
}
[@@ocaml.doc "Represents the input for a [ModifyReplicationGroupShardConfiguration] operation.\n"]

type nonrec node_quota_for_cluster_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the allowed number of cache nodes in a \
   single cluster.\n"]

type nonrec modify_replication_group_result = {
  replication_group : replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec log_delivery_configuration_request = {
  log_type : log_type option;
      [@ocaml.doc "Refers to {{:https://redis.io/commands/slowlog}slow-log} or engine-log..\n"]
  destination_type : destination_type option;
      [@ocaml.doc
        "Specify either [cloudwatch-logs] or [kinesis-firehose] as the destination type.\n"]
  destination_details : destination_details option;
      [@ocaml.doc
        "Configuration details of either a CloudWatch Logs destination or Kinesis Data Firehose \
         destination.\n"]
  log_format : log_format option; [@ocaml.doc "Specifies either JSON or TEXT\n"]
  enabled : boolean_optional option;
      [@ocaml.doc "Specify if log delivery is enabled. Default [true].\n"]
}
[@@ocaml.doc "Specifies the destination, format and type of the logs. \n"]

type nonrec log_delivery_configuration_request_list = log_delivery_configuration_request list
[@@ocaml.doc ""]

type nonrec auth_token_update_strategy_type =
  | SET [@ocaml.doc ""]
  | ROTATE [@ocaml.doc ""]
  | DELETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cache_security_group_name_list = string_ list [@@ocaml.doc ""]

type nonrec modify_replication_group_message = {
  replication_group_id : string_;
      [@ocaml.doc "The identifier of the replication group to modify.\n"]
  replication_group_description : string_ option;
      [@ocaml.doc "A description for the replication group. Maximum length is 255 characters.\n"]
  primary_cluster_id : string_ option;
      [@ocaml.doc
        "For replication groups with a single primary, if this parameter is specified, ElastiCache \
         promotes the specified cluster in the specified replication group to the primary role. \
         The nodes of all other clusters in the replication group are read replicas.\n"]
  snapshotting_cluster_id : string_ option;
      [@ocaml.doc
        "The cluster ID that is used as the daily snapshot source for the replication group. This \
         parameter cannot be set for Valkey or Redis OSS (cluster mode enabled) replication groups.\n"]
  automatic_failover_enabled : boolean_optional option;
      [@ocaml.doc
        "Determines whether a read replica is automatically promoted to read/write primary if the \
         existing primary encounters a failure.\n\n\
        \ Valid values: [true] | [false] \n\
        \ "]
  multi_az_enabled : boolean_optional option;
      [@ocaml.doc "A flag to indicate MultiAZ is enabled.\n"]
  node_group_id : string_ option; [@ocaml.doc "Deprecated. This parameter is not used.\n"]
  cache_security_group_names : cache_security_group_name_list option;
      [@ocaml.doc
        "A list of cache security group names to authorize for the clusters in this replication \
         group. This change is asynchronously applied as soon as possible.\n\n\
        \ This parameter can be used only with replication group containing clusters running \
         outside of an Amazon Virtual Private Cloud (Amazon VPC).\n\
        \ \n\
        \  Constraints: Must contain no more than 255 alphanumeric characters. Must not be \
         [Default].\n\
        \  "]
  security_group_ids : security_group_ids_list option;
      [@ocaml.doc
        "Specifies the VPC Security Groups associated with the clusters in the replication group.\n\n\
        \ This parameter can be used only with replication group containing clusters running in an \
         Amazon Virtual Private Cloud (Amazon VPC).\n\
        \ "]
  preferred_maintenance_window : string_ option;
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
  notification_topic_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications are sent.\n\n\
        \  The Amazon SNS topic owner must be same as the replication group owner. \n\
        \  \n\
        \   "]
  cache_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the cache parameter group to apply to all of the clusters in this replication \
         group. This change is asynchronously applied as soon as possible for parameters when the \
         [ApplyImmediately] parameter is specified as [true] for this request.\n"]
  notification_topic_status : string_ option;
      [@ocaml.doc
        "The status of the Amazon SNS notification topic for the replication group. Notifications \
         are sent only if the status is [active].\n\n\
        \ Valid values: [active] | [inactive] \n\
        \ "]
  apply_immediately : boolean_ option;
      [@ocaml.doc
        "If [true], this parameter causes the modifications in this request and any pending \
         modifications to be applied, asynchronously and as soon as possible, regardless of the \
         [PreferredMaintenanceWindow] setting for the replication group.\n\n\
        \ If [false], changes to the nodes in the replication group are applied on the next \
         maintenance reboot, or the next failure reboot, whichever occurs first.\n\
        \ \n\
        \  Valid values: [true] | [false] \n\
        \  \n\
        \   Default: [false] \n\
        \   "]
  engine : string_ option;
      [@ocaml.doc
        "Modifies the engine listed in a replication group message. The options are valkey, \
         memcached or redis.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The upgraded version of the cache engine to be run on the clusters in the replication \
         group.\n\n\
        \  {b Important:} You can upgrade to a newer engine version (see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/SelectEngine.html#VersionManagement}Selecting \
         a Cache Engine and Version}), but you cannot downgrade to an earlier engine version. If \
         you want to use an earlier engine version, you must delete the existing replication group \
         and create it anew with the earlier engine version. \n\
        \ "]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "\194\160If you are running Valkey or Redis OSS engine version 6.0 or later, set this \
         parameter to yes if you want to opt-in to the next auto minor version upgrade campaign. \
         This parameter is disabled for previous versions.\194\160 \n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which ElastiCache retains automatic node group (shard) snapshots \
         before deleting them. For example, if you set [SnapshotRetentionLimit] to 5, a snapshot \
         that was taken today is retained for 5 days before being deleted.\n\n\
        \  {b Important} If the value of SnapshotRetentionLimit is set to zero (0), backups are \
         turned off.\n\
        \ "]
  snapshot_window : string_ option;
      [@ocaml.doc
        "The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of \
         the node group (shard) specified by [SnapshottingClusterId].\n\n\
        \ Example: [05:00-09:00] \n\
        \ \n\
        \  If you do not specify this parameter, ElastiCache automatically chooses an appropriate \
         time range.\n\
        \  "]
  cache_node_type : string_ option;
      [@ocaml.doc "A valid cache node type that you want to scale this replication group to.\n"]
  auth_token : string_ option;
      [@ocaml.doc
        "Reserved parameter. The password used to access a password protected server. This \
         parameter must be specified with the [auth-token-update-strategy ] parameter. Password \
         constraints:\n\n\
        \ {ul\n\
        \       {-  Must be only printable ASCII characters\n\
        \           \n\
        \            }\n\
        \       {-  Must be at least 16 characters and no more than 128 characters in length\n\
        \           \n\
        \            }\n\
        \       {-  Cannot contain any of the following characters: '/', '\"', or '\\@', '%'\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    For more information, see AUTH password at {{:http://redis.io/commands/AUTH}AUTH}.\n\
        \   "]
  auth_token_update_strategy : auth_token_update_strategy_type option;
      [@ocaml.doc
        "Specifies the strategy to use to update the AUTH token. This parameter must be specified \
         with the [auth-token] parameter. Possible values:\n\n\
        \ {ul\n\
        \       {-  ROTATE - default, if no update strategy is provided\n\
        \           \n\
        \            }\n\
        \       {-  SET - allowed only after ROTATE\n\
        \           \n\
        \            }\n\
        \       {-  DELETE - allowed only when transitioning to RBAC\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    For more information, see \
         {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/auth.html}Authenticating Users \
         with AUTH} \n\
        \   "]
  user_group_ids_to_add : user_group_id_list option;
      [@ocaml.doc "The ID of the user group you are associating with the replication group.\n"]
  user_group_ids_to_remove : user_group_id_list option;
      [@ocaml.doc
        "The ID of the user group to disassociate from the replication group, meaning the users in \
         the group no longer can access the replication group.\n"]
  remove_user_groups : boolean_optional option;
      [@ocaml.doc "Removes the user group associated with this replication group.\n"]
  log_delivery_configurations : log_delivery_configuration_request_list option;
      [@ocaml.doc "Specifies the destination, format and type of the logs.\n"]
  ip_discovery : ip_discovery option;
      [@ocaml.doc
        "The network type you choose when modifying a cluster, either [ipv4] | [ipv6]. IPv6 is \
         supported for workloads using Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 \
         and Memcached engine version 1.6.6 and above on all instances built on the \
         {{:http://aws.amazon.com/ec2/nitro/}Nitro system}.\n"]
  transit_encryption_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables in-transit encryption when set to true. If you are enabling \
         in-transit encryption for an existing cluster, you must also set [TransitEncryptionMode] \
         to [preferred].\n"]
  transit_encryption_mode : transit_encryption_mode option;
      [@ocaml.doc
        "A setting that allows you to migrate your clients to use in-transit encryption, with no \
         downtime.\n\n\
        \ You must set [TransitEncryptionEnabled] to [true], for your existing cluster, and set \
         [TransitEncryptionMode] to [preferred] in the same request to allow both encrypted and \
         unencrypted connections at the same time. Once you migrate all your Valkey or Redis OSS \
         clients to use encrypted connections you can set the value to [required] to allow \
         encrypted connections only.\n\
        \ \n\
        \  Setting [TransitEncryptionMode] to [required] is a two-step process that requires you \
         to first set the [TransitEncryptionMode] to [preferred], after that you can set \
         [TransitEncryptionMode] to [required]. \n\
        \  "]
  cluster_mode : cluster_mode option;
      [@ocaml.doc
        "Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you must first set \
         the cluster mode to Compatible. Compatible mode allows your Valkey or Redis OSS clients \
         to connect using both cluster mode enabled and cluster mode disabled. After you migrate \
         all Valkey or Redis OSS clients to use cluster mode enabled, you can then complete \
         cluster mode configuration and set the cluster mode to Enabled.\n"]
  durability : durability option;
      [@ocaml.doc
        "Specifies the durability setting for the replication group. Use this parameter to change \
         the durability mode of an existing replication group, for example from [sync] to [async] \
         or vice versa. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/durability.html}Durability}.\n"]
}
[@@ocaml.doc "Represents the input of a [ModifyReplicationGroups] operation.\n"]

type nonrec modify_global_replication_group_result = {
  global_replication_group : global_replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec modify_global_replication_group_message = {
  global_replication_group_id : string_; [@ocaml.doc "The name of the Global datastore\n"]
  apply_immediately : boolean_;
      [@ocaml.doc
        "This parameter causes the modifications in this request and any pending modifications to \
         be applied, asynchronously and as soon as possible. Modifications to Global Replication \
         Groups cannot be requested to be applied in PreferredMaintenceWindow. \n"]
  cache_node_type : string_ option;
      [@ocaml.doc "A valid cache node type that you want to scale this Global datastore to.\n"]
  engine : string_ option;
      [@ocaml.doc
        "Modifies the engine listed in a global replication group message. The options are valkey, \
         memcached or redis.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The upgraded version of the cache engine to be run on the clusters in the Global \
         datastore. \n"]
  cache_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the cache parameter group to use with the Global datastore. It must be \
         compatible with the major engine version used by the Global datastore.\n"]
  global_replication_group_description : string_ option;
      [@ocaml.doc "A description of the Global datastore\n"]
  automatic_failover_enabled : boolean_optional option;
      [@ocaml.doc
        "Determines whether a read replica is automatically promoted to read/write primary if the \
         existing primary encounters a failure. \n"]
}
[@@ocaml.doc ""]

type nonrec subnet_not_allowed_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "At least one subnet ID does not match the other subnet IDs. This mismatch typically occurs when \
   a user sets one subnet ID to a regional Availability Zone and a different one to an outpost. Or \
   when a user sets the subnet ID to an Outpost when not subscribed on this service.\n"]

type nonrec subnet_in_use = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested subnet is being used by another cache subnet group.\n"]

type nonrec invalid_subnet = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "An invalid subnet identifier was specified.\n"]

type nonrec cache_subnet_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the allowed number of subnets in a \
   cache subnet group.\n"]

type nonrec network_type_list = network_type list [@@ocaml.doc ""]

type nonrec subnet_outpost = {
  subnet_outpost_arn : string_ option; [@ocaml.doc "The outpost ARN of the subnet.\n"]
}
[@@ocaml.doc "The ID of the outpost subnet.\n"]

type nonrec availability_zone = {
  name : string_ option; [@ocaml.doc "The name of the Availability Zone.\n"]
}
[@@ocaml.doc "Describes an Availability Zone in which the cluster is launched.\n"]

type nonrec subnet = {
  subnet_identifier : string_ option; [@ocaml.doc "The unique identifier for the subnet.\n"]
  subnet_availability_zone : availability_zone option;
      [@ocaml.doc "The Availability Zone associated with the subnet.\n"]
  subnet_outpost : subnet_outpost option; [@ocaml.doc "The outpost ARN of the subnet.\n"]
  supported_network_types : network_type_list option;
      [@ocaml.doc
        "Either [ipv4] | [ipv6] | [dual_stack]. IPv6 is supported for workloads using Valkey 7.2 \
         and above, Redis OSS engine version 6.2 to 7.1 or Memcached engine version 1.6.6 and \
         above on all instances built on the {{:http://aws.amazon.com/ec2/nitro/}Nitro system}.\n"]
}
[@@ocaml.doc
  "Represents the subnet associated with a cluster. This parameter refers to subnets defined in \
   Amazon Virtual Private Cloud (Amazon VPC) and used with ElastiCache.\n"]

type nonrec subnet_list = subnet list [@@ocaml.doc ""]

type nonrec cache_subnet_group = {
  cache_subnet_group_name : string_ option; [@ocaml.doc "The name of the cache subnet group.\n"]
  cache_subnet_group_description : string_ option;
      [@ocaml.doc "The description of the cache subnet group.\n"]
  vpc_id : string_ option;
      [@ocaml.doc
        "The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet group.\n"]
  subnets : subnet_list option;
      [@ocaml.doc "A list of subnets associated with the cache subnet group.\n"]
  ar_n : string_ option; [@ocaml.doc "The ARN (Amazon Resource Name) of the cache subnet group.\n"]
  supported_network_types : network_type_list option;
      [@ocaml.doc
        "Either [ipv4] | [ipv6] | [dual_stack]. IPv6 is supported for workloads using Valkey 7.2 \
         and above, Redis OSS engine version 6.2 to 7.1 or Memcached engine version 1.6.6 and \
         above on all instances built on the {{:http://aws.amazon.com/ec2/nitro/}Nitro system}.\n"]
}
[@@ocaml.doc
  "Represents the output of one of the following operations:\n\n\
  \ {ul\n\
  \       {-   [CreateCacheSubnetGroup] \n\
  \           \n\
  \            }\n\
  \       {-   [ModifyCacheSubnetGroup] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec modify_cache_subnet_group_result = {
  cache_subnet_group : cache_subnet_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec subnet_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec modify_cache_subnet_group_message = {
  cache_subnet_group_name : string_;
      [@ocaml.doc
        "The name for the cache subnet group. This value is stored as a lowercase string.\n\n\
        \ Constraints: Must contain no more than 255 alphanumeric characters or hyphens.\n\
        \ \n\
        \  Example: [mysubnetgroup] \n\
        \  "]
  cache_subnet_group_description : string_ option;
      [@ocaml.doc "A description of the cache subnet group.\n"]
  subnet_ids : subnet_identifier_list option;
      [@ocaml.doc "The EC2 subnet IDs for the cache subnet group.\n"]
}
[@@ocaml.doc "Represents the input of a [ModifyCacheSubnetGroup] operation.\n"]

type nonrec modify_cache_parameter_group_message = {
  cache_parameter_group_name : string_;
      [@ocaml.doc "The name of the cache parameter group to modify.\n"]
  parameter_name_values : parameter_name_value_list;
      [@ocaml.doc
        "An array of parameter names and values for the parameter update. You must supply at least \
         one parameter name and value; subsequent arguments are optional. A maximum of 20 \
         parameters may be modified per request.\n"]
}
[@@ocaml.doc "Represents the input of a [ModifyCacheParameterGroup] operation.\n"]

type nonrec modify_cache_cluster_result = { cache_cluster : cache_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec preferred_availability_zone_list = string_ list [@@ocaml.doc ""]

type nonrec modify_cache_cluster_message = {
  cache_cluster_id : string_;
      [@ocaml.doc "The cluster identifier. This value is stored as a lowercase string.\n"]
  num_cache_nodes : integer_optional option;
      [@ocaml.doc
        "The number of cache nodes that the cluster should have. If the value for [NumCacheNodes] \
         is greater than the sum of the number of current cache nodes and the number of cache \
         nodes pending creation (which may be zero), more nodes are added. If the value is less \
         than the number of existing cache nodes, nodes are removed. If the value is equal to the \
         number of current cache nodes, any pending add or remove requests are canceled.\n\n\
        \ If you are removing cache nodes, you must use the [CacheNodeIdsToRemove] parameter to \
         provide the IDs of the specific cache nodes to remove.\n\
        \ \n\
        \  For clusters running Valkey or Redis OSS, this value must be 1. For clusters running \
         Memcached, this value must be between 1 and 40.\n\
        \  \n\
        \    Adding or removing Memcached cache nodes can be applied immediately or as a pending \
         operation (see [ApplyImmediately]).\n\
        \    \n\
        \     A pending operation to modify the number of cache nodes in a cluster during its \
         maintenance window, whether by adding or removing nodes in accordance with the scale out \
         architecture, is not queued. The customer's latest request to add or remove nodes to the \
         cluster overrides any previous pending operations to modify the number of cache nodes in \
         the cluster. For example, a request to remove 2 nodes would override a previous pending \
         operation to remove 3 nodes. Similarly, a request to add 2 nodes would override a \
         previous pending operation to remove 3 nodes and vice versa. As Memcached cache nodes may \
         now be provisioned in different Availability Zones with flexible cache node placement, a \
         request to add nodes does not automatically override a previous pending operation to add \
         nodes. The customer can modify the previous pending operation to add more nodes or \
         explicitly cancel the pending request and retry the new request. To cancel pending \
         operations to modify the number of cache nodes in a cluster, use the [ModifyCacheCluster] \
         request and set [NumCacheNodes] equal to the number of cache nodes currently in the \
         cluster.\n\
        \     \n\
        \      "]
  cache_node_ids_to_remove : cache_node_ids_list option;
      [@ocaml.doc
        "A list of cache node IDs to be removed. A node ID is a numeric identifier (0001, 0002, \
         etc.). This parameter is only valid when [NumCacheNodes] is less than the existing number \
         of cache nodes. The number of cache node IDs supplied in this parameter must match the \
         difference between the existing number of cache nodes in the cluster or pending cache \
         nodes, whichever is greater, and the value of [NumCacheNodes] in the request.\n\n\
        \ For example: If you have 3 active cache nodes, 7 pending cache nodes, and the number of \
         cache nodes in this [ModifyCacheCluster] call is 5, you must list 2 (7 - 5) cache node \
         IDs to remove.\n\
        \ "]
  az_mode : az_mode option;
      [@ocaml.doc
        "Specifies whether the new nodes in this Memcached cluster are all created in a single \
         Availability Zone or created across multiple Availability Zones.\n\n\
        \ Valid values: [single-az] | [cross-az].\n\
        \ \n\
        \  This option is only supported for Memcached clusters.\n\
        \  \n\
        \    You cannot specify [single-az] if the Memcached cluster already has cache nodes in \
         different Availability Zones. If [cross-az] is specified, existing Memcached nodes remain \
         in their current Availability Zone.\n\
        \    \n\
        \     Only newly created nodes are located in different Availability Zones. \n\
        \     \n\
        \      "]
  new_availability_zones : preferred_availability_zone_list option;
      [@ocaml.doc
        " This option is only supported on Memcached clusters.\n\
        \ \n\
        \   The list of Availability Zones where the new Memcached cache nodes are created.\n\
        \   \n\
        \    This parameter is only valid when [NumCacheNodes] in the request is greater than the \
         sum of the number of active cache nodes and the number of cache nodes pending creation \
         (which may be zero). The number of Availability Zones supplied in this list must match \
         the cache nodes being added in this request.\n\
        \    \n\
        \     Scenarios:\n\
        \     \n\
        \      {ul\n\
        \            {-   {b Scenario 1:} You have 3 active nodes and wish to add 2 nodes. Specify \
         [NumCacheNodes=5] (3 + 2) and optionally specify two Availability Zones for the two new \
         nodes.\n\
        \                \n\
        \                 }\n\
        \            {-   {b Scenario 2:} You have 3 active nodes and 2 nodes pending creation \
         (from the scenario 1 call) and want to add 1 more node. Specify [NumCacheNodes=6] ((3 + \
         2) + 1) and optionally specify an Availability Zone for the new node.\n\
        \                \n\
        \                 }\n\
        \            {-   {b Scenario 3:} You want to cancel all pending operations. Specify \
         [NumCacheNodes=3] to cancel all pending operations.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   The Availability Zone placement of nodes pending creation cannot be modified. If you \
         wish to cancel any nodes pending creation, add 0 nodes by setting [NumCacheNodes] to the \
         number of current nodes.\n\
        \   \n\
        \    If [cross-az] is specified, existing Memcached nodes remain in their current \
         Availability Zone. Only newly created nodes can be located in different Availability \
         Zones. For guidance on how to move existing Memcached nodes to different Availability \
         Zones, see the {b Availability Zone Considerations} section of \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html}Cache \
         Node Considerations for Memcached}.\n\
        \    \n\
        \      {b Impact of new add/remove requests upon pending requests} \n\
        \     \n\
        \      {ul\n\
        \            {-  Scenario-1\n\
        \                \n\
        \                 {ul\n\
        \                       {-  Pending Action: Delete\n\
        \                           \n\
        \                            }\n\
        \                       {-  New Request: Delete\n\
        \                           \n\
        \                            }\n\
        \                       {-  Result: The new delete, pending or immediate, replaces the \
         pending delete.\n\
        \                           \n\
        \                            }\n\
        \                       \n\
        \             }\n\
        \              }\n\
        \            {-  Scenario-2\n\
        \                \n\
        \                 {ul\n\
        \                       {-  Pending Action: Delete\n\
        \                           \n\
        \                            }\n\
        \                       {-  New Request: Create\n\
        \                           \n\
        \                            }\n\
        \                       {-  Result: The new create, pending or immediate, replaces the \
         pending delete.\n\
        \                           \n\
        \                            }\n\
        \                       \n\
        \             }\n\
        \              }\n\
        \            {-  Scenario-3\n\
        \                \n\
        \                 {ul\n\
        \                       {-  Pending Action: Create\n\
        \                           \n\
        \                            }\n\
        \                       {-  New Request: Delete\n\
        \                           \n\
        \                            }\n\
        \                       {-  Result: The new delete, pending or immediate, replaces the \
         pending create.\n\
        \                           \n\
        \                            }\n\
        \                       \n\
        \             }\n\
        \              }\n\
        \            {-  Scenario-4\n\
        \                \n\
        \                 {ul\n\
        \                       {-  Pending Action: Create\n\
        \                           \n\
        \                            }\n\
        \                       {-  New Request: Create\n\
        \                           \n\
        \                            }\n\
        \                       {-  Result: The new create is added to the pending create.\n\
        \                           \n\
        \                              {b Important:} If the new create request is {b Apply \
         Immediately - Yes}, all creates are performed immediately. If the new create request is \
         {b Apply Immediately - No}, all creates are pending.\n\
        \                             \n\
        \                               }\n\
        \                       \n\
        \             }\n\
        \              }\n\
        \            }\n\
        \  "]
  cache_security_group_names : cache_security_group_name_list option;
      [@ocaml.doc
        "A list of cache security group names to authorize on this cluster. This change is \
         asynchronously applied as soon as possible.\n\n\
        \ You can use this parameter only with clusters that are created outside of an Amazon \
         Virtual Private Cloud (Amazon VPC).\n\
        \ \n\
        \  Constraints: Must contain no more than 255 alphanumeric characters. Must not be \
         \"Default\".\n\
        \  "]
  security_group_ids : security_group_ids_list option;
      [@ocaml.doc
        "Specifies the VPC Security Groups associated with the cluster.\n\n\
        \ This parameter can be used only with clusters that are created in an Amazon Virtual \
         Private Cloud (Amazon VPC).\n\
        \ "]
  preferred_maintenance_window : string_ option;
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
  notification_topic_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications are sent.\n\n\
        \  The Amazon SNS topic owner must be same as the cluster owner.\n\
        \  \n\
        \   "]
  cache_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the cache parameter group to apply to this cluster. This change is \
         asynchronously applied as soon as possible for parameters when the [ApplyImmediately] \
         parameter is specified as [true] for this request.\n"]
  notification_topic_status : string_ option;
      [@ocaml.doc
        "The status of the Amazon SNS notification topic. Notifications are sent only if the \
         status is [active].\n\n\
        \ Valid values: [active] | [inactive] \n\
        \ "]
  apply_immediately : boolean_ option;
      [@ocaml.doc
        "If [true], this parameter causes the modifications in this request and any pending \
         modifications to be applied, asynchronously and as soon as possible, regardless of the \
         [PreferredMaintenanceWindow] setting for the cluster.\n\n\
        \ If [false], changes to the cluster are applied on the next maintenance reboot, or the \
         next failure reboot, whichever occurs first.\n\
        \ \n\
        \   If you perform a [ModifyCacheCluster] before a pending modification is applied, the \
         pending modification is replaced by the newer modification. However, a pending node-count \
         increase on Memcached clusters cannot be superseded by a request to add fewer nodes. To \
         change a pending node addition, first cancel it by setting [NumCacheNodes] equal to the \
         current number of nodes in the cluster, then submit the new request. See the \
         [NumCacheNodes] parameter for details on node scaling behavior.\n\
        \   \n\
        \     Valid values: [true] | [false] \n\
        \     \n\
        \      Default: [false] \n\
        \      "]
  engine : string_ option;
      [@ocaml.doc
        "The engine type used by the cache cluster. The options are valkey, memcached or redis.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The upgraded version of the cache engine to be run on the cache nodes.\n\n\
        \  {b Important:} You can upgrade to a newer engine version (see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/SelectEngine.html#VersionManagement}Selecting \
         a Cache Engine and Version}), but you cannot downgrade to an earlier engine version. If \
         you want to use an earlier engine version, you must delete the existing cluster and \
         create it anew with the earlier engine version. \n\
        \ "]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "\194\160If you are running Valkey 7.2 or Redis OSS engine version 6.0 or later, set this \
         parameter to yes to opt-in to the next auto minor version upgrade campaign. This \
         parameter is disabled for previous versions.\194\160 \n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which ElastiCache retains automatic cluster snapshots before \
         deleting them. For example, if you set [SnapshotRetentionLimit] to 5, a snapshot that was \
         taken today is retained for 5 days before being deleted.\n\n\
        \  If the value of [SnapshotRetentionLimit] is set to zero (0), backups are turned off.\n\
        \  \n\
        \   "]
  snapshot_window : string_ option;
      [@ocaml.doc
        "The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of \
         your cluster. \n"]
  cache_node_type : string_ option;
      [@ocaml.doc "A valid cache node type that you want to scale this cluster up to.\n"]
  auth_token : string_ option;
      [@ocaml.doc
        "Reserved parameter. The password used to access a password protected server. This \
         parameter must be specified with the [auth-token-update] parameter. Password \
         constraints:\n\n\
        \ {ul\n\
        \       {-  Must be only printable ASCII characters\n\
        \           \n\
        \            }\n\
        \       {-  Must be at least 16 characters and no more than 128 characters in length\n\
        \           \n\
        \            }\n\
        \       {-  Cannot contain any of the following characters: '/', '\"', or '\\@', '%'\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    For more information, see AUTH password at {{:http://redis.io/commands/AUTH}AUTH}.\n\
        \   "]
  auth_token_update_strategy : auth_token_update_strategy_type option;
      [@ocaml.doc
        "Specifies the strategy to use to update the AUTH token. This parameter must be specified \
         with the [auth-token] parameter. Possible values:\n\n\
        \ {ul\n\
        \       {-  ROTATE - default, if no update strategy is provided\n\
        \           \n\
        \            }\n\
        \       {-  SET - allowed only after ROTATE\n\
        \           \n\
        \            }\n\
        \       {-  DELETE - allowed only when transitioning to RBAC\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    For more information, see \
         {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/auth.html}Authenticating Users \
         with AUTH} \n\
        \   "]
  log_delivery_configurations : log_delivery_configuration_request_list option;
      [@ocaml.doc "Specifies the destination, format and type of the logs.\n"]
  ip_discovery : ip_discovery option;
      [@ocaml.doc
        "The network type you choose when modifying a cluster, either [ipv4] | [ipv6]. IPv6 is \
         supported for workloads using Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 \
         or Memcached engine version 1.6.6 and above on all instances built on the \
         {{:http://aws.amazon.com/ec2/nitro/}Nitro system}.\n"]
  scale_config : scale_config option;
      [@ocaml.doc
        "Configures horizontal or vertical scaling for Memcached clusters, specifying the scaling \
         percentage and interval.\n"]
}
[@@ocaml.doc "Represents the input of a [ModifyCacheCluster] operation.\n"]

type nonrec list_tags_for_resource_message = {
  resource_name : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource for which you want the list of tags, for \
         example [arn:aws:elasticache:us-west-2:0123456789:cluster:myCluster] or \
         [arn:aws:elasticache:us-west-2:0123456789:snapshot:mySnapshot].\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n\
        \ "]
}
[@@ocaml.doc "The input parameters for the [ListTagsForResource] operation.\n"]

type nonrec list_allowed_node_type_modifications_message = {
  cache_cluster_id : string_ option;
      [@ocaml.doc
        "The name of the cluster you want to scale up to a larger node instanced type. ElastiCache \
         uses the cluster id to identify the current node type of this cluster and from that to \
         create a list of node types you can scale up to.\n\n\
        \  You must provide a value for either the [CacheClusterId] or the [ReplicationGroupId].\n\
        \  \n\
        \   "]
  replication_group_id : string_ option;
      [@ocaml.doc
        "The name of the replication group want to scale up to a larger node type. ElastiCache \
         uses the replication group id to identify the current node type being used by this \
         replication group, and from that to create a list of node types you can scale up to.\n\n\
        \  You must provide a value for either the [CacheClusterId] or the [ReplicationGroupId].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "The input parameters for the [ListAllowedNodeTypeModifications] operation.\n"]

type nonrec no_operation_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The operation was not performed because no changes were required.\n"]

type nonrec cluster_quota_for_customer_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the allowed number of clusters per \
   customer.\n"]

type nonrec increase_replica_count_result = {
  replication_group : replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec preferred_outpost_arn_list = string_ list [@@ocaml.doc ""]

type nonrec configure_shard = {
  node_group_id : allowed_node_group_id;
      [@ocaml.doc
        "The 4-digit id for the node group you are configuring. For Valkey or Redis OSS (cluster \
         mode disabled) replication groups, the node group id is always 0001. To find a Valkey or \
         Redis OSS (cluster mode enabled)'s node group's (shard's) id, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/shard-find-id.html}Finding a \
         Shard's Id}.\n"]
  new_replica_count : integer;
      [@ocaml.doc
        "The number of replicas you want in this node group at the end of this operation. The \
         maximum value for [NewReplicaCount] is 5. The minimum value depends upon the type of \
         Valkey or Redis OSS replication group you are working with.\n\n\
        \ The minimum number of replicas in a shard or replication group is:\n\
        \ \n\
        \  {ul\n\
        \        {-  Valkey or Redis OSS (cluster mode disabled)\n\
        \            \n\
        \             {ul\n\
        \                   {-  If Multi-AZ: 1\n\
        \                       \n\
        \                        }\n\
        \                   {-  If Multi-AZ: 0\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Valkey or Redis OSS (cluster mode enabled): 0 (though you will not be able to \
         failover to a replica if your primary node fails)\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  preferred_availability_zones : preferred_availability_zone_list option;
      [@ocaml.doc
        "A list of [PreferredAvailabilityZone] strings that specify which availability zones the \
         replication group's nodes are to be in. The nummber of [PreferredAvailabilityZone] values \
         must equal the value of [NewReplicaCount] plus 1 to account for the primary node. If this \
         member of [ReplicaConfiguration] is omitted, ElastiCache selects the availability zone \
         for each of the replicas.\n"]
  preferred_outpost_arns : preferred_outpost_arn_list option;
      [@ocaml.doc "The outpost ARNs in which the cache cluster is created.\n"]
}
[@@ocaml.doc
  "Node group (shard) configuration options when adding or removing replicas. Each node group \
   (shard) configuration has the following members: NodeGroupId, NewReplicaCount, and \
   PreferredAvailabilityZones. \n"]

type nonrec replica_configuration_list = configure_shard list [@@ocaml.doc ""]

type nonrec increase_replica_count_message = {
  replication_group_id : string_;
      [@ocaml.doc "The id of the replication group to which you want to add replica nodes.\n"]
  new_replica_count : integer_optional option;
      [@ocaml.doc
        "The number of read replica nodes you want at the completion of this operation. For Valkey \
         or Redis OSS (cluster mode disabled) replication groups, this is the number of replica \
         nodes in the replication group. For Valkey or Redis OSS (cluster mode enabled) \
         replication groups, this is the number of replica nodes in each of the replication \
         group's node groups.\n"]
  replica_configuration : replica_configuration_list option;
      [@ocaml.doc
        "A list of [ConfigureShard] objects that can be used to configure each shard in a Valkey \
         or Redis OSS (cluster mode enabled) replication group. The [ConfigureShard] has three \
         members: [NewReplicaCount], [NodeGroupId], and [PreferredAvailabilityZones].\n"]
  apply_immediately : boolean_;
      [@ocaml.doc
        "If [True], the number of replica nodes is increased immediately. [ApplyImmediately=False] \
         is not currently supported.\n"]
}
[@@ocaml.doc ""]

type nonrec increase_node_groups_in_global_replication_group_result = {
  global_replication_group : global_replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec regional_configuration = {
  replication_group_id : string_; [@ocaml.doc "The name of the secondary cluster\n"]
  replication_group_region : string_; [@ocaml.doc "The Amazon region where the cluster is stored\n"]
  resharding_configuration : resharding_configuration_list;
      [@ocaml.doc
        "A list of [PreferredAvailabilityZones] objects that specifies the configuration of a node \
         group in the resharded cluster. \n"]
}
[@@ocaml.doc "A list of the replication groups \n"]

type nonrec regional_configuration_list = regional_configuration list [@@ocaml.doc ""]

type nonrec increase_node_groups_in_global_replication_group_message = {
  global_replication_group_id : string_; [@ocaml.doc "The name of the Global datastore\n"]
  node_group_count : integer; [@ocaml.doc "Total number of node groups you want\n"]
  regional_configurations : regional_configuration_list option;
      [@ocaml.doc
        "Describes the replication group IDs, the Amazon regions where they are stored and the \
         shard configuration for each that comprise the Global datastore\n"]
  apply_immediately : boolean_;
      [@ocaml.doc
        "Indicates that the process begins immediately. At present, the only permitted value for \
         this parameter is true.\n"]
}
[@@ocaml.doc ""]

type nonrec failover_global_replication_group_result = {
  global_replication_group : global_replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec failover_global_replication_group_message = {
  global_replication_group_id : string_; [@ocaml.doc "The name of the Global datastore\n"]
  primary_region : string_;
      [@ocaml.doc "The Amazon region of the primary cluster of the Global datastore\n"]
  primary_replication_group_id : string_; [@ocaml.doc "The name of the primary replication group\n"]
}
[@@ocaml.doc ""]

type nonrec serverless_cache_configuration = {
  serverless_cache_name : string_ option; [@ocaml.doc "The identifier of a serverless cache.\n"]
  engine : string_ option; [@ocaml.doc "The engine that the serverless cache is configured with.\n"]
  major_engine_version : string_ option;
      [@ocaml.doc "The engine version number that the serverless cache is configured with.\n"]
}
[@@ocaml.doc "The configuration settings for a specific serverless cache.\n"]

type nonrec serverless_cache_snapshot = {
  serverless_cache_snapshot_name : string_ option;
      [@ocaml.doc
        "The identifier of a serverless cache snapshot. Available for Valkey, Redis OSS and \
         Serverless Memcached only.\n"]
  ar_n : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a serverless cache snapshot. Available for Valkey, \
         Redis OSS and Serverless Memcached only.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The ID of the Amazon Web Services Key Management Service (KMS) key of a serverless cache \
         snapshot. Available for Valkey, Redis OSS and Serverless Memcached only.\n"]
  snapshot_type : string_ option;
      [@ocaml.doc
        "The type of snapshot of serverless cache. Available for Valkey, Redis OSS and Serverless \
         Memcached only.\n"]
  status : string_ option;
      [@ocaml.doc
        "The current status of the serverless cache. Available for Valkey, Redis OSS and \
         Serverless Memcached only.\n"]
  create_time : t_stamp option;
      [@ocaml.doc
        "The date and time that the source serverless cache's metadata and cache data set was \
         obtained for the snapshot. Available for Valkey, Redis OSS and Serverless Memcached only.\n"]
  expiry_time : t_stamp option;
      [@ocaml.doc
        "The time that the serverless cache snapshot will expire. Available for Valkey, Redis OSS \
         and Serverless Memcached only.\n"]
  bytes_used_for_cache : string_ option;
      [@ocaml.doc
        "The total size of a serverless cache snapshot, in bytes. Available for Valkey, Redis OSS \
         and Serverless Memcached only.\n"]
  serverless_cache_configuration : serverless_cache_configuration option;
      [@ocaml.doc
        "The configuration of the serverless cache, at the time the snapshot was taken. Available \
         for Valkey, Redis OSS and Serverless Memcached only.\n"]
}
[@@ocaml.doc
  "The resource representing a serverless cache snapshot. Available for Valkey, Redis OSS and \
   Serverless Memcached only.\n"]

type nonrec export_serverless_cache_snapshot_response = {
  serverless_cache_snapshot : serverless_cache_snapshot option;
      [@ocaml.doc
        "The state of a serverless cache at a specific point in time, to the millisecond. \
         Available for Valkey, Redis OSS and Serverless Memcached only.\n"]
}
[@@ocaml.doc ""]

type nonrec export_serverless_cache_snapshot_request = {
  serverless_cache_snapshot_name : string_;
      [@ocaml.doc
        "The identifier of the serverless cache snapshot to be exported to S3. Available for \
         Valkey and Redis OSS only.\n"]
  s3_bucket_name : string_;
      [@ocaml.doc
        "Name of the Amazon S3 bucket to export the snapshot to. The Amazon S3 bucket must also be \
         in same region as the snapshot. Available for Valkey and Redis OSS only.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_global_replication_group_result = {
  global_replication_group : global_replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec disassociate_global_replication_group_message = {
  global_replication_group_id : string_; [@ocaml.doc "The name of the Global datastore\n"]
  replication_group_id : string_;
      [@ocaml.doc
        "The name of the secondary cluster you wish to remove from the Global datastore\n"]
  replication_group_region : string_;
      [@ocaml.doc
        "The Amazon region of secondary cluster you wish to remove from the Global datastore\n"]
}
[@@ocaml.doc ""]

type nonrec user_list = user list [@@ocaml.doc ""]

type nonrec describe_users_result = {
  users : user_list option; [@ocaml.doc "A list of users.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by MaxRecords. >\n"]
}
[@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_value_list = filter_value list [@@ocaml.doc ""]

type nonrec filter_name = string [@@ocaml.doc ""]

type nonrec filter = {
  name : filter_name; [@ocaml.doc "The property being filtered. For example, UserId.\n"]
  values : filter_value_list;
      [@ocaml.doc "The property values to filter on. For example, \"user-123\".\n"]
}
[@@ocaml.doc "Used to streamline results of a search based on the property being filtered.\n"]

type nonrec filter_list = filter list [@@ocaml.doc ""]

type nonrec describe_users_message = {
  engine : engine_type option; [@ocaml.doc "The engine. \n"]
  user_id : user_id option; [@ocaml.doc "The ID of the user.\n"]
  filters : filter_list option; [@ocaml.doc "Filter to determine the list of User IDs to return.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxRecords value, a marker is included in the response so that the remaining \
         results can be retrieved. \n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by MaxRecords. >\n"]
}
[@@ocaml.doc ""]

type nonrec user_group_list = user_group list [@@ocaml.doc ""]

type nonrec describe_user_groups_result = {
  user_groups : user_group_list option; [@ocaml.doc "Returns a list of user groups.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by MaxRecords.>\n"]
}
[@@ocaml.doc ""]

type nonrec describe_user_groups_message = {
  user_group_id : string_ option; [@ocaml.doc "The ID of the user group.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxRecords value, a marker is included in the response so that the remaining \
         results can be retrieved. \n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by MaxRecords. >\n"]
}
[@@ocaml.doc ""]

type nonrec node_update_initiated_by = SYSTEM [@ocaml.doc ""] | CUSTOMER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec node_update_status =
  | NOT_APPLIED [@ocaml.doc ""]
  | WAITING_TO_START [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cache_node_update_status = {
  cache_node_id : string_ option; [@ocaml.doc "The node ID of the cache cluster\n"]
  node_update_status : node_update_status option; [@ocaml.doc "The update status of the node\n"]
  node_deletion_date : t_stamp option; [@ocaml.doc "The deletion date of the node\n"]
  node_update_start_date : t_stamp option; [@ocaml.doc "The start date of the update for a node\n"]
  node_update_end_date : t_stamp option; [@ocaml.doc "The end date of the update for a node\n"]
  node_update_initiated_by : node_update_initiated_by option;
      [@ocaml.doc
        "Reflects whether the update was initiated by the customer or automatically applied\n"]
  node_update_initiated_date : t_stamp option;
      [@ocaml.doc "The date when the update is triggered\n"]
  node_update_status_modified_date : t_stamp option;
      [@ocaml.doc "The date when the NodeUpdateStatus was last modified>\n"]
}
[@@ocaml.doc "The status of the service update on the cache node\n"]

type nonrec cache_node_update_status_list = cache_node_update_status list [@@ocaml.doc ""]

type nonrec node_group_member_update_status = {
  cache_cluster_id : string_ option; [@ocaml.doc "The cache cluster ID\n"]
  cache_node_id : string_ option; [@ocaml.doc "The node ID of the cache cluster\n"]
  node_update_status : node_update_status option; [@ocaml.doc "The update status of the node\n"]
  node_deletion_date : t_stamp option; [@ocaml.doc "The deletion date of the node\n"]
  node_update_start_date : t_stamp option; [@ocaml.doc "The start date of the update for a node\n"]
  node_update_end_date : t_stamp option; [@ocaml.doc "The end date of the update for a node\n"]
  node_update_initiated_by : node_update_initiated_by option;
      [@ocaml.doc
        "Reflects whether the update was initiated by the customer or automatically applied\n"]
  node_update_initiated_date : t_stamp option;
      [@ocaml.doc "The date when the update is triggered\n"]
  node_update_status_modified_date : t_stamp option;
      [@ocaml.doc "The date when the NodeUpdateStatus was last modified\n"]
}
[@@ocaml.doc "The status of the service update on the node group member \n"]

type nonrec node_group_member_update_status_list = node_group_member_update_status list
[@@ocaml.doc ""]

type nonrec node_group_update_status = {
  node_group_id : string_ option; [@ocaml.doc "The ID of the node group\n"]
  node_group_member_update_status : node_group_member_update_status_list option;
      [@ocaml.doc "The status of the service update on the node group member\n"]
}
[@@ocaml.doc "The status of the service update on the node group \n"]

type nonrec node_group_update_status_list = node_group_update_status list [@@ocaml.doc ""]

type nonrec sla_met = YES [@ocaml.doc ""] | NO [@ocaml.doc ""] | NA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_action_status =
  | NOT_APPLIED [@ocaml.doc ""]
  | WAITING_TO_START [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | SCHEDULING [@ocaml.doc ""]
  | SCHEDULED [@ocaml.doc ""]
  | NOT_APPLICABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_update_type = SECURITY_UPDATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec service_update_status =
  | AVAILABLE [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_update_severity =
  | CRITICAL [@ocaml.doc ""]
  | IMPORTANT [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_action = {
  replication_group_id : string_ option; [@ocaml.doc "The ID of the replication group\n"]
  cache_cluster_id : string_ option; [@ocaml.doc "The ID of the cache cluster\n"]
  service_update_name : string_ option; [@ocaml.doc "The unique ID of the service update\n"]
  service_update_release_date : t_stamp option;
      [@ocaml.doc "The date the update is first available\n"]
  service_update_severity : service_update_severity option;
      [@ocaml.doc "The severity of the service update\n"]
  service_update_status : service_update_status option;
      [@ocaml.doc "The status of the service update\n"]
  service_update_recommended_apply_by_date : t_stamp option;
      [@ocaml.doc
        "The recommended date to apply the service update to ensure compliance. For information on \
         compliance, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/elasticache-compliance.html#elasticache-compliance-self-service}Self-Service \
         Security Updates for Compliance}.\n"]
  service_update_type : service_update_type option;
      [@ocaml.doc "Reflects the nature of the service update \n"]
  update_action_available_date : t_stamp option;
      [@ocaml.doc "The date that the service update is available to a replication group\n"]
  update_action_status : update_action_status option;
      [@ocaml.doc "The status of the update action\n"]
  nodes_updated : string_ option;
      [@ocaml.doc "The progress of the service update on the replication group\n"]
  update_action_status_modified_date : t_stamp option;
      [@ocaml.doc "The date when the UpdateActionStatus was last modified\n"]
  sla_met : sla_met option;
      [@ocaml.doc
        "If yes, all nodes in the replication group have been updated by the recommended apply-by \
         date. If no, at least one node in the replication group have not been updated by the \
         recommended apply-by date. If N/A, the replication group was created after the \
         recommended apply-by date.\n"]
  node_group_update_status : node_group_update_status_list option;
      [@ocaml.doc "The status of the service update on the node group\n"]
  cache_node_update_status : cache_node_update_status_list option;
      [@ocaml.doc "The status of the service update on the cache node\n"]
  estimated_update_time : string_ option;
      [@ocaml.doc "The estimated length of time for the update to complete\n"]
  engine : string_ option;
      [@ocaml.doc
        "The Elasticache engine to which the update applies. Either Valkey, Redis OSS or Memcached.\n"]
}
[@@ocaml.doc "The status of the service update for a specific replication group\n"]

type nonrec update_action_list = update_action list [@@ocaml.doc ""]

type nonrec update_actions_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
  update_actions : update_action_list option; [@ocaml.doc "Returns a list of update actions\n"]
}
[@@ocaml.doc ""]

type nonrec update_action_status_list = update_action_status list [@@ocaml.doc ""]

type nonrec time_range_filter = {
  start_time : t_stamp option; [@ocaml.doc "The start time of the time range filter\n"]
  end_time : t_stamp option; [@ocaml.doc "The end time of the time range filter\n"]
}
[@@ocaml.doc
  "Filters update actions from the service updates that are in available status during the time \
   range.\n"]

type nonrec service_update_status_list = service_update_status list [@@ocaml.doc ""]

type nonrec cache_cluster_id_list = string_ list [@@ocaml.doc ""]

type nonrec replication_group_id_list = string_ list [@@ocaml.doc ""]

type nonrec describe_update_actions_message = {
  service_update_name : string_ option; [@ocaml.doc "The unique ID of the service update\n"]
  replication_group_ids : replication_group_id_list option;
      [@ocaml.doc "The replication group IDs\n"]
  cache_cluster_ids : cache_cluster_id_list option; [@ocaml.doc "The cache cluster IDs\n"]
  engine : string_ option;
      [@ocaml.doc
        "The Elasticache engine to which the update applies. Either Valkey, Redis OSS or Memcached.\n"]
  service_update_status : service_update_status_list option;
      [@ocaml.doc "The status of the service update\n"]
  service_update_time_range : time_range_filter option;
      [@ocaml.doc
        "The range of time specified to search for service updates that are in available status\n"]
  update_action_status : update_action_status_list option;
      [@ocaml.doc "The status of the update action.\n"]
  show_node_level_update_status : boolean_optional option;
      [@ocaml.doc "Dictates whether to include node level update status in the response \n"]
  max_records : integer_optional option;
      [@ocaml.doc "The maximum number of records to include in the response\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec outpost_arns_list = string_ list [@@ocaml.doc ""]

type nonrec node_group_configuration = {
  node_group_id : allowed_node_group_id option;
      [@ocaml.doc
        "Either the ElastiCache supplied 4-digit id or a user supplied id for the node group these \
         configuration values apply to.\n"]
  slots : string_ option;
      [@ocaml.doc
        "A string that specifies the keyspace for a particular node group. Keyspaces range from 0 \
         to 16,383. The string is in the format [startkey-endkey].\n\n\
        \ Example: [\"0-3999\"] \n\
        \ "]
  replica_count : integer_optional option;
      [@ocaml.doc "The number of read replica nodes in this node group (shard).\n"]
  primary_availability_zone : string_ option;
      [@ocaml.doc
        "The Availability Zone where the primary node of this node group (shard) is launched.\n"]
  replica_availability_zones : availability_zones_list option;
      [@ocaml.doc
        "A list of Availability Zones to be used for the read replicas. The number of Availability \
         Zones in this list must match the value of [ReplicaCount] or [ReplicasPerNodeGroup] if \
         not specified.\n"]
  primary_outpost_arn : string_ option; [@ocaml.doc "The outpost ARN of the primary node.\n"]
  replica_outpost_arns : outpost_arns_list option;
      [@ocaml.doc "The outpost ARN of the node replicas.\n"]
}
[@@ocaml.doc
  "Node group (shard) configuration options. Each node group (shard) configuration has the \
   following: [Slots], [PrimaryAvailabilityZone], [ReplicaAvailabilityZones], [ReplicaCount].\n"]

type nonrec node_snapshot = {
  cache_cluster_id : string_ option; [@ocaml.doc "A unique identifier for the source cluster.\n"]
  node_group_id : string_ option;
      [@ocaml.doc "A unique identifier for the source node group (shard).\n"]
  cache_node_id : string_ option;
      [@ocaml.doc "The cache node identifier for the node in the source cluster.\n"]
  node_group_configuration : node_group_configuration option;
      [@ocaml.doc "The configuration for the source node group (shard).\n"]
  cache_size : string_ option; [@ocaml.doc "The size of the cache on the source cache node.\n"]
  cache_node_create_time : t_stamp option;
      [@ocaml.doc "The date and time when the cache node was created in the source cluster.\n"]
  snapshot_create_time : t_stamp option;
      [@ocaml.doc
        "The date and time when the source node's metadata and cache data set was obtained for the \
         snapshot.\n"]
}
[@@ocaml.doc "Represents an individual cache node in a snapshot of a cluster.\n"]

type nonrec node_snapshot_list = node_snapshot list [@@ocaml.doc ""]

type nonrec snapshot = {
  snapshot_name : string_ option;
      [@ocaml.doc
        "The name of a snapshot. For an automatic snapshot, the name is system-generated. For a \
         manual snapshot, this is the user-provided name.\n"]
  replication_group_id : string_ option;
      [@ocaml.doc "The unique identifier of the source replication group.\n"]
  replication_group_description : string_ option;
      [@ocaml.doc "A description of the source replication group.\n"]
  cache_cluster_id : string_ option;
      [@ocaml.doc "The user-supplied identifier of the source cluster.\n"]
  snapshot_status : string_ option;
      [@ocaml.doc
        "The status of the snapshot. Valid values: [creating] | [available] | [restoring] | \
         [copying] | [deleting].\n"]
  snapshot_source : string_ option;
      [@ocaml.doc
        "Indicates whether the snapshot is from an automatic backup ([automated]) or was created \
         manually ([manual]).\n"]
  cache_node_type : string_ option;
      [@ocaml.doc
        "The name of the compute and memory capacity node type for the source cluster.\n\n\
        \ The following node types are supported by ElastiCache. Generally speaking, the current \
         generation types provide more memory and computational power at lower cost when compared \
         to their equivalent previous generation counterparts.\n\
        \ \n\
        \  {ul\n\
        \        {-  General purpose:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b M7g node types}: [cache.m7g.large], [cache.m7g.xlarge], \
         [cache.m7g.2xlarge], [cache.m7g.4xlarge], [cache.m7g.8xlarge], [cache.m7g.12xlarge], \
         [cache.m7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b M6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.m6g.large], \
         [cache.m6g.xlarge], [cache.m6g.2xlarge], [cache.m6g.4xlarge], [cache.m6g.8xlarge], \
         [cache.m6g.12xlarge], [cache.m6g.16xlarge] \n\
        \                            \n\
        \                              {b M5 node types:} [cache.m5.large], [cache.m5.xlarge], \
         [cache.m5.2xlarge], [cache.m5.4xlarge], [cache.m5.12xlarge], [cache.m5.24xlarge] \n\
        \                             \n\
        \                               {b M4 node types:} [cache.m4.large], [cache.m4.xlarge], \
         [cache.m4.2xlarge], [cache.m4.4xlarge], [cache.m4.10xlarge] \n\
        \                              \n\
        \                                {b T4g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and Memcached engine version 1.5.16 onward): [cache.t4g.micro], \
         [cache.t4g.small], [cache.t4g.medium] \n\
        \                               \n\
        \                                 {b T3 node types:} [cache.t3.micro], [cache.t3.small], \
         [cache.t3.medium] \n\
        \                                \n\
        \                                  {b T2 node types:} [cache.t2.micro], [cache.t2.small], \
         [cache.t2.medium] \n\
        \                                 \n\
        \                                  }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b T1 node types:} [cache.t1.micro] \n\
        \                        \n\
        \                          {b M1 node types:} [cache.m1.small], [cache.m1.medium], \
         [cache.m1.large], [cache.m1.xlarge] \n\
        \                         \n\
        \                           {b M3 node types:} [cache.m3.medium], [cache.m3.large], \
         [cache.m3.xlarge], [cache.m3.2xlarge] \n\
        \                          \n\
        \                           }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Compute optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b C1 node types:} [cache.c1.xlarge] \n\
        \                        \n\
        \                         }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Memory optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b R7g node types}: [cache.r7g.large], [cache.r7g.xlarge], \
         [cache.r7g.2xlarge], [cache.r7g.4xlarge], [cache.r7g.8xlarge], [cache.r7g.12xlarge], \
         [cache.r7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b R6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.r6g.large], \
         [cache.r6g.xlarge], [cache.r6g.2xlarge], [cache.r6g.4xlarge], [cache.r6g.8xlarge], \
         [cache.r6g.12xlarge], [cache.r6g.16xlarge] \n\
        \                            \n\
        \                              {b R5 node types:} [cache.r5.large], [cache.r5.xlarge], \
         [cache.r5.2xlarge], [cache.r5.4xlarge], [cache.r5.12xlarge], [cache.r5.24xlarge] \n\
        \                             \n\
        \                               {b R4 node types:} [cache.r4.large], [cache.r4.xlarge], \
         [cache.r4.2xlarge], [cache.r4.4xlarge], [cache.r4.8xlarge], [cache.r4.16xlarge] \n\
        \                              \n\
        \                               }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b M2 node types:} [cache.m2.xlarge], [cache.m2.2xlarge], \
         [cache.m2.4xlarge] \n\
        \                        \n\
        \                          {b R3 node types:} [cache.r3.large], [cache.r3.xlarge], \
         [cache.r3.2xlarge], [cache.r3.4xlarge], [cache.r3.8xlarge] \n\
        \                         \n\
        \                          }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \    {b Additional node type info} \n\
        \   \n\
        \    {ul\n\
        \          {-  All current generation instance types are created in Amazon VPC by default.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS append-only files (AOF) are not supported for T1 or T2 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS Multi-AZ with automatic failover is not supported on T1 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  The configuration variables [appendonly] and [appendfsync] are not \
         supported on Valkey, or on Redis OSS version 2.8.22 and later.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  engine : string_ option;
      [@ocaml.doc
        "The name of the cache engine ([memcached] or [redis]) used by the source cluster.\n"]
  engine_version : string_ option;
      [@ocaml.doc "The version of the cache engine version that is used by the source cluster.\n"]
  num_cache_nodes : integer_optional option;
      [@ocaml.doc
        "The number of cache nodes in the source cluster.\n\n\
        \ For clusters running Valkey or Redis OSS, this value must be 1. For clusters running \
         Memcached, this value must be between 1 and 40.\n\
        \ "]
  preferred_availability_zone : string_ option;
      [@ocaml.doc "The name of the Availability Zone in which the source cluster is located.\n"]
  preferred_outpost_arn : string_ option;
      [@ocaml.doc "The ARN (Amazon Resource Name) of the preferred outpost.\n"]
  cache_cluster_create_time : t_stamp option;
      [@ocaml.doc "The date and time when the source cluster was created.\n"]
  preferred_maintenance_window : string_ option;
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
  topic_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the topic used by the source cluster for publishing \
         notifications.\n"]
  port : integer_optional option;
      [@ocaml.doc "The port number used by each cache nodes in the source cluster.\n"]
  cache_parameter_group_name : string_ option;
      [@ocaml.doc "The cache parameter group that is associated with the source cluster.\n"]
  cache_subnet_group_name : string_ option;
      [@ocaml.doc "The name of the cache subnet group associated with the source cluster.\n"]
  vpc_id : string_ option;
      [@ocaml.doc
        "The Amazon Virtual Private Cloud identifier (VPC ID) of the cache subnet group for the \
         source cluster.\n"]
  auto_minor_version_upgrade : boolean_ option;
      [@ocaml.doc
        "\194\160If you are running Valkey 7.2 and above or Redis OSS engine version 6.0 and \
         above, set this parameter to yes if you want to opt-in to the next auto minor version \
         upgrade campaign. This parameter is disabled for previous versions.\194\160 \n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "For an automatic snapshot, the number of days for which ElastiCache retains the snapshot \
         before deleting it.\n\n\
        \ For manual snapshots, this field reflects the [SnapshotRetentionLimit] for the source \
         cluster when the snapshot was created. This field is otherwise ignored: Manual snapshots \
         do not expire, and can only be deleted using the [DeleteSnapshot] operation. \n\
        \ \n\
        \   {b Important} If the value of SnapshotRetentionLimit is set to zero (0), backups are \
         turned off.\n\
        \  "]
  snapshot_window : string_ option;
      [@ocaml.doc
        "The daily time range during which ElastiCache takes daily snapshots of the source cluster.\n"]
  num_node_groups : integer_optional option;
      [@ocaml.doc
        "The number of node groups (shards) in this snapshot. When restoring from a snapshot, the \
         number of node groups (shards) in the snapshot and in the restored replication group must \
         be the same.\n"]
  automatic_failover : automatic_failover_status option;
      [@ocaml.doc
        "Indicates the status of automatic failover for the source Valkey or Redis OSS replication \
         group.\n"]
  node_snapshots : node_snapshot_list option;
      [@ocaml.doc "A list of the cache nodes in the source cluster.\n"]
  kms_key_id : string_ option; [@ocaml.doc "The ID of the KMS key used to encrypt the snapshot.\n"]
  ar_n : string_ option; [@ocaml.doc "The ARN (Amazon Resource Name) of the snapshot.\n"]
  data_tiering : data_tiering_status option;
      [@ocaml.doc
        "Enables data tiering. Data tiering is only supported for replication groups using the \
         r6gd node type. This parameter must be set to true when using r6gd nodes. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/data-tiering.html}Data \
         tiering}.\n"]
  durability : durability option;
      [@ocaml.doc
        "The durability setting of the cluster when the snapshot was taken. When restoring from \
         this snapshot, the cluster uses this durability setting unless overridden in the restore \
         request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/durability.html}Durability}.\n"]
}
[@@ocaml.doc
  "Represents a copy of an entire Valkey or Redis OSS cluster as of the time when the snapshot was \
   taken.\n"]

type nonrec snapshot_list = snapshot list [@@ocaml.doc ""]

type nonrec describe_snapshots_list_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
  snapshots : snapshot_list option;
      [@ocaml.doc
        "A list of snapshots. Each item in the list contains detailed information about one \
         snapshot.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeSnapshots] operation.\n"]

type nonrec describe_snapshots_message = {
  replication_group_id : string_ option;
      [@ocaml.doc
        "A user-supplied replication group identifier. If this parameter is specified, only \
         snapshots associated with that specific replication group are described.\n"]
  cache_cluster_id : string_ option;
      [@ocaml.doc
        "A user-supplied cluster identifier. If this parameter is specified, only snapshots \
         associated with that specific cluster are described.\n"]
  snapshot_name : string_ option;
      [@ocaml.doc
        "A user-supplied name of the snapshot. If this parameter is specified, only this snapshot \
         are described.\n"]
  snapshot_source : string_ option;
      [@ocaml.doc
        "If set to [system], the output shows snapshots that were automatically created by \
         ElastiCache. If set to [user] the output shows snapshots that were manually created. If \
         omitted, the output shows both automatically and manually created snapshots.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 50\n\
        \ \n\
        \  Constraints: minimum 20; maximum 50.\n\
        \  "]
  show_node_group_config : boolean_optional option;
      [@ocaml.doc
        "A Boolean value which if true, the node group (shard) configuration is included in the \
         snapshot description.\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeSnapshotsMessage] operation.\n"]

type nonrec service_update_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The service update doesn't exist\n"]

type nonrec service_update = {
  service_update_name : string_ option; [@ocaml.doc "The unique ID of the service update\n"]
  service_update_release_date : t_stamp option;
      [@ocaml.doc "The date when the service update is initially available\n"]
  service_update_end_date : t_stamp option;
      [@ocaml.doc "The date after which the service update is no longer available\n"]
  service_update_severity : service_update_severity option;
      [@ocaml.doc "The severity of the service update\n"]
  service_update_recommended_apply_by_date : t_stamp option;
      [@ocaml.doc
        "The recommendend date to apply the service update in order to ensure compliance. For \
         information on compliance, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/elasticache-compliance.html#elasticache-compliance-self-service}Self-Service \
         Security Updates for Compliance}.\n"]
  service_update_status : service_update_status option;
      [@ocaml.doc "The status of the service update\n"]
  service_update_description : string_ option;
      [@ocaml.doc "Provides details of the service update\n"]
  service_update_type : service_update_type option;
      [@ocaml.doc "Reflects the nature of the service update\n"]
  engine : string_ option;
      [@ocaml.doc
        "The Elasticache engine to which the update applies. Either Valkey, Redis OSS or Memcached.\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The Elasticache engine version to which the update applies. Either Valkey, Redis OSS or \
         Memcached engine version.\n"]
  auto_update_after_recommended_apply_by_date : boolean_optional option;
      [@ocaml.doc
        "Indicates whether the service update will be automatically applied once the recommended \
         apply-by date has expired. \n"]
  estimated_update_time : string_ option;
      [@ocaml.doc "The estimated length of time the service update will take\n"]
}
[@@ocaml.doc "An update that you can apply to your Valkey or Redis OSS clusters.\n"]

type nonrec service_update_list = service_update list [@@ocaml.doc ""]

type nonrec service_updates_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
  service_updates : service_update_list option; [@ocaml.doc "A list of service updates\n"]
}
[@@ocaml.doc ""]

type nonrec describe_service_updates_message = {
  service_update_name : string_ option; [@ocaml.doc "The unique ID of the service update\n"]
  service_update_status : service_update_status_list option;
      [@ocaml.doc "The status of the service update\n"]
  max_records : integer_optional option;
      [@ocaml.doc "The maximum number of records to include in the response\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc ""]

type nonrec serverless_cache_snapshot_list = serverless_cache_snapshot list [@@ocaml.doc ""]

type nonrec describe_serverless_cache_snapshots_response = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request to support pagination of results from \
         this operation. If this parameter is specified, the response includes only records beyond \
         the marker, up to the value specified by max-results. Available for Valkey, Redis OSS and \
         Serverless Memcached only.\n"]
  serverless_cache_snapshots : serverless_cache_snapshot_list option;
      [@ocaml.doc
        "The serverless caches snapshots associated with a given description request. Available \
         for Valkey, Redis OSS and Serverless Memcached only.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_serverless_cache_snapshots_request = {
  serverless_cache_name : string_ option;
      [@ocaml.doc
        "The identifier of serverless cache. If this parameter is specified, only snapshots \
         associated with that specific serverless cache are described. Available for Valkey, Redis \
         OSS and Serverless Memcached only.\n"]
  serverless_cache_snapshot_name : string_ option;
      [@ocaml.doc
        "The identifier of the serverless cache\226\128\153s snapshot. If this parameter is \
         specified, only this snapshot is described. Available for Valkey, Redis OSS and \
         Serverless Memcached only.\n"]
  snapshot_type : string_ option;
      [@ocaml.doc
        "The type of snapshot that is being described. Available for Valkey, Redis OSS and \
         Serverless Memcached only.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request to support pagination of results from \
         this operation. If this parameter is specified, the response includes only records beyond \
         the marker, up to the value specified by max-results. Available for Valkey, Redis OSS and \
         Serverless Memcached only.\n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified max-results value, a market is included in the response so that remaining \
         results can be retrieved. Available for Valkey, Redis OSS and Serverless Memcached \
         only.The default is 50. The Validation Constraints are a maximum of 50.\n"]
}
[@@ocaml.doc ""]

type nonrec serverless_cache_list = serverless_cache list [@@ocaml.doc ""]

type nonrec describe_serverless_caches_response = {
  next_token : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request to support pagination of results from \
         this operation. If this parameter is specified, the response includes only records beyond \
         the marker, up to the value specified by MaxResults.\n"]
  serverless_caches : serverless_cache_list option;
      [@ocaml.doc "The serverless caches associated with a given description request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_serverless_caches_request = {
  serverless_cache_name : string_ option;
      [@ocaml.doc
        "The identifier for the serverless cache. If this parameter is specified, only information \
         about that specific serverless cache is returned. Default: NULL\n"]
  max_results : integer_optional option;
      [@ocaml.doc
        "The maximum number of records in the response. If more records exist than the specified \
         max-records value, the next token is included in the response so that remaining results \
         can be retrieved. The default is 50.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request to support pagination of results from \
         this operation. If this parameter is specified, the response includes only records beyond \
         the marker, up to the value specified by MaxResults.\n"]
}
[@@ocaml.doc ""]

type nonrec reserved_cache_nodes_offering = {
  reserved_cache_nodes_offering_id : string_ option;
      [@ocaml.doc "A unique identifier for the reserved cache node offering.\n"]
  cache_node_type : string_ option;
      [@ocaml.doc
        "The cache node type for the reserved cache node.\n\n\
        \ The following node types are supported by ElastiCache. Generally speaking, the current \
         generation types provide more memory and computational power at lower cost when compared \
         to their equivalent previous generation counterparts.\n\
        \ \n\
        \  {ul\n\
        \        {-  General purpose:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b M7g node types}: [cache.m7g.large], [cache.m7g.xlarge], \
         [cache.m7g.2xlarge], [cache.m7g.4xlarge], [cache.m7g.8xlarge], [cache.m7g.12xlarge], \
         [cache.m7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b M6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.m6g.large], \
         [cache.m6g.xlarge], [cache.m6g.2xlarge], [cache.m6g.4xlarge], [cache.m6g.8xlarge], \
         [cache.m6g.12xlarge], [cache.m6g.16xlarge] \n\
        \                            \n\
        \                              {b M5 node types:} [cache.m5.large], [cache.m5.xlarge], \
         [cache.m5.2xlarge], [cache.m5.4xlarge], [cache.m5.12xlarge], [cache.m5.24xlarge] \n\
        \                             \n\
        \                               {b M4 node types:} [cache.m4.large], [cache.m4.xlarge], \
         [cache.m4.2xlarge], [cache.m4.4xlarge], [cache.m4.10xlarge] \n\
        \                              \n\
        \                                {b T4g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and Memcached engine version 1.5.16 onward): [cache.t4g.micro], \
         [cache.t4g.small], [cache.t4g.medium] \n\
        \                               \n\
        \                                 {b T3 node types:} [cache.t3.micro], [cache.t3.small], \
         [cache.t3.medium] \n\
        \                                \n\
        \                                  {b T2 node types:} [cache.t2.micro], [cache.t2.small], \
         [cache.t2.medium] \n\
        \                                 \n\
        \                                  }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b T1 node types:} [cache.t1.micro] \n\
        \                        \n\
        \                          {b M1 node types:} [cache.m1.small], [cache.m1.medium], \
         [cache.m1.large], [cache.m1.xlarge] \n\
        \                         \n\
        \                           {b M3 node types:} [cache.m3.medium], [cache.m3.large], \
         [cache.m3.xlarge], [cache.m3.2xlarge] \n\
        \                          \n\
        \                           }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Compute optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b C1 node types:} [cache.c1.xlarge] \n\
        \                        \n\
        \                         }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Memory optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b R7g node types}: [cache.r7g.large], [cache.r7g.xlarge], \
         [cache.r7g.2xlarge], [cache.r7g.4xlarge], [cache.r7g.8xlarge], [cache.r7g.12xlarge], \
         [cache.r7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b R6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.r6g.large], \
         [cache.r6g.xlarge], [cache.r6g.2xlarge], [cache.r6g.4xlarge], [cache.r6g.8xlarge], \
         [cache.r6g.12xlarge], [cache.r6g.16xlarge] \n\
        \                            \n\
        \                              {b R5 node types:} [cache.r5.large], [cache.r5.xlarge], \
         [cache.r5.2xlarge], [cache.r5.4xlarge], [cache.r5.12xlarge], [cache.r5.24xlarge] \n\
        \                             \n\
        \                               {b R4 node types:} [cache.r4.large], [cache.r4.xlarge], \
         [cache.r4.2xlarge], [cache.r4.4xlarge], [cache.r4.8xlarge], [cache.r4.16xlarge] \n\
        \                              \n\
        \                               }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b M2 node types:} [cache.m2.xlarge], [cache.m2.2xlarge], \
         [cache.m2.4xlarge] \n\
        \                        \n\
        \                          {b R3 node types:} [cache.r3.large], [cache.r3.xlarge], \
         [cache.r3.2xlarge], [cache.r3.4xlarge], [cache.r3.8xlarge] \n\
        \                         \n\
        \                          }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \    {b Additional node type info} \n\
        \   \n\
        \    {ul\n\
        \          {-  All current generation instance types are created in Amazon VPC by default.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS append-only files (AOF) are not supported for T1 or T2 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS Multi-AZ with automatic failover is not supported on T1 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  The configuration variables [appendonly] and [appendfsync] are not \
         supported on Valkey, or on Redis OSS version 2.8.22 and later.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  duration : integer option; [@ocaml.doc "The duration of the offering. in seconds.\n"]
  fixed_price : double option; [@ocaml.doc "The fixed price charged for this offering.\n"]
  usage_price : double option; [@ocaml.doc "The hourly price charged for this offering.\n"]
  product_description : string_ option; [@ocaml.doc "The cache engine used by the offering.\n"]
  offering_type : string_ option; [@ocaml.doc "The offering type.\n"]
  recurring_charges : recurring_charge_list option;
      [@ocaml.doc "The recurring price charged to run this reserved cache node.\n"]
}
[@@ocaml.doc "Describes all of the attributes of a reserved cache node offering.\n"]

type nonrec reserved_cache_nodes_offering_list = reserved_cache_nodes_offering list [@@ocaml.doc ""]

type nonrec reserved_cache_nodes_offering_message = {
  marker : string_ option;
      [@ocaml.doc "Provides an identifier to allow retrieval of paginated results.\n"]
  reserved_cache_nodes_offerings : reserved_cache_nodes_offering_list option;
      [@ocaml.doc
        "A list of reserved cache node offerings. Each element in the list contains detailed \
         information about one offering.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeReservedCacheNodesOfferings] operation.\n"]

type nonrec describe_reserved_cache_nodes_offerings_message = {
  reserved_cache_nodes_offering_id : string_ option;
      [@ocaml.doc
        "The offering identifier filter value. Use this parameter to show only the available \
         offering that matches the specified reservation identifier.\n\n\
        \ Example: [438012d3-4052-4cc7-b2e3-8d3372e0e706] \n\
        \ "]
  cache_node_type : string_ option;
      [@ocaml.doc
        "The cache node type filter value. Use this parameter to show only the available offerings \
         matching the specified cache node type.\n\n\
        \ The following node types are supported by ElastiCache. Generally speaking, the current \
         generation types provide more memory and computational power at lower cost when compared \
         to their equivalent previous generation counterparts.\n\
        \ \n\
        \  {ul\n\
        \        {-  General purpose:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b M7g node types}: [cache.m7g.large], [cache.m7g.xlarge], \
         [cache.m7g.2xlarge], [cache.m7g.4xlarge], [cache.m7g.8xlarge], [cache.m7g.12xlarge], \
         [cache.m7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b M6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.m6g.large], \
         [cache.m6g.xlarge], [cache.m6g.2xlarge], [cache.m6g.4xlarge], [cache.m6g.8xlarge], \
         [cache.m6g.12xlarge], [cache.m6g.16xlarge] \n\
        \                            \n\
        \                              {b M5 node types:} [cache.m5.large], [cache.m5.xlarge], \
         [cache.m5.2xlarge], [cache.m5.4xlarge], [cache.m5.12xlarge], [cache.m5.24xlarge] \n\
        \                             \n\
        \                               {b M4 node types:} [cache.m4.large], [cache.m4.xlarge], \
         [cache.m4.2xlarge], [cache.m4.4xlarge], [cache.m4.10xlarge] \n\
        \                              \n\
        \                                {b T4g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and Memcached engine version 1.5.16 onward): [cache.t4g.micro], \
         [cache.t4g.small], [cache.t4g.medium] \n\
        \                               \n\
        \                                 {b T3 node types:} [cache.t3.micro], [cache.t3.small], \
         [cache.t3.medium] \n\
        \                                \n\
        \                                  {b T2 node types:} [cache.t2.micro], [cache.t2.small], \
         [cache.t2.medium] \n\
        \                                 \n\
        \                                  }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b T1 node types:} [cache.t1.micro] \n\
        \                        \n\
        \                          {b M1 node types:} [cache.m1.small], [cache.m1.medium], \
         [cache.m1.large], [cache.m1.xlarge] \n\
        \                         \n\
        \                           {b M3 node types:} [cache.m3.medium], [cache.m3.large], \
         [cache.m3.xlarge], [cache.m3.2xlarge] \n\
        \                          \n\
        \                           }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Compute optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b C1 node types:} [cache.c1.xlarge] \n\
        \                        \n\
        \                         }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Memory optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b R7g node types}: [cache.r7g.large], [cache.r7g.xlarge], \
         [cache.r7g.2xlarge], [cache.r7g.4xlarge], [cache.r7g.8xlarge], [cache.r7g.12xlarge], \
         [cache.r7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b R6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.r6g.large], \
         [cache.r6g.xlarge], [cache.r6g.2xlarge], [cache.r6g.4xlarge], [cache.r6g.8xlarge], \
         [cache.r6g.12xlarge], [cache.r6g.16xlarge] \n\
        \                            \n\
        \                              {b R5 node types:} [cache.r5.large], [cache.r5.xlarge], \
         [cache.r5.2xlarge], [cache.r5.4xlarge], [cache.r5.12xlarge], [cache.r5.24xlarge] \n\
        \                             \n\
        \                               {b R4 node types:} [cache.r4.large], [cache.r4.xlarge], \
         [cache.r4.2xlarge], [cache.r4.4xlarge], [cache.r4.8xlarge], [cache.r4.16xlarge] \n\
        \                              \n\
        \                               }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b M2 node types:} [cache.m2.xlarge], [cache.m2.2xlarge], \
         [cache.m2.4xlarge] \n\
        \                        \n\
        \                          {b R3 node types:} [cache.r3.large], [cache.r3.xlarge], \
         [cache.r3.2xlarge], [cache.r3.4xlarge], [cache.r3.8xlarge] \n\
        \                         \n\
        \                          }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \    {b Additional node type info} \n\
        \   \n\
        \    {ul\n\
        \          {-  All current generation instance types are created in Amazon VPC by default.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS append-only files (AOF) are not supported for T1 or T2 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS Multi-AZ with automatic failover is not supported on T1 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  The configuration variables [appendonly] and [appendfsync] are not \
         supported on Valkey, or on Redis OSS version 2.8.22 and later.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  duration : string_ option;
      [@ocaml.doc
        "Duration filter value, specified in years or seconds. Use this parameter to show only \
         reservations for a given duration.\n\n\
        \ Valid Values: [1 | 3 | 31536000 | 94608000] \n\
        \ "]
  product_description : string_ option;
      [@ocaml.doc
        "The product description filter value. Use this parameter to show only the available \
         offerings matching the specified product description.\n"]
  offering_type : string_ option;
      [@ocaml.doc
        "The offering type filter value. Use this parameter to show only the available offerings \
         matching the specified offering type.\n\n\
        \ Valid Values: [\"Light Utilization\"|\"Medium Utilization\"|\"Heavy Utilization\" |\"All\n\
        \                Upfront\"|\"Partial Upfront\"| \"No Upfront\"] \n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20; maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeReservedCacheNodesOfferings] operation.\n"]

type nonrec reserved_cache_node_list = reserved_cache_node list [@@ocaml.doc ""]

type nonrec reserved_cache_node_message = {
  marker : string_ option;
      [@ocaml.doc "Provides an identifier to allow retrieval of paginated results.\n"]
  reserved_cache_nodes : reserved_cache_node_list option;
      [@ocaml.doc
        "A list of reserved cache nodes. Each element in the list contains detailed information \
         about one node.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeReservedCacheNodes] operation.\n"]

type nonrec describe_reserved_cache_nodes_message = {
  reserved_cache_node_id : string_ option;
      [@ocaml.doc
        "The reserved cache node identifier filter value. Use this parameter to show only the \
         reservation that matches the specified reservation ID.\n"]
  reserved_cache_nodes_offering_id : string_ option;
      [@ocaml.doc
        "The offering identifier filter value. Use this parameter to show only purchased \
         reservations matching the specified offering identifier.\n"]
  cache_node_type : string_ option;
      [@ocaml.doc
        "The cache node type filter value. Use this parameter to show only those reservations \
         matching the specified cache node type.\n\n\
        \ The following node types are supported by ElastiCache. Generally speaking, the current \
         generation types provide more memory and computational power at lower cost when compared \
         to their equivalent previous generation counterparts.\n\
        \ \n\
        \  {ul\n\
        \        {-  General purpose:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b M7g node types}: [cache.m7g.large], [cache.m7g.xlarge], \
         [cache.m7g.2xlarge], [cache.m7g.4xlarge], [cache.m7g.8xlarge], [cache.m7g.12xlarge], \
         [cache.m7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b M6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.m6g.large], \
         [cache.m6g.xlarge], [cache.m6g.2xlarge], [cache.m6g.4xlarge], [cache.m6g.8xlarge], \
         [cache.m6g.12xlarge], [cache.m6g.16xlarge] \n\
        \                            \n\
        \                              {b M5 node types:} [cache.m5.large], [cache.m5.xlarge], \
         [cache.m5.2xlarge], [cache.m5.4xlarge], [cache.m5.12xlarge], [cache.m5.24xlarge] \n\
        \                             \n\
        \                               {b M4 node types:} [cache.m4.large], [cache.m4.xlarge], \
         [cache.m4.2xlarge], [cache.m4.4xlarge], [cache.m4.10xlarge] \n\
        \                              \n\
        \                                {b T4g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and Memcached engine version 1.5.16 onward): [cache.t4g.micro], \
         [cache.t4g.small], [cache.t4g.medium] \n\
        \                               \n\
        \                                 {b T3 node types:} [cache.t3.micro], [cache.t3.small], \
         [cache.t3.medium] \n\
        \                                \n\
        \                                  {b T2 node types:} [cache.t2.micro], [cache.t2.small], \
         [cache.t2.medium] \n\
        \                                 \n\
        \                                  }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b T1 node types:} [cache.t1.micro] \n\
        \                        \n\
        \                          {b M1 node types:} [cache.m1.small], [cache.m1.medium], \
         [cache.m1.large], [cache.m1.xlarge] \n\
        \                         \n\
        \                           {b M3 node types:} [cache.m3.medium], [cache.m3.large], \
         [cache.m3.xlarge], [cache.m3.2xlarge] \n\
        \                          \n\
        \                           }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Compute optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b C1 node types:} [cache.c1.xlarge] \n\
        \                        \n\
        \                         }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Memory optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b R7g node types}: [cache.r7g.large], [cache.r7g.xlarge], \
         [cache.r7g.2xlarge], [cache.r7g.4xlarge], [cache.r7g.8xlarge], [cache.r7g.12xlarge], \
         [cache.r7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b R6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.r6g.large], \
         [cache.r6g.xlarge], [cache.r6g.2xlarge], [cache.r6g.4xlarge], [cache.r6g.8xlarge], \
         [cache.r6g.12xlarge], [cache.r6g.16xlarge] \n\
        \                            \n\
        \                              {b R5 node types:} [cache.r5.large], [cache.r5.xlarge], \
         [cache.r5.2xlarge], [cache.r5.4xlarge], [cache.r5.12xlarge], [cache.r5.24xlarge] \n\
        \                             \n\
        \                               {b R4 node types:} [cache.r4.large], [cache.r4.xlarge], \
         [cache.r4.2xlarge], [cache.r4.4xlarge], [cache.r4.8xlarge], [cache.r4.16xlarge] \n\
        \                              \n\
        \                               }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b M2 node types:} [cache.m2.xlarge], [cache.m2.2xlarge], \
         [cache.m2.4xlarge] \n\
        \                        \n\
        \                          {b R3 node types:} [cache.r3.large], [cache.r3.xlarge], \
         [cache.r3.2xlarge], [cache.r3.4xlarge], [cache.r3.8xlarge] \n\
        \                         \n\
        \                          }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \    {b Additional node type info} \n\
        \   \n\
        \    {ul\n\
        \          {-  All current generation instance types are created in Amazon VPC by default.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS append-only files (AOF) are not supported for T1 or T2 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS Multi-AZ with automatic failover is not supported on T1 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  The configuration variables [appendonly] and [appendfsync] are not \
         supported on Valkey, or on Redis OSS version 2.8.22 and later.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  duration : string_ option;
      [@ocaml.doc
        "The duration filter value, specified in years or seconds. Use this parameter to show only \
         reservations for this duration.\n\n\
        \ Valid Values: [1 | 3 | 31536000 | 94608000] \n\
        \ "]
  product_description : string_ option;
      [@ocaml.doc
        "The product description filter value. Use this parameter to show only those reservations \
         matching the specified product description.\n"]
  offering_type : string_ option;
      [@ocaml.doc
        "The offering type filter value. Use this parameter to show only the available offerings \
         matching the specified offering type.\n\n\
        \ Valid values: [\"Light Utilization\"|\"Medium Utilization\"|\"Heavy Utilization\"|\"All\n\
        \                Upfront\"|\"Partial Upfront\"| \"No Upfront\"] \n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20; maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeReservedCacheNodes] operation.\n"]

type nonrec replication_group_list = replication_group list [@@ocaml.doc ""]

type nonrec replication_group_message = {
  marker : string_ option;
      [@ocaml.doc "Provides an identifier to allow retrieval of paginated results.\n"]
  replication_groups : replication_group_list option;
      [@ocaml.doc
        "A list of replication groups. Each item in the list contains detailed information about \
         one replication group.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeReplicationGroups] operation.\n"]

type nonrec describe_replication_groups_message = {
  replication_group_id : string_ option;
      [@ocaml.doc
        "The identifier for the replication group to be described. This parameter is not case \
         sensitive.\n\n\
        \ If you do not specify this parameter, information about all replication groups is \
         returned.\n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20; maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeReplicationGroups] operation.\n"]

type nonrec global_replication_group_list = global_replication_group list [@@ocaml.doc ""]

type nonrec describe_global_replication_groups_result = {
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by MaxRecords. >\n"]
  global_replication_groups : global_replication_group_list option;
      [@ocaml.doc "Indicates the slot configuration and global identifier for each slice group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_global_replication_groups_message = {
  global_replication_group_id : string_ option; [@ocaml.doc "The name of the Global datastore\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified MaxRecords value, a marker is included in the response so that the remaining \
         results can be retrieved. \n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords]. \n"]
  show_member_info : boolean_optional option;
      [@ocaml.doc "Returns the list of members that comprise the Global datastore.\n"]
}
[@@ocaml.doc ""]

type nonrec source_type =
  | Cache_cluster [@ocaml.doc ""]
  | Cache_parameter_group [@ocaml.doc ""]
  | Cache_security_group [@ocaml.doc ""]
  | Cache_subnet_group [@ocaml.doc ""]
  | Replication_group [@ocaml.doc ""]
  | Serverless_cache [@ocaml.doc ""]
  | Serverless_cache_snapshot [@ocaml.doc ""]
  | User [@ocaml.doc ""]
  | User_group [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event = {
  source_identifier : string_ option;
      [@ocaml.doc
        "The identifier for the source of the event. For example, if the event occurred at the \
         cluster level, the identifier would be the name of the cluster.\n"]
  source_type : source_type option;
      [@ocaml.doc
        "Specifies the origin of this event - a cluster, a parameter group, a security group, etc.\n"]
  message : string_ option; [@ocaml.doc "The text of the event.\n"]
  date : t_stamp option; [@ocaml.doc "The date and time when the event occurred.\n"]
}
[@@ocaml.doc
  "Represents a single occurrence of something interesting within the system. Some examples of \
   events are creating a cluster, adding or removing a cache node, or rebooting a node.\n"]

type nonrec event_list = event list [@@ocaml.doc ""]

type nonrec events_message = {
  marker : string_ option;
      [@ocaml.doc "Provides an identifier to allow retrieval of paginated results.\n"]
  events : event_list option;
      [@ocaml.doc
        "A list of events. Each element in the list contains detailed information about one event.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeEvents] operation.\n"]

type nonrec describe_events_message = {
  source_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the event source for which events are returned. If not specified, all \
         sources are included in the response.\n"]
  source_type : source_type option;
      [@ocaml.doc
        "The event source to retrieve events for. If no value is specified, all events are returned.\n"]
  start_time : t_stamp option;
      [@ocaml.doc
        "The beginning of the time interval to retrieve events for, specified in ISO 8601 format.\n\n\
        \  {b Example:} 2017-03-30T07:03:49.555Z\n\
        \ "]
  end_time : t_stamp option;
      [@ocaml.doc
        "The end of the time interval for which to retrieve events, specified in ISO 8601 format.\n\n\
        \  {b Example:} 2017-03-30T07:03:49.555Z\n\
        \ "]
  duration : integer_optional option;
      [@ocaml.doc "The number of minutes worth of events to retrieve.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20; maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeEvents] operation.\n"]

type nonrec change_type = Immediate [@ocaml.doc ""] | Requires_reboot [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cache_node_type_specific_value = {
  cache_node_type : string_ option;
      [@ocaml.doc "The cache node type for which this value applies.\n"]
  value : string_ option; [@ocaml.doc "The value for the cache node type.\n"]
}
[@@ocaml.doc "A value that applies only to a certain cache node type.\n"]

type nonrec cache_node_type_specific_value_list = cache_node_type_specific_value list
[@@ocaml.doc ""]

type nonrec cache_node_type_specific_parameter = {
  parameter_name : string_ option; [@ocaml.doc "The name of the parameter.\n"]
  description : string_ option; [@ocaml.doc "A description of the parameter.\n"]
  source : string_ option; [@ocaml.doc "The source of the parameter value.\n"]
  data_type : string_ option; [@ocaml.doc "The valid data type for the parameter.\n"]
  allowed_values : string_ option; [@ocaml.doc "The valid range of values for the parameter.\n"]
  is_modifiable : boolean_ option;
      [@ocaml.doc
        "Indicates whether ([true]) or not ([false]) the parameter can be modified. Some \
         parameters have security or operational implications that prevent them from being changed.\n"]
  minimum_engine_version : string_ option;
      [@ocaml.doc "The earliest cache engine version to which the parameter can apply.\n"]
  cache_node_type_specific_values : cache_node_type_specific_value_list option;
      [@ocaml.doc "A list of cache node types and their corresponding values for this parameter.\n"]
  change_type : change_type option;
      [@ocaml.doc
        "Indicates whether a change to the parameter is applied immediately or requires a reboot \
         for the change to be applied. You can force a reboot or wait until the next maintenance \
         window's reboot. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Clusters.Rebooting.html}Rebooting \
         a Cluster}.\n"]
}
[@@ocaml.doc
  "A parameter that has a different value for each cache node type it is applied to. For example, \
   in a Valkey or Redis OSS cluster, a [cache.m1.large] cache node type would have a larger \
   [maxmemory] value than a [cache.m1.small] type.\n"]

type nonrec cache_node_type_specific_parameters_list = cache_node_type_specific_parameter list
[@@ocaml.doc ""]

type nonrec parameter = {
  parameter_name : string_ option; [@ocaml.doc "The name of the parameter.\n"]
  parameter_value : string_ option; [@ocaml.doc "The value of the parameter.\n"]
  description : string_ option; [@ocaml.doc "A description of the parameter.\n"]
  source : string_ option; [@ocaml.doc "The source of the parameter.\n"]
  data_type : string_ option; [@ocaml.doc "The valid data type for the parameter.\n"]
  allowed_values : string_ option; [@ocaml.doc "The valid range of values for the parameter.\n"]
  is_modifiable : boolean_ option;
      [@ocaml.doc
        "Indicates whether ([true]) or not ([false]) the parameter can be modified. Some \
         parameters have security or operational implications that prevent them from being changed.\n"]
  minimum_engine_version : string_ option;
      [@ocaml.doc "The earliest cache engine version to which the parameter can apply.\n"]
  change_type : change_type option;
      [@ocaml.doc
        "Indicates whether a change to the parameter is applied immediately or requires a reboot \
         for the change to be applied. You can force a reboot or wait until the next maintenance \
         window's reboot. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Clusters.Rebooting.html}Rebooting \
         a Cluster}.\n"]
}
[@@ocaml.doc "Describes an individual setting that controls some aspect of ElastiCache behavior.\n"]

type nonrec parameters_list = parameter list [@@ocaml.doc ""]

type nonrec engine_defaults = {
  cache_parameter_group_family : string_ option;
      [@ocaml.doc
        "Specifies the name of the cache parameter group family to which the engine default \
         parameters apply.\n\n\
        \ Valid values are: [memcached1.4] | [memcached1.5] | [memcached1.6] | [redis2.6] | \
         [redis2.8] | [redis3.2] | [redis4.0] | [redis5.0] | [redis6.0] | [redis6.x] | [redis7] \n\
        \ "]
  marker : string_ option;
      [@ocaml.doc "Provides an identifier to allow retrieval of paginated results.\n"]
  parameters : parameters_list option;
      [@ocaml.doc "Contains a list of engine default parameters.\n"]
  cache_node_type_specific_parameters : cache_node_type_specific_parameters_list option;
      [@ocaml.doc
        "A list of parameters specific to a particular cache node type. Each element in the list \
         contains detailed information about one parameter.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeEngineDefaultParameters] operation.\n"]

type nonrec describe_engine_default_parameters_result = {
  engine_defaults : engine_defaults option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_engine_default_parameters_message = {
  cache_parameter_group_family : string_;
      [@ocaml.doc
        "The name of the cache parameter group family.\n\n\
        \ Valid values are: [memcached1.4] | [memcached1.5] | [memcached1.6] | [redis2.6] | \
         [redis2.8] | [redis3.2] | [redis4.0] | [redis5.0] | [redis6.x] | [redis6.2] | [redis7] \n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20; maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeEngineDefaultParameters] operation.\n"]

type nonrec cache_subnet_groups = cache_subnet_group list [@@ocaml.doc ""]

type nonrec cache_subnet_group_message = {
  marker : string_ option;
      [@ocaml.doc "Provides an identifier to allow retrieval of paginated results.\n"]
  cache_subnet_groups : cache_subnet_groups option;
      [@ocaml.doc
        "A list of cache subnet groups. Each element in the list contains detailed information \
         about one group.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeCacheSubnetGroups] operation.\n"]

type nonrec describe_cache_subnet_groups_message = {
  cache_subnet_group_name : string_ option;
      [@ocaml.doc "The name of the cache subnet group to return details for.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20; maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeCacheSubnetGroups] operation.\n"]

type nonrec cache_security_groups = cache_security_group list [@@ocaml.doc ""]

type nonrec cache_security_group_message = {
  marker : string_ option;
      [@ocaml.doc "Provides an identifier to allow retrieval of paginated results.\n"]
  cache_security_groups : cache_security_groups option;
      [@ocaml.doc
        "A list of cache security groups. Each element in the list contains detailed information \
         about one group.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeCacheSecurityGroups] operation.\n"]

type nonrec describe_cache_security_groups_message = {
  cache_security_group_name : string_ option;
      [@ocaml.doc "The name of the cache security group to return details for.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20; maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeCacheSecurityGroups] operation.\n"]

type nonrec cache_parameter_group_details = {
  marker : string_ option;
      [@ocaml.doc "Provides an identifier to allow retrieval of paginated results.\n"]
  parameters : parameters_list option; [@ocaml.doc "A list of [Parameter] instances.\n"]
  cache_node_type_specific_parameters : cache_node_type_specific_parameters_list option;
      [@ocaml.doc
        "A list of parameters specific to a particular cache node type. Each element in the list \
         contains detailed information about one parameter.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeCacheParameters] operation.\n"]

type nonrec describe_cache_parameters_message = {
  cache_parameter_group_name : string_;
      [@ocaml.doc "The name of a specific cache parameter group to return details for.\n"]
  source : string_ option;
      [@ocaml.doc
        "The parameter types to return.\n\n Valid values: [user] | [system] | [engine-default] \n "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20; maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeCacheParameters] operation.\n"]

type nonrec cache_parameter_group = {
  cache_parameter_group_name : string_ option;
      [@ocaml.doc "The name of the cache parameter group.\n"]
  cache_parameter_group_family : string_ option;
      [@ocaml.doc
        "The name of the cache parameter group family that this cache parameter group is \
         compatible with.\n\n\
        \ Valid values are: [memcached1.4] | [memcached1.5] | [memcached1.6] | [redis2.6] | \
         [redis2.8] | [redis3.2] | [redis4.0] | [redis5.0] | [redis6.x] | [redis7] \n\
        \ "]
  description : string_ option; [@ocaml.doc "The description for this cache parameter group.\n"]
  is_global : boolean_ option;
      [@ocaml.doc "Indicates whether the parameter group is associated with a Global datastore\n"]
  ar_n : string_ option;
      [@ocaml.doc "The ARN (Amazon Resource Name) of the cache parameter group.\n"]
}
[@@ocaml.doc "Represents the output of a [CreateCacheParameterGroup] operation.\n"]

type nonrec cache_parameter_group_list = cache_parameter_group list [@@ocaml.doc ""]

type nonrec cache_parameter_groups_message = {
  marker : string_ option;
      [@ocaml.doc "Provides an identifier to allow retrieval of paginated results.\n"]
  cache_parameter_groups : cache_parameter_group_list option;
      [@ocaml.doc
        "A list of cache parameter groups. Each element in the list contains detailed information \
         about one cache parameter group.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeCacheParameterGroups] operation.\n"]

type nonrec describe_cache_parameter_groups_message = {
  cache_parameter_group_name : string_ option;
      [@ocaml.doc "The name of a specific cache parameter group to return details for.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20; maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeCacheParameterGroups] operation.\n"]

type nonrec cache_engine_version = {
  engine : string_ option; [@ocaml.doc "The name of the cache engine.\n"]
  engine_version : string_ option; [@ocaml.doc "The version number of the cache engine.\n"]
  cache_parameter_group_family : string_ option;
      [@ocaml.doc
        "The name of the cache parameter group family associated with this cache engine.\n\n\
        \ Valid values are: [memcached1.4] | [memcached1.5] | [memcached1.6] | [redis2.6] | \
         [redis2.8] | [redis3.2] | [redis4.0] | [redis5.0] | [redis6.x] | [redis7] \n\
        \ "]
  cache_engine_description : string_ option; [@ocaml.doc "The description of the cache engine.\n"]
  cache_engine_version_description : string_ option;
      [@ocaml.doc "The description of the cache engine version.\n"]
}
[@@ocaml.doc "Provides all of the details about a particular cache engine version.\n"]

type nonrec cache_engine_version_list = cache_engine_version list [@@ocaml.doc ""]

type nonrec cache_engine_version_message = {
  marker : string_ option;
      [@ocaml.doc "Provides an identifier to allow retrieval of paginated results.\n"]
  cache_engine_versions : cache_engine_version_list option;
      [@ocaml.doc
        "A list of cache engine version details. Each element in the list contains detailed \
         information about one cache engine version.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeCacheEngineVersions] operation.\n"]

type nonrec describe_cache_engine_versions_message = {
  engine : string_ option;
      [@ocaml.doc "The cache engine to return. Valid values: [memcached] | [redis] \n"]
  engine_version : string_ option;
      [@ocaml.doc "The cache engine version to return.\n\n Example: [1.4.14] \n "]
  cache_parameter_group_family : string_ option;
      [@ocaml.doc
        "The name of a specific cache parameter group family to return details for.\n\n\
        \ Valid values are: [memcached1.4] | [memcached1.5] | [memcached1.6] | [redis2.6] | \
         [redis2.8] | [redis3.2] | [redis4.0] | [redis5.0] | [redis6.x] | [redis6.2] | [redis7] | \
         [valkey7] \n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be 1 to 255 alphanumeric characters\n\
        \             \n\
        \              }\n\
        \         {-  First character must be a letter\n\
        \             \n\
        \              }\n\
        \         {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20; maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
  default_only : boolean_ option;
      [@ocaml.doc
        "If [true], specifies that only the default version of the specified engine or engine and \
         major version combination is to be returned.\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeCacheEngineVersions] operation.\n"]

type nonrec cache_cluster_list = cache_cluster list [@@ocaml.doc ""]

type nonrec cache_cluster_message = {
  marker : string_ option;
      [@ocaml.doc "Provides an identifier to allow retrieval of paginated results.\n"]
  cache_clusters : cache_cluster_list option;
      [@ocaml.doc
        "A list of clusters. Each item in the list contains detailed information about one cluster.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeCacheClusters] operation.\n"]

type nonrec describe_cache_clusters_message = {
  cache_cluster_id : string_ option;
      [@ocaml.doc
        "The user-supplied cluster identifier. If this parameter is specified, only information \
         about that specific cluster is returned. This parameter isn't case sensitive.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a marker is included in the response so that the remaining \
         results can be retrieved.\n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20; maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional marker returned from a prior request. Use this marker for pagination of \
         results from this operation. If this parameter is specified, the response includes only \
         records beyond the marker, up to the value specified by [MaxRecords].\n"]
  show_cache_node_info : boolean_optional option;
      [@ocaml.doc
        "An optional flag that can be included in the [DescribeCacheCluster] request to retrieve \
         information about the individual cache nodes.\n"]
  show_cache_clusters_not_in_replication_groups : boolean_optional option;
      [@ocaml.doc
        "An optional flag that can be included in the [DescribeCacheCluster] request to show only \
         nodes (API/CLI: clusters) that are not members of a replication group. In practice, this \
         means Memcached and single node Valkey or Redis OSS clusters.\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeCacheClusters] operation.\n"]

type nonrec delete_user_group_message = {
  user_group_id : string_; [@ocaml.doc "The ID of the user group.\n"]
}
[@@ocaml.doc ""]

type nonrec default_user_associated_to_user_group_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The default user assigned to the user group.\n"]

type nonrec delete_user_message = { user_id : user_id [@ocaml.doc "The ID of the user.\n"] }
[@@ocaml.doc ""]

type nonrec invalid_snapshot_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The current state of the snapshot does not allow the requested operation to occur.\n"]

type nonrec delete_snapshot_result = { snapshot : snapshot option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec delete_snapshot_message = {
  snapshot_name : string_; [@ocaml.doc "The name of the snapshot to be deleted.\n"]
}
[@@ocaml.doc "Represents the input of a [DeleteSnapshot] operation.\n"]

type nonrec delete_serverless_cache_snapshot_response = {
  serverless_cache_snapshot : serverless_cache_snapshot option;
      [@ocaml.doc
        "The snapshot to be deleted. Available for Valkey, Redis OSS and Serverless Memcached only.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_serverless_cache_snapshot_request = {
  serverless_cache_snapshot_name : string_;
      [@ocaml.doc
        "Idenfitier of the snapshot to be deleted. Available for Valkey, Redis OSS and Serverless \
         Memcached only.\n"]
}
[@@ocaml.doc ""]

type nonrec serverless_cache_snapshot_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A serverless cache snapshot with this name already exists. Available for Valkey, Redis OSS and \
   Serverless Memcached only.\n"]

type nonrec delete_serverless_cache_response = {
  serverless_cache : serverless_cache option;
      [@ocaml.doc
        "Provides the details of the specified serverless cache that is about to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_serverless_cache_request = {
  serverless_cache_name : string_;
      [@ocaml.doc "The identifier of the serverless cache to be deleted.\n"]
  final_snapshot_name : string_ option;
      [@ocaml.doc
        "Name of the final snapshot to be taken before the serverless cache is deleted. Available \
         for Valkey, Redis OSS and Serverless Memcached only. Default: NULL, i.e. a final snapshot \
         is not taken.\n"]
}
[@@ocaml.doc ""]

type nonrec snapshot_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of snapshots.\n"]

type nonrec snapshot_feature_not_supported_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You attempted one of the following operations:\n\n\
  \ {ul\n\
  \       {-  Creating a snapshot of a Valkey or Redis OSS cluster running on a [cache.t1.micro] \
   cache node.\n\
  \           \n\
  \            }\n\
  \       {-  Creating a snapshot of a cluster that is running Memcached rather than Valkey or \
   Redis OSS.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Neither of these are supported by ElastiCache.\n\
  \   "]

type nonrec snapshot_already_exists_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "You already have a snapshot with the given name.\n"]

type nonrec delete_replication_group_result = {
  replication_group : replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_replication_group_message = {
  replication_group_id : string_;
      [@ocaml.doc
        "The identifier for the cluster to be deleted. This parameter is not case sensitive.\n"]
  retain_primary_cluster : boolean_optional option;
      [@ocaml.doc
        "If set to [true], all of the read replicas are deleted, but the primary node is retained.\n"]
  final_snapshot_identifier : string_ option;
      [@ocaml.doc
        "The name of a final node group (shard) snapshot. ElastiCache creates the snapshot from \
         the primary node in the cluster, rather than one of the replicas; this is to ensure that \
         it captures the freshest data. After the final snapshot is taken, the replication group \
         is immediately deleted.\n"]
}
[@@ocaml.doc "Represents the input of a [DeleteReplicationGroup] operation.\n"]

type nonrec delete_global_replication_group_result = {
  global_replication_group : global_replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_global_replication_group_message = {
  global_replication_group_id : string_; [@ocaml.doc "The name of the Global datastore\n"]
  retain_primary_replication_group : boolean_;
      [@ocaml.doc "The primary replication group is retained as a standalone replication group. \n"]
}
[@@ocaml.doc ""]

type nonrec cache_subnet_group_in_use = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested cache subnet group is currently in use.\n"]

type nonrec delete_cache_subnet_group_message = {
  cache_subnet_group_name : string_;
      [@ocaml.doc
        "The name of the cache subnet group to delete.\n\n\
        \ Constraints: Must contain no more than 255 alphanumeric characters or hyphens.\n\
        \ "]
}
[@@ocaml.doc "Represents the input of a [DeleteCacheSubnetGroup] operation.\n"]

type nonrec delete_cache_security_group_message = {
  cache_security_group_name : string_;
      [@ocaml.doc
        "The name of the cache security group to delete.\n\n\
        \  You cannot delete the default security group.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Represents the input of a [DeleteCacheSecurityGroup] operation.\n"]

type nonrec delete_cache_parameter_group_message = {
  cache_parameter_group_name : string_;
      [@ocaml.doc
        "The name of the cache parameter group to delete.\n\n\
        \  The specified cache security group must not be associated with any clusters.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Represents the input of a [DeleteCacheParameterGroup] operation.\n"]

type nonrec delete_cache_cluster_result = { cache_cluster : cache_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec delete_cache_cluster_message = {
  cache_cluster_id : string_;
      [@ocaml.doc
        "The cluster identifier for the cluster to be deleted. This parameter is not case sensitive.\n"]
  final_snapshot_identifier : string_ option;
      [@ocaml.doc
        "The user-supplied name of a final cluster snapshot. This is the unique name that \
         identifies the snapshot. ElastiCache creates the snapshot, and then deletes the cluster \
         immediately afterward.\n"]
}
[@@ocaml.doc "Represents the input of a [DeleteCacheCluster] operation.\n"]

type nonrec decrease_replica_count_result = {
  replication_group : replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec remove_replicas_list = string_ list [@@ocaml.doc ""]

type nonrec decrease_replica_count_message = {
  replication_group_id : string_;
      [@ocaml.doc "The id of the replication group from which you want to remove replica nodes.\n"]
  new_replica_count : integer_optional option;
      [@ocaml.doc
        "The number of read replica nodes you want at the completion of this operation. For Valkey \
         or Redis OSS (cluster mode disabled) replication groups, this is the number of replica \
         nodes in the replication group. For Valkey or Redis OSS (cluster mode enabled) \
         replication groups, this is the number of replica nodes in each of the replication \
         group's node groups.\n\n\
        \ The minimum number of replicas in a shard or replication group is:\n\
        \ \n\
        \  {ul\n\
        \        {-  Valkey or Redis OSS (cluster mode disabled)\n\
        \            \n\
        \             {ul\n\
        \                   {-  If Multi-AZ is enabled: 1\n\
        \                       \n\
        \                        }\n\
        \                   {-  If Multi-AZ is not enabled: 0\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Valkey or Redis OSS (cluster mode enabled): 0 (though you will not be able to \
         failover to a replica if your primary node fails)\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  replica_configuration : replica_configuration_list option;
      [@ocaml.doc
        "A list of [ConfigureShard] objects that can be used to configure each shard in a Valkey \
         or Redis OSS replication group. The [ConfigureShard] has three members: \
         [NewReplicaCount], [NodeGroupId], and [PreferredAvailabilityZones].\n"]
  replicas_to_remove : remove_replicas_list option;
      [@ocaml.doc
        "A list of the node ids to remove from the replication group or node group (shard).\n"]
  apply_immediately : boolean_;
      [@ocaml.doc
        "If [True], the number of replica nodes is decreased immediately. [ApplyImmediately=False] \
         is not currently supported.\n"]
}
[@@ocaml.doc ""]

type nonrec decrease_node_groups_in_global_replication_group_result = {
  global_replication_group : global_replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec global_node_group_id_list = string_ list [@@ocaml.doc ""]

type nonrec decrease_node_groups_in_global_replication_group_message = {
  global_replication_group_id : string_; [@ocaml.doc "The name of the Global datastore\n"]
  node_group_count : integer;
      [@ocaml.doc
        "The number of node groups (shards) that results from the modification of the shard \
         configuration\n"]
  global_node_groups_to_remove : global_node_group_id_list option;
      [@ocaml.doc
        "If the value of NodeGroupCount is less than the current number of node groups (shards), \
         then either NodeGroupsToRemove or NodeGroupsToRetain is required. \
         GlobalNodeGroupsToRemove is a list of NodeGroupIds to remove from the cluster. \
         ElastiCache will attempt to remove all node groups listed by GlobalNodeGroupsToRemove \
         from the cluster. \n"]
  global_node_groups_to_retain : global_node_group_id_list option;
      [@ocaml.doc
        "If the value of NodeGroupCount is less than the current number of node groups (shards), \
         then either NodeGroupsToRemove or NodeGroupsToRetain is required. \
         GlobalNodeGroupsToRetain is a list of NodeGroupIds to retain from the cluster. \
         ElastiCache will attempt to retain all node groups listed by GlobalNodeGroupsToRetain \
         from the cluster. \n"]
  apply_immediately : boolean_;
      [@ocaml.doc
        "Indicates that the shard reconfiguration process begins immediately. At present, the only \
         permitted value for this parameter is true. \n"]
}
[@@ocaml.doc ""]

type nonrec user_group_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The number of users exceeds the user group limit.\n"]

type nonrec user_group_already_exists_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The user group with this ID already exists.\n"]

type nonrec create_user_group_message = {
  user_group_id : string_;
      [@ocaml.doc "The ID of the user group. This value is stored as a lowercase string.\n"]
  engine : engine_type;
      [@ocaml.doc "Sets the engine listed in a user group. The options are valkey or redis.\n"]
  user_ids : user_id_list_input option;
      [@ocaml.doc "The list of user IDs that belong to the user group.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted. Available for Valkey and Redis OSS \
         only.\n"]
}
[@@ocaml.doc ""]

type nonrec user_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The quota of users has been exceeded.\n"]

type nonrec user_already_exists_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A user with this ID already exists.\n"]

type nonrec user_name = string [@@ocaml.doc ""]

type nonrec create_user_message = {
  user_id : user_id;
      [@ocaml.doc "The ID of the user. This value is stored as a lowercase string.\n"]
  user_name : user_name; [@ocaml.doc "The username of the user.\n"]
  engine : engine_type; [@ocaml.doc "The options are valkey or redis. \n"]
  passwords : password_list_input option;
      [@ocaml.doc
        "Passwords used for this user. You can create up to two passwords for each user.\n"]
  access_string : access_string; [@ocaml.doc "Access permissions string used for this user.\n"]
  no_password_required : boolean_optional option;
      [@ocaml.doc "Indicates a password is not required for this user.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
  authentication_mode : authentication_mode option;
      [@ocaml.doc "Specifies how to authenticate the user.\n"]
}
[@@ocaml.doc ""]

type nonrec create_snapshot_result = { snapshot : snapshot option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec create_snapshot_message = {
  replication_group_id : string_ option;
      [@ocaml.doc
        "The identifier of an existing replication group. The snapshot is created from this \
         replication group.\n"]
  cache_cluster_id : string_ option;
      [@ocaml.doc
        "The identifier of an existing cluster. The snapshot is created from this cluster.\n"]
  snapshot_name : string_;
      [@ocaml.doc
        "A name for the snapshot being created. This value is stored as a lowercase string.\n"]
  kms_key_id : string_ option; [@ocaml.doc "The ID of the KMS key used to encrypt the snapshot.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
}
[@@ocaml.doc "Represents the input of a [CreateSnapshot] operation.\n"]

type nonrec serverless_cache_snapshot_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The number of serverless cache snapshots exceeds the customer snapshot quota. Available for \
   Valkey, Redis OSS and Serverless Memcached only.\n"]

type nonrec create_serverless_cache_snapshot_response = {
  serverless_cache_snapshot : serverless_cache_snapshot option;
      [@ocaml.doc
        "The state of a serverless cache snapshot at a specific point in time, to the millisecond. \
         Available for Valkey, Redis OSS and Serverless Memcached only.\n"]
}
[@@ocaml.doc ""]

type nonrec create_serverless_cache_snapshot_request = {
  serverless_cache_snapshot_name : string_;
      [@ocaml.doc
        "The name for the snapshot being created. Must be unique for the customer account. \
         Available for Valkey, Redis OSS and Serverless Memcached only. Must be between 1 and 255 \
         characters. This value is stored as a lowercase string.\n"]
  serverless_cache_name : string_;
      [@ocaml.doc
        "The name of an existing serverless cache. The snapshot is created from this cache. \
         Available for Valkey, Redis OSS and Serverless Memcached only.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The ID of the KMS key used to encrypt the snapshot. Available for Valkey, Redis OSS and \
         Serverless Memcached only. Default: NULL\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to the snapshot resource. A tag is a key-value pair. Available \
         for Valkey, Redis OSS and Serverless Memcached only.\n"]
}
[@@ocaml.doc ""]

type nonrec serverless_cache_quota_for_customer_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The number of serverless caches exceeds the customer quota.\n"]

type nonrec serverless_cache_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A serverless cache with this name already exists.\n"]

type nonrec create_serverless_cache_response = {
  serverless_cache : serverless_cache option;
      [@ocaml.doc "The response for the attempt to create the serverless cache.\n"]
}
[@@ocaml.doc ""]

type nonrec snapshot_arns_list = string_ list [@@ocaml.doc ""]

type nonrec create_serverless_cache_request = {
  serverless_cache_name : string_;
      [@ocaml.doc
        "User-provided identifier for the serverless cache. This parameter is stored as a \
         lowercase string.\n"]
  description : string_ option;
      [@ocaml.doc
        "User-provided description for the serverless cache. The default is NULL, i.e. if no \
         description is provided then an empty string will be returned. The maximum length is 255 \
         characters. \n"]
  engine : string_;
      [@ocaml.doc "The name of the cache engine to be used for creating the serverless cache.\n"]
  major_engine_version : string_ option;
      [@ocaml.doc
        "The version of the cache engine that will be used to create the serverless cache.\n"]
  cache_usage_limits : cache_usage_limits option;
      [@ocaml.doc
        "Sets the cache usage limits for storage and ElastiCache Processing Units for the cache.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "ARN of the customer managed key for encrypting the data at rest. If no KMS key is \
         provided, a default service key is used.\n"]
  security_group_ids : security_group_ids_list option;
      [@ocaml.doc
        "A list of the one or more VPC security groups to be associated with the serverless cache. \
         The security group will authorize traffic access for the VPC end-point (private-link). If \
         no other information is given this will be the VPC\226\128\153s Default Security Group \
         that is associated with the cluster VPC end-point.\n"]
  snapshot_arns_to_restore : snapshot_arns_list option;
      [@ocaml.doc
        "The ARN(s) of the snapshot that the new serverless cache will be created from. Available \
         for Valkey, Redis OSS and Serverless Memcached only.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The list of tags (key, value) pairs to be added to the serverless cache resource. Default \
         is NULL.\n"]
  user_group_id : string_ option;
      [@ocaml.doc
        "The identifier of the UserGroup to be associated with the serverless cache. Available for \
         Valkey and Redis OSS only. Default is NULL.\n"]
  subnet_ids : subnet_ids_list option;
      [@ocaml.doc
        "A list of the identifiers of the subnets where the VPC endpoint for the serverless cache \
         will be deployed. All the subnetIds must belong to the same VPC.\n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which ElastiCache retains automatic snapshots before deleting \
         them. Available for Valkey, Redis OSS and Serverless Memcached only. The maximum value \
         allowed is 35 days.\n"]
  daily_snapshot_time : string_ option;
      [@ocaml.doc
        "The daily time that snapshots will be created from the new serverless cache. By default \
         this number is populated with 0, i.e. no snapshots will be created on an automatic daily \
         basis. Available for Valkey, Redis OSS and Serverless Memcached only.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "The IP protocol version used by the serverless cache. Must be either [ipv4] | [ipv6] | \
         [dual_stack]. [ipv6] is only supported with IPv6-only subnets. If not specified, defaults \
         to [ipv4], unless all provided subnets are IPv6-only, in which case it defaults to \
         [ipv6]. \n"]
}
[@@ocaml.doc ""]

type nonrec replication_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified replication group already exists.\n"]

type nonrec create_replication_group_result = {
  replication_group : replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec user_group_id_list_input = user_group_id list [@@ocaml.doc ""]

type nonrec node_group_configuration_list = node_group_configuration list [@@ocaml.doc ""]

type nonrec create_replication_group_message = {
  replication_group_id : string_;
      [@ocaml.doc
        "The replication group identifier. This parameter is stored as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  A name must contain from 1 to 40 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  A name cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  replication_group_description : string_;
      [@ocaml.doc "A user-created description for the replication group.\n"]
  global_replication_group_id : string_ option; [@ocaml.doc "The name of the Global datastore\n"]
  primary_cluster_id : string_ option;
      [@ocaml.doc
        "The identifier of the cluster that serves as the primary for this replication group. This \
         cluster must already exist and have a status of [available].\n\n\
        \ This parameter is not required if [NumCacheClusters], [NumNodeGroups], or \
         [ReplicasPerNodeGroup] is specified.\n\
        \ "]
  automatic_failover_enabled : boolean_optional option;
      [@ocaml.doc
        "Specifies whether a read-only replica is automatically promoted to read/write primary if \
         the existing primary fails.\n\n\
        \  [AutomaticFailoverEnabled] must be enabled for Valkey or Redis OSS (cluster mode \
         enabled) replication groups.\n\
        \ \n\
        \  Default: false\n\
        \  "]
  multi_az_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag indicating if you have Multi-AZ enabled to enhance fault tolerance. For more \
         information, see \
         {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/AutoFailover.html}Minimizing \
         Downtime: Multi-AZ}.\n"]
  num_cache_clusters : integer_optional option;
      [@ocaml.doc
        "The number of clusters this replication group initially has.\n\n\
        \ This parameter is not used if there is more than one node group (shard). You should use \
         [ReplicasPerNodeGroup] instead.\n\
        \ \n\
        \  If [AutomaticFailoverEnabled] is [true], the value of this parameter must be at least \
         2. If [AutomaticFailoverEnabled] is [false] you can omit this parameter (it will default \
         to 1), or you can explicitly set it to a value between 2 and 6.\n\
        \  \n\
        \   The maximum permitted value for [NumCacheClusters] is 6 (1 primary plus 5 replicas).\n\
        \   "]
  preferred_cache_cluster_a_zs : availability_zones_list option;
      [@ocaml.doc
        "A list of EC2 Availability Zones in which the replication group's clusters are created. \
         The order of the Availability Zones in the list is the order in which clusters are \
         allocated. The primary cluster is created in the first AZ in the list.\n\n\
        \ This parameter is not used if there is more than one node group (shard). You should use \
         [NodeGroupConfiguration] instead.\n\
        \ \n\
        \   If you are creating your replication group in an Amazon VPC (recommended), you can \
         only locate clusters in Availability Zones associated with the subnets in the selected \
         subnet group.\n\
        \   \n\
        \    The number of Availability Zones listed must equal the value of [NumCacheClusters].\n\
        \    \n\
        \      Default: system chosen Availability Zones.\n\
        \      "]
  num_node_groups : integer_optional option;
      [@ocaml.doc
        "An optional parameter that specifies the number of node groups (shards) for this Valkey \
         or Redis OSS (cluster mode enabled) replication group. For Valkey or Redis OSS (cluster \
         mode disabled) either omit this parameter or set it to 1.\n\n\
        \ Default: 1\n\
        \ "]
  replicas_per_node_group : integer_optional option;
      [@ocaml.doc
        "An optional parameter that specifies the number of replica nodes in each node group \
         (shard). Valid values are 0 to 5.\n"]
  node_group_configuration : node_group_configuration_list option;
      [@ocaml.doc
        "A list of node group (shard) configuration options. Each node group (shard) configuration \
         has the following members: [PrimaryAvailabilityZone], [ReplicaAvailabilityZones], \
         [ReplicaCount], and [Slots].\n\n\
        \ If you're creating a Valkey or Redis OSS (cluster mode disabled) or a Valkey or Redis \
         OSS (cluster mode enabled) replication group, you can use this parameter to individually \
         configure each node group (shard), or you can omit this parameter. However, it is \
         required when seeding a Valkey or Redis OSS (cluster mode enabled) cluster from a S3 rdb \
         file. You must configure each node group (shard) using this parameter because you must \
         specify the slots for each node group.\n\
        \ "]
  cache_node_type : string_ option;
      [@ocaml.doc
        "The compute and memory capacity of the nodes in the node group (shard).\n\n\
        \ The following node types are supported by ElastiCache. Generally speaking, the current \
         generation types provide more memory and computational power at lower cost when compared \
         to their equivalent previous generation counterparts.\n\
        \ \n\
        \  {ul\n\
        \        {-  General purpose:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b M7g node types}: [cache.m7g.large], [cache.m7g.xlarge], \
         [cache.m7g.2xlarge], [cache.m7g.4xlarge], [cache.m7g.8xlarge], [cache.m7g.12xlarge], \
         [cache.m7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b M6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.m6g.large], \
         [cache.m6g.xlarge], [cache.m6g.2xlarge], [cache.m6g.4xlarge], [cache.m6g.8xlarge], \
         [cache.m6g.12xlarge], [cache.m6g.16xlarge] \n\
        \                            \n\
        \                              {b M5 node types:} [cache.m5.large], [cache.m5.xlarge], \
         [cache.m5.2xlarge], [cache.m5.4xlarge], [cache.m5.12xlarge], [cache.m5.24xlarge] \n\
        \                             \n\
        \                               {b M4 node types:} [cache.m4.large], [cache.m4.xlarge], \
         [cache.m4.2xlarge], [cache.m4.4xlarge], [cache.m4.10xlarge] \n\
        \                              \n\
        \                                {b T4g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and Memcached engine version 1.5.16 onward): [cache.t4g.micro], \
         [cache.t4g.small], [cache.t4g.medium] \n\
        \                               \n\
        \                                 {b T3 node types:} [cache.t3.micro], [cache.t3.small], \
         [cache.t3.medium] \n\
        \                                \n\
        \                                  {b T2 node types:} [cache.t2.micro], [cache.t2.small], \
         [cache.t2.medium] \n\
        \                                 \n\
        \                                  }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b T1 node types:} [cache.t1.micro] \n\
        \                        \n\
        \                          {b M1 node types:} [cache.m1.small], [cache.m1.medium], \
         [cache.m1.large], [cache.m1.xlarge] \n\
        \                         \n\
        \                           {b M3 node types:} [cache.m3.medium], [cache.m3.large], \
         [cache.m3.xlarge], [cache.m3.2xlarge] \n\
        \                          \n\
        \                           }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Compute optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b C1 node types:} [cache.c1.xlarge] \n\
        \                        \n\
        \                         }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Memory optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b R7g node types}: [cache.r7g.large], [cache.r7g.xlarge], \
         [cache.r7g.2xlarge], [cache.r7g.4xlarge], [cache.r7g.8xlarge], [cache.r7g.12xlarge], \
         [cache.r7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b R6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.r6g.large], \
         [cache.r6g.xlarge], [cache.r6g.2xlarge], [cache.r6g.4xlarge], [cache.r6g.8xlarge], \
         [cache.r6g.12xlarge], [cache.r6g.16xlarge] \n\
        \                            \n\
        \                              {b R5 node types:} [cache.r5.large], [cache.r5.xlarge], \
         [cache.r5.2xlarge], [cache.r5.4xlarge], [cache.r5.12xlarge], [cache.r5.24xlarge] \n\
        \                             \n\
        \                               {b R4 node types:} [cache.r4.large], [cache.r4.xlarge], \
         [cache.r4.2xlarge], [cache.r4.4xlarge], [cache.r4.8xlarge], [cache.r4.16xlarge] \n\
        \                              \n\
        \                               }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b M2 node types:} [cache.m2.xlarge], [cache.m2.2xlarge], \
         [cache.m2.4xlarge] \n\
        \                        \n\
        \                          {b R3 node types:} [cache.r3.large], [cache.r3.xlarge], \
         [cache.r3.2xlarge], [cache.r3.4xlarge], [cache.r3.8xlarge] \n\
        \                         \n\
        \                          }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \    {b Additional node type info} \n\
        \   \n\
        \    {ul\n\
        \          {-  All current generation instance types are created in Amazon VPC by default.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS append-only files (AOF) are not supported for T1 or T2 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS Multi-AZ with automatic failover is not supported on T1 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  The configuration variables [appendonly] and [appendfsync] are not \
         supported on Valkey, or on Redis OSS version 2.8.22 and later.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  engine : string_ option;
      [@ocaml.doc
        "The name of the cache engine to be used for the clusters in this replication group. The \
         value must be set to [valkey] or [redis].\n"]
  engine_version : string_ option;
      [@ocaml.doc
        "The version number of the cache engine to be used for the clusters in this replication \
         group. To view the supported cache engine versions, use the [DescribeCacheEngineVersions] \
         operation.\n\n\
        \  {b Important:} You can upgrade to a newer engine version (see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/SelectEngine.html#VersionManagement}Selecting \
         a Cache Engine and Version}) in the {i ElastiCache User Guide}, but you cannot downgrade \
         to an earlier engine version. If you want to use an earlier engine version, you must \
         delete the existing cluster or replication group and create it anew with the earlier \
         engine version. \n\
        \ "]
  cache_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the parameter group to associate with this replication group. If this \
         argument is omitted, the default cache parameter group for the specified engine is used.\n\n\
        \ If you are running Valkey or Redis OSS version 3.2.4 or later, only one node group \
         (shard), and want to use a default parameter group, we recommend that you specify the \
         parameter group by name. \n\
        \ \n\
        \  {ul\n\
        \        {-  To create a Valkey or Redis OSS (cluster mode disabled) replication group, \
         use [CacheParameterGroupName=default.redis3.2].\n\
        \            \n\
        \             }\n\
        \        {-  To create a Valkey or Redis OSS (cluster mode enabled) replication group, use \
         [CacheParameterGroupName=default.redis3.2.cluster.on].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  cache_subnet_group_name : string_ option;
      [@ocaml.doc
        "The name of the cache subnet group to be used for the replication group.\n\n\
        \  If you're going to launch your cluster in an Amazon VPC, you need to create a subnet \
         group before you start creating a cluster. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/SubnetGroups.html}Subnets and \
         Subnet Groups}.\n\
        \  \n\
        \   "]
  cache_security_group_names : cache_security_group_name_list option;
      [@ocaml.doc
        "A list of cache security group names to associate with this replication group.\n"]
  security_group_ids : security_group_ids_list option;
      [@ocaml.doc
        "One or more Amazon VPC security groups associated with this replication group.\n\n\
        \ Use this parameter only when you are creating a replication group in an Amazon Virtual \
         Private Cloud (Amazon VPC).\n\
        \ "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. Tags are comma-separated key,value pairs \
         (e.g. Key=[myKey], Value=[myKeyValue]. You can include multiple tags as shown following: \
         Key=[myKey], Value=[myKeyValue] Key=[mySecondKey], Value=[mySecondKeyValue]. Tags on \
         replication groups will be replicated to all nodes.\n"]
  snapshot_arns : snapshot_arns_list option;
      [@ocaml.doc
        "A list of Amazon Resource Names (ARN) that uniquely identify the Valkey or Redis OSS RDB \
         snapshot files stored in Amazon S3. The snapshot files are used to populate the new \
         replication group. The Amazon S3 object name in the ARN cannot contain any commas. The \
         new replication group will have the number of node groups (console: shards) specified by \
         the parameter {i NumNodeGroups} or the number of node groups configured by {i \
         NodeGroupConfiguration} regardless of the number of ARNs specified here.\n\n\
        \ Example of an Amazon S3 ARN: [arn:aws:s3:::my_bucket/snapshot1.rdb] \n\
        \ "]
  snapshot_name : string_ option;
      [@ocaml.doc
        "The name of a snapshot from which to restore data into the new replication group. The \
         snapshot status changes to [restoring] while the new replication group is being created.\n"]
  preferred_maintenance_window : string_ option;
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
  port : integer_optional option;
      [@ocaml.doc
        "The port number on which each member of the replication group accepts connections.\n"]
  notification_topic_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to \
         which notifications are sent.\n\n\
        \  The Amazon SNS topic owner must be the same as the cluster owner.\n\
        \  \n\
        \   "]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "\194\160If you are running Valkey 7.2 and above or Redis OSS engine version 6.0 and \
         above, set this parameter to yes to opt-in to the next auto minor version upgrade \
         campaign. This parameter is disabled for previous versions.\194\160 \n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which ElastiCache retains automatic snapshots before deleting \
         them. For example, if you set [SnapshotRetentionLimit] to 5, a snapshot that was taken \
         today is retained for 5 days before being deleted.\n\n\
        \ Default: 0 (i.e., automatic backups are disabled for this cluster).\n\
        \ "]
  snapshot_window : string_ option;
      [@ocaml.doc
        "The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of \
         your node group (shard).\n\n\
        \ Example: [05:00-09:00] \n\
        \ \n\
        \  If you do not specify this parameter, ElastiCache automatically chooses an appropriate \
         time range.\n\
        \  "]
  auth_token : string_ option;
      [@ocaml.doc
        " {b Reserved parameter.} The password used to access a password protected server.\n\n\
        \  [AuthToken] can be specified only on replication groups where \
         [TransitEncryptionEnabled] is [true].\n\
        \ \n\
        \   For HIPAA compliance, you must specify [TransitEncryptionEnabled] as [true], an \
         [AuthToken], and a [CacheSubnetGroup].\n\
        \   \n\
        \     Password constraints:\n\
        \     \n\
        \      {ul\n\
        \            {-  Must be only printable ASCII characters.\n\
        \                \n\
        \                 }\n\
        \            {-  Must be at least 16 characters and no more than 128 characters in length.\n\
        \                \n\
        \                 }\n\
        \            {-  The only permitted printable special characters are !, &, #, $, ^, <, >, \
         and -. Other printable special characters cannot be used in the AUTH token.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   For more information, see {{:http://redis.io/commands/AUTH}AUTH password} at \
         http://redis.io/commands/AUTH.\n\
        \   "]
  transit_encryption_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables in-transit encryption when set to [true].\n\n\
        \ This parameter is valid only if the [Engine] parameter is [redis], the [EngineVersion] \
         parameter is [3.2.6], [4.x] or later, and the cluster is being created in an Amazon VPC.\n\
        \ \n\
        \  If you enable in-transit encryption, you must also specify a value for \
         [CacheSubnetGroup].\n\
        \  \n\
        \    {b Required:} Only available when creating a replication group in an Amazon VPC using \
         Redis OSS version [3.2.6], [4.x] or later.\n\
        \   \n\
        \    Default: [false] \n\
        \    \n\
        \      For HIPAA compliance, you must specify [TransitEncryptionEnabled] as [true], an \
         [AuthToken], and a [CacheSubnetGroup].\n\
        \      \n\
        \       "]
  at_rest_encryption_enabled : boolean_optional option;
      [@ocaml.doc
        "A flag that enables encryption at-rest on the replication group when set to [true]. In \
         some cases, encryption at-rest may be enabled even when this value is false. Use \
         [StorageEncryptionType] to view the effective encryption state of a cluster.\n\n\
        \ You cannot modify the value of [AtRestEncryptionEnabled] after the replication group is \
         created.\n\
        \ \n\
        \  Default: [true] when using Valkey, [false] when using Redis OSS\n\
        \  "]
  kms_key_id : string_ option;
      [@ocaml.doc "The ID of the KMS key used to encrypt the disk in the cluster.\n"]
  user_group_ids : user_group_id_list_input option;
      [@ocaml.doc "The user group to associate with the replication group.\n"]
  log_delivery_configurations : log_delivery_configuration_request_list option;
      [@ocaml.doc "Specifies the destination, format and type of the logs.\n"]
  data_tiering_enabled : boolean_optional option;
      [@ocaml.doc
        "Enables data tiering. Data tiering is only supported for replication groups using the \
         r6gd node type. This parameter must be set to true when using r6gd nodes. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/data-tiering.html}Data \
         tiering}.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Must be either [ipv4] | [ipv6] | [dual_stack]. IPv6 is supported for workloads using \
         Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 and Memcached engine version \
         1.6.6 and above on all instances built on the {{:http://aws.amazon.com/ec2/nitro/}Nitro \
         system}.\n"]
  ip_discovery : ip_discovery option;
      [@ocaml.doc
        "The network type you choose when creating a replication group, either [ipv4] | [ipv6]. \
         IPv6 is supported for workloads using Valkey 7.2 and above, Redis OSS engine version 6.2 \
         to 7.1 or Memcached engine version 1.6.6 and above on all instances built on the \
         {{:http://aws.amazon.com/ec2/nitro/}Nitro system}.\n"]
  transit_encryption_mode : transit_encryption_mode option;
      [@ocaml.doc
        "A setting that allows you to migrate your clients to use in-transit encryption, with no \
         downtime.\n\n\
        \ When setting [TransitEncryptionEnabled] to [true], you can set your \
         [TransitEncryptionMode] to [preferred] in the same request, to allow both encrypted and \
         unencrypted connections at the same time. Once you migrate all your Valkey or Redis OSS \
         clients to use encrypted connections you can modify the value to [required] to allow \
         encrypted connections only.\n\
        \ \n\
        \  Setting [TransitEncryptionMode] to [required] is a two-step process that requires you \
         to first set the [TransitEncryptionMode] to [preferred], after that you can set \
         [TransitEncryptionMode] to [required].\n\
        \  \n\
        \   This process will not trigger the replacement of the replication group.\n\
        \   "]
  cluster_mode : cluster_mode option;
      [@ocaml.doc
        "Enabled or Disabled. To modify cluster mode from Disabled to Enabled, you must first set \
         the cluster mode to Compatible. Compatible mode allows your Valkey or Redis OSS clients \
         to connect using both cluster mode enabled and cluster mode disabled. After you migrate \
         all Valkey or Redis OSS clients to use cluster mode enabled, you can then complete \
         cluster mode configuration and set the cluster mode to Enabled.\n"]
  serverless_cache_snapshot_name : string_ option;
      [@ocaml.doc
        "The name of the snapshot used to create a replication group. Available for Valkey, Redis \
         OSS only.\n"]
  durability : durability option;
      [@ocaml.doc
        "Specifies the durability setting for the replication group. When set to [default], the \
         service determines the effective durability based on the engine version, cluster mode, \
         and other parameters. The resolved setting is reflected in the [EffectiveDurability] \
         property of the replication group. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/durability.html}Durability}.\n"]
}
[@@ocaml.doc "Represents the input of a [CreateReplicationGroup] operation.\n"]

type nonrec global_replication_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The Global datastore name already exists.\n"]

type nonrec create_global_replication_group_result = {
  global_replication_group : global_replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_global_replication_group_message = {
  global_replication_group_id_suffix : string_;
      [@ocaml.doc
        "The suffix name of a Global datastore. Amazon ElastiCache automatically applies a prefix \
         to the Global datastore ID when it is created. Each Amazon Region has its own prefix. For \
         instance, a Global datastore ID created in the US-West-1 region will begin with \"dsdfu\" \
         along with the suffix name you provide. The suffix, combined with the auto-generated \
         prefix, guarantees uniqueness of the Global datastore name across multiple regions. \n\n\
        \ For a full list of Amazon Regions and their respective Global datastore iD prefixes, see \
         {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Redis-Global-Datastores-CLI.html}Using \
         the Amazon CLI with Global datastores }.\n\
        \ "]
  global_replication_group_description : string_ option;
      [@ocaml.doc "Provides details of the Global datastore\n"]
  primary_replication_group_id : string_;
      [@ocaml.doc
        "The name of the primary cluster that accepts writes and will replicate updates to the \
         secondary cluster. This value is stored as a lowercase string.\n"]
}
[@@ocaml.doc ""]

type nonrec cache_subnet_group_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the allowed number of cache subnet \
   groups.\n"]

type nonrec cache_subnet_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested cache subnet group name is already in use by an existing cache subnet group.\n"]

type nonrec create_cache_subnet_group_result = {
  cache_subnet_group : cache_subnet_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_cache_subnet_group_message = {
  cache_subnet_group_name : string_;
      [@ocaml.doc
        "A name for the cache subnet group. This value is stored as a lowercase string.\n\n\
        \ Constraints: Must contain no more than 255 alphanumeric characters or hyphens.\n\
        \ \n\
        \  Example: [mysubnetgroup] \n\
        \  "]
  cache_subnet_group_description : string_;
      [@ocaml.doc "A description for the cache subnet group.\n"]
  subnet_ids : subnet_identifier_list;
      [@ocaml.doc "A list of VPC subnet IDs for the cache subnet group.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
}
[@@ocaml.doc "Represents the input of a [CreateCacheSubnetGroup] operation.\n"]

type nonrec cache_security_group_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the allowed number of cache security \
   groups.\n"]

type nonrec cache_security_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A cache security group with the specified name already exists.\n"]

type nonrec create_cache_security_group_result = {
  cache_security_group : cache_security_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_cache_security_group_message = {
  cache_security_group_name : string_;
      [@ocaml.doc
        "A name for the cache security group. This value is stored as a lowercase string.\n\n\
        \ Constraints: Must contain no more than 255 alphanumeric characters. Cannot be the word \
         \"Default\".\n\
        \ \n\
        \  Example: [mysecuritygroup] \n\
        \  "]
  description : string_; [@ocaml.doc "A description for the cache security group.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
}
[@@ocaml.doc "Represents the input of a [CreateCacheSecurityGroup] operation.\n"]

type nonrec cache_parameter_group_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be processed because it would exceed the maximum number of cache security \
   groups.\n"]

type nonrec cache_parameter_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A cache parameter group with the requested name already exists.\n"]

type nonrec create_cache_parameter_group_result = {
  cache_parameter_group : cache_parameter_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_cache_parameter_group_message = {
  cache_parameter_group_name : string_;
      [@ocaml.doc
        "A user-specified name for the cache parameter group. This value is stored as a lowercase \
         string.\n"]
  cache_parameter_group_family : string_;
      [@ocaml.doc
        "The name of the cache parameter group family that the cache parameter group can be used \
         with.\n\n\
        \ Valid values are: [valkey8] | [valkey7] | [memcached1.4] | [memcached1.5] | \
         [memcached1.6] | [redis2.6] | [redis2.8] | [redis3.2] | [redis4.0] | [redis5.0] | \
         [redis6.x] | [redis7] \n\
        \ "]
  description : string_;
      [@ocaml.doc "A user-specified description for the cache parameter group.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
}
[@@ocaml.doc "Represents the input of a [CreateCacheParameterGroup] operation.\n"]

type nonrec cache_cluster_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You already have a cluster with the given identifier.\n"]

type nonrec create_cache_cluster_result = { cache_cluster : cache_cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec outpost_mode = SINGLE_OUTPOST [@ocaml.doc ""] | CROSS_OUTPOST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_cache_cluster_message = {
  cache_cluster_id : string_;
      [@ocaml.doc
        "The node group (shard) identifier. This parameter is stored as a lowercase string.\n\n\
        \  {b Constraints:} \n\
        \ \n\
        \  {ul\n\
        \        {-  A name must contain from 1 to 50 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  A name cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  replication_group_id : string_ option;
      [@ocaml.doc
        "The ID of the replication group to which this cluster should belong. If this parameter is \
         specified, the cluster is added to the specified replication group as a read replica; \
         otherwise, the cluster is a standalone primary that is not part of any replication \
         group.\n\n\
        \ If the specified replication group is Multi-AZ enabled and the Availability Zone is not \
         specified, the cluster is created in Availability Zones that provide the best spread of \
         read replicas across Availability Zones.\n\
        \ \n\
        \   This parameter is only valid if the [Engine] parameter is [redis].\n\
        \   \n\
        \    "]
  az_mode : az_mode option;
      [@ocaml.doc
        "Specifies whether the nodes in this Memcached cluster are created in a single \
         Availability Zone or created across multiple Availability Zones in the cluster's region.\n\n\
        \ This parameter is only supported for Memcached clusters.\n\
        \ \n\
        \  If the [AZMode] and [PreferredAvailabilityZones] are not specified, ElastiCache assumes \
         [single-az] mode.\n\
        \  "]
  preferred_availability_zone : string_ option;
      [@ocaml.doc
        "The EC2 Availability Zone in which the cluster is created.\n\n\
        \ All nodes belonging to this cluster are placed in the preferred Availability Zone. If \
         you want to create your nodes across multiple Availability Zones, use \
         [PreferredAvailabilityZones].\n\
        \ \n\
        \  Default: System chosen Availability Zone.\n\
        \  "]
  preferred_availability_zones : preferred_availability_zone_list option;
      [@ocaml.doc
        "A list of the Availability Zones in which cache nodes are created. The order of the zones \
         in the list is not important.\n\n\
        \ This option is only supported on Memcached.\n\
        \ \n\
        \   If you are creating your cluster in an Amazon VPC (recommended) you can only locate \
         nodes in Availability Zones that are associated with the subnets in the selected subnet \
         group.\n\
        \   \n\
        \    The number of Availability Zones listed must equal the value of [NumCacheNodes].\n\
        \    \n\
        \      If you want all the nodes in the same Availability Zone, use \
         [PreferredAvailabilityZone] instead, or repeat the Availability Zone multiple times in \
         the list.\n\
        \      \n\
        \       Default: System chosen Availability Zones.\n\
        \       "]
  num_cache_nodes : integer_optional option;
      [@ocaml.doc
        "The initial number of cache nodes that the cluster has.\n\n\
        \ For clusters running Valkey or Redis OSS, this value must be 1. For clusters running \
         Memcached, this value must be between 1 and 40.\n\
        \ \n\
        \  If you need more than 40 nodes for your Memcached cluster, please fill out the \
         ElastiCache Limit Increase Request form at \
         {{:http://aws.amazon.com/contact-us/elasticache-node-limit-request/}http://aws.amazon.com/contact-us/elasticache-node-limit-request/}.\n\
        \  "]
  cache_node_type : string_ option;
      [@ocaml.doc
        "The compute and memory capacity of the nodes in the node group (shard).\n\n\
        \ The following node types are supported by ElastiCache. Generally speaking, the current \
         generation types provide more memory and computational power at lower cost when compared \
         to their equivalent previous generation counterparts.\n\
        \ \n\
        \  {ul\n\
        \        {-  General purpose:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b M7g node types}: [cache.m7g.large], [cache.m7g.xlarge], \
         [cache.m7g.2xlarge], [cache.m7g.4xlarge], [cache.m7g.8xlarge], [cache.m7g.12xlarge], \
         [cache.m7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b M6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.m6g.large], \
         [cache.m6g.xlarge], [cache.m6g.2xlarge], [cache.m6g.4xlarge], [cache.m6g.8xlarge], \
         [cache.m6g.12xlarge], [cache.m6g.16xlarge] \n\
        \                            \n\
        \                              {b M5 node types:} [cache.m5.large], [cache.m5.xlarge], \
         [cache.m5.2xlarge], [cache.m5.4xlarge], [cache.m5.12xlarge], [cache.m5.24xlarge] \n\
        \                             \n\
        \                               {b M4 node types:} [cache.m4.large], [cache.m4.xlarge], \
         [cache.m4.2xlarge], [cache.m4.4xlarge], [cache.m4.10xlarge] \n\
        \                              \n\
        \                                {b T4g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and Memcached engine version 1.5.16 onward): [cache.t4g.micro], \
         [cache.t4g.small], [cache.t4g.medium] \n\
        \                               \n\
        \                                 {b T3 node types:} [cache.t3.micro], [cache.t3.small], \
         [cache.t3.medium] \n\
        \                                \n\
        \                                  {b T2 node types:} [cache.t2.micro], [cache.t2.small], \
         [cache.t2.medium] \n\
        \                                 \n\
        \                                  }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b T1 node types:} [cache.t1.micro] \n\
        \                        \n\
        \                          {b M1 node types:} [cache.m1.small], [cache.m1.medium], \
         [cache.m1.large], [cache.m1.xlarge] \n\
        \                         \n\
        \                           {b M3 node types:} [cache.m3.medium], [cache.m3.large], \
         [cache.m3.xlarge], [cache.m3.2xlarge] \n\
        \                          \n\
        \                           }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Compute optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b C1 node types:} [cache.c1.xlarge] \n\
        \                        \n\
        \                         }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Memory optimized:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Current generation: \n\
        \                       \n\
        \                         {b R7g node types}: [cache.r7g.large], [cache.r7g.xlarge], \
         [cache.r7g.2xlarge], [cache.r7g.4xlarge], [cache.r7g.8xlarge], [cache.r7g.12xlarge], \
         [cache.r7g.16xlarge] \n\
        \                        \n\
        \                          For region availability, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/CacheNodes.SupportedTypes.html#CacheNodes.SupportedTypesByRegion}Supported \
         Node Types} \n\
        \                          \n\
        \                             {b R6g node types} (available only for Redis OSS engine \
         version 5.0.6 onward and for Memcached engine version 1.5.16 onward): [cache.r6g.large], \
         [cache.r6g.xlarge], [cache.r6g.2xlarge], [cache.r6g.4xlarge], [cache.r6g.8xlarge], \
         [cache.r6g.12xlarge], [cache.r6g.16xlarge] \n\
        \                            \n\
        \                              {b R5 node types:} [cache.r5.large], [cache.r5.xlarge], \
         [cache.r5.2xlarge], [cache.r5.4xlarge], [cache.r5.12xlarge], [cache.r5.24xlarge] \n\
        \                             \n\
        \                               {b R4 node types:} [cache.r4.large], [cache.r4.xlarge], \
         [cache.r4.2xlarge], [cache.r4.4xlarge], [cache.r4.8xlarge], [cache.r4.16xlarge] \n\
        \                              \n\
        \                               }\n\
        \                   {-  Previous generation: (not recommended. Existing clusters are still \
         supported but creation of new clusters is not supported for these types.)\n\
        \                       \n\
        \                         {b M2 node types:} [cache.m2.xlarge], [cache.m2.2xlarge], \
         [cache.m2.4xlarge] \n\
        \                        \n\
        \                          {b R3 node types:} [cache.r3.large], [cache.r3.xlarge], \
         [cache.r3.2xlarge], [cache.r3.4xlarge], [cache.r3.8xlarge] \n\
        \                         \n\
        \                          }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \    {b Additional node type info} \n\
        \   \n\
        \    {ul\n\
        \          {-  All current generation instance types are created in Amazon VPC by default.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS append-only files (AOF) are not supported for T1 or T2 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  Valkey or Redis OSS Multi-AZ with automatic failover is not supported on T1 \
         instances.\n\
        \              \n\
        \               }\n\
        \          {-  The configuration variables [appendonly] and [appendfsync] are not \
         supported on Valkey, or on Redis OSS version 2.8.22 and later.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  engine : string_ option;
      [@ocaml.doc
        "The name of the cache engine to be used for this cluster.\n\n\
        \ Valid values for this parameter are: [memcached] | [redis] \n\
        \ "]
  engine_version : string_ option;
      [@ocaml.doc
        "The version number of the cache engine to be used for this cluster. To view the supported \
         cache engine versions, use the DescribeCacheEngineVersions operation.\n\n\
        \  {b Important:} You can upgrade to a newer engine version (see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/SelectEngine.html#VersionManagement}Selecting \
         a Cache Engine and Version}), but you cannot downgrade to an earlier engine version. If \
         you want to use an earlier engine version, you must delete the existing cluster or \
         replication group and create it anew with the earlier engine version. \n\
        \ "]
  cache_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the parameter group to associate with this cluster. If this argument is \
         omitted, the default parameter group for the specified engine is used. You cannot use any \
         parameter group which has [cluster-enabled='yes'] when creating a cluster.\n"]
  cache_subnet_group_name : string_ option;
      [@ocaml.doc
        "The name of the subnet group to be used for the cluster.\n\n\
        \ Use this parameter only when you are creating a cluster in an Amazon Virtual Private \
         Cloud (Amazon VPC).\n\
        \ \n\
        \   If you're going to launch your cluster in an Amazon VPC, you need to create a subnet \
         group before you start creating a cluster. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/SubnetGroups.html}Subnets and \
         Subnet Groups}.\n\
        \   \n\
        \    "]
  cache_security_group_names : cache_security_group_name_list option;
      [@ocaml.doc
        "A list of security group names to associate with this cluster.\n\n\
        \ Use this parameter only when you are creating a cluster outside of an Amazon Virtual \
         Private Cloud (Amazon VPC).\n\
        \ "]
  security_group_ids : security_group_ids_list option;
      [@ocaml.doc
        "One or more VPC security groups associated with the cluster.\n\n\
        \ Use this parameter only when you are creating a cluster in an Amazon Virtual Private \
         Cloud (Amazon VPC).\n\
        \ "]
  tags : tag_list option; [@ocaml.doc "A list of tags to be added to this resource.\n"]
  snapshot_arns : snapshot_arns_list option;
      [@ocaml.doc
        "A single-element string list containing an Amazon Resource Name (ARN) that uniquely \
         identifies a Valkey or Redis OSS RDB snapshot file stored in Amazon S3. The snapshot file \
         is used to populate the node group (shard). The Amazon S3 object name in the ARN cannot \
         contain any commas.\n\n\
        \  This parameter is only valid if the [Engine] parameter is [redis].\n\
        \  \n\
        \    Example of an Amazon S3 ARN: [arn:aws:s3:::my_bucket/snapshot1.rdb] \n\
        \    "]
  snapshot_name : string_ option;
      [@ocaml.doc
        "The name of a Valkey or Redis OSS snapshot from which to restore data into the new node \
         group (shard). The snapshot status changes to [restoring] while the new node group \
         (shard) is being created.\n\n\
        \  This parameter is only valid if the [Engine] parameter is [redis].\n\
        \  \n\
        \   "]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "Specifies the weekly time range during which maintenance on the cluster is performed. It \
         is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The \
         minimum maintenance window is a 60 minute period. \n"]
  port : integer_optional option;
      [@ocaml.doc "The port number on which each of the cache nodes accepts connections.\n"]
  notification_topic_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic to \
         which notifications are sent.\n\n\
        \  The Amazon SNS topic owner must be the same as the cluster owner.\n\
        \  \n\
        \   "]
  auto_minor_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "\194\160If you are running Valkey 7.2 and above or Redis OSS engine version 6.0 and \
         above, set this parameter to yes to opt-in to the next auto minor version upgrade \
         campaign. This parameter is disabled for previous versions.\194\160 \n"]
  snapshot_retention_limit : integer_optional option;
      [@ocaml.doc
        "The number of days for which ElastiCache retains automatic snapshots before deleting \
         them. For example, if you set [SnapshotRetentionLimit] to 5, a snapshot taken today is \
         retained for 5 days before being deleted.\n\n\
        \  This parameter is only valid if the [Engine] parameter is [redis].\n\
        \  \n\
        \    Default: 0 (i.e., automatic backups are disabled for this cache cluster).\n\
        \    "]
  snapshot_window : string_ option;
      [@ocaml.doc
        "The daily time range (in UTC) during which ElastiCache begins taking a daily snapshot of \
         your node group (shard).\n\n\
        \ Example: [05:00-09:00] \n\
        \ \n\
        \  If you do not specify this parameter, ElastiCache automatically chooses an appropriate \
         time range.\n\
        \  \n\
        \    This parameter is only valid if the [Engine] parameter is [redis].\n\
        \    \n\
        \     "]
  auth_token : string_ option;
      [@ocaml.doc
        " {b Reserved parameter.} The password used to access a password protected server.\n\n\
        \ Password constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be only printable ASCII characters.\n\
        \            \n\
        \             }\n\
        \        {-  Must be at least 16 characters and no more than 128 characters in length.\n\
        \            \n\
        \             }\n\
        \        {-  The only permitted printable special characters are !, &, #, $, ^, <, >, and \
         -. Other printable special characters cannot be used in the AUTH token.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information, see {{:http://redis.io/commands/AUTH}AUTH password} at \
         http://redis.io/commands/AUTH.\n\
        \   "]
  outpost_mode : outpost_mode option;
      [@ocaml.doc
        "Specifies whether the nodes in the cluster are created in a single outpost or across \
         multiple outposts.\n"]
  preferred_outpost_arn : string_ option;
      [@ocaml.doc "The outpost ARN in which the cache cluster is created.\n"]
  preferred_outpost_arns : preferred_outpost_arn_list option;
      [@ocaml.doc "The outpost ARNs in which the cache cluster is created.\n"]
  log_delivery_configurations : log_delivery_configuration_request_list option;
      [@ocaml.doc "Specifies the destination, format and type of the logs. \n"]
  transit_encryption_enabled : boolean_optional option;
      [@ocaml.doc "A flag that enables in-transit encryption when set to true.\n"]
  network_type : network_type option;
      [@ocaml.doc
        "Must be either [ipv4] | [ipv6] | [dual_stack]. IPv6 is supported for workloads using \
         Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 and Memcached engine version \
         1.6.6 and above on all instances built on the {{:http://aws.amazon.com/ec2/nitro/}Nitro \
         system}. \n"]
  ip_discovery : ip_discovery option;
      [@ocaml.doc
        "The network type you choose when modifying a cluster, either [ipv4] | [ipv6]. IPv6 is \
         supported for workloads using Valkey 7.2 and above, Redis OSS engine version 6.2 to 7.1 \
         and Memcached engine version 1.6.6 and above on all instances built on the \
         {{:http://aws.amazon.com/ec2/nitro/}Nitro system}.\n"]
}
[@@ocaml.doc "Represents the input of a CreateCacheCluster operation.\n"]

type nonrec copy_snapshot_result = { snapshot : snapshot option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec copy_snapshot_message = {
  source_snapshot_name : string_;
      [@ocaml.doc "The name of an existing snapshot from which to make a copy.\n"]
  target_snapshot_name : string_;
      [@ocaml.doc
        "A name for the snapshot copy. ElastiCache does not permit overwriting a snapshot, \
         therefore this name must be unique within its context - ElastiCache or an Amazon S3 \
         bucket if exporting. This value is stored as a lowercase string.\n"]
  target_bucket : string_ option;
      [@ocaml.doc
        "The Amazon S3 bucket to which the snapshot is exported. This parameter is used only when \
         exporting a snapshot for external access.\n\n\
        \ When using this parameter to export a snapshot, be sure Amazon ElastiCache has the \
         needed permissions to this S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/backups-exporting.html#backups-exporting-grant-access}Step \
         2: Grant ElastiCache Access to Your Amazon S3 Bucket} in the {i Amazon ElastiCache User \
         Guide}.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/backups-exporting.html}Exporting \
         a Snapshot} in the {i Amazon ElastiCache User Guide}.\n\
        \  "]
  kms_key_id : string_ option;
      [@ocaml.doc "The ID of the KMS key used to encrypt the target snapshot.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to this resource. A tag is a key-value pair. A tag key must be \
         accompanied by a tag value, although null is accepted.\n"]
}
[@@ocaml.doc "Represents the input of a [CopySnapshotMessage] operation.\n"]

type nonrec copy_serverless_cache_snapshot_response = {
  serverless_cache_snapshot : serverless_cache_snapshot option;
      [@ocaml.doc
        "The response for the attempt to copy the serverless cache snapshot. Available for Valkey, \
         Redis OSS and Serverless Memcached only.\n"]
}
[@@ocaml.doc ""]

type nonrec copy_serverless_cache_snapshot_request = {
  source_serverless_cache_snapshot_name : string_;
      [@ocaml.doc
        "The identifier of the existing serverless cache\226\128\153s snapshot to be copied. \
         Available for Valkey, Redis OSS and Serverless Memcached only.\n"]
  target_serverless_cache_snapshot_name : string_;
      [@ocaml.doc
        "The identifier for the snapshot to be created. Available for Valkey, Redis OSS and \
         Serverless Memcached only. This value is stored as a lowercase string.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The identifier of the KMS key used to encrypt the target snapshot. Available for Valkey, \
         Redis OSS and Serverless Memcached only.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to be added to the target snapshot resource. A tag is a key-value pair. \
         Available for Valkey, Redis OSS and Serverless Memcached only. Default: NULL\n"]
}
[@@ocaml.doc ""]

type nonrec replication_group_not_under_migration_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The designated replication group is not available for data migration.\n"]

type nonrec complete_migration_response = {
  replication_group : replication_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec complete_migration_message = {
  replication_group_id : string_;
      [@ocaml.doc "The ID of the replication group to which data is being migrated.\n"]
  force : boolean_ option;
      [@ocaml.doc
        "Forces the migration to stop without ensuring that data is in sync. It is recommended to \
         use this option only to abort the migration and not recommended when application wants to \
         continue migration to ElastiCache.\n"]
}
[@@ocaml.doc ""]

type nonrec unprocessed_update_action = {
  replication_group_id : string_ option; [@ocaml.doc "The replication group ID\n"]
  cache_cluster_id : string_ option; [@ocaml.doc "The ID of the cache cluster\n"]
  service_update_name : string_ option; [@ocaml.doc "The unique ID of the service update\n"]
  error_type : string_ option; [@ocaml.doc "The error type for requests that are not processed\n"]
  error_message : string_ option;
      [@ocaml.doc "The error message that describes the reason the request was not processed\n"]
}
[@@ocaml.doc
  "Update action that has failed to be processed for the corresponding apply/stop request\n"]

type nonrec unprocessed_update_action_list = unprocessed_update_action list [@@ocaml.doc ""]

type nonrec processed_update_action = {
  replication_group_id : string_ option; [@ocaml.doc "The ID of the replication group\n"]
  cache_cluster_id : string_ option; [@ocaml.doc "The ID of the cache cluster\n"]
  service_update_name : string_ option; [@ocaml.doc "The unique ID of the service update\n"]
  update_action_status : update_action_status option;
      [@ocaml.doc "The status of the update action on the Valkey or Redis OSS cluster\n"]
}
[@@ocaml.doc "Update action that has been processed for the corresponding apply/stop request\n"]

type nonrec processed_update_action_list = processed_update_action list [@@ocaml.doc ""]

type nonrec update_action_results_message = {
  processed_update_actions : processed_update_action_list option;
      [@ocaml.doc "Update actions that have been processed successfully\n"]
  unprocessed_update_actions : unprocessed_update_action_list option;
      [@ocaml.doc "Update actions that haven't been processed successfully\n"]
}
[@@ocaml.doc ""]

type nonrec batch_stop_update_action_message = {
  replication_group_ids : replication_group_id_list option;
      [@ocaml.doc "The replication group IDs\n"]
  cache_cluster_ids : cache_cluster_id_list option; [@ocaml.doc "The cache cluster IDs\n"]
  service_update_name : string_; [@ocaml.doc "The unique ID of the service update\n"]
}
[@@ocaml.doc ""]

type nonrec batch_apply_update_action_message = {
  replication_group_ids : replication_group_id_list option;
      [@ocaml.doc "The replication group IDs\n"]
  cache_cluster_ids : cache_cluster_id_list option; [@ocaml.doc "The cache cluster IDs\n"]
  service_update_name : string_; [@ocaml.doc "The unique ID of the service update\n"]
}
[@@ocaml.doc ""]

type nonrec authorization_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified Amazon EC2 security group is already authorized for the specified cache security \
   group.\n"]

type nonrec authorize_cache_security_group_ingress_result = {
  cache_security_group : cache_security_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec authorize_cache_security_group_ingress_message = {
  cache_security_group_name : string_;
      [@ocaml.doc "The cache security group that allows network ingress.\n"]
  ec2_security_group_name : string_;
      [@ocaml.doc
        "The Amazon EC2 security group to be authorized for ingress to the cache security group.\n"]
  ec2_security_group_owner_id : string_;
      [@ocaml.doc
        "The Amazon account number of the Amazon EC2 security group owner. Note that this is not \
         the same thing as an Amazon access key ID - you must provide a valid Amazon account \
         number for this parameter.\n"]
}
[@@ocaml.doc "Represents the input of an AuthorizeCacheSecurityGroupIngress operation.\n"]
