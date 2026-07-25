open Types

module AuthorizeCacheSecurityGroupIngress : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
    | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
    | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    authorize_cache_security_group_ingress_message ->
    ( authorize_cache_security_group_ingress_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    authorize_cache_security_group_ingress_message ->
    ( authorize_cache_security_group_ingress_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows network ingress to a cache security group. Applications using ElastiCache must be \
   running on Amazon EC2, and Amazon EC2 security groups are used as the authorization mechanism.\n\n\
  \  You cannot authorize ingress from an Amazon EC2 security group in one region to an \
   ElastiCache cluster in another region.\n\
  \  \n\
  \   "]

module BatchApplyUpdateAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceUpdateNotFoundFault of service_update_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_apply_update_action_message ->
    ( update_action_results_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceUpdateNotFoundFault of service_update_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_apply_update_action_message ->
    ( update_action_results_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceUpdateNotFoundFault of service_update_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Apply the service update. For more information on service updates and applying them, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/applying-updates.html}Applying \
   Service Updates}.\n"]

module BatchStopUpdateAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceUpdateNotFoundFault of service_update_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_stop_update_action_message ->
    ( update_action_results_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceUpdateNotFoundFault of service_update_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_stop_update_action_message ->
    ( update_action_results_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceUpdateNotFoundFault of service_update_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stop the service update. For more information on service updates and stopping them, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/stopping-self-service-updates.html}Stopping \
   Service Updates}.\n"]

module CompleteMigration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
    | `ReplicationGroupNotUnderMigrationFault of replication_group_not_under_migration_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    complete_migration_message ->
    ( complete_migration_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ReplicationGroupNotUnderMigrationFault of replication_group_not_under_migration_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    complete_migration_message ->
    ( complete_migration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ReplicationGroupNotUnderMigrationFault of replication_group_not_under_migration_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Complete the migration of data.\n"]

module CopyServerlessCacheSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
    | `ServerlessCacheSnapshotAlreadyExistsFault of serverless_cache_snapshot_already_exists_fault
    | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
    | `ServerlessCacheSnapshotQuotaExceededFault of serverless_cache_snapshot_quota_exceeded_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_serverless_cache_snapshot_request ->
    ( copy_serverless_cache_snapshot_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `ServerlessCacheSnapshotAlreadyExistsFault of serverless_cache_snapshot_already_exists_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `ServerlessCacheSnapshotQuotaExceededFault of serverless_cache_snapshot_quota_exceeded_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_serverless_cache_snapshot_request ->
    ( copy_serverless_cache_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `ServerlessCacheSnapshotAlreadyExistsFault of serverless_cache_snapshot_already_exists_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `ServerlessCacheSnapshotQuotaExceededFault of serverless_cache_snapshot_quota_exceeded_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a copy of an existing serverless cache\226\128\153s snapshot. Available for Valkey, \
   Redis OSS and Serverless Memcached only.\n"]

module CopySnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
    | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
    | `SnapshotNotFoundFault of snapshot_not_found_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_snapshot_message ->
    ( copy_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_snapshot_message ->
    ( copy_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Makes a copy of an existing snapshot.\n\n\
  \  This operation is valid for Valkey or Redis OSS only.\n\
  \  \n\
  \     Users or groups that have permissions to use the [CopySnapshot] operation can create their \
   own Amazon S3 buckets and copy snapshots to it. To control access to your snapshots, use an IAM \
   policy to control who has the ability to use the [CopySnapshot] operation. For more information \
   about using IAM to control the use of ElastiCache operations, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/backups-exporting.html}Exporting \
   Snapshots} and \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/IAM.html}Authentication & Access \
   Control}.\n\
  \     \n\
  \       You could receive the following error messages.\n\
  \       \n\
  \         {b Error Messages} \n\
  \        \n\
  \         {ul\n\
  \               {-   {b Error Message:} The S3 bucket %s is outside of the region.\n\
  \                   \n\
  \                     {b Solution:} Create an Amazon S3 bucket in the same region as your \
   snapshot. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/backups-exporting.html#backups-exporting-create-s3-bucket}Step \
   1: Create an Amazon S3 Bucket} in the ElastiCache User Guide.\n\
  \                    \n\
  \                     }\n\
  \               {-   {b Error Message:} The S3 bucket %s does not exist.\n\
  \                   \n\
  \                     {b Solution:} Create an Amazon S3 bucket in the same region as your \
   snapshot. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/backups-exporting.html#backups-exporting-create-s3-bucket}Step \
   1: Create an Amazon S3 Bucket} in the ElastiCache User Guide.\n\
  \                    \n\
  \                     }\n\
  \               {-   {b Error Message:} The S3 bucket %s is not owned by the authenticated user.\n\
  \                   \n\
  \                     {b Solution:} Create an Amazon S3 bucket in the same region as your \
   snapshot. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/backups-exporting.html#backups-exporting-create-s3-bucket}Step \
   1: Create an Amazon S3 Bucket} in the ElastiCache User Guide.\n\
  \                    \n\
  \                     }\n\
  \               {-   {b Error Message:} The authenticated user does not have sufficient \
   permissions to perform the desired activity.\n\
  \                   \n\
  \                     {b Solution:} Contact your system administrator to get the needed \
   permissions.\n\
  \                    \n\
  \                     }\n\
  \               {-   {b Error Message:} The S3 bucket %s already contains an object with key %s.\n\
  \                   \n\
  \                     {b Solution:} Give the [TargetSnapshotName] a new and unique value. If \
   exporting a snapshot, you could alternatively create a new Amazon S3 bucket and use this same \
   value for [TargetSnapshotName].\n\
  \                    \n\
  \                     }\n\
  \               {-   {b Error Message: } ElastiCache has not been granted READ permissions %s on \
   the S3 Bucket.\n\
  \                   \n\
  \                     {b Solution:} Add List and Read permissions on the bucket. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/backups-exporting.html#backups-exporting-grant-access}Step \
   2: Grant ElastiCache Access to Your Amazon S3 Bucket} in the ElastiCache User Guide.\n\
  \                    \n\
  \                     }\n\
  \               {-   {b Error Message: } ElastiCache has not been granted WRITE permissions %s \
   on the S3 Bucket.\n\
  \                   \n\
  \                     {b Solution:} Add Upload/Delete permissions on the bucket. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/backups-exporting.html#backups-exporting-grant-access}Step \
   2: Grant ElastiCache Access to Your Amazon S3 Bucket} in the ElastiCache User Guide.\n\
  \                    \n\
  \                     }\n\
  \               {-   {b Error Message: } ElastiCache has not been granted READ_ACP permissions \
   %s on the S3 Bucket.\n\
  \                   \n\
  \                     {b Solution:} Add View Permissions on the bucket. For more information, \
   see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/backups-exporting.html#backups-exporting-grant-access}Step \
   2: Grant ElastiCache Access to Your Amazon S3 Bucket} in the ElastiCache User Guide.\n\
  \                    \n\
  \                     }\n\
  \               }\n\
  \  "]

module CreateCacheCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterAlreadyExistsFault of cache_cluster_already_exists_fault
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
    | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
    | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
    | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
    | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cache_cluster_message ->
    ( create_cache_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterAlreadyExistsFault of cache_cluster_already_exists_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cache_cluster_message ->
    ( create_cache_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterAlreadyExistsFault of cache_cluster_already_exists_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a cluster. All nodes in the cluster run the same protocol-compliant cache engine \
   software, either Memcached, Valkey or Redis OSS.\n\n\
  \ This operation is not supported for Valkey or Redis OSS (cluster mode enabled) clusters.\n\
  \ "]

module CreateCacheParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheParameterGroupAlreadyExistsFault of cache_parameter_group_already_exists_fault
    | `CacheParameterGroupQuotaExceededFault of cache_parameter_group_quota_exceeded_fault
    | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cache_parameter_group_message ->
    ( create_cache_parameter_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupAlreadyExistsFault of cache_parameter_group_already_exists_fault
      | `CacheParameterGroupQuotaExceededFault of cache_parameter_group_quota_exceeded_fault
      | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cache_parameter_group_message ->
    ( create_cache_parameter_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupAlreadyExistsFault of cache_parameter_group_already_exists_fault
      | `CacheParameterGroupQuotaExceededFault of cache_parameter_group_quota_exceeded_fault
      | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon ElastiCache cache parameter group. An ElastiCache cache parameter group is \
   a collection of parameters and their values that are applied to all of the nodes in any cluster \
   or replication group using the CacheParameterGroup.\n\n\
  \ A newly created CacheParameterGroup is an exact duplicate of the default parameter group for \
   the CacheParameterGroupFamily. To customize the newly created CacheParameterGroup you can \
   change the values of specific parameters. For more information, see:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyCacheParameterGroup.html}ModifyCacheParameterGroup} \
   in the ElastiCache API Reference.\n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/ParameterGroups.html}Parameters and \
   Parameter Groups} in the ElastiCache User Guide.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module CreateCacheSecurityGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheSecurityGroupAlreadyExistsFault of cache_security_group_already_exists_fault
    | `CacheSecurityGroupQuotaExceededFault of cache_security_group_quota_exceeded_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cache_security_group_message ->
    ( create_cache_security_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSecurityGroupAlreadyExistsFault of cache_security_group_already_exists_fault
      | `CacheSecurityGroupQuotaExceededFault of cache_security_group_quota_exceeded_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cache_security_group_message ->
    ( create_cache_security_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSecurityGroupAlreadyExistsFault of cache_security_group_already_exists_fault
      | `CacheSecurityGroupQuotaExceededFault of cache_security_group_quota_exceeded_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new cache security group. Use a cache security group to control access to one or more \
   clusters.\n\n\
  \ Cache security groups are only used when you are creating a cluster outside of an Amazon \
   Virtual Private Cloud (Amazon VPC). If you are creating a cluster inside of a VPC, use a cache \
   subnet group instead. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSubnetGroup.html}CreateCacheSubnetGroup}.\n\
  \ "]

module CreateCacheSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheSubnetGroupAlreadyExistsFault of cache_subnet_group_already_exists_fault
    | `CacheSubnetGroupQuotaExceededFault of cache_subnet_group_quota_exceeded_fault
    | `CacheSubnetQuotaExceededFault of cache_subnet_quota_exceeded_fault
    | `InvalidSubnet of invalid_subnet
    | `SubnetNotAllowedFault of subnet_not_allowed_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cache_subnet_group_message ->
    ( create_cache_subnet_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSubnetGroupAlreadyExistsFault of cache_subnet_group_already_exists_fault
      | `CacheSubnetGroupQuotaExceededFault of cache_subnet_group_quota_exceeded_fault
      | `CacheSubnetQuotaExceededFault of cache_subnet_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet
      | `SubnetNotAllowedFault of subnet_not_allowed_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cache_subnet_group_message ->
    ( create_cache_subnet_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSubnetGroupAlreadyExistsFault of cache_subnet_group_already_exists_fault
      | `CacheSubnetGroupQuotaExceededFault of cache_subnet_group_quota_exceeded_fault
      | `CacheSubnetQuotaExceededFault of cache_subnet_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet
      | `SubnetNotAllowedFault of subnet_not_allowed_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new cache subnet group.\n\n\
  \ Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud \
   (Amazon VPC).\n\
  \ "]

module CreateGlobalReplicationGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalReplicationGroupAlreadyExistsFault of global_replication_group_already_exists_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_global_replication_group_message ->
    ( create_global_replication_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupAlreadyExistsFault of global_replication_group_already_exists_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_global_replication_group_message ->
    ( create_global_replication_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupAlreadyExistsFault of global_replication_group_already_exists_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Global Datastore offers fully managed, fast, reliable and secure cross-region replication. \
   Using Global Datastore with Valkey or Redis OSS, you can create cross-region read replica \
   clusters for ElastiCache to enable low-latency reads and disaster recovery across regions. For \
   more information, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Redis-Global-Datastore.html}Replication \
   Across Regions Using Global Datastore}. \n\n\
  \ {ul\n\
  \       {-  The {b GlobalReplicationGroupIdSuffix} is the name of the Global datastore.\n\
  \           \n\
  \            }\n\
  \       {-  The {b PrimaryReplicationGroupId} represents the name of the primary cluster that \
   accepts writes and will replicate updates to the secondary cluster.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module CreateReplicationGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
    | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
    | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
    | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
    | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
    | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
    | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidUserGroupStateFault of invalid_user_group_state_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NodeGroupsPerReplicationGroupQuotaExceededFault of
      node_groups_per_replication_group_quota_exceeded_fault
    | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
    | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
    | `ReplicationGroupAlreadyExistsFault of replication_group_already_exists_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
    | `UserGroupNotFoundFault of user_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_replication_group_message ->
    ( create_replication_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeGroupsPerReplicationGroupQuotaExceededFault of
        node_groups_per_replication_group_quota_exceeded_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ReplicationGroupAlreadyExistsFault of replication_group_already_exists_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserGroupNotFoundFault of user_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_replication_group_message ->
    ( create_replication_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeGroupsPerReplicationGroupQuotaExceededFault of
        node_groups_per_replication_group_quota_exceeded_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ReplicationGroupAlreadyExistsFault of replication_group_already_exists_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserGroupNotFoundFault of user_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Valkey or Redis OSS (cluster mode disabled) or a Valkey or Redis OSS (cluster mode \
   enabled) replication group.\n\n\
  \ This API can be used to create a standalone regional replication group or a secondary \
   replication group associated with a Global datastore.\n\
  \ \n\
  \  A Valkey or Redis OSS (cluster mode disabled) replication group is a collection of nodes, \
   where one of the nodes is a read/write primary and the others are read-only replicas. Writes to \
   the primary are asynchronously propagated to the replicas.\n\
  \  \n\
  \   A Valkey or Redis OSS cluster-mode enabled cluster is comprised of from 1 to 90 shards \
   (API/CLI: node groups). Each shard has a primary node and up to 5 read-only replica nodes. The \
   configuration can range from 90 shards and 0 replicas to 15 shards and 5 replicas, which is the \
   maximum number or replicas allowed. \n\
  \   \n\
  \    The node or shard limit can be increased to a maximum of 500 per cluster if the Valkey or \
   Redis OSS engine version is 5.0.6 or higher. For example, you can choose to configure a 500 \
   node cluster that ranges between 83 shards (one primary and 5 replicas per shard) and 500 \
   shards (single primary and no replicas). Make sure there are enough available IP addresses to \
   accommodate the increase. Common pitfalls include the subnets in the subnet group have too \
   small a CIDR range or the subnets are shared and heavily used by other clusters. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/SubnetGroups.Creating.html}Creating \
   a Subnet Group}. For versions below 5.0.6, the limit is 250 per cluster.\n\
  \    \n\
  \     To request a limit increase, see \
   {{:https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html}Amazon Service Limits} \
   and choose the limit type {b Nodes per cluster per instance type}. \n\
  \     \n\
  \      When a Valkey or Redis OSS (cluster mode disabled) replication group has been \
   successfully created, you can add one or more read replicas to it, up to a total of 5 read \
   replicas. If you need to increase or decrease the number of node groups (console: shards), you \
   can use scaling. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Scaling.html}Scaling self-designed \
   clusters} in the {i ElastiCache User Guide}.\n\
  \      \n\
  \        This operation is valid for Valkey and Redis OSS only.\n\
  \        \n\
  \         "]

module CreateServerlessCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidCredentialsException of invalid_credentials_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
    | `InvalidUserGroupStateFault of invalid_user_group_state_fault
    | `ServerlessCacheAlreadyExistsFault of serverless_cache_already_exists_fault
    | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
    | `ServerlessCacheQuotaForCustomerExceededFault of
      serverless_cache_quota_for_customer_exceeded_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
    | `UserGroupNotFoundFault of user_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_serverless_cache_request ->
    ( create_serverless_cache_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `ServerlessCacheAlreadyExistsFault of serverless_cache_already_exists_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheQuotaForCustomerExceededFault of
        serverless_cache_quota_for_customer_exceeded_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserGroupNotFoundFault of user_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_serverless_cache_request ->
    ( create_serverless_cache_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `ServerlessCacheAlreadyExistsFault of serverless_cache_already_exists_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheQuotaForCustomerExceededFault of
        serverless_cache_quota_for_customer_exceeded_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserGroupNotFoundFault of user_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a serverless cache.\n"]

module CreateServerlessCacheSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
    | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
    | `ServerlessCacheSnapshotAlreadyExistsFault of serverless_cache_snapshot_already_exists_fault
    | `ServerlessCacheSnapshotQuotaExceededFault of serverless_cache_snapshot_quota_exceeded_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_serverless_cache_snapshot_request ->
    ( create_serverless_cache_snapshot_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotAlreadyExistsFault of serverless_cache_snapshot_already_exists_fault
      | `ServerlessCacheSnapshotQuotaExceededFault of serverless_cache_snapshot_quota_exceeded_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_serverless_cache_snapshot_request ->
    ( create_serverless_cache_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotAlreadyExistsFault of serverless_cache_snapshot_already_exists_fault
      | `ServerlessCacheSnapshotQuotaExceededFault of serverless_cache_snapshot_quota_exceeded_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API creates a copy of an entire ServerlessCache at a specific moment in time. Available \
   for Valkey, Redis OSS and Serverless Memcached only.\n"]

module CreateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
    | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
    | `SnapshotFeatureNotSupportedFault of snapshot_feature_not_supported_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_message ->
    ( create_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotFeatureNotSupportedFault of snapshot_feature_not_supported_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_message ->
    ( create_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotFeatureNotSupportedFault of snapshot_feature_not_supported_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a copy of an entire cluster or replication group at a specific moment in time.\n\n\
  \  This operation is valid for Valkey or Redis OSS only.\n\
  \  \n\
  \   "]

module CreateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DuplicateUserNameFault of duplicate_user_name_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
    | `UserAlreadyExistsFault of user_already_exists_fault
    | `UserQuotaExceededFault of user_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_message ->
    ( user,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserAlreadyExistsFault of user_already_exists_fault
      | `UserQuotaExceededFault of user_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_message ->
    ( user Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserAlreadyExistsFault of user_already_exists_fault
      | `UserQuotaExceededFault of user_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For Valkey engine version 7.2 onwards and Redis OSS 6.0 to 7.1: Creates a user. For more \
   information, see \
   {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Clusters.RBAC.html}Using Role Based \
   Access Control (RBAC)}.\n"]

module CreateUserGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DefaultUserRequired of default_user_required
    | `DuplicateUserNameFault of duplicate_user_name_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
    | `UserGroupAlreadyExistsFault of user_group_already_exists_fault
    | `UserGroupQuotaExceededFault of user_group_quota_exceeded_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_group_message ->
    ( user_group,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DefaultUserRequired of default_user_required
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserGroupAlreadyExistsFault of user_group_already_exists_fault
      | `UserGroupQuotaExceededFault of user_group_quota_exceeded_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_group_message ->
    ( user_group Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DefaultUserRequired of default_user_required
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserGroupAlreadyExistsFault of user_group_already_exists_fault
      | `UserGroupQuotaExceededFault of user_group_quota_exceeded_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For Valkey engine version 7.2 onwards and Redis OSS 6.0 to 7.1: Creates a user group. For more \
   information, see \
   {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Clusters.RBAC.html}Using Role Based \
   Access Control (RBAC)} \n"]

module DecreaseNodeGroupsInGlobalReplicationGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
    | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    decrease_node_groups_in_global_replication_group_message ->
    ( decrease_node_groups_in_global_replication_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    decrease_node_groups_in_global_replication_group_message ->
    ( decrease_node_groups_in_global_replication_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Decreases the number of node groups in a Global datastore\n"]

module DecreaseReplicaCount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
    | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
    | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NodeGroupsPerReplicationGroupQuotaExceededFault of
      node_groups_per_replication_group_quota_exceeded_fault
    | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
    | `NoOperationFault of no_operation_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    decrease_replica_count_message ->
    ( decrease_replica_count_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeGroupsPerReplicationGroupQuotaExceededFault of
        node_groups_per_replication_group_quota_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `NoOperationFault of no_operation_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    decrease_replica_count_message ->
    ( decrease_replica_count_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeGroupsPerReplicationGroupQuotaExceededFault of
        node_groups_per_replication_group_quota_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `NoOperationFault of no_operation_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Dynamically decreases the number of replicas in a Valkey or Redis OSS (cluster mode disabled) \
   replication group or the number of replica nodes in one or more node groups (shards) of a \
   Valkey or Redis OSS (cluster mode enabled) replication group. This operation is performed with \
   no cluster down time.\n"]

module DeleteCacheCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
    | `SnapshotFeatureNotSupportedFault of snapshot_feature_not_supported_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cache_cluster_message ->
    ( delete_cache_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotFeatureNotSupportedFault of snapshot_feature_not_supported_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cache_cluster_message ->
    ( delete_cache_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotFeatureNotSupportedFault of snapshot_feature_not_supported_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a previously provisioned cluster. [DeleteCacheCluster] deletes all associated cache \
   nodes, node endpoints and the cluster itself. When you receive a successful response from this \
   operation, Amazon ElastiCache immediately begins deleting the cluster; you cannot cancel or \
   revert this operation.\n\n\
  \ This operation is not valid for:\n\
  \ \n\
  \  {ul\n\
  \        {-  Valkey or Redis OSS (cluster mode enabled) clusters\n\
  \            \n\
  \             }\n\
  \        {-  Valkey or Redis OSS (cluster mode disabled) clusters\n\
  \            \n\
  \             }\n\
  \        {-  A cluster that is the last read replica of a replication group\n\
  \            \n\
  \             }\n\
  \        {-  A cluster that is the primary node of a replication group\n\
  \            \n\
  \             }\n\
  \        {-  A node group (shard) that has Multi-AZ mode enabled\n\
  \            \n\
  \             }\n\
  \        {-  A cluster from a Valkey or Redis OSS (cluster mode enabled) replication group\n\
  \            \n\
  \             }\n\
  \        {-  A cluster that is not in the [available] state\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DeleteCacheParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cache_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cache_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified cache parameter group. You cannot delete a cache parameter group if it is \
   associated with any cache clusters. You cannot delete the default cache parameter groups in \
   your account.\n"]

module DeleteCacheSecurityGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
    | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cache_security_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cache_security_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a cache security group.\n\n\
  \  You cannot delete a cache security group if it is associated with any clusters.\n\
  \  \n\
  \   "]

module DeleteCacheSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheSubnetGroupInUse of cache_subnet_group_in_use
    | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cache_subnet_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSubnetGroupInUse of cache_subnet_group_in_use
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cache_subnet_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSubnetGroupInUse of cache_subnet_group_in_use
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a cache subnet group.\n\n\
  \  You cannot delete a default cache subnet group or one that is associated with any clusters.\n\
  \  \n\
  \   "]

module DeleteGlobalReplicationGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
    | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_global_replication_group_message ->
    ( delete_global_replication_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_global_replication_group_message ->
    ( delete_global_replication_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deleting a Global datastore is a two-step process: \n\n\
  \ {ul\n\
  \       {-  First, you must [DisassociateGlobalReplicationGroup] to remove the secondary \
   clusters in the Global datastore.\n\
  \           \n\
  \            }\n\
  \       {-  Once the Global datastore contains only the primary cluster, you can use the \
   [DeleteGlobalReplicationGroup] API to delete the Global datastore while retainining the primary \
   cluster using [RetainPrimaryReplicationGroup=true].\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Since the Global Datastore has only a primary cluster, you can delete the Global Datastore \
   while retaining the primary by setting [RetainPrimaryReplicationGroup=true]. The primary \
   cluster is never deleted when deleting a Global Datastore. It can only be deleted when it no \
   longer is associated with any Global Datastore.\n\
  \   \n\
  \    When you receive a successful response from this operation, Amazon ElastiCache immediately \
   begins deleting the selected resources; you cannot cancel or revert this operation.\n\
  \    "]

module DeleteReplicationGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
    | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
    | `SnapshotFeatureNotSupportedFault of snapshot_feature_not_supported_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_group_message ->
    ( delete_replication_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotFeatureNotSupportedFault of snapshot_feature_not_supported_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_replication_group_message ->
    ( delete_replication_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotFeatureNotSupportedFault of snapshot_feature_not_supported_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing replication group. By default, this operation deletes the entire \
   replication group, including the primary/primaries and all of the read replicas. If the \
   replication group has only one primary, you can optionally delete only the read replicas, while \
   retaining the primary by setting [RetainPrimaryCluster=true].\n\n\
  \ When you receive a successful response from this operation, Amazon ElastiCache immediately \
   begins deleting the selected resources; you cannot cancel or revert this operation.\n\
  \ \n\
  \   {ul\n\
  \         {-   [CreateSnapshot] permission is required to create a final snapshot. Without this \
   permission, the API call will fail with an [Access Denied] exception.\n\
  \             \n\
  \              }\n\
  \         {-  This operation is valid for Redis OSS only.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module DeleteServerlessCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidCredentialsException of invalid_credentials_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
    | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
    | `ServerlessCacheSnapshotAlreadyExistsFault of serverless_cache_snapshot_already_exists_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_serverless_cache_request ->
    ( delete_serverless_cache_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotAlreadyExistsFault of serverless_cache_snapshot_already_exists_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_serverless_cache_request ->
    ( delete_serverless_cache_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotAlreadyExistsFault of serverless_cache_snapshot_already_exists_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified existing serverless cache.\n\n\
  \   [CreateServerlessCacheSnapshot] permission is required to create a final snapshot. Without \
   this permission, the API call will fail with an [Access Denied] exception.\n\
  \  \n\
  \   "]

module DeleteServerlessCacheSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
    | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_serverless_cache_snapshot_request ->
    ( delete_serverless_cache_snapshot_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_serverless_cache_snapshot_request ->
    ( delete_serverless_cache_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing serverless cache snapshot. Available for Valkey, Redis OSS and Serverless \
   Memcached only.\n"]

module DeleteSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
    | `SnapshotNotFoundFault of snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_message ->
    ( delete_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_message ->
    ( delete_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing snapshot. When you receive a successful response from this operation, \
   ElastiCache immediately begins deleting the snapshot; you cannot cancel or revert this \
   operation.\n\n\
  \  This operation is valid for Valkey or Redis OSS only.\n\
  \  \n\
  \   "]

module DeleteUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DefaultUserAssociatedToUserGroupFault of default_user_associated_to_user_group_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidUserStateFault of invalid_user_state_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_message ->
    ( user,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DefaultUserAssociatedToUserGroupFault of default_user_associated_to_user_group_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserStateFault of invalid_user_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_message ->
    ( user Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DefaultUserAssociatedToUserGroupFault of default_user_associated_to_user_group_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserStateFault of invalid_user_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For Valkey engine version 7.2 onwards and Redis OSS 6.0 onwards: Deletes a user. The user will \
   be removed from all user groups and in turn removed from all replication groups. For more \
   information, see \
   {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Clusters.RBAC.html}Using Role Based \
   Access Control (RBAC)}. \n"]

module DeleteUserGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidUserGroupStateFault of invalid_user_group_state_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `UserGroupNotFoundFault of user_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_group_message ->
    ( user_group,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_group_message ->
    ( user_group Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For Valkey engine version 7.2 onwards and Redis OSS 6.0 onwards: Deletes a user group. The user \
   group must first be disassociated from the replication group before it can be deleted. For more \
   information, see \
   {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Clusters.RBAC.html}Using Role Based \
   Access Control (RBAC)}. \n"]

module DescribeCacheClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_clusters_message ->
    ( cache_cluster_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_clusters_message ->
    ( cache_cluster_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about all provisioned clusters if no cluster identifier is specified, or \
   about a specific cache cluster if a cluster identifier is supplied.\n\n\
  \ By default, abbreviated information about the clusters is returned. You can use the optional \
   {i ShowCacheNodeInfo} flag to retrieve detailed information about the cache nodes associated \
   with the clusters. These details include the DNS address and port for the cache node endpoint.\n\
  \ \n\
  \  If the cluster is in the {i creating} state, only cluster-level information is displayed \
   until all of the nodes are successfully provisioned.\n\
  \  \n\
  \   If the cluster is in the {i deleting} state, only cluster-level information is displayed.\n\
  \   \n\
  \    If cache nodes are currently being added to the cluster, node endpoint information and \
   creation time for the additional nodes are not displayed until they are completely provisioned. \
   When the cluster state is {i available}, the cluster is ready for use.\n\
  \    \n\
  \     If cache nodes are currently being removed from the cluster, no endpoint information for \
   the removed nodes is displayed.\n\
  \     "]

module DescribeCacheEngineVersions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_engine_versions_message ->
    (cache_engine_version_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_engine_versions_message ->
    ( cache_engine_version_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of the available cache engines and their versions.\n"]

module DescribeCacheParameterGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_parameter_groups_message ->
    ( cache_parameter_groups_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_parameter_groups_message ->
    ( cache_parameter_groups_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of cache parameter group descriptions. If a cache parameter group name is \
   specified, the list contains only the descriptions for that group.\n"]

module DescribeCacheParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_parameters_message ->
    ( cache_parameter_group_details,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_parameters_message ->
    ( cache_parameter_group_details Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the detailed parameter list for a particular cache parameter group.\n"]

module DescribeCacheSecurityGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_security_groups_message ->
    ( cache_security_group_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_security_groups_message ->
    ( cache_security_group_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of cache security group descriptions. If a cache security group name is \
   specified, the list contains only the description of that group. This applicable only when you \
   have ElastiCache in Classic setup \n"]

module DescribeCacheSubnetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_subnet_groups_message ->
    ( cache_subnet_group_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cache_subnet_groups_message ->
    ( cache_subnet_group_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of cache subnet group descriptions. If a subnet group name is specified, the \
   list contains only the description of that group. This is applicable only when you have \
   ElastiCache in VPC setup. All ElastiCache clusters now launch in VPC by default. \n"]

module DescribeEngineDefaultParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_default_parameters_message ->
    ( describe_engine_default_parameters_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_default_parameters_message ->
    ( describe_engine_default_parameters_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the default engine and system parameter information for the specified cache engine.\n"]

module DescribeEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_events_message ->
    ( events_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_events_message ->
    ( events_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns events related to clusters, cache security groups, and cache parameter groups. You can \
   obtain events specific to a particular cluster, cache security group, or cache parameter group \
   by providing the name as a parameter.\n\n\
  \ By default, only the events occurring within the last hour are returned; however, you can \
   retrieve up to 14 days' worth of events if necessary.\n\
  \ "]

module DescribeGlobalReplicationGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_global_replication_groups_message ->
    ( describe_global_replication_groups_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_global_replication_groups_message ->
    ( describe_global_replication_groups_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a particular global replication group. If no identifier is specified, \
   returns information about all Global datastores. \n"]

module DescribeReplicationGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_groups_message ->
    ( replication_group_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replication_groups_message ->
    ( replication_group_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a particular replication group. If no identifier is specified, \
   [DescribeReplicationGroups] returns information about all replication groups.\n\n\
  \  This operation is valid for Valkey or Redis OSS only.\n\
  \  \n\
  \   "]

module DescribeReservedCacheNodes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_cache_nodes_message ->
    ( reserved_cache_node_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_cache_nodes_message ->
    ( reserved_cache_node_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about reserved cache nodes for this account, or about a specified reserved \
   cache node.\n"]

module DescribeReservedCacheNodesOfferings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ReservedCacheNodesOfferingNotFoundFault of reserved_cache_nodes_offering_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_cache_nodes_offerings_message ->
    ( reserved_cache_nodes_offering_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedCacheNodesOfferingNotFoundFault of reserved_cache_nodes_offering_not_found_fault
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_cache_nodes_offerings_message ->
    ( reserved_cache_nodes_offering_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedCacheNodesOfferingNotFoundFault of reserved_cache_nodes_offering_not_found_fault
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists available reserved cache node offerings.\n"]

module DescribeServerlessCaches : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_serverless_caches_request ->
    ( describe_serverless_caches_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_serverless_caches_request ->
    ( describe_serverless_caches_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a specific serverless cache. If no identifier is specified, then the \
   API returns information on all the serverless caches belonging to this Amazon Web Services \
   account.\n"]

module DescribeServerlessCacheSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
    | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_serverless_cache_snapshots_request ->
    ( describe_serverless_cache_snapshots_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_serverless_cache_snapshots_request ->
    ( describe_serverless_cache_snapshots_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about serverless cache snapshots. By default, this API lists all of the \
   customer\226\128\153s serverless cache snapshots. It can also describe a single serverless \
   cache snapshot, or the snapshots associated with a particular serverless cache. Available for \
   Valkey, Redis OSS and Serverless Memcached only.\n"]

module DescribeServiceUpdates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceUpdateNotFoundFault of service_update_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_service_updates_message ->
    ( service_updates_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceUpdateNotFoundFault of service_update_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_service_updates_message ->
    ( service_updates_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceUpdateNotFoundFault of service_update_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns details of the service updates\n"]

module DescribeSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `SnapshotNotFoundFault of snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_message ->
    ( describe_snapshots_list_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `SnapshotNotFoundFault of snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_message ->
    ( describe_snapshots_list_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `SnapshotNotFoundFault of snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about cluster or replication group snapshots. By default, \
   [DescribeSnapshots] lists all of your snapshots; it can optionally describe a single snapshot, \
   or just the snapshots associated with a particular cache cluster.\n\n\
  \  This operation is valid for Valkey or Redis OSS only.\n\
  \  \n\
  \   "]

module DescribeUpdateActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_update_actions_message ->
    ( update_actions_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_update_actions_message ->
    ( update_actions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns details of the update actions \n"]

module DescribeUserGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `UserGroupNotFoundFault of user_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_user_groups_message ->
    ( describe_user_groups_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_user_groups_message ->
    ( describe_user_groups_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of user groups.\n"]

module DescribeUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_users_message ->
    ( describe_users_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_users_message ->
    ( describe_users_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of users.\n"]

module DisassociateGlobalReplicationGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
    | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_global_replication_group_message ->
    ( disassociate_global_replication_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_global_replication_group_message ->
    ( disassociate_global_replication_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Remove a secondary cluster from the Global datastore using the Global datastore name. The \
   secondary cluster will no longer receive updates from the primary cluster, but will remain as a \
   standalone cluster in that Amazon region.\n"]

module ExportServerlessCacheSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
    | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_serverless_cache_snapshot_request ->
    ( export_serverless_cache_snapshot_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_serverless_cache_snapshot_request ->
    ( export_serverless_cache_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides the functionality to export the serverless cache snapshot data to Amazon S3. Available \
   for Valkey and Redis OSS only.\n"]

module FailoverGlobalReplicationGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
    | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    failover_global_replication_group_message ->
    ( failover_global_replication_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    failover_global_replication_group_message ->
    ( failover_global_replication_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Used to failover the primary region to a secondary region. The secondary region will become \
   primary, and all other clusters will become secondary.\n"]

module IncreaseNodeGroupsInGlobalReplicationGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
    | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    increase_node_groups_in_global_replication_group_message ->
    ( increase_node_groups_in_global_replication_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    increase_node_groups_in_global_replication_group_message ->
    ( increase_node_groups_in_global_replication_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Increase the number of node groups in the Global datastore\n"]

module IncreaseReplicaCount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
    | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
    | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
    | `InvalidKMSKeyFault of invalid_kms_key_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NodeGroupsPerReplicationGroupQuotaExceededFault of
      node_groups_per_replication_group_quota_exceeded_fault
    | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
    | `NoOperationFault of no_operation_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    increase_replica_count_message ->
    ( increase_replica_count_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeGroupsPerReplicationGroupQuotaExceededFault of
        node_groups_per_replication_group_quota_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `NoOperationFault of no_operation_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    increase_replica_count_message ->
    ( increase_replica_count_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeGroupsPerReplicationGroupQuotaExceededFault of
        node_groups_per_replication_group_quota_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `NoOperationFault of no_operation_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Dynamically increases the number of replicas in a Valkey or Redis OSS (cluster mode disabled) \
   replication group or the number of replica nodes in one or more node groups (shards) of a \
   Valkey or Redis OSS (cluster mode enabled) replication group. This operation is performed with \
   no cluster down time.\n"]

module ListAllowedNodeTypeModifications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_allowed_node_type_modifications_message ->
    ( allowed_node_type_modifications_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_allowed_node_type_modifications_message ->
    ( allowed_node_type_modifications_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all available node types that you can scale with your cluster's replication group's \
   current node type.\n\n\
  \ When you use the [ModifyCacheCluster] or [ModifyReplicationGroup] operations to scale your \
   cluster or replication group, the value of the [CacheNodeType] parameter must be one of the \
   node types returned by this operation.\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
    | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
    | `InvalidARNFault of invalid_arn_fault
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
    | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
    | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault
    | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
    | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
    | `SnapshotNotFoundFault of snapshot_not_found_fault
    | `UserGroupNotFoundFault of user_group_not_found_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( tag_list_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( tag_list_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all tags currently on a named resource.\n\n\
  \  A tag is a key-value pair where the key and value are case-sensitive. You can use tags to \
   categorize and track all your ElastiCache resources, with the exception of global replication \
   group. When you add or remove tags on replication groups, those actions will be replicated to \
   all nodes in the replication group. For more information, see \
   {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/IAM.ResourceLevelPermissions.html}Resource-level \
   permissions}.\n\
  \ \n\
  \  If the cluster is not in the {i available} state, [ListTagsForResource] returns an error.\n\
  \  "]

module ModifyCacheCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
    | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
    | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
    | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
    | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cache_cluster_message ->
    ( modify_cache_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cache_cluster_message ->
    ( modify_cache_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the settings for a cluster. You can use this operation to change one or more cluster \
   configuration parameters by specifying the parameters and the new values.\n"]

module ModifyCacheParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
    | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cache_parameter_group_message ->
    ( cache_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cache_parameter_group_message ->
    ( cache_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters of a cache parameter group. You can modify up to 20 parameters in a \
   single request by submitting a list parameter name and value pairs.\n"]

module ModifyCacheSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
    | `CacheSubnetQuotaExceededFault of cache_subnet_quota_exceeded_fault
    | `InvalidSubnet of invalid_subnet
    | `SubnetInUse of subnet_in_use
    | `SubnetNotAllowedFault of subnet_not_allowed_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cache_subnet_group_message ->
    ( modify_cache_subnet_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `CacheSubnetQuotaExceededFault of cache_subnet_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet
      | `SubnetInUse of subnet_in_use
      | `SubnetNotAllowedFault of subnet_not_allowed_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cache_subnet_group_message ->
    ( modify_cache_subnet_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `CacheSubnetQuotaExceededFault of cache_subnet_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet
      | `SubnetInUse of subnet_in_use
      | `SubnetNotAllowedFault of subnet_not_allowed_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies an existing cache subnet group.\n"]

module ModifyGlobalReplicationGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
    | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_global_replication_group_message ->
    ( modify_global_replication_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_global_replication_group_message ->
    ( modify_global_replication_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the settings for a Global datastore.\n"]

module ModifyReplicationGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
    | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
    | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
    | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
    | `InvalidKMSKeyFault of invalid_kms_key_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `InvalidUserGroupStateFault of invalid_user_group_state_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
    | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
    | `UserGroupNotFoundFault of user_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_group_message ->
    ( modify_replication_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_group_message ->
    ( modify_replication_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the settings for a replication group. This is limited to Valkey and Redis OSS 7 and \
   above.\n\n\
  \ {ul\n\
  \       {-   \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/scaling-redis-cluster-mode-enabled.html}Scaling \
   for Valkey or Redis OSS (cluster mode enabled)} in the ElastiCache User Guide\n\
  \           \n\
  \            }\n\
  \       {-   \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyReplicationGroupShardConfiguration.html}ModifyReplicationGroupShardConfiguration} \
   in the ElastiCache API Reference\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    This operation is valid for Valkey or Redis OSS only.\n\
  \    \n\
  \     "]

module ModifyReplicationGroupShardConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
    | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
    | `InvalidKMSKeyFault of invalid_kms_key_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NodeGroupsPerReplicationGroupQuotaExceededFault of
      node_groups_per_replication_group_quota_exceeded_fault
    | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_group_shard_configuration_message ->
    ( modify_replication_group_shard_configuration_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeGroupsPerReplicationGroupQuotaExceededFault of
        node_groups_per_replication_group_quota_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_replication_group_shard_configuration_message ->
    ( modify_replication_group_shard_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientCacheClusterCapacityFault of insufficient_cache_cluster_capacity_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeGroupsPerReplicationGroupQuotaExceededFault of
        node_groups_per_replication_group_quota_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies a replication group's shards (node groups) by allowing you to add shards, remove \
   shards, or rebalance the keyspaces among existing shards.\n"]

module ModifyServerlessCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidCredentialsException of invalid_credentials_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
    | `InvalidUserGroupStateFault of invalid_user_group_state_fault
    | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `UserGroupNotFoundFault of user_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_serverless_cache_request ->
    ( modify_serverless_cache_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_serverless_cache_request ->
    ( modify_serverless_cache_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "This API modifies the attributes of a serverless cache.\n"]

module ModifyUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidUserStateFault of invalid_user_state_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_user_message ->
    ( user,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserStateFault of invalid_user_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_user_message ->
    ( user Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserStateFault of invalid_user_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Changes user password(s) and/or access string.\n"]

module ModifyUserGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DefaultUserRequired of default_user_required
    | `DuplicateUserNameFault of duplicate_user_name_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidUserGroupStateFault of invalid_user_group_state_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `UserGroupNotFoundFault of user_group_not_found_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_user_group_message ->
    ( user_group,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DefaultUserRequired of default_user_required
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_user_group_message ->
    ( user_group Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DefaultUserRequired of default_user_required
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserGroupStateFault of invalid_user_group_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Changes the list of users that belong to the user group.\n"]

module PurchaseReservedCacheNodesOffering : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ReservedCacheNodeAlreadyExistsFault of reserved_cache_node_already_exists_fault
    | `ReservedCacheNodeQuotaExceededFault of reserved_cache_node_quota_exceeded_fault
    | `ReservedCacheNodesOfferingNotFoundFault of reserved_cache_nodes_offering_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    purchase_reserved_cache_nodes_offering_message ->
    ( purchase_reserved_cache_nodes_offering_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedCacheNodeAlreadyExistsFault of reserved_cache_node_already_exists_fault
      | `ReservedCacheNodeQuotaExceededFault of reserved_cache_node_quota_exceeded_fault
      | `ReservedCacheNodesOfferingNotFoundFault of reserved_cache_nodes_offering_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    purchase_reserved_cache_nodes_offering_message ->
    ( purchase_reserved_cache_nodes_offering_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedCacheNodeAlreadyExistsFault of reserved_cache_node_already_exists_fault
      | `ReservedCacheNodeQuotaExceededFault of reserved_cache_node_quota_exceeded_fault
      | `ReservedCacheNodesOfferingNotFoundFault of reserved_cache_nodes_offering_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows you to purchase a reserved cache node offering. Reserved nodes are not eligible for \
   cancellation and are non-refundable. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/reserved-nodes.html}Managing Costs \
   with Reserved Nodes}.\n"]

module RebalanceSlotsInGlobalReplicationGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
    | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rebalance_slots_in_global_replication_group_message ->
    ( rebalance_slots_in_global_replication_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rebalance_slots_in_global_replication_group_message ->
    ( rebalance_slots_in_global_replication_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalReplicationGroupNotFoundFault of global_replication_group_not_found_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Redistribute slots to ensure uniform distribution across existing shards in the cluster.\n"]

module RebootCacheCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_cache_cluster_message ->
    ( reboot_cache_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_cache_cluster_message ->
    ( reboot_cache_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reboots some, or all, of the cache nodes within a provisioned cluster. This operation applies \
   any modified cache parameter groups to the cluster. The reboot operation takes place as soon as \
   possible, and results in a momentary outage to the cluster. During the reboot, the cluster \
   status is set to REBOOTING.\n\n\
  \ The reboot causes the contents of the cache (for each cache node being rebooted) to be lost.\n\
  \ \n\
  \  When the reboot is complete, a cluster event is created.\n\
  \  \n\
  \   Rebooting a cluster is currently supported on Memcached, Valkey and Redis OSS (cluster mode \
   disabled) clusters. Rebooting is not supported on Valkey or Redis OSS (cluster mode enabled) \
   clusters.\n\
  \   \n\
  \    If you make changes to parameters that require a Valkey or Redis OSS (cluster mode enabled) \
   cluster reboot for the changes to be applied, see \
   {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/nodes.rebooting.html}Rebooting a \
   Cluster} for an alternate process.\n\
  \    "]

module RemoveTagsFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
    | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
    | `InvalidARNFault of invalid_arn_fault
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
    | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
    | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault
    | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
    | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
    | `SnapshotNotFoundFault of snapshot_not_found_fault
    | `TagNotFoundFault of tag_not_found_fault
    | `UserGroupNotFoundFault of user_group_not_found_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_message ->
    ( tag_list_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `TagNotFoundFault of tag_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_message ->
    ( tag_list_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `TagNotFoundFault of tag_not_found_fault
      | `UserGroupNotFoundFault of user_group_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the tags identified by the [TagKeys] list from the named resource. A tag is a key-value \
   pair where the key and value are case-sensitive. You can use tags to categorize and track all \
   your ElastiCache resources, with the exception of global replication group. When you add or \
   remove tags on replication groups, those actions will be replicated to all nodes in the \
   replication group. For more information, see \
   {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/IAM.ResourceLevelPermissions.html}Resource-level \
   permissions}.\n"]

module ResetCacheParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
    | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_cache_parameter_group_message ->
    ( cache_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_cache_parameter_group_message ->
    ( cache_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `InvalidCacheParameterGroupStateFault of invalid_cache_parameter_group_state_fault
      | `InvalidGlobalReplicationGroupStateFault of invalid_global_replication_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters of a cache parameter group to the engine or system default value. You \
   can reset specific parameters by submitting a list of parameter names. To reset the entire \
   cache parameter group, specify the [ResetAllParameters] and [CacheParameterGroupName] \
   parameters.\n"]

module RevokeCacheSecurityGroupIngress : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
    | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_cache_security_group_ingress_message ->
    ( revoke_cache_security_group_ingress_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    revoke_cache_security_group_ingress_message ->
    ( revoke_cache_security_group_ingress_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `InvalidCacheSecurityGroupStateFault of invalid_cache_security_group_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Revokes ingress from a cache security group. Use this operation to disallow access from an \
   Amazon EC2 security group that had been previously authorized.\n"]

module StartMigration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `ReplicationGroupAlreadyUnderMigrationFault of replication_group_already_under_migration_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_migration_message ->
    ( start_migration_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupAlreadyUnderMigrationFault of
        replication_group_already_under_migration_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_migration_message ->
    ( start_migration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupAlreadyUnderMigrationFault of
        replication_group_already_under_migration_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Start the migration of data.\n"]

module TestFailover : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `APICallRateForCustomerExceededFault of api_call_rate_for_customer_exceeded_fault
    | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
    | `InvalidKMSKeyFault of invalid_kms_key_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `NodeGroupNotFoundFault of node_group_not_found_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
    | `TestFailoverNotAvailableFault of test_failover_not_available_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_failover_message ->
    ( test_failover_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `APICallRateForCustomerExceededFault of api_call_rate_for_customer_exceeded_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `NodeGroupNotFoundFault of node_group_not_found_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `TestFailoverNotAvailableFault of test_failover_not_available_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_failover_message ->
    ( test_failover_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `APICallRateForCustomerExceededFault of api_call_rate_for_customer_exceeded_fault
      | `InvalidCacheClusterStateFault of invalid_cache_cluster_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `NodeGroupNotFoundFault of node_group_not_found_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `TestFailoverNotAvailableFault of test_failover_not_available_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Represents the input of a [TestFailover] operation which tests automatic failover on a \
   specified node group (called shard in the console) in a replication group (called cluster in \
   the console).\n\n\
  \ This API is designed for testing the behavior of your application in case of ElastiCache \
   failover. It is not designed to be an operational tool for initiating a failover to overcome a \
   problem you may have with the cluster. Moreover, in certain conditions such as large-scale \
   operational events, Amazon may block this API. \n\
  \ \n\
  \   {b Note the following} \n\
  \  \n\
  \   {ul\n\
  \         {-  A customer can use this operation to test automatic failover on up to 15 shards \
   (called node groups in the ElastiCache API and Amazon CLI) in any rolling 24-hour period.\n\
  \             \n\
  \              }\n\
  \         {-  If calling this operation on shards in different clusters (called replication \
   groups in the API and CLI), the calls can be made concurrently.\n\
  \             \n\
  \               \n\
  \              \n\
  \               }\n\
  \         {-  If calling this operation multiple times on different shards in the same Valkey or \
   Redis OSS (cluster mode enabled) replication group, the first node replacement must complete \
   before a subsequent call can be made.\n\
  \             \n\
  \              }\n\
  \         {-  To determine whether the node replacement is complete you can check Events using \
   the Amazon ElastiCache console, the Amazon CLI, or the ElastiCache API. Look for the following \
   automatic failover related events, listed here in order of occurrance:\n\
  \             \n\
  \              {ol\n\
  \                    {-  Replication group message: \n\
  \                        {[\n\
  \                        Test Failover API called for node group \n\
  \                        ]}\n\
  \                         \n\
  \                        \n\
  \                         }\n\
  \                    {-  Cache cluster message: \n\
  \                        {[\n\
  \                        Failover from primary node  to replica node  completed\n\
  \                        ]}\n\
  \                         \n\
  \                        \n\
  \                         }\n\
  \                    {-  Replication group message: \n\
  \                        {[\n\
  \                        Failover from primary node  to replica node  completed\n\
  \                        ]}\n\
  \                         \n\
  \                        \n\
  \                         }\n\
  \                    {-  Cache cluster message: \n\
  \                        {[\n\
  \                        Recovering cache nodes \n\
  \                        ]}\n\
  \                         \n\
  \                        \n\
  \                         }\n\
  \                    {-  Cache cluster message: \n\
  \                        {[\n\
  \                        Finished recovery for cache nodes \n\
  \                        ]}\n\
  \                         \n\
  \                        \n\
  \                         }\n\
  \                    \n\
  \          }\n\
  \           For more information see:\n\
  \           \n\
  \            {ul\n\
  \                  {-   \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/ECEvents.Viewing.html}Viewing \
   ElastiCache Events} in the {i ElastiCache User Guide} \n\
  \                      \n\
  \                       }\n\
  \                  {-   \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_DescribeEvents.html}DescribeEvents} \
   in the ElastiCache API Reference\n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \          }\n\
  \           }\n\
  \         }\n\
  \   Also see, \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/AutoFailover.html#auto-failover-test}Testing \
   Multi-AZ } in the {i ElastiCache User Guide}.\n\
  \   "]

module TestMigration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `ReplicationGroupAlreadyUnderMigrationFault of replication_group_already_under_migration_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_migration_message ->
    ( test_migration_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupAlreadyUnderMigrationFault of
        replication_group_already_under_migration_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_migration_message ->
    ( test_migration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `ReplicationGroupAlreadyUnderMigrationFault of
        replication_group_already_under_migration_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Async API to test connection between source and target replication group. \n"]

module AddTagsToResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
    | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
    | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
    | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
    | `InvalidARNFault of invalid_arn_fault
    | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
    | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
    | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
    | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
    | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault
    | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
    | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
    | `SnapshotNotFoundFault of snapshot_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
    | `UserGroupNotFoundFault of user_group_not_found_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_message ->
    ( tag_list_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserGroupNotFoundFault of user_group_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_message ->
    ( tag_list_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CacheClusterNotFoundFault of cache_cluster_not_found_fault
      | `CacheParameterGroupNotFoundFault of cache_parameter_group_not_found_fault
      | `CacheSecurityGroupNotFoundFault of cache_security_group_not_found_fault
      | `CacheSubnetGroupNotFoundFault of cache_subnet_group_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidReplicationGroupStateFault of invalid_replication_group_state_fault
      | `InvalidServerlessCacheSnapshotStateFault of invalid_serverless_cache_snapshot_state_fault
      | `InvalidServerlessCacheStateFault of invalid_serverless_cache_state_fault
      | `ReplicationGroupNotFoundFault of replication_group_not_found_fault
      | `ReservedCacheNodeNotFoundFault of reserved_cache_node_not_found_fault
      | `ServerlessCacheNotFoundFault of serverless_cache_not_found_fault
      | `ServerlessCacheSnapshotNotFoundFault of serverless_cache_snapshot_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserGroupNotFoundFault of user_group_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A tag is a key-value pair where the key and value are case-sensitive. You can use tags to \
   categorize and track all your ElastiCache resources, with the exception of global replication \
   group. When you add or remove tags on replication groups, those actions will be replicated to \
   all nodes in the replication group. For more information, see \
   {{:http://docs.aws.amazon.com/AmazonElastiCache/latest/dg/IAM.ResourceLevelPermissions.html}Resource-level \
   permissions}.\n\n\
  \  For example, you can use cost-allocation tags to your ElastiCache resources, Amazon generates \
   a cost allocation report as a comma-separated value (CSV) file with your usage and costs \
   aggregated by your tags. You can apply tags that represent business categories (such as cost \
   centers, application names, or owners) to organize your costs across multiple services.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Tagging.html}Using Cost Allocation \
   Tags in Amazon ElastiCache} in the {i ElastiCache User Guide}.\n\
  \  "]
